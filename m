Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADC235DA61;
	Fri, 14 Aug 2026 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786727266; cv=fail; b=oQu/FldbRGCbuxIQQiXDFXp2iGNgGGoL0QtED+4pS4EfCs0cfK1sxnxpDjGqeVvemlZLLVCXZmXCHHKc6jQkRKWSKKBhEf+Ugix4SCa8HuG5wu99g/vcuFjPEOpmsxaXtX7nixj1QR55UrrIFQ1aHVaA2M4436O1+JzxZSH35Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786727266; c=relaxed/simple;
	bh=bN3Sufde/wUNSn3gI6DjiyElZolhTrNS52X2fegkqE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dIau+1WScLSVx/5HafGouNorQAeIoEXLhsWVgYyvipwgkY881M90wo9DeuAdSIj0MjAwgtTfYhvFx6jXN16eLRCjiEz+WEa9QydQB1n1jKLBW2JnATNFHDYaTIPk4vf0cl7V2KEoye/3MPdeMm8BvZD8cCJXGN3H8TdQc/tJm2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JisPGIt7; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JisPGIt7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9JJ61KefXWARUSVefuPL3OOX+Gk0zrLdX25zL/G1kfSZ4OlyelmCorOXoyFblWOQ92ilm6gu7g6OTbYB+XqGicKn1W8EIUiIRy8p/56jqu5A5T7sVjaZCyHjcpAwaMomeMFvtmcbozs8w5i1G3WKhsFw8W1LpaCEhQJgAbIdEBiZG4oZ5NbXDwA5prB6DXIS6AvWev/GLaj+Ecs8pLfkXgHIBqqL32j4GxOpew7wb5bmnVWJ0/QW9FipnIzwexy2/kJ7uv0azOIN/b1S0aLyIuPlIHcHqIZKlBGhAAdUujbvakG+SETiGHUvHhfzh9CMcnbL04elwd3Sh/fxbL8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKA5aWLJul72YuQxwAyIyjI/3EktnEbmIypahxG6aWM=;
 b=yS5amqM38lUhj4hlk3mUTQS6Br0I6z61bwS8eA2rA8pxDzc7Ky2ly0h0XbB8BoGnaQ/thQlHGAo40SyufnCRTSDLXaBGn5w49aLythrOJIMzgLaQgeN1nXQok460XVRfUxSxeJWoF53tYCKTuDXIpYX4dlrnj3K3NgtiU+0lt4zsrMz47w16NP55jlZTIEONGxoR+PcvxcMphK14lU9QX5yctx8A1hcxYP88hX9zbIpr3bdgRSFsqv4r7iJygh3K6ULVtPbJngQz1QPP7sAdDxrYUWL8C/66pWsu5dRstIGqA2jdUbI4/0PAfq9kK4OVSRi87htfVOM09jTGpIyTCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKA5aWLJul72YuQxwAyIyjI/3EktnEbmIypahxG6aWM=;
 b=JisPGIt7ETjU623Ng3tbzKtIwVcSMBxgjV6qThZhJTUOsAr/h7f6XLYV2O7LRH8wRuzCBI73pfA9L8ZyMbvj+XcrN2IfwFcCG2Fx2Nk1GuXksRaTbEetIBHlPpDkwcYwf7cuk1RrE/q2oyOolCf1WojryFsK2C0zOF2udJA+ZMhHaSh1LbBVJtlknLX3+cCXmUE2pq8FBwQTYcvy4b6gfOvaYXmYoS93fuwRg32irj304Q/W2zLIMFk2RW2ueEUxx4Hx7KMb8R5z+nMmhxL4DGLqOAnF/V+AKsS5RClzKQhAPecdiAx7dOw7AyaatBzs9zLNPYn/mkcVyMZlO6ocIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU4PR04MB11754.eurprd04.prod.outlook.com (2603:10a6:10:626::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 17:07:42 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:07:42 +0000
Date: Fri, 14 Aug 2026 13:07:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <an9LVxaZR9p2B7hb@lizhi-Precision-Tower-5810>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
X-ClientProxiedBy: PH7P220CA0113.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::31) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU4PR04MB11754:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9c25a5-455c-40c4-ab14-08defa268d7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	f4JLvRmRFP0sLPBEa2YODoGXGqGgbnQKom5NJN53CORMHItPlsZNJYiy8uCiHxiEwQVArGlv8r+oK8eMpsoheXAah1L3LR8AfRiTA0J2yxLAds84aSVP7VJYyOdI2U65YszYFBgHU/2zk4xA6hGoxgctj9FDBAszUX3VfNMGFw/kTMGNNN9Mk0VEN0qXYIioOY6nDuk2gsvc5O0TlMRcwir/n16i6WIvaMcSurTH/VErEJjEEYKNZCgbHNR8sGxGU4rEivYKM5qaQTaFmHp4eZAiR8E8OMk0Zmx7TpK9A/IEPS3q5Np3E7kAGRX1YcJVXRBHeLJlAAVTWcjYkuQpzwhNlaOUfWhgfMlgfrF2YQKyFuruTjPNH9TFd5RkE8fRM+8v0oeyfO+9ynLB463GZvyCnTfSkybDampSUOHieROYDFZz4jamJUMmC25Ox/OycokoxX5rORFv/ZBqPQ2zHiZrhAgf8zABGK8XDKcOQgJyl+0vtqQKooGCnBdv4LjgRHsUsGqIyXI3CS73Ijcll65mJ7P38ixIJq+11JnEldeQJA3v7tjxm4dWHaNE0CzhpxmUIC2Ekq23EKXL1WYR1PmdPnb84E4KgAt3FCpKa5HU+ZDsI4eVRryxZHTXCP682rr2h1mdF9X32aiXxhM9+SktbieOS6fG05maHUSqTjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eakzzvENtp8iH1PDFR+bytFwO04TC/a24L72xTDgcJ5CcJy4Qr8hY/q2wM/r?=
 =?us-ascii?Q?EYv06eO9+wZtgDhfKvdmHGRS+frx7KxbU7HbhcyjqqaBCTlMT6EhYU+XlQNA?=
 =?us-ascii?Q?IoBQ3+7oSMWTikNNxU9UjE50/v27u4Sp/71UW/74bbOtgxVbhjgHjbpDworK?=
 =?us-ascii?Q?dlmoNgFD7a+xP2I4LZ8ugQ965wd8cPaaxezPTZR6jHkbrk8lEqKP/2WDx46O?=
 =?us-ascii?Q?mSDlmWvUkLWORl45I3ALhewrlqIZ2lyrZkL1zHU/e6uK35Dn4AKgwd0hUK36?=
 =?us-ascii?Q?dDuErkAg3Q5T3ZGQVtd3Q03HgTihlheRjkz3gKWdZj1VgNCmiBazyroJh7ui?=
 =?us-ascii?Q?HpI1UmwxhIoz5hykJSH4fp2dC7Zk4h6AmAR7C0uacvzgfxm2/ykqbcffbbUH?=
 =?us-ascii?Q?wJzcQLi4NmxisuyxPbW8cLhnbE+n5FVfTU8xrT23/PSkjKGJx/zmrn3i0Ri8?=
 =?us-ascii?Q?KpYxm0XBwu8//bzxQDkDXd3UzuoprbylbKQIBK0qihBPHKk2jHTeuEHO4gPI?=
 =?us-ascii?Q?yQrDzQ57uSDnqpC02pKDb08lsO2N0ydZWUh3FjeAK78wqK+1fAg5ojw+gdXH?=
 =?us-ascii?Q?1F9GpgugBeldP+TWudpx+POq47SNjYvi0IopYHqTFLXzs9Qw4TcXCbWS4ysA?=
 =?us-ascii?Q?9ISA9IKKki95BYd7UMH6lYZgwMZmPpDy5lwjlqFYqHyKyG9wBLjXddxhlNG1?=
 =?us-ascii?Q?iRcnbEABQnxy4bicN9xY5Ow0ICNd/nY1ZeNV7R7gmDjEQEKQ7XnItrlfyLED?=
 =?us-ascii?Q?oRnjJlTyR5Ys4Orh2TI3S3U4zeO0FU15JG512Ib+Xm8q2tZTaeU6YuOFG6Uy?=
 =?us-ascii?Q?0MkixcnH1D+lJLQOoPsgm9eapdcFq3s8VshPkUMFjgjEyQn/cG2C+yhT6VJM?=
 =?us-ascii?Q?4g3+APID6zL7cFspoWObKsh9GWzx689XqlF5T9bOC6GAAufzdVMs9DIx15KA?=
 =?us-ascii?Q?q3rkC7riIgU18Vt8em4UNHRH9rq/BPSQ0TAqMAyy/ir/V7NvS+xD2+2Sk4Mj?=
 =?us-ascii?Q?oxt1gBsIiETt/zZI6GSWPygakaFNCQngmNB3i8zdYHHfFZFwJb0NBmKiJcAW?=
 =?us-ascii?Q?bNKsIbAv8Xg+L+tHc5T+AOdj8LIO2jcuTtj+etwdDpZ0elrHi8K9yVNFYZC1?=
 =?us-ascii?Q?Nvcq9aCFOIWi/yhe/KgmVXDKZmXV0R5fNPiOPlQkx2KhrWMD7dikhOtOrtnP?=
 =?us-ascii?Q?ZVba7Vm82/AVghyas/d9qtul3DlfqBCY+k/Kbw+hMLul2yeNkkR4pSdTmfez?=
 =?us-ascii?Q?eMQI8iTNbdxsNmwHutsOR8lrrMrb/yhOjuhQgMtaljHGz5EyNUvib/Y/bnpJ?=
 =?us-ascii?Q?YLSp64LEtynKnVqPawITP7VYH+eHCTF2oLhKHheFBXYbPv7m+VDVGVWEn6lC?=
 =?us-ascii?Q?76PfoP/CPyfH1oREaaszf0lxJKPaZpIc6usvO3fFJ1R3h7DHa8hIlVvxw8bs?=
 =?us-ascii?Q?NXA78j7vCSkPIROPla2AGDRm8AAYB4PGKyVz9d5CMG5/P4UH6E2H1LMc29Yq?=
 =?us-ascii?Q?Ezzg32IwzXbB/hRl520Jys0yk8nwJDdb8FjJlSUb6WDed2SpRN+VhjEFPond?=
 =?us-ascii?Q?NEPCNACGr87TNPeLbziijy0ADAIJveF28HbxQCx9uWYvIGEg8KJg5s8Qc5lE?=
 =?us-ascii?Q?0OfJmb2ElFKf4NFygI6tlcYvyytPhkGqpXTkAGRQ5n9onIjKXS2ISxfxVm/q?=
 =?us-ascii?Q?0kfvE13SbxWFiSFiKLKXidQwe1UiZLJbBcju8trUiGp7L4ORizjItZCym23q?=
 =?us-ascii?Q?15pQkUB64FqWZRpWJrUiEAzGE1lh5WPvmazNAUV2x8KwSTT2yHXV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9c25a5-455c-40c4-ab14-08defa268d7c
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:07:42.3892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxRDznTcA6ugcxKthKLLFRzgVXIM5Qy2XAkhyJRRnHTnT08UA5C4NlArfmFJhoIlUVjHfZyT2dsOccaMcFCb2ZaZZvQB/ajGx42nchjAcTVp+pAxXY3FG3LWiSBJIFTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11754

On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> IP. Describe them with two boolean properties.
>
> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> capable design is always IBI capable as well. Both events are reported
> through the controller interrupt, which is therefore required whenever
> the capability is present.
>
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> ---
>  .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> index 2caa245a8656..07e3d0b4d767 100644
> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> @@ -32,13 +32,34 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  xlnx,ibi-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with In-Band Interrupt support. IBIs are reported
> +      through the controller interrupt.
> +
> +  xlnx,hj-capable:
> +    type: boolean
> +    description:
> +      The IP is synthesized with Hot-Join support. A Hot-Join request is
> +      acknowledged by the same machinery as an In-Band Interrupt.
> +

The compatiblity xlnx,axi-i3c-1.0 already indicates such cap. Do you have
variance. such as

	one Soc have two instances.
	instance 1  have hj and ibi cap
	instance 2 no hj and ibi cap

If new version support HJ and IBI, need use new compatible string.

Frank

>  required:
>    - compatible
>    - reg
>    - clocks
>
> +dependencies:
> +  xlnx,hj-capable: ["xlnx,ibi-capable"]
> +
>  allOf:
>    - $ref: i3c.yaml#
> +  - if:
> +      required:
> +        - xlnx,ibi-capable
> +    then:
> +      required:
> +        - interrupts
>
>  unevaluatedProperties: false
>
> @@ -54,5 +75,7 @@ examples:
>          interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>          #address-cells = <3>;
>          #size-cells = <0>;
> +        xlnx,ibi-capable;
> +        xlnx,hj-capable;
>      };
>  ...
> --
> 2.34.1
>
