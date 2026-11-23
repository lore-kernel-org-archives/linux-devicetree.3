Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436807;
	b=xQ70i08Vq69O1teGNZFX7/TJ65188/26lm94GWpFuMOyAFE0RPG3PKaetAzIfWQVkblK
	 58oM1tJgOMvq+d0QPFn72KLQI8xiOa06vUxcML8gMkW5+P9VO7+ai1QwH/44aKPTi7v3z
	 N9RJPQgGNu4sbsAIsz+9RXz7npTog+PJNaIbbBiUC4eA7QMRtrw1PTCbLGemg58fhQKPS
	 eq7XjgZeV9poyPOjR/cUzOQpSKXespA50cbZr7cXzdxQG2bn3mAqPU3PXRfT9RRfjeaJS
	 EARxO1VCOP4kgagS8Du244siLwmrWUgP/GpFSRccmzlGH9/ex+nl9cbO+d9o2iWGg7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436807;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=;
	b=JtubKnz5upgDWygLxgQNd24gHCgFuMFOkLzaqADjnkvOEM+LGEop6iN+vDDCw1LrjZaq
	 J9RANlrq3kj5mE4hhUDwztuWUv5p4p/krXzw2n/ozlOZ2nG+qW+V+OKJy7ffERQHOH8B9
	 aZqa61f0Q2Vf2xyjoa/fLPaYis9fl+1TEqG5PnPUPd56saIgSmu+lz6ZcQ1CD2vvl4fVg
	 HZxH8Ihg+4Ql230w+iNBarzC3/HQWirnQMcYNiOl7CTy4HpAZyEvSmmtyELdLxonnwux7
	 28bifqtDW10cCnznDwHKnkZx4Mpd0nWr/auBqIQSQKo8cIWyFetwPrcNkQmbGwXXH7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IrIp5JEl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.100
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021100.outbound.protection.outlook.com [40.107.130.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C93606A331;
	Mon, 23 Nov 2026 12:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9C93606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=IrIp5JEl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIljABagW/ihX8GavO5eGVx2cFPbGWi7169Q4bXcRN/QGnmiO+/Yn0Lr+tQRhcKklMULdpR1zeIUzAtjVirJa1ODifD3eqoGOxe9v8Wwt/t8ByzuRLLuh0kdJ1UK90VSKlwIfoUIRePJ7AbB6Houey5QV6k8hHoWVcdm7suDKqYcr/31aE05t0ftGQk5XkTStI2QIkYZGABF9bkw92Ah1YQGUyqEGWRM0m5/nLcW6cZl+yOFCVKUl3wiozkpqReNaWgiI5gpx/dKiR/Y8zLm5sfxEl+XcJQwPEAWOgS7ak7HlrqNjLAbYMRgk+6PwkuCu0gD7kCZWUuJJs5MIPm6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=;
 b=cKpN1GIfqpJNFMNen+0VWAtWRyxbDwyH8YBY39IdSeqf340WkcrEk27oMdaCqS9Xs/lal+qwUAVRQvnhcb6IbopCEnNmqKILBaG8Tw1rkt8wkSi/EY6piVQkeIb/JKF+DK1efgxZAWJCYGoOKeZVgW55nXlfaAtt41yUokjQHtFbeMnBUzMzAXT1tT/QJm7hTdT0k6l8xHnRcaKmYOU+Q3opNw5yFtAs2J8AvS6u/6pqg1uTdEhsYuyNelHK6i7NWIBYofcCn+weNAvXFm6y3Mx2P2Hja0tf2kXHheDM6HBeP0/E4xAtxieNEeJfsSSwEnNHQeCvj3FYfKYRvUYD5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeQp1wisiQ5PIuUYsIhyV3xmd5MuP/0N0dRhOhb/F8k=;
 b=IrIp5JElD1mo89WiCt/rhULN8bPVPfdhZvRFj8dDn7/dsn9vV6hx/NPMOdWu0XBV3r/Rr09lZxrpP3PQLac902A1o8CKfeZy8RAc6wb6G66OgzK7ij1ZkNiNxOFVZMQddVBtd/6C5XDTP2991U/Q4sbBye40xqs3VkrDQdZcI5L2e6q0Mb1cgjsYgOhwNsntDExQbKLRpL99WCJCQXXc3weTV69GebltZR5VCG2S5fmx9RVSWzsSZHQFn8Ll1w6tAk8Xmv4TJFfI7LufHQ3NTsgkxtW6oj+mGanyPMs2FrGxhoYhMZwIw3CmX818YUs5OesWLq0hF2IvHPb9rMmO9w==
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:b10:105::21) by DB8P195MB0710.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:155::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 12:26:42 +0000
Received: from BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893]) by BESP195MB976599.EURP195.PROD.OUTLOOK.COM
 ([fe80::5d6e:6efe:9bc2:6893%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 12:26:42 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Benjamin
 Hahn <B.Hahn@phytec.de>, Christian Hemp <C.Hemp@phytec.de>, Jan Remmet
	<J.Remmet@phytec.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC
Thread-Topic: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus
 FPSC
Thread-Index: AQHddbkBN6rr+J+coEe4H0CDnunHyrc3DkAAgASSF4A=
Date: Mon, 23 Nov 2026 12:26:41 +0000
Message-ID: <ecec2b828550453f08e3b4900ad6149cecf5dae3.camel@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
	 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
	 <20261120-successful-amiable-porcupine-cef7ae@quoll>
In-Reply-To: <20261120-successful-amiable-porcupine-cef7ae@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESP195MB976599:EE_|DB8P195MB0710:EE_
x-ms-office365-filtering-correlation-id: 70e3af5f-945a-4305-27c4-08df495d07ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|38070700021|10067099003|56012099006|11063799006|4143699003|261026121527099003|261022075727099003|261021123027099003|261021135927099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 rSQTAUoyOz5vmzaMyV2sDRCg0cbqL5e/vJoRAG+53lP54Qd1jREW4EA+KlKG4aWOZ5oZgr/en+lerE7YhYhS6QFFNKRY3DIbQK7POCpyQ80yBrjsSD3I/OfecWZBGddsXHcGStoCy34GTuP/mazSPRoUQMokt7RpGEJBoLdg2u2NYVoL8UbCCmYaD5nPEHeJl+M1jNTULbwbBEjtwz2jrPYU6avD8kfWPd4lQ/3hMMohfySrydyxnzCJe5j+yIKxvM9Qg8tY7MIM7YIv/wEPbeG06nxUFxHeu90ald8mXNPDdn2AH9IqDOboKtC+vqo88VKL+t+3ZQHUmBnN9ADaYSsDxJgNF1ZbFEDKfGbooL66XQXJ/jyxSTKTLY/g463KphPLvCeHEXM88c7T8weaC2Ev4FCXW46FLs996I1fFZUz28ZN4NmiMiy2a444LbNcAB+Vv+BxN5tNEc54X1ls8B2mh6k+dFz/mAtAT7WY99XC95JRmPLVsUu7ril0gyhbgsh9cojDNYSG+h6Wj1WbCgMxFxdBnjvANm/Wddu87mZOMA9qbO4IYu7FOD4sllUoNP2ZFLVVptTFYKS8IrIaos5baEnF1CFDe2h0HlVSmy89aCj/+qgsR/XcCbtaMUTrevlxKSH6q2BNq+CR8JoLs+tcD7CmlGgysYQtK0JFZG8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESP195MB976599.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022075727099003)(261021123027099003)(261021135927099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y1ZEV040T1NQSUVLeDJ2TkEzejdVYk5aZWdwU24rU2hRNHJkaFlINnNkR2pN?=
 =?utf-8?B?cmdheWtISDFCVDA2YzVGRG95UG01b3hQb1FwWmd3T0J1cTE2aUtReUhDeUww?=
 =?utf-8?B?dlhRTjBUczBYTXZaOWJvRURuNHZXc29QL0JBQ2xmcjE0TTBqNENRdkpLN0R3?=
 =?utf-8?B?UmRtcmdxK3lsYWh5ZGZrbGIveXZWWmw0MXdRRnJqbi9yUHEyY1AzZ1Rmbi9m?=
 =?utf-8?B?a3Mzd29GRFpsQ1lCdTgwdG5DNW01VnlSdk9oODFkaVI3aGpTNWk1anI0bWxx?=
 =?utf-8?B?d3dESGd2UmM4azgzYTFyQjFKRy9OakdPbHkzZ05XekRDd3Q1RUw4WGFiUFN6?=
 =?utf-8?B?Y2lxcUZFeXFTSXhCMzB4bTJQUnZzSlN2d1V3S1NCTndVdjkvaW9WanJ2T0M4?=
 =?utf-8?B?L0xUcm1RMEJoQUtSaWpXQXIxdmt1NktiZ3FIOWdqVG5nbHZZNUR0U3lrcnRI?=
 =?utf-8?B?emVYK2FpT24rMUI5KzE4V2I3bmUyRU1lKzlyNHlwSHd2bEVFZjJlVWx3Ym55?=
 =?utf-8?B?U0xRb1BuSjR5UGFUNEJHWmNYWjZIb3NWVVcvMU1STGFMdGxERDJ3dG41UXRx?=
 =?utf-8?B?b1NBaGpNdnozdG5nUUtqZFVyb1RsZVFQS09LblVKOFVpVm1EL1RiRlJvMll3?=
 =?utf-8?B?Q0JnNXpSb2pjMzJuTnRIUTF5Rmpzblo5aklqS08rNUtPbTBJRlFNN2prODVO?=
 =?utf-8?B?eVQ1R2V1S2Q2ZEthZG9vbHdNQVNSQXlhRkNMZXEzeC8yYXVIY0pVeGx0S3Jn?=
 =?utf-8?B?TGpNSmEyNnlXUXVxYkMvUnBaQnVXUldCUGx1RDlCTHUreCtoVDFJbGRBMEgy?=
 =?utf-8?B?MlhMaDVPeCtCSmlFR0V3TURLK2tPT3UvbFo3NUltTjMyTThTNjcwenFoZmFD?=
 =?utf-8?B?aUtqY2NsNWh0cHhiK1AvRk5EQUZWWmJMUTFaSUIxVEVnbTFPd2lUTEoxT1Bt?=
 =?utf-8?B?ajFkMnZPODUzR0RPWWRtK2JmRkNLc3hNQm41bHVJU0kvZVNPdm5xN0NXYjgy?=
 =?utf-8?B?MjBOWGFQM1U0TXluNVdiN3lGSHFWYWovS3hEMXMrcm9jUlhEdnVWV0crOElQ?=
 =?utf-8?B?VDRqL2Jhdm54QmMyOGFOcmdHVXlCWldSMzQyY1FoOXYxUmVDWVk1dCtMb1N0?=
 =?utf-8?B?RmZmYTBUWUltOUVrM29SbG5senVqOWcvemRpZlZEMWphd296NmlGZnlRSFBR?=
 =?utf-8?B?amZLYmxDek5QaW4veWRPNE12dmtZbFJmazdqb2dCajRDQlFZZU9SZTNSRU9G?=
 =?utf-8?B?Q1JNSjVzdk0xdGNCU0pEODhQOHBUMExkRmdkNHBrS0lKWFVodW8xTVJ0Qm1u?=
 =?utf-8?B?QTJXdXdFOXhYZ1VhaGphVDdkc08ydzdSQnVwcXMvZldxdnQ0Z2F1SC95VHRP?=
 =?utf-8?B?SVJBcmNqdWlHemZreFJMTVE3U1pENlZCZWQ2R3RBZ1Z4bU96RGM2VzZLQlR1?=
 =?utf-8?B?U0FnREQwVEx0NnhXV3ZFMVArdVRIS1h0UUV5TkcyMUlQUG9YRHNmem9CM0xQ?=
 =?utf-8?B?aDVPbStpZCthTWsvWWVSNmIwcUMzZ3I4OFJzUnVJWkJjb3NWWEgyd2xYVzN4?=
 =?utf-8?B?OWNpZHJyWndseDNqdmlpdkV6K1M0U3hpY0prS2tzYTY3NDZJM1F2S1BaLzc1?=
 =?utf-8?B?ODhaaDNYZDIwSDRDSXZFRkV0cm1WOGo3M2NIK0ZUTU9PR281RHJ3VmlHQ0J4?=
 =?utf-8?B?TlVaVlRnYmJ4VVdWRnRJR0FTT3h6ZlZTTmpQYXh3WnhaZk5mTTZUR3l4Rmdo?=
 =?utf-8?B?SFhqWEdCamJVY0FqK3dYSnE3YzVGbGI1UWxCb1pRVUZNajNUMkU5QnVjSHM4?=
 =?utf-8?B?WmZwWERWY1VqRXFETEc3Q3lMZnc5Rlp6eTV6aCtGU1I1Q1dzdHk3NmRUZU4w?=
 =?utf-8?B?T2NsWFpoYlF6MU5UTGtoVlFiV2pzRlliRTN6L3FiODd3N2lVeVBHckFWTnR0?=
 =?utf-8?B?cHp0ZG9tNG42ODhUZ0FKQTQ1TnZWSzJhUThDaXpYT2VwNDJMQWErbk93eUFt?=
 =?utf-8?B?THNCdDdldlZEUW1ycWRpanlXaEptaTl5ZkRleUpmN0pNT2c3RmJISFI4S1lu?=
 =?utf-8?B?cGxSSGcvNjdqZjY5OW5qcnhzUnJlb0hrTDgyd005VDNHZktMd0hQZi9tS3hI?=
 =?utf-8?B?U2pSOTlidTJpMmJNbDVXUUZveWlYSGR1aTYwWjJpRk5mNFRhYklmSVU0QVVB?=
 =?utf-8?B?WXc1Y2dlYUxtaVNMTDZod0ZvaDVqOEVmL3k4OWJ4Qk5xcEtiWmFnK1NqSnpD?=
 =?utf-8?B?Y2doTUU4UTFOdER3dkkzL3YwQzJSUFBSa1B4aU95Z3dRYjQzRlZmRlRYNHpJ?=
 =?utf-8?Q?6BAzh4i2SjkHZr757R?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <988C7A47A4E42044B57D28FF134810A7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESP195MB976599.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e3af5f-945a-4305-27c4-08df495d07ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 12:26:41.8872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Aw0sQRwRSJbVzsmCfwnqw2go/FDPneYOeG02mN6gr8LgTqYd4t6m9SsgeHH7J8FKvUXtx3CgPObN9QcqrN2/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0710

T24gRnJpLCAyMDI2LTExLTIwIGF0IDE1OjM4ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IE9uIE1vbiwgTm92IDE2LCAyMDI2IGF0IDExOjU0OjQwQU0gKzAxMDAsIFlhbm5pYyBN
b29nIHdyb3RlOgo+ID4gQWRkIGJpbmRpbmdzIGZvciBwaHlGTEVYLWkuTVggOE0gUGx1cyBTeXN0
ZW0tb24tTW9kdWxlIFsxXSBhbG9uZyB3aXRoIGEKPiA+IGNhcnJpZXIgYm9hcmQgKExpYnJhKSB0
aGF0IGpvaW4gdG8gYW4gU0JDLgo+ID4gCj4gPiBbMV0gaHR0cHM6Ly93d3cucGh5dGVjLmV1L2Vu
L3Byb2R1a3RlL3N5c3RlbS1vbi1tb2R1bGVzL3BoeWZsZXgtaW14LThtLXBsdXMtZnBzYy8KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogWWFubmljIE1vb2cgPHkubW9vZ0BwaHl0ZWMuZGU+Cj4gPiAt
LS0KPiA+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbCB8
IDE4ICsrKysrKysrKysrKy0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9mc2wueWFtbAo+ID4gaW5kZXggNjU2ZjI1OTZlMWQ1My4uMmQy
MWExOTQ5ZDk0OSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vZnNsLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vZnNsLnlhbWwKPiA+IEBAIC0xMjI1LDEyICsxMjI1LDE4IEBAIHByb3BlcnRpZXM6
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBrb250cm9uLGlteDhtcC1vc20tc8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBLb250cm9uIGkuTVg4TVAgT1NNLVMgU29NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wsaW14OG1wCj4gPiDCoAo+ID4gLcKg
wqDCoMKgwqAgLSBkZXNjcmlwdGlvbjogUEhZVEVDIHBoeUNPUkUtaS5NWDhNUCBGUFNDIGJhc2Vk
IGJvYXJkcwo+ID4gLcKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oCAtIGVudW06Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBwaHl0ZWMsaW14OG1w
LWxpYnJhLXJkay1mcHNjwqAgIyBpLk1YIDhNIFBsdXMgTGlicmEgUkRLCj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgIC0gY29uc3Q6IHBoeXRlYyxpbXg4bXAtcGh5Y29yZS1mcHNjICMgcGh5Q09SRS1p
Lk1YIDhNIFBsdXMgRlBTQwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wsaW14
OG1wCj4gPiArwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBQSFlURUMgaS5NWDhNUCBGUFNDIGJh
c2VkIGJvYXJkcwo+ID4gK8KgwqDCoMKgwqDCoMKgIG9uZU9mOgo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHBoeXRlYyxpbXg4bXAtbGlicmEtcmRrLWZw
c2PCoCAjIGkuTVggOE0gUGx1cyBMaWJyYSBSREsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gY29uc3Q6IHBoeXRlYyxpbXg4bXAtcGh5Y29yZS1mcHNjICMgcGh5Q09SRS1pLk1YIDhNIFBs
dXMgRlBTQwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZnNsLGlteDhtcAo+
IAo+IEV4Y2VwdCBsYWNrIG9mIHRlc3RpbmcsIGRvbid0IG5lc3Qgb25lT2YuCgpCb3RoIGVudHJp
ZXMgcmVmZXIgdG8gdGhlIHNhbWUgYm9hcmQsIHRoYXQgaXMgd2h5IEkgdXNlZCBvbmVPZi4gSXMg
dGhpcyBpbmNvcnJlY3QgdXNhZ2Ugb2YgdGhlCidvbmVPZicgcHJvcGVydHk/IEkgY2FuIHJlbW92
ZSBpdCwgc2luY2UgbGF0ZXIgcGF0Y2ggcmVtb3ZlcyBvbmUgb2YgdGhlIG9wdGlvbnMgYW55d2F5
LiBGb3Jnb3QgdG8KcmVtb3ZlIGl0IGluIHRoZSA1dGggcGF0Y2guCgpZYW5uaWMKCj4gCj4gQmVz
dCByZWdhcmRzLAo+IEtyenlzenRvZgo=
