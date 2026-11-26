Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795674456;
	b=Me18ElkltxlhrY2Xu5B3zft9Z3uCkLVVcmPNmopRP7awsDgE8IsEqCPPpz830FalIQlP
	 4rOyxKTFlGMYKpIodCSMyE4kmAk9n+aA1QoGAy0x0Nt5UtTI+pBAgDqUuGDN5WCs5aCSe
	 YmFwlrjNa1iCA44PvlsXdIrx8O90Oo6aW6+G0aGSXDDKj0wEY7r69e2EU6F1Vdiet0jyB
	 ZY6INMI/26dIQr1DkDuG9yQlt8uzI2hKN9TTuL+f+6BMGifIR8pdxluI1/KaYFPQoCu2/
	 BUjlYrA0zrWzzs5Q0mCSY4kkBzY3hXcdmy3RJxjsRX6C1aqc3x/cXnDuoRnX1nr/DAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674456;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-office365-filtering-correlation-id:
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
	bh=cqrXR2pnbM5nk40C96W5nXdVo79ZJoxNMieNL68qCEQ=;
	b=EcM2nVp9b8JIC1A6NRuEiwLfv3Wdw5tKPJhfH3uA83hmZeEuWYSdsEhe+rRKlmPqoMu1
	 jeSizx5doTYszJJMWkEBKUmhTevfPXSahO5fvea7zGkLlcOSKxYVy1EZfPolMtcu/G7MA
	 rRPu6wk9K9mzXkKXglZPaN+X7b/fPVBHXDmy30xeXrT03ezZ38Gz8pYu9dEDvEbqJnrch
	 83ZdfpW9kr1iBWAwYPfv7kQrcmtdQZxcWZDveaBchqGQXiXwN0HI6uGHWrCoqW9YXJgCi
	 sei8jsyO/DC7eZMbeNEJe/3wurelaOsBfBGqsvbWHSPTBI6GP7DnYhiLIhuSLRzuy+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.127
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D9606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 06:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2FAxOTSiw/+SfA3Pda4L3V0SA938bHnB9shs2/tSU3VsXJM5ZqDdKfPmvnzOF0na7hlYL1yU1T4AvvBIvF2WEmQiwqSgDG/hd6e94Gg4kZ7T/4GX2OYGLFO8Jkj9IIXpxp3SmERkMbRSZXVeGZdL20uC/BjzUrRybUaF20bBCEeNT3YalaYWxuocwfnNLKIFiyaJFhH0ChfpRSXPMBUng90Vf1zyIQM0RNGkhKqvUWpzR1XbZEZhdC/fpLSSuxBHoEHCAmdbHs2ryWYlk65gLMr+hvIEwQjxTRflvUlIb4gIACgnPrYnVnt+LPZ00OMqBrAvlaiHHMp/g1viXFG/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqrXR2pnbM5nk40C96W5nXdVo79ZJoxNMieNL68qCEQ=;
 b=cwB3p9OYLM6R6hviWWPXLiRZ+MF0r8uhRMWnpSYea3GisMvfYfbmHfC0eJZICJ3uzOX/xTEfujAm5fj23IHvgrU48Q+kOE6KwbR+HBXCR2gGwx8Sw3q4Rv4CUGk1lQA5Ky7pYaviaSYMIgm/3HTzRsu0uzQPdYHazNK1t4ZTyNQrwpt8mpyIICQzXiLsoZNNFsGAh9AofMTiIUff3LAgLb3ln9IR3BjhtOhCnNG0npLYGxv3iWXMr0uJFpsi+4j1e9xcm7gpynIUrAkg1jfObIdnBTCthhADxPM1+LgoS/1gueOVbO67jI2XSLmzz+cdf51nqVA+i85fjnlEBZ5PUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from TYZPR06MB6915.apcprd06.prod.outlook.com (2603:1096:405:3c::5)
 by PUZPR06MB6056.apcprd06.prod.outlook.com with HTTP via P2P; Thu, 26 Nov
 2026 06:27:31 +0000
Received: from TYZPR06MB6915.apcprd06.prod.outlook.com
 ([fe80::8b39:ed07:452c:9396]) by TYZPR06MB6915.apcprd06.prod.outlook.com
 ([fe80::8b39:ed07:452c:9396%6]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 06:27:31 +0000
From: Luo Liu <Luo.Liu@cixtech.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjUgMS81XSBkdC1iaW5kaW5nczogZGlzcGxheTog?=
 =?utf-8?Q?add_CIX_Sky1_DisplayPort_transmitter?=
Thread-Topic: [PATCH v5 1/5] dt-bindings: display: add CIX Sky1 DisplayPort
 transmitter
Thread-Index: AQHdfWtlcMSdee5UwEqzPTocfdz2Src/35kAgAACxQA=
Date: Thu, 26 Nov 2026 06:27:31 +0000
Message-ID:
 <TYZPR06MB6915D02AE69A9A5649146D31F5422@TYZPR06MB6915.apcprd06.prod.outlook.com>
References: <20261126060003.3979478-1-Luo.Liu@cixtech.com>
 <20261126060003.3979478-2-Luo.Liu@cixtech.com>
 <sashiko-outbox-234829@kernel.org>
In-Reply-To: <sashiko-outbox-234829@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-traffictypediagnostic: TYZPR06MB6915:EE_|PUZPR06MB6056:EE_
x-ms-publictraffictype: Email
client-request-id: 89d1a6ec-6431-42df-8bdb-b0088a4a1173
request-id: a450e69c-329e-4bac-a0ef-08df4b8659a2
x-ms-office365-filtering-correlation-id: a450e69c-329e-4bac-a0ef-08df4b8659a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|42112799006|38070700021|10067099003|56012099006|4143699003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 z7KwPE/HIyt3OuzyNcES2VG/6WY6QdfB9tR64wimmAK1x1/7MQm5L5l6/7OEEATrl241pxGVee3kogqJy0EixBFWz0l1757WyHZbVvhntH17e/uTVxvEcph2iNkPQ5kZRlKrMd4RlIEy7/JFikgNxayVbRvpx1Ymh2fLjv9T55m74K4jSvCXx7+Td/SyKv4x+RCN0N0dZoFxX1jOpD8mv81O0MkCQD0he+4T4o9KUBjIfAV7ETFkmlalDVqSqnmVQtTIjeLvkmxOcy262MtrZrW/0+OPf6MSR2SPAL2aB/F9D7Gxqn8NeVA8E70eFH45LxItNOuYx8q8KfllHS582DoSN6ki5ScHhxzUDHq/8QBne/5caKpSe8Tdgy313lqongmdNRDaauWyTm3SZDtxRv4/k98Sl7rSE//+tFnqCzsRLRf3jLNznWeiW69zLQKP2Ga+8bNL5J7J9B4U/ayDTXPkRDrJQsO9gTpU8UFXVWruMyL/S+aKpfr3q5dF2Z2dd5rY/uZaUDYoF/MNxs+A491AyZi65lQXGx26oJaa1iszDDdZxHVnz9JMqorJCZBiF+5us+bHljmvOanTQ9pE1a13XhsTy3Jq89T2sj8xtgdS7Rf6ivIMsq0pvYp7ju87OW73wH7BpbWhHYs8Wm7IlnmSvdF45xMdUdbIvoLMZmU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(42112799006)(38070700021)(10067099003)(56012099006)(4143699003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGloc3hlS2tySG96WTVpRmxuU3o0QkVpQzNtMFYyL1RJZ2JNRHQ2c1NNcSsz?=
 =?utf-8?B?eHRFNk4rRHVKLzNYQ2dDa211U2lrRWtwd1VzNnVBNUlwalNRVExsa0UzOTkz?=
 =?utf-8?B?bUlIRm5Zd0xRNWg3bnBVbEcvdS96aURRcjhoT0YydWdXNkF4MkxJd21GWFd3?=
 =?utf-8?B?VmhLZVFWS3ZWSGZHK1o1TzVpSGhzNzl5N3ZUUDFINW9CL1E2TERRWWZicGVY?=
 =?utf-8?B?eXRkbjBLOE9Zd0tQUWQwMnIwR2RuSTlLZTQxcnVES1M3bVRHUzlDSHhLUmhX?=
 =?utf-8?B?aHB1eFE2aGlhSkxHZlZTR0J2cVlad0xjM2ErNzhuY3hMZmZENmxyL0NodjF0?=
 =?utf-8?B?WXJXZi9LekQ0ZlFNRmRnUkt4bVlSVlA3OXJEUWt6UE1ESktwQS93RmJmKzI5?=
 =?utf-8?B?b3M0ajB1TXo5T0xtTDl0OExWNEV3ZkQ3a2hhTVM5bWo3OWl1bjU3RlVad09t?=
 =?utf-8?B?YkV6ZGdEVkU1dDdLQTF3WXRSQ1ppZjlyeXl0b1Azbk5UMEhSd1F6NzV0OTY2?=
 =?utf-8?B?clVVeVk5ejdwSkpSb3RzRi92MEZ0Uk11TUF6d0FvcjV3YVBMSHNISHpnWlh6?=
 =?utf-8?B?Z05DeFFpL1dVNUZFTTAvWWc1d21pd0F5aFZITmJEd280V1hEWHRqQUhFRlhS?=
 =?utf-8?B?MXA2N3pBQm9CM041cVkvakU1RlZCUEt2TklWeGVXT0dWREFnUi9meVdXNTBv?=
 =?utf-8?B?OU1kemNoZ3NLd0d1Z3htR1JmekZXYXBEOXRIVE5FQTdjVzNVVWlDdmp2b0Q5?=
 =?utf-8?B?S0hxVDFVTDJoUG9GbTJjTEdDcWtQcVNKQTVseUF5c0ltdzRIV2VsbFlXOU5V?=
 =?utf-8?B?Qnh1OU5aazE2TWp0eEhnSjNtYkRzakVwZkdpemlBelR4dXBJK3UyZTdOakRa?=
 =?utf-8?B?WHc0OTlZc25wUHkyeHhuVTFzR0hPeDc2YTh1NzV0S3RLbU41bGVObmxTbG9o?=
 =?utf-8?B?MjJtMHRGdDJoSFdIY3hCdXlnUVB3bGxQNW92RWwwSEJuZXF1ZHh3eFpSNGtW?=
 =?utf-8?B?cnlhQm1jcGwydUlhTW9PKzJaZk5WNy9QNXI5QUl3dlRNdk9vbzRiMjhVUUpl?=
 =?utf-8?B?VnJiSjExcHJ1Zkt2bjBRaEpqbnV2YmpTcHZ4OS9ZMmRIODhmeC9yRis0Y29M?=
 =?utf-8?B?VGJ1eTRtb2RZZVB6UDNDRmRLT1ZVMlJOZ0xlazhJajBnTmRMVS83WDQrVW1C?=
 =?utf-8?B?RjNVTnE2NXpBZ0hvNU43RWhpa1lQdzd4UytPL25YZUxpVVhvRnVOa0xMLzJH?=
 =?utf-8?B?QytSVU1kc0tNdTNWdVlwejRCMFg2U2hZV1RnZnpHZDFXUGtoS1NCRTNPZG16?=
 =?utf-8?B?THBySTBzQ0NsbUFoT3BWQjB4WjNZYTVNeXdRQTZpWFgzNytDd0UyNWlzR1RV?=
 =?utf-8?B?ZkJ1SmRnWld2WUtjN3pyMmtSMDZmU3o5Vmh6RmdTTmE0RGJPNUdYajgrUkgv?=
 =?utf-8?B?UlpOalNpMGQzaEpLN0d6L3BhSEZPUy8rK1VhYVhPSXdENytncm9CWmwxOExx?=
 =?utf-8?B?dlBKL1Qzckt1WHYxL3lzUkxVL3Y2LzdDN0RFR0dHRU5VcC95RjEwOTBBUFl2?=
 =?utf-8?B?T3BKM2RDNmY3Q2lybkhQUHZQNFpOVDBrSDBuQjA2K0c3M2R5NWlmRGlBYTJV?=
 =?utf-8?B?QnZrQjBDeGJpQ0ZCNGVOQ2dXZ2FIVkRNSEFySkRQMExzVUxQZzNwNmt1d3pv?=
 =?utf-8?B?elJ0NWwwTUMySVdpRi9QUDgwSkhkSnVKQ2NHTFVJU3lCL3k1OUVrTUJUR2Ru?=
 =?utf-8?B?S0ZwVDJqTmRCRFJGbzErUCtiL0h1d1NJV05Ic2hYcUdYK05UVEdJVzV5enFO?=
 =?utf-8?B?UkRnc2E5a3R0UkFBcDZLREVpWFViUEFkSlRUWTd3Qlg3VFd1ekF5ZHJRTElr?=
 =?utf-8?B?YVZ6ZUJmT1NWSXowZXFlNTE3ekE5cDRLd042dDR3d0J3aFk3Q0pCS2Y3eUFZ?=
 =?utf-8?B?L2NFMjlWaTBqMm50b2tLbDBOQXlKWURSUWhNYVNFS2RjZHFCK3ZueGtuSjNh?=
 =?utf-8?B?RDhWVnZ2VUc2VmxVdklNMDM3c3JheHFManZtR2lqTXRNM2hLWkZrOU1NT1NR?=
 =?utf-8?B?SG1qdzZGcm9Wb1hJVi83Wk9VUlZvdWd1bWxMSHUzb2NQcVJCS1NuUVBxZFpM?=
 =?utf-8?B?R2V2eEFRVWRDM3lhMFZDamdZTDdSRm5JZTA0WXFsTTR5V0RZTUVCcFVXR0oz?=
 =?utf-8?B?TjYxeDIyQU4wL0xKMVA3eXQ0U2FWNFVLTXNQRFJGeXk5Vm9FbDdGV0dORTFB?=
 =?utf-8?B?Z0toT0tsQU9rbW82V3B5YmU3R0RpVENHdDMydzBPMGFTWm5kaU5GVXhrTEd2?=
 =?utf-8?Q?AgiBi3xK8AobUV0MYw?=
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
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6915.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a450e69c-329e-4bac-a0ef-08df4b8659a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 06:27:31.1035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tlpBqnJXUzIzOBj27aIEAFsxIyCsZQo0821VdiWFN7CUg86JlU/JXJdCJakcoeQ4DFEnCzihEVZtaKuEe1AZKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6056

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IHNhc2hpa28tYm90QGtl
cm5lbC5vcmcgPHNhc2hpa28tYm90QGtlcm5lbC5vcmc+DQo+IOWPkemAgeaXtumXtDogMjAyNuW5
tDEx5pyIMjbml6UgMTQ6MTMNCj4g5pS25Lu25Lq6OiBMdW8gTGl1IDxMdW8uTGl1QGNpeHRlY2gu
Y29tPg0KPiDmioTpgIE6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnOw0KPiByb2JoQGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5v
cmcNCj4g5Li76aKYOiBSZTogW1BBVENIIHY1IDEvNV0gZHQtYmluZGluZ3M6IGRpc3BsYXk6IGFk
ZCBDSVggU2t5MSBEaXNwbGF5UG9ydA0KPiB0cmFuc21pdHRlcg0KPiANCj4gRVhURVJOQUwgRU1B
SUwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2
aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlIHRvDQo+IGNvbnNpZGVyOg0KPiAtIFtNZWRpdW1d
IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBjaXgsc2t5MS1kcDogbWlzc2luZyBwb3J0cy9wb3J0QDEg
YW5kDQo+ICAgYXV4LWJ1cyBpbiBzY2hlbWENCj4gLS0NCj4gDQo+IGNvbW1pdCAwZmQyY2Y0OTUy
YWM1N2VmYTUyZWNkODE3OTExMDlmODQ0OTE2NzNiDQo+IEF1dGhvcjogTHVvIExpdSA8THVvLkxp
dUBjaXh0ZWNoLmNvbT4NCj4gDQo+IGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBhZGQgQ0lYIFNreTEg
RGlzcGxheVBvcnQgdHJhbnNtaXR0ZXINCj4gDQo+IFRoaXMgY29tbWl0IGFkZHMgdGhlIERldmlj
ZSBUcmVlIGJpbmRpbmcgc2NoZW1hIGZvciB0aGUgVHJpbGluZWFyIERpc3BsYXlQb3J0DQo+IHRy
YW5zbWl0dGVyIGludGVncmF0ZWQgb24gQ0lYIFNreTEuDQo+IA0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2NpeCxza3kxLWRw
LnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Np
eCxza3kxLWRwLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMDAuLjJjYjRkYmI4ZDVmZTUNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvY2l4LHNreTEtZHAueWFtbA0K
PiA+IEBAIC0wLDAgKzEsMTAyIEBADQo+IA0KPiBbIC4uLiBdDQo+IA0KPiA+ICsgIHBvcnQ6DQo+
ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gPiAr
ICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBWaWRlbyBpbnB1dCBmcm9tIHRoZSBNYWxpIEQ3
MSBkaXNwbGF5IHBpcGVsaW5lIChLb21lZGEpIHRoYXQgZHJpdmVzDQo+ID4gKyAgICAgIHRoaXMg
Y29udHJvbGxlci4gVGhlIGxpbmsgdG8gdGhlIHNpbmsgaXMgdGhyb3VnaCBwaHlzIChVU0ItQyBj
b21ibyBQSFkNCj4gPiArICAgICAgb3IgdGhlIG5hdGl2ZSBEUCBQSFkpLCBub3QgYSBzZWNvbmQg
T0YgZ3JhcGggcG9ydCBvbiB0aGUgRFBUWC4NCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+ICsg
IC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSByZWctbmFtZXMNCj4gPiArICAt
IGNsb2Nrcw0KPiA+ICsgIC0gY2xvY2stbmFtZXMNCj4gPiArICAtIGludGVycnVwdHMNCj4gPiAr
ICAtIHJlc2V0cw0KPiA+ICsgIC0gcGh5cw0KPiA+ICsgIC0gcG9ydA0KPiA+ICsNCj4gPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4gU2hv
dWxkIHRoaXMgc2NoZW1hIGRlZmluZSBhIHBvcnRzIGNvbnRhaW5lciB3aXRoIHBvcnRAMCAoaW5w
dXQpIGFuZA0KPiBwb3J0QDEgKG91dHB1dCksIGFzIHdlbGwgYXMgYW4gb3B0aW9uYWwgYXV4LWJ1
cyBwcm9wZXJ0eSBmb3IgZURQIHBhbmVscywgaW5zdGVhZA0KPiBvZiByZXF1aXJpbmcgYSBzaW5n
bGUgdW5udW1iZXJlZCB0b3AtbGV2ZWwgcG9ydCBub2RlPw0KPiANCj4gVGhlIHBoeXMgcHJvcGVy
dHkgb25seSByZWZlcmVuY2VzIHRoZSBsb2NhbCBTb0MgUEhZIHByb3ZpZGVyIGFuZCBkb2VzIG5v
dA0KPiBkZXNjcmliZSBkb3duc3RyZWFtIHNpbmsgb3IgQVVYIGJ1cyB0b3BvbG9neS4gIEluIGFk
ZGl0aW9uLCBhbiBvdXRwdXQgcG9ydA0KPiBjYW5ub3QgYmUgYWRkZWQgYXMgYW4gb3B0aW9uYWwg
cHJvcGVydHkgbGF0ZXIgd2hpbGUgYSB0b3AtbGV2ZWwgdW5udW1iZXJlZA0KPiBwb3J0IG5vZGUg
aXMgcmVxdWlyZWQ6IG9mX2dyYXBoX2dldF9wb3J0X2J5X2lkKCkgc2NvcGVzIHBvcnQgbG9va3Vw
IGV4Y2x1c2l2ZWx5DQo+IHRvIGEgcG9ydHMgY2hpbGQgbm9kZSB3aGVuZXZlciBvbmUgaXMgcHJl
c2VudCwgc28gYSBib2FyZCBEVFMgYWRkaW5nDQo+IHBvcnRzL3BvcnRAMSB3b3VsZCBoaWRlIGFu
IFNvQyBEVFNJIHRvcC1sZXZlbCBwb3J0IG5vZGUgdW5sZXNzIHRoZSBiaW5kaW5nIGlzDQo+IG1p
Z3JhdGVkIGZyb20gcG9ydCB0byBwb3J0cy4NCj4gDQoNCg0KSGksDQoNClRoaXMgZGV2aWNlIGhh
cyBleGFjdGx5IG9uZSBPRiBncmFwaCBwb3J0OiBpdHMgdmlkZW8gaW5wdXQsIHdoaWNoIGlzDQps
aW5rZWQgZnJvbSB0aGUgS29tZWRhIGRpc3BsYXkgcGlwZWxpbmUuIFRoZSBEUCBsaW5rIGl0c2Vs
ZiBpcyBub3QgYW4gT0YNCmdyYXBoIGNvbm5lY3Rpb24uIFRoZSBvdXRwdXQgZ29lcyB0aHJvdWdo
IHRoZSBnZW5lcmljIFBIWSByZWZlcmVuY2VkIGJ5DQoicGh5cyIgdG8gYSBwaHlzaWNhbCBjb25u
ZWN0b3Igb24gdGhlIGJvYXJkLCBhbmQgdGhhdCBjb25uZWN0b3IgaXMgY3JlYXRlZA0KYnkgZHJt
X2JyaWRnZV9jb25uZWN0b3JfaW5pdCgpIGZyb20gdGhlIGJyaWRnZSBvcGVyYXRpb25zLiBUaGVy
ZSBpcyBubw0KZG93bnN0cmVhbSBzaW5rIG5vZGUsIHNvIGEgcG9ydEAxIHdvdWxkIGhhdmUgbm8g
cmVtb3RlLWVuZHBvaW50IHRvIHBvaW50DQphdCBhbmQgY291bGQgb25seSBiZSBsZWZ0IGRhbmds
aW5nLg0KDQpUaGUgc2NoZW1hIHRoZXJlZm9yZSBmb2xsb3dzIHRoZSB1c3VhbCBjb252ZW50aW9u
IG9mIGEgc2luZ2xlIHVubnVtYmVyZWQNCiJwb3J0IiB3aGVuIHRoZSBkZXZpY2UgaGFzIGV4YWN0
bHkgb25lIHBvcnQuDQoNCllvdSBhcmUgcmlnaHQgdGhhdCBvZl9ncmFwaF9nZXRfcG9ydF9ieV9p
ZCgpIHN3aXRjaGVzIHRvIGEgInBvcnRzIiBjaGlsZA0KYW5kIHdvdWxkIHRoZW4gbm8gbG9uZ2Vy
IHNlZSBhIHRvcC1sZXZlbCAicG9ydCIuIEJ1dCBubyBib2FyZCBEVFMgY2FuDQpsZWdpdGltYXRl
bHkgYWRkIGFuIG91dHB1dCBwb3J0IGhlcmUsIGJlY2F1c2UgdGhlcmUgaXMgbm8gbm9kZSB0byBj
b25uZWN0DQppdCB0bywgc28gdGhhdCBzaXR1YXRpb24gY2Fubm90IGFyaXNlIGZvciB0aGlzIGJp
bmRpbmcuIEEgZnV0dXJlIHZhcmlhbnQNCnRoYXQgZG9lcyBtb2RlbCBhIGRvd25zdHJlYW0gbm9k
ZSB3b3VsZCBjb21lIHdpdGggYW4gdXBkYXRlZCBzY2hlbWEsIGFuZA0KaXRzIERUUyB1c2VycyB3
b3VsZCBiZSBjb252ZXJ0ZWQgYXQgdGhlIHNhbWUgdGltZS4NCg0KImF1eC1idXMiIGlzIHNwZWNp
ZmljIHRvIGVEUCBwYW5lbHMgdGhhdCBzaXQgYXMgYSBjaGlsZCBvZiB0aGUgQVVYDQpjaGFubmVs
LiBUaGlzIGJpbmRpbmcgY292ZXJzIGJvdGggdGhlIFVTQi1DIERQIGFuZCB0aGUgbmF0aXZlIERQ
IG91dHB1dA0KYW5kIGRvZXMgbm90IGJpbmQgYW55IHBhbmVsLCBzbyB0aGUgcHJvcGVydHkgd291
bGQgZGVzY3JpYmUgaGFyZHdhcmUgdGhhdA0Kbm8gY29kZSBkcml2ZXMuIEl0IGNhbiBiZSBhZGRl
ZCBhcyBhbiBvcHRpb25hbCBwcm9wZXJ0eSBsYXRlciBpZiBhbiBlRFANCnBhbmVsIG5vZGUgaXMg
ZXZlciBuZWVkZWQ7IHRoZSBpbnB1dCBwb3J0IHN0YXlzIHdoZXJlIGl0IGlzIGVpdGhlciB3YXks
IHNvDQp0aGF0IHBhcnQgaXMgbm90IGJsb2NrZWQgb24gdGhlIGNob2ljZSBvZiAicG9ydCIgdmVy
c3VzICJwb3J0cyIuDQoNClRoYW5rcywNCkx1bw0KDQo+IC0tDQo+IFNhc2hpa28gQUkNCj4gcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTEyNjA2MDAwMy4zOTc5
NDc4LTEtTHVvLkxpdUANCj4gY2l4dGVjaC5jb20/cGFydD0xDQo=
