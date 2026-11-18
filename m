Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013702;
	b=HKw+zk5+XrqG9rtOT4QG2RIkBwazx9MpydNFFY9jrAAU/f6TbBgtHr+Bae71i3P73guT
	 otA3LiybqP8LtGMfVtx0Ccy9Fbb8xDPw6AcxtBxMbMG/oTF4O2tzwhMwsJyPTw2retsrh
	 mKxeAlUlspUx5JdkK4SIKMj3lmwnQIQTpcVecO9xTm61umjRi6G+e8W3MAaRK9JvcVUOL
	 U87D55W2SZrO9vurE2CnxnBH67lN49yqhj+vmH/cPoyf9xUZlElvJSK1s2r5wlAcosGFi
	 saU4xFlmC0Q9ozkaJNpHuSLBnS/8iQPfcZTymB0B4Tp1CToZQbdPBhQHIbMEnXJQKVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013702;
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
	bh=7oCCgjYzZJzbpaZ05GSgn3Hf0a4eBKBCp07jqv/ifLs=;
	b=3upnd2wuJywLs2fJQbKA9l3twQLX+QY2SVqiNJx4tijVDTlxoHaSZ8OpSd8qS+CCPi6f
	 DyHbSXbCiyE121u3khcbYtdgW+vU6PXPp1CdKLEBEn0agI9mI6mhTOv6ft1HzHAGeIigU
	 ghdvQ2mZA02IpeAyw111Qu7ymoFMYwHa+p4OBCJDhLyo2v/SoKCKnf1OPtta69E82MOSF
	 ny+eKUDsjqo6NQauaCe3FQuPSLxm9tDQMh7uFOZ2R1OVQw6d+KU9TAZPIb2OApAKUQTY6
	 /9MAQ+V8gTPORQ2byymNJ4fmvoFtqubEpCDs3Pyk/T5/XDa77JtZlJaxHLY92KEc3bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=htecgroup.com;
	spf=pass smtp.mailfrom=htecgroup.com;
	dkim=pass header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b="Ou5xa/PD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.137
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020137.outbound.protection.outlook.com [52.101.84.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA9606A31C;
	Wed, 18 Nov 2026 14:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b=Ou5xa/PD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obSnnoDm630C4ywQYCIPRAQ3DkJXv+bcHetc/ACqNiSlW/cb4XgjM56W7SbIrMioGrWuGdAyd6HCTq0eMT0P36zvUm7+jVxUUVZHOTfHlR7rurI6lDQpeABu92X8rCnmidbRltB6HsDgYZ3fVTPNMcTUaWAIWhm93UsLficX/4nbDsJwjQSL6Z+ym1lToKu2F6QN0kCpXJNEp/z2+Gw4mlIDtsQPk1XhMehjPx3UGbwR1TBlyebCFi1CbwjevFY+WRZOKGrIWW8Y6rzL1XOMtQkqcowpnV/AloaP5bczmxO/4Oe/kaLxgfl74yEIj8DsU1ArPA2nx5NTNDk2/p6DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oCCgjYzZJzbpaZ05GSgn3Hf0a4eBKBCp07jqv/ifLs=;
 b=k1JZWT0qZlg3dK5Ft5fLWfrAHEiCjAzrhNS9WyeULQ3hib44W6W/ljGDTeRUCJWWxue5P2TQzAHSTTAUQOKyFvzNBz+lASa6uke8i1llFdHfVBocDpiq7LypUtAmlb6XCAMwWEFT1glQcPAFpDPGf0V/xzx102yZanFwUkOBxqKlrm66HzKJzeuTqa8cFEG1FwY/xatpXKdYBwwhskOkkwPChKd/JmJ9+pczAFY0UKyiNgni3BYhvxXxZWX0D8ewYMapQtnZ1W5MYXmPQuDX6Epy+fvt44Yg1canmSt+JSdBrbdVtPLDeIBLiskdF/ZdrMrfnDDWJG0mwEVnR6EjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oCCgjYzZJzbpaZ05GSgn3Hf0a4eBKBCp07jqv/ifLs=;
 b=Ou5xa/PDsRifGS4ev8tAbBmRwWjT6DGCqoons3jZPAVAn89KR67PvUhNyuAeGBavT8nMJ3d6q5i31DoSZqhjStpetFmkxE6TKIsbuL6ZqmB07kSZ7ijd+eqXHZcZwYg79obO5SP3Qr4duaMrTzYOMLdQlhMO9cz/xoFxMJajlCASvxrYjJrCb/zhud4QV3JIsmHrZGZWQ0jR/0bClzqQn6U0CpGLCO0c9D4VUiuUTcT58otbKiu8PlKi4LKtKr6rmnlL3SuRfKqdjJItELt1AGGJw/VwzLT60RAqtZBV41YvtkLCRXSB/uCEEShFpa+n3Tz9Xmj7GR4iFJ4waz/bKg==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by PA4PR09MB4559.eurprd09.prod.outlook.com
 (2603:10a6:102:f3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:54:55 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%7]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:54:55 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "daniel.lezcano@kernel.org"
	<daniel.lezcano@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"palmer@sifive.com" <palmer@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Topic: [PATCH v3 5/8] dt-bindings: timer: Add MIPS P8700 ACLINT MTIMER
Thread-Index: AQHddcFlASPgk19b/0evbbBIkPjnvbcw9NAAgAL5NwA=
Date: Wed, 18 Nov 2026 14:54:54 +0000
Message-ID: <b441b559-9070-4265-a720-035ebef702e8@htecgroup.com>
References: <20261116-exquisite-taco-e48371fe6912@spud>
In-Reply-To: <20261116-exquisite-taco-e48371fe6912@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|PA4PR09MB4559:EE_
x-ms-office365-filtering-correlation-id: 14d5cb51-69c2-4043-5aec-08df4583e847
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|261102123227099003|10067099003|11063799006|56012099006|261026121527099003|261021121427099003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info:
 Jug8pBBl3iPLqIRMWpPsjL0kJU17ZaJd/CFDRrOxymG303Zt9Lg6fHtcHINhVv0OJM3/X9s62NAfe/0h2BGHMUCa4gbeztOAPE1nSCM06kG2khLOER0YVfmp/TXRTiy6QO28FcJi5oH4UgSfmM8GzDZ/sGvJ6mmf4udwVR/A5JRU5pI5AM2+kWhN4w6MnKKZwTkzDf58j3UlZsQtvOAehbPEjMW/HCcTnmQ9XdJ8Tv6jSQ97HQptE2k23ChIzfVUMm9LwOCzgof8vQKNpexjlf451uyN1guBnh7p+Hdh8gf/+4AVNupLJxIxd1v4zOOMtg60Zw6/HZGaK5vIPVlF+xu8ClR0flMO/StBF6+ls71Jsjv3nNCT24UoPjzyBPsA+EFkLIjyjay3l/FXlNcEjDT/pnm6gDmaPeSvDt+DbxsSQsRgVuOCizaECK2sTs+2BTjd2/7tvfauOCGTYhl461PK3Fsr+3E4vHPhW0ab5+hA9EhfNmw4xE4aMk22Iw3+u+Ev7/Bx42IQNDg5ljBdfJG+hGwhZGVnfVBFJ9NdNejBStyyoVtgt+J7VwB5cahIOzsZNeSeajp6gACLb82IYlL9eXlrOC+G0DYUDl5heDU2/dDV/zgnAtsL3jbhUyRx60rUh3CohReIXzNcx0k+R7pZ3Eb4Bz34GK3jjjYDiFyEcD/wJsMH1f3te0eqMJceccqk0RSKwuCIR7+CQ9j5fw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(261102123227099003)(10067099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VlZQOUxyOUdmWGd3SjNpajhabkk0STdpSVNHcGJtUzdncXR2NzhibzBQVFpT?=
 =?utf-8?B?VDVzank5M2wycDhzanFNUWtSdndtc2Z5ZVBoOGQ0clFHZTNKMzFoZElyWCtT?=
 =?utf-8?B?WFdCRDhOY25QQWQ4Ukg0WGdjaTFYeU83RFNsOXN3dk1iNVFJNlEvNmgxZVVP?=
 =?utf-8?B?anNPMnVmb28yNmZpaW9FYTNDQlhRQmxaQjh0ZWhVQ2ppOW9MOW9obEhBSHMr?=
 =?utf-8?B?MWJpMUR0eUo3M1UzMlR6RnZaU1VjYXdwbUJaY0pEZlM4RkpkS3dkSDlwUTI0?=
 =?utf-8?B?VFVlNGY3VmlGYTdUWFlGTGhwT0dUaEdvbVF3TU05a2pXczIySXhjamlCZzBm?=
 =?utf-8?B?TzlwYldCNUVVaXMwaTlza2tuemRMeWN4M0VQNVgyaktQVy9qMXhoY1J4QTZ0?=
 =?utf-8?B?NjNpNG5CV2UwVVg3YnpFeVRDcS9qb0pHT29ndjFqYUlTR1JhMUdKeXprcUdr?=
 =?utf-8?B?L1VaYVJtMEhJU2EyZm5sM3FzVkJWc085YlRIZnhUbDlGNzRGTTZVRW94Zlor?=
 =?utf-8?B?TXlLVHordWxad0FOM3ZWMEFNUXJTS1dnRUFveE5UUXJBOEpvb2FsV09vRE9q?=
 =?utf-8?B?ZTA0YzFJR1RCV1dRYkJjZ01KSDR0RCtoR1dUSTl6OVNYdktZdm9weEcrNjAr?=
 =?utf-8?B?MFphM1J3ZjRyb1BVbkVXcy91NHNpT0ZISTRpWUZFdGMwOE1kMU8zQ2xvYWQz?=
 =?utf-8?B?aFF6anh5SHQ5TUlZY3pzMGRDVWttRFdldDE0NTlRc1lSd1V6VFNhRnlWK0I4?=
 =?utf-8?B?cGRRbnBmWUF1QUhsQ2dhVFFsUk14cVBVVXN6NFkxY28vekUvekFPeGRiQU5j?=
 =?utf-8?B?NjdNejhjSVdxVDcyRUJlZ0lwZlpEUUdubU1qNjRscFlqeDhIdWRnYjcrMG1z?=
 =?utf-8?B?UklCa1FxVDZBdUg5MHY1SnBScDEwb2ozdHJ4U2RUcGNLeU9FeWRvdUZ6Vlph?=
 =?utf-8?B?WWRPVE1jTENBZWlLVVh4WHFTbnhkRlJ5R0RJNFNDL0RyS2gwMlRYdFljY1Jk?=
 =?utf-8?B?N1AraHJRVWhWSkxkS3A1Ym1wREFlWWFYNW51NnZzcEVuQ1ZwaTJnejZCbFU1?=
 =?utf-8?B?Q09zUHZsVzBLZndzT2JtR081eVhHVHRjY3loQWloc1BRU2tVRXJwS1N1RnZ2?=
 =?utf-8?B?MlRvcEJBQnZPWWtybHErVm5wbDBMVnZYbWpRajlLdkorMXZGbGVtc1RmS2xL?=
 =?utf-8?B?OHNKT1Z0QmExZzVVZ3Z0NGZFZWFkRTZPU2tvY290ZHBQVHQxS25SaElHdkNk?=
 =?utf-8?B?TXc5SVVIUVgrd0hxcXg1emFFYXRDY1lhd2xyMi9LcW93cjdaWGVmaERvU3VB?=
 =?utf-8?B?TGhFakpyK2NodVpsZWtUM2VHNXc1Y2Y1YnhNS0t5VHJlZVRYY2tpL1dac1Bi?=
 =?utf-8?B?MmlHaFl3WGw2d3phdEo1dkVFclc3bVc5b2JWcjcrMExCODAwRUxEalozek5M?=
 =?utf-8?B?UWVGWHdaQ1RiTWRBRWdkeHgyUXd1cEs2bmkwZzVvVnkwU0tndWJpT2RwNG9S?=
 =?utf-8?B?blBjMjQ3QllXNjYxNGNTVjNlMEVkTXNaVEcwNGdESEd2YndrendLSlVCQXFI?=
 =?utf-8?B?SENpRldLMWpDTTl0d2YzR09sQWhzQjllaFd3b05oNHMzVTJFdVNETXVjcGd4?=
 =?utf-8?B?ZHl2UHk5Y3RiQzRGcUlxcnV5cnIrTHFqai8yYXR4YlhMdnlOVEZVYURCVzRU?=
 =?utf-8?B?RnEyd2VxZEtyUURlOEtHWmVKd05rZmkzL1JOUGg5UmNvN2wwVklJZGdSeVRw?=
 =?utf-8?B?N2JCMzhYR2NnTkVnYXVsYnJjeEdMTGtZNUVFenVKZmZ3QmNMeU92SHh0M1J5?=
 =?utf-8?B?aFZEWWk1cUxLVlltTUV4VlQxcnNMYkNOeGVWaUNNRnErVjVqSFBuQk13RXpQ?=
 =?utf-8?B?c3RKTnFYaVF1dDBNWVRHNUZ3UzF6c2N3VGVhZC9uQklGeFh4SHN3OXNIWlJX?=
 =?utf-8?B?QnJrSUpFbFBlQ0pLQktxY0NjZXB2TmVRai93djROeHRMUWlnNGMyazcwaHBC?=
 =?utf-8?B?RDNVUW9mbmZRM0Z1dlpUMmRYUlJ2NXBKNFc4MHlabTZuV3RLd0VneXRoaG9a?=
 =?utf-8?B?TmZnY3NlZnhsenRhNnFvclNzbThRSm1qaUFjS3Q2US9xbldicHZYRkIvelZt?=
 =?utf-8?B?ZVRSSzBHN2puSmIzQkw2KzNZMytCalpnYWhydGREVmRSSXRoWWhGbStWdER1?=
 =?utf-8?B?b2dGQnJ0ejJ4UTdFODg3VG4wclJwUUtVdXBjTU9LWk0zYndnYlRuOE44WFFh?=
 =?utf-8?B?cm5oK0RFUFovdjdwQndhTmcwT0lDaDRHNHh0ODM5cWQrb2t6TW05WjBJeFVK?=
 =?utf-8?B?aHM2Vk9XYUJLWGNrZjJhNDhnQ004TVRiSEFSK2prY2Q3UVRaZTcwdHNQZmpo?=
 =?utf-8?Q?48zT52HnlHsbMYkQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CD0E314CD83D34788E600509D0A98F1@eurprd09.prod.outlook.com>
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
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d5cb51-69c2-4043-5aec-08df4583e847
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 14:54:54.9447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NA7dGWLfmtEE7PirZFuKm01fPQlgCo+T1Ne4w+P+X9q09MtWqOvBJJ+2iB1NfE7F42ixOByPjcofz3GQAuCWQ74VY82LQgZADWx6oVSjZZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4559

T24gMTEvMTYvMjYgMTg6MzAsIENvbm9yIERvb2xleSB3cm90ZToNCj4gT24gTW9uLCBOb3YgMTYs
IDIwMjYgYXQgMTI6NTU6MTJQTSArMDEwMCwgQWxla3NhIFBhdW5vdmljIHZpYSBCNCBSZWxheSB3
cm90ZToNCj4+IEZyb206IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5vdmljQGh0ZWNncm91
cC5jb20+DQo+Pg0KPj4gRG9jdW1lbnQgdGhlIE1JUFMgUDg3MDAgQUNMSU5UIE1USU1FUi4NCj4+
IEV4dGVuZCBzdXBwb3J0IGZvciBib3RoIG10aW1lY21wIGFuZCBtdGltZSByZWdpc3RlcnMNCj4+
IHdpdGhpbiB0aGUgQUNMSU5UIE1USU1FUiwgaWRlbnRpZmllZCB2aWEgcmVnLW5hbWVzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYSBQYXVub3ZpYyA8YWxla3NhLnBhdW5vdmljQGh0ZWNn
cm91cC5jb20+DQo+IFBlcmhhcHMgd29ydGggbWVudGlvbmluZyB0aGF0IHdlIGFyZSBkb2luZyB0
aGlzIHRoaXMgd2F5IGJlY2F1c2Ugb3BlbnNiaQ0KPiBleHBlY3RzIHRoaXMgYmVoYXZpb3VyLCBh
cyBkb2VzIHUtYm9vdCwgZm9yIHRoZSByaXNjdixhY2xpbnQtbXRpbWVyDQo+IGNvbXBhdGlibGUg
YW5kIHdlIHdpc2ggdG8gYWxpZ24gdGhpcyBkZXZpY2Ugd2l0aCBpdC4NCj4NCj4gQWNrZWQtYnk6
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+DQo+IHB3LWJvdDogbm90
LWFwcGxpY2FibGUNClRoYW5rcyENCj4gKElmIEkgZW5kIHVwIGFwcGx5aW5nIHRoaXMsIEkgd2ls
bCBhbWVuZCB0aGUgY29tbWl0IG1lc3NhZ2UpDQpJIGNvdWxkIGRvIHRoYXQsIHNpbmNlIEknbSBz
ZW5kaW5nIG91dCB2NCBhbnl3YXkuwqANCg0KQmVzdCByZWdhcmRzLA0KQWxla3Nh
