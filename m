Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123231;
	b=Q/Jcy0JrKHM+zer1G6vk6SvunTlIsX41PN5Ui3FP4lSSWFbhzQgCN570HhjCxsXnL0ZP
	 T6sHqi+IuXDa8e4HOzjITd9ojUu7s3I/i9FqYFRi6BU9SaGsXACuPXNiiwGcIj7rBIT9z
	 KOru6VVVdbhTIZXZ7ozcLCXDD0w87DGVmcGoRUSSemSBb824sAK2g9TVvFx/ho2F7okf8
	 jXuH/oeObd2qW8PEnsKpb/eeLVFpbBLVb7tbYHEMnCEr1fM1hUpc9I8uN7Yzs9NkwpgC7
	 NvSJ+D8LPG1kwvn4qTfi4TX6PYVt+JJ7cv/XawJj/CmQXN4KmuyU7x3GmE+9nJpQiNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123231;
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
	bh=p2ohwMutocyT5vfZ4qJcI4YVbtRzQe5XJN86PyJJCEU=;
	b=yAIs9eCt4az45ssaRjDMEzblVsS1XyktL6bfcFpfrFzI2jcNMm1krt8BZANQFT9NgJre
	 j1qiMBFwxwOzsTv1uUY2K9e3niyURIK/e5ngVe5lEW31ITj4voUbAm7RtmAfmBKeVPpdT
	 6b//QFfkktPuegoUGOLu8OzDCRwjB5Bmy8LdplBzLuVpXJpk2Lpew/TjuLJYq7Q8x9BJe
	 3c+g5e4gH0AeISWqRYmrmHgjUf0LtElsqZ5irZYmV+GyFTlRFfyXEoQh5vDXcbGt3KHWC
	 rZlbkgLVMhN/iO2klqyObZSfvL6C3oL6uDNLqTg6mlkthyDaaYYDuVM9/3rMQpS9Ivw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=VE+o3AQi;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=a0Lv2Eiy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8A160A3811;
	Thu, 19 Nov 2026 21:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8A160A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=VE+o3AQi;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=a0Lv2Eiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=p2ohwMutocyT5vfZ4qJcI4YVbtRzQe5XJN86PyJJCEU=;
 b=VE+o3AQiRLsWWFjDv3alqF5yK4dHs+swA0Gth5iXXzZvEdll7Fc96seAkOlGWqj3SQvomY+6O/0HGd9ee/u68p5Pg47pACbZWB7zBLhnDXxrW64JQVSzvUxjNaF7OAXiQqgpiOREQ/xXgyVG5QCe29EGPdKYJ5aoWGWBq0iVA/DLgWQE4c0RQxMiyxZNKaVEdF50SEmp+tmVOTXe85LmuAUHrVbobyOMI7On7bPNfrYnz/qtP9CEbAlFTGqyG82nZWn+K9O0+XBBs9E0qZfHAuX0G4klh5oSFWMYQ6r3iSpGQusg3bP+ROlrksyWC+GytPegAq5qN8PU+bQ7C+ARHw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id D02A780070;
	Thu, 19 Nov 2026 21:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+UOJG1zUQP9SqIFdmT4JO7Yb/VhAFg3m4ZJx392cuezLv2jg3lVCf8WMVAF3q21AvNoGXFJgOtBjD5b7MzAuzaqWoRd4oFrkxwZV4OlSasNnbO9Q+Z7kWh972yCmRvVK/VLJi3rYb3u2pYjuJKxh03UuzW8AdS0X+V572emF55baIpSgKaBMGRq62mcJGfBZAW+vgSgkLCwMFiY406MyazMm17mv2dgr7Gd0BlTbfZWrRfYszH56aobmETp2EWOOmCfgP6kwGt131Yb5cRLfEw++XMtFB0IAQME9BAfGxfgTAtBUlIip6/BDhw0dF2ZchitSa92W8qgJgf+KkhLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2ohwMutocyT5vfZ4qJcI4YVbtRzQe5XJN86PyJJCEU=;
 b=McR1rXgpvmVrf20EYnAMSC7HcFPhhtTmbWbEYP3JZA+kGJ9aAcvzn7ddT3TtFtc1ihKjd7IWbJxarveCinb+k1eUrZ908VsUxnvAx3kwNsEZIx6hIREyc0MIj4SjrigXxMigPnoj3672VtfhX6Ur1wFHLK39Uyo6oI0RZldHxpHv3hNEbnvzT9Ks1sRKfuJOww7MxP6LO5BwvzmU8H4iIW47VhMo2viWsjxFoK+Ri8MxmLhnEHZUz4Od3FH2Mg5YUwlvJBqqYHvwxGTdGTgy0yB52ST9oZj7KnH0kOs9VPKvCdHelyGE77okIPQJo+SO5h5Mzb09uUGPk57n7C9/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2ohwMutocyT5vfZ4qJcI4YVbtRzQe5XJN86PyJJCEU=;
 b=a0Lv2EiyMfD79az+/zvb/mTPZPrKkoVjaF17se/cj7oxDrQ3hOT93U7IfTynGxDFQnjDFak6HEUSLMB1XEp0c43F1LSFXE4dXpSzDjiUp5Dbs/2+WLXsw6aFt2KOab9OY+SFDT9TCcYMUUtzYOeJMgLN2uWcaq2e7+xkW9qu1hl8qjJkwNRUJcTzKvEj/322K7jn7a44jW0Uq/jjv8pZ75aZwzn8vIuGo6EeinK07WhVPdVizfpmAALPfTJ/no5IXcyEB8aZX/OGBsOwNY+OQb6RqODrJnCKlJbYIE6LAMhTd5O7zvlZFZFB2sfW89d79ja/Pbf/puN7Vn+iyUiCPw==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MW4PR20MB5323.namprd20.prod.outlook.com
 (2603:10b6:303:208::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:20:17 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:20:17 +0000
From: Ali Rouhi <arouhi@sitime.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: "jiri@resnulli.us" <jiri@resnulli.us>, "vadim.fedorenko@linux.dev"
	<vadim.fedorenko@linux.dev>, "arkadiusz.kubalewski@intel.com"
	<arkadiusz.kubalewski@intel.com>, "ivecera@redhat.com" <ivecera@redhat.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "cjubran@nvidia.com" <cjubran@nvidia.com>,
	"Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>,
	"prabhakar.mahadev-lad.rj@bp.renesas.com"
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v15 05/13] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Thread-Topic: [PATCH net-next v15 05/13] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Thread-Index: AQHdcVG6os7n7zdz2k+870xKcjJwIbcxkSWAgARjt4A=
Date: Thu, 19 Nov 2026 21:20:16 +0000
Message-ID: <20261119212014.13180-3-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-6-arouhi@sitime.com>
 <20261117021811.2220116-1-kuba@kernel.org>
In-Reply-To: <20261117021811.2220116-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MW4PR20MB5323:EE_
x-ms-office365-filtering-correlation-id: 724931f0-2dcf-4d65-e1bd-08df4682e8dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|6133799003|261009221227099003|261009223327099003|261009221727099003|3023799007|261009223027099003|261009220027099003|4143699003|56012099006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|38070700021|10067099003|261026121527099003;
x-microsoft-antispam-message-info:
 0t1zotjXC4zSAn36lIDD3INgOOhQZL4DCz7c8qURAvFXV0hmf0/kX3QzfVelTglLea25IYu3EBtJ99eHtFcwQw3UBGmGqPzAQ15e4B9+2xL1rpVjxBw1wj/XrwcTYVOuRWbKlG094TEUqUAtK9YS+4h0Hw527/A7bo8R9B61BVY7eHj+WL8cCOMgk+WmSA/xQwoqIw7vrBPFk/AXz+iZDAOjR1O8oLmswbaKVYTC1uoLMZ8EH2P+fAL4eU2ixJryeE/k8o++BhjFq17YWOVhFo4b8V7nPZOHXp5SRSJ3Z4sAArGzcF5ltlzh6PTrBvM8zqFpGmLuUf9hFG7n4/gNcyGlBUhntUmCiPOhEbw+2ymmbxh7Ibpwwnmpaa7lMmVA19e93p+v0CB3ZsqYs++Ue53Goqpz+/VxVg3wN/2UiU4vw6PY55nInxc/TFq+XgyFv3SZ0G0IayotYmvV6Rg4gjo2PTM2C2wX5Nnx1ZxlMW8V+2h6JHP3wNCAuzdnIS0+i01pnZkqbplJhtRffV1YHeLww+g3Q9awjgCvXiUXdAW/bBTH2D1exnyG4qescgBxjLPa8AA3xa45w0mHWM60JLIgdWK1aF4t2MkuzeyGVcvyT7B8eBGB0us6QcXBnU+O1esJMBzx2WQa970qNqGO89RZHliZGu8ixoL1i3565rnQeb+O8KDGFnl4eXIes5QrR78+35OoNkOmfIQToiimlqXfqe8JaLM+Uec4DdtZtys=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009221227099003)(261009223327099003)(261009221727099003)(3023799007)(261009223027099003)(261009220027099003)(4143699003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVlDT04yQ3NQSElnd1MvZGl6SFVOLzdhZFRWSCtZWnR1YzZXYStHbk50YmVv?=
 =?utf-8?B?UEsxR0pqREZmUE5KK3F5NlRZRlFWOEJtc0wzQjVUcVd6d0xZYVBiNTBWazVE?=
 =?utf-8?B?cGJMVUp1VFJIaGx4RkVDN1ltQlAwMFdzWGcxK1pKemhLUXVxWk9wNEkxRkkv?=
 =?utf-8?B?U0dTaC9rSzRQckdmZmtXWG1aNnB3UStUQ29nVVJJRFBqalZnZXEwNll3bE1S?=
 =?utf-8?B?NjB3dlZOZi8yRGxUM1RHOVl3YWprQzh6VldUNUducXBpVXRHVU8wcmQ1OFZy?=
 =?utf-8?B?TUFpZllVVFI4QnRUb3psNXViaHpTU2R0Tm5lUDBmZlgyd2VmSDNGaUVkR2M2?=
 =?utf-8?B?VUhoMWk2ajk1aUlxTVo4aWh3U0xJZW1JT0w0aVVYYVdBZ1llOEkzNWx1WlVY?=
 =?utf-8?B?SVpaZFBhK2pEdElXdFVFZEpLV2daMXdocTVvTmdUdldDVXhRbUtjbGJPMXdN?=
 =?utf-8?B?TVFGTm1OeXlYbmRoV3VjcnN5V0tmOGZYa1lUTnNKNjNKRkpXQ1ZML1JzNDhM?=
 =?utf-8?B?Qk5HZ1VsVWtVL0NXTDhReXI2T3pnbG5RY0MyQ3lYZXJRSHUyYUFUekF1UEov?=
 =?utf-8?B?Smh3aDhJSSs1bHRXNlI4YVNKMGNpT0NBaHV4bnpOeFRNaUxubmJSaXVlZEc5?=
 =?utf-8?B?bkxKREJQU1hGbWk3cTRKd3dDeEtZQ2UyN25oNWpLZGJjOCs3OWV5UExRVHJI?=
 =?utf-8?B?bmE3eHFBTEdsYjQ5V2N6OHE5N3c4MGlWdVdoYnR5VkxTRFlCc1pqU3JmaGtU?=
 =?utf-8?B?c2Z4aGI2Z2RqaUZCcXhvMnBIYlpQWGFrVXYwMUwzc3grdUpGWXFxaGtLbGhi?=
 =?utf-8?B?ektFdTVBQ1lEZHhpcUM3NFlqcmNvRm1hL2xSNDhRRk5GOVlLampVS1JtV01z?=
 =?utf-8?B?ZHo2ZzA2aHB6ZmRWZUxZTW1GYzZvRWZycjk1MmZKcXZEL3R1WEl2UHV6cVdx?=
 =?utf-8?B?bEQ4SUtOR3VIbWIwczg2bnY4cWJKSW5XVHNBQUhnSFVIaE45eVlicWNjRS9s?=
 =?utf-8?B?WGVqeVR4dk5WVUNiQVRpUFZ2Rm5JdFkyMWpnSmJvVzhXOVdCZVlJVEtadG15?=
 =?utf-8?B?VjRrQnRudzR6bCtpSnc2QUdub1lKYnI4QkM0VDhqNGpvRmpvcFhFQUtSS0FW?=
 =?utf-8?B?Q0l1cjYzd3Y1WU9TNXBiRUJyaGtoRkpCTUY5ZjNXbDY0RHp0TGZkZ2tYTWR5?=
 =?utf-8?B?M2ovTjBUcXVSTVAxVWZyZndHbjZlb3hrS004ZHo0OGdNeVdGcE1LQVpRN1Ry?=
 =?utf-8?B?WGxMQWxka2NEcURXWE1NM2N5QVpNQStydjdUbzFIdjFGNmV3Rk5lTXhuZE9P?=
 =?utf-8?B?WDk3Y1N3MFc3clpseVl3YmREZ3dPazhFRWRxRFErZkdVTUVKWG9KYVdBMVZD?=
 =?utf-8?B?bHZ6ZE5Gb01sQ1JPYzJzYU5LeFpBTWJNSllEWEQ4NVNDOXZNSTZLSUxsT2J2?=
 =?utf-8?B?b1BZV2o3YWNiOEYwU2F0YmlaSk5EcFc1N3BkTVZ4R1RBamhGNkQ3UFMvVi9u?=
 =?utf-8?B?dkMzWXNrdHNYeDV5S0xpb2hzQVcxVHZub3VvaForRlhPS0FjVXBmUnA5VTNF?=
 =?utf-8?B?akNkQzFCRGlreVhZMmxFYmhzcGtwN1YrbFg2bXdZSnB1OW5BdnlqZTh2Uitp?=
 =?utf-8?B?VHJSWEpPa2gvMnRGSXUyRERxY2RFM2QwcUpJVVNXcFB3d0o4MXhVaklCdW0r?=
 =?utf-8?B?L29KZXZsajBKWnhOUWxDb05tbEFWbkdzaFI4azV2emFFQVFscklIZkZ1eGZC?=
 =?utf-8?B?MlduK1ZJU0VIWkFWV3M4YTlVTmlZUEF6azdSdW1pMnhpWnZoNDk0aDBmNjR5?=
 =?utf-8?B?UC9SWHBjZi9QN1FuVUlxSUJObHhDL01ickNJcG9kQ2pNV2RvenZXVmZkcm1U?=
 =?utf-8?B?WmVobldEd0lVS3Z3cWZyWnJXVllhRnNnYmNXNzFMN0R1amtQVDkrd3VtdDNy?=
 =?utf-8?B?UTVpNFpiQzJYQXZxcjF2ZEF4U1MyRDI4K0lNNG9rQkNua2NmT1l4bHlWd1ZF?=
 =?utf-8?B?ZWo1Y3R0U1BrUWRrZ1AzWnJFWFYzUkFDM20vM1UwSy9OeDU4TFVmZFVDNjJp?=
 =?utf-8?B?N0N4Q1ZwRGtuVXpkUlp6aklpZEsvUHRqcmx0ZFVLVFkxM2lsZEZlZjJtTXlj?=
 =?utf-8?B?TllpQWJGV212WVMzcEdLWHd1UTE1SUxiYzhHOUxDQ3BsNnA4NldLU2s5ZXk5?=
 =?utf-8?B?c2t1cmRYTkZnSkV3a1NibG9NQVU5VTNqLy9ORHRKVHpEQ21BY1BZVzFvMFJT?=
 =?utf-8?B?RlltS3RWS3JseUdoWWx4YjZLcE1XZ2p4Znh1K2k5MHA5cFBGaTEwUmNFVGE5?=
 =?utf-8?Q?gI+hCBBKEYDf5Lntox?=
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
X-Exchange-RoutingPolicyChecked:
	WCti4z5mo3JgQQAGCrc6H24XZrhsOpWK7GsxDaIKp7fbUkKpVYJkrXK/Qbn100bL8FG9NbrZcYca4iW+wtaqSjbbA+H9u8Kuc6g6f9bd680BQUWN1dvrCLSvwZmN+gYRqmzfuZnjiDnFmbFIr9pOh114nMUVaczMr/fyKH4WRw2qT+K9pOrusFccP1B2x2Tt2tx2nVa5geISm2KhE0oVKBDfD/Qx/JejnJWBluppJMKNvNOK3y1nWpW0LXcugIWf0EQ+9WXT40k+/ngFg/mNOucr9ADyznQXrS6QceyJ3SxzdEaLIgcbo5S/163XRET+2P8tLNNEkk8Wlb3g5B4/NA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724931f0-2dcf-4d65-e1bd-08df4682e8dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:20:16.8321
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlpIklZOGRsU5tXAMbm4SVC2+eJMgNeWTjJjAUCsamkmHUqj8DHsBrThGyDB+FRoYWFZHktRdF1OP6qp13+o1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5323
X-MDID: 1795123223-mvnKft71UA6z
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795123223;mvnKft71UA6z;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gTW9uLCAxNiBOb3YgMjAyNiAxODoxODoxMSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6
Cgo+ID4gUmVhZCB0aGUgRFBMTCB0eXBlIGFuZCwgZm9yIGVhY2ggcGluLCBpdHMgbGFiZWwsIGRp
cmVjdGlvbiwgY2FwYWJpbGl0aWVzCj4gPiBhbmQgc3VwcG9ydGVkIGZyZXF1ZW5jaWVzIGZyb20g
dGhlIGZpcm13YXJlIG5vZGUsIHdpdGggZGVmYXVsdHMgZm9yIGEKPiA+IG5vZGUgdGhhdCBnaXZl
cyBub25lLgo+Cj4gW1NldmVyaXR5OiBMb3ddCj4gRG9lcyB0aGlzIGRlc2NyaXB0aW9uIG1hdGNo
IHdoYXQgc2l0OTUzMXhfcGluX3Byb3BzX2dldCgpIGRvZXM/Cj4KPiBUaGUgZGlyZWN0aW9uIGlz
IG5vdCByZWFkIGZyb20gdGhlIGZpcm13YXJlIG5vZGUuIEl0IGlzIHRoZSBkaXIgYXJndW1lbnQK
PiBwYXNzZWQgaW4gYnkgdGhlIGNhbGxlci4gSXQgb25seSBzZWxlY3RzIHdoaWNoIHN1Yi1ub2Rl
ICgiaW5wdXQtcGlucyIgb3IKPiAib3V0cHV0LXBpbnMiKSBzaXQ5NTMxeF9wcm9wX3Bpbl9md25v
ZGVfZ2V0KCkgc2VhcmNoZXMuCj4KPiBUaGUgY2FwYWJpbGl0aWVzIGFyZSBub3QgcmVhZCBmcm9t
IGZpcm13YXJlIGVpdGhlci4gRWFjaCBwaW4gY2xhc3MgZ2V0cyBhCj4gZml4ZWQgdmFsdWU6IERQ
TExfUElOX0NBUEFCSUxJVElFU19TVEFURV9DQU5fQ0hBTkdFLCBvciAwIGZvciB0aGUgWE8uCj4K
PiBUaGUgbWVzc2FnZSBhbHNvIGxlYXZlcyBvdXQgdHdvIHRoaW5ncyB0aGUgY29kZSBkb2VzOgo+
Cj4gLSBJdCBwYXJzZXMgdGhlIHBlci1waW4gY29ubmVjdGlvbi10eXBlIHByb3BlcnR5IGludG8g
RFBMTF9QSU5fVFlQRV8qLgo+Cj4gLSBUaGUgZ2V0dGVyIHdyaXRlcyBzaXRkZXYtPnJlZltpbmRl
eF0uZnJlcSwgdXNpbmcgdGhlIGZpcnN0Cj4gICBzdXBwb3J0ZWQtZnJlcXVlbmNpZXMtaHogZW50
cnkuCj4KPiBDb3VsZCB0aGUgY29tbWl0IG1lc3NhZ2UgYmUgdXBkYXRlZCB0byBtYXRjaCB0aGUg
Y29kZT8KCkFncmVlZC4gVGhlIHYxNSBtZXNzYWdlIHNhaWQgdGhlIGRpcmVjdGlvbiBhbmQgdGhl
IGNhcGFiaWxpdGllcyBjb21lCmZyb20gdGhlIGZpcm13YXJlIG5vZGUsIGFuZCB0aGV5IGRvbid0
OyB0aGUgbWVzc2FnZSBub3cgc2F5cyB3aGljaApwcm9wZXJ0aWVzIGFyZSByZWFkIGZyb20gdGhl
IG5vZGUgYW5kIHRoYXQgdGhlIGRyaXZlciBzZXRzIHRoZSBvdGhlcgp0d28uCgo+ID4gKwkJZ290
byBlcnJfYWxsb2NfcmFuZ2VzOwo+ID4gKwl9Cj4gPiArCj4gPiArCS8qIFRoZSBmaXJzdCBsaXN0
ZWQgcmF0ZSBzZWVkcyB0aGUgaW5wdXQncyByYXRlICovCj4gPiArCWlmIChudW1fZnJlcXMgPiAw
ICYmIGRpciA9PSBEUExMX1BJTl9ESVJFQ1RJT05fSU5QVVQgJiYgIXhvKQo+ID4gKwkJY3Vycl9m
cmVxID0gZnJlcXNbMF07Cj4KPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBUaGlzIHJlYWRzIHN1cHBv
cnRlZC1mcmVxdWVuY2llcy1oeiBhcyB1MzIuIERvZXMgdGhhdCBtYXRjaCB0aGUgb3RoZXIKPiBk
cml2ZXIgdGhhdCB1c2VzIHRoaXMgZ2VuZXJpYyBwcm9wZXJ0eT8KPgo+IFRoZSBwcm9wZXJ0eSBp
cyBkZWZpbmVkIGluIHRoZSBzaGFyZWQgZHBsbC1waW4ueWFtbCwgd2hpY2ggZG9lcyBub3QgZ2l2
ZSBhCj4gY2VsbCB3aWR0aC4gemwzMDczeF9waW5fcHJvcHNfZ2V0KCkgcmVhZHMgdGhlIHNhbWUg
cHJvcGVydHkgYXMgdTY0Ogo+Cj4gZHJpdmVycy9kcGxsL3psMzA3M3gvcHJvcC5jOnpsMzA3M3hf
cGluX3Byb3BzX2dldCgpIHsKPiAgICAgLi4uCj4gCW51bV9mcmVxcyA9IGZ3bm9kZV9wcm9wZXJ0
eV9jb3VudF91NjQocHJvcHMtPmZ3bm9kZSwKPiAJCQkJCSAgICAgICJzdXBwb3J0ZWQtZnJlcXVl
bmNpZXMtaHoiKTsKPiAgICAgLi4uCj4gCWZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3U2NF9hcnJheShw
cm9wcy0+Zndub2RlLAo+IAkJCQkgICAgICAgInN1cHBvcnRlZC1mcmVxdWVuY2llcy1oeiIsIGZy
ZXFzLAo+IAkJCQkgICAgICAgbnVtX2ZyZXFzKTsKPiAgICAgLi4uCj4gfQo+Cj4gVGhlIG1pY3Jv
Y2hpcCx6bDMwNzMxLnlhbWwgZXhhbXBsZXMgYWxzbyB1c2UgL2JpdHMvIDY0IGZvciBpdC4KPgo+
IFN1cHBvc2UgYSBTaVQ5NTMxeCBib2FyZCBEVCBmb2xsb3dzIHRoYXQgY29udmVudGlvbjoKPgo+
ICAgICBzdXBwb3J0ZWQtZnJlcXVlbmNpZXMtaHogPSAvYml0cy8gNjQgPDEwMDAwMDAwPjsKPgo+
IFRoYXQgaXMgb25lIGl0ZW0sIHNvIGl0IHBhc3NlcyB0aGUgc2l0aW1lIGJpbmRpbmcncyBtYXhJ
dGVtczogMS4gQnV0Cj4gZndub2RlX3Byb3BlcnR5X2NvdW50X3UzMigpIHJldHVybnMgMiwgYW5k
IGZyZXFzW10gYmVjb21lcyB7MCwgMTAwMDAwMDB9Lgo+Cj4gY3Vycl9mcmVxID0gZnJlcXNbMF0g
aXMgdGhlbiAwLCBzbyBzaXRkZXYtPnJlZltpbmRleF0uZnJlcSBuZXZlciBnZXRzCj4gc2V0LiBU
aGUgcGluIGFsc28gYWR2ZXJ0aXNlcyBhIERQTExfUElOX0ZSRVFVRU5DWSgwKSBlbnRyeSBuZXh0
IHRvIHRoZQo+IHJlYWwgcmF0ZS4KPgo+IFRoZSByZXZlcnNlIGFsc28gYnJlYWtzOiB6bDMwNzN4
IHdvdWxkIHJlYWQgYSAzMi1iaXQgY2VsbCBsaXN0IGFzIHBhY2tlZAo+IHU2NCB2YWx1ZXMuCj4K
PiBTaG91bGQgdGhlIHNoYXJlZCBiaW5kaW5nIGRlZmluZSBvbmUgd2lkdGggdGhhdCBib3RoIGRy
aXZlcnMgZm9sbG93LCBvcgo+IHNob3VsZCB0aGUgc2l0aW1lIGJpbmRpbmcgc3RhdGUgdGhlIDMy
LWJpdCB3aWR0aCBleHBsaWNpdGx5PwoKZHRzY2hlbWEgYWxyZWFkeSB0eXBlcyBhIC1oeiBwcm9w
ZXJ0eSBhcyAzMi1iaXQgY2VsbHMsIHdoaWNoIGlzIHdoeSBhbgppbnB1dCB3cml0dGVuIGluIDY0
LWJpdCBjZWxscyBmYWlscyBkdF9iaW5kaW5nX2NoZWNrLiBBcyBmb3IgdGhlIGJpbmRpbmcKcGF0
Y2gsIGFuIG91dHB1dCB3cml0dGVuIHRoYXQgd2F5IGFkdmVydGlzZXMgYW4gZXh0cmEgMCBIeiBl
bnRyeSB0aGF0CnRoZSBkcml2ZXIgcmVmdXNlcywgYW5kIHRoZSByYXRlcyBzdGlsbCB3b3JrLiBO
byBjaGFuZ2UuCg==
