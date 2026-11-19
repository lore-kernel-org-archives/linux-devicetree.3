Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129080;
	b=4zgIDvfSUw2A1eRMCAXUiyCxC/VxjfHi5S1Di5dF1ycUNLEuiW1ASppbxFgpBpIpSshI
	 /jFL1hU98OvoZOh6vqkwqixdkpsKPvGrftms8xS0gPmdjHTOymcPvGTwwcONh40g1MQU+
	 Pmqjvuy08H8E36MLnE6AGp+MqHU/NZ5TGxWM/xDKAPjbIifzLZ5fAcKrlSPNnSrLlAxdC
	 Zf/cNv5NXeJal1x0xYbwzTvXspFtgFDh5s/JO+zyf7VqU15pqIoY8OVkQ98J88Wkr4H+1
	 lmkY8m14mWyj65s0hDwzyNXrAl1rEOEm8kjMcd4d2YEHuQ5S+QRifohxl3gLlP0qdfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129080;
	h=DMARC-Filter:DKIM-Signature:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
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
	bh=grQpY9gYJSuvjZ0LHPwZQKU5EosMltPZYQ2x7AvvaSI=;
	b=GyPZ4CeHmE3UUcLAo5zjzE6Y0Va8l6Y3ucHCSj0sM/Asd3nYxgRhpYogFevURwddOkCT
	 7XzgpVwDnkYI/lvXAF85g2CSgMwxAim594WPV+Z53V3NDw35SjGpuw0Fn9ZJswNYonxxr
	 yPtcPDAMkfJXiTJm1VrtzujUb1yKhBbidBgGLgiwo10p78qfMkQYyFokbYl5/C9njLFt0
	 F/dL27hAxVTNk9OPOjn1GMBI7rSUoBwnPTS/pN4nZ/YX6E2PKGxJZgx24Yub7AsFep6us
	 GyljSAK07xztmyR1E38TCJCYzkvTeuh3FyLcRf4RnedhTMVgliztQua1l6yLWsXvE9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=frdpgHHB;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=kyfyjAxk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC020606A32A;
	Thu, 19 Nov 2026 22:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC020606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=frdpgHHB;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=kyfyjAxk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:message-id:message-id:mime-version:mime-version:subject:subject:to:to;
 s=mail; bh=grQpY9gYJSuvjZ0LHPwZQKU5EosMltPZYQ2x7AvvaSI=;
 b=frdpgHHBj/3g3rNvUiio9OW3AU40c2t76fJPqtpZ7xCxM/Bix+TWRxBKbd+H751J41XJy0JKtaUFLtLAr5ee7rgGLPs3lEXOxCwTo/aEP4C9AFlzKFusdTlo+kETUZhjm9E6j/qn9gd7ehdGhD9pLsp7fc4bQk/0dVKdHI3/+cihIrNiSCL5tg5FSycFvNWgvCnEf+9XbtLiNc5A67CgRj0TbApwKfMhag/h2SB71RWYuro/mn4keihC0SCrDWRdiQ62rhUAKa4IfknRqHvN4/dVNOzzrVgPnIxL/n13QhvAWi/pdxAfQGvNUhpTvS+y7HbBJJbZgOHufn+XuQVqOw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 9DC7B900071;
	Thu, 19 Nov 2026 22:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8N5VjdwZ4oQDIG168ZgSo2FVIq1qn8QKJeWCL2eQJiuIY3Kx+Y/MjIyQF4xHKwbA6fh0BXLm2T/5mdVSFacuZ6uQsu8N8mlAZgt3FA30972iO2lSYbBhjsm4KzsRdjZzHJ1pSXR1NJapFuUJVM+pkdN+mYCFNkeFqAB6FHDJlGDiU7VKIIePvrnYSC0Rbw3vV8erxeF0arArii+4GEl6Vzw63r2Fh7TnmKJgXXTO4hzdjc9J9I/eI9mujDrlKAEOyjNl+MYs/N5GmOvUulcr8MksGGNvnNJumk67AAmvsEV+mdhQI2WvFEqDAaWlHjGrSGO/DkCuPUb+23Hs7otoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grQpY9gYJSuvjZ0LHPwZQKU5EosMltPZYQ2x7AvvaSI=;
 b=G2ryYjxeqUxIgoSF5F/U7BI7TWSmQ3BtVrYC1avXYpKzCxcgH5G9SlX4JRZwG8bseoXruhNBUCj9HIrGt7AHRjYjEsHvBnDVpJg1JWJ8XFQs0Zva5jovO9DrzHdDRBrwXT0NmC5URtr+29uSH3OinvGFjGLys2ZhEcbmV7qNGNLfxI17zdIrNYl+UU65j2PEm0+skOKDwT+Jb6LV8BPhHzgsPTvp05Trat0JQGK5E6GFDtXl9cItnt4QpUUhL0ZGwfM/7j+4BFPGutX2OcsSruu36iBAaeeniqsLGO0ac+2UWL2f47Jj1fEXbd2YPSqN/5xO/D5NH0PQkQrdASjwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grQpY9gYJSuvjZ0LHPwZQKU5EosMltPZYQ2x7AvvaSI=;
 b=kyfyjAxkPpUZ7PT0jVI7bnMDznqoQmXnvfTgwSuW5fIEhHWMOJGxflDBLBL5Fb2jPCeeP4Lp5/3cb8syrkg6ndPdtcBgFcQvhpuPwrl3MQeTF5XTSIbwXe+sDwp8jxyenb8fEQsYGaqFysOPLIvJ85zjqbNtIufLMDBtJS5s/bcspH0B+5ZS4/tENVl1buo1YDNJWDEZ96RjOrD8EYWZyhcBc9pROtuAEncl4UettLPJpbxnuPa+Z1JsBJ00WPDI+TT0PGRDl4leewjys53bG3kyE+1FALczjd1AJrXWZ9iwyAeO/7AaaYH/KTDPRJ0L1zVYEFvxEKcjnvmyrWFsdQ==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:57:54 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:57:53 +0000
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
Subject: [PATCH net-next v16 00/13] dpll: add SiTime SiT9531x DPLL clock
 driver
Thread-Topic: [PATCH net-next v16 00/13] dpll: add SiTime SiT9531x DPLL clock
 driver
Thread-Index: AQHdeHloI6Min5BOrke1bLvUKEr/iA==
Date: Thu, 19 Nov 2026 22:57:53 +0000
Message-ID: <20261119225752.41846-1-arouhi@sitime.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DSVPR20MB994924:EE_|PH0PR20MB4352:EE_
x-ms-office365-filtering-correlation-id: 9a17bfaf-df44-4ed2-f7f7-08df46908b4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261009223027099003|3023799007|56012099006|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022075727099003|261021121427099003|261022113327099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 kECw+a5Hvq+RynPni3xklsk0QKkPkPkpfbXYPb3noejSAGQTHt7IQxLY4P1BJw/Fs3rpBqsCWN64ISbaHADt+gHlqMdEV9YUVk7HXijSQmfkBQb0952+RzNh0VrSBO9qbDuB9CSsCrvUsGOvcRGfb5T+yJOgDZKgv6+aONk1O1BaINu7u1lspLpg5J0gX8aRz1FtJiizBaSCvyAjbdwtFCr9dn1h6thonI7JxfVG0ltbQjaYAahMPRrcrcmlXE/FpV1+4lvUdSvp5cPDcM59em+GDC6SZ15KrBZKtTGYMQ23TOJwPop5A9zqDuy8xsZ1fS93HFtlm4NveVMSDaZiuGrAk64BmLNNS2eGHUQSLAAmIXg2nbqzXRtn9gobZMBtIcaiDCsGSXavccV/txUOL+FT6TeK2xUJQqylSDh46A3Udp8n7WzrIm+MT8vlKPNaS3YmS0lm+A0DsGqoDlphKWwTMYa5bZEeYDEbbkZdEDkNuld08hdAO/g9OB3gBtbCfDpoxzadMzeOXLS5nfAxYkGePIoyQrZvU3W6WQlOP45kw8mWuWAzfplw10jRqTH9WqUrIMKdKoxSqHnwhBWBqVScWEByia7twXdQ+TWrNTtjPslp/4l/eMTZ5xR9XLujLB72XfTZ5J/ea2AC701z7TvAMLMUhvCP062wiU8xt2s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261009223027099003)(3023799007)(56012099006)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022113327099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?midN7ILcrlld1LllmPOvB/1J4HATEievcbpKYwAy9R7a2SWCzXKNzfFXnI?=
 =?iso-8859-1?Q?qPR9LNm/Kt4rqYbGY8SKBpq4FvXd3UhfPtllBHDj1ytX86Jm2BImwFYYhy?=
 =?iso-8859-1?Q?mQP0IGSLzKYQhU/HgOG3jeqVjUxHeoBvu7/watdmNmdO43md5WGwLlYy9O?=
 =?iso-8859-1?Q?7NKh9NWx87Ebe/NbfrhPjVNCO9XPwFBhKQ2tAb++1L8tBU+PJRsl6evzXI?=
 =?iso-8859-1?Q?2b75m2Mdpf+f/sypJY7Wd7n5axxLO9oHTV/BDm3qY5aGD3Y82KrvuO6BNI?=
 =?iso-8859-1?Q?Fuv3ftNg7EtL0ZDAuZ+4xwmZ3eStClg/now25WxwYiR3RfVAunfu3VCg0P?=
 =?iso-8859-1?Q?spiHrP3YtE5UK0zXD34sYJ0tNDSMqMpVqD61ZkBr5TDo6rkwMX0L6HgQ95?=
 =?iso-8859-1?Q?acEbY/qmqYXkRljoljeQoz3WW3Bh5tXDcFVzLI2wlZbIcnp2eCXiKwDts8?=
 =?iso-8859-1?Q?H/fObdz4ttqm6WXphPB4cy1JCGN7YDxIOiDFOBeXhypVZ8KXAppJksPxqP?=
 =?iso-8859-1?Q?FPaYkIAa8pUBzne0/1dCU+EsbihyAe7rlkQ6kvAsims34VyhqK4/3dzgK0?=
 =?iso-8859-1?Q?HhXk15GauUWOumRyxQzjQrDuvm9BpZpnDqNLwurSXW3OA+fchI1UNI2RS0?=
 =?iso-8859-1?Q?tmSk0qN6yOKyzHbeCAHAPND3FZTv9FN6NqmHdYi8YN45ln2eVqOSvxCYvg?=
 =?iso-8859-1?Q?kDij6qmXWQ0jXopuNX1y94DxfBXAM52eWVyQf3rAsNJ7n5idGsa6XI01I2?=
 =?iso-8859-1?Q?1rUCk6LF3FC50KXGoG6CnC/AFvIs0JJBc1yYBb0vvN9J1f7C208o4rHzvh?=
 =?iso-8859-1?Q?Eo6+eyhnaILUUPYi9Nul7HDpc+eHKNZsozaBZeiKNoCoAvAbFwHxyB30aG?=
 =?iso-8859-1?Q?FeeXbeKIYkPqslelg0tvPiadcmkaFP6C8KZljFeJ/mZSXhleaxUw/K5p5G?=
 =?iso-8859-1?Q?cwDvtW0dl1hAMftUkdEUCCuQMsAM3joeA2thki5JNtfdwnRY1UgfsBr+DN?=
 =?iso-8859-1?Q?B65Cfju1ZvU1AREWijeQ3Iv6bUg/BD25X49Zf7fL+DHs3ckET1qZHtQwvK?=
 =?iso-8859-1?Q?kYP571/AJyFbF0CQP1g/zQZDu5wIHM8leBa4w+GVEIU0hDxllr7DlNnwDN?=
 =?iso-8859-1?Q?vMPTngp2bYO+EDd1IMxsC92HOeKvNo5QUtIXb7MoBpJ8fhJAg5iPlOM3VR?=
 =?iso-8859-1?Q?SS6EM62jRtSUbeC9oAILsUAe6CU2R8jipG9ZZfEWvOEYDaW+eJtXIHan0z?=
 =?iso-8859-1?Q?NV3tfLTHWYVc2WtE8uXikFDV1GShBhIG3Mwo+7RHdZ/yHFgTWZw0Qp4+aj?=
 =?iso-8859-1?Q?Qze3W87H9UB0nduYK5TVyMBZkGbGpdlJjdLG2U2WU3BVoUY80lopdoPkT+?=
 =?iso-8859-1?Q?NYuGB7vbFME4EHmKRXvZSfOBEHkVjNEDAuWUtKZd7BOuQy+waaIBks7r5Z?=
 =?iso-8859-1?Q?EcwNHw2zJokfuTl7vl8SrakBBh109m7nMGK5XsM/tc8dxH9yJODTZ8LrSQ?=
 =?iso-8859-1?Q?vY3sr0PRjX+3YD0Myo4uZC5xCHBOQqqaNzkpMgMTaoDY9DLtwjpqDv2xdk?=
 =?iso-8859-1?Q?tZvQW6BkOWMn11XHxOfagbYWX/4x7PUh0oL2QdahFrLEaBcqE+Te37aouj?=
 =?iso-8859-1?Q?vadWAINAxKAtDYdcn0/8H8TGShw/OjhPVkQD6q7gaQ6lsQzmH0znoB0o/J?=
 =?iso-8859-1?Q?aQ9uC3kSA/iu7USNTracQX+StOg5cLWSgxfrcGa82W56j7Mel8jB4XIk8p?=
 =?iso-8859-1?Q?Bm04CTqKMWzcgRajrTcYgcoO6n3S8THrzCG5b3BNudW4LF?=
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
	Y1Frpu5Q7xj+o6AzwVTTFtk3qw5rBFK0v3S1PKhYSHNyUPpe0l6D+CHj4KtHJ/lCWqGg9ewjlfAWs9JAOsh2zyRxcFBWjVEza86+nEs1pOO3iYrh5U6YK9UEFpRtaIQOgohobuy3X8kjWbzzLBZSU3fyrXUXBTw9HZO8HLzzbbT5rw6kkZ+v8zH05Pzr9GvwM2dAnO6GPJsP3J5xndaVNw+fiaCsPLghJ7wDS9Lysm9FJGVWpbQF+HeDKXrLLIJruitoQYkhgXwQeVEPHA5eecOn+apjjsqXuEBF3hV1qIacNcbVWmMMkNKjirKVAlLyS1UmRgenE1rolt/dEQlTNg==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a17bfaf-df44-4ed2-f7f7-08df46908b4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:53.6193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oKP5en2LeVp1msY+05LvE/PB0CkyN3sVvPW+9ugXhCOVq5lECXjBj2N/yG9cqQ8suW7dEY54GUi9bs8FPZ/Lcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129078-IFiybKnOs1rS
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129078;IFiybKnOs1rS;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

This series adds a DPLL subsystem driver for the SiTime SiT95316 and=0A=
SiT95317 I2C clock generators. Each device integrates four PLLs with=0A=
automatic reference selection and on-chip TDC phase-offset measurement,=0A=
and is used for synchronization in telecom, networking, and data-center=0A=
timing.=0A=
=0A=
Patch 1 changes the DPLL core: phase_offset_get and phase_adjust_get=0A=
may return -ENODATA, and the core then leaves the attribute out of the=0A=
pin message instead of failing the dump. Patches 11 and 12 use it. The=0A=
rest is the device-tree binding, the driver under=0A=
drivers/dpll/sit9531x/, and the MAINTAINERS entry.=0A=
=0A=
v1: https://lore.kernel.org/netdev/20260511211143.19792-1-arouhi@sitime.com=
/=0A=
v2: https://lore.kernel.org/netdev/20260520191943.73938-1-arouhi@sitime.com=
/=0A=
v3: https://lore.kernel.org/netdev/20260731180951.65725-1-arouhi@sitime.com=
/=0A=
v4: https://lore.kernel.org/netdev/20260806232439.27551-1-arouhi@sitime.com=
/=0A=
v5: https://lore.kernel.org/netdev/20260810230439.22866-1-arouhi@sitime.com=
/=0A=
v6: https://lore.kernel.org/netdev/20260812175337.18155-1-arouhi@sitime.com=
/=0A=
v7: https://lore.kernel.org/netdev/20260815221919.64226-1-arouhi@sitime.com=
/=0A=
v8: https://lore.kernel.org/netdev/20260902214030.20955-1-arouhi@sitime.com=
/=0A=
v9: https://lore.kernel.org/netdev/20260915000015.80480-1-arouhi@sitime.com=
/=0A=
v10: https://lore.kernel.org/netdev/20260921201108.42676-1-arouhi@sitime.co=
m/=0A=
v11: https://lore.kernel.org/netdev/20260930233714.87679-1-arouhi@sitime.co=
m/=0A=
v12: https://lore.kernel.org/netdev/20261009183151.78497-1-arouhi@sitime.co=
m/=0A=
v13: https://lore.kernel.org/netdev/20261013224131.27149-1-arouhi@sitime.co=
m/=0A=
v14: https://lore.kernel.org/netdev/20261016005823.13690-1-arouhi@sitime.co=
m/=0A=
v15: https://lore.kernel.org/netdev/20261110202607.55744-1-arouhi@sitime.co=
m/=0A=
=0A=
The changes in v16 answer the netdev AI review of v15. Each finding has=0A=
a reply on its patch: a fix folded into the patch that introduces the=0A=
code, a reason it does not hold, or a reason it is left for a patch=0A=
after this series is merged. Those are listed at the end of this=0A=
letter.=0A=
=0A=
Ivan Vecera's Reviewed-by on patch 1 and Rob Herring's on patch 3 are=0A=
carried; the schema in patch 3 is unchanged since v15.=0A=
=0A=
Oleg and I used LLM coding assistants to write parts of the driver code=0A=
and of the commit messages, and reviewed and revised what they=0A=
produced.=0A=
=0A=
  1     dpll core: omit phase attributes a driver has no value for=0A=
  2     bindings: vendor prefix=0A=
  3     bindings: the device schema=0A=
  4     basic support: paged regmap, variant detection, probe=0A=
  5     DPLL types and pin properties from system firmware=0A=
  6     register the DPLL devices and pins, and keep their state=0A=
  7     input pin state and operational state on a DPLL=0A=
  8     input pin priority=0A=
  9     pin frequency, both directions=0A=
  10    output pin state (mute)=0A=
  11    output phase adjust=0A=
  12    phase offset through the TDC=0A=
  13    the inter-PLL sync line as a pair of pins=0A=
=0A=
The two bindings patches come before the driver, so the driver never=0A=
matches on a compatible string before the schema that describes it is=0A=
in the tree.=0A=
=0A=
Every patch builds with only the earlier patches applied: no patch=0A=
calls something a later patch introduces. This was re-checked for this=0A=
posting patch by patch with W=3D1 and with sparse, and kernel-doc -Wall=0A=
is clean on every driver patch. checkpatch --strict at 80 columns is=0A=
clean except for the "does MAINTAINERS need updating?" hint on patches=0A=
5 and 6, which add files under drivers/dpll/sit9531x/; patch 4 already=0A=
covers that directory with an F: entry.=0A=
=0A=
Design decisions and hardware assumptions=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=
Configuration ownership. The part runs a configuration it loaded before=0A=
the driver binds, from efuse or from a blob the board applies. The=0A=
driver reads that configuration and never resets the part, rewrites=0A=
loop-filter coefficients or touches a register the configurator sets.=0A=
What it changes at runtime is what the DPLL API asks it to change:=0A=
input selection and priorities, output enables, rates and delays, the=0A=
inter-PLL sync source. Where the loaded configuration puts a PLL=0A=
outside what the API can express, the driver reports what the part=0A=
does and withholds the control rather than reconfiguring the part:=0A=
a PLL in manual input select is reported in MANUAL mode with no=0A=
selection or priority setters; a half-armed fast lock registers without=0A=
the attribute.=0A=
=0A=
Automatic selection. A PLL whose profile arbitrates by priority is=0A=
reported AUTOMATIC: the part picks among the listed inputs by the=0A=
priorities it is given, and the driver keeps the table and the active=0A=
selection register in step with the priorities it was asked for. When=0A=
a PLL that lost every input sits in holdover and an input returns, the=0A=
driver doesn't wait for the part: it re-selects the PLL when an input=0A=
edge is sampled, and once on the first sample after probe or resume,=0A=
where no edge could have been seen. Whether a PLL returns to a=0A=
higher-priority input that recovers is the profile's REVERT_EN; the=0A=
DPLL API has no attribute for revertive selection and no driver=0A=
exposes its setting.=0A=
=0A=
Qualification. The driver selects on loss of signal and reports ACTIVE=0A=
from it. The frequency-drift monitors are reported as a qualification=0A=
failure on an input the PLL is not on; an input the part keeps tracking=0A=
while its drift flag is set is reported as the part reports it.=0A=
=0A=
Register access. The part shows one 256-byte page at a time, selected=0A=
through the register at offset 0xFF of every page and latched on the=0A=
STOP of that write. The regmap is that flat window; the driver selects=0A=
the page itself under its own lock, remembers the page it selected,=0A=
forgets it on any failed transfer and on resume, and re-selects on the=0A=
next access. No other regmap user, debugfs included, can move the=0A=
page. The I2C_SLAVE_FORCE path of i2c-dev is the=0A=
documented debugging override and is not defended against.=0A=
=0A=
Status. The poll reads the status registers twice a second and=0A=
reports what it samples; a loss of lock that begins and ends between=0A=
two samples is not reported. INTRB, where wired, brings the next=0A=
sample forward.=0A=
=0A=
Clocks and supplies. The XO is taken through=0A=
devm_clk_get_optional_enabled() for its rate and to hold a reference,=0A=
so clk_disable_unused() cannot gate an XO the loaded configuration runs=0A=
from; the enable is not what starts the XO, and the reference goes back=0A=
to the provider on unbind or a failed probe. A clock or a rail the part=0A=
must keep without a driver bound is the provider's property=0A=
(CLK_IS_CRITICAL, regulator-always-on), as for any part that is=0A=
configured before Linux runs. The binding names the supplies; the=0A=
driver does not enable them yet, so a board with switchable rails marks=0A=
them always-on.=0A=
=0A=
The XO pin. The XO is the reference of the inner loop of every PLL, so=0A=
the XO pin is CONNECTED on every DPLL, next to the input the outer loop=0A=
tracks, with no capabilities and no state setter. CONNECTED is the=0A=
state the uAPI has for an input in use that the user cannot change. The=0A=
XO pin has no phase offset.=0A=
=0A=
VCO rate. The VCO rate is derived as Fref * DIVN, the XO rate (with the=0A=
doubler) times the PLL page's static divider, which is how the register=0A=
map defines the inner loop; the binding describes the XO and no other=0A=
reference. The estimate is bounded: a product outside the PLL's VCO=0A=
band is reported once and refuses every frequency and delay request,=0A=
and inside the band a rate is programmed only when the estimated Fvco=0A=
is a whole multiple of it. The read paths report the value computed=0A=
from the product.=0A=
=0A=
Output pads. The driver reads the pad-enable bits only to tell a CMOS=0A=
output from a differential one, and mutes a CMOS output by forcing both=0A=
pads off. It reports an output muted when both pads are forced off, the=0A=
only state its own mute produces; a profile that forces one pad is=0A=
reported as driven, and an unmute leaves that pad forced. The force=0A=
registers act when written, under the output system's debug key and=0A=
without a programming sequence.=0A=
=0A=
Phase offset. The measurement compares the selected input against a=0A=
physical output the PLL drives, as the documented procedure does, so a=0A=
PLL with no routed, enabled output reports no phase offset (the=0A=
attribute is omitted). The offset is negative when the input edge comes=0A=
first. A sample that cannot be taken, including one taken while the=0A=
input disappears, leaves the attribute out rather than failing the=0A=
dump.=0A=
=0A=
Notifications. The driver sends again a change notification it could=0A=
not build for a change it made itself (a failed request that moved=0A=
hardware, a read-through that moved a value, the sync-line source). It=0A=
does not retry the notifications the core sends after a successful=0A=
request: dpll_pin_prio_set() and dpll_pin_state_set() discard that=0A=
result for every driver, and a retry in the driver would notify the=0A=
change twice.=0A=
=0A=
Recovery after a failed write. A sequence that fails part-way leaves=0A=
the part in a state the driver records as pending: a priority table=0A=
not latched, a forced holdover to release, a delay to re-time, an=0A=
output realignment, open output loops, a debug window to close, a=0A=
sync-line page half written. The poll retries each until the write=0A=
succeeds; unbind retries once more and warns about what is left; resume=0A=
drops the pending delay and realignment, since the registers it=0A=
re-reads describe the part after a suspend that may have reloaded it,=0A=
and keeps the sync-line ownership records until a retry resolves them.=0A=
=0A=
Changes in v16:=0A=
=0A=
  - Patch 1: Ivan Vecera's Reviewed-by.=0A=
=0A=
  - Patch 4: the reset line is requested before the XO is enabled, so a=0A=
    deferred probe does not gate the clock of a running part.=0A=
=0A=
  - Patch 8: a priority change while a PLL is in holdover no longer=0A=
    writes the table a second time on the next poll. A pin on a PLL in=0A=
    manual input select reports no priority in its notifications.=0A=
=0A=
  - Patch 9: the NVM bank update is written only by a frequency change=0A=
    whose divider was written; a failed entry into the programming=0A=
    sequence only re-locks the loops.=0A=
=0A=
  - Patch 10: a mute or unmute writes the Hi-Z force bits and nothing=0A=
    else; it no longer runs the output programming sequence or opens=0A=
    the output loops. An unmute leaves forced a pad the loaded=0A=
    configuration forces.=0A=
=0A=
  - Patch 11: a delay alone is applied with a small-change update=0A=
    instead of the programming sequence. The setter and the getter both=0A=
    report a stored delay in the form nearer to zero, so a request of=0A=
    -1000 ps reads back as -1000 ps. Output loops left open by a failed=0A=
    sequence are re-locked before a flush.=0A=
=0A=
  - Patch 12: the sign of the phase offset was inverted and is fixed.=0A=
    The attribute is left out while a failed sequence leaves the output=0A=
    loops open, and when a read fails, instead of failing the dump.=0A=
=0A=
  - Patch 13: the source pattern is written before the global enable,=0A=
    and a failed disable restores the enable only over a page that=0A=
    still holds the whole pattern. A PLL that is routed from the sync=0A=
    line, or whose manual select names it, cannot drive it. A global=0A=
    enable set with no page holding the pattern refuses the connect.=0A=
    A refusal caused by a partial source says that a disconnect of the=0A=
    source pin clears it.=0A=
=0A=
  - Struct fields move to the patch that first uses them. ODRn_MISC0=0A=
    bits 2 and 3 are named for the pads they enable.=0A=
=0A=
  - Commit messages describe what each patch does, including the=0A=
    retries and the bus load of a poll tick.=0A=
=0A=
Left for patches on top of this series once it is merged:=0A=
=0A=
  - claiming the supplies, with the power-up delay, and handling a part=0A=
    that loses power over suspend=0A=
  - reporting a loss of lock shorter than one poll period from the=0A=
    notification latches=0A=
  - guarding INTRB against a latch, routed there by the configuration,=0A=
    that the handler does not clear=0A=
  - retrying an NVM bank update that failed while the loops re-locked=0A=
  - deriving the VCO rate of a PLL fed from another PLL=0A=
  - holding the phase flush pending until the trigger is written low=0A=
  - tracking a failed close of the sync line's debug window=0A=
=0A=
Ali Rouhi (2):=0A=
  dt-bindings: vendor-prefixes: add SiTime Corporation=0A=
  dt-bindings: dpll: add SiTime SiT95316 clock generator=0A=
=0A=
Oleg Zadorozhnyi (11):=0A=
  dpll: omit pin phase attributes the driver has no value for=0A=
  dpll: add basic SiTime SiT9531x support=0A=
  dpll: sit9531x: read DPLL types and pin properties from system=0A=
    firmware=0A=
  dpll: sit9531x: register DPLL devices and pins=0A=
  dpll: sit9531x: implement input pin state on a DPLL=0A=
  dpll: sit9531x: add support to get and set priority on input pins=0A=
  dpll: sit9531x: add support to get and set frequency on pins=0A=
  dpll: sit9531x: implement output pin state on a DPLL=0A=
  dpll: sit9531x: add support to adjust output phase=0A=
  dpll: sit9531x: add support to get phase offset on the connected input=0A=
  dpll: sit9531x: model the inter-PLL sync line as a pair of pins=0A=
=0A=
 .../bindings/dpll/sitime,sit95316.yaml        |  214 +=0A=
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +=0A=
 MAINTAINERS                                   |    7 +=0A=
 drivers/dpll/Kconfig                          |    2 +=0A=
 drivers/dpll/Makefile                         |    1 +=0A=
 drivers/dpll/dpll_netlink.c                   |   14 +-=0A=
 drivers/dpll/sit9531x/Kconfig                 |   17 +=0A=
 drivers/dpll/sit9531x/Makefile                |    4 +=0A=
 drivers/dpll/sit9531x/core.c                  | 5237 +++++++++++++++++=0A=
 drivers/dpll/sit9531x/core.h                  |  438 ++=0A=
 drivers/dpll/sit9531x/dpll.c                  | 1520 +++++=0A=
 drivers/dpll/sit9531x/dpll.h                  |   63 +=0A=
 drivers/dpll/sit9531x/prop.c                  |  366 ++=0A=
 drivers/dpll/sit9531x/prop.h                  |   37 +=0A=
 drivers/dpll/sit9531x/regs.h                  |  351 ++=0A=
 15 files changed, 8269 insertions(+), 4 deletions(-)=0A=
 create mode 100644 Documentation/devicetree/bindings/dpll/sitime,sit95316.=
yaml=0A=
 create mode 100644 drivers/dpll/sit9531x/Kconfig=0A=
 create mode 100644 drivers/dpll/sit9531x/Makefile=0A=
 create mode 100644 drivers/dpll/sit9531x/core.c=0A=
 create mode 100644 drivers/dpll/sit9531x/core.h=0A=
 create mode 100644 drivers/dpll/sit9531x/dpll.c=0A=
 create mode 100644 drivers/dpll/sit9531x/dpll.h=0A=
 create mode 100644 drivers/dpll/sit9531x/prop.c=0A=
 create mode 100644 drivers/dpll/sit9531x/prop.h=0A=
 create mode 100644 drivers/dpll/sit9531x/regs.h=0A=
=0A=
=0A=
base-commit: fa5196392691051963726787944db872420dfa75=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
