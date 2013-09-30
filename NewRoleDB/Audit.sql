CREATE TABLE [dbo].[Audit] (
    [GuidId]        UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy]   NVARCHAR (100)   NOT NULL,
    [CreatedDate] DATETIME         NOT NULL,
    PRIMARY KEY CLUSTERED ([GuidId] ASC)
);

