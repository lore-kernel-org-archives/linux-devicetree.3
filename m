Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508FB39BFE5;
	Thu,  4 Jun 2026 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780570533; cv=fail; b=aFnjgI73RdZ/oEVeWtIOSKa0qhxZTvWaXi20ykSCXs8qcXUeD8q/h7+DxKfu8+JbU760mLmsij1xb8tvQvCBgZMbz5he6uz9LxEPGqsMrhfbe+Gm5g07Vc++EO2AS5Dyq8LumjkHIZGf3d/4nN5SVlatA3RSUkgFM3zpqeJiNCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780570533; c=relaxed/simple;
	bh=NZv4x+LnGmCj6iS9AvRYkIFiTjRYb1r4duZM0c5272c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gRbUHhkzK8dKurpFPHQIvurPkshiDasVfSdVUQ6AGt1tMHYLAvI1YbzNQ2wnIqRo5+fhlpSkcCdZSNBY1eJw/F11+ny1qNHkPdlSXNbpUb0WXA1tc9d2bantBeixlv7bmUiDrVgoNnphebAZKvpqcQ56MNt+FXC3nKVE7Xvtu8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=DWgJ/uGF; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="DWgJ/uGF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQiN7dWAWB7uu0ATbqOkk7nKTqEOUbu9GPGn+i1E+SXziCTb6qJH54vOQTPvwiJB8g5qKPZzWSZ69ojsdjB8LcNZ/dm0+OLQ/0/ezxAYxVBrozAPPktCyVOBYG7CFQHZzJiNZ6YxBRRUqUQUfC50jIJCibNkzuuN5iokmK/2wh5h54vpSXuxpk365AQtEYdPRv2NQbCN/ApQv9wWD++3qQqkI6Pn8VbxVbCheBzRfCRcmsgHqZL0zOETQRo2+1KoJ+tClGdf91Udv7h+oKWnkyiMbv0Kma2mzpMFeF93gCZ+zfqJN1j52Ev2dmQ3NWFag/8hrdgwy2+ZP4K5XL7GwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZv4x+LnGmCj6iS9AvRYkIFiTjRYb1r4duZM0c5272c=;
 b=JoVxjcLu6yDIVMktM5jnAe5hVAK9Q/liznKM6Ul+W+f0yMAsTWKbBeKVNcDpyV3xfjYCfGAjiZ/NM1Jw6k9883/Y0xFoF7i+8FcwMNGbmx7u4ZzLm4nP82pB0jzfuj4xoZNGWtb5fp7l7neCeD6+vfVRAiqedd6kkzPLUaMMElC+yv/tUngkmF60wkNzMKzuOLXChMHlsTn2mrDwe1aRJh4janr4Hg+f8t7aH3ZUSJPjrk76/UlV+xk07RNoAmZkutZyik3lpBfuM+Nh7ZNDdGDoYkBnITL1Ym6lBt9GSseOkC3jHnExr2uNezq4bgwNVtLzp2zIxuX5swZe3Xv2FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZv4x+LnGmCj6iS9AvRYkIFiTjRYb1r4duZM0c5272c=;
 b=DWgJ/uGFhOYhfDgYHSKlfvAKf+uAn1MeEygM4sCTlL2xcA8h7/Op7ZXT2GmO2lSAUu6ROpT0w3+jgDFoXYMbBh4Rd5LriVHOsXXUrygdfUhW7BwnBEDRWLYdylXSZ92ZCUr+xhmPFzecbOpHIoY6I4hdAbePFpe55MDLOzDCapmxNWNW2ZTShlnp28AkXlizWgmLrvkn5D0gJZSOJv0ctnsbq8re3UMMTlImscgfnmaMYf2x82BY7BoxGu5+pMH5CbvrGuzM2Yg4zm9Re7FGXawNs8I3fm/nM3jSEEIIGbSC/51Ff4O9wtf4O1YnS7rSl5wuEhl+pVaJXe+sB5VlYg==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SJ0PR03MB6469.namprd03.prod.outlook.com (2603:10b6:a03:398::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:55:29 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 10:55:29 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "dinguyen@kernel.org"
	<dinguyen@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Thread-Topic: [PATCH v2 1/2] arm64: dts: socfpga: Enable the SMMU for SoCFPGA
 device trees
Thread-Index: AQHc5EDdBDlckWQyTUeGG+SOvBoa6LYmgX+AgAfXTgA=
Date: Thu, 4 Jun 2026 10:55:29 +0000
Message-ID: <47a7cb44-416b-4e48-a7f2-b6b69b71896a@altera.com>
References:
 <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <c1aad046-fef0-4c2a-9e51-59e643e7966d@kernel.org>
In-Reply-To: <c1aad046-fef0-4c2a-9e51-59e643e7966d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|SJ0PR03MB6469:EE_
x-ms-office365-filtering-correlation-id: 8c894474-8e77-4d99-aad2-08dec227ca95
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|55112099003|38070700021|11063799006|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 T4g5Tw9NVyhpFA7AEzC38rCZIrKmBRLMN8BhTUlXqJRmslgF5lCF0wglyzLvGPXJQEK/17K40P64mpjVGHjDZFiiEpzrnqGrWbVqtij1vZgcXlEk4VLGPJnLomq0tJddFNOlN8MMkncM0Vr0L290rSX67/JS9sVvk4kBu53Syr0BeuEYlBQ4Qg+W0gC1Y2u/Q/TDfFDcCUeVvlnP7DTCFXKIEIRtBtRrltf5kTjm/8e6/FrsamivOdsylC7W/HI8qvO4OkUloLqhXpKs9DCTO8+UD/G8JsVp2rX+yC8uc+8f7k5Mo+7uAZtSuoalwa+gvzdolIb9iVT7bIFqmk9QDx6QJ+WZ9WQ3dU8k84AyCfbtuY9bqaymKh0OI1yeI/ys2grT6JRoWBM3RZygW1tgDddAueYIMMS9mHif9wKOtPLnqi8yGfeSjYCd7x0OItFI+fJ/IbWsp+OSik3rRlgYp6/4BkalOcdAu6iC5A9qKXswf2czfDgmsTneSzt+4nyeAGstT9QWbrynQ1MYBJXrYk3A0qGJIRbtecJsv5R8rbwh9FiBpUJ3OkRnfxAot7QlBU3VPN1tmosuLxJyANPWIQHFG6HggYPIEert16kcpNjXiBIQWA+WBa5hB/X0bBcs4xgOJC9D6Yi3AJx5f/yRIvvBNCVNkqI9AfRSFpVlFAMFJ/iFzEtOMbTMrrY/sDCCZ+IUmBBtB5YNcGzsCqdPngwtLAShU/RfufrwEdD98vY5T7V0+56FtV07U+Blbqq6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(55112099003)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmlUdkR6MWR2RmV4T2JXY0hwQkUwZS9NWXpYMEd6QUJTd0FaL3pYcWR5OVF6?=
 =?utf-8?B?TlIwOWY5YUNmNnVCM0hsc21YT0NZTnRZWWc2SEYwVnRsTDZWdGJGYmZKejRU?=
 =?utf-8?B?OVA1dDBnT3ZnenNRdUhhTVp3TWN2RjVzcEZaUDFkTFhkdkl3SUdkb0ZvOTFt?=
 =?utf-8?B?cmtEdTh2Z2IvVWFOalBGMStiUW9sdy9EcDQxSERXM1dwcEw0ZytRMW10d1Bn?=
 =?utf-8?B?b1FtMWMzdmxpMlY2RDEvTDA5RkhRR0JqL3hkdGllYWx2K25DUitOc3ZIMHhh?=
 =?utf-8?B?Ukg1WVpkR0w3cWs5VGZESDhuMEZIZWI5Rk5Sa3c3eE1XQUZhNHFvS01QM2Zy?=
 =?utf-8?B?c2cyQm1Fc2dveUtoVGJTbmF0c2U5MEpEUWJiNUZSN3BZNGF6NFh2WW02TzdH?=
 =?utf-8?B?ZGQwYkVlWnVRUFN6WklROVdoZEZJMGo3c3lzdmduc2JJUzJiZGM5SHJ5QkdT?=
 =?utf-8?B?TStpTGJRMXNIbTd4OFFibTB5UFVEVk5hNGRSalc1d2lCOHI3MXJwQSswNzRV?=
 =?utf-8?B?eHhNb3NHYXJ1dFo3ejltNytsYWJSKzVvL1pmVkhMUFlBbWZOSVc2NGpPTnBF?=
 =?utf-8?B?TWlFYlcyTTNzU1ZHK3IvbDVFRWkyRi9VNUk1SEo0enlqWFRkUGdoa1lKMXdo?=
 =?utf-8?B?bmZxQ2x2VHhPVklpYy95OTU4MXFCMTF2K0hVYktXdnJ1OURqSFVzYkx0c0xE?=
 =?utf-8?B?VlZKK3grbS9mTy9rSlp0UUdiVTRNN3FNK1BoQjdBQnliODhRNWMvSmNGZXM5?=
 =?utf-8?B?Qzdnbk1ISldJVjBCR2Fjb0txVUNjSHgvNkd1OWtxdncrZHhNTnVtTmRTbndD?=
 =?utf-8?B?MXpYRVU4Q2RNUFBkVUpLaiszZytiSmJmVUVQWGcvWDhSa1ZGYUgzRlVjKzV2?=
 =?utf-8?B?TGltaTIzR0p4cmJEZmduWmp5ZENpczc5YnNhOFAxZ1E4Zm5DSktUU0lCakVH?=
 =?utf-8?B?N3EwZkwxREIyZEkrNkJjaU5kSUp5NVcyUGZNR3ZVbTBFdlVKZGJmeTkvZ2xZ?=
 =?utf-8?B?ZzhOeUZSRzhBV255Z2ppVDAxSkxlc2FWK3hsRlNVY2o0SVpaU01XRjZDeHlL?=
 =?utf-8?B?RDEwWVZoZEdBZlpJejBaZjZmLzFSVng0TkpTMnMvRzVDRnBlTVRQZmo5SHVV?=
 =?utf-8?B?ejdXaUVjMSt4c1lpa1ZHb2xvNDRraFhvVVhqS3JuWWptQTZaZFk5RWtNSW1k?=
 =?utf-8?B?NmNEL3dxQ2s4YS9PbWt0Y2pCUjczNnNnd3hkUU43K25RbmliRTZicXd4ZGVJ?=
 =?utf-8?B?Nnp6aXNmTHJjY2dLK2FabGZoWFJKK1NNMnYwTFpGTjViejF5ZXlWVU5za2dE?=
 =?utf-8?B?dmdSazhiWm9oZ3VWQ3o2VXFwWUhvWTE2dlJleTNoaUh1bExvK3FPeXE0bjV4?=
 =?utf-8?B?a2JTZ2FhcVdiS2F5SXFVOHpxMUxIS0JweWdkQVpNNlNqSG41SkFSYjVNZU85?=
 =?utf-8?B?R3BkcDJUVnhVVFZnMTFvK3diSWZqclp0S1c0aDBKcFBHeXl2bTVvQlIxd2dK?=
 =?utf-8?B?STlRNFBBVmVPVm80QS9rZS9QYjBzaHZ5TTZGVGlwWmJ4QThlb2hnNCtobG1l?=
 =?utf-8?B?MUNtMUxUdzU1dVpYemc0c0hFcnJxUWJEMnJhblFFSksxN2JsRElnSi9Qcm9n?=
 =?utf-8?B?Ty95eGcwU0ppbWZaMms0RGlIVi9uR3pMSnBkWUgzWUd1QXNYZHlhSnY0cGhI?=
 =?utf-8?B?QzlSWnpXL2xIYjNIemRsOUFhT2VGNWFVTG1laTZsd3FnUHY0QWVjL3I1Ukk2?=
 =?utf-8?B?QnlFd3NtbDkyVFRPQXZ3alR2WHRMcjEzN0hJMEVZemtJZFJJKzRZQUExRnNW?=
 =?utf-8?B?YmZIaGFac2ZnMm5ZQXhaWk1iOGNaZG1tWWJWSlFmM3Q1eUdIeFkwN0NjWVlC?=
 =?utf-8?B?MnpYZlh2WlJ6aEhaTk1WZ3FJWGFEdzg0R0JtY2dPZTBpOGJ6R3N6bEs4MEI0?=
 =?utf-8?B?dFMxS2pTeGRpMTZUMmgyMm54NXJsL3phRDZsOTg5djNjL1JHOXBBTE9FSGV2?=
 =?utf-8?B?TkNhQTNvQXA5UjZ3Rk5qVGg2dWlqQ2lPT25kVllDa2lTWDJJdDZSWXdOejJa?=
 =?utf-8?B?M25rL2d3ci9VbFdyR3U3QzM5SmZOWkppN0xDVTFDTkluM0ZHRSsrOEF1NThE?=
 =?utf-8?B?R2JJMDFZL2l5dXZOY2NlK0w2azRQZ0lJT0VVaUZadGl3S0dZc2xULzJESWlK?=
 =?utf-8?B?b3BmbTBWVHVaVTlqbm1sTkppeHp2WGNPeWg2S0RDdkhhN2tZMnB5Zm5vWjBN?=
 =?utf-8?B?NWMwUEdwWW1xMi9zYkNxRGV1NFkwYnQwUWxrVHN3RGdsUjA2TFA3Zm5EQ3RY?=
 =?utf-8?B?VHBNWjNZTi9WSnVsVWdtelFqRlMvU3had2NDeHpzVk5vcTBZeWpHNFlBTlJi?=
 =?utf-8?Q?aJFoPw2jFdlTS5pRaIGolbKDxVUpzez4mj/THRzLn579p?=
x-ms-exchange-antispam-messagedata-1: GifJqG/bG2azBA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBB189E395409148A98118264EA162FF@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c894474-8e77-4d99-aad2-08dec227ca95
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 10:55:29.1222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: av1EpP3NbwyJrS/LCv0Sl/1mcHAufIvG4Xc8lR2yQ4F6B7vu4tw6auXJA/aMImM4XCXrDiaUt6T05ckIgHD1hvVPFPX7N6Tw8h2z93gZ0ahD+l/hLZKO5ifZ7FzCyW9yf2+5gR1P64FxkUDXkiK49g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6469

T24gMzAvNS8yMDI2IDc6MTEgcG0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20ga3J6a0BrZXJuZWwub3JnLiBMZWFybiB3aHkgdGhp
cyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZp
Y2F0aW9uIF0NCj4gDQo+IE9uIDE1LzA1LzIwMjYgMTA6MDAsIG11aGFtbWFkLm5hemltLmFtaXJ1
bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNvbSB3cm90ZToNCj4+IEZyb206IE5hemltIEFtaXJ1bCA8
bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFzbWFkZUBhbHRlcmEuY29tPg0KPj4NCj4+IEVu
YWJsZSB0aGUgU01NVSBvbiB0aGUgU29DRlBHQSBib2FyZCBkZXZpY2UgdHJlZXMgd2hlcmUgaXQg
d2FzDQo+PiBtaXNzaW5nLiBUaGUgU29DIHVzZXMgYSBkaWZmZXJlbnQgbWVtb3J5LW1hcHBlZCBi
YXNlIGFkZHJlc3MgZm9yDQo+PiBpdHMgcGVyaXBoZXJhbHMsIHdoaWNoIHJlcXVpcmVzIHRoZSBT
eXN0ZW0gTWVtb3J5IE1hbmFnZW1lbnQgVW5pdA0KPj4gKFNNTVUpIHRvIGJlIGFjdGl2ZSBzbyB0
aGF0IHRoZSBTZWN1cmUgRGV2aWNlIE1hbmFnZXIgKFNETSkgY2FuDQo+PiBjb3JyZWN0bHkgYWNj
ZXNzIHRob3NlIHJlZ2lvbnMgdGhyb3VnaCBhZGRyZXNzIHRyYW5zbGF0aW9uLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IE5hemltIEFtaXJ1bCA8bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFz
bWFkZUBhbHRlcmEuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBNb3ZlIFNN
TVUgZW5hYmxlIGludG8gdGhlIGJhc2UgRFRTSSBmaWxlIGluc3RlYWQgb2YgaW5kaXZpZHVhbCBE
VFMgZmlsZXMNCj4+DQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2ls
ZXg1LmR0c2kgfCAyICstDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVs
L3NvY2ZwZ2FfYWdpbGV4NS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9pbnRlbC9zb2NmcGdh
X2FnaWxleDUuZHRzaQ0KPj4gaW5kZXggYjA2YzZkNWQ2MGVlLi42NGYzNzM5YTBjMzMgMTAwNjQ0
DQo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNp
DQo+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNp
DQo+PiBAQCAtMzg1LDcgKzM4NSw3IEBAIHNtbXU6IGlvbW11QDE2MDAwMDAwIHsNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImV2ZW50cSIsICJnZXJyb3IiLCAi
cHJpcSI7DQo+PiAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1jb2hlcmVudDsNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgI2lvbW11LWNlbGxzID0gPDE+Ow0KPj4gLSAgICAgICAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiArICAgICAgICAgICAgICAgICAgICAgc3Rh
dHVzID0gIm9rYXkiOw0KPiANCj4gV2hpY2ggZmlsZSBkaXNhYmxlZCBpdD8NCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQpIaSBEaW5oLCBLcnp5c3p0b2YNCg0KVGhhbmsgeW91IGZv
ciB0aGUgcmV2aWV3IGFuZCBmZWVkYmFjayENCg0KQWRkcmVzc2luZyBEaW5oJ3MgY29tbWVudCDi
gJQgdGhlIGNvbW1pdCBoZWFkZXIgaGFzIGJlZW4gdXBkYXRlZCB0byBmb2xsb3cgDQp0aGUgc3Vi
c3lzdGVtIG5hbWluZyBjb252ZW50aW9uLg0KDQpBZGRyZXNzaW5nIEtyenlzenRvZidzIHF1ZXN0
aW9uIOKAlCB0aGUgU01NVSB3YXMgZGlzYWJsZWQgaW4gDQpzb2NmcGdhX2FnaWxleDUuZHRzaSBp
dHNlbGYsIHdoZXJlIHRoZSBub2RlIGlzIGRlZmluZWQgd2l0aCBzdGF0dXMgPSANCiJkaXNhYmxl
ZCIuIFRoaXMgaGFzIGJlZW4gY2xhcmlmaWVkIGluIHRoZSB1cGRhdGVkIGNvbW1pdCBtZXNzYWdl
Lg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MDQxMDUwMjAuMjQ3ODItMS1t
dWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20vDQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNjA2MDQxMDUwMjAuMjQ3ODItMi1tdWhhbW1hZC5uYXppbS5h
bWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20vDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyNjA2MDQxMDUwMjAuMjQ3ODItMy1tdWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUuYXNt
YWRlQGFsdGVyYS5jb20vDQoNCkJSLA0KTmF6aW0NCg==
