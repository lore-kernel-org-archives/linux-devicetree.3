Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104956;
	b=JUhqqiIfwpgiLgQGO7MzduAm9hcjX+ankmawt5By/qBpQDQbd+EiGTlYSa90v9pZevYz
	 kuBFHFPYYqJ6NjYL48akGJ4ty50R3Zk9958594E3NUBdwp3ra1cd/Z0f9j3W1S8rPiEX/
	 MyFaSK0f+iNX0kKYZ4wB9z941RIqNQCmyXuInc7k1U8LEg8+XOT3opIH8Zo5AcobrAuGe
	 axrJG8Ru+YsMbgMkq11aSzYGL6YM44ctrzNx5lmSL6+g89GYkPZiBXThsC4fmj5X5lIy9
	 /1SvmEaBMmmiPra/Mtr/vrY+KyVxahrpXYvZ+JUKjI9FQCUe5MhqkKUtdE6HGOFxYfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104956;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jOYhkZTqfYCkgs5d3ymxseWK0cG/Kw+BiuFDK7ze0P0=;
	b=IDH3TRh284nv6hxSEj1M6KDY/JSIuHVbmrb+L93vi4y15/1x+cciCeOnYpmwubgDS24Z
	 36WwbR1DYio0D1HKDvEdCsQQZKk85FOhZrR6L6MW25B1+suHE1eXFs1rXli1yceIDlr6u
	 iQDihnhznEF4wSpmuGKoYE5r/tGaifUvWMN1O42LDKkjnCMr3sBWRNUkIGCEIO0wkocZ/
	 y5gOk9QN1UsbnVAZZWgbBivVMJmUTdoK1qehBPsQ1TS7I3Gve7UhGCaTYR06XzqnHkMzv
	 3LrNxhNaeVJEzUvX6LYTp5VSNEzi89aJjIZDCykruKsH5d+NV8xPqyg37zw/Yb9ZPgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hl93R4Hb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.6
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5320606A320;
	Thu, 19 Nov 2026 16:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5320606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=hl93R4Hb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdx7kUqZhkcvJMdDDEu32e9NP2EkRvbviNl98l0KNn4PL00pQTD5f4pKxwTLdG4AU0Dnj8V4wu0cvTbxqhHQId4+hHY1FsLqJ9/vVkpS0WViiqNsBmFafWgBLJytlrbq7DvMLMXFfRP9JOMELr3DL1RymoN2wYdlmmldYLsVFenL49dSux5X3Mk/k4BgZr6Zd63OoUf4hiJqrVdW4QGpPFl9PfWmCefPGkPgPoZvawtqfOGVG5beVGWQYrR5arqrHk99IB7TheU6nd5wbCdNg7Aa3Q1UiSUQ3CMFroq+6Wn5u61zi/EVoWcAJXyeN7chWPXadicME/EfNY8yV56hAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOYhkZTqfYCkgs5d3ymxseWK0cG/Kw+BiuFDK7ze0P0=;
 b=vAlgnp/cnJZf9xtpXiW+edjAaoh48L4I/jBqIp2mxQhiRkB4XJTT9N0MHgbXNbs5hH6RWfD+71CYCDw0vuWlf1YZgBtj4nTrGYvzulTtuah2mYtJBuajTHOLQaZSzcePV0itYUQH+b67o+i9Q+Sk3OLRR/X/cgIv/h7yGyUIOjC8p1aGlx65ISebzhNBbxU7SRBcu+MY0v8r2bEaZaItQ3FsFBxfPVFFemKXcRLsrYbOIW7SKZqJ3/YGhBte6pbFXKGJ22AFb6unsC9/iW74mjbHze0uEXZIQe+v1Qvze4DU5qv+8/sTgExAvXRHfGd/M17cDEpdvWOmomllksJ/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOYhkZTqfYCkgs5d3ymxseWK0cG/Kw+BiuFDK7ze0P0=;
 b=hl93R4Hb9FNzev6zFRzyCpx2O3aXt+TZtFNG0ly1aTHGwIOMHveDlHvfVFW+pa9d6kvfHWU30XnWiuxDJ3S5BC1Og23BOuy0TaMj33hdX1UzpB40wK68HwQhlm/8H3sbBGUvr0ypSX6xSVDiXOjYYbXD8h2UFmf3nE/SFSypp14Ru1b6O04AsYsLi4ZIkeCCGwS37qz/M+bDlBPHFahwCKmFVTBcRxYerYwMIGkuzTvt351O1LVic/r3cjkKaICXBXRdn9YaMUOSjnAoJwJS3ugLRsDEMJT9xKpZQ21Tbhcg743GAxurZf+beHSFTISrte6B0earHfmbXZ1G4zkD3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from BR0PR04MB755739.eurprd04.prod.outlook.com (2603:10a6:2c8:5c::9)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 16:15:51 +0000
Received: from BR0PR04MB755739.eurprd04.prod.outlook.com
 ([fe80::84cb:5d9b:dce:2492]) by BR0PR04MB755739.eurprd04.prod.outlook.com
 ([fe80::84cb:5d9b:dce:2492%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 16:15:51 +0000
Date: Thu, 19 Nov 2026 18:15:48 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH 0/3] phy: lynx: add support for downstream retimer PHYs
Message-ID: <4v4cb2cdjsm5pe67yedtz7mmidvm5bf2xictjmnvd5r27cuimx@st442r2qjuhz>
References: <20261118163134.2149894-1-ioana.ciornei@nxp.com>
 <av6-ROH48bJTSp04@skbuf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av6-ROH48bJTSp04@skbuf>
X-ClientProxiedBy: AM8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::29) To BR0PR04MB755739.eurprd04.prod.outlook.com
 (2603:10a6:2c8:5c::9)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BR0PR04MB755739:EE_|AS8PR04MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: a4886cdb-29f8-4d35-9209-08df46586179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|22082099003|18002099003|6133799003|3023799007|11063799006|56012099006|261026121527099003|4143699003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	YgM6iNT58DPDQmufDO4QcKQ5M6XwrLbHh2Y6kjk2kQTVKY3aiAkaL51bsqLl2nqbZI39ut+jOVSwZ1UpmGP1dmgZMbdzA80O+EYGa4y9oJ1bll3pTg+FV2IpsVXEXoxzKSPQ52GqIf8ev5IXbCXQS64ILIQfEcJp6kWzNwtRCLZiZrKEtwz4jrWSgF1WsY6S5Kd7Ul0vdaXwtZyztV8BuolBsJYZK2Ny/5a3uxOZedT9rRj/vQBsfFmJpPP2gNzLgFVSa1NgAxWpN7SwtOTkioJta0fcxP33UidWVH7cnVX4BYXOQ1COY+LJkprMNNV02SjvYQs21rB0ox0uR+yvntqQzzsj91EH9UihkNOaOXBY2qYe0A7Bf5dgBCX7a8vHI8rO2RoMkIwbQ9relFFGM/NXLLv8TNi+NpS+yx5My8ZHvgfndO/v4E4+l436dptrPwQsdLrSS6zQx26ff8AkYwy25f94cOpKTwi0NxW45N+YqpTSGdBhkAiDj7hOinb2J2d/hpsmDwCpATWKMe/VulJF9IzgMUuWPIriOEVpdpvvrDcDAahrFh+J8wCZz9TJP7GVbvZYbXblXX8DypLfo43jiubJGWMD6f2NsIJVH/EjcEFClMeEpE0vx2WYGA2Yo2538LO+nSrrCb56jIP6NWRlmGKfDzCZXLCJV1N1bMw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BR0PR04MB755739.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006)(261026121527099003)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yc2SDV7MPobjBkGC9cYb9LWVFJkPLouBNInRJvqvrGuNHbBQBNbcQJCFr/Wy?=
 =?us-ascii?Q?v2wi6WF/fU9PwVVKspslFGHso2GQb1zQSn9zLq/fRH/O40ErkZI7IYjL93jn?=
 =?us-ascii?Q?IvGZvnaONstehThR788Qc31z69C3tMo09mJQXQ3Z5gC2qh7bOLL5tGgoxXR/?=
 =?us-ascii?Q?9WwGDffV41s6c8y9rkvF2Em19eU2WpV1Maob+lx4+tsddCWb7p8Ed/Epj+xu?=
 =?us-ascii?Q?sEWvwgI2sXCvKkqyX5Z035QsEG/l2nRFf2/FlEElJOj3MqH2OV+mHz9LmQXA?=
 =?us-ascii?Q?TTxfq9mx7OxUr3C1S3C1xmm1xq7/90trplQAEwR0SQE+fkx2mb4foqPs2DKY?=
 =?us-ascii?Q?Aw9PR/qPEVCl7fPJZuwUmJFaxYlI4thKJ2hgS0zfZenCIcrjX+SO30iAoPnn?=
 =?us-ascii?Q?XMiFB5g3D8ksYOtAxJd9Kgnz2NeUyJC1lq2PeW0dlKlv8AsJ5/kl0EFRdle6?=
 =?us-ascii?Q?b5r9erft8R6DJIZuq4HmxlI8sPSJMTVRjKWUpC1VeZWH5pW5r4/xDp9rl8V8?=
 =?us-ascii?Q?jBuuohJd19rIB3CgIIOo3HQfEDhYFN7zKCqhQJvXZGksb1MKY1HqdIuM4KBS?=
 =?us-ascii?Q?1I836ZTs81RlA0a04d5bBKfoGv3h3wBmTE2DVNUJJx4n0WcgKYaX7AJA4FhA?=
 =?us-ascii?Q?XyZcUWNJW8q1lQvNXXNjOhFeXbO0KpERggj54yZcOfIIL2j/fRxzYPflt0dO?=
 =?us-ascii?Q?yvwesmALXKHzEVKRS/BSbT9+WPdOAig+og33UgK00w0Ht1XWte2hW9YjA7Hl?=
 =?us-ascii?Q?ruZqtFUZDag1h5+Doa2aNIbxw1l7NxNbbXxQRHMW3mxIJyM6GOyJkbPua/vc?=
 =?us-ascii?Q?2mMC3/71PCz/ASWqTtnhvZRHs2RLFnyGLFMz+KOd9PnmEC0JV6Mi7S6zAJ+Z?=
 =?us-ascii?Q?l6hwtlPL1XJ0L6XN/J5zSiWlBawAkzyP12THSRecSBaBs8M+0r5yISijdOJ6?=
 =?us-ascii?Q?ZVXorWeYiAoNZteCnk451+ZvN9QWebheelY1+BuuUj931bpvAEDwQczxLasW?=
 =?us-ascii?Q?h0+w8yrjXV3ju9dbvxizfGoBRTUpCPVM2XbQ2V+X2pThU1FegiqdK9kVFu4p?=
 =?us-ascii?Q?7hV0lu+pZNqF3l0TvmKcYAxM8fPYgre8txxvYFHdQV+3MMC7uIw53zMVvjuE?=
 =?us-ascii?Q?HInlUVzjXnWkX4ujU94EJEpN/wHkhlm14Pqm1juFabPZoN0JrNwheSEj6KHm?=
 =?us-ascii?Q?kYfN4tiR3vln7Q9bTBnm/mP1j95ufqZNB+jU5yvmjqsOq4j/mn7uzaupJG8w?=
 =?us-ascii?Q?2A5jtki/KX1pe3yW1e6TR+IjNE5keJAEOk7q9+sfL5sG46mYvsuPQqRfxAuH?=
 =?us-ascii?Q?evY1j9+0IH8z0a8VBlmdgNsgMI7uL+DY6jGb+gHMt7xDVBbsAfA3rxPuQzff?=
 =?us-ascii?Q?IsZX9qHe0Zh+mQd+Xd/1L1lNxChFR3n+9WE6GnYOcPICcWwCZTNwu4hTicCu?=
 =?us-ascii?Q?EHfM0gl3W1t8z/rkxdeuhKmE9J3Z5zW5B3b122wdrgDHXQv9CeogIbr8WU9C?=
 =?us-ascii?Q?pVej4gCHpYCDBXV3BUad9pYqawhC2LBr3pzHCtP54vqPlTCeakqniCllpiMW?=
 =?us-ascii?Q?CJHsk7e28B5bzWjPvmRJLB5XPT9+Q+fCXXOn1IZ+ESonON+Dlz0D+EW2nrfC?=
 =?us-ascii?Q?v5VZFWsci+z22BsAK0n5SMYwqp9sq83GEzNQhnczys6oQBdx6L7F+jzTNDaI?=
 =?us-ascii?Q?XZLiT35kbVqcgl/vcXYmv/dUl+QnGGxfeLpGSmWu57ZExNSoTHFrNPSqhnKn?=
 =?us-ascii?Q?KVPzkr7kCA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4886cdb-29f8-4d35-9209-08df46586179
X-MS-Exchange-CrossTenant-AuthSource: BR0PR04MB755739.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:15:51.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWS617Mfjnrm019PNcYv55FCxaw1glwGEgU51EKbw1yM9oYt88eUIVputwSPa4ySW5KDCyuZALG6UFhIqCzCmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994

On Thu, Nov 19, 2026 at 11:25:01AM +0200, Vladimir Oltean wrote:
> On Wed, Nov 18, 2026 at 06:31:31PM +0200, Ioana Ciornei wrote:
> > One thing to note here is that the forwarding code is kept rather
> > grouped in phy-fsl-lynx-core.c rather than in the individual Lynx10G and
> > Lynx28G drivers so that in the future, if necessary, it can be moved
> > internally into the Generic PHY framework. This leads to the consequence
> > that the actual phy_ops with which the PHY is created cannot be const
> > since the .owner field needs to be copied from the structure received
> > from the actual PHY driver.
> 
> Have you evaluated the possibility to land retimer support in the core
> PHY framework directly? What would the obstacles be?

I did evaluate the possibility to add retimer support in the core PHY
framework but there is a lot of preparatory work to be done in order for
the core to be ready to receive this kind of feature and actually use
it in its current drivers. On top of this, I am not really sure there is
enough interest in the community to do it.

Everything stems from the fact that there is no actual enforced
guideline of how the PHY consumer and PHY provider drivers should
interact with one another through the phy_ops.

I will list below some of the identified issues:

- How to interpret a missing callback. A missing callback returns 0 for
  most of the ops but .configure() and .validate() which return
  -EOPNOTSUPP.

  For example, any PHY consumer can now call phy_set_mode_ext(phy,
  PHY_MODE_ETHERNET, PHY_INTERFACE_MODE_25GBASER) on a PHY which does
  not implement the .set_mode() callback and get no error, even though
  the SerDes could be very well unable to sustain that mode. The
  question is what to do when this happens.

  In my view, .validate should always be defined by a PHY provider which
  wants to expose .set_mode and .configure since without .validate the
  consumer cannot check what modes the PHY supports nor what
  configurations it accepts. Since this is not the norm currently in the
  core PHY framework I would be taking on responsability that is backed
  by no authoritative source.

- Which ops to forward and in what order.

  Today each driver that uses this kind of "chained PHY" schema
  forwards a different subset by hand - some forward .init() / .exit() /
  .set_mode(), others only .init().

  At the same time, there is no uniform order in which the phy_ops are
  called on the SerDes PHY and its downstream PHYs. Some drivers go
  through the downstream PHYs first and then their own callback, others
  the other way around.

Ioana
