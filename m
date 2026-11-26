Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795653553;
	b=fQ4xp044eyGs3XUdzk8UY4746dBqyrqwBhuRV8NNzVRy6AuJyBOl10jtRGODI7LeZ7o8
	 71tHwpMF6qxtFxoWsOrWr3nQgbHtneQukyDcY0XewyKXqghkJJKJL8KU9fHPSd+f2DMJJ
	 knJEcBJ3xunJssZWlX7pbniJB1o09iGkweaznJHmLMyQCBt8slw477mhBwsYM4ExxxiVO
	 vNNrCG6BPVTD7d7YnLCvlRpraBJYBnJ/2nnJyxL6UIKn1uL2vTwLWp1v3U/ogOOH5ueCo
	 lXtm2cJqS7igdqeZLg22ctzjIuw6j10lchKQqEe5GAXpemDCh3bhgv7lorqWr/+GH8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653553;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
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
	bh=rON7eupLD7MreJ19k4CeqNSiWRdbpRVGjn835EtJR8c=;
	b=XF/OVdDG5DX+y52fZqrRIHOvJCke3TZspgFGk9KO4nTurqT5dmiqAe8ox44jswK/UUlf
	 MBk7qgJGjAn+DgTwXE4BNOoCpAXXX4xz2C3WPQxTZJg9ziY0wJnVLnA2PJC2H/xrC4yAt
	 kcTurUxPsAMnan7ry4PPyTpQg++QSBGiXlSMhXns50A8UQgV8GX4Jwa1lW4jmrel9akud
	 7Rsj0ksOcA+d1UPCQ/cR9lgpi+HRkMY5Lxvvou0REfBPqimSHT4RVc0cybmRzDK23D98+
	 X5se3mGNhETNxUzudmMrB9MhLm5qHBTwdGbYrMpPKCS6C9pwvwX3fclXA7FUBWvQPZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.128
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2128.outbound.protection.partner.outlook.cn [139.219.146.128])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02567606A31E;
	Thu, 26 Nov 2026 00:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02567606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXexgSUVgufk0NtI1Ma9ufsuhyR3YalZtcwvASEfQ4fExApTg2seq5MvqJzgSEzrkHBfxGY6hfxbuKkEiLv8X7k7BQbfVEXtiT8L3jS4ziyoLpVGM/8dRlMEvZXcXd/ukYHEJGtGGXDsI8CdHyfSIJVn3SRQEGa2uDTLMZ5sVDxH6tl6NROEghW6skhLAbw+Ym7syapdrVscvMRdi+NbZ6STlFxy8XO+JRjYZwcxBzOhfl2QSb2eZB+VOcCi/8pnyBsW7YF7X+OYJOiIJ8HPRY+0Q8PA71vAq9Mf0E0oTUKoFOfxLiCXx+N/856E0rpuEgEkZ2noPDUjalhkNl/9LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rON7eupLD7MreJ19k4CeqNSiWRdbpRVGjn835EtJR8c=;
 b=lO50cHPad2DBPO5QR4eOen5T8DP3+KmiWHqsx070rokT9ItFl1qwlhNcEUXYw66d51FORL7xwEV7I5K4N6F28pbKv9Z977+j9CdPpQ3hSFBSWibohC6eCfNFIsMiRVY7VSiiN5H1TmgKAk7jprh+jQ5EZInxLfAm2YtwScQzvSgh8DoFp6n6gPBEur5Xlpu2jEPACP/IeNNw4wqZK3We1mbgXUN4VCwJ5dzlvWY0A/vTBuSDIbJaOaY6p9EZnCkZX4HaJkzgdV4ANnCv6qB70/qZq8ZLw1soyiwuv0sYmRTb5Wf4J6kK4fcl/hBhpqF+4bA8G20RRjmCR7GBvNOWkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12) by BJSPR01MB0865.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 26 Nov
 2026 00:39:02 +0000
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 ([fe80::c362:8d6f:de71:524d]) by
 BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn ([fe80::c362:8d6f:de71:524d%7])
 with mapi id 15.21.0592.012; Thu, 26 Nov 2026 00:39:02 +0000
From: Mason Huo <mason.huo@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net"
	<openipmi-developer@lists.sourceforge.net>
Subject: RE: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to DT
 schema
Thread-Topic: [PATCH v1 1/2] dt-bindings: ipmi: Convert starfive,kcs-bmc to DT
 schema
Thread-Index: AQHdfHlhfVp2ok8hpEyKC19VHjhwybc/FnCAgABokVA=
Date: Thu, 26 Nov 2026 00:39:02 +0000
Message-ID:
 <BJSPR01MB05775189EDBFDD5307F1003585422@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
 <20261118-repackage-backlight-1bdc5955a8d2@spud>
 <BJSPR01MB0577DD87B6BE14E93640FD3A85432@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
 <20261125-outbid-ritzy-705bdb883059@spud>
In-Reply-To: <20261125-outbid-ritzy-705bdb883059@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJSPR01MB0577:EE_|BJSPR01MB0865:EE_
x-ms-office365-filtering-correlation-id: 3346692c-a894-4b11-b12a-08df4b55ab2d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|261009223027099003|261021135927099003|38070700021|261026140227099003|4143699003|261021121427099003|261102123227099003|261026121527099003|56012099006|261021123027099003|261028144727099003|261022105027099003|10067099003;
x-microsoft-antispam-message-info:
 nGMhVqKYuUUKYv47IXgTg2ncpWs97j00BcXVvoiNBt0CTW6uaIPOxHB2ZKcEonl0YvNa5vZ47WN4NTDsnOkGxAey5FMyebqO96xt1LpCCuuwb0+kAVQtgAacVw/i/968aKQ/t2t2FGsd/gxxZtbh+Nm8iq6JXV/0V7e6i63lsRGPf6DiQOn7dGAPAHH7gJ7k2n9xRd4ojibspuO/kVlDwY4xGaRoYAv5Bd+6AXYnJrO0Ze72yZGgahw2sdmEhH8DufXiamnWnc169JMya2btPp7IBYn3gSuVAEyGwX2PjK7WlarcEVwYK3SvN5+MCEpyLPxDpaTTYFASohdXNVrNjU6oG6ykyI3YyIEzJkSeh8gvJZWGC8yOq8l+hxQ7FvsCVvOpNTX9z2dKLl28wZGJIE8gOyFG44jTV5ZaEmLVlpPV/0HbM5he64cEN/aqnbVdERZgONdvGZG89QT84Y7dXuhtsIiUSL+ltg0b1Rxt73eB7LhnfQ3lHh1NpvjgGE7qHrAYSKYRgJ77lg0LPOdrr4u5cTOEjASCU3HuG1c4nCMhAy9qsdBYXxA/WS23HHvU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(261009223027099003)(261021135927099003)(38070700021)(261026140227099003)(4143699003)(261021121427099003)(261102123227099003)(261026121527099003)(56012099006)(261021123027099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE9XSWQ1RlBMdXh2SDJZVUpEbGJ0K29TQUluS3UwK3ltTkdLR2Rwc2F5UGl5?=
 =?utf-8?B?YW9BakgyUmwzenFiNW9IeFdYaGZSdERPV1cxRHNTNkdrcnFvWlNXQjI5aGtJ?=
 =?utf-8?B?Rzg5cFRKblI1OHMrQUM5ZytMYk5GYVROMU5RMDZGcnpaUmk5amYrVVZNdll1?=
 =?utf-8?B?TGJQemszcjI2eG4vWUdKT2NpSjhXbU5nRUhsZ25xeFNYU0hKTnY2N1U4Zm4r?=
 =?utf-8?B?aEkzTGZVNVJZL09PV0ltOWkzYVZkT09xdTY0a1lBb3kzcjBwdFRVRkYxVHRt?=
 =?utf-8?B?S21YY2R3M1VlUFc5ZXd5TkZjRzhRN3JQclFOZ2huTmFQNENpUzRBeFRtT0l1?=
 =?utf-8?B?Z3M3Y1A2Q0FTUDJkQkgyWXgyY0RqRDB0S01SNXg5bU9xNkV0Yzg5cVFISzVN?=
 =?utf-8?B?SGZqREE5WWovTm1QUmw1dmlXNFVhVUlxZ0FMNFJXUUR3cXlvTUU4SXFDTGlk?=
 =?utf-8?B?dGxwUytOWHd3Y2lzZXFkZWZ6SmNOQVJFdXNlL1dzZFVENHJmK2hOUUl1QXRS?=
 =?utf-8?B?UEw4R1Vad0xId1BsWWdXWG9IdVFYWGZITmVrK0MvRExuM2FWNng4YUdOM0JB?=
 =?utf-8?B?UW1BelRZUjJTMlliT0NUWERFTzRKZlcxeUFXb2d0ekZaaDI2dzR0RWtlanhV?=
 =?utf-8?B?YVhHQkZ5NzA4V3JTUSs4YVQxT2NzcHFCN0Z6MEhmaFlPNFpzcW82QVd2NkEx?=
 =?utf-8?B?dzg0UXRsWkpsRENJVkVFNU1sOVl6cFBzcUxsUDhqSnY4VDV3bnhncXQvWDVv?=
 =?utf-8?B?YzRNQmpJeGplQlNHWTBjYXVTNTE2YnFSbVZEQzJLQnNXM240akpWRUR5WHow?=
 =?utf-8?B?Q3dsdXZ3elVmU2xVaFA5Tk1Sa1NGaGpYSThBUS9pMUFhYUdiQTFyd3o4TVNt?=
 =?utf-8?B?WVNDb0J2OW4zVXdEU1pBNVlIOU92cTFjR1JlekpXVlhKa3h6UkZxUGNLSWIz?=
 =?utf-8?B?cFN0cmRjTjBwWHU1USs1Q2huclNjVnlFMGpqZ0lXcUhJdWlOQTJPZlc4ckFE?=
 =?utf-8?B?U0pyc2RISG9LSmxuQVhMYUtUVFdUZ0Z2cUpuZzRvNUl5TXRjaS9UR3g1TTJN?=
 =?utf-8?B?ZmFMWGFqZFJ2SW0rajl2a0ppZ2hXTHlsM0gvelFnV1NBWjN6aTk1Rm5zN2RO?=
 =?utf-8?B?V3NZZGl4dzVVMzh5b1p3N2JhTmd1NjZqOWdScW9STms0anBTbFRIY2EwcFh6?=
 =?utf-8?B?cG85MDFhVWNSVzIveVJkRTNycW5CUndUOGNHN3lsazlQdlJUTURXb0MrZmNm?=
 =?utf-8?B?V0FzZWpXVWhPUUM2NzJnWlB0bU8yK0R1bGRBendqVURjWDVYNXZXYS9lNGlI?=
 =?utf-8?B?M0p5bGY1MHgxVTB0QUpZYmtzR1RYV2xhSnYvSUg5VXl2WFlGTlJhdTFGOW45?=
 =?utf-8?B?ellDM1JKckJKZWp0WEJKQnhhZ0NNeUxWU1RrUitYNHEyL25jUzk1bXBtVEo3?=
 =?utf-8?B?R3lyRklBNG43SVpiZnRva1JIemxqS1VsWm01OFFlWDhGVldtUTJWK3dzeDh2?=
 =?utf-8?B?TU5RbFBvZEZNOWR1WURtVzJ0bmp1UGtaKzRLcDdKaGlYVGxkNjdkWlRmVlZB?=
 =?utf-8?B?bFVJOWtBWUdGWlRpR2s1dUVaSytjYThVYlNSaWlsSVhXeVRkanpnZSs5NzMz?=
 =?utf-8?B?cU5wL1grcHZ0a1dzdkx4RkNkVDgxZ0lpcUhjRVdpMG1ZRmJHcmI1RWZhd2lu?=
 =?utf-8?B?SjBQemRrRmN0c0gvcmNUMGNSaEhjbUYxdnJtbytxaEh6U244YzFUZFZwU1Mw?=
 =?utf-8?B?UDZqN2xmaUF6T1g1NFNIYS9CRFJvZENoYkZpSmY0b0MrNzJ0ZlJVTGgrcW9H?=
 =?utf-8?B?SkNteGthTlJQYmF5azJ4bnZpamhLVVRJbnJoNU9qZ1huNmJ3Ukc4djU5U2JC?=
 =?utf-8?B?SEFIKzA5UUZRSWRqNXljRDIyQ3lJM3VwRVR2Nk1tRjYwTGJEdGJvWmFUQS9u?=
 =?utf-8?B?cGpiMTdFcjdhbldHRjJ2UHI1dHlXYjk0YUpDSWNxQlJ3YkRCa2Q3U2pUcHJr?=
 =?utf-8?B?SHdHZTNVd0Y2K1RuOU5zcE4zNnZmbkc5dEpUM0I5ckhvNTUvTy85UDdxVllG?=
 =?utf-8?B?c0hqRE8yQUR0UFhQMmpOblJOd3JkZnVvTnl5R0E3cnZDQnlQNHRrc2RIYktl?=
 =?utf-8?B?TDdqTEZiOUVoOWRHbjdUdDNJTlhuNEl4ZU5VWGZGN2lzVmNodDh6RFhTbTRS?=
 =?utf-8?B?a24ycmtvb0dDYmhJL1hJc053cEE1OGRQN0VmbG5pek9SbHNzdWwxNmpqaTJK?=
 =?utf-8?B?VFAvVFp4bUE1M3Rua2E2VEZpQVpaMW0xZ09KcFhodmhaU2Q0TVUycnNkUEVG?=
 =?utf-8?B?Sk82MllhK0VDcGg2ZXFRR3BsZzc0bWdBVCtDUEoyRGFKaUNGc1Bzdz09?=
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
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3346692c-a894-4b11-b12a-08df4b55ab2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 00:39:02.5412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SuwMw4RI7vK70jL+Mil6o5EPHDAOxgxFWmJ1IYhHucWa37njy5Xe4XK2BUJnJJN4Z9E17iavUFLDHj8mR61RbIrAJ0v+VGKnJvE2KXW5vJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0865

PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjblubQx
MeaciDI25pelIDI6MDYNCj4gVG86IE1hc29uIEh1byA8bWFzb24uaHVvQHN0YXJmaXZldGVjaC5j
b20+DQo+IENjOiBDb3JleSBNaW55YXJkIDxjb3JleUBtaW55YXJkLm5ldD47IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgb3Blbmlw
bWktZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYxIDEvMl0gZHQtYmluZGluZ3M6IGlwbWk6IENvbnZlcnQgc3RhcmZpdmUsa2NzLWJtYyB0byBE
VA0KPiBzY2hlbWENCj4gDQo+IE9uIFdlZCwgTm92IDI1LCAyMDI2IGF0IDAxOjA3OjQ2QU0gKzAw
MDAsIE1hc29uIEh1byB3cm90ZToNCj4gPiA+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4NCj4gPiA+IFNlbnQ6IDIwMjblubQxMeaciDE55pelIDE6NTgNCj4gPiA+IFRvOiBN
YXNvbiBIdW8gPG1hc29uLmh1b0BzdGFyZml2ZXRlY2guY29tPg0KPiA+ID4gQ2M6IENvcmV5IE1p
bnlhcmQgPGNvcmV5QG1pbnlhcmQubmV0PjsgUm9iIEhlcnJpbmcNCj4gPHJvYmhAa2VybmVsLm9y
Zz47DQo+ID4gPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkNCj4gPiA+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsNCj4gPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBvcGVuaXBtaS1k
ZXZlbG9wZXJAbGlzdHMuc291cmNlZm9yZ2UubmV0DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENI
IHYxIDEvMl0gZHQtYmluZGluZ3M6IGlwbWk6IENvbnZlcnQgc3RhcmZpdmUsa2NzLWJtYyB0bw0K
PiBEVA0KPiA+ID4gc2NoZW1hDQo+ID4gPg0KPiA+ID4gT24gV2VkLCBOb3YgMTgsIDIwMjYgYXQg
MDI6MjU6MjVQTSArMDgwMCwgTWFzb24gSHVvIHdyb3RlOg0KPiA+ID4gPiBDb252ZXJ0IHRoZSBz
dGFyZml2ZSxrY3MtYm1jIGJpbmRpbmcgdG8gRFQgc2NoZW1hIGZvcm1hdC4NCj4gPiA+DQo+ID4g
PiBUaGlzIGlzIG5vdCBhIGNvbnZlcnNpb24gc2luY2UgeW91IGFyZSBub3QgZGVsZXRpbmcgYW55
dGhpbmc/DQo+ID4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24sIHdpbGwgdXBkYXRl
IHRoZSBjb21taXQgbWVzc2FnZSBpbiB2Mi4NCj4gPg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBNYXNvbiBIdW8gPG1hc29uLmh1b0BzdGFyZml2ZXRlY2guY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIC4uLi9iaW5kaW5ncy9pcG1pL3N0YXJmaXZlLGtjcy1ibWMueWFtbCAgICAg
ICB8IDUzDQo+ICsrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1
MyBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pcG1pL3N0YXJmaXZlLGtjcy1ibWMueWFtbA0K
PiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lwbWkvc3RhcmZpdmUsa2NzLQ0KPiA+ID4gYm1jLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaXBtaS9zdGFyZml2ZSxrY3MtDQo+ID4gPiBibWMueWFtbA0K
PiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjJjYjkxZDMyMWEzMg0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pcG1pL3N0YXJmaXZlLGtjcy1ibWMueWFtbA0K
PiA+ID4gPiBAQCAtMCwwICsxLDUzIEBADQo+ID4gPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gPiA+ID4gKyVZQU1MIDEuMg0K
PiA+ID4gPiArLS0tDQo+ID4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L2lwbWkvc3RhcmZpdmUsa2NzLWJtYy55YW1sIw0KPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gPiA+ICsNCj4gPiA+ID4g
K3RpdGxlOiBTdGFyRml2ZSBCTUMgS0NTIERldmljZXMNCj4gPiA+ID4gKw0KPiA+ID4gPiArbWFp
bnRhaW5lcnM6DQo+ID4gPiA+ICsgIC0gTWFzb24gSHVvIDxtYXNvbi5odW9Ac3RhcmZpdmV0ZWNo
LmNvbT4NCj4gPiA+ID4gKw0KPiA+ID4gPiArZGVzY3JpcHRpb246DQo+ID4gPiA+ICsgIFRoZSBT
dGFyRml2ZSBCTUMgU29DcyB1c2UgS2V5Ym9hcmQtQ29udHJvbGxlci1TdHlsZSAoS0NTKQ0KPiBp
bnRlcmZhY2VzDQo+ID4gPiBvbg0KPiA+ID4gPiArICB0aGUgZVNQSSBidXMgZm9yIGluLWJhbmQg
SVBNSSBjb21tdW5pY2F0aW9uIHdpdGggdGhlaXIgaG9zdC4gVGhlDQo+IEtDUw0KPiA+ID4gPiAr
ICBjaGFubmVscyBhcmUgcGFydCBvZiBhIFN1cGVyIEkvTyAoU0lPKSBibG9jayBhbmQgZWFjaCBj
aGFubmVsDQo+IG9jY3VwaWVzIGENCj4gPiA+ID4gKyAgMHgxMDAgYnl0ZSByZWdpc3RlciB3aW5k
b3csIHN0YXJ0aW5nIGF0IG9mZnNldCAweDIwMCBvZiB0aGUgU0lPDQo+IHJlZ2lzdGVyDQo+ID4g
PiA+ICsgIHNwYWNlLiBBIGNoYW5uZWwgaXMgaWRlbnRpZmllZCBieSBpdHMgcmVnaXN0ZXIgb2Zm
c2V0IGFuZCB0aGUNCj4gPiA+ID4gKyAgInN0YXJmaXZlLHNpby1pZCIgb2YgdGhlIHBhcmVudCBT
SU8gbm9kZS4NCj4gPiA+DQo+ID4gPiBXaGVyZSBpcyB0aGUgYmluZGluZyBmb3IgdGhlIHBhcmVu
dCBTSU8gbm9kZT8gSGFyZCB0byByZXZpZXcgdGhpcw0KPiA+ID4gd2l0aG91dCB0aGF0IEkgdGhp
bmsuDQo+ID4gPg0KPiA+IFNvcnJ5IGZvciBtaXNzaW5nIHRoZSBTSU8gbm9kZSBjb21taXQsIHdp
bGwgYWRkIGl0IG5leHQgdmVyc2lvbiwgYW5kIGl0IGxvb2tzDQo+IGxpa2U6DQo+ID4gKyAgICAg
ICAgc3VwZXJpb0AxMDU4MjAwMCB7DQo+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3Rh
cmZpdmUsamhiMTAwLXNpbyIsICJzaW1wbGUtbWZkIiwgInN5c2NvbiI7DQo+ID4gKyAgICAgICAg
ICAgIHJlZyA9IDwweDAgMHgxMDU4MjAwMCAweDAgMHgxMDAwPjsNCj4gPiArICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8Mj47DQo+ID4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+
Ow0KPiA+ICsgICAgICAgICAgICByYW5nZXMgPSA8MHgwIDB4MCAweDAgMHgxMDU4MjAwMCAweDAg
MHgxMDAwPjsNCj4gPiArICAgICAgICAgICAgc3RhcmZpdmUsc2lvLWlkID0gPDA+Ow0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAga2NzQDIwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gInN0YXJmaXZlLGpoYjEwMC1rY3MtYm1jIjsNCj4gPiArICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAgMHgyMDAgMHgwIDB4MTAwPjsNCj4gPiArICAgICAgICAgICAgICAgIGludGVycnVw
dHMgPSA8MjgyPiwgPDU3PjsNCj4gPiArICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9
ICJrY3MiLCAiZXNwaV9yc3QiOw0KPiA+ICsgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgIH07
DQo+IA0KPiBXaHkgY2FuIHRoaXMgaXBtaSBkZXZpY2Ugbm90IGp1c3QgYmUgcGFydCBvZiB0aGUg
cGFyZW50IG5vZGU/DQoNCkluY2x1ZGluZyBrY3MsIHRoZXJlIGFyZSA1IGtpbmRzIG9mIHN1cGVy
LWlvIGRldmljZXMoa2NzLCBidCAuLi4pIHdpdGggZGlmZmVyZW50IGRyaXZlcnMNCmluIEpIQjEw
MCBTb0MuIEZvciBlYWNoIHN1cGVyLWlvIGRldmljZSwgaGFzIGl0cyBvd24gMHgxMDAgcmVnaXN0
ZXIgd2luZG93DQphbmQgZGVkaWNhdGVkIEludGVycnVwdCBsaW5lLg0KDQo=
