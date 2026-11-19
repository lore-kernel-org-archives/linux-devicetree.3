Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129080;
	b=RRHhDuaLvuTHxUlI1BqWUShEPTRnXebh6pUzIXwYoM4rc8drm3Wnv5rQ55Xq9oafafiw
	 bihJjF05tnG2hlFVcn48yd4BfuBRFmqvT1Vnih28gLGHF3N49MUDzwP1SiDPime4frGa3
	 FvRw4f407XtEWU5r8N2utIGnmdcbuFkIFBRzE5IXPBJjkSGWKkkQ5yg7/6+0MM1iZK7Uz
	 DDytxn4D7mlg26kwv2OStYzMt88zG039QKIL/hIAofPOBMi9Lb1QiO/sz58km/IyHb+Oy
	 Chy5but8cYVm7/RoLZNm4q8EgsdJ+LzqkN9oHCmm65tq9Se5zG/W48S0vtd8wNh80zw==
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
	bh=Jk3zzPcu54vmjZHkOKWufRTjMVzyiqwJEMopvD08Ev8=;
	b=KK79+p4KfVu9TaQhkCTgyzkSIzSeza1GkxogJP1YdO27SSSRX0qNjm2+yW6SIHJRfLnC
	 mS1GvBHvFvpNAPuG9MdJx/XR0oXibv2yEJA3qWV7UKyPphH+n/aI3dJcQ3t4RwGatvtHB
	 JGd40qEWzudR3uUVpHRKIeGq/DLd6UoelVMjOAbspdH45pPqoq+P7yYYlrwi49av5cn2N
	 809hJAnjPwppSE9QhQZI27QVayHq+z3VGgw1NR2iDnyF51kM2P1q7XaZkQrsPed+JaPGM
	 TULlNzj4qEc1FX3+HKZL79Reub82xL0iT8q69ulePCQMYT6w7ABtGXOW5PZwv3gcOnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=BFOM+Usc;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=j6rtDasv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC6606A325;
	Thu, 19 Nov 2026 22:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80CC6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=BFOM+Usc;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=j6rtDasv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=Jk3zzPcu54vmjZHkOKWufRTjMVzyiqwJEMopvD08Ev8=;
 b=BFOM+UscqoPLv441NHd55aH3MtQB7mpX4tvB4ewJFpFIdsbLZ+S4yvA2GpoLe7B5ujwsd2zU4v2/gp+hBnuhtX2PWx1tFDUPSBY86oMXaLXBXe0Zk5ERspSSd7It7wgWlTHGiwvoGhUc6n4ykEHUG/FFXBIOU6PVjr05yW0OUeASRt1QOuOIsJIDGqTUqrl6EabMcSxhs98f6yYYhB7WVvSsu5h0uxqjqee6bdtf6EYCBEelCX8g43TR2xZi472fCGE16PqLDrCnS5QxtA0wfX5n7cpBZFdU8mDtZ0/2Yjg9VOdTvagsyq5iBAYxEYz3oD3N8XVYOb/sAQ6eTN8slg==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 36D74900084;
	Thu, 19 Nov 2026 22:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzIZX9rJuctUdRHiuAz93DFduv5DDF4F6ZUHn+57gh1s8+iVWkobxR2e5anCSbgM+Tb2jhWoxdVFvfafgPbeSPTUuLXFYZ3z1Zs8foXrGIl1HfKNZVH96CfS8YjdIAC8vFU6UJ81bq3E4H+ZcZoKaqG4gC7hYKEaJtcg8UEDyRMVDTK3ouSLko2Em2t1dmP6NZiBaiaEaLhEp4hAl2AIekw1x+XHYMmk3t0p5W4A4OF6Boao8/0tSBa7mMl6NULJkGB1Ots/l8kxuMJSbdDvjTG2nqLWIJk8DntkKDripfuZ1T8EBY5YPptL91BIsm8KoxYDztx49djMgAZc9s4S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jk3zzPcu54vmjZHkOKWufRTjMVzyiqwJEMopvD08Ev8=;
 b=kR8mU/erlIFiMIb3UKAqtXJglfyeNoKBgy92ts96c1oE+5QJzdNSk0ow8uO6FqhhWfJIFgZ8GAk/JNgfvnUbX3ARz4OQrvEr9dpRHinVtqrzRm1HT6QR+X/VQW9BQwOZJPvb7wT6egvyID8b/andASVHgna40NPaUBY1lceZvLQC59WrBrCH4fnSIDuK2jcpii49KS79PKqGJj4GRA+JyenocQ+JDCkFn6CZShXXWCJyVX89vgEX0xd3wOHe82k97uH39dG3fCI/uJc3F7Ol2WUmB/sdCVHekjiEu0GtRcUOU2R0d5K43BnoAxH1w27DTYK94C9YUcZ881sVCSLiOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jk3zzPcu54vmjZHkOKWufRTjMVzyiqwJEMopvD08Ev8=;
 b=j6rtDasvU0tkMfhSfhTB3bVASjf/WKStp8sqrAXWPRZAdy60n/jtu5POo1JSDLDTjBRPkfFHwu59pSDcxcS0QOIytQfo7im1pD3fZl1A+n6Uj0Jdk8dJmvytHDnmoMqTWsDOBqcKOCoFdYjMnuWdqMUD6eCxHvkmzMoUv9qyjUCuaBicyrh4beJUGcmya1cSxDdExdH7IFU+rmnbREKws8Z479gg3TPho5rmGMaSEpZGA/GLT1oW/8xQ6HKsuUuNNqrbemZLcLRQu7Jld65zPRj09TXiwXuxsugT0sMghi0htiKdmQeagnSQlzqXUJUjnsuLWm9XCFXzSzll9X4xQQ==
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
Subject: [PATCH net-next v16 01/13] dpll: omit pin phase attributes the driver
 has no value for
Thread-Topic: [PATCH net-next v16 01/13] dpll: omit pin phase attributes the
 driver has no value for
Thread-Index: AQHdeHlpn7gGMIng80ud2bjqx5eLSQ==
Date: Thu, 19 Nov 2026 22:57:54 +0000
Message-ID: <20261119225752.41846-2-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 3e74498e-c4c6-46ce-d1eb-08df46908bda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261009223027099003|22082099003|56012099006|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 V5onSwwPImqKoktGPmGu8YX0p5j3Sj6cmtPgBd2IiOyYQ0oA/hR4Bnlllg8lVXIkBmxjgDWHjB/z09xKI+DMkDMShMg72ANBdyijVQP1XsWQBKYD96skva0Q0LFTWGSj/bsnbcbebJ5VtJVe5MRKvO4gVW7vMg11Q4XL4TNGxtZClNWZuAcfPTuOw9GTfBkAexdH+ldesANmCxacuB+nrNQoqU5ydOuPPTC+GrSLy6wvEHxjbYlMSBTh9HniTwMrO0BszxTKPB29SCuY25kaBzyid8LC7bBXkQv2QKUoUNV0GZ4CGXPAGsFBK4mEpjiTpZPoXUwy6LVX6E0w6BxCNqrwRctWtqhXsxE4mhmucskf2dlMSpg6dclpkoejvegcgAjhn/YvoSeYwh+6Hf6M6ssB7cv4mwkT9iRdm6wMZGKE0UD8+mHydaitozIDnMt25Ip5wfhDkej3TyyWp4HRlJejjVBtBx6yK9IYrFgfXkvlgNNJNGwmlvu7jSXOJDFBImnEkcSNhqDksy10AQKBFZcPrHx9kkVMqvpgJif9h2mHdUP81cczIF9raEz7M8S58iFGXZ/RI+W0kJ1F01dF8j8BmrwIgfyISfaCNyIRIdPdhQDGTdTYI+h4rAZn0YimXFbyKi5TWyhU5s57CHIf+j6npc6t6uFol7IxjcrXPLsw4gQxEnDKLR71YBv5W0d6bvscg+4KR756SsaZbiJx4QaMfVNhbV8NWqtbeksugOU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261009223027099003)(22082099003)(56012099006)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fBCDT5r5IwB69sXDLro11MEIDii8g9yEW6wlLU8fi+0onTDw7tZnbv1iTF?=
 =?iso-8859-1?Q?ZN4/Bu/qiFDqw26IgqOIoZIefZXbvbAcaDsP2ZI44D1+gPBDOcAx8QNw3g?=
 =?iso-8859-1?Q?je67s/yd/Mfmrsry93KSxI/SjkKWxkJJlpdfrefZmHbqfYYE4+t4CnhPoC?=
 =?iso-8859-1?Q?Rv5Jmy7C6C13F6QThp6xt6lP0hUyhh+cm3lSO7X195VgOuOQ3hO8YjstLF?=
 =?iso-8859-1?Q?lTUsk+lz65Cu411zAIeKpkU+F4TcmnUiUdp7tfA/rW1i4vEQimkBpzKEWy?=
 =?iso-8859-1?Q?L0DtexK6wveu9us92SKaDIBHs9JiekWvFresGfRGIUMucEqa+7LYda9WiR?=
 =?iso-8859-1?Q?ZWvOmqYLFOarQljyvW2VTTBVVhoSl3XrBMI89fqUcfCZRM3vffSGSFNXIC?=
 =?iso-8859-1?Q?EHnoztS/eN2pAwzMbsHS0dxN8UO9vOmoT4X22PKoVvLF4CtQlyUEIYQ8gw?=
 =?iso-8859-1?Q?EKXtnAuuDYOrjiERsnjSov76wxoKrpgGOaV1uKf8LIIr5YniuyqtYXcWNZ?=
 =?iso-8859-1?Q?zgVeRfLoyuZp3SZrxAglXIuh9AHyXg3ujeqR8ztscsEWNGSzPlUsm1hqNc?=
 =?iso-8859-1?Q?chgDWs6Ni4bmgHT5oW0JgPZFeRzIRGV9gkAxso5d+ZzBZOhrbc73bP7I3S?=
 =?iso-8859-1?Q?3ZkZrB/6HbB3Wr0ZXTHLz6izIEKfqeeSwSz1DY4kxWbhF+h4hkahqwztb3?=
 =?iso-8859-1?Q?o30f6Oce0XKISVSLKyHOdwjrm4Ku2aB+6drFXAadSaCy1sztIyDhJgX8eP?=
 =?iso-8859-1?Q?17490+9q3vbDYxN+yAl6tCADUbCLotdOz3A1RPTBRhkQ5CE9GxLtSYm8Ue?=
 =?iso-8859-1?Q?AAT5EuiBrJNXCFAsLyac/xMgq2dFQ6/1RdHhPiXUTFqqcZyDFApN+cAiGY?=
 =?iso-8859-1?Q?lVAlPFWXLXIfqissZdq3WWVuhaWawQVBEi6tjcLHP0DOE3vE9iPFUgE0H8?=
 =?iso-8859-1?Q?LJQBuN+UauIjTXPx1nMTxrJMFtooY7aQG1OL6eBDnmwnSglardbOl9Hu3K?=
 =?iso-8859-1?Q?0YbWrYorGbyU4LI/rBHnVBwyNYm73dyi/Xz5sw1HBiJgwgaEf71OYTYRm5?=
 =?iso-8859-1?Q?SI0Yrkc/S9o44JmjM44aVH6lHF7++dpDKYV7CAqf3qHnS8Ld02w0xpVQDK?=
 =?iso-8859-1?Q?p1cXCd9xLSvk4lzyHwPsTSNe/aqmeb3DBWQfechngn5dqC4bDsMbAeSA1S?=
 =?iso-8859-1?Q?+BF6Irdu2lEagbDDHNfavRCVCYsYdIWTjQ6IgGFGwNPVviJNZX1BwkKw56?=
 =?iso-8859-1?Q?DdXOiPYZChauobUXNFcukHuTW18mWYbQDMNBJs2pkwDymIQwjHlNJK7TQZ?=
 =?iso-8859-1?Q?DlgqYP9uXsxNmMmAVW+gU2bXgI2xg7eXLEocS9ZwA7jO8qdMnV/juEnJKf?=
 =?iso-8859-1?Q?ffFwOLV7bi3vEXvAZYxhfgjhdlPPp5CzaZzfGWZR2m9XL2kQjnga2v1z3y?=
 =?iso-8859-1?Q?858Vu5T3nsKH2IxV1mvL5C/4+xfmft5F9WMZeHwGHFX23X4dalfoWZ8S68?=
 =?iso-8859-1?Q?Etwme9FpaTynFxu9Tcv1Gi02tG2AzqqyaWbElli+otJCRfMITgQLdnQjjj?=
 =?iso-8859-1?Q?aBj95Fp0KWk9SlcqQ8kPayVDJ/VZJ8sXkFd1kS36c4aS+ERD5KwkYQBxDf?=
 =?iso-8859-1?Q?NFbxAdOM30j0m2pERR7o0DGItE36m59Of+OxTc+DSUSdf1TSHFdXQ9wo7j?=
 =?iso-8859-1?Q?uuuA75HR3syFTbABoqB1SCKyc+LlGxpvo1HW3x6o/0MyDlpJaN7263vWfg?=
 =?iso-8859-1?Q?iNiPPNX/o2PzkComfbTXYAzhS7h79YrYF38ToPPLESEe9P?=
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
	RxKadO6YbZSkdCzNsBC/CTfMb/gjiv9GBdPHT8pSdITIyWfFPnul0YJaDy06kESeXpBAdJqN61BLVAmN5j5H/nH+ulvABYTFaN+nufKNAjKBJF5G/Ab/ORtAqOW+iKBXeThU+Y6wA8DGfMOfpUeFJIugN/viafX7+HFkPdWcXPvdHD1tI3GCRRbvlsfbFJmzbMGHn/Jo2YM9k4qkfU5MV66v20+2GOaVdGut7Vgluwa9kHbZgTK5Kjf82xcs4ndK30H2BXfdMjKzYiTQQL7zU6kSg+KJqMekJlblHd8x82nCEAn5Y9Nn16XNE8cYDvKt9niiWxpycA0w7IV9qRwz8g==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e74498e-c4c6-46ce-d1eb-08df46908bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:54.1848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1+kixNc5RwQNpCZ/e5G2DL27g+bCBvqwf4M3wayIFvN4RoFaa0DJ5plgf48DcTFASZyiFjOR+Isy3yLd4GGg7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129077-sXyUxBW1G_qW
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129077;sXyUxBW1G_qW;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Let phase_offset_get and phase_adjust_get return -ENODATA for a pin the=0A=
driver has no value for, and leave DPLL_A_PIN_PHASE_OFFSET and=0A=
DPLL_A_PIN_PHASE_ADJUST out of the message in that case, as=0A=
dpll_msg_add_ffo() already does for the fractional frequency offset.=0A=
Today any error from either callback fails the whole pin dump.=0A=
=0A=
A driver that measures the phase offset only on the input its PLL=0A=
tracks, or whose part holds a delay larger than the s32 the adjust=0A=
attribute carries, has no value to report for the pin, and a zero=0A=
cannot be told from a measurement.  A phase adjust request on such a=0A=
pin is passed to the driver without the comparison against the old=0A=
value, so the delay can still be set or cleared.=0A=
=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
Reviewed-by: Ivan Vecera <ivecera@redhat.com>=0A=
---=0A=
 drivers/dpll/dpll_netlink.c | 14 ++++++++++----=0A=
 1 file changed, 10 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c=0A=
index e5380d95f238..acf71a93f230 100644=0A=
--- a/drivers/dpll/dpll_netlink.c=0A=
+++ b/drivers/dpll/dpll_netlink.c=0A=
@@ -388,8 +388,11 @@ dpll_msg_add_pin_phase_adjust(struct sk_buff *msg, str=
uct dpll_pin *pin,=0A=
 	ret =3D ops->phase_adjust_get(pin, dpll_pin_on_dpll_priv(dpll, pin),=0A=
 				    dpll, dpll_priv(dpll),=0A=
 				    &phase_adjust, extack);=0A=
-	if (ret)=0A=
+	if (ret) {=0A=
+		if (ret =3D=3D -ENODATA)=0A=
+			return 0;=0A=
 		return ret;=0A=
+	}=0A=
 	if (nla_put_s32(msg, DPLL_A_PIN_PHASE_ADJUST, phase_adjust))=0A=
 		return -EMSGSIZE;=0A=
 =0A=
@@ -411,8 +414,11 @@ dpll_msg_add_phase_offset(struct sk_buff *msg, struct =
dpll_pin *pin,=0A=
 	ret =3D ops->phase_offset_get(pin, dpll_pin_on_dpll_priv(dpll, pin),=0A=
 				    dpll, dpll_priv(dpll), &phase_offset,=0A=
 				    extack);=0A=
-	if (ret)=0A=
+	if (ret) {=0A=
+		if (ret =3D=3D -ENODATA)=0A=
+			return 0;=0A=
 		return ret;=0A=
+	}=0A=
 	if (nla_put_64bit(msg, DPLL_A_PIN_PHASE_OFFSET, sizeof(phase_offset),=0A=
 			  &phase_offset, DPLL_A_PIN_PAD))=0A=
 		return -EMSGSIZE;=0A=
@@ -1452,11 +1458,11 @@ dpll_pin_phase_adj_set(struct dpll_pin *pin, struct=
 nlattr *phase_adj_attr,=0A=
 	ret =3D ops->phase_adjust_get(pin, dpll_pin_on_dpll_priv(dpll, pin),=0A=
 				    dpll, dpll_priv(dpll), &old_phase_adj,=0A=
 				    extack);=0A=
-	if (ret) {=0A=
+	if (ret && ret !=3D -ENODATA) {=0A=
 		NL_SET_ERR_MSG(extack, "unable to get old phase adjust value");=0A=
 		return ret;=0A=
 	}=0A=
-	if (phase_adj =3D=3D old_phase_adj)=0A=
+	if (!ret && phase_adj =3D=3D old_phase_adj)=0A=
 		return 0;=0A=
 =0A=
 	ret =3D ops->phase_adjust_set(pin, dpll_pin_on_dpll_priv(dpll, pin),=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
