Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453E2368D51;
	Wed,  3 Jun 2026 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487823; cv=fail; b=p2OgRoIS4qoOrsRDGh7vBb0ETskvv9OD1kGkafsW5vtau2p30lNvgjLB8SuYRvLdVimc2fCxLcJi3Lxjrq7r1jkHZl7Kb2PlnDk1Y0/320djkwlZ9N5hrUocKFl3Y6gis5pIKnYGO+B0b0vMHy4y4dXPqNO1v0WeMQxHUlMty0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487823; c=relaxed/simple;
	bh=iJGVETbtEozaJ4Ez/ytrhRCvha86J+T9EfbSUKiIhIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IdWUnCq1myJwmEXmLzsGh/2nnHl22WxvTCUJzutVVw2qQwKXYIuMZMAcF0PfijAGimq9xNTRLqJAdBnSONYAYJwXPCk0b4lzCoLgbJS/Qs4QQw7ID8+t7ke4pQkoHeXOZwJ5ZcgwTTOn92vNi3tEmggPQqqLKnqkJb98KaQiKLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KGXc0vEZ; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KGXc0vEZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBELR6peh9kDHenkh/R61Yc+ag1G8lC0ba+mlZmaRW6ddZN0K6C6lzyWoQ/B0a9IiQhFfHM/Y/TfIzgcclcU7vqQmteR/JMTK0AjzfY14lskKzhmkRw1yWFbWIgN9whqnSAuIn1m6ztA8CP+pTuqGtcflyhxxWzg0rRa15mkN83NHslEUYasUKS264/YnLues+E8qeBTZ4YddY996eNqIb8LuPPy0DdVxUWDDkbvp8PaOq3+s34jOy8mndWeI0ZgFGcPFbrHAo1P4f7Y1FUjihrKxZFXrlvGDeawSUMN0M29QWO2s/noGWWViBIrt+RnNh3jOeIkd6f7P1rsjR1D2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj27gDZ39U4dYQ6mIAKEZ0ip/a+v7pIQ9Qud8QPV3ho=;
 b=TuF51slJeEhFekNLjQLFMI4lGhLhqws9MZ7DeOe/3bby8r4W/PIJsY0c9KfVfc3Aeczi7yH3Bk2aOfbnLRe6R0PNMM4oPirHN7wWS0Pgmu3ij6eTHf3W4sIl9BDGJAHgkNmgjl60+iWtpUAmKiTebVP6+is1x1NmFiagrBXy7VqCyDonerjFfDvQ+/eOM9wo/RVjkSgLp5FMy2TbEscKRwKaUSwuPMN5LnR4DN1wnMFWNp87MFZN3LGdul9dtTHFBxr3YO4rR0+7Lbp68qhAl0gbKKP9TdYi9xKlgbMarRq4+clDxBzdyPPXyvURlV1Nv7eGwIDSjzQ1ZQrKuLPaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj27gDZ39U4dYQ6mIAKEZ0ip/a+v7pIQ9Qud8QPV3ho=;
 b=KGXc0vEZqqgOWmBzcJNZaliXt7Pbz3ZSA6uXWu0lQsVpTGHKm/wuF919m5p527sfAhYWsN0VJnKT3ZqkDoy7mbwgS5EkqAK1l+4whNQ1QvFJL9sNyss7mp/rnTAFwlyAdA19ULRdFscg6N7g2GVeP41TYPTJUINIYyiiV4bV4n6hSLwKC2zBlKi27s25dPrR+XUvgX7lBziHGvYYKBzJdJW52+tnRFe4S3iWptoxVx2tpIQFtKEvO7NGJrRDIhMfSSDoGJjHj7Go4AbXVQ/HQOGKFY111oUqQ+Bkj4GirIa/n4S7hQWUZO30ml75y+vShGpc46tp/aFxA6V3xkB1CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI0PR04MB12056.eurprd04.prod.outlook.com (2603:10a6:800:314::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 11:56:57 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 11:56:57 +0000
Date: Wed, 3 Jun 2026 14:56:54 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-phy@lists.infradead.org, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 phy-next 13/15] dt-bindings: phy: lynx-10g: initial
 document
Message-ID: <20260603115654.k4v7cayysvy7yte4@skbuf>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
 <20260602-reviving-aging-a7d066d2448b@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-reviving-aging-a7d066d2448b@spud>
X-ClientProxiedBy: WA2PEPF000008A7.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::64c) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI0PR04MB12056:EE_
X-MS-Office365-Filtering-Correlation-Id: 289476d1-378e-4b21-da20-08dec1673692
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|7416014|19092799006|11063799006|4143699003|3023799007|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DMhRp97UkNcF3b7Q8067Hf2Tr/fzE4LemLQdvvHeKC7mb3fa3UKZmyBiq30qbARrn2ZbrAuwpvl92h5TgMbP/nmhJ57tCbdaRj2hEqPpqqeVDgbfFQldhZmp8g1SX4cAsHIneJKrgtJ1Yvo5Z8LSO5yNw85PbskxFjg5WZS4vcaX13lHWS1GyNaeJJuvS4Vpfi6jMV2nWnOr/ps5Pe9W8A84Ej5ducQHiHJSSh40xG9O+5ZztJCkSyoeKL2Q0vRAdfbWeIHuUBJUw2NWryUwropzbad9AFKd3P9eNC+uhTtau+YwlWDvmDMDNMmLQKhrNyM2YZVmRYBk7XSgBjRBWmolqITGDoe1ocCzzP7/asGthqC8n1SM7fTqRv9E4sl6ugyuC8I6PuVT9gRBZWZ9WG18uqtVs9MGqezxoMa6qnJ3A+fP2EPxYuOalPzQGsmkinefsTXCOLAYlpHSSqQQlrxgFFzpR6KHa5PDeDZsqDy+4MeibvFrIHwDb9yt8FNcuLeMJwtV0ch4IhYDMoFxZFiyB5equLjvmEZ8T1q7wfnfH8aFKoo4oh3Xj8uLsAT7aEuOZ4lKBIbDHwOuuGX5v1Cd+zlnGTR1t1xVJzhAKGYVJEQW7Cs0zUCr2feAIN2A9z3WAzpGbb49BWDbjAwg4Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(7416014)(19092799006)(11063799006)(4143699003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wpr6++jI7HJDpWqNBloJTBo0tmwRkhpLYb6VXMuMN+4Cb0QqcwCzXdGiMYXH?=
 =?us-ascii?Q?LL+MeQQUCfOAZOcuU8yofuaPZHsdLqd/Yfax5yxnfPZUdodoE6qFU00jKXMG?=
 =?us-ascii?Q?3w7Hjw+2ihFZe32M/9J45QcQhM500+t0CuFd00JeSjA6WoY6c2pmnGx5fQaQ?=
 =?us-ascii?Q?0f8nnC/C3I605No94PnJt8yLXmQ4OMTy0sGAJQwPRB9BAibYI1XnYY6uEG98?=
 =?us-ascii?Q?0g7Y22d60HMqNBW92VFoNZu244YjVVLnI3RYYkbUP+QzW7pV4Ofsky0Q63Yd?=
 =?us-ascii?Q?AO2xRhYmgxToD4vysQaODjoBSyzUtJAgiW/vKSxvbPqfA0yDRHCxIYUFMKBG?=
 =?us-ascii?Q?xlBb0bvcZ+N+L7uT5m6efJ50jgF+pxOPyGioAOmK+qBCowh+pRyX/faxR8mT?=
 =?us-ascii?Q?nJV6sR1Ofb+0XvqQbzfV7s9MAsssd72el6jq55ow4GDRFFRy1IYhsaKAOnJs?=
 =?us-ascii?Q?/GN1m5BW0s6JAidogo/A3sBg480X3YmuCmO3xP3qmuL/6NO1uHn8VzYFq3Ve?=
 =?us-ascii?Q?g9wlQx8Xj2A3P2OGClxulZCC3kGzk2Tz9I071etYIRe8G5i6gXwFRbpwF/KS?=
 =?us-ascii?Q?MKB6darxXGC5XX6KJH8X1qCPmK11PXZqXr5Ia0bp28bnbjwbMBkY8HjBB6pu?=
 =?us-ascii?Q?M+s/pZQbH0loXbQrg/FuGZvqNMtMVu58jaHOPjSd9hqm4UGzlQ3u6xYPROuw?=
 =?us-ascii?Q?A99xPSgrkTwss4IVCz5usZNpzHN04DchTsBla+j3n9Ty3LhT0XPpiSAfwVX0?=
 =?us-ascii?Q?BgP4xJsCc6sl0UJViNfDD3NW6jY/d+RZWieNKx+6k/bzgy/MZoryXnPRqzg8?=
 =?us-ascii?Q?U09MObi/KFInQEzE2w7zrYQaSgf8jelMycaxKX1Ek63LeuB73ppVJXYw11N7?=
 =?us-ascii?Q?Vny6+pfZSSA/WpvCTUR3iOF+J82wz5wdy4+/NLOR7+O3NHO6RUfeZOJLiwpm?=
 =?us-ascii?Q?ugI+EjsLxghBPUFgK98aBWrWtqqOjFDwSd5PqAuT34GmwmUrgYunJxYL2nzh?=
 =?us-ascii?Q?EYZ9b0TXaRVYOJI01SwGePwSFRG6c94hEEPhoyndI+BfaI65U81knRm7+k91?=
 =?us-ascii?Q?OncmRhoVGYucxeAQEgtb/9O2ZqvwHe+6/okikE4yMMuWKPsVbYNzYbgX4e1b?=
 =?us-ascii?Q?A4BlT2uPHKraHhXs0RHPh2bCFt75XT/cEyNiVfk7SuzDDNvkbKI9/l7JOLKI?=
 =?us-ascii?Q?T1TaTCN+ZsWEEG7+5FLr3wKRQ4T4J8dA89jeRv3s0ZQa/SuCPnUc86OL1FKA?=
 =?us-ascii?Q?Eu2wFJWdH4duZACxzMKJydgXjjZXbfme3w7uDsokq+SZr4UnKnRSB27vM7Fu?=
 =?us-ascii?Q?O/S85G3GfHTN8I7B/XIu0AAIZe65o5S/QlPknWXeNZYzaA8Rnjr0pdAzGgZL?=
 =?us-ascii?Q?WS1/PQ+emfBniG/XAI1JWQ5L9WSEYeC+HqnFyB0qMPGr71TuqUoxvDHrdOqY?=
 =?us-ascii?Q?+B6IWg+6YylSKk79/SgGKusYSFHHP88dAVba700wz+3RpPM5gNDo99ePTmRe?=
 =?us-ascii?Q?LJFex6NPvz+8dnV9tc6YTvEEB6yWGQuH7fAqZ3gjacRvlabkfUBfaHMXmj82?=
 =?us-ascii?Q?AhGNvBXiGzSY3SIBm4cVOTn/eobB+f3UVf0is7wZepCSkZhZfnurJMMmh9vk?=
 =?us-ascii?Q?ok1khA+j/njOhJZwe6K3awtYtSC971mge4TxRTf4nYTwKD1ya6CNml+w+vY6?=
 =?us-ascii?Q?7JkX+uHMd9rgdVGKfQn7leizDmzs0UOFjvySHQ3LMxW91BUxVNjysNCamIXL?=
 =?us-ascii?Q?lVZoyhtA2KnHzInnR6buUF24Ug6z/NYz/l7u6llTT9UUXRoSsMzWF0T2eJ5L?=
X-MS-Exchange-AntiSpam-MessageData-1: neLOCXFsYRb5Y1Qg759m/bApYMkqcfw3vHI=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289476d1-378e-4b21-da20-08dec1673692
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 11:56:57.5890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dI1yZjCjM7cOl4PDcg2QbZzd9MtJdtovFmOu9Bv+4TBV+70MfdwijjSL+7GEfhU6oaJR+q2FYwEg4KvNyHB+pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12056

On Tue, Jun 02, 2026 at 06:10:30PM +0100, Conor Dooley wrote:
> On Fri, May 29, 2026 at 08:15:07PM +0300, Vladimir Oltean wrote:
> > Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> > form of the 28G Lynx SerDes, which is very much the intention.
> > 
> > We allow both forms of #phy-cells = <1> in the top-level provider
> > and #phy-cells = <0> in the per-lane provider for more flexibility to
> > consumers, and because the kernel code is shared with the 28G Lynx which
> > already has that support for compatibility reasons.
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > ---
> > Cc: devicetree@vger.kernel.org
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > 
> > v1->v2:
> > - move patch later in series, right before driver
> > - deliberately ignoring this Sashiko feedback:
> >   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
> > ---
> >  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > new file mode 100644
> > index 000000000000..993f076bba4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale Lynx 10G SerDes PHY
> > +
> > +maintainers:
> > +  - Vladimir Oltean <vladimir.oltean@nxp.com>
> > +
> > +description:
> > +  The 10G Lynx is a multi-protocol SerDes block which handles networking, PCIe,
> > +  SATA and other high-speed interfaces. It is present on most QorIQ and
> > +  Layerscape SoCs. The register map is common, but the integration is
> > +  SoC-specific, with the differences consisting in register endianness, the
> > +  number of lanes, protocol converters available per lane and their location in
> > +  the PCCR registers. Some SoCs have multiple SerDes blocks and those differ in
> > +  their protocol capabilities per lane.
> > +
> > +properties:
> > +  compatible:
> > +    description:
> > +      There is intentionally no generic fsl,lynx-10g compatible string due to
> > +      the hardware inability to report its capabilities, despite having a
> > +      common register map.
> 
> I think you can probably drop this from the diff, and put it in the
> commit message.

Ok.

> > +    enum:
> > +      - fsl,ls1028a-serdes
> > +      - fsl,ls1046a-serdes1
> > +      - fsl,ls1046a-serdes2
> > +      - fsl,ls1088a-serdes1
> > +      - fsl,ls1088a-serdes2
> > +      - fsl,ls2088a-serdes1
> > +      - fsl,ls2088a-serdes2
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  big-endian: true
> 
> This isn't a required property, but should it be made required for the
> specific compatibles that are big endian? Or are we not that lucky, and
> devices can be either?

I can make big-endian a required property for fsl,ls1046a-serdes1 and
fsl,ls1046a-serdes2.

Thanks for the review!
