Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129095;
	b=i12mRurzEy5hIgdG7g2Mf0n/BSQQY3cUeXxcDxuv8sF5HRpXC5xCMSCD01k6LYCvVMbU
	 1ob6VLBG3GmatU5lRW1orwffq0F/qiHFEKNlLJUYi99Ou8mslVGGxYmMwdpyb2qrNaAN9
	 a3vMYNfALB1jzNSn9XjAAOHAZyd3Hn6D6sgOrUDOYun5Selv7T9rl8z0aMDZbOGDH+lOp
	 kNX3oqifD2eg26/0Mkal08JLNNH+mzlcQDvw7VXyf6WmESQSYzbxdvnF1DHylffM/qqSJ
	 Nbu9r6qvWZPAp3Z3vqPTHCmsTFMFOhSpBytssn9V08fnmhdToMqLIcbGpgnmwzs1skQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129095;
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
	bh=W4XbiVBBpubXFQENmi6IWVwg8QQkvhYVDyueVDWDjVo=;
	b=ZM0CB0w/rTjH8Mm765eyR2FmAZBHhm17hidWvLaGeVvghzNGTcXcehovQf70TizUYs1g
	 +NbJJs2du3XaeuQOmawJSfZ+UpYZbk/bKRN1EsAIIM3OHAbkxET8sHqta/OhxWfYRBmo2
	 ZCkOC5anU0ts4UYq/ismPdRz/FdK5XIht7ZOACUmdRo2kMx5p09O9/IcmGpstqZs6qjFv
	 U9BwqlQ0mhZSScKDM6khcyG8Id/sb+G25lQtZArnaEFetpxfTYPxcg9ml44N7TFnAliLl
	 HqWiN14FNpVDBKzQTNiiiusTe4KWwuZAx5sRPvmqWg1EAn3qh3ypt5xhMFRn/asZ2Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=oMFa4yIo;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Cpy1v0IT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.129.48
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [148.163.129.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC9B606A33D;
	Thu, 19 Nov 2026 22:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC9B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=oMFa4yIo;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Cpy1v0IT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=W4XbiVBBpubXFQENmi6IWVwg8QQkvhYVDyueVDWDjVo=;
 b=oMFa4yIosl25fK4OINX0dG4Xa+Mx6GowiFFQ5L4x61k3/lVJvPNJnYtYbu3ehnvPj0ggkMHl+V0PKC2LxhlWE+9IgrcZQuLu3bM6OcDeDdqkWlQXt+nXcn4P5oZLIc/KqtmaQ27WqMAxM+emYI11NjWAJ+ZsMKB+x69V0ud+kilvnEljNLLFJsSJXn8+RkRczR3BgVI4EK+nc+1CJHNQ/EYmbiOIJXrSME8OzH5mpL/xLLET2LdlpFCDudsH7ViC8H177t6td775pi61smvvjBx2gIclE94ssEoauDVL4n4fScyC8zSnRB8lKK7EjQdb/jWRY6kdP/0kK4htnmwxnA==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023125.outbound.protection.outlook.com [40.93.201.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 5F0A7C4007B;
	Thu, 19 Nov 2026 22:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0OOm46ywGxend1nYvaodmCToshEDxSXDvbb432D8ozaBVfBWX2xUUEJKM18MfK68khO5mY7LFReyTCxMcNRj/nTAw1ZTXEOmvq2ds96JuVOxOcoG9G122AZTRcoXASxOiVBIs7bMXPBGTZpbyG5YWzAJxUCj5cdiC2SUyrM0PYSNJsG2Sod4rV/cZ6CuqevIv5rCex5t7km5ijXUwbREC02iRMidDDh6sW9D+jMeRFDA9Rihs4vU65VsyA6pgoo2PPwP0WwWbOSA2mHfAIyg62diSphZuIERfI5Qc1mWqnredrWlgt0fcMfGuCsIvgc3Ze5xveNhjnlqHeMcYod2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4XbiVBBpubXFQENmi6IWVwg8QQkvhYVDyueVDWDjVo=;
 b=RAsSTDCDgee6NY2bCSY+6EBoaw4WC7tDWyq8AYiY0NRl6VGBHZyRBHCjrHXyag5qnlR01fWQdDWcM1fy1p0wVZMlVZQG8AyQdzihNxrRFmI0HEQXymWD1Q0rVuK6kIo1vvGSQwmYng+ce/8/+wtlFNz49F0lJlyPIz0NuKgYA2XZ9FrtJgb0iOzHTrWnvWpkKHB6l2i0Fc6PbWZOa9sKF1fGCozZEljE2iIxn5aWLDtkO2NndddzclySr/KYFrjH6OkuwUN6zW8CkevSgy53NHStyPSLEhE0/eU5ViiaNuylSYHliVZfgO0ig5HAZaIe3Bj/B7BGjBUDJBXxU7qu+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4XbiVBBpubXFQENmi6IWVwg8QQkvhYVDyueVDWDjVo=;
 b=Cpy1v0ITc9ObaKiXfUP5YmGPX+T1SxdudSKP1NUOZl3p88tPOLk2OF06HJZUjCdadfSxyooF/jZi64AhKzCnqbBUSZdlbGeVqtxnW3OHGcxcEI+2ElSevG7YzwHOYsfeiOb3J7pJa0W+3MVqjb006disiEVAnWBvkPuXavQVhh0Ggaphjp8fvQZtnqJzY/ntxxLQ56ZF3UQo9wIuivfWhM8ppFBtP8pYYBeIok3kWD9+hZnRDBGCEzvq4HHGwPZiUBZFV2ayBqEesxEop2JGYkk5RoyioyfhKiI/SqETGY+CBXODGgWFqSA3aSLZTtFg67xr0awzgwy4EqT7XCW9Tw==
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
Subject: [PATCH net-next v16 11/13] dpll: sit9531x: add support to adjust
 output phase
Thread-Topic: [PATCH net-next v16 11/13] dpll: sit9531x: add support to adjust
 output phase
Thread-Index: AQHdeHltNDYF/lQ9BUayh2rDWAJ1sQ==
Date: Thu, 19 Nov 2026 22:58:00 +0000
Message-ID: <20261119225752.41846-12-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: 088b49ba-f104-4920-7726-08df46909246
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|261028144727099003|260925021911599003|260925021311599003|260925022911599003|5023799004|56012099006|261021123027099003|261022105027099003|261026121527099003|261021121427099003|261022075727099003|261009223027099003|261026140227099003|261102123227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
x-microsoft-antispam-message-info:
 RR8UDBWd6oX4HGJmkGfzIrswNNX8bZYQacMyJh7oQ0T3Q8hE76E6LIU/NXKREG6YZBL7hhhU40kwuuWoNDTe6fxsU+0D8/Pi5SkUdIwrmCNBAX0ChX2iYI4cZxKrC0hf3cpeKsApo7oDkEcUHM8wESXgxKaZuc0BKERpN1BvVVjnv3p97tSN5jU/OaBsdO/VkQgHwMM6rSzX0lvyJXbT5i+VBm76ktlw0Ovg3PHlYrBQowg/Ix5ixdz2hJRIJJPF38FCDnmkJUWOWvHf8n1Kr73yUjZacJJr60pEYRVp/mFBnPqZMzekzQpQufhl97slGL/W10EQFz2REtdSsuIKcAeZTEP5NXBqJVST0u5uDGprb0FSoTMW8e8NCENpWzP8InsrItiYvgVhXWiXbQcLrYO1s0Yac22NpQK36Z/ZCuLqxsAkJB694A6+VsgfK44AgQTiwjlq7296rhQOEd4K2aam4sFZbja4/3ko065ujcxpynO2mh8NOcvv2nthqC0DpplyU05RhXBSKCSokoeE5wcYqaF7zJvBBh4qVBqJUYoOTxF/kJw/9/oGlkWS0rAbc/7yluiP0KlcSBOA2E57NOP9sMAnVkz/A0PjYIK8OzkcEgqMNBOLQZ7+vFK/fcWMIdjiWHhfC/7IxZsF+FXSQhye7REUhMkNN/b/LiAKd80yFarF5kFaJ1RVYPMWb++3oBQt5jMCCClANa6fpQKTvIyG07IGZOWWjheY4QWERac=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(261028144727099003)(260925021911599003)(260925021311599003)(260925022911599003)(5023799004)(56012099006)(261021123027099003)(261022105027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261009223027099003)(261026140227099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f19rphKfxQPoQqFufQqgoW68FnSG77gAWVYvLn/7xACpvuTRCc0vL1Uc7I?=
 =?iso-8859-1?Q?Gl1ia39l2ewO51BtgBTDLrpq2ImnEg+qZ80/cvES2qtt8Z2Z4fktKJddXT?=
 =?iso-8859-1?Q?YfFZyfi9mllhKtuYG7ZhtkqvS7wbRTy1PS3q0ejyzwCaEy4HA8j7+elOPq?=
 =?iso-8859-1?Q?2DRfjnMkEARC2iI0uWH3BpH4ksg/p9BloENzgQQyEHbougAORFc6fMFq7q?=
 =?iso-8859-1?Q?bn3RAS5W/CVB4xXmp5KBWHKyoAj6ORk1CPR/GrKRPFblGxHmBVmZhK+0r5?=
 =?iso-8859-1?Q?pNfwcUyezT7unu0ElmLGtWojSBLKTbNa1JDCTV/QUXpWR1o+1QIQqeeeUx?=
 =?iso-8859-1?Q?7/6bJPFDKr7g1t6TMU+UfiJdpofoZlHrZ253BcraiT4kx/SKJj3VtnHkgP?=
 =?iso-8859-1?Q?CAZmZoOjfPkEyqTcRmN8mPD+k0RCYGaDM9c99j2/iSW2pqDoiw3MFcxmAX?=
 =?iso-8859-1?Q?ckGo9Js4QhaFmTfgdxkKRKxFbcDDVLFDlI94voRs5IwRIQJTXaHXGJzF9F?=
 =?iso-8859-1?Q?LciPvFZYJKQiiwSEp/uk8N5msj8MWB8C1HzTTCZeWpx1DPya3EuqgrJ9Vp?=
 =?iso-8859-1?Q?2KZizlYhRoU1aEoplQ+IDXB+4Ehi/oyuLRN2V7IhdrRPGKoar3p+45Dd5A?=
 =?iso-8859-1?Q?J4RFoOKVDhRGDzrmf5JkmisbIFWsVBCDuCbSuTU+Rypy9FxjlnxRLtzRzU?=
 =?iso-8859-1?Q?6JHl0U5MOapP0xUZy5CLVtEVVrqJU/hS188dsT0wqf36wN4NBgQKRgO/7W?=
 =?iso-8859-1?Q?rHPGjLPvFT5x+w3lh+gALMO+tKQzxYTXQO6A/5YVm+drTJNXjjRgoZaTYq?=
 =?iso-8859-1?Q?KkAEZfPak227YBxAM4m1XMNbWQiG3dQgJMB0nJ5A5epnjLKV8msP05YYR8?=
 =?iso-8859-1?Q?OyMNrTuXHiBMpHaet+88K0dW0Ti9YAtrHglMD66NyQeKCjKeL+dSr4fKbV?=
 =?iso-8859-1?Q?HLS11hT7JAOH54NkOCfxiI6/rdvTtsNCLwRzLsRrub/ehK9fvTF8gT+SvX?=
 =?iso-8859-1?Q?Us9GvT12gHck2u9FQBbwGhfpdWG0Fu2J6zH1C+UUgBGKyyl5p0yhqqmnTK?=
 =?iso-8859-1?Q?sv5HeZJXhXaldRlpeS+NmJVZ43sN6VRglYaAVUL1WZoF0lqKEIamIU2zTD?=
 =?iso-8859-1?Q?FUY2yMEsvkJABtsqYhLrRhInqZyDd8dQzLXPX1ZJqyE3fjUaGE8otQXuIN?=
 =?iso-8859-1?Q?ZOREhjz4s0Epg768Y22Gd5xNSPZAvwG4cRxFtw1n+nUoHsQtWkRJ0Iq8g8?=
 =?iso-8859-1?Q?NASTTSgA40iDOaM0ZMd0hlisHPhWlf7Li2azxIRlaXhcI/xGOvuxM7E0d2?=
 =?iso-8859-1?Q?OLCGJOIgIC+ZxjDRpJqjwnVhjqrrzvGzkxaboGnvSIF/R+k318gZXd0OcS?=
 =?iso-8859-1?Q?XMadRjowFnV95kVXINpmUi7IELCXTwtjBW+uYXMCprdWn9/2dXaba6S1s6?=
 =?iso-8859-1?Q?iUjKPlyadccWsJvSxu/uIRSY242Uf60wAVspAQOe4U/jwg0c6DVITXq4DW?=
 =?iso-8859-1?Q?9K2u5WGmAG4Ov/ghy0ooVMAUmbV4XDkjrMRY9N9Kq0iz5H8Vu/pfxoQSXz?=
 =?iso-8859-1?Q?GVT2EHIt/DPXjxz0Bh3H4BbzwlZlWIE7caTKRlIS3K4iH5dHDvbIc/Ig7d?=
 =?iso-8859-1?Q?St1nU4jLiHaRGiubgMEZhnYojHdvfrLRJQAX1YOZ7g/8RMctmVzfvZzo3h?=
 =?iso-8859-1?Q?smcprrKoJAtFiKusMoc5i5gELaipt1lyYj3kNW7NqJDhcR/iWupXM9bysg?=
 =?iso-8859-1?Q?T/gprhUXi1H9iHANjeorY4PQpwRFyXBz52Pyyvz+wWw3rz?=
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
	LyjV+b1sWXbFyr8cSW+O9+FL8PABvMe8bwMNylRIK0hqKVVsqbgBxguKhxpbeXQcglN4O0yOt+YRRBWOpVNuMpQqXy9UwN+WTSFpdBs2ZJ/CkUL/kCa+QG1QN0+63nqUNw8wM2PthDxBAvkeZsrxnZRBcNPPuFqr3G0Sr172fNLLILFIvaIbMlamqIpzqIftHvfXLSANkzhlpB37Z6TFmkASNwDARl/j3MKPNxMBgEza2ryPSpVnpwT4Gkx/WO6mYdOjQSYNNVq6VjaFnnUUXjPOFXN+OFKSTt2+s5BrVKF0D9UTjyRXwqhBE2UFr3WAAuODs4Jj0//1/m1/FQ0bZg==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088b49ba-f104-4920-7726-08df46909246
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:58:00.6859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bEQJK2SAP1BDWPwvTGlLRpbhdcYgaogkAMvaKnepRDLHSHGnaElEIqIsZUB/4QX46tUbxnJDl20L85QMLbtLcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6C2DD1D15
X-MDID: 1795129088-N1Vm87lI57ml
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;ut7;1795129088;N1Vm87lI57ml;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Shift an output in time against the other outputs of its PLL. A delay is=0A=
a coarse count of VCO cycles plus a 3-bit fine field in 30 ps steps, so=0A=
the grid depends on the PLL's rate; the driver programs the nearest=0A=
point and the getter reports what the registers hold.=0A=
=0A=
The range advertised to the core is +/-1 ms at 1 ps granularity. The=0A=
driver writes only positive delays, so an advance is held as the=0A=
complementary delay within the output period, and a stored delay is=0A=
reported in the form nearer to zero. A delay alone takes a small-change=0A=
update, without the programming state. It is applied by the PLL's phase=0A=
flush, or by a PLL restart where the configuration has the flush off;=0A=
both restart the divider phase of every output the PLL drives. A rate=0A=
change re-times a programmed delay in the same programming window as=0A=
the divider.=0A=
=0A=
A write that fails part way is recorded and retried by the poll and at=0A=
removal: a flush that did not fire, the flush registers not put back,=0A=
and a delay still to be re-timed after a rate change.=0A=
=0A=
Suggested-by: Ivan Vecera <ivecera@redhat.com>=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 drivers/dpll/sit9531x/core.c | 861 ++++++++++++++++++++++++++++++++---=0A=
 drivers/dpll/sit9531x/core.h |  30 ++=0A=
 drivers/dpll/sit9531x/dpll.c | 119 ++++-=0A=
 drivers/dpll/sit9531x/prop.c |  14 +=0A=
 drivers/dpll/sit9531x/regs.h |  29 ++=0A=
 5 files changed, 977 insertions(+), 76 deletions(-)=0A=
=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
index eb1d10e1fde2..fd8f0df9116d 100644=0A=
--- a/drivers/dpll/sit9531x/core.c=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -245,6 +245,23 @@ static int sit9531x_write_pll_close(struct sit9531x_de=
v *sitdev, u8 pll_idx,=0A=
 						 offset), val);=0A=
 }=0A=
 =0A=
+static int sit9531x_update_pll_close(struct sit9531x_dev *sitdev, u8 pll_i=
dx,=0A=
+				     u8 offset, u8 mask, u8 val)=0A=
+{=0A=
+	u8 attempt;=0A=
+	int rc;=0A=
+=0A=
+	for (attempt =3D 0; attempt < SIT9531X_CLOSE_TRIES; attempt++) {=0A=
+		if (attempt)=0A=
+			usleep_range(1000, 2000);=0A=
+		rc =3D sit9531x_update_pll_u8(sitdev, pll_idx, offset, mask, val);=0A=
+		if (!rc)=0A=
+			break;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
 static void sit9531x_input_get_regs(const struct sit9531x_dev *sitdev,=0A=
 				    u8 index,=0A=
 				    unsigned int *force_reg,=0A=
@@ -1559,6 +1576,65 @@ static int sit9531x_pll_small_update(struct sit9531x=
_dev *sitdev, u8 pll_idx)=0A=
 				     SIT9531X_SMALL_UPDATE_CMD);=0A=
 }=0A=
 =0A=
+static int sit9531x_pll_small_update_close(struct sit9531x_dev *sitdev,=0A=
+					   u8 pll_idx)=0A=
+{=0A=
+	return sit9531x_write_pll_close(sitdev, pll_idx,=0A=
+					SIT9531X_PLL_REG_SMALL_UPDATE,=0A=
+					SIT9531X_SMALL_UPDATE_CMD);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Undo a phase flush: restore the trigger select and the flush enable of =
@plls=0A=
+ * from @armed.=0A=
+ */=0A=
+static int sit9531x_phase_flush_undo(struct sit9531x_dev *sitdev,=0A=
+				     bool ctrl_back, u8 ctrl, u8 plls, u8 armed)=0A=
+{=0A=
+	const u8 en =3D SIT9531X_PLL_PHFL_ON_DEMAND_EN;=0A=
+	int rc =3D 0, ret;=0A=
+	u8 i;=0A=
+=0A=
+	if (ctrl_back) {=0A=
+		rc =3D sit9531x_write_close(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,=0A=
+					  ctrl);=0A=
+		sitdev->flush_ctrl_pending =3D !!rc;=0A=
+		sitdev->flush_ctrl =3D ctrl;=0A=
+	}=0A=
+=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
+		if (!(plls & BIT(i)))=0A=
+			continue;=0A=
+		ret =3D sit9531x_update_pll_close(sitdev, i,=0A=
+						SIT9531X_PLL_REG_PHFL_CTRL, en,=0A=
+						(armed & BIT(i)) ? en : 0);=0A=
+		if (!ret)=0A=
+			ret =3D sit9531x_pll_small_update_close(sitdev, i);=0A=
+		if (ret) {=0A=
+			sitdev->flush_arm_pending |=3D BIT(i);=0A=
+			sitdev->flush_armed &=3D ~BIT(i);=0A=
+			sitdev->flush_armed |=3D armed & BIT(i);=0A=
+			if (!rc)=0A=
+				rc =3D ret;=0A=
+		} else {=0A=
+			sitdev->flush_arm_pending &=3D ~BIT(i);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static int sit9531x_phase_flush_undo_retry(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	if (!sitdev->flush_ctrl_pending && !sitdev->flush_arm_pending)=0A=
+		return 0;=0A=
+=0A=
+	return sit9531x_phase_flush_undo(sitdev, sitdev->flush_ctrl_pending,=0A=
+					 sitdev->flush_ctrl,=0A=
+					 sitdev->flush_arm_pending,=0A=
+					 sitdev->flush_armed);=0A=
+}=0A=
+=0A=
 /*=0A=
  * Realign the PLL's output dividers with the on-demand phase flush (PHFL)=
, or=0A=
  * restart the PLL when its profile has PHFL off (PLL page 0x47 bit 7 clea=
r), as=0A=
@@ -1567,24 +1643,36 @@ static int sit9531x_pll_small_update(struct sit9531=
x_dev *sitdev, u8 pll_idx)=0A=
  */=0A=
 static int sit9531x_output_phase_flush(struct sit9531x_dev *sitdev, u8 pll=
_idx)=0A=
 {=0A=
-	u8 ctrl, orig, phfl, armed_mask =3D 0, parked =3D 0, i;=0A=
+	u8 ctrl, orig =3D 0, phfl, armed_mask =3D 0, parked =3D 0, touched, i;=0A=
+	bool ctrl_back =3D false, armed_here =3D false, fired =3D false;=0A=
 	int rc, ret;=0A=
 =0A=
+	/*=0A=
+	 * Retry a pending undo first so the reads below see the profile's=0A=
+	 * settings.=0A=
+	 */=0A=
+	rc =3D sit9531x_phase_flush_undo_retry(sitdev);=0A=
+	if (rc)=0A=
+		goto out;=0A=
+=0A=
 	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx, SIT9531X_PLL_REG_CONFIG47,=
=0A=
 				  &phfl);=0A=
 	if (rc)=0A=
-		return rc;=0A=
-	if (!(phfl & SIT9531X_PLL_CONFIG47_PHFL_EN))=0A=
-		return sit9531x_write_pll_u8(sitdev, pll_idx,=0A=
-					     SIT9531X_PLL_REG_DIRECTIVES,=0A=
-					     SIT9531X_PLL_DIRECTIVE_RESTART);=0A=
+		goto out;=0A=
+	if (!(phfl & SIT9531X_PLL_CONFIG47_PHFL_EN)) {=0A=
+		rc =3D sit9531x_write_pll_u8(sitdev, pll_idx,=0A=
+					   SIT9531X_PLL_REG_DIRECTIVES,=0A=
+					   SIT9531X_PLL_DIRECTIVE_RESTART);=0A=
+		fired =3D !rc;=0A=
+		goto out;=0A=
+	}=0A=
 =0A=
 	/* Only the target PLL keeps on-demand flush enabled for the pulse. */=0A=
 	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
 		rc =3D sit9531x_read_pll_u8(sitdev, i, SIT9531X_PLL_REG_PHFL_CTRL,=0A=
 					  &phfl);=0A=
 		if (rc)=0A=
-			return rc;=0A=
+			goto out;=0A=
 		if (phfl & SIT9531X_PLL_PHFL_ON_DEMAND_EN)=0A=
 			armed_mask |=3D BIT(i);=0A=
 	}=0A=
@@ -1597,18 +1685,19 @@ static int sit9531x_output_phase_flush(struct sit95=
31x_dev *sitdev, u8 pll_idx)=0A=
 					    SIT9531X_PLL_REG_PHFL_CTRL,=0A=
 					    SIT9531X_PLL_PHFL_ON_DEMAND_EN, 0);=0A=
 		if (rc)=0A=
-			goto unpark;=0A=
+			goto undo;=0A=
 		rc =3D sit9531x_pll_small_update(sitdev, i);=0A=
 		if (rc)=0A=
-			goto unpark;=0A=
+			goto undo;=0A=
 	}=0A=
 =0A=
+	armed_here =3D true;=0A=
 	rc =3D sit9531x_update_pll_u8(sitdev, pll_idx,=0A=
 				    SIT9531X_PLL_REG_PHFL_CTRL,=0A=
 				    SIT9531X_PLL_PHFL_ON_DEMAND_EN,=0A=
 				    SIT9531X_PLL_PHFL_ON_DEMAND_EN);=0A=
 	if (rc)=0A=
-		goto disarm;=0A=
+		goto undo;=0A=
 =0A=
 	/*=0A=
 	 * Write the update register whole; a read-modify-write skips the write=
=0A=
@@ -1616,21 +1705,19 @@ static int sit9531x_output_phase_flush(struct sit95=
31x_dev *sitdev, u8 pll_idx)=0A=
 	 */=0A=
 	rc =3D sit9531x_pll_small_update(sitdev, pll_idx);=0A=
 	if (rc)=0A=
-		goto disarm;=0A=
+		goto undo;=0A=
 =0A=
-	/*=0A=
-	 * Select the in-register phase trigger; the register also holds the OEb=
=0A=
-	 * bits.=0A=
-	 */=0A=
+	/* Select the in-register phase trigger, preserving the OEb bits. */=0A=
 	rc =3D sit9531x_read_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, &ctrl);=0A=
 	if (rc)=0A=
-		goto disarm;=0A=
+		goto undo;=0A=
 =0A=
 	orig =3D ctrl & ~SIT9531X_DIVO_PHASE_TRIG;=0A=
 	ctrl =3D orig | SIT9531X_DIVO_PHASE_SEL_REG;=0A=
+	ctrl_back =3D true;=0A=
 	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, ctrl);=0A=
 	if (rc)=0A=
-		goto restore;=0A=
+		goto undo;=0A=
 =0A=
 	/*=0A=
 	 * No delay between set and clear; one I2C transfer is longer than the=0A=
@@ -1638,40 +1725,19 @@ static int sit9531x_output_phase_flush(struct sit95=
31x_dev *sitdev, u8 pll_idx)=0A=
 	 */=0A=
 	rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1,=0A=
 			       ctrl | SIT9531X_DIVO_PHASE_TRIG);=0A=
-=0A=
-restore:=0A=
-	ret =3D sit9531x_write_u8(sitdev, SIT9531X_REG_GPIO_FUNC_CTRL1, orig);=0A=
+	fired =3D !rc;=0A=
+=0A=
+undo:=0A=
+	touched =3D parked;=0A=
+	if (armed_here && !(armed_mask & BIT(pll_idx)))=0A=
+		touched |=3D BIT(pll_idx);=0A=
+	ret =3D sit9531x_phase_flush_undo(sitdev, ctrl_back, orig, touched,=0A=
+					armed_mask);=0A=
 	if (ret && !rc)=0A=
 		rc =3D ret;=0A=
 =0A=
-disarm:=0A=
-	/*=0A=
-	 * Restore the profile's flush enable; an armed flush re-flushes every=0A=
-	 * output divider of this PLL on the next trigger.=0A=
-	 */=0A=
-	if (!(armed_mask & BIT(pll_idx))) {=0A=
-		ret =3D sit9531x_update_pll_u8(sitdev, pll_idx,=0A=
-					     SIT9531X_PLL_REG_PHFL_CTRL,=0A=
-					     SIT9531X_PLL_PHFL_ON_DEMAND_EN, 0);=0A=
-		if (!ret)=0A=
-			ret =3D sit9531x_pll_small_update(sitdev, pll_idx);=0A=
-		if (ret && !rc)=0A=
-			rc =3D ret;=0A=
-	}=0A=
-=0A=
-unpark:=0A=
-	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
-		if (!(parked & BIT(i)))=0A=
-			continue;=0A=
-		ret =3D sit9531x_update_pll_u8(sitdev, i,=0A=
-					     SIT9531X_PLL_REG_PHFL_CTRL,=0A=
-					     SIT9531X_PLL_PHFL_ON_DEMAND_EN,=0A=
-					     SIT9531X_PLL_PHFL_ON_DEMAND_EN);=0A=
-		if (!ret)=0A=
-			ret =3D sit9531x_pll_small_update(sitdev, i);=0A=
-		if (ret && !rc)=0A=
-			rc =3D ret;=0A=
-	}=0A=
+out:=0A=
+	sitdev->chan[pll_idx].flush_pending =3D !fired;=0A=
 =0A=
 	return rc;=0A=
 }=0A=
@@ -1752,7 +1818,7 @@ static int sit9531x_output_divo_write(struct sit9531x=
_dev *sitdev, u8 out_idx,=0A=
 	int rc, j, rb_rc;=0A=
 	u8 written =3D 0;=0A=
 =0A=
-	*back =3D false;=0A=
+	*back =3D true;=0A=
 =0A=
 	slot =3D info->clkout_map[out_idx];=0A=
 =0A=
@@ -1779,6 +1845,7 @@ static int sit9531x_output_divo_write(struct sit9531x=
_dev *sitdev, u8 out_idx,=0A=
 	msb_old =3D old_bytes[4];=0A=
 	divo_bytes[4] |=3D msb_old & 0xFC;=0A=
 =0A=
+	*back =3D false;=0A=
 	for (j =3D 0; j < 5; j++) {=0A=
 		rc =3D sit9531x_write_u8(sitdev,=0A=
 				       SIT9531X_REG(page, base_reg - j),=0A=
@@ -1837,12 +1904,361 @@ static int sit9531x_output_divo_read(struct sit953=
1x_dev *sitdev, u8 out_idx,=0A=
 	return *divo ? 0 : -ENODATA;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Phase adjust is a 34-bit coarse delay in VCO cycles plus a 3-bit fine d=
elay=0A=
+ * in 30 ps steps, in bytes PROG6..PROG2. PRG_RST_DELAY is unsigned, so an=
=0A=
+ * advance is written as T_out - |phase|.=0A=
+ */=0A=
+=0A=
+/* Register of byte @i (PROG6 first) of an output's PRG_RST_DELAY block. *=
/=0A=
+static unsigned int sit9531x_output_prg_reg(struct sit9531x_dev *sitdev,=
=0A=
+					    u8 out_idx, u8 i)=0A=
+{=0A=
+	u8 slot =3D sitdev->info->clkout_map[out_idx];=0A=
+	u8 page =3D (slot > SIT9531X_PAGE_OUTSYS0_SLOT_MAX) ?=0A=
+		  SIT9531X_PAGE_OUTSYS1 : SIT9531X_PAGE_OUTSYS0;=0A=
+	u8 base =3D SIT9531X_OUT_PRG_DELAY_BASE +=0A=
+		  SIT9531X_OUT_PRG_SLOT_STRIDE * (slot % 6);=0A=
+=0A=
+	return SIT9531X_REG(page, base + i);=0A=
+}=0A=
+=0A=
+static int sit9531x_output_phase_bytes_read(struct sit9531x_dev *sitdev,=
=0A=
+					    u8 out_idx, u8 *bytes)=0A=
+{=0A=
+	unsigned int reg;=0A=
+	int rc;=0A=
+	u8 i;=0A=
+=0A=
+	for (i =3D 0; i < SIT9531X_OUT_PRG_BYTES; i++) {=0A=
+		reg =3D sit9531x_output_prg_reg(sitdev, out_idx, i);=0A=
+		rc =3D sit9531x_read_u8(sitdev, reg, &bytes[i]);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * The register value includes the divider's settling cycles; a value belo=
w them=0A=
+ * means no delay.=0A=
+ */=0A=
+static void sit9531x_output_phase_bytes_decode(const u8 *bytes, u64 *coars=
e,=0A=
+					       u8 *fine)=0A=
+{=0A=
+	u64 prg_coarse;=0A=
+=0A=
+	*fine =3D (bytes[0] & SIT9531X_OUT_PRG_FINE_MASK) >>=0A=
+		SIT9531X_OUT_PRG_FINE_SHIFT;=0A=
+	prg_coarse =3D (u64)(bytes[0] & SIT9531X_OUT_PRG_COARSE_HI_MASK) << 32;=
=0A=
+	prg_coarse |=3D (u64)bytes[1] << 24;=0A=
+	prg_coarse |=3D (u64)bytes[2] << 16;=0A=
+	prg_coarse |=3D (u64)bytes[3] << 8;=0A=
+	prg_coarse |=3D bytes[4];=0A=
+	*coarse =3D (prg_coarse > SIT9531X_OUT_PRG_DIVO_CYCLES) ?=0A=
+		  prg_coarse - SIT9531X_OUT_PRG_DIVO_CYCLES : 0;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * @coarse excludes the divider's two settling cycles; the register value=
=0A=
+ * includes them.=0A=
+ */=0A=
+static void sit9531x_output_phase_bytes_build(const u8 *old_bytes, u64 coa=
rse,=0A=
+					      u8 fine, u8 *new_bytes)=0A=
+{=0A=
+	u64 prg_coarse =3D coarse + SIT9531X_OUT_PRG_DIVO_CYCLES;=0A=
+=0A=
+	/* PROG6 RMW: preserve OPSTG_VCASC_BUMP in [7:5] */=0A=
+	new_bytes[0] =3D old_bytes[0] & SIT9531X_OUT_PRG_OPSTG_MASK;=0A=
+	new_bytes[0] |=3D (fine << SIT9531X_OUT_PRG_FINE_SHIFT) &=0A=
+			SIT9531X_OUT_PRG_FINE_MASK;=0A=
+	new_bytes[0] |=3D (u8)((prg_coarse >> 32) &=0A=
+			     SIT9531X_OUT_PRG_COARSE_HI_MASK);=0A=
+	new_bytes[1] =3D (u8)((prg_coarse >> 24) & 0xFF);=0A=
+	new_bytes[2] =3D (u8)((prg_coarse >> 16) & 0xFF);=0A=
+	new_bytes[3] =3D (u8)((prg_coarse >> 8) & 0xFF);=0A=
+	new_bytes[4] =3D (u8)(prg_coarse & 0xFF);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Caller must hold the debug window open; @back reports whether every byt=
e=0A=
+ * holds its old value.=0A=
+ */=0A=
+static int sit9531x_output_phase_bytes_write(struct sit9531x_dev *sitdev,=
=0A=
+					     u8 out_idx, const u8 *new_bytes,=0A=
+					     const u8 *old_bytes, bool *back)=0A=
+{=0A=
+	int rc, ret, rb_rc =3D 0;=0A=
+	unsigned int reg;=0A=
+	u8 i;=0A=
+=0A=
+	*back =3D false;=0A=
+=0A=
+	for (i =3D 0; i < SIT9531X_OUT_PRG_BYTES; i++) {=0A=
+		reg =3D sit9531x_output_prg_reg(sitdev, out_idx, i);=0A=
+		rc =3D sit9531x_write_u8(sitdev, reg, new_bytes[i]);=0A=
+		if (rc)=0A=
+			goto rollback;=0A=
+	}=0A=
+=0A=
+	return 0;=0A=
+=0A=
+rollback:=0A=
+	for (i =3D 0; i < SIT9531X_OUT_PRG_BYTES; i++) {=0A=
+		reg =3D sit9531x_output_prg_reg(sitdev, out_idx, i);=0A=
+		ret =3D sit9531x_write_u8(sitdev, reg, old_bytes[i]);=0A=
+		if (ret && !rb_rc)=0A=
+			rb_rc =3D ret;=0A=
+	}=0A=
+	*back =3D !rb_rc;=0A=
+	if (rb_rc) {=0A=
+		dev_err(sitdev->dev,=0A=
+			"out%u: phase-adjust rollback failed (%d), the delay registers are part=
 old and part new\n",=0A=
+			out_idx, rb_rc);=0A=
+		if (!rc)=0A=
+			rc =3D rb_rc;=0A=
+	}=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Return the error of @cycles VCO cycles plus the nearest fine steps (in =
@fine)=0A=
+ * against @abs_ps.=0A=
+ */=0A=
+static u64 sit9531x_output_phase_quant_err(u64 abs_ps, u64 fvco, u64 cycle=
s,=0A=
+					   u8 *fine)=0A=
+{=0A=
+	u64 cycles_ps, steps =3D 0;=0A=
+=0A=
+	cycles_ps =3D mul_u64_u64_div_u64(cycles, 1000000000000ULL, fvco);=0A=
+	if (abs_ps > cycles_ps)=0A=
+		steps =3D div64_u64(abs_ps - cycles_ps +=0A=
+				  SIT9531X_OUT_PRG_FINE_STEP_PS / 2,=0A=
+				  SIT9531X_OUT_PRG_FINE_STEP_PS);=0A=
+	*fine =3D min_t(u64, steps, SIT9531X_OUT_PRG_FINE_MAX);=0A=
+=0A=
+	return abs_diff(abs_ps, cycles_ps +=0A=
+			(u64)*fine * SIT9531X_OUT_PRG_FINE_STEP_PS);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Fold @phase_ps into one output period and split it into VCO cycles and =
fine=0A=
+ * steps; @phase_adj gets the realized delay as the readback reports it. P=
ure=0A=
+ * arithmetic, so call it before entering the programming state.=0A=
+ */=0A=
+static int sit9531x_output_phase_encode(u64 fvco, u64 divo, s32 phase_ps,=
=0A=
+					u64 *coarse_out, u8 *fine_out,=0A=
+					s32 *phase_adj)=0A=
+{=0A=
+	u64 abs_ps, cycles, frac_ps, coarse =3D 0, coarse_ps, t_out_ps;=0A=
+	s64 phase_norm_ps =3D 0;=0A=
+	u8 fine =3D 0;=0A=
+=0A=
+	t_out_ps =3D mul_u64_u64_div_u64(divo, 1000000000000ULL, fvco);=0A=
+	if (!t_out_ps)=0A=
+		return -EINVAL;=0A=
+=0A=
+	if (!phase_ps) {=0A=
+		*coarse_out =3D 0;=0A=
+		*fine_out =3D 0;=0A=
+		*phase_adj =3D 0;=0A=
+		return 0;=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * The period is DIVO VCO cycles but often fractional in ps (7812.5 ps=0A=
+	 * at 128 MHz from 5.12 GHz), so fold whole cycles modulo DIVO and carry=
=0A=
+	 * the sub-cycle part. The DPLL core limits the request to +/-1 ms.=0A=
+	 */=0A=
+	abs_ps =3D abs(phase_ps);=0A=
+	cycles =3D mul_u64_u64_div_u64(abs_ps, fvco, 1000000000000ULL);=0A=
+	frac_ps =3D abs_ps - mul_u64_u64_div_u64(cycles, 1000000000000ULL, fvco);=
=0A=
+	div64_u64_rem(cycles, divo, &cycles);=0A=
+	abs_ps =3D mul_u64_u64_div_u64(cycles, 1000000000000ULL, fvco) + frac_ps;=
=0A=
+	/*=0A=
+	 * Truncation can leave a request within 1 ps of a whole period, which=0A=
+	 * is the same edge as no delay.=0A=
+	 */=0A=
+	if (abs_ps >=3D t_out_ps)=0A=
+		abs_ps =3D 0;=0A=
+	phase_norm_ps =3D phase_ps < 0 ? -(s64)abs_ps : (s64)abs_ps;=0A=
+	abs_ps =3D (phase_ps < 0 && abs_ps) ? t_out_ps - abs_ps : abs_ps;=0A=
+=0A=
+	if (abs_ps) {=0A=
+		u64 floor_cycles, err, alt_err, realized;=0A=
+		u8 alt_fine;=0A=
+=0A=
+		/* mul_u64_u64_div_u64(): abs_ps * fvco would overflow. */=0A=
+		floor_cycles =3D mul_u64_u64_div_u64(abs_ps, fvco,=0A=
+						   1000000000000ULL);=0A=
+=0A=
+		/*=0A=
+		 * The fine field spans 210 ps, more than one VCO cycle in every=0A=
+		 * band, so take the nearest of floor, floor + 1, and floor - 1=0A=
+		 * with a larger fine code; the floor on a tie.=0A=
+		 */=0A=
+		coarse =3D floor_cycles;=0A=
+		err =3D sit9531x_output_phase_quant_err(abs_ps, fvco, coarse,=0A=
+						      &fine);=0A=
+		alt_err =3D sit9531x_output_phase_quant_err(abs_ps, fvco,=0A=
+							  floor_cycles + 1,=0A=
+							  &alt_fine);=0A=
+		if (alt_err < err) {=0A=
+			coarse =3D floor_cycles + 1;=0A=
+			fine =3D alt_fine;=0A=
+			err =3D alt_err;=0A=
+		}=0A=
+		if (floor_cycles) {=0A=
+			u64 fewer =3D floor_cycles - 1;=0A=
+=0A=
+			alt_err =3D sit9531x_output_phase_quant_err(abs_ps, fvco,=0A=
+								  fewer,=0A=
+								  &alt_fine);=0A=
+			if (alt_err < err) {=0A=
+				coarse =3D fewer;=0A=
+				fine =3D alt_fine;=0A=
+			}=0A=
+		}=0A=
+=0A=
+		/*=0A=
+		 * Program a delay that quantizes to a whole period or more as=0A=
+		 * none, and round one past the advertised range toward the=0A=
+		 * request's side.=0A=
+		 */=0A=
+		coarse_ps =3D mul_u64_u64_div_u64(coarse, 1000000000000ULL, fvco);=0A=
+		realized =3D coarse_ps +=0A=
+			   (u64)fine * SIT9531X_OUT_PRG_FINE_STEP_PS;=0A=
+		if (realized >=3D t_out_ps) {=0A=
+			coarse =3D 0;=0A=
+			fine =3D 0;=0A=
+		} else if (phase_norm_ps < 0 ?=0A=
+			   t_out_ps - realized > SIT9531X_OUT_PHASE_ADJ_MAX_PS :=0A=
+			   realized > SIT9531X_OUT_PHASE_ADJ_MAX_PS) {=0A=
+			u64 rem;=0A=
+=0A=
+			coarse =3D floor_cycles;=0A=
+			coarse_ps =3D mul_u64_u64_div_u64(coarse,=0A=
+							1000000000000ULL, fvco);=0A=
+			rem =3D abs_ps - coarse_ps;=0A=
+			if (phase_norm_ps < 0)=0A=
+				rem +=3D SIT9531X_OUT_PRG_FINE_STEP_PS - 1;=0A=
+			fine =3D div_u64(rem, SIT9531X_OUT_PRG_FINE_STEP_PS);=0A=
+		}=0A=
+=0A=
+		if (coarse + SIT9531X_OUT_PRG_DIVO_CYCLES >=3D=0A=
+		    (1ULL << SIT9531X_OUT_PRG_COARSE_BITS))=0A=
+			return -ERANGE;=0A=
+	}=0A=
+=0A=
+	coarse_ps =3D mul_u64_u64_div_u64(coarse, 1000000000000ULL, fvco);=0A=
+	abs_ps =3D coarse_ps + (u64)fine * SIT9531X_OUT_PRG_FINE_STEP_PS;=0A=
+	/*=0A=
+	 * Report the form nearer to zero, as the readback does; it is within=0A=
+	 * the range, so it fits the s32 the ABI carries.=0A=
+	 */=0A=
+	if (abs_ps > t_out_ps - abs_ps)=0A=
+		*phase_adj =3D -(s32)(t_out_ps - abs_ps);=0A=
+	else=0A=
+		*phase_adj =3D (s32)abs_ps;=0A=
+=0A=
+	*coarse_out =3D coarse;=0A=
+	*fine_out =3D fine;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
+ * sit9531x_output_phase_read - read an output's programmed delay back=0A=
+ * @sitdev: device pointer=0A=
+ * @out_idx: logical output index=0A=
+ * @phase_ps: result in picoseconds=0A=
+ * @beyond: set when @phase_ps is outside the advertised range=0A=
+ *=0A=
+ * An advance is stored as the period minus the advance; the stored delay =
reads=0A=
+ * back in the form nearer to zero, as an advance when it is more than hal=
f the=0A=
+ * period. Caller must hold sitdev->multiop_lock.=0A=
+ *=0A=
+ * Return: 0 on success, -ENODATA for an output no PLL drives or whose Fvc=
o=0A=
+ * is unknown, <0 on other errors=0A=
+ */=0A=
+int sit9531x_output_phase_read(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
+			       s64 *phase_ps, bool *beyond)=0A=
+{=0A=
+	const struct sit9531x_chip_info *info =3D sitdev->info;=0A=
+	u8 bytes[SIT9531X_OUT_PRG_BYTES], fine;=0A=
+	u64 coarse =3D 0, fvco, ps, divo;=0A=
+	int rc;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (out_idx >=3D info->num_outputs)=0A=
+		return -EINVAL;=0A=
+=0A=
+	*beyond =3D false;=0A=
+=0A=
+	if (!sitdev->out[out_idx].routed)=0A=
+		return -ENODATA;=0A=
+=0A=
+	rc =3D sit9531x_get_fvco(sitdev, sitdev->out[out_idx].pll_idx, &fvco);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D sit9531x_output_phase_bytes_read(sitdev, out_idx, bytes);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	sit9531x_output_phase_bytes_decode(bytes, &coarse, &fine);=0A=
+=0A=
+	/*=0A=
+	 * Take the period from the divider; the cached rate is unset at probe=0A=
+	 * and whole hertz at best.=0A=
+	 */=0A=
+	rc =3D sit9531x_output_divo_read(sitdev, out_idx, &divo);=0A=
+	if (rc && rc !=3D -ENODATA)=0A=
+		return rc;=0A=
+=0A=
+	/*=0A=
+	 * Fold the cycle count, not the picoseconds; the fine steps can carry=0A=
+	 * the sum a fraction of a cycle past the period.=0A=
+	 */=0A=
+	if (!rc)=0A=
+		div64_u64_rem(coarse, divo, &coarse);=0A=
+=0A=
+	ps =3D mul_u64_u64_div_u64(coarse, 1000000000000ULL, fvco);=0A=
+	ps +=3D (u64)fine * SIT9531X_OUT_PRG_FINE_STEP_PS;=0A=
+=0A=
+	if (!rc) {=0A=
+		u64 t_out_ps =3D mul_u64_u64_div_u64(divo, 1000000000000ULL,=0A=
+						   fvco);=0A=
+=0A=
+		if (ps >=3D t_out_ps)=0A=
+			ps -=3D t_out_ps;=0A=
+		if (ps > t_out_ps - ps &&=0A=
+		    t_out_ps - ps <=3D SIT9531X_OUT_PHASE_ADJ_MAX_PS) {=0A=
+			*phase_ps =3D -(s64)(t_out_ps - ps);=0A=
+			return 0;=0A=
+		}=0A=
+	}=0A=
+	*beyond =3D ps > SIT9531X_OUT_PHASE_ADJ_MAX_PS;=0A=
+	*phase_ps =3D ps;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
 int sit9531x_output_freq_set(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
 			     u8 pll_idx, u64 frequency)=0A=
 {=0A=
-	u64 fvco, divo;=0A=
+	u8 old_bytes[SIT9531X_OUT_PRG_BYTES], new_bytes[SIT9531X_OUT_PRG_BYTES];=
=0A=
+	u64 fvco, divo, coarse, old_divo =3D 0;=0A=
+	bool retime =3D false, bytes_in =3D false, bytes_back =3D false;=0A=
+	bool divo_back =3D false, divo_in, back, landed, encoded =3D false;=0A=
+	bool beyond;=0A=
+	struct sit9531x_out *out =3D &sitdev->out[out_idx];=0A=
+	struct sit9531x_chan *chan =3D &sitdev->chan[pll_idx];=0A=
+	s32 phase_adj =3D 0, held =3D 0;=0A=
 	int rc, ret;=0A=
-	bool back;=0A=
+	u8 fine;=0A=
 =0A=
 	lockdep_assert_held(&sitdev->multiop_lock);=0A=
 =0A=
@@ -1851,28 +2267,118 @@ int sit9531x_output_freq_set(struct sit9531x_dev *=
sitdev, u8 out_idx,=0A=
 	if (rc)=0A=
 		return rc;=0A=
 =0A=
+	if (out->phase_stale && !out->retime_pending) {=0A=
+		s64 phase_ps;=0A=
+=0A=
+		rc =3D sit9531x_output_phase_read(sitdev, out_idx, &phase_ps,=0A=
+						&beyond);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+		out->phase_adj =3D phase_ps;=0A=
+		out->phase_armed =3D !beyond && phase_ps;=0A=
+		out->phase_stale =3D false;=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * The reset delay counts VCO cycles; an advance is stored as T_out -=0A=
+	 * |advance| and must be re-encoded for the new period. Write it in the=
=0A=
+	 * divider's programming window; a second flush would restart the PLL's=
=0A=
+	 * dividers.=0A=
+	 */=0A=
+	rc =3D sit9531x_output_phase_bytes_read(sitdev, out_idx, old_bytes);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	sit9531x_output_phase_bytes_decode(old_bytes, &coarse, &fine);=0A=
+	beyond =3D !out->retime_pending && !out->phase_armed && out->phase_adj;=
=0A=
+	if (out->retime_pending || out->phase_armed ||=0A=
+	    ((coarse || fine) && !beyond)) {=0A=
+		held =3D out->retime_pending ? out->retime_ps : out->phase_adj;=0A=
+=0A=
+		rc =3D sit9531x_output_phase_encode(fvco, divo, held, &coarse,=0A=
+						  &fine, &phase_adj);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+		encoded =3D true;=0A=
+		sit9531x_output_phase_bytes_build(old_bytes, coarse, fine,=0A=
+						  new_bytes);=0A=
+		retime =3D memcmp(old_bytes, new_bytes, sizeof(new_bytes)) !=3D 0;=0A=
+	}=0A=
+=0A=
+	if (retime) {=0A=
+		rc =3D sit9531x_output_divo_read(sitdev, out_idx, &old_divo);=0A=
+		if (rc && rc !=3D -ENODATA)=0A=
+			return rc;=0A=
+	}=0A=
+=0A=
 	rc =3D sit9531x_prg_enter(sitdev);=0A=
 	if (rc)=0A=
 		return rc;=0A=
 =0A=
 	rc =3D sit9531x_output_divo_write(sitdev, out_idx, divo, &back);=0A=
-	/* NVM update and loop lock */=0A=
-	ret =3D sit9531x_prg_commit(sitdev);=0A=
+	landed =3D !back;=0A=
+	divo_in =3D !rc;=0A=
+	if (!rc && retime) {=0A=
+		rc =3D sit9531x_output_phase_bytes_write(sitdev, out_idx,=0A=
+						       new_bytes, old_bytes,=0A=
+						       &bytes_back);=0A=
+		if (rc) {=0A=
+			divo_back =3D bytes_back &&=0A=
+				!sit9531x_output_divo_write(sitdev, out_idx,=0A=
+							    old_divo, &back);=0A=
+			landed =3D !divo_back;=0A=
+		} else {=0A=
+			bytes_in =3D true;=0A=
+		}=0A=
+	}=0A=
+	/* Leave PRG_CMD; the bank update only for a divider that changed */=0A=
+	ret =3D landed ? sit9531x_prg_commit(sitdev) :=0A=
+		       sit9531x_prg_relock(sitdev);=0A=
 	if (ret && !rc)=0A=
 		rc =3D ret;=0A=
-	if (rc)=0A=
+	if (rc) {=0A=
+		if (bytes_in || (encoded && !retime && divo_in)) {=0A=
+			out->phase_adj =3D phase_adj;=0A=
+			out->phase_armed =3D phase_adj !=3D 0;=0A=
+			out->phase_stale =3D false;=0A=
+			out->retime_pending =3D false;=0A=
+		} else if (retime && landed) {=0A=
+			out->retime_ps =3D held;=0A=
+			out->retime_pending =3D true;=0A=
+			out->phase_stale =3D true;=0A=
+		} else if (encoded && landed) {=0A=
+			out->phase_stale =3D true;=0A=
+		} else if (beyond && landed) {=0A=
+			out->phase_stale =3D true;=0A=
+		}=0A=
+		if (landed)=0A=
+			chan->flush_pending =3D true;=0A=
 		return rc;=0A=
+	}=0A=
 =0A=
-	/* Flush the output phase so the new DIVO starts aligned */=0A=
 	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);=0A=
-	if (rc) {=0A=
+	if (chan->flush_pending)=0A=
 		dev_warn(sitdev->dev,=0A=
-			 "out%u: rate changed but the divider phase was not realigned (%d)\n",=
=0A=
+			 "out%u: rate changed but the divider phase was not realigned (%d), the=
 poll retries it\n",=0A=
 			 out_idx, rc);=0A=
-		rc =3D 0;=0A=
+	else if (rc)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "out%u: rate changed, the flush left something to put back (%d)\n",=0A=
+			 out_idx, rc);=0A=
+	if (encoded) {=0A=
+		out->phase_adj =3D phase_adj;=0A=
+		out->phase_armed =3D phase_adj !=3D 0;=0A=
+		out->phase_stale =3D false;=0A=
 	}=0A=
 =0A=
-	sitdev->out[out_idx].freq =3D div64_u64(fvco, divo);=0A=
+	/*=0A=
+	 * A delay beyond the range was not re-timed and now decodes against the=
=0A=
+	 * new divider.=0A=
+	 */=0A=
+	if (beyond)=0A=
+		out->phase_stale =3D true;=0A=
+=0A=
+	out->freq =3D div64_u64(fvco, divo);=0A=
+	out->retime_pending =3D false;=0A=
 =0A=
 	return 0;=0A=
 }=0A=
@@ -1915,20 +2421,138 @@ int sit9531x_output_freq_get(struct sit9531x_dev *=
sitdev, u8 out_idx,=0A=
 	return 0;=0A=
 }=0A=
 =0A=
-/*=0A=
- * Phase adjust: per-output 34-bit coarse delay in VCO periods plus a 3-bi=
t=0A=
- * fine delay in 30 ps steps, in PROG6..PROG2:=0A=
- *   base + 0  PROG6  [7:5] OPSTG_VCASC_BUMP (preserved)=0A=
- *                    [4:2] PRG_RST_FINE_DELAY=0A=
- *                    [1:0] PRG_RST_DELAY[33:32]=0A=
- *   base + 1  PROG5  PRG_RST_DELAY[31:24]=0A=
- *   base + 2  PROG4  PRG_RST_DELAY[23:16]=0A=
- *   base + 3  PROG3  PRG_RST_DELAY[15:8]=0A=
- *   base + 4  PROG2  PRG_RST_DELAY[7:0]=0A=
- * Outputs 0-5 are on Page 3, 6-11 on Page 4; base =3D 0x15 + 16 * (out_id=
x % 6).=0A=
- * PRG_RST_DELAY is unsigned; a negative adjustment is wrapped to=0A=
- * (T_out - |phase|) modulo one output period.=0A=
- */=0A=
+int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,=0A=
+				     u8 out_idx, s32 phase_ps)=0A=
+{=0A=
+	u8 old_bytes[SIT9531X_OUT_PRG_BYTES], new_bytes[SIT9531X_OUT_PRG_BYTES];=
=0A=
+	const struct sit9531x_chip_info *info =3D sitdev->info;=0A=
+	bool bytes_back, bytes_in, same;=0A=
+	struct sit9531x_chan *chan;=0A=
+	struct sit9531x_out *out;=0A=
+	u64 fvco, divo, coarse;=0A=
+	u8 pll_idx, fine;=0A=
+	s32 phase_adj;=0A=
+	int rc;=0A=
+=0A=
+	lockdep_assert_held(&sitdev->multiop_lock);=0A=
+=0A=
+	if (out_idx >=3D info->num_outputs)=0A=
+		return -EINVAL;=0A=
+=0A=
+	/* An unrouted output has only a placeholder in pll_idx. */=0A=
+	if (!sitdev->out[out_idx].routed)=0A=
+		return -ENODEV;=0A=
+=0A=
+	out =3D &sitdev->out[out_idx];=0A=
+	pll_idx =3D out->pll_idx;=0A=
+	if (pll_idx >=3D SIT9531X_NUM_PLLS)=0A=
+		return -EINVAL;=0A=
+	chan =3D &sitdev->chan[pll_idx];=0A=
+=0A=
+	rc =3D sit9531x_get_fvco(sitdev, pll_idx, &fvco);=0A=
+	if (rc)=0A=
+		return rc =3D=3D -ENODATA ? -ENODEV : rc;=0A=
+=0A=
+	/* Fref * DIVN outside the VCO band is not the rate the PLL runs at. */=
=0A=
+	if (!sit9531x_fvco_in_band(pll_idx, fvco)) {=0A=
+		dev_dbg(sitdev->dev,=0A=
+			"out%u: PLL%c Fvco %llu Hz is outside its VCO band, delay not settable\=
n",=0A=
+			out_idx, 'A' + pll_idx, fvco);=0A=
+		return -EINVAL;=0A=
+	}=0A=
+=0A=
+	/* Take the period from the divider; the cached rate is whole hertz. */=
=0A=
+	rc =3D sit9531x_output_divo_read(sitdev, out_idx, &divo);=0A=
+	if (rc)=0A=
+		return rc =3D=3D -ENODATA ? -ENODEV : rc;=0A=
+=0A=
+	rc =3D sit9531x_output_phase_encode(fvco, divo, phase_ps, &coarse, &fine,=
=0A=
+					  &phase_adj);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	rc =3D sit9531x_output_phase_bytes_read(sitdev, out_idx, old_bytes);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	sit9531x_output_phase_bytes_build(old_bytes, coarse, fine, new_bytes);=0A=
+=0A=
+	/*=0A=
+	 * Skip the write if the quantized bytes are unchanged; a rewrite=0A=
+	 * restarts the divider phase of every output on the PLL.=0A=
+	 */=0A=
+	same =3D !memcmp(old_bytes, new_bytes, sizeof(new_bytes)) &&=0A=
+	       !out->phase_stale;=0A=
+	if (same && !chan->flush_pending) {=0A=
+		rc =3D 0;=0A=
+		goto cache;=0A=
+	}=0A=
+=0A=
+	if (!same) {=0A=
+		/*=0A=
+		 * The delay bytes take effect on a small-change update, as in=0A=
+		 * Dely_program_output.py; only a divider rewrite needs the=0A=
+		 * programming state.=0A=
+		 */=0A=
+		rc =3D sit9531x_outsys_debug_open(sitdev);=0A=
+		if (rc)=0A=
+			return rc;=0A=
+=0A=
+		rc =3D sit9531x_output_phase_bytes_write(sitdev, out_idx,=0A=
+						       new_bytes, old_bytes,=0A=
+						       &bytes_back);=0A=
+		bytes_in =3D !rc;=0A=
+		if (!rc)=0A=
+			rc =3D sit9531x_write_u8(sitdev, SIT9531X_REG_PRG_DIR_GEN,=0A=
+					       SIT9531X_SMALL_UPDATE_CMD);=0A=
+		sit9531x_outsys_debug_close(sitdev);=0A=
+		if (rc) {=0A=
+			if (bytes_in) {=0A=
+				out->phase_stale =3D true;=0A=
+				out->retime_ps =3D phase_ps;=0A=
+				out->retime_pending =3D true;=0A=
+			} else if (!bytes_back) {=0A=
+				out->phase_stale =3D true;=0A=
+				chan->flush_pending =3D true;=0A=
+			}=0A=
+			return rc;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/* A flush pulse into open loops can be lost when they re-lock */=0A=
+	if (sitdev->loops_open) {=0A=
+		rc =3D sit9531x_prg_relock(sitdev);=0A=
+		if (rc) {=0A=
+			chan->flush_pending =3D true;=0A=
+			goto cache;=0A=
+		}=0A=
+	}=0A=
+=0A=
+	/*=0A=
+	 * Restart the divider phase so the delay applies against a known edge.=
=0A=
+	 */=0A=
+	rc =3D sit9531x_output_phase_flush(sitdev, pll_idx);=0A=
+=0A=
+cache:=0A=
+	/* Cache what the registers hold */=0A=
+	out->phase_adj =3D phase_adj;=0A=
+	out->phase_stale =3D false;=0A=
+	out->retime_pending =3D false;=0A=
+=0A=
+	/*=0A=
+	 * A delay that quantized to zero needs no re-time: the quantum is the=0A=
+	 * VCO cycle, not the output period.=0A=
+	 */=0A=
+	out->phase_armed =3D phase_adj !=3D 0;=0A=
+=0A=
+	if (chan->flush_pending)=0A=
+		return rc;=0A=
+	if (rc)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "out%u: delay applied, the flush left something to put back (%d)\n",=
=0A=
+			 out_idx, rc);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
 =0A=
 /*=0A=
  * Clear the write-1-to-clear notification registers on page 0 and the clo=
ck=0A=
@@ -2428,6 +3052,9 @@ static int sit9531x_dev_state_fetch(struct sit9531x_d=
ev *sitdev)=0A=
 	}=0A=
 =0A=
 	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
+		bool beyond;=0A=
+		s64 phase_ps;=0A=
+=0A=
 		mutex_lock(&sitdev->multiop_lock);=0A=
 		rc =3D sit9531x_out_state_fetch(sitdev, i);=0A=
 		mutex_unlock(&sitdev->multiop_lock);=0A=
@@ -2436,6 +3063,23 @@ static int sit9531x_dev_state_fetch(struct sit9531x_=
dev *sitdev)=0A=
 				"Failed to fetch output %u state: %d\n", i, rc);=0A=
 			return rc;=0A=
 		}=0A=
+=0A=
+		/*=0A=
+		 * The profile can set a delay; read it so a request of 0 ps can=0A=
+		 * clear it.=0A=
+		 */=0A=
+		mutex_lock(&sitdev->multiop_lock);=0A=
+		rc =3D sit9531x_output_phase_read(sitdev, i, &phase_ps, &beyond);=0A=
+		mutex_unlock(&sitdev->multiop_lock);=0A=
+		if (!rc) {=0A=
+			sitdev->out[i].phase_adj =3D phase_ps;=0A=
+			sitdev->out[i].phase_armed =3D !beyond && phase_ps;=0A=
+		} else if (rc !=3D -ENODATA) {=0A=
+			dev_err(sitdev->dev,=0A=
+				"Failed to read output %u delay: %d\n",=0A=
+				i, rc);=0A=
+			return rc;=0A=
+		}=0A=
 	}=0A=
 =0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
@@ -2559,6 +3203,25 @@ static void sit9531x_ho_release_retry(struct sit9531=
x_dev *sitdev, u8 pll_idx)=0A=
 		 'A' + pll_idx);=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Re-time the output delay after a failed rate change. Caller must hold=
=0A=
+ * sitdev->multiop_lock.=0A=
+ */=0A=
+static void sit9531x_retime_retry(struct sit9531x_dev *sitdev, u8 out_idx)=
=0A=
+{=0A=
+	struct sit9531x_out *out =3D &sitdev->out[out_idx];=0A=
+	s64 was;=0A=
+=0A=
+	if (!out->retime_pending)=0A=
+		return;=0A=
+=0A=
+	was =3D out->phase_adj;=0A=
+	if (!sit9531x_output_phase_adjust_set(sitdev, out_idx, out->retime_ps))=
=0A=
+		dev_info(sitdev->dev, "out%u: delay re-timed\n", out_idx);=0A=
+	if (out->phase_adj !=3D was || out->phase_stale)=0A=
+		out->ntf_pending =3D true;=0A=
+}=0A=
+=0A=
 /*=0A=
  * Write back the priority table after a failed write. Caller must hold=0A=
  * sitdev->multiop_lock.=0A=
@@ -2629,6 +3292,18 @@ static void sit9531x_reselect(struct sit9531x_dev *s=
itdev, u8 pll_idx)=0A=
 		 'A' + pll_idx);=0A=
 }=0A=
 =0A=
+/* Run a pending output-divider flush. Caller must hold sitdev->multiop_lo=
ck. */=0A=
+static void sit9531x_flush_retry(struct sit9531x_dev *sitdev, u8 pll_idx)=
=0A=
+{=0A=
+	if (!sitdev->chan[pll_idx].flush_pending)=0A=
+		return;=0A=
+=0A=
+	sit9531x_output_phase_flush(sitdev, pll_idx);=0A=
+	if (!sitdev->chan[pll_idx].flush_pending)=0A=
+		dev_info(sitdev->dev, "PLL%c: output dividers realigned\n",=0A=
+			 'A' + pll_idx);=0A=
+}=0A=
+=0A=
 /*=0A=
  * Retry pending writes, then read each PLL's state; return true if any st=
ate=0A=
  * read succeeds.=0A=
@@ -2644,11 +3319,20 @@ sit9531x_dev_chan_states_update(struct sit9531x_dev=
 *sitdev)=0A=
 		sit9531x_prg_relock(sitdev);=0A=
 	else if (sitdev->outsys_key_pending)=0A=
 		sit9531x_outsys_debug_close(sitdev);=0A=
+	sit9531x_phase_flush_undo_retry(sitdev);=0A=
+	for (i =3D 0; i < sitdev->info->num_outputs; i++)=0A=
+		sit9531x_retime_retry(sitdev, i);=0A=
 =0A=
 	sit9531x_input_off_retry(sitdev);=0A=
 	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
 		sit9531x_table_back_retry(sitdev, i);=0A=
 		sit9531x_ho_release_retry(sitdev, i);=0A=
+		/*=0A=
+		 * A flush pulse sent into open loops may be lost when they=0A=
+		 * re-lock.=0A=
+		 */=0A=
+		if (!sitdev->loops_open)=0A=
+			sit9531x_flush_retry(sitdev, i);=0A=
 		rc =3D sit9531x_chan_state_fetch(sitdev, i);=0A=
 		if (rc) {=0A=
 			sitdev->chan[i].stale =3D true;=0A=
@@ -2966,8 +3650,13 @@ static void sit9531x_dev_stop(struct sit9531x_dev *s=
itdev)=0A=
 			dev_warn(sitdev->dev,=0A=
 				 "PLL%c left in forced holdover\n", 'A' + i);=0A=
 	}=0A=
+=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
 =0A=
+	/*=0A=
+	 * Lock the loops first: a re-time ends in a flush, and a flush pulse=0A=
+	 * into open loops can be lost. The undo runs after every flush.=0A=
+	 */=0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	if (sitdev->loops_open) {=0A=
 		sit9531x_prg_relock(sitdev);=0A=
@@ -2977,6 +3666,32 @@ static void sit9531x_dev_stop(struct sit9531x_dev *s=
itdev)=0A=
 	} else if (sitdev->outsys_key_pending) {=0A=
 		sit9531x_outsys_debug_close(sitdev);=0A=
 	}=0A=
+	for (i =3D 0; i < sitdev->info->num_outputs; i++) {=0A=
+		sit9531x_retime_retry(sitdev, i);=0A=
+		if (sitdev->out[i].retime_pending)=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "out%u: delay left not re-timed to its rate\n",=0A=
+				 i);=0A=
+	}=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
+		if (!sitdev->loops_open)=0A=
+			sit9531x_flush_retry(sitdev, i);=0A=
+		if (sitdev->chan[i].flush_pending)=0A=
+			dev_warn(sitdev->dev,=0A=
+				 "PLL%c: output dividers left unaligned\n",=0A=
+				 'A' + i);=0A=
+	}=0A=
+	sit9531x_phase_flush_undo_retry(sitdev);=0A=
+	if (sitdev->flush_ctrl_pending)=0A=
+		dev_warn(sitdev->dev,=0A=
+			 "phase flush trigger source select not put back\n");=0A=
+	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {=0A=
+		if (!(sitdev->flush_arm_pending & BIT(i)))=0A=
+			continue;=0A=
+		dev_warn(sitdev->dev, "PLL%c: on-demand phase flush left %s\n",=0A=
+			 'A' + i,=0A=
+			 (sitdev->flush_armed & BIT(i)) ? "parked" : "armed");=0A=
+	}=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
 }=0A=
 =0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
index 17b41c4ca692..97d44c60a65a 100644=0A=
--- a/drivers/dpll/sit9531x/core.h=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -27,6 +27,8 @@=0A=
 #define SIT9531X_MAX_INPUTS		8=0A=
 #define SIT9531X_NUM_INPUT_PAIRS	(SIT9531X_MAX_INPUTS / 2)=0A=
 #define SIT9531X_MAX_OUTPUTS		12=0A=
+/* Output phase-adjust range advertised to the core, +/-1 ms in ps */=0A=
+#define SIT9531X_OUT_PHASE_ADJ_MAX_PS	1000000000=0A=
 /*=0A=
  * INTSYNC, the inter-PLL sync line, is two pins: an input pin on the PLL =
that=0A=
  * locks to it, numbered after the inputs and the xtal, and an output pin =
on the=0A=
@@ -111,6 +113,13 @@ struct sit9531x_ref {=0A=
  * @routed: mapped to @pll_idx by the initial configuration; an unrouted=
=0A=
  *   output has no pin=0A=
  * @pll_idx: PLL driving this output (0-3)=0A=
+ * @phase_stale: programmed delay may differ from @phase_adj=0A=
+ * @phase_armed: non-zero in-range delay programmed; a rate change re-time=
s it=0A=
+ * @phase_adj: realized delay in whole VCO cycles plus 30 ps steps, in the=
=0A=
+ *   form nearer to zero; an out-of-range profile delay is held as the=0A=
+ *   positive decode=0A=
+ * @retime_pending: re-timed delay not yet applied; the poll applies @reti=
me_ps=0A=
+ * @retime_ps: delay to apply while @retime_pending=0A=
  */=0A=
 struct sit9531x_out {=0A=
 	u64		freq;=0A=
@@ -122,6 +131,11 @@ struct sit9531x_out {=0A=
 	u8		hiz_keep;=0A=
 	bool		routed;=0A=
 	u8		pll_idx;=0A=
+	s64		phase_adj;=0A=
+	bool		phase_armed;=0A=
+	bool		phase_stale;=0A=
+	bool		retime_pending;=0A=
+	s32		retime_ps;=0A=
 };=0A=
 =0A=
 /*=0A=
@@ -148,6 +162,8 @@ struct sit9531x_out {=0A=
  *   rewrites the table=0A=
  * @reselect_armed: no poll since probe or resume; the first poll rewrites=
=0A=
  *   the table of a PLL in holdover while a listed source has signal=0A=
+ * @flush_pending: output divider realignment flush not yet triggered afte=
r=0A=
+ *   a rate or delay commit=0A=
  * @table_pending: priority table partly written or not latched; the PLL=
=0A=
  *   stays in forced holdover=0A=
  * @table_back: table reported and to be rewritten while @table_pending=0A=
@@ -176,6 +192,7 @@ struct sit9531x_chan {=0A=
 	bool		ho_release_pending;=0A=
 	u8		live_top;=0A=
 	bool		reselect_armed;=0A=
+	bool		flush_pending;=0A=
 	bool		table_pending;=0A=
 	u8		table_back[SIT9531X_PRIO_MAX_SLOTS];=0A=
 	u8		prio_srcs[SIT9531X_PRIO_MAX_SLOTS];=0A=
@@ -215,6 +232,10 @@ struct sit9531x_chan {=0A=
  *   band; written under @multiop_lock=0A=
  * @loops_open: output loops not yet re-locked=0A=
  * @outsys_key_pending: output-system debug key not closed=0A=
+ * @flush_ctrl_pending: @flush_ctrl still to be written back=0A=
+ * @flush_ctrl: trigger register value to restore=0A=
+ * @flush_arm_pending: bit per PLL whose flush enable is still to be resto=
red=0A=
+ * @flush_armed: of those, the PLLs the profile arms=0A=
  */=0A=
 struct sit9531x_dev {=0A=
 	struct device			*dev;=0A=
@@ -247,6 +268,10 @@ struct sit9531x_dev {=0A=
 =0A=
 	bool			loops_open;=0A=
 	bool			outsys_key_pending;=0A=
+	bool			flush_ctrl_pending;=0A=
+	u8			flush_ctrl;=0A=
+	u8			flush_arm_pending;=0A=
+	u8			flush_armed;=0A=
 };=0A=
 =0A=
 int sit9531x_read_u8(struct sit9531x_dev *sitdev, unsigned int reg,=0A=
@@ -284,6 +309,11 @@ int sit9531x_output_freq_set(struct sit9531x_dev *sitd=
ev, u8 out_idx,=0A=
 int sit9531x_output_freq_get(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
 			     u64 *frequency);=0A=
 =0A=
+int sit9531x_output_phase_read(struct sit9531x_dev *sitdev, u8 out_idx,=0A=
+			       s64 *phase_ps, bool *beyond);=0A=
+int sit9531x_output_phase_adjust_set(struct sit9531x_dev *sitdev,=0A=
+				     u8 out_idx, s32 phase_ps);=0A=
+=0A=
 static inline u8 sit9531x_pll_page(u8 pll_idx)=0A=
 {=0A=
 	return SIT9531X_PAGE_PLLA + pll_idx;=0A=
diff --git a/drivers/dpll/sit9531x/dpll.c b/drivers/dpll/sit9531x/dpll.c=0A=
index e19eb123d024..8589019b4b43 100644=0A=
--- a/drivers/dpll/sit9531x/dpll.c=0A=
+++ b/drivers/dpll/sit9531x/dpll.c=0A=
@@ -611,6 +611,7 @@ sit9531x_dpll_output_pin_frequency_set(const struct dpl=
l_pin *pin,=0A=
 	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
 	bool moved =3D false;=0A=
 	u64 was, hz;=0A=
+	s64 phase_was;=0A=
 	u8 actual_pll;=0A=
 	int rc;=0A=
 =0A=
@@ -618,10 +619,15 @@ sit9531x_dpll_output_pin_frequency_set(const struct d=
pll_pin *pin,=0A=
 =0A=
 	mutex_lock(&sitdev->multiop_lock);=0A=
 	was =3D sitdev->out[dpin->id].freq;=0A=
+	phase_was =3D sitdev->out[dpin->id].phase_adj;=0A=
 	rc =3D sit9531x_output_freq_set(sitdev, dpin->id, actual_pll,=0A=
 				      frequency);=0A=
 	if (rc) {=0A=
-		if (!sit9531x_output_freq_get(sitdev, dpin->id, &hz))=0A=
+		moved =3D sitdev->out[dpin->id].phase_stale ||=0A=
+			sitdev->out[dpin->id].phase_adj !=3D phase_was;=0A=
+		if (sit9531x_output_freq_get(sitdev, dpin->id, &hz))=0A=
+			moved =3D true;=0A=
+		else=0A=
 			moved |=3D hz !=3D was;=0A=
 	}=0A=
 	mutex_unlock(&sitdev->multiop_lock);=0A=
@@ -632,8 +638,11 @@ sit9531x_dpll_output_pin_frequency_set(const struct dp=
ll_pin *pin,=0A=
 		NL_SET_ERR_MSG(extack, "Output frequency set failed");=0A=
 		/* The core notifies only a request that succeeded */=0A=
 		dpll_pin =3D READ_ONCE(dpin->dpll_pin);=0A=
-		if (moved && dpll_pin)=0A=
-			__dpll_pin_change_ntf(dpll_pin);=0A=
+		if (moved && dpll_pin && __dpll_pin_change_ntf(dpll_pin)) {=0A=
+			mutex_lock(&sitdev->multiop_lock);=0A=
+			sitdev->out[dpin->id].ntf_pending =3D true;=0A=
+			mutex_unlock(&sitdev->multiop_lock);=0A=
+		}=0A=
 	}=0A=
 =0A=
 	return rc;=0A=
@@ -740,12 +749,105 @@ sit9531x_dpll_output_pin_state_on_dpll_set(const str=
uct dpll_pin *pin,=0A=
 	return rc;=0A=
 }=0A=
 =0A=
+/*=0A=
+ * Report the delay as programmed after quantization, including one whose =
flush=0A=
+ * is pending.=0A=
+ */=0A=
+static int=0A=
+sit9531x_dpll_output_pin_phase_adjust_get(const struct dpll_pin *pin,=0A=
+					  void *pin_priv,=0A=
+					  const struct dpll_device *dpll,=0A=
+					  void *dpll_priv, s32 *phase_adjust,=0A=
+					  struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	s64 phase_adj;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	/* Bytes waiting for a re-time are for the old rate */=0A=
+	if (sitdev->out[dpin->id].phase_stale &&=0A=
+	    !sitdev->out[dpin->id].retime_pending) {=0A=
+		bool beyond;=0A=
+		s64 phase_ps;=0A=
+=0A=
+		rc =3D sit9531x_output_phase_read(sitdev, dpin->id, &phase_ps,=0A=
+						&beyond);=0A=
+		if (rc) {=0A=
+			mutex_unlock(&sitdev->multiop_lock);=0A=
+			if (rc !=3D -ENODATA)=0A=
+				NL_SET_ERR_MSG(extack,=0A=
+					       "Output delay could not be read back");=0A=
+			return rc;=0A=
+		}=0A=
+		sitdev->out[dpin->id].phase_adj =3D phase_ps;=0A=
+		sitdev->out[dpin->id].phase_armed =3D !beyond && phase_ps;=0A=
+		sitdev->out[dpin->id].phase_stale =3D false;=0A=
+	}=0A=
+	phase_adj =3D sit9531x_out_state_get(sitdev, dpin->id)->phase_adj;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	/*=0A=
+	 * A profile delay on a slow output can exceed the s32 attribute; leave=
=0A=
+	 * it out.=0A=
+	 */=0A=
+	if (phase_adj > S32_MAX)=0A=
+		return -ENODATA;=0A=
+	*phase_adjust =3D phase_adj;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* Program the per-output PRG_RST_DELAY registers */=0A=
+static int=0A=
+sit9531x_dpll_output_pin_phase_adjust_set(const struct dpll_pin *pin,=0A=
+					  void *pin_priv,=0A=
+					  const struct dpll_device *dpll,=0A=
+					  void *dpll_priv, s32 phase_adjust,=0A=
+					  struct netlink_ext_ack *extack)=0A=
+{=0A=
+	struct sit9531x_dpll_pin *dpin =3D pin_priv;=0A=
+	struct sit9531x_dpll *sitdpll =3D dpll_priv;=0A=
+	struct sit9531x_dev *sitdev =3D sitdpll->dev;=0A=
+	const struct sit9531x_out *out;=0A=
+	bool moved;=0A=
+	s64 was;=0A=
+	int rc;=0A=
+=0A=
+	out =3D sit9531x_out_state_get(sitdev, dpin->id);=0A=
+=0A=
+	mutex_lock(&sitdev->multiop_lock);=0A=
+	was =3D out->phase_adj;=0A=
+	rc =3D sit9531x_output_phase_adjust_set(sitdev, dpin->id, phase_adjust);=
=0A=
+	moved =3D out->phase_adj !=3D was || out->phase_stale;=0A=
+	mutex_unlock(&sitdev->multiop_lock);=0A=
+=0A=
+	if (rc) {=0A=
+		struct dpll_pin *dpll_pin;=0A=
+=0A=
+		NL_SET_ERR_MSG(extack, "Phase adjust failed");=0A=
+		/* The core notifies only a request that succeeded */=0A=
+		dpll_pin =3D READ_ONCE(dpin->dpll_pin);=0A=
+		if (moved && dpll_pin && __dpll_pin_change_ntf(dpll_pin)) {=0A=
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
 	.state_on_dpll_get	=3D sit9531x_dpll_output_pin_state_on_dpll_get,=0A=
 	.state_on_dpll_set	=3D sit9531x_dpll_output_pin_state_on_dpll_set,=0A=
+	.phase_adjust_get	=3D sit9531x_dpll_output_pin_phase_adjust_get,=0A=
+	.phase_adjust_set	=3D sit9531x_dpll_output_pin_phase_adjust_set,=0A=
 };=0A=
 =0A=
 const struct dpll_pin_ops *=0A=
@@ -828,6 +930,17 @@ sit9531x_dpll_output_ntf_pending(struct sit9531x_dev *=
sitdev,=0A=
 		return false;=0A=
 	if (out->state_stale && sit9531x_output_state_refresh(sitdev, pin->id))=
=0A=
 		return false;=0A=
+	if (out->phase_stale && !out->retime_pending) {=0A=
+		bool beyond;=0A=
+		s64 phase_ps;=0A=
+=0A=
+		if (sit9531x_output_phase_read(sitdev, pin->id, &phase_ps,=0A=
+					       &beyond))=0A=
+			return false;=0A=
+		out->phase_adj =3D phase_ps;=0A=
+		out->phase_armed =3D !beyond && phase_ps;=0A=
+		out->phase_stale =3D false;=0A=
+	}=0A=
 =0A=
 	out->ntf_pending =3D false;=0A=
 =0A=
diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c=0A=
index 85b446a4b38f..b9bd62ed473e 100644=0A=
--- a/drivers/dpll/sit9531x/prop.c=0A=
+++ b/drivers/dpll/sit9531x/prop.c=0A=
@@ -170,6 +170,20 @@ sit9531x_pin_props_get(struct sit9531x_dev *sitdev,=0A=
 		props->dpll_props.capabilities =3D=0A=
 			DPLL_PIN_CAPABILITIES_STATE_CAN_CHANGE;=0A=
 		curr_freq =3D 0;=0A=
+=0A=
+		/*=0A=
+		 * The part takes a delay anywhere within the output period;=0A=
+		 * +/-1 ms is a round figure within the s32 ps attribute.=0A=
+		 */=0A=
+		props->dpll_props.phase_range.min =3D=0A=
+			-SIT9531X_OUT_PHASE_ADJ_MAX_PS;=0A=
+		props->dpll_props.phase_range.max =3D=0A=
+			SIT9531X_OUT_PHASE_ADJ_MAX_PS;=0A=
+		/*=0A=
+		 * The 30 ps fine step is not advertised; requests are rounded=0A=
+		 * to the nearest achievable delay.=0A=
+		 */=0A=
+		props->dpll_props.phase_gran =3D 1;=0A=
 	}=0A=
 =0A=
 	sit9531x_prop_pin_package_label_set(sitdev, props, dir, index);=0A=
diff --git a/drivers/dpll/sit9531x/regs.h b/drivers/dpll/sit9531x/regs.h=0A=
index 39ae3366de08..c47720548f98 100644=0A=
--- a/drivers/dpll/sit9531x/regs.h=0A=
+++ b/drivers/dpll/sit9531x/regs.h=0A=
@@ -158,6 +158,35 @@=0A=
 #define SIT9531X_DEBUG_UNLOCK_VAL		0xC3=0A=
 #define SIT9531X_DEBUG_LOCK_VAL			0x00=0A=
 =0A=
+/*=0A=
+ * Per-output phase delay: 34-bit coarse in VCO cycles plus a 3-bit fine=
=0A=
+ * field in 30 ps steps, in a five-byte block PROG6..PROG2:=0A=
+ *=0A=
+ *   base + 0     PROG6  [7:5] OPSTG_VCASC_BUMP (preserve)=0A=
+ *                       [4:2] PRG_RST_FINE_DELAY[2:0]=0A=
+ *                       [1:0] PRG_RST_DELAY[33:32]=0A=
+ *   base + 1..4  PROG5..PROG2  PRG_RST_DELAY[31:0], MSB first=0A=
+ *=0A=
+ * Block base is 0x15 + 16 * (slot % 6), slot from clkout_map[]; slots 0-5=
=0A=
+ * on page 3, 6-11 on page 4.=0A=
+ */=0A=
+#define SIT9531X_OUT_PRG_DELAY_BASE		0x15=0A=
+#define SIT9531X_OUT_PRG_SLOT_STRIDE		0x10=0A=
+#define SIT9531X_OUT_PRG_BYTES			5=0A=
+#define SIT9531X_OUT_PRG_OPSTG_MASK		0xE0=0A=
+#define SIT9531X_OUT_PRG_FINE_SHIFT		2=0A=
+#define SIT9531X_OUT_PRG_FINE_MASK		0x1C	/* bits [4:2] */=0A=
+#define SIT9531X_OUT_PRG_COARSE_HI_MASK		0x03	/* bits [1:0] */=0A=
+/*=0A=
+ * The divider takes two VCO cycles to act on a programmed delay; the enco=
ded=0A=
+ * value includes them, as in the reference flow.=0A=
+ */=0A=
+#define SIT9531X_OUT_PRG_DIVO_CYCLES	2=0A=
+=0A=
+#define SIT9531X_OUT_PRG_FINE_STEP_PS		30=0A=
+#define SIT9531X_OUT_PRG_FINE_MAX		7	/* 3-bit field */=0A=
+#define SIT9531X_OUT_PRG_COARSE_BITS		34=0A=
+=0A=
 /*=0A=
  * Register-triggered phase flush: DIVO_PHASE_SEL_REG selects the register=
=0A=
  * trigger; pulsing DIVO_PHASE_TRIG high then low flushes. Preserve the OE=
b=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
