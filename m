Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129081;
	b=3XjHYktU5NkqracQzl2WO/uffd9QNbt9/f0HNADHgLnBQNUUZhHvP8OEBs5ljDH3aHi1
	 m2I/DCMYGQqLS61iEzSqdoW0zIVR4MQ0f6vmF3qm7eOm8m1FKB0bMvuYm+0gIlwGfoEKc
	 QeX3fBAFm9qGS+JTZDd6IDfbWnVO2TyUIgz/M/BCuvDmVd0V2hC1+i9g5sfxQS+YSXJ0b
	 GzfFCHluUGbCUbw8vbHWUYVL+gMbfUXA/ThR1mwI2WCh5Ey1mXk6wKx62h2pJcfv0BayV
	 1r65FcyBSL1inZJJ7zabrSJXr/yuk2erRMWpPDa/5/hyWZwvrLZHqtrezKTDxPcxTFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129081;
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
	bh=UNcVqH5pc1tro4aszLIYE1MBPbP1Av6qtFt28lpK+iI=;
	b=qi7d6i1RDHRcBYM/0twp7vhLhLlGqAm0y36Y8iYtrtDm2DHLZx8NxRZyjtI+x1QMT+Xw
	 t8RFztEjfREO3Bt0UYug13K/E3uAyEtiUEN9qKRFZRzLR57mwGuKaekusH/5moSEQ16Q6
	 N0a7L+1JGxOCE/exqfg7JWOihNIA3B9xBzmPkPucIahzAUiXmBegJa4rRVoCC4PZUE/BR
	 cubNKxAyr9oCIKS5W6GcaS8+VBWT0uPeYp+1o0HrvVkyCE88dMW8HQn8fI1YzY8UQ9GzT
	 K9Vp8KF8c2W4ZY+4ziTIAX1T5f9gRUFek1y9jOSSypixfeiAw561w9w6uJx8ACsYkdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=Cvvgf+WM;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Y+Taolyp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.164
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D29606A32C;
	Thu, 19 Nov 2026 22:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7D29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=Cvvgf+WM;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Y+Taolyp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=UNcVqH5pc1tro4aszLIYE1MBPbP1Av6qtFt28lpK+iI=;
 b=Cvvgf+WM/0I2zccA1A7Ke9tKrgXPkxdhC0smbc690O/y3WT1Zh1byoF4r6LbIyJdKK2UNIl8C2V9rADhaf68XnV82OEb3u7IamhgtafMuIuGmqC5VhX9xRoiWLNGA9iFIJqKe24/UQ5aZP/eDAwFW/+nWuz8TPOFkus2bvV800tJx0z5ZOlnJ3xyRPJxZwNfIlPGA8Ooybay0kBNptgCBwbAP5zYjW9wWwLnOPzr/vKwjWVIgjUGmHKCnpvJ55VE/KF5h9eX9Kc4KCWtW4+fPidVpTphSRXgf5LQ25M60mtw+jfKBfL8ptH81edrEzx4I5dcaNGQoTo/JWavushIDQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 8809F90007F;
	Thu, 19 Nov 2026 22:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCklyxRtfkuK+mnTYZETfXi7vvMlz1mBU/GUqj0yZhcfIrxiqCvPKddBqMMar/2rdvmX5jXl4zuTJX1by89AZm3SJTORxnPWb+RefbNy3+VA9ejKo1Rb0fllzhGNsqTVTvluqa0fvYtfmaYIeDRR1wHHYULx4/Zc7RwL4S9JCVIn/gt/LgVdZFvRW6fX42EJV+w5UxWxUaxwcfTfL9V2whybGZxBC6bdCIpFsu1mA5ag5JJdAQ0XeBpG8VAdtePp8NBnXwbm5g7dlMBKN6lB0BBgi56ECYD637gltCEjP7fDrclgBiHJKKmzADmKAbvYVC0DfsFFRjH9DDXqvtHM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNcVqH5pc1tro4aszLIYE1MBPbP1Av6qtFt28lpK+iI=;
 b=Ssjnl/oTdjGnV7UL31NW6QZKCokfelDD0gS6aMpfy6WOgGYFPf1qQ4wHAj8ZGxcV3bYE+45TB2hPR9xvhtqt87vKqhPy6CCuF0Qk5+AXRJ4tpLpATcPqQl/9hVkBVxHZ0LZE8IR7Rw+1vKTBYOu5E+xkZfme9fSu2c9YMo6qunjMrc07B5VUD4+cKJ943DP1Chd0N0Us6jt0v7hNzcun+DOC0O7ia8+js2JoCZaLRUoNWfA1vOZZr/2cTUZRLNO2qh5/5fEv+Za3JQZ0SPy0NLqKFA1Z9OVJGyGEVm3nyA5FOPWRbRtatildj+dV4L9G04EdqbtoKterccRY7cxulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNcVqH5pc1tro4aszLIYE1MBPbP1Av6qtFt28lpK+iI=;
 b=Y+Taolypa31x0Kv84NYTTy9jsO99RkGbYLmjwKr9Od8bW1z9AqinM71/XAuTLb+yuT+7FKp4c0ap/UNHUBRbALldqjMYQKg4dIgRsfh9oTv9HccfAUCq74UkW+7dmcwu5NwjDY3Flw9flro9UPK4QAPnfcH83TJ8o2udILsFVsnHzXslmqWosGlBP+tT9m5SSPp4Iy9qm7bMopCVkqFS/lS800rSlJ3xNoWrJsi53QKCsfwSrcW6e1/DksTNBq/+RHqHujdbI+qIQmeK0CqPm7mbO/8P71j8GEdn23wzmDk1nbGBkIUde3iTOFwn43eO/DUhig1HE8gZAaAJDcQqwg==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:57:55 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:57:55 +0000
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
Subject: [PATCH net-next v16 03/13] dt-bindings: dpll: add SiTime SiT95316
 clock generator
Thread-Topic: [PATCH net-next v16 03/13] dt-bindings: dpll: add SiTime
 SiT95316 clock generator
Thread-Index: AQHdeHlpY/LoPYSTQEWWNa4YvbeJZA==
Date: Thu, 19 Nov 2026 22:57:55 +0000
Message-ID: <20261119225752.41846-4-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 7e24e386-17ae-4158-986e-08df46908c5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261009220027099003|261009223027099003|261009223327099003|261009221727099003|261009221227099003|22082099003|3023799007|56012099006|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021121427099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 xfkbL2JEmGfwZ/Aa51R3buswomH9ivwprR8om1dx7pPjzeYcZM0jflDBKN4SWldYi0EvLplbltJxO5Fu4l6SycPrNrNExwJv5zen3nEVCokpFFBkHPrxElYWkJP5P+N7LShVSMBlCIiFRANDC5A0Lw0F1x8azsyyD5UnHsFZzcrXx7HfBp4NE3YHE9Up8p0l1jGi1BWBL7t/b5hIckrnzH7PQzhKa2KDV6uWfDjgtnK7nZkCR+XeYAYIbptR6shg2qNLE88VhAGfAKEvEmpDpvsli2YghPy+g3lKNi1qSICCzdXblc/JmEd4JY3siHQGuk+mlFPeBlbDtd2tGmMjeqXW1qQ8wxRKsO7VE2UHRF56MhyGAzySBJ/7rydcILXQPMLtxHWoaad31vY9iPYMXUGftMekZ8gTPaPldWpYmWhS37IdKl4GYgPLxxUQzJkLkmXRcrQmQlb5eFGfKQ1C8xxKVCCjjAlyiWaeo4tYIf13laaQskSApEyE/vG2VPlMNjARkE/rzaADE947otUQYQxKOmAbk7YlggHR8gGSejC/FLndrp3n1XW1l/AXd/dQ3cUE1DEq5qLD3VE+gXLctoDHHXUr7Kv9oCvgEp3nET/Qm2qqZvRBTr9wphDpvxROFxUamVgakjXUcBbfZEGjhyn+reIOSrHyh82FAhdpsCY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261009220027099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009221227099003)(22082099003)(3023799007)(56012099006)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Wxh8MUXD8fQSjcZ8mFi3o2s2S0CpCpqX1sqorTsrkCp9wyiXf42HRshda9?=
 =?iso-8859-1?Q?sYOhQA/A7CBugkc1KBtPdLi2NAYK80n1C/e35L9qA51oMVSzer306fEO+Q?=
 =?iso-8859-1?Q?ewNtFWBc1W2Bj2yv1qwyl/oTrVpQWJTTT3q7NKqe0qNLewO9n6rezn1wD8?=
 =?iso-8859-1?Q?ohbqNLTnXZm7139nd1gBtteF0Ns6Pd5YgDWHTdLDWwtqzfqPVPj6Kc96Qj?=
 =?iso-8859-1?Q?lQ/LMneFGLbOlQ0r/8GeisrLLRUbJwBcWm7c4hkJ67qNFU3Kh092vGutLN?=
 =?iso-8859-1?Q?KpiD/p9YVj1NzyQW/2+cv80hTvZu6eNJMJ/67nGpoVTmdUq2UlNYxP8kfT?=
 =?iso-8859-1?Q?OQtIXnBwBOTwpQIlLYCMINumWxEprRFVMYo6R3wYt5C/M+Gve3S+AqXEWt?=
 =?iso-8859-1?Q?ca6E5RyL0+3sFuB8Fi7AuObthegbOsOzlyKLV7WM2TUIJ3XZYR7aHlJiBU?=
 =?iso-8859-1?Q?O5vGVRPRUZy2SrNsIlh2O0MMiWknGfdkCIC6+Ao2Lg5MWU5F5ffnKop7Kq?=
 =?iso-8859-1?Q?CD0K1friNbrNT3cNNwd2a2ZLXdgW60tooYe17GvrP38Vu2c9mFujO1P5Wb?=
 =?iso-8859-1?Q?siNbAsOy5trynoQ2nvQ1Vfv43g97KClBfquusmcK35N2/SjSM38CtFyvC3?=
 =?iso-8859-1?Q?OWm6SgaHlR/Cb3fF/VkiSlX6dcSN2ABg8RuFgrHCeXTr9inWoH0LMFbJ/K?=
 =?iso-8859-1?Q?lbxNJt4nbs9RKE59+wocw87SKeqHe8lDCXG/9ec0yDkKfa6ell0Ll3hXfl?=
 =?iso-8859-1?Q?kXgRvc3tNws8LCJPTM6MqJo9aYWI+gLy+2eKlj5MaWYbQS3JMaD7v6uTx4?=
 =?iso-8859-1?Q?+RKyoddRE1UUt21yaLeqg1VTTDYKxkaS7k6mnO3T1mPKqvkPxQIC2gr1tD?=
 =?iso-8859-1?Q?ax5tfdIJELzkt6VAOcNJinuCkUYJUC/sLKjE7l+W58knN2CesK7/EJTTrP?=
 =?iso-8859-1?Q?sfAdWd4VbUE+t6mv+ds4ZPYl8QByOgWfE5BkR/0PJl8EQBRj62IAex1ESa?=
 =?iso-8859-1?Q?/IkX3/CumnELszxSGIzyA0mlzkzO0PK231e6SFPM5zLXsDJmQn0YIp5b+W?=
 =?iso-8859-1?Q?w/i53ZawDEI9VNpE94G6PCWTiHHw3PMg+9mrm2Wc7cdyKs64J09KbZTFL6?=
 =?iso-8859-1?Q?tvmOaQ2MvPB53y7vn+wBQuSs42o5TvaSWCF8RqPTZBC2RhquwOXY7XFn8Z?=
 =?iso-8859-1?Q?MN0QauEC1odOw3QgAnV8kT67Q5qYIdqQIe7qmbV7544MgqJ+y0ILal8Qhx?=
 =?iso-8859-1?Q?FonroBTPheQCI8u7uvioD67VNq8vPi/LOV8PhK4HQqTkgITMciwPQne2H6?=
 =?iso-8859-1?Q?NNjm8uS3eVrHcciSr6hwsEVJ9bEY62KLGq6k9nHEx1bquFg8K7nH/tfyf4?=
 =?iso-8859-1?Q?i2PPycRklA6QjCuR4nW1I9+nSLQpIStcihKsnPYT3FuwX2L9+WnH7UGvA+?=
 =?iso-8859-1?Q?j/27VcVAkKxFMLfQ832oU/hJmhW8OkwYUSSKdCmtJW4c0z1xbOEkhxOPLG?=
 =?iso-8859-1?Q?LbldCUtEztvZmBoLi51n4ziNamVjVf7S6siCis0TVz3iZkD2SAi4mPSW/I?=
 =?iso-8859-1?Q?2MMQl0qzIcFFYbsjP8GBsnIqOu9H8f9nVJCq5t2AhSeRh+34Z3MqTa9xef?=
 =?iso-8859-1?Q?8D53TGcXBxnuAP06sXNSzu8Y1eQP0l0OEP1Idi4UKeNhuUeg45XHvKJyYi?=
 =?iso-8859-1?Q?YsSAZvEVnTV0BhsvLltllSdkubKyCwAc34RkEohNu3Epkz0XqH8xaVeUAf?=
 =?iso-8859-1?Q?WjHGdB9RtXQda5bjSfeDIIBI4McBU16ujExTbgPOWkNEal?=
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
	hAKxQBDbVJTfa2nlYhejS5YiP/rLNxMUwwWx+x7ULiJeWbmh42uXEBKXkK1Sz4MlR4hjtQrZ05rPzisbIKI316sppfLO9UN5TdHlvHbsrsKrFCLD0Xqu17UnlmtsLie4aYOxq+r3xhRoOQUl3KLhGEQXH+Z57KwmRlEQ0PLsDMk8OqxBEd1BrLWAmWgrpIllOrgldgRdOpk2TnmTRU98LbxpoyQmdlJZYDXnEuTJWBXbFDVNcwKoadSFg48h70JLAr1rmDhv1r6Raril4z4axLOrtmAkasI69LCRoo8fdn3mJAzz2VyO1ulhb4Yg2Mkc8lArd2A3fXIbeprFICwPUA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e24e386-17ae-4158-986e-08df46908c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:55.3545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I7GlapGVtrM71tnIfakcd6G6rnR5B/bpKYEJ78n+gnUbkJgsyUEDqwzgGm6uE6hVhq8bYyeFFlRLyQTCO88YWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129079-LinFS3fl3vMy
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129079;LinFS3fl3vMy;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

Add a binding for the SiTime SiT9531x family of clock generators: an=0A=
I2C-controlled device with four independent PLLs, up to eight input=0A=
clocks and up to twelve outputs, described as a DPLL provider.=0A=
=0A=
The XO is given either as a clock or, for firmware that describes the=0A=
oscillator as a property rather than as a clock provider, such as ACPI,=0A=
as clock-frequency.=0A=
=0A=
The supplies are described by their pin names: the core and input rails,=0A=
the GPIO rail the SiT95317 has, and one per output-driver pin: VDDO0 to=0A=
VDDO7 on the SiT95317, VDDO0_1, VDDO2 to VDDO9 and VDDO10_11 on the=0A=
SiT95316.  The driver does not enable them; describing them gives a=0A=
board with switchable rails a way to say so.=0A=
=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>=0A=
---=0A=
 .../bindings/dpll/sitime,sit95316.yaml        | 214 ++++++++++++++++++=0A=
 MAINTAINERS                                   |   6 +=0A=
 2 files changed, 220 insertions(+)=0A=
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit95316.=
yaml=0A=
=0A=
diff --git a/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml b/=
Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml=0A=
new file mode 100644=0A=
index 000000000000..5356a73a8062=0A=
--- /dev/null=0A=
+++ b/Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml=0A=
@@ -0,0 +1,214 @@=0A=
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0A=
+%YAML 1.2=0A=
+---=0A=
+$id: http://devicetree.org/schemas/dpll/sitime,sit95316.yaml#=0A=
+$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
+=0A=
+title: SiTime SiT95316/SiT95317 DPLL Clock Generator=0A=
+=0A=
+maintainers:=0A=
+  - Ali Rouhi <arouhi@sitime.com>=0A=
+=0A=
+description: |=0A=
+  SiTime SiT95316 and SiT95317 are I2C-controlled programmable clock=0A=
+  generators with integrated DPLL for synchronization applications.  Both=
=0A=
+  variants contain four PLLs with automatic/manual reference selection,=0A=
+  DCO frequency adjustment, and phase offset measurement via an on-chip=0A=
+  TDC (Time-to-Digital Converter).=0A=
+=0A=
+  Both parts have 4 differential input pairs whose lanes can also be=0A=
+  driven independently as single-ended references, so 8 inputs are=0A=
+  individually selectable.  SiT95317 drives 8 outputs, SiT95316=0A=
+  drives 12.=0A=
+=0A=
+  Pin numbering.  An input pin's reg is its lane: 2k is INkP and 2k + 1=0A=
+  is INkN, 0 to 7.  A pair the loaded configuration runs differential is=
=0A=
+  one input, described at 2k.  An output pin's reg is its physical output=
=0A=
+  OUTn, 0 to 11; the SiT95317 bonds out the die's outputs 0, 3, 4, 5, 7, 8=
,=0A=
+  9 and 11, which its datasheet names OUT0 to OUT7 in that order.=0A=
+=0A=
+properties:=0A=
+  compatible:=0A=
+    enum:=0A=
+      - sitime,sit95316=0A=
+      - sitime,sit95317=0A=
+=0A=
+  reg:=0A=
+    maxItems: 1=0A=
+=0A=
+  clocks:=0A=
+    maxItems: 1=0A=
+=0A=
+  clock-names:=0A=
+    items:=0A=
+      - const: xtal=0A=
+=0A=
+  clock-frequency:=0A=
+    description:=0A=
+      XO rate in Hz feeding XIN/XO_CLK, for firmware that describes the=0A=
+      oscillator as a property rather than as a clock provider, such as=0A=
+      ACPI.  Use either this or "clocks", not both.=0A=
+=0A=
+  reset-gpios:=0A=
+    maxItems: 1=0A=
+    description:=0A=
+      GPIO connected to the chip's active-low reset pin (RESETB).=0A=
+=0A=
+  interrupts:=0A=
+    maxItems: 1=0A=
+    description:=0A=
+      Interrupt from the chip's active-low INTRB output.  Asserted when=0A=
+      the device detects a status change such as lock acquisition or loss.=
=0A=
+=0A=
+  dpll-types:=0A=
+    maxItems: 4=0A=
+=0A=
+  vdd-supply:=0A=
+    description: Core supply of the PLLs, 1.8 V (the VDD pins).=0A=
+=0A=
+  vddin-supply:=0A=
+    description:=0A=
+      Supply of the input receivers and dividers, 3.3 V (VDDIN).=0A=
+=0A=
+  vdds-supply:=0A=
+    description:=0A=
+      Supply of the two GPIO pins that have their own rail (VDDS).  The=0A=
+      SiT95316 has no such pin.=0A=
+=0A=
+  input-pins:=0A=
+    type: object=0A=
+    patternProperties:=0A=
+      "^pin@[0-9a-f]+$":=0A=
+        type: object=0A=
+        properties:=0A=
+          reg:=0A=
+            maximum: 7=0A=
+=0A=
+          supported-frequencies-hz:=0A=
+            maxItems: 1=0A=
+            description:=0A=
+              The rate wired to the input, in Hz, as a single entry.  An=
=0A=
+              input runs at the rate the board feeds it and has no=0A=
+              frequency to select, so that entry is what the pin reports=
=0A=
+              as its frequency.=0A=
+=0A=
+patternProperties:=0A=
+  "^vddo([0-9]|1[01]|0_1|10_11)-supply$":=0A=
+    description: |=0A=
+      Supply of an output driver, named after its VDDO pin.  The SiT95317=
=0A=
+      has one per output, VDDO0 to VDDO7, numbered as that part's=0A=
+      datasheet numbers its outputs; in the pin numbering of this binding=
=0A=
+      those are outputs 0, 3, 4, 5, 7, 8, 9 and 11, in that order.  The=0A=
+      SiT95316 has VDDO0_1, VDDO2 to VDDO9 and VDDO10_11, the two shared=
=0A=
+      pins each powering the pair of outputs they are named after.=0A=
+=0A=
+required:=0A=
+  - compatible=0A=
+  - reg=0A=
+=0A=
+dependencies:=0A=
+  clocks: [ clock-names ]=0A=
+=0A=
+oneOf:=0A=
+  - required:=0A=
+      - clocks=0A=
+  - required:=0A=
+      - clock-frequency=0A=
+=0A=
+allOf:=0A=
+  - $ref: /schemas/dpll/dpll-device.yaml#=0A=
+  - if:=0A=
+      properties:=0A=
+        compatible:=0A=
+          const: sitime,sit95317=0A=
+    then:=0A=
+      properties:=0A=
+        output-pins:=0A=
+          patternProperties:=0A=
+            "^pin@[0-9a-f]+$":=0A=
+              properties:=0A=
+                reg:=0A=
+                  enum: [0, 3, 4, 5, 7, 8, 9, 11]=0A=
+      patternProperties:=0A=
+        "^vddo(8|9|1[01]|0_1|10_11)-supply$": false=0A=
+    else:=0A=
+      properties:=0A=
+        vdds-supply: false=0A=
+        output-pins:=0A=
+          patternProperties:=0A=
+            "^pin@[0-9a-f]+$":=0A=
+              properties:=0A=
+                reg:=0A=
+                  maximum: 11=0A=
+      patternProperties:=0A=
+        "^vddo(1[01]|[01])-supply$": false=0A=
+=0A=
+unevaluatedProperties: false=0A=
+=0A=
+examples:=0A=
+  - |=0A=
+    #include <dt-bindings/gpio/gpio.h>=0A=
+    #include <dt-bindings/interrupt-controller/irq.h>=0A=
+=0A=
+    i2c {=0A=
+        #address-cells =3D <1>;=0A=
+        #size-cells =3D <0>;=0A=
+=0A=
+        dpll@68 {=0A=
+            compatible =3D "sitime,sit95316";=0A=
+            reg =3D <0x68>;=0A=
+            clocks =3D <&xo2>;=0A=
+            clock-names =3D "xtal";=0A=
+            reset-gpios =3D <&gpio 78 GPIO_ACTIVE_LOW>;=0A=
+            interrupts =3D <12 IRQ_TYPE_LEVEL_LOW>;=0A=
+            vdd-supply =3D <&reg_1v8>;=0A=
+            vddin-supply =3D <&reg_3v3>;=0A=
+            vddo0_1-supply =3D <&reg_3v3>;=0A=
+            vddo10_11-supply =3D <&reg_1v8>;=0A=
+            dpll-types =3D "eec", "eec", "eec", "eec";=0A=
+=0A=
+            input-pins {=0A=
+                #address-cells =3D <1>;=0A=
+                #size-cells =3D <0>;=0A=
+=0A=
+                /* IN0P and IN0N: pair 0 runs single-ended */=0A=
+                pin@0 {=0A=
+                    reg =3D <0>;=0A=
+                    label =3D "clkin0";=0A=
+                    connection-type =3D "ext";=0A=
+                    supported-frequencies-hz =3D <10000000>;=0A=
+                };=0A=
+=0A=
+                pin@1 {=0A=
+                    reg =3D <1>;=0A=
+                    label =3D "clkin1";=0A=
+                    connection-type =3D "synce";=0A=
+                    supported-frequencies-hz =3D <156250000>;=0A=
+                };=0A=
+            };=0A=
+=0A=
+            output-pins {=0A=
+                #address-cells =3D <1>;=0A=
+                #size-cells =3D <0>;=0A=
+=0A=
+                pin@0 {=0A=
+                    reg =3D <0>;=0A=
+                    label =3D "clkout0";=0A=
+                    supported-frequencies-hz =3D <156250000>;=0A=
+                };=0A=
+=0A=
+                pin@1 {=0A=
+                    reg =3D <1>;=0A=
+                    label =3D "clkout1";=0A=
+                    supported-frequencies-hz =3D <25000000>;=0A=
+                };=0A=
+=0A=
+                pin@a {=0A=
+                    reg =3D <10>;=0A=
+                    label =3D "clkout10";=0A=
+                    supported-frequencies-hz =3D <10000000>;=0A=
+                };=0A=
+            };=0A=
+        };=0A=
+    };=0A=
+...=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index fe23913b1e43..6c831bf9e812 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -25870,6 +25870,12 @@ S:	Maintained=0A=
 W:	http://www.winischhofer.at/linuxsisusbvga.shtml=0A=
 F:	drivers/usb/misc/sisusbvga/=0A=
 =0A=
+SITIME SIT9531X DPLL DRIVER=0A=
+M:	Ali Rouhi <arouhi@sitime.com>=0A=
+L:	netdev@vger.kernel.org=0A=
+S:	Maintained=0A=
+F:	Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml=0A=
+=0A=
 SL28 CPLD MFD DRIVER=0A=
 M:	Michael Walle <mwalle@kernel.org>=0A=
 S:	Maintained=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
