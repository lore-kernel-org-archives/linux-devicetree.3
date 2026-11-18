Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794979096;
	b=y8rlGaVq9kgf6lDp1ZUJhWwP/oQPq+Y8cwPp97h49tSJQxrVHmWkfw7NVm600DNGF5z6
	 noMxLRXkq8yAXYKt6uDWRg4VbSoUjLARg+ELWknVcBGqdfeoS38CIB3uxXINi75lrDG4h
	 JKsTqjGBWrHH7ClZbd65J7XeZTtTuQTP+j28c9rkiI2hg9N6KeIp6rE9rphefnNn49Zg3
	 ghWr7r+0rlb5f7vOIGgX4Mnef0j9h+EqKowlEzdPoXfkYxE0SWqXJX+BqRRTSZh1+t7in
	 /3LavTy+dxx7DvlXHkNqGPggzQYQ5np6SCNYIbDLqBFNcoXKPdyieeZTSDECnPdFNtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z85WS0UJ7a/v5VXMPcYOQb2H6BT7jEl1wKrovcU2iTs=;
	b=nxXfelSxFXKVSajbis15VDQte9OFGjtV5YNfP03Yi5/SWTnDyfmxCBkVW95rqtIOM8/t
	 Tgq2FfCRTZJ6tqIWvmwB34n3df0lsyOcweCXIJ90He5F/eOTq6z/vL23WYIX3LlpxxSZw
	 LmwFnFDvqhxiX3BtFKlkbdut6t1v2LVtZHkTuKlIN4L72ARlSCaWl4LVwkGjel8oxJwvL
	 b+MBGqzARFuDgu2ndBNkgzRFU2ALSLglLxhS4RznSXflKrzzUepX0O00SeqXJdFzf5iHk
	 t22EVCHfKiL4GKw8GWV+pEGEPCclZqgFlvOO6ZzSmpgtJSmun17XVlbD2bdj990+1qQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fQY4TUaY;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=BW5XDOkE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB91E606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB91E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fQY4TUaY;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=BW5XDOkE
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UQnj2192795;
	Tue, 17 Nov 2026 23:18:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=z85WS0UJ7a/v5
	VXMPcYOQb2H6BT7jEl1wKrovcU2iTs=; b=fQY4TUaYXZjGI7kMgQobiVJgaTuku
	jApINYDB8tnDSPV2r1wZ2R2W3JFVxOABmPwov5tNGEUNWQGSVsBWDIZuWSOLZmCc
	9hyT5UKiJUd9HvYYC75f2B2jYaS9JVQafIBrYgeZq5VtfWubBFd2SCfjKLB0qyze
	UYvhe9QJfJBHanstK/mioHVoEtU6URpUVs+q4VgozOi/tQ7Lw8QlRcb3cISDamRY
	J1jddStsf+RmW37v4rQ6noSTM3Y97EfvO160NMD7uFPAtuuBKB8hLUogs3X70jap
	qLaroYGol3UeEXGmQUeTIAhE3SJoF+5vY42T4fHX5ecMKZd7/ePiXM2PQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010024.outbound.protection.outlook.com [40.93.198.24])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j0yuxht80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Nov 2026 23:18:09 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToNR2VWzQYFawe//AgI7R+yHaJTQE9GwndqOT0Fbrp4ba6J5WE/uQRNkJqp/gpCL5gf8wkRaAr6jW49vYDJewRROjlIZyN28vJ18GzgegvHJIL2BDDjPrOzDzQiB5qBJkVbb4qI0BRJEBSSBRLGtXUISGnX6CZclWzfN34Vva81QVIz7e+sBbEjM2ezE8MayM+uCBQOUw0E9vlYuyRMku8FBnaHsS5fc98cs8Ry2iZO5fQFlb/ZrMpoyhClNqASaWl0tfn0ywf6SI1Nud92BqaIXv60xwcRrwBWlie2S0DrkOMNxEKW0IfN5Poi373bFzR5iWQB0HSbMcfhEh/u4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z85WS0UJ7a/v5VXMPcYOQb2H6BT7jEl1wKrovcU2iTs=;
 b=xVZ9ulDCPF3Ji12//aRTVq0ZJWjhhtRYh4K1K6hGiVw7H3Q2GRNAVbLeiKJxX2VyY/5Y72y5k0pTW5lPYOspK+401OZj+qI2365YlhsQQDDlTSfgy6x8oXjEVSvytTEbrJbzv3J7/GP8l+E9zFqz8J8cSXrk7XgfzT7XYNXk8gOGNIIGJuB2aw3UiGQ7OORMaPhGLaXIU+NXJiVnEW6TwRmMTPXWo6cjq6UnBaSB3dLzhP5/b9ZQoSAKoqDLHi8p7f5KyYL95LTTDB3oeLdJQp4FFntwEG6j/oSbJKzNlvh6tI9pcGYGO9ngdfXuDJNGuejnPbKiypKZk7F2IYx6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z85WS0UJ7a/v5VXMPcYOQb2H6BT7jEl1wKrovcU2iTs=;
 b=BW5XDOkEU5RKMESOfrlUydhRhZ52qVbH/nTNhEEpdmBpdKQV2m2BHVosdFpQmNgs/Ffh7b3hVEoiVF6uSpM0rwtFOSWwK0Nn3iRTwqHwGEYDmHGtXsi6iB04lz1EL2+o/ZRa4F/SPyup7aL67p/ZMU3p+eEfTN7OrfVuDgUc4F0=
Received: from DS7P220CA0112.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25d::9) by
 PH0PR10MB997568.namprd10.prod.outlook.com (2603:10b6:510:37e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 05:18:06 +0000
Received: from CY5PEPF00000E85.namprd05.prod.outlook.com
 (2603:10b6:8:25d:cafe::40) by DS7P220CA0112.outlook.office365.com
 (2603:10b6:8:25d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Wed, 18
 Nov 2026 05:18:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY5PEPF00000E85.mail.protection.outlook.com (10.167.247.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 05:18:05 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 23:17:23 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 23:17:23 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 17 Nov 2026 23:17:23 -0600
Received: from toolbx.dhcp.ti.com (uhda0492258.dhcp.ti.com [10.24.68.238])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AI5HJ7b1261316;
	Tue, 17 Nov 2026 23:17:20 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am654-base-board: Add boot phase tag to gpio 38
Date: Wed, 18 Nov 2026 10:47:13 +0530
Message-ID: <20261118051719.691715-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E85:EE_|PH0PR10MB997568:EE_
X-MS-Office365-Filtering-Correlation-Id: 10458d39-69a9-4686-c488-08df45335360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|56012099006|10067099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6hp585HX1QPBMu8uapEEBDiiJuX6avnxJ+phz4SS8dSPD1MEcpXt//tzbiyEWfOBe/XFrj9LdKKoDYgYeSgsx57jZN8Tfr73lr9DAqvbTUveSt9YyLKp7RpLp+wmRSWQXFNZ9zOS1JPK1Lrek9TKEZuw1gcYZn36yrhIzzg6fllHTP2PTFUp1vqmlCKIeLXS8mvLd2c5F9AgH08lwKOGRfIUl4yXGKdZcwCZn/XUATOxcQNqCzpfB/5BXspsKXRDIRlTcS6hy+I8G7jy/iNUoaslT4j5i9N3S62BEzKtO9bXMzFV+a0fV1Ea6aXy4wdDUQ6LMLic7A1ABmQXTAmeXU8RCSynwNZZhmohN1BIbwI/Jul5HXolo3H8xGCSC21PAdLbjy+UD9WgnGqdEgISlvUSnpBWoGEYuA0uyziQlygDDAwZo4vhyF1K4cUfW25QDVmrCLw/fwJqh6gOLeDzMLKcpH9P3LKnJM3/rMiih2UU830O9rmGbGEdffRLxavCK0rkCJWJ+pf8aLPa9A6IwuJaMB/p0ofjsryfypOKDX9exiUthyKmPpSm3KffR1vCrwuyUWKwWbqflnwS1qzcgo4BWFHSF2+zD4wcPxCu6cQXsioXw2hpmFjA2Q/nFhVRsDN4WIhzTqua9T1yJDVOGGR5izRzYu9xZeerZqWlWgJJNCyN3UzXQHxd9ehclaU/PY7yxN9tgWzeTMiKS2ompQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ECB8QKnHmPeuPC2K3bnta8DbyIdX7yUya1nYfgQk/b5HFOh0Armgd4P94cVEi5IUgk4uQNZRagZXE3fS6joOkXQ6n/U+EiaSAlXL+m+PmJ9AFIqT2FM/1kSw94FBKbH+HMJAiBn/m6hpK1g1B5eAGw5UUJEFSkzastcxIItR4bqWRLEOTPYB3V9BGQrt7Lh55lVTGHhhC9A5JTFb9UxvUPEkLZeEQxmfmQQnb2vkeGfyfwOX99XjFZvH6WCFeQDllLsbjBbqV9WVBQp7TX5y34Ex7Wihx/K1kkaO17EMbkM8/BBaty2y8rCZ9CEm2TVWPX7UpLJKM/fOHH6sxLcWmLg5ydtzkVTb1cWXLXrsHfy9fGaUryGi7+QhN2aML6qh0FjDIBCiku8XZCk0QhqfyPF6WPjaB4ex8ouN0RYypDaY4jQupVW7sLm47h7xrJgc
X-Exchange-RoutingPolicyChecked:
	n3GZU2zpt+T2lOU7UNNkgU5JHeiu4AgoB2SNTXhQlRi6R6+ZYRsPUziUvIV0U7OclFRM84s/dGq22Sv4wvHoTEu2zsFv4MuKiSXTbdSDV3AeK1tK4+xj7Eewd02tY3kgR/XyW017+O0lI4RFT2Yi7Qmmn3BTvY3HkC/0cf9PqSZT8YQe8Z3ekaqMnDlt35QfFZTiWtCJGd0RVMieEjEe9x3TBEyUzW8Nl9afC8RKdTSizZrVhk0fiLJ0pcqoVXXJq9RmRgXpA2Wur1+hpc3cZfOhGbfyCDmxqWEvdp0lsiJ5dNufd/d1q49wxxpsui09inMMh//3KZIAsg1Ezk9zcQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 05:18:05.3587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10458d39-69a9-4686-c488-08df45335360
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E85.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997568
X-Proofpoint-GUID: f1GaeCzG-VZZEQLOb1U5DwSM1JxRJwg7
X-Proofpoint-ORIG-GUID: f1GaeCzG-VZZEQLOb1U5DwSM1JxRJwg7
X-Authority-Analysis: v=2.4 cv=Pq0G/AM3 c=1 sm=1 tr=0 ts=6afd3511 cx=c_pps
 a=V/jExjqSSumuV0DCu/2ZVg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=PUq3wjZBNFFVh14HkQUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMCBTYWx0ZWRfXwoJGt9Z+OkIO
 a5vfIOgq11WDlpg2DuV2eO1nKG6iW6M0n9KPDmCyEQq/YzZnlp0oFR8mA/igx7/xLDzapsEe2b/
 cGrzAJlioiZ8w4aeSOGGqjMXA1mgcnDjSHr5620iTcbzcgGTV+ZtUoETxYNYUv5XF1/fG/r7YHh
 zxGHYqI61ZRx7ypnrTYvblzfVZzFJzUpxW9BMwPDZv0CI7ma4MA2zMXg0odzccowE/c7yT56EXy
 2ojB3/NkxB040e/UaCwIu0VX8Mr2WSN92U9Ba93P/VmuB8SACJQOy7HyMvkgOxrh/GOzdKrsmzF
 1+v+DYFbIdopMlEvYhLn8OunGHfQH7x6V8vRmHvOS1vZkWsOpjH2jShopdL0DNdKC5Hw02iXp0W
 RtqwSQkg2IMbsFbwqBuSd4dhXIEkJCXN/am4FIaIEIv2JUmsYZs95G/5RInrrzbHBxVFYRXC1tJ
 H3aMLestnkqWfO4Yv2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMCBTYWx0ZWRfX11FLq8MFrToe
 JKwochlUjJWHvAnicdMpcGfAm9xQATSMwXfNDbErLOzgSCjAG8nJ+yD9lBniQv58r1aFqBrng4y
 p/7OeCS3ezJ9vxLS8vrB/YVwd16M44c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180020

The GPIO Pin 38 accessible via WKUP I2C0 is used to detect daughtercards
mounted on the AM654 Base Board. With U-Boot as the bootloader, in order
to enable a daughtercard at U-Boot prompt, it is necessary for the prior
bootloader (A53 SPL - Secondary Program Loader) to detect the daughtercard
and apply the corresponding device-tree overlay to update U-Boot proper's
(A53 U-Boot) device-tree.

Hence, add 'bootph-all' boot phase tag to the "gpio@38" node within WKUP
I2C0.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20261117.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am654-base-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
index edcf039ccfbd..a445d4e91a83 100644
--- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
@@ -368,6 +368,7 @@ gpio@38 {
 		reg = <0x38>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		bootph-all;
 	};
 
 	pca9554: gpio@39 {
-- 
2.56.0

