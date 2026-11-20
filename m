Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795156249;
	b=fDrbJsTvtjhXujP4YXVbpnDzHW+noD2/+0gFbgmdGSwfCkCGXR6xhcqtbGWiaDfTHAKw
	 Llm9lpX/0q79QFe4ymNMq2bZSR57qlYkB7RUf/8AvBKZaZtCShSlMPEmHuEy7GK7Snqao
	 PeqKrjJhg+m8zvRoZ8C96BVEYzyhWGPR0AqsW4cTeHHU41Nkpn7V+xRjKvgn3/7lXxKgt
	 MhlSnWBg9xovje235j3wM7DkY4exa+1mb6E55LwwY4zRPYR/lFH4znQ3YbnxW25MAiJhG
	 aBFDbh++wFCLY52mm5M2CFZghJKZLxIVPkAlgXNYatNG0majo7ciFn8MscWUs9OVBbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156249;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=D0ydf2AuL0dK4FNAziXA1l60HYGarpJry4YDgUDHa/4=;
	b=pQ2GQOUCUmmA+ZfRoefzjyZWfGVEY3CnTEoa7OTEZxXgr9uJByEpku1pmh0eLokKzpQu
	 jpTCgUX1O7RGkGCtSEPrgizr+1r8zepO8EjbppWUH/UgBYbzydlZBv9TWisVE207hugCl
	 6hPJE39YmWyUxbGM1kDG6gS4qJ7g/8zII9NNUzMKOf5XCgs8p7Ha9qLl031MszewyhlR9
	 Qg0kxq7UDgtPicIo5YYZfsTtl+M/hZAsZE91um6QmF6LDIcFjacsffkPVONWBWzQ/q8WQ
	 a5ikYLpi5lvPO0HaImJSKmynVyAUe+oEJnr8CJS6/GGb7KvuX2RlugsL8/FQdQtxabQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaisala.com;
	spf=pass smtp.mailfrom=vaisala.com;
	dkim=pass header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=steMBPt8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.136
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A9A606A320;
	Fri, 20 Nov 2026 06:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A9A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaisala.com header.i=@vaisala.com header.a=rsa-sha256 header.s=selector1 header.b=steMBPt8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErCJlIKZUDsyuUxYP1xmgcDDxVB2VgGbl0NbriW+O5Js1/5K8BF/mMRpoiw/RKf9APt6BtpkQP+2OH3EUEHn96kK4hag2XspyU/jmife/M7BtX5mWrNo9D63zfo9woFOQJ7Qr620WzOCGeZQGpzf6OAm8Vtis5EBHFx7UpV1e4Mq8/aoF9Zomw5OcdiT8iGw8hOIlVTBhrBNKiP4kmYRPBfaTgMJNzrs29/WNm1/WFU0qpPcFRwGVlcgTx2Y11MVO6hjePYpnCeNblXt07uTbS71RPuSNj3+n2+KzBIXbYYZVMhMLuKzp8dEUBuL0KoqJ3OXItuhCZSLhAyCjAcTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0ydf2AuL0dK4FNAziXA1l60HYGarpJry4YDgUDHa/4=;
 b=I3CLe5bIw0DiaTBBjtk80Ov747pZ/Ngx66KiQhZebB3z9C36XOrn94HbLoXaMB2v98hF7jKy0afLuFDLIEJXF+GJ7U9BEvo3oCvqPxJAKllaZFEST+7PcuZyDZxK+G+1BMt3aGGAO9dp6hXCqr1iBhRW1lEuX7nsdU2tz0vOewEEHHygkHCnE+/MadTEFVzTS72SBbUAisyRWiSr43EUGkjX+i9cpz4WdITSumutk7QJZXWQzIz8P87njRW5AEB326m4h1PNi49ncsJuThAx3ktpDqP+k+8jl35jTIA5eyMC8EHoOrEtUwQ73Lg8sJ7w1pFadFDsa87UKo0dc0wrFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0ydf2AuL0dK4FNAziXA1l60HYGarpJry4YDgUDHa/4=;
 b=steMBPt8pjOOydlr5dNg8xL80TK+BKivPyM8YcDcH9MCw2elqDL7O3ohs/OBf0NAFrdcSbSNYrAnOFLb4UuXKjbkvJuNcL/9euuPAIsqp9uzEkIrpT7kk0N1+g4GMN4EETBaPuKm+QLy2wWzZPwxy6KKMvm7Ne3rwbKyo3L73D+hqT7PLzB/gboS+48g6d13L7cqz78o30D2jINza7h+BnXKNNY6urHFeec/QkUO5NqfC3He3j1VUBNBP3Ms4JtRSIUrb0+1I7gZbqRjjA2M5rW3zjWP6lJmAJopCTM50GRcrF0M8QjHSJhTSFQwNa9VXEWxuBXEAAVbEGc5X4+Ehg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com (2603:10a6:102:407::17)
 by PAXPR06MB8207.eurprd06.prod.outlook.com (2603:10a6:102:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:30:38 +0000
Received: from PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc]) by PA2PR06MB9176.eurprd06.prod.outlook.com
 ([fe80::b6d:8160:d324:3bfc%7]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:30:38 +0000
From: Tapio Reijonen <tapio.reijonen@vaisala.com>
Date: Fri, 20 Nov 2026 06:30:30 +0000
Subject: [PATCH RESEND v5 2/2] mux: gpio: Add optional enable gpio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-add-external-mux-enable-gpio-v5-2-0b622c1a76f7@vaisala.com>
References: <20261120-add-external-mux-enable-gpio-v5-0-0b622c1a76f7@vaisala.com>
In-Reply-To: <20261120-add-external-mux-enable-gpio-v5-0-0b622c1a76f7@vaisala.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peter Rosin <peda@lysator.liu.se>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
 Tapio Reijonen <tapio.reijonen@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795156236; l=4489;
 i=tapio.reijonen@vaisala.com; s=20250903; h=from:subject:message-id;
 bh=tOntCG7oKBafXwVKA2YwcA0AGjkM0wcgVckIi8Wxd7o=;
 b=2/Jl4kNusM5JyR8TdcyyW59Z+AqACEJzN/0P4uBh5nDXGpqD6Ppgq+YSiOFWUyMjktBOBz7nq
 YczWS8yL15JC412119GU4dZ0MDJP2/9agnk0MF3TjwVqfzXiDa33gCb
X-Developer-Key: i=tapio.reijonen@vaisala.com; a=ed25519;
 pk=jWBz3VD84WbWgfEgIqB5iFFiyVIHZr52zVBPOm7qiGo=
X-ClientProxiedBy: GV2PEPF000480F1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::42f) To PA2PR06MB9176.eurprd06.prod.outlook.com
 (2603:10a6:102:407::17)
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
X-MS-TrafficTypeDiagnostic: PA2PR06MB9176:EE_|PAXPR06MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: f90b22c4-d32c-4343-d379-08df46cfcadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|23010399003|38350700014|10067099003|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4pedNYpV2K92ZV4WAJge3oltLdVKM0OkWyB844SNKdHl9YobwajukFLQxwXlpfZ4gK6AaYbxwhpp9OnPkjAAmfQKWaFq4XsG7wqOMvJ9FpbcgwQGQv65ugGqrBaVrDvcfLh+RH/M4ausuzylXNUOJBKxYypVpIEUQG0BG69vb+jC2g9CnUkv2h4w99cVdzZbUNkZp6K35hbzH0sSeyGVCJTGhP2TSoYDFYM3E50ZdN+VG6WGD6VTemSD0X29Y2sYspy/fUwKJYX8inPkj2/qyZTXVm02e9tH2SzvmX9c0GHYyF1zzl7lYodbfjLtXC8Ely53IUb4RqkUwomEPEfh8AHS+FaTeye/AyVfwJuhJ281HoXfKPhfh+DdwcwS748fr8lgBGtIu4US4SxdgzLUZRD3zIqPV3Jt9b6si7GxvPxnnNn9QlrqZorWJf4EFT1vqXMjmzTZh8OCh160LlKP9t8B282XkvSuWQv6cq1nGCsY81WvtmqADSqaF27lTonQyVsU22ZfckaiCSLPQLn1ykMvXsOQyaOxCcppfsNcjJubOpdO3sdmWGhvzxvwifmMT4MDIWZ62Oc7WTU45MemsuY+FlEuXM+RPJJMrxiytbvGjf1Yiu27gSPkvQaxQeSjpO0z0lEL4yeM7TQZRUBsrLOfln+g1EcKnYbjzAUDTFwOEvlCTE5OCXLIuOyxW5XquX319YCldqi0U1CGvQEzpjMdmt2/48B5vr0NSNdsxk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA2PR06MB9176.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(23010399003)(38350700014)(10067099003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Si8wVUErRWNycXRxS0hvMjR1MDVLSzhqMFd2aWI4ZmdzMWNmUEpiSnUranhu?=
 =?utf-8?B?VWw2alFsditUUlkzUjROaXI0dXhpNmk3b2VXdUp1V0JTS05PblVGSC9jMDlj?=
 =?utf-8?B?bDdCSFNyOFhNWisxK1g1d1llakRRaFBTa3EvMVBSVlZMSDV4OUNZcVhKVFU0?=
 =?utf-8?B?QWpHc244Uzk5SDdYOUYrVTBLaTE5cHVxL1pXdFFoM2RNQThHa2x0SE80S3FV?=
 =?utf-8?B?OHlNSDlTVTVzbGFPNXdpa2ptdTNOMG5YTzdoWEZwd0QwRXlrZ294Y2N6ZCt6?=
 =?utf-8?B?Z3dCM213S29lblo1ZlN1cGd4cjl2WnhQZHZPV2tBNXlQcE1ORTJ1ZjFtK05B?=
 =?utf-8?B?czlEdVlycTZwd1o4YnZWRXpnQ1ljVFhML2VtSjMvWkliRnpqWVdCL1pmYWtw?=
 =?utf-8?B?ZjdkZGpaZmh2L3VIdmJYNjFrbjVtMEU4VHoxZzh6R0xjVngzdFFIMXh1U1k2?=
 =?utf-8?B?emhRS01YaTNoVjVPVGcxTjdLMTE0RmYwTHM5Z0V3dGtuU2ZJU2pRR09wbHc0?=
 =?utf-8?B?TUwwa3B5Y2NzakV0VmVlK29QL1ZoZlJXWmxyZlljL0lXUzFoSmIzeC8zYTl0?=
 =?utf-8?B?WFo5bFNrOVg3SDJ1VVZqS3ZWQkNVMlc0RHJIMHBWc2tHc0xVSUZtQjJvZE5l?=
 =?utf-8?B?cFR6WFJzYzdqNWw1WjFsVURidDlvV0VSRTBuWkhWcE1hQUFzZXV5dEFwb3A2?=
 =?utf-8?B?aXNRSlJHYUFqYjJEVlB4NlZ1QjRGZUthSEh4WDBIQzhzTmpIcHhxYVcrbTJY?=
 =?utf-8?B?TVZ1MzNMU2ZHb2FpWHRPcVplSEVaUmV5d1Jla2lCQXQwYWFHd3hncmM0d0hr?=
 =?utf-8?B?MUdSWkV5Mi8vVzA5OHAwR2F3WFRoeHlNVUpTMThRbm96ZENOQWNaUFhvZDJr?=
 =?utf-8?B?Y3hGZzBINTVLN2JJZXBLMnZhc2kwakVUZ0VTdEF3dUpNWGNHNWJrL1c5cVJN?=
 =?utf-8?B?RHU5Sk5zdWw3MXVDV0pQZ2tGZ3lKYzZUMTM4TFAwd1N3ZDROOVd6LzJuVGFt?=
 =?utf-8?B?b05zRVE4M2p3YXgyQ2o4UzJyY0lJeStkTDJKWFcwbHo2NCs5dUhPRUZWYTVh?=
 =?utf-8?B?dlpwMFJXYVU5RzRwRkM0N3dYZzJ3VFlZbmdrem54aFF4LzNnSVB2dy9MRm4z?=
 =?utf-8?B?Y09FUTJyc3Q3UTVibm5jNlRESGN4VWh1MzJpZW4zNFZQa09iSGloem9XTVNO?=
 =?utf-8?B?WFJ1VzlHMlcwSmlOV1Bsbml4S2lraVY3Q0orSUQyNlVBOHdwVU15UFY2eEpu?=
 =?utf-8?B?eWJNckhYa0VlaC80bGlHVCtzMldiOTFlK1BpWFgwZUhoeElpYjJKbG1lZzR3?=
 =?utf-8?B?R0NkK1pJS05FcXptb1dKNmFsL2FHV1dmTmF6R1I0eWoyamF5ZXJJWEVPaFkx?=
 =?utf-8?B?Zit0Z0k3RkswZ05RbkFGdEVrR2dray9jUWw3RnYxcEtCQ1o4Um82cmQwM0ZO?=
 =?utf-8?B?R0FrSng5blRIOEVNZTd6Qm9nNWtsVndMaGVaMFF2aFRCZXdIMmhJOFR4blU2?=
 =?utf-8?B?N3dHcU1CL1l6TndKTlU5dmtLM2dZUVBOaHNrdDllUVZ6M0ordDMxbFRHR3Nt?=
 =?utf-8?B?aHZCQklXekh4Yy9jQWM0WmJRcXpqdEVYOW9EdGlMempnT3lwcGFtNjFoL1d6?=
 =?utf-8?B?U2hDOWVUYytBeEtWOWJSZk9UVW8yRnBjaXNTRjE0MGxwVmY0TEhrZ3BDeEdw?=
 =?utf-8?B?cW43V2pxZmRWNUZoTXVrTnZVR1doZWc1ME1yYkRod0Z4OTlXUFRMbmNmdVFU?=
 =?utf-8?B?YUlqeG1FaGtXcXd3KzhyZ2hkazJiQnIwNldZTGpEU1lkR0NpQ014Y3Q0cDFV?=
 =?utf-8?B?dWRyQVhIRUdoK0MzSHhOL2lPdVNUYXFkd2NJKzdlSit1UkNGamlCSUhtcHBC?=
 =?utf-8?B?a1hPcTF2ZjhkTWlwTlBQeTRyM1ZadlNiL2NmUWJjRk1ZRXJzenFuenVjVjUy?=
 =?utf-8?B?RGo0OGtsNEQ4bGppSVpPRGw1OW10Z1dKUytQTkwxYmRUZ3N4TFBZVHNMbjNN?=
 =?utf-8?B?a080ajlmZ1lqSVU1aW00ZHR6LzFmNmRwNjhieDg2aldZRnRmeGJzaDQwRHpz?=
 =?utf-8?B?WHcyNkprWDFxVFEyaisxSjk1TllzL2g4dTdkWGQzSmZLUWdOSkJMVHRzVjh5?=
 =?utf-8?B?dFExbVVUZ3ErUTJWaHlvTXByTldZTTVPNFN0MFlQMVhybEN5RVViNCsweUl4?=
 =?utf-8?B?TVk3M0Y1UEtrU2xVeTc5cUljeU5OZ2FMTDFTOGZiWXR2Z2FQcWdqc3BCQ0Jh?=
 =?utf-8?B?dEJ2ZFpFZU5ieDZ5R2Z1eUd1TndPcldvRFdwckJ4d2ovSXNtNmRPcWpVSEJJ?=
 =?utf-8?B?WXg3c3IwNVZpYUlHcmNXOHBDQzBEQUtNUzJQREU5N004ODlSMmpERllGRUZG?=
 =?utf-8?Q?XqEtQjIt6RDhqmEI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90b22c4-d32c-4343-d379-08df46cfcadf
X-MS-Exchange-CrossTenant-AuthSource: PA2PR06MB9176.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:30:38.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SelGHdURLRuV5gC157xu/qdrPlaPvhSll8m0KJmE1c8kVodvkyPaiBfZ8NlJeXdIizW24U+PN/CPX5c/Ycjq3pEt2G+mu1PWamILnjYSWOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8207

Some analog multiplexers have an enable input that disconnects all
channels when deasserted, independent of the address inputs; on a
74HC4051 it is the E input. Add it as an optional gpio.

The mux gpios are not guaranteed to be updated atomically.
gpiod_multi_set_value_cansleep() groups them per gpio controller, and
only controllers implementing set_multiple() can possibly update theirs
in a single write, so a mux with its address inputs spread over two
controllers passes through the intermediate addresses on every change.
Deassert the enable gpio for the duration of the update and assert it
once the address is settled.

The enable gpio is also what makes an idle state of MUX_IDLE_DISCONNECT
possible, which the mux core applies when the chip is registered and after
every deselect: it leaves the enable gpio deasserted and the address
inputs alone. Refuse that idle state without an enable gpio, because the
address inputs cannot disconnect anything on their own and mux_gpio_set()
would instead drive them to the bit pattern of MUX_IDLE_DISCONNECT.

Return the status of the gpio writes instead of zero. For a gpio on an
i2c expander the write can fail, and mux_control_set() only invalidates
the cached state when set() reports an error, so a failure reported as
success would leave the mux on the previous channel with later selects
of the same state skipping the write entirely.

Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
---
 drivers/mux/gpio.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index f9c7863e51b82fb76ed03cf17308fae74716cf6d..cb2f38c1a9e247478f97fffaf1d5ddae4315d1a7 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -18,6 +18,7 @@
 
 struct mux_gpio {
 	struct gpio_descs *gpios;
+	struct gpio_desc *enable;
 };
 
 static int mux_gpio_set(struct mux_control *mux, int state)
@@ -25,12 +26,26 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 	struct mux_gpio *mux_gpio = mux_chip_priv(mux->chip);
 	DECLARE_BITMAP(values, BITS_PER_TYPE(state));
 	u32 value = state;
+	int ret;
+
+	/*
+	 * The gpios might not be updated atomically, disable the mux
+	 * meanwhile.
+	 */
+	ret = gpiod_set_value_cansleep(mux_gpio->enable, 0);
+	if (ret)
+		return ret;
+
+	if (state == MUX_IDLE_DISCONNECT)
+		return 0;
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	ret = gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
+	if (ret)
+		return ret;
 
-	return 0;
+	return gpiod_set_value_cansleep(mux_gpio->enable, 1);
 }
 
 static const struct mux_control_ops mux_gpio_ops = {
@@ -63,6 +78,11 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	mux_gpio = mux_chip_priv(mux_chip);
 	mux_chip->ops = &mux_gpio_ops;
 
+	mux_gpio->enable = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(mux_gpio->enable))
+		return dev_err_probe(dev, PTR_ERR(mux_gpio->enable),
+				     "failed to get optional enable gpio\n");
+
 	mux_gpio->gpios = devm_gpiod_get_array(dev, "mux", GPIOD_OUT_LOW);
 	if (IS_ERR(mux_gpio->gpios))
 		return dev_err_probe(dev, PTR_ERR(mux_gpio->gpios),
@@ -71,15 +91,22 @@ static int mux_gpio_probe(struct platform_device *pdev)
 	mux_chip->mux->states = BIT(pins);
 
 	ret = device_property_read_u32(dev, "idle-state", (u32 *)&idle_state);
-	if (ret >= 0 && idle_state != MUX_IDLE_AS_IS) {
-		if (idle_state < 0 || idle_state >= mux_chip->mux->states) {
-			dev_err(dev, "invalid idle-state %u\n", idle_state);
-			return -EINVAL;
-		}
+	if (ret < 0)
+		idle_state = mux_chip->mux->idle_state;
 
-		mux_chip->mux->idle_state = idle_state;
+	if (idle_state == MUX_IDLE_DISCONNECT && !mux_gpio->enable) {
+		dev_err(dev, "idle-state disconnect requires enable-gpios\n");
+		return -EINVAL;
 	}
 
+	if (idle_state != MUX_IDLE_AS_IS && idle_state != MUX_IDLE_DISCONNECT &&
+	    (idle_state < 0 || idle_state >= mux_chip->mux->states)) {
+		dev_err(dev, "invalid idle-state %d\n", idle_state);
+		return -EINVAL;
+	}
+
+	mux_chip->mux->idle_state = idle_state;
+
 	ret = devm_regulator_get_enable_optional(dev, "mux");
 	if (ret && ret != -ENODEV)
 		return dev_err_probe(dev, ret, "failed to get/enable mux supply\n");

-- 
2.47.3

