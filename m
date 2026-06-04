Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD4425CF2;
	Thu,  4 Jun 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574415; cv=fail; b=NozaO9a0S7H1e6U0IMOxxNsltgADV2OtOhK5Gug7cHj2zU9t3EPFtUg8YJJxcLCD7z1bh+MFWYxI/WeGl2EENn5gpk4D1oiBQPxL4dcAuRRXLmsT3LnCxI7B4n9ye/lktpjT/FGEso1IVeN1KK7+zrzo182dt4YffhRpnhhpdsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574415; c=relaxed/simple;
	bh=/3Nb4HTYs6vUOoFXpZHTcb3b5ZYPZ7ytyQ5SpEQAu/k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TfDuOJxjUS2jewZYI2X2kNmNLpp0wNGwypM70f1iEAsuKTp/TLS7oFZmQ6De2Uk1wbmqJ0NX7b/YEdYuWm4Jn59+WGqYrDHZ0Qtrp+C7qgWn7PljoaEriJhQDgeA7Mgx8WBd+nCxIyoTmZMWddI0G1I+WtwL9Nihrh1WgHXMrHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=dpLcQ8jS; arc=fail smtp.client-ip=40.93.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="dpLcQ8jS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MmOmv9E7PXVZLK5y8ybSXLxLaRQaHIlixQLC5IkZy7P/HZzy/CH+WH+BYMMdGIklqla2y0gt6k/eueCuaP6KoIqFOsB95sPDfY7FrqmEJ74/h6lAGXd90eeZ5d6mV0t8hnclBqR8C3jti0sJEK9ncxdvVlrIIzMmf0v4uZec5Jq2IAfy0zuTTIIeZg8MOgfxbkaUYf0MoD7elln2d9w17VSASovkJSD/GaPk6QZ69hHqRdzLWNkSFnMUBbodw+oFhIxq01JVgovP5F/OP6dXuEZwNHi5uFE13G4BVU7q1xzB22JdVuDKbWpTJr2R7a4QAgysxSmfYC9E7vOxrrykag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Nb4HTYs6vUOoFXpZHTcb3b5ZYPZ7ytyQ5SpEQAu/k=;
 b=LrMknY+xjMT77S7stt+pL+TVrK0vji25Q4xxKoWzl8um5lVfswx6aQ0wfLRhchMuwzprnITqAcnydAL0q6b6in6SuKvPQwS5FP2gw7yVBlZ/DY/TuOsTY2w4yneqgyqOCfNwZtcPQtEYrUn1IpYm/E7aL0lhMpEb1rXVzCK4S2p1P7HvO8KMw8LMCguRjqyhad4H1tlJXEL/VNmIh5h+n0xg3lX0nSpGvCuM35Xj0Mox7NdY4sW81i160FUepVC8LIl4eF6og6NOAgCnhayPiT/id36XXEDCqc9pVWI6lHbN2PhaxLbut65ndGV4LUKLf6gwVggr9XJ22qEguDIovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3Nb4HTYs6vUOoFXpZHTcb3b5ZYPZ7ytyQ5SpEQAu/k=;
 b=dpLcQ8jSepr3DIq2/siEiy7kqAZksYbfF/FReTTmjbRpIC5VHgdwTXBW3+qP6ygQ+T93OKPgd3kzN+tEyHC3lFxs4s9nz0XrApJLOE9lFBr/YXh0JlAbHL42FVqwXS8o0RNFhgEp24Tyil8Ok9wlc+Vy6eo61FD3/GqISuWVVaxrJyxLLeExi++R2TkhCF/hA3lBPv1uHibsaG+GpuvZUQFw5xtqxh0B7uMReuM/ONYL0X+9puwFSMLl6VXf3ie9NY4aAa1BQITGMGG/YbrOrfrL5Kd2npbrjzoeJI/tL+VLB9spRn+2HZlCwFVaoi8i1EyX85XWC+Jcd7LVEnYmwg==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB989281.namprd03.prod.outlook.com (2603:10b6:510:3bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:00:11 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 12:00:11 +0000
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
Thread-Index: AQHc5EDdBDlckWQyTUeGG+SOvBoa6LYmgX+AgAfXTgCAAAV+AIAADJgA
Date: Thu, 4 Jun 2026 12:00:11 +0000
Message-ID: <e168eefe-7a06-4da4-833f-a679b2d29395@altera.com>
References:
 <20260515080014.6260-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260515080014.6260-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <c1aad046-fef0-4c2a-9e51-59e643e7966d@kernel.org>
 <47a7cb44-416b-4e48-a7f2-b6b69b71896a@altera.com>
 <62e4809b-078b-432f-a3b1-59559a4aa77f@kernel.org>
In-Reply-To: <62e4809b-078b-432f-a3b1-59559a4aa77f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|PH0PR03MB989281:EE_
x-ms-office365-filtering-correlation-id: bb0f3b17-17f4-452d-e63a-08dec230d49a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|38070700021|18002099003|55112099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 I8elAtzmxJgUypW9SU73LJcZWx99T6SZjq/wOPFZFCi/WKozJgrTnstCrCd25pXSryROsRL6ulnzF3Z+1FktzYlt5LSF1ngnhV0Xq+gtWS1QOav40pAlJRwNwwRs2/NV4p+JiJBZGuzkJzSVZ7Mi0jqc7ikmV1+11mToJlL3YfUExybsj1AZZc8JM1TeSIgOCI8zG7UFgUGTLOAvn/Xv4ds4FggKXy8M2wu+N3lTbKqPBwfo24/VCte6w/i37S7pqvwmKgeMMDbtoHXoQRCV9qRQaqIHW5ET8NEHI2e85jnYK+B4FB0ekX7LnnhoniUa9WbK2o4ZHpC+yoGdeb+zV/L/4AebQhEePMjsgEcGFvtA+/z0nkzEdkPt5ijpoG4qZIAOSdjKLQ52mfpUcVG2CSPx/9GeJXIXtC5iomomi7uH56WEkUxSOt+3yHHtNVnmhpAvKbI+VgFLp9LKfIo0u/97bssNV2OmBMGE0BhXRA6dmjS1F2YOtcxDNwa5WaVYQv5H8PIvS0Lz7bexxKsV0HVwq9FqbjOBva/LCTVHLdRKFZXkccvw2LDSubYJwwVuyilEldVNb+W67xS0+5v+fIqBWcRGQ8EnmD2dwHGyIeQZVRvQg8s+MI2PRMAF0dDcjZYBk0XoQeDSOwZBsCht+DZJ9vE5N4lgtBkHfSvJ/qFO+BOAeso0gUj3F4oVthuPwh5wF5S0U0+Hp29hsQaJHMUA220/RCLhHg6BIkQ8FxKnjHNun7PyOHX8rXtg4O0X
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(38070700021)(18002099003)(55112099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OWhVb1EwSkg3ZHp2T3pHa3FtN0RnSjl1aENHZEJjQ0xsaDc2NlY1UTY0dzJO?=
 =?utf-8?B?MXJsakFPaTh3V2E2bnJLdzVqQjBtVnlOT1ZzVkZjc2FhMGU0SGpFTmlMTnlU?=
 =?utf-8?B?TElFcm9haTBqSDVQcVFRSDNCK1RKVVpXVGFvYjdQSXF2UDJxZHB0RjY2WDBy?=
 =?utf-8?B?Y2lTZTJOQ1FlTjNsdmM5K2xnTGxubTJZYWM4eTNwMFFjcTlIbmZScUh2YTJl?=
 =?utf-8?B?SUhReENUaC92S3RpYmVSakxndmpydkJJLzI5d2FVa0M0aVZiUlFwRTZnNlNz?=
 =?utf-8?B?eXZiSmxCNTd6UnYvQkZzWnlpdCs2ZHQ3elRtN3NuUkhSbktpNGdBcnExTHo2?=
 =?utf-8?B?U2xZVmtXQitiNVg3a0pJSDZtcW1kUDRCWDYzVGlKOVJlbnVaM3hlUlRMZU8r?=
 =?utf-8?B?emZHV2ordkRLNWhac2N6Qjc2Wk9jQ0N1dW1MTzd1NVN3QnAxTW15c1NBcmhi?=
 =?utf-8?B?U1lQMkxNSW1DL3pqaTVsdDY0blFESDlZKy95ZmVNV1BqK21pTnBsc2VZdmlp?=
 =?utf-8?B?dzNuSVZGZEYxeTE2aitkVGJrYnMrOFIzTlZRYkVRazNkRnFPRXBhSzlDby9B?=
 =?utf-8?B?ZFRqNVdVQkZUUCtpVDhLeXRPT1BtQUF5TDBQOG1wZGNmanpVb2czV29HWVJT?=
 =?utf-8?B?c2VLVjJrTDJxNVRiMkJySVVTME0rZ0pkVWZOMmFqSkxoQXB1N0tIck5JcEJv?=
 =?utf-8?B?S3NxS3JTaWtXU1Z5WnA2NWkrU25zeDExZVB5ZldIOEt5eTRqcWY2NkdRTVlF?=
 =?utf-8?B?Q25vRGMvTU9ZbWpteXpQai9CdlVKa0QvWjF4Zm5DZDFKWjgzVlZxemorSEFw?=
 =?utf-8?B?aldvSUhDSFVTTzRjcXhJY0dxNDFSdEpFVXRrZkFWZk10ZmUwc05JV0x0SEU3?=
 =?utf-8?B?K0xTc044QzNqSm5XTHRrQTNFWWlJMWNmNlFoTGl6THVCQ1FKUUo0TnVsV1BK?=
 =?utf-8?B?dTNsTG9EaVFBUFdWTTlqbk1BUjZpSVR6TC80MW4wYUZPeGM3VGh6UzlldGhs?=
 =?utf-8?B?WVE4TlJTc01PNDlpc1picWJyOE1uNlNzWE1FcjlkREJpaWRmb0I0cy9mWlBK?=
 =?utf-8?B?ek5HNDcxQ3ZXbjhrTkVKNHhYODRuZGl1dXovdXZNbkJvNUlKdjVvRkpFemZh?=
 =?utf-8?B?bU9TTmhxWG85WnZYOFNQUVVYWStsVi81ZkpoV3dCdTJvRnQzWU43eHVkS3hT?=
 =?utf-8?B?VWkydnMyeVBFKzY3MHpKcVFhS0RSV1NrWDVuV0laNmRwRjM3VkFZb2t6V08y?=
 =?utf-8?B?bS90ZkZpejdSK3FTeTNEVFdUY2xSeGhIYXNWQ0lyRkhjYW5FMDA3bUM2WUIx?=
 =?utf-8?B?U3Z4NjhyWStUaGI2cWYrY2xoR2ZRL2lYS1lwYWlENXJxdHJ6NllwLzlXN2hI?=
 =?utf-8?B?SHhlNEwvZVlGWWJjUlAwMHFLSU1aR1lnajl6YjJ6UFhXcXEvazlMYTlacTNZ?=
 =?utf-8?B?UWlHMUhwUzFwdCs0MkVQYVpoamRkRjQxNTBoK1BRalNBMnBxN3JaQkJHR0hJ?=
 =?utf-8?B?NmRQcXdGOFo5MkZ5cnl2d0dNZmlWMklaZUZ1bmREdGxONmNQVUgvZkZnOFh3?=
 =?utf-8?B?TWx4U1BodDBjRG1mYzRybU5zUjNsSVJ5ekhuenIyU01pRlNlejM5aW9zYmg3?=
 =?utf-8?B?cENQZjlMM3ZBM2VHMm5EQlh0dVZOVW8rRTFONjc3Y2tYNGp4N3pHYVErU05T?=
 =?utf-8?B?b1E1VlNBU0dMMGNpVk82MTBwZjlYTUl4T3Y1bVd4V2JPbWFRUXlPdEEwQjQx?=
 =?utf-8?B?Mlp0SXRvTUZZcURNUXF3c1BQL0VxZXpISUdmZmJRQXRZRUwzNGhOWWxNalJU?=
 =?utf-8?B?L3crWW1BNk8zNHFpYUwwZDdNMUtQT3FQT0xTRE1STkpGbXFRR2JKR1p2bi9n?=
 =?utf-8?B?aUhqVGc3eWkvMmdPYzlRQVhhQmhWVU4wN2xZcEZ6ZjBqNy9US1JBQ0tlNHB1?=
 =?utf-8?B?M0dxUDkrcFJTenN3MUZpcE9SVngzbWxrVXk3Znc3dEpyL3ZnNmFHL211WWtm?=
 =?utf-8?B?OGJrSVAxQlZzemlVekVrZGkxOTA0dE5FcTZ4aWVNTTFkVm1rWWU1dFZmcUEx?=
 =?utf-8?B?alM1dGtBc0VWZHVoUnRDcGplZDFLTVI2dGQrd2FmSW1uWkFrQU1Nb01QOVM4?=
 =?utf-8?B?dUtocjlwc1RsMnlReEZHL2VSRVFVaWhwWVY3YjNROWRlcWJqSk9KZDJLMnZQ?=
 =?utf-8?B?MjBzWXFwQTFpVitIWmVkUThnWjhxYUx4Tml5dlhtMGxkZk5WQ0NDOVR5UmxI?=
 =?utf-8?B?Q1AvWlhnSndGTGpQWnh5OEVIM1k4RXh3TnhheDl2MnQ5OHF5Y0RzOVN2NmZ3?=
 =?utf-8?B?VHVXYWRpTGpreUdOWXdhWXdIS2ZjK0dwWjJjNUZSbzJOTlpNQzZqQzk1S2dV?=
 =?utf-8?Q?OkVYAz0hSfckstlMt+KwMnVF51tADLnsHFKvLAh2n4vkJ?=
x-ms-exchange-antispam-messagedata-1: VWBzb6iC/MptSxF6NL/CXq3sZfvtxaPHz+Y=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B83E893FF8764468D2786C217914389@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0f3b17-17f4-452d-e63a-08dec230d49a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 12:00:11.4028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ren0tqsgrGLFUU0mc7+Tqy3Fv+lEx4iTsp41OPtg7iGgCGXSqnDg/3F+l3yZ/26p0ynOMRQoN96hk98tcmzYBemtEFEbXEThQm0Up6XzZruinGmLC2tt0uPXcXKp6dkqMQcdnfGtDsOiEwqSZo/Crw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989281

T24gNC82LzIwMjYgNzoxNSBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0c2kgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpDQo+IGluZGV4IGIw
NmM2ZDVkNjBlZS4uNjRmMzczOWEwYzMzIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4NS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1LmR0c2kNCj4gQEAgLTM4NSw3ICszODUsNyBAQCBzbW11
OiBpb21tdUAxNjAwMDAwMCB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1u
YW1lcyA9ICJldmVudHEiLCAiZ2Vycm9yIiwgInByaXEiOw0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBkbWEtY29oZXJlbnQ7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICNpb21tdS1jZWxs
cyA9IDwxPjsNCj4gLSAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ICsgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQpIaSBLcnp5c3p0b2YsDQoN
ClRoZSBzbW11OiBpb21tdUAxNjAwMDAwMCBub2RlIGluIHNvY2ZwZ2FfYWdpbGV4NS5kdHNpIGlz
IGRlZmluZWQgd2l0aCANCnN0YXR1cyA9ICJkaXNhYmxlZCIgYXMgdGhlIGRlZmF1bHQuIEl0IHdh
cyBub3QgZW5hYmxlZCBkdXJpbmcgdGhlIA0KaW5pdGlhbCBBZ2lsZXg1IGJyaW5nLXVwLg0K
