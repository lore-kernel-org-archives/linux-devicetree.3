Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123229;
	b=Lg2g1gWFbe0f3OD3JaBlG0yJWr/B3P8aIb7Z5euDJY7qMcjRW4owp/EC5gAlnCtLOg8C
	 rhj0pOu2Iki31tRvPD6bOwRczrrthDg7apn588na9tq1fXwG9PAsVSw/THeKK1uWbSyXP
	 CsEasnoB7UVBj8SBSqX65NbDMa/agvvVMloWYZrGjVBrZndZi2DmDrqoSMLTKamLpgc/5
	 Whc3Tix/tH2oN5pMQC/gg3a80+h7fBzLLEYrHxE8+FQ6BV9YefqKfcblCjEUFhbJ5OnBG
	 l1ObEkCMc3OK6BySuvkeCDOlMRkbQG8pnZNqfnpPcZFgFwoVR1RAGc1VLG+9JpkJr0Q==
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
	bh=0rsLmNy5oYmLbCEppt0nT909jFNyC2Jz67QP0ymcBxo=;
	b=abCWoV9oLpA7bgtbkML55JuFwyowaQ5unaorIWoS5TSNJsB9ajo94gDRtyVniYUMsosR
	 p/HFnwSPyuTn+kfiX+3E5md1frRb6OwtoXqYTXKzXkD0SxiKZIxQPszx8hY9/xRNNUqy/
	 GWPxX6neLodCIw7s5Ub6D5ZOsPqea+JoOuFnZYVSQAHCe4e9Cmr/2Ooo1VKj/y9mmPVhG
	 9BytTuCMLSecBsXXcz1yTPpo1S60ZOa2egmBv+v9GLFg7VI6ACtUB84rLJ8/cz1SQSe2g
	 5xTE3YUhToZM2EWpO6ycjP0Ip2amKzarAx8Cvve7krP+iTbdTMsU7ihjm9XKexba/vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=iG2chSxW;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=mjV1G0fy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8F560A2628;
	Thu, 19 Nov 2026 21:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8F560A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=iG2chSxW;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=mjV1G0fy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=0rsLmNy5oYmLbCEppt0nT909jFNyC2Jz67QP0ymcBxo=;
 b=iG2chSxW2F147zaW+xnlzeN04OhXJADU02j4xjfYptPvbU7WOrZPeo4jpBinV9Xxmax2lxxlkrnxZ65CRhOLd/1nuECtsijdyAACU4GoOLGTfqSdW2w4/RwKPMT/6Tp7MVkUoZ+PA+oc4iSwWJOhGrsrLoU1NekcNpeAS9KVpDOA5NpTK0/2nbC0SenLWVh9ADi2fX7pWlWM3lMVQyw34D3GLgcxccWbbjdLvhgixEYvVs/lOr8Q4kqs/YJBEXmS5Fq8dVRvIRbJdmr2bhZnQCaRcke9KgZNkQSh47QAx18pbrM26z19SRRXVxdm9oCl9NgclZTHhO9G8mBAkdECHw==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021126.outbound.protection.outlook.com [52.101.57.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 8D71E300081;
	Thu, 19 Nov 2026 21:20:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8c98ichL9pJGng+w76DiCEcdHHYoVzRX4GNtVs1fN+aiuzBW1k35KiB3nsdFLt6pS/FMiIaaE6bXWtaC57/YKXFuAmZzUjd9FVG31UTnlAemu7zz/6ns/n6iawgAyIP0J+uLlh5KRdVlYa6U2w3kLC/uo0bNsvbF96k8UUpE1XxbwgAMbwx4VzZwlbg0Aao8GAP4q0m6z9SB2cONHPL5hC69cSO7KsBbVlFlh37N3TJlkjW+wgilmnR5FUsnVw+if4h4WBAHzGH7hnnSJQ0rBqADb2OCtKlzr58aOocgXBM7SQt+S7AH8mRDXzsb58v7eXfyxktWJ9Bu3tBX+NNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rsLmNy5oYmLbCEppt0nT909jFNyC2Jz67QP0ymcBxo=;
 b=FFaC6dCh6YlMsAILayIDIYf12NIC2gaLRR/FnrdskXl9c7MBeP+NOP0SIE3Q/Y7R9fJ+iaDZXZSiS6Mtk8ZueSbz/RjWB1fy4C1TaLW92HMduW2QU4Ok+XZyt2sPSyZoF6sUJ9Nv013yoMUl1BKH4yOv+t1y6gMmUP2oWHxuzMbBBpUdLsFyIKq5xX7KT0Fs2Yjq93P1NhtRD3hHDqBq0KUr39y7gAsEEghFYwtJeg6dwmE9WXnP9ilFewZAHgh7OMZhkjYw7JAiDzW9UccEcCq/3tLntk4tSUAJMu/wRnKMMS2FHDah3C/fSrH/132BP4aiXInEUNGX1rDx2ZCdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rsLmNy5oYmLbCEppt0nT909jFNyC2Jz67QP0ymcBxo=;
 b=mjV1G0fy2n38mj0ibPJvTGeS1WB8kzMU0so4VoYIKMFD5fdXxcjfB1etJcQshXkWhRW1ARcstZ24MfNISltPIVtZUulWVk3fBqmgzAe2H4ATBzDgA1LftVWW909fHWlp6oqpdO6bR91M5jmTpiFrayKdfNdlQLBwU9qajZCz2D1yP/Zf4BpVcjlmJuzzuySfK8nbjjSt4jLY6LZ7n0/Sd4dAkcQkWy2XiXZWgP72sq4MnKSp7NAMO1kGwG8DR/6xMIadDor4ftHhJthgOOS41awXePg7yqJy2IhP0hn+g7hzuUCLOF3V/pCNjeN5dvzOnkO2I6HSlaEjs0ZW8krlWw==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by CH9PR20MB7644.namprd20.prod.outlook.com
 (2603:10b6:610:2e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 21:20:21 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:20:21 +0000
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
Subject: Re: [PATCH net-next v15 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
Thread-Topic: [PATCH net-next v15 10/13] dpll: sit9531x: implement output pin
 state on a DPLL
Thread-Index: AQHdcVG8PcKy2YROfU62sz4zCf2FH7cxkTGAgARjsIA=
Date: Thu, 19 Nov 2026 21:20:19 +0000
Message-ID: <20261119212014.13180-7-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-11-arouhi@sitime.com>
 <20261117021821.2220343-1-kuba@kernel.org>
In-Reply-To: <20261117021821.2220343-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|CH9PR20MB7644:EE_
x-ms-office365-filtering-correlation-id: 082a3b0b-352a-421b-89a1-08df4682eb1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|261022075727099003|5023799004|261026121527099003|56012099006|4143699003|261026140227099003|261022105027099003|261009223027099003|261021121427099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 psuC9r1ZXcvlwfFjCrdeRLEx4YBzkL2NgbHN9b8AmnCq9NFixE07S+wUSGNlsxx8JZlts+nNrl//hTJmJ1gJN3oTVJsI8bJvyGLmziuDLsZydKNgzcgrTR9e4WiBZ0v+AJ+lV9V6RgSzD1NNi1XXp6/G11ra06MXKpVbjXr8CHcgLKUDg/I+gKgxN1VZ0QjDBfI0IxaHVDRMZOVKILfbhiP39n+P4yKCvSkaPLts0ooKF1azOdv3izvawxU/UobLn7epCbjaqlQ+jWZr4oCDaQyZo4/k2naNimRIt1WH7Y5bv94a9MS4hx9Cs3zcqVoTnKlMTYKxnUdBzshxgxKZrYgoenPzR9YgAIc1+WBl0aSICkXT/vCJRqtW9EZcOjmYW2r3lEJI9FfpzBgrGi8uJQ3MoWI+slVVksrRWqrCAvI8lWPoxUx2K45G4vftSep/tx16cNa13X+yeATp8cd4VCo+bdL8v9sKFrVcyyorhOI9dJQqZXVntGOGHft09vACHJi2l8GwFE6tyIhRPCgB8Zi3gNkVqR6lFTIqcipMBgFuxk/NLzS0nJZj4tWcm+9y5vyZfRa5GaPou2ajyYmGMB5TT10GE6Czyokpujl6e65KquE0tNd5fQPQ+F5uhKVL+5+T04FXeE1mWwr6DvDnFwSq8rNglD/y8AQFxlobc7L9zABq9a5P3CQt1Z+J5A6KrVZRJ0tf3GAnpA0bogUw5vrXyMymdRoIOkw9SQOqHyY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(261022075727099003)(5023799004)(261026121527099003)(56012099006)(4143699003)(261026140227099003)(261022105027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0dCd2xFcDYrWFZVbFhrQnI0Y3B3TUQwYlNzQTJic2czcW0vZURmVURLdHVF?=
 =?utf-8?B?MDZmd0ZQM0dINXdDQ2k3aVRsbGl1TmZTYUJzZkdpWFR3c0xRZFZGNVlZc21J?=
 =?utf-8?B?cE45OEFyR29lcmVjMFZHenJPT3hqQ01EajBJOG9FRk9QTmhyZ1RoTXhCR0RP?=
 =?utf-8?B?QktkUmRlejRBYk1SN2xYaFhKdERKNUhLWEZORGNUV1ZqdnQ2K1YxRXY0eVVW?=
 =?utf-8?B?cnZFQnZWQndhN0krOGNFa05VZmZ1eUYzQmtvMHliTkhSbEFYNzRlbG5LTSt3?=
 =?utf-8?B?RHZrRnYxVWZMd3dFUzdXVlkwMjBIOUZOWkY2UmVNS2s0YW9DWjArYTE5ZWI4?=
 =?utf-8?B?bXpaYjgrc29sVG5IeFI4K3luemIzaGRJbEFwdkREbDZWU1VZc0FsQ216bmo0?=
 =?utf-8?B?Nk4raTAwam56ejdOOGdYaVh5K0d6UEZQUWloZ0s0QXFLT0hkbVZ1Mks3WHYr?=
 =?utf-8?B?S3pBV01vVzE1TFpRdzdTa1FGK0x4Q1F4WGRtMFVjMnRSNll6em5VdXQzVEV4?=
 =?utf-8?B?b0s4cGtFbmdyVTVtZldXVkVEdkxTQmRHY2xicENkY0ExckVIYU9FbDZHcUR5?=
 =?utf-8?B?YlViRGdpclFUMWFlN2FDMFdYYU5FSnlwMExvUjFIK0F5dHcwZUx3S2c2SjUx?=
 =?utf-8?B?TG11OUJKVzlTYTVVWFVjbmI0S2pLR1VsYXJaeXRIYXJ3bkUxZFlIRXNvZFdw?=
 =?utf-8?B?MEZaVVRWVFoxQXgzT2lWZnIxYjBrNGxCQWZqSDZMUGdCenZPalc2bzJ3M1VZ?=
 =?utf-8?B?U2RjZmNSbjN6UXM0R3pNOGVCNnd2cFRiQklSL2NZSGlXMCswUVhWOHF6RW53?=
 =?utf-8?B?K0k3NmE2YXRnTWdSdURnTFVOdFJsalZLckpad2pkQk4zNWlCaTU4dlZ3UGF3?=
 =?utf-8?B?cmVoa1YyVzIwOUpTMlhGVDlSTFEybStnUTExQ1dmTjcvUDl6TGRudjVHcXpC?=
 =?utf-8?B?UFZ1U0VTRDE4MWVkVnJsZE9NM1duN2NNaGZGQlRJYzJVa0N1N3lKTTFGTVJa?=
 =?utf-8?B?ZFlHd0FtVWVDVWF4bDFjRjl0QU5DeXVHaVBkKzlwRmc4TXFrL3p1NEZBVWRM?=
 =?utf-8?B?WUtiYWswYzd2anplVlZYZUxhcUd2QkJzY3NaS1BPQTk0SWdRNnRqb0dEVkpu?=
 =?utf-8?B?UGtSZzJ1aHpQbzFvdXFjd1ZXY0U0b2c2M0tLVHV0VzkwUUpRUWw3bkN2RzY2?=
 =?utf-8?B?dlZGSE9uUEFGNmhwelFWWnAyeWhmMnFXTFJ3bEg4bGd3ZGZVR2U2SUN5M3dC?=
 =?utf-8?B?Y0pYNDN6TUhXR2MzcHpNdmdGUTErcUVCNExkdUZ0V0wvVUU3RVpub0FhUUhJ?=
 =?utf-8?B?TW5RSitCYUZ5a2xUMnlUZmUzUTZqT0UrcmZQYzVyck1SbjlFcEhrY3BHSTdC?=
 =?utf-8?B?akZEeXMyejkyMG5jRDZhUjE0cjRoVWxGYnJ6a21aMTRIVkorektZamREdDBI?=
 =?utf-8?B?anQxOTZBVTJxTDg0N3lYZzdtMVQ4bVluVEtwME5FVEZpUGlGc3YvMTZtL3Er?=
 =?utf-8?B?aDNXbnVsdkxUNUtFWS9CYjdQUFlKaGlJVVFUNEozcFVUT3BhbGJmdTBoNERn?=
 =?utf-8?B?RVpjYTFOelljZ1IrN3JSaHBXYWRZVlJqNlAwUTlXb2RPelQ4VnBuL2o1M1lk?=
 =?utf-8?B?QXg1TmlpUTV0WWQrREtNdVZUeHNJL0RTUVAzcTZsLzE4d2FsWXRjdTNIUm5C?=
 =?utf-8?B?enVYU0NzZFNOeFFXeTQxZ2ZodW1wd3dIeWVUOUZQcmwzZWQ1NlUxM1ZlVVpD?=
 =?utf-8?B?bGVNUDl4bk5UU1RsRWxoMTQybVoxTnV1Yk9BbEdJRGJncDZXL0ErdDAyN0F6?=
 =?utf-8?B?K3FtZW5GWmRsTDVGVmphTG41OUowWXdQSVB2RHFZcHZ4Y0xOaTlaSmloOTc3?=
 =?utf-8?B?RDMwMStzeWZjbXh4cFk3eURyMHAvc3JUbndUK21rUVFUejFsQlRqdWZqQkF6?=
 =?utf-8?B?MGFwMElsaEF0Z29Lc2tQQWNNNVF5eUFPaHhIM2E0YW1wWWZZK1JxRE9FVEJy?=
 =?utf-8?B?b0NhSXlsYjBYR1lEdUQ0cVFkdHZtT0RsNFpwb3NxNWU5NGxtRjZTVDBibTBK?=
 =?utf-8?B?TVJjMkdyUUFLZVRiQzVKVHZib2tudEN3RkJNT0hBdHkxbzc5SHRRTXAzTVlF?=
 =?utf-8?B?ZEdkYWNiNmEwQ01LOFFONEdiTjlXZUJTcmJvTkdkWGJiUW9kZmxmM01JQ3dk?=
 =?utf-8?B?OTVmdFljQThUS2NHSkJJMDJzNzVQWEhvZlVlSm80eEpKQk5iUWpnSDVRNEcz?=
 =?utf-8?B?cy9vLzg4OFpLaEg4cC9ldkR5L0Nqai9CVldaYWcyeGhDVDJ4R0I3dFc3SmpJ?=
 =?utf-8?Q?i94LsZJSWlfApDk98r?=
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
	1a3hMmCqvR+LwgHrKxpPn4YP04hPmkhEBwl6ubuY9XAK5YZRLFI2clp6ghfz4fk6nqk3kthbdvbLdJiSdQE7JmBgvkzl31d/Cjkdy4jaKRaSP83Pq1fpTreln8+WiZlg3k0YHeADB4AaDbosjMJiNMaSD6wCHUxJLDHpI5/UomdBj3hXPFBW1/3fnJS+mFuLiSpx+o6aqHrd6W/+66vZwe4qlJGayhjXlD1fxsgu6yF1Tq4haqaW8qEqbsqVjS0L1Bj7eidnb8zCWd8R/bAGIna7fflqkFo8Zyg8SbaLXFw2VbJJnCocIUVG8aaRe6Td0e6OohR4Ue9PQ1Mz5P36IA==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082a3b0b-352a-421b-89a1-08df4682eb1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:20:19.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +kxsXQh85R4lk8g6ks4D4+/mno4ag7a4MwYNAmKM6bJYUaQiPc+q/nO/v/Q8rwmqaKQrSMIeWXxmbyB4xhlnEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR20MB7644
X-MDID: 1795123227-n1AQN2o1Djjm
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795123227;n1AQN2o1Djjm;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gTW9uLCAxNiBOb3YgMjAyNiAxODoxODoyMSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6
Cgo+ID4gKwlyYyA9IHNpdDk1MzF4X3dyaXRlX3U4KHNpdGRldiwgU0lUOTUzMVhfUkVHX1BSR19E
SVJfR0VOLAo+ID4gKwkJCSAgICAgICBTSVQ5NTMxWF9QUkdfQ01EX1NUQVRFKTsKPiA+ICsJaWYg
KHJjKSB7Cj4gPiArCQlzaXQ5NTMxeF9wcmdfY29tbWl0KHNpdGRldik7Cj4gPiArCQlyZXR1cm4g
cmM7Cj4gPiArCX0KPgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IElmIHRoZSBTSVQ5NTMxWF9QUkdf
Q01EX1NUQVRFIHdyaXRlIGZhaWxzLCBzaG91bGQgdGhpcyBwYXRoIHJlYWxseSBydW4gdGhlCj4g
ZnVsbCBzaXQ5NTMxeF9wcmdfY29tbWl0KCk/Cj4KPiBCZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGZh
aWx1cmUgcGF0aCBjYWxsZWQgc2l0OTUzMXhfcHJnX2Fib3J0KCkuIEl0cyBjb21tZW50Cj4gd2Fz
ICJDbG9zZSB0aGUgbG9vcHMgYW5kIGxvY2sgdGhlIGRlYnVnIGJsb2NrIHdpdGhvdXQgY29tbWl0
dGluZyIuCj4gc2l0OTUzMXhfcHJnX2NvbW1pdCgpIHN0YXJ0cyBieSB3cml0aW5nIHRvIHRoZSBz
YW1lIHJlZ2lzdGVyIHRoYXQganVzdAo+IGZhaWxlZDoKPgo+IAlyYyA9IHNpdDk1MzF4X3dyaXRl
X3U4KHNpdGRldiwgU0lUOTUzMVhfUkVHX1BSR19ESVJfR0VOLAo+IAkJCSAgICAgICBTSVQ5NTMx
WF9VUERBVEVfTlZNKTsKPgo+IEFmdGVyIHRoYXQgaXQgcmV0cmllcyBMT09QX0xPQ0ssIHJld3Jp
dGVzIHNpdGRldi0+bG9vcHNfb3Blbiwgc2xlZXBzIDEwMCBtcwo+IHVuZGVyIG11bHRpb3BfbG9j
ayBhbmQgY2xvc2VzIHRoZSBkZWJ1ZyBrZXkuIEl0cyByZXR1cm4gdmFsdWUgaXMgaWdub3JlZAo+
IGhlcmUuCj4KPiBTbyBhbiBlbnRyeSB0aGF0IG1heSBuZXZlciBoYXZlIHJlYWNoZWQgUFJHX0NN
RCBub3cgc2VuZHMgYW4gTlZNIHNoYWRvdwo+IHVwZGF0ZS4gVGhlIGNvbW1lbnQgYWJvdmUgc2l0
OTUzMXhfcHJnX2NvbW1pdCgpICgicmUtbG9jayB0aGUgbG9vcHMgYWZ0ZXIKPiBzaXQ5NTMxeF9w
cmdfZW50ZXIoKSIpIGRvZXMgbm90IHNlZW0gdG8gZGVzY3JpYmUgdGhpcyBjYXNlLgo+Cj4gVGhp
cyBhbHNvIGNoYW5nZXMgaG93IHRoZSBleGlzdGluZyBjYWxsZXIgc2l0OTUzMXhfb3V0cHV0X2Zy
ZXFfc2V0KCkgZnJvbQo+IHRoZSBwcmV2aW91cyBwYXRjaCBiZWhhdmVzIG9uIGZhaWx1cmUuIFRo
ZSBuZXcgc2l0OTUzMXhfb3V0cHV0X2VuYWJsZSgpIGFuZAo+IHNpdDk1MzF4X291dHB1dF9kaXNh
YmxlKCkgcGF0aHMgZ2V0IHRoZSBzYW1lIGJlaGF2aW91ci4gVGhlIGNvbW1pdCBtZXNzYWdlCj4g
ZG9lcyBub3QgbWVudGlvbiB0aGUgY2hhbmdlLgo+Cj4gV2FzIHRoaXMgbWVhbnQgdG8gYmUgcGFy
dCBvZiB0aGlzIHBhdGNoLCBvciBzaG91bGQgYSBjb21taXQtZnJlZSBhYm9ydCBzdGF5Cj4gb24g
dGhpcyBwYXRoPyBUaGUgc2FtZSBjYWxsIGlzIHN0aWxsIHRoZXJlIGF0IHRoZSBlbmQgb2YgdGhl
IHNlcmllcy4KCkFncmVlZCwgYW5kIGFscmVhZHkgY2hhbmdlZDogYSBmYWlsZWQgZW50cnkgbm93
IG9ubHkgcmUtbG9ja3MgdGhlIGxvb3BzCmFuZCBjbG9zZXMgdGhlIGtleSwgd2l0aG91dCB0aGUg
YmFuayB1cGRhdGUuIFRoZSBiYW5rIHVwZGF0ZSBpcyB3cml0dGVuCm9uY2UsIGJ5IGEgZnJlcXVl
bmN5IGNoYW5nZSB3aG9zZSBkaXZpZGVyIHdhcyB3cml0dGVuLgoKPiA+ICsJCQkJCQkgIGZhbHNl
KTsKPiA+ICsJCQlpZiAocmMpCj4gPiArCQkJCXJldHVybiByYzsKPiA+ICsJCX0KPiA+ICsJCXJl
dHVybiAwOwo+ID4gKwl9Cj4KPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBEb2VzIHVuLW11dGUgbG9z
ZSBhIEhpLVogZm9yY2Ugc2V0IGJ5IHRoZSBsb2FkZWQgcHJvZmlsZT8KPgo+IFRoaXMgYnJhbmNo
IGNsZWFycyB0aGUgTUFTSyBiaXQgb2YgYWxsIHRocmVlIHBhaXJzIGFuZCByZXN0b3JlcyBub3Ro
aW5nLiBUaGUKPiBtdXRlIHBhdGggc2F2ZXMgbWFza1tdIGFuZCBzdGF0ZVtdLCBidXQgdXNlcyB0
aGVtIG9ubHkgdG8gcm9sbCBiYWNrIG9uCj4gZXJyb3IuCj4KPiBUaGUgY29tbWl0IG1lc3NhZ2Ug
c2F5cyAiYW4gdW4tbXV0ZSByZWxlYXNlcyB0aGUgZm9yY2UgYW5kIHRoZSBwYWRzIHJldHVybgo+
IHRvIHRoZSBsb2FkZWQgY29uZmlndXJhdGlvbiIuIFRha2UgYSBDTU9TIG91dHB1dCB3aG9zZSBw
cm9maWxlIGZvcmNlcyBvbmUKPiBwYWQgYW5kIGxlYXZlcyB0aGUgb3RoZXIgZHJpdmluZyAocGFy
dF9tdXRlZCkuIEhlcmUgdGhlIGZvcmNlIG9uIHRoYXQgcGFkCj4gaXMgY2xlYXJlZCB0b28uCj4K
PiBzaXQ5NTMxeF9kcGxsX291dHB1dF9waW5fc3RhdGVfb25fZHBsbF9nZXQoKSByZXBvcnRzIHN1
Y2ggYW4gb3V0cHV0IGFzCj4gQ09OTkVDVEVELCB3aGljaCBtYXRjaGVzIHRoZSBjb3JlLmgga2Vy
bmVsLWRvYyAoInJlcG9ydGVkIGFzIGRyaXZlbiIpLgo+IEhvd2V2ZXIsIHNpdDk1MzF4X2RwbGxf
b3V0cHV0X3Bpbl9zdGF0ZV9vbl9kcGxsX3NldCgpIHNraXBzIGEgcmVxdWVzdCBvbmx5Cj4gd2hl
biBwYXJ0X211dGVkIGlzIGNsZWFyOgo+Cj4gCWlmICghc2l0OTUzMXhfb3V0cHV0X3N0YXRlX3Jl
ZnJlc2goc2l0ZGV2LCBkcGluLT5pZCkgJiYKPiAJICAgIHNpdGRldi0+b3V0W2RwaW4tPmlkXS5l
bmFibGVkID09IGVuYWJsZSAmJgo+IAkgICAgIXNpdGRldi0+b3V0W2RwaW4tPmlkXS5wYXJ0X211
dGVkKSB7Cj4KPiBkcGxsX3Bpbl9zdGF0ZV9zZXQoKSBpbiB0aGUgRFBMTCBjb3JlIGRvZXMgbm90
IGNvbXBhcmUgYWdhaW5zdCB0aGUgY3VycmVudAo+IHN0YXRlLiBTbyBhIHJlcXVlc3QgZm9yIENP
Tk5FQ1RFRCwgd2hpY2ggR0VUIGFscmVhZHkgcmVwb3J0cywgc3RpbGwgcmVhY2hlcwo+IHNpdDk1
MzF4X291dHB1dF9lbmFibGUoKS4gVGhhdCBydW5zIHRoZSAxMDAgbXMgcHJvZ3JhbW1pbmcgc2Vx
dWVuY2UgYW5kCj4gcmVsZWFzZXMgdGhlIHBhZCB0aGUgcHJvZmlsZSBrZXB0IGluIEhpLVouIEEg
bXV0ZSBmb2xsb3dlZCBieSBhbiB1bi1tdXRlCj4gZW5kcyB0aGUgc2FtZSB3YXkuCj4KPiBTaG91
bGQgdGhlIHVuLW11dGUgcHV0IGJhY2sgdGhlIHByb2ZpbGUncyBvcmlnaW5hbCBmb3JjZSBiaXRz
IGluc3RlYWQgb2YKPiBhbHdheXMgY2xlYXJpbmcgdGhlbT8gVGhpcyBjb2RlIGlzIHVuY2hhbmdl
ZCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuCgpBZ3JlZWQuIFRoZSBuZXh0IHJldmlzaW9uIHJl
Y29yZHMsIGF0IHByb2JlLCB0aGUgcGFkIHRoZSBsb2FkZWQKY29uZmlndXJhdGlvbiBmb3JjZXMg
b24gYW4gb3V0cHV0IGl0IGxlYXZlcyBkcml2aW5nLCBhbmQgYW4gdW4tbXV0ZQpyZWxlYXNlcyBv
bmx5IHdoYXQgdGhlIGRyaXZlciBmb3JjZWQsIHNvIGJvdGggc2VxdWVuY2VzIGFib3ZlIGVuZCB3
aXRoCnRoZSBwYWRzIGFzIHRoZSBjb25maWd1cmF0aW9uIHNldCB0aGVtLgoKPiA+ICsJaWYgKHJj
KQo+ID4gKwkJcmV0dXJuIHJjOwo+ID4gKwo+ID4gKwlyYyA9IHNpdDk1MzF4X291dHB1dF9oaXpf
d3JpdGUoc2l0ZGV2LCBzbG90LCB0cnVlKTsKPiA+ICsKPiA+ICsJcmV0ID0gc2l0OTUzMXhfcHJn
X2NvbW1pdChzaXRkZXYpOwo+Cj4gW1NldmVyaXR5OiBMb3ddCj4gVGhpcyBpc24ndCBhIGJ1Zywg
YnV0IGV2ZXJ5IG11dGUgYW5kIHVuLW11dGUgcnVucyB0aGUgZnVsbCBvdXRwdXQtc3lzdGVtCj4g
cHJvZ3JhbW1pbmcgc2VxdWVuY2UuIFRoYXQgaXMgZGVidWcgdW5sb2NrLCBQUkdfQ01ELCBVUERB
VEVfTlZNLCBMT09QX0xPQ0sKPiBhbmQgYSAxMDAgbXMgc2xlZXAgdW5kZXIgbXVsdGlvcF9sb2Nr
Lgo+Cj4gVGhlIGNvbW1pdCBtZXNzYWdlIHNheXMgdGhpcyBoYXBwZW5zICJpbnNpZGUgdGhlIHBy
b2dyYW1taW5nIHN0YXRlIi4gVGhlCj4gcHJldmlvdXMgcGF0Y2ggZGVzY3JpYmVzIHRoZSBzZXR0
bGluZyB0aW1lIG9mIHRoYXQgc3RhdGUsIGFuZCB0aGUgY29tbWVudAo+IGluIHNpdDk1MzF4X2Rw
bGxfb3V0cHV0X3Bpbl9zdGF0ZV9vbl9kcGxsX3NldCgpIGRvY3VtZW50cyB0aGUgMTAwIG1zCj4g
bG9vcC11bmxvY2sgd2luZG93LiBTbyB0aGlzIGlzIG1vc3RseSBjb3ZlcmVkIGFscmVhZHkuCj4K
PiBXb3VsZCBpdCBzdGlsbCBiZSB3b3J0aCBzdGF0aW5nIHRoZSBjb3N0IGV4cGxpY2l0bHkgaW4g
dGhpcyBjb21taXQgbWVzc2FnZT8KClRoYXQgY29zdCBpcyBnb25lIGluIHRoZSBuZXh0IHJldmlz
aW9uOiB0aGUgZm9yY2UgYml0cyBhY3Qgd2hlbiB3cml0dGVuLApzbyBhIG11dGUgb3IgdW4tbXV0
ZSB3cml0ZXMgdGhlbSB1bmRlciB0aGUgZGVidWcga2V5IGFuZCBub3RoaW5nIGVsc2UuCgo+ID4g
KwlpbnQgcmMgPSAwOwo+ID4gKwo+ID4gKwltdXRleF9sb2NrKCZzaXRkZXYtPm11bHRpb3BfbG9j
ayk7Cj4gPiArCW91dCA9IHNpdDk1MzF4X291dF9zdGF0ZV9nZXQoc2l0ZGV2LCBkcGluLT5pZCk7
Cj4gPiArCWlmIChvdXQtPnN0YXRlX3N0YWxlKQo+ID4gKwkJcmMgPSBzaXQ5NTMxeF9vdXRwdXRf
c3RhdGVfcmVmcmVzaChzaXRkZXYsIGRwaW4tPmlkKTsKPgo+IFtTZXZlcml0eTogTG93XQo+IENh
biB0aGlzIHJlcG9ydCBhbiBvbGQgbXV0ZSBzdGF0ZSBpZiB0aGUgSGktWiBmb3JjZSBiaXRzIGFy
ZSBjaGFuZ2VkIG91dHNpZGUKPiB0aGUgZHJpdmVyPwo+Cj4gVGhlIGhhcmR3YXJlIGlzIHJlYWQg
YWdhaW4gaGVyZSBvbmx5IHdoZW4gc3RhdGVfc3RhbGUgaXMgc2V0LiBUaGUgcG9sbAo+IHJlLXJl
YWRzIGFuIG91dHB1dCBpbiBzaXQ5NTMxeF9kcGxsX291dHB1dF9udGZfcGVuZGluZygpIG9ubHkg
d2hlbiB0aGUKPiBkcml2ZXIgaXRzZWxmIGhhcyBzZXQgbnRmX3BlbmRpbmc6Cj4KPiAJaWYgKCFv
dXQtPm50Zl9wZW5kaW5nKQo+IAkJcmV0dXJuIGZhbHNlOwo+Cj4gU3VwcG9zZSBhIHByb2ZpbGUg
aXMgcmVsb2FkZWQsIG9yIHRoZSByZWdpc3RlcnMgYXJlIHdyaXR0ZW4gd2l0aCBhbiBJMkMKPiB0
b29sLCB3aGlsZSB0aGUgZHJpdmVyIGlzIGJvdW5kLiBHRVQgdGhlbiBrZWVwcyByZXR1cm5pbmcg
dGhlIG9sZAo+IENPTk5FQ1RFRC9ESVNDT05ORUNURUQgdmFsdWUsIGFuZCBubyBwaW4gY2hhbmdl
IG5vdGlmaWNhdGlvbiBpcyBzZW50Lgo+Cj4gVGhlIGlucHV0IHByaW9yaXR5IHRhYmxlcyBhcmUg
aGFuZGxlZCBkaWZmZXJlbnRseTogdGhlIHBvbGwgcGlja3MgdXAKPiBleHRlcm5hbCByZXdyaXRl
cy4gVGhlIG91dHB1dCBmcmVxdWVuY3kgYW5kIHBoYXNlIGdldHRlcnMgcmVhZCB0aGUKPiByZWdp
c3RlcnMgbGl2ZS4gTGF0ZXIgaW4gdGhlIHNlcmllcyB0aGUgY2FjaGUgaXMgcmVmcmVzaGVkIG9u
IHJlc3VtZSwgYnV0Cj4gcnVudGltZSBwb2xsaW5nIHN0aWxsIG5ldmVyIHJlZnJlc2hlcyBpdC4K
Pgo+IElzIHRoYXQgZGlmZmVyZW5jZSBpbnRlbmRlZD8KCkludGVuZGVkLiBUaGUgcG9sbCByZWFk
cyB3aGF0IHRoZSBwYXJ0IGNoYW5nZXMgYnkgaXRzZWxmLCBhbmQgdGhlCnByaW9yaXR5IHRhYmxl
IGJlY2F1c2UgdGhlIHJlLXNlbGVjdGlvbiBkZXBlbmRzIG9uIGl0LiBUaGUgZm9yY2UgYml0cwpj
aGFuZ2Ugb25seSB3aGVuIHNvbWV0aGluZyB3cml0ZXMgdGhlbSwgYW5kIGEgd3JpdGUgdW5kZXIg
YSBib3VuZCBkcml2ZXIKaXMgdGhlIEkyQ19TTEFWRV9GT1JDRSBvdmVycmlkZTsgcG9sbGluZyB0
d2VsdmUgb3V0cHV0cyB3b3VsZCBhZGQgYWJvdXQKZmlmdHkgdHJhbnNmZXJzIHRvIGV2ZXJ5IHRp
Y2sgZm9yIHRoYXQgY2FzZS4gUmVzdW1lIHJlLXJlYWRzIHRoZW0gc2luY2UKYSBwb3dlciBsb3Nz
IHJlbG9hZHMgdGhlbS4K
