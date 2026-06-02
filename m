Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D83C8738;
	Tue,  2 Jun 2026 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391048; cv=fail; b=iWRUoieegdRqQVDaq+zvdkTC06/Ni7G6UR7D0vU5f4JRFX+wl2aFSm20III5V9mrFWNaQHs7VbxZzS9vR+/IRDYjSICZrFYNa0Ww8GAGazEtpZ9IUZJPUlug4Bshb7T4yq4NeHHDb0YpfOkQ8do3xi6fNs1Zwpfjx/B+askQOzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391048; c=relaxed/simple;
	bh=wumyimx+dAYm+4NHzVoEcaccfnmjgFE9wD4whWV1CBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YVF4b7yWPkLDwRXhigww/5OwYhhCwSAaBgjPIi9xyzecDR9IQA3w75AiCRhw8+k5OwZhdMz56w0uxv8HXsERhi8jKJCTFY9ojXErmZuyGDjrqfdRN3zppev5WoW0soH31NcXqYIGq80sl9pJSQGEtoablSaKqs/m99fp0UiF+3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D1S+TgNb; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D1S+TgNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xErxnS2zcb17l4RLb27h+1Q/TVeNBl+TlDc7cehMZYk+k0lBCbEm93ndYtsW0o+VkAyttTsW0yCxUaH1QXOO16bYcSbI3hMQCnSUdurhCWFxAyF/p59cRBqT85hKCFjS8njThFO0ky9VdJui73NTyEFLolFpyZLLAZmFrFkfcuaDP2GRByDAxm6/AyDd7VrXYX+NZSmLDtyj+WOdON078jrnL78rJ4b1eBdL5CX/CLM02VuLv5Ui/LD219tLG52TVpWMJMJdauXVC9PMlUOUCEqMGaGK28l1mmIkxJt2J3l2DIPruHPYQfI3JLUBrAdnhdYcmZ9CCfXkBrltCq548g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VDSL3JkgKj74/U9cPYTxB7VGPyzIpZ7dAlcADlJGcZw=;
 b=h/Jjr88MM8U9TktBXoN+CqJiRoIKLQLRgnXgg+oECPetbl/tfmC1iL/B+78YMXxxMLGgdLct5RZmtqX1O1QUzBJAO1RkF1q4bzEYqCxWJxTmk78G2Jb0yI8FAWldA8UCh38HaO6uCOSKBdPP5e+DLrok1HXg8bGAd58jlMoUzvR0GKIY6ZgUTy4wxeP/gnbW1QfxlPkDz8O24lp7/I6Ky219ZKwpcpgP77ay2tWeP6s4u6JxBSxSm47rm+1qtZtvtpA75chLCoIy37Z758oAu3MOXe8FbxoJLy5b2anlW9rakLojzsaXxTOunsL88we+tWRW9h5TAahtxPEiJdd+gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VDSL3JkgKj74/U9cPYTxB7VGPyzIpZ7dAlcADlJGcZw=;
 b=D1S+TgNb4BwOD4vAF/2IwQW8JLXn/xUYyxApEzdGMOy3gcFKLckOzNvv7HxGH8+PmUibcrUFJ62eeNeWxJg0vVTN1gNBBGooHMkpccI1TWEIbtMPrMHc6JZWSfkzAJTzjzFPhn+NqnGYDHSiWnywZywzFG4SuqpYRYGpZHYH2FhQYeGRPb0gJhJFMMgd6ICXKF2wdTPkvowkGup2Hg+INZkQhYDzMA8PjbR/ZRiS2LMxybRM/kUfWraBZnEbge8AQbbMU9pr6hJPGtT1bjREC+UVr6mVh26VK2z5w1hu4XSOlQSjDfPM6vGwD4lL9gl2m0nLDHu//SVfayhLMju1Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DU4PR04MB10766.eurprd04.prod.outlook.com (2603:10a6:10:587::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 09:04:01 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:04:01 +0000
Date: Tue, 2 Jun 2026 12:03:56 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Message-ID: <20260602090356.ewl5bezjxyqys6ee@skbuf>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
 <2842502.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2842502.mvXUDI8C0e@steina-w>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DU4PR04MB10766:EE_
X-MS-Office365-Filtering-Correlation-Id: d0dad192-6b80-4d64-6774-08dec085e341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|19092799006|376014|7416014|3023799007|56012099006|18002099003|22082099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	WsdacUbytmNT5yrZZepv+lKyZwKDPF4bNpy+2AbpQW85Zr1BPP3MIjp8dSy9jxiVBrkX+bse/SMTExx2VWprBz7N7lg4A7ltrHup9qj6QLzyKd1InsFZ4V2SCiULG1nj2q7GRuzQ3sc5Cr4iBcekK1vCiZUxmerLn2UeVfk4df6RQnB4YBvvIm0nVaH4yo6WgXN5/2YQCWUgBI2t21zb+Suf/TsxyamcrRBK1w0TF1e7jzb0fiAHwE2jvORY9VAdhteZCFzJdsG7eCvRMUnIr4rZGns7FmPOt9DVQIV8ImdQpLrFo8FevURIFyEb2PSwD1gPjRHmaG7e0hgsnxiajcBE9WZStRA6T5wxgcvSUy/8SyMd6mDwdzWshmia+3Bt0l7cxQmubstPFydqEOCpCdqA158R7NXKj3aOeOcYMZLPBzfsIl8ij2qNfaIP0gScH8rAAQSmzECproursRN3EvVOEwIGd+24MQFMLLmfoXHEWEemGQPrttoCYsv3IeFN16KFZyKoxdkiHcGlQlbDEsl4ufsgPPtzXNMYce8Aq8KXOtasXQWW+p+2RKEZQUiFK+sgZfqtU5afWMZnz2G+DkszkiqsBbCoBuEHxE9iCehjnXQc/xg2T08LrhcqU7OnifyTllnC5RvayNUOkT+b2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(19092799006)(376014)(7416014)(3023799007)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6NhAxbHHjt9B8gFtlo7PG4++QTyKFmLYOe0/QqPH5bXy+h5jlSm/EdLcH6GO?=
 =?us-ascii?Q?pg6H46k6j8Y8DG/XSifVNeeHmem3bDzSeQvV88CvRxZYKAFLRCFsRvHrfVTB?=
 =?us-ascii?Q?3gTd5vzgpLu2As/HDAQADg9UvEYMUbdFoTqApFx0cBNs+fuW5mjrACkywu3d?=
 =?us-ascii?Q?hEMmF9AsJFH5U8AB4xKfX3e9xfL+ijc1fyYfo4Jkq8EBiST4L4AYuP5k2Y6y?=
 =?us-ascii?Q?i/YQP0Q6xHlJ8/5/4PaPzwOeQwSIUF2StSZECcAUEsFstdk7VD9DfowDdBd8?=
 =?us-ascii?Q?tHHmZimSumEz1sofdoQy5Dj6ejXed+0B982abg+0e0VPKJhfhT2EfXEBImbw?=
 =?us-ascii?Q?B4vSOC6IyYn4egEzfGXQBc2rOmwKrFYhyIUkf7sSIPf4RQNFVjQaaMaAKYK9?=
 =?us-ascii?Q?lBGt+CimmBgwz0ywpd6/fTjhsxVkw/93C/oYMjpidExB3T8h3jA0Ospc/sMB?=
 =?us-ascii?Q?YL1lmv7nIumZkg0r/6XXNxJw7ZabOvZffJffe+SvvQqxlPql0a1vk3XoHZyi?=
 =?us-ascii?Q?qcejIUbrffqLxs1zk5dxQjhQN1OgzGYiqWdkGDQ6yoFr+nIYiw3hvbp/me4J?=
 =?us-ascii?Q?w/i93IxnWp8LLEScNXdsDtQEC+GLPBlFuYL5qnVABvoB8c85t0W77/0e8XJc?=
 =?us-ascii?Q?NwfG3dxgTuu0E2fLYEz27+C7vmrxMDh3Cu4a3tzvwjDZ2Ad2VYr0AINgSw+s?=
 =?us-ascii?Q?V/A3ryTFiKO0u/G2MEbALN8+JMhrUjmHq5JvYtECzP0vRYeqLhA0IbfBW/RB?=
 =?us-ascii?Q?19iq3lGxE0h9rC9Zck6Kgf+RUCuLtQEPyUg/s2oxwqyqLa/efCek/XJy19DD?=
 =?us-ascii?Q?iBSFu3a7f2xqLww8F5R1+mOAhjVEERSn4G+H2cjcVg/0vJb8wKE43aHi/ONo?=
 =?us-ascii?Q?O7FdXfc7mfjlIaPRiPxKnnORmJNTxfROSiu0/scX5+1KZrpgCmyoB7MrZW4U?=
 =?us-ascii?Q?5laHTWXpN+gErh42y6xMT3x4OeDiPV5xo9YQOXqNOK2nET3g+efbb9ZLzs88?=
 =?us-ascii?Q?117YMuaVWnJ7ZVAT736uhVKIt4HxRzgvVofHaxZg+IFJ5djhVGUHX4vPNFIB?=
 =?us-ascii?Q?XdH1Sm2ZmiZO9xbfOGzNmLi4fjykjASYeYLTEA54z0puKj+i9vjjQf8hpYAX?=
 =?us-ascii?Q?Q+vwfwUlyMCCQ1J5+ZSJ/6Wk3GUrrv1gk3HEvt7RrevwAevbs/zqPbqndkI6?=
 =?us-ascii?Q?4mdOhQKk1DOsBlVpgQpt1cyJAvwGtSnro2/GU2uRNqJd1Ij9klu8YuHz7jNE?=
 =?us-ascii?Q?nvJbRsg1HIrHbp8kzWYVfL1qXHNbgbWIoRPlykCp3AyOAPEwm6gyQs289DJ5?=
 =?us-ascii?Q?j/7b5jmGqBr3Pp2H6kPLnPev4f7Y4buUfTcZpQ2uPqMtPMxa1UBQLJPZvxaV?=
 =?us-ascii?Q?jdEEnxzLasVjhgj+YnhODKtWr2HCxiUtNrBVBO9o2xQnbUEKyxzFUZ8LawHJ?=
 =?us-ascii?Q?tqGRJts7RKI3QV3F/sCX7Sgo2KKfxaWEr91eeHA6iUe68pS+rb2Od7+didYI?=
 =?us-ascii?Q?BaGhnoKD+hFlxv1HteRbzPmLKUfJHxZTti8WZupmE0gQWel2Up2PodSH5M+x?=
 =?us-ascii?Q?4fbvq+TTO7A28PmPiuO5XFNIacYUseY053E300ak4i5TkssjIurfzKUkT1hB?=
 =?us-ascii?Q?BhVqQGo1Sns34t/GmfW0iykdgjxxE5vVmiER4rwn50c2qOZ6ot5YuwDHwyA2?=
 =?us-ascii?Q?nbVbUlqdDPlm1hkqdrPQBvfGMvQ1tzYcvd/2t9BIHqXLLRcYsr6zdODSJ10y?=
 =?us-ascii?Q?gTdHWVosvfffG/rlWqWkVEpZuAQlbNSE9duj7oZ6fyrkmBwZGEa89fGeiWF6?=
X-MS-Exchange-AntiSpam-MessageData-1: ycsPsDYaIg+uZHtLTlZ/fZGM+yGNx69iZEc=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dad192-6b80-4d64-6774-08dec085e341
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:04:01.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN0otrgzBTiQch4LzTEgDFBBBAwDDmPBli/0uY9eGYyQ9LgEuIG64U9sYyhEaqBvkMpBsGTyKwwf+rtS4ariDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10766

Hi Alexander,

On Mon, Jun 01, 2026 at 08:34:25AM +0200, Alexander Stein wrote:
> Hi,
> 
> Am Freitag, 29. Mai 2026, 19:15:07 CEST schrieb Vladimir Oltean:
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
> > +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml
> > +$schema: http://devicetree.org/meta-schemas/core.yaml
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
> > +    enum:
> > +      - fsl,ls1028a-serdes
> > +      - fsl,ls1046a-serdes1
> > +      - fsl,ls1046a-serdes2
> > +      - fsl,ls1088a-serdes1
> > +      - fsl,ls1088a-serdes2
> > +      - fsl,ls2088a-serdes1
> > +      - fsl,ls2088a-serdes2
> 
> Silly question: What about LS1043A? AFAIK it has a single serdes block.
> 
> Best regards
> Alexander

My understanding is that hardware validation for LS1043A was not
budgeted for the main two features why the lynx-10g driver is necessary:
RCW override for 1G <-> 10G dynamic protocol switching and KR link
training. As such, this SoC isn't supported by the SerDes driver in the
NXP BSP either. With the exception of 1G <-> 2.5G minor protocol
switching, having a lynx-10g driver would not be very useful for the
LS1043A as is, without a procedure from h/w validation to do RCW
override.
