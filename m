Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794571235;
	b=e5pkZkdDG/w5Jge/jPaHqEqMdVcw7LNaZQ/HGIZicafochL/c7dk2DV6Mw+AaeueRANG
	 lzO9EBKmtafD/Pptc898cCOHjzvxZpURgUknYgQqtEU4nVAtpUMqtDS/ZcXuHvx7rs4v4
	 9FRzvJ8cufLZO1qVEKlz3gS5MkCthvGkOWxvHMhbgXoBx7/zDS9aP8ZleHSt2/KpE3hRc
	 14e23eA9+Un8DwYXswtilZRxn3BZkC/vGbqE/gg+umMb+6xGT1rDJ5Elv8bR17fjKl6HC
	 Y6SN5TSdqEefPdWTrZ7NcZk2OkgaGJrsG2XeEH1lLAoq3/St6wlznl7gGdNAHefYJNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571235;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=a1+9/WnJn7YzYdqySJpM4TMvkijxLSshzUcCWNtQDGk=;
	b=5r9Ov+ypD/DVNBQdZ5T3wqFs77W4pi+mwKyUiIVTcBozcClT8lvwCpAYXWDvBcAex8NE
	 DNcngZdy5bvXUTP3eYvU9vdnRToMKM4Asyj/lx5bYjaMOVq3EOuPD7MMD9ZSUFYgFkB2Q
	 M32YJMRi39dcyEQPd0fj0sWni0T62FcyjOEpHWIVR5cYem/kh2Ly+PAgPReIdLyNWhcZe
	 8iY/uhWcclG8CNPO4FBVPqBx86TB720xOJM8rRJ5Lzj//DYH96Xpx6AuaWwULsaPig8JI
	 D6ThfeVG4uiojs4L/2thXDYOvWy5UfvNtw4yZdBdL5GZDKFkxc9aMVH/wWvWyzexkag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.79
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022079.outbound.protection.outlook.com [52.101.126.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0460A2626
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA0460A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPojSAKY+StUnhQDb6P4gGxY2M2rMaFvkWIrvWwtVHop06bPVwF2McMvVRxm7vJ9jjXUZWaPsfUfogJBaCcH4V/DemhHy6YAq0F9mKtg83Lolkp9ZQ7nR0Wc9bI/uZL0s9C32XnAlieFKpPR/c8xR/za/onTfEh7JNCXAibuwIA9tdbGXUh9LtOMVpjXGqVrTnCiVuqBxrbFci7NXb5S79LiRszgtQaajW3wbW/teXScBlmbckVau5SU8X6nzWBGyl+jfWOl66ClHzNosLDSovmOaAnnZ7+oQUXvM/c420I1cKuCReOcM4pvKtxyaHmyn24IHRKe/OyABETCuaNvSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1+9/WnJn7YzYdqySJpM4TMvkijxLSshzUcCWNtQDGk=;
 b=F53d9J0xO5noCG6V84L+r5OHmL9RnJ2YFk0xSEDzUXkE6dzkN5kEHg5YdqDInqG+4tQRXpJzzpmb1ztwVTwn/5pN923blGy81aZl1BJbanvenXWQTMwtFYb+8+TNEIPNs5vzTp0/EH9oyK+TazOA5RylAvVIeqsNikxAx2aE+5IyxcLxj+Jx9BauKlGbUSgNy4egoZFhrQ+MoqpO6FJKnP1cCT9aOM4VMTkkhMnHPgZiJZ7PGqH2fJ6SlB2/+m9BkcyPQs2bwgIAtsrGCX6d7o8XZjXbvsUtUQD1qyYTsNN9F0J/KkRCmDgiL0+jNGMVZ/FdFMV8RpMZiOsLywoFdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com (2603:1096:990:63::5) by
 SG2PR06MB5429.apcprd06.prod.outlook.com (2603:1096:4:1b9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0; Fri, 13 Nov 2026 11:55:31 +0000
Received: from JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a]) by JH0SPRMB0074.apcprd06.prod.outlook.com
 ([fe80::d5a:16db:d97c:df7a%5]) with mapi id 15.21.0592.009; Fri, 13 Nov 2026
 11:55:30 +0000
From: Luo Liu <Luo.Liu@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
	<tzimmermann@suse.de>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?V3V5aSBTaGVuICjmsojmrabkuYkp?=
	<wuyi.shen@cixtech.com>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSBkcm0vY2l4OiBhZGQgU2t5MSBEaXNwbGF5?=
 =?utf-8?Q?Port_transmitter_driver?=
Thread-Topic: [PATCH 2/2] drm/cix: add Sky1 DisplayPort transmitter driver
Thread-Index: AQHdcDVP3hEhEjt9xUafKupZnuuWULcr1ecAgAAShKA=
Date: Fri, 13 Nov 2026 11:55:30 +0000
Message-ID:
 <JH0SPRMB0074EF94AB07A11832EA512BF57F2@JH0SPRMB0074.apcprd06.prod.outlook.com>
References: <20261109103010.110911-1-Luo.Liu@cixtech.com>
 <20261109103010.110911-3-Luo.Liu@cixtech.com>
 <20261113-industrious-squid-of-tempering-e428b7@quoll>
In-Reply-To: <20261113-industrious-squid-of-tempering-e428b7@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0SPRMB0074:EE_|SG2PR06MB5429:EE_
x-ms-office365-filtering-correlation-id: a67aa9e2-c529-482f-b274-08df417d043b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|42112799006|261028144727099003|38070700021|10067099003|261026121527099003|4143699003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|56012099006|261022075727099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 dt1VzAACjV9M6P6NNEyr4Qj+x+pOotnfLIxqNpWvO+U9Kg9+R197zKemxewR6trQoy/OuWG6emrj917UWgjiHe2OIMEGOXLI8YBPuvK35EKoTkhBJQRkKKhnWYfSJy9XvwZIfgn+f6U+FhbtB6z3UUX/2T3SwdON325QGvrZwhvSfTZzdteqC0r11eveM7G9k41Ct5rdWT/FDZ7uxzxMPskViqB8qOEZgBT6/Zxpor6iyeLOGhPsEVhxAKKr5vMwjaUZk4FQ1MNz7TZaLKygUH7i+HZmBlNtyaZ2Kjnvw8wkkUBiiQjDTHbzcnJZ0MU6YMB1Go2Bi3eyjVp7/PX/wyhL0x375hLmDAgpY/I757yreAh8O+5PkLJ59rZtITKWtqMWpuWOsc2jxscUEhrsKrzPsNLW+OtqEHDCoQ2W+FUjTyPC1WhKaQ0WxABoFuoa8tt1u/FGF3i2QiAAa7iqYANCpM9M/kQyOKWlP83KpOzlVBFlpvPv3Y6JgXkMRbwnr3rtAPH0I0EwrN26Hpk2IboWG+MX/VYw3/Hc/DC98TP5UOMaN598bHu/bYyTC2knJwYhQQdGvTr7+CZT+eWXHR7TGo6fEIOUo1odJMGmziwrvt88+3/xL7zvqCB6MCa6qUBOt7sNLmvpnDJPEUAbUspA4nchLHy3gdEgvIRQwpVU4qrhAAGwtGwoElj0bw+dDNOaCL5PVTWuK7IpYQpG5VlVDkN3UrTTY4DDJS+kxAE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0SPRMB0074.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(42112799006)(261028144727099003)(38070700021)(10067099003)(261026121527099003)(4143699003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(56012099006)(261022075727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QmNDajlOZXB5c2l1WnBxL3pYQnpnVHFpcXZwUUJMSkNsUlhQcEt4K0dkQ3Ew?=
 =?utf-8?B?N1FHUEdBeTBjNW1TR2NHTXljYzMxZ2VZbXBzNVkyekxYOFRuMGJobDVldzQv?=
 =?utf-8?B?OVJROG5zL3NsWHZqUWl6VEJsaHZxTjFTQ3cwNENiUWQ5RFYwUEJIL3BtYkdI?=
 =?utf-8?B?TWZjbW5rSDJGQ005SUNObzV2RkxqZE5UbDdtVUtZTjFDalprRzdaa2lEZGpQ?=
 =?utf-8?B?MjErbEQ5Uy9iejFDbXN4MHdkT2lucCtMYlRmdGxZbUI4WWZ4UHRCREVCbGlx?=
 =?utf-8?B?Zm1pcW9UTE1TbHNtKzc2UXRsYlJxbUVadUN5ajB3bUg0OHYvZTRxUEtHZFhv?=
 =?utf-8?B?ajFGQWFmWXkvcEZhSTdhQXJvaUQ5TmhJSFdrUEZweG9wSzUzVTRxd25laXgv?=
 =?utf-8?B?ODNIS290VEVFdWNBOUY0MTJNaldGMzlMQmR2cTFmbGVMMWZ0K1NiWitDVGxX?=
 =?utf-8?B?dFI3MDJBZ2NFdjlHRHoyVmp1Yk02ejN2TzYvYXE5WStDZTZFUkFVY1JWRVdh?=
 =?utf-8?B?cGJmaUNTWmp3amZiaERqaUl3amZlVmtadXFCSTh2Z1RpOUdMdndpcVJFZUI5?=
 =?utf-8?B?TUxna3d2ZjNWbzJlek1UYk9SSitHcHkyWUgxWlZCa0MzbGVxcTN3TnFaY29y?=
 =?utf-8?B?R2RGaHhZNENzNzdjWjVZazg1Rk9ZOXJlZ1AySnBIaFBhd1NuQWNYc2dncXc5?=
 =?utf-8?B?ZldNQ2tGQTJXVHdKV28xcWoyaW1ubFVOUnZHZnIwc2xpVUpldUljWkZBenRr?=
 =?utf-8?B?TzBBNDlZNllCZUhwWm1la01SZjVWREdTTVpwSHFwQUthOEhCcTVXdDF5VllM?=
 =?utf-8?B?T0tSNjFDVngyQmxhbUl1MUVZSitDblRLK01ocFg1SmY2dnRDNG03TXFHZnFm?=
 =?utf-8?B?Wnc5eFFhRFNrMmZUWGxKOWtkUVlQeXNBV2N5N252aUdTWFBjQ1k4VjRjZjl4?=
 =?utf-8?B?TWtpNjNMaTAzWk9MTFV3RjZ6dmxyaXNuNGFSVlVycU9qNlozcSt2Tm1zRFp0?=
 =?utf-8?B?KzE3cTFybm9rRnZ2RkRHVkRYRUZqMVpJMklya3krdncyVEpmcVM0clZaSzNK?=
 =?utf-8?B?c3lwWFRtcnZRckVKYzlZcFV0Y1lva29mTUJKZEVYRUJJMmxlWklzUlh5SVpZ?=
 =?utf-8?B?MVRnUndwUlpYeWV4K2JCd0R4bEZWNzI3OHhDNFJkYVN0eW1rRXVGdE50MEUr?=
 =?utf-8?B?enlrT0d5VWduZHFDdURoc1lPT3FVYnlrTVNZalRjMDlETlRmYkpIeEhNVzVB?=
 =?utf-8?B?M1JRN0lTR1ZlOXh4SmZiSE85VTMwaHZrVi8weHBiWnNxSFRmRDRvNnpPcHk1?=
 =?utf-8?B?U2hDVUxScDFpYUFaK3J0U1AzRklNK1RqN2hiSFBvWDhPS0tKV2NSeFZ0QU5U?=
 =?utf-8?B?SkFvUitFdjRWQ1BzTjczV24vRmNEcTNqWnhtc1F5dlpyRGR2aTQ4Uk1JeVNZ?=
 =?utf-8?B?ZUREMVROR2IxdUxId3NBek9Fd3FNOWtJdFFaWmo4OGpjRFZmdGx5dGdhVDhU?=
 =?utf-8?B?R21ESm9VS040cnQxK01kQmZ2czdIZ3RVazREcjhhT3dYYmxBK0dsQU1IWFEy?=
 =?utf-8?B?MGwxdmN6ejlNK1p2SFVDNk81NWovVUdNUStHWWZmRHRYVEdTUS91TWJiRjFM?=
 =?utf-8?B?UllmSmZhem9MblkwOXhPWWJxS28rVHR0UEQzWFU3Y3FkckNpOUJrdjYvRE9Y?=
 =?utf-8?B?RENMNzBxTkNJVHphbnlBa293d3dRZFp6OGtPUGVkcFdOOG14aVhoa2hCczV2?=
 =?utf-8?B?bGhLdmRSQTdNdXpTQTZTUW11NzhzSmdyK1F5K2lGcjNYYTlyeUIzajZKWkJD?=
 =?utf-8?B?RzJOOTgwRmgrUzVMWWc5dTNKbmJ6YjVGQy92WGRoZ1R2ZmhIc2VEdE9NVnRZ?=
 =?utf-8?B?cnFMMGdZQVVvd0pkbGI5bmU5K2V4Nm1KSXRLZFBMZ2dCbUlRZlhpTldJZVQ1?=
 =?utf-8?B?TzZHdVcrcVVLTG5TdG9LMDkreEhyZytHTVpnMmJMeXlhTEh6eUIxVXNQd01J?=
 =?utf-8?B?OGRRalNYT2VBRlI3SkVvZGhvZ1pkaDRTcGQ1UEN2WE1sd0pCZVRCZkZKUDli?=
 =?utf-8?B?clhWWEtxdURjUXg4MDIxeFk0N3ZUUFpITi95ZFE2SVBrcUxpUWxGbGFwOUJH?=
 =?utf-8?B?S2F3ZnNEZ3J4K1hmUVJmdGpqK2hDZ1N6SzRrTWFmZStxMXgzMmYrQ1dwZkEz?=
 =?utf-8?B?YXZhbW5TSi9aS1F3bE5MY2hYNUNUVmtMSitRdWc1NURleTZZbmZCUk5ZZzVi?=
 =?utf-8?B?R21kc2l3MjB0Q3NuZFJRZy9kQnhTZTZNWkYrb0xyQ05vaytDT0VYNHk2SFdk?=
 =?utf-8?Q?csCpRIV5Yk7M+q8pk4?=
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
X-MS-Exchange-CrossTenant-AuthSource: JH0SPRMB0074.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67aa9e2-c529-482f-b274-08df417d043b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2026 11:55:30.6620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: suEWD82hlSagCm/ZwVQAd1j3xUk2vddoOtQDSKA2KT8q0QClZxFe/sLyE1w/lB5hIgkE8QI9NMUf3/KcGJGlrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5429

DQoNCj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0KPiDlj5Hku7bkuro6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4g5Y+R6YCB5pe26Ze0OiAyMDI25bm0MTHmnIgxM+aX
pSAxODozOQ0KPiDmlLbku7bkuro6IEx1byBMaXUgPEx1by5MaXVAY2l4dGVjaC5jb20+DQo+IOaK
hOmAgTogbWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tOyBtcmlwYXJkQGtlcm5lbC5v
cmc7DQo+IHR6aW1tZXJtYW5uQHN1c2UuZGU7IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJu
ZWwub3JnOw0KPiBjb25vcitkdEBrZXJuZWwub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgV3V5aSBTaGVuICjmsojmrabk
uYkpIDx3dXlpLnNoZW5AY2l4dGVjaC5jb20+Ow0KPiBjaXgta2VybmVsLXVwc3RyZWFtIDxjaXgt
a2VybmVsLXVwc3RyZWFtQGNpeHRlY2guY29tPg0KPiDkuLvpopg6IFJlOiBbUEFUQ0ggMi8yXSBk
cm0vY2l4OiBhZGQgU2t5MSBEaXNwbGF5UG9ydCB0cmFuc21pdHRlciBkcml2ZXINCj4gDQo+IEVY
VEVSTkFMIEVNQUlMDQo+IA0KPiBPbiBNb24sIE5vdiAwOSwgMjAyNiBhdCAwNjozMDoxMFBNICsw
ODAwLCBMdW8gTGl1IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vY2l4
L2RwdHgvS2NvbmZpZw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2NpeC9kcHR4L0tjb25maWcNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMGIwOTlmN2Qy
ZWQ1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9jaXgvZHB0
eC9LY29uZmlnDQo+ID4gQEAgLTAsMCArMSwxNiBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4gPiArDQo+ID4gK2NvbmZpZyBEUk1fQ0lYX0RQDQo+ID4g
KyAgICAgdHJpc3RhdGUgIkNpeCBEaXNwbGF5UG9ydCBDb250cm9sbGVyIERyaXZlciINCj4gDQo+
IE1pc3NpbmcgQVJDSCBkZXBlbmRlbmN5LCBsb29rIGF0IG90aGVyIGV4YW1wbGVzLg0KDQpJIHdp
bGwgYWRkIGRlcGVuZHMgb24gQVJDSF9DSVggfHwgQ09NUElMRV9URVNUIGF0IG5leHQgdmVyc2lv
bg0KDQo+IA0KPiA+ICsgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSyAmJiBEUk0gJiYgT0YNCj4g
PiArICAgICBkZXBlbmRzIG9uIEdFTkVSSUNfUEhZDQo+ID4gKyAgICAgc2VsZWN0IERSTV9LTVNf
SEVMUEVSDQo+ID4gKyAgICAgc2VsZWN0IERSTV9ESVNQTEFZX0hFTFBFUg0KPiA+ICsgICAgIHNl
bGVjdCBEUk1fRElTUExBWV9EUF9IRUxQRVINCj4gPiArICAgICBoZWxwDQo+ID4gKyAgICAgICBE
Uk0vS01TIGRyaXZlciBmb3IgdGhlIENpeCBEaXNwbGF5UG9ydCBjb250cm9sbGVyLiBJdCBpbXBs
ZW1lbnRzDQo+ID4gKyAgICAgICB0aGUgc3RhbmRhcmQgRFJNIGJyaWRnZSBpbnRlcmZhY2UgYW5k
IGRyaXZlcyBhbiBleHRlcm5hbA0KPiA+ICsgICAgICAgRGlzcGxheVBvcnQgUEhZIHRocm91Z2gg
dGhlIGdlbmVyaWMgUEhZIGZyYW1ld29yay4NCj4gPiArDQo+ID4gKyAgICAgICBUbyBjb21waWxl
IHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlIHdpbGwN
Cj4gPiArICAgICAgIGJlIGNhbGxlZCBjaXgtZHB0eC4NCj4gDQo+IC4uLg0KPiANCj4gPiArc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgY2l4X2RwX2RyaXZlciA9IHsNCj4gPiArICAgICAu
cHJvYmUgID0gY2l4X2RwdHhfcHJvYmUsDQo+ID4gKyAgICAgLnJlbW92ZSA9IGNpeF9kcHR4X3Jl
bW92ZSwNCj4gPiArICAgICAuc2h1dGRvd24gPSBjaXhfZHB0eF9zaHV0ZG93biwNCj4gPiArICAg
ICAuZHJpdmVyID0gew0KPiA+ICsgICAgICAgICAgICAgLm5hbWUgPSAiY2l4LWRwdHgiLA0KPiA+
ICsgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gY2l4X2RwdHhfZHRfaWRzLA0KPiA+ICsg
ICAgICAgICAgICAgLnBtID0gcG1fc2xlZXBfcHRyKCZjaXhfZHB0eF9wbV9vcHMpLA0KPiA+ICsg
ICAgIH0sDQo+ID4gK307DQo+ID4gKw0KPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKGNpeF9k
cF9kcml2ZXIpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhPUigiTHVvIExpdSA8THVvLkxpdUBj
aXh0ZWNoLmNvbT4iKTsNCj4gTU9EVUxFX0FVVEhPUigiV3V5aQ0KPiA+ICtTaGVuIDx3dXlpLnNo
ZW5AY2l4dGVjaC5jb20+Iik7IE1PRFVMRV9ERVNDUklQVElPTigiQ2l4IERpc3BsYXlQb3J0DQo+
ID4gK0NvbnRyb2xsZXIgRHJpdmVyIik7IE1PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiArTU9E
VUxFX0FMSUFTKCJwbGF0Zm9ybTpjaXgtZHB0eCIpOw0KPiANCj4gRHJvcCBhbGlhcywgaXQncyBu
b3QgYSBzdWJzdGl0dXRlIGZvciBpbmNvbXBsZXRlIElEIHRhYmxlcy4NCg0KT0sgLCBJIHdpbGwg
cmVtb3ZlIGl0IGF0IG5leHQgdmVyc2lvbiANCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBhZ2Fpbg0K
DQpCZXN0IHJlZ2FyZHMsDQoNCkx1bw0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRv
Zg0KDQo=
