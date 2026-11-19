Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123226;
	b=oKc9MledmXkphUWkFFjp8emsyPQys8w1c5OWNKSd2+h4a4t15U+KWPhsUriZBb/tkNzw
	 KVChc5FGkIFYjquB98k6rjOR2sQEgPbPhg6vhjXOQwnUefVbxQPH3/LFkXg1GyR4OzS3S
	 Az3IsLfB5F6SEQiIRwi/Mm0E/VfFG14383sK0llhc0ub7R62XSKDkB1YxoeM8q/JTrM7s
	 bRF6Rb22/3zgEvwfHuDiOx+EMBlzFDFQ5xS2amMFYD/Bd2YcuTSNOy2bZVGqHcvVBTBOB
	 aosaRj3jEVM3fIID7bELcCFd5hQjQ3DejvCYhYmSk07HXD8yV+SERyCtqHaR3tppwHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123226;
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
	bh=cwlEmOGhxy2o5Zl/uOysBdoTKh+AJOPlfau4cDIe0r8=;
	b=UNMZZUY4zDvhfgfUVnTcnxxrte2iMR1jkc9dLa3tmVMOILcMLe3kwEWhuyYwoP+AqaGy
	 5M3gaE7k7GJpuCEJUpDEJ0f8lxrJ+HS4HlhBGmfOtVEi49D23HP5dyFJF5+Er8r9VNL0V
	 6kV3j6dyMlVQR5lSeqTGh6MPkSiU9eiicG47ANI+gYW+eg0jbgcoYwikF758DLHGGkezs
	 XKOgwaxoki7TBLPOEns2LzLZLPx0whBX3m1aDoQ1SSRlN/Leq75hcE0gHav9cTtUIvMAX
	 yohNCJe5z7e6HzYguQTIoak+dPXfDXdqy9tIib+SNBh/3TvkSj4bNs659XZkX6CFBxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=oz98DMcY;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=aYNxP9yz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17B606A337;
	Thu, 19 Nov 2026 21:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E17B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=oz98DMcY;
	dkim=pass (2048-bit key) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=aYNxP9yz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=cwlEmOGhxy2o5Zl/uOysBdoTKh+AJOPlfau4cDIe0r8=;
 b=oz98DMcY/1cM1pg/YaKCJYprdOSgYIHwtf/plm2kTS1krkZxb1q5bOGfU43VWhQMRFDK4sQYQqB7vvQw4WWSxpBs87HPBBCkVHKsBeHOQm06eRg1Kr5YSuA/2ro3tZ10Y0pABVJTC0NaSBjTg2PMH4GtZfRuO7eNq2UCBmQ1aUfnnkEMXKOd5IB+BJAm5ehEfBEQ4snjEWkD75DdoTIMxjT6MX/PMpI4KGsl8MgOV07guq4EK9zb0wnOJWqa/tHcUK/B79HgLpy8+wQny30wPSt3iLfgh/nPcQr5NGwL9eKYO1/1yxY3YyRz1NQPBniFjyCVrvdqvQ67Gs5+jM7DiQ==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id ABCCD80078;
	Thu, 19 Nov 2026 21:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRiyu48ZOxlifDUAc4IzoTO5B2bi6T7Tkgrwk4v1jsUv3iB7bEoAZFbtZskc6sI0L+enEB1CZmG8EyA34gqMXc0hfVjNSKQbpp3+mMy24GH4ltNJuhDDUUHzsHvE6mEA6q85Wq6nzBVmTC2yyRTYJhsvX5J+5aqz+WRB6U3bUk21FYKSo7RWIXsA/TbPP5hNRF4qN3KnCBmT8t0kD8tHUMKFYn22E2GXnWsJn/ZyVXwooVQb7Ns8cDA3XdrweI1LQIq6lwLYX6irHf7Gmf5DhhWONZB0Oy/2I25jek2m2cwJ+FDqH1x7e5cv4PCeRRFB/nrNioWNtnHaFiT0HDMQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwlEmOGhxy2o5Zl/uOysBdoTKh+AJOPlfau4cDIe0r8=;
 b=rw7XoQgRugLOf7bVZow2S+EhDLGPtSRwVhGJxhkK/rgLeJAPXYwFzeu0nOtdT0yTF7YFw9aoFjw7FFBvdzooTH6fKqcOXafXjIXY+Mf/kwxDGNqywG90LgcIcAKITkLy4H76xPX1VJdfyLrE+X4405nK1ab/fIaAM/iGwlt5AyjLK2RfAadGXlJSww8xVs5LWv7MueVdNBwwjN1LCvaFeYxl8117CKLoDuxFwMu/NfX5lcyFFcSZI/x3vAgKB2IrmNol8CBuTrf9pYd+7kvHga2vmt35Lf1rZFE2u25R5U8tRfFumomDocKjPGpthzU6/wpcpZxEkt8PD/TTs1vSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwlEmOGhxy2o5Zl/uOysBdoTKh+AJOPlfau4cDIe0r8=;
 b=aYNxP9yz1DC0mC8SvdeCTZ1M0d4KigOSzuFXAUS23mhU/dnT5V45F+4dQQGG58OnU7OGcMaRwFtw3z32NVEvPHD8OVLqXMp/93KGb8u1Whbq90aFTCduGZp2jljONgzgVFUS88cQtCmJwLtfInIo7fGr3gxDDYvSu/1PqRCh3PdN7iqZa++cHz3V0UcNMFTGfAT3Y6CyXio6vLKw/6/av6F8QfBQIUzM45/7gkgzrTJGvVxqK2EzJZ8NMM2MvUgUXsK1pFqZdsjhj0cYAG3gwTS0oKdxlIKg4RU/buNzbTmhecFBREgxJrKkcXwEZC8/8MHcfaFO0AWWGQdMXHCVjg==
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 (2603:10b6:408:3bf::16) by MW4PR20MB5323.namprd20.prod.outlook.com
 (2603:10b6:303:208::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:20:19 +0000
Received: from LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01]) by LVWPR20MB994915.namprd20.prod.outlook.com
 ([fe80::9551:3864:128b:8c01%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 21:20:19 +0000
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
Subject: Re: [PATCH net-next v15 08/13] dpll: sit9531x: add support to get and
 set priority on input pins
Thread-Topic: [PATCH net-next v15 08/13] dpll: sit9531x: add support to get
 and set priority on input pins
Thread-Index: AQHdcVG7r/DTKG8xlUa/EOqn+s4R0bcxkSsAgARjtIA=
Date: Thu, 19 Nov 2026 21:20:18 +0000
Message-ID: <20261119212014.13180-5-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-9-arouhi@sitime.com>
 <20261117021816.2220207-1-kuba@kernel.org>
In-Reply-To: <20261117021816.2220207-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MW4PR20MB5323:EE_
x-ms-office365-filtering-correlation-id: bbffdfd4-6362-441e-7872-08df4682e9df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|4143699003|56012099006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261102130727099003|261022105027099003|38070700021|10067099003|261026121527099003;
x-microsoft-antispam-message-info:
 2/FmqWfO7nZtyxWi3kSWlPw9ryk92Q5G3ztB2W7kfP8Crcs4v9x3VM0poPJdcvYIDFl9KyNQdW347dv4RyBrJ72TNUG1tn2RZNIUg1Cf9ssySFJv5sAmCYvTKUApZQYUbu242tO9tZFfs3X7acD2xR6LWUaODPjQDZS2XeDx5jDoHWyW3VNhgo12Hft/oJG9wj2BMhAAkH7ex/FSBlyKS7YSI6Np7cYCnnCstQ83DOvsG7fQ5phWTIVQ9j5GvX4ns/JMc6ssEHIEH4dldCVXjmjYo+HDM4wHRkOA6OkLCzelvY/6kG7UwrBAeXFB3w8D1eOWpAMiKcCOibjdDoJPAxXQO/gtn6V1B962uzDfD4E/WQpZ+yuJDca4kUkhWEyC2cSTtPss6ZkTG/2pW4LNOjG8KcVdhWiWvN1fieb3Qdv/3qMLpDJ8m2qk2JauTaoHNElicD3l6kIXRW2VFqE/1eAgsguGpPpQZWmkAZpgCnNFeFZ1T0eTW+bSayyHHABnlE5BAXiw7f8bl0YltjS8RBgRmxm5FtikwUGBkIFQt3mzaVcjz8ref6G2VBrKqm/+0OrYHMw44NTLeAzxweRICvWG1YpRCsDKYHI1LFIrdbP36w6cNzQjHErkjVwnI+L6NeZeWZlqdztVUQMB/XP0pGoaT1NQLYTvt/CwamywSJZe5V2nKZB3HAhGsYiPRhRrNRCDYK6PlQl2po+L0tY2MUjP/X95FTwjf5xyYZyZU90=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261102130727099003)(261022105027099003)(38070700021)(10067099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czM3dy92RFdrMU9lZ2RHeUhBUzFhTXdydVVPMlhUZHZ4LzRMWUU1c29DN3Nj?=
 =?utf-8?B?OG1VNURuWW0vR0d6UXJOMUpMcFB0RnE1T3NFYUhtenBJdmt4ZnQxSHgrQVRt?=
 =?utf-8?B?S3FPU1hJcWEvU1U5NUo2K2E2b2FRODhLaWI4bTdtN3U0TTU4YkVtekdLcnVE?=
 =?utf-8?B?RXJLaVRqamFpVlhHL1puNWxBY1RnUXVPYWczTXhBeDgxd0J6WVRxczdZTENv?=
 =?utf-8?B?dVN3ZkErODZuSjUwa0FRNFdQcG5IQ2FBYmh5Q05Vc25RS0pCRHhDa3pmZ1BF?=
 =?utf-8?B?WGRqTDM1RmgxQWNkOG04Vy9DaitrNXJTeXd1UG9lZW9CREpPUVdzQ2R4Nm9T?=
 =?utf-8?B?RTM5SXNWOHdlU2E5YjQybjBwVFUvc3o4UlVJb0s4TFVkKzRtMnNoNFdrTlVW?=
 =?utf-8?B?VjhlZm1NNkc5eU1JZk9DdXlFck1hdXRZSFVJMmdVc0htU3dacGZlQTQwZWdy?=
 =?utf-8?B?WGFoMWRBbytOZTM0bE9rS2hLNUFQRnRzeGJiNmxjMyt6c05ESVJDMDV3R1h3?=
 =?utf-8?B?bWJsOEVqYnJSR2doTmZvR1h1RVIzQVN4dnV5QkcwTTFNT3QvWXNPVUhCRzl2?=
 =?utf-8?B?YzduL3h5TnBaNHozTG50cUxBR3JrbVozSE04U3hsVnFKL3M0cjJoek9OVlY0?=
 =?utf-8?B?YWcxcUt5d3B2bk5icGZFZDd0aXFBc2l1ZFY1ZjNpWGNtZ0l6czBJbHJwSHo5?=
 =?utf-8?B?WEp3U3B0YnkraXlpK0FOUGFNWUNpWW4xZFpGcDRsZzRpU2RZT2dxS0pFRE9G?=
 =?utf-8?B?ajF5YUE1YWZUeGFTTDY5SWVQQVBBVjh6c1duVkZadEI3UGRXS0lrQVpHZzh6?=
 =?utf-8?B?OFp6RW9IcVp2ZDRpeERVZWlBTHFjVi92MWpkNzdrV0tkZDVKOG8ra0RIcXlG?=
 =?utf-8?B?RHcrZnpzOTY3QmhLSlpRWHZwMEVWS2M2MjVkSWRrRk1WNnpydzZ2K3liZWlO?=
 =?utf-8?B?M2xkRWxWM2Fta2JQbEZtMXQ2Njh6TW5vUDZNVFV1Nnc2UklsQkkzcFNZVTRU?=
 =?utf-8?B?T3hWT0t5SjFnZks2WHB3S0szb0NRK1ZJUWY2b1k4dG5qSmYzb0NXaFhUTGYv?=
 =?utf-8?B?OWpJZ1VHeW1JemhweWZNTWphbWRzZUpCN3ZNTHN4UUhkdTRJM2dTa3RLaVA1?=
 =?utf-8?B?UkZKSVl2TVprcWtxbnFQUCtBNS8vRGwzWTc1R2F5c08xWUgzMUtHeUU4N1Jq?=
 =?utf-8?B?ZElDTWFJWU9BQWc4akhKWlRuRjU1QnhPTFRheDkveXJPcncwZU9tZ2ZKZ043?=
 =?utf-8?B?cEJ6OHNDUjJOSzFsbHNGemdBeWFGajV4Y0pOZW5nelRpdEdpQjJDYWtlTStq?=
 =?utf-8?B?UTQyOTB1c2IzRVd2aVhGZjI4RHppdVZPUTR2aEFKSWRPSjd4T2YvVFRxd3pu?=
 =?utf-8?B?dUdLVmRiLzdwcE03Vnp5OUR3ZW1JNkpyZEZ6SXpaOXkrZjIva2NDWHd1NXd6?=
 =?utf-8?B?WTgvTkltY3pWOHJLUTVpcG4zck4vUVN3Mm9JZDc0cWMzcHliZTl1Ky81YVRI?=
 =?utf-8?B?VmErYjNpcE13UytXNFQwbjJETzgrU2JZUnNKeTkwK2laQnozQUZsZEdEbkw3?=
 =?utf-8?B?OWhhRFRzay92NlNnR3N4SlRJUTNDcXBLRDhrSDFidUFVdGtTSkdlZXRmWkxr?=
 =?utf-8?B?RGQ3RFZYeUJpRGhzWHJzTloveWljQnQ4T0xQdThabmRnOU9zUmVjNmMzZ2E2?=
 =?utf-8?B?WmErOEJ3cWljU2xoaTZLRlArK1cycHo4TXRmbTJXNHdyczVFUWQ1ZGNVZFRN?=
 =?utf-8?B?emhDSXcvNEJzdk11RVBJc0QyT3hqdEFiYjE5aDlzZzQyTjhPd3BUeTRXK1Jt?=
 =?utf-8?B?dllESUdFTVpIL1plV0l2RTM4UGtrUkVmZTJlQmJMc3BhNEM4dEtDSHFoN1RN?=
 =?utf-8?B?ekJVUENocWlQZVovWmVFTXFwbXJGUkRaeWR2cWRKNVlGYWxRSUJwNUZxR0R2?=
 =?utf-8?B?ZkhUbFZ4b2FsdUppamFXUWhJU29ESEFkUGxwVmZuZi9TcHJPSWtwaE1XU2gv?=
 =?utf-8?B?L0ZubXdEYUtjeUNaZ3N3YkttZmNiV3V3ZFVpQzllYnAwZnFpcTRGcEZTRFYz?=
 =?utf-8?B?aEpGN3BaSEZ0ZnhkTS9GQzZQRXhvYWVzU3h0cTJDYk8rNS9LYUNjMWFMbW8y?=
 =?utf-8?B?ODl5NVQ4a2FabGNIbkRQb2dYN2Q5b2FGZXBRUkJDMC9TT3MrNEhETUtiTURj?=
 =?utf-8?B?K2V4RDRHNWpTVy9iaGpIQXUzK2ZjUHkvSXB2OUEySWpmWjZqeGt3U0dJNjF2?=
 =?utf-8?B?bHpGb29Edk93ckJqN295WUlrRTVTdUlNNFRuOXcxWVRGeEU2L0FyU01lMWlT?=
 =?utf-8?Q?46HrMaJs6qv1v/LbWP?=
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
	xlNSOhBBxz0zc6zM9vivFfhCmGMYX4e0/rcfYBFPoShQIWvJyGexuGCHkfXkK6NPNWTIhl+F+jdoWvQBJzXQSIRc9C/13jkbBhUauB4beay7I6Z6BEKRsxw+N1dKZsOQdNwJBjt0zA76oKXwV1yPFOzrcNnCZB0zkPhQLL/MixV8Hq628hVZ+xtz/DUmLt05i/7ItlJhjrQeo6kVGtEB1lkUTZZ1VVNjacFUGzDVfAx5jQRJT2cPFU/LjW4mV8Pw0RImyrtEGgLEXkm+agmeLH78lL7JyuFkyN4+S1UjZ7YQyR2PkdnErGWLpPdUyH1efaN4QC/d++Vp6XSIJ6BUDw==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbffdfd4-6362-441e-7872-08df4682e9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:20:18.0790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jcz2LVwQgNuVKaj96Pb+pWFrseDw/WGp3pUXWCCYRtGUfriz0zWK4It12/uU70+HqmR97QEREuZd1JrV1zJBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5323
X-MDID: 1795123224-2Pkr4kML6TyE
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795123224;2Pkr4kML6TyE;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gTW9uLCAxNiBOb3YgMjAyNiAxODoxODoxNiAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6
Cgo+ID4gS2VlcCBhIHByaW9yaXR5IHBlciBpbnB1dCBhbmQgUExMLCBzZWVkZWQgZnJvbSB0aGUg
dGFibGUgdGhlIHBhcnQKPiA+IGxvYWRlZCwgYW5kIHJlYnVpbGQgdGhlIHRhYmxlIGZyb20gaXQg
b24gYSBzZXQuIFByaW9yaXR5IGFuZCBzdGF0ZSBhcmUKPiA+IHNlcGFyYXRlOiBhIHByaW9yaXR5
IHNldCBvbiBhIGRpc2Nvbm5lY3RlZCBpbnB1dCBhcHBsaWVzIHdoZW4gaXQgaXMKPiA+IGNvbm5l
Y3RlZC4gVGhlIHJhbmdlIGlzIDAgdG8gMjU1IG92ZXIgZWxldmVuIHNsb3RzOyBpbnB1dHMgb2Yg
ZXF1YWwKPiA+IHByaW9yaXR5IGtlZXAgdGhlaXIgdGFibGUgb3JkZXIuCj4KPiBbU2V2ZXJpdHk6
IExvd10KPiBNb3N0IG9mIHdoYXQgdGhpcyBwYXJhZ3JhcGggZGVzY3JpYmVzIHNlZW1zIHRvIGJl
IGluIHRoZSBwYXJlbnQgY29tbWl0LAo+ICJkcGxsOiBzaXQ5NTMxeDogaW1wbGVtZW50IGlucHV0
IHBpbiBzdGF0ZSBvbiBhIERQTEwiLiBUaGF0IGNvbW1pdCdzCj4gbWVzc2FnZSBkb2Vzbid0IG1l
bnRpb24gcHJpb3JpdHkuCj4KPiBUaGUgcGFyZW50IGFscmVhZHkgaGFzIHRoZXNlOgo+Cj4gICAt
IGNmZ19wcmlvLCBjZmdfa25vd24sIHNlZW5fc3JjcyBhbmQgc2Vlbl92YWxpZCBpbiBzdHJ1Y3Qg
c2l0OTUzMXhfY2hhbgo+ICAgLSBzaXQ5NTMxeF9wcmlvX2NmZ19zZWVkKCkKPiAgIC0gdGhlIHJl
c2VlZCBpbiBzaXQ5NTMxeF9jaGFuX3N0YXRlX2ZldGNoKCkKPiAgIC0gc2l0OTUzMXhfcHJpb190
YWJsZV9idWlsZCgpIG9yZGVyaW5nIGJ5IGNmZ19wcmlvCj4gICAtIHNpdDk1MzF4X2lucHV0X3By
aW9fc2V0KCksIHdoaWNoIGhhcyBubyBjYWxsZXIgdGhlcmUKPgo+IFRoaXMgcGF0Y2ggb25seSBh
ZGRzIHNpdDk1MzF4X2lucHV0X3ByaW9fZ2V0KCksIHRoZSBwcmlvIGNhbGxiYWNrcyBhbmQgdGhl
Cj4gY2FwYWJpbGl0eSBiaXRzLgo+Cj4gQ291bGQgdGhlIHByaW9yaXR5IGNvZGUgbW92ZSBpbnRv
IHRoaXMgcGF0Y2gsIHNvIGl0IGlzIHJldmlld2VkIGluIHRoZQo+IHBhdGNoIHdob3NlIG1lc3Nh
Z2UgZGVzY3JpYmVzIGl0PwoKUGFydGx5IGFncmVlZC4gUGF0Y2ggMDcgYWxyZWFkeSB3cml0ZXMg
dGhlIHRhYmxlIHdoZW4gYW4gaW5wdXQgaXMKY29ubmVjdGVkIG9yIGRpc2Nvbm5lY3RlZCwgYW5k
IGl0IGhhcyB0byB3cml0ZSBpdCBpbiBwcmlvcml0eSBvcmRlciwgc28KdGhlIG9yZGVyaW5nIHN0
YXlzIHRoZXJlIGFuZCBpdHMgbWVzc2FnZSB3aWxsIHNheSBzby4Kc2l0OTUzMXhfaW5wdXRfcHJp
b19zZXQoKSBoYXMgbm8gY2FsbGVyIGJlZm9yZSBwYXRjaCAwOCBhbmQgbW92ZXMgdGhlcmUuCgo+
ID4gQSB0YWJsZSByZXdyaXR0ZW4gb3V0c2lkZSB0aGUgZHJpdmVyLCBieSBhIHByb2ZpbGUgcmVs
b2FkIG9yIGFuIEkyQwo+ID4gdG9vbCwgYmVjb21lcyB0aGUgbmV3IGNvbmZpZ3VyYXRpb24sIGFu
ZCB0aGUgcG9sbCBub3RpZmllcyB0aGUgcGlucwo+ID4gd2hvc2UgcHJpb3JpdHkgbW92ZWQuCj4K
PiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiBUaGUgZGlmZiBzZWVtcyB0byBjaGFuZ2UgbW9yZSB0aGFu
IHRoZSBtZXNzYWdlIHNheXM6Cj4KPiAgIChhKSBzaXQ5NTMxeF9wcmlvX2FjdGl2ZXNlbF9waWNr
KCkgdGFrZXMgYSBuZXcgcm91dGVkIGFyZ3VtZW50IGZyb20KPiAgICAgICBzaXQ5NTMxeF9wcmlv
X3RhYmxlX2NvbW1pdCgpLiBUaGlzIGNoYW5nZXMgd2hpY2ggc291cmNlIGlzIGxhdGNoZWQKPiAg
ICAgICBpbnRvIHRoZSBhY3RpdmUtc2VsZWN0IG5pYmJsZSBvbiBldmVyeSB0YWJsZSBjb21taXQu
IFRoYXQgaW5jbHVkZXMKPiAgICAgICB0aGUgYWRkL3JlbW92ZSBjb21taXRzIG1hZGUgYnkgdGhl
IGV4aXN0aW5nIHN0YXRlX29uX2RwbGxfc2V0IHBhdGguCj4KPiAgIChiKSBzaXQ5NTMxeF9kcGxs
X2NoYW5nZXNfY2hlY2soKSBub3cgYWxzbyBub3RpZmllcyBvbiBvcGVyc3RhdGUKPiAgICAgICBj
aGFuZ2VzLiBUaGUgcGFyZW50IGV4cG9ydGVkIG9wZXJzdGF0ZV9vbl9kcGxsX2dldCBidXQgbmV2
ZXIgc2VudCBhCj4gICAgICAgbm90aWZpY2F0aW9uIHdoZW4gb3BlcnN0YXRlIGNoYW5nZWQuCj4K
PiAgIChjKSBUaGUgc2VlbiBmaXJzdC1wb2xsIHN1cHByZXNzaW9uIGlzIHJlcGxhY2VkIGJ5Cj4g
ICAgICAgc2l0OTUzMXhfZHBsbF9waW5fYmFzZWxpbmUoKSwgd2hpY2ggc2l0OTUzMXhfZHBsbF9w
aW5zX3JlZ2lzdGVyKCkKPiAgICAgICBjYWxscyBiZWZvcmUgdGhlIHBpbiBpcyByZWdpc3RlcmVk
LiBDaGFuZ2VzIG1hZGUgYmV0d2Vlbgo+ICAgICAgIHJlZ2lzdHJhdGlvbiBhbmQgdGhlIGZpcnN0
IHBvbGwgYXJlIG5vdyBub3RpZmllZC4KPgo+ICAgKGQpIEZhaWxlZCBwaW4gbm90aWZpY2F0aW9u
cyBhcmUgbm93IHJldHJpZWQgdGhyb3VnaCBwaW4tPm50Zl9wZW5kaW5nLgo+ICAgICAgIFRoZSBw
b2xsIGFsc28gbm8gbG9uZ2VyIGdvZXMgdGhyb3VnaCBvcHMtPnN0YXRlX29uX2RwbGxfZ2V0Lgo+
Cj4gQ291bGQgdGhlc2UgYmUgZGVzY3JpYmVkIGluIHRoZSBjb21taXQgbWVzc2FnZSwgb3Igc3Bs
aXQgaW50byBzZXBhcmF0ZQo+IHBhdGNoZXMgc28gdGhleSBjYW4gYmUgcmV2aWV3ZWQgYW5kIGJh
Y2twb3J0ZWQgb24gdGhlaXIgb3duPwoKQWdyZWVkLCB0aGUgbWVzc2FnZSBub3cgZGVzY3JpYmVz
IGFsbCBmb3VyLgoKPiA+ICsJCQlyb3V0ZWQgPSBzaXQ5NTMxeF9pbnB1dF9od19zcmMoY2hhbi0+
cm91dGVkX3JlZik7Cj4gPiAgCQlzZWwgPSBzaXQ5NTMxeF9wcmlvX2FjdGl2ZXNlbF9waWNrKHNp
dGRldiwgY2hhbi0+cHJpb19zcmNzLAo+ID4gLQkJCQkJCSAgIHNyY3MsIHNlbCk7Cj4gPiArCQkJ
CQkJICAgc3Jjcywgc2VsLCByb3V0ZWQpOwo+ID4gIAkJdmFsID0gc2l0OTUzMXhfcHJpb19zbG90
X3NldCh2YWwsIHNsb3QgKyAxLCBzZWwpOwo+ID4gIAl9Cj4KPiBbU2V2ZXJpdHk6IE1lZGl1bV0K
PiBUaGUgbW9uaXRvcnMgYXJlIHJlLXJlYWQgbGl2ZSBoZXJlLiBjaGFuLT5yb3V0ZWRfcmVmLCBo
b3dldmVyLCBpcyB0aGUgdmFsdWUKPiBjYWNoZWQgYnkgdGhlIGxhc3Qgc2l0OTUzMXhfY2hhbl9z
dGF0ZV9mZXRjaCgpLCBmcm9tIHRoZSBwcmV2aW91cyBwb2xsIG9yCj4gdGhlIGVuZCBvZiB0aGUg
cHJldmlvdXMgY29tbWl0LiBDYW4gaXQgYmUgc3RhbGUgYXQgdGhpcyBwb2ludD8KPgo+IFRoZSBk
cml2ZXIncyBjb21tZW50cyBzYXkgdGhlIGRldmljZSBmYWxscyBiYWNrIGJldHdlZW4gbGlzdGVk
IHNvdXJjZXMgb24KPiBpdHMgb3duIHdoZW4gYSBzb3VyY2UgbG9zZXMgc2lnbmFsLiBUaGUgbmV3
IGNoZWNrIGluCj4gc2l0OTUzMXhfcHJpb19hY3RpdmVzZWxfcGljaygpIHByZWZlcnMgYSB1c2Fi
bGUsIGxpdmUsIGxpc3RlZCByb3V0ZWQKPiBzb3VyY2Ugb3ZlciB0aGUgbmliYmxlLiBBIHN0YWxl
IHZhbHVlIGNvdWxkIHRoZXJlZm9yZSBsYXRjaCBhIHNvdXJjZSBvdGhlcgo+IHRoYW4gdGhlIG9u
ZSB0aGUgUExMIGlzIHRyYWNraW5nLiBGb3IgZXhhbXBsZToKPgo+ICAgQSBpcyBsYXRjaGVkCj4g
ICBBIGxvc2VzIHNpZ25hbCwgUExMIGZhbGxzIGJhY2sgdG8gQgo+ICAgYSBwb2xsIHJlY29yZHMg
cm91dGVkX3JlZiA9IEIKPiAgIEEgcmV0dXJucwo+ICAgQiBsb3NlcyBzaWduYWwsIFBMTCBmYWxs
cyBiYWNrIHRvIEEKPiAgIEIgcmV0dXJucwo+ICAgdGhlIHByaW9yaXR5IG9mIGFuIHVucmVsYXRl
ZCBpbnB1dCBDIGlzIHNldCBiZWZvcmUgdGhlIG5leHQgcG9sbAo+Cj4gVGhlIG9sZCBjb2RlIGtl
ZXBzIEEgZnJvbSB0aGUgbmliYmxlLiBUaGUgbmV3IGNvZGUgd291bGQgbGF0Y2ggQiBhbmQgbW92
ZQo+IHRoZSBQTEwgZnJvbSBBIHRvIEIsIG9uIGEgcmVxdWVzdCB0aGF0IG9ubHkgdG91Y2hlZCBD
Lgo+Cj4gV291bGQgcmVhZGluZyB0aGUgcm91dGVkIHJlZmVyZW5jZSBsaXZlIGhlcmUsIG5leHQg
dG8KPiBzaXQ5NTMxeF9pbnB1dF9tb25fZmV0Y2goKSwgYXZvaWQgdGhpcz8KPgo+IFRoZXJlIGlz
IGFsc28gdGhlIHNpdDk1MzF4X2NoYW5fc3RhdGVfZmV0Y2goKSBjYWxsIGF0IHRoZSBlbmQgb2Yg
YSBjb21taXQuCj4gSXQgcnVucyByaWdodCBhZnRlciBIT19GT1JDRSBpcyByZWxlYXNlZCBhbmQg
b25seSByZWFkcyB0aGUgcm91dGVkCj4gcmVmZXJlbmNlIHdoaWxlIHRoZSBQTEwgaXMgdHJhY2tp
bmcuIERvZXMgdGhhdCBtZWFuIGEgcXVpY2sgc2Vjb25kIHJlcXVlc3QKPiBvZnRlbiBzZWVzIFNJ
VDk1MzFYX1JFRl9JTlZBTElEIGFuZCBnZXRzIG5vIHJvdXRlZCBoaW50IGF0IGFsbD8KCkNvcnJl
Y3QgdGhhdCB0aGUgcm91dGVkIHNvdXJjZSBpcyB0aGUgbGFzdCBwb2xsJ3Mgc2FtcGxlLCBhdCBt
b3N0IDUwMCBtcwpvbGQsIHdoaWxlIHRoZSBtb25pdG9ycyBhcmUgcmVhZCBsaXZlOyB0aGUgc2Vx
dWVuY2UgYWJvdmUgbmVlZHMgdHdvCmZhbGxiYWNrcyBpbnNpZGUgb25lIHBvbGwgcGVyaW9kLiBB
IGxpdmUgcmVhZCBhdCB0aGF0IHBvaW50IGFkZHMgYQpkZWJ1Zy13aW5kb3cgdHJhbnNhY3Rpb24g
dG8gdGhlIHByaW9yaXR5IGNvbW1pdCB3aGlsZSB0aGUgUExMIGlzIGhlbGQgaW4KZm9yY2VkIGhv
bGRvdmVyLCBzbyBJIGtlZXAgdGhlIHNhbXBsZWQgdmFsdWUgaW4gdGhpcyBzdWJtaXNzaW9uIGFu
ZCBub3RlCnRoZSB3aW5kb3cgaW4gdGhlIGNvbW1lbnQuIEEgcmVxdWVzdCB0aGF0IGZpbmRzIG5v
IHJvdXRlZCBzYW1wbGUsIGFzCnJpZ2h0IGFmdGVyIGEgY29tbWl0LCBrZWVwcyB0aGUgc291cmNl
IGluIHRoZSBuaWJibGUsIHdoaWNoIGlzIHdoYXQgdGhlCmNvZGUgZGlkIGJlZm9yZSB0aGlzIHBh
dGNoLgoKPiA+ICAvKgo+ID4gICAqIFNlbmQgbm90aWZpY2F0aW9ucyBmb3IgY2hhbmdlZCBsb2Nr
IHN0YXR1cyBhbmQgcGluIHN0YXRlOyBjYWxsZWQgZnJvbQo+ID4gICAqIHNpdDk1MzF4X2Rldl9w
ZXJpb2RpY193b3JrKCkuCj4KPiBbU2V2ZXJpdHk6IExvd10KPiBUaGlzIGlzbid0IGEgYnVnLCBi
dXQgdGhpcyBjb21tZW50IHN0aWxsIG1lbnRpb25zIG9ubHkgbG9jayBzdGF0dXMgYW5kIHBpbgo+
IHN0YXRlLiBzaXQ5NTMxeF9kcGxsX2NoYW5nZXNfY2hlY2soKSBub3cgYWxzbyBub3RpZmllcyBv
biBvcGVyc3RhdGUgYW5kCj4gcHJpb3JpdHkgY2hhbmdlcywgYW5kIGl0IHJldHJpZXMgZmFpbGVk
IG5vdGlmaWNhdGlvbnMuIFNob3VsZCB0aGUgY29tbWVudAo+IGNvdmVyIHRob3NlIGFzIHdlbGw/
CgpBZ3JlZWQsIGNvbW1lbnQgdXBkYXRlZC4KCj4gPiAgCQlwcm9wcy0+ZHBsbF9wcm9wcy50eXBl
ID0gRFBMTF9QSU5fVFlQRV9FWFQ7Cj4gPiAgCQlwcm9wcy0+ZHBsbF9wcm9wcy5jYXBhYmlsaXRp
ZXMgPQo+ID4gKwkJCURQTExfUElOX0NBUEFCSUxJVElFU19QUklPUklUWV9DQU5fQ0hBTkdFIHwK
PiA+ICAJCQlEUExMX1BJTl9DQVBBQklMSVRJRVNfU1RBVEVfQ0FOX0NIQU5HRTsKPiA+ICAJCWN1
cnJfZnJlcSA9IHNpdGRldi0+cmVmW2luZGV4XS5mcmVxOwo+ID4gIAl9IGVsc2Ugewo+Cj4gW1Nl
dmVyaXR5OiBNZWRpdW1dCj4gSXMgdGhpcyBjYXBhYmlsaXR5IHJpZ2h0IGZvciBQTExzIG9uIG1h
bnVhbCBpbnB1dCBzZWxlY3Q/IEZvciB0aG9zZSBQTExzLAo+IHNpdDk1MzF4X2RwbGxfcGluX29w
c19nZXQoKSByZXR1cm5zIHNpdDk1MzF4X2RwbGxfaW5wdXRfcGluX21hbnVhbF9vcHMuCj4gVGhh
dCB0YWJsZSBoYXMgbm8gcHJpb19nZXQgb3IgcHJpb19zZXQsIGFuZCBpdHMgY29tbWVudCBzYXlz
IHRoZXNlIHBpbnMKPiBoYXZlIG5vIHByaW9yaXR5Lgo+Cj4gVGhlIGRwbGxfcGluIGlzIHNoYXJl
ZCBieSBhbGwgZm91ciBQTExzLCBzbyB0aGUgY2FwYWJpbGl0eSBjYW4ndCBkaWZmZXIKPiBwZXIg
UExMLiBPbiBhIG1hbnVhbC1tb2RlIFBMTCwgZHBsbF9waW5fcHJpb19zZXQoKSBwYXNzZXMgdGhl
IGNhcGFiaWxpdHkKPiBjaGVjaywgZmluZHMgb3BzLT5wcmlvX3NldCBpcyBOVUxMIGFuZCByZXR1
cm5zIC1FT1BOT1RTVVBQIHdpdGggbm8gZXh0YWNrCj4gbWVzc2FnZS4KPgo+IFRoZXJlIGlzIGFs
c28gdGhlIHBvbGwuIHNpdDk1MzF4X2RwbGxfY2hhbmdlc19jaGVjaygpIHN0aWxsIHRyYWNrcyBw
cmlvCj4gZm9yIHRoZXNlIHBpbnMgdGhyb3VnaCBzaXQ5NTMxeF9kcGxsX3Bpbl9zbmFwc2hvdCgp
LiBXb3VsZCBhbiBleHRlcm5hbAo+IHRhYmxlIHJld3JpdGUgdGhhdCByZXNlZWRzIGNmZ19wcmlv
IHRoZW4gc2VuZCBhIGRwbGxfcGluX2NoYW5nZV9udGYoKQo+IHdob3NlIG1lc3NhZ2UgaGFzIG5v
IHByaW9yaXR5IGF0dHJpYnV0ZT8KClRoZSBjYXBhYmlsaXR5IGlzIGEgcHJvcGVydHkgb2YgdGhl
IHBpbiwgd2hpY2ggdGhlIGZvdXIgUExMcyBzaGFyZSwgYW5kCnRoZSBvcHMgYXJlIHBlciBwaW4g
b24gYSBEUExMLCBzbyB0aGUgcGluIGtlZXBzIHRoZSBjYXBhYmlsaXR5IGZvciB0aGUKUExMcyB0
aGF0IGFyYml0cmF0ZSwgYW5kIHRoZSBjb3JlIHJldHVybnMgLUVPUE5PVFNVUFAgb24gdGhlIG1h
bnVhbCBvbmUuClRoZSBwb2xsIHBhcnQgaXMgcmlnaHQ6IHRoZSBuZXh0IHJldmlzaW9uIGRvZXMg
bm90IHRyYWNrIHRoZSBwcmlvcml0eSBvZgphIHBpbiBvbiBhIG1hbnVhbC1zZWxlY3QgUExMLCBz
byBubyBub3RpZmljYXRpb24gd2l0aG91dCBhIHByaW9yaXR5CmF0dHJpYnV0ZSBpcyBzZW50Lgo=
