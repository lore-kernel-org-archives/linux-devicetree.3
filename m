Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129089;
	b=PTFBaapSRSTsGoAszv6lE6cYtu5g6r17fw0bgBTm5yxSBSwH5GQNH16xyjzx+m68a95e
	 +LEduX7I7bF3XBFSr/shmMWt1TSk0SuuwxxrvMWBG81V4jbVZcqzBHUJwKhcWDYFBqi/u
	 5kiiHMvAMe4pbMSMljvgWzykRgzW2aBNGiv6l+Uc4WI1pCq/woUbJwHNiiDEiVHsB73vH
	 HhK7JHRW8AcJZKT8gtQaqM6P/zZyoilXPA8JeYIX0tRzJVPMZzsHlgu0HRWbbgtvtchCO
	 OW6pdKb9Z3R/1VRq+q2mRX3NjjRQUMw0W4IPGxUtxVKAgpDkO6fbXU5wD3dpv332Blg==
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
	bh=cYZS8C8aaSvXoPIWSwFYs4VG2RxvxCEVtkgeawDHfto=;
	b=jDl9VEbw74FSHcaqU6i6UGFWZVsqpfq8OgH6cG6guz2KdtL6Hmw1T56ZSuysvKaRtDHK
	 wpJ7EhZMIKJMG3iqFSFwid8cQfrXYl27bVIoy1ubRO8P6hk6Yx7kJIct1/MJ0XuhTK1IR
	 izy2ZDj05yCY92Gvzpgtch/XdKHuc36jl1WGk7QaDxdNxMg9RTbxfV6QI8BWU2+3iKkdz
	 apusWMPtH07dInNIr8Z1BiNMvZUZSRTuklQdUWhIteluVMcQaeMzfATyHqS325eao+sNu
	 qtske3O+KLQH4x9S0NZg5cmaghlaE62ATQkD8FFzECBBFGBc36XbRvt0NS8//OmMOVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=DMLUP2Dp;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=dSdfnmkt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.52
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7777B606A32A;
	Thu, 19 Nov 2026 22:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7777B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=DMLUP2Dp;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=dSdfnmkt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=cYZS8C8aaSvXoPIWSwFYs4VG2RxvxCEVtkgeawDHfto=;
 b=DMLUP2Dp9mPJvUc4RFCKz3DXpoJlFvmKp8kf0HFHpYTr+B+7k4sH5UblNeVSQnalkSjwx6emonzc2ETWdGmQblkpSnwg4SywDGSzSh3dzjjQBAqrSmjfznhq4x7EumQMaisknrM9l2iovkWaLvf325h+oa/0flPe09kdpiijTVHlx40jdi10bhsYLpMeivx1jIByAJDuhoQubSbUNfQCheiBqZz4x6QGeNspwpWi83UTwNng3vQmaAjmxpADipdzLXpb7+0ggpBTeOvQiKEFQbJMh/CVeU3hNeu3KA3MD8TgAvsIz+QoL3nSnA0o6Gj9r9qznm13epbnNXO3IwI/uw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id B6053C40064;
	Thu, 19 Nov 2026 22:58:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ukU4CzTI/Lc4Py5S/PkYIHZgNTlgnYcdK1b+nTp8mbFZWw7lICZWl5vklQarq3Z5xuKcPmTsxM4TmprWq3fROe5JvnhmKnst8xnO3y4jkrGCM8clphYNjNWanrIaEccVODw2ywm6MCw5oT3v5CqY7HweLiQAOtDIjWVDq/wMHO+fpu9r6NHPVjGjKHPGlVrNDp2QOCQ4wimcfj2yPMzs35nXA6RVckTaxwPhsualodTKtWDPhItY7LINsX8cqobpKN88MuhdGTZy78KpbTJlstweJWOtrQNPnfFPX2Jhj2tZxArEQXo2Hv3oKKvrbaa8tUSGBgEIbcq/VUVOHUIPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYZS8C8aaSvXoPIWSwFYs4VG2RxvxCEVtkgeawDHfto=;
 b=qswgMFdull1xchBEVWHxST3tljtzNJUuJZ4qRibpZTfPA32/ukej18OIniYifSRoGTupgLo6MuTBDzAVZzKM4z0C6aZR3jhGkKeunNuX4Sj06+BSeos6mCFwB1o3smfH1UG7yKVB57AdUrnl29cDh39U3oC4LREAb4EBiEunXZS1hB7Hj0L3GsQLPsKCMxEXQVLXW9VS1H84fbj9DjnZ5Wq0+YRHGWkOfXteVVs37AUJdo6xXrBgrx796HXGmdk90A6Z0zOtkOg6388OFoaPeDxIwg7lz3oZAerbW6bC2e/HwnGhyC2SmmzEMPIZYRHlZJgtkn1zRBxQSkTN/rQxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYZS8C8aaSvXoPIWSwFYs4VG2RxvxCEVtkgeawDHfto=;
 b=dSdfnmktFZBZWerHqH6CZ6K/9hl74HW4Py2uYxpKsJGhRjRQFqdsobxq1kklifToI11e0YsTrB0C7V6lHZsMMEExwJCI2mKm2vaI2SMDly2sOkrSKfw4edHRUWSiMOmvvOvtzVZBYZWUvA6CqCF6Un+VGhMtkNqV1qY4gRu8aILRdE2P3jTKd0DHPGDqIEejVnLz8ZBvlu58v26jLTS8HJRjwYhzqK1npcEGVV3lBf0ZyWuXghZnr2HX7te9InkjmuhaNPdnIt8zX0AM3ZY32m8JgjyHlXrhpI48pY4eEfB872fVS2bFeBfXBgmynrKhYWUbP1Yfs941d6ZtbDBz7g==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by SA5PPF6C2DD1D15.namprd20.prod.outlook.com (2603:10b6:80f:fc04::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 19 Nov
 2026 22:58:01 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:58:01 +0000
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
Subject: [PATCH net-next v16 08/13] dpll: sit9531x: add support to get and set
 priority on input pins
Thread-Topic: [PATCH net-next v16 08/13] dpll: sit9531x: add support to get
 and set priority on input pins
Thread-Index: AQHdeHlrm26SJ940q0qREDOA+ywtLg==
Date: Thu, 19 Nov 2026 22:57:58 +0000
Message-ID: <20261119225752.41846-9-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 05bc3fec-b4e1-4128-8480-08df46909017
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261028144727099003|56012099006|261021123027099003|261022105027099003|261026121527099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|10067099003;
x-microsoft-antispam-message-info:
 S0jjELXXiIsWz1BeUMHozI9rTR0EpYgFsv+sG3wcEPpDODqRgYJrpleAzdiHp+eTQiPV4IfdiVjkYDI4pWqf4wVCFurHjo0zzxEEfk6TcOfaFDLojEIZizFXn+J20ylJz/MBjYb+XNl8a2qywy5sFHUAfwnh4QwlSBbJ0MHMXPi/qyk3K1Lhzmbi9DrVBUAXBsD5ua8WTitPwTQ+w9R1y0yyRMJx5l85/DwwfvjB2Z0kJg4pjq1KMOMc0a8AFCMxULlnbLesGqTzg/zUSv52HfwEQqIDNjwGPQhRkL00TdIzC7OiHpL+Mttvjllsy8KLwMpGhqpAW/N/eiURr1dkpeimiwj+6g8q0Fz+8UO6/de1uxWrfI+TQLHPHzCuqsBpZ3h2RToY/lkb6Ffd/OLzmkZ3t4nyxGd7feBhORuSqEa12CPTE4mL4v7Mc2ZyFZE1fujh75ip6v62sxUi4q4MEAuksLeiAGUkSYHX5sskLgH2Wxu3HqxGKgxdjqYvksjsD8z2YtgEFoUYfivAh0Gs1fCke+B4nPvE/drZemnN7mCqj9qWPW3evjdjJiEwaigX7hW6Op72Nory/T5Nc9B6cnvQ7jACQwuz+weZww8qePO+7jtPzmtbzWovdaOP/YT/7pwIUNlwmbJuNac3DVcwG7WL8XCsTMkMt+8sm391O3+FzC+7R6tbZXVqVJAwbkHEcwTtwX/xSdTh4tv52scUEsG6UXzwCJn6WBoOumRZTFQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261028144727099003)(56012099006)(261021123027099003)(261022105027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XCejh0XNY96adLtkncTo4ZLJzoN33Nuipbjje6b4CUcHa8yfLBD9wi1Fg1?=
 =?iso-8859-1?Q?MWbjN9GCWiEf6fZ4dRabnZ2SwzGsTCTrACPgW781FR7icggJC8ZuMQtphz?=
 =?iso-8859-1?Q?mqc0Ia0wJceoSuGRk+16FlyeluYJ8NdynqPF4rX/NQTCBe3f4hGHe1A0kh?=
 =?iso-8859-1?Q?TvkPZiuvDXFX76rsgRctHZc1H51Y8hMxuq8cvHfT74QoEptBN9iXcVbnvZ?=
 =?iso-8859-1?Q?6e9w4jJFtttp2Iw0MGR1q+QfhGN/HnG8MW++INU3V9D/yC8Th6aaJIPif0?=
 =?iso-8859-1?Q?KL8QVjqphMZDHVtrUxILPld465NssZ1ViIu4rcK0+ZbS/BTk/0jhUA/5f7?=
 =?iso-8859-1?Q?NwBkOi0l+9kCQryPmGZus9MZnFjXGXdAOQOXZHw5/wJImTvZInTS5dky0Q?=
 =?iso-8859-1?Q?dcpO8yOmyYIcBy8qjSAqYEl0su/7fviVV+2+cO4kMjKZDOECIcXypjciun?=
 =?iso-8859-1?Q?Rct3C5jDKe35UyGtCbpXFl0q6Z4cPu1L63qVN65H5yaMjfJZblG6mG/buN?=
 =?iso-8859-1?Q?pMmZbBfTHefO63VQDSQ6d9Vsxv4vbhxE5SMX4DBdtmkzrBL8sml/BRDCLc?=
 =?iso-8859-1?Q?/bvZlfL1NgTQXbuEh84dIY4V43dUZDtQjvVdln3AHSUOoDceRA8SVltile?=
 =?iso-8859-1?Q?T4+jZKMF3TGM66sx9tr3leol5zLq41oyxQYdcNvi3vodZYLKjRj55tShlg?=
 =?iso-8859-1?Q?g8zQVu4AngUfqNvc4YzQCD7xIesVMHGSiTQHqz+IIS38Lzn1Y08/ycpV0V?=
 =?iso-8859-1?Q?/X6SnoX8BbSv1vUEHY/nCJhK6yPqvuGfXVK9OR86y9wECVr0JurVe5EHNs?=
 =?iso-8859-1?Q?r5JuLP3lu7EPRxLnIPiq3rG5+FGOsVd+knAjvT4e/S7pzxda3l8ow42zG7?=
 =?iso-8859-1?Q?rCR/wVd9LwfZteOn7XerId9C7h1SmJHxjOzCcobfp4iM9qFeQGXKbiPuyI?=
 =?iso-8859-1?Q?Jc/0G7LIAvjcCR/3bQZBjWB2UCzapaiP8xwxJU5AQSwhz+MQ9dqfWWPsFa?=
 =?iso-8859-1?Q?/xfSClCJJ4ymq7SXuI1nT9fk3tHT3nLLZBK2USqU654Vv09as/X1wfuegH?=
 =?iso-8859-1?Q?07hcEY+6GPEvgNwnehbx0wjzwi34lS4hjwQ3KqpxTyu3ckbdJYhbc267WZ?=
 =?iso-8859-1?Q?SFcToVF7fPrj7bbiwLm/1XbhU2Bbuwj5czVYd5ZsPjnz1YWnxzmWpXd0nr?=
 =?iso-8859-1?Q?IizQTH2ow1IOpLHyyNH8ax7K3gIpiIKwTMwHOUZskfi4swtPXiGuZN3PdL?=
 =?iso-8859-1?Q?tBOsQXsFXgvthfvxH+wIEXIKT1BgszwrZpb77g3bWdDlrolUXmkHKUrVM0?=
 =?iso-8859-1?Q?9n62HYerYZSGXT1sPkNmyZThN+LGlbKBki0vu2d3VXVubgbojr63psQe9S?=
 =?iso-8859-1?Q?PMii+lA1cghpycrEUxU9a8g3ZNh3lbVzSgNiT2ueUnQm2RY2NOj8J1QOWw?=
 =?iso-8859-1?Q?wnMQXlHyISDZeMiRYziRqr0lu5ItnvFBrqD/p3u9ov7DQK8zj0avuPGG7k?=
 =?iso-8859-1?Q?x2VeaGQUuCmiL5uysGJIxDOH2nc7UOKdYO+aDd/vDcxbkXJthhAeqNLSHP?=
 =?iso-8859-1?Q?XPbz1O6YwVKZRRNw2IOfFl5vVGYr6j/RappsKcxqjoRaF3ZIKzhTpEcowK?=
 =?iso-8859-1?Q?c4ufSse7LPIkNWYoZMShrCwmmNgCJ4XRNKioCVkyFSNoxrr/1Z6JORND2S?=
 =?iso-8859-1?Q?HEzQOYBJgkwXyInCXmqTqojI9BKEcP8ABsG7qe6ebL0SVc74ShVfPppz51?=
 =?iso-8859-1?Q?0eLoNjLGZA6ZlFTNFfiTudbJ7OgEsiD5IOnJIQH0eR0qTv?=
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
	1c0I3v47inLaviPaGhgC7/mF9JCpd7c1R0kv19GQKS+7H1CZyFiEXx3JRTeAfSMyYb513M4Qvf+C6FFjD9vUELcond5iQZDQOGhQ8ux86jv7223mCs8lcR2kZxIPljBDjzy+4otsWDvM6ozdGxuz+AExpp0yRg6LoxNK2Cif+YSKPqPWTInvm3oRC3+1gXc62WYPLjFQXuu5crCzpWIBeWOae/xO/OsYHXrOzMIUnxq7ln7hbznh3mIMXse3mDvbagsls3cdwVTrDCIj+zGpGMSR5NpgWnKQfybuZQGRCwwixwMB07DYtEakDFHPYPgeNN6l81ZnLADqImj+jKmJfw==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05bc3fec-b4e1-4128-8480-08df46909017
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:58.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CCdNtQWHvL5V3K4x9mSaJTrzNweuUXAsMrtfZmFSlWPa76ujddzRLWA5JWLe/Gfy1Udu8ssJFO+cGQuQkVHBwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6C2DD1D15
X-MDID: 1795129086-tWXYIDIcgyJo
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1795129086;tWXYIDIcgyJo;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Let userspace read and set the priority kept per input and PLL; a set=0A=
rebuilds the table from it. Priority and state are separate: a priority=0A=
set on a disconnected input applies when it is connected. The range is=0A=
0 to 255 over eleven slots; inputs of equal priority keep their table=0A=
order.=0A=
=0A=
A commit that leaves the best live source unchanged keeps the routed=0A=
source as the active selection, so the PLL does not restart=0A=
acquisition for it.=0A=
=0A=
A table rewritten outside the driver, by a profile reload or an I2C=0A=
tool, becomes the new configuration. The poll compares each pin with a=0A=
baseline taken at registration and notifies a changed operational=0A=
state or priority; a notification that fails is sent again on a later=0A=
tick.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/core.c | 106 +++++++++++++++++++++-=0A=
 drivers/dpll/sit9531x/core.h |   4 +=0A=
 drivers/dpll/sit9531x/dpll.c | 167 ++++++++++++++++++++++++++++++-----=0A=
 drivers/dpll/sit9531x/dpll.h |   4 +-=0A=
 drivers/dpll/sit9531x/prop.c |   2 +=0A=
 5 files changed, 260 insertions(+), 23 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
index d61c2a8e24f3..bbc17a514c5c 100644=0A=
--- a/drivers/dpll/sit9531x/core.c=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -606,6 +606,33 @@ bool sit9531x_input_prio_present(struct sit9531x_dev *=
sitdev, u8 pll_idx,=0A=
 	return !!(sitdev->chan[pll_idx].prio_mask & BIT(input_idx));=0A=
 }=0A=
 =0A=
+/*=0A=
+ * @input_idx is in hardware encoding (see sit9531x_input_hw_src()). A sou=
rce=0A=
+ * the PLL has never listed reports the last slot index, 10. Caller must h=
old=0A=
+ * sitdev->multiop_lock.=0A=
+ */=0A=
+int sit9531x_input_prio_get(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			    u8 input_idx, u8 *prio)=0A=
+{=0A=
+	const struct sit9531x_chan *chan;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+	input_idx =3D sit9531x_prio_src_canon(sitdev, input_idx);=0A=
+	if (input_idx >=3D SIT9531X_PRIO_NUM_SRC)=0A=
+		return -EINVAL;=0A=
+=0A=
+	chan =3D &sitdev->chan[pll_idx];=0A=
+	if (chan->cfg_known & BIT(input_idx))=0A=
+		*prio =3D chan->cfg_prio[input_idx];=0A=
+	else=0A=
+		*prio =3D SIT9531X_PRIO_MAX_SLOTS - 1;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
 /*=0A=
  * Take the configured priorities from the hardware table: a listed source=
 gets=0A=
  * the first slot it occupies.=0A=
@@ -736,7 +763,8 @@ static u8 sit9531x_prio_top_live(const struct sit9531x_=
dev *sitdev,=0A=
  * until it loses signal.=0A=
  */=0A=
 static u8 sit9531x_prio_activesel_pick(struct sit9531x_dev *sitdev,=0A=
-				       const u8 *old, const u8 *srcs, u8 cur)=0A=
+				       const u8 *old, const u8 *srcs, u8 cur,=0A=
+				       u8 routed)=0A=
 {=0A=
 	u8 top, i;=0A=
 =0A=
@@ -745,6 +773,12 @@ static u8 sit9531x_prio_activesel_pick(struct sit9531x=
_dev *sitdev,=0A=
 	    top !=3D sit9531x_prio_top_live(sitdev, old))=0A=
 		return top;=0A=
 =0A=
+	if (sit9531x_prio_src_usable(routed) &&=0A=
+	    sit9531x_prio_src_live(sitdev, routed))=0A=
+		for (i =3D 0; i < SIT9531X_PRIO_MAX_SLOTS; i++)=0A=
+			if (srcs[i] =3D=3D routed)=0A=
+				return routed;=0A=
+=0A=
 	cur =3D sit9531x_prio_src_canon(sitdev, cur & SIT9531X_PRIO_NIBBLE_MASK);=
=0A=
 =0A=
 	if (sit9531x_prio_src_usable(cur) &&=0A=
@@ -827,12 +861,19 @@ static int sit9531x_prio_table_commit(struct sit9531x=
_dev *sitdev, u8 pll_idx,=0A=
 =0A=
 	if (!empty) {=0A=
 		u8 sel =3D sit9531x_prio_slot_get(val, slot + 1);=0A=
+		u8 routed =3D SIT9531X_PRIO_SRC_NONE;=0A=
 =0A=
+		/*=0A=
+		 * The pick needs the signal state now, not as of the last poll;=0A=
+		 * the routed source is the last poll's sample.=0A=
+		 */=0A=
 		rc =3D sit9531x_input_mon_fetch(sitdev);=0A=
 		if (rc)=0A=
 			goto rollback;=0A=
+		if (!chan->stale && chan->routed_ref !=3D SIT9531X_REF_INVALID)=0A=
+			routed =3D sit9531x_input_hw_src(chan->routed_ref);=0A=
 		sel =3D sit9531x_prio_activesel_pick(sitdev, chan->prio_srcs,=0A=
-						   srcs, sel);=0A=
+						   srcs, sel, routed);=0A=
 		val =3D sit9531x_prio_slot_set(val, slot + 1, sel);=0A=
 	}=0A=
 =0A=
@@ -983,6 +1024,59 @@ static int sit9531x_prio_table_apply(struct sit9531x_=
dev *sitdev, u8 pll_idx,=0A=
 	return sit9531x_prio_table_commit(sitdev, pll_idx, srcs);=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Check if the device holds the table the configured priorities give for=
=0A=
+ * @members.=0A=
+ */=0A=
+static bool sit9531x_prio_table_held(struct sit9531x_dev *sitdev, u8 pll_i=
dx,=0A=
+				     u16 members)=0A=
+{=0A=
+	u8 srcs[SIT9531X_PRIO_MAX_SLOTS];=0A=
+=0A=
+	sit9531x_prio_table_build(sitdev, pll_idx, members, srcs);=0A=
+=0A=
+	return !memcmp(srcs, sitdev->chan[pll_idx].prio_srcs, sizeof(srcs));=0A=
+}=0A=
+=0A=
+/*=0A=
+ * @input_idx is in hardware encoding (0-11, see sit9531x_input_hw_src()).=
 A=0A=
+ * source not in the table keeps the priority for when it is connected. Ca=
ller=0A=
+ * must hold sitdev->multiop_lock.=0A=
+ */=0A=
+int sit9531x_input_prio_set(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			    u8 input_idx, u8 prio)=0A=
+{=0A=
+	struct sit9531x_chan *chan;=0A=
+	u16 old_known;=0A=
+	u8 old_prio;=0A=
+	int rc;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+	input_idx =3D sit9531x_prio_src_canon(sitdev, input_idx);=0A=
+	if (input_idx >=3D SIT9531X_PRIO_NUM_SRC)=0A=
+		return -EINVAL;=0A=
+=0A=
+	chan =3D &sitdev->chan[pll_idx];=0A=
+	old_prio =3D chan->cfg_prio[input_idx];=0A=
+	old_known =3D chan->cfg_known;=0A=
+	chan->cfg_prio[input_idx] =3D prio;=0A=
+	chan->cfg_known |=3D BIT(input_idx);=0A=
+=0A=
+	if (!(chan->prio_mask & BIT(input_idx)))=0A=
+		return 0;=0A=
+=0A=
+	rc =3D sit9531x_prio_table_apply(sitdev, pll_idx, chan->prio_mask);=0A=
+	if (rc && !sit9531x_prio_table_held(sitdev, pll_idx, chan->prio_mask)) {=
=0A=
+		chan->cfg_prio[input_idx] =3D old_prio;=0A=
+		chan->cfg_known =3D old_known;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
 /*=0A=
  * Removing the last source leaves an empty table, which keeps the PLL in=
=0A=
  * holdover. Caller must hold sitdev->multiop_lock.=0A=
@@ -2227,6 +2321,14 @@ static int sit9531x_dpll_pins_register(struct sit953=
1x_dpll *sitdpll)=0A=
 			goto error;=0A=
 		}=0A=
 =0A=
+		/*=0A=
+		 * Taken before the pin is published; see=0A=
+		 * sit9531x_dpll_pin_baseline().=0A=
+		 */=0A=
+		mutex_lock(&sitdpll->dev->multiop_lock);=0A=
+		sit9531x_dpll_pin_baseline(pin);=0A=
+		mutex_unlock(&sitdpll->dev->multiop_lock);=0A=
+=0A=
 		rc =3D sit9531x_dpll_pin_register(pin, index);=0A=
 		if (rc) {=0A=
 			kfree(pin);=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index bd8732b75750..57ba682b07a9 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -252,6 +252,10 @@ int sit9531x_input_enable(struct sit9531x_dev *sitdev,=
 u8 index);=0A=
 =0A=
 bool sit9531x_input_prio_present(struct sit9531x_dev *sitdev,=0A=
 				 u8 pll_idx, u8 input_idx);=0A=
+int sit9531x_input_prio_set(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			    u8 input_idx, u8 prio);=0A=
+int sit9531x_input_prio_get(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			    u8 input_idx, u8 *prio);=0A=
 int sit9531x_input_prio_remove(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
 			       u8 input_idx);=0A=
 int sit9531x_input_prio_add(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c=0A=
index 56bdec4bcf67..e03813b6b9f2 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.c=0A=
+++ b/drivers/dpll/sit9531x/dpll.c=0A=
@@ -34,6 +34,14 @@ sit9531x_dpll_is_xo_pin(const struct sit9531x_dpll_pin *=
pin)=0A=
 	       pin->id =3D=3D SIT9531X_MAX_INPUTS;=0A=
 }=0A=
 =0A=
+/* Check if the pin's state and priority can change without a request */=
=0A=
+static bool=0A=
+sit9531x_dpll_is_selection_pin(const struct sit9531x_dpll_pin *pin)=0A=
+{=0A=
+	return sit9531x_dpll_is_input_pin(pin) &&=0A=
+	       !sit9531x_dpll_is_xo_pin(pin);=0A=
+}=0A=
+=0A=
 /*=0A=
  * A frozen PLL with an empty table is in forced holdover; report holdover=
 only=0A=
  * while its holdover memory is valid.=0A=
@@ -396,11 +404,78 @@ sit9531x_dpll_input_pin_state_on_dpll_set(const struc=
t dpll_pin *pin,=0A=
 	return rc;=0A=
 }=0A=
 =0A=
+/* Report the configured priority of the source on this PLL, listed or not=
 */=0A=
+static int=0A=
+sit9531x_dpll_input_pin_prio_get(const struct dpll_pin *pin, void *pin_pri=
v,=0A=
+				 const struct dpll_device *dpll,=0A=
+				 void *dpll_priv, u32 *prio,=0A=
+				 struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	u8 slot;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_input_prio_get(sitdev, sitdpll->id,=0A=
+				     sit9531x_input_hw_src(dpin->id), &slot);=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	*prio =3D slot;=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Rewrite the Page 1 priority table for a listed pin; an unlisted pin kee=
ps the=0A=
+ * priority until it is connected.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_input_pin_prio_set(const struct dpll_pin *pin, void *pin_pri=
v,=0A=
+				 const struct dpll_device *dpll,=0A=
+				 void *dpll_priv, u32 prio,=0A=
+				 struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	int rc;=0A=
+=0A=
+	if (dpin->dir !=3D DPLL_PIN_DIRECTION_INPUT) {=0A=
+		NL_SET_ERR_MSG(extack, "Priority applies only to input pins");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	if (prio > U8_MAX) {=0A=
+		NL_SET_ERR_MSG(extack, "Priority out of range (0-255)");=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_input_prio_set(sitdev, sitdpll->id,=0A=
+				     sit9531x_input_hw_src(dpin->id),=0A=
+				     (u8)prio);=0A=
+	if (!rc)=0A=
+		dpin->prio =3D prio;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rc) {=0A=
+		NL_SET_ERR_MSG(extack, "Failed to set input priority");=0A=
+		return rc;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
 static const struct dpll_pin_ops sit9531x_dpll_input_pin_ops =3D {=0A=
 	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,=0A=
 	.state_on_dpll_get	=3D sit9531x_dpll_input_pin_state_on_dpll_get,=0A=
 	.state_on_dpll_set	=3D sit9531x_dpll_input_pin_state_on_dpll_set,=0A=
 	.operstate_on_dpll_get	=3D sit9531x_dpll_input_pin_operstate_on_dpll_get,=
=0A=
+	.prio_get		=3D sit9531x_dpll_input_pin_prio_get,=0A=
+	.prio_set		=3D sit9531x_dpll_input_pin_prio_set,=0A=
 };=0A=
 =0A=
 /*=0A=
@@ -477,8 +552,47 @@ sit9531x_dpll_pin_ops_get(const struct sit9531x_dpll_p=
in *pin)=0A=
 	return &sit9531x_dpll_input_pin_ops;=0A=
 }=0A=
 =0A=
+/* Caller must hold sitdev->multiop_lock. */=0A=
+static void sit9531x_dpll_pin_snapshot(struct sit9531x_dpll *sitdpll,=0A=
+				       const struct sit9531x_dpll_pin *pin,=0A=
+				       enum dpll_pin_state *state,=0A=
+				       enum dpll_pin_operstate *operstate,=0A=
+				       u8 *prio)=0A=
+{=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	u8 id =3D pin->id;=0A=
+=0A=
+	if (id =3D=3D SIT9531X_INTSYNC_PIN_ID && sitdev->intsync_src =3D=3D sitdp=
ll->id)=0A=
+		*state =3D DPLL_PIN_STATE_DISCONNECTED;=0A=
+	else=0A=
+		sit9531x_dpll_selection_state_get(sitdev, sitdpll, id, state);=0A=
+	sit9531x_dpll_selection_operstate_get(sitdev, sitdpll, id, operstate);=0A=
+	/* A PLL on manual input select reports no priority */=0A=
+	if (sit9531x_chan_state_get(sitdev, sitdpll->id)->manual_input ||=0A=
+	    sit9531x_input_prio_get(sitdev, sitdpll->id,=0A=
+				    sit9531x_input_hw_src(id), prio))=0A=
+		*prio =3D pin->prio;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Take the baseline before the pin is registered, so the first poll notif=
ies a=0A=
+ * change a request made. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+void sit9531x_dpll_pin_baseline(struct sit9531x_dpll_pin *pin)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll =3D pin->dpll;=0A=
+=0A=
+	lockdep_assert_held(&sitdpll->dev->multiop_lock);=0A=
+=0A=
+	if (!sit9531x_dpll_is_selection_pin(pin))=0A=
+		return;=0A=
+=0A=
+	sit9531x_dpll_pin_snapshot(sitdpll, pin, &pin->pin_state,=0A=
+				   &pin->operstate, &pin->prio);=0A=
+}=0A=
+=0A=
 /*=0A=
- * Send notifications for changed lock status and pin state; called from=
=0A=
+ * Notify a changed lock status, pin state or priority; called from=0A=
  * sit9531x_dev_periodic_work().=0A=
  */=0A=
 void sit9531x_dpll_changes_check(struct sit9531x_dpll *sitdpll)=0A=
@@ -511,32 +625,45 @@ void sit9531x_dpll_changes_check(struct sit9531x_dpll=
 *sitdpll)=0A=
 	if (sitdpll->ntf_pending && !dpll_device_change_ntf(sitdpll->dpll_dev))=
=0A=
 		sitdpll->ntf_pending =3D false;=0A=
 =0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
 	list_for_each_entry(pin, &sitdpll->pins, list) {=0A=
-		const struct dpll_pin_ops *ops;=0A=
+		enum dpll_pin_operstate operstate;=0A=
 		enum dpll_pin_state state;=0A=
 		bool changed;=0A=
+		u8 prio;=0A=
 =0A=
-		/*=0A=
-		 * Only references and the INTSYNC destination change state=0A=
-		 * without a request.=0A=
-		 */=0A=
-		if (!sit9531x_dpll_is_input_pin(pin) ||=0A=
-		    sit9531x_dpll_is_xo_pin(pin))=0A=
+		if (!sit9531x_dpll_is_selection_pin(pin))=0A=
 			continue;=0A=
 =0A=
-		ops =3D sit9531x_dpll_pin_ops_get(pin);=0A=
-		rc =3D ops->state_on_dpll_get(pin->dpll_pin, pin,=0A=
-					    sitdpll->dpll_dev, sitdpll,=0A=
-					    &state, NULL);=0A=
-		if (rc)=0A=
-			continue;=0A=
+		sit9531x_dpll_pin_snapshot(sitdpll, pin, &state, &operstate,=0A=
+					   &prio);=0A=
+=0A=
+		changed =3D state !=3D pin->pin_state ||=0A=
+			  operstate !=3D pin->operstate || prio !=3D pin->prio;=0A=
+		if (changed)=0A=
+			dev_dbg(sitdev->dev,=0A=
+				"%s: state %u->%u operstate %u->%u prio %u->%u\n",=0A=
+				pin->label, pin->pin_state, state,=0A=
+				pin->operstate, operstate, pin->prio, prio);=0A=
 =0A=
-		changed =3D pin->seen && state !=3D pin->pin_state;=0A=
 		pin->pin_state =3D state;=0A=
-		pin->seen =3D true;=0A=
-		if (changed) {=0A=
-			dev_dbg(sitdev->dev, "%s state changed\n", pin->label);=0A=
-			dpll_pin_change_ntf(pin->dpll_pin);=0A=
-		}=0A=
+		pin->operstate =3D operstate;=0A=
+		pin->prio =3D prio;=0A=
+=0A=
+		/*=0A=
+		 * The notification takes DPLL-subsystem locks the callbacks run=0A=
+		 * under; send it after dropping multiop_lock.=0A=
+		 */=0A=
+		if (changed)=0A=
+			pin->ntf_pending =3D true;=0A=
+	}=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	list_for_each_entry(pin, &sitdpll->pins, list) {=0A=
+		if (!pin->ntf_pending)=0A=
+			continue;=0A=
+		if (dpll_pin_change_ntf(pin->dpll_pin))=0A=
+			continue;=0A=
+		pin->ntf_pending =3D false;=0A=
 	}=0A=
 }=0A=
diff --git a/drivers/dpll/sit9531x/dpll.h b/drivers/dpll/sit9531x/dpll.h=0A=
index 6c02aa131328..3ded177b871b 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.h=0A=
+++ b/drivers/dpll/sit9531x/dpll.h=0A=
@@ -30,7 +30,8 @@ struct sit9531x_dpll_pin {=0A=
 	u8				id;		/* hardware index */=0A=
 	u8				prio;=0A=
 	enum dpll_pin_state		pin_state;=0A=
-	bool				seen;	/* baseline taken by the poll */=0A=
+	enum dpll_pin_operstate		operstate;=0A=
+	bool				ntf_pending;=0A=
 };=0A=
 =0A=
 struct sit9531x_dpll {=0A=
@@ -56,6 +57,7 @@ int  sit9531x_dpll_register(struct sit9531x_dpll *sitdpll=
);=0A=
 void sit9531x_dpll_unregister(struct sit9531x_dpll *sitdpll);=0A=
 =0A=
 void sit9531x_dpll_lock_status_baseline(struct sit9531x_dpll *sitdpll);=0A=
+void sit9531x_dpll_pin_baseline(struct sit9531x_dpll_pin *pin);=0A=
 void sit9531x_dpll_changes_check(struct sit9531x_dpll *sitdpll);=0A=
 =0A=
 #endif /* _SIT9531X_DPLL_H */=0A=
diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c=0A=
index b9405eba49a3..69877fc94028 100644=0A=
--- a/drivers/dpll/sit9531x/prop.c=0A=
+++ b/drivers/dpll/sit9531x/prop.c=0A=
@@ -146,6 +146,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,=0A=
 		/* INTSYNC destination: a reference the PLL can lock to. */=0A=
 		props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;=0A=
 		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |=0A=
 			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
 		curr_freq =3D 0;=0A=
 	} else if (sync_out) {=0A=
@@ -161,6 +162,7 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,=0A=
 	} else if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT) {=0A=
 		props->dpll_props.type =3D DPLL_PIN_TYPE_EXT;=0A=
 		props->dpll_props.capabilities =3D=0A=
+			DPLL_PIN_CAPABILITIES_PRIORITY_CAN_CHANGE |=0A=
 			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
 		curr_freq =3D sitdev->ref[index].freq;=0A=
 	} else {=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
