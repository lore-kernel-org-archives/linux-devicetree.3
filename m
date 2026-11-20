Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795177603;
	b=HN6doJ1VFMej7RPy2zwkN5qvaYC1orgFZCwOpHTLPGuCxTAMYXO3M1kCK6w3j4kYYw8Q
	 Uz8AICXqQYyxr4WuLjCSV1dIr6mw+TVP5+EtXxP/96c+EbpaNVuam9MNApDRa5BTeV308
	 eKI8HWOyk4VBpYrm3y1P4Co9R8ZBRvdpZZ6wKamoDBMOf/e2+gDNMjnL83SP3u+iBvCMj
	 AyqeTGd0DrN1CqrGFoQSY/S+7PjCupxF4lJ/FiN1IgkuSvAZ2jAAdzVBH0L9jI6GComDa
	 vUNQ/XPy1PMpf5TEmAc+nbVx1Z74qf777suM2ymwKL2jsh3TDFwyhub16mad+s4sXRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:CC:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pyDcnrlS5/irH7o6JfuzWdo80KPJ0w+BAvdQtGaE/+o=;
	b=wBHegq8MoGws70BFRFf81UahRfJRW7KEAbJWjP5vryPeFVN2XI5udRLf2ymSsxLdzIVe
	 hpI+QDBHedS3uIpGHx2VbI+t6IiSdaCQw1EJX0OC7A6QU0ocUypIwHlty7rPyJNsXVSdA
	 UIFGoR0rqczRbfk6sIQuL459iyyv1I1XXVr+1AiAtEHq7pRKr/93gHMNn2b0QRrH9tnjv
	 qyNnZDdtnzwqmWlgVap517nSsRoikKGQ7SZijHbYVIuKW+CQnvJAliehC0u7k8G3UjVO2
	 Ekz1PeEKGEAhRcDjtVWAM3/abV0f3gGR3gjh+gdI2By+nQTtgYh8hcUsaGQwnWuhMfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=gNeleXk1;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=UIvn2q7i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529B3606A335
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529B3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=gNeleXk1;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=UIvn2q7i
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKCMsW7372358;
	Fri, 20 Nov 2026 06:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pyDcnrlS5/irH7o6JfuzWdo80KPJ0w+BAvdQtGaE/
	+o=; b=gNeleXk1mKzp+/7DmL5U9R2Mb7L2JzYSzeqBmF2/jk9wAfbZjkAgwLEDO
	8bYFX2L9a75HVT93tssn8vaqS32CNAkNkLNZ1HDH0Ys8FZREWHT2kKqwY9y0uuXF
	D4HJrDKDoP1KNchpstIZRUp3s2W6G/2gjo70WD6OHQmha6rxh7jps6CSIUltyWoe
	7f2A3MqF1BpFcyEH9d4i9IVUFUO8TXzVBQjrEE+6WuAabvDxTyLy2iytY9Dw+xcO
	//yTPFtBPqKm9D9mDulADjnkfAswtAhzel5QIuACHMQbKL0tJsIdqP38FDcnd82D
	OguntI9Rv2iOd7gAQkQx9RBoURS4A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j2k2cgwv1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 06:26:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9LJHoWtLODI/7NF8BhiQqkMCz3Xux+H25yrfieoQYaOIbXpdPaUPHwsGPylPHT187i6TRU/hhOnbGPxMNtc4wUXjFJX7yUTZ1ZGeeOHlquSCHqBjMigvpISfK7GTTaii8axvYDZxfjk0w26Yu5HkM+sdQY57zOLYnbv4qA3VlmMCL/B250q/UGRBT01gLYRR2tK9WHcPt29ak1WvHGYdwzghkdQ6i87EHx1ZDO53dwiAvKurCDFU+VHQlbO25fQV5gXWguZiiHfdnaP7RBLQ6Jlx8TbtiA0jlAJndT/7Ur9yoS4irTIWRUJO8tVepPhGvqGyt+FELzxeLHD8ZCTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyDcnrlS5/irH7o6JfuzWdo80KPJ0w+BAvdQtGaE/+o=;
 b=YigJBMR4U1CwZOsj/s6G7EwQXt9pDQPbGC78vQj2I1LJ1O64ccADCarBBDn6eT7DZs6GBBLSAFsyev0TQW1wkFZ+HG4FQYCPaY0Ce2PwHph/J7Ak43csVu/SZJtqREPVB3gFTqkokgX+WHJr1XW9QTqSEAGk8dbxy2W6oK3VYYSBrzHILHfcnuXXBZilC0H8Y03QrFodDO10md0ncOctnqdk/n2XXN6QDZwqaW81TMtRteA1QE2NXwNdStwwv8Czqa8e5TAeVhD7kWucn4Sk+Ibvz+X919AVw9Ax3gkl5lrbkxfsaB4rhgL3DtO/Giv1hUXkRIi6baOBKS4ETIwmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyDcnrlS5/irH7o6JfuzWdo80KPJ0w+BAvdQtGaE/+o=;
 b=UIvn2q7ipJhy+mdcF0mFwm1DMIjkDltav7mwRBF6Gyw/mkxc+AKc61EccND6JxZRHqWNhfljyDZxkq9QROm/nvHfOtmi+Ed7EwcMgk3HP1ld8M4wHWAjwY279I3OsQW2YUUzHaHnvgZyNjF1G13hygmMmzT7GmDf5qRCS1lYC74=
Received: from CY5PR13CA0043.namprd13.prod.outlook.com (2603:10b6:930:11::33)
 by CH4PR10MB8196.namprd10.prod.outlook.com (2603:10b6:610:246::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:26:28 +0000
Received: from CY7PEPF000000F6.namprd05.prod.outlook.com
 (2603:10b6:930:11:cafe::4e) by CY5PR13CA0043.outlook.office365.com
 (2603:10b6:930:11::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.2 via Frontend Transport; Fri, 20
 Nov 2026 12:26:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY7PEPF000000F6.mail.protection.outlook.com (10.167.247.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 12:26:27 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 06:26:14 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 06:26:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 06:26:14 -0600
Received: from [10.24.68.238] (uhda0492258.dhcp.ti.com [10.24.68.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKCQB4l2096492;
	Fri, 20 Nov 2026 06:26:11 -0600
Message-ID: <e3ab607d-577c-4e34-bd76-565c6e640f03@ti.com>
Date: Fri, 20 Nov 2026 17:56:10 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-evm: Fix USB2.0_MUX_SEL hog
 polarity for Type-C
To: MD Danish Anwar <danishanwar@ti.com>
References: <20261120122303.38795-1-danishanwar@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <20261120122303.38795-1-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F6:EE_|CH4PR10MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 54f0b317-f9e5-4fda-0917-08df4701801f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|261022075727099003|56012099006|261009223027099003|261021123027099003|261102123227099003|261021121427099003|261026121527099003|18002099003|22082099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	DByoi8lZ/3Eu7tz2Uf+yWAQdVl6xV1OFa2DnMxXPmkKLcGb/IfPCqyypmjhT30PoF3QAr63j8gKMYGyhUitPGCeUwJa3G/tsToUVLiWBVcXSiOV0gygb+wk9YSgu32xa2MmbdBJ2dv9VaezgGyyBtpIhlVU+91Gdf0auY4mgHj4FgNFQ//Js7NCTobBO9Sn+COyyVSp4hrFOxpXXu7xd2Qv4+B1UKD3paGwnvQu8L4p+WbKN7pJAUjLgGClE7RwW1U0cV5kNhqlX4PLs6yaoceAFg2TUOhTV41hHlckr9NtKkxSki1C5TOr1h7jY3+MPbKoX9X6tAdhpOVvPeQ1OAM98hWsdi1Z8rbi+oysQua+stQgZhUlz2pbA7n2XGYZn5ICodYzUs5vsIlDleyTp/Khj4Xy2UZdnx6auR1WFOI8SLSuUwWsVfHg2b0Rj7tFoWc+8fu+0xO+PmIwKOUPuW70SdcT+lGNb5tiyeW1DfoiF5O076R9Yyg5zVOU3krG/zAWwzx9hsGZNqwXi2TAOuEQiAll8WhvRvlXHVsMdEeLsyvh5JraiK+3VWxcmtMO74CJE3nwBINw9IX0F29gelZDWAzUg84tiJCHNKCOf+XC58xyUKgbdJRxVujFX8MEgEY918nkjYHdfw5bzUIaRDKktKFG3B3RdlCKkzeossFP0Bw7jMC75F2efmbUdcdvc5cV1UbneTt/e7ktIcJ4Kqw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(261022075727099003)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gPlt8gvE2r/ZYHi13jogT6WOfMxoxsg9L6ZWAt6rFC5lYby/X3BWrvr14i4O1P4kCW3DY1Eerp1fZ4Y7bvBCNyPfUOWhBgYy7p0wntPb5m1HsSFJEzxRiHTVI/0Sf0wX78ZSG0IHLZfOeUtFxx7osIDGskJ1Zyuj1D+DFMbv2pXrKFSOYDmc9M6e3/30BuGA/qfIBLcN5/Wwz+yo9rWWfaYMkaUx2pwsGiQJXPV9Yror8iFrKMMoH9Djro12YYRclMZQCgpevijJsL+APSNdP7iyiDFVcyOEFnkwEUtP+8r9EZwnNKIkKpjoWFz4iHbcJLEKpoJkopDcVDhThDnZJ5bqodCrp3mom0Clk8R48QbLWwRvvhtmwmuQEbeqx8GluzrbnQXnRN2z4DC0ZFduwChW7FWtFG1G3Y3mP2QJj751oci8444vfIHcULWwNCS9
X-Exchange-RoutingPolicyChecked:
	gJY9gCEk1dPNq24aiOiYcLoIPmUEFoQZ7o4QlNwpTOff8fjWYZ39kTMSktw9X51vu8LFFgqLH5lkmqDhL4qaAfDsEPqH8Ije8jzTOjGylcL95YIgRXI3wIUdlrEDI+3FyImoLP6arW3LFdsKJVk6zOa3Yi5MEXTP/gMtDm6bxBJ+lA0kxfxRWqqqQh6J6zDkewjlxYbEu3SLitcogqGIyQAw4hoP46bSYYe8qqMtaCzGG2KrVFP7nYNQzPctn3xeNNUBj0M0qEGZMji6Z5kjSpsWv5ifFujpdn8xA95VgoHYhD9Ek0EWbV5TsTPMy6UOHUX1WQ+vABZjNp6TwI6Q5Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:26:27.9063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f0b317-f9e5-4fda-0917-08df4701801f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8196
X-Authority-Analysis: v=2.4 cv=NYZzRGD4 c=1 sm=1 tr=0 ts=6b003c77 cx=c_pps
 a=kAM6CeFpMxeFc5AoNv8A9w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=5KZdJ7p0Qn4X2XobdQgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfXye87LbfrTcIN
 GvBwMsyfhGyrotXePfT10P7fvIKQfSNOp3M+XeyUG9owq8Z9H7qBqos+sK2lOcqqm4mwx/Zy+6l
 gzLodDM9FoyPqr7m1cuu0kejhiB+liMPlGeF5GPrSxtLhkbwrS1T39sbshmfGDACLQGesHIOh1P
 VV6JAQrU9NlPp2P1APwS12uU838uNXGof/j8dvvnFXlml6GNdJqKI26QxpBBIY79GM4a/zNJZFn
 wg41ptNNPD69WzdVA3i8kXb3Snmm7+qFotGfSN7qkAd0yLVzxCspzd/9H1k04n5w4pKRXhtIsa+
 ghH+/T9sEWFLrB68dH81WhNPxzUmomuSOf9LcHfdwnFKzcT3Q4cajib5yaET46w3/V4KCn69YL2
 27DBh54lRBuepjVL+83T+gUjEXzBQPhHZyNkov5QkvcGf6M11rMy1ur1UoJxW9PE8GD2fVlC05t
 kjfpPJxgKdX4wGBEwpA==
X-Proofpoint-ORIG-GUID: Fs354NB-HI5JovHEDM5zcm7oim2OwCvc
X-Proofpoint-GUID: Fs354NB-HI5JovHEDM5zcm7oim2OwCvc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0OSBTYWx0ZWRfX+zqoG4/v5osD
 Y6IA6ImkthE04Vfr/92zZAAjHqabKFww5rl/nbbbTLLqao8DpfCQVS6VmvIjBKHodD0CpFJaoGH
 yTCTzDomkHlASHeYTOqDoYUygunIx0c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200049

On 11/20/26 5:53 PM, MD Danish Anwar wrote:
> According to the "USB Type-C Mux" section of the J722S EVM Schematic
> within the Evaluation Module Design Files package [0], the Type-C
> connector is connected to USB0 when USB2.0_MUX_SEL, Pin P05 of GPIO
> Expander 1 (I2C0/0x23), is low.
> 
> Commit 65ba2a6e77e9 ("arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog
> level for Type-C") changed the p05-hog from output-high to output-low
> while keeping GPIO_ACTIVE_LOW. As the polarity flag is applied before the
> level, output-low with GPIO_ACTIVE_LOW drives the pin physically high.
> USB0 then does not work on the Type-C port: with the gadget bound, the UDC
> stays "not attached" and the host sees no device.
> 
> Use GPIO_ACTIVE_HIGH with output-low, so that P05 is driven physically
> low as the schematic requires to select Type-C, and the devicetree reads
> the same as the schematic.
> 
> [0]: https://www.ti.com/lit/zip/sprr495
> 
> Fixes: 65ba2a6e77e9 ("arm64: dts: ti: k3-j722s-evm: Fix USB gpio-hog level for Type-C")
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Thank you for fixing this.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

> ---
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index c6486cf5a05c..80a915925c1c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -586,7 +586,7 @@ exp1: gpio@23 {
>   		p05-hog {
>   			/* P05 - USB2.0_MUX_SEL */
>   			gpio-hog;
> -			gpios = <5 GPIO_ACTIVE_LOW>;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
>   			output-low;
>   		};
>   
> 
> base-commit: adcad7f4e6332cff3d6d7165f41584899f598534

