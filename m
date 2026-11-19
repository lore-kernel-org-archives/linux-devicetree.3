Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129096;
	b=eLmUIRTPnGAL43+ZtFxgMhbGLHSUZiahmmFppuMB6ep/Sep1SmmaEnASUqUEAqFHZ7w+
	 rXnAjl4nEztsaa8KrM6ylCijsD9j5XBDEQXnBMdIaTrAxlJ7tDnecLiy9nzTtG06NKUxB
	 V53hd6PLESi6z2oibhuaW1ETUh1oiq0OExmzd8y84espo8QlGuja8KQqmy3FevvjvHr01
	 yj1TJKevFalU21lRjEXpJUJ18WXa/tsxPsWXp8agKHyU9jaP3VbtLXLKc9Peyf+/RPcyD
	 mC90oMA7UOA6IBgF1gToBpCnF52cUZ2PHIn59H9Qa5A9aKzLrJL76cW02TJu44XVoJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129096;
	h=DMARC-Filter:DKIM-Signature:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MDID:X-PPE-STACK:
	 X-MDID-O:X-PPE-TRUSTED;
	bh=MIxt9fp9PLSBDxWeImC3Er/VbbGuKia081LuLEb2Rgk=;
	b=GZumhpYNf13tfCrxzaY081vf5YdTAgP55MmCSXTv9vt7WMTGsTSt19S+XkmxaWWBGIMV
	 LJDiz/kGcherTmw+KqeiPnLL/UUShx+ejTNnijGkDcoxvbKWUaUSXELv/n40J7aldWrEB
	 UwyJZ8iOzVlttXORZ64S+uUjM1vj+aDhdJdj1ip4Kbm4panrub00rUi4ascDOZ1umviLc
	 9kIb0T83GD5x/hXBip0b5BnqAXgMZp8gunNOn/Dw1m8bRf1LO3PKxN36yJdknvh5kqMY5
	 uNHU16gyhvbjMipmpo0NKWgK7VZ1HTmPZV/WhHkaYSu3H4c2qxuWBd0jisXueeeQc5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=FD7+JsE6;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=zCf8CLjH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.48
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870660A3811;
	Thu, 19 Nov 2026 22:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5870660A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=FD7+JsE6;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=zCf8CLjH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=MIxt9fp9PLSBDxWeImC3Er/VbbGuKia081LuLEb2Rgk=;
 b=FD7+JsE6imxempUzDhP9EARN4HWEw1ZyexfTI3AgY1dAet+gg9KlhEL1mGWeRkpW44k5Y38edN72nuXsK3UmWfirl5B4oWKm+UdGedgTbx15YOIZFseHuc4YMdSS4Mh24keobb3TKTaZ6k6S7b/2Hzg/Kc4qyLaxmfHzrM+p9vynXKM3DSnRqNe023zg/USn4ffqwUc7G8O50c/jow7V2kSY5pGlNWfUttXDsukwFRjY2kZFkaDTdw6IdnDYQGGd9u9+H+8bDHENo2GcZi8dDZqJZNEypcoExbwarulMHoHVi/joWQK5Ndy+Q47w2OhW906Cnb4DVBDtvSCD6yZYNg==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 99EEFC40064;
	Thu, 19 Nov 2026 22:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2qMwU7blXq6FFbQ4dyuhSQ6AgYsCXJMO7sU4L2CAKGfg+4gBF+JiQUZhfw5MBwIBzeMR+TUo6fz6gyx1/xZxZuOVURAcbyUjPuN78RVALV/OZ95jd8hw9LLkGE7ybCW9g35nDexpYDXwh1SHzXIWOET3MN2Olu+ERdLHaaq4oeNNa1KtCn0VZk0vcNGGORgUnhRN7TrZBqMMKISHLScrrBphZ0yFTpHiXjtJ3nXyqNrQWkrl7We8Kw6tBKOpKggrE4msgdGqvfr3NXOiNQ2e+YNIGa3qizVbdhtUI4lSwl0J7vvN0H2vVeCti0Ih62hJ/VjQtgdFgq2qjSKIjKFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIxt9fp9PLSBDxWeImC3Er/VbbGuKia081LuLEb2Rgk=;
 b=E18xxx3F9he/hK5d0IPtMHWhhE2gWXaiEpL/ikmQdoCCLmU55RN2xtqa5taxbRDorv4RsR+jj80n5ehlU5f1WlZ9whFmKtsPz3UyxvhRt+oU2VwOkS+Z5qZ8OGU6k18jKt2vLbbAh6XsyhZ3tOvAu8+s3ETmMpD7aAmTH0ApG35iE3l3EkNmujhNtWYmKhoWix69kezOl+2hREhNZkHqPYw6gvqyYGQ0qmj1q4HhaYqy/Ng6cqqn/Bhb4r+R2kjyDf+eS80rBfRFPP67C0JRBPtsN6Y8F1tHWxATjKE1zGA63wK8uJrXTzalkscWGLTv57OZ9TVW7pckPMxnj+tF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIxt9fp9PLSBDxWeImC3Er/VbbGuKia081LuLEb2Rgk=;
 b=zCf8CLjHVazoMMwK6O8hpuWiiyONBZtQL4PivOsSzJU/IOzUiTYFW/LDjK2C7nwsYP5onKMhvwOgxHGinch8+5opxmE0Lp6kLU+Q71uYOQDBrIOCGzicKDvFhtjBQ6mou9rau5iZPJfxHT55HIWAlV4txmNlJvUFnMSL2AbS5MxCRZZBiECVz7ifgFmYBPxSaE+igSkVSD2YWq5Bq8mqSgkPtzOg5+QCulHH7Y7ObUKJZxXMJDJAMQ9xS1QJAtfasBiZKPsFN+e+Ofn4nQ/by0dtJ+AWraoyvWEjAx5qIIkTjtp8Ghv4cZdgmdZicBkRYni5tc9AjvhBZyv9+jkA/g==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by SA5PPF6C2DD1D15.namprd20.prod.outlook.com (2603:10b6:80f:fc04::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 19 Nov
 2026 22:58:05 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:58:05 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: "jiri@resnulli.us" <jiri@resnulli.us>
CC: "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>,
	"ivecera@redhat.com" <ivecera@redhat.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "cjubran@nvidia.com"
	<cjubran@nvidia.com>, "Oleg.Zadorozhnyi@devoxsoftware.com"
	<Oleg.Zadorozhnyi@devoxsoftware.com>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v16 12/13] dpll: sit9531x: add support to get phase
 offset on the connected input
Thread-Topic: [PATCH net-next v16 12/13] dpll: sit9531x: add support to get
 phase offset on the connected input
Thread-Index: AQHdeHltTTnyNCyqLEueoCssDMpygg==
Date: Thu, 19 Nov 2026 22:58:01 +0000
Message-ID: <20261119225752.41846-13-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
In-Reply-To: <20261119225752.41846-1-arouhi@sitime.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR20MB994924:EE_|SA5PPF6C2DD1D15:EE_
x-ms-office365-filtering-correlation-id: 91f22132-4061-4c9c-1a1c-08df46909277
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261028144727099003|260925021911599003|260925021311599003|260925022911599003|5023799004|261021135927099003|56012099006|261021123027099003|261022105027099003|261022115727099003|261026121527099003|261022113327099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info:
 D04fWMmmWj40/vTvI8/zkmNoWF9aDt2F2VvHrYmAbyLPBmO1pN/kJSV3xHiDlgaVh5kEucnaXqWQCUVkx/bIGrODBCFeVr9dlavSOBnKmz+anc/fklSb5/oeXmjrZmOyWHOVW/ldG6r0IvJSbLsFeDoQKoWzg+zxSPBNKlCiolg7DTO6fbTGxjc0Rc24yufX3drgPsy4dK6WeiQF73hAgFMIrYkrlethFakVo5/Fb9YKxTQYf9hSvqmvZWfu/4gzs17zM1krMB5v5ZnVurL5G34uaB0aBRWuqlJ/9CREETXWXSQyn0IUZ0Vi7+zaT+XXaxk9BFLCdSv+OZdkwmhh/O2tgDCcI/NHx2tdm0W+ZwjXAiAdsFAlQDCELTCJpSpus4KxaAeO1GicjDXPFOCwDXU8At6s8ewgb+sBBJuQWNHAACsodeNc1VWttWL7w8OI9c3KrXtX9D+6nxtgS2di7cFF9dcTaQzXTA0WFbssEtyRIHkq+SBYSqK59bT8XBulAVWAG8pMln2I6vx6sZgzSxWkSXVP0ZwO6YC/cJYfoPnQFG2G2Oa5tbMGtoVx6gEnNbghD0T64gEBsy7eC+10fQT7WuG8ogW2h+j8WlXD9S77mQT4iqFGxAxjMIL0z2DfRkDImmFIcKqP/F1vBjDyBnj3cyWv0n7UXr85h3tuP7yCy/MHpiu2NS3ruL9ktG+WxbA5kGTf2PpopI36pWX7OZE7fUSXLlM9em0Us/ZTlzk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261028144727099003)(260925021911599003)(260925021311599003)(260925022911599003)(5023799004)(261021135927099003)(56012099006)(261021123027099003)(261022105027099003)(261022115727099003)(261026121527099003)(261022113327099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7x8ZaIdmBLkPQiHKCLw5QpEH4EEwGVvRGf/yhqc1owYm6pqEOpms6Q1yHs?=
 =?iso-8859-1?Q?xZtZ9axGz1wctWJm4v9KsvMfx0qHYzLiT3rgW1zObvM7DLFSeha7KZ2+9k?=
 =?iso-8859-1?Q?s5pxVClPHySQHPrNCBi4OG7RzGl4YWrKLmRY3KxQKkmtxJoa7LMCI+AsbH?=
 =?iso-8859-1?Q?OW8KV5ODkRD86OghoHweRvKkrlVk+9b2njBShkJKMRxHwCWOWGIO0ymzm0?=
 =?iso-8859-1?Q?0gyLk8BUbMmlWMgU6Z+VwxiwwzdsoN6OtHdBGKDPOlIRa6FdD8V9cI0dR+?=
 =?iso-8859-1?Q?nUTYcZn7khuMy0EzGcySHFmhqShT5U89FDfE51xEBO+Ya4h9dc93zJMwdV?=
 =?iso-8859-1?Q?6dpmT1unysq6yatMJjvgPb9rw43XzYESUrYNjCLUSSkT6UseTHcCvRnEPV?=
 =?iso-8859-1?Q?yXhIcfVi7h7auR1Vp+4EbCwge7Qu75L5lmA/jrYOTm/nsp238f+brMe7Ju?=
 =?iso-8859-1?Q?2LCVhiBOLxYjF/qeCVxWFQBFKfLkQyLFaXkvV4FzPyvyP8QO0+ZFMFeqKV?=
 =?iso-8859-1?Q?VWxftAb/DviXq6tswBGXR/IlO3bj3fe2gRPw142KIXDPl2i7uGHY5esSxb?=
 =?iso-8859-1?Q?v0Onaa2voWE4wMxllDxpZpYwOkkYo5m+Z9/kBA5Ws6k3xn3YT+tyl06KI4?=
 =?iso-8859-1?Q?zHblO7sFQoYTgNMHYyGKa+LEr4hNNRUgcytjTh/GUvU5xEy6vrGMQUS+sU?=
 =?iso-8859-1?Q?r0pxzaPW9ZGYmklW2RO7QfcbmnEl/JPBfL0bBeKoYFdax567VrJlFj954I?=
 =?iso-8859-1?Q?iX5l2BXRd/GrSqqyqkM19WpcmOXpaFP3ztq1AxViKh/f01gBgUwzr4p72b?=
 =?iso-8859-1?Q?kkZLlQfNd5XmuznTfOKOz9CT9+AzNOZOcIUol5nhZnE2EjOnViEZ8zJtlq?=
 =?iso-8859-1?Q?7OX/8dNZTiszp+rpwpXIX6HDpl7wtlcaqoo+I+Xo1TI+2vSyv8HDr5bKGK?=
 =?iso-8859-1?Q?chvkdw1ILiYscRUFhz7ixHQvBl8euRYpqAbM/na1/lUnlr2hbi/6XqbYGB?=
 =?iso-8859-1?Q?1fiv58LXOkWbSrn40akaD0EDE/WUXuEH7z2Wz8DcbhD7IyXFClV6XiVUfd?=
 =?iso-8859-1?Q?I9z87K8ISxvJLPWjO1sNr9UjLIdJXQQpd9n5UJ12s+hxPfLpnqZSjaFl08?=
 =?iso-8859-1?Q?6+zcJs2iOZEY9CICsw7WcbN9QJVXdTC1V5ZZQ9OR6FRjsHSx3DXJYjPbn5?=
 =?iso-8859-1?Q?6uV5mfElqs4vL1edvsxEmYYl5/GkkRTE2OlBLB6MtNR8+CgLOxVj8FMoYT?=
 =?iso-8859-1?Q?uyv+NWKYSLlbajIFg6mwTPV9SZG0Y6zL31VrvTcvjm4kC0/UoQoMBibndM?=
 =?iso-8859-1?Q?22NiecWjQYJuKL+ELOKogU25vvv51FSKptpKSGu8l+aI7xF9m6m0J0gnVq?=
 =?iso-8859-1?Q?umfwYZwXNfnaJ0+4LvOt0RpnKjB/RJ0GqEcuEQF4Vw8F2byd2vQ2E3fbhg?=
 =?iso-8859-1?Q?fRqOo0JnUekdH43V+7cX0o0+/szcoawSIg18W8zop/O73K4u5D9GvDMFbk?=
 =?iso-8859-1?Q?hEaVbMuG9RmlcTarDQeUEiZ5/tiUathS/0d+j8Zut4jfeBwAOd/DFt3PA9?=
 =?iso-8859-1?Q?JcGsUgZRpHKhw2xymscyn4ptjFc4qnIAqiC6ryn152o0hlYlR+CYsbMZ/K?=
 =?iso-8859-1?Q?fnspTo0dD1TPB4ZlTRpcW09zAUPBuHL5sd46grgdsha80uBGGOyOFi+xmy?=
 =?iso-8859-1?Q?PYGG7feJwNk/kEC6i1GYEifP1TrDRseNdnjMfElcFHQuhNg5FMrn+GGrHS?=
 =?iso-8859-1?Q?mE9Jn1zE1TcVI9bSafXcNe68pw7oiA6/sAAYgGOXZ8LCfD?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	M6Kmv34pPcsRE0q64LQhQjsZBGhpeqAEbsqk1Tam07X1qgfZ6fIdjVqXF7wmXdsN2WnLzPRBZtrsYhDJqYhe1dPLZUdyGR4VnXzTI2/GTTIRkyF+E8aCn5kmAISSRUF0wpxe/G4mEuuFrhQAyTms5rplTWS24/iNVMPPjy87zMiARI4zGi+KqMuCkLBAr88utZo+P0qUDoNv3A/qiKYxEa8OCkB6pIc97w9EpZpeXUukgSjaE5jbJu9TEX8wEJaUfwMrk6P0GUkLtJVgt7xpYhTYx8deteE+i54X8F5j06eUMBkasm+XRfCvf5vzGBlwHcp7iUOcJzNfIzt2ewnbeg==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f22132-4061-4c9c-1a1c-08df46909277
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:58:01.2899
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ej8ugRfWasXIJY7Eupa0ct/+99sd7/r1UopRA7wDKKgo+riXxZk/6+p165KpJTgF9Z6RV4JfHNqaqVHv1eC6yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6C2DD1D15
X-MDID: 1795129088-DhOwfEmDJZx4
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1795129088;DhOwfEmDJZx4;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Report the phase difference between a PLL's reference and the PLL, read=0A=
from the on-chip time-to-digital converter through the debug window as=0A=
the documented procedure does. A read latches a sample and returns the=0A=
previous one, so each sample is read three times. The sign bit is set=0A=
when the reference edge comes first: a negative offset.=0A=
=0A=
The offset is sampled when asked for, not by the poll: a sample is=0A=
several dozen transfers per PLL. A sample that cannot be taken, on a=0A=
bus error or with the output loops open, is an absent attribute, so=0A=
one failed read does not end a pin dump.=0A=
=0A=
Only the input the part feeds the PLL has an offset. Any other pin, a PLL=
=0A=
without a reference, or a PLL that drives no enabled output returns=0A=
-ENODATA and the core leaves the attribute out. The XO pin has none: it=0A=
is the frequency base of every PLL, not an input the loop is steered=0A=
to.=0A=
=0A=
The debug taps moved for a sample are put back after it; a restore that=0A=
fails is retried by the poll, at removal and on the probe failure path,=0A=
which now runs the same retries as removal.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/core.c | 359 ++++++++++++++++++++++++++++++-----=0A=
 drivers/dpll/sit9531x/core.h |  15 ++=0A=
 drivers/dpll/sit9531x/dpll.c | 110 +++++++++++=0A=
 drivers/dpll/sit9531x/regs.h |  19 ++=0A=
 4 files changed, 452 insertions(+), 51 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
index fd8f0df9116d..5ec9d2a48fcb 100644=0A=
--- a/drivers/dpll/sit9531x/core.c=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -262,6 +262,28 @@ static int sit9531x_update_pll_close(struct sit9531x_d=
ev *sitdev, u8 pll_idx,=0A=
 	return rc;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Restore the debug taps a phase-offset read changed. The PLL page's debu=
g=0A=
+ * window must already be open.=0A=
+ */=0A=
+static int sit9531x_tap_restore(struct sit9531x_dev *sitdev, u8 pll_idx)=
=0A=
+{=0A=
+	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_write_pll_close(sitdev, pll_idx,=0A=
+				      SIT9531X_PLL_REG_DBG_READ_CODE,=0A=
+				      chan->tap_read_code);=0A=
+	if (!rc)=0A=
+		rc =3D sit9531x_write_pll_close(sitdev, pll_idx,=0A=
+					      SIT9531X_PLL_REG_DBG_WRITE_CODE,=0A=
+					      chan->tap_write_code);=0A=
+	if (!rc)=0A=
+		chan->tap_pending =3D false;=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
 static void sit9531x_input_get_regs(const struct sit9531x_dev *sitdev,=0A=
 				    u8 index,=0A=
 				    unsigned int *force_reg,=0A=
@@ -807,12 +829,16 @@ static int sit9531x_prio_prg_commit(struct sit9531x_d=
ev *sitdev)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-/*=0A=
- * Four registers carry a nibble per lane: loss of signal and the fine and=
=0A=
- * coarse frequency-drift flags. Caller must hold sitdev->multiop_lock, or=
 run=0A=
- * before registration.=0A=
+/**=0A=
+ * sit9531x_input_mon_fetch - read the clock monitor status of every lane=
=0A=
+ * @sitdev: device pointer=0A=
+ *=0A=
+ * One nibble per lane: loss of signal, fine and coarse frequency drift.=
=0A=
+ * Caller must hold sitdev->multiop_lock, or run before registration.=0A=
+ *=0A=
+ * Return: 0 on success, <0 on error=0A=
  */=0A=
-static int sit9531x_input_mon_fetch(struct sit9531x_dev *sitdev)=0A=
+int sit9531x_input_mon_fetch(struct sit9531x_dev *sitdev)=0A=
 {=0A=
 	static const unsigned int regs[] =3D {=0A=
 		SIT9531X_CLKMON_P_STATUS_01, SIT9531X_CLKMON_P_STATUS_23,=0A=
@@ -2594,6 +2620,176 @@ static int sit9531x_clear_notifications(struct sit9=
531x_dev *sitdev)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+/**=0A=
+ * sit9531x_phase_offset_read - read phase difference via TDC=0A=
+ * @sitdev: device pointer=0A=
+ * @pll_idx: PLL index (0-3)=0A=
+ * @phase_offset: phase difference in 1/DPLL_PHASE_OFFSET_DIVIDER ps=0A=
+ *=0A=
+ * The TDC code is a 35-bit magnitude with a separate sign bit;=0A=
+ * phase_diff =3D tdc_code / fvco. The result is negative when the referen=
ce=0A=
+ * edge is the earlier one. Caller must hold sitdev->multiop_lock.=0A=
+ *=0A=
+ * Return: 0 on success, -ENODATA if Fvco is unknown, <0 on other errors=
=0A=
+ */=0A=
+int sit9531x_phase_offset_read(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			       s64 *phase_offset)=0A=
+{=0A=
+	u8 v, old_write_code, old_read_code;=0A=
+	struct sit9531x_chan *chan;=0A=
+	bool have_old =3D false;=0A=
+	int rc, ret, i;=0A=
+	s64 tdc_signed;=0A=
+	u64 fvco, mag;=0A=
+	u64 tdc_raw;=0A=
+	bool sign;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+	chan =3D &sitdev->chan[pll_idx];=0A=
+=0A=
+	/*=0A=
+	 * Read Fvco first; without it there is no reason to open the debug=0A=
+	 * window.=0A=
+	 */=0A=
+	rc =3D sit9531x_get_fvco(sitdev, pll_idx, &fvco);=0A=
+	if (rc) {=0A=
+		if (rc =3D=3D -ENODATA)=0A=
+			dev_dbg(sitdev->dev,=0A=
+				"PLL%c: Fvco unknown, skip TDC\n",=0A=
+				'A' + pll_idx);=0A=
+		return rc;=0A=
+	}=0A=
+=0A=
+	rc =3D sit9531x_write_pll_u8(sitdev, pll_idx,=0A=
+				   SIT9531X_PLL_REG_DEBUG,=0A=
+				   SIT9531X_PLL_DEBUG_UNLOCK);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+=0A=
+	/* Restore pending taps before saving the selection */=0A=
+	if (chan->tap_pending) {=0A=
+		rc =3D sit9531x_tap_restore(sitdev, pll_idx);=0A=
+		if (rc)=0A=
+			goto relock;=0A=
+	}=0A=
+=0A=
+	/* Save the tap selection; the debug key does not cover the mux. */=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_WRITE_CODE,=0A=
+				  &old_write_code);=0A=
+	if (!rc)=0A=
+		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+					  SIT9531X_PLL_REG_DBG_READ_CODE,=0A=
+					  &old_read_code);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+=0A=
+	have_old =3D true;=0A=
+=0A=
+	/*=0A=
+	 * Enable the debug clock for taps below 200 kHz, then select the TDC=0A=
+	 * tap. The modifier register also holds fields of other taps.=0A=
+	 */=0A=
+	rc =3D sit9531x_update_pll_u8(sitdev, pll_idx,=0A=
+				    SIT9531X_PLL_REG_DBG_WRITE_CODE,=0A=
+				    SIT9531X_DBG_LOW_FREQ_CLK_BIT,=0A=
+				    SIT9531X_DBG_LOW_FREQ_CLK_BIT);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	rc =3D sit9531x_write_pll_u8(sitdev, pll_idx,=0A=
+				   SIT9531X_PLL_REG_DBG_READ_CODE,=0A=
+				   SIT9531X_DBG_READ_CODE_TDC);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+=0A=
+	/*=0A=
+	 * A status data read latches a sample and returns the previous one;=0A=
+	 * read three times as the documented procedure does. The procedure=0A=
+	 * leaves the status address unwritten.=0A=
+	 */=0A=
+	for (i =3D 0; i < SIT9531X_DBG_STATUS_READS; i++) {=0A=
+		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+					  SIT9531X_PLL_REG_DBG_STATUS_DATA,=0A=
+					  &v);=0A=
+		if (rc)=0A=
+			goto relock;=0A=
+	}=0A=
+=0A=
+	tdc_raw =3D 0;=0A=
+=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_DATA_4, &v);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	sign =3D !!(v & BIT(SIT9531X_TDC_SIGN_BIT));=0A=
+	tdc_raw =3D (u64)(v & SIT9531X_TDC_MAG_HI_MASK) << 32;=0A=
+=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_DATA_3, &v);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	tdc_raw |=3D (u64)v << 24;=0A=
+=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_DATA_2, &v);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	tdc_raw |=3D (u64)v << 16;=0A=
+=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_DATA_1, &v);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	tdc_raw |=3D (u64)v << 8;=0A=
+=0A=
+	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,=0A=
+				  SIT9531X_PLL_REG_DBG_DATA_0, &v);=0A=
+	if (rc)=0A=
+		goto relock;=0A=
+	tdc_raw |=3D v;=0A=
+=0A=
+	/*=0A=
+	 * The sign bit is set when the reference edge comes first; the=0A=
+	 * subsystem reports a pin that is earlier than the DPLL as negative.=0A=
+	 */=0A=
+	tdc_signed =3D sign ? -(s64)tdc_raw : (s64)tdc_raw;=0A=
+=0A=
+	/*=0A=
+	 * phase_diff (ps) =3D tdc_code * 1e12 / fvco. Scale by the subsystem's=
=0A=
+	 * divider before dividing to keep the fractional digits; one code is=0A=
+	 * 203.45 ps at 4.9152 GHz.=0A=
+	 */=0A=
+	mag =3D mul_u64_u64_div_u64(tdc_signed < 0 ? -tdc_signed : tdc_signed,=0A=
+				  1000000000000ULL * DPLL_PHASE_OFFSET_DIVIDER,=0A=
+				  fvco);=0A=
+	*phase_offset =3D tdc_signed < 0 ? -(s64)mag : (s64)mag;=0A=
+=0A=
+	rc =3D 0;=0A=
+=0A=
+relock:=0A=
+	if (have_old) {=0A=
+		chan->tap_read_code =3D old_read_code;=0A=
+		chan->tap_write_code =3D old_write_code;=0A=
+		ret =3D sit9531x_tap_restore(sitdev, pll_idx);=0A=
+		if (ret)=0A=
+			chan->tap_pending =3D true;=0A=
+		if (ret && !rc)=0A=
+			rc =3D ret;=0A=
+	}=0A=
+=0A=
+	ret =3D sit9531x_write_pll_close(sitdev, pll_idx,=0A=
+				       SIT9531X_PLL_REG_DEBUG,=0A=
+				       SIT9531X_PLL_DEBUG_LOCK);=0A=
+	chan->key_pending =3D !!ret;=0A=
+	if (ret && !rc)=0A=
+		rc =3D ret;=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
 /* Read the lane's receiver state from the Page 0x02 force and state bits =
*/=0A=
 static int sit9531x_ref_state_fetch(struct sit9531x_dev *sitdev, u8 index)=
=0A=
 {=0A=
@@ -2724,13 +2920,21 @@ static int sit9531x_chan_select_fetch(struct sit953=
1x_dev *sitdev, u8 pll_idx)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-/*=0A=
- * Read the reference the device feeds a PLL from the debug status bus; th=
e=0A=
- * active selection does not change on a fallback. The caller rules out fr=
ee-run=0A=
- * first and must hold sitdev->multiop_lock.=0A=
+/**=0A=
+ * sit9531x_chan_routed_ref_read - read the reference the device feeds a P=
LL=0A=
+ * @sitdev: device pointer=0A=
+ * @pll_idx: PLL index (0-3)=0A=
+ * @ref: logical input index, SIT9531X_MAX_INPUTS for the XO,=0A=
+ *   SIT9531X_INTSYNC_PIN_ID, or SIT9531X_REF_INVALID=0A=
+ *=0A=
+ * The device falls back between listed sources without changing the activ=
e=0A=
+ * selection, so read the source from the debug status bus. The caller rul=
es=0A=
+ * out free-run first and must hold multiop_lock.=0A=
+ *=0A=
+ * Return: 0 on success, <0 on error=0A=
  */=0A=
-static int sit9531x_chan_routed_ref_read(struct sit9531x_dev *sitdev,=0A=
-					 u8 pll_idx, u8 *ref)=0A=
+int sit9531x_chan_routed_ref_read(struct sit9531x_dev *sitdev, u8 pll_idx,=
=0A=
+				  u8 *ref)=0A=
 {=0A=
 	int rc, lock_rc;=0A=
 	u8 v, i;=0A=
@@ -2768,6 +2972,7 @@ static int sit9531x_chan_routed_ref_read(struct sit95=
31x_dev *sitdev,=0A=
 	lock_rc =3D sit9531x_write_pll_close(sitdev, pll_idx,=0A=
 					   SIT9531X_PLL_REG_DEBUG,=0A=
 					   SIT9531X_PLL_DEBUG_LOCK);=0A=
+	sitdev->chan[pll_idx].key_pending =3D !!lock_rc;=0A=
 =0A=
 	return rc ? rc : lock_rc;=0A=
 }=0A=
@@ -3241,6 +3446,27 @@ static void sit9531x_table_back_retry(struct sit9531=
x_dev *sitdev, u8 pll_idx)=0A=
 		 'A' + pll_idx);=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Restore the debug taps and close the debug window after a failed phase-=
offset=0A=
+ * read. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+static void sit9531x_tap_back_retry(struct sit9531x_dev *sitdev, u8 pll_id=
x)=0A=
+{=0A=
+	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];=0A=
+=0A=
+	if (!chan->tap_pending && !chan->key_pending)=0A=
+		return;=0A=
+=0A=
+	if (chan->tap_pending &&=0A=
+	    !sit9531x_write_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_DEBUG,=0A=
+				   SIT9531X_PLL_DEBUG_UNLOCK))=0A=
+		sit9531x_tap_restore(sitdev, pll_idx);=0A=
+=0A=
+	chan->key_pending =3D !!sit9531x_write_pll_close(sitdev, pll_idx,=0A=
+						     SIT9531X_PLL_REG_DEBUG,=0A=
+						     SIT9531X_PLL_DEBUG_LOCK);=0A=
+}=0A=
+=0A=
 /*=0A=
  * Rewrite the priority table when a listed source returns to a PLL withou=
t a=0A=
  * reference; the write latches the active selection again. Each latch res=
tarts=0A=
@@ -3327,6 +3553,7 @@ sit9531x_dev_chan_states_update(struct sit9531x_dev *=
sitdev)=0A=
 	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
 		sit9531x_table_back_retry(sitdev, i);=0A=
 		sit9531x_ho_release_retry(sitdev, i);=0A=
+		sit9531x_tap_back_retry(sitdev, i);=0A=
 		/*=0A=
 		 * A flush pulse sent into open loops may be lost when they=0A=
 		 * re-lock.=0A=
@@ -3579,55 +3806,30 @@ static void sit9531x_pin_nodes_check(struct sit9531=
x_dev *sitdev)=0A=
 	fwnode_handle_put(pins);=0A=
 }=0A=
 =0A=
-static int sit9531x_dev_start(struct sit9531x_dev *sitdev)=0A=
+/* Retry the pending debug tap restore and debug window close */=0A=
+static void sit9531x_tap_pending_retry(struct sit9531x_dev *sitdev)=0A=
 {=0A=
-	struct sit9531x_dpll *sitdpll;=0A=
-	int rc;=0A=
-=0A=
-	rc =3D sit9531x_dev_state_fetch(sitdev);=0A=
-	if (rc)=0A=
-		return rc;=0A=
+	u8 i;=0A=
 =0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
-	sit9531x_eeprom_state_report(sitdev);=0A=
-	sit9531x_pll_states_report(sitdev);=0A=
-	mutex_unlock(&sitdev->multiop_lock);=0A=
-=0A=
-	sit9531x_pin_nodes_check(sitdev);=0A=
-=0A=
-	list_for_each_entry(sitdpll, &sitdev->dplls, list) {=0A=
-		rc =3D sit9531x_dpll_register(sitdpll);=0A=
-		if (rc) {=0A=
-			dev_err_probe(sitdev->dev, rc,=0A=
-				      "Failed to register DPLL%u\n",=0A=
-				      sitdpll->id);=0A=
-			goto err_unregister;=0A=
-		}=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
+		sit9531x_tap_back_retry(sitdev, i);=0A=
+		if (sitdev->chan[i].tap_pending || sitdev->chan[i].key_pending)=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c left with its debug taps moved or window open\n",=0A=
+				 'A' + i);=0A=
 	}=0A=
-=0A=
-	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);=0A=
-=0A=
-	return 0;=0A=
-=0A=
-err_unregister:=0A=
-	list_for_each_entry_continue_reverse(sitdpll, &sitdev->dplls, list)=0A=
-		sit9531x_dpll_unregister(sitdpll);=0A=
-=0A=
-	return rc;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
 }=0A=
 =0A=
-static void sit9531x_dev_stop(struct sit9531x_dev *sitdev)=0A=
+/*=0A=
+ * Retry every pending write once more and report what is still pending. C=
all=0A=
+ * with the DPLLs unregistered.=0A=
+ */=0A=
+static void sit9531x_dev_pending_retry(struct sit9531x_dev *sitdev)=0A=
 {=0A=
-	struct sit9531x_dpll *sitdpll;=0A=
 	u8 i;=0A=
 =0A=
-	kthread_cancel_delayed_work_sync(&sitdev->work);=0A=
-=0A=
-	list_for_each_entry(sitdpll, &sitdev->dplls, list) {=0A=
-		if (sitdpll->dpll_dev)=0A=
-			sit9531x_dpll_unregister(sitdpll);=0A=
-	}=0A=
-=0A=
 	/*=0A=
 	 * Write back tables first: forced holdover stays set while a table=0A=
 	 * write-back is pending.=0A=
@@ -3693,6 +3895,61 @@ static void sit9531x_dev_stop(struct sit9531x_dev *s=
itdev)=0A=
 			 (sitdev->flush_armed & BIT(i)) ? "parked" : "armed");=0A=
 	}=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	sit9531x_tap_pending_retry(sitdev);=0A=
+}=0A=
+=0A=
+static int sit9531x_dev_start(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_dev_state_fetch(sitdev);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	sit9531x_eeprom_state_report(sitdev);=0A=
+	sit9531x_pll_states_report(sitdev);=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	sit9531x_pin_nodes_check(sitdev);=0A=
+=0A=
+	list_for_each_entry(sitdpll, &sitdev->dplls, list) {=0A=
+		rc =3D sit9531x_dpll_register(sitdpll);=0A=
+		if (rc) {=0A=
+			dev_err_probe(sitdev->dev, rc,=0A=
+				      "Failed to register DPLL%u\n",=0A=
+				      sitdpll->id);=0A=
+			goto err_unregister;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);=0A=
+=0A=
+	return 0;=0A=
+=0A=
+err_unregister:=0A=
+	list_for_each_entry_continue_reverse(sitdpll, &sitdev->dplls, list)=0A=
+		sit9531x_dpll_unregister(sitdpll);=0A=
+=0A=
+	sit9531x_dev_pending_retry(sitdev);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static void sit9531x_dev_stop(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll;=0A=
+=0A=
+	kthread_cancel_delayed_work_sync(&sitdev->work);=0A=
+=0A=
+	list_for_each_entry(sitdpll, &sitdev->dplls, list) {=0A=
+		if (sitdpll->dpll_dev)=0A=
+			sit9531x_dpll_unregister(sitdpll);=0A=
+	}=0A=
+=0A=
+	sit9531x_dev_pending_retry(sitdev);=0A=
 }=0A=
 =0A=
 static struct sit9531x_dpll_pin *=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index 97d44c60a65a..dc7862069987 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -167,6 +167,11 @@ struct sit9531x_out {=0A=
  * @table_pending: priority table partly written or not latched; the PLL=
=0A=
  *   stays in forced holdover=0A=
  * @table_back: table reported and to be rewritten while @table_pending=0A=
+ * @tap_pending: debug taps not restored after a phase-offset read=0A=
+ * @tap_write_code: tap selection to restore while @tap_pending=0A=
+ * @tap_read_code: readback selection to restore while @tap_pending=0A=
+ * @key_pending: debug key not locked again after a phase-offset read or t=
ap=0A=
+ *   retry=0A=
  * @prio_srcs: cached priority table, a source code per slot=0A=
  * @prio_last: first slot of each source plus one, 0 if absent=0A=
  * @prio_mask: bit per canonical source in the priority table read back=0A=
@@ -195,6 +200,10 @@ struct sit9531x_chan {=0A=
 	bool		flush_pending;=0A=
 	bool		table_pending;=0A=
 	u8		table_back[SIT9531X_PRIO_MAX_SLOTS];=0A=
+	bool		tap_pending;=0A=
+	u8		tap_write_code;=0A=
+	u8		tap_read_code;=0A=
+	bool		key_pending;=0A=
 	u8		prio_srcs[SIT9531X_PRIO_MAX_SLOTS];=0A=
 	u8		prio_last[SIT9531X_PRIO_NUM_SRC];=0A=
 	u16		prio_mask;=0A=
@@ -314,6 +323,12 @@ int sit9531x_output_phase_read(struct sit9531x_dev *si=
tdev, u8 out_idx,=0A=
 int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,=0A=
 				     u8 out_idx, s32 phase_ps);=0A=
 =0A=
+int sit9531x_chan_routed_ref_read(struct sit9531x_dev *sitdev, u8 pll_idx,=
=0A=
+				  u8 *ref);=0A=
+int sit9531x_input_mon_fetch(struct sit9531x_dev *sitdev);=0A=
+int sit9531x_phase_offset_read(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			       s64 *phase_offset);=0A=
+=0A=
 static inline u8 sit9531x_pll_page(u8 pll_idx)=0A=
 {=0A=
 	return SIT9531X_PAGE_PLLA + pll_idx;=0A=
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c=0A=
index 8589019b4b43..0f2b3d446cb5 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.c=0A=
+++ b/drivers/dpll/sit9531x/dpll.c=0A=
@@ -488,6 +488,112 @@ sit9531x_dpll_input_pin_prio_set(const struct dpll_pi=
n *pin, void *pin_priv,=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Report the loop's residual phase error, sampled with the loop closed. T=
he TDC=0A=
+ * compares against a signal the PLL drives, so a PLL driving no output re=
turns=0A=
+ * -ENODATA.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_input_pin_phase_offset_get(const struct dpll_pin *pin,=0A=
+					 void *pin_priv,=0A=
+					 const struct dpll_device *dpll,=0A=
+					 void *dpll_priv, s64 *phase_offset,=0A=
+					 struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	bool drives =3D false;=0A=
+	u8 routed, i;=0A=
+	s64 offset;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+=0A=
+	/*=0A=
+	 * Check the cache first: the core calls this for every pin of every=0A=
+	 * DPLL in a dump. Output loops left open by a failed programming=0A=
+	 * sequence give no closed-loop sample.=0A=
+	 */=0A=
+	rc =3D -ENODATA;=0A=
+	if (sitdev->loops_open ||=0A=
+	    !sit9531x_dpll_selection_active(sitdev, sitdpll, dpin->id))=0A=
+		goto out;=0A=
+=0A=
+	/*=0A=
+	 * The device can change the routed reference, so read it before and=0A=
+	 * after the sample. A PLL with no routed, enabled output has no=0A=
+	 * measurement.=0A=
+	 */=0A=
+	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
+		if (!sitdev->out[i].routed ||=0A=
+		    sitdev->out[i].pll_idx !=3D sitdpll->id)=0A=
+			continue;=0A=
+		if (sitdev->out[i].state_stale) {=0A=
+			rc =3D sit9531x_output_state_refresh(sitdev, i);=0A=
+			if (rc)=0A=
+				goto out;=0A=
+		}=0A=
+		if (sitdev->out[i].enabled)=0A=
+			drives =3D true;=0A=
+	}=0A=
+	rc =3D -ENODATA;=0A=
+	if (!drives)=0A=
+		goto out;=0A=
+=0A=
+	/*=0A=
+	 * Read the monitors live: on loss of signal the device falls back=0A=
+	 * without a request.=0A=
+	 */=0A=
+	rc =3D sit9531x_input_mon_fetch(sitdev);=0A=
+	if (rc)=0A=
+		goto out;=0A=
+	if (!sit9531x_dpll_selection_active(sitdev, sitdpll, dpin->id)) {=0A=
+		rc =3D -ENODATA;=0A=
+		goto out;=0A=
+	}=0A=
+=0A=
+	rc =3D sit9531x_chan_routed_ref_read(sitdev, sitdpll->id, &routed);=0A=
+	if (!rc && routed =3D=3D dpin->id) {=0A=
+		rc =3D sit9531x_phase_offset_read(sitdev, sitdpll->id, &offset);=0A=
+		if (!rc)=0A=
+			rc =3D sit9531x_chan_routed_ref_read(sitdev, sitdpll->id,=0A=
+							   &routed);=0A=
+		if (!rc && routed !=3D dpin->id)=0A=
+			rc =3D -ENODATA;=0A=
+	} else if (!rc) {=0A=
+		rc =3D -ENODATA;=0A=
+	}=0A=
+	/*=0A=
+	 * A reference lost during the sample can leave the routed reference=0A=
+	 * unchanged while the PLL is in holdover; read the monitors again.=0A=
+	 */=0A=
+	if (!rc) {=0A=
+		rc =3D sit9531x_input_mon_fetch(sitdev);=0A=
+		if (!rc && dpin->id < sitdev->info->num_inputs &&=0A=
+		    sit9531x_ref_state_get(sitdev, dpin->id)->los)=0A=
+			rc =3D -ENODATA;=0A=
+	}=0A=
+out:=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	/*=0A=
+	 * A sample that could not be taken is an absent attribute; any other=0A=
+	 * error from here fails the whole pin dump in the core.=0A=
+	 */=0A=
+	if (rc && rc !=3D -ENODATA) {=0A=
+		dev_warn_ratelimited(sitdev->dev,=0A=
+				     "PLL%c: phase offset not sampled: %d\n",=0A=
+				     'A' + sitdpll->id, rc);=0A=
+		return -ENODATA;=0A=
+	}=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	*phase_offset =3D offset;=0A=
+	return 0;=0A=
+}=0A=
+=0A=
 static const struct dpll_pin_ops sit9531x_dpll_input_pin_ops =3D {=0A=
 	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,=0A=
 	.frequency_get		=3D sit9531x_dpll_input_pin_frequency_get,=0A=
@@ -496,6 +602,7 @@ static const struct dpll_pin_ops sit9531x_dpll_input_pi=
n_ops =3D {=0A=
 	.operstate_on_dpll_get	=3D sit9531x_dpll_input_pin_operstate_on_dpll_get,=
=0A=
 	.prio_get		=3D sit9531x_dpll_input_pin_prio_get,=0A=
 	.prio_set		=3D sit9531x_dpll_input_pin_prio_set,=0A=
+	.phase_offset_get	=3D sit9531x_dpll_input_pin_phase_offset_get,=0A=
 };=0A=
 =0A=
 /*=0A=
@@ -509,6 +616,7 @@ static const struct dpll_pin_ops sit9531x_dpll_input_pi=
n_norate_ops =3D {=0A=
 	.operstate_on_dpll_get	=3D sit9531x_dpll_input_pin_operstate_on_dpll_get,=
=0A=
 	.prio_get		=3D sit9531x_dpll_input_pin_prio_get,=0A=
 	.prio_set		=3D sit9531x_dpll_input_pin_prio_set,=0A=
+	.phase_offset_get	=3D sit9531x_dpll_input_pin_phase_offset_get,=0A=
 };=0A=
 =0A=
 /*=0A=
@@ -520,12 +628,14 @@ static const struct dpll_pin_ops sit9531x_dpll_input_=
pin_manual_ops =3D {=0A=
 	.frequency_get		=3D sit9531x_dpll_input_pin_frequency_get,=0A=
 	.state_on_dpll_get	=3D sit9531x_dpll_input_pin_state_on_dpll_get,=0A=
 	.operstate_on_dpll_get	=3D sit9531x_dpll_input_pin_operstate_on_dpll_get,=
=0A=
+	.phase_offset_get	=3D sit9531x_dpll_input_pin_phase_offset_get,=0A=
 };=0A=
 =0A=
 static const struct dpll_pin_ops sit9531x_dpll_input_pin_norate_manual_ops=
 =3D {=0A=
 	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,=0A=
 	.state_on_dpll_get	=3D sit9531x_dpll_input_pin_state_on_dpll_get,=0A=
 	.operstate_on_dpll_get	=3D sit9531x_dpll_input_pin_operstate_on_dpll_get,=
=0A=
+	.phase_offset_get	=3D sit9531x_dpll_input_pin_phase_offset_get,=0A=
 };=0A=
 =0A=
 /*=0A=
diff --git a/drivers/dpll/sit9531x/regs.h b/drivers/dpll/sit9531x/regs.h=0A=
index c47720548f98..070d7800bcb8 100644=0A=
--- a/drivers/dpll/sit9531x/regs.h=0A=
+++ b/drivers/dpll/sit9531x/regs.h=0A=
@@ -229,6 +229,25 @@=0A=
 #define SIT9531X_PLL_REG_DIVN_NUM		0x32  /* 4 bytes (0x32-0x35) */=0A=
 #define SIT9531X_PLL_REG_DIVN_DEN		0x38  /* 4 bytes (0x38-0x3B) */=0A=
 =0A=
+/*=0A=
+ * Signal pathway debug readback: Dig_Sys_ReadCode selects the tap,=0A=
+ * Dig_Sys_WriteCode its modifiers; a read of the debug status data regist=
er=0A=
+ * latches a sample into Dig_Sys_read7..read0.=0A=
+ */=0A=
+#define SIT9531X_PLL_REG_DBG_READ_CODE	0xB3=0A=
+#define SIT9531X_PLL_REG_DBG_WRITE_CODE	0xB4=0A=
+#define SIT9531X_DBG_LOW_FREQ_CLK_BIT	BIT(7)=0A=
+#define SIT9531X_PLL_REG_DBG_DATA_0		0xB5  /* [7:0] */=0A=
+#define SIT9531X_PLL_REG_DBG_DATA_1		0xB6  /* [15:8] */=0A=
+#define SIT9531X_PLL_REG_DBG_DATA_2		0xB7  /* [23:16] */=0A=
+#define SIT9531X_PLL_REG_DBG_DATA_3		0xB8  /* [31:24] */=0A=
+#define SIT9531X_PLL_REG_DBG_DATA_4		0xB9  /* [34:32] + sign */=0A=
+=0A=
+/* Read code of the TDC phase tap, and the sign bit of its sample */=0A=
+#define SIT9531X_DBG_READ_CODE_TDC		69=0A=
+#define SIT9531X_TDC_SIGN_BIT		3=0A=
+#define SIT9531X_TDC_MAG_HI_MASK	GENMASK(2, 0)=0A=
+=0A=
 /* DIVN is carried as fixed point, in steps of 1e-12 of a whole divider */=
=0A=
 #define SIT9531X_DIVN_SCALE		1000000000000ULL=0A=
 =0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
