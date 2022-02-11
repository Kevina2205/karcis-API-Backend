FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["karcis-API.csproj", "."]
COPY ./NuGet.config .

RUN dotnet restore "./karcis-API.csproj" --configfile ./NuGet.config
COPY . .
WORKDIR "/src/."
RUN dotnet build "karcis-API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "karcis-API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "karcis-API.dll"]