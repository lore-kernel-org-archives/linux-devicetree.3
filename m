Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1D39FCCA;
	Fri, 12 Jun 2026 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781294427; cv=fail; b=lBWllSkC3+abiSaMT0luUsX0KltPQJ4qTx2JsncvV0NSD15vdJv4KXR3ivlssoOfjfOXe5KwNl1S815+P3dASkvCY2xuyb7rhE2pOeXL1/Kb9+KpHctSbH/FwWMSDnDaCUjIDLC0v2c95RBHsAHgDz09pgQUGEc6H16xp743xK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781294427; c=relaxed/simple;
	bh=e5hlTxaXD/j0X8Hz+9b1pljeERdGCJH++a76GpDPD1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iaMlgER7JTEYrfnG/UDd8jKMrb1RVIgb5rc7BYlrdDwzjBOT0XbuK9ttXqt9nC35XrTViBHd8h6cgaDKq4ol/x9v5e5iqKIYLdKNysH6bUAHJ9wxoPdJUR/QqvmbV7ndzzFhXVGjfkYx5IiSsdSsoE23cOY5NvjsVf89cyNoMRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=agmQ8pD4; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="agmQ8pD4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+GORvkxoMM6H6Pr63iWiJ7W/fYekVFK6iz6PfRqQj7ffx2MlWdic+bIx5BeI/fiIgQoNe6LRaL3h2BIu6ujEMRRbbSSnl+m5uWoL5IXVqbxE47O5ByhCxx9MbvITOs/sBifXtfzGh3EE1oql5p2qV24j+TxHpyJ6lrx6GAAc1V++LTJe4AzRJzRjzrugOMd0rasXkAywOYDez38Gin+SY/OUMSmNM7lD1EFI00h2yrW4BexvQf3tomZY4tBd5yOUH8N96kbqIRSiI+3EzbByig/zKprY5FrM6vM2edmTjbeE58dgZiEKdl/RPOL4zBuwEBIk+rT8s9pE/oe/V2iDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JD27JAfFEh588XCtyllCaQiLEHDjrenbjQBladlLcGI=;
 b=Ek/wgLvXpOA8Uy1H8IN/TXiWIIofKx9mQ8HNPkJ81aLIxK5VIgr27BsAj2DR06/FV7JbA9q+5lTJZWReJzMv9yUqODfa6/UWjcp3SGUlhuOfZoLPPbt4XvDXZ4ua58epPbUooLr2UuoaZjRrbiYQ7G5y7aGheaxlYBzU8AQzHOk8OItL5MP3RBmmtesjNvxIAMMjxw7LmGLUhYlUonMrCKcJxqBmqSLjQUQpoiK4F3TcMkQoI1tTW5f2RIkYrcZZqpvpAhUuQxxUDnagpExeJAYqPoYfV0iX5QmBskbYEcpBs2FF+Mjk3Cz0Unzqi8cFRYhXwGDMEGhpdM7p/XH52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JD27JAfFEh588XCtyllCaQiLEHDjrenbjQBladlLcGI=;
 b=agmQ8pD40KKAX9ZmiMmlRr3WyzneCfwQJoPxvQtKs0bRapAItPek2BQbwLQulMgflFvu9mDANqPu3x7LTnf7ZB1s0GZm6RQhNQ014HrQ6deRKH+lYS1heYRx88M7xzVlkhgmyEVs4kbtXhEjd7gLPWJ7N/iG088RfQgJaAHdDFcDXLDx4dpF/b5AtHoi6z9+anZn/J8VWAWsXlrGxMcXiDGlykln0XxvxJtgupIEoP3IllpeNw7py/WThhEymUi3hoPL2t55f7xa+Klq+wRkOtC7/9vmQizn1YM2SkcEi9hQAA2iQEl0uw806PqHlGAqHArIaDlwBsIZ7vtXCldw+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 20:00:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 20:00:19 +0000
Date: Fri, 12 Jun 2026 16:00:11 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com
Subject: Re: [PATCH v11 4/9] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <aixlSyFbls3s1ePQ@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
 <20260612111816.3688240-5-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612111816.3688240-5-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: 770684f4-51e0-4426-f1cd-08dec8bd3a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|19092799006|1800799024|22082099003|18002099003|4143699003|6133799003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	pSaBua2WWTL1CQgo2nBmy6pRyx8NfhM6ejVbQt1HokxLq1GiZtaRDM+NMu5Be/mAXm15KR+P+qGuFCGZPVVYjMSuENkpw+y6r/MZrvDwd9uFP5SDX8kaYEDKy/2j5RHby8p8t59oeqwQHFtIGSABDwejHuqNRwqQzoO1tAEEmZ3NLDAD2XdgXTJVH4BOnFpD38Q2QzTbhGDxf/HD4CpgJgwDBztoHManD5LmA5T28tT39qVAyAjj1qZpJ2dIc+29iDzuxRZQkdIWpWbji/oaJ/XVMYYwYFo3t/fm2zzbC6FCrfeH1TQXtvzMjL2n8U9D5JRbMEruCMKMIPp0iMxAQ3+X4JOybx2AMKX3JuJ19+PVW1WWG07nU8XzH4byjCBc6hgE8rMZcJJ8bRnP8F1nuGSw3wqJvGTQWh0kJjgopc0FpzUGv5i3SMT0t+snM3AjlG/RRV+TNTkbZQtSdbLHzAcBYd3jD9kwrSUQfnDNKSW/ajZIC4ZDpfQlySckpcGXuBmPi8nwiojTeCkJ/xcm77JU4WsMZr52XLo17vHzYY0cJ4uTOzS2mAVRCssABhjtazzMIXO3HTJsPK8aN4i1Y2KKG58o5X5GQDucQfBgFD36rO6eNMjxvaQjKguAMSb6EgQzEGkbHPsfz4+Ukw0EyA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZKhsynbMt6OxbLzD9/3b+vxAMJUbZhT79kSY9E+4JzFdAWX2iQ6OdkMZwtu8?=
 =?us-ascii?Q?QNlv3WD+evsuGqhQPweKkesUyRcEowkz+hI4a4eVqFOm4BGMvE1SCZnc4Xwa?=
 =?us-ascii?Q?GzwU9yyVomgJc690z9GgiN8SaJw2TW9VW4Q7AWTk7SZ84n4nFG596apQ4V0T?=
 =?us-ascii?Q?JHX1UNpKWtz60vs1s4NrTT1/CIBmE8oLczVhDcPFYi/YfDg2Qs7fHd/1AT3m?=
 =?us-ascii?Q?iP0t8PfVagMcyA1X3ANdneVT7RplIspN4kVluy6SD//dUa+wWYg3/TJ3a+gh?=
 =?us-ascii?Q?Tz4wK9DfogyzrBuNWQ3gXUc1X5YBkW9PVbveY+SktRNmdc0DIqZE0aeD8ZkP?=
 =?us-ascii?Q?PURUxz+3rOfLsiihaoz9kWZ/X0K18fSB+2/TRDISiGKlqryu6LGke0LK1u13?=
 =?us-ascii?Q?5L9rjUhgg0YlmGGlDa69ZCJIw1k1R+Db2wN41nk0byBkDNBcvq7m+VB8SbMf?=
 =?us-ascii?Q?TUnRS4PFnNfbVHN4W9V8ktnHJzzcPCE2Q4OjrPG8v8gL0gWIw4HvZr+Xdh//?=
 =?us-ascii?Q?Wfr4UgTLCXp76dDZa8mmgJuSg6WN5oFJO2YLncd25ZDOKjPiYVlKC5BN1uT7?=
 =?us-ascii?Q?OwnNLFEpKjOEmRl/ETvxf/wyBgRuS+8I+N08qCiywGF5liOfa833u2vdj33Z?=
 =?us-ascii?Q?PtBzx0iypxZGxHwX+QOPts1VuAwPE9nfj1HobhdWNgOK3x/pgYiNsIJyzpns?=
 =?us-ascii?Q?Ott7ovNjLT3pDhbr+wePrQI/1JrC1D4xm82CnN2BlI27RzBA+Qjtr8LkGbOm?=
 =?us-ascii?Q?JikHHHCgqT58WKLcfrSIYn3ddSAEh915quGbnYhsvSqV4ysBCb+4XTphZ+Ag?=
 =?us-ascii?Q?a3lc+zHdHcJFtQjZr86yfA+Zz/uM8NGnn5y1zZ3I+iB86sAXGT4Rul6EstpG?=
 =?us-ascii?Q?nsbkwjnuEg8bnGM+LcIaOL9aI6Tn0UKRVUvONdwam9mRTFTGOLNOEi9CXVkI?=
 =?us-ascii?Q?gt0hd9ProYWCW9WpLnG+1YP7q+UlLFDQ4py/RSfGFeZrbsJMcjycEv7WNjun?=
 =?us-ascii?Q?t/SCUxAfMtNljPocjYc16/uldePF2beujjMzBcvpDu7STrKGarfR0cuiE2AU?=
 =?us-ascii?Q?rvlPUmjZr3rSUGde2FVNsKqRLD3Ls862GtGvA/+aWUZZz48Z/THYeW0Ug24o?=
 =?us-ascii?Q?CINIqlK2f7N5QINJTdLfohB3r4mqS+SjeAXHFRUvA9OdNiC+NH8W4W9rIoKI?=
 =?us-ascii?Q?n2u5RAetnNSAlSSEV7bg/VOjryz+tntzRTyxoQSCC+t7ud1C+Y6ytJZcJ4kj?=
 =?us-ascii?Q?0R2G3iY/wqWqLmfp2NPAUaSPATrdo/XConPTmtdsaxVWW4m7cd5LZsVhbzKP?=
 =?us-ascii?Q?VrGMEfZp1JGRE39KnwI8CKqWsZG5r9A9kCU6Whrl3Vq4CdfBR/DXDphJxWMh?=
 =?us-ascii?Q?oobexzBbao695ptW66pzNN4MNr7p4+s/DxFbBgsE/YRsIaIyaB02BoIUIkK8?=
 =?us-ascii?Q?t5jJeNnynFp6X5gLGfJi6h0SeNHMU0wVkqZpu6u+nP2tPo2Fb2B0ki4+/iti?=
 =?us-ascii?Q?BW3vR6YX7DhKJD6wxGAbAfe7J9zKzGjOOJp9yJTF1T3WTfn3ZLEdfIAeXqTz?=
 =?us-ascii?Q?D9k+Bz7H80t/By0WjYNB6Gc4hBo0Y0rm5/GxUxyMN2puuglriVyZCrHTafQa?=
 =?us-ascii?Q?+p1ZHgj2xrXexMl+PKy+HM/2HCl2xeuZB43Pq30X0UHUuA9xPJp+5NJq2pgF?=
 =?us-ascii?Q?9jnHqzNDq54D/ZmN9Z/tkU6Ynx3r6MTItl17Nw1ksPXJwBD85RpDCXb8Lu1q?=
 =?us-ascii?Q?MLkQux4Zy+i4m8Z5/gHiBfrtPEYS//q2ylCSsfUpC9ltk0ACFFCO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 770684f4-51e0-4426-f1cd-08dec8bd3a93
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 20:00:19.2948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 23Zi7+aml3iO7wkHkLYq49tLQjXG2BjdcmZrNS56U21axT8J1bjnoQXo5vGGvpk+v4sUMYojx6qR7fBdCkJJ+5PPOGZuRl+tcEfiUXJ+Wy34xr5dJg9It7/9XR8pW9k5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11799

On Fri, Jun 12, 2026 at 04:48:11PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add bindings for the NXP P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841)
> multiport I3C hub family. These devices connect to a host via
> I3C/I2C/SMBus and allow communication with multiple downstream
> peripherals.
>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v11:
>  - No change
>
> Changes in v10:
>  - No change, added Reviewed-By tag
>
> Changes in v9:
>  - Referenced i3c.yaml and i2c-controller.yaml for child nodes
>  - Dropped unnecessary #address-cells and #size-cells from child nodes
>
> Changes in v8:
>  - Add compatible in i3c example
>
> Changes in v7:
>  - Fix schema validation issues
>  - Adjust required properties
>  - Add I2C example
>
> Changes in v6:
>  - Use a vendor prefix for the attributes
>
> Changes in v5:
>  - Removed SW properties: cp0-ldo-microvolt,cp1-ldo-microvolt,
>    tp0145-ldo-microvolt, tp2367-ldo-microvolt
>  - Changed supply entries and its descriptions
>
> Changes in v4:
>  - Fixed DT binding check warning
>  - Removed SW properties: ibi-enable, local-dev, and always-enable
>
> Changes in v3:
>  - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator
>  - Added Regulator supply node
>
> Changes in v2:
>  - Fixed DT binding check warning
>  - Revised logic for parsing DTS nodes
> ---
> ---
>  .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 291 ++++++++++++++++++
>  MAINTAINERS                                   |   9 +
>  2 files changed, 300 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
>
> diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> new file mode 100644
> index 000000000000..c080eeb0eeaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> @@ -0,0 +1,291 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/nxp,p3h2840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP P3H2X4X I3C HUB
> +
> +maintainers:
> +  - Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +  - Vikash Bansal <vikash.bansal@nxp.com>
> +  - Lakshay Piplani <lakshay.piplani@nxp.com>
> +
> +description: |
> +  P3H2x4x (P3H2440/P3H2441/P3H2840/P3H2841) is a family of multiport I3C
> +  hub devices that connect to:-
> +  1. A host CPU via I3C/I2C/SMBus bus on upstream side and connect to multiple
> +     peripheral devices on the downstream  side.
> +  2. Have two Controller Ports which can support either
> +     I2C/SMBus or I3C buses and connect to a CPU, BMC or SOC.
> +  3. P3H2840/ P3H2841 are 8 port I3C hub with eight I3C/I2C Target Port.
> +  4. P3H2440/ P3H2441 are 4 port I3C hub with four I3C/I2C Target Port.
> +     Target ports can be configured as I2C/SMBus, I3C or GPIO and connect to
> +     peripherals.
> +
> +properties:
> +  compatible:
> +    const: nxp,p3h2840
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  assigned-address:
> +    maximum: 0x7f
> +
> +  nxp,tp0145-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 0/1/4/5, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,tp2367-pullup-ohms:
> +    description:
> +      Selects the pull up resistance for target Port 2/3/6/7, in ohms.
> +    enum: [250, 500, 1000, 2000]
> +    default: 500
> +
> +  nxp,cp0-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 0, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,cp1-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for controller Port 1, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp0145-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 0/1/4/5, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  nxp,tp2367-io-strength-ohms:
> +    description:
> +      Selects the IO drive strength for target port 2/3/6/7, in ohms.
> +    enum: [20, 30, 40, 50]
> +    default: 20
> +
> +  vcc1-supply:
> +    description: Controller port 0 power supply.
> +
> +  vcc2-supply:
> +    description: Controller port 1 power supply.
> +
> +  vcc3-supply:
> +    description: Target port 0/1/4/5 power supply.
> +
> +  vcc4-supply:
> +    description: Target port 2/3/6/7 power supply.
> +
> +  regulators:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      ldo-cp0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-cp1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg0:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +      ldo-tpg1:
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +required:
> +  - reg
> +
> +patternProperties:
> +  "^i3c@[0-7]$":
> +    type: object
> +    $ref: /schemas/i3c/i3c.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +    required:
> +      - reg
> +
> +  "^(i2c|smbus)@[0-7]$":
> +    type: object
> +    $ref: /schemas/i2c/i2c-controller.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        description:
> +          The I3C HUB Target Port number.
> +        maximum: 7
> +
> +      nxp,pullup-enable:
> +        type: boolean
> +        description:
> +          Enables the on-die pull-up for Target Port.
> +
> +    required:
> +      - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c {
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +
> +        hub@70,236153000c2 {
> +            reg = <0x70 0x236 0x3000c2>;
> +            compatible = "nxp,p3h2840";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            assigned-address = <0x50>;
> +
> +            nxp,tp0145-pullup-ohms = <1000>;
> +            nxp,tp2367-pullup-ohms = <1000>;
> +            nxp,cp0-io-strength-ohms = <50>;
> +            nxp,cp1-io-strength-ohms = <50>;
> +            nxp,tp0145-io-strength-ohms = <50>;
> +            nxp,tp2367-io-strength-ohms = <50>;
> +            vcc3-supply = <&reg_tpg0>;
> +            vcc4-supply = <&reg_tpg1>;
> +
> +            regulators {
> +                reg_cp0: ldo-cp0 {
> +                    regulator-name = "ldo-cp0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_cp1: ldo-cp1 {
> +                    regulator-name = "ldo-cp1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg0: ldo-tpg0 {
> +                    regulator-name = "ldo-tpg0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg1: ldo-tpg1 {
> +                    regulator-name = "ldo-tpg1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +            };
> +
> +            smbus@0 {
> +                reg = <0x0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                nxp,pullup-enable;
> +            };
> +
> +            i2c@1 {
> +                reg = <0x1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                nxp,pullup-enable;
> +            };
> +
> +            i3c@2 {
> +                reg = <0x2>;
> +                #address-cells = <3>;
> +                #size-cells = <0>;
> +                nxp,pullup-enable;
> +            };
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        hub@70 {
> +            reg = <0x70>;
> +            compatible = "nxp,p3h2840";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            nxp,tp0145-pullup-ohms = <1000>;
> +            nxp,tp2367-pullup-ohms = <1000>;
> +            nxp,cp0-io-strength-ohms = <50>;
> +            nxp,cp1-io-strength-ohms = <50>;
> +            nxp,tp0145-io-strength-ohms = <50>;
> +            nxp,tp2367-io-strength-ohms = <50>;
> +            vcc3-supply = <&reg_tpg0_i2c>;
> +            vcc4-supply = <&reg_tpg1_i2c>;
> +
> +            regulators {
> +                reg_cp0_i2c: ldo-cp0 {
> +                    regulator-name = "ldo-cp0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_cp1_i2c: ldo-cp1 {
> +                    regulator-name = "ldo-cp1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg0_i2c: ldo-tpg0 {
> +                    regulator-name = "ldo-tpg0";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +
> +                reg_tpg1_i2c: ldo-tpg1 {
> +                    regulator-name = "ldo-tpg1";
> +                    regulator-min-microvolt = <1800000>;
> +                    regulator-max-microvolt = <1800000>;
> +                };
> +            };
> +
> +            smbus@0 {
> +                reg = <0x0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                nxp,pullup-enable;
> +            };
> +
> +            i2c@1 {
> +                reg = <0x1>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                nxp,pullup-enable;
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c2c6d79275c6..ba65ae5a008b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19303,6 +19303,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/ptp/nxp,ptp-netc.yaml
>  F:	drivers/ptp/ptp_netc.c
>
> +NXP P3H2X4X I3C-HUB DRIVER
> +M:	Vikash Bansal <vikash.bansal@nxp.com>
> +M:	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> +M:	Lakshay Piplani <lakshay.piplani@nxp.com>
> +L:	linux-kernel@vger.kernel.org
> +L:	linux-i3c@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
> +
>  NXP PF5300/PF5301/PF5302 PMIC REGULATOR DEVICE DRIVER
>  M:	Woodrow Douglass <wdouglass@carnegierobotics.com>
>  S:	Maintained
> --
> 2.25.1
>
