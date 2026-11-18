Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.151.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034461;
	b=ozHf6hJxAU74sjOxgMOTxm2zdisrrd5dQ9iy8nXmt9A2IJlauoP6zsvZBoVlA0/e1ov+
	 UcI50VpgezQS55patfPRdu4TigMrGJw7erc5o/JBEHz+P6+rPFQa/qVfSdJTbLU9kou8Y
	 lK/1T1C5ZosVRPtxgbjxmGSmmoM9sFlk16lb9awr9hJlzu9eVwZdn3H9OY1KJYpIEm4MX
	 VSohBFpmoM3/3PwgBQ6D5rr0lYe7SybxRgqfwT6U69D8iXb6OeEvUwsDjnoG5WXO+I+OJ
	 Pt31MCz6iy65Hjy8n/QsMU8+sPUVGmtpbcJpXDkP1yzRrIJHFzYxS3ldLzsEQNlzrEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034461;
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
	bh=bUFvlbrZowrI3VcwPy4uNsWd+MAE8FjX2HBBrGiGJCE=;
	b=ES+B4GdEta/BY8Tc6IliZM3kcEyhfYN9kwmvhgsdrXTSi2GE2uyTR4rMq78eC5XizP2g
	 xkkBrbj9UdVbu26b+MZODgmEHcnmpnxn+Kd7RW1ym5L8TmadH5o/ziPqsaKOhl9uNT/Ow
	 fr2w8JzDhjLVHif57SbHX502FLahyCTNPiU0vh++YvmE5P+4o//OUJP4XTXHdPI+15qkm
	 n1fkdXEMDBYkCNz2DIUg1O0A5S8RzHgeooNBcPtpkERthVa47pd7Pu34VAcTtj+ie6uSD
	 bMSvZUsCUih/qO/kX5H8Oi2KCO3/xqbA45lSkocSjB4klP4HSQaSFQnmjHMCulEOxCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=onsemi.com;
	spf=pass smtp.mailfrom=onsemi.com;
	dkim=pass header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=azE6WsLR;
	arc=none smtp.remote-ip=170.10.151.120
Received: from usb-smtp-delivery-120.mimecast.com (usb-smtp-delivery-120.mimecast.com [170.10.151.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC42460A2607
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 20:41:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC42460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onsemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onsemi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onsemi.com header.i=@onsemi.com header.a=rsa-sha256 header.s=mimecast20250127 header.b=azE6WsLR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onsemi.com;
	s=mimecast20250127; t=1795034460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUFvlbrZowrI3VcwPy4uNsWd+MAE8FjX2HBBrGiGJCE=;
	b=azE6WsLRkNrZRyUsOoFYiQ+WZ5vO7JvFNCgCPFg4xW/+uR+U5U80Zt+97wLmjKnieaXVwf
	vduJXeONAfYs5+PdswL7Ox/1PGtQlPxSqsAMgQtSMSPu/vTV5wXMsun+tXC5BYn5oo06yv
	FL/A7Cj07Kqafa4vvIxQFFznImJ42bRfajgSg4FAWThVqaN4hyhp51pai/Twf9bkLNTHzO
	t+rNmGpheF1IZFqQ7us5sd2/275lVsQOI6HA2pPsr+ZRCT9rS2ukHMCpcMMS8nJgwNeNpA
	vs05ABLzjOpYAdOKzlHlixNLllGsEFio/tGH1jJMAOGh4PlIRykszExaU4tQDg==
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013070.outbound.protection.outlook.com
 [40.93.196.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 usb-mta-79-N0z8gdYwO9a5VbBJQKkmXQ-1; Wed, 18 Nov 2026 12:40:49 -0800
X-MC-Unique: N0z8gdYwO9a5VbBJQKkmXQ-1
X-Mimecast-MFC-AGG-ID: N0z8gdYwO9a5VbBJQKkmXQ_1795034442
Received: from CH0PR02MB7867.namprd02.prod.outlook.com (2603:10b6:610:110::22)
 by SJ2PR02MB10003.namprd02.prod.outlook.com (2603:10b6:a03:55c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 20:40:38 +0000
Received: from CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e]) by CH0PR02MB7867.namprd02.prod.outlook.com
 ([fe80::d722:d686:a9cb:6c2e%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:40:38 +0000
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
Subject: RE: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Topic: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Thread-Index: AQHdc5BowdVTxN3v+UOVrKAtGFYQercys2UAgAGcHgA=
Date: Wed, 18 Nov 2026 20:40:38 +0000
Message-ID: <CH0PR02MB7867295ACAAB522C41FF0762837A2@CH0PR02MB7867.namprd02.prod.outlook.com>
References: <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
 <179494518602.3136.1163755342884279987@kernel.org>
In-Reply-To: <179494518602.3136.1163755342884279987@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR02MB7867:EE_|SJ2PR02MB10003:EE_
x-ms-office365-filtering-correlation-id: cdd4dc60-93af-4d30-4812-08df45b4348b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|366016|376014|22082099003|18002099003|261009223027099003|261026140227099003|4143699003|261022105027099003|11063799006|56012099006|10067099003|261028144727099003|261022075727099003|261026121527099003|38070700021
x-microsoft-antispam-message-info: JVeXycJuKDwOB+fdXKEpmd5RBR8u3Rdzv6hxGMZfxVUfhWJ7k+MwAcgk+XH7LCd6RFDfMe916HFOrrnWyeW1sXuBKlIHauLOKeqDvJHhb+myPkeg/KBYAacy9AFOBhBYtOETcqIYFj+qRgmjk31Qqzw9J3RiqfwAzm63Fg8CIUE9FbHO/0VmHbBat/ss0QmtREu1uaCnDTAPdd+Qp7CRcteF5vMud4B7Dg+bjTIXCKohhnnUluVTKtNHkVFXyHvqvDx+hoctG7fVZVnpeiBFLzQv+TVAY5zb+eBfo5fzSlHEnu/OWhhZHcNuO7my4xEb9Qvd95HYGJqD+ZWB5jh2ls1tFrKxk+KL9+R7rqQQe2Wn+hAMjx1S/zw1oRDxnHM6UX/Xr8l4aBIfXSCS3txrVLikdvmKZE9wiVoJl6y34+kQMLYDoTQRUOC5LyMV++lB2r9+P2dqbVfUpfA/yHssU00LTMXeEjQLLKjBI4zBoI5ebPicXppDW9o5TZzl2UOdjv/leP6bVfRKCMsgypYlvjTiL5+YLjTHDg+m+rhhedPA5z0sXckHWwFjfhrcq/WS5hWD4JS7KRvin6cO+KWXwUDCImhqdxdGMKBbpdLMscy2CoIxeaD8ipdO2wm5OBhe2YwzWcKrXz0A55UA+bNpUsZG1kBptDiCIJagy7SCq/I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR02MB7867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(366016)(376014)(22082099003)(18002099003)(261009223027099003)(261026140227099003)(4143699003)(261022105027099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261022075727099003)(261026121527099003)(38070700021);DIR:OUT;SFP:1101
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1BYQnh3bmliNU5lWnZSTHpSYm1qVU92N0FLTDVDTzZPMXdtT0xHTXRFdkpu?=
 =?utf-8?B?bHRzWjdKbmdIWUdrdHArZ1pFWEhJY3Ria01yTThGY2NFZ2dVc0J1RVAzU2hs?=
 =?utf-8?B?SFBUVFRrOGQxS3JPK2swb2UxZGhTak0vWTVDN2RRY0V2RVJxYlk2dFJFaFlX?=
 =?utf-8?B?M2hiZDIweFBZLzVRdVUxNnNxRVlTNmFGTnRnb3hldEdMak90bEU4VDhhQjY0?=
 =?utf-8?B?SWxqdjNWcDZ2Nm9PbHpRcmtrTDh3TEYrTVcvdDZzQllQWHIzR1FhQk1sWXdt?=
 =?utf-8?B?ZWlQWE54MGVRdFplNjFVcEFWak9RbDRXMVBuYU9tNjdsVDhsZ2VjMGhiREJR?=
 =?utf-8?B?ZDJRdEdSZmQ2MldLem1tTlp3aEl3TnhYRldiOWNGVmk3MXc2QjJ3VHZhdk13?=
 =?utf-8?B?SFFjMUh2UWhzdFpSdHFXNWVoc0RsSCtrbTA5Y1g5cndQWkhnaXEyaXNWZCsz?=
 =?utf-8?B?RjBmendoWFByVFRITWhXVHhBdWFkdjlJTDNGSG5kY1lsWVZZak9hWE1GTExT?=
 =?utf-8?B?NjBXL1BQcXo2ZVZUTkZnTmNWS0F0Qm5ZS1FXR3QyZ3d0Y04rRjFjWkZBUlRS?=
 =?utf-8?B?ZkVicEtjRnFGWkRmeFR2RzBkbndqcC9JRnpwVVZQVmkvOHNoVk8vSHlwUDll?=
 =?utf-8?B?d1ZWRDRWVlZVdDZWR0F3dW5zQkxRTGh1K0dUM3BKYzRhclg2R0lDdW85VnBQ?=
 =?utf-8?B?V3Z0UlhKZ2FRdVMrUm9rdElPc0pLVnJiZFBtZERqemJ6bTZHbWx6bStJWlFl?=
 =?utf-8?B?SUZ0bXFNTnIzZ0hOcTAzc0szanZjMWRhQVhJWEw4OXJWUlNNTEFLV21ETWx0?=
 =?utf-8?B?a2hpY1dQM1ViWWhwekdZSERDeXFHWUJUNElOSm01NWlmVWQyNVFsTFY5RlJP?=
 =?utf-8?B?UXRlc1lBLy8rZmZoUlJLY1lSK2NsSlR4SDN6QWh1WGU3OFB1TFZJRDZJaCtH?=
 =?utf-8?B?cnhFS2k5UjNnUEVyOGpuQ0E0ZmE3Y0x3cGhPb0RhcFhrOVBnTE9henFsVlQ0?=
 =?utf-8?B?RmJKNmFRTVR3UnZyMUFRd0RVbHlZM3ZwTkFQOFM0UExkbytWaWkwYUdadFRW?=
 =?utf-8?B?OFBFZk9Faks5Rmd4a1V6UmgxRzYvNjcrZU5yTCs1K3dNSVBzd1pTWDZuRHFn?=
 =?utf-8?B?TVJKcWNDUjJSVEpXRmhJYmdtZGxZc1pzVUFVRW5UV1JndkZpNmlHQ2lLT3hV?=
 =?utf-8?B?TG1YMUtuRzZKOFdkaHo5REtpUWhnZVc4TjhMZ0YvdHM3YzFCWmRlS29KRkpt?=
 =?utf-8?B?MnMySldpYy81Z0Z2UmxhV2xrSVVjR2tKVmkwZ3d2SW9vOEZuSnFuYjdyVWpD?=
 =?utf-8?B?Nllocis3RU9YRW1aWW0xSlh0ZDNjWVVCbHZRdmFXcmJqY2VlWkpTeitKek5M?=
 =?utf-8?B?OU5lTUJiN0h4TzBhb1NmaDQ4eWxCYTdCRU01dEE3ZlVwN0pYdEhiY0tHMTAy?=
 =?utf-8?B?SXVoVStuZmcwVVdKNlNXc1JPMEJ5Nld5bFVBZ3h2VENhckltbzk3c0EzQnRU?=
 =?utf-8?B?SStYTXlJR2ljUkZhTlNpWERmRXViaUFzUXE4WWczdjdWSEhBajB0MmQzeFBN?=
 =?utf-8?B?ZEdSZDA2dGIrNG0wbVMxSEV5cGRzcUk5UE55QzdYaGdlUWJ2VEJvZjAvY3Bm?=
 =?utf-8?B?a0VndzYrcmwxWkQ5Skx4K1VQOEtBTTZYdk5CbzJMNjRLUWpMSklTVWRaQnZr?=
 =?utf-8?B?U3VtUmdIclNyNTJNWlFQZVd1MWFaZ2cwRUd1c3VqQkZsNFJvVTNqRWZiVVVs?=
 =?utf-8?B?aGdxcnYyRU5mbGdFUWNPMmRnVHE1WW1Kcng1SGY3RFY4SG9Wc0NhMVNpUFRJ?=
 =?utf-8?B?ZmZZZGloUGtSalZ4M3NLSTJlcWdNcFE2NVdjZ21Cc3kvK0dnQjE2Q2ZKSllI?=
 =?utf-8?B?ZU1JWEFuSUtDVjZVWmlDdFBFTDU2ZnJ4YVMwMzdDZTlzNlR1WXVrSStYZ0lL?=
 =?utf-8?B?M1Q0bXBNcEVWaElkaHJFcHVSdFpnSC9TSkNrc09FUm1iSzBLVmRudEZuaWhm?=
 =?utf-8?B?Z2NabXRtWERETnNIK0JOSHc4NkQvZzRwZ0F4WHlXV3p2RXJKU0dDVnkyNmdP?=
 =?utf-8?B?VVExKzAzMVNKWHliWHVQUDdMVXkzYlYwQmNGU0dVd0p2dG5LRUhTZTBaZUYw?=
 =?utf-8?B?MnExNDhyVDU0UU5PRUtsdFJGRVcybG9GcXZycXcvZDJSd09QbUxka2UxaUZ2?=
 =?utf-8?B?VDAzZjNwZVNPQUEvN0pWRExvaU1tL3B0RElhVldhTDVXUEoyYnNxTysvT0Uy?=
 =?utf-8?B?UWJIYjA4L092UlpKRkZGT0lRREpjMXhPb3p1alk4ZEJhb0RrR3ErOUNYV09J?=
 =?utf-8?B?VDNnSm95aHl1MFhQSXlGRzZSYlRUOWlBOUh3MWhmdDhGL25PSHpCWldSOG9t?=
 =?utf-8?Q?zKkGHWDDgW/I246Y=3D?=
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: p9pOjs4Z8IuCGTDT2HuSPtLXadwr+mIFoH5iTRUX7BTUCkXp5QDWpfMkUM457juWFI7mQN/Jxudbn3BRYBhPcH3l3UxVUAdo76XZQE3/oIvk/34CXVFBPqezOHVt0MeuQT0OlwGIEjJ58bqlc9KwYxOkxWCkbfyv4gOSUQz2QmDj5AvcxSaifivDvYIno76C2r/YvKXfrzzbNLNCV0brhWJdNid++qMaw6R66/rCOMHqcFjhUSXBaGhiKfV9+wpheh97Y/cP/ps7g40BbDbWA5KXjAAV6vDmr64xttWY7BfzAqocS+gpazxX25mpj4zpE+zHC8dAfnOv1ytrwwCl0Q==
X-OriginatorOrg: onsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7867.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd4dc60-93af-4d30-4812-08df45b4348b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 20:40:38.7598
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 04e1674b-7af5-4d13-a082-64fc6e42384c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wiInActq3+uz4bCdFqUDz1SfKxJ3swPKVGCRGNS4VTSQRzbe5ovYvgAAaniVY9cfnlSJoUUsg9sCw93C+48/C2cfsY/k7yebunaxue8xkbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10003
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qjPzCl2_VAe0cKlVQAU81EiNwtyiaep35IpjCL83T6E_1795034442
X-Mimecast-Originator: onsemi.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBuZXRkZXYtYm90K3Nhc2hpa29A
a2VybmVsLm9yZyA8bmV0ZGV2LWJvdCtzYXNoaWtvQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNk
YXksIE5vdmVtYmVyIDE3LCAyMDI2IDExOjUzIEFNDQo+IFRvOiBTZWx2YW1hbmkgUmFqYWdvcGFs
IDxTZWx2YW1hbmkuUmFqYWdvcGFsQG9uc2VtaS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
bmV0LW5leHQgdjExIDEwLzE0XSBuZXQ6IGV0aGVybmV0OiBvbnNlbWk6IHMyNTAwOiBBZGQgZHJp
dmVyIHN1cHBvcnQNCj4gZm9yIFMyNTAwDQo+IA0KPiANCj4gDQo+IA0KPiBbU2V2ZXJpdHk6IE1l
ZGl1bV0NCj4gRG9lcyAicnhfbWlzbWF0Y2hfZHJvcHMiIGR1cGxpY2F0ZSBhIHN0YW5kYXJkIGNv
dW50ZXI/IEl0IHJlcG9ydHMgdGhlDQo+IGhhcmR3YXJlIGNvdW50IG9mIGZyYW1lcyBkcm9wcGVk
IGJ5IHRoZSBNQUMgYWRkcmVzcyBmaWx0ZXIsIGFuZA0KPiBpbmNsdWRlL3VhcGkvbGludXgvaWZf
bGluay5oIGRvY3VtZW50cyBydG5sX2xpbmtfc3RhdHM2NCBhczoNCg0KDQpSZXBvcnRlZCBhcyBy
eF9vdGhlcmhvc3RfZHJvcHBlZDsgdGhlIHByaXZhdGUgcnhfbWlzbWF0Y2hfZHJvcHMgaW4gdmVu
ZG9yJ3MgY29kZQ0KaGFzIGJlZW4gcmVtb3ZlZC4NCg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1d
DQo+IENhbiB0aGUgMzItYml0IGhhcmR3YXJlIGNvdW50ZXJzIHdyYXAgYmVmb3JlIGFueXRoaW5n
IHJlYWRzIHRoZW0/DQoNCg0KV2UgYXJlIHVwZGF0aW5nIHRoZSBjb3VudGVyIGV2ZXJ5IDMgc2Vj
b25kcyBub3cuDQoNCg0KPiANCj4gW1NldmVyaXR5OiBNZWRpdW1dDQo+IENhbiB0aGlzIHRocmVz
aG9sZCBzdGFsbCB0cmFuc21pdD8gVGhlIGZyYW1ld29yayBvbmx5IGxlYXJucyBhYm91dCBuZXcN
Cj4gVFggY3JlZGl0cyBmcm9tIGEgZGF0YSBmb290ZXIgb3IgYWZ0ZXIgYW4gSVJRLiBPbmNlIHRo
ZSBjYWNoZWQgdHhfY3JlZGl0cw0KPiByZWFjaGVzIDAsIHRoZSBsb29wIGluIG9hX3RjNl9tYWNw
aHlfdGhyZWFkZWRfaXJxKCkgc3RvcHM6DQo+IA0KPiB3aGlsZSAodGM2LT5pbnRfZmxhZyB8fA0K
PiAodGM2LT53YWl0aW5nX3R4X3NrYiAmJiB0YzYtPnR4X2NyZWRpdHMpKSB7DQoNCg0KSSBiZWxp
ZXZlIGludF9mbGFnIHdvdWxkIG5vdCBsZXQgaXQgc3RhbGwuIFdoZW4gY3JlZGl0IGJlY29tZXMg
YXZhaWxhYmxlLCBkZXZpY2UNCndvdWxkIGdlbmVyYXRlIGludGVycnVwdCB0aGF0IHdpbGwgc2V0
IGludF9mbGFnLiANCg0KDQo+IA0KPiANCj4gV2hhdCBpcyB0aGUgUzI1MDAgVFggYnVmZmVyIHNp
emU/IENvdWxkIHRoZSBjb21taXQgbWVzc2FnZSBleHBsYWluIHdoeQ0KPiA4IGNyZWRpdHMgaXMg
c2FmZT8NCg0KDQpXZSBoYXZlIGJlZW4gdGVzdGluZyB3aXRoIDggY3JlZGl0cyBmb3IgbWFueSBt
b250aHMuIFdlIGhhdmVuJ3Qgc2VlbiBhbnkgaXNzdWUuDQoNCj4gDQo+IFtTZXZlcml0eTogTWVk
aXVtXQ0KPiBDYW4gbWF4X2FkaiBiZSBsYXJnZXIgdGhhbiB0aGUgUFRQIGNvcmUgY2FuIHBhc3Mg
dGhyb3VnaCBvbiAzMi1iaXQ/DQo+IFMyNTAwX1BUUF9NQVhfQURKX1BQQiBpcyBHRU5NQVNLKDI3
LCAwKSAvIDgsIHdoaWNoIGlzIDMzLDU1NCw0MzEgcHBiLg0KPiBwdHBfY2xvY2tfYWRqdGltZSgp
IGNvbnZlcnRzIHR4LT5mcmVxIHdpdGggc2NhbGVkX3BwbV90b19wcGIoKSBhbmQgdGhlbg0KPiBj
YWxscyAtPmFkamZpbmUoKS4gQm90aCB0YWtlIHRoZSBzY2FsZWRfcHBtIHZhbHVlIGFzIGEgbG9u
ZzoNCg0KDQpXZSBrZXB0IHRoZSBoYXJkd2FyZSBsaW1pdCBvZiAzMyw1NTQsNDMxIHBwYi4gSSBk
b24ndCB0aGluayB0aGVyZSBpcyBhbnl0aGluZyBlbHNlIHRvIA0KZG8gaW4gdmVuZG9yJ3MgY29k
ZQ0KDQo+IFNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vbmV0ZGV2LWFpLmJvdHMubGludXgu
ZGV2L3Nhc2hpa28vIy9wYXRjaHNldC8yMDI2MTExMy1zMjUwMC0NCj4gbWFjLXBoeS1zdXBwb3J0
LXYxMS0wLTdhMTg2MTQxOTUyYyU0MG9uc2VtaS5jb20NCj4gPGh0dHBzOi8vbmV0ZGV2LWFpLmJv
dHMubGludXguZGV2L3Nhc2hpa28vIy9wYXRjaHNldC8yMDI2MTExMy1zMjUwMC1tYWMtcGh5LXN1
cHBvcnQtdjExLTAtN2ExODYxNDE5NTJjJTQwb25zZW1pLmNvbQ0KPiB0ZGV2LWFpLmJvdHMubGlu
dXguZGV2Pg0KDQo=

