Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123225;
	b=VTeK9BIzoq/xwZ6wRuCc6FTUHIp4MmHMeDFWg9XNXS6eNiL7UTeP2Gpk5Q1sXbRc68vm
	 3S1o5a1CP8BM1pag8xe2B41KW4u3h5Mjq7zwwYBtOCoidnW8P1aIJR6aMIfwETpnOP15p
	 yOEtMP+C/MJ5+LIaggWjBzOKhdEXTcKxoJdU845CeY8OyS/JF1kUOPkQlK8riChpftye+
	 M6XYmo/I6A5Kj9P655YIdheDxkFe3s9B8Gbmuxctrx6GNKLbWM3x2j5QAeAWqvZV/hWdx
	 xGEuxPSIWLFHl6cm7LcM2i/FiXiV4E3dG3dGW8ag+JnBeZanibzzrkA2uppZSGlYujA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123225;
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
	bh=UDuQsYWH7UQC2v3VxItmox/IWtELqWPxXXOxvZSpIC4=;
	b=fLdw0Eo57//7G66Z5JKrPIWjHnBxstTsxMksZZkzUXeN3S8eRvl5zFYtJeqezCW9DeXE
	 lA1YXCheUcBP1HJ9usd6GL9+SdWSViH+yhjIbuB4M0/e8vqlNuMtIsIFeb9zonAINdXW+
	 DP/CV3UitLhKBLYVKwr8CWucNfzK4o61fiyXepPKBRlm7ioc8P4l3yIer3M5pZDzGFaUR
	 4Yb1g3GEiIAiqPjP0TNxddtHgHRF43kFACN2i0Sbu3sXEkbxDUhO0Qs9jZvrDxSCPjFps
	 gY12fIy8pCPVF5LrDPOdUz3Nnk9hR+Xlt+BUzPaCX5S0nrFL11tehYoVCwP4dDYCw3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sitime.com;
	spf=pass smtp.mailfrom=sitime.com;
	dkim=pass header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=mpBW1l0V;
	dkim=pass header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=PmXyzE3M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.154.183
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com [67.231.154.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77358606A325;
	Thu, 19 Nov 2026 21:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77358606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sitime.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sitime.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sitime.com header.i=@sitime.com header.a=rsa-sha256 header.s=mail header.b=mpBW1l0V;
	dkim=pass (2048-bit key, unprotected) header.d=Sitime.onmicrosoft.com header.i=@Sitime.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-Sitime-onmicrosoft-com header.b=PmXyzE3M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sitime.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=mail; bh=UDuQsYWH7UQC2v3VxItmox/IWtELqWPxXXOxvZSpIC4=;
 b=mpBW1l0VpLAfm6m/2XOsOgBsGy84t86QiuVub5DrUSKXqhHzvnNCzjRKHN77LZ5cd9H/cKYbVeBR8NXcWEMHiGCuyP0dcZZZx1rm4qH6tC53zQ1t6TNdRgAb1t91ETpfytESSySQC3/FOdchOeX0SyoQyJsHy6L0cjP8tXL5Ss7lEQSfIfzl0jOa4834KaQHi+/9qLKyvaRRqumSmQAZtxfxhHtjpXClI4ZFjN6hkYhCNKzhetHugbdR4bm4zGTJ+r4ep3layw1NtPjldN2q9xm5pBkc92Eq5cpaoZsmtze2hUmd8Q0eo6Sug97E5PxW/4TN3A6qeB1hfGeg4xBUig==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023129.outbound.protection.outlook.com [40.107.201.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 632CC80078;
	Thu, 19 Nov 2026 21:20:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zafuq29AstLEgnZiNCYAmrKWYnysBgDIOf2yvuVgYFke87U3Rc1tnUS8CIS+7Vu82VpEJ35aK8ob3bWP6uSRp35xLheiZwic9YAk49Ie4r3ruI1uI/xHarZuZiy4h97iGp8I9+QfynVLmIAxEGRXhrIKXeyJwlL64t9Tva3AZ/x39Uuyp38dcv/cCQ7ayaDUyyl+tbojqXJs0mockCfpCk7EVTm8A0UxNsjf+0YCinUoiP6f9A7Oq7+RD2oaw0+9Fn9/tXPCG4Eyj0P/wGS3P4LvWP0vvBVG3IGgILhmcDYBC2L6QpJjFhVBxuqz7SfKRyZ3h2lF2zQJfXV5IujfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDuQsYWH7UQC2v3VxItmox/IWtELqWPxXXOxvZSpIC4=;
 b=D4uggOVA0aeDer9vCwKQscQJH2zjtmJwsatnYca01mBchM7gF3YAYYBL2s8vMl7OIwBTqY3voztrjupVYsqFhPKq1eusSsOPquj6EcGH9+JIP0TbbzOpPGENlR9EOj9vJ+S1/C7daDjPQbkHuMVjgpf/IOvKxjCv5VH7GAzKNefPpLIiS6JJm9g5QhKnzldYiliDha7FTMKY/4LSyq2HXPyH+upoBpdykpkNlfJbQ76aeIzbxsMhBwcNCzfkWyWRIyculEV6wKrosq405bfY8Tq+7sl8fmDeXar0NVVcGSibHVa4Wy6J0BDk17c/l2iIeM0zpoaQAkj+OMyVAjmbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sitime.com; dmarc=pass action=none header.from=sitime.com;
 dkim=pass header.d=sitime.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sitime.onmicrosoft.com; s=selector1-Sitime-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDuQsYWH7UQC2v3VxItmox/IWtELqWPxXXOxvZSpIC4=;
 b=PmXyzE3MONypZ6a0E4hU6H9rv0SNk3YKvTJvgZKjfepTxlq6shbJxgFtb7DaPwZKCBK70ajcIBWRvB24jv1/Fn4cIWe3AQqu67SlvGc3q5cJ2N8nqlbQTL6ki2rwFdqO1GiVJQ8pEK+goDP1x0EPDkt7klNI8Un21aOQLn0K8NjHvBZ7tj1o1H3UZ+vV5p/Z1asaaBc9LItitXnljBtd4SkypzLYrrwLs5ZMkVSt00kp0giz7oYryAc12WMO36J+cuRbHdtRDLazRwsztYZci1CDWfQyr9Gunj1wSu47wwBrFu+fPvg4304ZvL301WSLFF2kg4dO+1H5LdAWthr65A==
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
Subject: Re: [PATCH net-next v15 04/13] dpll: add basic SiTime SiT9531x
 support
Thread-Topic: [PATCH net-next v15 04/13] dpll: add basic SiTime SiT9531x
 support
Thread-Index: AQHdcVG5ugD90PBkuUyHv55svtfJw7cxkSOAgARjuAA=
Date: Thu, 19 Nov 2026 21:20:16 +0000
Message-ID: <20261119212014.13180-2-arouhi@sitime.com>
References: <20261110202607.55744-1-arouhi@sitime.com>
 <20261110202607.55744-5-arouhi@sitime.com>
 <20261117021809.2220080-1-kuba@kernel.org>
In-Reply-To: <20261117021809.2220080-1-kuba@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sitime.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR20MB994915:EE_|MW4PR20MB5323:EE_
x-ms-office365-filtering-correlation-id: 42044f00-1d92-484c-95f8-08df4682e88e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|6133799003|3023799007|261009223027099003|4143699003|5023799004|56012099006|261026140227099003|261021123027099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|38070700021|10067099003|261026121527099003;
x-microsoft-antispam-message-info:
 /sTzJzAE3UeF/SNsk6Btim2WTLREGEW0pXPABmsrsR3bs7BGr2y982c/evXZIbAyoYKeiu0Z6t5BL8gexcaivh7femQcSSeFO+HZStyuk2J/yBtpTpW41tEQMjLZd7bF8Jb1I3aFob+veo4m06kX/KyEXptU8XXIB1BoRCGqUUOhdHRMFYVltatpawqr9Z9iX7/LyxBSq7ShpNx8nphNEHOFMrWWDEe1gXc/LA9dv7dmDmjOg2ipTJ/wzb+rylY5OQ40PaF4+ANpmzPLRX+FobO0VR/OEFZuBG8EmkA+4WfpRanjbLGIuCwDHtZnBe3WgGQj6jLYdhRpt5H4Hzcc1xXP23Z9QN4EDdqYOLyvdG06BK5SGY8Z8738EJVvbpC2pcTLUHnL1ZFa/TTNalLEX9oG9iGpBz6oCghisIEvuORJYqKwTFTMc0Mcsvjx5Xh80e1hiLvEp/p+lwUf34wVhYtr4PnEsr3e9048pbh+pzPXlJiXMnZNU2yU5pv5ZqsUoMuE04y3JcVfBHwAUx2n+mtP+thDzPQLRyMKT4DTKJjnJgvfTUmxCiHTwGSwzVz0QUfgwywCevxpYkK5NIrMx0NZyVCprpXNVLpEVx2OgWip/d44jO9YMTFpiP47P2DjxihNllz7xG/7y5X0aAv9p3T2PtFlIuMNb4Xp0flwcBaMkfy7M8c8I+TPoR9tyoGRK6qz/XkfckaivEA0xrBaJeUHVbKqJNBHNlmLj4/jqeg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVWPR20MB994915.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(3023799007)(261009223027099003)(4143699003)(5023799004)(56012099006)(261026140227099003)(261021123027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(38070700021)(10067099003)(261026121527099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bFFUMFR3YXY5SFBXaGZNTHgyRVIySFZWSm1vWmhGRElOZmd3UGJTbU5TSXpT?=
 =?utf-8?B?TmFIb2JsTG01TCtiODM1K0d5cG1kQzBFbGpMazNkVTdLcHkxUEtQQU1XSXln?=
 =?utf-8?B?TUR2NHpKS3JKbWpiQ2prejVHMVdyMnptWkxQekpwWlVnUXdSNHpEL0N2bnFG?=
 =?utf-8?B?QTJ0ZGVMTWplRnZWT0t1N1JDeEE1eno5QmRaams5dERHWDkva0diZ3luelQv?=
 =?utf-8?B?VFJSanM4QWJLaDBsQ0VPNHFRRWFkaWJuQnJHbEdpV0x5Q1VFN3lkK0U3RlVX?=
 =?utf-8?B?ZktxWC82UVJEY1grU0piNVpEN0ZUMXhYV0lSbU4vdE52RjBjcnBKN1pTSm5o?=
 =?utf-8?B?ZWdTdjVhTHBjZEFPd05URkVpN2hnMmIyeTBFNzYvVHBGUWNZZHRuVTRodGkx?=
 =?utf-8?B?NUM5MjMyV2UwclNEOEt3ZitKdTBjcUNZYVhkcnQ2TmtLOEhpMXMvSTBXVW9x?=
 =?utf-8?B?TUVmaXh2TWtaMDZlcE1SV3pLamgrSlo3aDJmZjN2Z2cxc0YwSkQwYnNUNmps?=
 =?utf-8?B?Q3ZQb2lMWmVPR09UeExQMHpjNWNqbmxwSWI4ckpGbzR1YjR3ZHM5V1p1M0ls?=
 =?utf-8?B?aEpJRE5ONFByQnZNQnhSNHI2dXNUVTI5WlQwL1dZTUZVY3RYU2dBOHUzQ2xx?=
 =?utf-8?B?QXU1SVJzMHdqK1daTExocVFXTWNia3JyS2tENHA2YS9LSzJ4Vi90MFNoTDFX?=
 =?utf-8?B?SVF2enltMzVrYkpnOEthNUdTeWduaXpaWkwzREZ4YUc5TDBLd2R1SWdhemFB?=
 =?utf-8?B?WmJmOVE0WDNZYUhLQzFLR2EweEoyMUlSWnBOQzFWeW1JcXo0aXJKMG42TkEw?=
 =?utf-8?B?OGpjaGhlT3VWTjQzYnNlWjYyYU1uUHhCQjU5djd2ZGtHSmtRWkJuVzJ0QUxa?=
 =?utf-8?B?aXJDQTlBb29lNjVQUC8vd0xZOGI1cnVJM1dvTmhaQW9OdFF1SU50MmxXa1dk?=
 =?utf-8?B?d216MHRDVEtjT2FadC9QUFZQUlR0VnlPWmVNNkNsZ2ZUbEQ5WUJyeGF0QlVZ?=
 =?utf-8?B?bVRveU1mTnM1eXN1d2ZvZkYybit0MzNscXh6MmFhMXRFTnVnMzRDZmtUM3hV?=
 =?utf-8?B?UkgwY3lsR0tBeTdQUjlhZWo5SWxXR213MlFvSDBJTWs1ODM1cmdidHlvQW90?=
 =?utf-8?B?SDdiSEN6anVCMXozd2JhbE1vb1RNVTA3cWVsVUFQYmwvTzk5ZEZOT1lmMG9t?=
 =?utf-8?B?MXBnR0JkN2hWb3ppV0k1VllwSmprbHdMRzViZk8zQmlZSUdiSml1VU9xWlR6?=
 =?utf-8?B?YjdhSjJYMytUV0wyaVNUdkdMcFdMZExMUVJJOFZWN0s1V01taUw0ZDdqdkR3?=
 =?utf-8?B?UkJXbjI1cnY5Z0lXWFk1bWhWU3dqcUlWdDFFamx1VUFTYTRPVUNrVk8ydmQr?=
 =?utf-8?B?clJsS0k5VGFHTWVSRjF0UlRZOFJqUUdvMk9tQUNSc2RaUk5jWHlKQTdKRWdo?=
 =?utf-8?B?bTZRU0ZGTHVGM2RraE5yYVhUa3I0QXNyb0lGWk91QzRIZnUvamNMT09FTmQ1?=
 =?utf-8?B?VzNxRmR4TEJ5NFBtSzh4VlU4V0NYUFJIOUxuSjREQ3JrTytjYUNFZzhJLzFq?=
 =?utf-8?B?em9ZL1kxRE93VlV0Vm1zU0ZpbHQ5Ujl6RzUwc2ZVSzg5aTI0SkZqaFVRSGI5?=
 =?utf-8?B?MXlJTzVMOEdUUVZBckpJTFF6VU5mUU5iN0pTb25yY0U1dUxobmxmcEtTeStN?=
 =?utf-8?B?ODB4T3hjMk96U2hmUWhQdWV2RzZqdkNTMkZjMkFSNEdPQ3czMjJPSjcrckww?=
 =?utf-8?B?dUZSdHFnQklwTjBxZzZCTlB1Y2I2anV4WTRyRXNNbE5Pd0d0bzlmUkdGT1JL?=
 =?utf-8?B?VXJNZWtXQ25pSDdPYU5KcndTZDZoR1NQMDczdW5EcWlPc29xMk0zazNSZm00?=
 =?utf-8?B?SnRSVnRWUVZiYWkyYUVkdzVaUUVEYzZlVjBTSDNRY1hLNzdmTmpTNVhnNHF3?=
 =?utf-8?B?UzdRWUxOV1NqNXBxYlVDVUdjbjlPakwxdnlzVjZEWDlWZmVidTBRWk56R05y?=
 =?utf-8?B?ZEU1K3BjbnBsSGFnVFZVdlRLZFppWURVM0RyWWdkTFNGU1psVm9kdlNEdHBM?=
 =?utf-8?B?d2VRNVBHTTBRV3FPdFdvWGRoWG9mRW5pWkZXSWVKUjBkcVlYT3Q5bW8xd0Ny?=
 =?utf-8?B?M0xRSGVQZUs2b0pneW40ajcwRUxTdmRSN2xrbHA4T3ZhTGlpS2kydXF4MWU2?=
 =?utf-8?B?ckRZVDB0SmgzbXcxdlh3Z0tsNFlFcVlVTzVEY1grYlpiMkFHbEZqTnRsVDNx?=
 =?utf-8?B?Q3NXRE81RklkNmFaN0FiTEJEQ0NNZzBXdkVESG04UEE3NTVSclJKamtzQisx?=
 =?utf-8?Q?MFUT8TrSoPdmN24xIX?=
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
	rXANXIQXOesHRoLE/7pp3wC2oEg7GJh/dxBGZCd6xJOXQdeGu688pEejKuXedqfuqboFKgSn+ol+5GDi8iOqtL5kfM0eZtH7CTxaGkSUi7XJfnREYFh+O67hO8ctVzL2tczMkkA1Yi51ysn1O+ZzGwx4XW4mpbpxWNLEqQ68VjEU8p4cUqpv4xPxUyfvUjTCx3w60AwdYBb2M362LVbPZRMR4cHFYx4q1HzlypKiutRsAvD4YuJQYZYGuSOhlcvV8bcsnLTjAwrybJZLNRk5vcwZnwwnd+EfXPI7M85E6zx7gxeXlrVCwfDeey5ngodJoyX8Ao86i2nzHvdXN5CSJw==
X-OriginatorOrg: sitime.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR20MB994915.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42044f00-1d92-484c-95f8-08df4682e88e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 21:20:16.2399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fb55916-cf10-4b0d-96f4-cf3952657263
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zJ3/IzWoTRvGUunDQA7rC0w/ZDq+akXh7MG8DbQqGVH0zqDZhDVv5E+tkWTr0WouJCNpPhMlza/uzSV6/wxHfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB5323
X-MDID: 1795123223-8Me1EVENAGqC
X-PPE-STACK: {"stack":"us1"}
X-MDID-O:
 us1;at1;1795123223;8Me1EVENAGqC;<arouhi@sitime.com>;ba04557de9d2da8490f5f1e6de07b967
X-PPE-TRUSTED: V=1;DIR=OUT;

T24gTW9uLCAxNiBOb3YgMjAyNiAxODoxODowOSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6
Cgo+ID4gK3N0YXRpYyBpbnQgc2l0OTUzMXhfcGFnZV9zZWxlY3Qoc3RydWN0IHNpdDk1MzF4X2Rl
diAqc2l0ZGV2LCBpbnQgcGFnZSkKPiA+ICt7Cj4gPiArCWludCByYzsKPiA+ICsKPiA+ICsJaWYg
KHNpdGRldi0+cGFnZSA9PSBwYWdlKQo+ID4gKwkJcmV0dXJuIDA7Cj4KPiBbU2V2ZXJpdHk6IExv
d10KPiBDb3VsZCB0aGlzIHVzZSByZWdtYXAncyBwYWdlZCByYW5nZSBzdXBwb3J0IGluc3RlYWQg
b2YgYSBwcml2YXRlIHBhZ2UKPiBjYWNoZT8KPgo+IHNpdDk1MzF4X3JlZ21hcF9jb25maWcgaGFz
IG5vIC5yYW5nZXMgYW5kIG1heF9yZWdpc3RlciBpcyAweEZGLCBzbyByZWdtYXAKPiBvbmx5IHNl
ZXMgYSBzaW5nbGUgd2luZG93LiBzaXQ5NTMxeF9wYWdlX3NlbGVjdCgpIHNraXBzIHRoZSBzZWxl
Y3RvciB3cml0ZQo+IHdoZW5ldmVyIHNpdGRldi0+cGFnZSBtYXRjaGVzLiBOb3RoaW5nIGV2ZXIg
Y2hlY2tzIHRoYXQgY2FjaGVkIHZhbHVlCj4gYWdhaW5zdCB0aGUgY2hpcCwgYW5kIG91dHNpZGUg
b2YgcmVzdW1lIGl0IGlzIG9ubHkgcmVzZXQgd2hlbiBhIHJlZ21hcAo+IGFjY2VzcyBmYWlscy4K
Pgo+IFNvbWV0aGluZyBvdXRzaWRlIHRoZXNlIGFjY2Vzc29ycyBtYXkgY2hhbmdlIHJlZ2lzdGVy
IDB4RkYsIGZvciBleGFtcGxlIGFuCj4gSTJDIHRvb2wgb3IgYSByZWdtYXAgZGVidWdmcyB3cml0
ZS4gSWYgdGhhdCBoYXBwZW5zLCBzaXRkZXYtPnBhZ2UgZ29lcwo+IHN0YWxlLiBUaGUgbmV4dCBz
aXQ5NTMxeF9yZWFkX3U4KCksIHNpdDk1MzF4X3dyaXRlX3U4KCkgb3IKPiBzaXQ5NTMxeF91cGRh
dGVfcGxsX3U4KCkgZm9yIHRoZSBjYWNoZWQgcGFnZSB0aGVuIHNraXBzIHRoZSBzZWxlY3QuIEl0
Cj4gcmVhZHMgb3Igd3JpdGVzIHRoZSBzYW1lIG9mZnNldCBvbiB3aGF0ZXZlciBwYWdlIHRoZSBj
aGlwIGlzIGFjdHVhbGx5IG9uLgo+Cj4gTGF0ZXIgaW4gdGhlIHNlcmllcywgImRwbGw6IHNpdDk1
MzF4OiBhZGQgc3VwcG9ydCB0byBnZXQgYW5kIHNldCBwcmlvcml0eQo+IG9uIGlucHV0IHBpbnMi
IHRyZWF0cyBhIHByaW9yaXR5IHRhYmxlIHJld3JpdHRlbiAiYnkgYSBwcm9maWxlIHJlbG9hZCBv
cgo+IGFuIEkyQyB0b29sIiBhcyBhIHN1cHBvcnRlZCBjYXNlLiBBbiBJMkMgdG9vbCBoYXMgdG8g
d3JpdGUgMHhGRiB0byByZWFjaAo+IHRoYXQgdGFibGUuIEEgcmVnbWFwIGRlYnVnZnMgcmVnaXN0
ZXJzIGR1bXAgd291bGQgYWxzbyBvbmx5IHNob3cgdGhlIHBhZ2UKPiB0aGF0IGhhcHBlbnMgdG8g
YmUgc2VsZWN0ZWQuCj4KPiByZWdtYXAncyBzdHJ1Y3QgcmVnbWFwX3JhbmdlX2NmZyBzdXBwb3J0
cyBhIHNlbGVjdG9yIGluc2lkZSB0aGUgd2luZG93LAo+IGhlcmUgc2VsZWN0b3JfcmVnID0gMHhG
Riwgd2luZG93X3N0YXJ0ID0gMCBhbmQgd2luZG93X2xlbiA9IDB4MTAwLiBXaXRoCj4gUkVHQ0FD
SEVfTk9ORSBpdCByZWFkcyB0aGUgc2VsZWN0b3IgYmFjayBiZWZvcmUgc3dpdGNoaW5nLiBJdCBh
bHNvIGtlZXBzCj4gdGhlIHNlbGVjdCBhbmQgdGhlIGFjY2VzcyB0b2dldGhlciB1bmRlciB0aGUg
cmVnbWFwIGxvY2suCj4KPiBUaGUgc2libGluZyB6bDMwNzN4IGRyaXZlciBhbHJlYWR5IGRvZXMg
dGhpczoKPgo+IGRyaXZlcnMvZHBsbC96bDMwNzN4L2NvcmUuYzoKPiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHJlZ21hcF9yYW5nZV9jZmcgemwzMDczeF9yZWdtYXBfcmFuZ2UgPSB7Cj4gCS5yYW5nZV9t
aW4JPSBaTF9SQU5HRV9PRkZTRVQsCj4gCS4uLgo+IAkuc2VsZWN0b3JfcmVnCT0gWkxfUEFHRV9T
RUwsCj4gCS4uLgo+IAkud2luZG93X3N0YXJ0CT0gMCwKPiAJLndpbmRvd19sZW4JPSBaTF9QQUdF
X1NJWkUsCj4gfTsKPgo+IFRoZSBjb21taXQgbWVzc2FnZSBkZXNjcmliZXMgdGhlIGZsYXQtd2lu
ZG93IGRlc2lnbiBidXQgZG9lc24ndCBzYXkgd2h5Cj4gdGhlIHJlZ21hcCBtZWNoYW5pc20gd2Fz
bid0IHVzZWQuIElzIHRoZXJlIGEgcmVhc29uIGZvciB0aGF0PwoKRWFybGllciByZXZpc2lvbnMg
dXNlZCByZWdtYXBfcmFuZ2VfY2ZnLiBXaXRoIGFuIHVuY2FjaGVkIG1hcCBpdCByZWFkcwp0aGUg
c2VsZWN0b3IgYmFjayBiZWZvcmUgZXZlcnkgYWNjZXNzLCB3aGljaCBkb3VibGVzIHRoZSBidXMg
dHJhZmZpYyBvZgp0aGUgcG9sbCwgYW5kIGl0IGxldHMgYSBkZWJ1Z2ZzIGFjY2VzcyBzd2l0Y2gg
dGhlIHBhZ2UgYmV0d2VlbiB0d28KYWNjZXNzZXMgb2YgdGhlIGRyaXZlci4gVGhlIGZsYXQgd2lu
ZG93IGtlZXBzIHRoZSBzZWxlY3QgYW5kIHRoZQp0cmFuc2ZlciB1bmRlciBvbmUgbG9jay4gVGhl
IGNvbW1pdCBtZXNzYWdlIHdpbGwgc2F5IHNvLiBUaGUgdGFibGUKcmV3cml0dGVuICJieSBhbiBJ
MkMgdG9vbCIgaW4gcGF0Y2ggMDggaXMgcGlja2VkIHVwIGJ5IHRoZSBwb2xsLCB3aGljaApyZWFk
cyB0aGUgdGFibGUgZXZlcnkgdGljazsgYSB0b29sIHRoYXQgbGVhdmVzIHRoZSBwYWdlIG1vdmVk
IHVuZGVyIGEKYm91bmQgZHJpdmVyIGhhcyB1c2VkIEkyQ19TTEFWRV9GT1JDRSwgdGhlIGRvY3Vt
ZW50ZWQgb3ZlcnJpZGUsIGFuZCB0aGUKZHJpdmVyIGRvZXMgbm90IGRldGVjdCBpdC4KCj4gPiAr
CQlyZXR1cm4gZGV2X2Vycl9wcm9iZShzaXRkZXYtPmRldiwgUFRSX0VSUihzaXRkZXYtPnJlc2V0
X2dwaW8pLAo+ID4gKwkJCQkgICAgICJGYWlsZWQgdG8gcmVxdWVzdCByZXNldCBncGlvXG4iKTsK
PiA+ICsJaWYgKHNpdGRldi0+cmVzZXRfZ3BpbykKPiA+ICsJCWZzbGVlcCgxMDAwMCk7CS8qIGlu
dGVybmFsIGJvb3QgYWZ0ZXIgcmVsZWFzZSAqLwo+ID4gKwo+ID4gKwlyYyA9IHNpdDk1MzF4X3Jl
YWRfdmFyaWFudF9pZChzaXRkZXYsICZ2YXJpYW50X2lkKTsKPgo+IFtTZXZlcml0eTogTWVkaXVt
XQo+IFNob3VsZCBzaXQ5NTMxeF9kZXZfcHJvYmUoKSBlbmFibGUgdGhlIHN1cHBsaWVzIGJlZm9y
ZSBpdCByZWxlYXNlcyByZXNldAo+IGFuZCBkb2VzIHRoZSBmaXJzdCBJMkMgYWNjZXNzPwo+Cj4g
VGhlIGJpbmRpbmcgaW4gdGhpcyBzZXJpZXMsIHNpdGltZSxzaXQ5NTMxNi55YW1sLCBkb2N1bWVu
dHMgdmRkLXN1cHBseSwKPiB2ZGRpbi1zdXBwbHksIHZkZHMtc3VwcGx5IGFuZCB0aGUgdmRkb04t
c3VwcGx5IHJhaWxzLiBOb3RoaW5nIHVuZGVyCj4gZHJpdmVycy9kcGxsL3NpdDk1MzF4LyBnZXRz
IG9yIGVuYWJsZXMgYSByZWd1bGF0b3IsIGVpdGhlciBpbiB0aGlzIHBhdGNoCj4gb3IgYnkgdGhl
IGVuZCBvZiB0aGUgc2VyaWVzLgo+Cj4gVGhlIGJpbmRpbmcgY29tbWl0IHNheXM6Cj4KPiAgICJU
aGUgZHJpdmVyIGRvZXMgbm90IGVuYWJsZSB0aGVtLCBzaW5jZSB0aGUgYm9hcmRzIHNvIGZhciBw
b3dlciB0aGUgcGFydAo+ICAgcGVybWFuZW50bHk7IGRlc2NyaWJpbmcgdGhlbSBnaXZlcyBhIGJv
YXJkIHdpdGggc3dpdGNoYWJsZSByYWlscyBhIHdheQo+ICAgdG8gc2F5IHNvLiIKPgo+IEEgYm9h
cmQgdGhhdCBkZXNjcmliZXMgc3dpdGNoYWJsZSByYWlscyBwZXIgdGhlIGJpbmRpbmcgZ2V0cyBu
byBjb25zdW1lcgo+IGZvciB0aGVtLiBJZiB0aGUgcmFpbCBpcyBvZmYgYXQgcHJvYmUsIHRoZSBj
aGlwIGNvbWVzIG91dCBvZiByZXNldAo+IHVucG93ZXJlZCBhbmQgdGhlIHZhcmlhbnQgSUQgcmVh
ZCBmYWlscy4KPgo+IElmIHRoZSBib290bG9hZGVyIGxlZnQgdGhlIHJhaWwgb24sIHJlZ3VsYXRv
cl9sYXRlX2NsZWFudXAoKSBpbgo+IGRyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyBmaW5kcyB1c2Vf
Y291bnQgPT0gMCBvbiBhIHJlZ3VsYXRvciB0aGF0IGlzIG5vdAo+IGFsd2F5cy1vbi4gT24gRFQg
c3lzdGVtcywgd2hlcmUgaGF2ZV9mdWxsX2NvbnN0cmFpbnRzKCkgaXMgdHJ1ZSwgaXQgdGhlbgo+
IGRpc2FibGVzIHRoZSByYWlsIGxhdGUgaW4gYm9vdDoKPgo+IAlpZiAocmRldi0+dXNlX2NvdW50
KQo+IAkJZ290byB1bmxvY2s7Cj4gCS4uLgo+IAlpZiAoaGF2ZV9mdWxsX2NvbnN0cmFpbnRzKCkp
IHsKPiAJCXJkZXZfaW5mbyhyZGV2LCAiZGlzYWJsaW5nXG4iKTsKPiAJCXJldCA9IF9yZWd1bGF0
b3JfZG9fZGlzYWJsZShyZGV2KTsKPgo+IFdvdWxkbid0IHRoZSBjaGlwIHRoZW4gbG9zZSBwb3dl
ciB3aGlsZSB0aGUgZHJpdmVyIGlzIHN0aWxsIGJvdW5kPyBUaGF0Cj4gd291bGQgZHJvcCB0aGUg
cHJlLXByb2JlIE5WTSBjb25maWd1cmF0aW9uIHRoZSBjb21taXQgbWVzc2FnZSBzYXlzIGlzCj4g
a2VwdC4gSXQgd291bGQgYWxzbyBsZWF2ZSBzaXRkZXYtPnBhZ2Ugb3V0IG9mIHN5bmMgd2l0aCB0
aGUgY2hpcC4gTGF0ZXIKPiByZWdpc3RlciBhY2Nlc3NlcyB3b3VsZCB0aGVuIGZhaWwsIG9yIHJl
YWNoIGEgcGFydCB0aGF0IGhhcyByZWJvb3RlZCBmcm9tCj4gZWZ1c2UuCgpDb3JyZWN0LCBhbmQg
dGhlIGxhdGUgY2xlYW51cCBjYXNlIGlzIHJlYWwgZm9yIGEgcmFpbCB0aGF0IGlzIG5vdAphbHdh
eXMtb24uIFRoZSBkcml2ZXIgZG9lcyBub3QgY2xhaW0gdGhlIHN1cHBsaWVzIGluIHRoaXMgc3Vi
bWlzc2lvbjsKdW50aWwgYSBmb2xsb3ctdXAgYWRkcyB0aGUgcmVndWxhdG9ycyB3aXRoIHRoZWly
IHBvd2VyLXVwIGRlbGF5LCBhIGJvYXJkCndpdGggc3dpdGNoYWJsZSByYWlscyBtYXJrcyB0aGVt
IGFsd2F5cy1vbi4K
