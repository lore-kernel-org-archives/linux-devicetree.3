Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D7351C0B;
	Fri, 10 Apr 2026 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814834; cv=fail; b=Pa1/VWy0XnrvKRMIjRTZnnkw/IxHpKbQV1RUhrSAhLcIkeeLudUAeu1GL2P6r08eeBF+Fwrqr5eRI+82qed7gpbb//KCN2ddWkUCnCkamFA0IP7mJcCodsYsLd6+AoOPQ4NjQZQ2/n1CoX/FicPRuSuyciqmoOaDBliLNnTqct0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814834; c=relaxed/simple;
	bh=uE12bTp+6zX4eb2WO6uUWXw+havk9opxrPLuGpdRY9U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H0xieOZBBjEKYXbfAIaCMlwhoHAnPHz1x8q64OACa2We+mn0a3r2GKzAurab1jp77KY3QUFZrTLW6AJ4w1Z8am4rjAYVWYk/LlD1/UU3+ue+Nd+mkhcC1Q+6JolnRdOPRLI3LIFO7BjDP8TlSOd9JfwMYEvEPEgSTLcS06aLSJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Voulae/BkxiP2PT+Rqb18drJw/AxC7wdO4B5y+QaOpchl68/T0xCDWdTNwDoclSPYCET0h0SV+K02dtE0MgnInwULEpa3RvlyuL6fWJDOXDh3XCGGZX0U6XVmpm4whqAui4qLwYQlg0u0+8oaNEf6WuqvOqJVvrV/0Jzmnq3SSY9d3K5ZiLa5KfqQZ4OUKmPMTeIeHqjTnjRbCq7FC651wk74eCHUzwtw+1dlAzOABR3r20Cs4IhG9SNjbRT8TwahoBPJJ631dXWKt7B7COTIwCHsxnUq4X+xXYamVBF3BEKiO778M9TTUeM2jXmTjNxZSecA9HE8YSpBFN99ClLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uE12bTp+6zX4eb2WO6uUWXw+havk9opxrPLuGpdRY9U=;
 b=SY9uwEOT4DOXF4UmCVZdiU0y08xTmc9qDsSmveXHQl7V2deQu60JtV5fDnGfJZmZvmJCGjMdbDLPmyXTA969HtBt0qMmM03XNAgx3d404fEIYIu/JTsY5ih9xn8rUOkZipIDv6nRNy6S3mb4GcDrliQSPwve1YSitaPVHZmO2PwerBaR0hFHrUfMqfsrCsqTyhx6jzJYVhotwDzwQAdbBrzWgOD6WVOs8X/qdhQO8Dnmw8AW4kLOuVMc3of0y0rsdddC/oybaFyMdYkVfMYz1gPD3aUuXQzsKnhyiti284Vqgp7bSSwAwDK5M2u6slPFnxbdTxPNMobz7UvPOxCDTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 09:53:39 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 10 Apr 2026 09:53:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Leyfoon
 Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
Thread-Topic: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
Thread-Index: AQHcyMiXP4lWSj7OIUO4ae40utKCbLXYBuQAgAAHWHA=
Date: Fri, 10 Apr 2026 09:53:38 +0000
Message-ID:
 <ZQ4PR01MB1202E0FD0B1EDF46F1110230F2592@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
	 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
 <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
In-Reply-To: <631d4d65fdbda29cfbc0b96987b5f56fcd5116ea.camel@pengutronix.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: 8f0b965f-2065-4f47-5085-08de96e70a75
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 G5J+0EEmyI7RkRHsjuySPMHkRZ/iLBWoEeUzdC9Cs69Ft7zITjFxJ3FbDXenGgYaL7zGpYhJcVDYZAwqkVvpPHeuhUpZtCqiDYGWBot9ShA2zvGBUNEMpYCfsKAY6kJ0fP5dRr+5D/xz9baGLgpLIRo8SpJTlfIhGc4BGm2r5W4HS4Xf3Yj7GBaol1kMX0skpSoodrpUCyh3ndOQCLEcHz/eu9KN0EOKdTVcWaRtqNdCrX8rh5UrnpYJX6xWQI2FYpPr2bCPL89vwJscMwRNlhqlycfu8Wg9YLb9oxAmkfDkgaByeb25GXqMKA6fWbbXrsOQD3gSAvJowjOlNHJRdDyCwTv+BqY41BmHwEPhsVVwVABsPu394Av05j8aByBNy/6PGd+oZCU7a/RaK1vG8F+x9X27N6bsIE/8A3P1yfZX0nMRWovqcTsuxtHKIqaNz2jiv33VC6kb99bSaAqu7IqL31lgO4IX3sB8enhsREoSPEJgtO1LV76goLXUgm7fWNaqP+No9kCCAPcq1XIncH/FY8bDKmRNPaSzfPMSCSk00btrbV2ZzvIbkUT9mQ/txTGgOWNW0+04Hqc/fkYIPg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTMyQnBjcjN0aEo1ZHV5d2pRYkJ0dC9RRkFYRWtuZDZUdkR2aW5yQ1Mrdmd2?=
 =?utf-8?B?V0pqSGVwN0dTMHc0TWxsQnlTYmFIUEw1b1Z4cExjMS9xV09YRUNUVFRQb2Fj?=
 =?utf-8?B?NW9SaVo5aDRtMXNQZ25OWTgwbUtneGFNSWNFUFFXSzd5N0NwMzhVR1JGM2hD?=
 =?utf-8?B?L09tUGpGYmhQYU11UFl3OVBqc2hTaTNmVGVHc014TVFxQThyMFM5Z3lHaWJ1?=
 =?utf-8?B?Z3NkeEx5TDAxWm54cVp6Q1Z5UXZ3WDdsNXlRdmwxamcyMUFWYmczRTNuVnJy?=
 =?utf-8?B?emhER0Vva3ZiMEp2a2VISFJuZnJLMHpiVlVyZ0xUSVVlNjFCZUlaRjBRdno5?=
 =?utf-8?B?UzhUNHFLRFBHNlErVGpLeUk0TTFIemorNUZCN0NBc0VTL1VXUXRneEpuVHdV?=
 =?utf-8?B?ckRwY1FpaElUL0hHNCtpRUNBZlhFdjg0MHN0UmRBMy9IZ3U1Q1pEOGZXOXRL?=
 =?utf-8?B?N0V5TjY0cndqeS9VMUhXa0NrTzR5VFlZLzdsOCt6Rkw1dHJFbWcrZ1lRWTh4?=
 =?utf-8?B?SmpUZEUrbHNGNWNPT1NpcUkvQWwwd2doZllaZ2l4dUxZZm11cnoxbmxKMlYz?=
 =?utf-8?B?YzFoeFVDSGhjNlc0aXVhSFVreldnMHVqbGhEbXBPMnRRdm1scnkvaVRZcHJw?=
 =?utf-8?B?Yjc4YnlDZUx5bE1oUXlJeThEZDVER2ZlZEM3TDk5OFpRbU1SWTFPenVsUmsx?=
 =?utf-8?B?dWp5RHJodXVqK1lZRVJIb0Y0UlRkL21JY3MrRFhJa0FzT1Fxb3BWOUR2dzcz?=
 =?utf-8?B?RVRIbHZGMll2b1pZT1ZsMjAxOCtBRVlNbHZQVnduYm1GZ1drTnFKVkI1YTJI?=
 =?utf-8?B?c3JMd0dPYXR0ajZITXJyczdxd2VnRHZvck42bFh5NkxGOEZ3eGF5WkgvaDZt?=
 =?utf-8?B?QzFYWjA5OWpOaURsdTdLbUxTRzNGaHlmVDdiQzRCMTJja3ExdGxKcXozQ3VS?=
 =?utf-8?B?Y3JnRkw3L3pORllEWUl5dFJZTGpZZDVyd3FQK2l3K0NMeXljSDYySHF2SFlM?=
 =?utf-8?B?Zmw5YnVFVllrN3hmbEJIc0VKRWdPTjVWcmM0ZGFtbkJ0YmREeXoxbUUrcGcw?=
 =?utf-8?B?VjU2RkxwbStaQVNJbThVa0QveVRVaFd3S3ZySkxrTktjVk9iWXhnNjQraGY2?=
 =?utf-8?B?TUhkdVBWYTdqM0RoWTE0d0VENENIQkhCZjdoLzMxYzkwVk9nN25xRFNFZ28z?=
 =?utf-8?B?SG94VEl0LzF4RGhtT2l6WHR5Qzc3K1BaSDJmb2piNmJRc2Z3NVdQYW8razNB?=
 =?utf-8?B?V1l0WFFvK2dielBHTTR4TjdRQ01yM2ViRDhrQ2dXanlnZFZzOXdYc0k3OGYy?=
 =?utf-8?B?L1BPVWt0TWY4Rlo2bi84LzVlcDNES2VGYUp1alN0empBbGJTYzN1cHpTemU0?=
 =?utf-8?B?c0tFRDN2UlhwVVFnVTJBeWwyUnZNcllDR0t6cklXeEpzdjFYVlpCZlUyT3hj?=
 =?utf-8?B?dHlnY1p5anhucWJnemJyZkd3QWpSZkIzZlViUjRYRysxaHNlQU14SlRFRVha?=
 =?utf-8?B?T3NwQXhxNzIxZnkrZHdiSkJmb0JmOVlIRTJZd1kwZWxMdUhQcWgraTdGN3pP?=
 =?utf-8?B?TGV3VW1FZmRuWnNZSlQ0VWJDeGlLUWpYNTNNSURaMS9saDBYRCtIR0pkRkww?=
 =?utf-8?B?RmFqVE5LNEdjeEVBWHRpRGtsOUYzOTJFc0RTb21XaENFMVBYcmNoTWlSRGNF?=
 =?utf-8?B?OE9yM0FQbk5XUFEwZEJkcUl2TjZVYnBxSldhcGdFckUxRWhDVXB3czVpd0tW?=
 =?utf-8?B?T25rUUk2SkxVMnorZm5mTXVJVnh3Z3pkeStsSUExd2FRN2NlVHIxVlk2blM4?=
 =?utf-8?B?RVdULytrYnNZb2xtNHMza3hOYVFqeDBRT2VHU3NibUVtOFI5OUNmUGNraHVp?=
 =?utf-8?B?UXB2WCs3b1dBZmt1RG9wZTNKTmFreUlEK0ZVRFBENXUySXhwL0ZyZmxWZHpO?=
 =?utf-8?B?NkFtbGlKdlhxWFpYd3g3dWgybXZiQXhYZnk1aGNKNWtndG9QVWNmR28yd25T?=
 =?utf-8?B?ejZITjR0WlhmKzI1SGV5cmdSZ1laeGtWcjNZOWlTbS9uTGJlbnFSbEg5M3Mr?=
 =?utf-8?B?WHpRa1EwSWVWdjhGaVl1MDhKT3A4ZnZLWkpGVUkyNDBXNjEyY1pLM3VTQUFQ?=
 =?utf-8?B?REZsQXI0SXN6U0FLQVd6QnR6dzVtL3lkaUpWZmIwS3lHODRYeFFwZ2trNGJJ?=
 =?utf-8?B?SjRjdDVldmlqY2dBVStkWEFETWtDblYvZ3NxQzNHNFBYNFA4Z0NuZVlBMHBU?=
 =?utf-8?B?aFZqZ2FHcXJPdUdTOTRDVnFObEVidVM3ZTZlMGVMeU5ZNnNRQkhodGZrYmY3?=
 =?utf-8?B?cEhMQVhuQ3o2SzZiV0U2SWw5MExvcFNKMnNsalN1bkVuekJPMTJJZDRLbWJZ?=
 =?utf-8?Q?BymtS4uKmARv+h04=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0b965f-2065-4f47-5085-08de96e70a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 09:53:38.9779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63WE2sSzP+DAvXeWgsdPnv/tB+B+1M89oILwjcsy9kcONpNUogClv8arJ2ttl0GjDgatoxbNRIDQ7ephQIOVFTiS2A9pnr5OViw3rj7ff7aP+7hKYjTFMsT2oAZitlka
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266

SGksIFBoaWxpcHAsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPiBPbiBGciwgMjAyNi0w
NC0xMCBhdCAwMjowMSAtMDcwMCwgQ2hhbmdodWFuZyBMaWFuZyB3cm90ZToNCj4gPiBVc2UgZGV2
bV8gaW50ZXJmYWNlcyB0byBzaW1wbGlmeSByZXNvdXJjZSByZWxlYXNlLiBNYWtlIGNsb2NrIGFu
ZA0KPiA+IHJlc2V0IGdldCBvcHRpb25hbCBhcyB0aGV5IGFyZSBub3QgdXNlZCBvbiB0aGUgSkhC
MTAwIFNvQy4gUmVwbGFjZSBwcl8NCj4gPiBsb2dnaW5nIHdpdGggZGV2XyogbG9nZ2luZy4NCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcubGlhbmdA
c3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zdGFy
Zml2ZS1qaGIxMDAtaW50Yy5jIHwgNDQNCj4gPiArKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXN0YXJmaXZlLWpoYjEwMC1pbnRj
LmMNCj4gPiBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtc3RhcmZpdmUtamhiMTAwLWludGMuYw0KPiA+
IGluZGV4IDJjOWNkYWQ3ZjM3Ny4uMzEyYTQ2MzQ4NzBhIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtc3RhcmZpdmUtamhiMTAwLWludGMuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtc3RhcmZpdmUtamhiMTAwLWludGMuYw0KPiBbLi4uXQ0KPiA+IEBAIC0xMjcs
NDggKzEyNSw0NCBAQCBzdGF0aWMgaW50IHN0YXJmaXZlX2ludGNfcHJvYmUoc3RydWN0DQo+IHBs
YXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IGRldmljZV9ub2RlDQo+ID4gIAlpZiAoIWlycWMp
DQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtCWlycWMtPmJhc2UgPSBvZl9pb21h
cChpbnRjLCAwKTsNCj4gPiArCWlycWMtPmJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2UocGRldiwgMCk7DQo+ID4gIAlpZiAoIWlycWMtPmJhc2UpIHsNCj4gPiAtCQlwcl9lcnIo
IlVuYWJsZSB0byBtYXAgcmVnaXN0ZXJzXG4iKTsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYs
ICJ1bmFibGUgdG8gbWFwIHJlZ2lzdGVyc1xuIik7DQo+ID4gIAkJcmV0ID0gLUVOWElPOw0KPiA+
ICAJCWdvdG8gZXJyX2ZyZWU7DQo+ID4gIAl9DQo+ID4NCj4gPiAtCXJzdCA9IG9mX3Jlc2V0X2Nv
bnRyb2xfZ2V0X2V4Y2x1c2l2ZShpbnRjLCBOVUxMKTsNCj4gPiArCXJzdCA9IGRldm1fcmVzZXRf
Y29udHJvbF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwgTlVMTCk7DQo+IA0KPiBQbGVhc2UgdXNl
IGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlKCkgZGlyZWN0bHkuDQoN
ClRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyLiBJIGZvdW5kIHRoYXQgSSBjYW4gdXNlIGRldm1f
cmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfZXhjbHVzaXZlX2RlYXNzZXJ0ZWQgDQp0byBzaW1w
bGlmeSB0aGUgY29kZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gPiAgCWlmIChJU19FUlIocnN0KSkg
ew0KPiA+IC0JCXByX2VycigiVW5hYmxlIHRvIGdldCByZXNldCBjb250cm9sICVwZVxuIiwgcnN0
KTsNCj4gPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gZ2V0IHJlc2V0IGNvbnRy
b2wgJXBlXG4iLCByc3QpOw0KPiANCj4gQ29uc2lkZXIgdXNpbmcgZGV2X2Vycl9wcm9iZSgpIHRv
IHN0b3AgcHJpbnRpbmcgLUVQUk9CRV9ERUZFUi4NCj4gDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5n
aHVuYWcNCg==
