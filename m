Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.151.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019588;
	b=ms/oNXAKCtrcDS83kAQqo5FeMSYI8B4b7IjeLFP1oxbjV4hRzfsPqf6ktwL4Te90Nn2S
	 CSh+IGelKCfWpGlQn5jEWKW9gVxXjdFVDDK9cJZJLZU8e4xILSQgy5IqtUzjvste8QsZS
	 NH9dFmgZFRhGkSL7W456k5Yd05KwHVRSfKiOL9MGf2/352HtbooxnxaTRUuDTQx4tWenn
	 iJvhy5b+lUabG1A6HJSTRMPZuhLEsf1IkiGfUKj4orEvi4PfvvmJ6JD4Z8INQVxZTBTI2
	 6O90ZErqrxhkuA6wxaI6YyAxByrw000ZLe1biRY4n3D3E9kfeoVKXxbt3Vqguteu6eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019588;
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
	bh=njLIEZZbahidaB+c5D34w2cGpNehYggHjUInKVvMqe4=;
	b=Xd1cB33ZQVdvAR0RkF/17Szg6HMtHrby8hDJduelsrx1XrIKpV5d01rJSa+bJXkqvZHC
	 6z7C9IIKqIsYPgxVab7E1DNQGIXolTEtMLO+ZIojc5eJztV2PJcp8CFfolPvDQ4L1vss6
	 2NbW76IbrEC5PtZypJWrTrGQdBM0n3XB3zGpPOgKuNHIQ6uQkRzATEeyUtEzKdZg+U7BZ
	 cPv3Kvitq0OISog2fir6m+Ex+ZwOP3vrHrmiRM8tlRM4x9BxBybmZG1JaMYQLIO8FSUxE
	 e+KNYdGWOBhAPSWnKjHrXOEL80HXRvg8qcLDA5M2ilDmjc5jheiTWCWLZRZWQEyRgAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=OKYAW390;
	arc=none smtp.remote-ip=170.10.151.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4E5606A7C0
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4E5606A7C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=OKYAW390
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795019581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njLIEZZbahidaB+c5D34w2cGpNehYggHjUInKVvMqe4=;
	b=OKYAW390wVc1qiqaNjcxCKYz+j77ohYru8VddKbWgRW+4yL3pL7LF2bgcDGNfj+4mQYXcu
	f1ShlJQxOqjDpdxLWYZMcsW9ysGfbC6BRNCwOM17u1gXv8NyvybUlhW/C+7vVp9V2aHcao
	xXP7KJbI/Pj3UaJv1aQgGxpWZpTd75RJ3w81laWZHLcLYHpwEoJ/ZCv5YlG6hZTAuNSj2z
	yG/2u9jSycUZHXDaeXwlE7eY1ienXu0jkZE6WyUpZYiIt8nGR+/MC/HEweMBn21E09S+Cn
	VXk1LaCTqBSIvTREtOVW17tqz5OeTpzQofqegQqTEFFDbBTmE+vqxc2BUPJnuw==
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-57-TZe_ihXBMiG0ykd9ryhhfQ-1; Wed,
 18 Nov 2026 08:32:53 -0800
X-MC-Unique: TZe_ihXBMiG0ykd9ryhhfQ-1
X-Mimecast-MFC-AGG-ID: TZe_ihXBMiG0ykd9ryhhfQ_1795019571
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by PH0PR02MB7509.namprd02.prod.outlook.com (2603:10b6:510:5e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:32:49 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:32:49 +0000
From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
To: "netdev-bot+sashiko@kernel.org" <netdev-bot+sashiko@kernel.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "parthiban.veerasooran@microchip.com"
	<parthiban.veerasooran@microchip.com>, "horms@kernel.org" <horms@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "andrew@lunn.ch"
	<andrew@lunn.ch>, "hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, "edumazet@kernel.org"
	<edumazet@kernel.org>, "piergiorgio.beruto@gmail.com"
	<piergiorgio.beruto@gmail.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "jerry.ray@microchip.com"
	<jerry.ray@microchip.com>, "ciprian.regus@analog.com"
	<ciprian.regus@analog.com>
Subject: RE: [PATCH net-next v11 08/14] net: ethernet: oa_tc6: Drop frames if
 footer has FD bit set
Thread-Topic: [PATCH net-next v11 08/14] net: ethernet: oa_tc6: Drop frames if
 footer has FD bit set
Thread-Index: AQHdc5BlUTHP4752Y0K+rr6MPZuOfLcys2MAgAFZjnA=
Date: Wed, 18 Nov 2026 16:32:49 +0000
Message-ID: <CH0PR02MB7867083AFB60EBAC2EE68473837A2@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261113-s2500-mac-phy-support-v11-8-7a186141952c@onsemi.com>
 <179494518411.3136.11012925273881298159@kernel.org>
In-Reply-To: <179494518411.3136.11012925273881298159@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|PH0PR02MB7509:EE_
x-ms-office365-filtering-correlation-id: acb51d93-38a2-4017-51b1-08df4591959d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|38070700021|4143699003|11063799006|261026140227099003|56012099006|261022105027099003|261028144727099003|261009223027099003|22082099003|18002099003
x-microsoft-antispam-message-info: /Rbd5W3PWwWCxcFoP9Bjwl9rGc1F1zuXlDZdqXMbJK1vNHr+9SIi+kr1FNHM1pPccEyUvr2zAm3hrMEImSIpf7FpnFfYhaH2VHubAKNHjgn4DaRWIFiw4/1o7Fdb0ufwYW2Qww+Hkdchs5YwaWhZjqFaE0Go64PlcF5XVh4dUlyV6U+sVtIC5SytoKJwF5z2fJKJ6wQOD9IOVfLUgNnCHDyfboHu+nG7V2qz4nHAW8JhwZSRqlhZD+lK+wRORLAXNG/4RdxLtih/jV+iNHUpVjtw02AdTwb+oOYNTjqYY7Q81z14mQzPb5Sax/w+X/p2/tKXhukiMDe+L+0HVu1DjU63cyVnVK0dALC5O2TGABIMFRG2flgdnLvpIJSM/h9s9j7fkHF2+dTAHy1LA5gzL4KNMyIy6QdV4GDlhBJCFiFOvGhsZIsZqcOIrIydKDm3hGac/JQryCBZ0SK9Q1VKiBHYG0o8PP5u6zIiHX0jqvaQdfiPd3OwX0Py2T4P+SyurJVqxjSFD2ySRTFzorPYTjExt8DTn4/QVBDQ+90clbY/AF5GKTGut+45rxVViXSdzeqLdHEoSjonIWp0+w/ox+ph5mjZCiSZNQM8gb7OOIvVqy4woD/t3MzyqyGZg9PacY0QU3Yao37Ns4nkExGeN8r04Heym9rSzbpnDCMW9tw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(38070700021)(4143699003)(11063799006)(261026140227099003)(56012099006)(261022105027099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDRFY1RkWjNESnZCTGs4aFBkRHptQjJ0RW1jbis4NXJvMlkxMjlxd3UzSEEz?=
 =?utf-8?B?M2s3YmVPdEtJTTVNalVmMTlTa0VoVGt5c0I0Q1dqZlR6Q2hvOENiYW1KMjVC?=
 =?utf-8?B?QWpyQy8rYzFqOVBqR0Y5cWtGR2oxRDVGb1ZGbXUrM1kyZE5WZi82TUpaNTJq?=
 =?utf-8?B?L1l3WllDUmFrRnZuOU9SaENoSXZkUVNpNC8yQUZuNmUzUkJvTHlBaWFCQ2I5?=
 =?utf-8?B?UGJWQmlwODBtL3NoajdDdUdtNGdYOHJlL1Q2UlVDMlRld1pVOGY5YVRobm5Z?=
 =?utf-8?B?RGgwMHZ0elk2TUJVRDk5d0pob25kd21EVDF3Sld2YjRHWGhIMFhkMU9YK3B3?=
 =?utf-8?B?c09IVzZ1WmkrajZtNXJYMXNDQ0hVZS83Vnk3VFY2K05vdU9scE0zY1YxbGwz?=
 =?utf-8?B?SkFEUHdFZjdYNVJHNmtLaS9INWtCbGhSMU1xbFVDVkpkb2lua2V2aGpxSno0?=
 =?utf-8?B?cGlSTDlKZWpnZ2Z5OWJDM3diT1NIcGxnQW1sL3VDUUtkenhkVjg5S0Y3STJT?=
 =?utf-8?B?cjJqSW5JSVV6RVRRLzFKQ0R3NWlVNDlhcVJlUVFidWJ4dlQvZ1g5WU9BV3BD?=
 =?utf-8?B?WERxOXJNTXB0RTAwQVl6M3dwMCtNQVFCemdzWGt4RS9oQ1BOazdKWElZS2xh?=
 =?utf-8?B?Y20zQ3pZT21OQ0tUOFRDWVVvMld1VWRNdUlwN0toNWZ6NjQ0WmdRYkF1Vm91?=
 =?utf-8?B?V2pEaEI3emZFejFyaWw1MzduVkF0WTIxc0cxMXZjKzhNTitwU3BVeUFxTUM2?=
 =?utf-8?B?MmNqZStOZzJJVDZtL0hSWTIyY3I4cGNpY1pFVTVtMG04YTdacG94a1NEaUY1?=
 =?utf-8?B?d1BDQ1gzcitNVHNmZ09vQ3p3WS9ZcEx4WWEyaU9nRXUxV2dsOVE5bDdxaWs0?=
 =?utf-8?B?ZWY0SnRQRW8wM0VJR3JnRUxiM3NnSW5sWnhVUTlwUFhHMHVYVkluUkE0YU91?=
 =?utf-8?B?QVdleGZ1RmFWVVJIWjBCQmNUYXMvdElKNmRncjZ0YnZNNjdHdGlwQTJ0c3dE?=
 =?utf-8?B?TS9KR0plekJPNXJSM1Fya3FZODhNOStUd2IwTlp3bkgrbGxWekRraWFLNFhv?=
 =?utf-8?B?YkVsZ09ObGxEU2VUYVAyQjYyQ0MwQlN2WEh3YWxoeHJ5UUd3ZERPblByTFh5?=
 =?utf-8?B?VDVNZmhONGdMbEpNbUk0bW1NeWtZSmluOTBaU3IwRmMwVkVZeEVLZHlZKzhn?=
 =?utf-8?B?V2gzeFV4VVpkdWVlY2xWcWFQMWI0WksraFp4SGhrbnZjd1czKzloVGsxTUgv?=
 =?utf-8?B?dm1WWHVhNE9vYVNVQmNyT2h2ZWJFdU15Qmc2Yzg0T2Fmc3VzMnVnemUxM0pS?=
 =?utf-8?B?QzA2WFZib3hHTU9XSUtqT1ZjY21oZU1hRTRzTkthVXhUNURHMDNPbDZxV1N5?=
 =?utf-8?B?YmJxSTdVbXVmeHpVbE0yZHBNSlo4a3krY0pRZVRJQys1R04rOWxPdDdCZ3o5?=
 =?utf-8?B?WGV6YlJtK25xeGdWT0VDUHNpU1lpSGFKZmJyYXh5Y2VFdEdmNkp1VTl2VVlP?=
 =?utf-8?B?d3NnN0JrbUtKU2dMTlhuck9MQkN3ZG14RTBNQlRnVGpyWjVNenE0QXBkU0t4?=
 =?utf-8?B?MVdoMTI1WWQzU21LeUFrQXlwRkZVd25UcTA2L2JQQ3lYUHpObEk4WVpWNWND?=
 =?utf-8?B?VjQwMU1BRnVubHpxRlc1dVhXakJkMFZTWGpLUWFidUh6Q0lRTVcweGt3Z2NT?=
 =?utf-8?B?eHJienlibHdrVVJEelY3TzN3TDl6YjdsS0xjc3BpZU5NK1M4R0FKS3FuSDlr?=
 =?utf-8?B?VUUrTk42Y0ZzTUh1T2xYdHM3KytCcmswb3FqWVlnWFY1M1BBa05xa1dicHR4?=
 =?utf-8?B?QStMcWVGd1JGSzdvRTlNV1JmaEsrRitCNlRSUTNEVkRtdjJZRnRZUEVmWlJD?=
 =?utf-8?B?QzBWKzg0Y21KR0NaUmNaVXZIUWcrR1VoVU9Oa1hKVmpXUTAzcWt1RldOOFYy?=
 =?utf-8?B?SFo5dkwxd2M2UlBTaXc1T3A0TDlHV0xkRkdCdVg4Sm9SY3BkbWVLditUemhz?=
 =?utf-8?B?YklldkJUU0pLVitWRFdEdHQyZHhZR2RnNEpoZzRZNlpNbUEwdkxLdFY3M3hn?=
 =?utf-8?B?VFlhaU9VVWVHMldjTHdMUmVCM1diNWxMWkYwbmNXT28ybm5uQ0ZZcWZ3UTlp?=
 =?utf-8?B?Y015MFpNU3NsWTcxck5ZMlQ3cEV3VnZMRS9IR3dNTXZzY0hnTjY3d3JYTE5U?=
 =?utf-8?B?Q1dDcVovSkUrTW8zNlZXTm1Gd1F3amhIbTZUN2NWMHRCUVdCaWRxeUZhMDhT?=
 =?utf-8?B?UnROMCtTNzJmTjg1Mm52WWlNbjB1VlNRTlpKS3RsZWN2OU9RK2hPM2RkcFI1?=
 =?utf-8?B?UUo0amRtTVFEaDZLRFRjbUZQaVpzTGF4VlR5bGszUFkwdFRJSVJiRzdJZlgv?=
 =?utf-8?Q?VPdg31waUQGhn8Js=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: DIw+kSgslQlbOyhExe7M4Cg2JVeY1w/HjiCQ1ITYjfmKKUCP3ZpNnno+QnmFzAUG8HNog+HjoUEk8SOIiTmqxNlLxQa8chMg04SCFOm2wcKzjfFFjo/QeGGDzmsYjyUQHJ6JU4qPbvIkXskwGB88ZJMEa2ChuBFd7nSqxHe6YBoa9PrGFD1f2YYzFClVUXe8JmILloU2Nr4357M7gROTiG+71ux8tvu4e9Ei0CFc6EpM5GAUA+ZGgPuPstCoBNA7FQeer93Ngxk/bn1DitJ6Gl0HrKS37VRJZa/VtRG91MONAgURT2oapxF7IftMXQ6PtyJ6BenlwDgE07gufx3PfQ==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb51d93-38a2-4017-51b1-08df4591959d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 16:32:49.1430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ul2Js3M2KgCI86nnNxj1JojtgDjOXxQfTa3ymOv0NfPch+UEyply3Z4NleqEpIN5vTZUZEfaUUKnq8I4JJ8zkvphpIVGPp3dwD2fYHKcgn4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7509
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YBdc1ms3fdJuQaSeauLd08KeJ8jksG6OX_KthOdlp7g_1795019571
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBuZXRkZXYtYm90K3Nhc2hpa29A
a2VybmVsLm9yZyA8bmV0ZGV2LWJvdCtzYXNoaWtvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDE3LCAyMDI2IDExOjUzIEFNDQo+IFRvOiBTZWx2YW1hbmkgUmFqYWdvcGFs
IDxTZWx2YW1hbmkuUmFqYWdvcGFsQG9uc2VtaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
bmV0LW5leHQgdjExIDA4LzE0XSBuZXQ6IGV0aGVybmV0OiBvYV90YzY6IERyb3AgZnJhbWVzIGlm
IGZvb3RlciBoYXMNCj4gRkQgYml0IHNldA0KDQo+IA0KPiBbU2V2ZXJpdHk6IE1lZGl1bV0NCj4g
U2hvdWxkIGZyYW1lcyB3aXRoIEZEIHNldCBiZSBjb3VudGVkIGluIHJ4X2Vycm9ycyByYXRoZXIg
dGhhbiBvbmx5IGluDQo+IHJ4X2Ryb3BwZWQ/DQoNCg0KWWVzLiBJdCBzaG91bGQgYmUgY291bnRl
ZCBpbiByeF9lcnJvcnMgcmF0aGVyIHRoYW4gcnhfZHJvcHBlZC4gV2lsbCBmaXggaW4gdGhlIG5l
eHQgdmVyc2lvbi4NCg0KPiANCj4gLS0NCj4gU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9u
ZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8jL3BhdGNoc2V0LzIwMjYxMTEzLXMyNTAw
LQ0KPiBtYWMtcGh5LXN1cHBvcnQtdjExLTAtN2ExODYxNDE5NTJjJTQwb25zZW1pLmNvbQ0KPiA8
aHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8jL3BhdGNoc2V0LzIwMjYx
MTEzLXMyNTAwLW1hYy1waHktc3VwcG9ydC12MTEtMC03YTE4NjE0MTk1MmMlNDBvbnNlbWkuY29t
DQo+IG5ldGRldi1haS5ib3RzLmxpbnV4LmRldj4NCg0KcHctYm90OiBjcg0K

