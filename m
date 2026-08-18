Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E642903C;
	Tue, 18 Aug 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787071933; cv=fail; b=RuHw2Zx5wgLU6jQ6qejNTa4VKaJPrSitnQTD1R5YALQmyGhJgUx8ZqWwwj1r9ZXj3HPtqRTN8csGCNZDTjZfEphDZ/HsTACh98c0Um4AL61uz1IHNcaNrC2wosJuCXSLGugmXZpsnf/1lWUv/sB9gGy67C9eWmCbya8j6mKaixo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787071933; c=relaxed/simple;
	bh=5Lx7VQj+B0Cijq6yzzU4TA2qWI+Mwf1DERZXY0FDiqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mwLaQ92gjeRwL36mjQq13wBV0NXFR1mmEMmXrNqq/1OMRTsFQzD4/mG1gp0derEep7P1Yi3R6fKRhZ+hAgdfZ1AYmpACmJI9Hcpi4762HivyFpc7ujqMYdzjzjkIKYEoNO93v+g0P5dnWnrAFdS22fk40mWtv5qGl9J42WTqQSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lyYvcwo7; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lyYvcwo7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yihH+/EuuZMJI5LizsJYqoT7CXx2n8zetsVrQ4BLfq2aiuCf6emd173zPWt5OGrtk1BMSKF0h/G8olJfvHz8ofwO+9lVeUbf5ZCmTInLq/B775XAS8Z6dPhrzwHUt826RZbMz3kVl/DR9DchwjDTx+37y2BOvnkEPDzWjZh17WRKUUgCRfzc4hkGHMqzN+HNXnph06cBRFWGqL/kSgkLYnK5EwaSfvE7r91KrHBYP3/a4/AH61bzcmI1fiec1PrCi71IWqLc4DeEBo0eLpmdWgCG09XWK1FKLMgI3Y+o5f3IDb4y+fKgRp5tg0pz8zaMPcA7mtJA5JHWlmNGmAN5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ylNCujUUTybgD7uGYmyXO1OcdizBpTGAjfZXZVdgsM=;
 b=KF06sVm8czUFQXiWrAQr4AAHohtyziwDZpxG+1Isj2iInA0wVEkIxd5dIcFBZhPROSyKg+FJAI1eORiApcfgQIZIVIHQojdRAQcBuyN+gv5PuxolKbm3MrDagMTSG/23KxiEYJ21hV6qFpWWNX+PodixfN8ROQgg6Kctakesrv8KVApTxXZ6jMyEVygIxdk5/sd7mqWqzwBFXvDTCFk5Oz+TmoYbMPz+WwTj3NsHzeupnm3Gtp74FFZIwagMo01QufyvkdSc0KwZsd+VKWhwLFSULnfZvTmWdVNBq5k5FPTkK3Nd8XJbakgozknQqTTh8LFTAB/ScFYJ4adDMwCk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ylNCujUUTybgD7uGYmyXO1OcdizBpTGAjfZXZVdgsM=;
 b=lyYvcwo7DhkAXU0U8rwYvgLp+TimsI5FEdvO8XucfxvadpxftbkmgDgzNEkFKwQ7Lm4ZGl1+xlsaC7WUVKSJl3le+R+2B/TTN3EHcrwPYeQ3xvMSIpu7CT+R263k2S+qcGUR8nMF/KCdzV0kjF0SER4t9A91h8cV3XaXJOpq4nznI5f2xBdhbI5s6REWkrlZ03EypmwiVgU9KjksnxSyHYdOWE+gWbvKPSHbkyjc6eCFhVI0N8vyeI2l3Jdztl6pfg7y+42PTE/d6f1ABWzf2SSdTLHlJeZf5qErTQWwz+ThXnu1VXFR8YdgVHBNDrVFM5QH6PpiCQsbhvhdYIPqsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10525.eurprd04.prod.outlook.com (2603:10a6:102:444::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:52:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:52:06 +0000
Date: Tue, 18 Aug 2026 11:51:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Patil, Shubham Sanjay" <shubpati@amd.com>
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
Message-ID: <aoSNrlDOLNXg1Xfv@SMW015318>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <an9LVxaZR9p2B7hb@lizhi-Precision-Tower-5810>
 <c608fce5-872b-43d7-a6cf-f9e49956dd42@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c608fce5-872b-43d7-a6cf-f9e49956dd42@amd.com>
X-ClientProxiedBy: SN7PR04CA0063.namprd04.prod.outlook.com
 (2603:10b6:806:121::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10525:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa3428a-7c62-4ea5-8524-08defd49095a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|56012099006|10067099003|3023799007|22082099003|18002099003|4143699003|11063799006|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	H+pM0hSdU/70lL09XYIfape9QkIdQ6W1vutb/eoOSWOWvD1XFu8kSsCmKm7j+NH8cttk8tdOBxnB9v7t8Wgkiii7zNKz1zPXifPhtFAZVSJYeTt+qnmukxBt1l7EBiWw6W1I/UIfgd+yXVJ3AXUDdKhFC6ubqEssk6BL2vTsxQxY1vVqrxpy9uuz1IBUvLdWRycrI/814sChjSxmKVsS1q9qhbgm5HMEp466MQctdNqGriP2nn2UTnbv8Z6eEdfoKGSIcIOd82wanupTTXFkAC1WsOlKAWZxGHsP3wocdG/lcZpY8Z8sNYny4FQfPWd4z6vMkdsrQQAJK88QyudFxE887jnTxK/jGbf5dvQAebxIE2bNDw3ZbzWK5ppvqm2XSROPbPk/YsFCaPCeUqT09Qpwc3hhAbLK/o1OZkTnt92oSyBZ3f0+vjOwT9YJ9hPLAJtIxXkq5ncVluG/iiLJxzsiP47SqmYZfuGQFMTb2wIQ0kAMMC+kNCl2FY26R6FKCpXJgtkeOti/+TPSD72XMgmkkS1GsNYTUq3Fat4UbVmwHc8PNZww/euHDj/HHysWlDP/QquEbMQf4fwWuX8LPPqMLPUeWQaCrRha5oUhje+qxoz53fY2o670i8vnSBVjdVPoVNRcsIOwpUTNk1WmOb1s4F6VNiyE0t4XuOE4mEM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ojAfU4jqFvJ9Wlp/9hoJEX/kFKwCKB3J2Vnp5EypZR9EFbihQKgwhMM/21pm?=
 =?us-ascii?Q?4cHBXs4RhNSgpauQprgE9LeIo6cvc8oMW5cMgSVM1G4UCNZ7a/YsE8yv4rqK?=
 =?us-ascii?Q?JVzaEHfd330COYmKxy6vFvovwZxtxhOStyHQy/ejvsTzi6dkOO7E6vEcszB0?=
 =?us-ascii?Q?RVdLR0DqHpSXzCOl4voxsO5HYf92KCYW37qlt3KFC+bfio4RnN+hAM+Nje9u?=
 =?us-ascii?Q?FqrjsSp5YwqSoxHSpj4FT6ZPdMogup90C0rijTTQkGBQW0noXFIKNMgOmijC?=
 =?us-ascii?Q?L6Eh7VSf1ikzemegiPMCmm0YVqpa3LqEebA5csVRjISa0T7eYDlIisbZFAOD?=
 =?us-ascii?Q?ZlDnsT/c5Hn1n1E+gt4iv5tFpbGpQdHJcrxya5YwH24pCDV1XdpjMIFTHq+C?=
 =?us-ascii?Q?vzJlxPsHIXVMY5TyxqPUfSOGNYRlKWKhC8HiJxB0RYGoTZ6rl69cl81L6tDu?=
 =?us-ascii?Q?75fQNCQ2+ZkrfLiBLaNb/83Mc2NrN4nxtjDv/plDRMI3pH6oBxXZ/1gS0vZO?=
 =?us-ascii?Q?clYu1qK329lXDpKMSCGvoUjGmWp9jdm5GCERcabKMqXdN2P878IptSqBO3wd?=
 =?us-ascii?Q?5TYvDVk6g0qlHg7LHokjsoza3NS8ixYZxo4UC2x+KFRz9Zfj8nknbNCMpFFW?=
 =?us-ascii?Q?/iZkJ+LeUWwBHc5GMtQ/LsvgNP4V2Epf2NQqXc5ORYWUG0fmQeAQaFonXUMO?=
 =?us-ascii?Q?urbFCfTdvcqXK9HKjpYPDgmmn2GxBhyuyVZSFO6+0EAB5ZiWnU9Ir+Gt7M4Q?=
 =?us-ascii?Q?OtIPn4X1AwjdzHn1ceSURnnhB09ODod3JtEmci3rnp6RrUKLVtDmwIPMLYLx?=
 =?us-ascii?Q?n9rZdgqwJTVHqjo9n0ysCrmEt5qy+ZCL6Bqcy6iky1W9dPv+RSiShNCUA95L?=
 =?us-ascii?Q?vhGf9utPmzTDVOnnqRw9GwnqcgMxf/PBT0nEVr81iqXLudGgoPPc17O9kI0d?=
 =?us-ascii?Q?BWyfid5OYetjdm6s1IBy0UjzPyuvrRccIgtV6AnDteTGgpGtAUsXru6eQ1cr?=
 =?us-ascii?Q?V6UvFVr31nIlEzc/vjLaI6YdU3zoA/+Rpbv3yzPtpzLeOTUJ+Jp/bcrw5y/T?=
 =?us-ascii?Q?BZ0WtTpUh9vm1Jdxrbm5AL7GtOP3BLEUnS8LhHtm+Dcz9F2EjKUairODFq4e?=
 =?us-ascii?Q?5BoGy3NBayqNdDtWQsNhUfcZvc0Y3t08TI2b06Qmb8tkGhgwQmPdrCKvZLVt?=
 =?us-ascii?Q?+yACl8BkXpxc/4Z42hBwqpsO6Fdbiku/LLMnTbNu0t0dlRRAf76QJAWd5aVr?=
 =?us-ascii?Q?D4vrphY7rswK4dIK84R6elCLfMfDPtCd972VG7l5WP5T3B7nbsF9wWUaMlVg?=
 =?us-ascii?Q?9qFnfIkqP3+p0aeXLfeQwNIXeSnI4qobw1nsovgQtHQdbVqi9Hm/sRYwTjBd?=
 =?us-ascii?Q?PA7IsIiT3E0d3q44Q4ThNQbGZVC2ZFChBlM8efd6tzjXSSgXt06PahuT891p?=
 =?us-ascii?Q?zcw9nOydDXzJBGUOJcrNQRSsvLN0v9YJpEQBJ3/VXlaDgpWGBJuVY0+DP5RV?=
 =?us-ascii?Q?OMJYRwsYnoz0yiMFDjESVHLkXoVoA+0Pqu+G+58lcsW03jwLklGX3Npj3USy?=
 =?us-ascii?Q?sJMiAuS7vFFvffkfCUqwm+wehx7KYgFOejIFJqAGX7uU/yv20le+Lw0Jn4OQ?=
 =?us-ascii?Q?5G+V7/7CR4BkZ4Pd/mmNF2UgSBjomxkUXNVAMfkiWNmiEacDZD6y8hLZqtNH?=
 =?us-ascii?Q?mpbdRXq95nLPMqTt7URVf4l8vlz43/f1eZWKEM2GAWr3587TZ8LBFiQc9WUy?=
 =?us-ascii?Q?ATbIsPaIgTyv/TYp7EVEBSAo8YWWUxebctesdwXUov2yZHqaEwKc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa3428a-7c62-4ea5-8524-08defd49095a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:52:06.7501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lOVZVSYrmNA0aMunDfWWoW6bC7aeZKlkFev+huCTGUsYhKoIsqL4c9qGDaWV1ym51staf/Lz2cUQI2suEHM48qfEdlyETqDSXzO+4jdcK37zH8DSsuqew4LPz6d7h5q6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10525

On Tue, Aug 18, 2026 at 05:29:19PM +0530, Patil, Shubham Sanjay wrote:
> [You don't often get email from shubpati@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Hi Frank,
>
> On 8/14/2026 10:37 PM, Frank Li wrote:
> > [You don't often get email from frank.li@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> >
> >
> > On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
> > > In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
> > > IP. Describe them with two boolean properties.
> > >
> > > A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
> > > capable design is always IBI capable as well. Both events are reported
> > > through the controller interrupt, which is therefore required whenever
> > > the capability is present.
> > >
> > > Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
> > > ---
> > >   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > index 2caa245a8656..07e3d0b4d767 100644
> > > --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
> > > @@ -32,13 +32,34 @@ properties:
> > >     interrupts:
> > >       maxItems: 1
> > >
> > > +  xlnx,ibi-capable:
> > > +    type: boolean
> > > +    description:
> > > +      The IP is synthesized with In-Band Interrupt support. IBIs are reported
> > > +      through the controller interrupt.
> > > +
> > > +  xlnx,hj-capable:
> > > +    type: boolean
> > > +    description:
> > > +      The IP is synthesized with Hot-Join support. A Hot-Join request is
> > > +      acknowledged by the same machinery as an In-Band Interrupt.
> > > +
> >
> > The compatiblity xlnx,axi-i3c-1.0 already indicates such cap. Do you have
> > variance. such as
> >
> >          one Soc have two instances.
> >          instance 1  have hj and ibi cap
> >          instance 2 no hj and ibi cap
>
> Yes, exactly that. The AXI I3C core is not a hard block: it is soft IP
> instantiated in the FPGA fabric, and IBI and Hot-Join are per-instance
> parameters selected in Vivado when the design is built.


I suggest put it i3c.yaml

capable-ibi:
  - enum: ["default", "enable", "disable"] to overwrite auto detect from
hardware for difference instances case. put default here to allow overlay
dtso to overwrite it since overlay can't delete property.

I suppose not only xlnx have such problems.

Anyways, need dt team to provide suggestions

Frank


>
> >
> > If new version support HJ and IBI, need use new compatible string.
>
> The compatible does track the IP version, and a future AXI I3C v2.0
> would get its own string. But IBI and Hot-Join are not version
> differences: they are independent build time options of this same v1.0
> core, so putting them in the compatible would mean several strings for
> one IP version, growing combinatorially with every future option.
>
> Thanks,
> Shubham>
> > Frank
> >
> > >   required:
> > >     - compatible
> > >     - reg
> > >     - clocks
> > >
> > > +dependencies:
> > > +  xlnx,hj-capable: ["xlnx,ibi-capable"]
> > > +
> > >   allOf:
> > >     - $ref: i3c.yaml#
> > > +  - if:
> > > +      required:
> > > +        - xlnx,ibi-capable
> > > +    then:
> > > +      required:
> > > +        - interrupts
> > >
> > >   unevaluatedProperties: false
> > >
> > > @@ -54,5 +75,7 @@ examples:
> > >           interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > >           #address-cells = <3>;
> > >           #size-cells = <0>;
> > > +        xlnx,ibi-capable;
> > > +        xlnx,hj-capable;
> > >       };
> > >   ...
> > > --
> > > 2.34.1
> > >
>
