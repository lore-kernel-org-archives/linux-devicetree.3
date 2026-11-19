Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129089;
	b=aNi0pbHg1BzBANxzLs+E5qhDGEAcBwe/koDIDnZljSravlU0KGUk/qn+/WkLNBbP/yFL
	 mK4xRjoq4husTlYSPBx/yl1fifaAUPUaeZLcNWc/PGzf81KmEXJqP0b1+sorazsANvoHl
	 Nqp8F1Prh0rnaQsRFhw4YcX+A29Lb3Kc2ormwGavxpvtPUWIQaMhL+ZqbcIOIYLBjn+An
	 u5sVwFHbL/X6jyigsRo1A0tzG27jvavPqa2RqYNS1ysM+P6oTe8VBI1Xs1BFzKmb72A9b
	 Qi68Aa8Z3TmRid00e3PjmIU37tRhi+vDJHEr6stE5X55alPqY0fMRPXbtnSJGY+Qx9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129089;
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
	bh=7N9ZIpX1JSnmFMPdnaJBL21bl3F7G5nadqlF/qmmsvA=;
	b=t72ef5BVWucqaglKVJRXjbrM97ipNIfWHRIoETXLTo1l3LTWzVSzu8Bpw0MKrkia5/L5
	 ika1bu/imhJY2NeIzyifjUP68rgyJh6ar/4ZrhTb0aD7jzgNP/V92JHg/tAHEcdCtaPpu
	 tOxMySVL1es+roB2/QgxzY/o9dK2IEfjVs5g9/v3wW74RRwYTkleO0S5XxqVgxeAFztTy
	 a/NWuLqVxw2+NxI9dL0722gNCP3gQAaUwUaftt7h518VIftCFrbrmV3/mH+UPEw8YLWYZ
	 0GbH2F4EWzKwpiB78Ih5Ywa47oLXoayRRZvORJEUMRzPLr+67lvjdk18H4EcmivApzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=bu92K8Hk;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=hM88Jr46;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.52
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FA7606A333;
	Thu, 19 Nov 2026 22:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FA7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=bu92K8Hk;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=hM88Jr46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=7N9ZIpX1JSnmFMPdnaJBL21bl3F7G5nadqlF/qmmsvA=;
 b=bu92K8Hk+Q7aOZ2QsZc6CzWXZE3Jz2mtE3vZxBHcNLqwQ07u2KIxkCB2zuFsHYN8rcOfXXIXiOeSbCpvs5acCIbLQrG1tNOa8eocAv7ZVKSw1hgpT6V4UeaFHBKnWOA1EvNF8JVRDEKILE48nEEdA2GwHP/iUjrPNRtMg7Ntx7v2gy57pG+0KDtSkDP/wIY9AL+oRz3+58FbSoZJCuPiHWfULyEXQHfYugU8XcfWuR/Ic8EZxq/tgSkyTAq7BMXU7a8UZcxy4hJOVkLSTnfRDE9zhLXdU+6Wnjh1DrO/GLhZQ2U5gmCa9Th8aIb+x2QKsbjLK6rHAQMN222u/dxLbw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id DE73AC40077;
	Thu, 19 Nov 2026 22:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2OLgsg1NMn6YJR4T0myNc3TXXcXOaxhkA/10xjvzTuPZqWxxlFgt049MCgbgQ1jKfD2UDCvudlby7fMafZgwbSq2sHCmBfuVQQnb0UpzNVOXmjAy/5+xkuVHM0zzzSd3vzzX3VpaYidu1CsGXpdzOXJcfLx+ytIZOo5KV5muLG8Hn8fjWwoz7W3ezl67nGjUHt6+6iFNBgKt4rRKoxeUggk9x9bkVZuaDJJywKmkybOyAhKJMB8xBtdt2gsaYqVg4ecZ8ELy5c35iI0T9XNbilsAphIGiooGoNel3kjhPdwD+c8s67+8+QAkEUBZCn+l8qSYejrsLW5i0nbgYsN+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7N9ZIpX1JSnmFMPdnaJBL21bl3F7G5nadqlF/qmmsvA=;
 b=rsQ7/0ESRaqHPNzpj6qUORM03isyGxAUGuPUZb1SrIgaYdfI+7tVp404jSl0CvI8eBQs8pqUrNR2jS5lvbyRf7ffb1SZbcVKgYBggN6ErmWKT97R5aBfW+vR5MzbMc0qzPgECLj60ckF7cLU9HqG3S9h9dw95wznTGgNYvvjxBmVWhtbVdMbaiPJuqOkrWSKfQqb3VX5+9LJgAWbNRqaF5Tq+SgjLW0GhkQXSEJLKv81u6V6LE05naJxOuu6C+w0vYG4hayfMFeO8Ea8xcR5sqQSDWoZPnm0h0tPbSb6qA0j5xu8bUj4Z0H2fsjaSZFHLDLGRWWBBW9YmnqloHtVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7N9ZIpX1JSnmFMPdnaJBL21bl3F7G5nadqlF/qmmsvA=;
 b=hM88Jr46Ehgk3rM0MzWoj0/m/jw16/Huzr7f0LHOr3SjUEWKvI3BFghxofinUAyI8mkjW4Yujf9Y8d8la9C2yIgo+B9CwkQWU4XIWIAc/VY61VWO3Qleh6A4U4EqAiR+ZLXAqVMXxVYJQm6bze1Kg6aqlCOciWX/diA8hkzl5dERjayC5Zpjz7KcxXFRrAQblGw8kGuNVGIZbN41wAWVRq0OlWIKlIPMxbWelFFl3c1vqIbBMQxLkKC5pDvGHBn9v4un4GAWA7NBTo7cK2GAUdM+jpWsLRcoqCYnzGOZ9J2uwuSAHSiNtrXwO6wXTccHFPxbykd9AHYIxc5b7RoXng==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by SA5PPF6C2DD1D15.namprd20.prod.outlook.com (2603:10b6:80f:fc04::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 19 Nov
 2026 22:58:02 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:58:02 +0000
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
Subject: [PATCH net-next v16 10/13] dpll: sit9531x: implement output pin state
 on a DPLL
Thread-Topic: [PATCH net-next v16 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
Thread-Index: AQHdeHlsk+8cHjhV8Eym2wBv1ATEFg==
Date: Thu, 19 Nov 2026 22:57:59 +0000
Message-ID: <20261119225752.41846-11-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 7d6e3234-97fd-4f26-514a-08df4690907b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261028144727099003|5023799004|56012099006|261021123027099003|261022105027099003|261026121527099003|261009221227099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info:
 pCei8lEUKSsl+IwLt8Cqz/261d8zUgiI5DLnUUOXlXFwtctJik5GjFHcVXmfK4yPbB7Y+tT0QLL73YB4BklxxMRXHZaqY3jxpLwqvMuLjxvQrZ+d51heQ/SykHwKwmGTb9utZmIX0f9c3nMf/Cafq3ZjMihwAeBie9rvT0rBzbbfa/Mz+IRma5DeAZVHtNhSqBrqNDEXB+p4msrc4LlRjfhkFUdYpDJHbdh1FlxhQO+fteJumE9gAEO8XCg0U0tluffz2pYRVOczCntuJRy9jTsGMMv8t2a7bVtS6zYHheAIcAWRw41t1aTIA0hBkIm1YoT5+bgpd8qGjPP/btBWIyQUJQhCserQcwjJAQj4mqOt6EMuCJdg/AJT37VC74ziayVHcVW/7MAiFNQ1P05nBel9E0diRzeMmygX6go0+AeNjBPHaIG3S1z3U/F6ve+ZIblkgsm+FZ1V4FzbI+EsJfZgny3srfvs4ZKOSjXtYhYC0rxEG4o4UQJrrwidbQ7sZMfCkoztNNW4UPa4ZjxdjP4dsb0ApVoCAsS50DysaJ2WzzTJwL6nCMREzkVX197liB8/O1Qlx6U/m0ToqYFhd+nb+LEDOoEKbNCyPZ1HTlBYeAiIv5/d8hbv79+Y4EENlX4yjgxUelPG5+8BouGL5bCd/zcd0ZTR2iJog3uR4oIwuzUAnSHJ/aPxUmmJ9Y6KV13DkCEAhYEZcz1hlmHvTEW5Au7s1BQUtN80HOdoWlI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261028144727099003)(5023799004)(56012099006)(261021123027099003)(261022105027099003)(261026121527099003)(261009221227099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?blP4MVaVujaEUhWVXSNBYWFb4zrkwR8RZDv4RihiJRJjBmACrcHH5bZ/Su?=
 =?iso-8859-1?Q?e2ykRsXODhKb8sJ8pRtHgXoxW2Q0suu5Zp2Uf0BCPwv/kdumbUqGXlr6J7?=
 =?iso-8859-1?Q?M/5PQUycZl+XknFmar461OAdLApEUkkGXQDXVYRhvuxQ5LVue5tWV0nvsn?=
 =?iso-8859-1?Q?4NAefGtTGd30+D+bzcRUHuAPeglQnLPhTMXTyMo6MLM/WH9wU2ZF6M7wSk?=
 =?iso-8859-1?Q?m9PHIC3IjlFrR7UgZgMsNaBwdwZ2QI3MuCunjy65777lQiTdfR+BtlBGSG?=
 =?iso-8859-1?Q?IrWiplEWjk2W3hHZiA0IeeS/5PbxLhbg07sxGPUV92EaMj6UZFehmHBTYa?=
 =?iso-8859-1?Q?M2jfduvgzuJQPxwY1hBTZ0ij+GBlccIL+nG5+lmvDUhm4TOaoVxrWBebkl?=
 =?iso-8859-1?Q?0WJJQFf1mVwKcbV63ca5/M3T4W1XWrtQE6oWooYpS/5vLGmi9ckKswUnzP?=
 =?iso-8859-1?Q?zNm75hDs+LRhtASmIEU79oCA0MO0crkIRw8AxK2qHXf0ipLhsO0Hyu1kbk?=
 =?iso-8859-1?Q?tQiX0Y8358hZkHdRNpw1jpwOAZMz4IBRiQHbydZPiKlH2tCz+Kefntg25p?=
 =?iso-8859-1?Q?jyIVdIuGd/0/OK0NaqwxNshLRGagQSwdjhbT26DIo7UEboXoLYgHyUDjVF?=
 =?iso-8859-1?Q?QGBjXWv0xxcKJTrGx7KxASJ/WckMIUcX/l6CTolS/cc7+j7/8P1C6nor6K?=
 =?iso-8859-1?Q?gQcV4kujMsAN0wpIIPifKm7IZZoSRtG1E88hdtzKm82nMUUVDEqj2Numzx?=
 =?iso-8859-1?Q?nq8cRVCxFFgScqX28kSCxLj+jBoV5Cim60dOiBdWNEHIChdwUxQAGHGdTl?=
 =?iso-8859-1?Q?M+kQDMzGuDqiKPY/yvG2xKx6b4660ueTAUC57bKayHPZ/C+WnBkdb4ZAqM?=
 =?iso-8859-1?Q?tD+QX3rQf7tJXAIH8bQtSzglSFZ3VCeKPgJDvHhxwfFRAu6gB1NiZChS+x?=
 =?iso-8859-1?Q?hVZ9926bvtHWwe9M1vrwzsBIM+MDjrp7/6FSE9FxU+RqRHdPjl9wPwjN+d?=
 =?iso-8859-1?Q?qCs47jimUuWSw38iZorNGkbVSOucETyAdG9PgJC0G8JzZFPkygsapkwr/S?=
 =?iso-8859-1?Q?eInuKVL3b6SW1qqGIoftG0rZhS+wFXPRVFJOWTbFLnCYledy87BeBYblxB?=
 =?iso-8859-1?Q?dlZGPgH6QkrZyD0/k1sqFVPMm7ghXVuy2zJ1rLGeSiDPSDYMBREGmx+QE2?=
 =?iso-8859-1?Q?8drPIHaN8otPYRpNTsBSygxiYEdRNlzbiKx+cTdKferqyhPL8VrstxZTCA?=
 =?iso-8859-1?Q?GWNSEx2IQciq25UYs4sA4T9zi2ROlPSpGcnT1ZeQM30T5pCRfjbNuHqeFK?=
 =?iso-8859-1?Q?ODufP4yXQYW7iUlShnDCGT5ULXOFjTVimqy7yi086dROhgy6fQPAE8/Kcy?=
 =?iso-8859-1?Q?36xRSh4pFlnlwpDCtkQevyPQpwKl20RVPzQ2CUK4KzKrKUcVWhXpu/Fm7x?=
 =?iso-8859-1?Q?so+kD/uCfmNFQVrvvrHP3oCgy8t3hy/R8lxZRnjYaf960EanKPihYI1qW6?=
 =?iso-8859-1?Q?9vItciVLKjlLlf0qpCo4d1Av5g88kJl6/XXjPNoPRGz/dmD+KkEz7gJE5B?=
 =?iso-8859-1?Q?z3tGlrwyYh59/LYMSU/bx6keIj4MCjwboaYFaKRkK4yqqSYSxl/3hazPif?=
 =?iso-8859-1?Q?mRKdR+irqxjMtOVhHad0fGixZOID75KSvTqynI8w4qwqe3s7IVXGAlUPq1?=
 =?iso-8859-1?Q?G+T3Ph3WSN7OXt61rtaJJvXpr/gjmZjGjwUjmWcv7tqmMItJjcjPYqgXPF?=
 =?iso-8859-1?Q?eGs5Gf+yJdP0alxYl8uf/v3qQ7mTMZwueIwxsr4hdKpANQ?=
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
	H5T1bRg0L54o+zh9OQBkBCJCOLc6sHLhK3PbHe0V6L99nOaQmw1vtfuTJScUQfZEitjfLTXBP1hwbW5Mjnk18cS8aH07jjPW4T8JTRywsjQvvKb24diSIk2DocrWQvmsnpK20Tx1L+D1L2G9AP+WhAwPBtWlUAfX0aTcVGcxMY29bxCqSPw2OeHR2iGyA4tgxDu9t+IVXKfOLbx4DJQsf1839zkaekUmqKox1UzT8HkyDdqHfP7Vfa525ccTzs2UdRthbg1fkYbQCfAKObNLB1pV/i2Q6NfjNMVANaRNpWilnYNTdwV2cbMpSDsZcXyVWEW6nxSYOunBSlknS80jVw==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6e3234-97fd-4f26-514a-08df4690907b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:59.9898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvhAjizV3MG6tYsT3pGELPUqLI35F8VHXJkJIQuRl7yfEaSlZvzmLQ+HTgYz/KWdMK+2MM3vfkOB+po4hCRuFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6C2DD1D15
X-MDID: 1795129087-6JAcdRi5Aovb
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1795129087;6JAcdRi5Aovb;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
An output's state says whether it carries a signal: CONNECTED while it=0A=
drives, DISCONNECTED while muted. Setting it forces the output's pads to=0A=
Hi-Z, which leaves the divider alone. Output pins are registered from=0A=
this patch on.=0A=
=0A=
A mute forces the slot's three Hi-Z pairs, differential, CMOS OutP and=0A=
CMOS OutN, with the Page 3 debug window open; the force registers are=0A=
outside the NVM, so no programming directive is written. An un-mute=0A=
releases the force and the pads return to the loaded configuration. An=0A=
output is reported muted only when both pads are forced off.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/core.c | 313 +++++++++++++++++++++++++++++------=0A=
 drivers/dpll/sit9531x/core.h |  15 ++=0A=
 drivers/dpll/sit9531x/dpll.c | 142 +++++++++++++++-=0A=
 3 files changed, 415 insertions(+), 55 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
index d3f6955b3bbd..eb1d10e1fde2 100644=0A=
--- a/drivers/dpll/sit9531x/core.c=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -460,12 +460,78 @@ static int sit9531x_output_forced_hiz(struct sit9531x=
_dev *sitdev,=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+/* Re-read an output's mute state. Caller must hold sitdev->multiop_lock. =
*/=0A=
+int sit9531x_output_state_refresh(struct sit9531x_dev *sitdev, u8 out_idx)=
=0A=
+{=0A=
+	bool muted, part;=0A=
+	int rc;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	rc =3D sit9531x_output_forced_hiz(sitdev, out_idx, &muted, &part);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	sitdev->out[out_idx].enabled =3D !muted;=0A=
+	sitdev->out[out_idx].part_muted =3D part;=0A=
+	sitdev->out[out_idx].state_stale =3D false;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int sit9531x_hiz_set_bit(struct sit9531x_dev *sitdev,=0A=
+				unsigned int reg, u8 bit, bool set)=0A=
+{=0A=
+	u8 cur, new_val;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_read_u8(sitdev, reg, &cur);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	new_val =3D set ? (cur | BIT(bit)) : (cur & ~BIT(bit));=0A=
+=0A=
+	return sit9531x_write_u8(sitdev, reg, new_val);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * The Page 3 debug key opens every debug register of the output system wh=
ile=0A=
+ * it holds the unlock value.=0A=
+ */=0A=
+static int sit9531x_outsys_debug_open(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
+			       SIT9531X_DEBUG_UNLOCK_VAL);=0A=
+	if (rc)=0A=
+		sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
+				     SIT9531X_DEBUG_LOCK_VAL);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static void sit9531x_outsys_debug_close(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
+				  SIT9531X_DEBUG_LOCK_VAL);=0A=
+	sitdev->outsys_key_pending =3D !!rc;=0A=
+	if (rc)=0A=
+		dev_warn(sitdev->dev, "output debug block left unlocked: %d\n",=0A=
+			 rc);=0A=
+}=0A=
+=0A=
 #define SIT9531X_LOOP_LOCK_TRIES	3=0A=
 =0A=
-/* Close the loops and lock the debug block without committing */=0A=
-static void sit9531x_prg_abort(struct sit9531x_dev *sitdev)=0A=
+/*=0A=
+ * Leave PRG_CMD: re-lock the loops and close the debug window. The sleep =
is=0A=
+ * the settling time after loop lock.=0A=
+ */=0A=
+static int sit9531x_prg_relock(struct sit9531x_dev *sitdev)=0A=
 {=0A=
-	int rc =3D -EIO;=0A=
+	int rc =3D 0;=0A=
 	u8 attempt;=0A=
 =0A=
 	for (attempt =3D 0; attempt < SIT9531X_LOOP_LOCK_TRIES; attempt++) {=0A=
@@ -477,30 +543,49 @@ static void sit9531x_prg_abort(struct sit9531x_dev *s=
itdev)=0A=
 	}=0A=
 	if (rc)=0A=
 		dev_err(sitdev->dev,=0A=
-			"output loops left unlocked after a failed entry: %d\n",=0A=
+			"output loops left unlocked after programming: %d\n",=0A=
 			rc);=0A=
 =0A=
-	sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
-			  SIT9531X_DEBUG_LOCK_VAL);=0A=
+	sitdev->loops_open =3D !!rc;=0A=
+=0A=
+	msleep(100);=0A=
+=0A=
+	sit9531x_outsys_debug_close(sitdev);=0A=
+=0A=
+	return rc;=0A=
 }=0A=
 =0A=
 /*=0A=
- * Unlock the Page 3 debug registers and enter PRG_CMD; output-system writ=
es=0A=
- * take effect only in this state.=0A=
+ * Update the NVM bank and leave PRG_CMD. The bank update is issued once p=
er=0A=
+ * programming sequence; a loop re-lock retried later does not repeat it.=
=0A=
+ */=0A=
+static int sit9531x_prg_commit(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	int rc, rc2;=0A=
+=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,=0A=
+			       SIT9531X_UPDATE_NVM);=0A=
+	rc2 =3D sit9531x_prg_relock(sitdev);=0A=
+=0A=
+	return rc ? rc : rc2;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Open the Page 3 debug window and enter PRG_CMD; the output divider take=
s=0A=
+ * effect only in this state.=0A=
  */=0A=
 static int sit9531x_prg_enter(struct sit9531x_dev *sitdev)=0A=
 {=0A=
 	int rc;=0A=
 =0A=
-	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
-			       SIT9531X_DEBUG_UNLOCK_VAL);=0A=
+	rc =3D sit9531x_outsys_debug_open(sitdev);=0A=
 	if (rc)=0A=
 		return rc;=0A=
 =0A=
 	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,=0A=
 			       SIT9531X_PRG_CMD_STATE);=0A=
 	if (rc) {=0A=
-		sit9531x_prg_abort(sitdev);=0A=
+		sit9531x_prg_relock(sitdev);=0A=
 		return rc;=0A=
 	}=0A=
 =0A=
@@ -508,51 +593,144 @@ static int sit9531x_prg_enter(struct sit9531x_dev *s=
itdev)=0A=
 }=0A=
 =0A=
 /*=0A=
- * Update the NVM shadow and re-lock the loops after sit9531x_prg_enter().=
 The=0A=
- * sleep is the settling time after loop lock.=0A=
+ * Mute or unmute every Hi-Z pair of a slot. The force registers are outsi=
de=0A=
+ * the NVM, so no directive is written, as in Output_Disable_Control_HiZ.p=
y.=0A=
+ * Caller must hold the debug window open.=0A=
  */=0A=
-static int sit9531x_prg_commit(struct sit9531x_dev *sitdev)=0A=
+static int sit9531x_output_hiz_write(struct sit9531x_dev *sitdev, u8 slot,=
=0A=
+				     bool mute, u8 keep)=0A=
 {=0A=
-	int rc, rc2 =3D 0, rc3;=0A=
-	u8 attempt;=0A=
+	u8 mask[SIT9531X_HIZ_PAIRS], state[SIT9531X_HIZ_PAIRS];=0A=
+	struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];=0A=
+	int i, rc, undo_rc;=0A=
 =0A=
-	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,=0A=
-			       SIT9531X_UPDATE_NVM);=0A=
+	sit9531x_output_get_hiz_regs(slot, p);=0A=
 =0A=
-	for (attempt =3D 0; attempt < SIT9531X_LOOP_LOCK_TRIES; attempt++) {=0A=
-		rc2 =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,=0A=
-					SIT9531X_LOOP_LOCK);=0A=
-		if (!rc2)=0A=
-			break;=0A=
-		usleep_range(1000, 2000);=0A=
+	if (!mute) {=0A=
+		for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {=0A=
+			/* A pad the loaded configuration forces stays forced */=0A=
+			if (keep & BIT(i))=0A=
+				continue;=0A=
+			rc =3D sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,=0A=
+						  false);=0A=
+			if (rc)=0A=
+				return rc;=0A=
+		}=0A=
+		return 0;=0A=
 	}=0A=
-	if (rc2)=0A=
-		dev_err(sitdev->dev,=0A=
-			"output loops left unlocked after programming: %d\n",=0A=
-			rc2);=0A=
 =0A=
-	sitdev->loops_open =3D !!rc2;=0A=
-=0A=
-	msleep(100);=0A=
+	for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {=0A=
+		rc =3D sit9531x_read_u8(sitdev, p[i].state, &state[i]);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+		rc =3D sit9531x_read_u8(sitdev, p[i].mask, &mask[i]);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+	}=0A=
 =0A=
 	/*=0A=
-	 * The debug key register unlocks every debug register while it holds=0A=
-	 * the unlock value.=0A=
+	 * STATE before MASK: enabling the override first can drive the pad for=
=0A=
+	 * one I2C transfer.=0A=
 	 */=0A=
-	rc3 =3D sit9531x_write_close(sitdev, SIT9531X_REG_OUTSYS_DEBUG,=0A=
-				   SIT9531X_DEBUG_LOCK_VAL);=0A=
+	for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {=0A=
+		rc =3D sit9531x_hiz_set_bit(sitdev, p[i].state, p[i].bit, false);=0A=
+		if (!rc)=0A=
+			rc =3D sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,=0A=
+						  true);=0A=
+		if (rc)=0A=
+			break;=0A=
+	}=0A=
+	if (!rc)=0A=
+		return 0;=0A=
 =0A=
+	for (; i >=3D 0; i--) {=0A=
+		u8 bit =3D BIT(p[i].bit);=0A=
+=0A=
+		undo_rc =3D sit9531x_hiz_set_bit(sitdev, p[i].mask, p[i].bit,=0A=
+					       mask[i] & bit);=0A=
+		if (!undo_rc)=0A=
+			undo_rc =3D sit9531x_hiz_set_bit(sitdev, p[i].state,=0A=
+						       p[i].bit,=0A=
+						       state[i] & bit);=0A=
+		if (undo_rc)=0A=
+			dev_err(sitdev->dev,=0A=
+				"slot%u: Hi-Z override left part applied (%d)\n",=0A=
+				slot, undo_rc);=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/* Caller must hold sitdev->multiop_lock. */=0A=
+int sit9531x_output_disable(struct sit9531x_dev *sitdev, u8 index)=0A=
+{=0A=
+	const struct sit9531x_chip_info *info =3D sitdev->info;=0A=
+	int rc, state_rc;=0A=
+	bool muted, part;=0A=
+	u8 slot;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (index >=3D info->num_outputs)=0A=
+		return -EINVAL;=0A=
+=0A=
+	slot =3D info->clkout_map[index];=0A=
+	rc =3D sit9531x_outsys_debug_open(sitdev);=0A=
 	if (rc)=0A=
 		return rc;=0A=
-	if (rc2)=0A=
-		return rc2;=0A=
 =0A=
-	if (rc3)=0A=
-		dev_warn(sitdev->dev,=0A=
-			 "output debug block left unlocked after programming: %d\n",=0A=
-			 rc3);=0A=
+	rc =3D sit9531x_output_hiz_write(sitdev, slot, true, 0);=0A=
+	sit9531x_outsys_debug_close(sitdev);=0A=
 =0A=
-	return 0;=0A=
+	/* Read back the Hi-Z state */=0A=
+	state_rc =3D sit9531x_output_forced_hiz(sitdev, index, &muted, &part);=0A=
+	if (!state_rc) {=0A=
+		sitdev->out[index].enabled =3D !muted;=0A=
+		sitdev->out[index].part_muted =3D part;=0A=
+		sitdev->out[index].state_stale =3D false;=0A=
+	} else {=0A=
+		sitdev->out[index].state_stale =3D true;=0A=
+		if (!rc)=0A=
+			rc =3D state_rc;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/* Caller must hold sitdev->multiop_lock. */=0A=
+int sit9531x_output_enable(struct sit9531x_dev *sitdev, u8 index)=0A=
+{=0A=
+	const struct sit9531x_chip_info *info =3D sitdev->info;=0A=
+	int rc, state_rc;=0A=
+	bool muted, part;=0A=
+	u8 slot;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (index >=3D info->num_outputs)=0A=
+		return -EINVAL;=0A=
+=0A=
+	slot =3D info->clkout_map[index];=0A=
+	rc =3D sit9531x_outsys_debug_open(sitdev);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D sit9531x_output_hiz_write(sitdev, slot, false,=0A=
+				       sitdev->out[index].hiz_keep);=0A=
+	sit9531x_outsys_debug_close(sitdev);=0A=
+=0A=
+	state_rc =3D sit9531x_output_forced_hiz(sitdev, index, &muted, &part);=0A=
+	if (!state_rc) {=0A=
+		sitdev->out[index].enabled =3D !muted;=0A=
+		sitdev->out[index].part_muted =3D part;=0A=
+		sitdev->out[index].state_stale =3D false;=0A=
+	} else {=0A=
+		sitdev->out[index].state_stale =3D true;=0A=
+		if (!rc)=0A=
+			rc =3D state_rc;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
 }=0A=
 =0A=
 /*=0A=
@@ -2085,6 +2263,24 @@ static int sit9531x_out_state_fetch(struct sit9531x_=
dev *sitdev, u8 index)=0A=
 		return rc;=0A=
 =0A=
 	sitdev->out[index].part_muted =3D part;=0A=
+	sitdev->out[index].state_stale =3D false;=0A=
+=0A=
+	/* Record the pads the loaded configuration forces on a driven output */=
=0A=
+	out->hiz_keep =3D 0;=0A=
+	if (part) {=0A=
+		struct sit9531x_hiz_pair p[SIT9531X_HIZ_PAIRS];=0A=
+		bool forced;=0A=
+		int i;=0A=
+=0A=
+		sit9531x_output_get_hiz_regs(slot, p);=0A=
+		for (i =3D 0; i < SIT9531X_HIZ_PAIRS; i++) {=0A=
+			rc =3D sit9531x_hiz_pair_forced(sitdev, &p[i], &forced);=0A=
+			if (rc)=0A=
+				return rc;=0A=
+			if (forced)=0A=
+				out->hiz_keep |=3D BIT(i);=0A=
+		}=0A=
+	}=0A=
 =0A=
 	/*=0A=
 	 * Each PLL page holds a 12-bit output-enable mask: OUT_MAP_LO bits 0-7=
=0A=
@@ -2445,7 +2641,9 @@ sit9531x_dev_chan_states_update(struct sit9531x_dev *=
sitdev)=0A=
 =0A=
 	/* Retry pending writes first so the reads below see their result */=0A=
 	if (sitdev->loops_open)=0A=
-		sit9531x_prg_commit(sitdev);=0A=
+		sit9531x_prg_relock(sitdev);=0A=
+	else if (sitdev->outsys_key_pending)=0A=
+		sit9531x_outsys_debug_close(sitdev);=0A=
 =0A=
 	sit9531x_input_off_retry(sitdev);=0A=
 	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
@@ -2772,10 +2970,12 @@ static void sit9531x_dev_stop(struct sit9531x_dev *=
sitdev)=0A=
 =0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	if (sitdev->loops_open) {=0A=
-		sit9531x_prg_commit(sitdev);=0A=
+		sit9531x_prg_relock(sitdev);=0A=
 		if (sitdev->loops_open)=0A=
 			dev_warn(sitdev->dev,=0A=
 				 "output loops left unlocked at removal\n");=0A=
+	} else if (sitdev->outsys_key_pending) {=0A=
+		sit9531x_outsys_debug_close(sitdev);=0A=
 	}=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
 }=0A=
@@ -2855,7 +3055,7 @@ static void sit9531x_dpll_pin_unregister(struct sit95=
31x_dpll_pin *pin)=0A=
 	 * Clear before unregistering: callbacks test it under the DPLL device=0A=
 	 * lock, which dpll_pin_unregister() also takes.=0A=
 	 */=0A=
-	pin->dpll_pin =3D NULL;=0A=
+	WRITE_ONCE(pin->dpll_pin, NULL);=0A=
 =0A=
 	dpll_pin_unregister(sitdpll->dpll_dev, dpll_pin, ops, pin);=0A=
 	dpll_pin_put(dpll_pin, &pin->tracker);=0A=
@@ -2891,20 +3091,33 @@ static void sit9531x_dpll_pins_unregister(struct si=
t9531x_dpll *sitdpll)=0A=
 	}=0A=
 }=0A=
 =0A=
-/* Check if the pin class has a state callback, which the DPLL core requir=
es */=0A=
+/*=0A=
+ * An output is registered when routed to this DPLL, whether or not it is=
=0A=
+ * driving.=0A=
+ */=0A=
 static bool sit9531x_dpll_pin_is_registrable(struct sit9531x_dpll *sitdpll=
,=0A=
 					     enum dpll_pin_direction dir,=0A=
 					     u8 index)=0A=
 {=0A=
 	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
 =0A=
-	if (dir !=3D DPLL_PIN_DIRECTION_INPUT)=0A=
+	if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT) {=0A=
+		if (index =3D=3D SIT9531X_MAX_INPUTS)=0A=
+			return true;=0A=
+		if (index =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
+			return false;=0A=
+=0A=
+		return sit9531x_input_pin_is_registrable(sitdev, index);=0A=
+	}=0A=
+=0A=
+	if (index =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID)=0A=
 		return false;=0A=
 =0A=
-	if (index =3D=3D SIT9531X_MAX_INPUTS)=0A=
-		return true;=0A=
+	if (index >=3D sitdev->info->num_outputs)=0A=
+		return false;=0A=
 =0A=
-	return sit9531x_input_pin_is_registrable(sitdev, index);=0A=
+	return sitdev->out[index].pll_idx =3D=3D sitdpll->id &&=0A=
+	       sitdev->out[index].routed;=0A=
 }=0A=
 =0A=
 static int sit9531x_dpll_pins_register(struct sit9531x_dpll *sitdpll)=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index 669f9f9b960c..17b41c4ca692 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -101,8 +101,13 @@ struct sit9531x_ref {=0A=
  * @freq: output frequency in Hz=0A=
  * @enabled: output is driving, not forced into Hi-Z=0A=
  * @cmos: single-ended; the CMOS pad Hi-Z pairs apply, not the differentia=
l one=0A=
+ * @state_stale: cached mute state must be read back before it is reported=
=0A=
+ * @ntf_pending: pin change not yet notified; the poll notifies once the s=
tate=0A=
+ *   is read=0A=
  * @part_muted: single-ended with one pad forced and the other not; report=
ed=0A=
  *   as driven. The driver's mute forces both pads.=0A=
+ * @hiz_keep: bit per Hi-Z pair the loaded configuration forces on an outp=
ut=0A=
+ *   found part muted at probe; an unmute leaves those pairs forced=0A=
  * @routed: mapped to @pll_idx by the initial configuration; an unrouted=
=0A=
  *   output has no pin=0A=
  * @pll_idx: PLL driving this output (0-3)=0A=
@@ -111,7 +116,10 @@ struct sit9531x_out {=0A=
 	u64		freq;=0A=
 	bool		enabled;=0A=
 	bool		cmos;=0A=
+	bool		state_stale;=0A=
+	bool		ntf_pending;=0A=
 	bool		part_muted;=0A=
+	u8		hiz_keep;=0A=
 	bool		routed;=0A=
 	u8		pll_idx;=0A=
 };=0A=
@@ -206,6 +214,7 @@ struct sit9531x_chan {=0A=
  * @fvco_band_warned: bit per PLL warned for Fref * DIVN outside its VCO=
=0A=
  *   band; written under @multiop_lock=0A=
  * @loops_open: output loops not yet re-locked=0A=
+ * @outsys_key_pending: output-system debug key not closed=0A=
  */=0A=
 struct sit9531x_dev {=0A=
 	struct device			*dev;=0A=
@@ -237,6 +246,7 @@ struct sit9531x_dev {=0A=
 	s8			intsync_src;=0A=
 =0A=
 	bool			loops_open;=0A=
+	bool			outsys_key_pending;=0A=
 };=0A=
 =0A=
 int sit9531x_read_u8(struct sit9531x_dev *sitdev, unsigned int reg,=0A=
@@ -264,6 +274,11 @@ int sit9531x_input_prio_remove(struct sit9531x_dev *si=
tdev, u8 pll_idx,=0A=
 int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
 			    u8 input_idx);=0A=
 =0A=
+int sit9531x_output_disable(struct sit9531x_dev *sitdev, u8 index);=0A=
+int sit9531x_output_enable(struct sit9531x_dev *sitdev, u8 index);=0A=
+int sit9531x_output_state_refresh(struct sit9531x_dev *sitdev,=0A=
+				  u8 out_idx);=0A=
+=0A=
 int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
 			     u8 pll_idx, u64 frequency);=0A=
 int sit9531x_output_freq_get(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c=0A=
index c8c4aaaf719c..e19eb123d024 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.c=0A=
+++ b/drivers/dpll/sit9531x/dpll.c=0A=
@@ -184,8 +184,9 @@ const struct dpll_device_ops sit9531x_dpll_device_ops =
=3D {=0A=
  * NO_SIGNAL on loss of signal; QUAL_FAILED on frequency drift; STANDBY=0A=
  * otherwise. The routed reference is used because on loss of signal the d=
evice=0A=
  * falls back to another listed source and leaves the selection naming the=
 lost=0A=
- * one. On manual input select, the routed input is CONNECTED. The XO pin =
is=0A=
- * always CONNECTED.=0A=
+ * one. On manual input select, the routed input is CONNECTED. An output i=
s=0A=
+ * CONNECTED while driven and DISCONNECTED while muted; SELECTABLE is refu=
sed.=0A=
+ * The XO pin is always CONNECTED.=0A=
  */=0A=
 =0A=
 /* Caller must hold sitdev->multiop_lock. */=0A=
@@ -638,10 +639,113 @@ sit9531x_dpll_output_pin_frequency_set(const struct =
dpll_pin *pin,=0A=
 	return rc;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * DISCONNECTED while the output is forced to Hi-Z, by a mute request or b=
y the=0A=
+ * loaded profile.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_output_pin_state_on_dpll_get(const struct dpll_pin *pin,=0A=
+					   void *pin_priv,=0A=
+					   const struct dpll_device *dpll,=0A=
+					   void *dpll_priv,=0A=
+					   enum dpll_pin_state *state,=0A=
+					   struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	const struct sit9531x_out *out;=0A=
+	int rc =3D 0;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	out =3D sit9531x_out_state_get(sitdev, dpin->id);=0A=
+	if (out->state_stale)=0A=
+		rc =3D sit9531x_output_state_refresh(sitdev, dpin->id);=0A=
+	if (!rc)=0A=
+		*state =3D out->enabled ? DPLL_PIN_STATE_CONNECTED=0A=
+				      : DPLL_PIN_STATE_DISCONNECTED;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+	if (rc)=0A=
+		NL_SET_ERR_MSG(extack,=0A=
+			       "Output mute state could not be read back");=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Force Hi-Z through the slot's Hi-Z force/state register pairs: differen=
tial,=0A=
+ * CMOS OutP and CMOS OutN.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_output_pin_state_on_dpll_set(const struct dpll_pin *pin,=0A=
+					   void *pin_priv,=0A=
+					   const struct dpll_device *dpll,=0A=
+					   void *dpll_priv,=0A=
+					   enum dpll_pin_state state,=0A=
+					   struct netlink_ext_ack *extack)=0A=
+{=0A=
+	bool enable =3D state =3D=3D DPLL_PIN_STATE_CONNECTED;=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	bool was_enabled, changed;=0A=
+	int rc;=0A=
+=0A=
+	/* An output is routed explicitly, not a selection candidate */=0A=
+	if (!enable && state !=3D DPLL_PIN_STATE_DISCONNECTED)=0A=
+		return -EINVAL;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+=0A=
+	/*=0A=
+	 * Skip a request for the current state. One CMOS pad forced and the=0A=
+	 * other not is neither state.=0A=
+	 */=0A=
+	if (!sit9531x_output_state_refresh(sitdev, dpin->id) &&=0A=
+	    sitdev->out[dpin->id].enabled =3D=3D enable &&=0A=
+	    !sitdev->out[dpin->id].part_muted) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	was_enabled =3D sitdev->out[dpin->id].enabled;=0A=
+=0A=
+	if (enable)=0A=
+		rc =3D sit9531x_output_enable(sitdev, dpin->id);=0A=
+	else=0A=
+		rc =3D sit9531x_output_disable(sitdev, dpin->id);=0A=
+=0A=
+	changed =3D sitdev->out[dpin->id].enabled !=3D was_enabled ||=0A=
+		  sitdev->out[dpin->id].state_stale;=0A=
+=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rc) {=0A=
+		struct dpll_pin *dpll_pin;=0A=
+=0A=
+		NL_SET_ERR_MSG(extack, "Failed to set output pin state");=0A=
+		/*=0A=
+		 * The core notifies only a request that succeeded. Teardown=0A=
+		 * clears dpll_pin without the core's lock, which is held here;=0A=
+		 * read it once, as a set handle stays valid until this returns.=0A=
+		 */=0A=
+		dpll_pin =3D READ_ONCE(dpin->dpll_pin);=0A=
+		if (changed && dpll_pin && __dpll_pin_change_ntf(dpll_pin)) {=0A=
+			mutex_lock(&sitdev->multiop_lock);=0A=
+			sitdev->out[dpin->id].ntf_pending =3D true;=0A=
+			mutex_unlock(&sitdev->multiop_lock);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
 static const struct dpll_pin_ops sit9531x_dpll_output_pin_ops =3D {=0A=
 	.direction_get		=3D sit9531x_dpll_output_pin_direction_get,=0A=
 	.frequency_get		=3D sit9531x_dpll_output_pin_frequency_get,=0A=
 	.frequency_set		=3D sit9531x_dpll_output_pin_frequency_set,=0A=
+	.state_on_dpll_get	=3D sit9531x_dpll_output_pin_state_on_dpll_get,=0A=
+	.state_on_dpll_set	=3D sit9531x_dpll_output_pin_state_on_dpll_set,=0A=
 };=0A=
 =0A=
 const struct dpll_pin_ops *=0A=
@@ -706,8 +810,33 @@ void sit9531x_dpll_pin_baseline(struct sit9531x_dpll_p=
in *pin)=0A=
 }=0A=
 =0A=
 /*=0A=
- * Notify a changed lock status, pin state or priority; called from=0A=
- * sit9531x_dev_periodic_work().=0A=
+ * Re-read an output with a pending change notification; return true once =
the=0A=
+ * read succeeds. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+static bool=0A=
+sit9531x_dpll_output_ntf_pending(struct sit9531x_dev *sitdev,=0A=
+				 const struct sit9531x_dpll_pin *pin)=0A=
+{=0A=
+	struct sit9531x_out *out;=0A=
+=0A=
+	if (sit9531x_dpll_is_input_pin(pin) ||=0A=
+	    pin->id >=3D sitdev->info->num_outputs)=0A=
+		return false;=0A=
+=0A=
+	out =3D &sitdev->out[pin->id];=0A=
+	if (!out->ntf_pending)=0A=
+		return false;=0A=
+	if (out->state_stale && sit9531x_output_state_refresh(sitdev, pin->id))=
=0A=
+		return false;=0A=
+=0A=
+	out->ntf_pending =3D false;=0A=
+=0A=
+	return true;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Notify a changed lock status, pin state, operational state or priority =
and=0A=
+ * retry a notification that failed; called from sit9531x_dev_periodic_wor=
k().=0A=
  */=0A=
 void sit9531x_dpll_changes_check(struct sit9531x_dpll *sitdpll)=0A=
 {=0A=
@@ -746,8 +875,11 @@ void sit9531x_dpll_changes_check(struct sit9531x_dpll =
*sitdpll)=0A=
 		bool changed;=0A=
 		u8 prio;=0A=
 =0A=
-		if (!sit9531x_dpll_is_selection_pin(pin))=0A=
+		if (!sit9531x_dpll_is_selection_pin(pin)) {=0A=
+			pin->ntf_pending |=3D=0A=
+				sit9531x_dpll_output_ntf_pending(sitdev, pin);=0A=
 			continue;=0A=
+		}=0A=
 =0A=
 		sit9531x_dpll_pin_snapshot(sitdpll, pin, &state, &operstate,=0A=
 					   &prio);=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
