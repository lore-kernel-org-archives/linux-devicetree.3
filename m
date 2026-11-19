Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129096;
	b=Mw9tlhB3Qg3anRNdlHrFKNeZBCo++tMsHJDGGo7wAAoZmi/QVX0hwWjO3KmzTCsjPbKe
	 2fxhsStVRp4EasLYSh5R0RWLh2S519MZWGSDoQxSJ3+Ru2UtIrDbuzX/iR9L/CPAk9qsF
	 XvTHdIrJ9VEb82IX4qYVWIcYEnmf+loPno64sSKllZ0I9IjdMLJTlw+T5oIafNL7Vmmiv
	 1C3ipa+VgXl/QBU2Jscuv83Nya4/96bG7ElqOK+ixOpJBRhQKwU81QqP0JWKB8GqtMljh
	 isubJoi0FtNiceJFN092uP+W7ryKG3I8bLTvS7YS/t4AF34s/jYEXAdzudwMLW/S9ag==
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
	bh=5VtYP16/iep3fEbkLrFATY8YxIBiDDqPpuv3xHMFtnI=;
	b=KBYEiNRAxFVGNexRBmORf8aAb2cE4Xi3mlGyhmp3dqKDxc7Zc+Xb0aejRJVlS4I6zIOZ
	 Ddu94ldPfetHvOWu1G543mOvURxGqOlcqQYGL429EdMSduq7Hqs0Cismklut9cspGqBLx
	 ui4JRbwSsZFdnTdA9kmIPERDHOqGQNqu20SYC3IcJ4ISd8L/fv8Q53Szo3BpWh8t3Yrw/
	 cyRYSEpg132/JzTB1dfgIwwYRhBTgP5zSSW/lqKEP6LliGWgrIcRjZFeITavc3L2WQZNI
	 W4Hc5EgcvvqKGAn4pYYc/YGOt2SKjZYZzNa+pRmal1mP4RkOlspxa+uZTRTLIBay+iA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b="OdImzyA/";
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b="O35/I803";
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.49
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC260A6F48;
	Thu, 19 Nov 2026 22:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60BC260A6F48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=OdImzyA/;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=O35/I803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=5VtYP16/iep3fEbkLrFATY8YxIBiDDqPpuv3xHMFtnI=;
 b=OdImzyA/svlTNYvifaxPgdC1OHadBgQ3S7mcTv+7717IqvnDH0uvGxYJIoP6FsiZukeAld4SUvTeS1D2GcnR3eyO46v0BybChnc/UZJn4Ekvhdr3AjUEyfjWCR3zk0nzYQP2eZPDJa8UlYv/fLpxnKVYnbovatfX7WB+zzV2tcMGihw7vnj28jWMLIurfG5ZhhVRASo/4TeP22Y75CnQmQEX5u2cNiuUcmgHRBoRiz9pwsPjoojKr9gC+lEzKsXoXWcDYR9CMALq8ordJp//ZTz7tnnR5oFatILtb5abDWdNBQ3t46gNqlK9R2ofroceA1H3tbwbrEo8W1yCEb9BBw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 489C9C40066;
	Thu, 19 Nov 2026 22:58:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cifvkPbNH6llmQnZfQ9vhJhVxfKZK99lwO1qTl83B0hwaCQMmPk2ncHsvGJ58AlVAUDWqI7/OhgehDRS2lhQNDedbSOEKwUeKHL8Gpf1u3UEChMtrYLkHXozzLRxGS7wN/S7khFurE0uHMxasJENxUg6J9Fjs6prZJdVxbKls9sKdjw2TGEBLispq9wX0aszBXc5lbcWstrAppU7EXPBJH9zB65TLVxMF7knanDqaxw8ONoCAzj7JaVJVK8aG+C/ruvig+eI0Z9ZtkPP+JCDyIbR7pRv6WcQMIWYC9sJILxw3HLDaiVs6hBryhs39qmypIIYfOSYA8McJZ3Ow6+e5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VtYP16/iep3fEbkLrFATY8YxIBiDDqPpuv3xHMFtnI=;
 b=Lk3mJMgzlMCmQaINWNpaeVmquqJ1nL4Xt2owhIMxnrXaWOHRDr/dIZ7DlzNyBlICb4jp7huzAZj6Ep7ZStCWh+K1JNIQFOJofXf91buM/nHehRVXIQ9oJD0qGD8v1L+79yhy94w6LE9L9B5VtNnZUJYDBfgZ4lPO26I62puFJBzPSSZHePJI2RkzSFwvzemgGUBoLyky2AEIx8jDRYkohndLGvCjxKJQ89y/QylRFJ7p+s1YSCY+hz3VxV0WuC52pPlc1pYlUhsb6xDmcypS3Z7QIRhsJS7p+TAjT73cAnrTlcgaG1DnNeOWMR3dGVsiyv6hZNnn0O0/Im+pVP7nlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VtYP16/iep3fEbkLrFATY8YxIBiDDqPpuv3xHMFtnI=;
 b=O35/I803Lef/ij4iPzBrYwlBcU01J71CmyqIfZT0G731jVtwF+BucVrQ3QBIYYRvMRVGORYpOGeCiqNIMIIpKNzosw8NNbAzG4pcYXQmpCIbID3EdF0qKOEs9BDPBWW5P6bsw9fiybhLvyNnBTxDoOUwtUCh5x0oxQXHvyYz2P1yugrMen333gXPmNMJHPMQvI2pYqfiwTI47LFxqpNIgT/Y3Wlbj12S7OCxbL+E7cADiv1yh1YwyAUsQWUDGYh5vATHvV/o4WnJmigkwZfHhw8FJIeWJfrlvGUovASqgMh5IXJ+OGmCDnjMvCLXnwlO1aWwjdCLNKGsR4s9llL0BQ==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by SA5PPF6C2DD1D15.namprd20.prod.outlook.com (2603:10b6:80f:fc04::998) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Thu, 19 Nov
 2026 22:58:06 +0000
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
Subject: [PATCH net-next v16 13/13] dpll: sit9531x: model the inter-PLL sync
 line as a pair of pins
Thread-Topic: [PATCH net-next v16 13/13] dpll: sit9531x: model the inter-PLL
 sync line as a pair of pins
Thread-Index: AQHdeHltejn5SXtNw0OgFe5aWWGKag==
Date: Thu, 19 Nov 2026 22:58:01 +0000
Message-ID: <20261119225752.41846-14-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 4ff99c62-ad6a-4406-6e1b-08df469092a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261026135527099003|261028144727099003|260925021911599003|260925021311599003|260925022911599003|5023799004|261021135927099003|261021130227099003|56012099006|261021123027099003|261026130827099003|261022105027099003|261022115727099003|261026121527099003|261022113327099003|261021133027099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info:
 kLgGMA6CylJBUOUveTaHxW5TdKF6Rx3+7jBKMeFDwnY+64rOYB/CChxWvoV1x4IiIFIkc7niTGINVKH1T3dEyVmwMMpQU/x6Y7aXC17dR0MaO19+26sPPH1ERVLwDuqV/uTIfI4EUt9mM00SIOMHZCM3TYd4ZnkiIX797t24qFYXqJYQCgBn337+BE2hXJcFQ34wuXU5NFFwU906mUv6UfMnARhXwiSNwqeYRPsNqnbfJ45k6eyuBaMgU9thasyxUZ/A55KAv8iD73iz4PJZ7LgFgxiaNql6H0j8r7zS4gpef/tCPF57CTMB/jr9dy3YsjbgsKVj06AKnnlxt+HSNovK9SS/3dSJRyMwNGHHEBODrKJKnQi0A+LWM4ShLuMX2WP9AqORvEExpOlSyfRDauz1qtvl05BMnqmTmr1M+0pNSVa3+xlfroyc6WUp0JYtlIqu/kU64oJNRLSWlrgluwVogKsqqunZTmtvmySSkDWeFASMcBdvi/lt/UAJDQpVpIoAnGKpViJ8si4p4HmpxVIzpJSc6omKYayrOYzNzvNx8yKvbO3Sk0OfXFT6ru9IMZIBNrfqRV5sJbUFinN8SyT+2BnJf4USt0bgtgxWxOvztBvevXGI6oWbsMT1BMVF3PtfPGW7TvVJ2FdyZw145BoDOfI0SdKrutHGaN0O/MpxClV6oUnjh7KeCcQNtoBPoGjTHf2p/Sxdz4dZrfZbo73wE9+1j2Wi1QGruU3LEqo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261026135527099003)(261028144727099003)(260925021911599003)(260925021311599003)(260925022911599003)(5023799004)(261021135927099003)(261021130227099003)(56012099006)(261021123027099003)(261026130827099003)(261022105027099003)(261022115727099003)(261026121527099003)(261022113327099003)(261021133027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FIFxGX0gpnEu0RIC12muJyFtEwmHOBu6mIRPb/ig4OGxpaqDWZMzc4cBMJ?=
 =?iso-8859-1?Q?LwNFt9w3djdd0f8ve/Z1PpH7jiMBazSb4g35GT347A5G35s2Xh7lY1Nhfd?=
 =?iso-8859-1?Q?NsglDtThcG5FGxQlFEomPaT2DUiF471u6isGK48k9UdV5ddLEhKg1suf1j?=
 =?iso-8859-1?Q?dww+9DOSEQlA7L0yhIgKr0YbrpEFWwf6hXYsfb//b1v5JVnDtAnZ7/Sull?=
 =?iso-8859-1?Q?6kEJpRwuL4Nq1k4YATHQHfkYqJFDZJTTH0ZCLElDZj0Bex18zfHfi4dUGS?=
 =?iso-8859-1?Q?0meD7AVgfswj63mMTAOsVPfr1kUf+bSCw06fphT0wxAGSdbFOvFsPXVGg3?=
 =?iso-8859-1?Q?MZFR66PxlZh8NiBEQHBZ7E25U6D8MLuBGhLuq/Hel+3L1DYaJVqFZVAMdu?=
 =?iso-8859-1?Q?Yiv9dy/tj7fcsTYuSls3oTFcrHE4qJX08F0xUTTdG1jyvY68fYn6wjHCQc?=
 =?iso-8859-1?Q?sO/nbdyGxcrE+GzQtOABxz5bILIubWM9qew7bS1YiyvmL6qZzxR5UgTwor?=
 =?iso-8859-1?Q?eoBUb0UBAA+gtHPRRRsjPTBfpPxT9BTSH163g5YNSatHvFqG2BJG5Cx/Pp?=
 =?iso-8859-1?Q?oswYTeIA/YG0cL7wZ7IUevxbFvaMJIhaSRYnoqLUjLNUMVCEa9PI3gOibT?=
 =?iso-8859-1?Q?w6Cr3fANVCb8gxqlL0BpQ8PJ9HyLkFy9NITeUDz7J1Y4Uzh2trl+kNYIom?=
 =?iso-8859-1?Q?d5DOlByVbCLgLr8vGpNS8jlsr8byGtDAzRGTRzeWBRLP0U6WoQItYy0u34?=
 =?iso-8859-1?Q?QWBtLNpOykkeG7EaP3YEajmH8ghSuD1JjnrnzsFno7QugrMv+PhTFRNQf7?=
 =?iso-8859-1?Q?/JSatsSWUW561RCB3sgSXdFKtZYwqHVkJEZWC/kzpBJFt5qoYSMJ+IAya9?=
 =?iso-8859-1?Q?eHkyDNc+Xm60tiTnfmiHV+5cMnCSCsOvrKZSv/9vfAK4keOIXgfko1+PyA?=
 =?iso-8859-1?Q?IAxN9+9iIW73Ywi8D6r/q2aUmvAyUbmIHim5Coolc/HP3btouvHLoDnFUJ?=
 =?iso-8859-1?Q?22W2PLELYyNo0Z2C0FPiA29tfysbnkvS1jdSrKc5MjJEkBcQTZyYGiXw9h?=
 =?iso-8859-1?Q?Vqt40Lk3leV9npKAZ8LHuaghaZKXrI5dxw8HLsUmigz7b5m+JnZNcQD+Qb?=
 =?iso-8859-1?Q?VAe1/0JVUijk/MZ9jUR6s6TQ5tl7j212WxDcJtnADmmy456xH3ybAOUb7R?=
 =?iso-8859-1?Q?v4dwwYAHe2GGCXuQdjPdeV6l05zcWo5J8fGUDwimeRn4D4enGx4dL8Zd4c?=
 =?iso-8859-1?Q?OeipSCkjpAj5kZupPPx36yYS5+mTIaqWy9LSPZtYJAlqBasTdOS2B5dwEm?=
 =?iso-8859-1?Q?1DFwep8AoP8FPX7PrACplmX4S/Vh7eBO9ibnlB0+nbphcJECVVMSc3Gsr6?=
 =?iso-8859-1?Q?vDF5OHRoCP6r8BmhCg1aOdsEE3cJEWfu21K6h+G7k+SFck/8rudf4qagx0?=
 =?iso-8859-1?Q?+6VH9BLJlYqxcUZ+LYCNPDASzyYBnUXjcrI22IDcsOLN8oEvm2pg2B2oV2?=
 =?iso-8859-1?Q?Ha/ZX3sdn8aOdk5AGg3cifQxK6SS5Xs6RPjJTdhXydc9sqkka9IsdJ2xG8?=
 =?iso-8859-1?Q?3t6n3xxoTKP5zP5YUvqHFdvd1BOfiMHzVl9T3plJbD1lCaQ9mmT8ssCsjv?=
 =?iso-8859-1?Q?VrvlX96xF/iNHXF2f86JtQmHWOs4Uc0jwCcg2LarRjtuCBCbqiGgyM8ebD?=
 =?iso-8859-1?Q?ZaHuoWd0QwWcsThvXWav9ANDYWvMnq77f0V8wbOh5Ht32MKbhgVLYVlsgw?=
 =?iso-8859-1?Q?5z5/B5KkHcP4HwSbEZrM8oMw4nZq0hDXjUiM92uMopoJzH?=
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
	1++A1x/dr2XOamTiDsz/HwKIyaNhEZcQOz3FFEZwveoRd/zy0UW+ciCuKUu6u9ybweTjqohmJxaLXBf1VUNet37d+EKoaD5oyEuYJhV7gcbUVYeXiI7EBy1nm0cM0lXrD6QI+JxtpUm6dRiu1JMbLL1OOt0DX4FRJdt/e/2Vw0AwTueNdLMp2SoPEe04B5U1raSb9EuyrGFeZhnlMgRJVQEJ3GirKaBO0i3CPdEXU+IU+qhlG/4IBA241q4A8pZ+pad3NpPZ92iY0T7Mjo1LyzmwxXshsDEekUB+x1jrcMYgqxHVp3tC2b74yvZHB/l2cl86OAB6U4ZWCbiodTpDtQ==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff99c62-ad6a-4406-6e1b-08df469092a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:58:01.9663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uyXw1itPilA22SD7HIeNRV3Z2mcJ/6HncHe8AnrWb9285H5mAqGYJ3kZLQXDlSuQIX1vCJrLpDqscrb9yu2rhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6C2DD1D15
X-MDID: 1795129089-TT1Z-iNmurHE
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1795129089;TT1Z-iNmurHE;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
The part has an internal line by which one PLL drives the others as a=0A=
reference. Model it as two pins: a source pin, one pin registered on=0A=
every DPLL, whose state on a DPLL says whether that PLL drives the=0A=
line, and an input pin on each destination, selectable like any input,=0A=
reporting no signal while the line is not driven.=0A=
=0A=
Taking the line writes the source pattern, the values of the reference=0A=
sequence, to the source's EXT page under its debug key, then sets the=0A=
global enable; the enable is set last because over a page holding part=0A=
of the pattern it may drive the line from that page.=0A=
Giving the line up clears the enable and writes the disable pattern.=0A=
The owner is read back from the four EXT pages. A page left with part=0A=
of the pattern refuses a connect on any other PLL until its source pin=0A=
is disconnected; an enable the driver does not recognize, or the=0A=
pattern on two pages, refuses every connect.=0A=
=0A=
Resume re-reads the line owner, the output mutes and the output delays,=0A=
which a configuration reload may have changed, and drops the writes=0A=
left pending from before suspend, logging each.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/core.c | 732 ++++++++++++++++++++++++++++++++++-=0A=
 drivers/dpll/sit9531x/core.h |  32 ++=0A=
 drivers/dpll/sit9531x/dpll.c | 428 ++++++++++++++++++--=0A=
 drivers/dpll/sit9531x/regs.h |   3 +=0A=
 4 files changed, 1166 insertions(+), 29 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
index 5ec9d2a48fcb..ca42940796d3 100644=0A=
--- a/drivers/dpll/sit9531x/core.c=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -879,6 +879,8 @@ static bool sit9531x_prio_src_live(const struct sit9531=
x_dev *sitdev, u8 src)=0A=
 {=0A=
 	u8 index =3D sit9531x_hw_src_input(src);=0A=
 =0A=
+	if (index =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
+		return sit9531x_intsync_driven(sitdev);=0A=
 	if (index >=3D sitdev->info->num_inputs)=0A=
 		return true;=0A=
 =0A=
@@ -1113,6 +1115,18 @@ static u8 sit9531x_prio_activesel_pick(struct sit953=
1x_dev *sitdev,=0A=
 	return srcs[0];=0A=
 }=0A=
 =0A=
+static bool sit9531x_prio_table_lists_intsync(const u8 *srcs)=0A=
+{=0A=
+	u8 slot;=0A=
+=0A=
+	for (slot =3D 0; slot < SIT9531X_PRIO_MAX_SLOTS; slot++)=0A=
+		if ((srcs[slot] & SIT9531X_PRIO_NIBBLE_MASK) =3D=3D=0A=
+		    SIT9531X_PRIO_SRC_INTSYNC)=0A=
+			return true;=0A=
+=0A=
+	return false;=0A=
+}=0A=
+=0A=
 static int sit9531x_prio_table_commit(struct sit9531x_dev *sitdev, u8 pll_=
idx,=0A=
 				      const u8 *srcs)=0A=
 {=0A=
@@ -1129,6 +1143,11 @@ static int sit9531x_prio_table_commit(struct sit9531=
x_dev *sitdev, u8 pll_idx,=0A=
 		if (sit9531x_prio_src_usable(srcs[slot]))=0A=
 			empty =3D false;=0A=
 =0A=
+	if (sitdev->intsync_stale &&=0A=
+	    (sit9531x_prio_table_lists_intsync(srcs) ||=0A=
+	     sit9531x_prio_table_lists_intsync(chan->prio_srcs)))=0A=
+		sit9531x_intsync_refresh(sitdev);=0A=
+=0A=
 	memcpy(back, chan->table_pending ? chan->table_back : chan->prio_srcs,=0A=
 	       sizeof(back));=0A=
 =0A=
@@ -2620,6 +2639,574 @@ static int sit9531x_clear_notifications(struct sit9=
531x_dev *sitdev)=0A=
 	return 0;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Close the debug window on a PLL's EXT page; the key opens every debug=
=0A=
+ * register on the page while it holds the unlock value.=0A=
+ */=0A=
+static int sit9531x_intsync_debug_lock(struct sit9531x_dev *sitdev, u8 ext=
_page)=0A=
+{=0A=
+	return sit9531x_write_close(sitdev,=0A=
+				    SIT9531X_REG(ext_page,=0A=
+						 SIT9531X_PLL_REG_DEBUG),=0A=
+				    SIT9531X_PLL_DEBUG_LOCK);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Values written to the source PLL's EXT page to enable or disable INTSYN=
C,=0A=
+ * which locks the frequency PLL to the phase PLL; they are the values of=
=0A=
+ * Intsync_enable_disable.py.=0A=
+ */=0A=
+struct sit9531x_intsync_reg {=0A=
+	u8 offset;=0A=
+	u8 en_val;=0A=
+	u8 dis_val;=0A=
+};=0A=
+=0A=
+static const struct sit9531x_intsync_reg intsync_config[] =3D {=0A=
+	{ 0x2D, 0x02, 0x00 },=0A=
+	{ 0x50, 0x08, 0x00 },=0A=
+	{ 0x51, 0x04, 0x00 },=0A=
+	{ 0x54, 0x02, 0x00 },=0A=
+	{ 0x55, 0x28, 0x20 },=0A=
+	{ 0x5C, 0x0F, 0x00 },=0A=
+	{ 0x5D, 0xFF, 0x00 },=0A=
+	{ 0x6C, 0xDD, 0x00 },=0A=
+};=0A=
+=0A=
+/*=0A=
+ * Find the PLL whose EXT page holds the INTSYNC enable pattern, whole or =
in=0A=
+ * part. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+int sit9531x_intsync_src_detect(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	s8 src =3D -1, partial =3D -1;=0A=
+	int rc, ret, n_en, n_dis;=0A=
+	u8 pll, ext_page;=0A=
+	u8 n_pages =3D 0;=0A=
+	unsigned int i;=0A=
+	bool enabled;=0A=
+	u8 global;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &global);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	enabled =3D global & BIT(SIT9531X_INTSYNC_EN_BIT);=0A=
+=0A=
+	/*=0A=
+	 * Read the EXT pages even with the global enable clear; a page can hold=
=0A=
+	 * the enable pattern under a clear bit.=0A=
+	 */=0A=
+	for (pll =3D 0; pll < SIT9531X_NUM_PLLS; pll++) {=0A=
+		ext_page =3D SIT9531X_PLL_EXT_PAGE(pll);=0A=
+=0A=
+		/*=0A=
+		 * Open the EXT page's debug window to read the INTSYNC=0A=
+		 * registers.=0A=
+		 */=0A=
+		rc =3D sit9531x_write_u8(sitdev,=0A=
+				       SIT9531X_REG(ext_page,=0A=
+						    SIT9531X_PLL_REG_DEBUG),=0A=
+				       SIT9531X_PLL_DEBUG_UNLOCK);=0A=
+		if (rc) {=0A=
+			sit9531x_intsync_debug_lock(sitdev, ext_page);=0A=
+			return rc;=0A=
+		}=0A=
+=0A=
+		n_en =3D 0;=0A=
+		n_dis =3D 0;=0A=
+		for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {=0A=
+			u16 reg;=0A=
+			u8 val;=0A=
+=0A=
+			reg =3D SIT9531X_REG(ext_page, intsync_config[i].offset);=0A=
+=0A=
+			rc =3D sit9531x_read_u8(sitdev, reg, &val);=0A=
+			if (rc)=0A=
+				break;=0A=
+			if (val =3D=3D intsync_config[i].en_val)=0A=
+				n_en++;=0A=
+			else if (val =3D=3D intsync_config[i].dis_val)=0A=
+				n_dis++;=0A=
+		}=0A=
+=0A=
+		ret =3D sit9531x_intsync_debug_lock(sitdev, ext_page);=0A=
+		if (!rc)=0A=
+			rc =3D ret;=0A=
+		if (rc)=0A=
+			return rc;=0A=
+=0A=
+		/*=0A=
+		 * A page with the disable pattern or with other values is not a=0A=
+		 * source.=0A=
+		 */=0A=
+		if (!n_en || n_en + n_dis !=3D ARRAY_SIZE(intsync_config))=0A=
+			continue;=0A=
+		n_pages++;=0A=
+=0A=
+		if (n_dis || !enabled) {=0A=
+			/*=0A=
+			 * The whole pattern under a clear global enable does=0A=
+			 * not drive the line; a page holding both patterns=0A=
+			 * under the enable may drive it in an undefined state.=0A=
+			 * Neither is reported as the source.=0A=
+			 */=0A=
+			if (partial < 0)=0A=
+				partial =3D pll;=0A=
+			continue;=0A=
+		}=0A=
+=0A=
+		if (src < 0)=0A=
+			src =3D pll;=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * Record a PLL with a partial or unenabled pattern so that no other=0A=
+	 * PLL is enabled alongside it.=0A=
+	 */=0A=
+	sitdev->intsync_partial =3D src < 0 && partial >=3D 0;=0A=
+	if (sitdev->intsync_partial) {=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "PLL%c holds an INTSYNC source configuration that is not a defined sou=
rce\n",=0A=
+			 'A' + partial);=0A=
+		src =3D partial;=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * With more than one page holding the pattern, refuse every connect; an=
=0A=
+	 * enable on one would also set the global enable over the other.=0A=
+	 */=0A=
+	sitdev->intsync_conflict =3D n_pages > 1;=0A=
+	if (sitdev->intsync_conflict)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "%u PLLs hold the INTSYNC source pattern; recording PLL%c\n",=0A=
+			 n_pages, 'A' + src);=0A=
+=0A=
+	sitdev->intsync_src =3D src;=0A=
+	sitdev->intsync_foreign =3D enabled && src < 0;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * sit9531x_intsync_readback - re-read the sync source record from the par=
t=0A=
+ * @sitdev: device pointer=0A=
+ *=0A=
+ * A page reads the same latched or not, so a recorded partial source is k=
ept=0A=
+ * when the scan finds no source or the same PLL, and dropped when it find=
s=0A=
+ * another PLL or the global enable set with no page holding the pattern.=
=0A=
+ * Caller must hold sitdev->multiop_lock.=0A=
+ *=0A=
+ * Return: 0 on success, <0 on a read error=0A=
+ */=0A=
+int sit9531x_intsync_readback(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	bool partial =3D sitdev->intsync_partial;=0A=
+	s8 src =3D sitdev->intsync_src;=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_intsync_src_detect(sitdev);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	if (partial && !sitdev->intsync_foreign &&=0A=
+	    (sitdev->intsync_src < 0 ||=0A=
+	     (sitdev->intsync_src =3D=3D src && !sitdev->intsync_partial))) {=0A=
+		sitdev->intsync_src =3D src;=0A=
+		sitdev->intsync_partial =3D true;=0A=
+		sitdev->intsync_foreign =3D false;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * sit9531x_intsync_refresh - re-read a stale sync source record=0A=
+ * @sitdev: device pointer=0A=
+ *=0A=
+ * Caller must hold sitdev->multiop_lock.=0A=
+ *=0A=
+ * Return: 0 when the record is current, <0 when the scan fails=0A=
+ */=0A=
+int sit9531x_intsync_refresh(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	s8 owner;=0A=
+	int rc;=0A=
+=0A=
+	if (!sitdev->intsync_stale)=0A=
+		return 0;=0A=
+=0A=
+	owner =3D sit9531x_intsync_owner(sitdev);=0A=
+	rc =3D sit9531x_intsync_readback(sitdev);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	sitdev->intsync_stale =3D false;=0A=
+	if (owner !=3D sit9531x_intsync_owner(sitdev))=0A=
+		sitdev->intsync_ntf_pending =3D true;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Check if the inter-PLL sync line carries a signal, from the recorded so=
urce=0A=
+ * or a PLL locked to the line. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+bool sit9531x_intsync_driven(const struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	const struct sit9531x_chan *chan;=0A=
+	u8 pll;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (sitdev->intsync_src >=3D 0 && !sitdev->intsync_partial &&=0A=
+	    !sitdev->intsync_stale)=0A=
+		return true;=0A=
+=0A=
+	for (pll =3D 0; pll < SIT9531X_NUM_PLLS; pll++) {=0A=
+		chan =3D sit9531x_chan_state_get(sitdev, pll);=0A=
+		if (chan->routed_ref =3D=3D SIT9531X_INTSYNC_PIN_ID &&=0A=
+		    chan->locked && !chan->ho_freeze &&=0A=
+		    !chan->stale && !chan->intsync_dropped)=0A=
+			return true;=0A=
+	}=0A=
+=0A=
+	return false;=0A=
+}=0A=
+=0A=
+static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,=0A=
+				      u8 src_pll_idx, bool restore,=0A=
+				      bool *owner_kept, bool *touched);=0A=
+=0A=
+/*=0A=
+ * Latch the INTSYNC source pattern into the PLL's EXT page, then set the =
global=0A=
+ * enable. The enable comes last: set over a page holding part of the patt=
ern,=0A=
+ * it may drive the line from that page. Caller must hold sitdev->multiop_=
lock.=0A=
+ */=0A=
+int sit9531x_intsync_enable(struct sit9531x_dev *sitdev, u8 src_pll_idx,=
=0A=
+			    bool *rollback_failed, bool *touched)=0A=
+{=0A=
+	u8 ext_page, val;=0A=
+	int rc, lock_rc;=0A=
+	unsigned int i;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rollback_failed)=0A=
+		*rollback_failed =3D false;=0A=
+	if (touched)=0A=
+		*touched =3D false;=0A=
+	if (src_pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+=0A=
+	ext_page =3D SIT9531X_PLL_EXT_PAGE(src_pll_idx);=0A=
+=0A=
+	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	if (touched)=0A=
+		*touched =3D true;=0A=
+	rc =3D sit9531x_write_u8(sitdev,=0A=
+			       SIT9531X_REG(ext_page,=0A=
+					    SIT9531X_PLL_REG_DEBUG),=0A=
+			       SIT9531X_PLL_DEBUG_UNLOCK);=0A=
+	if (rc)=0A=
+		goto relock_err;=0A=
+=0A=
+	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {=0A=
+		rc =3D sit9531x_write_u8(sitdev,=0A=
+				       SIT9531X_REG(ext_page,=0A=
+						    intsync_config[i].offset),=0A=
+				       intsync_config[i].en_val);=0A=
+		if (rc)=0A=
+			goto relock_err;=0A=
+	}=0A=
+=0A=
+	rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);=0A=
+	if (rc)=0A=
+		goto relock_err;=0A=
+=0A=
+	lock_rc =3D sit9531x_intsync_debug_lock(sitdev, ext_page);=0A=
+	if (lock_rc)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "PLL%c: INTSYNC pattern written but the debug window was left open: %d=
\n",=0A=
+			 'A' + src_pll_idx, lock_rc);=0A=
+=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,=0A=
+			       val | BIT(SIT9531X_INTSYNC_EN_BIT));=0A=
+	if (rc)=0A=
+		goto err_disable;=0A=
+=0A=
+	/* The page-0 small update applies the global enable */=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GLOBAL_UPDATE,=0A=
+			       SIT9531X_SMALL_UPDATE_CMD);=0A=
+	usleep_range(1000, 2000);=0A=
+	if (rc)=0A=
+		goto err_disable;=0A=
+=0A=
+	return 0;=0A=
+=0A=
+relock_err:=0A=
+	sit9531x_intsync_debug_lock(sitdev, ext_page);=0A=
+=0A=
+err_disable:=0A=
+	{=0A=
+		int rollback_rc;=0A=
+=0A=
+		rollback_rc =3D __sit9531x_intsync_disable(sitdev, src_pll_idx,=0A=
+							 false, NULL, NULL);=0A=
+		if (rollback_rc) {=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "INTSYNC rollback failed after enable error: %d (original %d)\n",=0A=
+				 rollback_rc, rc);=0A=
+			if (rollback_failed)=0A=
+				*rollback_failed =3D true;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Read whether every INTSYNC register of an EXT page holds its disable va=
lue=0A=
+ * (@off) or its enable value (@on). The page's debug window must be open.=
=0A=
+ */=0A=
+static int sit9531x_intsync_page_state(struct sit9531x_dev *sitdev,=0A=
+				       u8 ext_page, bool *off, bool *on)=0A=
+{=0A=
+	unsigned int i;=0A=
+	u8 val;=0A=
+	int rc;=0A=
+=0A=
+	*off =3D true;=0A=
+	*on =3D true;=0A=
+	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {=0A=
+		rc =3D sit9531x_read_u8(sitdev,=0A=
+				      SIT9531X_REG(ext_page,=0A=
+						   intsync_config[i].offset),=0A=
+				      &val);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+		if (val !=3D intsync_config[i].dis_val)=0A=
+			*off =3D false;=0A=
+		if (val !=3D intsync_config[i].en_val)=0A=
+			*on =3D false;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int __sit9531x_intsync_disable(struct sit9531x_dev *sitdev,=0A=
+				      u8 src_pll_idx, bool restore,=0A=
+				      bool *owner_kept, bool *touched)=0A=
+{=0A=
+	bool in_window =3D false, was_enabled;=0A=
+	u8 ext_page, val;=0A=
+	int rc, lock_rc;=0A=
+	unsigned int i;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (owner_kept)=0A=
+		*owner_kept =3D false;=0A=
+	if (touched)=0A=
+		*touched =3D false;=0A=
+	if (src_pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+=0A=
+	ext_page =3D SIT9531X_PLL_EXT_PAGE(src_pll_idx);=0A=
+=0A=
+	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL, &val);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	was_enabled =3D val & BIT(SIT9531X_INTSYNC_EN_BIT);=0A=
+	if (touched)=0A=
+		*touched =3D true;=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,=0A=
+			       val & ~BIT(SIT9531X_INTSYNC_EN_BIT));=0A=
+	if (rc)=0A=
+		goto restore_global;=0A=
+	/* A sample taken before this write can still show a lock. */=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++)=0A=
+		if (sitdev->chan[i].routed_ref =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
+			sitdev->chan[i].intsync_dropped =3D true;=0A=
+=0A=
+	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GLOBAL_UPDATE,=0A=
+			       SIT9531X_SMALL_UPDATE_CMD);=0A=
+	usleep_range(1000, 2000);=0A=
+	if (rc)=0A=
+		goto restore_global;=0A=
+=0A=
+	rc =3D sit9531x_write_u8(sitdev,=0A=
+			       SIT9531X_REG(ext_page,=0A=
+					    SIT9531X_PLL_REG_DEBUG),=0A=
+			       SIT9531X_PLL_DEBUG_UNLOCK);=0A=
+	if (rc)=0A=
+		goto restore_global;=0A=
+	in_window =3D true;=0A=
+=0A=
+	for (i =3D 0; i < ARRAY_SIZE(intsync_config); i++) {=0A=
+		rc =3D sit9531x_write_u8(sitdev,=0A=
+				       SIT9531X_REG(ext_page,=0A=
+						    intsync_config[i].offset),=0A=
+				       intsync_config[i].dis_val);=0A=
+		if (rc)=0A=
+			goto restore_global;=0A=
+	}=0A=
+=0A=
+	rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);=0A=
+	if (rc && owner_kept)=0A=
+		*owner_kept =3D true;=0A=
+=0A=
+	goto relock;=0A=
+=0A=
+restore_global:=0A=
+	/*=0A=
+	 * Finish the disable if the page holds the disable pattern; restore=0A=
+	 * the global enable only if it still holds the enable pattern. Set=0A=
+	 * over part of the pattern, the enable may drive the line, so it stays=
=0A=
+	 * clear.=0A=
+	 */=0A=
+	if (restore) {=0A=
+		bool off, on;=0A=
+=0A=
+		if (!in_window &&=0A=
+		    sit9531x_write_u8(sitdev,=0A=
+				      SIT9531X_REG(ext_page,=0A=
+						   SIT9531X_PLL_REG_DEBUG),=0A=
+				      SIT9531X_PLL_DEBUG_UNLOCK)) {=0A=
+			if (owner_kept)=0A=
+				*owner_kept =3D true;=0A=
+			goto relock;=0A=
+		}=0A=
+		if (sit9531x_intsync_page_state(sitdev, ext_page, &off, &on) ||=0A=
+		    (!off && !on)) {=0A=
+			if (owner_kept)=0A=
+				*owner_kept =3D true;=0A=
+			goto relock;=0A=
+		}=0A=
+		if (off) {=0A=
+			rc =3D sit9531x_pll_small_update(sitdev, src_pll_idx);=0A=
+			if (rc && owner_kept)=0A=
+				*owner_kept =3D true;=0A=
+			goto relock;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	if (restore && was_enabled) {=0A=
+		int ret;=0A=
+=0A=
+		ret =3D sit9531x_read_u8(sitdev, SIT9531X_REG_INTSYNC_GLOBAL,=0A=
+				       &val);=0A=
+		if (!ret)=0A=
+			ret =3D sit9531x_write_u8(sitdev,=0A=
+						SIT9531X_REG_INTSYNC_GLOBAL,=0A=
+						val |=0A=
+						BIT(SIT9531X_INTSYNC_EN_BIT));=0A=
+		if (!ret) {=0A=
+			/* The page-0 small update applies the global enable */=0A=
+			ret =3D sit9531x_write_close(sitdev,=0A=
+						   SIT9531X_REG_GLOBAL_UPDATE,=0A=
+						   SIT9531X_SMALL_UPDATE_CMD);=0A=
+			usleep_range(1000, 2000);=0A=
+		}=0A=
+		if (ret) {=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c: INTSYNC enable not put back after a failed disable: %d\n",=0A=
+				 'A' + src_pll_idx, ret);=0A=
+			if (owner_kept)=0A=
+				*owner_kept =3D true;=0A=
+		}=0A=
+	}=0A=
+=0A=
+relock:=0A=
+	lock_rc =3D sit9531x_intsync_debug_lock(sitdev, ext_page);=0A=
+	if (lock_rc) {=0A=
+		if (rc)=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c: debug window left open: %d\n",=0A=
+				 'A' + src_pll_idx, lock_rc);=0A=
+		else=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c: INTSYNC disabled but the debug window was left open: %d\n",=
=0A=
+				 'A' + src_pll_idx, lock_rc);=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Clear the global enable and latch the INTSYNC disable pattern into the =
PLL's=0A=
+ * EXT page. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+int sit9531x_intsync_disable(struct sit9531x_dev *sitdev, u8 src_pll_idx,=
=0A=
+			     bool *owner_kept, bool *touched)=0A=
+{=0A=
+	return __sit9531x_intsync_disable(sitdev, src_pll_idx, true,=0A=
+					  owner_kept, touched);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Notify the output pins in @outs and, when @src, the INTSYNC source pin.=
 Call=0A=
+ * without multiop_lock: the notification takes the subsystem locks, which=
 are=0A=
+ * taken before multiop_lock.=0A=
+ */=0A=
+static void sit9531x_drive_pins_ntf(struct sit9531x_dev *sitdev, u16 outs,=
=0A=
+				    bool src)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll;=0A=
+	struct sit9531x_dpll_pin *pin;=0A=
+	struct dpll_pin *dpll_pin;=0A=
+	int rc;=0A=
+=0A=
+	if (!outs && !src)=0A=
+		return;=0A=
+=0A=
+	list_for_each_entry(sitdpll, &sitdev->dplls, list) {=0A=
+		list_for_each_entry(pin, &sitdpll->pins, list) {=0A=
+			if (pin->dir !=3D DPLL_PIN_DIRECTION_OUTPUT)=0A=
+				continue;=0A=
+			if (pin->id =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID ?=0A=
+			    !src : !(outs & BIT(pin->id)))=0A=
+				continue;=0A=
+			dpll_pin =3D READ_ONCE(pin->dpll_pin);=0A=
+			if (!dpll_pin)=0A=
+				continue;=0A=
+			rc =3D dpll_pin_change_ntf(dpll_pin);=0A=
+			/*=0A=
+			 * The source pin is one pin registered on every DPLL.=0A=
+			 */=0A=
+			if (pin->id =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID)=0A=
+				src =3D false;=0A=
+			if (!rc)=0A=
+				continue;=0A=
+			mutex_lock(&sitdev->multiop_lock);=0A=
+			if (pin->id =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID)=0A=
+				sitdev->intsync_ntf_pending =3D true;=0A=
+			else=0A=
+				sitdev->out[pin->id].ntf_pending =3D true;=0A=
+			mutex_unlock(&sitdev->multiop_lock);=0A=
+		}=0A=
+	}=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Re-read a stale sync source record; return true when a source pin=0A=
+ * notification is pending. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+static bool sit9531x_intsync_stale_retry(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	if (sit9531x_intsync_refresh(sitdev))=0A=
+		return false;=0A=
+=0A=
+	if (!sitdev->intsync_ntf_pending)=0A=
+		return false;=0A=
+	sitdev->intsync_ntf_pending =3D false;=0A=
+=0A=
+	return true;=0A=
+}=0A=
+=0A=
 /**=0A=
  * sit9531x_phase_offset_read - read phase difference via TDC=0A=
  * @sitdev: device pointer=0A=
@@ -3064,6 +3651,7 @@ static int sit9531x_chan_state_fetch(struct sit9531x_=
dev *sitdev, u8 pll_idx)=0A=
 	chan->ho_freeze =3D !!(ho_freeze & BIT(pll_idx));=0A=
 	chan->ho_valid =3D !!(pll_status_1 & SIT9531X_PLL_STATUS_1_HO_VALID);=0A=
 	chan->stale =3D false;=0A=
+	chan->intsync_dropped =3D false;=0A=
 =0A=
 	return 0;=0A=
 }=0A=
@@ -3256,6 +3844,15 @@ static int sit9531x_dev_state_fetch(struct sit9531x_=
dev *sitdev)=0A=
 		return rc;=0A=
 	}=0A=
 =0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_intsync_src_detect(sitdev);=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+	if (rc) {=0A=
+		dev_err(sitdev->dev,=0A=
+			"Failed to detect INTSYNC source: %d\n", rc);=0A=
+		return rc;=0A=
+	}=0A=
+=0A=
 	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
 		bool beyond;=0A=
 		s64 phase_ps;=0A=
@@ -3582,6 +4179,7 @@ static void sit9531x_dev_periodic_work(struct kthread=
_work *work)=0A=
 	struct sit9531x_dev *sitdev =3D container_of(work, struct sit9531x_dev,=
=0A=
 						   work.work);=0A=
 	struct sit9531x_dpll *sitdpll;=0A=
+	bool src_moved;=0A=
 	bool answered;=0A=
 	int rc;=0A=
 =0A=
@@ -3591,16 +4189,16 @@ static void sit9531x_dev_periodic_work(struct kthre=
ad_work *work)=0A=
 	 */=0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	answered =3D sit9531x_dev_ref_states_update(sitdev);=0A=
+	src_moved =3D sit9531x_intsync_stale_retry(sitdev);=0A=
 	answered |=3D sit9531x_dev_chan_states_update(sitdev);=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
 =0A=
 	list_for_each_entry(sitdpll, &sitdev->dplls, list)=0A=
 		sit9531x_dpll_changes_check(sitdpll);=0A=
+	/* The source pin is not a selection pin; the walk above skips it. */=0A=
+	sit9531x_drive_pins_ntf(sitdev, 0, src_moved);=0A=
 =0A=
-	/*=0A=
-	 * Clear the W1C notification latches on pages 0 and 6 after acting on=0A=
-	 * them; while set they keep INTRB asserted.=0A=
-	 */=0A=
+	/* The latches are W1C; left set, they keep INTRB asserted. */=0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	rc =3D sit9531x_clear_notifications(sitdev);=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
@@ -4077,13 +4675,13 @@ static bool sit9531x_dpll_pin_is_registrable(struct=
 sit9531x_dpll *sitdpll,=0A=
 		if (index =3D=3D SIT9531X_MAX_INPUTS)=0A=
 			return true;=0A=
 		if (index =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
-			return false;=0A=
+			return true;=0A=
 =0A=
 		return sit9531x_input_pin_is_registrable(sitdev, index);=0A=
 	}=0A=
 =0A=
 	if (index =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID)=0A=
-		return false;=0A=
+		return true;=0A=
 =0A=
 	if (index >=3D sitdev->info->num_outputs)=0A=
 		return false;=0A=
@@ -4482,15 +5080,137 @@ static int sit9531x_suspend(struct device *dev)=0A=
 static int sit9531x_resume(struct device *dev)=0A=
 {=0A=
 	struct sit9531x_dev *sitdev =3D dev_get_drvdata(dev);=0A=
+	u16 outs_was =3D 0, outs_now =3D 0, outs_unread =3D 0, outs_moved =3D 0;=
=0A=
+	bool src_moved;=0A=
+	s8 owner;=0A=
+	int rc;=0A=
+	u8 i;=0A=
 =0A=
 	/*=0A=
 	 * After power loss the part is on page 0, not the cached page. The=0A=
 	 * configuration read at probe is not read again.=0A=
 	 */=0A=
 	sit9531x_page_cache_drop(sitdev);=0A=
+=0A=
+	/*=0A=
+	 * A part that lost power returns with its profile's INTSYNC routing and=
=0A=
+	 * output mutes, which the poll does not read; read them back. Arm one=0A=
+	 * re-select for a source lost and restored between samples.=0A=
+	 */=0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	sit9531x_reselect_arm(sitdev);=0A=
+	/*=0A=
+	 * Drop and report writes pending from before suspend: a reloaded=0A=
+	 * profile may have replaced their registers.=0A=
+	 */=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
+		struct sit9531x_chan *chan =3D &sitdev->chan[i];=0A=
+		bool retime =3D false;=0A=
+		u8 j, ho;=0A=
+=0A=
+		/*=0A=
+		 * A table write-back is pending only under forced holdover;=0A=
+		 * once that is cleared, the next poll reads the table from the=0A=
+		 * registers.=0A=
+		 */=0A=
+		if ((chan->table_pending || chan->ho_release_pending) &&=0A=
+		    !sit9531x_read_pll_u8(sitdev, i, SIT9531X_PLL_REG_HO_CTRL,=0A=
+					  &ho) &&=0A=
+		    !(ho & BIT(SIT9531X_PLL_HO_FORCE_BIT))) {=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c: forced holdover cleared over suspend, priority table restore =
dropped\n",=0A=
+				 'A' + i);=0A=
+			chan->table_pending =3D false;=0A=
+			chan->ho_release_pending =3D false;=0A=
+		}=0A=
+=0A=
+		for (j =3D 0; j < sitdev->info->num_outputs; j++) {=0A=
+			if (!sitdev->out[j].retime_pending ||=0A=
+			    sitdev->out[j].pll_idx !=3D i)=0A=
+				continue;=0A=
+			sitdev->out[j].retime_pending =3D false;=0A=
+			retime =3D true;=0A=
+		}=0A=
+		if (!retime && !chan->flush_pending &&=0A=
+		    !(sitdev->flush_arm_pending & BIT(i)))=0A=
+			continue;=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "PLL%c: pending before suspend, dropped:%s%s%s\n",=0A=
+			 'A' + i, retime ? " delay re-time" : "",=0A=
+			 chan->flush_pending ? " output realignment" : "",=0A=
+			 (sitdev->flush_arm_pending & BIT(i)) ?=0A=
+			 " on-demand flush enable" : "");=0A=
+		chan->flush_pending =3D false;=0A=
+		sitdev->flush_arm_pending &=3D ~BIT(i);=0A=
+	}=0A=
+	if (sitdev->flush_ctrl_pending) {=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "flush trigger source select pending before suspend, dropped\n");=0A=
+		sitdev->flush_ctrl_pending =3D false;=0A=
+	}=0A=
+	owner =3D sit9531x_intsync_owner(sitdev);=0A=
+	/*=0A=
+	 * The delay registers are reloaded with the profile too; read them back=
=0A=
+	 * as probe does.=0A=
+	 */=0A=
+	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
+		struct sit9531x_out *out =3D &sitdev->out[i];=0A=
+		bool beyond;=0A=
+		s64 phase_ps;=0A=
+=0A=
+		if (!out->routed)=0A=
+			continue;=0A=
+		rc =3D sit9531x_output_phase_read(sitdev, i, &phase_ps,=0A=
+						&beyond);=0A=
+		/* An output with no divider has no delay, as at probe */=0A=
+		if (rc =3D=3D -ENODATA) {=0A=
+			phase_ps =3D 0;=0A=
+			beyond =3D false;=0A=
+			rc =3D 0;=0A=
+		}=0A=
+		if (rc) {=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "Output %u delay not read on resume: %d\n",=0A=
+				 i, rc);=0A=
+			out->phase_stale =3D true;=0A=
+			outs_unread |=3D BIT(i);=0A=
+			continue;=0A=
+		}=0A=
+		if (out->phase_adj !=3D phase_ps || out->phase_stale)=0A=
+			outs_moved |=3D BIT(i);=0A=
+		out->phase_adj =3D phase_ps;=0A=
+		out->phase_armed =3D !beyond && phase_ps;=0A=
+		out->phase_stale =3D false;=0A=
+	}=0A=
+	rc =3D sit9531x_intsync_readback(sitdev);=0A=
+	if (rc)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "INTSYNC source not re-detected on resume: %d\n", rc);=0A=
+	sitdev->intsync_stale =3D rc !=3D 0;=0A=
+	src_moved =3D rc || owner !=3D sit9531x_intsync_owner(sitdev);=0A=
+	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
+		if (sitdev->out[i].enabled)=0A=
+			outs_was |=3D BIT(i);=0A=
+		/* The mute state of a request left unconfirmed is unknown */=0A=
+		if (sitdev->out[i].state_stale)=0A=
+			outs_unread |=3D BIT(i);=0A=
+		rc =3D sit9531x_output_state_refresh(sitdev, i);=0A=
+		if (rc) {=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "Output %u mute state not read on resume: %d\n",=0A=
+				 i, rc);=0A=
+			sitdev->out[i].state_stale =3D true;=0A=
+			outs_unread |=3D BIT(i);=0A=
+		}=0A=
+		if (sitdev->out[i].enabled)=0A=
+			outs_now |=3D BIT(i);=0A=
+	}=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	sit9531x_drive_pins_ntf(sitdev,=0A=
+				(outs_was ^ outs_now) | outs_unread |=0A=
+				outs_moved, src_moved);=0A=
+=0A=
 	if (sitdev->irq > 0)=0A=
 		enable_irq(sitdev->irq);=0A=
 	kthread_queue_delayed_work(sitdev->kworker, &sitdev->work, 0);=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index dc7862069987..9a8b6b0164ef 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -145,6 +145,8 @@ struct sit9531x_out {=0A=
  * @locked: PLL is active and its outer loop reports lock=0A=
  * @stale: last state read failed; the fields hold the previous sample and=
=0A=
  *   are not reported=0A=
+ * @intsync_dropped: driver turned INTSYNC off after this sample; a lock t=
o=0A=
+ *   INTSYNC in it is not trusted=0A=
  * @mode: 0 =3D sync (outer loop enabled), 1 =3D free-run=0A=
  * @routed_ref: input the device routes to the PLL, as a logical index=0A=
  *   (INTSYNC: SIT9531X_INTSYNC_PIN_ID); SIT9531X_REF_INVALID if none=0A=
@@ -187,6 +189,7 @@ struct sit9531x_chan {=0A=
 	bool		active;=0A=
 	bool		locked;=0A=
 	bool		stale;=0A=
+	bool		intsync_dropped;=0A=
 	u8		mode;=0A=
 	u8		routed_ref;=0A=
 	bool		inner_lol;=0A=
@@ -236,6 +239,12 @@ struct sit9531x_chan {=0A=
  * @reset_gpio: optional reset line, NULL if absent=0A=
  * @irq: optional INTRB IRQ, 0 if not wired=0A=
  * @intsync_src: PLL sourcing INTSYNC, or -1=0A=
+ * @intsync_partial: @intsync_src holds part of the source pattern, or the=
 whole=0A=
+ *   pattern under a clear global enable; not reported as the source=0A=
+ * @intsync_conflict: more than one PLL page holds the source pattern=0A=
+ * @intsync_foreign: global enable set with no page holding the pattern=0A=
+ * @intsync_stale: @intsync_src must be read back before use=0A=
+ * @intsync_ntf_pending: the poll must send a source pin notification=0A=
  * @irq_ack_fails: consecutive failed INTRB acknowledgements=0A=
  * @fvco_band_warned: bit per PLL warned for Fref * DIVN outside its VCO=
=0A=
  *   band; written under @multiop_lock=0A=
@@ -274,6 +283,11 @@ struct sit9531x_dev {=0A=
 	int			irq;=0A=
 =0A=
 	s8			intsync_src;=0A=
+	bool			intsync_partial;=0A=
+	bool			intsync_conflict;=0A=
+	bool			intsync_foreign;=0A=
+	bool			intsync_stale;=0A=
+	bool			intsync_ntf_pending;=0A=
 =0A=
 	bool			loops_open;=0A=
 	bool			outsys_key_pending;=0A=
@@ -323,6 +337,24 @@ int sit9531x_output_phase_read(struct sit9531x_dev *si=
tdev, u8 out_idx,=0A=
 int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,=0A=
 				     u8 out_idx, s32 phase_ps);=0A=
 =0A=
+/*=0A=
+ * Return the PLL driving INTSYNC with a complete source configuration, or=
 -1.=0A=
+ * Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+static inline s8 sit9531x_intsync_owner(const struct sit9531x_dev *sitdev)=
=0A=
+{=0A=
+	return sitdev->intsync_partial ? -1 : sitdev->intsync_src;=0A=
+}=0A=
+=0A=
+int sit9531x_intsync_enable(struct sit9531x_dev *sitdev, u8 src_pll_idx,=
=0A=
+			    bool *rollback_failed, bool *touched);=0A=
+int sit9531x_intsync_disable(struct sit9531x_dev *sitdev, u8 src_pll_idx,=
=0A=
+			     bool *owner_kept, bool *touched);=0A=
+int sit9531x_intsync_src_detect(struct sit9531x_dev *sitdev);=0A=
+int sit9531x_intsync_readback(struct sit9531x_dev *sitdev);=0A=
+int sit9531x_intsync_refresh(struct sit9531x_dev *sitdev);=0A=
+bool sit9531x_intsync_driven(const struct sit9531x_dev *sitdev);=0A=
+=0A=
 int sit9531x_chan_routed_ref_read(struct sit9531x_dev *sitdev, u8 pll_idx,=
=0A=
 				  u8 *ref);=0A=
 int sit9531x_input_mon_fetch(struct sit9531x_dev *sitdev);=0A=
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c=0A=
index 0f2b3d446cb5..d831bafacf10 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.c=0A=
+++ b/drivers/dpll/sit9531x/dpll.c=0A=
@@ -27,6 +27,20 @@ static bool sit9531x_dpll_is_input_pin(const struct sit9=
531x_dpll_pin *pin)=0A=
 	return pin->dir =3D=3D DPLL_PIN_DIRECTION_INPUT;=0A=
 }=0A=
 =0A=
+static bool=0A=
+sit9531x_dpll_is_intsync_pin(const struct sit9531x_dpll_pin *pin)=0A=
+{=0A=
+	return sit9531x_dpll_is_input_pin(pin) &&=0A=
+	       pin->id =3D=3D SIT9531X_INTSYNC_PIN_ID;=0A=
+}=0A=
+=0A=
+static bool=0A=
+sit9531x_dpll_is_intsync_src_pin(const struct sit9531x_dpll_pin *pin)=0A=
+{=0A=
+	return !sit9531x_dpll_is_input_pin(pin) &&=0A=
+	       pin->id =3D=3D SIT9531X_INTSYNC_OUT_PIN_ID;=0A=
+}=0A=
+=0A=
 static bool=0A=
 sit9531x_dpll_is_xo_pin(const struct sit9531x_dpll_pin *pin)=0A=
 {=0A=
@@ -177,16 +191,18 @@ const struct dpll_device_ops sit9531x_dpll_device_ops=
 =3D {=0A=
 };=0A=
 =0A=
 /*=0A=
- * Pin-state contract. An input is SELECTABLE while listed in this PLL's=
=0A=
- * priority table and DISCONNECTED otherwise; CONNECTED is refused because=
 the=0A=
- * device selects by priority. Operstate is ACTIVE when the device feeds t=
he PLL=0A=
- * this input (chan->routed_ref), the PLL is tracking and the lane has sig=
nal;=0A=
- * NO_SIGNAL on loss of signal; QUAL_FAILED on frequency drift; STANDBY=0A=
- * otherwise. The routed reference is used because on loss of signal the d=
evice=0A=
- * falls back to another listed source and leaves the selection naming the=
 lost=0A=
- * one. On manual input select, the routed input is CONNECTED. An output i=
s=0A=
- * CONNECTED while driven and DISCONNECTED while muted; SELECTABLE is refu=
sed.=0A=
- * The XO pin is always CONNECTED.=0A=
+ * Pin-state contract. An input or the INTSYNC destination is SELECTABLE w=
hile=0A=
+ * listed in this PLL's priority table and DISCONNECTED otherwise; CONNECT=
ED is=0A=
+ * refused because the device selects by priority. Operstate is ACTIVE whe=
n the=0A=
+ * device feeds the PLL this source (chan->routed_ref), the PLL is trackin=
g and=0A=
+ * the lane has signal; NO_SIGNAL on loss of signal; QUAL_FAILED on freque=
ncy=0A=
+ * drift; STANDBY otherwise. The routed reference is used because on loss =
of=0A=
+ * signal the device falls back to another listed source and leaves the=0A=
+ * selection naming the lost one. On manual input select, the routed input=
 is=0A=
+ * CONNECTED. The INTSYNC destination has signal while the driver's record=
 shows=0A=
+ * a PLL driving the line or a PLL is locked to it. An output or the INTSY=
NC=0A=
+ * source is CONNECTED while driven and DISCONNECTED otherwise; SELECTABLE=
 is=0A=
+ * refused. The XO pin is always CONNECTED.=0A=
  */=0A=
 =0A=
 /* Caller must hold sitdev->multiop_lock. */=0A=
@@ -215,6 +231,22 @@ sit9531x_dpll_selection_state_get(struct sit9531x_dev =
*sitdev,=0A=
 		*state =3D DPLL_PIN_STATE_DISCONNECTED;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * For INTSYNC, use the driver's record of a PLL driving or locked to the =
line=0A=
+ * in place of the LOS monitor. Caller must hold sitdev->multiop_lock.=0A=
+ */=0A=
+static bool=0A=
+sit9531x_dpll_selection_no_signal(struct sit9531x_dev *sitdev, u8 pin_id)=
=0A=
+{=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (pin_id =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
+		return !sit9531x_intsync_driven(sitdev);=0A=
+=0A=
+	return pin_id < sitdev->info->num_inputs &&=0A=
+	       sit9531x_ref_state_get(sitdev, pin_id)->los;=0A=
+}=0A=
+=0A=
 /* Caller must hold sitdev->multiop_lock. */=0A=
 static bool=0A=
 sit9531x_dpll_selection_active(struct sit9531x_dev *sitdev,=0A=
@@ -229,12 +261,7 @@ sit9531x_dpll_selection_active(struct sit9531x_dev *si=
tdev,=0A=
 	if (chan->routed_ref !=3D pin_id || !sit9531x_chan_tracking(chan))=0A=
 		return false;=0A=
 =0A=
-	/*=0A=
-	 * Do not report a lane without signal as locked, whatever the lock bit=
=0A=
-	 * says; the PLL is about to switch away from it.=0A=
-	 */=0A=
-	if (pin_id < sitdev->info->num_inputs &&=0A=
-	    sit9531x_ref_state_get(sitdev, pin_id)->los)=0A=
+	if (sit9531x_dpll_selection_no_signal(sitdev, pin_id))=0A=
 		return false;=0A=
 =0A=
 	return true;=0A=
@@ -256,12 +283,13 @@ sit9531x_dpll_selection_operstate_get(struct sit9531x=
_dev *sitdev,=0A=
 		return;=0A=
 	}=0A=
 =0A=
+	if (sit9531x_dpll_selection_no_signal(sitdev, pin_id)) {=0A=
+		*operstate =3D DPLL_PIN_OPERSTATE_NO_SIGNAL;=0A=
+		return;=0A=
+	}=0A=
+=0A=
 	if (pin_id < sitdev->info->num_inputs) {=0A=
 		ref =3D sit9531x_ref_state_get(sitdev, pin_id);=0A=
-		if (ref->los) {=0A=
-			*operstate =3D DPLL_PIN_OPERSTATE_NO_SIGNAL;=0A=
-			return;=0A=
-		}=0A=
 		if (ref->qual_fail) {=0A=
 			*operstate =3D DPLL_PIN_OPERSTATE_QUAL_FAILED;=0A=
 			return;=0A=
@@ -570,8 +598,7 @@ sit9531x_dpll_input_pin_phase_offset_get(const struct d=
pll_pin *pin,=0A=
 	 */=0A=
 	if (!rc) {=0A=
 		rc =3D sit9531x_input_mon_fetch(sitdev);=0A=
-		if (!rc && dpin->id < sitdev->info->num_inputs &&=0A=
-		    sit9531x_ref_state_get(sitdev, dpin->id)->los)=0A=
+		if (!rc && sit9531x_dpll_selection_no_signal(sitdev, dpin->id))=0A=
 			rc =3D -ENODATA;=0A=
 	}=0A=
 out:=0A=
@@ -652,6 +679,355 @@ sit9531x_dpll_output_pin_direction_get(const struct d=
pll_pin *pin,=0A=
 				       enum dpll_pin_direction *direction,=0A=
 				       struct netlink_ext_ack *extack);=0A=
 =0A=
+/* Caller must hold sitdev->multiop_lock. */=0A=
+static bool=0A=
+sit9531x_dpll_intsync_src_connected(const struct sit9531x_dev *sitdev,=0A=
+				    const struct sit9531x_dpll *sitdpll)=0A=
+{=0A=
+	return sitdev->intsync_src =3D=3D sitdpll->id && !sitdev->intsync_partial=
;=0A=
+}=0A=
+=0A=
+/* Caller must hold sitdev->multiop_lock. */=0A=
+static int sit9531x_dpll_intsync_refresh(struct sit9531x_dev *sitdev,=0A=
+					 struct netlink_ext_ack *extack)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_intsync_refresh(sitdev);=0A=
+	if (rc)=0A=
+		NL_SET_ERR_MSG(extack, "INTSYNC source could not be read back");=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static int=0A=
+sit9531x_dpll_intsync_src_state_on_dpll_get(const struct dpll_pin *pin,=0A=
+					    void *pin_priv,=0A=
+					    const struct dpll_device *dpll,=0A=
+					    void *dpll_priv,=0A=
+					    enum dpll_pin_state *state,=0A=
+					    struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);=0A=
+	if (rc) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return rc;=0A=
+	}=0A=
+	if (sit9531x_dpll_intsync_src_connected(sitdev, sitdpll))=0A=
+		*state =3D DPLL_PIN_STATE_CONNECTED;=0A=
+	else=0A=
+		*state =3D DPLL_PIN_STATE_DISCONNECTED;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Whether the PLL takes INTSYNC as a reference: by the source it is route=
d=0A=
+ * from, a manual PLL by its select code, an automatic one by its table.=
=0A=
+ */=0A=
+static bool sit9531x_dpll_intsync_selected(struct sit9531x_dev *sitdev,=0A=
+					   u8 pll_idx)=0A=
+{=0A=
+	const struct sit9531x_chan *chan;=0A=
+=0A=
+	chan =3D sit9531x_chan_state_get(sitdev, pll_idx);=0A=
+	if (!chan->stale && chan->routed_ref =3D=3D SIT9531X_INTSYNC_PIN_ID)=0A=
+		return true;=0A=
+	if (chan->manual_input)=0A=
+		return chan->manual_ref =3D=3D SIT9531X_INTSYNC_PIN_ID;=0A=
+=0A=
+	return sit9531x_input_prio_present(sitdev, pll_idx,=0A=
+			sit9531x_input_hw_src(SIT9531X_INTSYNC_PIN_ID));=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Driving the line is an explicit routing, not a selection candidate, so=
=0A=
+ * SELECTABLE is refused.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_intsync_src_state_on_dpll_set(const struct dpll_pin *pin,=0A=
+					    void *pin_priv,=0A=
+					    const struct dpll_device *dpll,=0A=
+					    void *dpll_priv,=0A=
+					    enum dpll_pin_state state,=0A=
+					    struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	bool was_connected, moved, owner_kept =3D false;=0A=
+	int rc =3D 0, detect_rc =3D 0;=0A=
+	bool changed =3D false;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+=0A=
+	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);=0A=
+	if (rc) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return rc;=0A=
+	}=0A=
+	was_connected =3D sit9531x_dpll_intsync_src_connected(sitdev, sitdpll);=
=0A=
+=0A=
+	switch (state) {=0A=
+	case DPLL_PIN_STATE_CONNECTED:=0A=
+		if (was_connected)=0A=
+			break;=0A=
+		if (sitdev->intsync_src >=3D 0 &&=0A=
+		    sitdev->intsync_src !=3D sitdpll->id) {=0A=
+			if (sitdev->intsync_partial)=0A=
+				NL_SET_ERR_MSG_FMT(extack,=0A=
+						   "PLL%c holds a partial INTSYNC source; disconnect its source pin =
first",=0A=
+						   'A' + sitdev->intsync_src);=0A=
+			else=0A=
+				NL_SET_ERR_MSG(extack,=0A=
+					       "INTSYNC is already sourced by another PLL");=0A=
+			rc =3D -EBUSY;=0A=
+			break;=0A=
+		}=0A=
+		/*=0A=
+		 * The enable drives the line from every page holding the source=0A=
+		 * pattern.=0A=
+		 */=0A=
+		if (sitdev->intsync_conflict) {=0A=
+			NL_SET_ERR_MSG(extack,=0A=
+				       "More than one PLL holds the INTSYNC source pattern");=0A=
+			rc =3D -EBUSY;=0A=
+			break;=0A=
+		}=0A=
+		/*=0A=
+		 * The global enable covers every page, so this PLL would drive=0A=
+		 * the line alongside the configuration that set it.=0A=
+		 */=0A=
+		if (sitdev->intsync_foreign) {=0A=
+			NL_SET_ERR_MSG(extack,=0A=
+				       "The sync line is enabled by a configuration the driver does no=
t recognise");=0A=
+			rc =3D -EBUSY;=0A=
+			break;=0A=
+		}=0A=
+		if (sit9531x_dpll_intsync_selected(sitdev, sitdpll->id)) {=0A=
+			NL_SET_ERR_MSG(extack,=0A=
+				       "PLL selects INTSYNC as a reference; it cannot drive it");=0A=
+			rc =3D -EBUSY;=0A=
+			break;=0A=
+		}=0A=
+		rc =3D sit9531x_intsync_enable(sitdev, sitdpll->id, &owner_kept,=0A=
+					     &changed);=0A=
+		break;=0A=
+	case DPLL_PIN_STATE_DISCONNECTED:=0A=
+		if (sitdev->intsync_src !=3D sitdpll->id)=0A=
+			break;=0A=
+		rc =3D sit9531x_intsync_disable(sitdev, sitdpll->id,=0A=
+					      &owner_kept, &changed);=0A=
+		break;=0A=
+	default:=0A=
+		rc =3D -EINVAL;=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	if (changed && !rc) {=0A=
+		sitdev->intsync_src =3D state =3D=3D DPLL_PIN_STATE_CONNECTED ?=0A=
+				      sitdpll->id : -1;=0A=
+		sitdev->intsync_partial =3D false;=0A=
+	}=0A=
+=0A=
+	/* A disconnect reads back through the partial record */=0A=
+	if (changed)=0A=
+		detect_rc =3D state =3D=3D DPLL_PIN_STATE_DISCONNECTED ?=0A=
+			    sit9531x_intsync_readback(sitdev) :=0A=
+			    sit9531x_intsync_src_detect(sitdev);=0A=
+	if (changed && rc) {=0A=
+		if (owner_kept ||=0A=
+		    (state =3D=3D DPLL_PIN_STATE_CONNECTED &&=0A=
+		     (detect_rc || sitdev->intsync_src =3D=3D sitdpll->id))) {=0A=
+			sitdev->intsync_src =3D sitdpll->id;=0A=
+			sitdev->intsync_partial =3D true;=0A=
+			sitdev->intsync_foreign =3D false;=0A=
+		} else if (detect_rc) {=0A=
+			sitdev->intsync_stale =3D true;=0A=
+		}=0A=
+	} else if (changed && detect_rc && sitdev->intsync_conflict) {=0A=
+		sitdev->intsync_stale =3D true;=0A=
+		sitdev->intsync_ntf_pending =3D true;=0A=
+	}=0A=
+	if (detect_rc)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "INTSYNC source cache not refreshed: %d\n",=0A=
+			 detect_rc);=0A=
+=0A=
+	/* The core notifies only a request that succeeded */=0A=
+	moved =3D sit9531x_dpll_intsync_src_connected(sitdev, sitdpll) !=3D=0A=
+		was_connected;=0A=
+=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rc) {=0A=
+		struct dpll_pin *dpll_pin;=0A=
+=0A=
+		if (rc !=3D -EBUSY && rc !=3D -EINVAL && rc !=3D -EOPNOTSUPP)=0A=
+			NL_SET_ERR_MSG(extack,=0A=
+				       "Failed to set INTSYNC source state");=0A=
+		/*=0A=
+		 * Runs under the core's lock, as __dpll_pin_change_ntf()=0A=
+		 * requires.=0A=
+		 */=0A=
+		dpll_pin =3D READ_ONCE(dpin->dpll_pin);=0A=
+		if (moved && dpll_pin && __dpll_pin_change_ntf(dpll_pin)) {=0A=
+			mutex_lock(&sitdev->multiop_lock);=0A=
+			sitdev->intsync_ntf_pending =3D true;=0A=
+			mutex_unlock(&sitdev->multiop_lock);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static const struct dpll_pin_ops sit9531x_dpll_intsync_src_pin_ops =3D {=
=0A=
+	.direction_get		=3D sit9531x_dpll_output_pin_direction_get,=0A=
+	.state_on_dpll_get	=3D sit9531x_dpll_intsync_src_state_on_dpll_get,=0A=
+	.state_on_dpll_set	=3D sit9531x_dpll_intsync_src_state_on_dpll_set,=0A=
+};=0A=
+=0A=
+static int=0A=
+sit9531x_dpll_intsync_dst_state_on_dpll_get(const struct dpll_pin *pin,=0A=
+					    void *pin_priv,=0A=
+					    const struct dpll_device *dpll,=0A=
+					    void *dpll_priv,=0A=
+					    enum dpll_pin_state *state,=0A=
+					    struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);=0A=
+	if (rc) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return rc;=0A=
+	}=0A=
+	if (sitdev->intsync_src =3D=3D sitdpll->id)=0A=
+		*state =3D DPLL_PIN_STATE_DISCONNECTED;=0A=
+	else=0A=
+		sit9531x_dpll_selection_state_get(sitdev, sitdpll,=0A=
+						  SIT9531X_INTSYNC_PIN_ID,=0A=
+						  state);=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* INTSYNC is an internal line; only the per-PLL priority table is touched=
. */=0A=
+static int=0A=
+sit9531x_dpll_intsync_dst_state_on_dpll_set(const struct dpll_pin *pin,=0A=
+					    void *pin_priv,=0A=
+					    const struct dpll_device *dpll,=0A=
+					    void *dpll_priv,=0A=
+					    enum dpll_pin_state state,=0A=
+					    struct netlink_ext_ack *extack)=0A=
+{=0A=
+	u8 hw_src =3D sit9531x_input_hw_src(SIT9531X_INTSYNC_PIN_ID);=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+=0A=
+	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);=0A=
+	if (rc) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return rc;=0A=
+	}=0A=
+	switch (state) {=0A=
+	case DPLL_PIN_STATE_DISCONNECTED:=0A=
+		rc =3D sit9531x_input_prio_remove(sitdev, sitdpll->id, hw_src);=0A=
+		break;=0A=
+	case DPLL_PIN_STATE_CONNECTED:=0A=
+		NL_SET_ERR_MSG(extack,=0A=
+			       "Device selects its reference by priority; use selectable");=0A=
+		rc =3D -EOPNOTSUPP;=0A=
+		break;=0A=
+	case DPLL_PIN_STATE_SELECTABLE:=0A=
+		if (sitdev->intsync_src =3D=3D sitdpll->id) {=0A=
+			if (sitdev->intsync_partial)=0A=
+				NL_SET_ERR_MSG(extack,=0A=
+					       "PLL holds a partial INTSYNC source; disconnect its source pin=
 first");=0A=
+			else=0A=
+				NL_SET_ERR_MSG(extack,=0A=
+					       "PLL cannot lock to the INTSYNC it drives");=0A=
+			rc =3D -EINVAL;=0A=
+			break;=0A=
+		}=0A=
+		rc =3D sit9531x_input_prio_add(sitdev, sitdpll->id, hw_src);=0A=
+		break;=0A=
+	default:=0A=
+		rc =3D -EINVAL;=0A=
+		break;=0A=
+	}=0A=
+=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rc =3D=3D -ENOSPC)=0A=
+		NL_SET_ERR_MSG(extack,=0A=
+			       "Priority table is full of unique sources on this PLL");=0A=
+	else if (rc && rc !=3D -EINVAL && rc !=3D -EOPNOTSUPP)=0A=
+		NL_SET_ERR_MSG(extack, "Failed to set INTSYNC input state");=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static int=0A=
+sit9531x_dpll_intsync_dst_operstate_on_dpll_get(const struct dpll_pin *pin=
,=0A=
+						void *pin_priv,=0A=
+						const struct dpll_device *dpll,=0A=
+						void *dpll_priv,=0A=
+						enum dpll_pin_operstate *state,=0A=
+						struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	rc =3D sit9531x_dpll_intsync_refresh(sitdev, extack);=0A=
+	if (rc) {=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		return rc;=0A=
+	}=0A=
+	sit9531x_dpll_selection_operstate_get(sitdev, sitdpll,=0A=
+					      SIT9531X_INTSYNC_PIN_ID,=0A=
+					      state);=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * The destination pin id SIT9531X_INTSYNC_PIN_ID is one past the end of r=
ef[];=0A=
+ * do not add ops that index ref[id].=0A=
+ */=0A=
+static const struct dpll_pin_ops sit9531x_dpll_intsync_dst_pin_ops =3D {=
=0A=
+	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,=0A=
+	.state_on_dpll_get	=3D sit9531x_dpll_intsync_dst_state_on_dpll_get,=0A=
+	.state_on_dpll_set	=3D sit9531x_dpll_intsync_dst_state_on_dpll_set,=0A=
+	.operstate_on_dpll_get	=3D=0A=
+		sit9531x_dpll_intsync_dst_operstate_on_dpll_get,=0A=
+	.prio_get		=3D sit9531x_dpll_input_pin_prio_get,=0A=
+	.prio_set		=3D sit9531x_dpll_input_pin_prio_set,=0A=
+};=0A=
+=0A=
+static const struct dpll_pin_ops sit9531x_dpll_intsync_dst_pin_manual_ops =
=3D {=0A=
+	.direction_get		=3D sit9531x_dpll_input_pin_direction_get,=0A=
+	.state_on_dpll_get	=3D sit9531x_dpll_intsync_dst_state_on_dpll_get,=0A=
+	.operstate_on_dpll_get	=3D=0A=
+		sit9531x_dpll_intsync_dst_operstate_on_dpll_get,=0A=
+};=0A=
+=0A=
 /* The XO feeds every PLL and is always connected. */=0A=
 =0A=
 static int=0A=
@@ -966,12 +1342,18 @@ sit9531x_dpll_pin_ops_get(const struct sit9531x_dpll=
_pin *pin)=0A=
 	const struct sit9531x_dev *sitdev =3D pin->dpll->dev;=0A=
 	bool manual;=0A=
 =0A=
-	if (!sit9531x_dpll_is_input_pin(pin))=0A=
+	if (!sit9531x_dpll_is_input_pin(pin)) {=0A=
+		if (sit9531x_dpll_is_intsync_src_pin(pin))=0A=
+			return &sit9531x_dpll_intsync_src_pin_ops;=0A=
 		return &sit9531x_dpll_output_pin_ops;=0A=
+	}=0A=
 	if (sit9531x_dpll_is_xo_pin(pin))=0A=
 		return &sit9531x_dpll_xo_pin_ops;=0A=
 	/* Read once at probe, before any pin is registered. */=0A=
 	manual =3D sit9531x_chan_state_get(sitdev, pin->dpll->id)->manual_input;=
=0A=
+	if (sit9531x_dpll_is_intsync_pin(pin))=0A=
+		return manual ? &sit9531x_dpll_intsync_dst_pin_manual_ops :=0A=
+				&sit9531x_dpll_intsync_dst_pin_ops;=0A=
 	/*=0A=
 	 * Set before any pin of the input is published and not written again.=0A=
 	 */=0A=
diff --git a/drivers/dpll/sit9531x/regs.h b/drivers/dpll/sit9531x/regs.h=0A=
index 070d7800bcb8..c3b822d174aa 100644=0A=
--- a/drivers/dpll/sit9531x/regs.h=0A=
+++ b/drivers/dpll/sit9531x/regs.h=0A=
@@ -254,6 +254,9 @@=0A=
 #define SIT9531X_PLL_REG_ACTIVE		0x02=0A=
 #define SIT9531X_PLL_ACTIVE_BIT		BIT(0)  /* PLL reached active state */=0A=
 =0A=
+/* PLL EXT page INTSYNC configuration registers */=0A=
+#define SIT9531X_PLL_EXT_PAGE(_idx)	(SIT9531X_PAGE_PLLA_EXT + (_idx))=0A=
+=0A=
 #define SIT9531X_PLL_STATUS_OUTER_DIS	BIT(5)=0A=
 =0A=
 /*=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
