Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.108
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794498271;
	b=eCI3HyB0R9fHnrW1+XWEXKqKnazuFYm09GipXoCkyi5TqdPypjQLeP/O1l859Ikn8AlX
	 UlTsklSkECecyp/dMCJIZW7ebDtE5Xoz3zWR3eBXkgUpvHdwazPQIApOiCLc+myels1GR
	 alAcYXLxBY/u4F/cBUDKCXS1jOjaMMVlyOLj0XfcD4zeY5xpFlPiNj6DMmMiJsI56BnS5
	 1cPKeUNNdoZnDnTt9RE1LGZNm1Yn394FjARjvC0vdR38u7BCEn4FfbltW+XYlAsyLUEV5
	 wbecV1I84x0lZZ0r+DdQ5lQ9ASyydtIFD3IxeLU411Uc0NVMyHqN+Hqfs7eWORBrXdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794498271;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Nc5J6qGOel0AhVYR8OXaCxYvr4fYZpuSYgjprWuH9gI=;
	b=XlE+EuTKc/6Zyr3Vmg17S9hKGH3b7kjsT/JUXIa2l7soZAFQQ32n1xPEZ48k7/4v3BJz
	 dUV5m/SQCKddeWy/BhXNLOWZacn9hgCrpFMosXMvyGM3DGyqm5GHl1kDNSA75EI1wfOMN
	 9bAq8EfjFTHp09yzmuJRQngqvx9ZK6VzdMfMjdQFJM5TAX/74R6scY3f0f8hp0Wx/st5P
	 rmqKSz654yhfITnPTECZeNZAW2A8IR/Bogxt7GQJJ2tNq0hz1oQFZTXJj9sWtB0zFrsaZ
	 lC0V5NjZDuLpkmHuUdDusOzgLp4hqaO+xwptUTXmUlS0KgacYv8JgTrD+ovkSjIAJcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=htecgroup.com;
	spf=pass smtp.mailfrom=htecgroup.com;
	dkim=pass header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b="IJU/V1CW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.108
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021108.outbound.protection.outlook.com [52.101.65.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7687606A33D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7687606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=htecgroup.com header.i=@htecgroup.com header.a=rsa-sha256 header.s=selector1 header.b=IJU/V1CW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ne/PeuBhgxCl4wQXXmpZIXTj1BfPFt9ttAMdsyYcPf7ix2XcoAxRUrTtQHrCM2KuieKB6c2EGQ1NHGxsQoteBeKoIO/nkuj6fHN3awwfcKRrHsqSPG/TJ55qR9Nd4bkVZ/c5hweiALaAYm9hxLN3QPKMHw53s6cZYHyzTqnijvvHuMQGgoQqbD/AMarMXX7Y+VEQTM1mX65kl+HsiWST63nADyxiHy1Lm9+A+vJ1fpJP8HK0DkJAE35R9aKFKp6wWhaS06p87Wno3FgTO+o1OYX8Spi5ua4Tew5Ia2vOeTAlT882YH74IYMfbl3j5yBg18RP/YvyDQlLXkjWdgRfDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nc5J6qGOel0AhVYR8OXaCxYvr4fYZpuSYgjprWuH9gI=;
 b=KlPf/pfgVd4vr6STTaDoXSok2uAuchfpoOVNKsHJ8O/V+ZShsK+gNOwa+r6DzXI01+9waO8MUZMrDFxN/egUzxt8v9EL9WTRgZOeLrNKXwP3jOsmij2DN5b+L9JFmn2mQNRPK54hcHMeC916pbOlFlu31X5yU6UKle9odGtdcVwjMxcRW4ail+EwLUjL62ZMO0GgIFB3Sr1whOAiCj7UNenHFFzi2dG3LUk4d7YhFQGzGJmb4rTgVAxehM2aGXfLc6bmRfWUxrjtEjvxJhQ657OCBntO8QEwSFwYAnHBiHuCNB3AB4dNu40d5RgFm1OemxGExv0kuoVYGXy86DDCNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nc5J6qGOel0AhVYR8OXaCxYvr4fYZpuSYgjprWuH9gI=;
 b=IJU/V1CW54rcORPB1xI4kXhcwKAYl/JT54h1AjgrgndPMLqVv3yZJj8Tb2rYdowzq684EXzXkZtjKV2T22mLOxwIOxTQ9Aj2d/jsGZs6GdZv7ZDMyRweRB4Nbgkewb0sNGs8XbZE77PT+yMQfvPcpxIaR2Vyxsq4u2ghWSYYUJ6/gwGEA7MqgG+zlKAKS05cNXLsnNjdByqyCPIdpVtNFHRC1HPE8fPVuEcgqhAqHXLm3Cf9JIQUWtS03qVEJiskbP2X7Owtk/t0HlZBwfFTAenGbezh9XbuF/2Rg+DYY9p421sBUy9PLjTHvxXgpf/HtTDdk1G6oAeb+tn9cVzqNA==
Received: from MIWPR09MB510283.eurprd09.prod.outlook.com
 (2603:10a6:290:de::18) by GV2PR09MB8779.eurprd09.prod.outlook.com
 (2603:10a6:150:351::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 15:44:24 +0000
Received: from MIWPR09MB510283.eurprd09.prod.outlook.com
 ([fe80::b132:b89e:3800:bc14]) by MIWPR09MB510283.eurprd09.prod.outlook.com
 ([fe80::b132:b89e:3800:bc14%5]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 15:44:24 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "conor@kernel.org" <conor@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"asrinivasan@oss.tenstorrent.com" <asrinivasan@oss.tenstorrent.com>,
	"chen.wang@linux.dev" <chen.wang@linux.dev>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "dlan@kernel.org" <dlan@kernel.org>,
	"fustini@kernel.org" <fustini@kernel.org>, "guoren@kernel.org"
	<guoren@kernel.org>, "inochiama@gmail.com" <inochiama@gmail.com>,
	"joel@jms.id.au" <joel@jms.id.au>, "junhui.liu@pigmoral.tech"
	<junhui.liu@pigmoral.tech>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"mpe@kernel.org" <mpe@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Thread-Topic: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
Thread-Index: AQHdcZorxYkHODgoa0yhH07TFGwZQLcoZqMAgABBwoCAAe3CgA==
Date: Thu, 12 Nov 2026 15:44:24 +0000
Message-ID: <1605ed3f-8078-4ea6-a3a5-b4a3227c0961@htecgroup.com>
References: <20261111-paralyze-ellipse-dfc194dbe39f@spud>
In-Reply-To: <20261111-paralyze-ellipse-dfc194dbe39f@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MIWPR09MB510283:EE_|GV2PR09MB8779:EE_
x-ms-office365-filtering-correlation-id: 43b48c69-1f93-4363-957f-08df40d3d3a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|22082099003|18002099003|6133799003|261009223027099003|261102123227099003|11063799006|56012099006|261026121527099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 UORoGEoefGl3pHvdcepAAFTJMXbODXsSBR8adsV3t1BmPbe9tFgfOh3wctPsrty+Q5spKaiNqfiDPCNF3uB9+DqiSNE84r/1X4/bUFePoQDY+DeLk0gjDMt8gZaQVMOI4U7WV0rw6lP3zDYVJ01jWakvB41t7QY2t6U3if1wLZ/MJpAxT/mVFS3KJAxE6m1EOCxvlLHiQGNP3O2hhoYcvIryddZLSOcrSBVtdiZ56VY+jEnzcqATi3XJ+1qDbLMbFXmez/vmuys6LvfKmAcZIg8MmZGwJppSiVpWg5dxky/NpjHBuIkhQW1DkWcMqoCqXGGjtu8JUATBkGsf5VLzDWe4IO5G3qv63ktRbdMm81sLC5S/KFbM/UTX6v4qITN46hOM+nSYIfGsGSDzQaI3B/mjUsd5N5QYPVlnXF/q0fX0OQAYwI8Q/6ZOFsa8juocTVl5zXJNb3wDLTbO33hjZ/UiPqpED1D/gB52mDSU7mOKHkPyad9Hr05fxP06GDf3UvbAbDHD4L1A8U4lgEQgZ/AP4uMa1WhxuZj5XJpF0BYayCXX69NJzrbb0phb/F/z6Rr4o82BX/YpRd86JXrbXkKjrQBINdyFjohQj9sQsqTE99w6pfz3oCjw0BEQbUBTkjxCAHGCSzmOKvEB07m3F12G8iZXcy9paDsojG9mfRU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MIWPR09MB510283.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(261009223027099003)(261102123227099003)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2MyajdSc0ZtZEJTdTNWSlZmU3FQLzBTdmJoc1dmRUdadlc1cVJSeXZPTTF0?=
 =?utf-8?B?blNET2FZQWQ5MnN1dmNCU0VqNUc1VXZOWkxjVEY4WTd4OStDQ0pCVU9VUHVJ?=
 =?utf-8?B?WUpobnVQbDdLYjM1RXcxZVdGSlJReTM4ZTluTUpIUmtudUp2c043OU9DblJR?=
 =?utf-8?B?ZjNkM0xMNFFyV2xMSTRFZ0ZoMyswa3VOQkRGY2ZWODdKNFRpRHhBR0twQlQv?=
 =?utf-8?B?TW5yNFdYWTZqN09acjBTaDFRaTdZcWNXR2NTeGE0ODdCRVl5aVd1dFdmRVp2?=
 =?utf-8?B?MjdKUjAxMUhUelExbCtITzFxam1SMUJYMjUyeU9SaFhvNmdJTW5KYmRrblli?=
 =?utf-8?B?RWhqeE9RZ003RXh3bmhnUHUzR0xaWmJjcGdlT0Q3U0xTamRpb29MQncwS0cy?=
 =?utf-8?B?b2ZVWGVsT2hKQVVydXpyZkRjWXlYbCtjVzZ1NzZkUWJ5YzNvWmsvc3BmR2to?=
 =?utf-8?B?YlRxVXRJYVpCc1kxSlpCckc2Y0JoRGF2cFQ3ZTl3R1VVV2pxQjgxYXd5cG4y?=
 =?utf-8?B?Vno2dnhMVlNQWXpVTnBJYXNSSzlVRHFxc3ZMS2hrTExKR0hPelNnWVBWbTQx?=
 =?utf-8?B?VjBML2ZWcWpyZ1BFL01RSkhicGo5UUNGcExGWGRrK04rODhQUFRnRmNHNjcy?=
 =?utf-8?B?Y1JnYlNicnFqeSt2TkpMQlkrVXRIL3ZUZ2FFb3E5RmtLdm8vV2F1VG5GNVRX?=
 =?utf-8?B?dnhKMTR4dzkraHdCcVNjQ2RRam9VdDVLdmdnNitqMWxRdWFmaWU3MVRmbGM1?=
 =?utf-8?B?cEJQRFVjakVscFA4TUthd1FYYUYrWDBLWnVrOGlqZGFRYmkyRmhrdjJKd3ZT?=
 =?utf-8?B?ZTJ6ZEZzZFhVY1JoeWcwaUNLL1I4cTBTZytmNFo3cU5JKzRncmhLSjF5dXpN?=
 =?utf-8?B?ZHo4eVMzZnFnaUlSeWdUTFZvYnA0Ni8wbmRKaS9QV2ZqdGN2bGtSRm9VZlp3?=
 =?utf-8?B?U3dqdys5TWYwSjFuTlhNekFZanNOUHJTMVRIeHdkb25WTE1aUStlYStKZ1JE?=
 =?utf-8?B?L1NKd250WXdhSVR0UWdyTDN5YXBNcHF0WkorYzU1VlR2MzZhb1A1ODF2bVl1?=
 =?utf-8?B?MjEvUERRdWpjbDZuZzltVlRWb2hqQ3JEWHVUTW9zdGIxYUVzc1I5V1BOcUs5?=
 =?utf-8?B?cXZJSk1oZEFERjhhMlMvK2s1TDNoS1VrSHdtV1l4bnlyQ3pWTk0wL2hMeks3?=
 =?utf-8?B?SEhvUFkzUVQ4ckQyQTVKL09Yd01JQjdIa1dnWlBpdE1CNHhaT1plMXlJc0Nk?=
 =?utf-8?B?aDJubG1WZWNMT0l1QmJ3K1RKTUk5KzA3U1c4WFhyYWxIa3lSTDl5ZXUvdHBu?=
 =?utf-8?B?clNrRmZtM1RNT1ZwRDVBRGhhY0gwNkdtVVlUNktsaTRTbU1vUWdpcHQxYmhZ?=
 =?utf-8?B?R1Y2clFlSWxvLzhNQUZCVyt6aGpJeHpUN2RpMXBWbFBYSnNaS21XQ3JqRWhD?=
 =?utf-8?B?Vys3ZWtiTWVvSWhyUy9WakdYTDhMV2QwWmF3b0tQd01kaTZTMFRubE15bmRq?=
 =?utf-8?B?enNsQUJWdlZVd1BrOGQxeW41ZkJxekJmdUxIVStvOTg4ekczUk5jY1RHUlU2?=
 =?utf-8?B?VDFFR2hHV0t5azUyNFJBZ3RLSi8rVzY2anJOQ1ZhVHluYVIzOUxTTTdjMnRt?=
 =?utf-8?B?RDk5UkVvamdKTWRxYXJRL3FFaHNRek9TRzhuRXB0M0hEVllRSjJBZVkyc2JC?=
 =?utf-8?B?Zmtva3NFYmhqUDVvQmpmdys2cjB6RFhMcklXR3l4aFl2OFEySExGcUN0Z0h1?=
 =?utf-8?B?M2NqUzNmWWdkMys4MEd0bjRURWFkblVyWDNhWmVVVDFuL0pac0YwWFJMOHpr?=
 =?utf-8?B?WlRsbVhTSEJGRE8wYklTYWtJbU9kK29HK0YrSlpLdURIbXRpbjV1a1JJMUJ5?=
 =?utf-8?B?azNKY0MyeW5pS095RGtINTJLYnFCeWNnS2ZHcUJQa1NyMGJIbHNqQXdxM1VS?=
 =?utf-8?B?eHZCQmFWazFUWmRHQWc0Mk1TNnF3M3lPQ09mV3lsaFg2UWtDTkJtOGMwemlp?=
 =?utf-8?B?TEhIKy9ONFVEd2txUVB3ZkNqUjczQWFuekh1aDJjcFVhc0kwVGRSQmZKUENM?=
 =?utf-8?B?UzAzSXYzYy9EZ3lyNlQ0QlNCam84RURDOWlFUkNickhxbU9JQmxUR21EL08z?=
 =?utf-8?B?Q3dteituZzVhTGNZOWRUTnVRTWR0Mi95eHE3Q1oxTngwQitYS2tVN1pWWlpN?=
 =?utf-8?B?a2YvcktJcUFrOHdmR1M0ZGhvN2c0Vk10ZkFraXNrVnNRZTFiSmh6WVh4WHFH?=
 =?utf-8?B?SGV3akRhcFlEYWhrOVRsUG11VHlFUGxrSVFYNmxEUDhzNE1MWThwWE1qaitH?=
 =?utf-8?B?djdsSURNMUlzTzRra1ZvakFpaVpaQVA5R0FGYi9xckF4RFNYVDZWbGJRRTZL?=
 =?utf-8?Q?u3kTJcxIC5ql1Sb8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59AB5F80DFE04E4BB535918C6B992362@eurprd09.prod.outlook.com>
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
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MIWPR09MB510283.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b48c69-1f93-4363-957f-08df40d3d3a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 15:44:24.2740
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbR+ynmHbnOvAXDYo1L/+YziDD/yMNlBUxUECzIkui3yaHOELB2tTYXB/SEpKLnDlYqiSlTun+zxU/4MRDX+Nf46ngRC4SrX1ivrvx60qGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR09MB8779

SGnCoENvbm9yLA0KT24gMTEvMTEvMjYgMTE6MTcsIENvbm9yIERvb2xleSB3cm90ZToNCj4gT24g
V2VkLCBOb3YgMTEsIDIwMjYgYXQgMDI6MjE6NDRQTSArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90
ZToNCj4+IE9uIFdlZCwgTm92IDExLCAyMDI2IGF0IDAzOjM0OjI2UE0gKzEwMzAsIEpvZWwgU3Rh
bmxleSB3cm90ZToNCj4+PiArY2MgcGVvcGxlIHdobyBtaWdodCBrbm93IG1vcmUgYWJvdXQgdGhl
IHZhcmlvdXMgaGFyZHdhcmUgdGhpcyBiaW5kaW5nIHN1cHBvcnRzLg0KPj4+DQo+Pj4gT24gVHVl
LCAxMCBOb3YgMjAyNiBhdCAwNTo1OSwgQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3
cm90ZToNCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1l
ci9yaXNjdixhY2xpbnQtbXRpbWVyLnlhbWwNCj4+Pj4+ICtwcm9wZXJ0aWVzOg0KPj4+Pj4gKyAg
Y29tcGF0aWJsZToNCj4+Pj4+ICsgICAgaXRlbXM6DQo+Pj4+PiArICAgICAgLSBlbnVtOg0KPj4+
Pj4gKyAgICAgICAgICAtIHRlbnN0b3JyZW50LGF0bGFudGlzLWFjbGludC1tdGltZXINCj4+Pj4+
ICsgICAgICAtIGNvbnN0OiByaXNjdixhY2xpbnQtbXRpbWVyDQo+Pj4+IFNvLCB3aGF0IGFyZSB3
ZSBkb2luZyBhYm91dCB0aGVhZCxjOTAwLWFjbGludC1tdGltZXIueWFtbD8NCj4+PiBPbmNlIHdl
IGFncmVlIG9uIHRoaXMgYmluZGluZywgSSBwbGFubmVkIHRvIHN1Ym1pdCBhIGNoYW5nZSB0byBi
cmluZw0KPj4+IG92ZXIgdGhlIGRldmljZXMgdGhhdCBpbXBsZW1lbnQgdGhlIGNvbW1vbiBiaW5k
aW5nLiBJIGNhbiBkbyB0aGF0IHVwDQo+Pj4gZnJvbnQgaW5zdGVhZC4NCj4+Pg0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgcmVnOg0KPj4+Pj4gKyAgICBpdGVtczoNCj4+Pj4+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBtdGltZSByZWdpc3Rlcg0KPj4+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IG10aW1lY21w
IHJlZ2lzdGVycw0KPj4+PiBGb3IgZXhhbXBsZSwgSSBub3RlIHRoYXQgeW91IGhhdmUgbXRpbWUg
YW5kIG10aW1lY21wIGluIHRoZSBvcHBvc2l0ZQ0KPj4+PiBvcmRlciB0byBob3cgdGhlIG1pcHMg
Zm9sa3MgaGF2ZSBoYWQgdG8gYWRkIHRoZSBtdGltZSByZWdpb24gdG8gdGhhdA0KPj4+PiBmaWxl
Og0KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjExMDMtcDg3MDAtZHRzLXYy
LTYtM2FjNWQ0OWYyYzM3QGh0ZWNncm91cC5jb20vDQo+Pj4gVGhpcyBpcyB0aGUgb3JkZXIgT3Bl
blNCSSBoYXMgdXNlZCBzaW5jZSB2MS4wLCB3aGVuIHN1cHBvcnQgd2FzIGFkZGVkDQo+Pj4gYWJv
dXQgZml2ZSB5ZWFycyBhZ28uIEl0IHJlYWRzIG10aW1lIGZvbGxvd2VkIGJ5IG10aW1lY21wIHdo
ZW4gdGhlcmUNCj4+PiBhcmUgbm8gcmVnLW5hbWVzOg0KPj4+DQo+Pj4gIGh0dHBzOi8vZ2l0aHVi
LmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS9ibG9iL3YxLjkvbGliL3V0aWxzL3RpbWVy
L2ZkdF90aW1lcl9tdGltZXIuYyNMNzkNCj4+Pg0KPj4+IFFFTVUgYWxzbyBnZW5lcmF0ZXMgYSBk
dCB3aXRoIG10aW1lIGZvbGxvd2VkIGJ5IG10aW1lY21wLCBhbmQgd2l0aG91dCByZWctbmFtZXMu
DQo+Pj4NCj4+PiBUaGUgTUlQUyBvcmRlcmluZyB3b3JrcyBiZWNhdXNlIGl0IHNwZWNpZmllcyBy
ZWctbmFtZXMuIE9wZW5TQkkgdXNlcw0KPj4+IHJlZy1uYW1lcyB0byBwYXJzZSB0aGUgcmVnIHBy
b3BlcnR5IHNvIGl0IHdvdWxkIGNvbnRpbnVlIHdvcmtpbmcsIGJ1dA0KPj4+IHUtYm9vdCB0YWtl
cyBpbmRleCAwIGFzIG10aW1lIGFuZCBpZ25vcmVzIHJlZy1uYW1lcy4NCj4+Pg0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgcmVnLW5hbWVzOg0KPj4+Pj4gKyAgICBpdGVtczoNCj4+Pj4+ICsgICAgICAtIGNv
bnN0OiBtdGltZQ0KPj4+Pj4gKyAgICAgIC0gY29uc3Q6IG10aW1lY21wDQo+Pj4+PiArDQo+Pj4+
PiArICBpbnRlcnJ1cHRzLWV4dGVuZGVkOg0KPj4+Pj4gKyAgICBtaW5JdGVtczogMQ0KPj4+Pj4g
KyAgICBtYXhJdGVtczogNDA5NQ0KPj4+Pj4gKw0KPj4+Pj4gK3JlcXVpcmVkOg0KPj4+Pj4gKyAg
LSBjb21wYXRpYmxlDQo+Pj4+PiArICAtIHJlZw0KPj4+PiBZb3UndmUgYWxzbyBub3QgbWFkZSBy
ZWctbmFtZXMgb3IgaW50ZXJydXB0cy1leHRlbmRlZCByZXF1aXJlZC4NCj4+PiBUaGF0IHdhcyBp
bnRlbnRpb25hbC4gQSBtdGltZXIgZGV2aWNlIHdpdGhvdXQgaGFydHMgYXR0YWNoZWQgd29uJ3QN
Cj4+PiBoYXZlIGludGVycnVwdHMgKG9wZW5zYmkgc3VwcG9ydHMgdGhpcyksIGJ1dCBJIGhhdmVu
J3QgY29tZSBhY3Jvc3MgYQ0KPj4+IHN5c3RlbSB0aGF0IHVzZXMgaXQgdGhpcyB3YXkuIEkgaGF2
ZSBubyBwcmVmZXJlbmNlIGhlcmUsIHdoYXQgZG8geW91DQo+Pj4gdGhpbms/DQo+Pj4NCj4+IEkg
dGhpbmsgcmVnLW5hbWVzIGlzIHJlcXVpcmVkLiBUaGUgc3BlYyBhcmNoaXZlIGRvZXMgbm90IHJl
cXVyaXJlIHRoZSBjb3JlDQo+PiBpbXBsZW1lbnQgYm90aCBNVElNRSBhbmQgTVRJTUVDTVAuIFNv
IHVzaW5nIHJlZy1uYW1lIHdpbGwgbGV0IHRoZSBEVCBwYXJzZXINCj4+IGRvZXMgbm90IHJlcGx5
IG9uIHRoZSBvcmRlciBhbmQgbGVhdmUgdGhlIHJvb20gZm9yIE1USU1FQ01QIG9ubHkgZGV2aWNl
cy4NCj4+DQo+PiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHNob3VsZCBhbHNvIGJlIHJlcXVpcmVkLCBp
dCBpcyBraW5kIG9mIHdlaXJkIGZvciANCj4+IGEgemVyby1pbnRlcnJ1cHQgdGltZXIuDQo+Pg0K
Pj4+PiBJIHRoaW5rIHdlIHNob3VsZCBzd2FwIHRoZSByZWdzIGFyb3VuZCBhbmQgbWFrZSB0aGVz
ZSB0d28gcmVxdWlyZWQgYXQgYQ0KPj4+PiBtaW5pbXVtLCBidXQgYWxzbyAiaW5pdGlhbGlzZSIg
dGhpcyBmaWxlIGJ5IHJlbmFtaW5nIHRoZSBleGlzdGluZyBmaWxlLg0KPj4+IEJyaW5naW5nIG92
ZXIgdGhlIG90aGVyIGRldmljZXMgc291bmRzIGxpa2UgYSBnb29kIGlkZWEgdG8gbWUuIEFuZCBJ
DQo+Pj4gYXBwcmVjaWF0ZSB0aGUgc3BlbGxpbmcuDQo+Pj4NCj4+PiBUaGUgbnVjbGVpL2FubG9n
aWMgYm9hcmRzIGRvY3VtZW50IG10aW1lWzFdIHN1cHBvcnQ6DQo+Pj4NCj4+PiAgLSBudWNsZWks
dXg5MDAtYWNsaW50LW10aW1lcg0KPj4+ICAtIGFubG9naWMsZHIxdjkwLWFjbGludC1tdGltZXIN
Cj4+Pg0KPj4+IEszIGhhcyBhIG10aW1lIHJlZ2lzdGVyIChhdCAweGYxODFiZmY4LCBieSBleHBl
cmltZW50YXRpb24gb24gaGFyZHdhcmUpOg0KPj4+DQo+Pj4gIC0gc3BhY2VtaXQsazMtYWNsaW50
LW10aW1lcg0KPj4+DQo+Pj4gTUlQUyBoYXMgaXQsIGFzIHBlciB0aGVpciBwYXRjaFsyXToNCj4+
Pg0KPj4+ICAtIGdmLG1pcHMtcDg3MDAtYWNsaW50LW10aW1lcg0KPj4+DQo+Pj4gTm90ZSB0aGF0
IE1JUFMgaGF2ZSBtaXBzLHA4NzAwLWFjbGludC1tdGltZXIgaW4gb3BlbnNiaS4NCj4gL3NpZ2gu
IEFsZWtzYSwgY2FuIHdlIHNvcnQgdGhpcyBvdXQgcGxlYXNlIGFzIHBhcnQgb2Ygd2hhdGV2ZXIg
cmV2aXNpb24NCj4gaXMgbWFkZSB0byB0aGUgbXRpbWVyIHBhdGNoIGluIHlvdXIgc2VyaWVzPw0K
UmlnaHQuIEkgd2FzIGhvcGluZyB0byBhZGRyZXNzIHRoaXMgaW4gYSBzZXBhcmF0ZSBPcGVuU0JJ
IHNlcmllcw0KYnkgZXh0ZW5kaW5nIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlcnMgd2l0aCB0aGUg
bmV3IGdmLHA4NzAwLSogY29tcGF0aWJsZXMsDQp3aXRob3V0IHRvdWNoaW5nIHRoZSBtaXBzLHA4
NzAwIG9uZXMgdGhhdCBhcmUgY3VycmVudGx5IGluIHVzZS4gRG9lcyB0aGF0IHdvcms/wqANCg0K
QmVzdCByZWdhcmRzLA0KQWxla3NhwqA=
