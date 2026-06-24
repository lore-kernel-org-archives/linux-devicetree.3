Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFAA1DF736;
	Wed, 24 Jun 2026 11:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782300166; cv=fail; b=S9UkV73m4z2IBiKmRGyfTEBBG++NqTAB8lbw4lDq0MV7XtOgSN2L8jfeHcXqHA3wM0wqumfjNmTNUQNwf4y8//8no4rrFG7MI3mIHuaRM2beEsxfkxap8r7ATjhkL74LxNkkWOuBSqyd8UhEHUNKWT1x785r1XhVTvMG++ZxqfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782300166; c=relaxed/simple;
	bh=EDxmolvtsK/skpgQbB19Bj2gznNSOwe68K5QCn1aUs8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IpR/7Y6bxwEhm59ATKwxu4s732CwGQPHahKYFEO7bjUCeXat8eoSjl4A2On6/lJr10D/1vO6mqsF0eNiUKPxRJ88xch2GPy4WleL1yl+3MdJ3nahN/WUey/J0A4pSBvhJwXjr6VFSpd+R+RzYmpUhgEskgIjq/qUvw2PVaeIuD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=NLVq+PQP; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="NLVq+PQP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GS4JwFOxwXraXn+msuQjIHeXye93F0Jn9wcUVZB4di6HYHAvjQMUd8rDG2IAm5d897AMGKgXpp+nvztD80i1Y1MoNAO3BvHaatKGQaZ0fzYHBzr5o+0LZ2c7uPENZCC9+no8YBEWFKgw8IvhAQv5vCE9pUbHMEhK5FEywZnqipwA67DTcXiuZc7E+0EoMaqzqTjpH+ZvPuHqepu1gwn3dlEhGQB3tbziVHsl/S2bmqYmy+KolFsO1igT4aE15WkU/ddx77ETSfGlBbHtZGZ8ahv89tMtTLt5RewZkaEW+FkIdqBhTXg52S/qdyFSBMZpbqZSlZbS+pM3STQft24K2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDxmolvtsK/skpgQbB19Bj2gznNSOwe68K5QCn1aUs8=;
 b=Y6Vf5Fdn4LHT4ITw3yk+7U6uTTrFLly7iFcCE+mltFf0Jnu9tTsvgYTROw+XPwPC6dv44AY+x6LxkcYtrwHsA1ulsTiiA55ALA8lIi0aG+4Cw+zJjtwDmOrvyRup1o6joenskq8EhZJMDZt+9+5LH/VZt5sG8reyp8TsV7H+wUQvrehfM18GJLAXSfh9G05iqwgQQVRbynKINj2lJQBT9o3difXxD/BzWmR90v7TiwmDXWW8wE3kZOcrCXhFZc8JCJNrW1mPAMPGTljKnewP/Pq3TmO71FR+xqD3oVxW5Z/GjpgqAyQGJOxENgVDlL0QrV7VgaOrZNdooWbnYhLH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDxmolvtsK/skpgQbB19Bj2gznNSOwe68K5QCn1aUs8=;
 b=NLVq+PQPRzmEjfiO7c17jfcx1fBQ/nrsmSRzjr46ELLZnw42GDnzgB6/EwRJ99PlrKMF7AGiM7wTj0hS7H6bFd9CHI1SiVw+Ccd3olmPlbQBIC20FSWc4kQlybLiQV0g0Lcul6CRCBDXBld8GvjD7m8W7Dn7FiTBPQPOAXc3gW/Zp+AF0+sNIh8MMmSdyf9XmBHhUv1qSkPLhvthc5wqjMajH89/jLNmiUNtiwFwYHZRGhRPfY2k10R1/I4HswFz1wpA1ueiUaZgfGj5lKSWekTRC9FzkCS9s3ukNwwCqi+nm1H055SvPsFRrd9bnhIbdB9qrQiOJo0qVbyb58W41g==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by BN5PR03MB8053.namprd03.prod.outlook.com (2603:10b6:408:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 11:22:42 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 11:22:42 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "dinguyen@kernel.org" <dinguyen@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: agilex7-gen2: Add initial device
 tree
Thread-Topic: [PATCH 2/2] arm64: dts: socfpga: agilex7-gen2: Add initial
 device tree
Thread-Index: AQHdAwHboTfmoPaHAUCdwYcbJC5I17ZNWDaAgAAm/QCAAAKGAIAAD84A
Date: Wed, 24 Jun 2026 11:22:42 +0000
Message-ID: <568e8d6c-c3a7-4e2b-9bde-3999e5043426@altera.com>
References:
 <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260623111716.16690-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260624-infallible-diligent-bulldog-bcbab2@quoll>
 <4acdd3ee-c7eb-4871-bb59-c2e3eeedda28@altera.com>
 <fa79f704-6c04-4052-9625-d371976c14f7@kernel.org>
In-Reply-To: <fa79f704-6c04-4052-9625-d371976c14f7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|BN5PR03MB8053:EE_
x-ms-office365-filtering-correlation-id: f44d9c57-8582-4309-9f43-08ded1e2e87a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|5023799004|4143699003|56012099006|55112099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 25FYCQmAjC9heP9B51MtU8SjauqqdZ0I5z5Yf2mZk4gcwTFQ4e3uXIfQ21DQ7oMMYwPMnJzTW/QKvmQvZv5m0qoqeqaEc065QH/ftHogjZzY3fMf7NoQheKc72osnM+10haJfDvrhgvDWYE5IzqeQ9Np1AhOCE11DdIJlwiX0cL1HqMqRQtoQ6x76nYSPjZAdi02aFFzG2nZZ30vgy0nc8jqPT/f0jWgnextcsO7D4VHaSG7DRnm8GxTrNv/XRGAmhYjWJ5auKw/ZudMcmvP1nGhtVTlS1dxQpKIe9Ncz7VeYXw/gsr9qG6dugTHCGJ0dBCmHtsL+1QLQSEqLfaMU6rYdSo7/k9Mln9WLMaP7UkxaY0A9f4HYA3JLHGD/HBoLFZl76k/R5vIorru9dghnst3Q9p/4Dca6WSZd88m4NmKnimZKdC8+5SoEnREo9TZ+1LtZuLeZvN4rVoFZAryDX2LqnVOSBKDHfUDA2krmBA0DBq4eiNnsUzWlc9ixS+heQMrNKur+/RbKKvtqCCco/6EEV4jtpteRPf66Qh1wvbMYRwoy0073PPm71LuQpvBIsrAGT2P5zyymbbkOZJhJDKcRkV/lc19C65eSmqdOrNEyKGQ8Lo8a8Svvopji061ZGAH6ymZcTl00ti3jnFoS/ZVGSkknjrsGTugyZiIx+HjFNZQYB0frEzBPK9zU5IN6gFUUQKVAj2IpaemQ4PO1ecljxdGUGh7DbAsexFpbXQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(5023799004)(4143699003)(56012099006)(55112099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmFBLzRMditWNDgzVHhvSEExeUpFZGYza1lxODU4aitCZDV4WUxkQStDNTF3?=
 =?utf-8?B?R1ZONHdYYXBEanhRaytjbzlCLzByQkpHZTlqM0RtMXMzcVJXenVLWWhtV0VF?=
 =?utf-8?B?M1BWeWQxSDRKeFdOQmNoV3kxclJlbGpoRXpabTdBZmpLMjIrYWtoVUdyUUZD?=
 =?utf-8?B?b2ZDR0RMODRLNll5ZG1XRHd6RnJlUGdST2ZkcjZiVGhsbEVVZzZNZVduUTEz?=
 =?utf-8?B?bXRzQUIxUHdib2JPRE9jeVF4WVVuRDFNa3ZGbGlDUW5GU3N5WmNDVWdCMjZP?=
 =?utf-8?B?MkYxUExVRlE2ZDRmNGkwVGwzY0gvcTdTUHhTdDF4WHNyMmwxcTVsRGsvYzZi?=
 =?utf-8?B?cGJYQVlIK1hmRlJCOVVTZWgwdEJnSGwrUis1WUJ3Q3FTSHcwUUw2MVhUMEpI?=
 =?utf-8?B?b0pyNWJrVitlRlo4ditsdDlCWlAxaFBNYXhsdG5ZZUladGE4NCt6ZmlnRXR3?=
 =?utf-8?B?aE0rMnVCSmwvMDAxWkZPQUsva1lEUno2MDRwVnYwVXJZcTRYWkYzU3locFhI?=
 =?utf-8?B?UXNCdHhjdGNIVnMxQmJUT0ZGNDI2eEI4SmhMNVA1NDRSZHpJRDVoeW91R0gw?=
 =?utf-8?B?SEMyYldPMXM1Z29OQ2dDazB3RUE5NExpSndkeG5KYXZiTkR2K0lkWHZucXdN?=
 =?utf-8?B?R0xHdXpHRWYzb3dNM1ZubG5HcmphQ3FDVnhYUFl4WlhucVlmWmQvem40aXlP?=
 =?utf-8?B?TzNPSm0wNHkxbHBoMFBMTzZIdXRWRTM0eno5VDVyMTUvQUV2cERCMGI3eTV0?=
 =?utf-8?B?UTZmVnlBdUNNTENLdWM0eDBja2E1eE02Z0FpQzFYMCtFbm1GeDlVZXowTGNa?=
 =?utf-8?B?M1k1Sk9GTzZLYXhkN3VrK2JXR0dsaEpWTUUzRTJ6ZUk2R21Hb2p0WGRvcWRL?=
 =?utf-8?B?OHJ3RUJ2dXpQU2FqcUVyUzVqVDA2dmU0NG11T3MvTFNoWkZLM2lUZ25POGFi?=
 =?utf-8?B?TUVIWXRHZGJLYkpkbDFCcUFhcEk4cnZNMFNLdVEvbjNRdmJpY1hnVjVhNFRa?=
 =?utf-8?B?SEttc1dqVTFRWXhTRTZwZWdTZkVHSS92Ujg1QVhDbGtXUzMzdDc5N3B3M2x3?=
 =?utf-8?B?VWMwa3B0T2NQYmRzZW1lLytOa1NvUytvTTh2Q1Z2MzhRNnFlZXpvY3dpK3R5?=
 =?utf-8?B?ZGt5REtJdTRMT2lZOUUrOE9lTitvUmJjSmJRY1plYWxBSkNOTVhyRnZqT3hR?=
 =?utf-8?B?UENTc3lPd1pIVXgya2JKV2k5RWh1TkNSNFZ2QzJYU29vVG53NnFxaFI5S2VJ?=
 =?utf-8?B?dkpwOGI3Z01ERnJvMjZkbEsxWktQRTJmWWdQYTE5emZjRHVKdTNsTTZwWDl5?=
 =?utf-8?B?ejkrMGtuZWNHVmFHYkhFUUdlTHRMc2FKOFVVM05CK0E2L29wTEp4YjVWY3kz?=
 =?utf-8?B?c0k0QTFaaE42WlVCNXB6bjlLTStXcElyeGtJNGJteTdhWUNRTzd1REZXZWMy?=
 =?utf-8?B?S3hJUTdUU0dwSk5hbFBDLytRQ001WmNKR1pZTXNxbDVzMDQwSldkeWtPSmZY?=
 =?utf-8?B?c0t3bUtzUTVaSXRCb1hCUnVyRXU3NGVaK1hFQ0NYSGMvcUpZSnF2SDhSRUo2?=
 =?utf-8?B?UkRSS0dGUXdVYnlwaU5PU1cySEluZWw2VnA2aVJKSXVWV0VrNG1WanM3N2VF?=
 =?utf-8?B?T01sUFFNQ2ZJVVZTSjhhUkJoNFMvdHhOcmJ5QjBzeitSL3V3Zzk1UjFCNGVV?=
 =?utf-8?B?TFVTeW9tRUpYeXliWmZZeDV3QWtKN3N2WkxyT2xkMHJDZjA1Q1pjNmxVS0Ez?=
 =?utf-8?B?YlNqekpXQnhJNlJySTJYZEtwV1B0WFhJcE9JWnozZllGQUdWSHNFMllLOFZI?=
 =?utf-8?B?Wjd6TklwaExUbFNKYTN3NEdFalVNckZweUxEM3N6dStieCs2bDlXQVN3RHJ1?=
 =?utf-8?B?NUxrTEQwNXpYdFVYTkZCc0tyK1BZbHorVG9LNVd5NHI1LzlaaldGZTVrQ1Q4?=
 =?utf-8?B?em5KbVJCMkRLbnY2ekVBVjVoaU1iRVBmSnJVb1V5VjBXT0FqZmcySW0xTm9N?=
 =?utf-8?B?M0tUNFRiT05rK21BYytZc2VjUEhSU0dVUjNRTzY4U2RncDEyS1UwSm9GMGRl?=
 =?utf-8?B?NjJ2M25EcUNCbDBRZjU2K2tQVTkzY2F2OFM4Y3FhM3RKMXRNNkZpNTNOTDc0?=
 =?utf-8?B?SWNuc3doRHI2Zms2N2N6S1dQdDRjNmhwVjluWDVXSUs3bHZJa0RrTVEzajB6?=
 =?utf-8?B?b25oK1c5UmlBQmphT0N4aURBYXpqcXp2MWU5ZjhPd2Nadi9FQTAwdGEvMEtO?=
 =?utf-8?B?UGVFSVZrQVBDTlJVdHExRjY4M2lRRUFDYlVMTTU2bG9KMjFHb0RUNkw2Y041?=
 =?utf-8?B?emJBNFZmcm1pbEVSdFh2alAvbzRPWjA0dkt1Q3JHcjZ5NHdlU0JyRkpoVFN2?=
 =?utf-8?Q?lQY+R3s0THrQHxMAJCHpNhh0gL/YiRusCpMyuGDpKZ78u?=
x-ms-exchange-antispam-messagedata-1: a1tRfXz4cf6rpn5VVDr4qeCeakvqfnXUOJs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF75E9825E21B849B2B90373CDA1CFF2@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44d9c57-8582-4309-9f43-08ded1e2e87a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 11:22:42.6199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gelRMo/ouZMPtXCJf33s9WzmC8xnuzUSBHb7d0gpMPjT726DY9r8kvELJ+TyTEGhc379YeYUw9xKP0qZuXT74NhoDo1ozOcWiPdEEz36HDEUYMyMwA1U3xPwRsWDKcnLm+Gs52RDMYndxg8qvJ9LCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8053

T24gMjQvNi8yMDI2IDY6MjYgcG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDI0
LzA2LzIwMjYgMTI6MTcsIE5hemxlIEFzbWFkZSwgTXVoYW1tYWQgTmF6aW0gQW1pcnVsIHdyb3Rl
Og0KPj4+IFNvQyB3aXRob3V0IGFueSBpbnRlcmZhY2UsIHNlcmlhbCBvciBzdG9yYWdlIG9yIG5l
dHdvcmssIGlzIGNsb3NlIHRvDQo+Pj4gdXNlbGVzcyBvbmUuDQo+Pj4NCj4+PiBJIGRvbid0IHNl
ZSBhIHBvaW50IGluIGhhdmluZyBpdCBpbiBtYWlubGluZS4gU2VyaWFsIGlzIHVzdWFsbHkgQUJT
T0xVVEUNCj4+PiBtaW5pbXVtLg0KPj4+DQo+Pj4gQmVzdCByZWdhcmRzLA0KPj4+IEtyenlzenRv
Zg0KPj4+DQo+PiBIaSBLcnp5c3p0b2YsDQo+Pg0KPj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3
IGFuZCBmYXN0IHJlc3BvbnNlIQ0KPj4NCj4+IEkgcmFuIGJvdGggZHRfYmluZGluZ19jaGVjayBh
bmQgZHRic19jaGVjayAod2l0aCBDSEVDS19EVEJTPXkpIGxvY2FsbHkg4oCUDQo+PiBib3RoIHBh
c3NlZCB3aXRob3V0IGVycm9ycy4gQ291bGQgeW91IGNsYXJpZnkgd2hpY2ggc3BlY2lmaWMgdGVz
dCB5b3UNCj4+IGJlbGlldmUgaXMgZmFpbGluZz8NCj4gDQo+IEkgd291bGQgZXhwZWN0IHNpbXBs
ZS1idXMgc2NoZW1hIHdhcm5pbmcgb3IgVz0xLCBiZWNhdXNlIG5vZGUgaXMgcGxhY2VkDQo+IG91
dHNpZGUgb2Ygc29jQCwgYnV0IG1heWJlIHRoZXJlIGlzIG5vIHN1Y2guDQogPiA+Pg0KPj4gUmVn
YXJkaW5nICJNTUlPIGdvZXMgdG8gTU1JTyIg4oCUIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBH
SUMNCj4gDQo+IENvbW1lbnRzIGFyZSBwbGFjZWQgaW4gdmVyeSBzcGVjaWZpYyBhbmQgaW50ZW50
aW9uYWwgcGxhY2UuIFBsZWFzZSByZWFkDQo+IGd1aWRlcyBob3cgbWFpbGluZyBsaXN0IGluLWxp
bmUgcmV2aWV3IHdvcmtzIGJlZm9yZSBwb3N0aW5nIHBhdGNoZXMuDQpBcG9sb2dpZXMgb24gdGhp
cyBtYXR0ZXIuPg0KPj4gKGludGVycnVwdC1jb250cm9sbGVyQDcwMDAwMDApIGJlaW5nIHBsYWNl
ZCBhdCB0aGUgcm9vdCBsZXZlbCBpbnN0ZWFkIG9mDQo+PiB1bmRlciB0aGUgc29jIGJ1cyBub2Rl
Pw0KPj4NCj4+IFJlZ2FyZGluZyB0aGUgc2VyaWFsIGNvbnNvbGUg4oCUIHRoZSBwbGF0Zm9ybSBj
bG9jayBkcml2ZXIgaXMgbm90IHlldA0KPj4gdXBzdHJlYW0sIHNvIHRoZSBVQVJUIGRlcGVuZHMg
b24gY2xrbWdyLiBXb3VsZCBhZGRpbmcgdGhlIFVBUlQgd2l0aA0KPj4gY2xvY2stZnJlcXVlbmN5
IGJlIGFjY2VwdGFibGUgYXMgYW4gaW50ZXJpbSBzb2x1dGlvbj8NCj4gDQo+IEFkZCBjb21wbGV0
ZSB3b3JraW5nIHNlcmlhbC4gV2h5IGNhbid0IHlvdSB1c2UgZml4ZWQgcGxhY2Vob2xkZXIgY2xv
Y2s/DQo+IFRoZXJlIGFyZSBwcm9iYWJseSBtdWx0aXBsZSB3YXlzIHRvIHNvbHZlIGl0LCBub3Qg
bmVjZXNzYXJ5DQo+IGNsb2NrLWZyZXF1ZW5jeSBhbmQgSSBkbyBub3QgZXZlbiByZW1lbWJlciBp
ZiBjbG9jay1mcmVxdWVuY3kgaXMgYWxsb3dlZC4NCldpbGwgYWRkIGEgVUFSVCBub2RlIHdpdGgg
YSBmaXhlZC1jbG9jayBwbGFjZWhvbGRlcj4NCj4gQnV0IGlmIHlvdSBjYW5ub3QgYnJpbmcgc2Vy
aWFsLCB0aGVuIG15IGNvbW1lbnQgc3RheXMgdmFsaWQ6IHRoaXMgaXMNCj4gdW51c2FibGUgdXBz
dHJlYW0gdGh1cyBpcyBub3QgcmVhZHkgdG8gYmUgcG9zdGVkIGFuZCBtZXJnZWQuDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KU29ycnkgSSBoYWQgdG8gcmVwbHkgYWdhaW4gdG8g
dGhpcyB0aHJlYWQgZHVlIHRvIG5vdCBpbmNsdWRpbmcgYWxsIA0KcmVjaXBpZW50IGp1c3Qgbm93
LiBBbHNvIG9uZSB0aGluZyB0byBtZW50aW9uLCB0aGlzIHBhdGNoIGFjdHVhbGx5IGEgVjEgDQp2
ZXJzaW9uIGFuZCBsYXRlc3Qgc2hvdWxkIGJlIHYyIGJ1dCBpdCBpcyBqdXN0IGEgZGV2aWNlIHJl
bmFtaW5nIGNoYW5nZSANCm9uIHRoZSBsYXRlc3Qgb25lIHNvIHRoZSBjb21tZW50IHN0aWxsIHZh
bGlkLiBXaWxsIHNlbmQgb3V0IHYzIG9uY2UgaXQgDQppcyByZWFkeSEgVGhhbmtzIEtyenlzenRv
ZiENCg0KQlIsDQpOYXppbQ0KDQo=
