Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7B433022;
	Mon, 20 Jul 2026 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784562160; cv=fail; b=p1UN+JfibQgfjvUJ3BdeYQfEQHEhki26qidP9l+twIvBdINNKY5QJxKAQuwEcuoVHZnNIB6dTeBEP9U5fQxQHHuYDRUpS/ud9BCFg2PqfKshMEIiDdneLIhTZSK7h/qjbQfyv4hTe/0E91MeqVaEiJFDuVNcQxM9g8uexcDYKN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784562160; c=relaxed/simple;
	bh=gxAaL10O/9OazDy7Lt/TBQlwDraNyNbKXirDTqq9c8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OyYKJprh3wHIv6/SdN/e2ZwKfUcimUUnlF7ECefe9Gfh7E5SRRx1BbFHlnaUKlS712YwNRblsxm39Nm+67muDfLHkYrfUImdZqtLjxMTJV5nYF8QlNRik4c+B49UxP4qNDDi+g3Rm6+vcLIfOLuH6+6cTDCq3sMIAD5Kvd3ZOKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dBCUS6iE; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dBCUS6iE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxM4xrR2dnWjkc9bOE+gLNlzbXskG3271t7ofoG6cHybKm/lU1e25KN1KlD12+ynQzDH3HVkWu2lW+QecA3LVGUG9Q3V3nsaUhsPcAsML8jRN1xzo9mBPvun1sgyXxR7brvimRMeon7f7TVEDrU8s80dgKw7IJs6ETrljcuMP18CdOvObPCam3yIpJaZccQXOxi3HdvzuJ8fO8V2TFKg04K3KSf4805xNd8Drz8pFxlputUdk2SQ2oSTcQ1kk/AhoTksO0enTyHAZhzw/m65nbqgl0/2LQqAx7LjsEyE38lp+AVdGaGfvo68pw966kEAs2sl4/9hmqn+To8U6LWJcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1t76JaXt8wMUhLRnnlQgy19Jz7AVQgF2gYCnQnA23nQ=;
 b=OgOYCR8JpIid15pP4gO//eDoUyspYi0la4G+DdhsMs02PxCH3SUii/jY5qX8sau9vQPZpNEtc3OPC4hTZDV/gXIkwAzB42/rTZ2xSoUe3HdHs+71Vx06eXrmb2hQ8oucA+a4n7+E30RIsoZoh14Oj9KBKOs11on2K7yAHHLTGHWA12Xk55m6K+mU6/2mvuVfDq2hsI533jod+oAI+B7N41pvGvnRhP3Z7GaWojkvmeuJ01MGrN9Kws2kR/bsD1DWx0QvGNpfPSFC11/HFhnW7+y6JYCYKdggqH9MO06hgKEP0JS7WrvlA0NhKxmVlqATGTFBfK/Er6YVAb9MHqkQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t76JaXt8wMUhLRnnlQgy19Jz7AVQgF2gYCnQnA23nQ=;
 b=dBCUS6iECHj+tQpZrKl3rNrqRvcK37NVn+/hLQhC1UUEG7CeLOBXPeeM4QYfLsVUeR6dtWwIbklRYipUboL07WViEMYtozt5tOMV3m9AyEmVTdL/rkApIZmcqK5VjSrZr1ECQ7gUl39Ov3fiMS8i5bqNBG7be8KBF0rCd07HOzW+JE2y3Yx6CxrZmH7+UXgdO5BbSQOWbcQB2qkEwC8Aen/xljGV9IkBkXkre1Y0IAqgLpJxsiTVNtqc1RIA2rFL5MoyDQV3Ddy+SLyYZq0O8AwRrnm31dj0S+7PQImdrvkOAOiMgQlbIW4p6l0Ctyk/j7k4vf8z79AcNeTr0eA39w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10663.eurprd04.prod.outlook.com (2603:10a6:800:260::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:42:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:42:34 +0000
Date: Mon, 20 Jul 2026 11:42:26 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional
 core reset
Message-ID: <al5B4tQJQGXWnQCS@lizhi-Precision-Tower-5810>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
 <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PH7PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:33d::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10663:EE_
X-MS-Office365-Filtering-Correlation-Id: a6724d12-fff4-4dc8-297b-08dee6758496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|7416014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	U6LlHKvZ7rhBFRMZZ3PZae/QqvQvytfxphqQGBYiTxlxO4/nioUWIDeHEd9koJxbe+E/1vWUaRRiMRzI6FTAhIItSVOKZQatza704zGiPOSqqyxtgopek+GqIYeo8Z1FDRNrWFm+F6mEyq1cM2mZZwNV7STCq/1HqX/R+XdDmYMeuuIM/O6YgSrQF5TEotPmsfNEqGqz3T7i00YJhbWxC0IAK6Epi3h7yUJLIoxNFVjZJw+8/Yw0XVWiqBz/QoZZB5MXnZwQtNCaISyHqedmSYo8jMRm5c46+Obb0+3R7rhriA/IN0ZpjJxIILzR+kTkqjgnxhRCVxAGq0301Y9pohPUjDyQCWxr50TB9H1KVblnpbj238S/AoOyfb9opQmOO6F4Kb+jgKG4QRsdqkRd6ZL7sTzWrGU8k4e4w6oD8+9MYveyT0zTw3K/6WlBEy8iScnYeLFfyrpmzmcJoIiE8T84JaR/7kd54I0M6qKvq2xYODU1c4XToXGH1dMLfor86vl7X+SpeI6HeKAKvsykYXCJpZmfGN799GSobMzVWVj74uPRi8RpHVlRJKXzwzGxyClRDyrrEpiTjOX8lTqT4wzD9nmpfa7c1ewMrcC6TL6Tg00njgmi55JHTYs729jKLIZwHnev06lTI7tl5Em02vxO3wvAho8nDkwvPR4lSyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(7416014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SKMhg6HZB9KkACj3+yo5paKvD3zDa3gGlMXna0MQRDSj4jyQ7iQTRlYIZi4I?=
 =?us-ascii?Q?VuE4DdsnNvvZAUxEMn0nR4b34u/mlWaGIHShDgJQwPnqkH0UN0cMb+Gh1WWB?=
 =?us-ascii?Q?UXyt+4Sr5L9wU87bc4+RHHYemxlwEwrHl0kYqhZnYOO3zWUdi5jg0U2j0ngk?=
 =?us-ascii?Q?+tR6bn/kIvY2qCihozpF9A9DoYgIsr589LisufscKnhNcu/xcHZ/orhrOEVn?=
 =?us-ascii?Q?JZv5h0050Q6EvsKvrrUR0DXcM0UaG3imojvvC5jbW4rvX4oFpm61GSm9eIoH?=
 =?us-ascii?Q?VXuFn7RWir7gqmHxFlHKNjiI06KwHoQyCqyNxv1/KD4Jq/wCMxDyhVDlVvef?=
 =?us-ascii?Q?OvhsKieOPMprzvAti6ELJ93MnI4JFVR8SBHJzD+WlWMLg6oQfveOEV5vJUDw?=
 =?us-ascii?Q?+QENYpFD5yIRwStagMzRIrFaeWNET5OE0x0fA61PgqnuP5oxEbMXzdB0MxsI?=
 =?us-ascii?Q?g0uEhIsAeS+4g6y9sT3CmHGsygz+pFJ2FtU1/JPhLylYjVHU9JuT/vje2E6K?=
 =?us-ascii?Q?HEEFLh3ePeNEdCAkDST/08P+tg8470ncwrnsmLKLOkEqFWVRQ46kjpNGS+0Z?=
 =?us-ascii?Q?Sr6uR6thZhD2Fqe8b7cnWXRyxYDUx0Of7Qsus2koD0b5qE3QumtE8xLD9u94?=
 =?us-ascii?Q?1TTRJl85ASg4Z25f2UgKgrKgKWszL0hbJ0+xiYHLO87SsxKuJ2B87TQaV/8H?=
 =?us-ascii?Q?YL5mvDxVKm0mAAfrb+B+4JO14OT23Nm1ICyCGWlDU7Iw1kTVwKSY7cdKY2aX?=
 =?us-ascii?Q?i8ESbGHblafjRjFQeRBRaY+7y9FIDj55P7HJpmUW6hZgWKfoDbeXOIaCqSpC?=
 =?us-ascii?Q?i6/BujWi2SvzEVLDXFkOIawMVeV8V4xOj7cDmTR21Ff2exe4vrAcmAKJv5ed?=
 =?us-ascii?Q?o+XxiX+R9UYWz0XgjABiwXxRFDeYFfEUNiwzBTJ4F6zY7lgAkC7F+Et5URaD?=
 =?us-ascii?Q?GcgoGTwW4yF+amwwGd5i2ZI9KLub1VjfwOfl8dFLJow4Bpq/ex4lHV0e0OiC?=
 =?us-ascii?Q?zg6p0WKtf9yK0U1eR8EtursYYHhLAsXJvQnHnsXKPjE6f0eHwXvghKD4IUC/?=
 =?us-ascii?Q?f7PUBNtyNnfM2lJk4RzcjeVmVycIn0NVkr0xigqMFmxG5Ky4VPSbwUhgXHeO?=
 =?us-ascii?Q?GjnRqKg9AvAUxV1eBGm7Zir2zNvUcQDKylR6EsR1qTKTx06rAhXMgxUnMjFI?=
 =?us-ascii?Q?Y2pt284Z2TvjgDagPUxtPQyMbRoSGNK1dpqMjx0bWdnTATdlMxyc59lT16+X?=
 =?us-ascii?Q?Lfp9yinwcsGTn09ErXjh2rP/+RntcYcO+M9KkZz3JrYRakx/SkpWPySz4wcc?=
 =?us-ascii?Q?+BDAPk4pRnbB6rEaCGeRYfpCaPBohW6CkvsDS4jTz5/qGdd4sGYPZD0W+3wL?=
 =?us-ascii?Q?74ZS7RH7ygPanbQ5mP8pYGQtVdM1U1lB65pOsIaJzableBYhN1nxHEzwuifd?=
 =?us-ascii?Q?PZPiS+hlMxliBr7KtQW3KVzuJLiL/UaE+axJLxm/jVBI9OMhJ4mae1+aM5UW?=
 =?us-ascii?Q?ItnQuXNM0msYpTD+LtL3y4HhNk81Puo29a/1w/T8lXv2PfqK2X3ju0wHXryC?=
 =?us-ascii?Q?CM3hjdbbKutsWG0qNMmjcXJBxsi8yqtJs3jIB7Pq0rsGrxHI7AfZDnu4GEWD?=
 =?us-ascii?Q?SV1GYmOx9OtvzHMTsiZu1KqXc5DknoHFJtCZVeoBFK0PzHgp3WRoXGusrLub?=
 =?us-ascii?Q?HqXvESRFOoRThuzhO5jNhStILaNTuPIBUcaCMIODM4MvzQSQjEAGbKmbWsm1?=
 =?us-ascii?Q?djgnT+y5L5KEKMlpP7J1lBD+r2XYS6cUNL8vQXApW2cj3WUUy5zC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6724d12-fff4-4dc8-297b-08dee6758496
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:42:34.7382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+Mno0V07iWyHUhPlFHG6URYWW0WySdfd5O9Nr5vc0nyqIwY1QvQYwh07KUJLbUxJdczw1XqDkPXMKMiS1/I6MKCbNuARPwgz9hRUdipxVkIRiwcjePWSppJ7FlJaTrf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10663

On Mon, Jul 20, 2026 at 01:05:09PM +0530, Shubham Patil wrote:
> The DesignWare I3C master IP supports a core reset input, but the
> binding is missing the corresponding reset description.
>
> Document the optional reset property. Keep it optional because the
> reset line is integration-specific.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Updated commit description
> - Dropped reset-name from the binding
> ---
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f55..dc7ee38001d6 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -38,6 +38,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  resets:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
>
> --
> 2.34.1
>
