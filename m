Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123229;
	b=I6gXpvXWCqZqsPWLCi44dRpH/ugr2eCBFO7luqxOQtRphSQew47zbZseTrkmFAteggkn
	 L60dgccV315SkPWs2V1868/KeaF9v+rg0A5mUdmHZAIdUPy1lyfO/QEI3PYjZV8ikyfmQ
	 1MC0hBNF5v4C6Tw2Z7C8E9wA4z855fKRsfWwegJkf6PFniqCSz9N5lb0PREfSutHYb/eQ
	 CJUQTiDYla9WGaWvjbpnoOI738Hyz87+0H25yUHVvjqpeN+30MgJRywdbjAb9qMrq/j2q
	 MU9ECA6vVSc/jsVWkzyr+mwiCDIpgQk7NgpojWvIRagTZJ4gLW00FET3v5NVm019rHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123229;
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
	bh=hZ3/lxNrUuWVDdz/RHfj968HEUQffnKr/3cXt8295+U=;
	b=rUUGEKVtDl/C+N1CsQeHpAVCbrm2eNvZoTh7Ai2QY1TaJWNevBCs45e/1/ccdFuR5029
	 kHfv0/1xGMe+ap4kGJrNE5t01oEVbu39psjpUIZ62gqdQZhNo8cSBQ0ombMEY7rBJPJfv
	 8Enug5QLvukCqQG1hDTMwtwyoGb2j1cwYXYQ7C0tIsM2tzAXatTz4oKS4WRnVcUBdUoKW
	 K0oRbDk2rfCHvzzT2WeKIG7YK+oigykVm9xrZ+sTeuCixheQvD9zBdwNw9AZGE4ZV5Q3F
	 Dto3K7BCsQnBElusJcml3jeZjoNwC+zG9sEk2nDdkcWIsH4AJR3nsnRUku10yI/Sewg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=BHEqqRDU;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=uBnlFgl+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9C60A2627;
	Thu, 19 Nov 2026 21:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A9C60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=BHEqqRDU;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=uBnlFgl+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=hZ3/lxNrUuWVDdz/RHfj968HEUQffnKr/3cXt8295+U=;
 b=BHEqqRDUEETKvd8pwvODQr1OwkasbffeMuO0y0GxRvNTXqdN+RPZjUnyiPVn4t7w19OYZ9jlyIFjykSttK2IWvI5oEFweMSG2didpnmV3I4dWszvO0/gXS/NvTs3IXbX16GiI6JLMWrn2+hfq7jHTozVxx2sRWcRvW6mSMsCc9Ky8JQuLzTZMutRxp54IAUGYumhpmfzLjVEpwP+vH+u1O+Gk2Op/Ri7MEJjdCCf7jCpZuNzypwnjsv0rPWB9vOhcy4VCPJHJWSeCUZBhPeZO0YxrRg8iljcTF4NvMjyNqeenRngCpL1C662kAZ25Tfl0gFvAX6UHtcgrxm2D3BS8w==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id B1D1A8006C;
	Thu, 19 Nov 2026 21:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFRrHvpVpYSKxlsztR+gO19GA3LOpbrnNWCB1shHqj0Y9/pgfcin0KJoPWkUSC8N73qUTD/mXyiKu14Iz3LmNRKlLJxwVgSWe4GxYHqloi3wZ0LU0gF0dvsBWSmd67oSvnTuN2FoqAKqexMj9binUftEkwA7cZ525NQaVYf47/IVHLorK3cLGFXz7v7UN0taHrXKUwZ5db1fBb8dp9ZfgrztXlQQt+p4/WrEEHgJiI284H7SPRRWHYv8bkNXFcDygkMDpL+C/3Glf/RBRxSbhHeuxuCUEnGt38W6x8lEUoJV8HSEKSjUaqnBiuxnIuEsXbPQSfTMFAdwcr3o+mO5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ3/lxNrUuWVDdz/RHfj968HEUQffnKr/3cXt8295+U=;
 b=sPQhS3YsYBAKyDmGdCCo77f2lTnJA7QZ1PRAcfIOLmCHFLPk9RCjv+TytVKVvaqpBrxq4ayTk57ow2o/h78yEF/ejPZozvuTarGHEmFumCTZVX9tOMHlx0pkORfF2OcmJudepM86QSfYPxcshtxzxGK21G9wvepvw8WMOhh6fYXeoZ3SPvUr9Sv0DOVT0uMVuuO6HqWhLgaqwORvFlXl4E4wNezk1VrP80ui0OFByugqdZgXh6edV2vEveWqctah3q9akLZy1XU/dsf7Wf0ckXXBlZsJWVGOVGobSKzWQ7LrTCT0K38AUNnuVt1MgY75X5YyuMu1IQCFLI2jBf/OdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ3/lxNrUuWVDdz/RHfj968HEUQffnKr/3cXt8295+U=;
 b=uBnlFgl+QKcYxcnfencCqQEFsZGgUMNivC+qevjERH+LDSa5usN2FfopEOsKCt3/WvAoPAwB/6K8PqCgMXGyfQy3iAGXQMNqu/z80yzylHHloEbQinbD79zSror9IDgNHvo+DE3faPz4Ugxl50Gy/lPS7Gsad0QNILUMgx5QGtYnFVhrqOeYe2mydVmS99y+HRNYYJnSoHHG6+MFAiX5ltIU6fyBm3rNaIbZjiE+iWFlNNibpWGbcQfjMhqyaXJkDoigHu3MmSuyXaWRVUbVfP/qiUUaGhQlARvx3WzO5S3j3ZclsF2m6AuQ7wFss70EC08wW1aDANsQ3vEVyKh3ag==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MW4PR20MB5323.namprd20.prod.outlook.com
 (2603:10b6:303:208::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:20:16 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:20:15 +0000
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
Subject: Re: [PATCH net-next v15 03/13] dt-bindings: dpll: add SiTime SiT95316
 clock generator
Thread-Topic: [PATCH net-next v15 03/13] dt-bindings: dpll: add SiTime
 SiT95316 clock generator
Thread-Index: AQHdcVG5WuhEZDdDyUyqCiz643b54bcxkR8AgARju4A=
Date: Thu, 19 Nov 2026 21:20:15 +0000
Message-ID: <20261119212014.13180-1-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-4-arouhi@sitime.com>
 <20261117021806.2220034-1-kuba@kernel.org>
In-Reply-To: <20261117021806.2220034-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MW4PR20MB5323:EE_
x-ms-office365-filtering-correlation-id: 6d3545b0-24c9-4d3d-886e-08df4682e79c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|261009221227099003|261009223327099003|261009221727099003|3023799007|261009223027099003|261009220027099003|4143699003|5023799004|56012099006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|38070700021|10067099003|261026121527099003;
x-microsoft-antispam-message-info:
 vZOTJQzFlI+koq8ab1kWelmb8jGr6osefz1QAvj6P5dD3aeUftcNwrtS60saBoQR1vJxYt50cLDwCPwOXKyHttLI+Cgd62NUvPS9SNnvOMLPlo25fSoof6WMJBQW/WY7RRMJ99zEjQ5Gm0Dbi1BNUZyCGntIAk8O6F2Vt/qHI2FV13xnRGHCq1qKG8MOGeoIB1PR6xxynravt6Tqm5f69tL5HGYNmHk3FF9xvRMGslzF7Cri+2ky9p/N8ADLI0cb0sboK+3UkkbW7vGJquTLeWBaKDIX1SyHu017OQCiEP4NaZEqTWTmviMCWvup9kWS4w7u0rbjGWPIrI+MA3+2M96MKxy4elHkXFxRXn8CEqLZrAJ9u7WVcDfEcLpI1Yzcx/7lXfQiEZJX8jMC67bo5hHyA+UpQAY9PuFrVvg3XJEffGacpdckirZ4eR7fLEaFkgxqfpJqEyR9hhe1lDWUakY0yA9TUceOt4jPVtSOgvkGbWxmm6BJ6evVshBjSGeA0gFLT/aai+Oh+TBtzZ+UxCY0kHiNmO/JVt8ru79qQhJdT9DDlenS42hdS1xt6O2ubyS8hGObEI1c0Rsbc6OjPnJFGQgd9TtejbmekGN901Bn6ztg4bQ6qJJvozwk1XDOZXDh7fYgV9xETBmR5gXIHW1JKo5BR/WylLX1FPYYeR90ovDaNg0xMjdU1BQcrM+dwDhAF4saFqk2L5Yx2R05Auoz+OpYtvcM+Nhwe8jmnoM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(261009221227099003)(261009223327099003)(261009221727099003)(3023799007)(261009223027099003)(261009220027099003)(4143699003)(5023799004)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWFrazFhajdqT2ZHcCtaWWdXTXBPYnFVeHVsMzBEcjZTNlhIdmZXRWpiNWt0?=
 =?utf-8?B?eGQ5SSt1WXRoYW01YzNqZmdCcWxnWFg5K0tWdGk2c2p5TkNibGFVWUhKMzdK?=
 =?utf-8?B?R2RCeHRENVVoV2RBb0FuR1hxb3BsSVprQTVTdU02cGxYaUY1cTk4RGwvelRQ?=
 =?utf-8?B?WEtiZWFZUmZsWnhYRTFOU0RJcGgyREtFV1FlSUZINVhPRVdRTU01ZG5JaDcz?=
 =?utf-8?B?VkJPV01RaWdKeE5MOXZZMFdadWFCQ21DamllVzV2bTUxVUg2a3gwbHM0Z3Qw?=
 =?utf-8?B?UlVmTC9sdXI2bkRUQ0ZEV0ZMRXJMakwwRitFMlNQS1BpVkxZM0dUNkRQeVdt?=
 =?utf-8?B?OXlUeGxhWGFWQ01ZdzFYUlgzekRVaHhhdURNSnhaUUtXOGVqNjFLblFveW5j?=
 =?utf-8?B?NEJ5K3dQSWRPd1NqRTk3Z011RU9pbWJiZ2pnWHkvZ0JBZ2pTRmxudi9CMXZS?=
 =?utf-8?B?aXNIUnRNbUNsZVFDVTNjRjgrYURhU3ZsNHVTaWRyVWt0aEgxNUpodnJLOWdD?=
 =?utf-8?B?TEdCNlVRa3hiUklYUEdabS9NNW51Z2Z2dHNFNCtRa1hDQVp5UnhCV1Ivempr?=
 =?utf-8?B?ZHZhK1FYa3FaNTliTEJESlJBVWxIQUdTME1sYXNPOG1oT0ovTmlVdnFlTDBr?=
 =?utf-8?B?SWpuaGc3ZVcyUU9PZElEcDBXL1QwWHFUR29CL09oemJhZmd3MlVDYzNzSmVO?=
 =?utf-8?B?NDN3VlFIaWxCdSt5RVY0cUhkbmw1NW9kbmNVbEw0QTc0TTNHSDNSVTVxK2Nu?=
 =?utf-8?B?Y2xuU056ZnZoL0FZRnJXV0tDVmQvVmpqQ2FqZ2RoMmFuL2lHaXpsS1ArZWNj?=
 =?utf-8?B?RzhQMEJUcXM5QWlpR2hsSm1ZWFlBV2JaK25PVkU1QU0relREaGJEcEVIM1Y4?=
 =?utf-8?B?ZTlrS3BReUVaWldQQXNhUStpbHdRdysxNmRsQUJhVmVTOEJHT3Jqb0dxVEgw?=
 =?utf-8?B?dTRqc3VXRllIM093ak03SC9XYWNtV2I0ZUIyRTY0ZHZGRWhBWEZDZ0ZoeThO?=
 =?utf-8?B?SDcrVzh0bXZNUGtCYU5QaE9XcWEySEY1VlVCNFJnQjdYWHliZGxYNmovbEpv?=
 =?utf-8?B?QjQra2s5TVI4cmVmRkhoVUVFN01uODRYeC9xK3pFdVROVURVaVczMnp3dFlO?=
 =?utf-8?B?cldIZGE1dWE5b2JMM1hiM21NajRsSks4aE5mWGhXVFVNdVlqOEoyekJQN0Jn?=
 =?utf-8?B?RFRreTI0U2E5ejJLcUJiSDVOdHBubjJtUGcydWwxeVNhbnlpVlg0aGl6STJJ?=
 =?utf-8?B?YkxBaVUwSUl1dGpvY0Z2OWpiTWZVa2JiZnZjRFVLbDRETFJFcEVHayttczlj?=
 =?utf-8?B?QmtkamJzeFRReTVhbnV5dXFEbyt2MkZxMng0eS9pYXExMWthUG5Cd3FVWTFw?=
 =?utf-8?B?RXJJSkxpTmtnUmlGMml5bEJYSVN6SzlLL0ZpV1hSQ1UyM2x1cUY1UTVPNlpv?=
 =?utf-8?B?VS9tWU94dnpRaEpwcXhFTS9QOW9qdlpWQ3VtR3RPQXJvOTVmMGhBZWV3TVVX?=
 =?utf-8?B?bWRudXAwSEZ5RmxmUkdsc3BsL3ptdkJrYVpjSGJvbDE0blRmclNDLyt6U29S?=
 =?utf-8?B?TWRJaFFtZGVrT3BNNytFdzgrZFBjV1RKY1lDMThONncreEpJa0t1akR2c1Fw?=
 =?utf-8?B?ZER0ZHhXOEpjVzYva1dwNTgwNzR0bWMvQm83bEhZT0UvbkJhc2VuQzlSVTJl?=
 =?utf-8?B?UW5pNU8zZ3BkdkdQa0pOYzJybjZIYWFLTEdla2ZaUzRlTWVlTm9qcm5rMGRt?=
 =?utf-8?B?Mkw0Y0ZpNXdWcTlwYzRBUjVNR2VpM2t0d2F3a1BmZHdvVmNLeUdmRGoyUkFJ?=
 =?utf-8?B?Q3ZscncwZUtWK0NCRXY0UUVRV0xaOVlrTHA5cEpscTdaV3lMbkZKL0kwRjY2?=
 =?utf-8?B?Ull2c0VOQmR6M29oRm45UHVndkZsOVVsRzJkVDQzd1JlRTFpZXdtTWNpVkpl?=
 =?utf-8?B?bEZRdVN6dll0MG1lNjd0eDdMRUR5cTRJNFgvTncwWjI1OTQvaDVHT2oza3lL?=
 =?utf-8?B?enEwN1FZaTh6TXZ3bGVNZ01wZFl6WjEwM2srbVowVDNxVDkyeWpFV3lpbkhK?=
 =?utf-8?B?M0YwQkRTT1RWZFdYaVByd1psZ3Y0aktGa2lzMzdKTzF1dnNLS1NtcTIzN2ZH?=
 =?utf-8?B?U3FuMnFwdHAwUTFtVUlHTFlnbnBESDJSaE5HOEhKZmRWU2M4M1V6Wm05dU1O?=
 =?utf-8?B?NjJsb1lDRHJ5YktBZ3lLa0V6UlF5cW9Pc0lXK3E2NitOYVE5bXhNeTRvN2NU?=
 =?utf-8?B?Yk9DSll1WTA2WUdVNE00ZExnam00d0x3cjZSQjVGWS9lYisxYzVKeUFtT3pl?=
 =?utf-8?Q?MIkXzk25Vbn4/bbglo?=
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
	yDCBomMfpdYS5MxyiaGADFMOyeuH73t9nU4cWR42K+9BR67PtgmTHDu7VIBx5w4wLfoUHAO+zfpiLRYBYvOKD4k9jq9TnJ4h27IkzCfHcG24ITvOTEydbXAkg9r5W4yF+uk1pb+DwN7WLEW3A/V/VTkkp2t39P176HHL5a7L3+Z4x/kfcWd1THvVDy1TjZ/LkjjgeSKezzhL2tIYAtRDw+GS7hYUGzAjRn/M1y8FBj0pekhBj0sgSapsa/bbwd1VXq8NdkC1m9Cycr1Mj4w0RMa46ugKt/7ekFt+PpqsA2Hps74IdBj6S+uUUD8YWd/NC1dbAGZFKSF84ha0wyAUug==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3545b0-24c9-4d3d-886e-08df4682e79c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:20:15.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+CPEIbur+7OGwjF6ouw2ZRjjUHJRzzfY/wk62U2fiESisxktSBQIJdBUuB6K+m8FyCyyh+hSKzhscBis4oCmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5323
X-MDID: 1795123221-yjjYfVuQIciG
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795123221;yjjYfVuQIciG;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gTW9uLCAxNiBOb3YgMjAyNiAxODoxODowNiAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6
Cgo+ID4gKyAgICAgICAgICAgIG1heEl0ZW1zOiAxCj4gPiArICAgICAgICAgICAgZGVzY3JpcHRp
b246Cj4gPiArICAgICAgICAgICAgICBUaGUgcmF0ZSB3aXJlZCB0byB0aGUgaW5wdXQsIGluIEh6
LCBhcyBhIHNpbmdsZSBlbnRyeS4gIEFuCj4gPiArICAgICAgICAgICAgICBpbnB1dCBydW5zIGF0
IHRoZSByYXRlIHRoZSBib2FyZCBmZWVkcyBpdCBhbmQgaGFzIG5vCj4gPiArICAgICAgICAgICAg
ICBmcmVxdWVuY3kgdG8gc2VsZWN0LCBzbyB0aGF0IGVudHJ5IGlzIHdoYXQgdGhlIHBpbiByZXBv
cnRzCj4gPiArICAgICAgICAgICAgICBhcyBpdHMgZnJlcXVlbmN5Lgo+Cj4gW1NldmVyaXR5OiBM
b3ddCj4gRG9lcyBtYXhJdGVtczogMSBhY3R1YWxseSBsaW1pdCB0aGlzIHRvIGEgc2luZ2xlIHJh
dGU/Cj4KPiBkcGxsLXBpbi55YW1sIGdpdmVzIHN1cHBvcnRlZC1mcmVxdWVuY2llcy1oeiBubyBl
eHBsaWNpdCB0eXBlLCBzbyB0aGUgdHlwZQo+IGNvbWVzIGZyb20gdGhlIGR0c2NoZW1hIC1oeiB1
bml0LXN1ZmZpeCBydWxlLiBJZiB0aGF0IHJ1bGUgbWFrZXMgaXQgYSB1aW50MzIKPiBtYXRyaXgs
IGEgdG9wLWxldmVsIG1heEl0ZW1zIG9ubHkgY291bnRzIGJyYWNrZXQgZ3JvdXBzLiBBIGxpc3Qg
d3JpdHRlbiB0aGUKPiB3YXkgbWljcm9jaGlwLHpsMzA3MzEueWFtbCB3cml0ZXMgb25lIHdvdWxk
IHRoZW4gY291bnQgYXMgYSBzaW5nbGUgZ3JvdXAgYW5kCj4gcGFzczoKPgo+ICAgICBzdXBwb3J0
ZWQtZnJlcXVlbmNpZXMtaHogPSA8MTAwMDAwMDAgMjUwMDAwMDA+Owo+Cj4gVGhpcyBkZXBlbmRz
IG9uIGhvdyBkdHNjaGVtYSB0eXBlcyAtaHogcHJvcGVydGllcywgc28gaXQgbWF5IG5vdCBhcHBs
eS4KPgo+IElmIGl0IGRvZXMsIHRoZSBkcml2ZXIgbGF0ZXIgaW4gdGhlIHNlcmllcyB0YWtlcyBm
cmVxc1swXSBhcyB0aGUgaW5wdXQncyByYXRlLgo+IEl0IHN0aWxsIGFkdmVydGlzZXMgZXZlcnkg
bGlzdGVkIHZhbHVlIGFzIGEgc3VwcG9ydGVkIGZyZXF1ZW5jeSwgZXZlbiB0aG91Z2gKPiBzaXQ5
NTMxeF9kcGxsX2lucHV0X3Bpbl9vcHMgaGFzIG5vIC5mcmVxdWVuY3lfc2V0Lgo+Cj4gV291bGQg
bGltaXRpbmcgdGhlIGlubmVyIGRpbWVuc2lvbiAoZm9yIGV4YW1wbGUgaXRlbXM6IFsgbWF4SXRl
bXM6IDEgXSkgb3IKPiBnaXZpbmcgYW4gZXhwbGljaXQgc2hhcGUgZ3VhcmFudGVlIGEgc2luZ2xl
IHZhbHVlPwoKZHRzY2hlbWEgYXBwbGllcyBtYXhJdGVtcyBvZiBhbiBpbnRlZ2VyIGFycmF5IHRv
IHRoZSBjZWxscywgbm90IG9ubHkgdG8KdGhlIGJyYWNrZXQgZ3JvdXBzOiBhbiBpbnB1dCBwaW4g
d2l0aCBgPDEwMDAwMDAwIDI1MDAwMDAwPmAgZmFpbHMKZHRfYmluZGluZ19jaGVjay4gTm8gY2hh
bmdlLgoKPiA+ICsgICAgICAgIG91dHB1dC1waW5zOgo+ID4gKyAgICAgICAgICBwYXR0ZXJuUHJv
cGVydGllczoKPiA+ICsgICAgICAgICAgICAiXnBpbkBbMC05YS1mXSskIjoKPiA+ICsgICAgICAg
ICAgICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgICAgICAgICAgIHJlZzoKPiA+ICsgICAgICAg
ICAgICAgICAgICBlbnVtOiBbMCwgMywgNCwgNSwgNywgOCwgOSwgMTFdCj4KPiBbU2V2ZXJpdHk6
IExvd10KPiBPbiB0aGUgU2lUOTUzMTcsIGRvbid0IHRoZSB0d28gbnVtYmVyaW5ncyBpbiB0aGlz
IG5vZGUgY29sbGlkZT8KPgo+IE91dHB1dCBwaW4gcmVnIGlzIHRoZSBkaWUgb3V0cHV0IGluZGV4
LiBUaGUgdmRkb04tc3VwcGx5IG5hbWVzIGZvbGxvdyB0aGUKPiBTaVQ5NTMxNyBkYXRhc2hlZXQg
bnVtYmVyaW5nLCBWRERPMCB0byBWRERPNy4KPgo+IFNvIG91dHB1dC1waW5zL3BpbkAzIGlzIGRh
dGFzaGVldCBPVVQxLiBCdXQgdmRkbzMtc3VwcGx5IHBvd2VycyBkYXRhc2hlZXQKPiBPVVQzLCB3
aGljaCBpcyBkaWUgb3V0cHV0IDUuIFRoZSBzYW1lIHRoaW5nIGhhcHBlbnMgZm9yIDQvNywgNS84
IGFuZCA3LzExLgo+Cj4gT25lIHN1cHBseSBuYW1lIGFsc28gbWFwcyB0byBkaWZmZXJlbnQgb3V0
cHV0cyBvbiB0aGUgdHdvIHBhcnRzLiB2ZGRvMyBmZWVkcwo+IHJlZyAzIG9uIHRoZSBTaVQ5NTMx
NiBidXQgcmVnIDUgb24gdGhlIFNpVDk1MzE3Lgo+Cj4gVGhpcyBlbnVtIGFjY2VwdHMgMCwgMywg
NCwgNSBhbmQgNywgd2hpY2ggYXJlIGFsc28gdmFsaWQgZGF0YXNoZWV0IG91dHB1dAo+IG51bWJl
cnMuIEEgYm9hcmQgRFQgdGhhdCBudW1iZXJzIFNpVDk1MzE3IG91dHB1dCBwaW5zIGJ5IGRhdGFz
aGVldCBPVVRuIHdvdWxkCj4gcGFzcyB2YWxpZGF0aW9uIGZvciBmaXZlIG9mIHRoZSBlaWdodCBv
dXRwdXRzLiBJdHMgbGFiZWwsIGZyZXF1ZW5jeSBhbmQKPiBlbmFibGUgc3RhdGUgd291bGQgdGhl
biBkZXNjcmliZSBhIGRpZmZlcmVudCBwaHlzaWNhbCBvdXRwdXQuIE9ubHkgZGF0YXNoZWV0Cj4g
T1VUMSwgT1VUMiBhbmQgT1VUNiB3b3VsZCBiZSByZWplY3RlZC4KPgo+IFRoZSBkcml2ZXIgZG9l
cyBub3QgZW5hYmxlIHRoZSBzdXBwbGllcyB0b2RheS4gQSBsYXRlciBjaGFuZ2UgdGhhdCBsb29r
cyB1cAo+IHBlci1vdXRwdXQgc3VwcGxpZXMgYnkgcGluIHJlZyB3b3VsZCB3b3JrIG9uIHRoZSBT
aVQ5NTMxNiBidXQgc3dpdGNoIHRoZSB3cm9uZwo+IG91dHB1dCBkcml2ZXIgb24gdGhlIFNpVDk1
MzE3Lgo+Cj4gQ291bGQgb25lIG51bWJlcmluZyBiZSB1c2VkIGZvciBib3RoIHJlZyBhbmQgdGhl
IHN1cHBseSBuYW1lcyBvbiB0aGUKPiBTaVQ5NTMxNz8KCkJvdGggbnVtYmVyaW5ncyBhcmUgaW50
ZW5kZWQgYW5kIHRoZSBiaW5kaW5nIHRleHQgZ2l2ZXMgdGhlIG1hcHBpbmcgaW4KYm90aCBwbGFj
ZXM6IHJlZyBpcyB0aGUgZGllIG91dHB1dCwgd2hpY2ggaXMgd2hhdCB0aGUgcmVnaXN0ZXJzIGFu
ZCB0aGUKc2hhcmVkIFNpVDk1MzE2IG51bWJlcmluZyB1c2UsIGFuZCBhIHN1cHBseSBpcyBuYW1l
ZCBhZnRlciB0aGUgcGFja2FnZQpwaW4gKFZERE9uKSBhcyBzdXBwbGllcyBhcmUuIEEgYm9hcmQg
YXV0aG9yIHJlYWRzIHRoZSBwaW4gbmFtZXMgZnJvbSB0aGUKZGF0YXNoZWV0LCBzbyByZW5hbWlu
ZyBWRERPMyB0byBtYXRjaCByZWcgNSB3b3VsZCBiZSB0aGUgc3VycHJpc2luZwpjaG9pY2UuCgo+
ID4gKyAgICAgICAgICAgICAgICAvKiBJTjBQIGFuZCBJTjBOOiBwYWlyIDAgcnVucyBzaW5nbGUt
ZW5kZWQgKi8KPiA+ICsgICAgICAgICAgICAgICAgcGluQDAgewo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDA+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiY2xraW4w
IjsKPiA+ICsgICAgICAgICAgICAgICAgICAgIGNvbm5lY3Rpb24tdHlwZSA9ICJleHQiOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgc3VwcG9ydGVkLWZyZXF1ZW5jaWVzLWh6ID0gPDEwMDAwMDAw
PjsKPgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IFNob3VsZCB0aGUgY2VsbCB3aWR0aCBvZiBzdXBw
b3J0ZWQtZnJlcXVlbmNpZXMtaHogYmUgZml4ZWQgaGVyZSBiZWZvcmUgdGhpcwo+IGJlY29tZXMg
QUJJPwo+Cj4gVGhpcyBleGFtcGxlIHVzZXMgMzItYml0IGNlbGxzLiBUaGUgb25seSBvdGhlciBp
bi10cmVlIERQTEwgYmluZGluZyB0aGF0Cj4gdXNlcyB0aGUgc2FtZSBkcGxsLXBpbi55YW1sIHBy
b3BlcnR5LCBtaWNyb2NoaXAsemwzMDczMS55YW1sLCB1c2VzIDY0LWJpdAo+IGNlbGxzOgo+Cj4g
ICAgIHN1cHBvcnRlZC1mcmVxdWVuY2llcy1oeiA9IC9iaXRzLyA2NCA8MTAwMDAgMTAwMDAwMDA+
Owo+Cj4gSXRzIGNvbnN1bWVyLCB6bDMwNzN4X3Bpbl9wcm9wc19nZXQoKSBpbiBkcml2ZXJzL2Rw
bGwvemwzMDczeC9wcm9wLmMsIHJlYWRzCj4gdGhlIHByb3BlcnR5IHdpdGggZndub2RlX3Byb3Bl
cnR5X2NvdW50X3U2NCgpLiBkcGxsLXBpbi55YW1sIGdpdmVzIHRoZQo+IHByb3BlcnR5IG5vIHR5
cGUsIGFuZCB0aGlzIGJpbmRpbmcgZG9lcyBub3Qgc2F5IHdoaWNoIHdpZHRoIGEgU2lUOTUzMXgg
bm9kZQo+IGhhcyB0byB1c2UuCj4KPiBUaGUgU2lUOTUzMXggZHJpdmVyIGFkZGVkIGxhdGVyIGlu
IHRoaXMgc2VyaWVzIHJlYWRzIGl0IGFzIHUzMjoKPgo+IGRyaXZlcnMvZHBsbC9zaXQ5NTMxeC9w
cm9wLmM6Cj4gCS8qIEEgLWh6IHByb3BlcnR5IGlzIDMyLWJpdDsgbm8gcmF0ZSBvZiB0aGlzIHBh
cnQgbmVlZHMgbW9yZS4gKi8KPiAJbnVtX2ZyZXFzID0gZndub2RlX3Byb3BlcnR5X2NvdW50X3Uz
Mihwcm9wcy0+Zndub2RlLAo+IAkJCQkJICAgICAgInN1cHBvcnRlZC1mcmVxdWVuY2llcy1oeiIp
Owo+Cj4gU3VwcG9zZSBhIFNpVDk1MzF4IG5vZGUgaXMgd3JpdHRlbiB0aGUgd2F5IHpsMzA3MzEu
eWFtbCBkb2VzIGl0Ogo+Cj4gICAgIHN1cHBvcnRlZC1mcmVxdWVuY2llcy1oeiA9IC9iaXRzLyA2
NCA8MTAwMDAwMDA+Owo+Cj4gVGhlIHUzMiBjb3VudCBpcyB0aGVuIDIsIGFuZCBmd25vZGVfcHJv
cGVydHlfcmVhZF91MzJfYXJyYXkoKSByZXR1cm5zCj4gezAsIDEwMDAwMDAwfSwgYmVjYXVzZSB0
aGUgaGlnaCB3b3JkIGNvbWVzIGZpcnN0Lgo+Cj4gV2l0aCB0aGF0IGlucHV0LCBjdXJyX2ZyZXEg
PSBmcmVxc1swXSBpcyAwIGFuZCB0aGUgcmVmZXJlbmNlIGZyZXF1ZW5jeSBpcwo+IG5ldmVyIHNl
ZWRlZC4gc2l0OTUzMXhfZHBsbF9pbnB1dF9waW5fZnJlcXVlbmN5X2dldCgpIHRoZW4gcmVwb3J0
cyAwIEh6LCBhbmQKPiB0aGUgcGluIGFsc28gYWR2ZXJ0aXNlcyBhIDAgSHogc3VwcG9ydGVkIGZy
ZXF1ZW5jeSBuZXh0IHRvIHRoZSByZWFsIG9uZS4KPgo+IE91dHB1dCBwaW5zIGhhdmUgbm8gaXRl
bSBsaW1pdCBvbiB0aGlzIHByb3BlcnR5LCBzbyB0aGF0IGVuY29kaW5nIHdvdWxkIHBhc3MKPiBk
dF9iaW5kaW5nX2NoZWNrIHRoZXJlIHRvby4KCkNvcnJlY3QgdGhhdCB0aGUgZHJpdmVyIGRvZXMg
bm90IGRldGVjdCBpdC4gQW4gaW5wdXQgd3JpdHRlbiBpbiA2NC1iaXQKY2VsbHMgZmFpbHMgZHRf
YmluZGluZ19jaGVjaywgc2luY2UgdGhlIHNpbmdsZSBpdGVtIGlzIHRoZW4gdHdvIDMyLWJpdApj
ZWxscy4gQW4gb3V0cHV0IHBhc3NlcyBhbmQgYWR2ZXJ0aXNlcyBhbiBleHRyYSAwIEh6IGVudHJ5
IGJlc2lkZSBlYWNoCnJhdGU7IHRoZSByYXRlcyB0aGVtc2VsdmVzIHN0aWxsIHdvcmsgYW5kIGEg
cmVxdWVzdCBmb3IgMCBIeiBpcyByZWZ1c2VkLApzbyBhIGNoZWNrIGluIHRoZSBkcml2ZXIgaXMg
bm90IHdvcnRoIHRoZSBjb2RlLiBObyBjaGFuZ2UuCg==
