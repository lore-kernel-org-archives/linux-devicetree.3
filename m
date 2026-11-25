Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795568880;
	b=CmxMWDkcb0dfxA8CofRdzhPiXYjNFD8t6m2FQHdOp5XgBQIbGDs8mqJLh9bPEP8PMJu1
	 gBhEZ/sTeeHLKRvjxSGp83vbmN+d/7nmVnlmZ956ufREWo5IuCkdBWikKvGYO5NPZD8NI
	 ahlF657xIp+KIqQ6lBRTDnBtp7G2aPX8OVkc/THwmjmfN6RQzepxiarDcRYQG5fHchZMq
	 KQuK58PE10JZBo0m4j+6JxTL1ZthCt0weGu7UbviGYY+fdupYYYVCg+ZuYfe9n1ddtZO0
	 MC4Wkb5qOpM56WBQGmjiBz8d59qiTUg4bW0z6G3Cd7x7fq2VC8mHqP5DWzzceQin0HQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795568880;
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
	bh=Hz0p5HaKs672WGbtu3/8SWvDZ+n/N9RX78FyZHhX1Vo=;
	b=2nkjblSwx81hpextMwlVSLk6gftsPI6/gckMuTlUFo0MHuWTKtZLkriXhBFMkjuyvIlc
	 udy0ZSKepaOb817vOLvTVYqcoosDND5NJn8Sk3V1H8UtEn49BPEvVzprqlny7A0aTVste
	 uqaKFWAs2EeYg1Ikwf2FW/2cKTqQJ44M5AgzUqxei9MrM/ZAxp9VNt5INSt9gM2jh6IsU
	 K6TDBSzHMAJEpecb9isFxO8YhIDW/+uLdQLz9r+m8SBCFUzbgqKq7WEBN4XmZY4XHarog
	 T2CohaKRebrI3tHtH5no+WjthtPCIgefsuUEnR5KHRrDAoFtjHrIsfryLg1ihS4vo8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.134
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2134.outbound.protection.partner.outlook.cn [139.219.17.134])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA6606A31E;
	Wed, 25 Nov 2026 01:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ugp5IYNVQhz2QRvyzHCkmHGhehrS6YrVkMNAJR4oegwOABana0iR7Q1hkEsbnkOy+V7+3M9mUcIiBJnO3zZO0utlm3+bYr7zXOHBq3PfHj9pCIbundnqNL6UsLY7dg3wEXOasnwPMkLFf5RElTYJ4Z+orQpFBrQvEDB0UIsoZKGDsT8pBz9LKxegLm8o9jbKMUINqqWwv4bjx+UqXRcOdLG0v9nihy16bSiPPsU87eN70PXC2FO/ckzPUNjCwuZkYO5R7R8++qIjx17P1HR6Zipw7Bsbd5DH+gcghu0Ou0JcHipGQWbZbqPDYt8XC5kpldOd3QpPzq3cNclQ9NGUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hz0p5HaKs672WGbtu3/8SWvDZ+n/N9RX78FyZHhX1Vo=;
 b=I5GPjtROOBoRfU9UANdB36fboFZl6R3MqdTz3Z/BE3c0QWaKfpH+QqjZSXzLasuUYXqfpBRg1OPgdpx7F+0389hzleKHpYnsqIgDCVTDJl2aEoL6Ks79inMAM8S3oYuVRIKstBntNHQSq6tUE1EGoK1C80ltOjDKX8l3EWH+ThqB1Gz2+feCcUMBb+fLB2e4PNG8h14Nsz3xgJTdacEh6bQmtDxZs5MJdhUU65CDjkanaCVRtVHhnhLi+R6N1QKKCvHVXZgS+Kq+eCNddy8MmqIHYKyciSHaFvkTEKYfoQNM3FfQVV3/wVNcrr+hFIagGUUi/Ak3SxrE+/p5QFBkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:d::12) by BJSPR01MB0516.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:10::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 25 Nov
 2026 01:07:46 +0000
Received: from BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn
 ([fe80::c362:8d6f:de71:524d]) by
 BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn ([fe80::c362:8d6f:de71:524d%7])
 with mapi id 15.21.0592.012; Wed, 25 Nov 2026 01:07:46 +0000
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
Thread-Index: AQHdfHlhfVp2ok8hpEyKC19VHjhwyQ==
Date: Wed, 25 Nov 2026 01:07:46 +0000
Message-ID:
 <BJSPR01MB0577DD87B6BE14E93640FD3A85432@BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn>
References: <20261118062526.1436893-1-mason.huo@starfivetech.com>
 <20261118062526.1436893-2-mason.huo@starfivetech.com>
 <20261118-repackage-backlight-1bdc5955a8d2@spud>
In-Reply-To: <20261118-repackage-backlight-1bdc5955a8d2@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJSPR01MB0577:EE_|BJSPR01MB0516:EE_
x-ms-office365-filtering-correlation-id: e3b38e08-c251-4fd9-9c20-08df4a908425
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|261026121527099003|261021123027099003|10067099003|261102123227099003|38070700021|261021121427099003|56012099006|261022105027099003|261021135927099003|261026140227099003|261028144727099003|261009223027099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 yr8Xwn8oSXE14Pu6Di/P8Sq3F6QjEBXkT5yqvAtku0PT7crfp8cwgFmjepBMdW5N2AOtyXX8aNeeCCcJOtqLJD6ktbuQ2eBR6n+s6t8WMP7xPSNBdg3ahz3IS1PbFRErHhg/CntJmZfuEptiTLT739oWvQdhgnSlCnR8L6egqBMRxc06+fXuaxhBnUygRJmc9v/PkRyCpvXlxIZTdK2fYTKHjxleM+QZRICG//Vudm57c2YzyCSj3pSAiS+FKe19emgjbMxvjkynnCS2KvVI+Jz33mXjhhIyHuz4GeOJzrBRVmHhvtjIfnzmvO7kIYNcVkjnzm/AHeF7SImkl9iPIOADTnmL5aj2fh++kzGJdfOvNBVqWMFrzoM1cQJQP8dFULJ+9ASnWVPvvIQgewwCzxoxoFoIZ5+3/UWwjsDbldPPROWBtzp1c5VNLuxf3LXT4c6KrFT88r6fV5mpcTI5AIMgiVR7r70BPVqb0XwNn8C0mkN6EOWJ53BMeX0XmG3uMkdJeIpc463bm+GkOsmxtr1rcsUsF5OFDJs1wLY1C7ZxkoPUBYmfModjZ6CX5vFk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJSPR01MB0577.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(261026121527099003)(261021123027099003)(10067099003)(261102123227099003)(38070700021)(261021121427099003)(56012099006)(261022105027099003)(261021135927099003)(261026140227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?M0ErWEpSSHJtU2JjRHhhTUVqVVpsTTFVT3Q3S1h6ZDZXNU5PQ0FxdnZaeXFG?=
 =?gb2312?B?RnFqcDlzeHlOOVE2WmZHdkFWUjBmRFh0bWgramRlQ0Zqek5RbVNvbnRUS1k1?=
 =?gb2312?B?SXBtaXY3QWg5Z3Z0cU9LSjFDSDNPTU52c3p0bjFGS1o4R3JXYnZ2K09Jcjhz?=
 =?gb2312?B?MkZjb0VDNHltS0IzQmpncnRUS2NUNEZhc2paak1PQ1dzc1dQeEtNWUJyWjlF?=
 =?gb2312?B?VEFZRTNkNDhzY005OXdiOGxsb1VjRkZzOHliclRyZVpybGsyMzZlQ3Joa1h3?=
 =?gb2312?B?UVlUQVVERFRvL0JQdE4rYUVqKzJCUGtKaDRnVlBtRHdONmpaR0JLZUd1UzEy?=
 =?gb2312?B?ZnE2L3A4YUNMSit5blIwdXJkeFNMQmYxeG1NeE1MeGh4cTRnWmkyR2xqNlVv?=
 =?gb2312?B?SWZXblZjSXNkTm10ek5vaUdsMWNIUFh2TDlxYWJ2bGlmcFFwVjkxRnlpRk8w?=
 =?gb2312?B?NitlcmR3a0czc3lqNVo3UVF4UWlyU0VYMmhMalB4QksyY1VaQy9uZUxLZm1L?=
 =?gb2312?B?b3BJN1ppNmN6c0R2MFhNRnlrSE56WlcvVnhDNisyclNoWHFSaUIweGlaK0lB?=
 =?gb2312?B?OSthRzlWZmRqbHM1cXhPYmI0UlduOWdtdHFwdkZIdFF6cGR3QXVSeUlXeUJr?=
 =?gb2312?B?VzgvMjVzbXlzQy9TK2ovWWVxTnRZa29HeVYrY09tdVo2Ny90VXVmL1dHbGdo?=
 =?gb2312?B?THpLWWVYUlhPbmZ3dVRPRGxjYzdMWmcyZ3VOejFLd3ZJcXE0V2RkME4yUXNn?=
 =?gb2312?B?K25vam80dWhRVFRhZlg4NGZzbHp6Y3RuamlXNURXbHBmM3FDMCtOdGtUNlZ2?=
 =?gb2312?B?RXdSTHFzQnhFODlnM3RSZ2Eza3NSbW5iYVFaM1J1Umh4YkVuekhYYncxTDBu?=
 =?gb2312?B?Yk5XN2JZVXdqSUNKT3FmZFkxUTRwUlRYSjZsdXhpSE83UFNENVg5K0QxeFpG?=
 =?gb2312?B?WStpWW5aSnJGTHhJeUNJU3pFK281YjZReUNHN1cveXl6UVRYcUVURlg3RUx1?=
 =?gb2312?B?MlZ4ZEZ0ZnpxenViK2pReFlTU21HcWNBZWw2QUJYalRmNE5PZjRhN2c4S2RB?=
 =?gb2312?B?VXJaUm1YZEdRcVRhYjZLaExSdVBZM2tHQTM4a0tYZmJpOGNKM2VRNnhwR1Fh?=
 =?gb2312?B?SWNUUkRFRlA3MHJRZnVsYkRqckhqTDVjTHlSVVQ1WE5pUlBycXhnVU10dlJF?=
 =?gb2312?B?bjAyN0J1dXBNS1U4RXp4NndaVnpLMzRNZytON2I5SWtNN1F0UXNFbDFwYm40?=
 =?gb2312?B?cENXY2hXam1UcmFrNTJoYnM1ZDVpSTBoRkJUbmxVVVA5MDkrejhaYWFQYmVB?=
 =?gb2312?B?MHMzWUJHcjBJS2M4V2ROcmw2U1FVVHArTGpRNDBpM1NaM3RZVFhzamk0emV2?=
 =?gb2312?B?MHZuRFJWWHZWbHZvVXVPRTZPRzJOVE1zVG4relcrbTFtcGpxWktaVjN0MHFs?=
 =?gb2312?B?enJwUm10OXczaENPenh0ZnliUjRJTFhkUWUrRUF1Z1RVdW1xVmc2OW5sSWUz?=
 =?gb2312?B?Ti9ZUEdKNzdCQ0dNSjQ4VkNzRHhwV2dLU0picVBEdXBGRlJjc2pSMlA5TXly?=
 =?gb2312?B?QlFyRHRlbTdacmdnUmJOT0x6c2h3eUF2dTYydHp4a0I0aERIWXdVOERhRnM0?=
 =?gb2312?B?Sjg3WWs2MkIxR1U3Ymx2amt5M29aVklheHE5TTJFU1hHVmZWVzJPNVkvWkR2?=
 =?gb2312?B?MDM5Sm13SDNKa01yQW42MUNFVzZ3TStXZDZmMTdOK3V3dnRJcE15blJxc1da?=
 =?gb2312?B?R0JWRzlJUkxOSnNNWHZibkorN21TSlJmVjBmcHRhQXI2MTFGU2JBQzlCK091?=
 =?gb2312?B?OGYwTzVsZDlOZVdWVll1R1pQTi83K3M5M1JHb2RmL2lmSCtISjJ0alJvK09Z?=
 =?gb2312?B?dFZYVFhwRW1CczA5M3pvUHlUZUJCQUJlalg3bEJhczVJNVcrWWZHZWcvd3pq?=
 =?gb2312?B?YWgyOUQ3dTgrQ1ZpeTFYOGNLUDN0R1ZEY2pvcDlnSEJVVWRCWW40MWJyRXhG?=
 =?gb2312?B?YlVnVVU5NS90YmtBTnFQd25iNnF0UmcxckJoc0tnWTNzempyVVlseVdaSEZT?=
 =?gb2312?B?aTdQUGFhUUhvd0NRcnl5WldMUlQ1Tzg3dXo2RldnZlRYSWY4L0ltNXRETGN0?=
 =?gb2312?B?RU5OZ3pucjBBa1FzUGh6K3d2aStoYkpiSjV6RXRQVTE2STJyd1FseXVXaWVo?=
 =?gb2312?B?MVdNb2NvcTBvRUJhS2JtQUE5d3NLNmZPY3c0QS8vZW5sOGtCMTlvaEhRQUZh?=
 =?gb2312?B?ZFZNanFRQ24rT1R3alAyVWJkeXN2VHIwaElaekJEYjBvbE5WSFd2dm0raU5p?=
 =?gb2312?B?ZmlNRWNycXVJVEtIR2RjUjEvZG5LZXljSUNmc1lEbG9ubWFDbUprUT09?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b38e08-c251-4fd9-9c20-08df4a908425
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 01:07:46.2126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rv7AMcZ96lwsjAouvKhl8e1jASFhpVF+18xCwVgAhPgC/zBXD2Pn1g8nsMmijIAiPwtS2UgFv/Oj328gxdkvCMkwWnFkGfPg9aMq1LeVUFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJSPR01MB0516

PiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjbE6jEx
1MIxOcjVIDE6NTgNCj4gVG86IE1hc29uIEh1byA8bWFzb24uaHVvQHN0YXJmaXZldGVjaC5jb20+
DQo+IENjOiBDb3JleSBNaW55YXJkIDxjb3JleUBtaW55YXJkLm5ldD47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5v
cmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgb3BlbmlwbWkt
ZGV2ZWxvcGVyQGxpc3RzLnNvdXJjZWZvcmdlLm5ldA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYx
IDEvMl0gZHQtYmluZGluZ3M6IGlwbWk6IENvbnZlcnQgc3RhcmZpdmUsa2NzLWJtYyB0byBEVA0K
PiBzY2hlbWENCj4gDQo+IE9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDAyOjI1OjI1UE0gKzA4MDAs
IE1hc29uIEh1byB3cm90ZToNCj4gPiBDb252ZXJ0IHRoZSBzdGFyZml2ZSxrY3MtYm1jIGJpbmRp
bmcgdG8gRFQgc2NoZW1hIGZvcm1hdC4NCj4gDQo+IFRoaXMgaXMgbm90IGEgY29udmVyc2lvbiBz
aW5jZSB5b3UgYXJlIG5vdCBkZWxldGluZyBhbnl0aGluZz8NCj4gDQpUaGFua3MgZm9yIHRoZSBj
b3JyZWN0aW9uLCB3aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdjIuDQoNCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IE1hc29uIEh1byA8bWFzb24uaHVvQHN0YXJmaXZldGVjaC5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9pcG1pL3N0YXJmaXZlLGtjcy1ibWMueWFtbCAg
ICAgICB8IDUzICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUzIGlu
c2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pcG1pL3N0YXJmaXZlLGtjcy1ibWMueWFtbA0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pcG1pL3N0YXJmaXZl
LGtjcy0NCj4gYm1jLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaXBt
aS9zdGFyZml2ZSxrY3MtDQo+IGJtYy55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjJjYjkxZDMyMWEzMg0KPiA+IC0tLSAvZGV2L251bGwNCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaXBtaS9zdGFyZml2ZSxr
Y3MtYm1jLnlhbWwNCj4gPiBAQCAtMCwwICsxLDUzIEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ICslWUFNTCAxLjIN
Cj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvaXBtaS9z
dGFyZml2ZSxrY3MtYm1jLnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IFN0YXJGaXZlIEJN
QyBLQ1MgRGV2aWNlcw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBNYXNvbiBI
dW8gPG1hc29uLmh1b0BzdGFyZml2ZXRlY2guY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246
DQo+ID4gKyAgVGhlIFN0YXJGaXZlIEJNQyBTb0NzIHVzZSBLZXlib2FyZC1Db250cm9sbGVyLVN0
eWxlIChLQ1MpIGludGVyZmFjZXMNCj4gb24NCj4gPiArICB0aGUgZVNQSSBidXMgZm9yIGluLWJh
bmQgSVBNSSBjb21tdW5pY2F0aW9uIHdpdGggdGhlaXIgaG9zdC4gVGhlIEtDUw0KPiA+ICsgIGNo
YW5uZWxzIGFyZSBwYXJ0IG9mIGEgU3VwZXIgSS9PIChTSU8pIGJsb2NrIGFuZCBlYWNoIGNoYW5u
ZWwgb2NjdXBpZXMgYQ0KPiA+ICsgIDB4MTAwIGJ5dGUgcmVnaXN0ZXIgd2luZG93LCBzdGFydGlu
ZyBhdCBvZmZzZXQgMHgyMDAgb2YgdGhlIFNJTyByZWdpc3Rlcg0KPiA+ICsgIHNwYWNlLiBBIGNo
YW5uZWwgaXMgaWRlbnRpZmllZCBieSBpdHMgcmVnaXN0ZXIgb2Zmc2V0IGFuZCB0aGUNCj4gPiAr
ICAic3RhcmZpdmUsc2lvLWlkIiBvZiB0aGUgcGFyZW50IFNJTyBub2RlLg0KPiANCj4gV2hlcmUg
aXMgdGhlIGJpbmRpbmcgZm9yIHRoZSBwYXJlbnQgU0lPIG5vZGU/IEhhcmQgdG8gcmV2aWV3IHRo
aXMNCj4gd2l0aG91dCB0aGF0IEkgdGhpbmsuDQo+IA0KU29ycnkgZm9yIG1pc3NpbmcgdGhlIFNJ
TyBub2RlIGNvbW1pdCwgd2lsbCBhZGQgaXQgbmV4dCB2ZXJzaW9uLCBhbmQgaXQgbG9va3MgbGlr
ZToNCisgICAgICAgIHN1cGVyaW9AMTA1ODIwMDAgew0KKyAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAic3RhcmZpdmUsamhiMTAwLXNpbyIsICJzaW1wbGUtbWZkIiwgInN5c2NvbiI7DQorICAgICAg
ICAgICAgcmVnID0gPDB4MCAweDEwNTgyMDAwIDB4MCAweDEwMDA+Ow0KKyAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDI+Ow0KKyAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDI+Ow0KKyAg
ICAgICAgICAgIHJhbmdlcyA9IDwweDAgMHgwIDB4MCAweDEwNTgyMDAwIDB4MCAweDEwMDA+Ow0K
KyAgICAgICAgICAgIHN0YXJmaXZlLHNpby1pZCA9IDwwPjsNCisNCisgICAgICAgICAgICBrY3NA
MjAwIHsNCisgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaGIxMDAta2Nz
LWJtYyI7DQorICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHgyMDAgMHgwIDB4MTAwPjsNCisg
ICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwyODI+LCA8NTc+Ow0KKyAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHQtbmFtZXMgPSAia2NzIiwgImVzcGlfcnN0IjsNCisgICAgICAgICAgICB9Ow0K
KyAgICAgICAgfTsNCg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBzdGFyZml2ZSxqaGIxMDAta2NzLWJtYw0K
PiA+ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBp
bnRlcnJ1cHRzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IEtD
UyBjaGFubmVsIGludGVycnVwdA0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBlU1BJIGJ1cyBy
ZXNldCBkZS1hc3NlcnRpb24gaW50ZXJydXB0DQo+ID4gKw0KPiA+ICsgIGludGVycnVwdC1uYW1l
czoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0OiBrY3MNCj4gPiArICAgICAg
LSBjb25zdDogZXNwaV9yc3QNCj4gDQo+IE5vIG5lZWQgdG8gaGF2ZSAicnN0IiBzaW5jZSB0aGlz
IGlzIGEgcmVzZXQgYnkgbmF0dXJlIDspDQo+DQpPSywgd2lsbCByZW1vdmUgaXQuDQogDQo+ID4g
Kw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+
ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsgIC0gaW50ZXJydXB0LW5hbWVzDQo+ID4gKw0KPiA+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsg
IC0gfA0KPiA+ICsgICAga2NzQDIwMCB7DQo+IA0KPiBzL2tjcy9pcG1pLz8NCj4gDQpSZWZlcnJl
ZCB0byB0aGUgb3RoZXIga2NzIGJpbmRpbmcsICBhbmQga2NzIGlzIG9uZSBvZiB0aGUgc3lzdGVt
IGludGVyZmFjZXMgb2YgaXBtaSBwcm90b2NvbC4gDQoNCj4gPiArICAgICAgICBjb21wYXRpYmxl
ID0gInN0YXJmaXZlLGpoYjEwMC1rY3MtYm1jIjsNCj4gPiArICAgICAgICByZWcgPSA8MHgyMDAg
MHgxMDA+Ow0KPiA+ICsgICAgICAgIGludGVycnVwdHMgPSA8MjgyPiwgPDU3PjsNCj4gPiArICAg
ICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAia2NzIiwgImVzcGlfcnN0IjsNCj4gPiArICAgIH07DQo+
ID4gLS0NCj4gPiAyLjUwLjENCj4gPg0K
