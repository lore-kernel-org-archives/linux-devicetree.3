Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.151.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629900;
	b=IfB0heQAtZLhKM+qTmH0Dp6+mK1Pxgha4CqFgzaqoCoJzatDQX8j98yQ7IO/j53KkES+
	 XhzFJ8MNNJcWOTs6LU+/qrv+kNuDkwBUbWILaaJjbWUCEkiMTofbMWxiNc1D2Ygityisv
	 QP55Hp6UTMqdds53gtDiIlf0FT5b6YueRJvRxND6Cf49snpSLw3Ideqhe4/9OJOirsVep
	 PYCbXW9RL6u7eeCYYzCL77yFNJL9KwfvnW4UOjemQ33rG4AZri3W0De8UoLZdjDx1jfJK
	 ddZpDSpgzHbTqyW69ajByLIrHXxhALmI0F9m8IO92inYDUfdv0eXe6f7KS6SdzBM14A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629900;
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
	bh=QTGMXGNfQi0tH16ROkgGJvKUzhPGHpJpVhjEu7HLZXU=;
	b=vkP6fzTFz7p/ySe5XtYiJSaRhgfgv4hLPdYSuaMOMReLfIy7wvsDdDqTvOwtE0na6Hml
	 qWAaFhHJR3S44OHCqEDLfDMMxF2qALs3W7LBwhU05NsOEG9Jmx8v8QsqS407tSxevH7xr
	 QHSlpkTXp4bfMV92PtWq/1pY9KIfT7GpIK11Zvh39QWTKcKf6Th0BTPr2bowOc8Afoe3P
	 Am9xjxWoAWw3zaSuwE3eiFNB1enBBwB0dV3zppeXcx+MzHNjE8UfTmG25xmwglfRMmm7I
	 /kMjOHjpgLa/E+57mz9zV0Gf3UVXL56krrnNJCvDyoaHnpVyNsjFpfd0zJdQm21ed6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=PCdSz4qn;
	arc=none smtp.remote-ip=170.10.151.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6F606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 18:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E6F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=PCdSz4qn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795629899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QTGMXGNfQi0tH16ROkgGJvKUzhPGHpJpVhjEu7HLZXU=;
	b=PCdSz4qnXXLZK6b9syFzJ5yp7qbUYLl1EQ6+iRfHmnI05CfxbwBcmw3SJf7HCMCvaXcgI3
	Lmg+rjo4vafExMaNonCc1KHU2fnGRYD79iQCo05nBvu6nRFP5NWxhShGqfAqvhhJDqj7KA
	jMEYbbMmORYcw7j0P08bkUZ4c/O2VtjpqEA6zNyqEtHPeSy6Jr2Od3sKboqmU2IDdpkciV
	pYugbe7v3hYsEt8pplL3NKi04W+3rTc89LY5hRKOBogjqvYa39sNcCcBlFzsTaIlWyQhXi
	AApQtT08L2hfUTbHV0mp+nFVaAA2KuEdMU7Z9N2J2+lbeLfSdr8i93nejM/iWg==
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id usb-mta-65-j_nBodyZPHqjsOfdDFZ9ww-1; Wed,
 25 Nov 2026 18:04:56 +0000
X-MC-Unique: j_nBodyZPHqjsOfdDFZ9ww-1
X-Mimecast-MFC-AGG-ID: j_nBodyZPHqjsOfdDFZ9ww_1795629892
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by SA6PR02MB10624.namprd02.prod.outlook.com (2603:10b6:806:434::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 18:04:49 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 18:04:49 +0000
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
Subject: RE: [PATCH net-next v12 06/15] net: ethernet: adi: adin1140: Depends
 on PTP_1588_CLOCK_OPTIONAL
Thread-Topic: [PATCH net-next v12 06/15] net: ethernet: adi: adin1140: Depends
 on PTP_1588_CLOCK_OPTIONAL
Thread-Index: AQHdfGCaQVQtoOdfLkWRnCaJOU3r/Lc/FfXg
Date: Wed, 25 Nov 2026 18:04:48 +0000
Message-ID: <CH0PR02MB78677068A3973BC554972B9083432@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
 <20261124-s2500-mac-phy-support-v12-6-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-6-3575855d99f9@onsemi.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|SA6PR02MB10624:EE_
x-ms-office365-filtering-correlation-id: 7a42db0b-318d-4133-bc48-08df4b1e988a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|921020|38070700021|10067099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261102123227099003|22082099003|18002099003|6133799003
x-microsoft-antispam-message-info: W0Ix+mwd5OXgZA/XBLAzaUfn72MZM2lmNCqdChNbqmQsWfANmg1SMa+UFHGlYgHBCUicuJrFutbSNy+Svw1/YIg9tdt5Wy05vxITjUMOK98PuRdIfMILoJAnQhz8fhXw4kZaTTtU/ZzUQoounCNRHUFGQ5OYypWVo5sl+4NMj6JcuX31u6n6FGk0Fe+E3ow7LAYZ2/BbhF3Yaki37dT03esOOr5PWpRdjQQubJKFjwh83liY81YrDuQ96ooPEN/wSVWfgGXzznBCcRfmPJQ2WMeEdjxYHZTraInmly38+32Pe1Ig16vqA3MKjZ69vsGD+gid+rvpK9sV6RMI2jMe4mOl+6nTid8D4CqGP5KOWlrLN8aA7Gg/jc50X+Z5dhecgWv2E3IpZUKYBpfk0X0l/OKlrkkqmY1YpRDJ5g0ViDLfKj97ACnDBxvON1gEgMkVLtdQi9QE535cEcUJ4lq6liSRacVL4lDFw4mTuYFu5126Y2e6kWM2llLKhsA+PwXyRFNWFSJkfWco6wRZ93Hs8qhG2lhxHvl3aG5P0cdNymv7XRYbe1waCwxl9lhhJbjo2Z+NnQN8jPB4Y1sB+ZSENs65d3farFhI1jKl8Dxn54dt1WElph6KGRdiYMpWgVKupOQhyPof+prBC0TeTSxlx7wGA2dF6l7AOCup8eugRe4YilCenZXIHdWqI4PTPkCqilflHc/I5yigLWjW1+s/toubhwW1vXyG6YPj1yzT/Nu3hPp1mXg1qN87gKE1n8vE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUFNTEJsK3hjOFl0TEdaTFVSRHZsbkQxcnBtZE50SUQwRW5CZFZ3ck9pOVdP?=
 =?utf-8?B?NVRZZUVoVnp4VFRtZ003Yk9ZMW5kMTFHNVp0MHh2Y2habHVrY3RTVFhPcWVQ?=
 =?utf-8?B?OUVIVjI3MU1jRzJLRmVVZ0VBMGc1UCt4ajhCL0ZqeFJHWFA3ZzJablBUMVVI?=
 =?utf-8?B?UmJBWFdVMDhhS0UwdFk0YnFidXVJbTFZMnhLRm94ZDNkdFBsdXdIaDFJaU9t?=
 =?utf-8?B?Q1M2Kyt1WGl5eTY2N1kvU3BzbkNDRUlpaXdJdllQRGNwQkNNY0Fka01TbkEv?=
 =?utf-8?B?WkNBbzkybE1LS0tnUXNhSG1rUFFQZ0QyOHNyNFpUb3hXR1VxTTlHcExVR1l0?=
 =?utf-8?B?ZGx0TWlvNGlzZ3lOdllFQmk4aEhMcmRRaldyUDhqYlBjU1pVM1VRRUdmNEhZ?=
 =?utf-8?B?TTkzY2lzcG1DTjFvKzB1OTFPOVNKamQ0SFZWQUZ3RktIM01kSCt1MEZUZEJt?=
 =?utf-8?B?eTh4TTNsa09TVEIrM0NiMG5DZ24wYm42b0RCNDVObFVMakFvWWVEREdkU3Jn?=
 =?utf-8?B?L2lGTkNrVFRBMXN5Q0Z6SmNNRURJWGJTZ1lvYURTaW9hU0lNWmpCdUxqblpY?=
 =?utf-8?B?NnlYSjI2YlZ1R2x4UG0ybmhvVFYvZzlTSCtrSkdqS1JkRzlIMERidG1ZM21u?=
 =?utf-8?B?N3RHVktMcVlmamdHRFIwSDQ5NEpZeDlacVZieDhncERzN0lJMGtUanoyQ245?=
 =?utf-8?B?YmJWS2JPd3pLWnQxTUIzSktNY2VpQXpHcExvdFBVSlprYnU3eFBJR2VEN1Zk?=
 =?utf-8?B?ejZxY3A4NDlvc0w0Y0UyaE1COXVpK1oyS054eExqcUxXeFlQSjhGbVJmRVR3?=
 =?utf-8?B?SEsxUmgxbFZnN0VwdlppVmRSVFcyZFh6OEFDZXFwUHpBZkZMM0ExRHYrV2to?=
 =?utf-8?B?bUxvWHRsbDJYK3RoVEdIdlZ3elo5b2lXakpTZTF6NTJQWE13R0dPY3V3amtZ?=
 =?utf-8?B?d2h4S0x0TnNvcEVHVmd5V25aNkc1ZytpbEFzWGthV2R5UTFxQ3hSdk56YThM?=
 =?utf-8?B?ZXd1eFFIbzU0Y2U1UlFDYkM2akFheDBmMnRmNnBQWFk4cnJZNnRMUGcwdGlL?=
 =?utf-8?B?eVkwVmJybDg4R3lCRllWck52L0gwdEtMT1NRM2srVTdCL3kwVk02QlhDTi9t?=
 =?utf-8?B?WkJqTWhGQW9SUG9JVlNvYWxRcVAwb0dGcmJ6TU1KRkhZY24yVHZLa2RTa0Jk?=
 =?utf-8?B?ZWt5ei9PMEc0SDV5TjVmdGhqa1V3bkNVSG00SlBoRlh5d3JDV0tZMlJ2UWhN?=
 =?utf-8?B?SEthTHZadjU0blJhNjVKYWhuZEk0L0tWV0hOaks4c2FHV2p3S3NJSUNoR2F1?=
 =?utf-8?B?SUlQT2kvNGdjWWlzTzJRQlE4VlJUeEoxSm5iWEVCTHZISlB3cjBsMDd2K1dY?=
 =?utf-8?B?WEl5bmpFTEx2bHlCOG1WeDJMMjRLUXVDc3JNbU5ZZDlHL2VqY0g2MWM1UGhT?=
 =?utf-8?B?SXNoOXdGMXFRbEdrdGxjM2Npeno2bkl5L05TSFdYV0hFNXFha2g5WkZLMkFW?=
 =?utf-8?B?Z21QSTRPZC9PdUhaNFEvTlVMMnFOZkUxbnhGZ2RpYjNGT3dCeGFta3NFeXE3?=
 =?utf-8?B?amhrYmpYNTNWWFhSNmN4T2tLWGdVU1hpQ0FDMDY3Z0FQaHRTaG92djF2WThr?=
 =?utf-8?B?RVM2Y1JHZmFjVUN2aldWRjM4MURpQ0lmVGFnays5QU5sZXNiaEhNTEJCNkRR?=
 =?utf-8?B?N0xsL1I4amRwaStBUGhlZmJicllOWDdSNmtSK2pKMTJVNW92MUFDaWFOV0FX?=
 =?utf-8?B?UG5NQUFZdUtGNyt5MW41Vk5hRE5kNE91Y1FxdW9EMGovTko2UEFEUTlTRloy?=
 =?utf-8?B?ZHQ2RzZwTWVWb3lYZ2FhOTRkcEs5eThQc2VPcEUzVDUxcktPQVhYaXoybU0z?=
 =?utf-8?B?dTVZWStOSk5IQUY3UHBrQytOMDdmdHhocmgyYXoxTHE1VFBCSG54bnJXM1hO?=
 =?utf-8?B?NUxnSkJYNit2MTJ6TUU1cko1WFdwQzBqK2hHcUpRUktzb003Um1MRTFzYkRL?=
 =?utf-8?B?R0h1NU5FN2FpdmIyYW9GSmtWaTRZQjlOMWpkVzZHd28wYW1HLzhwVHNNN3lJ?=
 =?utf-8?B?VGUrcjU2a08xR2FPTGc0UUJEaXRLekk1cTh0QWpMSGJPcG1SRTBiVkw1OGw3?=
 =?utf-8?B?QXBZQ3NuUXZndDFHODdNUUF2VHR6YnhNRWhvcE80aVdndzA2SnRFSzdRM2lj?=
 =?utf-8?B?bWZTTFN0VTJFZk82ZXhKOVVvQ05kNFJzZWc5QXBnVFVBZm1qTVg1d1R6M1A3?=
 =?utf-8?B?OWZrcm5tWDhXNU45aEFPbjJieityeG5CWUlRRDhwN2sraXJ2S3pDQVc5NlNC?=
 =?utf-8?B?TUxKTERhV1dROTUvb3BvK3FUWjc2R3pkU3dwNjg3c0FyUDEvWHpJWHQvMkpY?=
 =?utf-8?Q?KQvoMx8KqnOdsDpQ=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fcT6NGhy8eZhDrbTU1cr17L7yxhLLPpHrZ6E7XBaeUoWvZcS2mzQaDcmZCT9kaYnxdRXYvOxm3tAdugPyfiliZ/xsiAH+bvYCRW/Jvs0+jwpja8BtaHrwoGngH3+fplfdQE2MvaVLBBejdf8NAo1k2TgNfNxe7MoKKfUuAmHK9pqFnKe6W5ltgqMpBJUW1Zr+s5+nHQ6mUlosnWgbr5470PVlPEJ/k4L4EAl0p4ARCixNL8tRefl9FcKZTUH4vybnYyYKn9eO5Zps3d6E+2kRnuB+AmGatZrrscnryHWq6M3wvQ2sAhOjcKkYxYx5jSz2QujvLdSdne+f3VNT0Vdvw==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a42db0b-318d-4133-bc48-08df4b1e988a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 18:04:48.9646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUNP+CPIs6xC+1TYhrBXxuHAs6bFeSlA8oeSuD/7609bh7ttYA8pnVdidhvpuC44vUBTKE8JXlXZknVTIToFo1nOBnv3Q/6bhGSo3eGQAdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR02MB10624
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YL6PU3YUwxPKpT87cMVC1FXJmvyKrBATA5XlMfpPZXI_1795629892
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

Q2lwcmlhbg0KDQpBcHByZWNpYXRlIHlvdXIgZmVlZGJhY2svcmV2aWV3IG9uIHRoaXMgY2hhbmdl
Lg0KDQpTaW5jZXJlbHkNClNlbHZhDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogU2VsdmFtYW5pIFJhamFnb3BhbCB2aWEgQjQgUmVsYXkNCj4gU3ViamVjdDogW1BBVENI
IG5ldC1uZXh0IHYxMiAwNi8xNV0gbmV0OiBldGhlcm5ldDogYWRpOiBhZGluMTE0MDogRGVwZW5k
cyBvbg0KPiBQVFBfMTU4OF9DTE9DS19PUFRJT05BTA0KPiANCj4gDQo+IGRyaXZlcnMvbmV0L2V0
aGVybmV0L2FkaS9LY29uZmlnIHwgMSArDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2FkaS9LY29uZmlnIGIv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvYWRpL0tjb25maWcNCj4gaW5kZXggYmRiOGZmN2QxNWRhLi4x
MjBhNTJlNmIyODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2FkaS9LY29u
ZmlnDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2FkaS9LY29uZmlnDQo+IEBAIC0yOSw2
ICsyOSw3IEBAIGNvbmZpZyBBRElOMTExMA0KPiBjb25maWcgQURJTjExNDANCj4gdHJpc3RhdGUg
IkFuYWxvZyBEZXZpY2VzIEFESU4xMTQwIE1BQy1QSFkiDQo+IGRlcGVuZHMgb24gU1BJDQo+ICsg
ZGVwZW5kcyBvbiBQVFBfMTU4OF9DTE9DS19PUFRJT05BTA0KPiBzZWxlY3QgQURJTjExNDBfUEhZ
DQo+IHNlbGVjdCBPQV9UQzYNCj4gaGVscA0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==

