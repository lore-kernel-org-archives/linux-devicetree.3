Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED4348C69;
	Wed,  3 Jun 2026 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501161; cv=fail; b=Yk3uvXsEI7UdzFm7F/IkmA74v2XU0IHkvEosAck+FW/f5LP3TqpnPQ5Jzm0Tg97qtWTR8cpMFEgXbmfE/lapmIeS6eR5fNpqcBpDf/TSGlJlN+IPHcfLe504baQ0aN/YQa5AHMNIEuFu4cTWjEUuhVrNvDFTJb0qLyBVn5vTKME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501161; c=relaxed/simple;
	bh=5Of9iDLJOxzaHwTvpcrLX3WgvzUS0wHMzzuP1+RNuaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WQd/XIqr3S3EtpEPKmhUmg7ZuREKwRhuOci9DhexGfb7n/BhC82ACUTLHcb2S/gupCsmnpl8BvFiABohe7Cv2JlqH6LwXh5+M2tdftt3pI94UlwdufLX0H5xpKbi4gN4ZYOWCeCzhgrJqBdtrJZ+Y9xRa+RZsGq9Tkvm/uEtq6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=csD3ulTa; arc=fail smtp.client-ip=52.101.69.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="csD3ulTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw4cDXucABn+tyYN8lFq9GwLymA8k75jWrlgb0E0jGPKwJ3lfzyl+Bb16vLlByE7EdAoiErXNkMMET6IgkzV0ZZ/eL40Ag8IKvlzchp5SR41665S5anoqg8eGCdSGTWVSu/GRNWxi+mtCdmxx45joO0S+l+Iht08IdZwSR4kABSrJRfTXoS0Hg5XcPS+MzeBJrCUlpjQzdUpLPLv5h4mSfmhgHpUHP4YJIKQ1V0iytgECKdej4Hc6UbOSEPYyVS3YD70MxIFmvoGsihynWS90Pv+fSzMFx3weOcuZ778EZVAlHgBATi4y5e9kZfbXaQzVogCcDZkAwEhJewXBHRKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7IPPsT4Lpp0di1P7vUIdJttHZ8MYTEang9bcET5PdI=;
 b=C6WPFd8Efz99y4/B3IVOcfSVzJMalLQfTNZ5okvhApB/3tU5RLfLRXvjb0JrpBSgVj9jCj+L1EEQgh8FXk/dyNKzJtZeMrV6i2Q44fY4im1MbWxTBj8baF9UUDNIxvfvGt1QRDwEZHSnkP8Sr0roCOGRDGNb8s8CCS23zClxnT6YJ49kkPc431WDiWHYZAzCl8JKuy4Gmq/VXAgXnItZYt2gAuvlJ5+wdJ+TjbbmReD33ewqnnU2vsp2U5gV6+rttMpHL1z1vrUUh5gLTx//h3mR109UMPGpvOHHsuwTdww1pFnIXjKxlxJBpJN/EX5etOb0xbRA8B3kmWX3OLOsog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7IPPsT4Lpp0di1P7vUIdJttHZ8MYTEang9bcET5PdI=;
 b=csD3ulTakzcVhXvHSN3LnwciENOirRTxRkQO1l4telJcya6JJxLW0atGTs5enAR0tTaukVFdQIufzh3UjmZQJKqY1J455fSz4CTMVz0CapO8D/McPLMnyXXCMZiUU/f3RQklom5cDR21z4Jp1qU7NTAgjxnwHX8ur5pWcdGxMLX4JsLS7UGSiAC5H+nZElKOtpoCK8/TEzU3TicJpUF2owZKUfqBDG9eOmK+MqKaN8J6y5E7jlZ4ik6B0TogUO/QJtw810ln82eZJrhY8D9qkf18Oc9a4V3WAvj2kDUWSoBmc384jBCxjCvzCV9/lC3QdmS3reV59tvrwgYCj9koLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by DB9PR04MB8480.eurprd04.prod.outlook.com (2603:10a6:10:2c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 3 Jun 2026
 15:39:09 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:39:09 +0000
Date: Wed, 3 Jun 2026 18:39:05 +0300
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
Message-ID: <20260603153905.64vkypfsjfjjohva@skbuf>
References: <20260529171509.1163787-1-vladimir.oltean@nxp.com>
 <20260529171509.1163787-14-vladimir.oltean@nxp.com>
 <20260602-reviving-aging-a7d066d2448b@spud>
 <20260603115654.k4v7cayysvy7yte4@skbuf>
 <20260603-bleach-arming-247f1b0fb87b@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-bleach-arming-247f1b0fb87b@spud>
X-ClientProxiedBy: WA1P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::25) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|DB9PR04MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: e39a9b1a-b103-4958-a256-08dec18640d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|10070799003|376014|7416014|366016|1800799024|18002099003|22082099003|11063799006|3023799007|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	U6QyAvdOu+Hu2jcgjgZnzbMkoDU3RfacJKelh5dyAQcymBV7aNjiwvO9FlIB9XDHHUcy/kt+zV3mYdSXaFIjWM6WveieVHWuGPAm8WQy2/R9/BWC4YdoJeCYNkvhhSzcAKpMxqQF/5KxE4pfnx6imouVih8w7hePp22SsmXzY7BZjr4Z614H61qLNA84MELsEReUCgvj+xsjZZDYSYwISWhlspVKL5No5i55mXtbhS9vxi7qKneIAmQGDwDyXHiCn5cozPcPlAyi0XscVwhEcx1GMdRURFs203mbY0mDe9Ziq1UXRQdICXvqi/Z+KZKfEbtHP7YKHz79GtcyQciDjUq7+dcEpwqodC3ZTsO63fzpvCh3xFJ9p4dLUiW65zc6m7u8mQXEFy/LRHgr6hhvDM6Kd1ghEQjOAeY7GUZmDvK6X3xYrGn9TBZl4gDYDiRRf0UtzskjF/2VhXLTv5wrn/YgbzJO/aH/bZqEsSnxyko/V4i9DUQrL3eQ8c7XQdbgGopwjK6S47sR0l8mqIV9xFEcIlWnemeJdT4dpQeo+Bha1kRv9uU8637btZMU1smRTsOH9Trsr/QshcWoH8TBkrcmLVyvqelZ7VhJdpiyVBu1dNEPwBT4pa8iIjxZsPBQJj6GnVxHr+z61TMJ/6/Gog==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(10070799003)(376014)(7416014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(3023799007)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UE6+u61H6MIS0eWyxUGwwe9Rv9pF3vmajqrVfDLeaZxu2hPrUSax8YV9Detb?=
 =?us-ascii?Q?ojVGBDuocUZecd/qCApi5QoKNynWeL+ziJZpOZQ6/GjDhJiGYhUppJX3uPXY?=
 =?us-ascii?Q?WYZzSIcfhpXA1HKWGga0CkJEf3I/ryWJ4rxH1Wi/R/OW7J5piF7xuBKLFEVZ?=
 =?us-ascii?Q?/aHSObBtQiddNxUsl8Rqlo7VZKrLlt5m1jR6W4Zr/VJ2MR/xcMS3eyRaHmSf?=
 =?us-ascii?Q?wyXM4H3PhRrS+CKlt9PTkUoaC9DTw7D1FefeJv5ExVUzgW+JvDkaQli5GalY?=
 =?us-ascii?Q?iO4SV3/79yRCP7NbCVPYeN9L4VI7TopqOxQKKh5awxsc71uOaBWgy7tlhV14?=
 =?us-ascii?Q?mte9hSoGRhjMR1ZcBygqwKl8CfqEZWHfhcsj0KHcB+qvA+kTSE+/gHQ0RZRO?=
 =?us-ascii?Q?Hrnqhbo+XJbYuBYZb80UHwA6z3zsmzsMM4bHOgPYR9gtverThKkq0QX1KVde?=
 =?us-ascii?Q?85csrDvNSfzyjVJHoV9NBu6EXaaoIbpYevq6QskiCmIo3pT8E1jYC8xZ0Gda?=
 =?us-ascii?Q?FffCvTpFYbYvan+OeuhPbNvBcHsv5JDTpKCVejbzXY3nhuhN6rQtyme4ndH/?=
 =?us-ascii?Q?EujJctsXacz11GbkoeBeJWb9zOdRlKZajaXi3nrRPSnHuTx8SaiXaZNpCrZW?=
 =?us-ascii?Q?TYekOWnNCmCwIbV4S9CZOEOP/AY3NOidUI4d0laVe8xHX15oW/AtwhkYzWGA?=
 =?us-ascii?Q?NYXBn5Ri6GQD54ym4fCvQak0o0dI7Th/0JWpwRbul2giUqWUjQjr+sbpobSW?=
 =?us-ascii?Q?mvO8ROyQk2T8tPMNERihCfv7rSDSg/1eExnOTMCCRcCEIkY6IAQNw6fZj9K5?=
 =?us-ascii?Q?fzo0Nv5hg+n3srVJnXihfmEMsljC0pKXKkP+4zykxqTWoSAin7xXtGI3abeO?=
 =?us-ascii?Q?4LzGycP0POVYDycED04jZ1000AJ/gAPO5jL0jZKZBEa//kNZFfigo9sXJJgQ?=
 =?us-ascii?Q?7eacEBNNB4mHwe2NW2tDdI8PM6TmVnxIq/jQF+uUmqF6HSAXaUUIUTexxtLd?=
 =?us-ascii?Q?fxZIs+RprYqsMrOsmjlNwOK9GNhAaRtr0NNNgJT0lbA2ZM8WN/eIDOT4w2Fd?=
 =?us-ascii?Q?iDXrxAbUKwXYwjPv0LuGbfL73lVM8gNdL1wMBlsgFed+6+ryPHk6h5SdhQkH?=
 =?us-ascii?Q?xPxEX9lwjJrM7PFaS4JzcCJXBHmUsP/9bKvXUNAdOAU9ZvfkBA3UD3+Pfzcp?=
 =?us-ascii?Q?7nbRW6prw6wWGrx2rlhlhtOdcQaE6453f4sFAialmg0d4QYvFXQE+tVjO1pT?=
 =?us-ascii?Q?TOnqr6C5FgCI141mL5CWPOQLnaIQ6vvPKKhS3c9KgDkCMayF48rl7aMxkmkL?=
 =?us-ascii?Q?Bxk1yMiFSM+N+Lsf1oUz1YcSWX/zC8QDeDq8fmtXfPAZiQjwvBfwtMZSCOPh?=
 =?us-ascii?Q?W7RaKmmkzfmCu3sA/x5UeqqYSfvuDJ/0klTdFtZZiTOykIDLOlzTVw98JaE7?=
 =?us-ascii?Q?WOSUtNz6gHy3uDo2y8YAx5tySg2IaqZOslgSTeECItO39IVOn/7TuBLnk22L?=
 =?us-ascii?Q?KagDHBXmqUGC+T2XW2mjswThbxS8/eD008AOJqMGRhygBW0pEGrj1yfw/5Bc?=
 =?us-ascii?Q?+Pwp51S+C+Lff8/dWtqMWwa7dGs6X4V4tcwSqdsP/GAwhQ6JQGgRZgJuHc36?=
 =?us-ascii?Q?hFnZqZLbPXItmfc0/bispifoxmcOfd+yCs0BjC3Nls821s1tJoWh+kxVOcyS?=
 =?us-ascii?Q?ZLqXpHZ//tSk3BzxlX5xoXufQqfmbG7jFVW5L1TZXWreIHUIOoX+VjxsUcpE?=
 =?us-ascii?Q?//IkCEbf4Cpm28fefgCMhg/Eiyz+ejTIyc/mKB8A1N/x3wtv56e76m7jdbHn?=
X-MS-Exchange-AntiSpam-MessageData-1: hDwdDOisyeCL6Eo1MuDN9oRB1XbPcCu7oxY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e39a9b1a-b103-4958-a256-08dec18640d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:39:09.2259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4CtjOGS9ypQo1NKeBMaD9lXQ4nwlYnvRIVZHtFEnsDWk8aytMuB0Jdu3xFOu+MK38AUcMitUWn3EEnTOQKTMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8480

On Wed, Jun 03, 2026 at 04:09:32PM +0100, Conor Dooley wrote:
> On Wed, Jun 03, 2026 at 02:56:54PM +0300, Vladimir Oltean wrote:
> > On Tue, Jun 02, 2026 at 06:10:30PM +0100, Conor Dooley wrote:
> > > On Fri, May 29, 2026 at 08:15:07PM +0300, Vladimir Oltean wrote:
> > > > Add a schema for the 10G Lynx SerDes. This is very similar to the modern
> > > > form of the 28G Lynx SerDes, which is very much the intention.
> > > > 
> > > > We allow both forms of #phy-cells = <1> in the top-level provider
> > > > and #phy-cells = <0> in the per-lane provider for more flexibility to
> > > > consumers, and because the kernel code is shared with the 28G Lynx which
> > > > already has that support for compatibility reasons.
> > > > 
> > > > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > ---
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > 
> > > > v1->v2:
> > > > - move patch later in series, right before driver
> > > > - deliberately ignoring this Sashiko feedback:
> > > >   https://lore.kernel.org/linux-phy/20260529125017.ifqunh52gdzhthdg@skbuf/
> > > > ---
> > > >  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 131 ++++++++++++++++++
> > > >  1 file changed, 131 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > new file mode 100644
> > > > index 000000000000..993f076bba4e
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> > > > @@ -0,0 +1,131 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Freescale Lynx 10G SerDes PHY
> > > > +
> > > > +maintainers:
> > > > +  - Vladimir Oltean <vladimir.oltean@nxp.com>
> > > > +
> > > > +description:
> > > > +  The 10G Lynx is a multi-protocol SerDes block which handles networking, PCIe,
> > > > +  SATA and other high-speed interfaces. It is present on most QorIQ and
> > > > +  Layerscape SoCs. The register map is common, but the integration is
> > > > +  SoC-specific, with the differences consisting in register endianness, the
> > > > +  number of lanes, protocol converters available per lane and their location in
> > > > +  the PCCR registers. Some SoCs have multiple SerDes blocks and those differ in
> > > > +  their protocol capabilities per lane.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    description:
> > > > +      There is intentionally no generic fsl,lynx-10g compatible string due to
> > > > +      the hardware inability to report its capabilities, despite having a
> > > > +      common register map.
> > > 
> > > I think you can probably drop this from the diff, and put it in the
> > > commit message.
> > 
> > Ok.
> > 
> > > > +    enum:
> > > > +      - fsl,ls1028a-serdes
> > > > +      - fsl,ls1046a-serdes1
> > > > +      - fsl,ls1046a-serdes2
> > > > +      - fsl,ls1088a-serdes1
> > > > +      - fsl,ls1088a-serdes2
> > > > +      - fsl,ls2088a-serdes1
> > > > +      - fsl,ls2088a-serdes2
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  big-endian: true
> > > 
> > > This isn't a required property, but should it be made required for the
> > > specific compatibles that are big endian? Or are we not that lucky, and
> > > devices can be either?
> > 
> > I can make big-endian a required property for fsl,ls1046a-serdes1 and
> > fsl,ls1046a-serdes2.
> 
> 
> Please do. In that case,
> pw-bot: changes-requested
> 
> Cheers,
> Conor.

I've already sent v3:
https://lore.kernel.org/linux-phy/20260603132059.503527-1-vladimir.oltean@nxp.com/
