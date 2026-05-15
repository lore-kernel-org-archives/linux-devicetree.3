Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011037.outbound.protection.outlook.com [52.101.57.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38453F7A9E;
	Fri, 15 May 2026 08:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832161; cv=fail; b=e08mnfAu7MX4PWOYeXwDG178a+zDSBlJ1AfVOIhZM0v1JPMeZBxyED/ypRVhv/lyvTSdlhV7rsNsyC171wOcWzgGz6bnZDKJfXD5SLKrDpaUYFmMvhis5oEDkOs5XPtDwRR+WhKt4JJHa/lTUH4108RMMZRO0qFQKi1Qoa/JMlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832161; c=relaxed/simple;
	bh=Lx3TXxYljlp8pZ73i4o/axLY2Z8sF5gpa8VWos3pbxE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QYSERLxP4eLI+u9eSW9cU85BSEjcDffQUxXPlZkMtAhV4S+Mj7K6vGTL/CDqbs6OrI3Oug/2+0Q5X8hfuOG5C5c6CNurF4yTEVNgz7xVO6SHNn5AcWQkX2h0d1Qm7yq2MMHylE8X/h6HeFmUNnEyTYfEFnc003dzej5MGeAHXa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=itVrf6Kj; arc=fail smtp.client-ip=52.101.57.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="itVrf6Kj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjPsqmVZ1EIQXXPsqykptCyZqwrgFIbuLi5DubXz69LdudSNHryRP79SzWpVDHHrajI2BnFVMXdkn+i9foc0NNSv2nmMzQ895c4G/r2c5zW/EV4SW4Ssz3O0iFAO4/HLRH7K8yOH7PETtFn5Xo9dgnVH/MwpYfrTBo7LQ+U6F7FLJTfjAY8jxf0AMCn/XdLYY/BpLnuuwotZrUZUJ1nBZZQFHRFsj2/luO7q5o4jxIXMjNypu2JtsuMiM93m2jsnbJcktniwFqFgReT1Yvr4XoSvrn/Qz3jkjCOxjSthsPCxHvhzrhGYHN/wzdM9POxGe4CLQlJlt+RzkEEktd+StQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lx3TXxYljlp8pZ73i4o/axLY2Z8sF5gpa8VWos3pbxE=;
 b=cZGOW40p4PfxmKXLRpBOScaJ1dpZfW3exX2Zvcc0lnoVqbuYtDINvvDHNgsf3GwpfbfxD+XR8mzEyleXtB9BLazs/VqWcuIh0ATmBCAz7hChw2HlbbOqNPsHTPYqjlLkY3BvysVUbNEawRxoE7f/XFoZVX0W32UbE5fM+nXTuWo1qFfK95Kx+cGFQes12t5oIon+5DviGht7GcqByoM0oIrKiUZS0Uq/Roy9pXRIJnpBOICFY7FLV4oPYS3svlNIvqWUGgEBd+MIZbLLBVoK5uZ2ZPslhbGKLggLPXIx3ULd7z29zMeQPlK9jayScSbAFusizr3J2JTdeqzbhWyX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lx3TXxYljlp8pZ73i4o/axLY2Z8sF5gpa8VWos3pbxE=;
 b=itVrf6KjfQHYqXSCwubOFgyH+QrTDua2IOtIa9ZpGu3c8BqS0cs/FhEtatXdqcgQkt7JsmawQhH6V/ArJTQdY0gNOOUnmVNJ1Qhvn6YC+075Vej1sHk6rGbPxVfaCISla8IAxJEFLFV9X/GQtWn3cC9jGAEpVzWL4MzJfJahNPV5OpK5WbLa33SPptbSWhwlNX42x7hZHnYArChU9qsU6hZzmEjhGN5cxpcNvHxtvU/yzhHTmA3cWbB25DWY6zvMND3Ao0+lQWFWGmQhoUG9BPqPOmuohxkU/+nFVL5wDiWrVmUx9zu1uDwvuiUn10W7cn/ia00fKXYmHCRfw3lj0g==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by CH0PR03MB6050.namprd03.prod.outlook.com (2603:10b6:610:bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 08:02:36 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:02:36 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
	<muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
Thread-Topic: [PATCH 2/2] arm64: dts: socfpga: Add dma-coherent to XGMAC nodes
Thread-Index: AQHc45aRT56RvUJ/LkuwnDpwDrzirLYOL6wAgACLh4A=
Date: Fri, 15 May 2026 08:02:36 +0000
Message-ID: <a7bd462b-a46a-43ca-810b-79e21be90fe9@altera.com>
References:
 <20260514114111.10574-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260514114111.10574-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <51c01dfc-d6b2-4605-81bd-496211947c1f@kernel.org>
In-Reply-To: <51c01dfc-d6b2-4605-81bd-496211947c1f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|CH0PR03MB6050:EE_
x-ms-office365-filtering-correlation-id: 89f29fe2-feac-4e82-221c-08deb2585398
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|55112099003|38070700021|11063799003|56012099003|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 e3wsqko+/Fa6qm7DgKF1mnmAV1e8HuQQfcBLvdLavf9/LByIu17Xndzb6pS1L6e/9lnhE9Vv/DPJT6Sci752Iik5ZgOMv7dnMrKPYZT6oc5x53ff+liIHnUoaErj/mnGK9WRjJ7hfS4tzCR7znrwTVXAYYeqREdSflL6i4aAqaKGYlnHK665gOB6myB+Ubv+puYL2Zizd9hyJqKy6sc27QK/0W2p7fDEBKD01ACBTZATxfqWD07a1+I1ro2kEkudgily+z9QZADQKsGu5t1VDhGhabinIoHuNSD0Ye0H+Uk4YdwdFOnufOemIwYBrWGirbfE+F0EsTwDhP0b4UHDyFR6hz+Cy/Su9r2OfX/RmiKGzKP54dC8kctZQyaa2o+y5W6pD3VQUi6hviPD7nDViP0PHrxG0X2NH4LqAVMe62D7CxSOSzNULYJvTaj0toV9XXCovr/tfckUbptBIu54Icb6AfdGnDWj5D+9fSSI7vZer9WvCglqQDA4st584ML3mvFeaKm4U+JBQBrtTvusDVJIrJ67A22FTS+xxrFDWmHSaCSE8gz9E3lELqR8+nYh7c4o31D8ZF9HlVbmlzQKo5GuZimx2elHCNdTquzclbLF+TTr1sZ6VsmGxj4mRkMnJ27zGrwmV/IBATnwxALdcpCLH5jkkb6250xYb+6HdtC2itE7UuRVotsWimgn9jw+NunHAc+d/1+SdYANtwFUixTew9UBWr61a3iXQW5A/+j/I7jfMXkO7I3xwxH4pfcY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(55112099003)(38070700021)(11063799003)(56012099003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3B0ZDY2czdTQitYV2VDcklaZVhtdXZybGlJZHROKzRkSGorWDBkcks0Wm45?=
 =?utf-8?B?TkFFVTNWbXFpUWF1c2JoTTBycmR4bDNRZGhpSUh4bGxxcmVyVnJ0cUw3QkZO?=
 =?utf-8?B?RUtXNG1hZ1NQV3B6YjBFYUZWUVZHYkVmOWkvTSszOGdLU043S2ZVcTBPRWtX?=
 =?utf-8?B?QmhVUDAzd1k1UFppOGx1MDVXa05xNmY1WlA4M3RwMzdXNkVxbEg3c25rSmdi?=
 =?utf-8?B?YUs5Tm51SWMyc3R2eG4zZnI0cit0ZjdQeCtBdStXa29sWGc0SVN6T3dCRDdU?=
 =?utf-8?B?enVDc2tRYXg2UzVOaXpYT2pBMXpneEVZdmJrRzJCWWxoV1Fqc2pibkdNd2VY?=
 =?utf-8?B?ZHVpNk1GOEh3aDRoWE1jeEp6Ry95cFBndExVUWlnejBMOU1SSEdJNWxtWCtv?=
 =?utf-8?B?a2hOcUZkWk9kWUxTZWtKbkJQbTFxcHJRYXBwUFJHb2JiYWlGSTZQcDI1V09F?=
 =?utf-8?B?YmFBMUthSmdPNmhCTXJPcjhVWHdtREViTVJvYkdaL3R2SExBSldMUkU4Ujg1?=
 =?utf-8?B?N0xSM0c4dXpyeGdxVk1QVGNOcTlrRFcyQjl6dW5HRDlaL2VNWEVrV2FLMGI4?=
 =?utf-8?B?SVEyem9xckhUcUlhYXZISXROdkxRMXRWdEg4Vzd1MUlFQzVOTmp2dHM2YWZz?=
 =?utf-8?B?aHJRcWlRQTBZeEdoWEhuVjhFMFF5eTQzS2l2ZFFEM01Kd05SbFpWcDVtcXgx?=
 =?utf-8?B?YWhHQ0Zsblg5c3ZHY1pMaVgyaWxKSHh2ci9KV0hvWXVKeG1YRncwbHFKTUo5?=
 =?utf-8?B?TS9qOEt4djlML3ZuZjRrT1ZIekhHT3hQQWpEb0ZQZFcwOHZtaERZbERxLzhY?=
 =?utf-8?B?YUhEN1dHUFNOQ0VnWldjbk0renZaNFBvQ25hZHFnWVhxNVhVcWM2UmpWeW1M?=
 =?utf-8?B?WUMxTyszRnl6YTcrU093Rk9xWXMvK1Zib1Q5b0FCM1hBbUpoNXVwb0FRSWpD?=
 =?utf-8?B?V1ROeGdndG1ka1lyMitGRHF0QTRNSkwwbUVEbmVLcmhZandUalR0Qk0rZ2c1?=
 =?utf-8?B?RXEyWUptZTRsdCs3NksvRG5ScHg3Y00xNy9mT0cxVXBrUkxkVWxZU3NuNXBy?=
 =?utf-8?B?SjFjaTQyNitORzlOdDFvUlp4MlNYWU5pVUdvYmlpc0lDTlgrZjdmUHdOODFJ?=
 =?utf-8?B?OTVXL1lTalRRZUNaczZPenV4bUNXN3kyb3E4U3RrZTNESk9lN3pPTk1FR1V6?=
 =?utf-8?B?S0VWZHdUbmxlN0RabENjdXpYVS9Zd1B5ME5EYTJaVVV6SnFHa3lnTGNlR3JL?=
 =?utf-8?B?L3RJdFBHSjNQWXpWNzBST05GV3hOQndKc3NHaE1CZXhQMGZtTEZKYTdrS1NG?=
 =?utf-8?B?bGJPT2dmTDlMc0tNUEZvMXVlc3ZtcHg5bWNzNENBaXZtdCtsa1lRQ2hlY2ZE?=
 =?utf-8?B?Zy8vK2thRDhaMVVIZDRycHo1RVFLK3A4MWNjWkVtaXVkTnFIWVdIY2hlaEtU?=
 =?utf-8?B?M3h5N3pmS3pteXRXbEwrMG1RMmhYMWlXekQvZVB0QVdjZEFQTG04QWlIckI4?=
 =?utf-8?B?cGowU0p6aHpmR2tOK0dSSVVCQWpla2Q1eWZoMnQvZnBvRU0zZEJIbzhUMlAr?=
 =?utf-8?B?dWIzTjg3cVlTWm9IZWdjc3FrdDlMZ3NtZDlLSEZjNFRmeUhXSnFzU2lmQ2M5?=
 =?utf-8?B?UTBsRGd1ZnZ0WFFsTk1WRGxmRE9EZ2w4bHpuS2ZoWncweDFQN0hKaTEzSEVT?=
 =?utf-8?B?K2ZTRlJkMmNyeEFZZGo2U2h5MXRPZlcyYkwwRCtJcXVtOURYaWtLeU1OTnR3?=
 =?utf-8?B?c0xzdTVYYkpQZnVyMTRHWTJCV1hJU3FrcFR6YXZrZ0hZU0haOEd4SXFSeEw4?=
 =?utf-8?B?dFdPYVcwbFV4NEliNk5rWHYxemdRQW5EcVNRM1UwNnpCQzVEMmVQcWhITmky?=
 =?utf-8?B?M3l0UjF1VzY4Y015K2pNbkpRMHc1VXhzMEFsbFN5eTFTY1ZBeDVzV24wdmNZ?=
 =?utf-8?B?T3ZoT1diY0JZbTBVcVhPbHJmNmtHaTlJYk9OU3R5d0FkQmdrSytUM0dVZ2Zv?=
 =?utf-8?B?ZXBjR1NERnN3TGFXcXlJV0pnM3JlSnNad3JIakFDanNwZU41bUE1MUJQdE9x?=
 =?utf-8?B?cndsYVhpUWdBZXc3UE5mR294VTVDMmRnZ1huYWhPTU92TWJnY21rVWxoQ1E2?=
 =?utf-8?B?eElYR3h1dUt3TlZBUDFwQTVUWVYvcWJtNWNEWllNMmhCVHg2ODBmbGh2L2pP?=
 =?utf-8?B?aXRPbXVPNG1vK2hkTzNKdmNXZmNicjNjeUtxUXlWd1p5RHR6OG9mYzFOMTla?=
 =?utf-8?B?VFhIMmkxY1JTRkJKMmNCT29CWjNuQWtZUTdSRGFySXZXS3VUYU04K05aVk8z?=
 =?utf-8?B?Zlpid3RiQ1lnaHZHTE5rT1U0NDQ3WkJmNnJjK0xQU1MvaC9xaTJlcVJqalRL?=
 =?utf-8?Q?rDx615THVho8vUn7oghUiHRYXmkvXZ3SQBeHP3X/+oKty?=
x-ms-exchange-antispam-messagedata-1: JWNir+xMKiRYG3IGzy+IjEV+zmmEm61xO0A=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF9C0BAB91E92B40BBDECCF177E141D9@namprd03.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f29fe2-feac-4e82-221c-08deb2585398
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 08:02:36.2063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 59KRaDMdOMKuopYbjZtngMkADqvbObnQZIu8U0KFWUPwjBqGSLi7ncOMwD1Yxlgj2P9O9GhVXQYUlBPtFAXjtV+hQUip2MxD7R/TdB5rkMGPB5xa5Kq6rh8o3RmamAe4Se53mEDImZaF4IpJNUKVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6050

T24gMTUvNS8yMDI2IDc6NDMgYW0sIERpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+IE9uIDUv
MTQvMjYgMDY6NDEsIG11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNv
bSB3cm90ZToNCj4+IEZyb206IE5hemltIEFtaXJ1bCA8bXVoYW1tYWQubmF6aW0uYW1pcnVsLm5h
emxlLmFzbWFkZUBhbHRlcmEuY29tPg0KPj4NCj4+IFRoZSBTTU1VIGlzIGVuYWJsZWQgYW5kIHRy
YW5zYWN0aW9ucyBnb2luZyB0aHJvdWdoIGl0IGFyZSBjYWNoZQ0KPj4gY29oZXJlbnQuIEFkZCB0
aGUgZG1hLWNvaGVyZW50IHByb3BlcnR5IHRvIHRoZSBYR01BQyBub2RlcyB0byBwcmV2ZW50DQo+
PiByZWR1bmRhbnQgY2FjaGUgZmx1c2gvaW52YWxpZGF0ZSBvcGVyYXRpb25zIGFuZCBwb3RlbnRp
YWwgc3RhbGUgZGF0YQ0KPj4gaXNzdWVzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE5hemltIEFt
aXJ1bCANCj4+IDxtdWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20+
DQo+PiAtLS0NCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXgz
X3NvY2RrLmR0c8KgwqDCoMKgwqDCoMKgwqAgfCAxICsNCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1X3NvY2RrLmR0c8KgwqDCoMKgwqDCoMKgwqAgfCAxICsN
Cj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXg1X3NvY2RrXzAx
M2IuZHRzwqDCoMKgIHwgMSArDQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2Zw
Z2FfYWdpbGV4NV9zb2Nka19tb2R1bGFyLmR0cyB8IDEgKw0KPj4gwqAgYXJjaC9hcm02NC9ib290
L2R0cy9pbnRlbC9zb2NmcGdhX2FnaWxleDVfc29jZGtfbmFuZC5kdHPCoMKgwqAgfCAxICsNCj4+
IMKgIDUgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXgzX3NvY2RrLmR0cyBiLyAN
Cj4+IGFyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXgzX3NvY2RrLmR0cw0K
Pj4gaW5kZXggMjVlMTdkZjBjYmRiLi4yMDYxZDMwMTEyNmUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ludGVsL3NvY2ZwZ2FfYWdpbGV4M19zb2Nkay5kdHMNCj4+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvaW50ZWwvc29jZnBnYV9hZ2lsZXgzX3NvY2RrLmR0cw0KPj4g
QEAgLTUyLDYgKzUyLDcgQEAgJmdtYWMyIHsNCj4+IMKgwqDCoMKgwqAgcGh5LW1vZGUgPSAicmdt
aWktaWQiOw0KPj4gwqDCoMKgwqDCoCBwaHktaGFuZGxlID0gPCZlbWFjMl9waHkwPjsNCj4+IMKg
wqDCoMKgwqAgbWF4LWZyYW1lLXNpemUgPSA8OTAwMD47DQo+PiArwqDCoMKgIGRtYS1jb2hlcmVu
dDsNCj4gVGhpcyBwcm9wZXJ0eSBzaG91bGQgYmUgaW4gcGxhY2VkIGluIHRoZSBBZ2lsZXg1IGR0
c2kgZmlsZS4NCj4gDQo+IFRoYW5rcywNCj4gRGluaA0KQWxsIHRoZSBjaGFuZ2VzIGhhZCBiZWVu
IHJlZmxlY3RlZCBpbiB2Mi4gVGhhbmtzIERpbmghDQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI2MDUxNTA4MDAxNC42MjYwLTEtbXVoYW1tYWQubmF6aW0uYW1pcnVsLm5hemxlLmFz
bWFkZUBhbHRlcmEuY29tLw0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA1MTUw
ODAwMTQuNjI2MC0yLW11aGFtbWFkLm5hemltLmFtaXJ1bC5uYXpsZS5hc21hZGVAYWx0ZXJhLmNv
bS8NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTE1MDgwMDE0LjYyNjAtMy1t
dWhhbW1hZC5uYXppbS5hbWlydWwubmF6bGUuYXNtYWRlQGFsdGVyYS5jb20vDQoNCkJSLA0KTmF6
aW0NCg==
