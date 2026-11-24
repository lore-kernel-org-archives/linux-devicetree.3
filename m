Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.153.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559860;
	b=uiljkXRmC21wR07SCdr7rxlds0EkldyB8CTJoBvYkppHUbHlpsvAm9kfq/HZLsdH+icu
	 qKdXXVMrljz768jiwmoF60yvvis0zww+GR27VVOvDWtUBDtvQyT3xh1QrkqavIKh2H4ZE
	 t5L1HxupAuMb6zILJ9er/3JDjS9x72dRuBYJPgnWbRAWjHmGrL2lVHvOfY6p0Aq1MTND+
	 x8EKR8HAvE8+b+u3mLWl4PdrrkZyCMDJBE/IX/foHXBAAwfjY1n0I1lQY+Otbs6IY3UoZ
	 jb2sds8eQ1z9esg1Ixr2oMU7YNJRYSuvk68L6MpFNcsaRewPT8BK5UXttABKIrL/Upg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559860;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Language:Content-Type:Content-Transfer-Encoding;
	bh=/EmiOGva4Ztgbu5cer4Jn8C748Er38gfhrj6qAjYyJU=;
	b=DPGRPi0WPFz+G9oNP3cUOZJg/omuk/YF6G1hVp5l3Lwx94RDSfYTZCG8wpwzwH1O65PZ
	 O6JqyaXhjb9/Ok5oN/cmVj5JKW6Nn94Z6BH3rxGCR9svhjIoAGrdXn/BewgAg2ZiYbQfC
	 OGv5tSjYpo8hZjpFkOhU+jT0Mzp5Zuanx7R3iGTFAi9O37zS3idECjbTPp2ATMUm7x3kF
	 AHOxg43xpJVLc/YlHjeV3p5uQErJ9Db2/uycFrdpjNPK7HeoDU5Iyc1RLu4siu8vMdZUb
	 dnN/ru6pPXMFhZgCXCizSM6dE8CuwjbOXGAVRSs4Rtq30EHs6HbVfIjCoMmiABZNISQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=C6TXD9Br;
	arc=none smtp.remote-ip=170.10.153.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.153.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E28606A326
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 22:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75E28606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=C6TXD9Br
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795559847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/EmiOGva4Ztgbu5cer4Jn8C748Er38gfhrj6qAjYyJU=;
	b=C6TXD9BrcvAQRsM9FdVxU2agw6KwRZUhV8dK3Z1NQbRhU5uU5Dg9fwR/6ExGqMA94ZOBQ9
	O2O+D9xBLoEkYsSmMdf4FojcomUa+HFhgK8Y52ZfMqaHae7te8iYw/m/62mUlTaZzjbFZ5
	idGDwxzeEwczUuIvcbyDDNmmAcdbRjLk00zSQyVZBfyW6irllD0wcQkbbGT1axHtXRK5Ar
	hBUqh/wWd5SRWvntTG93Y55FwLqKpBA5th+PqzKrAe6KTsTgQz/5HkS3jNSshfNRzs0A9a
	fV+VEx+6OIeDpdQiYAJdXMT0rdLgO3RhmOrucoGBN6u9SsVbeY4b/lT05H9FjA==
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-2-yZ4uEhyeMy-CD6XPpBM4Lw-1; Tue,
 24 Nov 2026 22:37:22 +0000
X-MC-Unique: yZ4uEhyeMy-CD6XPpBM4Lw-1
X-Mimecast-MFC-AGG-ID: yZ4uEhyeMy-CD6XPpBM4Lw_1795559834
Received: from DM8PR02MB7864.namprd02.prod.outlook.com (2603:10b6:8:23::23) by
 CY8PR02MB9469.namprd02.prod.outlook.com (2603:10b6:930:70::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 22:37:13 +0000
Received: from DM8PR02MB7864.namprd02.prod.outlook.com
 ([fe80::3cde:db1f:188:bc80]) by DM8PR02MB7864.namprd02.prod.outlook.com
 ([fe80::3cde:db1f:188:bc80%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 22:37:12 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
	<linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Parthiban Veerasooran
	<parthiban.veerasooran@microchip.com>, Richard Cochran
	<richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Simon
 Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Eric
 Dumazet <edumazet@kernel.org>, Piergiorgio Beruto
	<piergiorgio.beruto@gmail.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jerry Ray
	<jerry.ray@microchip.com>, Ciprian Regus <ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v12 09/15] net: ethernet: oa_tc6: Support for
 vendor specific MMS
Thread-Topic: [PATCH net-next v12 09/15] net: ethernet: oa_tc6: Support for
 vendor specific MMS
Thread-Index: AQHdfGCeyiQ0fQdR/k6JvaCoiPFolrc9zVlg
Date: Tue, 24 Nov 2026 22:37:12 +0000
Message-ID: <DM8PR02MB7864038451A3F313289F87C383442@DM8PR02MB7864.namprd02.prod.outlook.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
 <20261124-s2500-mac-phy-support-v12-9-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-9-3575855d99f9@onsemi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR02MB7864:EE_|CY8PR02MB9469:EE_
x-ms-office365-filtering-correlation-id: f11566ea-ddbb-482c-8bfd-08df4a7b7bcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|6133799003|22082099003|921020|4143699003|56012099006|11063799006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|38070700021
x-microsoft-antispam-message-info: yY5G3AhR4TqKbYfIOJoFLiM7rQpGv5mx8DjiIP2+aIC++OkXlW06kKTJ7bDjE4ka6ZV+zf3I/UETaqcIiR+O4GLkTVus/E9oVvsfbKZ+xqelvXYt5zFQCaHeBa2bn8HwGY1RJUpaZP4FWivngaxS5wdMM/Af4K55zi9xbs9J4VlHFtuhQfoyLQjU7G7wBAvr2LuNv4o2x8gU9OKBkcvZj2FTJ0pXqv6rgHjDEld2ITkcmw5taqkiv0rRxcz+etnqTRgN1KOUzDMn4tAtKBLUKAtGx/k41iA4dNukOMM4rJe0BFUvYYssbKNZHLLREuvSosSoAa6lOePyokhkrnpVWRjXbKV8nGrsUM+x09X/LswmqYv33JHaYDcTi4nEJ81Pxc7L8jFiJUPqx33YxGVJ1+Tf6qKrLNhY4dR4tPxIB4RxPDFAFFHcXKEjD/gc4CQEDbkixwSl+zN+zxetkRbDF66zGh9SjTu6gY4Y4GYXohs9s/Fw9LHBCt/p1LMJRO4VlzwmHgy2QpSxpObY0jf2ysbS5ZpZaM6dYHOzelnKljv9yPlpPS578C5J9KXWWMl0dYoox4r1E6/XrLeM6YQKujMQbw20qk/qgIfPlq093cCqqCQzG7FSsexV5aLdSsLoBKCw101CTSByZc0PBjplZVKOhA8diUB3Ufz7fOQlNihMcZf/UcmHOf/6FNEyzxMgbh39JJgbABJBehVP15NvXnEZyySWNM12M9s/iRykery3lpgtduJAYImDeFxBdy4R
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB7864.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(6133799003)(22082099003)(921020)(4143699003)(56012099006)(11063799006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(38070700021);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUJScXcxd2sydW9MMDlMdDY2cHpOWlBwU3hLN3IvUFp2OURUbDA1ZXdTRnpF?=
 =?utf-8?B?Q3FkY1VhMEQ5ajl0ZlNlVHZzelFLQVhMM1ViVENQTXhsRFI1a1VwU2xqK2Fq?=
 =?utf-8?B?OUR5M2VYVWFYRXBtdmNwZGF0UG9YSUVXSUpIamVzbEtnVVhuMmRlNUc4TGdn?=
 =?utf-8?B?T1dPVTNQcUNYZ0Q4eDZkT3Evdkw4UnFQWVBkb01LZHJNNnFNWmU0Y1l0Ykk1?=
 =?utf-8?B?Y3hWUEt4M2dFaFRxN00vcXlEdVZrdloremo2QzlQcXdSdjZJeUU3TWZIMFNs?=
 =?utf-8?B?bHd3MTF4THE0clc1eHZCMTdYajB3ampURW1RV0kyaG9GbThRdEg4UkpFc2VL?=
 =?utf-8?B?eTNXTW9MOHV4TXRuT29vVDduVmFlVWJmdVgycldQUW11NXQ2RkRqUGtJQmtV?=
 =?utf-8?B?dk5TZzZPWm5QeVhEQjJ0UjZuWThLTHFEVjZNVERQbDd2UVdCelVIeWE5cDNy?=
 =?utf-8?B?WjhQWTBQMFpFaFdicjdPS0VEbyt5NVFYd0kxeXdVbmgrUEpNb0xqVVlONTBj?=
 =?utf-8?B?b0VBeXJMZU05eWhQS2dZMXNzTThPd0Y3QVpSeTlZUG9PYmwySFhpQ1V0QzE5?=
 =?utf-8?B?dkZqOS94aFY2WXdwWndTSXBRY3VGUHlRVW9ud25tZ2Q4eE4wTytMbXpVVkVw?=
 =?utf-8?B?bXVERDIrMStkT0pNVE8zbmNNb0FhNU9ST25ISzVmaGhZc3hqZlphQW1pRnJC?=
 =?utf-8?B?cnVxMWVTVGtPREowcm5iNnNMUUtBK0V1bUt2aENjSlIwOC9CK2xpRlRFd1dR?=
 =?utf-8?B?TU03MFpJbFhXSExTQUc2bXlYRldNRkJBK2kwYVc4eHBSOVZSeDZ2ZGQxV2cy?=
 =?utf-8?B?Nm1rYXl4TXBYeEtWREdhRkkvRW9MS2pNTkpITXJtNm1tZ1F0Z1ArQzRKSjVR?=
 =?utf-8?B?Wll0aDVqWFZGbEhKOHl4alE5NndxQmREMnBFbmtXS2hqeGZZUVZGbDZaajJQ?=
 =?utf-8?B?TlhOU2lBYVdiMnBJYTJWU1hSSkFsS2hEZWM4L0x5RFcxbDQ1bmduUThNamJX?=
 =?utf-8?B?bXBrVWlWcmFvdVhTMW9ubFlrVHBIdGM2K2hvV2x5cHJIVFlOWGlxVDFpaHd4?=
 =?utf-8?B?cldBQmozUDN1dUVsTkpSZUhLLzhlU25TYnArcVk4Tyt3U0hQYnlTeSticm5n?=
 =?utf-8?B?UnYvbjlpd215YlFyaVhSSHBhZTBUV0Z6TjNjUGJkWCtBWTZXZURUYmhuTWRC?=
 =?utf-8?B?Vng3THFOTlQ1Y3FPNUFYUjNMSktnU0lqL1ZtckhjOEpCN21NbEhubzAxaktn?=
 =?utf-8?B?bUhMNlh6TWh2M3F6NDA2ZkwzM095WEJwRXNLYUVob3pVSW5lWVI5Qk5HMmcw?=
 =?utf-8?B?cldLalFpYk5tU3dZUUpnMzNhbyt0dDNhZmFCYmM0R09pTmZwclp2T2lLa1RU?=
 =?utf-8?B?MHFvYlAxNTNRSWhxTThTL3gxSWZEM3NKU0VwOWI2bi95K2tTelVoS3BsYmtC?=
 =?utf-8?B?Q2ttSHlOZlpLRkdaMGs2aWRXSUZDc05NRVNEZDNzVFpGaVEzWEUvSEtxUHg5?=
 =?utf-8?B?OTFjM0YrcG5yTUU1SDNkMUJ3NmdXRjhmQ3dVUXM2QnE1SlRMTjQvQTdMWHdl?=
 =?utf-8?B?Y2pKSC9ETHNVSFI0QW9JK1hac3lZZU04R1FrUzdrQWdHUWRFY0dyYitTL2p6?=
 =?utf-8?B?dFh3NGlzTWVCSWpHVDJGOXYyNGNlUUE2TkxuWG82cGJBRmVJa3JiV2dZeTBR?=
 =?utf-8?B?UlFJVXZYNEpmUHA5aVdYTGUrK0ZWZ2UrT3dWbElIQ0F1R3gybFQxQ0wrS05E?=
 =?utf-8?B?dHFhWUFtSXZSemcydzlSNUI1SS8xTDF0L1JhRGFKb2hZdzJPVlVvTnlmeEVh?=
 =?utf-8?B?M2NubFlNRkdpQzlUWTVaRXJjTW5hOE9PSXVvdktxeFR1QVZ0R3FTNHdMT1dZ?=
 =?utf-8?B?RU9DdFZPK1NIVnRWOHIzMzE2TWR1UDVobjNUZy9OTGpsZU5xU3pHUktUQXVt?=
 =?utf-8?B?RjM4N29UVzg2b1R6bllKVFJYcStna20xZXBDTm9sNnhmd015dDREbEFLSGxL?=
 =?utf-8?B?V2tIZ3dBTTNxYkdFV1hYa1plUzA5S0UxQndNakp3WmdXTFloSncyVUprUUdq?=
 =?utf-8?B?N1FYdUlORmFSQ1Rvbzk1UXhlbzltZUpMbk5XRHFWOEhsWnVDNUFrRnFGcW1x?=
 =?utf-8?B?M3NMWW1hSjhnVkVGTmdWZDZMbXIvZkY1cmVjU1hZVVNVcEpudjFBWW9kN294?=
 =?utf-8?B?cUFjbXRwOGsxSUJzME1CMXptSFhwQTlNZzZCNzBTOUVvdVNaVktROGF3UVZn?=
 =?utf-8?B?UkFNUlFDMVRlSWRQczg0TDE0RWZ1TWlzTHNOMzdYMjhCUG9mbzBKcHE4NTZ2?=
 =?utf-8?B?anZ1cUpSeVF4U3FEb3h3MjFPYzNzYm1nWmVwdEtiWi9sNDRYSG5QMEZwb2Jl?=
 =?utf-8?Q?5q/Ic92QPMGCX3+8=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eyiciElWH7bNV8eEwlM1dT0yEwEkdZ8y7iQSNfp717nU1M3uOi1w7+tF+IPKoCpKJCe9L1jgtdVqC3yr1CxjLFSlw0SCyu3s3MPMtpU8gsp5ckOCxgFZD7ImnBDy3I2w14RqvqGlflHcY+ncehu7xxE1gp8d4VePN7Yq5hDGUXWcJRNxtr57ZXcOxehcc/Z0kAahFVEocuyFa9mczWV1wVk2Loa0Uqpih3LMF3oAnFzkaoQp70vSg0S2jfMFC7QOJ1MAupwI3NyLux01ZigqxxNnb6hJCc0ZvwL/zk9lKyilbHqia+KnqnYEG9zM3r8mut5PTzx8RpBjEEU37NUlng==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB7864.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11566ea-ddbb-482c-8bfd-08df4a7b7bcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 22:37:12.8115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nSH4PM3FNCbDJUsW+R0bAQPQD07l99rgTtCtpO0at3W8UoIcUgeH+/G1i35lWQsGt0I4L/eXPO1XeKDKHopLN6F74DvtUSA++uhN4FWD6MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR02MB9469
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mnlibsTxj3N3HN_jWof9LNHTTDX4cTrzv3spBcEgC_U_1795559834
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

QW5kcmV3LA0KDQpJIGhhdmUgcmVtb3ZlZCB0aGUgIlJldmlld2VkLWJ5IiB0YWcgZm9yIHRoaXMg
cGF0Y2guIEJlY2F1c2UgdGhlIGltcGxlbWVudGF0aW9uIGhhcyANCmNoYW5nZWQgc2luY2UgeW91
IGxhc3QgcmV2aWV3ZWQuIEFzIHdlIGhhdmUgcXVpcmtzIHN0cnVjdHVyZSBub3csIGl0IGlzIGVh
c2llciB0byBwYXNzIA0KdmVuZG9yIHNwZWNpZmljIE1NUyB0byBvYV90YzZfaW5pdC4NCg0KQXMg
eW91IG1heSBiZSBhd2FyZSwgdXNlIG9mIG9hX3RjNl9zZXRfdmVuZDFfbW1zIHdvdWxkIHdvcmsg
b25seSBhZnRlciBvYV90YzZfaW5pdA0KaGFzIHJldHVybmVkLiBUaGF0IG1lYW5zIG9hX3RjNl9n
ZXRfcGh5X2M0NV9tbXMgZnVuY3Rpb24gd291bGQgZmFpbCBkdXJpbmcNCm1kaW8gcmVnaXN0cmF0
aW9uIHdoaWNoIGlzIGRvbmUgaW5zaWRlIG9hX3RjNl9pbml0Lg0KDQpTaW5jZXJlbHkNClNlbHZh
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2VsdmFtYW5pIFJhamFn
b3BhbCB2aWEgQjQgUmVsYXkNCj4gPGRldm51bGwrU2VsdmFtYW5pLlJhamFnb3BhbC5vbnNlbWku
Y29tQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE5vdmVtYmVyIDI0LCAyMDI2IDI6MTAg
UE0NCj4gVG86IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD47IEhlaW5lciBLYWxsd2VpdCA8
aGthbGx3ZWl0MUBnbWFpbC5jb20+OyBSdXNzZWxsDQo+IFN1YmplY3Q6IFtQQVRDSCBuZXQtbmV4
dCB2MTIgMDkvMTVdIG5ldDogZXRoZXJuZXQ6IG9hX3RjNjogU3VwcG9ydCBmb3IgdmVuZG9yIHNw
ZWNpZmljDQo+IE1NUw0KPiANCj4gDQo+IGNoYW5nZXMgaW4gdjEyDQo+IC0gRHJvcHBlZCBSZXZp
ZXdlZC1ieSBmcm9tIEFuZHJldyBMdW5uIGFzIHRoZSBjb2RlIGhhcyBjaGFuZ2VkLg0KPiAtIE1N
RCBWRU5EMSBtYXBwaW5nIGlzIG5vdyBwYXJ0IG9mIHRoZSBxdWlya3MsIG5vdCBhbiBBUEkuDQoN
Cg0KPiANCj4gaWYgKHF1aXJrcykNCj4gLSB0YzYtPnF1aXJrX2ZsYWdzID0gcXVpcmtzLT5xdWly
a19mbGFnczsNCj4gKyB0YzYtPnF1aXJrcyA9ICpxdWlya3M7DQo+ICsNCj4gKyBpZiAoIXRjNi0+
cXVpcmtzLnZlbmQxX21tcykNCj4gKyB0YzYtPnF1aXJrcy52ZW5kMV9tbXMgPSAtRU9QTk9UU1VQ
UDsNCj4gKyBlbHNlIGlmICh0YzYtPnF1aXJrcy52ZW5kMV9tbXMgPCBPQV9UQzZfVkVORE9SX01N
U19NSU4gfHwNCj4gKyB0YzYtPnF1aXJrcy52ZW5kMV9tbXMgPiBPQV9UQzZfVkVORE9SX01NU19N
QVgpDQo+ICsgcmV0dXJuIEVSUl9QVFIoZGV2X2Vycl9wcm9iZSgmc3BpLT5kZXYsIC1FSU5WQUws
DQo+ICsgIkludmFsaWQgVkVORDEgTU1TOiAlZFxuIiwNCj4gKyB0YzYtPnF1aXJrcy52ZW5kMV9t
bXMpKTsNCj4gDQo+IC8qIFNldCB0aGUgU1BJIGNvbnRyb2xsZXIgdG8gcHVtcCBhdCByZWFsdGlt
ZSBwcmlvcml0eSAqLw0KPiB0YzYtPnNwaS0+cnQgPSB0cnVlOw0KDQoNCg0KDQo+IA0KPiBzdHJ1
Y3Qgb2FfdGM2X3F1aXJrcyB7DQo+IGVudW0gb2FfdGM2X3F1aXJrX2ZsYWcgcXVpcmtfZmxhZ3M7
DQo+ICsgaW50IHZlbmQxX21tczsNCj4gfTsNCj4gDQo+IHN0cnVjdCBvYV90YzYgKm9hX3RjNl9p
bml0KHN0cnVjdCBzcGlfZGV2aWNlICpzcGksIHN0cnVjdCBuZXRfZGV2aWNlICpuZXRkZXYsDQo+
IA0KPiAtLQ0KPiAyLjQzLjANCg0K
