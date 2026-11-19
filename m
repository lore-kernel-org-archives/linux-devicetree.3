Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795129081;
	b=xh+rtUAKW5fUmhXhz8nDk4LkeX6xvDJRcOwy5+Kdx4vudJEwKZ7fCFQoi4pQNT+OoN6s
	 IJd5i7++jDUiODdEA5Ndn/1DDsRT8v+X7nEwjjHbhTDM5WEj5JvUxZjOG2agSyfR814+W
	 xwX2LbpMWdrufEStD1FlYklV2/JPz6Wq5wwfw30olDt77XgxyDQMB/V/upCs+YWEBRPAl
	 6r5lZl8x7YkGq9qF/55CNylkIFalB+kXvoWDEvj3kZSJfsliASLV+z2u6S/qfp7KvkMUI
	 4+ekUEdRZfl984EDnR475gewRx8GgFZOu8YdQZHX0TEFZWqoIUn+8oOAXvfJ9bAPzAw==
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
	bh=FPMcUNC37z1TAIXwJ1vAlw1P5ni7vo+GimzZQ4MHt4g=;
	b=l0/bP1zrtLEVFRyHalBTXmtHUrIcGgMf5wy1yA2t8+2gzUR3CX6iXYxJYjPmpAa0xHtE
	 Kq+DS+XvltYVLzEr/uq3WaixZrxSGsQe2ECnFOXtjxTFhmNrhY6c8QzyXypMXpmnVFoJV
	 icrstFpmiTCzqcJZwV8Qy0JwSvlosO6MurcmAsjUagF3t5aS6Nd2skus0W502ORF3b+iJ
	 W7dldTaoNWEwZlj8nVeEjcB+RaDT/gwQt/xoO/RPS/1sXz82bCCHX9g1QU2ojVjuHvHTv
	 BG2KEGosXqYPxqyw4Sfbnp59j/PWbvuzApP8OTws7rkt/i31y4b/LKW7ysE4u2QPmuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=jes0JBjY;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Q7FBglhP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F12606A33A;
	Thu, 19 Nov 2026 22:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F12606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=jes0JBjY;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=Q7FBglhP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=FPMcUNC37z1TAIXwJ1vAlw1P5ni7vo+GimzZQ4MHt4g=;
 b=jes0JBjYXaNzYqRYkYg+6QpQPpr9qzWs4pvbmBFh/WSh4r2vVBarMIgGsXSB2PAxCp5vSBu0cIb4IFZZ0RXJC8PJtJcBxenmAFvQCWvrTjWhRoNPobwE91S6+78wDsbmdjrwyewBJdqhi5/KTNi9I+NXI1/dc/tfpcnXEAaeJ0T5R4Rj+h78tRU9QQIBKOGTk3ldcA4k0u7LI+cAFC+YyeRu8+gXWUPHSyAleqR3SSf8QElfOL5Ajy+RDlmgYCeJDuadGA9P2fM12oLvbei+Kgp/pFDj2xlgTABRY4+yQLTH1RbWqLucx31gGSjytuvBy2ck8VuCftfmaE/SKKqNLw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11022077.outbound.protection.outlook.com [52.101.53.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id B56F590006B;
	Thu, 19 Nov 2026 22:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlwxPfE8Ew4DuGeEBpO2B8Yo33s+l5m/pDUNT4w+IslX5Df+AfmSeg/Kv0/poZ8y/6jFno9830ezcWPgdTlCxS4h4tulYH/lRBSaALZGsNal3GgyIoBiNExXxeSrbbHrjsX6xYbAl5F9Rl6PJ1Estd8DKWEy9HdyiiaSdkaqxLu32tnSCrbiRhEOCyTRn2NPRy8vsM/4q00ENK+rLPsCfDLHzcDMP7e9UGstr2oOUa5J33iALKDSxE1/ukcAxf9EWsw2NPbQY/20aEvEVp7JsmelY0PHOkrhQ56BSL/FkBKUvts9UNeCKsjRrRoToF6rqW3q3jvLCcp1QHMYX99qyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPMcUNC37z1TAIXwJ1vAlw1P5ni7vo+GimzZQ4MHt4g=;
 b=TZFEyUCIhW80v4vJXBku3ENl9PIl+sEWAS4aVDZur0JQCoIbg8iH33q/d0yKI+h3vg/X7Dd967eRi7VCjHONy6dsOf0L3b8WTimAqYFHzn2X1oR0srXdlaCPDYYxSczKS2FT4JkepwDycRuhmJXxll/1kUOcd2uxebdIzHsH9chI7Fa/1izVKaP4RtpimfO3DEXSQXw9tBLj1E4dlvIiAAi7mKKdhTjriq604tK/7p8HdWDJmKP94g5+ODZdDHQryVBfNWKIz29L0nCuVYiUmdJiuUt32So2CZ0lKxPsBeC2jG8S3lzMiMLS9QygOpdw8UltN9aco5Jb10hv3yVLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPMcUNC37z1TAIXwJ1vAlw1P5ni7vo+GimzZQ4MHt4g=;
 b=Q7FBglhPt9qEGoRF3su5jjs9/A1AL6uWuxpAH3pW8V9PtNX426R8sZTgEwCT9v8/UKV17lz+Ok6VFJ2PjPL15u8uW3dSk8sbIA7Kw6GvtMnhTpw08Oq0WV2bN4mjjSF3bfS35G8b+s65LKz/WSvEIIm3fqDpMDInqIOodVz+h3tdaa9/00GaLGzYdZYZl/POX696/wJAymetsQFCTohTpS8INRgLLN1TAlp/AxHcO+jsmFXXLxTWOn3k6jehgLvpZCXpYZmqkMURZNeBWymRec+tfPrd1K+A8+JhKsBmgIjCYS2lgxA6QF46AqddTKs9BWIWJW6sJXFXhiDH9VeQ8A==
Received: from DSVPR20MB994924.namprd20.prod.outlook.com (2603:10b6:8:45b::22)
 by PH0PR20MB4352.namprd20.prod.outlook.com (2603:10b6:510:14d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:57:56 +0000
Received: from DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7]) by DSVPR20MB994924.namprd20.prod.outlook.com
 ([fe80::5f15:fc8a:498:98d7%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 22:57:56 +0000
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
Subject: [PATCH net-next v16 04/13] dpll: add basic SiTime SiT9531x support
Thread-Topic: [PATCH net-next v16 04/13] dpll: add basic SiTime SiT9531x
 support
Thread-Index: AQHdeHlq1OdqxbhZdEW7PoIhuZdspw==
Date: Thu, 19 Nov 2026 22:57:55 +0000
Message-ID: <20261119225752.41846-5-arouhi@sitime.com>
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
x-ms-office365-filtering-correlation-id: fb691a86-db3d-4c0b-72ed-08df46908cc5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|261009223027099003|22082099003|3023799007|56012099006|5023799004|261102123227099003|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021121427099003|261022113327099003|261022105027099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 3WceE8dY7x0aD/Gh5vOo5BhYog8TIeg7VJFHgNNZgQhWDRMGptAeGmZGFF2sT8T8mZZ5FPTVUyoNFqt5C8kOJgMe25vXU10irHjOciJFkXD+2ggr5b0QCibShn6IblXHsvlzOGwODS3vl9Q5gW7waysU1XleexqIrROIjd0BHaMd998nzbDOT7t6IbzAbzmzykR6WNZNfiTuoeF1AztXfkNOPSAh5C7oY5e9YK/mEvMljtX44iUK42ywHzSA+GiPDeKutK9O8bh7ojL/z8x7MpzV0yAJNWq0WGEWclvKtiXk1pA5uJWsqLvbGmkvO/EjeavYG0em2BElaI/Y+TQnD1jUgxv87mTCT3EPch6JjBcKk0bWvtFQhtdkKPqFi5vRTgANOQKA0l4adMfIU39zanHPbE/8Nu0VuPRvW5q8Wq3wB13x3qGMd8YvrefhMlN7N68pwuFYfYQaclsE6T4HajXsb6+QMLxzuPRjJ9+WunE0GoZBDABUOXoEkLqgzoMdUDU6OgWLFTiu8sbl1+taZ7nHB5GBGihKH02Q4M+mf63qKYckPx3ZbzjNoRJ7I90UfLLVz95jaCbwvwzpRrB8zsqkflgw3kGsjRuV59T572WdY0CAxkrN1v09aNtj9blF3bKbueYi6z39HT0YCmJLEZ8DSO+o3qwGSuSzeY6K1OnwCZ1Ji8n3hcalcWdm102tjhRZrDbaGDLnXCllMzRUS7Nn0Oq09GqXlWu93bYGPMk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSVPR20MB994924.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(261009223027099003)(22082099003)(3023799007)(56012099006)(5023799004)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022113327099003)(261022105027099003)(38070700021)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NdIj45YWuForYxvyT6bnWfsPzknL8s+vUzOb9eC8P7kdEBE1QWO66zwoSG?=
 =?iso-8859-1?Q?FUJ7tMfV12MCLV1Oz7qmRmeTMRHM3c7qnSkWjJhztCpxeNeLBMTdIGukXr?=
 =?iso-8859-1?Q?TwEX/k3+8gaYueBDz9TV3GK1jbPE7+UjfBVEML6xHmFI6xghypNoGBuhZT?=
 =?iso-8859-1?Q?MHq5TkRvwDHQ2ODFvrnQ2hOXOpM7fmUTEuu9fImW4d3Zde2vFM/h4+kVcM?=
 =?iso-8859-1?Q?PraLS8ttytwH5u3XE6ydoAOHmC5NmBnSvI3qcxEyrQgU0Xlxrb63fk97WT?=
 =?iso-8859-1?Q?IceLXNF36L1HzNM05w0xIwLV9X+8bjhw/Mvpjsn9kTnK5MIN+9tAfLyplw?=
 =?iso-8859-1?Q?lkke0gpCA8bHzL6Qv5NDwtc5e2CqxMLNyk9jNsZ5Tsi/oYsUQbD8cxta2e?=
 =?iso-8859-1?Q?HfdmVHM/VI5K4YT5zb2wSBzXPy5XSTmeRKxyasbOT+HKE/A4QC7q2nSuEJ?=
 =?iso-8859-1?Q?1oHh88Xzeyiyxi1hXHfEFZiFPr+Jf0qKAfjNj+G78UQLJMqiAMobhLUM3I?=
 =?iso-8859-1?Q?yrLiFdenKxUm7c2gohXDscZi5bKHlu+HtBsi9FdxZx87FRfme9ow5V6hd0?=
 =?iso-8859-1?Q?/NdPKuuIW+ULzjmkA5inxZZyoZ4mqRaOKRCZjf9bxIkrWZAzqGjW3mrCYj?=
 =?iso-8859-1?Q?NUnEj6wWzJZwKjysLve5+0QQUaANf8ft7qV+QkNK37TtBWmVCzGet9vaWh?=
 =?iso-8859-1?Q?Ate9K9UuKOOm9zOoQEdG1Z+IbPZOWoKLzL2laR4tCTOzFuZyN6K1vJF+5V?=
 =?iso-8859-1?Q?R444c1zZ3Z+NaohTrD1pZz6qfYq0yjZu8VaTpCQOjOpsXt7kFsFAnTsT8K?=
 =?iso-8859-1?Q?44jztDbXUu3Ec2DqI+sd8PaKUDROBLf11bv9FJZGN8O93J7Hy3uDWwr213?=
 =?iso-8859-1?Q?eQfvLRnRl3CfFaAjYUn70BICq3LFCRkRle8tqsqaDR6XaTxztIWuNhG4m2?=
 =?iso-8859-1?Q?WEmG0EwzRM2O7QtOjPzoucixMo/8n1s0OOx98Xu6uPIOOtWAoP6rLoek1a?=
 =?iso-8859-1?Q?mXOm8lKaD5LV4av62KHVq3IRcqRSACgizTCB5fUVmSYWWR4EJItpdtLKkA?=
 =?iso-8859-1?Q?GdmvkNuT6nlZzW4t6a9/1Cu4Vi5RcLoAiRi8FkD1bZVSWPOnNwalDY7Q7Z?=
 =?iso-8859-1?Q?2bw7qRYunjEM7enHHMT6LrzCjA4yrWq/t1JRHWv6lDEKWkFz0c0C1oj1jo?=
 =?iso-8859-1?Q?CBB4B9OJEnONdsMDSbpbikx5P47dL6MlCyEsIOfSDwxp0j2uCvOltrIRJA?=
 =?iso-8859-1?Q?xpElHxXxja1SlvHopmvU+knLxQhYCQubkHRFIcC7+eh2a/3Z+B/p5yxYVb?=
 =?iso-8859-1?Q?029u+Q5RLt49b6mugI1GzFYDsOYszooa6kcMIYJ7/qREm6jsY4tRTbVbma?=
 =?iso-8859-1?Q?dSnVwoYIMeR8qC9Dc8mffOqOfVYwT4NR+0YYXA5CJByfmyxfGnk/pvMdFd?=
 =?iso-8859-1?Q?b/nYPGOyWUfWplnK7bcsCK8XQi0zs3ZweX1JKDTZX6v2ihA8K1oMVhwn3+?=
 =?iso-8859-1?Q?LOU75ue1AHkYn1XBu5PanPt95YEVBrC2OOID4tgqxvitQ36FzRl+HbrTfC?=
 =?iso-8859-1?Q?8XlNwNWIrLHdGldlGW/fc2+Vfw75Mt3gD03CHZJESzld9zl9k4bdZC9Co0?=
 =?iso-8859-1?Q?BuVoezOUzeg8K9ObHnz4ChBTBBvVCxmvvl8AcNkE8+JuOuBVyusIzL+twe?=
 =?iso-8859-1?Q?ZUp2/SMGdFfOl3vJn1AdfRKw5/B2FYApVoVrgIxm5xMQT6GperX19XwK1W?=
 =?iso-8859-1?Q?LoyYrMqLigIrAjn02ITUjzixsbQ3bhKnAZThN0Z9J5KsMZ?=
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
	OKMcmFHiRCUt9dHJc40cgvp8kS2IReR+U1Zlhhjl7QV4EwwauaweGneuzehKMJI4thzGLgYFEU5YG039Ars1YAMfdtjeFXDzfqEbeavQo9OgDb83MFCg2YjUJR95knXqYnLIQvgBt6Bx1qjluy9Afj/MvmfXCz0QBIQ/4gUeTXBUq6I4Z1KGJ3YWT1Su9Gr48R5B6NT4TpE0zIOSVxvFYPVxyQ9hvXtE2V2f25mVWzpu2Cw/WkZiknZxTMKKcanbtwyRpiXCygVmgUUoZpra+7LtskT/26rE4Z1ztHwPN0YF257m50BTtnlPfPu0dDULru5B/lTEgnB9sa96WriPKw==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DSVPR20MB994924.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb691a86-db3d-4c0b-72ed-08df46908cc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 22:57:55.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhZ6bGYvudKt5EEirRY5JhRBoTqS3Bgc+DwgsU0wq9oC5j5HnZimCpxGf2Mp1Rf3He0kYhpZGjQ5QLKhDkrYRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4352
X-MDID: 1795129079-4tE5TBWfDoRN
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795129079;4tE5TBWfDoRN;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

From: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
=0A=
Add the I2C probe for the SiTime SiT9531x family: four PLLs, up to eight=0A=
inputs and up to twelve outputs, configured from efuse or from a blob=0A=
applied before the driver binds. Later patches register the PLLs with=0A=
the DPLL subsystem.=0A=
=0A=
The register space is 32 pages of 256 registers, selected through offset=0A=
0xFF of any page. The regmap is the flat 256-byte window, and the=0A=
accessors select the page under a lock. A regmap paged range is not=0A=
used: it reads the selector back on each access, which doubles the bus=0A=
traffic, and a debugfs access would move the page under the driver.=0A=
=0A=
Probe requests the optional reset line before it enables the XO, so a=0A=
deferred probe does not gate the clock of a running part, reads the XO=0A=
rate, waits the boot time with reset deasserted so the configuration=0A=
the part holds is kept, and identifies the variant from the ID register.=0A=
=0A=
Suggested-by: Ivan Vecera <ivecera@redhat.com>=0A=
Signed-off-by: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
Signed-off-by: Ali Rouhi <arouhi@sitime.com>=0A=
---=0A=
 MAINTAINERS                    |   1 +=0A=
 drivers/dpll/Kconfig           |   2 +=0A=
 drivers/dpll/Makefile          |   1 +=0A=
 drivers/dpll/sit9531x/Kconfig  |  13 ++=0A=
 drivers/dpll/sit9531x/Makefile |   4 +=0A=
 drivers/dpll/sit9531x/core.c   | 318 +++++++++++++++++++++++++++++++++=0A=
 drivers/dpll/sit9531x/core.h   |  88 +++++++++=0A=
 drivers/dpll/sit9531x/regs.h   |  36 ++++=0A=
 8 files changed, 463 insertions(+)=0A=
 create mode 100644 drivers/dpll/sit9531x/Kconfig=0A=
 create mode 100644 drivers/dpll/sit9531x/Makefile=0A=
 create mode 100644 drivers/dpll/sit9531x/core.c=0A=
 create mode 100644 drivers/dpll/sit9531x/core.h=0A=
 create mode 100644 drivers/dpll/sit9531x/regs.h=0A=
=0A=
diff --git a/MAINTAINERS b/MAINTAINERS=0A=
index 6c831bf9e812..936996cef03a 100644=0A=
--- a/MAINTAINERS=0A=
+++ b/MAINTAINERS=0A=
@@ -25875,6 +25875,7 @@ M:	Ali Rouhi <arouhi@sitime.com>=0A=
 L:	netdev@vger.kernel.org=0A=
 S:	Maintained=0A=
 F:	Documentation/devicetree/bindings/dpll/sitime,sit95316.yaml=0A=
+F:	drivers/dpll/sit9531x/=0A=
 =0A=
 SL28 CPLD MFD DRIVER=0A=
 M:	Michael Walle <mwalle@kernel.org>=0A=
diff --git a/drivers/dpll/Kconfig b/drivers/dpll/Kconfig=0A=
index be98969f040a..f8f7ca121b93 100644=0A=
--- a/drivers/dpll/Kconfig=0A=
+++ b/drivers/dpll/Kconfig=0A=
@@ -23,6 +23,8 @@ config DPLL_REFCNT_TRACKER=0A=
 =0A=
 	  If unsure, say N.=0A=
 =0A=
+source "drivers/dpll/sit9531x/Kconfig"=0A=
+=0A=
 source "drivers/dpll/zl3073x/Kconfig"=0A=
 =0A=
 endmenu=0A=
diff --git a/drivers/dpll/Makefile b/drivers/dpll/Makefile=0A=
index 9e7a3a3e592e..4adc50d748d4 100644=0A=
--- a/drivers/dpll/Makefile=0A=
+++ b/drivers/dpll/Makefile=0A=
@@ -8,4 +8,5 @@ dpll-y                  +=3D dpll_core.o=0A=
 dpll-y                  +=3D dpll_netlink.o=0A=
 dpll-y                  +=3D dpll_nl.o=0A=
 =0A=
+obj-$(CONFIG_SIT9531X_DPLL)	+=3D sit9531x/=0A=
 obj-$(CONFIG_ZL3073X)	+=3D zl3073x/=0A=
diff --git a/drivers/dpll/sit9531x/Kconfig b/drivers/dpll/sit9531x/Kconfig=
=0A=
new file mode 100644=0A=
index 000000000000..ac5b7f31a034=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/Kconfig=0A=
@@ -0,0 +1,13 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+=0A=
+config SIT9531X_DPLL=0A=
+	tristate "SiTime SiT9531x DPLL driver"=0A=
+	depends on I2C && NET=0A=
+	select DPLL=0A=
+	select REGMAP_I2C=0A=
+	help=0A=
+	  Driver for SiTime SiT9531x family clock generators=0A=
+	  (SiT95317, SiT95316).=0A=
+=0A=
+	  To compile this driver as a module, choose M here: the=0A=
+	  module will be called sit9531x.=0A=
diff --git a/drivers/dpll/sit9531x/Makefile b/drivers/dpll/sit9531x/Makefil=
e=0A=
new file mode 100644=0A=
index 000000000000..a221fe55386a=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/Makefile=0A=
@@ -0,0 +1,4 @@=0A=
+# SPDX-License-Identifier: GPL-2.0-only=0A=
+=0A=
+obj-$(CONFIG_SIT9531X_DPLL) +=3D sit9531x.o=0A=
+sit9531x-y :=3D core.o=0A=
diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c=0A=
new file mode 100644=0A=
index 000000000000..99dd5e70dc5e=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/core.c=0A=
@@ -0,0 +1,318 @@=0A=
+// SPDX-License-Identifier: GPL-2.0=0A=
+/*=0A=
+ * SiTime SiT9531x DPLL core driver=0A=
+ *=0A=
+ * Copyright (C) 2026 SiTime Corp.=0A=
+ * Author: Ali Rouhi <arouhi@sitime.com>=0A=
+ * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
+ *=0A=
+ * I2C probe, paged regmap configuration and register access helpers.=0A=
+ */=0A=
+=0A=
+#include <linux/bits.h>=0A=
+#include <linux/clk.h>=0A=
+#include <linux/delay.h>=0A=
+#include <linux/dev_printk.h>=0A=
+#include <linux/device.h>=0A=
+#include <linux/gpio/consumer.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/kernel.h>=0A=
+#include <linux/module.h>=0A=
+#include <linux/property.h>=0A=
+#include <linux/regmap.h>=0A=
+=0A=
+#include "core.h"=0A=
+#include "regs.h"=0A=
+=0A=
+#define SIT9531X_CHIP(_id, _nin, _nout, _name, _map) \=0A=
+	{ .id =3D (_id), .num_inputs =3D (_nin), .num_outputs =3D (_nout), \=0A=
+	  .name =3D (_name), .clkout_map =3D (_map) }=0A=
+=0A=
+/* Per-variant output index -> physical slot mapping */=0A=
+static const u8 clkout_map_95317[] =3D {0, 3, 4, 5, 7, 8, 9, 11};=0A=
+static const u8 clkout_map_95316[] =3D {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, =
11};=0A=
+=0A=
+static const struct sit9531x_chip_info sit9531x_chip_ids[] =3D {=0A=
+	SIT9531X_CHIP(SIT9531X_VARIANT_ID_95317, 8, 8, "SiT95317",=0A=
+		      clkout_map_95317),=0A=
+	SIT9531X_CHIP(SIT9531X_VARIANT_ID_95316, 8, 12, "SiT95316",=0A=
+		      clkout_map_95316),=0A=
+};=0A=
+=0A=
+/*=0A=
+ * One 256-register page is visible at a time, selected by offset 0xFF on =
every=0A=
+ * page. The map covers that window, uncached; the accessors select the pa=
ge.=0A=
+ */=0A=
+static const struct regmap_config sit9531x_regmap_config =3D {=0A=
+	.reg_bits	=3D 8,=0A=
+	.val_bits	=3D 8,=0A=
+	.max_register	=3D SIT9531X_PAGE_SEL,=0A=
+	.cache_type	=3D REGCACHE_NONE,=0A=
+};=0A=
+=0A=
+/* Caller holds page_lock. */=0A=
+static int sit9531x_page_select(struct sit9531x_dev *sitdev, int page)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	if (sitdev->page =3D=3D page)=0A=
+		return 0;=0A=
+=0A=
+	sitdev->page =3D -1;=0A=
+	rc =3D regmap_write(sitdev->regmap, SIT9531X_PAGE_SEL, page);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	sitdev->page =3D page;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* Caller holds page_lock. */=0A=
+static int sit9531x_read_locked(struct sit9531x_dev *sitdev, unsigned int =
reg,=0A=
+				unsigned int *val)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_page_select(sitdev, SIT9531X_REG_PAGE(reg));=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	rc =3D regmap_read(sitdev->regmap, SIT9531X_REG_OFFSET(reg), val);=0A=
+	if (rc)=0A=
+		sitdev->page =3D -1;=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/* Caller holds page_lock. */=0A=
+static int sit9531x_write_locked(struct sit9531x_dev *sitdev,=0A=
+				 unsigned int reg, u8 val)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	rc =3D sit9531x_page_select(sitdev, SIT9531X_REG_PAGE(reg));=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	rc =3D regmap_write(sitdev->regmap, SIT9531X_REG_OFFSET(reg), val);=0A=
+	if (rc)=0A=
+		sitdev->page =3D -1;=0A=
+	else if (SIT9531X_REG_OFFSET(reg) =3D=3D SIT9531X_PAGE_SEL)=0A=
+		sitdev->page =3D val;=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+/* @reg is a SIT9531X_REG(page, offset) value. */=0A=
+int sit9531x_read_u8(struct sit9531x_dev *sitdev, unsigned int reg,=0A=
+		     u8 *val)=0A=
+{=0A=
+	unsigned int tmp;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->page_lock);=0A=
+	rc =3D sit9531x_read_locked(sitdev, reg, &tmp);=0A=
+	mutex_unlock(&sitdev->page_lock);=0A=
+	if (rc) {=0A=
+		dev_err_ratelimited(sitdev->dev,=0A=
+				    "Failed to read page 0x%02x reg 0x%02x: %d\n",=0A=
+				    SIT9531X_REG_PAGE(reg),=0A=
+				    SIT9531X_REG_OFFSET(reg), rc);=0A=
+		return rc;=0A=
+	}=0A=
+	*val =3D (u8)tmp;=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/* @reg is a SIT9531X_REG(page, offset) value. */=0A=
+int sit9531x_write_u8(struct sit9531x_dev *sitdev, unsigned int reg,=0A=
+		      u8 val)=0A=
+{=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->page_lock);=0A=
+	rc =3D sit9531x_write_locked(sitdev, reg, val);=0A=
+	mutex_unlock(&sitdev->page_lock);=0A=
+	if (rc)=0A=
+		dev_err_ratelimited(sitdev->dev,=0A=
+				    "Failed to write page 0x%02x reg 0x%02x: %d\n",=0A=
+				    SIT9531X_REG_PAGE(reg),=0A=
+				    SIT9531X_REG_OFFSET(reg), rc);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+int sit9531x_read_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			 u8 offset, u8 *val)=0A=
+{=0A=
+	u8 page =3D sit9531x_pll_page(pll_idx);=0A=
+=0A=
+	return sit9531x_read_u8(sitdev, SIT9531X_REG(page, offset), val);=0A=
+}=0A=
+=0A=
+int sit9531x_write_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			  u8 offset, u8 val)=0A=
+{=0A=
+	u8 page =3D sit9531x_pll_page(pll_idx);=0A=
+=0A=
+	return sit9531x_write_u8(sitdev, SIT9531X_REG(page, offset), val);=0A=
+}=0A=
+=0A=
+int sit9531x_update_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx,=0A=
+			   u8 offset, u8 mask, u8 val)=0A=
+{=0A=
+	u8 page =3D sit9531x_pll_page(pll_idx);=0A=
+	unsigned int reg =3D SIT9531X_REG(page, offset);=0A=
+	unsigned int orig, tmp;=0A=
+	int rc;=0A=
+=0A=
+	mutex_lock(&sitdev->page_lock);=0A=
+	rc =3D sit9531x_read_locked(sitdev, reg, &orig);=0A=
+	if (!rc) {=0A=
+		tmp =3D (orig & ~mask) | (val & mask);=0A=
+		if (tmp !=3D orig)=0A=
+			rc =3D sit9531x_write_locked(sitdev, reg, tmp);=0A=
+	}=0A=
+	mutex_unlock(&sitdev->page_lock);=0A=
+	if (rc)=0A=
+		dev_err_ratelimited(sitdev->dev,=0A=
+				    "Failed to update page 0x%02x reg 0x%02x: %d\n",=0A=
+				    page, offset, rc);=0A=
+=0A=
+	return rc;=0A=
+}=0A=
+=0A=
+static int sit9531x_read_variant_id(struct sit9531x_dev *sitdev, u8 *id)=
=0A=
+{=0A=
+	return sit9531x_read_u8(sitdev, SIT9531X_REG_VARIANT_ID, id);=0A=
+}=0A=
+=0A=
+static const struct sit9531x_chip_info *sit9531x_match_variant(u8 id)=0A=
+{=0A=
+	unsigned int i;=0A=
+=0A=
+	for (i =3D 0; i < ARRAY_SIZE(sit9531x_chip_ids); i++) {=0A=
+		if (sit9531x_chip_ids[i].id =3D=3D id)=0A=
+			return &sit9531x_chip_ids[i];=0A=
+	}=0A=
+=0A=
+	return NULL;=0A=
+}=0A=
+=0A=
+static int sit9531x_dev_probe(struct sit9531x_dev *sitdev)=0A=
+{=0A=
+	struct clk *xtal_clk;=0A=
+	u8 variant_id;=0A=
+	int rc;=0A=
+=0A=
+	/*=0A=
+	 * Request before enabling the XO: a probe deferral would gate the XO=0A=
+	 * and remove the reference of a running part.=0A=
+	 */=0A=
+	sitdev->reset_gpio =3D devm_gpiod_get_optional(sitdev->dev, "reset",=0A=
+						     GPIOD_ASIS);=0A=
+	if (IS_ERR(sitdev->reset_gpio))=0A=
+		return dev_err_probe(sitdev->dev, PTR_ERR(sitdev->reset_gpio),=0A=
+				     "Failed to request reset gpio\n");=0A=
+=0A=
+	/*=0A=
+	 * Fvco =3D Fref * (DIVN + frac/2^32); Fref is the rate of the XO feeding=
=0A=
+	 * XIN/XO_CLK.=0A=
+	 */=0A=
+	xtal_clk =3D devm_clk_get_optional_enabled(sitdev->dev, "xtal");=0A=
+	if (IS_ERR(xtal_clk))=0A=
+		return dev_err_probe(sitdev->dev, PTR_ERR(xtal_clk),=0A=
+				     "Failed to get xtal clock\n");=0A=
+	sitdev->xtal_freq =3D clk_get_rate(xtal_clk);=0A=
+	if (!sitdev->xtal_freq) {=0A=
+		u32 freq;=0A=
+=0A=
+		if (!device_property_read_u32(sitdev->dev, "clock-frequency",=0A=
+					      &freq))=0A=
+			sitdev->xtal_freq =3D freq;=0A=
+	}=0A=
+	if (!sitdev->xtal_freq)=0A=
+		return dev_err_probe(sitdev->dev, -EINVAL,=0A=
+				     "no xtal rate: provide clocks=3D<&xo> + clock-names=3D\"xtal\", o=
r a clock-frequency property\n");=0A=
+=0A=
+	/*=0A=
+	 * Keep reset deasserted, never pulse it: a reset discards the=0A=
+	 * configuration from efuse or a pre-probe NVM blob. Release it before=0A=
+	 * the first I2C access.=0A=
+	 */=0A=
+	if (sitdev->reset_gpio) {=0A=
+		rc =3D gpiod_direction_output(sitdev->reset_gpio, 0);=0A=
+		if (rc)=0A=
+			return dev_err_probe(sitdev->dev, rc,=0A=
+					     "Failed to release the reset line\n");=0A=
+		fsleep(10000);	/* internal boot after release */=0A=
+	}=0A=
+=0A=
+	rc =3D sit9531x_read_variant_id(sitdev, &variant_id);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+=0A=
+	sitdev->info =3D sit9531x_match_variant(variant_id);=0A=
+	if (!sitdev->info)=0A=
+		return dev_err_probe(sitdev->dev, -ENODEV,=0A=
+				     "Unknown variant ID: 0x%02x\n",=0A=
+				     variant_id);=0A=
+=0A=
+	rc =3D devm_mutex_init(sitdev->dev, &sitdev->multiop_lock);=0A=
+	if (rc)=0A=
+		return dev_err_probe(sitdev->dev, rc,=0A=
+				     "Failed to initialize mutex\n");=0A=
+=0A=
+	dev_info(sitdev->dev, "%s detected, %u inputs, %u outputs\n",=0A=
+		 sitdev->info->name, sitdev->info->num_inputs,=0A=
+		 sitdev->info->num_outputs);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+static int sit9531x_i2c_probe(struct i2c_client *client)=0A=
+{=0A=
+	struct sit9531x_dev *sitdev;=0A=
+	struct regmap *regmap;=0A=
+	int rc;=0A=
+=0A=
+	regmap =3D devm_regmap_init_i2c(client, &sit9531x_regmap_config);=0A=
+	if (IS_ERR(regmap))=0A=
+		return dev_err_probe(&client->dev, PTR_ERR(regmap),=0A=
+				     "Failed to initialize regmap\n");=0A=
+=0A=
+	sitdev =3D devm_kzalloc(&client->dev, sizeof(*sitdev), GFP_KERNEL);=0A=
+	if (!sitdev)=0A=
+		return -ENOMEM;=0A=
+=0A=
+	sitdev->dev =3D &client->dev;=0A=
+	sitdev->client =3D client;=0A=
+	sitdev->regmap =3D regmap;=0A=
+	sitdev->page =3D -1;=0A=
+	rc =3D devm_mutex_init(&client->dev, &sitdev->page_lock);=0A=
+	if (rc)=0A=
+		return rc;=0A=
+	i2c_set_clientdata(client, sitdev);=0A=
+=0A=
+	return sit9531x_dev_probe(sitdev);=0A=
+}=0A=
+=0A=
+static const struct of_device_id sit9531x_of_match[] =3D {=0A=
+	{ .compatible =3D "sitime,sit95316" },=0A=
+	{ .compatible =3D "sitime,sit95317" },=0A=
+	{ }=0A=
+};=0A=
+MODULE_DEVICE_TABLE(of, sit9531x_of_match);=0A=
+=0A=
+static struct i2c_driver sit9531x_i2c_driver =3D {=0A=
+	.driver			=3D {=0A=
+		.name		=3D "sit9531x",=0A=
+		.of_match_table	=3D sit9531x_of_match,=0A=
+	},=0A=
+	.probe		=3D sit9531x_i2c_probe,=0A=
+};=0A=
+module_i2c_driver(sit9531x_i2c_driver);=0A=
+=0A=
+MODULE_AUTHOR("Ali Rouhi <arouhi@sitime.com>");=0A=
+MODULE_AUTHOR("Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>");=0A=
+MODULE_DESCRIPTION("SiTime SiT9531x DPLL subsystem driver");=0A=
+MODULE_LICENSE("GPL");=0A=
diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h=0A=
new file mode 100644=0A=
index 000000000000..0f826313eff8=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/core.h=0A=
@@ -0,0 +1,88 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * SiTime SiT9531x DPLL core driver=0A=
+ *=0A=
+ * Copyright (C) 2026 SiTime Corp.=0A=
+ * Author: Ali Rouhi <arouhi@sitime.com>=0A=
+ * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
+ *=0A=
+ * Device structure, register access helpers, and core function=0A=
+ * declarations.=0A=
+ */=0A=
+=0A=
+#ifndef _SIT9531X_CORE_H=0A=
+#define _SIT9531X_CORE_H=0A=
+=0A=
+#include <linux/gpio/consumer.h>=0A=
+#include <linux/i2c.h>=0A=
+#include <linux/mutex.h>=0A=
+#include <linux/regmap.h>=0A=
+#include <linux/types.h>=0A=
+=0A=
+#include "regs.h"=0A=
+=0A=
+#define SIT9531X_NUM_PLLS		4=0A=
+#define SIT9531X_MAX_INPUTS		8=0A=
+#define SIT9531X_MAX_OUTPUTS		12=0A=
+=0A=
+/*=0A=
+ * struct sit9531x_chip_info - chip variant identification=0A=
+ * @id: variant ID byte read from the device=0A=
+ * @num_inputs: number of input clock pins=0A=
+ * @num_outputs: number of output clock pins=0A=
+ * @name: variant name=0A=
+ * @clkout_map: physical slot of each output index=0A=
+ */=0A=
+struct sit9531x_chip_info {=0A=
+	u8		id;=0A=
+	u8		num_inputs;=0A=
+	u8		num_outputs;=0A=
+	const char	*name;=0A=
+	const u8	*clkout_map;=0A=
+};=0A=
+=0A=
+/*=0A=
+ * struct sit9531x_dev - SiT9531x device instance=0A=
+ * @dev: parent device=0A=
+ * @client: I2C client backing @regmap=0A=
+ * @regmap: the 256-byte register window=0A=
+ * @info: chip variant info=0A=
+ * @multiop_lock: serializes multi-register operations=0A=
+ * @page_lock: held across a page select and its transfer; nests inside=0A=
+ *   @multiop_lock=0A=
+ * @page: current page, -1 when unknown=0A=
+ * @xtal_freq: crystal frequency in Hz=0A=
+ * @reset_gpio: optional reset line, NULL if absent=0A=
+ */=0A=
+struct sit9531x_dev {=0A=
+	struct device			*dev;=0A=
+	struct i2c_client		*client;=0A=
+	struct regmap			*regmap;=0A=
+	const struct sit9531x_chip_info	*info;=0A=
+	/* Serializes multi-step register sequences */=0A=
+	struct mutex			multiop_lock;=0A=
+	/* Serializes a page select and the transfer it is for */=0A=
+	struct mutex			page_lock;=0A=
+	int				page;=0A=
+=0A=
+	u32			xtal_freq;=0A=
+=0A=
+	struct gpio_desc	*reset_gpio;=0A=
+};=0A=
+=0A=
+/* Register page of PLL @pll_idx (0 =3D PLLA, 3 =3D PLLD). */=0A=
+static inline u8 sit9531x_pll_page(u8 pll_idx)=0A=
+{=0A=
+	return SIT9531X_PAGE_PLLA + pll_idx;=0A=
+}=0A=
+=0A=
+int sit9531x_read_u8(struct sit9531x_dev *sitdev, unsigned int reg, u8 *va=
l);=0A=
+int sit9531x_write_u8(struct sit9531x_dev *sitdev, unsigned int reg, u8 va=
l);=0A=
+int sit9531x_read_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx, u8 offse=
t,=0A=
+			 u8 *val);=0A=
+int sit9531x_write_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx, u8 offs=
et,=0A=
+			  u8 val);=0A=
+int sit9531x_update_pll_u8(struct sit9531x_dev *sitdev, u8 pll_idx, u8 off=
set,=0A=
+			   u8 mask, u8 val);=0A=
+=0A=
+#endif /* _SIT9531X_CORE_H */=0A=
diff --git a/drivers/dpll/sit9531x/regs.h b/drivers/dpll/sit9531x/regs.h=0A=
new file mode 100644=0A=
index 000000000000..3a6151f44d61=0A=
--- /dev/null=0A=
+++ b/drivers/dpll/sit9531x/regs.h=0A=
@@ -0,0 +1,36 @@=0A=
+/* SPDX-License-Identifier: GPL-2.0 */=0A=
+/*=0A=
+ * SiTime SiT9531x register definitions=0A=
+ *=0A=
+ * Copyright (C) 2026 SiTime Corp.=0A=
+ * Author: Ali Rouhi <arouhi@sitime.com>=0A=
+ * Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>=0A=
+ */=0A=
+=0A=
+#ifndef _SIT9531X_REGS_H=0A=
+#define _SIT9531X_REGS_H=0A=
+=0A=
+/*=0A=
+ * The page select is at offset 0xFF in every page; some pages are paired,=
 e.g.=0A=
+ * 0x0A/0x1A for PLLA.=0A=
+ */=0A=
+#define SIT9531X_PAGE_SEL		0xFF=0A=
+#define SIT9531X_PAGE_SIZE		0x100=0A=
+#define SIT9531X_NUM_PAGES		32=0A=
+=0A=
+#define SIT9531X_REG(_page, _offset)		(((_page) << 8) | (_offset))=0A=
+#define SIT9531X_REG_PAGE(_reg)		((_reg) >> 8)=0A=
+#define SIT9531X_REG_OFFSET(_reg)		((_reg) & 0xFF)=0A=
+=0A=
+#define SIT9531X_PAGE_OUTSYS0		0x03=0A=
+#define SIT9531X_PAGE_OUTSYS1		0x04=0A=
+#define SIT9531X_PAGE_PLLA			0x0A=0A=
+#define SIT9531X_PAGE_PLLA_EXT		0x1A=0A=
+=0A=
+/* Reg 0x03 holds an unrelated revision byte, not part of the variant ID *=
/=0A=
+#define SIT9531X_REG_VARIANT_ID		SIT9531X_REG(0x00, 0x02)=0A=
+=0A=
+#define SIT9531X_VARIANT_ID_95317	0x17=0A=
+#define SIT9531X_VARIANT_ID_95316	0x31=0A=
+=0A=
+#endif /* _SIT9531X_REGS_H */=0A=
-- =0A=
2.39.2 (Apple Git-143)=0A=
=0A=
