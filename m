Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021074.outbound.protection.outlook.com [40.107.130.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAD38B153;
	Wed,  8 Apr 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649216; cv=fail; b=SpWulpUqTj/JZg8m2gPagE14EjWT6NiU825TJxjroPdI7eFX7q4nMw2x4pj8mKmm0RYfyfyCGYknWBKHbTD3dOiRNhgbQLUtUj5Eawb3FU+W41mIxoJtqJPZLrcyCcAli/rdtCzNriHDdybFDhc1vE+dS8US8ZOhet4DIvoO0UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649216; c=relaxed/simple;
	bh=wqCZJq5X/RtdRNFBW50fDvG9VdGNyLdipLwYtJ4ep98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5idDI/jhu5jctjsJ/9Ll65fLxv5DpPcuXGb6siMzB4lQEEc1cGh5jjcyrncXQjQ6aG9zG3rqLyzB6Wu/P3ikZhTfYweVScNPb1sHYcY2MPYNRCwr4mYJ2rsY1B27WnuadbcaH5v12/0Vg84K7ZxkZjcjQUqxYXZ3vmUN8ppqnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=OmqypZKx; arc=fail smtp.client-ip=40.107.130.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="OmqypZKx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsEvKUclAThYcy4f9kB3zXh2JcTfBWbQGfONBZZun2EDyWJ5aPgfyQK/paqdQwk7vyvW9ZyrR63HatFl/NzfNwJalr+WEpBx0vYmBRWyXX0sJMYFYNhLEjnx4PGtBp2W5gth40g2bltvBrz+qNDGnJ8YtKU+2dmhho4iOaRJXKh4ctbVEJa4GxlT+muqhti4suKFPspj1yO1lINME8JmsOu8XvHm3+6NOuNxPObQD6IWt8bE6SKPKTDUirwxjbte9W8Ly7YP616oNIqeF0UUV7Ve9ATidrROCI8HTz/7vr2BRHyWwDEf+qxYkMTdhCzrxULetaIwXnJNN8DfWvh4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqCZJq5X/RtdRNFBW50fDvG9VdGNyLdipLwYtJ4ep98=;
 b=Eq8hCvQg/idpnlusnn+KbquUadWGru5uAqvp7jVLhrvPxtIJKWjs8bGemEXgxq1qwtj8eq0+HKXYZf6vcMFxl+0b0aXYb9VR7cY/G0q9X+3R+N8Y+y1EAwtJYRecKZ9NFri3zzQ7/meMWjV8I7qvV+j+GFCEq36m9waojDkkpyJTjpBbZlnqXzJJiwFgARj2AP+5FhOZQ6/PvUw2ySj/GFYeXkd3/lRS2QO+p8o/eluA3FwMIKOAT2gm10ZhGaNi3IvGvZctPU/Z5abfELqzCTZpopsQVEcxABoCmKghx70xLyTu8fMGYaIUGXuOyBTwz/SSkDDguHk40ugndleHaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqCZJq5X/RtdRNFBW50fDvG9VdGNyLdipLwYtJ4ep98=;
 b=OmqypZKx47XvSlbZxumB5vtQf41HHodVnFrEWMAsxT/JqjdRs7nwEf/S+uf+S/R4aYhpS/jTPpuzeZU7+dk2E9SuWI/VCukyTdxf1RYNq5Ojdmozd5FebFvVW8n1zjqcSfL4+V8UeKBzzKDNo8gIcfnnc2OldkuKoRr6mEVCUE79ELASlNIaV4ViEAdzhBqaBxwcAofiNFuU/M0u1ZTo8IHNwKhBnOHaTLJLw3mKScz8hoNeTQwJAGPC3al0MpnutZucIZUQs+no2f2P1UP3WNUF+InhGp0spGZc9kCluD3/FyHZFYsfynSfpp6XpWVmDri4C1gjFcbLss3cpDxueA==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by AS8PR09MB5320.eurprd09.prod.outlook.com (2603:10a6:20b:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 11:53:30 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 11:53:30 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"cfu@mips.com" <cfu@mips.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "jstultz@google.com" <jstultz@google.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "pjw@kernel.org"
	<pjw@kernel.org>, "robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"wangruikang@iscas.ac.cn" <wangruikang@iscas.ac.cn>
Subject: Re: [PATCH v7 0/3] riscv: Use GCR.U timer device as clocksource
Thread-Topic: [PATCH v7 0/3] riscv: Use GCR.U timer device as clocksource
Thread-Index: AQHcsVrKih43OFmRVkSBFISSf3ZzwbXVOeuA
Date: Wed, 8 Apr 2026 11:53:30 +0000
Message-ID: <ac1c7966-6db1-4e00-aad5-4650d7b8c11a@htecgroup.com>
References: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
In-Reply-To: <20260311-riscv-time-mmio-v7-0-016845a0f808@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|AS8PR09MB5320:EE_
x-ms-office365-filtering-correlation-id: a2120644-7700-422f-9381-08de956573f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 tpcAbTlUpIo/NsmhujAUm4Wu0d2zKp/3Q29lu5uummSnf/5Uf2TzL8I95FqS7pNSZDXkUMn7+yBXOe4sdJUt0mH1zlD6BgvzJ9ClXEzbjhxWrpi69ohe0WmO/cA/k5Mkl1HKRUVED5Jd08myDI0gdvIXpxGVJKkMu+fAjR+619yJhCGDJFlzcA4Hf2TQYzUduddYxneFdnpfhXYPsSiVy4twCI1x38MDZLSGM2xsgQQwEahkVQQCsGTbMaYwThtrcEBTT/3hWxYwt3kf7AjYL3gBQQA0a/gKKn9RbaoX73vVAx9EPmKOBZzIFvvGWYkv/VxSFEGPF3vYLcmEsnQb4K2l2mEyorchGpGaw8/z9drhTZSarABtxyXs2mMhaOlEJZi6FC1sGbPcA8Mt5XNZezcRG16mqQhDiTliPuWELJl4PY+SEVsuYP+QoXtI23uxdv/SgWSBNcJ+Mrk0ZezF2W6R3+7BnIOSkLn7Q4+78XrO7QXSdJiK/yUDbYDOLOwtSGd10dXHTdDoVMaAnYWzCri9upGo88X3zZLG0rqkyA1SOkoSazkbOz/LNeUHJ+nLT3IH7zCCFoH8gOPHEBZij9jxoGt6lxJTyJcqV2Ka+FQv5+SqgPb6YwEv78W2gL01YNHhRrbwb4Woi9C1cjrZtKOBFtGtXERHVvAYceAbGvrEjFHJGFSEF8BDS7VJZNkAGRDV18bKEtpkPti+0oF4ruhzV6LRBnakZFMueNrzWYo6kYhPHou9RncfQmTCLLaYhuvNrWbPBu4lVSRqtm+OgCJo7epYvE5kbjbeg8bKGnM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ams2bzdPZDlBNVB1bUZPQTQyNXRDUmhiMlRKcWxMSUR2bVJvdjY1YWRuTFZr?=
 =?utf-8?B?aDdTY0pSOERtb3k3Y1BGSGZIRndtb2hiV0xlWDY5SUpGU25SbThCRkIyU2V6?=
 =?utf-8?B?UGFkcU83MlhWNEtrT1AxRlZCY3RTdUtwN3QvMzJnNlhub29lNWJOb2JXR21l?=
 =?utf-8?B?alVVbWxnTE0vM0dsYnVtZHo2YU5rYjI4bDVXM3VjTTgvRlUwNkR5ZmxwbjBr?=
 =?utf-8?B?dm9OblBsQWZkeS9mazVwNitYcG1zQTdsYm1WSFhhZE4wYnE5UmpjWkdubnVy?=
 =?utf-8?B?NFRYdW5rV1hrMVdqdWRFbnJhdnY0QXVPMm5qRXJWbDFaeEt2TVhwKzR1Z053?=
 =?utf-8?B?akIzVGFOMXpHc0ZGdGlxa2ZFWDNqN0IweFhJY01PYnFLZjZHVWVGOWVZcmlm?=
 =?utf-8?B?TWZOS0dDaktUVmY3SVE5TUt6RDlKV3ZkUjhYVWc2azgxWGdQbzRaRDAxTThi?=
 =?utf-8?B?bDNJVVFac0tsT25jN1Z0VSt5TW9kOUw1RGlMWWthelpUZGtoWmRtRDBXOUNr?=
 =?utf-8?B?bUhSSlFaTE9XY2FuSFcxVU1UUTd6K0dUT1JsV0FtbS9QMTN6N1IyRWxYUXdB?=
 =?utf-8?B?cEpvblRxUndCdEQ3VTBHWktSdnlMVnY0VVgvR2tEQVdJdC8rdWtQbmdtTW1K?=
 =?utf-8?B?Tkl2YUdtbGhhdUdGaGRKTDI2bzdyTi9UTzNkY2tJVWdrRW9QMXBYVHlwbWkr?=
 =?utf-8?B?VGN2RFh3Q2h5Z240V2VxTTBhUGxHcUVaVHE2MmVWNytkdEg1TTFNdURYRXBQ?=
 =?utf-8?B?alRZdWRxZGptbUVWRHpOeTJsZGViMXBHQWx4WDZQcVArOS81bnprZ2syaGND?=
 =?utf-8?B?dFBURHNmaWhSMFBtMWVZYVN3bWxFTVBMMnJ4a29WZUlNVFpESEIwSWxIdjVh?=
 =?utf-8?B?eUd5TUZzcEFabWlzODZFdGs2dUpHVlVsS0J3Q0xtaG1lelZzSzRRdm4zeTVO?=
 =?utf-8?B?UW9ML0pXWTBqcldjUVpUOCtTTU1PSzd3bXlVWmlielNMTUltaUd5TkdhQ1Nz?=
 =?utf-8?B?UzM0bzJvZXI2QUtWOWRGN0R3aHZTTnpsQXdvdWV6TU54ejNwSFl2Q2t3OEpG?=
 =?utf-8?B?V2pncVNKT0IzRWtVU0IrUHE5UmR3dXpPWW1XWndMSTRKSmwvQUkySkZ5Qlp4?=
 =?utf-8?B?YnJGM0tvTk9nMUg4dEZzUG12UXF4a2Y4YktEU1Rja3dzTGJxSDgvYWVDRER3?=
 =?utf-8?B?SUV1ZU41Y3ptU0VLZmpkK3A4Y1RBQ1hyR05XMkdUc2ZOT1NpUE9MK0diSmVk?=
 =?utf-8?B?eEhhZm13RW9kUDVQakREejJwNmlucU5hZ1dRRDQya3ZjVzNXMENMdXloWU1I?=
 =?utf-8?B?VXBuMW4xNVMyWHVDWE50RWhVdXZmdjU3VFJEc3BhZXd1NmVMVnNXWTZUZWNp?=
 =?utf-8?B?cmZRYkpVK3E2cWZnNGJmelNyeHoyVFV4ZWZmbjNCa3Y2OUpFdTNQTGlUT3dD?=
 =?utf-8?B?TEFaeFhGWEZVcWtFTThoYW9BM0hhMnpPbldCVHpucjh2YzdMU2NEaWVBZzNk?=
 =?utf-8?B?OHdnSHE4eVYzWlplWURDUEJ3ZVV1U2FCRDN6VHhWTExDZVE4OHFocTJlYzBo?=
 =?utf-8?B?QlI1SVMvQ2VtZ2EvYVZqdll0dytXcnJvUUdKZ2xzRHNyTkJYZndOSlcwZFR3?=
 =?utf-8?B?MUppR1oyNERXdEh0a3FWbzBiajF3cmRXb1Z1RkZIMC9zOFI3VGliWk1yWDkx?=
 =?utf-8?B?Qi82VG1kdGw2Y0VUdFFtSWNESGN4WHh4VlIrOW5xR29pbXlHNnZHYnAzQkNt?=
 =?utf-8?B?Q0h5WU5KcFBrVVg5VklTOG1OQWJ3UlptV1JHQVJjb051bUM3anZaeEZXaGh3?=
 =?utf-8?B?WEdocW1TWkZWeW8xeWpOdnI1b3E1Q1ZVZW0zZnBJdFN5cy9kYkJnM3lvWlM2?=
 =?utf-8?B?NTZhSDBhL2swRHNlMXkyRTNNN01TYmhmYW5YeTFXcVpuS2ZQT1RNQys3OVZi?=
 =?utf-8?B?bklESUdyTjJqemYyR0tNRWM2ekxZajVjR2wra0llNXdYS0hmaGVNUlYwbm5r?=
 =?utf-8?B?REtPTElvby93Y3VqRit0dTQzSUNRYmF5Zk1yelRoWXVqU0NMVHRhN3luZlFo?=
 =?utf-8?B?T1pGd05ZcU42K0hNUE4zeGJJcUZUbTI1YVJadWN3WER5dnBqaE1YL21Vb1Bj?=
 =?utf-8?B?b05MTjNWYUs0YUtNN2xzdDluM000V1JIOHJYUGN0anM1TUlPUHVSNm85N3No?=
 =?utf-8?B?a1JOdTVVMllJS2Z0MkQ5ZThkRHI4MWRjb09oQ2UxelNwa2gxeHFEd0NaaFRy?=
 =?utf-8?B?L2FTdmpUMGlvMkMxcWJVQnY0RVpaclIwb1BGMnY2WGl0SXQ5QlNWTG50SkVO?=
 =?utf-8?B?Y0g4K2Q2QW5YWkF0aEFiRHdDU09Rc2tMZjV3VWJsVzdmdW01VFZjZEFTcHVE?=
 =?utf-8?Q?FjMcYGevMXFq3R9g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A4803AFBEA8F04299D23CDA37E78A9F@eurprd09.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2120644-7700-422f-9381-08de956573f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 11:53:30.2665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sWRRGbpAedqGrGz4tpJ76lVWJdX/w5nC35DmugA4/XXwnHzQfzsq6PzolhhSUvOUGdbFL74e6pIwQb3RFHS3Q/i0btVmGJKQyeBGL6zAX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB5320

T24gMy8xMS8yNiAxNDoyNiwgQWxla3NhIFBhdW5vdmljIHZpYSBCNCBSZWxheSB3cm90ZToNCj4g
VGhpcyBzZXJpZXMgYWRkcyBiaW5kaW5ncyBmb3IgdGhlIEdDUi5VIHRpbWVyIGRldmljZSBhbmQg
Y29ycmVzcG9uZGluZw0KPiBkcml2ZXIgc3VwcG9ydC4gQWNjZXNzaW5nIHRoZSBtZW1vcnkgbWFw
cGVkIHNoYWRvdyBvZiB0aGUgbXRpbWUgcmVnaXN0ZXINCj4gaW4gdGhlIEdDUi5VIHJlZ2lvbiBz
aG91bGQgYmUgZmFzdGVyDQo+IHRoYW4gdHJhcHBpbmcgdG8gTSBtb2RlIGVhY2ggdGltZSB0aGUg
dGltZXIgbmVlZHMgdG8gYmUgcmVhZC4NCj4gVGhlIHRpbWVyIGRldmljZSBkb2VzIG5vdCBpbXBs
ZW1lbnQgYW55IGludGVycnVwdHMsIHRoZXJlZm9yZSB0aGUNCj4gdGltZXItcmlzY3YgY2xvY2tl
dmVudCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgc3VmZmljZS4NCj4NCj4gV2UgdGVzdGVkIHRoZSBw
YXRjaHNldCBib3RoIG9uIFFFTVUgYW5kIHRoZSBCb3N0b24gYm9hcmQgd2l0aCB0aGUgUDg3MDAg
Yml0ZmlsZToNCj4gLSBDb3JlbWFyayBhbmQgdGltZXIga3NlbGZ0ZXN0cyBvbiBRRU1VIGVtdWxh
dGluZyBhbiA4IGNvcmUgQ1BVDQo+IC0gQ29yZW1hcmsgYW5kIHRpbWVyIGtzZWxmdGVzdHMgb24g
dGhlIEJvc3RvbiBib2FyZCB3aXRoIGEgc2luZ2xlIGNvcmUgQ1BVLg0KDQpHZW50bGUgcGluZy4N
Cg==
