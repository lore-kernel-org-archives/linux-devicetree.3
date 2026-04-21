Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FECC2FD;
	Tue, 21 Apr 2026 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776732306; cv=fail; b=JO7PQrrFRqF0+JQzztm/fNWCwAjgauJIGuE7aDF2CeL3h8+OWOjdIt4XpUECvV6tNrKdNS0chKxiFNY3zcCKl5KBrIhly2UmDq45UVGUle9daVjFXCXNhbqtUtrfsMxnZrqwd3h0wWckiEuL7+FnWQUcGrqL45V7d9PnHUMcjHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776732306; c=relaxed/simple;
	bh=tNfCfSuKQOr+VHKFCNm3dKNsQsNBeOZKy4LfQs2Wq0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ajd9mVgtOPnfXyMzsBAK96ebT2GLJarymybh9iJvI1wVmXkcxqV7/WpVSKh3RU5A5MkGb+IWaR/w1PyiDs8hFMh8GSWb/uJ19/2fjb57CqlWw7tsEJkfzHuCvV3aj7I5nMGoAJsFyEl64UrxZGYKSF8eyfv+3hthhIuIqMXapN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9RMSk0Chbq+lHJSRzColQEURS83cW3/w492wfCviTWssA7EfvRmh2nU7knGro7OCQW5XgGiKRcsiuFjvf/k8mHZ8oOQQ16iZsavwx8g4szjPwGG7TSB9H04ywezFv8ir8PVGjsNvClMehL3ksFpCna2l5oTzukP1P23XL9VnI6z/swpWvYNlb2Z2cMDeU3WXCxKgLTmkijAajLjVJe6twrIhDNpg149jQRcmGg3wbH4o1I5VAzza+SvmpW1s5iXgeWf2QX+FIEGS9N0712V2ZJ9YVCyDkVelS0EQ/ggBUmEozfApuLU1Cb3UdX5vyjK6LGpHaYNYr/GQquUo1xVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNfCfSuKQOr+VHKFCNm3dKNsQsNBeOZKy4LfQs2Wq0o=;
 b=mw2ITMcs55KhgsR0au0Q6GaIPZghJB9e/4JlxM/V1h122q9L/i7ikdfa9a8wFcqn/mJBQZYPH+/1mYp9nEkyrRh1k5xyeWdo/ALDAvx1nL/UuPl/YR7/slK+vdoz/lBEQnPdESvHofbn4NO58j79ywSHvb5bCpl7up/pE5kk1oFff8lQ+pekwJYQFqmUU7TrJByhh1wd10N3OY4af8uINDVkcuoFn0O/zgT01dXlR+x0ewDP8i1uG+qFr81130yPcff4OafFJshS0nVzrbT0fZsoorZ3D3FVb/vdI4+9VYtqL9BpxWTYSyYfFp9gPhOYA8EEr4c3eroWTk7d6q/WkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.33; Tue, 21 Apr
 2026 00:44:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9818.033; Tue, 21 Apr 2026 00:44:49 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTA6?=
 =?utf-8?Q?_Drop_CAMSS_node?=
Thread-Topic: [PATCH] riscv: dts: starfive: jh7110: Drop CAMSS node
Thread-Index: AQHc0MgysTuBFOJbb02mZ6cLoRETibXorjmw
Date: Tue, 21 Apr 2026 00:44:49 +0000
Message-ID:
 <ZQ4PR01MB12023B16CA8CBA1DB9FB1D52F22C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
In-Reply-To: <20260420-starfive_camss_use-v1-1-ec326af71ca7@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
x-ms-office365-filtering-correlation-id: 4ccc0d13-4237-4d78-d9b5-08de9f3f3173
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|921020|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 MRQXRYnfgvXqCdVDwORAj5wORaB4ePkx9a09kVZnAqWSqzTOGMRQKRs8rgp360j3vM++xMG1eIBdcmjNyJAqVua73zBRvHNQtPIc9R/VSb7pZmxASeoha3f2TGmGd72JkK5HDTs7KSGBALW+Hk8eqUqJ5w4+OHtNHwOUFYu/ng6OIAh0lpuok9R9DF1KbrkWqhHDDXmw4Yn+SwIba3Fscryz+5dkqduxnnuFRHaVDMosRQTDmlzUPLIRow/J0wtn5nnVZzpUXLAGJfz7DkbBRGHho0lvaKv2JNKh3/zRUpinSTBk1hJ8aANp60/Z/PfSIjw8MiJXvxXCl+Bo4aEEBh6IYGYjv1kZkT0H1Ycbh2dH+7uzxcYXK2HaVlz68KVipjNY8CyiAcJyQDBs6l8YTZ+GH75FVHx9T6x6PXoqyDXRtLYSdT/SzJ8JQMrP62U3k9RC8To3wF5nReafJJnkmAhxEQ72tXa/jUTZOeY5pCWf7cJqUB8Mm/aEsxmIQDcyK2Iu7TU7vqphiuxPsScl1qOG7odS/64EL0ZhUUt57rVQRbuOItRxc1nFbLNB/ZM14nRFxJKqmh6rNg7gnPAU5yIubrPZeys7tlA8aii0QYI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3ZSbEIyZG9rSlJXMWtab2JST1pQdXZNSktkbFlQSG5CMEhqOFVSdnJHY3hT?=
 =?utf-8?B?TExKWEtaNVc1WC9odFhxaVBBL2NzTGc4eFVOQlNyNG1UQnl6NElLeVFlZy8z?=
 =?utf-8?B?U3RWSkMzOGhkbUQ2UytBaVUrQzB2RC92aU9uK1FaNm5VMjlqTzVERHhRVjZi?=
 =?utf-8?B?UjE0UUdXNzJ6ZUc1RXNVNkE1RXk3OWJjVFkzaUdobnBORXhVNXM2ejFwRHBL?=
 =?utf-8?B?Mms4MEMrMWZ0dUZyZStZdlNtZ2d2N2hZbktCZ2FkNjQ5VytjQmNuZXlWeXJI?=
 =?utf-8?B?d28vYnMzMStTTUh5dXVTZ0poUUp2SXFTRkxsSTk1RGtscFVmUEdGM1FyL1Fm?=
 =?utf-8?B?OW5xUjdzaURHSDhDM0JGcnhWMzBHK2hiaVYyUUt0TEdLaGtsaVFHM2VYRFZI?=
 =?utf-8?B?SG9EYUV1cWR3alZFTlo0N2duWUQ5WFN3c0x3ZS9uaDN5azdUR2NIcGJOcjZT?=
 =?utf-8?B?MVpoTUhMV3dqbXZ2SC9CZHlsRUYzYWNHOTFpUWYyaXQzd0dWOXhLQTV0OE1o?=
 =?utf-8?B?U0xySXRKOU0yRXV0YmxiMjdlODJDRVRsOVU1U2VnaytOR0pNWWRDcmNhbStu?=
 =?utf-8?B?ZTlkZmpTT1pRVWxFK0dVak10SXdSSFo5aFRzaDhvTXRlSzZyc1N1bjA3RUU4?=
 =?utf-8?B?ekoyMFZCZ0JqcVVyT3VMeTdFTXNZdVZPbnE2eGM5QnFsSWllZUpCWUFHZ0J2?=
 =?utf-8?B?MkpWRGc4bjlxN1RHeU1DRzh3TnZTS1drYXRYQld2SW5mY1JGQ01oZytaQzNr?=
 =?utf-8?B?NG9UZGc2T1ZOZzFVR0dRamlmVE12ckx4Ym5Kd3RiLytDYjhtbEhBb2cyOWJs?=
 =?utf-8?B?OTM1WTNkWEcxR0FNdTV5RkdMTVlKbWZobS96ZTJnU0NzRG5nQ0hyYzdqWkdT?=
 =?utf-8?B?WFYvU3d6SzFhbmRxL3BLN09lK0pxakNRV3BBMnJ1L052YXNVaHF4MWR2ejNu?=
 =?utf-8?B?bUh0K2ZjVHNxTnpFVVhtU096eDR4ZytIb09mRHVyRVpBSG1GUlJSY0ZBSVRh?=
 =?utf-8?B?VzNtL0pFaWxibkdlMUpveGZXb0NxS3NqSXdCNGNqdm0xNWhBR3VyQ09ib3Rr?=
 =?utf-8?B?T0hEcTcwL0pmdksxL1Mxbk9tYkwvVkszM1hqendMZitiSFg4K3p3ajRyeWpI?=
 =?utf-8?B?MVlEcGduOUtYalYyUmtLSjllUjZYS2dQTXlrcTRQQXJ6RHJwbkxkMFpOQ0RL?=
 =?utf-8?B?VUppNmRIaENORHJ2K2FxSUljdHBUNG1sbEZ0Q25EcmxVVGx4bjBTNnY1M0JF?=
 =?utf-8?B?VzlodW1xZ3lHVXJvZ1pQeUFoRUNBUEMxSEtqNHJYbTJBeCtGWDRidFpPUzdr?=
 =?utf-8?B?cXZoangyQVN1c2FmV2ljU1JIVlErRldUNytiNEM1dzdGS3FEK3NPampnUnNO?=
 =?utf-8?B?eDFDSXZkclZQODFrTU5GMDgxZE54OUZMNGdSa0JWRGpEZHZKRnFCTDR3THJ4?=
 =?utf-8?B?VWQxN2cyQ3Jna1N1aVdmdWtKNzZOWHpCOXh1WjFHd2tlMWNYcG11WHlycjVw?=
 =?utf-8?B?VUlFRTlYZ3AzK0xWZXlnZ25NZ3FNNWYxWUxqdWJnT1BwbGhzTWx2cjNKa3pF?=
 =?utf-8?B?TXlZU09odXhIcmFkYlZaeGduWGlXVzJwdUp5TTVPeE8yMW9OU1lOdUxyTVVi?=
 =?utf-8?B?SEkrTFFhaGFWUjQvM2NmS3BDemxIK2UvUzFBWnI2cDRyaTdHRmdKcmdiamtI?=
 =?utf-8?B?cFoxajUvSWFLdlNwcDdUYjdPZEhIUTlFRGw1M3FvV2cxdlNkYmpRbHduMDk5?=
 =?utf-8?B?cFQweVlqSFVlbjMwTTBYSUdoSlQzRWRFTFB2dS8zNUxFWlRWcC8wRW1WL0hV?=
 =?utf-8?B?STYrSkc4VWI5OVZOc0ZYdkVkTVFiSzh6MHlIcDFMTXVVYVNvVS9xd1hSRVJq?=
 =?utf-8?B?RUVpVkdFSmYrMkM4UGR4dTk0eHRpN20rdzJSdGNwODFDVms4SUZFTGhZUXR3?=
 =?utf-8?B?cVB0VExEQS83Y3BDYTVZdTBvUDRqZWYvTHpWcE5MUjRSdUd5UUkyQ0FQOEhx?=
 =?utf-8?B?QlpkNHU0MVFnc2VTRXU2L3J3Nm9PS3JOWld5ZkV4QlJnYmgzRU5YV3VqZDVX?=
 =?utf-8?B?WlFiUnJuUFFyM2VyRzl5QVA1Z2FKS0p2djFYUGt2Z2ltRzR0WjlGK1Q1V2xO?=
 =?utf-8?B?ZWxjUEQ4NDR3MUd2ZEtWTHQ5RCsveTBHOFNVeUh0aEowTjQxaTg1RXVtMy9T?=
 =?utf-8?B?OTQzYUNsN2hWcXVMMGpvNUMrVFFoZFRneVFweFFZNFNPQ1M4bHBsVFNqRWZI?=
 =?utf-8?B?VE8zYlljU3dONW1GZlBEeGlIbW5vM0QrVk05MHV5djBSNExweGFtZk5mRTBZ?=
 =?utf-8?B?b3lrZzFzS2ZxdGRMU2FYd2R4aGNBSjA2SVRJMTRMOWVGZDRQQkUyL0FSM1RB?=
 =?utf-8?Q?bWT4i7xQHezMF83A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccc0d13-4237-4d78-d9b5-08de9f3f3173
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2026 00:44:49.4105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHc12uNsjGAQNz6m3t/BQDw9Bj35fVVyHQFXiiEm4xSNR0S4B4r5i5QeCoManBbFAH8lI0MNJAWlGK9dP6HD1ltGjAcSulg4AjkhjOVKsfgVImfLvDuS+8ia1RdsxSG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

PiBUaGUgc3RhcmZpdmUtY2Ftc3MgZHJpdmVyIGFuZCBiaW5kaW5ncyB3ZXJlIGRyb3BwZWQsIGFz
IHRoZXkgd2VyZSBubyBsb25nZXINCj4gYmVpbmcgd29ya2VkIHVwb24gZm9yIGRlc3RhZ2luZy4N
Cj4gDQo+IERyb3AgdGhlIHJlbGV2YW50IG5vZGUgYXMgd2VsbCB0byBhdm9pZCB0aGUgZm9sbG93
aW5nIGJ1aWxkIHdhcm5pbmc6DQo+ICJmYWlsZWQgdG8gbWF0Y2ggYW55IHNjaGVtYSB3aXRoIGNv
bXBhdGlibGU6IFsnc3RhcmZpdmUsamg3MTEwLWNhbXNzJ10iDQo+IA0KPiBGaXhlczogNjQ0Njcz
ZmM4ZmIwNCAoIm1lZGlhOiBkdC1iaW5kaW5nczogRHJvcCBzdGFyZml2ZSxqaDcxMTAtY2Ftc3Mg
ZnJvbQ0KPiBzdGFnaW5nIikNCj4gUmVwb3J0ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4NCj4gQ2xvc2VzOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0
MjAtdmVyeS1jYXJ0ZWwtNjQ1NTk1ZmZkMWM3QHNwdWQvDQo+IFNpZ25lZC1vZmYtYnk6IEphaSBM
dXRocmEgPGphaS5sdXRocmFAaWRlYXNvbmJvYXJkLmNvbT4NCj4gLS0tDQoNClJldmlld2VkLWJ5
OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+DQoN
Cj4gSWRlYWxseSB0aGlzIHBhdGNoIHNob3VsZCBoYXZlIGdvbmUgaW4gdGhlIG9yaWdpbmFsIHNl
cmllcywgYmVmb3JlIHRoZSBvbmUgdGhhdA0KPiBkcm9wcGVkIHRoZSBiaW5kaW5ncyB3aGljaCBp
cyBub3cgbWVyZ2VkIGluIG1haW5saW5lLg0KPiANCj4gSSd2ZSBhZGRlZCBhIEZpeGVzIHRhZyBz
byBpdCBnZXRzIHBpY2tlZCBpbiB0aGUgUkMgY3ljbGVzIGZvciA3LjEuDQo+IC0tLQ0KPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgfCAyNyArLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LmR0c2kgICAgICAgIHwgMjggLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNTQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kNCj4gYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24uZHRzaQ0KPiBpbmRleA0K
PiA4Y2ZlODAzMzMwNWQ4MGNiZTYxNzllZDI2NjAxY2EwNTdlZTAwZjE2Li5hN2ExYzA5YTJjOTA3
NTcxMWYzYTIxNA0KPiBhNDk2MTg5MTFmZGM3YjQyMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kNCj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kNCj4gQEAgLTEzNSwyOSArMTM1
LDYgQEAgJnRkbV9leHQgew0KPiAgCWNsb2NrLWZyZXF1ZW5jeSA9IDw0OTE1MjAwMD47DQo+ICB9
Ow0KPiANCj4gLSZjYW1zcyB7DQo+IC0JYXNzaWduZWQtY2xvY2tzID0gPCZpc3BjcmcgSkg3MTEw
X0lTUENMS19ET000X0FQQl9GVU5DPiwNCj4gLQkJCSAgPCZpc3BjcmcgSkg3MTEwX0lTUENMS19N
SVBJX1JYMF9QWEw+Ow0KPiAtCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDQ5NTAwMDAwPiwgPDE5
ODAwMDAwMD47DQo+IC0NCj4gLQlwb3J0cyB7DQo+IC0JCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0K
PiAtCQkjc2l6ZS1jZWxscyA9IDwwPjsNCj4gLQ0KPiAtCQlwb3J0QDAgew0KPiAtCQkJcmVnID0g
PDA+Ow0KPiAtCQl9Ow0KPiAtDQo+IC0JCXBvcnRAMSB7DQo+IC0JCQlyZWcgPSA8MT47DQo+IC0N
Cj4gLQkJCWNhbXNzX2Zyb21fY3NpMnJ4OiBlbmRwb2ludCB7DQo+IC0JCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZjc2kycnhfdG9fY2Ftc3M+Ow0KPiAtCQkJfTsNCj4gLQkJfTsNCj4gLQl9Ow0KPiAt
fTsNCj4gLQ0KPiAgJmNzaTJyeCB7DQo+ICAJYXNzaWduZWQtY2xvY2tzID0gPCZpc3BjcmcgSkg3
MTEwX0lTUENMS19WSU5fU1lTPjsNCj4gIAlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwyOTcwMDAw
MDA+Ow0KPiBAQCAtMTc1LDkgKzE1Miw3IEBAIHBvcnRAMCB7DQo+ICAJCXBvcnRAMSB7DQo+ICAJ
CQlyZWcgPSA8MT47DQo+IA0KPiAtCQkJY3NpMnJ4X3RvX2NhbXNzOiBlbmRwb2ludCB7DQo+IC0J
CQkJcmVtb3RlLWVuZHBvaW50ID0gPCZjYW1zc19mcm9tX2NzaTJyeD47DQo+IC0JCQl9Ow0KPiAr
CQkJLyogcmVtb3RlIENBTVNTIGVuZHBvaW50ICovDQo+ICAJCX07DQo+ICAJfTsNCj4gIH07DQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpDQo+
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQ0KPiBpbmRleA0KPiA2
ZTU2ZTlkMjBiYjA2NGU4NmI1N2E5MmQ0Y2IwNWJlMzMwY2NhMDFhLi45YzNlNDU5ODc0N2ViNTU0
MWVmZmU2DQo+IDk3MDQ0NDg0NzE1NTY5YTI4NSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQ0KPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzExMC5kdHNpDQo+IEBAIC0xMTk5LDM0ICsxMTk5LDYgQEAgY3NpX3BoeTog
cGh5QDE5ODIwMDAwIHsNCj4gIAkJCSNwaHktY2VsbHMgPSA8MD47DQo+ICAJCX07DQo+IA0KPiAt
CQljYW1zczogaXNwQDE5ODQwMDAwIHsNCj4gLQkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3
MTEwLWNhbXNzIjsNCj4gLQkJCXJlZyA9IDwweDAgMHgxOTg0MDAwMCAweDAgMHgxMDAwMD4sDQo+
IC0JCQkgICAgICA8MHgwIDB4MTk4NzAwMDAgMHgwIDB4MzAwMDA+Ow0KPiAtCQkJcmVnLW5hbWVz
ID0gInN5c2NvbiIsICJpc3AiOw0KPiAtCQkJY2xvY2tzID0gPCZpc3BjcmcgSkg3MTEwX0lTUENM
S19ET000X0FQQl9GVU5DPiwNCj4gLQkJCQkgPCZpc3BjcmcgSkg3MTEwX0lTUENMS19JU1BWMl9U
T1BfV1JBUFBFUl9DPiwNCj4gLQkJCQkgPCZpc3BjcmcgSkg3MTEwX0lTUENMS19EVlBfSU5WPiwN
Cj4gLQkJCQkgPCZpc3BjcmcgSkg3MTEwX0lTUENMS19WSU5fUF9BWElfV1I+LA0KPiAtCQkJCSA8
JmlzcGNyZyBKSDcxMTBfSVNQQ0xLX01JUElfUlgwX1BYTD4sDQo+IC0JCQkJIDwmc3lzY3JnIEpI
NzExMF9TWVNDTEtfSVNQX1RPUF9DT1JFPiwNCj4gLQkJCQkgPCZzeXNjcmcgSkg3MTEwX1NZU0NM
S19JU1BfVE9QX0FYST47DQo+IC0JCQljbG9jay1uYW1lcyA9ICJhcGJfZnVuYyIsICJ3cmFwcGVy
X2Nsa19jIiwgImR2cF9pbnYiLA0KPiAtCQkJCSAgICAgICJheGl3ciIsICJtaXBpX3J4MF9weGwi
LCAiaXNwY29yZV8yeCIsDQo+IC0JCQkJICAgICAgImlzcF9heGkiOw0KPiAtCQkJcmVzZXRzID0g
PCZpc3BjcmcgSkg3MTEwX0lTUFJTVF9JU1BWMl9UT1BfV1JBUFBFUl9QPiwNCj4gLQkJCQkgPCZp
c3BjcmcgSkg3MTEwX0lTUFJTVF9JU1BWMl9UT1BfV1JBUFBFUl9DPiwNCj4gLQkJCQkgPCZpc3Bj
cmcgSkg3MTEwX0lTUFJTVF9WSU5fUF9BWElfUkQ+LA0KPiAtCQkJCSA8JmlzcGNyZyBKSDcxMTBf
SVNQUlNUX1ZJTl9QX0FYSV9XUj4sDQo+IC0JCQkJIDwmc3lzY3JnIEpINzExMF9TWVNSU1RfSVNQ
X1RPUD4sDQo+IC0JCQkJIDwmc3lzY3JnIEpINzExMF9TWVNSU1RfSVNQX1RPUF9BWEk+Ow0KPiAt
CQkJcmVzZXQtbmFtZXMgPSAid3JhcHBlcl9wIiwgIndyYXBwZXJfYyIsICJheGlyZCIsDQo+IC0J
CQkJICAgICAgImF4aXdyIiwgImlzcF90b3BfbiIsICJpc3BfdG9wX2F4aSI7DQo+IC0JCQlwb3dl
ci1kb21haW5zID0gPCZwd3JjIEpINzExMF9QRF9JU1A+Ow0KPiAtCQkJaW50ZXJydXB0cyA9IDw5
Mj4sIDw4Nz4sIDw5MD4sIDw4OD47DQo+IC0JCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KPiAtCQl9
Ow0KPiAtDQo+ICAJCXZvdXRjcmc6IGNsb2NrLWNvbnRyb2xsZXJAMjk1YzAwMDAgew0KPiAgCQkJ
Y29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdm91dGNyZyI7DQo+ICAJCQlyZWcgPSA8MHgw
IDB4Mjk1YzAwMDAgMHgwIDB4MTAwMDA+Ow0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBjMWY0
OWRlYTJiOGYzMzU4MTNkM2IzNDhmZDM5MTE3ZmI4ZWZiNDI4DQo+IGNoYW5nZS1pZDogMjAyNjA0
MjAtc3RhcmZpdmVfY2Ftc3NfdXNlLTdhMjI5YzMzMGU3MQ0KPiANCj4gQmVzdCByZWdhcmRzLA0K
PiAtLQ0KPiBKYWkgTHV0aHJhIDxqYWkubHV0aHJhQGlkZWFzb25ib2FyZC5jb20+DQoNCg==
