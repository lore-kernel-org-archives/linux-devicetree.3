Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010042.outbound.protection.outlook.com [52.101.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920813A1B5;
	Wed, 24 Jun 2026 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296231; cv=fail; b=glU4naZ7dwX1hQL7K+xqPyNB795UZ8c5WOhuYCGtr9pGpb10VLKeE58LB1mTxZIIYnSaIwUL1l/zkRYOxzsbqlkT84hxxwbv3ksXbUqTBgOxoG6zqoNjM0VLvmYDlbArzvi8KSmj/1N2b7IC73CUcxwyqP7HFzMuLITuDRN+ruk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296231; c=relaxed/simple;
	bh=wyVaEhjWjED22dUyoZ9aqLHKhYcJdNzc3TJomn5GgZw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ardB9mDxGP4oKSyQvQhxU32j2OVmfL/1buj2lqacw0FDZ62kDTcLhK65MuIT021DzWLruui5WK63oi38I/LsI8EzbXN+2CF/Fp2P5QiWMYP5IIe8aNLf62Dwh1jQ4J6//8n5SKkJZosRnSzAQttk9xZsGIbl3y3UO8bdFlWPrIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IQEi9J8/; arc=fail smtp.client-ip=52.101.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IQEi9J8/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2WNbcze1OudQ1AWRFW7zgzftT/E7frAUHD/guQQWQZ88F/WA1MECpZ0ZDguuMYw49fMc6FlmOCcBHV0GT8xE+Q5ktpBQg9Ne6yS/BJAUBfDpyKg4sdO+461g0Ge3OWyySBe/VTzlArZunQz9YGjwJxLkfT39rr02UbtaEmsArPX8iqy6y3mAqZWO0lCkJ34KpHW4sQbl5u2XY7fRwKuOGVr3K7DJMJbuH7d8Bclj+kt/s4p34lX43eWG5tI4rd7HRIsOMihp3+mPmcNzI+zouvNxbZtovcNksWE+cjwiuL+VtDRrVjRPkgU7rasUAcF6KwgF0LE3G+A20VoH76obA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyVaEhjWjED22dUyoZ9aqLHKhYcJdNzc3TJomn5GgZw=;
 b=ijV29tw25fkJlosFpA672WeYiy322/CIzMsvCCssJu/cxREbZV07Rfl88HVTY5yTlqSdKgld4ablb5cBF5HmQ9YNRujAz1yW22zShXBUDGJuF9f9dRxmnm14JwDIn2tfEEuQEgB9aTaaRQKj5vUC1myOaibXv5wehoEhogfEd6mgdWgsOVEi9urFTefoKszeHUprkXFsPHWY3kSdeiOOf314TNzMVOTbSETGmXw+ZUTm7FbxzS36wm1o9d8ZCetqqzXKCMChkpWLmNdbfDRoWz4T61pVqeentitNsLG57x9W/hN0yEnMRXcbDxZWYj/CwGLYpLcotwVmdoav9wDx3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyVaEhjWjED22dUyoZ9aqLHKhYcJdNzc3TJomn5GgZw=;
 b=IQEi9J8/6I9yEo0nc+KoDPnVomUNwuyozLmoDgDSCfAKFqIKHE3rr9DkmztZ03fRg8f9LZCIh3vjdAdl6zxfFoER7YoXnzwVuOsSf7DOASRtOWhvYJ2Dp0wxx42gbVYjsXugnn6Paz8RabPl7288GY4pK0HLMySHHhnsNgbfummBWhYgwA6Xo8XjUtz2EJn3/v4Z+0krtqY9jIOZjDuTnj/tcqhxe9YfmPIdTNkoCalWcGHryEOGf1/ZsfSjSqWFufX43pN+hhkmVt+o28DLGFYEuR/O/mXa+sW5M5kGXKvBrw75VBbJzKRT/87H6MORuKuZ8JoBFDyUBEcIOD07HQ==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB5896.namprd03.prod.outlook.com (2603:10b6:510:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:17:08 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 10:17:07 +0000
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
Thread-Index: AQHdAwHboTfmoPaHAUCdwYcbJC5I17ZNWDaAgAAm/QA=
Date: Wed, 24 Jun 2026 10:17:07 +0000
Message-ID: <4acdd3ee-c7eb-4871-bb59-c2e3eeedda28@altera.com>
References:
 <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260623111716.16690-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260624-infallible-diligent-bulldog-bcbab2@quoll>
In-Reply-To: <20260624-infallible-diligent-bulldog-bcbab2@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|PH0PR03MB5896:EE_
x-ms-office365-filtering-correlation-id: 65e75beb-43a9-4f40-ec4f-08ded1d9bf1b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003|55112099003|38070700021;
x-microsoft-antispam-message-info:
 RgU5WC/mRYueR7pylPhfQ0H0ltRRIxQ+MAqoiGWo4Ah8jc7p64VAvAH0Prl9EiT0B/ffkS84t7XF3sQTrW+dc5vpwh/w3rRO5+OpbDWYGDzK1b1dbQBvywHOeWHPgdwfecxzjXisTJ+Z/Z0hBY/kkHGtY5M3JhN/q9SjAaEguB4ecBN8cgDO31y4zXERRIzzr+7RYqJKIMzk+hPkKaH/YCPD0beBtgvwjcSch1sIymID5/4MeA+BsBARAXcwMo8CWEFAuB0jAgHME4QYfN9AynLrnTYeo6Rqr/dW4TvtnpkuY5x+zJWL+zhAIBgst1HgM8UtCo/didQFKWHFkm+KU0V5nD6xhl6QrzSXWl6SaodKNMKD8JQ9VPcdEZcmWbUqjh92yYqcuA6BqRfBQxKXXYMkxDQ9m2L2EnkxnAFg3Vy3HyU+U+e47mbjQNDmif7wDGnqng6xJVqiSrVZMIZBrN0zI6x8JjbMWXffbVmw+QUxPoAMag6IXP3P9aZQmRkNC1cH3WuopqttpzMezUDoyCpeXTvWc723BmGv72eFG6gMq87o6+vZCZpyCpkZT9BmYESwjR64AwrcjSaTIS9GL80AYBICjWSNbpskCKxum9gc1wLffaivlEGyOJcnjhtUhW4MmtInS6/zCwpQ/NRJAQg2iqtZCZiCpkk7GfYuBLe0jpivFN2mPQZq645Ma2AwoAxhrDsM2mxz6PCYFHafjeeYb2qPSq9b1GMHroYl9PM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2lDOUlwTWwwK0FXQlBCb2lRR1pBK1AzM0dzTk9JYmdKVWZtcVpwU0ViQWhQ?=
 =?utf-8?B?U3h0Q0NqWVlpRDFGYkhGVUFXMHdMa0laZnFOT2xaVWFVaVh2SndKckVtVmxQ?=
 =?utf-8?B?YVJTcHZoRkdEaGkwOExsdUZ4bHg3UjZmVGVJSHU4ZE92ajgvUjFDWWxBNGIy?=
 =?utf-8?B?d21ELzE1VlYxYnN2WHpCV1kvTEZSYkVzVERxUEdmUEw3NnZCK2IrOFp0d0hL?=
 =?utf-8?B?dmc1cGR0S0FIWmVpTWprT3RranliemdjQkRlNUxhUFd5bHRjWEhUWWhVelpH?=
 =?utf-8?B?Vnh5dysvV1lkUW9QODE5QXlMem1vSTZPakdtSm84RXFyYldMaklZZmN6eTUy?=
 =?utf-8?B?bXpJV2RFdlhYTitwbmx1eUVvdEo1VzhmSlpFSUxxVTNXakgzOVBzUFI3QWR6?=
 =?utf-8?B?UFBLdnpqY0tnYy96S1NVODlzeDdWVDJzQUlnc0JTZkNzdWhzZFJueTdNY1Rr?=
 =?utf-8?B?aUdGZ0lGaFo3U09sREozbGNST0NBM3ZFbTJVM04yWFRuM2xHYmtTUE5kaEZR?=
 =?utf-8?B?dkR1VHU2WUJ1MjY4ZUIyeXV6SVN3YWtTMlVOaEc0RmJtREszYjE0czhZV1Jl?=
 =?utf-8?B?U0I3d3RoNmhMOVI5a3FlVUdtQ3JNNHB4cVpiZVpuMGlxak9jK25UcUhZVHF2?=
 =?utf-8?B?ZVd4cHl3OXYwRmRJZHlxV3NUQ3M4WGtTb1JJNmJ3UHorc1p4amdnb2orSzQ4?=
 =?utf-8?B?RFBwUytEZUZXcktiUEc3RHRaMUd4N1k4SUd1RnlnRE5HQzdRTEVFYTU0d1pJ?=
 =?utf-8?B?NVdTQkdidmxqUFk2MytQTEVtVU1pcDlBRHJ4dkFzUUo5T3RmUlY1V2FDZjJG?=
 =?utf-8?B?d0h2MGVYbU9zdk9jQU03aE4zNi8yR1psUFZ4WWVkajBES0hvQ3BjOEpvc0Zu?=
 =?utf-8?B?L2Q3SHJlalQ5UFc3MmppQ3NsWUFyN0ZxdjVGRjVHdmU0WDkzMkdXQ1JOSklC?=
 =?utf-8?B?UWlGWFkvclo1RDdDaWpjSVkvczFFOVd2TFZUMVR6OWh5d0tvSUQrUWdnS3kv?=
 =?utf-8?B?RlhURlc3NVltSkFyWWUyYVZTbTBQVEZ0NWhURE1UVEJXNGtHSHcrdHFWMTEy?=
 =?utf-8?B?YmVmWDk3UVdwMzNaa09pdGQvNEkyZ0htQkNNUFdOM0IxRHdBa090OXpwU2dm?=
 =?utf-8?B?Q2ROejJvemk5ZGhza005V3UvWE0yZXowNVprbUNKSlVZcHM5YWtsUkwyQkll?=
 =?utf-8?B?Q0hlbUMzRmRjUWZYRUpOaG02SFhOSG9pbHUzQmEvQk52aSs1bU9uK2lQR1Fs?=
 =?utf-8?B?NFhBVnk3K0Z1aWY3YTlIeUZ2OUQrNllqaThEQ1FtUjFrbTgwYnF3Wm1RdFNx?=
 =?utf-8?B?YXhPYjAwYWZMYWxDYXg2U3Z6eGVFandYcy9KbFpiRCtacHkvbUtNN3lDdDhw?=
 =?utf-8?B?NjJEUHpQUTI3eUVaWlNQNjhCVVBqdDVZSFFxdGJZV3k0RUswelBaZWRTM0lU?=
 =?utf-8?B?UmV3VVVYVGhRaXQxS2ZYQjYzVGtpUmVGaFQxUFdvbm5UdTVseWhLc1RDSHU1?=
 =?utf-8?B?UFV6VWVCekFoL3o5RGpleXRQUi9IWjZlQjZmdGpCVjgxc0hZc1NPMms2VlBH?=
 =?utf-8?B?bGUzRGptSWlxd2JaS2hBaUZhTFJsYlNUK08vWEh4VnJTZUVtZFY1czFTRXRv?=
 =?utf-8?B?ZGRqOWhnb1JkTzI3Z3NWYTVOZkFsclh2bDhpeXluN0VyNVg1bEhqOGkxV0Fu?=
 =?utf-8?B?VWRqdVh1M2NiMHRmTjlsdjVLby9PTXVlaTNOUmZyUjJDSk00ejVXZEFGRjNp?=
 =?utf-8?B?c3RmOVFEdzhTU2VBdlJCVUg5WjBCdnJqa3NkODdzSzVBaHovWlJnMml4Qjh2?=
 =?utf-8?B?VDBXY1FmMnZTRFlBeVNzemM3KzBuN1BBaGUwNUs4bFhiL0VIdXF3ZmpwU0I4?=
 =?utf-8?B?cTRMclc5Y04wdTlyQ1V2SUFHd2ZBUnFVS3hmNURWbGVVSFc5YzNOT2c3MzZF?=
 =?utf-8?B?NlJHcGFrdjlkaGNvYWY0amtQU2dEQVE1cVZIVHd0ZzRnR2ZBQ1hwMFUxaGhq?=
 =?utf-8?B?cDgxMHZmNEdMZGxIYXVXRU5XQUZocVRFOVNrdU9GTVJNdFViM2duT1JuUnRD?=
 =?utf-8?B?OUVxYnM5RDUrSkU2cDB3d3pLRkMzcUlSci9yMTFxN2dIditsSWVyOUQ5cVBk?=
 =?utf-8?B?TytzR1RNTkxweXIxeVY5cE1EMEhzOFNzRk1rZlhOak1hNCtMMTNjOWltWVdP?=
 =?utf-8?B?aTdmcDcwODlINU50MkJPZmtObTVqdUo4UDg5RzlCVmVPT2F5NGdONjhhTHpU?=
 =?utf-8?B?QVV0SzJGa1g1TDlZNjJDSzhmeGdOZHpuSEdxVTF3U1I5N3JGMllGbmliMTdV?=
 =?utf-8?B?bXR2Tk5tU0FxZkh0dDNzK3lqd3pTSXlSTWZBRVZDT3ZZMldCTmUxTVFkVlln?=
 =?utf-8?Q?zA8TZrBDn8nmIsr6AQA0Zad779P8NbJPVBZQLNmvx4lZ7?=
x-ms-exchange-antispam-messagedata-1: bKzqU+gmpGepXeBHWrLvVszWwgBd1uRDTsA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AA5F2599E9FFA4EB11E4E203D4DC289@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 65e75beb-43a9-4f40-ec4f-08ded1d9bf1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 10:17:07.7559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZaF4eZqsqby7/y20IsS04z9YINmtlygmA5kGBIZT9zddn/l3yhydaKcgVqiaLJ8f5zLWmzOe7aN9yJMcjSVA24WiAKYqwu2mTo5ubHtHswGr67dmd09VaRf9/rKZnUTIFW6VrP41KbBs50oI89T/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5896

T24gMjQvNi8yMDI2IDM6NTcgcG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIFR1
ZSwgSnVuIDIzLCAyMDI2IGF0IDA0OjE3OjE2QU0gLTA3MDAsIG11aGFtbWFkLm5hemltLmFtaXJ1
bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbSB3cm90ZToNCj4+ICsNCj4+ICsJcHNjaSB7DQo+PiAr
CQljb21wYXRpYmxlID0gImFybSxwc2NpLTAuMiI7DQo+PiArCQltZXRob2QgPSAic21jIjsNCj4+
ICsJfTsNCj4+ICsNCj4+ICsJaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXJANzAwMDAwMCB7DQo+
IA0KPiBNTUlPIGdvZXMgdG8gTU1JTywgcGxlYXNlIHJlYWQgd3JpdGluZyBiaW5kaW5ncyBhbmQg
c3VibWl0dGluZyBwYXRjaGVzIGRvY3MgaW4gRFQgZGlyLg0KPiANCj4gSSB0aGluayB0aGlzIGFs
c28gZmFpbHMgdGVzdHMgKFc9MSkuIElmIHRoYXQgaXMgdHJ1ZSwgdGhlbiByZXZpZXcgc2hvdWxk
DQo+IGZpbmlzaCBoZXJlLCBiZWNhdXNlIGluc3RlYWQgb2YgdXNpbmcgbWFjaGluZSB0byBmaW5k
IGlzc3VlcyB5b3UgdXNlDQo+IGNvbW11bml0eS4NCj4gDQo+PiArCQljb21wYXRpYmxlID0gImFy
bSxnaWMtdjMiOw0KPj4gKwkJcmVnID0gPDB4MCAweDcwMDAwMDAgMHgwIDB4MTAwMDA+LA0KPj4g
KwkJICAgICAgPDB4MCAweDcwODAwMDAgMHgwIDB4MTAwMDAwPjsNCj4+ICsJCXJhbmdlczsNCj4+
ICsJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mz47DQo+PiArCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsN
Cj4+ICsJCSNzaXplLWNlbGxzID0gPDI+Ow0KPj4gKwkJaW50ZXJydXB0LWNvbnRyb2xsZXI7DQo+
PiArCQkjcmVkaXN0cmlidXRvci1yZWdpb25zID0gPDE+Ow0KPj4gKwkJcmVkaXN0cmlidXRvci1z
dHJpZGUgPSA8MHgwIDB4NDAwMDA+Ow0KPj4gKw0KPj4gKwkJaXRzOiBtc2ktY29udHJvbGxlckA3
MDQwMDAwIHsNCj4+ICsJCQljb21wYXRpYmxlID0gImFybSxnaWMtdjMtaXRzIjsNCj4+ICsJCQly
ZWcgPSA8MHgwIDB4NzA0MDAwMCAweDAgMHgyMDAwMD47DQo+PiArCQkJbXNpLWNvbnRyb2xsZXI7
DQo+PiArCQkJI21zaS1jZWxscyA9IDwxPjsNCj4+ICsJCX07DQo+PiArCX07DQo+PiArDQo+PiAr
CXNvYzogc29jQDAgew0KPj4gKwkJY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsNCj4+ICsJCXJh
bmdlcyA9IDwwIDAgMCAweGZmZmZmZmZmPjsNCj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
Pj4gKwkJI3NpemUtY2VsbHMgPSA8MT47DQo+PiArCQlkZXZpY2VfdHlwZSA9ICJzb2MiOw0KPj4g
KwkJaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47DQo+PiArDQo+PiArCQlzbW11OiBpb21tdUBj
MTAwMDAwIHsNCj4+ICsJCQljb21wYXRpYmxlID0gImFybSxzbW11LXYzIjsNCj4+ICsJCQlyZWcg
PSA8MHgwYzEwMDAwMCAweDMwMDAwPjsNCj4+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTM0
IElSUV9UWVBFX0VER0VfUklTSU5HPiwNCj4+ICsJCQkJICAgICA8R0lDX1NQSSAxMjkgSVJRX1RZ
UEVfRURHRV9SSVNJTkc+LA0KPj4gKwkJCQkgICAgIDxHSUNfU1BJIDEzMiBJUlFfVFlQRV9FREdF
X1JJU0lORz47DQo+PiArCQkJaW50ZXJydXB0LW5hbWVzID0gImV2ZW50cSIsICJnZXJyb3IiLCAi
cHJpcSI7DQo+PiArCQkJZG1hLWNvaGVyZW50Ow0KPj4gKwkJCSNpb21tdS1jZWxscyA9IDwxPjsN
Cj4+ICsJCX07DQo+PiArDQo+PiArCQlvY3JhbTogc3JhbUAwIHsNCj4+ICsJCQljb21wYXRpYmxl
ID0gIm1taW8tc3JhbSI7DQo+PiArCQkJcmVnID0gPDB4MDAwMDAwMDAgMHg4MDAwMD47DQo+PiAr
CQkJcmFuZ2VzID0gPDAgMCAweDgwMDAwPjsNCj4+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+ICsJCQkjc2l6ZS1jZWxscyA9IDwxPjsNCj4gDQo+IFNvQyB3aXRob3V0IGFueSBpbnRlcmZh
Y2UsIHNlcmlhbCBvciBzdG9yYWdlIG9yIG5ldHdvcmssIGlzIGNsb3NlIHRvDQo+IHVzZWxlc3Mg
b25lLg0KPiANCj4gSSBkb24ndCBzZWUgYSBwb2ludCBpbiBoYXZpbmcgaXQgaW4gbWFpbmxpbmUu
IFNlcmlhbCBpcyB1c3VhbGx5IEFCU09MVVRFDQo+IG1pbmltdW0uDQo+IA0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KPiANCkhpIEtyenlzenRvZiwNCg0KVGhhbmsgeW91IGZvciB0aGUg
cmV2aWV3IGFuZCBmYXN0IHJlc3BvbnNlIQ0KDQpJIHJhbiBib3RoIGR0X2JpbmRpbmdfY2hlY2sg
YW5kIGR0YnNfY2hlY2sgKHdpdGggQ0hFQ0tfRFRCUz15KSBsb2NhbGx5IOKAlCANCmJvdGggcGFz
c2VkIHdpdGhvdXQgZXJyb3JzLiBDb3VsZCB5b3UgY2xhcmlmeSB3aGljaCBzcGVjaWZpYyB0ZXN0
IHlvdSANCmJlbGlldmUgaXMgZmFpbGluZz8NCg0KUmVnYXJkaW5nICJNTUlPIGdvZXMgdG8gTU1J
TyIg4oCUIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBHSUMgDQooaW50ZXJydXB0LWNvbnRyb2xs
ZXJANzAwMDAwMCkgYmVpbmcgcGxhY2VkIGF0IHRoZSByb290IGxldmVsIGluc3RlYWQgb2YgDQp1
bmRlciB0aGUgc29jIGJ1cyBub2RlPw0KDQpSZWdhcmRpbmcgdGhlIHNlcmlhbCBjb25zb2xlIOKA
lCB0aGUgcGxhdGZvcm0gY2xvY2sgZHJpdmVyIGlzIG5vdCB5ZXQgDQp1cHN0cmVhbSwgc28gdGhl
IFVBUlQgZGVwZW5kcyBvbiBjbGttZ3IuIFdvdWxkIGFkZGluZyB0aGUgVUFSVCB3aXRoIA0KY2xv
Y2stZnJlcXVlbmN5IGJlIGFjY2VwdGFibGUgYXMgYW4gaW50ZXJpbSBzb2x1dGlvbj8NCg0KQlIs
DQpOYXppbQ0K
