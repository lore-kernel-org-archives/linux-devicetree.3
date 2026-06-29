Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8984F39A7F6;
	Mon, 29 Jun 2026 06:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782715400; cv=fail; b=jkUXwCJ6L4TPpEhyjDepxlxj98hUlnuvbSnjZ2hBI3odM/YxYZsLNJHjl4mcemX8VyOextmpaoMvAAqswtGKkGK21Z8FaBR8E33cvIdoX52maKIuJ8ImQqsQLgV+2MCO+jj+9YNhXBOVUnQtLeptJFBXV4nqKAdPl+jwSZGhTHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782715400; c=relaxed/simple;
	bh=mPHcgrtMVUJVz0Ce66jIuWseVJBTThh5dKu5HVzPYRM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q/cnti57scirHZy3AfL7wBGbzDi7q0tiN2OHnGyvJ20c1pj4cC/4/AbLYU+U6v9dR7eW2KX3v0juilTADWCUY9P/z+KrWp9h3zvCt5ELToEcvvkltvTLhcLiO4G+qbJd91ZpRtouoMXbJOfPPF5WUXzQV0s5GqR5qRE9h2c1E5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ogSsXpaR; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bL30JOsr; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ogSsXpaR";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bL30JOsr"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T2coAj731005;
	Mon, 29 Jun 2026 01:42:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Ks45Dx5UKhq87
	o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=; b=ogSsXpaRVjyvXzCdW5ph2kqGJDy6V
	5aARDIEMsUq1qTpm7mcgNQ3AQo6ii//wcsltMdnKLsaiPswhVN4iASo01hsbmOB9
	zz/eqU13KJuzHInxEgDBietONGwFq56LxyrJFPoFgTtcFruJF1Rt68uZ6ekEDo0O
	c7fJjGKj+FFhHCnJq/++dSpEtrZ62rCCrbgivoDKzNXaMS4SrPeRvrsfyTpsaPgq
	VmFR7JOs3LHvYquFMHMfHMcOPa8wiTtJb+L3itGwz7DlWBiSmTAphnJ7p1EVFg1N
	o9xnZYPaMzjUBH9rwvBBjW69IToQldirbnq6lGYzNN4BpXCnm3szVLRLg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsd939-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:42:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPKzZGy8xFOSXMKLc9pZoZXo/KBwKkep3l0Wgbjq2NWdFIr7kqCAyvIcDucFzJ7hZIuMF1sl//eihtUP4XyKMP9BUB9SKxz+YT4WE/2/c13/50XYTikIK/h1/fuFzGT5+bdssN3kLKaSN0c8FxwT0n6UY6Y3HDAOnhhXVYamIRLtg4f0aMl4ExDN5adTiYQNgvmJfopA64r5ZAVsud5yaIDdyBYNLDV2DLDbuX5B14/w6niVy6N4eiwLDENN7irGbi56pnCwuUOESJcyLoEqIMOWvEZ/S2SCB5yFH7kEyuW8BSvw2lBjJnHxkGEpvtKOCYbLnhX5G/biKqzfodwFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks45Dx5UKhq87o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=;
 b=k1zOOIEE0QOFmaky52nC93O8Al092aGYj6sPRPXNejgcLxibl0bWA/C5Xa4vZ+51DD1JMHL5MLcZ44+jqApDw83QrxPTLJtmpooG5nrbpIQAGDhNh0Yxa7gpCTW7JXNCl0ea8A2Sg0FfhH9qrfYiQkt/nboXlEn5xzdcePH6C9Z1eU3CCWuZyixFl2GXEp5XldQesoiPhx4s8pUdIkcndLq6b9mNZOeGl9w0BuhRvfk2XDPCyjw/b1l+KkJfVh4cjHPvRxBK2t/FV7C6tm2X18hox0uN6Px4rnRyVwaEsM1NVbQdwF82FOciKfOmKZA7YR9bV8+wkCiRUGydE+JWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks45Dx5UKhq87o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=;
 b=bL30JOsrVTs3NwzsclFjrYRDAWtqlRjWmGwtv5KI0l2UO9GBMLIbRe7eVDfDiFS/nYNDBIjeU/cCnGHxud2RF9UlbKynk7r1dE5Ccobz3YSPghDqjWBYxGOeOjLYMEcp6aYbVZsSoGGVu8BeAaWTyMePVJhLwcqqfLO5pKhsneI=
Received: from BN0PR04CA0088.namprd04.prod.outlook.com (2603:10b6:408:ea::33)
 by SA1PR10MB6320.namprd10.prod.outlook.com (2603:10b6:806:253::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Mon, 29 Jun
 2026 06:42:48 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::70) by BN0PR04CA0088.outlook.office365.com
 (2603:10b6:408:ea::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 06:42:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:42:47 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:42:42 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:42:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:42:41 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6gd073437101;
	Mon, 29 Jun 2026 01:42:39 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.orgs>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] Fix OSPI DMA corruption via FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:12:26 +0530
Message-ID: <20260629064228.860226-1-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA1PR10MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 89001e4f-2845-4276-c449-08ded5a9a1d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|13003099007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	mQW+RtvlizA8Lx5KMjWysYqbqITLKk3Mmk/bnmDhwdd/4Rhp0zC3Uf389CcVRh7l67hl0CphZwyJo135aFDU2bGhg+ZAaIftaUJwxBr/WFYVqrXguIk1UY4wKtkTyY+daO6WvQp9H952jnINeZjPn3Wxy41gXIg487P1Zz8g3oZPl9udT3907WPa60dl4zatmix5xUTV8ONBHMjeoYjk3joGzGoz9nk1JXlzycwcB4IDZgwxhEb46GEJciJiBb+gf3/bxUQ39/dv0O7oGldZyd4JJP+QsU0TJ7jIkOQCTppM6oO1QfICT7Th35U9pAeROiPk68hbqV6m3dl+0qQEvc5fGw5os3lLAEUE67RfJTBZ9wE6P8DmcoozEKaP2szAAo5JRbzEedyWpRgQEoSUmjrNQzQk+kCjNWC2N1z56a1zfeTEkp0OE8Sr0hIvVrqAJrh+7QK6yYi1NHO1cMjq7Eg9AtXzNtWyUVH3fuZ4hmaNeWTenQbRzaOAAlc9vP1YiIaAB2oFA/dYLH4K3JrQ7RXh4gkG64WAqA1PTgWTwm6KSNLn63P4B+XKffr0TcQRISg9p6GEOQwG1vrO2JyxfWJkM7YAVhIQz/XWbu2/wsBj3nu4iZ8HNi3ARfZFf+XapovOFJgHMpvaZavuZQC6FwUgtRdCXPsd/VF5CTNtnLgNBly057+FdD/TYYOHbnv4dZvep5JTnQnmmkGurtbsgg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(13003099007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WvQ3/bPK3NIMDmXGGKc2UywGXPEPzjBa7IbjwRWnXuVIvLVXiEM4wEBeifDq8kxD/QhD0fZGjGlmNGxNrfkDabcYv556q6hnqgPCYpstNywMOEQ4cEq9BiD6ir+xqRcjOniZC8+8k3KvpB1XKRvblYtkKt8B/027DwFggq/7AmojJWYQ38Jb8icao9Q0/QGpkHYJXuyqAXbaR7FqvUsPGZWDdm/GfLpUqNKsSU+QF2rq3F5py5Zk7UXg7Pmt/AUfVEIdCagSQJXYSSaJsP6GvtyTOSSX0mMZTGb7xwgoSOcCsDDBOZ0nUq6AQJMBcCtIW9BYrjMjr86gh3Bn+HiwzpO/2NmMbxd56FMtnEqPNNk0+AhYhVCtYhcAIK8AzFgk9NUfj8rZAC2K5hLyCYlBJpfF63VWkyOvRjV6jd0nelLQ5EM+o2qz0Bnn2+esbMxF
X-Exchange-RoutingPolicyChecked:
	mZ3lv2nUSp2O08kxwWYDNPqeCfnZ9Ey/jv1DyF19g24w3Ynzulhl3tkJXGE6VlQSMiG0J2SC4Zfe111GWaksOp2tfKGR/+jPk+I7Kd/auIykx4JxCWUyR4v/YrsUr2NuLqFDZkJb1lIQbLySPplXJ3T8BinSvZrD76PQgV/Hi6cMBWQajYJy0QvsrKmo2q4pv10/pFNvXqJkB92xK1UrIGHc4DBtq8DTb8eAkrNWh8UOqFbeSaQZ2lIv3rdbSBBWlxRAfdNYznB6BY3K90kF/eJpFAO3lmankbApLdsT7T+3QIeo4oPtq218PDFLC/dZkh1E6065VE+peS6zlBlbMw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:42:47.3000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89001e4f-2845-4276-c449-08ded5a9a1d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6320
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX7jtDM8bk9EAh
 QiDWTQGLR3+J4h7mJicPZ4gUHaPGyKEnWqZGlVsbXf2SP1A1pEsy0B+zWDbVK0sk6YeLLv4NfyF
 vnLG/1lhnmzIufHf8n7PLZYebA2nTkdtFF9oE1lb2aK29n0SHIp8V5RbqacYiKB+XU4NCOn8mLh
 MXNf8hFdE/4TDSG4oP6K1CV7OzryqtROFgwDRrynEDVjq9L43xhMhwmkFSZNICqxwBcKDXsynvC
 62Sp9GWtT2pUkr+OFIzdHJ2S7QZ/BLenNRSOXxH/2I9nOsFNWdOXZMCJN6CDnJSmsiGQcK4qtgD
 m7Wb0BP6OscgrgWLHUXrUW+/2vPuJerZiE8qKC71bAFw0ye52uj0A7EVsS0WCDz2peDAli9lEsX
 0hkC0pudN+nNwsPFwRsgwbfqf/PDSF3U3ITu6e0p/Hgb4e5nmj3v/5BgxfxUiFB2SUqmfK+2yhy
 EjKX9nrbfiXiGIfzIRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX2PLkzp4bNqZo
 McWyqmioNGqQ7LRmGafK0z5wgwmY/3nV7jJ+zdG3OoVQPdeglIAYtedJa7NXufJeosfL6clsz9L
 3JQPELSEOZQ4Oz4iTa80AQF/A6MYGHQ=
X-Proofpoint-GUID: MJsTaKR7mWtH7khnB8sLvV2ZhIP0MvX3
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a4213ec cx=c_pps
 a=C5fyF0bn1LKt8LWMWUNbGg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=TiSfEeLu68DA89B8gvwA:9
X-Proofpoint-ORIG-GUID: MJsTaKR7mWtH7khnB8sLvV2ZhIP0MvX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055

On TI K3 SoCs, DMA transfers from OSPI produce corrupted data when the
source address is only 4-byte aligned (not 4K-aligned). The root cause
is XIP read prefetch in the FSS_FSAS_GENREGS wrapper (SYSCONFIG.DISXIP,
bit 7), which is enabled by default.

This series adds a dedicated FSS_FSAS platform driver that disables XIP
prefetch at probe, plus the respective DT binding.

Testing:
This series was tested on TI's
AM62Ax SK with OSPI NAND flash and
AM62Px SK with OSPI NOR flash:

Test log: https://gist.github.com/santhosh21/3ac2a0273065e86315a9b442327c9599
Repo: https://github.com/santhosh21/linux/commits/fsas

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>

Santhosh Kumar K (2):
  dt-bindings: memory: Add TI FSS_FSAS binding
  memory: ti-k3-fsas: Add TI FSS_FSAS driver

 .../memory-controllers/ti,am62a-fsas.yaml     | 39 ++++++++++
 drivers/memory/Kconfig                        | 10 +++
 drivers/memory/Makefile                       |  1 +
 drivers/memory/ti-k3-fsas.c                   | 74 +++++++++++++++++++
 4 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,am62a-fsas.yaml
 create mode 100644 drivers/memory/ti-k3-fsas.c

-- 
2.34.1

