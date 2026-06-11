Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023107.outbound.protection.outlook.com [52.101.83.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254AC3BE14D;
	Thu, 11 Jun 2026 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781178681; cv=fail; b=lq3mHGHyCyaLSDxwjhjg4/bGA7eOGk4kQ9dyd6upqu6fY/CSrAsjN4D2XDRGCJqxYvTLfyiZbs9/D91lElMDfeNEvzd0LddAKaZXVSN+1U9ne9DZ1Ei8zZwaBt67IqY0fIEgm/21q1mYPUHGHXEKQZ8KE3tP8h71p5+ewx/K2+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781178681; c=relaxed/simple;
	bh=k60brgHM/HwKkGJkVtcLv1trI84RqKp53qC6LT2a1hI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QTB03wD3RiZycKnJ+QDM0uggQmEPM1ERjmCR14sxIb6az5KHf0o+xRhqH08tlmrZCs+R2JQQ2zgU7NCOdbsIbaL9796nzQ671IBavZdu0UJI4iJieBuk6oksAk8/p7LWnwGmPmQxdORencDMW1piGS84qu7YMpkwMgjy9WsGWaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=HkUnEely; arc=fail smtp.client-ip=52.101.83.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="HkUnEely"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKp0P/jL14G/9lkbWgLNjKInVjPQZame52iemc8NOQqMMWo+yfi44/tSiBW7nTHhYVqKHL8PkLhVVdyj1vddQqMlBpvhMLaAZPHHO2YALrBIuRSqlb+j5l31DKrpsA4gm9sIv7UxEOVGC4IAxAUoj8FhfGvFU8gtEqZfj/DqF2MnLxSJ+sHEUNXQ+VZgJvQ6c5/PMV8PzMr9sP89GPSvYU5O8nY8kOuz06uZe2s8jfDm+tlvrBgNvj4G+PTndXgP5db/OA0tYDcuUF3749zM+2TSRsoMU4d/I3fxmMsZJb+SzMr3wb7TylLC3mgmvFKG2OLRLGbrzP0aiI4FCJM5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k60brgHM/HwKkGJkVtcLv1trI84RqKp53qC6LT2a1hI=;
 b=f8lvLpIpn1aYMBxdQQZXc2REC0ucn9lvPCPFLXoJfp8rP9Y74CY0d9uV8KO7Qo9u3pwTd5XSP2lHwOlA8iDQnqo37b600SbKULzyuRAelvqnF0FrCLlaSdp4PKqme/1uh0VJa0w7GaCAwBL/rcJFrwfx4OMo+MYqhykuilZ7/SNDDt2hC0xjjKiMCa35b/t3gR0zfRfzPFHLuDzcvA2mCmLQpuiqOfrNQFoj4dV+V1CFcpP30xA9VRKiBens3Dbk9lGBDeBZVEvg03JCyeac4ilJu85+HoHW51yTeahdYejATPnjjvWFZhFiulbIvtz4KWpLa3TqlHXO6p4+mf4dXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k60brgHM/HwKkGJkVtcLv1trI84RqKp53qC6LT2a1hI=;
 b=HkUnEelySiCr56s6RnOUDtE8tbzdsbL3Nc3RDx/FYW3XxTwYXQW8LoTEVzIHs3GEmlSinhitRFjomhMrV6986PNLXSL/My8acEtv2QoId5lA+VyN5+0KW+CrbLM0LnHp//oVhVNk9BPjfqFWGYymQP/j7b6sLEDZWJN7qy1QuH2DU3G/OUs02ONvKO0Bdxc2GNb5Mk3iQ+FuTWqG1AueTVL6sxu5u+qoj3NT21wbqUXsSVOvqhFBj/0zALXVOUWI9qi1SuYJgUysWVFIEc3IHqhVgU9fr+RNCfNaAjoMSAVtw0SnUaoFg702QhRM9Xf5mLxR/bBD9g4sZfw426o6Tg==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by AS8PR09MB6362.eurprd09.prod.outlook.com (2603:10a6:20b:5a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Thu, 11 Jun
 2026 11:51:15 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 11:51:15 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, Aleksa Paunovic
	<aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "cfu@mips.com"
	<cfu@mips.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"jstultz@google.com" <jstultz@google.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"wangruikang@iscas.ac.cn" <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
Thread-Topic: [PATCH v8 1/3] dt-bindings: timer: mips,p8700-gcru
Thread-Index: AQHc+LJE+/urAYSxOUeoe74xiU63u7Y47DKAgAAAnYCAAAyHgIAAA1kAgABDIQA=
Date: Thu, 11 Jun 2026 11:51:14 +0000
Message-ID: <7027c47b-7890-4850-976f-50a1c8cfbeca@htecgroup.com>
References: <a2b5c9b4-5fc0-4507-a221-8695ed9574d8@kernel.org>
In-Reply-To: <a2b5c9b4-5fc0-4507-a221-8695ed9574d8@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|AS8PR09MB6362:EE_
x-ms-office365-filtering-correlation-id: 2ad4c902-95a5-4329-9725-08dec7afbdc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|56012099006|11063799006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 QlkKNnHyxljI2Y0l05nICMWedDg32oQL6aDY824NUOqETaIUHKR/YJovL8utWBBQD0+l67mBLUtLsIsargA6dAMTo652/AUg63SiL3tkr3rXwZiQV1s0O0JqqCSLzK0yAB36a7GFnpLQKkWffPxpvOjzIQZzjOWzUGUwWh4SDE5WqTIr4+kwhagXoXfRZKLJtRiRCuL4TKir5gwkHgcNMH4LKwPKsSO60MwMEFya+LeRnHv07rTqLBq6UfBl9v2XKIgyk79S08rSyzyz4r39vbBdP/ScV35yn7LfZQKWbRwEfg+xt9twIGS3sPRjoPeV8V84lvI5g9hSQlYJrF41anGo6tnu0CtQTR0nr9qyRIU7rLy9PwShe36WBf/2y6EtpTulGAnN40JJZw56O3o6f32Akrgr7N+CdErng29E0CbhDhuAx69pNVYO4435CPRZFfMV62eWirB9nsJuaUSryrkoA4bEW2bALctCKRu7aiYM4gNVz6+lyUujpPuIYpJoFXRAtQqHRfdfKNVOsg7vUdEPn1AxLo8fc6YmcQRDusAV6BXmD4FLxWz03rEgxe3QVzMOGBDFsDyp3EwTHnCb773LepGIJR8c3fkgfs1uX9FZ5y7z93UM0scFwMxikDoGa5Kj2RNl/gYMRbKfg3Ta+Q2W9Kd1k6PEiCGIU+oP96KLwVJo6cQj2P7knPC7wgGUuW+LRR1Pou8wXz3l/nxv58rVCjaSd9zuZ4GS2FtBLrt10LC2AgVJgAWvTYgxYHhh
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(56012099006)(11063799006)(6133799003)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YUZkVnNvWmo2NzNqaVhLL1VXbVlYS2lYb1pnYjQzemFwalljeHQ0cnVPUGpm?=
 =?utf-8?B?NGZ2S1YyK3Q1NU1iM2VhOTNjakl0RlhLdnVWQ2JtVSt3c09OS245eXhvdExM?=
 =?utf-8?B?L1FWOEVQcGRYcUxtYkRsQk03ZjBRK1hMNWoyekhyMkpmK2VCaXNvZzc5VEV6?=
 =?utf-8?B?UUFpUDVpSlVIMzd5QmdYMFVaL0N6dDFRTmdoZ28rL3dZWHdtaHl3SCtXRTEr?=
 =?utf-8?B?ZHBWRWM2eFpuRFZMOUJPei8zVmpUS0xvZ3hIVmxzL2FnK1hZTit2ZjlWN25H?=
 =?utf-8?B?Yzh6K0Z1UTZBMTRuVnpLVlo1eVpQK0VNNis1VEdmOEdISysxb1MvcmRWU21h?=
 =?utf-8?B?d1BPL1JkK2NoS3FTQ0lEOXhJZmIyYUMxUVErYnZiQU5CR3JVOHBlYlIwRVAr?=
 =?utf-8?B?OHJocW5GVkJGQUdCbWJiVE55akFUQ2FkN05wWnkwYlFxcU42Z2k4S0F4RTVS?=
 =?utf-8?B?MStuWHNCSHFRcnR6Ni9helVtcUpRaFd1Vmw4WFRwRmtGdFlwRlplRFlXQmdY?=
 =?utf-8?B?WU5RT3krbWszQ3hvYnVwVGFmVkF2RTRXZW9NZmd4ak5BV2dVSVFoNlRKS0d2?=
 =?utf-8?B?aitYamV4aWoyblJma0RsTm54VmFTVEdhem9ubnJ4TStQYW5MdFJQL2M2Tm5M?=
 =?utf-8?B?bTZHbXRaN1d2MWJKa0ZiRDRNZjlZNUJ5alczL0JTVm9NVTdRVjQ1TnJCU0hV?=
 =?utf-8?B?MlNudURrY1gxQ1pNY1huV2gySWNhbnpKSWJobVRDdlFQbVU4eVRSK0I5ajRE?=
 =?utf-8?B?STdJcU84dGZ3czFHcFUvLzlJUDFNRXM5RHVvS013SU14Q2hjS005RUxXR3Zv?=
 =?utf-8?B?ckp1NElQQ2hscnhPaE9haDBYZUQwYVVzcHRSTzZaSFFMVDdLTlViRHQvUzQr?=
 =?utf-8?B?UzlqZThyZ2cwVE4zTFRaL1dCYm9nQWpnZDREZ2wyUmY3ZDUraVRlalVjK08w?=
 =?utf-8?B?OHpKbnJ3bnpFZExMakIxc2diaTZLeGV3TjJUU0tLeDFkMURZL2wxaUlxQXA1?=
 =?utf-8?B?cG5tVm5zSkhVVE9nWXhmVDluYkJ4OHo0UjhPaUpRUlFySTg5QURseExjREZt?=
 =?utf-8?B?a1ZZZXQ4b1RvUHNWQm4yN3l1Q2VYeE5HWHdEQ1RPQkMxZVgvQStWWklKRmFL?=
 =?utf-8?B?bHAxMXREYzhkQ1RmOU42M0lxNkNPdXlaSTI3aGtVbUxlYnVCWUtCdlYzUGla?=
 =?utf-8?B?SEFiVzJ6UEFjNXhyNDV3Q245UkQvdE1BSzJ6VitLNEVjZ1cxeHNSUXF6Rjkv?=
 =?utf-8?B?UDVTenZaeDFoOVh6MkNkMVFCeVNVWUs4U1BsTEs4dTRmK3RIVm5lYkVpZUNo?=
 =?utf-8?B?UVdIdG1sVzZuN0NYdVhHdG5MQXVpSDdnZjBVYUtXZW95RkdQbURjMEVzNkh6?=
 =?utf-8?B?bHp6YWVDTll2cVlOUTVFUElNR0xiOG1ldkUrVERRQ2xQZFZwbkZuRFkvUk9a?=
 =?utf-8?B?aE1MQ0xhUEMvZE90SnNyMVNPMDVwL0lFUkJxblF5THUzbFpyMFN3L05wR1Vk?=
 =?utf-8?B?TktLWnBDUGFRVWJ6eHlYQ2N0aFcxa1YvY2RJT0VTZllHS0YwQWFRTU5tOXhm?=
 =?utf-8?B?eDgxQTJGdHBPTW1Wb1Rrdk1UTERVOHpwMG1SV1B2VGhCelZQVVFkUStucmxV?=
 =?utf-8?B?eVJKYXBtN24zYmlsWmxNVTYyQzQ2VlZzeGJXU0FRdDdENjJ5Q1poKzhPVExo?=
 =?utf-8?B?aDV3VDhDcGNWdlhZKzBGMFI4SmhiQTdnaVhGVnpxLzM1NUYvSFZLZks4OTJt?=
 =?utf-8?B?RnVDaTQ0UzdEbGZBeWFyMWpwQ0V4THArWVdzM1VwTDBlaHJqK0xRRGJPaS9B?=
 =?utf-8?B?RjBGRUI1MVJGUTcrRkIyZlpwTERrNnhNNlZLckR3LzR1ZUVtNGdkUHRQVWZT?=
 =?utf-8?B?MUl2anoxQ1VGWTBQekxZTU9wMjBSQ1FqRnNEQkQ5aW81N1NOMWkzZGdlTG0y?=
 =?utf-8?B?ellWOURVV0tqTzBhUWFXa0FmZlo4UHJIWnk1ZjFlQWpZMmlaeGVsR21Cenoy?=
 =?utf-8?B?R0FCSVBUbDNyQzhONWI2eDMwNVdUZml5SXpVRUtzcDNEL3NmOHRZU1pUbXJH?=
 =?utf-8?B?aXZUMDdTMGowVGptbHFNbFRmWXhTbXZZVXlLczc3RlFIMXpZRktyUENkaVE4?=
 =?utf-8?B?RENyQnM4bHBvVFFtdmkwMUVwYTAxODlycDZJdDBKNkkyd285WHNjVnZoaGhs?=
 =?utf-8?B?d2FkY3hCTE4zMmYzUFVVcmhnZ0ViNnJFeVBZNGpOMWNCVVFGMmZXZjRRTllr?=
 =?utf-8?B?Ym9GRGVITG90ZFJDS3gra3ovcytEY2ZQUWduTkpVTTZiSzZzZFJRU3JzRmp3?=
 =?utf-8?B?NXoyb2JML04wWEhHTUZYa0xrQzNNQTlkZ2Z4RjBiVGU3YkZ4QzJBRWdnV0oy?=
 =?utf-8?Q?fLgqwoP1Q+dK8trG2CbpQKdQYqSnn/4NdvEbp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB550228417F2D41A19A44E573C142F3@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad4c902-95a5-4329-9725-08dec7afbdc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 11:51:14.9466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6HsLERHUpyKdq1JaBW+ENYCzZB4YGGdFAMN76R3GR/azHZ+s6cmzw2HZ2zz3YDXD9gCXhMCZz+3h59S43Kep22cJHXMRSAK9Kkwr6jSgho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB6362

T24gNi8xMS8yNiAwOTo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMTEvMDYv
MjAyNiAwOTozOSwgQWxla3NhIFBhdW5vdmljIHdyb3RlOg0KPj4gSGkgS3J6eXN6dG9mLA0KPj4N
Cj4+DQo+PiBPbiA2LzExLzI2IDA4OjU0LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+
IE9uIDExLzA2LzIwMjYgMDg6NTEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+IE9u
IDEwLzA2LzIwMjYgMTA6MjIsIEFsZWtzYSBQYXVub3ZpYyB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+
Pj4+PiBGcm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29t
Pg0KPj4+Pj4NCj4+Pj4+IEFkZCBkdC1iaW5kaW5ncyBmb3IgdGhlIEdDUi5VIG1lbW9yeSBtYXBw
ZWQgdGltZXIgZGV2aWNlIGZvciBSSVNDLVYNCj4+Pj4+IHBsYXRmb3Jtcy4gVGhlIEdDUi5VIG1l
bW9yeSByZWdpb24gY29udGFpbnMgc2hhZG93IGNvcGllcyBvZiB0aGUgUklTQy1WDQo+Pj4+PiBt
dGltZSByZWdpc3RlciBhbmQgdGhlIGhydGltZSBHbG9iYWwgQ29uZmlndXJhdGlvbiBSZWdpc3Rl
ci4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5w
YXVub3ZpY0BodGVjZ3JvdXAuY29tPg0KPj4+PiBZb3Uga2VlcCBpZ25vcmluZyByZXZpZXdzIHlv
dSByZWNlaXZlZCAoMTR0aCBNYXkhKSBhbmQgc2VuZGluZyBzYW1lIG1pc3Rha2UuDQo+Pj4+DQo+
Pj4+IENhbiB5b3UgYWRkcmVzcyB0aGUgZW1haWxzPw0KPj4gSSB3YXNuJ3QgcmVhbGx5IHN1cmUg
d2hhdCB0aGUgZXRpcXVldHRlIHdhcyBmb3IgcmVwbHlpbmcgdG8gU2FzaGlrbyByZXZpZXdzLCBz
byBJIGRlY2lkZWQgdG8NCj4+IGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZvciBvdGhlciBwYXRjaGVz
IGFuZCBzZW5kIGEgdjggd2l0aG91dCByZXBseWluZy4NCj4+DQo+PiBBcyBmb3IgdGhpcyBwYXRj
aCwgdGhlIEdDUi5VIGl0c2VsZiBkb2VzIHN0YXJ0IGF0IDB4N0YwMDAsIGJ1dCB0aGUgZmlyc3QN
Cj4+IGFjdHVhbCByZWdpc3RlciAobXRpbWUpIGlzIGF0IDB4N0YwNTAgWzFdLg0KPj4gSSdtIG5v
dCBzZWVpbmcgYW55IHdhcm5pbmdzIHdoZW4gcnVubmluZyBkdF9iaW5kaW5nX2NoZWNrLg0KPiBJ
dCdzIHN0aWxsIGEgd2FybmluZyB3aGljaCB5b3UgY2FuIGVhc2lseSByZXByb2R1Y2Ugb24gVz0x
IG9uIGR0cy4gWW91DQo+IENBTk5PVCBoYXZlIG1pc21hdGNoLiBJZiBibG9jayBzdGFydHMgYXQg
MHg3ZjAwMCwgZmlyc3QgcmVnaXN0ZXIgQ0FOTk9UDQo+IHN0YXJ0IGF0IGRpZmZlcmVudCBhZGRy
ZXNzIG9yIGl0IGNvbXBsZXRlbHkgZG9lcyBub3QgbWF0dGVyIHdoZXJlIHRoZQ0KPiByZWdpc3Rl
ciBpcy4gSXQncyBjb250cmFkaWN0b3J5LiBUaGUgYmxvY2sgc3RhcnQgYWRkcmVzcyBkZWZpbmVz
DQo+IHdoZXJlLi4uIGRvZXMgaXQgc3RhcnQuDQoNCllvdSBhcmUgcmlnaHQ6IEkganVzdCBjaGVj
a2VkIGJ5IG1hbnVhbGx5IHJ1bm5pbmcgZHRjIGFuZCB0aGUgd2FybmluZydzIGNsZWFybHkgdGhl
cmUuDQpXaWxsIGZpeCB0aGUgYWxpZ25tZW50IGluIHY5LiBUaGFua3MhDQrCoA0KDQpCZXN0IHJl
Z2FyZHMsDQpBbGVrc2HCoA==
