Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530659;
	b=PP5g7KsCbcAtJ9rAMdNCwJQEW4jSFPRCYDCwjSOtvtHlkLXRJ9tZUaO2b5vSp8pviXUe
	 KyNaatku9HTmaLLVbYbJX27kzeuJOg7TgWw8+d70ap+Ifdi61d5MB1vnUktGebERgxroA
	 aoNSBBN//451yQzJjIVYmV8jp4UjGB6qBySyBUTvYmJaAfAWY/Oaw0WKeM9CEmqq+qqux
	 AH1gkdC3lVy1q6F6pyF0eKntsX6fGisrHHUnAYNyu15A/1XRwgJcAe2I01sgX+Ji/r5jQ
	 8vyxgzn1B2B9dzABbtt1IqT4P0tXcQH7RgQxsm0Cvby9e7dtCCbnl/8BIqUPghv5J5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iQpOY7Gg7scVhmNakUEQ16J4LsatKqEAgNAnoJ50wlE=;
	b=UzcSShIZX5frtM/HSjrRwgqUK3USIHpZ+1ozMO83zVQ3qm1xTXMknEOxYpIr4YT71MOa
	 pN8Gaor8eEutwUiGumacFe12P65zo68XJBlKcA51IA9i5QD0/wIiO9R/JH8rHGho1q4zw
	 9UtQBnirLd60JFqiwuQzw/5mp4VfChdHcPTdDjNyF9YDsszdWnWf6r87qe9UBbFlZvOZz
	 SyW8uxFXaXYnFjPUHxui0G+MJd4BxZm2IYYsHl/wnoWz7RcSvUM3RloOd0Ci5cEXFjwnx
	 d0c5GZN7Xy4Ac9mlULHl5HZSpk9/A++hvMBK3VARJ0deYqxGT1OlNzWDWwmdrFBwa3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="PACo/cv+";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=YaCVJG2D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9380606A31E;
	Tue, 24 Nov 2026 14:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9380606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=PACo/cv+;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=YaCVJG2D
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJe62237207;
	Tue, 24 Nov 2026 08:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iQpOY7Gg7scVhmNakUEQ16J4LsatKqEAgNAnoJ50w
	lE=; b=PACo/cv+leSdrVdb42E3U/f8pmBSQmD/ITaMoSvymP8TbPxcze1zVG1sS
	DLPQuNgv1LN0Y0DD55CALKz6H4vkeTXYKNFQhjND7A7sNzF1ZGGDxKUsv2zLaswp
	n4qhskZzQuEDyg733mtKPt83IZhfHmCeceGz/vAsV2je996UrRYYTARETWQnwBsj
	w6dnmL8hnDwKIEyvCZp1nQ22p7+rG3TboTRdGqBeXjni4pI5RHDgFeRNu/BIflbQ
	/VNxZJJUh5GUrr8pg4SXmw8yixRZMd2YWtKCsPu4i7fvW6YegBFNAh8Oh1ce8wg9
	F2H+wkwl8npBc+XfafX9ThYZv98mg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011060.outbound.protection.outlook.com [40.107.208.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j50h846w7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 08:30:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYK07sMNh7C+w7Nib4yyJgTcPvoAPmiWPLJCZ+IGclhH9fNzqgVPa0i2851bxKnKXtMamojsIwYGNWODLy6e2x5RTb9NyRX3078kqH5oFDf5Q9GRzezyC0Joki8vsdqO1xOLpU/h5U9J5i+O17X7yofNEZz330AlPSXuFSpvsV650LQQ1MNjPlWV6o6fOOXGVXAmdFeGJeG6yO8nd2efFZJE2fIIOCiT0RvXGN2J1Fg/m9uh6bvm6NY0fayHqQEgD5m4Xdyd4P5sB/bB5zaT++wTcr/pBrFTBVD0Nggy9XFy1IgBjgUyeHoBiI554kJFCq7RGtX7Z36JUTY50r/aZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQpOY7Gg7scVhmNakUEQ16J4LsatKqEAgNAnoJ50wlE=;
 b=oAK2iuliQQslflXVE1qqZDJ4cYr73STVfOveIMOxPQfUqBf/yiTu6IZNw4scqbVwdv6c34PsK/5oSEIZihrWh1M97xq3Y65B24fwmz2hemhxikbX5FhxOusuNpAEanYW729Ydc78c6IbD3z6gtA8AgN0BuulRoRZa3xEA3Z8f0cpgDLPjunZq6MhTkxAdr2/p/hqG42afhurWQAupbi9Pdj1l2ebMnenUDYeW/UHhK4kbNtyFMV9EDRtPd0gSpzBHHivpcYpS8NEV7hzrB8uq+3VX/YBOsCAcbJRZpfkDjTfzqCk13pVfa7gKrhHfpBtAMG/NU6bWApauLZhzPJWNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQpOY7Gg7scVhmNakUEQ16J4LsatKqEAgNAnoJ50wlE=;
 b=YaCVJG2DdK/E+FqlEtcfLXs/KK36y8dlyMicsFIz2ibndsAFwtg9oNTWFe7/itmEyjOYKDhIaD8bhEIvBalEZmz6s4GBnzMpSKFSkvZJb+q6HiLDiZdvN2mdzeivnifyM11Xx/Kml0BxwWbJr8Ogp0kA/if9i8O5T8bNC64LrRk=
Received: from MW5PR10MB5826.namprd10.prod.outlook.com (2603:10b6:303:19b::17)
 by SAVPR10MB997818.namprd10.prod.outlook.com (2603:10b6:806:4e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 14:26:03 +0000
Received: from MW5PR10MB5826.namprd10.prod.outlook.com
 ([fe80::af05:a8c5:beae:cdee]) by MW5PR10MB5826.namprd10.prod.outlook.com
 ([fe80::af05:a8c5:beae:cdee%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:26:03 +0000
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
To: "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Menon, Nishanth"
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Francis, Sebin" <sebin.francis@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add TPIC2810 LED
 expander support
Thread-Topic: [PATCH] arm64: dts: ti: k3-am625-sk-common: Add TPIC2810 LED
 expander support
Thread-Index: AQHdfBxK4m7rPeAiqUawrB2sHFukMrc9RzsA
Date: Tue, 24 Nov 2026 14:26:03 +0000
Message-ID: <e64f7e2f-567e-46a9-ad67-696802e58e1d@ti.com>
References: <20261124-am62x-tpic2810-v1-1-2b9fcb76a3c3@ti.com>
In-Reply-To: <20261124-am62x-tpic2810-v1-1-2b9fcb76a3c3@ti.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR10MB5826:EE_|SAVPR10MB997818:EE_
x-ms-office365-filtering-correlation-id: 3c508a18-5794-434a-e891-08df4a36dee3
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|38070700021|10067099003|5023799004|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 ztPasmDa2mrwBe8E0HWCxzmVF3hsfG8ThpVAMO1J4LUTr/kA6zzdPH5HIPBmvXzQX0ANLh14DeXyBTZYtG8fOS4zci5n3HkD7asmBbRRQaQmksFZLlIYSgqeKQATOGnXVH+eYBZHeD7ONaN2crQDUqNuYlLFsJcTnX+4d2TA7+1x0iK1kKloHb7NDYWmN/QJ3aBwo3e4ctuxtb7XkgV3B/uqx3KYCWQBsibYubl7vJ5tOtULrzKLUiekqXgEw0poC9csj11ytYbT6Hip+82JSX8O4pUXDj89EN/XrODTLau4Q0bEMXnDq2ZTUdLgGsadSebS5ljF3ONAGmYtbgar3R5G59+3hbxRRgGYOmsDW6irOM2RozzCVjsjaRlHsUcAcmuhzS9rJWiAYQ34QzbsANMVV1yh6Bc12mtH4w24S3ic4lNc2DURz9XP3ToYKmg6CmcItmmQqmlUK3o3nBfxZLEfwWyM/l26UaCihns5BddD0vnq197Md/D+Fy0Uaj3Sh3ZAUVQ3xU1bObfIakqhOGn2gqvcVgTFyYM9IAH7WCYyWxbgazjUzNKvUwKAPRTC91pXYN+NkgbmdQLGuWNP5PxoM9j2uXzFeTixGizL4DlKUmV+tImu5FR46VtOLROmHkCtsrZupCkbfCEmPmlyUXmzhxe+gi4daxWZez5kYiB6lmUxf2Q3wl4KDIavn5M2VipN2ZkH+odCSl8BAjEeycY6Aqt947FsmRFtKWjM4/k=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR10MB5826.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(38070700021)(10067099003)(5023799004)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXYrc1cvWFJkTkJnN3NaRjk1bjBoN1lnNEEwV1FPallCb2V0aHNlTjRjZ0cz?=
 =?utf-8?B?eGRsTFdzNTA1Qm5Pc1YybFRLbVd0eDJ6QW1SdVovbUI2SEpZQlYzNHNoLzIr?=
 =?utf-8?B?Y0NjcEdhbjM5UHhPR2hITHdPSVNoTXZnZ1hmb2pBZnZ6QmcrMGZzWUU2NlMv?=
 =?utf-8?B?TnhyYmZtRS9QZ1RGcHU2aTFoOGlXOXd2Z2YrNUNRbWpCajBRbzdXOXV0d1Jh?=
 =?utf-8?B?bkZkUk5qZ04rNkdjOWU0cFQ4K1dQSDFLMzVIWnU3VkNFYXBoT1lyaWxGU2VQ?=
 =?utf-8?B?SktMTEFUaEI1SWRDWjRsYnlaeVhKK1RQaVhhZFNxdkViNGtiZ09WVXNPeDBx?=
 =?utf-8?B?cWFvVmV5MEx1MXBDN21nT2N0LzRNWVhQS3FsYWhNZmgrMmFPZTZEOFJMeW9s?=
 =?utf-8?B?Mzd1ZlZRWnRlZDdpelRJc2h1VE55M0ZWdGs4a2lOd2xOZHZxWlJ0b21qWXhK?=
 =?utf-8?B?a3RRNXFPYkVqKzh2UUdNUkp0YVM5NUJLUGJSSDBRZlpUUnEybERLVDBuU3o3?=
 =?utf-8?B?b0E5MTlxaEFLdS8ycFB6eDhJdFYzN2F6SjF2QWc4OEdOK0VNYTF1eWtRZ042?=
 =?utf-8?B?VGs3S0xIbm5wUHNjMUx6Yjlwa081S3IyK0M0cnV4SzZJUTZ0YWY2ME1FZmVm?=
 =?utf-8?B?Y2NmTW5FRzdBRVVFak5WcTl5a2ZJd2xJSCtueVE4aGhsUmVkazRVTXlkQkdl?=
 =?utf-8?B?ZGRHditNckFwKzN1WFQ3NTJpWDRBREZCa29YUlc1ZG5ZQkZVZ1NLcllsTlNC?=
 =?utf-8?B?aXk2MnVtTUpWb1FQSlVnMGNHc2s4YVFHZ1Mxcmp2eFFoTkNHd0ptTDY5VU9j?=
 =?utf-8?B?aUhkbEZOdTgzN0V1ZlU0VFBkUldUbklOMDRNMFgvQzZEbldHTWJnR3B6U0lF?=
 =?utf-8?B?alE1TEpYN2I1MHFGZEJ0aE1QdFFneFZqVDRON1RLdDV4YUtBNmhLa0JHVnAw?=
 =?utf-8?B?dXNFQ05GbkFrYXRiWVVqVjF0Q1pQK0FqeS9vRDJOcEQ2bjR4eVVlQmN2eEhh?=
 =?utf-8?B?dU5udDA1UFZ2MWpHMVJ0UFRWT0RTV0hEV05uOU1QR291amkxT2ZWeHZabURN?=
 =?utf-8?B?SDdWL1g5T1Y0VGNpNmtMRk1PdzRHUjZEd0l1QlZoNS9lckFiRjlENmFsYjBn?=
 =?utf-8?B?WXQ3K0ZEcHJpWW14SzhLMnFtQmpLeTFpdi9kWXgxMzI1Sk1pT1VQcGdEdEhP?=
 =?utf-8?B?VTNMYWtiNmpacG1SYVJqclFUeEtPcFZabjdYY3dxL1VPUkNyOG1TcHdLYmQ4?=
 =?utf-8?B?bUFpNGwwMzdOMkd6bE4vWHkxa25rSGlQUzFmTDNsZWxrdGgwWkFhQ3J3clJx?=
 =?utf-8?B?Yms1Um9mcWlXTFVGb25ETDA0akZJb2pGRStWRnRnVGdYUkRLbkJJR0dRNUFi?=
 =?utf-8?B?d3VVQzQ2TVhJQ2pvNDRIV3hrNm5hcmJsZ1JXb3hzeWFkek42WTd5azg4ZlFo?=
 =?utf-8?B?NGxKeTRrTmVUMEduN0lXZmRvQjl0ZFZPd0lwUHdmVGR2NkxGWHZDVEJyV25p?=
 =?utf-8?B?RDVSeXN0ZkFPS1RPblN3U1ZBVW5ma2ZQS01MOEZNbGdQcHBsdTFQT2ZpbVNm?=
 =?utf-8?B?b2d2ZnBqWUdZNE9KeHBhMWRMN3lMa09XcFkxbGNQVjJJeVFhcURhbnp5VXF6?=
 =?utf-8?B?ekFuNHRiSzh1RTlZSG5kVkZnT01YREltQWo4dW1VTE5sZTFmRjVxY1MzWWM4?=
 =?utf-8?B?Y1QvKzR4dkRRcWh0WjhpUEhTVXgwR2RkeEd3aU95ZzBiSkNOZmo1RVJQeWNC?=
 =?utf-8?B?MG9lbTg2U3pTMWxEaXZtNlNiU1ZvNlgvYXppQVhaVFFEYTE0N2QrYUs4SDgv?=
 =?utf-8?B?YzhtMHJOdUwrRXdBTDRJWllyMlJac2ozMEJsSHo3VURQb1Z4T2I0SDhUTzI5?=
 =?utf-8?B?TjhEVW1wRFBmZ2hHYUdsNUgrL3FpZldpaGo2c3dCNXRKVWF3VGExZCtETnI3?=
 =?utf-8?B?dXMvNHlNNEg0U204S3V5b01rWGpqZVVSZDYrWTNuRzY5K1B5L2lNdmlkK0hl?=
 =?utf-8?B?cHVkdTVzR2NNT3JxUU9VVUxKNERtUlBFMEp0QktDU2h4ai9ReUpMNTRKdUdB?=
 =?utf-8?B?bXB4bEt1cE4xeld0R2Yya3RRcUpBSUxaMkJDeHlUOHZFQ0dxenFNWXUvK25r?=
 =?utf-8?B?UlYyUkVTeWZUUXFsUHJycDFMWUNJVHFFZDVBUFFxTlpnSUhvQ3VkaWtBak15?=
 =?utf-8?B?S1Vselo3UkN3L05DY1M2aHB1eDhtMUJrSE5oWElzNU9ldit6LzBRc0ZQMTZj?=
 =?utf-8?B?eWVucG1HVmNPMVl3cVU2V3kxaXgxblVRWHBBeFNpUlR1U050NExDUHpBbVov?=
 =?utf-8?Q?qO7JIf66ZEXYN3iT1Z?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9413FF47AC284479730023C7FC7CEB1@namprd10.prod.outlook.com>
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
	Re3g65ktImAci1e2EkLhmrpTtsgwQnTnvZiCutATIeBgNQ/JQgPWCpyRdHGYJFL8nhMvdBuy28lZMgs5yL4UdAsX3d7DClU0KX00yQNpWTPsKOb83SAMBxOqiITGTEp9FcaIWEc3OuPcSaIgd/yV/fe1u39/v0lm2xsxHyKP9QK+HhuFlPs/IvCxuN9Mw55WDLun0VP+Amr1XJ7SQRO329FcsbDJSKHisJ6TfY5ulQWT94XHPSJut2xqftrUAo1QRxBhy935nIYDyQPhQjajCYaKXqYGeSR+RofebkhjRJer4i863ZhEQqotJzK1FH/iZ5e4B5cBNNVXjzPj8XpP4w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5826.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c508a18-5794-434a-e891-08df4a36dee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 14:26:03.6866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +A7VIYbEbeqOU4unWWHkFU7nJsQGn9wgr3lGTLGKiFH+u6k//HMlFXjy8eonDcef
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997818
X-Proofpoint-GUID: rl8t8u3UeCucfj43_UWtw0xmHdRYbjoy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX3D0CFubGWQX3
 iBeOPV3w9XIKSCL8EJC7s4otRiZ+M9uqul2/trxz8pVpvgW2FwVXlsS2p1oUbqh/DfsW7ZdQiy7
 pqIlFU0j9SsQs78U/3I/Tz52FLwmDa650qSC9rjMJdZmwuRqOosA6B4ghpHlc4a1w//PGLfZtBu
 RAcSnlLwRdFa9SMwiMRMPvBT4ROsOb2j6gUcntEKpOXWxage/wN5VR3lwVFM0ywehzEacrTiNej
 Xv8Gf2jYKd2BN/OMR27oBCpokZiD29AnLyHStNmru0r3yiNQt3LQMWEKyDaAC0emiCS4swDxZ9f
 auV3jpcsAHSC61BXtUf4fe/nRESu9YQ0woEeSvRtY17G/g9Ap9o87tZGEaWPVHSERV3KRv5Em0s
 npx3Urs5FeFFKf9+PAPsPk71S7XW7of/67A7oJBnmV3mGYzRvGGniks6vvJtFmADytx+OF2A8VI
 IOl6XsFni18ylV/iN1A==
X-Proofpoint-ORIG-GUID: rl8t8u3UeCucfj43_UWtw0xmHdRYbjoy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX02+d9+H3TlJC
 IhDtWAOCxMiqcwBqlLQMnR6wXG27ceW4qFqx2Q0/gKxmu+eNKzpUk7wcV7yqu+rQOxgX/+mqxYn
 IqdDijj9D9hyPASXaZuvjglhq01qLLg=
X-Authority-Analysis: v=2.4 cv=WNTqzXsR c=1 sm=1 tr=0 ts=6b059f93 cx=c_pps
 a=5tz+rB/kfTqQMEo17N6B4w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=-1XHMG4bZSDLyRoMhPsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

T24gMjQvMTEvMjYgMTk6MzAsIFNhaSBTcmVlIEthcnRoZWVrIEFkaXZpIHZpYSBCNCBSZWxheSB3
cm90ZToNCj4gRnJvbTogU2FpIFNyZWUgS2FydGhlZWsgQWRpdmkgPHMtYWRpdmlAdGkuY29tPg0K
PiANCj4gVGhlIEFNNjI1IFNLIGFuZCBBTTYyeCBTSVAgU0sgRVZNcyBib3RoIGhhdmUgYSBUUElD
MjgxMCBJMkMgR1BJTw0KPiBleHBhbmRlciBhdCBhZGRyZXNzIDB4NjAgb24gV0tVUF9JMkMwLCBk
cml2aW5nIDggdXNlciBMRURzLiBEZXNjcmliZSBpdA0KPiBpbiB0aGUgc2hhcmVkIGszLWFtNjI1
LXNrLWNvbW1vbi5kdHNpLCBtaXJyb3JpbmcgdGhlIEFNNjQyIFNLIHN1cHBvcnQ6DQo+IA0KPiAt
IGFkZCB0aGUgV0tVUF9JMkMwIHBpbm11eA0KPiAtIGVuYWJsZSB3a3VwX2kyYzAgd2l0aCB0aGUg
VFBJQzI4MTAgbm9kZQ0KPiAtIGFkZCBhIGdwaW8tbGVkcyBub2RlIGZvciB0aGUgOCBvdXRwdXRz
DQo+IA0KPiBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBhbHJlYWR5IGVuYWJsZWQgaW4gdGhlIGFy
bTY0IGRlZmNvbmZpZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhaSBTcmVlIEthcnRoZWVrIEFk
aXZpIDxzLWFkaXZpQHRpLmNvbT4NCj4gLS0tDQoNCg0KUGxlYXNlIHJ1bg0KDQouL3NjcmlwdHMv
ZHRjL2R0LWNoZWNrLXN0eWxlIC0tbW9kZT1zdHJpY3QNCg0KYW5kIGZpeCB0aGUgaXNzdWVzIHJl
cG9ydGVkIGZvciBub2RlcyBiZWluZyBhZGRlZCBuZXdseQ0KDQo+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL3RpL2szLWFtNjI1LXNrLWNvbW1vbi5kdHNpIHwgOTMgKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy90aS9rMy1hbTYyNS1zay1jb21tb24uZHRzaSBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvdGkvazMtYW02MjUtc2stY29tbW9uLmR0c2kNCj4gaW5kZXggOGUw
N2QyYzJlNjJmZC4uN2Q1YjE2NTY4YWE5YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy90aS9rMy1hbTYyNS1zay1jb21tb24uZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL3RpL2szLWFtNjI1LXNrLWNvbW1vbi5kdHNpDQo+IEBAIC05MSw2ICs5MSw3NCBAQCB2Y2Nf
MXY4OiByZWd1bGF0b3ItNSB7DQo+ICAJCXJlZ3VsYXRvci1hbHdheXMtb247DQo+ICAJCXJlZ3Vs
YXRvci1ib290LW9uOw0KPiAgCX07DQo+ICsNCj4gKwlsZWQtY29udHJvbGxlciB7DQo+ICsJCWNv
bXBhdGlibGUgPSAiZ3Bpby1sZWRzIjsNCj4gKw0KPiArCQlsZWQtMCB7DQo+ICsJCQljb2xvciA9
IDxMRURfQ09MT1JfSURfR1JFRU4+Ow0KPiArCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fSU5E
SUNBVE9SOw0KPiArCQkJZnVuY3Rpb24tZW51bWVyYXRvciA9IDwxPjsNCj4gKwkJCWdwaW9zID0g
PCZleHAyIDAgR1BJT19BQ1RJVkVfSElHSD47DQo+ICsJCQlkZWZhdWx0LXN0YXRlID0gIm9mZiI7
DQo+ICsJCX07DQo+ICsNCj4gKwkJbGVkLTEgew0KPiArCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lE
X1JFRD47DQo+ICsJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJQ0FUT1I7DQo+ICsJCQlm
dW5jdGlvbi1lbnVtZXJhdG9yID0gPDI+Ow0KPiArCQkJZ3Bpb3MgPSA8JmV4cDIgMSBHUElPX0FD
VElWRV9ISUdIPjsNCj4gKwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJfTsNCj4gKw0K
PiArCQlsZWQtMiB7DQo+ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Ow0KPiArCQkJ
ZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fSU5ESUNBVE9SOw0KPiArCQkJZnVuY3Rpb24tZW51bWVy
YXRvciA9IDwzPjsNCj4gKwkJCWdwaW9zID0gPCZleHAyIDIgR1BJT19BQ1RJVkVfSElHSD47DQo+
ICsJCQlkZWZhdWx0LXN0YXRlID0gIm9mZiI7DQo+ICsJCX07DQo+ICsNCj4gKwkJbGVkLTMgew0K
PiArCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX0FNQkVSPjsNCj4gKwkJCWZ1bmN0aW9uID0gTEVE
X0ZVTkNUSU9OX0lORElDQVRPUjsNCj4gKwkJCWZ1bmN0aW9uLWVudW1lcmF0b3IgPSA8ND47DQo+
ICsJCQlncGlvcyA9IDwmZXhwMiAzIEdQSU9fQUNUSVZFX0hJR0g+Ow0KPiArCQkJZGVmYXVsdC1z
dGF0ZSA9ICJvZmYiOw0KPiArCQl9Ow0KPiArDQo+ICsJCWxlZC00IHsNCj4gKwkJCWNvbG9yID0g
PExFRF9DT0xPUl9JRF9HUkVFTj47DQo+ICsJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJ
Q0FUT1I7DQo+ICsJCQlmdW5jdGlvbi1lbnVtZXJhdG9yID0gPDU+Ow0KPiArCQkJZ3Bpb3MgPSA8
JmV4cDIgNCBHUElPX0FDVElWRV9ISUdIPjsNCj4gKwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsN
Cj4gKwkJfTsNCj4gKw0KPiArCQlsZWQtNSB7DQo+ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURf
UkVEPjsNCj4gKwkJCWZ1bmN0aW9uID0gTEVEX0ZVTkNUSU9OX0lORElDQVRPUjsNCj4gKwkJCWZ1
bmN0aW9uLWVudW1lcmF0b3IgPSA8Nj47DQo+ICsJCQlncGlvcyA9IDwmZXhwMiA1IEdQSU9fQUNU
SVZFX0hJR0g+Ow0KPiArCQkJZGVmYXVsdC1zdGF0ZSA9ICJvZmYiOw0KPiArCQl9Ow0KPiArDQo+
ICsJCWxlZC02IHsNCj4gKwkJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47DQo+ICsJCQlm
dW5jdGlvbiA9IExFRF9GVU5DVElPTl9JTkRJQ0FUT1I7DQo+ICsJCQlmdW5jdGlvbi1lbnVtZXJh
dG9yID0gPDc+Ow0KPiArCQkJZ3Bpb3MgPSA8JmV4cDIgNiBHUElPX0FDVElWRV9ISUdIPjsNCj4g
KwkJCWRlZmF1bHQtc3RhdGUgPSAib2ZmIjsNCj4gKwkJfTsNCj4gKw0KPiArCQlsZWQtNyB7DQo+
ICsJCQljb2xvciA9IDxMRURfQ09MT1JfSURfQU1CRVI+Ow0KPiArCQkJZnVuY3Rpb24gPSBMRURf
RlVOQ1RJT05fSEVBUlRCRUFUOw0KPiArCQkJZnVuY3Rpb24tZW51bWVyYXRvciA9IDw4PjsNCj4g
KwkJCWxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJoZWFydGJlYXQiOw0KPiArCQkJZ3Bpb3MgPSA8
JmV4cDIgNyBHUElPX0FDVElWRV9ISUdIPjsNCj4gKwkJfTsNCj4gKwl9Ow0KPiAgfTsNCj4gIA0K
PiAgJm1haW5fcG14MCB7DQo+IEBAIC0xNjAsNiArMjI4LDE1IEBAIEFNNjJYX0lPUEFEKDB4MDFk
NCwgUElOX0lOUFVULCA3KSAvKiAoQjE1KSBVQVJUMF9SVFNuLkdQSU8xXzIzICovDQo+ICAJfTsN
Cj4gIH07DQo+ICANCj4gKyZtY3VfcG14MCB7DQo+ICsJdHBpY19waW5zX2RlZmF1bHQ6IHRwaWMt
ZGVmYXVsdC1waW5zIHsNCj4gKwkJcGluY3RybC1zaW5nbGUscGlucyA9IDwNCj4gKwkJCUFNNjJY
X01DVV9JT1BBRCgweDAwNGMsIFBJTl9JTlBVVCwgMCkgLyogKEI5KSBXS1VQX0kyQzBfU0NMICov
DQo+ICsJCQlBTTYyWF9NQ1VfSU9QQUQoMHgwMDUwLCBQSU5fSU5QVVQsIDApIC8qIChBOSkgV0tV
UF9JMkMwX1NEQSAqLw0KPiArCQk+Ow0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICAmbWFpbl9ncGlv
MCB7DQo+ICAJYm9vdHBoLWFsbDsNCj4gIH07DQo+IEBAIC0xOTYsNiArMjczLDIyIEBAIGV4cDE6
IGdwaW9AMjIgew0KPiAgCX07DQo+ICB9Ow0KPiAgDQo+ICsmd2t1cF9pMmMwIHsNCj4gKwlzdGF0
dXMgPSAib2theSI7DQo+ICsJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gKwlwaW5jdHJs
LTAgPSA8JnRwaWNfcGluc19kZWZhdWx0PjsNCj4gKwljbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAw
PjsNCj4gKw0KPiArCWV4cDI6IGdwaW9ANjAgew0KPiArCQljb21wYXRpYmxlID0gInRpLHRwaWMy
ODEwIjsNCj4gKwkJcmVnID0gPDB4NjA+Ow0KPiArCQlncGlvLWNvbnRyb2xsZXI7DQo+ICsJCSNn
cGlvLWNlbGxzID0gPDI+Ow0KPiArCQlncGlvLWxpbmUtbmFtZXMgPSAiTEVEMCIsICJMRUQxIiwg
IkxFRDIiLCAiTEVEMyIsDQo+ICsJCQkJICAgIkxFRDQiLCAiTEVENSIsICJMRUQ2IiwgIkxFRDci
Ow0KPiArCX07DQo+ICt9Ow0KPiArDQo+ICAmc2RoY2kwIHsNCj4gIAlib290cGgtYWxsOw0KPiAg
CW5vbi1yZW1vdmFibGU7DQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDU2NjA4NTIwNGQ2Njll
ZDRiZDBkOGQyMzBiMTBmOTRmOTYzZTI0ODENCj4gY2hhbmdlLWlkOiAyMDI2MTEyNC1hbTYyeC10
cGljMjgxMC01YThiZWJkNmJhODYNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0gIA0KPiBTYWkg
U3JlZSBLYXJ0aGVlayBBZGl2aSA8cy1hZGl2aUB0aS5jb20+DQoNCg==
