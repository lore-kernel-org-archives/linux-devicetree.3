Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0F426699;
	Mon, 11 May 2026 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527643; cv=fail; b=bFjkqjQmvLjbY6AyajyaqfxjDPm69Pciy/FG6L1zgB/yOiZECl8OZLXoZFp7ub1+sJj+ySirOhDM5I3srNgxtZAdBxm1YZma0YJ7y5PXl92ufDYtXa/7njE7rBq5Gs459hXec1D0mge52+N0IhF1MzMD8J/d+DM43gVotDxgmz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527643; c=relaxed/simple;
	bh=YcjYv5hY2o44SuaUA3NO4bhuiIu7ghK7reuziTCgU58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d6op0ccdsYk2RnpgYW7+uAlsWVRbOC/9cstlT+8UmdHF/s76WbgrN4XIriFINd2nSCMn+ykBfseMtghReXaXzRmjNZQAbLtiVl34uDrLSg8RQj46K1zKjOQuVtxvsWh9dtVoK345VGIabmY90u7XBSlkXZthBqoeYJ5zcKYMe8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XP4plumX; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XP4plumX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0LhHYWWPDynvPw/tihd6a/5zGWHyJMLFeKfNEA9WDIBGoIdKVQzxHdXXGn58/gXSLlRDKzZi6dnemaYIrxH4WNm7y/AWM87Ie5JFMO/YTQh4MjEHZYTjpzUDh1IV6bj+p9VWA3Y6kzPKCjqpN7awgFqtX8nHnyde8mvrTpBbjy57R87MZnC4W6o8mOrLC5FhN7j+flFTpaHs1aXvMeZRHVhRPneY2CuKnBt2zbY3lYR9PBfBXcFg0LeFLw4eF8O0gCVH4w4RYUDxSnBBfo5QC4MTEP3h9LBdHmUU9xpXOlXYuN7Ekm3SpmR5JNv/SOiZ99jx5PElpxrQLQN//AzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uyX3+sf2qgGzQ3uVIdWLjX2nKAyjIPI3JxO9t5SaYQ=;
 b=oGgtgoQrJ27JT/pec9aEalyeWiZJFTDxFfRJjqPxejkdl7cNQlCoKWH7ajBVz55Yve6n/tR89F5H0Dt8KgWyg9jPR9BBFJ/GqR+GsMG1yryh5tOFG5jeyZ3QRgLOuCvCSrQVMVpKfihZ4skR4B+0hhjN3pNEHq83QPLmHvR2icNxlcaXOfxewyzmf7f7tMhxPhCV++De5jIZSoTU9ONtIvYufdju5GmBKQhRhhjfLjDhgYtmKtqSueq+Yu0NFVsAdUmUNSEOMEh3onD3buuljeWR4idMrJls+EeeYkhp3cfT+TWQIgMyTCvQ/GCE0NHL314TD/HrIDqvp9CHkZvAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uyX3+sf2qgGzQ3uVIdWLjX2nKAyjIPI3JxO9t5SaYQ=;
 b=XP4plumXkCiazAwZ29LQ4IaKtmsXwUxFPmeKVk3sPvrDqSnr5IVi03BPh47xznQY/9iiNzpGIuTyMgxwq/tLGUKI5NvZAkV0J5eZkzicPfTSBBEYJuC4p7TedbLeKukuO1WTb2eI4w8ZkX/3erlBRlOzsxFrq0TWdHeFhTJ/iBylSRee2d/WMfYNK1Q0fTUXRwsxyyOmvEDG0xZdZmcPLEiEiYQPte2wWDovTdMBusvI2YBtYlLiP+qaq76I7U1dyUVPqPodj0P1hnRhgKs6vIwa24TMx6xYivw62H2MUHnSgF+FvTIUvIZzsEFK1Fi4t2ljDQ8w+UYVY+i/xa4ymA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 19:27:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 19:27:18 +0000
Date: Mon, 11 May 2026 15:27:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: dw: Describe core reset
Message-ID: <agItkZnW5OG3D-L5@lizhi-Precision-Tower-5810>
References: <20260511031945.3228-1-jszhang@kernel.org>
 <20260511031945.3228-2-jszhang@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511031945.3228-2-jszhang@kernel.org>
X-ClientProxiedBy: SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e51b7b0-db23-4a5e-1f66-08deaf9350e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|18002099003|22082099003|38350700014|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	ZIBNZGZEAbpglluF9QQ/YMzRdzbE+eLkvZUbc7OmP5i4cyX+LI438csqCCeo0VvD67dfZbZo4K/O1ITc2GJr5TPFewavN+/zkNikuARs+l4vT93SHvw4FOMtjZyUp3wAEeMzOAuaJwtxFXa4EKf++bgtGo3ibigp6saJ1uVfqJ1XKAwoH4y0WIT1yvLK3UkOZS+k4QTSLn8w7iF6CPjxvpEHV60wgc3oxMVKHrJGYSYQD/4eIDzffhtseD7zz0ELbG+6bdDSmZEnJgVQ9KcUgkFvqWwblE0QxPq/r6LDtZW6Y9J0V/7n5jRv3/3SGop4AyZxIsyjix/eONxK7Vt+uHG9PErfuzCRx3lEhpInzdSbNJ7JcoqqTsPyqnbD2oJuN7aV00UYEBlH3TxfoNJaundbQwm8db+da39ebXE3ItUSFofFi1mKvckUaUqjH0avLey/71+Jk9J0oQqY+txo6CnUwkQ5gBIhgKcN4slfV674VYcCgWQg8ex3JS9Ma4UkCjm9G24S9x9u6AQTjaxKXLCrFRtP+drZUZg38/CW1wH//hwxAT0MzYeDrTaiQF0gq9aCKBJ4Oz30B6hmS72ywIrIbLq8kzXhdnW9tGq0EjiPC+K9+OvT11TRueC5FjUmHrIp2H9PMw9j9E+0nGAx76txg4dD+niesTSUM5MbTAW2UqL1pa1AowEaBx0SksG4+fayTDfWHIs+9l7iO8dnLYntdrHKbSTHnHM7EUrH65uU0/NCmLbeYK+kQh3iLe6H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tGTm3heXcjbjYJ/AzBViwsd8ltNmt0jHWJkRjH0uj5/Q5S/C9qr8V1pKTwjM?=
 =?us-ascii?Q?wu4mL6EnhJ1iipno8aLwIcolf8rfvt41IYLGhTKWnU03xvpADogn0z4OvUPo?=
 =?us-ascii?Q?PShOVUz6JYdmDfs6RH9ZZj5mKBJbfR5SBguIOPlLMCP63iR8bVUNIo0IihmK?=
 =?us-ascii?Q?phRl37OTVNCXETbhgk8HhdW9nPGIUrzYcWAWqN0wktdmlmmsaerUdaUr0nmw?=
 =?us-ascii?Q?1pZJl9grxdgHpbcdK2ntMAEOjJMXJfbpV+wUNblsmtdRBD4cWI/dVtTrHuT/?=
 =?us-ascii?Q?Tbe9aKJsEzZCm9Vm3kL01kvwyTDvroBHmQoTAMAEmemfhNVnm0KRI9q94LTv?=
 =?us-ascii?Q?HmNQjuU3oUvm3JQjdcFq8hIyhsJfZpl2AkKELYFK4aYgh+c2JrJNSxkfUiGM?=
 =?us-ascii?Q?BOd8srlAWiFTCmPjvqJYTcsZt5Hz1yXg+p08EiTabR3qNI8qNgSlOp3Fi1Wr?=
 =?us-ascii?Q?STfER8OS6Ix/dbkCHUZ45V68ICZnK1aUWHVIb2Sh++tW2WcdrfnI4qgAoqif?=
 =?us-ascii?Q?j38OES7SFPu8Yb/vcJTFpYWJftBrJ37GZb8j7rj0YDf2kKPYPQHwMuz9Izlf?=
 =?us-ascii?Q?LyHpR6Gj5urGalO271HbE84hg0Yy98U7YD1Uj923mC492OVjx72O/88RFdFK?=
 =?us-ascii?Q?FzbiKiqh3w4k5iArmNVKmjYSC7BIJDi8G+KPbmFhK3sXjvv5riZ8QwdTk26O?=
 =?us-ascii?Q?tdIdW/lpLvIr3f3Cn79NkCZC3nXzkdgDCBBvZXWjVQ66/twC3UaOyAoaVR9J?=
 =?us-ascii?Q?4uBHXVnRUVOWh06a0GckdeZxn2Qcha/6l8EQrm3NwemCCLayrJfShaJn6e/D?=
 =?us-ascii?Q?Kyff3HKwA0LPJJcdI8Q7sujUkClvPZYFT+VyaqsB5GKA1wahOqJamU9i7VpT?=
 =?us-ascii?Q?h6G70oE3tJ9z/2dYTPm4smDNO5xFUmUKPltVgSr+muI8uzk3XyVf5r8QWSei?=
 =?us-ascii?Q?iEHaj9746koJqATl5zEAEqzXorlfxLMdyk+Nu4V6CLV+5yL7nPrBY2S1WMnr?=
 =?us-ascii?Q?4sR0+6K1JBO8wRM/ihrBZ+Yd8SKu/N4eH4r+wKDCyV052ayAzXgvISje6J5E?=
 =?us-ascii?Q?k3o7iuoP6T/BLUttfocfJMwphi+SVjLWVqTg2lKD9UxdCa8C5G1R7Y1MarT2?=
 =?us-ascii?Q?raeBq8ZRfhw7hjC7+f/mjzAe4unpSHdWrUG9fjUXobxQjF6jwIUmTVu4D5Af?=
 =?us-ascii?Q?65nKOcNe2OwL3KwZvGW/FLsP49M1vEZVjyKHpj69lQ1KPLr25OkcA7cbPzk1?=
 =?us-ascii?Q?ZmruCT/JWTT5GloEHlUEJOqJytTSuZ0DcM3X2U089lG05K3BhchZFUTa9yMs?=
 =?us-ascii?Q?mdSz1ZRUQVmnHO0z+ezDbsg0jcuHQGzMtMbsqUPhr+z/LLxMYZrUE98HUhSB?=
 =?us-ascii?Q?fxtSv/rwmK5HSTEdNyqUjub74cDfKk1DjN44GyZiKF8tNYf6iMAx3gjPkv/F?=
 =?us-ascii?Q?AEn9EtAnQI/NFfW+nW7MOPWJdHYhGWYez44ZuWRrxb6rDo4RdqOtsh+H60Ec?=
 =?us-ascii?Q?kx0vUmqeN6p11Z9EUDxdxuEj6lvEGT+vnNtv3UBHaqnD/t4zkH2ZZ0ZoXyTV?=
 =?us-ascii?Q?cvfy7JeBoIS2TuWRTtGkMrcd8R7vGAMjVchZYj3Ym9zwf3XEqXGHrGwfT/vw?=
 =?us-ascii?Q?JsN2srTc1UKAAG4xh6j4aaQ41zasjGPIZkytzLJ9zCtt9P9fYb+KN/ZTkbbM?=
 =?us-ascii?Q?WNUBWHp2JBtm3NuppKnsl3sNsxFX0JvfwWg4/0mRQCA5XPxn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e51b7b0-db23-4a5e-1f66-08deaf9350e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 19:27:18.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1gNFyLgG8CAOt1iKTG43ML4ogQ6TNRauZQpiP42j44mKk1rLwZKj2vr7XSs15XJrTKpVDdINfW2HCi8GK2sJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898

On Mon, May 11, 2026 at 11:19:43AM +0800, Jisheng Zhang wrote:
> The core reset support has been in the code from day1, but the
> dt-binding doesn't exist. Add dt-binding to describe reset property.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> index e803457d3f55..613dce7757bc 100644
> --- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
> @@ -35,6 +35,14 @@ properties:
>        - const: core
>        - const: apb
>
> +  resets:
> +    items:
> +      - description: Reset signal
> +
> +  reset-names:
> +    items:
> +      - const: core_rst
> +

Remove "_rst" suffix, it is totally reduncted.

Frank

>    interrupts:
>      maxItems: 1
>
> --
> 2.53.0
>
