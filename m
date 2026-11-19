Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129080;
	b=XTN4+0ktf1d909Ni9cce7qxRyWCu3jYkvatwNa6w46HuEqu7OMmY18RcZl4G2kHCcinz
	 ud94s5Ga/rnemO3Wv9PJlscixS2EK64vK9DZLIWn7ZNAkrmqWKnLMs49YQbfK/C+wNcnU
	 IlM2ZjZstiQD+YdfFDN1TCC2YoCGW6LZWCfK2c9QxH9PTAPHRQfIojKXOKlJfDKj5vO3n
	 cIyQZfeVbxUFVG5u48WrsiT3VrgkGyxUamgKUM/9I/N+yudLhG7CuNLFgFXtAD+SYDCU/
	 HedWtF4hYH7lOWqrbL5+nDyuw9WzS5tk08L4FNa9b8Xh/FSXLQbuyNF3qe5yhACUFbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129080;
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
	bh=7ajwQ3+SC3HUCzBCRgp4yis1WkABC9Pgzhm4LmIR4AA=;
	b=Q9rJzTeYCBLl4eQtsNAtlkDklHEfo1K9k56kvCtDoaYgIr1esv5hoETIdYOLDJqyxIj2
	 uG6qi0bqTJ5ZG13RtN4isxxSX+dAp/Byx8FLgskEjE0j4/64Z9Qymn6yefZ3HgTXPoPFU
	 ot3UmWsZaei9ORNqxUeo/nxtqcAmt5XugHtyZ6X9+jy2k3c8dwshxAVoWZT3Y02YIoNlY
	 fCUl4D6nuvecETcic02/BQiE+VbgTsJuMMtfuzqPwmibrH4if8m/huD3kOfZpe+WtkvVb
	 y6Z3AebnGtk6+kIEIYrElyuZ3m7DLu4gnsy/pyJ2pFkauCae10Q/9FDlYmrxLiW1Cig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=SEjCIxvQ;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=0eJZvDsm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75C606A326;
	Thu, 19 Nov 2026 22:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D75C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=SEjCIxvQ;
	dkim=pass (2048-bit key, unprotected) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=0eJZvDsm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=7ajwQ3+SC3HUCzBCRgp4yis1WkABC9Pgzhm4LmIR4AA=;
 b=SEjCIxvQJDDHrgbMmmhj2ltf+iDWa1gw6LEWEcEiXJCNXjUIbrgSqlVh+jjh46wVmU8jw+Frl6egFc0mzWHT0r5Gdtg87tOIQGaldAAvRVc7pcYVFMzqFtXHeVEGvYVUCvYAgdBpjIJYMXNcjwukqONywIbo+rPlBL0KG/F6Y8lWAeQfo2yaHzer409xomBlP9SRg86ujbR2QcAOV2OIFqW/EUBkqJfl6EeINTG+wVKHS+ht9xtx+o9EieiCofu++9GBearBIJR8h4Bfe0H/qwpXIig/HMxo4EqFqM6CsyqQHt4QB/7YhHgTdWA6h3nNQJ7JY9EZFE4YnAuEDb+BzQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 72481900071;
	Thu, 19 Nov 2026 22:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktLbQSRxD5xb8TcTpi5cQrpp8s2//uxTfR//zwbcAtQYxXyUNp+0dyc+ksZpTrbbOCE3YontCUbm1wnYfnrOKr/Gcbv4eQIG2MIuvqvDo+h4eAj4N+S/epfEE5hY3tEA+9BKWXoP4iXz5yZydqZ6fafnfyuIN3xgY8qaH43UiaJM+g8MP1rRBvxpf2vfvlhNfHh67YP0XhRjzIEyJsM4Z1Iv+t6/Rq6qOVwv/zJ9gRoo4wRjpfzFGrJGySHdyMoyr1WLNc+1jDFvsrDNajGCdDepDttdW0Aqyi5dk3oH1RbIfig9K6JKiAEF7ddWeNa9eHNM7jytkd2kc6VeCtKFaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ajwQ3+SC3HUCzBCRgp4yis1WkABC9Pgzhm4LmIR4AA=;
 b=bCwpOnvSYYvYK+Gf7JxZq8OIlHH4LPKUbOoh/3StkVJ2RHpMMLd/EXXGhAnC3M6ojY3T8cWNBgOqK3BguwysMPnBixAOOvrGyxD3TNXMfBm56rbY+TTErCw6BDSfn7N1Nknpj3QMqzaO2yArUhZAqQLnaJD/KtlYLdCbz0eGi3mTzzLvQF12Ob2XOq+zbHq97GsGNCz9+Gsg/Cfzj1wRrutcfurGm+27zheYEJta+VXSZywYgQQU6kJhs+ZWEjfon29HGnLp/yoTLOtXyN/nTfkeAUzGBYcWxaVK+0ye4Qx1xmjoUdAizcL84Xahv/WpAHcgUJaapaSVP8N9oMpTFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ajwQ3+SC3HUCzBCRgp4yis1WkABC9Pgzhm4LmIR4AA=;
 b=0eJZvDsm9KoBCvIqGDvdtHHfUR6WvBytFVWv7CvVtBDm48ihnWU8K8UFHOChP9pj3xTtbb31Pz8dakXeIX5DX6JUDWx1cTK2TjSERQ88pj55WE9vNLVYgNAKYjvvRxBIT7RGOKD4VvB/2t1PE0gzGFy4suOsoJ3ILrNxQoFfWBgt5rh/WEvDMNcx6owkouJQJeJNzxf5wFkdDvOXrU56/tNgAy2QZjGEWWGlXLSdJKTS07YxQynVylJvX3/w/0ouLvk2CUaEGbUY+x0mNkwnSSNKxWdWu8PctgGzkQTXddT6DFMnmVRdsdw+qGfIpKghhTWA+c2+EoATfXMUCqZqNA==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:57:54 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:57:54 +0000
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
Subject: [PATCH net-next v16 02/13] dt-bindings: vendor-prefixes: add SiTime
 Corporation
Thread-Topic: [PATCH net-next v16 02/13] dt-bindings: vendor-prefixes: add
 SiTime Corporation
Thread-Index: AQHdeHlpKX+C9gPUu0KmE1TvGHClRw==
Date: Thu, 19 Nov 2026 22:57:54 +0000
Message-ID: <20261119225752.41846-3-arouhi@sitime.com>
References: <20261119225752.41846-1-arouhi@sitime.com>
In-Reply-To: <20261119225752.41846-1-arouhi@sitime.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR20MB994924:EE_|PH0PR20MB4352:EE_
x-ms-office365-filtering-correlation-id: 410559e8-a558-4d5d-a795-08df46908c07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|261009223027099003|22082099003|56012099006|261102123227099003|261026121527099003|261021121427099003|261022113327099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 r4hYSyV5WouXtFgViuht9cvpxry6yFMtA4ex+rKULmQADTjlDeyQ5LAq4mxrA0z+9Py/4R6ccu+DYBlviWC97mYDZg1Mf09lbvbvhxPIdN+L2kcOucXD/bdeMdrTk4Mb6VfcL+yDOItxk8gC5jwnbJAEyfKUymKpwz5zoWl3ccqa5+u7iLDoAPqoNxBYnImFQ3fgno2C3qxxclOg2LnLp8GXWeKuTfjr/5KuOC5YUpX19eVBydTRVif7Ia0m89qlyqvbhPhcSHpBA8aC4u2RxsJwXRcKb2/6k9WTmUwGgY9BQTgtRUHdHLp+aR9f/GV0RyyfeRmwELb6/cEVgXhxZD80ixQpm907UFEsDJqhz9yy9HZTBJWoJYTOMsvrCis7GXfegAIPXtcJUSxrYxPKcsNm0V2YNc2tRWxFAedgMhZfBp2OUclafD+9MeMTfjgY/h72a/KD/Z3mjTTtsHpQEZDUO4o5ovkmjS3b7L5afqYcni39eH6ulxWAzfDBmyiN0Q01px8S7zGhjLh+pHJoAKT0t2yN6yChjDryKYgHH2+zH55FPli9ZGVTYiIuCxpYX9+u7qxqq3+i9YeUvwVvp1JyCdc3IyHTTHdnuIZlrHMfctnnzY8ajc5yiaIZRW25DgdYBb2dgdyZA2aMmKIVasjbE+DqgXNmsQ+23irJ0vhyGpTKDIzT5jTMa8SXDFvA7O7bilQiHGuT7pYIu3u+TRJUGteyD/Cm7MNIURVG3QY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(261009223027099003)(22082099003)(56012099006)(261102123227099003)(261026121527099003)(261021121427099003)(261022113327099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?X1qWkccFscMmSU8ar8e/TqNjX8jJwJIgHuSipQbejB6UByaixUpfFY9iLf?=
 =?iso-8859-1?Q?fj+Upxbh7IdXhZg4Wx4h6/aytmbBuo+K31ewjA+FMlTRAAxGKHjGusq6ZC?=
 =?iso-8859-1?Q?/J2FrfHDRI3/XaSYnDesGvBALgmv8RzAe6kd9q9TDnjoVY5NTT+Guw251K?=
 =?iso-8859-1?Q?Wz9iDsTI1pKGVTq1q4Idw0Kp4Gw3oqZBdc2vOhhuJ4S+pSMP5ro0hhIioF?=
 =?iso-8859-1?Q?VdNTFv71Duk1Bu2b4Xz2p/i2wSYJSsjwbFaYBJj6Ym8peuWQUlm0cVN0Dx?=
 =?iso-8859-1?Q?kfpskN/frnVaeCeBhgyN5+0GrSq/rtACXkS79HTAyDeNqbbMIeAZy0St6m?=
 =?iso-8859-1?Q?C2ac0wDCHGVXFr/Tn41IS5Polsc6D0J1kDMZSq3RchLGwznqnRdB5xcyOV?=
 =?iso-8859-1?Q?Gw9s2gfewGLl09tJF43A4PUCmnI70QOtRwKFyVvz+AIOUiPdjme5I2ZK/I?=
 =?iso-8859-1?Q?DO12zEhQOzkUTiQdoCkXCMyyor5+b47hgwpN9oEoyloXIllWCfOpHQ4maR?=
 =?iso-8859-1?Q?ilT37syGSYSgRWVFKFE5hjHLqFDv1Oe2vPrIljeNoQGUeOYnAw6hY5we4H?=
 =?iso-8859-1?Q?TOnOJOerYJMM0GeJSiVfXM3XnhOX/+M79YAZcP50sm8GFzlEtTyHxEFBuk?=
 =?iso-8859-1?Q?dAx3srBO6AhQPjstek7h1wuxBL5kzJYdmKOxbWU2kfKlIzv/PhV43yOVmp?=
 =?iso-8859-1?Q?zeILqPHd5e7QjGUp4sdNpytveratNr+jwOuZ2OMkuG1DKom+bfR2s+tzYf?=
 =?iso-8859-1?Q?LcYLyAjIu3tt/WFh5IUAWFqlt3ozWSflp7MRvs3UHVX1rEfASlMv6cNzzW?=
 =?iso-8859-1?Q?sEKf2t5YIrBLSBEPLr5lzuBQh87kB0hj/X2saBQP4uaNVlcG+v4OyUo8Bm?=
 =?iso-8859-1?Q?GMNoxO3rCGr471UMR9ls2xvTvMDu7MVSq9vM4wSgMls9yKkgQk/wOQQh0m?=
 =?iso-8859-1?Q?swdBraQaEm1DetWgFZlMn6jXB8Xlq38BSNWkOvg/6BXXfjrMaQlnUzMwxu?=
 =?iso-8859-1?Q?dOfrmlBK7P6J4HlUW/o5ag7hpMmt63SOXsJWZ/OCjpnkTWdv+/W/KWyZ9M?=
 =?iso-8859-1?Q?lUDddWI/ECQRneVZ9fVJQZ7cZ6gJ/mFq0wJrbKUFaLnLmLSXjybor+Wn5+?=
 =?iso-8859-1?Q?vrqpb15ga4Bovry36AoBJRv9qO4R/FBRQQ+aYhqiHqilSHM6+vB7MATzjv?=
 =?iso-8859-1?Q?B15wD05lPts6qKKlpvVkziCWHdxo5YYiUivgX0YDPLm0IG1/iAX0CTrEub?=
 =?iso-8859-1?Q?Lx19V65XdLUZAM9NCNMu6BsfPmqUcMIuu8zue5+Y6nA2hoExLxmLAhrg9K?=
 =?iso-8859-1?Q?drBrZ0FML5+D7XiSqrPeIAq1krjtIOs0Jlq4PNLlCVj7MtYK+IveUvWyy9?=
 =?iso-8859-1?Q?Od62Syp+76hNabnSO/PWsgLKAnJ7RCbfu3zd1fK/89LYTCZJ9uGhh4gijY?=
 =?iso-8859-1?Q?z6PvTIgGMcy3bR05Xe3Wwi0Ug0GgSStipqrIuRogETvYAEE5a+orD+PJPs?=
 =?iso-8859-1?Q?D9OUL5ZAwkXfYlMcR9TIiLii9rjt/rQURhxp06JgQ7plWeOXpTL+mj+W6h?=
 =?iso-8859-1?Q?ggyUr7Kuw4Kz6o1aNNIOJP37WuJX3u8UgSgOyROU8/xAel1A/roe/KasbU?=
 =?iso-8859-1?Q?/giLlS56zG6upQ8f0B2fAp/Hw+rkJYP1EjWFdNUtXpxAqjZXGSZDg08W9A?=
 =?iso-8859-1?Q?2d+emAGQ5BxQwQDIomSz/tY7PBNRlhcYe9/V1RmcXDD0FD4uXhEX5+8fjp?=
 =?iso-8859-1?Q?JU6MuRAHSQ19kHcrBKsyE1AvBzR4lkmzFOr76v0rEE4Kxq?=
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
	Um7IkN1O8iSIlSS86uJ2M/I9EvgyK4h3MUhl6IeXZDPC+CvopD5v5tjvL885Evj7hxYV9EplXIDwDN2wiDnq4tlEFOn/vSx+zfPp9HZ8MjWjPXAhPu33/p8CdW5NeHWHaEoF52NNo49FENnG02TdAH/NqBeHQ/vbjUokCRs6NySGZyZHL2yoYoZQHgJ1avsCFoF+/n5GsdIq3G4Md76HZDDUNOGtfDmqvr6Jbp4RWQHJndw5aT/akjlWR7gReR50YLNSZodb4ZiY1u0/hdfKxGbWERtleAyVsa2y2aqzr0uIw9wP9leqGjUp9Nf5ku6eIRD4zgZ7RegDQZID0ZWkNg==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410559e8-a558-4d5d-a795-08df46908c07
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:54.7638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6uYJk9RwztiQSGp7H3TsuIXjqGT8LHIRpzqR9cFHzbsosXPLeR41YE04Ebc2ens31k2PTVOY5Pb+v6A4vUhTjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129078-UGHvbjDCjcbU
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129078;UGHvbjDCjcbU;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

Add vendor prefix for SiTime Corporation, manufacturer of=0A=
programmable clock generators and MEMS oscillators.=0A=
=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
Acked-by: Conor Dooley <conor.dooley@microchip.com>=0A=
---=0A=
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++=0A=
 1 file changed, 2 insertions(+)=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml=0A=
index 5471a06f93f1..b0f26ab800be 100644=0A=
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml=0A=
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml=0A=
@@ -1581,6 +1581,8 @@ patternProperties:=0A=
     description: SiRF Technology, Inc.=0A=
   "^sis,.*":=0A=
     description: Silicon Integrated Systems Corp.=0A=
+  "^sitime,.*":=0A=
+    description: SiTime Corporation=0A=
   "^sitronix,.*":=0A=
     description: Sitronix Technology Corporation=0A=
   "^skov,.*":=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
