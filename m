Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795716809;
	b=eeTgKK8cc5w8ORRv1viOHtYVma6m38bjjehQepoiaD4PtYmikdrpVGDQxqrd6qrkga0c
	 2QQZbclfwnE0rCg85GLU35YWjMTis90bLb+IU13w6wMz19VA1nUAzaebdHQdKwM0KTt/X
	 f7y2xwmN22yEnzMTREPNW9MYMuQwPWbEg0E+khC7rDir5bRnTjLJ+SS5DLWQ2CzWRQFT8
	 CtzdOf4zZWOcfgABpNRPzNrEf1qXjLBE95SnG8Wy1KEqEjpmmb7HylSAzmTkP5xVCaj6X
	 fkJxMgzVivpvXsTnEtcd1oH7XqVIYmSAvLaBlZ2hZTCgVW7Cn2PLkzCMdRRoLZ4dDaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716809;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-sharedmailbox-routingagent-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Og/6ItpYLdDb9DptQGR8VpwrI/WymvsAZCm+cfn3KOc=;
	b=MdivoDi3XUXgOKEiiIFdJSm1pmhA5EQr9QwukJ8+nYdb35qjAG7XqC2VQ1h1t56xe3fd
	 9zuPmkJ/rfrvtEEyHm0CEbbV8TqcT1CmkCtnEdYiFs4/Dgzlm5VHa+x3UDZTEiMz5ek1Z
	 VcMsjsQufRDV5kxrOKES+isyY7sSqHpLK7dYc9NlOV0X4+AKIyvrYvW8tBhEJ4rLeRPJH
	 6YHgiGU5NaP4ZPUA/ZSqkaXWPKPPebtFD0b94qdbFvPWk9AgdIDnCNbOSM8fcrbCN/Dvu
	 KGPjE2kSFAQfSeLC31ASe8Y9RClqk2obCVeR1T8aOv5vsv1tukmq3ljewC2jzB9PRkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gd+ay7SQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.41
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344CB606A321;
	Thu, 26 Nov 2026 18:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Gd+ay7SQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=li2X4in1jIqrc8r62inD123m9bxpmE6j75wd/Hxa9hZs09MsvzNsWchKbI3jD/d03xoAOlvEcZFc6eQkMiuf2GOVgI0Mw16xqS6/i2ZM1pNsA/SgzngfAvxKXua021J9nQlcHfkUgZUhtu8J8ysmPA2t2vO6YI5PPGo2JLnPbK0CLIxhOkQp0Naw29plGhKAHnR9UQy9p9jCHrQwRsueiTBN5PasWeup/GNLKT8anDUsAm9tKfw/GbAHh9qahWIi9yGkRmn1nBkrriSxzwgDCLM3Lah3NyxbNg31wUusTKhEtuKppPzuCm56Gikxv7lcj1bArJGRdJFYdUJEFTVK4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Og/6ItpYLdDb9DptQGR8VpwrI/WymvsAZCm+cfn3KOc=;
 b=rtRPMaHHZNpXc8DcYZB3ve/chz0xvtPhhY+r0wQ51T7R0TVzvD97QQnX4sJE9GN8O4v6XY8n8rJiM0oxLRE3DXsraR9pqxQrLT/zJ9dRW/63BCDKDC3MCSKwSvcTuH+nJNEqbztFjhfzOKYN3s45YGpynNdoGwH3LlVZ+lk+hJXaQCZyQHVKj8oLsfosklRNtFUb+SGkVvuOVGU8i0C8tdO03bPHf3ONE6dLPe3QvUhKsDXDUSUtzX44fwGMn9wWgnirQ2mnDSl6jwW7HpYesNNaLl5Ti5dFsFe8NKhX+bUvYk67VyBL3WZQqACeFNPe+rbTmya3Hh72b3OwfUJMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Og/6ItpYLdDb9DptQGR8VpwrI/WymvsAZCm+cfn3KOc=;
 b=Gd+ay7SQhWF4p3nsWg+7vr6EUXnNCNdet/DcKa/RBrpu9sS3/540jVdjGNXwJgq/srS/f2EamFzRfp5r+X8Qp0TmPCgL3NPPEMhMsQmjKQIz9NixljIiy31CCvFea3jPnDnuQ4s704Kzxxn3MtmZIlbpwrTWuemyRt0SXhTQljg3gGkDtdc7x7CSJIMxUce9a2YGtIRW6gmuS19HowpcH0ku2Yr/28weOO8s2wewu49UPENjiZt2NlsArfhgOualUMb2jN1G0Ng36iYfKGlwXuQ7nI62lYFLP+KMIvqswej8bRr30F4e4SHLECZIxOuWFwgDlLiAqOcfJdklPdXAdg==
Received: from AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24)
 by FRWPR04MB11246.eurprd04.prod.outlook.com (2603:10a6:d10:171::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 18:13:24 +0000
Received: from AS8PR04MB7590.eurprd04.prod.outlook.com
 ([fe80::3470:a76d:78f7:317f]) by AS8PR04MB7590.eurprd04.prod.outlook.com
 ([fe80::3470:a76d:78f7:317f%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 18:13:23 +0000
From: "Marouene Boubakri (OSS)" <marouene.boubakri@oss.nxp.com>
To: Conor Dooley <conor@kernel.org>, "Marouene Boubakri (OSS)"
	<marouene.boubakri@oss.nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, Anup Patel <anup@brainfault.org>, Samuel Holland
	<samuel.holland@sifive.com>, Radu Rendec <radu@rendec.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Topic: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent
 Genesys 2
Thread-Index: AQHdatMP2AQQGuFOIU2hvXLOlFPo97cbK6SAgCWHqWCAABb7gIAAAFQAgAAB9IA=
Date: Thu, 26 Nov 2026 18:13:23 +0000
Message-ID:
 <AS8PR04MB7590C0DA427CB58BB7EE26A0FC422@AS8PR04MB7590.eurprd04.prod.outlook.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
 <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
 <20261102-salsa-cartel-dd4f4b2a9639@spud>
 <AM9PR04MB758686FCAE3D9C4A713B6E98FC422@AM9PR04MB7586.eurprd04.prod.outlook.com>
 <20261126-sage-subscript-abb9ea294ca2@spud>
 <20261126-resale-roast-ec3dc50ca350@spud>
In-Reply-To: <20261126-resale-roast-ec3dc50ca350@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-11-26T18:11:45.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB7590:EE_|FRWPR04MB11246:EE_
x-ms-office365-filtering-correlation-id: f9150172-d2bd-4d60-75b5-08df4be8f5c3
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|19092799006|261022105027099003|11063799006|4143699003|261028144727099003|10067099003|5023799004|261021121427099003|261102123227099003|56012099006|261026121527099003|261009223027099003|261026140227099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 eeJhdD4Gd/XB4Ug7tl04+yk/7T0VjKZyDLSbJDqzaiSI3MeGaWf6CE9/0pKxkV624rAihvBVcax6lcLoh3Wsf2V1LmMGkbjju4B6nT/9YYTgUSRvZlwlvhg2GC7nCV/Elqp1Lu3zH1rXSIxHbE15tGQpMKAHBKQNSZ8ZT4bY/mQyxrT1te4U57IOTDOOrj9LX3wIWSqBnhlvYXREGVhSUQfRQXBFLoYw2tie6v/lNdXeHsxU/ifReJ7gmXDfHmU0car7ifYqlXgMDLUZbjm7M9I+awslN58upaeAh+AHR+eYDxqxrO2vVKtTOztdJCp6N6pHBq2Z46skcnBtfXud9PE4GzVQXeSA2aVQ3CpgT4GTn93e19aK1lpmC7YtnEhyFBeVTy/KIPX2TswYW/vZSphQjC7fBzuHLZduXHmTUEnB9EILQQ3fV+XtNODg5u1kKg9o81FC8Je9eHH6uaBtQFWw9VT46q7g32gfFWpa14CXMombOmRNUhdtEvw74seEc3rA6MzeOZG68MHTvmf2rFh5fDQag5JAWPJ3iGVWwFkgb4mUhLHQWMOIKqYvZRD2uEWcO6KiiwiIS/4qn1YcNLAWEAD/RBqysxALU3GVAKYwrOn7LqB3xP97hi3Vn5pY4DecJPx9q7m5QPZgm6jrHOlJmAupyupEchTunYcNH3R0l+oqK/xTjBJS59aASOPIy1GIffe9Aewp4GshqRyfn5BO78pGv7WjWMZTAiaqq/k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB7590.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(19092799006)(261022105027099003)(11063799006)(4143699003)(261028144727099003)(10067099003)(5023799004)(261021121427099003)(261102123227099003)(56012099006)(261026121527099003)(261009223027099003)(261026140227099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnowcjVOU2wxU3JiZ25mVGFCUFh6S0xrZkRZUkhmZktlWm5ZQTZWandkdklI?=
 =?utf-8?B?NXA2UW4ybGduTHBPbVNxNFM4ZUpnbzVVanY5NDU1d1RZUlNQR3Y4S2JBYnA2?=
 =?utf-8?B?TktqRHRUNmxHNG9hUmxMVG9pZlNsRTVSMDVpYzBTK3krb3JrdE9qRFMyNWxm?=
 =?utf-8?B?b2VwR1V5UnJpaTVLdHgvaGw0QkpPN215dzV0bWQzN1JBT3JWL1dxcmI5Y1hB?=
 =?utf-8?B?OWFCMTdML094OUxYeVE1d3Q4dFc5bGUrWTY1NWFXaVdBS2VZZ0t4VnJ6blFo?=
 =?utf-8?B?eEF1Q3hXU0p2WlJqRXVmd1UrZ0VqNDdxa0wzNEJzbVlaaWhzcGs1OGpQQXhK?=
 =?utf-8?B?ZGcxRHh0UWdGTGxMYzU1L1JhRFkvOFZja2JaWEM4ajd0U0p3cWdqeHBvVyth?=
 =?utf-8?B?RTFOcTNuckZsa1NhS2NOaDdwdmM0OXVZNWNkeTB2Mm1INVJNUW9XN01qdWF4?=
 =?utf-8?B?VG9VamM0MElmNXAzalZUVVFGQkVQKzJGKzlsV3BaTEVSWVNKcWkyVUIwMzB4?=
 =?utf-8?B?SnlRRmMrUkFUMDVwSkJldVFrRFFEWlNocDd4YmlNUXhRdXRnblUzZjJJRTcr?=
 =?utf-8?B?WEtuSmt6cDRtK2NTY1dxUUxhWVBMNDBuMzVmRTRaMVl4QTNBK0tPSHl5cHoz?=
 =?utf-8?B?Uzd0UnVOUERaZFlhQ2htUXF5eVN6MFFTM0RmdWxuNjhnL01zazBLUmt2Ylc2?=
 =?utf-8?B?WkdSdlhMVUtCaHFkWDRtYjlPcGFhem11b3haMlFSM0NRQ1AyQnVuc0I5NCt1?=
 =?utf-8?B?Z3JyMFhtajNoSHhLOXluU2w3UzJzUHRJOWpRbVptOFptVVRtbHZVVDV5QVZZ?=
 =?utf-8?B?ejk4cG14UXlmS1Z1T0paTjN0U1J1K0Rxb3Mva1hjY3d4MERvUDJ2SXBlNjZ1?=
 =?utf-8?B?ZnlaNnVKZFBnL081V2hCZWRXbXR1UlFOb1MxTnNaZFRGcU82SlhTSExTc0Q3?=
 =?utf-8?B?NHJ6dUdzaWU5V1pjZjhaaW5WdTQ5alBjbEhhZ1Vjc1pEcS9WZGJGM3ZSQlc5?=
 =?utf-8?B?UHMraGUvTWEzOXhVcHhsR0V0L3VXeTNHOExQZDN6TUFCWmY4eFRObHJJU2h0?=
 =?utf-8?B?bXYwZEdiTkJZRUNKNFEyeFhxYjRpT3Y4RFcrSkRUVjVCVmlWYit4VVdkdlpW?=
 =?utf-8?B?ZkdLMXhBc1FQWkUwb2tiL1lXaTY0VkFuZ0Jnd3oyNThDSThVNENkVlAwRDlI?=
 =?utf-8?B?S00raXNzWEwvZlpXclhsVVFpK243Wmt0UmNOQmh5bGJOdlZZVGt3THFNRFNu?=
 =?utf-8?B?cDlkeFlmVzFXSkNUaURCSlhNRWtGS25lZS9hdndEb3dZV2JxUXh5ZFJ3eFVP?=
 =?utf-8?B?V1QyanUySmV0VDM5czAxakNjTVhyWWN4T2dZSlgxcG5jWEUvNUF5TmNzclVS?=
 =?utf-8?B?ZnlkSHBrWTJzMmVxY3F6QmR5M0lDNElYc2cvckZOVnNCWDJvUnpvZjJzZlZw?=
 =?utf-8?B?MjE1SnlXQW5Md1BuVGxUVlJhaVZ6Sm5EeG05c2tEN00zUmp3NVI2RnQxUXJi?=
 =?utf-8?B?bGltY0R2OU1COUlmS0xvaWFnaHk2RXZnNXQzcTU2M0hvRWM5TXliR2s4d2V4?=
 =?utf-8?B?QWpwdnJMNmZUd3dZT1l4SW1oRjduNG8xZFBJdnNVblJET0dhTjR1NmVOeHBD?=
 =?utf-8?B?MVh2WjJOa0VlQThrNmtPTitVY0loWnRFY3dPRzVXMUpQNEpXUDlFT2Ixc283?=
 =?utf-8?B?SjRvSXFzQW5GWDQxTW4rc0dueDFORllXZ3Vtb2cySWtlZWs3ZDg3MFdpZG1j?=
 =?utf-8?B?RXVaUFZkYU1MU2dpODRncmJsa0hCWU5ibFFGdmhjUUorVUxtRFIrc0FFcU82?=
 =?utf-8?B?YitXZnF1VGg2Q3RFV2FPR29ma1ZVb3lOUnUwMFNvd0FlT282aDh6ZHF1dDhE?=
 =?utf-8?B?VXUwY1Nzc01SVHE4UGcxUGNieEVsOUZHeElFNW9NNzh6L3h1aWVkRjNEaFFz?=
 =?utf-8?B?L1FhLzZsYkhEN3Z6TkpnczlpV0ZWNmFxTmFmVTAwcW95U2tSZ016WXZVN2hF?=
 =?utf-8?B?WkxFRVZtRExZZUxnU2JXL1owRnhGcm1WWFJ1WkZiZlR0NkphNTBDR2ZDcTFw?=
 =?utf-8?B?UVBQUHp1S1hIYTVLd3oxdXIxcXB4WjJTSnVOaU8xcFRLUXpENGQrNUt0YnNR?=
 =?utf-8?B?VGpRRytVVzF6MnFqK2pyZ0dLdGZkRDFGaU51dEZPZng3RWlJazgrUTR2MkZK?=
 =?utf-8?B?SkNwUXNqcjhqMEpBUzV2UFM0YTJCak8veFZQNjMyMVYzZ3MySG9WU3NKaVVi?=
 =?utf-8?B?YlF6VTQwdEpna2Zha0ZqcElZcU43MVVxSjZYV0ozK3duWU9JODRvZ0o2ZFc1?=
 =?utf-8?B?bHRuVnNZc1BNdkxYSVlVbkl5RDJEOFk1ZS9QSGRmd3R0SEpkQXh3QT09?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB7590.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9150172-d2bd-4d60-75b5-08df4be8f5c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 18:13:23.7612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JzgUkeiurFGALSo3lYCcD5+akOCacWdjPa8O1WBV6Iqlv93maPyg5/9Otd+kn2zBtuhb8vTdaruk0mjtMdHzf2PHb5QHRkr64mHJTMIZ2Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11246

DQpOWFAgUHVibGljDQpPbiBUaHUsIE5vdiAyNiwgMjAyNiBhdCAwNjowMDowNVBNICswMDAwLCBD
b25vciBEb29sZXkgd3JvdGU6DQo+IE9uIFRodSwgTm92IDI2LCAyMDI2IGF0IDA0OjM4OjU2UE0g
KzAwMDAsIE1hcm91ZW5lIEJvdWJha3JpIChPU1MpIHdyb3RlOg0KPiA+IEhpIENvbm9yLA0KPiA+
DQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBhbmQgZm9yIHRoZSBhY2tzIG9uIHBhdGNoZXMg
MSB0byA0Lg0KPiA+DQo+ID4NCj4gPiBOWFAgQ29uZmlkZW50aWFsDQo+ID4gT24gTW9uLCBOb3Yg
MDIsIDIwMjYgYXQgMDc6MzA6NDFQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiA+ID4g
PiArUklTQy1WIE9QRU5IVyBHUk9VUCBTb0MgU1VQUE9SVA0KPiA+ID4gPiArTTogTWFyb3VlbmUg
Qm91YmFrcmkgPG1hcm91ZW5lLmJvdWJha3JpQG9zcy5ueHAuY29tPg0KPiA+ID4gPiArTDogbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+ID4gPiArUzogTWFpbnRhaW5lZA0KPiA+
ID4gPiArRjogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L29wZW5od2dy
b3VwLnlhbWwNCj4gPiA+ID4gK0Y6IGFyY2gvcmlzY3YvYm9vdC9kdHMvb3Blbmh3Z3JvdXAvDQo+
ID4gPg0KPiA+ID4gVGhlcmUncyBubyBnaXQgdHJlZSBoZXJlLCBhcmUgeW91IGV4cGVjdGluZyBt
ZSB0byBhcHBseSB0aGUNCj4gPiA+IHBhdGNoZXMgZm9yIHlvdXIgcGxhdGZvcm0/DQo+ID4NCj4g
PiBZZXMsIGlmIHRoYXQgaXMgb2theSB3aXRoIHlvdS4gSSBkb24ndCBoYXZlIGEgdHJlZSBmb3Ig
dGhpczogdGhlDQo+ID4gcGxhdGZvcm0gaXMgc21hbGwgYW5kIEkgZXhwZWN0IHZlcnkgZmV3IHBh
dGNoZXMuIEkgd2lsbCByZXZpZXcgYW5kDQo+ID4gdGVzdCB3aGF0ZXZlciBjb21lcyBpbiBmb3Ig
aXQuIEkgY2FuIGFkZCB5b3VyIHRyZWUgYXMgVDogaW4gdGhpcw0KPiA+IGVudHJ5LCBvciBsaXN0
IHRoZSBkaXJlY3RvcnkgdW5kZXIgUklTQy1WIE1JU0MgU09DIFNVUFBPUlQgaW5zdGVhZCwgd2hp
Y2hldmVyIHlvdSBwcmVmZXIuDQo+ID4gSWYgdGhlIHBsYXRmb3JtIGdyb3dzIEkgYW0gaGFwcHkg
dG8gc2V0IHVwIGEgdHJlZSBhbmQgc2VuZCB5b3UgcHVsbA0KPiA+IHJlcXVlc3RzIGluc3RlYWQu
DQo+DQo+IFN1cmUsIEkgc3VwcG9zZSBJIGNhbi4gS2VlcCB0aGlzIGVudHJ5IGFuZCBhZGQgdGhl
IGR0cyBkaXIgdG8gbXkgbWlzYw0KPiBlbnRyeS4NCg0KDQo+IEkgc2VlIHlvdSd2ZSBhbHJlYWR5
IHNlbmQgdjIuIEkgY2FuIGFsd2F5cyBkZWFsIHdpdGggdGhlIE1BSU5UQUlORVJTIHN0dWZmIG9u
IGFwcGxpY2F0aW9uIGlmIHYyIGlzIG9rYXkuDQoNClRoYW5rcywgdGhhdCB3b3JrcyBmb3IgbWUu
IElmIGEgdjMgaXMgbmVlZGVkIEkgd2lsbCBmb2xkIHRoZSBNQUlOVEFJTkVSUyBjaGFuZ2UgaW4u
DQoNClBsZWFzZSBpZ25vcmUgdGhlICJOWFAgQ29uZmlkZW50aWFsIiBsaW5lIGluIG15IHJlcGxp
ZXMuIE15IGVtYWlsIGNsaWVudCBhZGRlZCBpdCwgbm90aGluZyBpbiB0aGlzIHRocmVhZCBpcyBj
b25maWRlbnRpYWwuDQoNClRoYW5rcywNCk1hcm8NCg==
