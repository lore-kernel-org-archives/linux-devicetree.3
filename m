Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6B35838F
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435610; cv=fail; b=KqdmMmpiLKtK+DdWnBnsok9Go8y6aIJ7CCQ6uuqYn5mSscHtLCx77T40rAo5nH4wDegZgslZLbV1lek6NemUMkI42+Spzw6dPLbseiPn/1Wp4SxXu8EoX3/c9lNn/ah117tKl6+TWKjnP6SJPLxl2FIoBb2aeqLGFFpUNBx6/B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435610; c=relaxed/simple;
	bh=b13uCxnHpy2rJB42jbuWOY2wZmaKkV1u3VFjMMSlEGE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ph4D0/YBkkCbaI73/v1rALzm8ucfdKR4lqn9RCUeqZ1jT3lxJPXfD0LUiTgrfeqMI4L0gfFXRrSV5GCULN/xNmhdjpzRRLzTJhP2JTfFExMdqnsljYdgePsZUCxaY3ZUicdvv6i5qH8KbbIaBp4RwYh9gzd1p7sKicokiajQt1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=A2j8ESJv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kWcjsZy3; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="A2j8ESJv";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kWcjsZy3"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B5BR1m3870971;
	Tue, 11 Aug 2026 03:06:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7R1hyAJ4c9ZE87+lWdNgpNB/ULj8fxibtw1l5QHZd
	Go=; b=A2j8ESJvLmcX+LDF+wRMNjwY98YUJt6XaYNd2FA0Kjg653Dx4jXHFaweH
	rkM+PeCG9Q22IppiLgIb9OL6DZvznr6ielXZTeYU7kuHUxQm2+PyyfuHgwWpLDRY
	mC0K0QN7bRpa/p7+h0oGHlWmk+4mH13V0Wi0JxXOy5pIkem6C8ai/vG8aQnJFIbe
	aWoflNu73SbIFp5esFcmwmPpDTm1KjwtZ6o/fW5jY1OyGuV1FhisshLfnA3Vu3hy
	b6P184wa5zzFaWbxMBLu/xUy8ezyXQFrk8eA9S1fZXfnLqRdcHv2aq32RPKZxoxd
	L9RYAd6vkh8FD4Uz8aIf31dfa0jAw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmydc9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 03:06:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svZywoSzV/0u+4XOUkLmlU19zCxlCnTtu2fSdzP5m4eLnjX4lB5hqmIVAo1LxARMz1JzeP4EOfKrWS/uDjj8vg70vWZKwRiVNp86Pgo0IW8PQNN7ZHlLCyGu2eYaR5oTY1XHQMKvuojK8c+GATyppYx2RHxHMrQGRyJ/hq23tWRAPZXSB81fPLgfyp6vudArWzrSXd4ETWrmoBtsG7tziZWJtqU2fR3uuzhYgrg6MMJYVhvovXKq1zmnskhjd9D8jR6hYGpS+DVAOk5D1DqgS/MCrN9t755wpy52IbzNO/pdP3tR7+7MMdEuLWlxt5dCgA1n4mM6q37AkWYCl1FWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R1hyAJ4c9ZE87+lWdNgpNB/ULj8fxibtw1l5QHZdGo=;
 b=CaupjAx0U39zN1eBJm7DiLgseZzzZ1ojlF9Q2vbXKHHF8ikAzH2ySyva/50qWSu8fD4A4bqw6VBvG3tAYEygJRXJNEuQZZ+x/2E0/jHaYtBK/lXhl/0lBBqARAwdxuEO73bXl7NzE2yaOku2PVH1SmSMt21qCe9NVVQNVZVOpzKJV8VRfIl5Qz12x8bHVRnd20NHvn/ozhI+0qAFlWRqZOWqFRm/Eh+AErACDaTJZrAFm9a4lZaDKXu3c+e7MNYnEUxIrbWnIQoGUYFU++E60VgsEuNG1v1iivyp9D4i7SjkZoeCcvxRo4idI5+/LsrTreN4qdgPL2ZRnRADFljXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nod.at smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R1hyAJ4c9ZE87+lWdNgpNB/ULj8fxibtw1l5QHZdGo=;
 b=kWcjsZy3TSu0xyOByOfAYeFgBxV8+v5/MtiMXjDuM4NwQx/A12qudLOtmkXKIxOcbdcyhID98+VtdpMhiRvDUnp3hhU5JTo2MwZeaZnDR6d6FPN3C+WMVl9OAb/AMFDBEc02iPbWc13wRj4lFrj/2LX4MsunbP+D51zXjSsY35c=
Received: from DS7P220CA0105.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::17) by
 CH3PR10MB6833.namprd10.prod.outlook.com (2603:10b6:610:150::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.11; Tue, 11 Aug 2026 08:06:30 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:25d:cafe::14) by DS7P220CA0105.outlook.office365.com
 (2603:10b6:8:25d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 08:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 08:06:29 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 03:05:59 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 03:05:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 03:05:59 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B85tuA808576;
	Tue, 11 Aug 2026 03:05:56 -0500
Message-ID: <6436f090-1a2e-472e-bd09-6145608de3d0@ti.com>
Date: Tue, 11 Aug 2026 13:35:55 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq()
 about post-config ops
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>,
        <devicetree@vger.kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
        "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>,
        <conor+dt@kernel.org>, <robh@kernel.org>,
        Richard Weinberger <richard@nod.at>, <s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-5-s-k6@ti.com>
 <20260723113443.06C2D1F000E9@smtp.kernel.org> <87ldaumbnk.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87ldaumbnk.fsf@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|CH3PR10MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb27025-eab5-48e9-c681-08def77f730b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|5023799004|56012099006|10067099003|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	QRTO8S/DBEvQPB60jQf2WXqWvtZDS9b51nO4R4DilXpV9LaAZoqVBZrt+bZE3ncfinSdJ9tPNq2eLIj284XO/bp1jfX3RPC31GH2CQ6LXT0pFxey5vUt+xquG3gzxG1i/2+FMlu/CHERiTIhe75fp4brKJPEdgUpE6E7617bz1FTuhJDTRWpNrNKQa+svfHyiZjEPb2hZIIWCFR1F0ApA1D9so7FBmFbR3g0LDnzW1jsSz5F+keBgBKKKRGm80jxvs2PamEOAG5/mbZF2HLxtC/OsRSVceWfTQTpEphVQJusk4sfr+G1bR4iSkEKTsRO7y8SyxbN1AA/gCv7TCB1rB4x6+IWv10iGgX6Z7SCeUoxlrP9fzUKBBuQep/eIY3t1HPN8ijbR4gxI/IPS4qddAxIFhCH5PHvRywNsDYl2JsDB2+9Gqc3djGiyszqtR5YXzev/A3JNbxDKSs8ZAHJw5AlJGgt6EBYL/4Dp5grMEeYbs2RA3XvhHFTqj2qIp0z7cv/S9z91DsET28Od8j07DtQgg6FT4GclW6yRaXu0csEC6CF3tBdAnnDXwmzAqO6tbm72aoeyXV5oib4d3pvu2tCzfoOnympFUFkW6vGCTdaIf6YPaxSWeydByxZgqj6hoz93t1IimcEl9i9sjoJGVVG6/p6dKMSJF6stspYD8iXhAYkZE/Dbe5cscfP36rDLuCGx5DGNmElAjGbL2hylQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nyo4/LivOmTLFXHL+gtTvhNUGsfY3qIw1DCgUKGf1yhZIBT/j5Uf0FTa0gcFU9zX2bKLv1NX7KGYzvA9KU/JlaEOw+m1TVaMWtn8GgzzJd9cyyyw3FyXMOyVw/5oI7FoZ87v3Mssl7FTovCfMkHgWcQVZdOmzt3wWr7goIAimEj8QE1B9lfyOJCqnJ/b3EDdHfcjtX+T7QNlQpXGgXgCPCbNO7io4idqCT1wFQiCJFkd0EXRCpLA6LxZT7LVKj7H4oUjE2TathBhTA3pJrLDfu3bMAeXH0SKxHHB+JmvrUiA2/QZjFzzvENImWiNrIl4p7EuFx8oQlzxo5xZL2W9Kjb7vHF/iFB6i81383tQls8HT+6Ob2Og5eg/fs8qpewMTmBum2iC3k/136fuu9X2KCIjNf8TjqucW2jpjnou7ZjK9FNUZitTRhjca2FGanwT
X-Exchange-RoutingPolicyChecked:
	En839y98JQXlH8K09UZCYQmFlEli7IbQ6cJohUYeHSQ101C7u5fbsTndTjNHy1UUPDmaP4E4GMUk/A1kwPb8aJqKMnPM6k5ndXKWvEPHDIVMEnnp4wDf1TEdtGEWeuava5kZmsLcRYoomdNy1syO+DZH1OBXX7rO3xztIo6xIV236h4snZ016Ntu5D5cY6wMjo/Cy/d/mwL0LTRCYQQf7jjagqoRFBmtaXg/T37m8NY9gjbNreSSrmsP8CMxU1/LsL5em/a04sixU25CTFVijI4uJukJUw1Z8c4IHQI+ZMZZCTeRKJifUQpixGv2ogvOuBvgWJ7uE6MW8oMwOelVQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 08:06:29.5164
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb27025-eab5-48e9-c681-08def77f730b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6833
X-Proofpoint-GUID: 6IuygQPQ6EsSPFQyzDtiWkivPRCMo9Bn
X-Proofpoint-ORIG-GUID: 6IuygQPQ6EsSPFQyzDtiWkivPRCMo9Bn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA2NiBTYWx0ZWRfX2kPItxRDCmzq
 +yHUr5UUu/67kvYoJDFaIP9SytBTJ2ldUZsMj84wDMPcxgS7jeSiP6qVc+3M6o9vC5JEZMGmrQ7
 F2mOb4FqscmEOusmTrERTi+QoDgLyuX2jTUqgX6lWEXz00JJFEcKnhFsv+VMRB36ZCCeDYTJboQ
 +u+N4ypUf0KrntCBQBsgyeQTt0D4W0cDeSszpgSyjNSPinDSqOZ6EJMiXv3Of+3ezdFxYMIxvo/
 eQSvpgznEt3mJIoX278uRhWnOefndG6cuPzYdPZ0a/LGPJi5xkn4hE1bSceqI35TTqXzVfB+ScW
 5NZKfsJQKHPUQ2gcNlnSnSL0OXPCGXPfri2NzuZzHyWOFYGzNdBCb/c3XzlJhthByBCBqPvrNsy
 KT2Mf7xd7VPkmCYE1Hte3op8ZuskymkpOrzefQ+3WVLWnW4hMq/MsQQtdyEodhPErHxAo8PkiBL
 qROJWtKFchx0aIBssYw==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a7ad809 cx=c_pps
 a=sh1HRyDNv5RGx04/W1QObA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=iqMYSfj7DZyW11qaUaYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA2NiBTYWx0ZWRfX2eCxj2Mf/9bS
 f/pt46//A5IG5Peasm1myG35RAJo3++o67g64t8yvjsxKsNj5hAa0GlvHgggL5d38mfe4dHREzo
 lo/8Zdps7TAHkXfuOjlAHeT52VMgvR4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110066

Hello Miquel,

On 29/07/26 14:10, Miquel Raynal wrote:
> Hello Santhosh,
> 
> On 23/07/2026 at 11:34:42 GMT, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Using strict equality `op->max_freq == post_config_max_speed_hz` as a sentinel is brittle, breaks high-speed modes, and can inappropriately elevate frequencies of un-tuned operations.
>> - [High] Ops running at the post-configuration frequency bypass the `per_op_freq` capability check, potentially causing unsupported controller behavior.
>> --
>>
>> --- Patch [4]: [PATCH v6 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops ---
>> commit 929442442d981a80e44b25e60b6fa3ecd9dc8a62
>> Author: Santhosh Kumar K <s-k6@ti.com>
>>
>> spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops
>>
>> This commit extends spi_mem_adjust_op_freq() with a bypass for post-config
>> operations. If an operation's maximum frequency matches the configured
>> post-configuration maximum speed, it remains uncapped, while all other
>> operations are capped to the base maximum speed.
>>
>>> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
>>> index a88b9f0383564..e20eca1b82457 100644
>>> --- a/drivers/spi/spi-mem.c
>>> +++ b/drivers/spi/spi-mem.c
>>> @@ -591,9 +591,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
>> [ ... ]
>>>   void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
>>>   {
>>> +	if (mem->spi->post_config_max_speed_hz &&
>>> +	    op->max_freq == mem->spi->post_config_max_speed_hz)
>>> +		return;
>>
>> [Severity: High]
>> Does this strict equality check reliably identify post-configuration ops?
>>
>> If a hardware-defined operation limit exceeds the board's tuned rate, the
>> exact equality check will fail, demoting the operation to the untuned base
>> rate and wasting the PHY tuning.
>>
>> Conversely, if an untuned operation happens to have a datasheet limit that
>> is identical to the tuned board limit, could it bypass the base rate cap
>> and execute at an unsafe elevated frequency?
> 
> I am not sure this issue is relevant.
> 
>> [Severity: High]
>> Additionally, does bypassing the cap for post-configuration speeds break the
>> frequency capability check in spi_mem_default_supports_op()?
>>
>> In spi_mem_default_supports_op(), the capability check is guarded by:
>>
>> 	if (op->max_freq &&
>> 	    op->max_freq < mem->spi->max_speed_hz) {
>> 		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
>> 			return false;
>> 	}
>>
>> Because post-config speeds are typically greater than max_speed_hz, the check
>> op->max_freq < mem->spi->max_speed_hz evaluates to false.
>>
>> Does this cause controllers that lack per-operation frequency switching to skip
>> the verification entirely and incorrectly accept operations requiring dynamic
>> clock rates?
> 
> However this one is plausible. Could you please verify? You can just
> drop the boolean enabling the multi frequency capability in the spi
> controller driver and you'll see how it behaves.

Yeah, right! I've verified this.

For post-config ops, max_freq is set to post_config_max_speed_hz, which
is higher than max_speed_hz. So the existing op->max_freq < max_speed_hz
check evaluates to false, and the per_op_freq check gets silently skipped.

I've fixed this in v7 (posting in sometime), along with the other issues
reported by sashiko-bot.

Thanks,
Santhosh.

> 
> Thanks,
> Miquèl

