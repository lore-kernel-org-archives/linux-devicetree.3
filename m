Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCA2641EE;
	Fri, 17 Jul 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277163; cv=fail; b=KhGbEVNssRGuOw3/NKhxCNOYfHUubwMLxL4/rHlI9acqT0TjD+IqHXBdZGrjrcglMCf0DoAC0cAIm39Hr72lKMkKdOcCVMDa4RmH0Hv+yPFf6J/9zMuiWxi95beOyWQ2uxdWhh0MTXtb85Io9cYDbwAoy8At54FT4nqAyf4cBQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277163; c=relaxed/simple;
	bh=O9cTK3pWe8eNjjlxLBBIbg4i7niYVlZQA3j9X3y8IdE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MUKV1FRHQpmTfrMtHz/daYse8QzIRzGpFEikK/xzhGyOcYZzaSRz+TnNkH/Sax9qPgtfgbv3fdv3a2ChfzmilkqP8KIOaWS396VN8LN3LUIfV5IAq9BI8NWrmh9dTIFFHphSQHcUMdy8DX6EHeFyKkTKqhHXFdbFh+cWDS5LAcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=KR16tkcq; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pIjkQCal; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="KR16tkcq";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pIjkQCal"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6bKFK1764607;
	Fri, 17 Jul 2026 03:32:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ltg5EDiMG1W/+
	zcgZp+JtyIMuXJCr98OR/jKQiR7dUg=; b=KR16tkcqqasuVH4gzWF7XSmCVcmne
	sxp/jyyWfSAj9NLHY0o+92J7pnC6iYPmlPhaO4b/pimpVIl7cIGii2JAeItKYBnh
	RWLIj0Iuwpe2p6/TXUduJwMKvq49K/tElfqXTP5l6mghes1HpKyBvKXka/unfJQG
	o+5Lo8kVdrb5F5fIFXktLiRLJbOp4asuwGy9J+N22weCWFXgdINPHaUqnk8v1IzP
	ztypKSo/c5z0fmekbL6FL4oscCNE1YSpOAzajKROuezHIQmc9OTBR+iVayx7jyvs
	3c6+aWToa6GcpHaGk/iLjgqaZ1JGVGr6VTJjU7lkKK3Fcf0nfDHM+C2og==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ff2ccve6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:32:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnCmfk1RqWtObn0bGT4SgK+2re7FnZc4+OY++e9hDup9htClWbMFR+iZh6dnhmNxL8ANBEK3FGi1O0aHGxMftSJmPno9CrAp6WZ4iVSKcWPr8Dyl2A8dPDSx0y7wy/H6obuFWhvRGFXCDqXnDyv8o52MrJgGbLEw/Z5jHfKhK2hSEM/PcLxZBtTgXht8BTb4+o8oCUStG7jO51muK+OBJM5538+glrYXpKk96z8cbytPFy9zGtRQegI+KTPh27WdcB23NifrvOxmLGsTMjnHwv4AK4woIDh0MrbBHxNjgHdczGzDIJsDVcGHP5/8QZzLMdv6UlCVu/XGMac9rdr9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltg5EDiMG1W/+zcgZp+JtyIMuXJCr98OR/jKQiR7dUg=;
 b=mRq3so0XUv5LCqqLz6MiCmyC2H3Y3Ei0M5DAfxEUeRasZhnB7OiFiPeVxCL3wqeXW4LZLIfRnVLY28cNpRlidHq93ln89VeGMvu2dU2aXaNiVZZfZHOrf0N4LZCoQYw+W5JrIAr2vnGgY8+ez4HMgg3yAW9yRj8ieGU8fk8oV5Kwc9VcWNSGap0GyctFLAFd3tA8lZDPXK9SKGCjjaaXGXqg6Qg1mQ9Z2uRs4wVtaB9ieotinyFEajT51jsvC4ZlYuZKPAQo7h+gIndTzmZ/Hkgq0O1U1gAxB2XVVpDNQFApqXG9zPK8WzpwbhxflC9pWzqyux8pjLOWDkDurBiszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltg5EDiMG1W/+zcgZp+JtyIMuXJCr98OR/jKQiR7dUg=;
 b=pIjkQCalCzBxuzqVUTnj4hi1z+guUr2s2yI+DQqWQFxYXxXBjP8fNQGbaALbaCoitdHkO8jbSxju77ubTx4OyBNsSJoo0pbGmmtSfAhn92erWWmAz6Pwey6eTK6GcNiryjgd1soNmW54Z+3OEthhVPjMKWZLdzlAfkp+/mfTZlY=
Received: from BY3PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:39a::8)
 by CO1PR10MB4674.namprd10.prod.outlook.com (2603:10b6:303:9c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 08:32:23 +0000
Received: from SJ5PEPF000001D4.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::7f) by BY3PR03CA0003.outlook.office365.com
 (2603:10b6:a03:39a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 08:32:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D4.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:32:22 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:07 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:32:07 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8W27H3390257;
	Fri, 17 Jul 2026 03:32:03 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v7 0/2] Enable audio support for J721S2 EVM
Date: Fri, 17 Jul 2026 14:01:59 +0530
Message-ID: <20260717083201.1887640-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D4:EE_|CO1PR10MB4674:EE_
X-MS-Office365-Filtering-Correlation-Id: 4197b969-f72b-469c-3643-08dee3ddec25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|18002099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	yi8Hmb+Yw1ikhyxw/4p9yFAxwFJBUzFi1t3HKg41zGkQhqZmqX9NquvWgkvra1lD8bEB3RsWCpgq0PGIE8PrHpR/cFNWBcxH6VHnw/avmIsx+E9nIVa36A0L7/FClHNNoFaQiwHeeI+C4cz0jQb+p9YtQDfYJ5dqozDApTe09eWGiuYSqrVBL8+GPzMx1HyY5K40RVERaKrWgmrSpa8YwIMGYlRtWmF/X4reWoUoUSDjOm/fEre8WICgBfynT1RXNDieAEnrRRZbCnfWs5tqJk5W2NNmscs4bpuG2u10l21BEt9D551elDnjfJKs5IOP107z7+GhO78cLj6CyDUJra4Xz2efz/7F3K0ozhI8XPohNnhlybDUig107R8FnHfICIoDe7+IfUc8CiwcsHisysKKqxYYBRVEVfMqdnvKzYAr2XCectIIRXNj9vnMbejRFyaPtc7ioOOSleyoxlghVCBc7WKfI6JjHRNCmCP4mNnMlPhdgqC6CPTaSsRfma8bA2AUJt5Dh5J8hgQXYlsUUYO9amDCCQsW4/k6ZkawA7nA1yuzotMpdVLuyl5fi4ylsbjhQDXnOObq8TyXMPQMRWO6En2szccOFRHFStB9Mc+OMulYXqcHVebn2qZ56KC5ygcAkYxWCpt/e0n5BjbMThrojl6YeyOydY8RMWr6PRX+iOn8/O0/RPC/4KLfiqhwt70BxtplJodgVw/TutzaPw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ap2i4AGHdKW8wNUK4R0qgdumgTZFAmwdn7Y96PQx3oGlLewjWPMTGqyjxBfYiv/2ij6JTm41Re6SmmWFzePTzMcT1fYfWZ/idFVVquSuoLnlTbLS8RR70egKx/po6eYHmcVOtcZl9Xhf1+HEcDS21C4NRka4YU4Ahz7C54JXx0gdzekgMc1c3oglX7YhqFf8md9yqZd2PkrX8oQOpNT7aH2g7b4q1oLZ2bV423XS1nPQGm1ju/CX5kDT2kWacN5HkNvyEvlB760gAycznMlFU2Gyypb37oxoVaLyEFSBG7MkxqCN30xY6XVbr64x+hxGrseqmViDKwsOLjD2TaBtrH7YKoEaRWKyZ3UY3lpK06AWDgK95o14LEqNqoR/vkTuuClv3NnxM4bYa/83ifMeSeIgRCYEnA46kfmvjGGjcAJqV/4arxQ3lX2/tdWyA0p7
X-Exchange-RoutingPolicyChecked:
	j4slLdzctQJm4MkCKCNKPiuxBb4MOZu0adwg/kSzSyJ6AqcWTE2TrIfPlYqi86Vj7UZpx+77ZzkWAoauHsmc9vtzrguBVFqXhTx78ayHiJUAIaab3yjr6LQPg5qbCJHwdrEsYD0Z6VcAHEUFbLv5776kqtL5LC1/a3C+pNQc4rD/q84+ryDB0QFbVbbMHi9IlBu62aU53NUcn5HeFimXDJ5NlR1kBLOKg1t2fdShcspHt7WsyxdFEM9vAEVT/gOlD/rKeU27rFPXkmt/b3KXs/GU1JqPTGjrXsx9qZnUFGtpC9LUz/Hssy0HX0MVRuxQGDvxhiuCadHlhCZRlEiHkw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:32:22.1080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4197b969-f72b-469c-3643-08dee3ddec25
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4674
X-Authority-Analysis: v=2.4 cv=NtvhtcdJ c=1 sm=1 tr=0 ts=6a59e89b cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8 a=8__9IKA1ZvyzrIITXxQA:9
X-Proofpoint-ORIG-GUID: UrlIt4wMuFunvo-cqFYS45OxQuIxs15_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX6SmGlyCNKInZ
 bFQftIHQj9urfcckQZkissL/pvfjiRLXhVULSdQitzBogmqIEqc2sBN3zmT9yQ1sHhwVoh2JFFg
 D/Ebc/SsEdVdOAwyPxi1am30sp7trHFvtCPntbB2zdgh5KKjgjxng7iesE/qTRH1KzGZSjHAHMp
 K7+62+m+oaJQrT8RJhbLQwnF3i1D+HFSglGVtGPnu+Gu/aRpb9NOjABxc+zBXGV7W/Ju5OJQrjh
 qZSpJchrXAqaAfIMvZCB4JLUq4rStSIB2pxaUhBl6npoHrQbpxPgI/LXCdr40OZqBN9iilHpc87
 k8sG9oDJGA1wYUj9EqRMZ8a4kOp/98dI99qjk155oJl0wTnw2K0+PxKpcoHuOxp9d/dGxqUyPzZ
 ESOEQSEoV8e7AyeoPqNIlMqC6wVEoSeFN1Sif5SnzRo/dupLN+qUwFyqLIXM5MRkfIgzGVvbd+0
 2Y9fU67xZD9cu8H2rPw==
X-Proofpoint-GUID: UrlIt4wMuFunvo-cqFYS45OxQuIxs15_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX5EvIVe188Hqf
 RSl9tDQrHRA2Kk3MiuOLuzUHsyN8eWlywsjbxdlGoLhiZfC/Guob9CNlK6TAR4MdiCUiQimaA3s
 VZfcOba1nqEMOqlQYo1uzlcMw49+CEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

Earlier version of the patchset sent upstream[0] was rejected as
its dependency[1], which resolves the DTBS check errors introduced
by [0] also got rejected on the grounds of ABI breakage.

Another solution to fix the DTBS check errors introduced by [0] is
to modify the ti,j721e-system-controller.yaml binding to allow
audio-refclk as clock-controller child. This is done in the first
patch of this series.

Changes since v6:
- Fix commit message in patch 2/2: split the I2C3 and McASP routing
  bullet to correctly describe I2C3 routing via gpio-mux controller
  and McASP serializer routing via GPIO hogs as separate items
- Add Reviewed-by from Sen

Changes since v5:
Link to v5:
https://lore.kernel.org/all/20260520115603.2662930-1-m-shah@ti.com/
- Move audio_refclk1 clock node from the overlay (k3-j721s2-evm-audio.dtso)
  to the main DTSI (k3-j721s2-main.dtsi) so it is always available
  independent of the overlay being applied
- Drop the &scm_conf block from the overlay since it is now in main.dtsi

Changes since v4:
Link to v4:
https://lore.kernel.org/all/20260519142341.2531948-1-m-shah@ti.com/
- Explicitly disable main_mcan3 and main_mcan5 as they will silently
  break mcasp audio routing

Link to v3:
https://lore.kernel.org/all/20260330094459.128648-1-m-shah@ti.com/
Link to v2:
https://lore.kernel.org/all/20260205130707.2033197-1-m-shah@ti.com/
Link to v1:
https://lore.kernel.org/all/20260112104536.83309-1-m-shah@ti.com/
Bootlogs:
https://gist.github.com/Jamm02/f586087dad227450abe8637e8a688c68

[0]: https://lore.kernel.org/linux-arm-kernel/20250604104656.38752-1-j-choudhary@ti.com/
[1]: https://lore.kernel.org/all/20250603095609.33569-4-j-choudhary@ti.com/

Jayesh Choudhary (1):
  arm64: dts: ti: Add audio overlay for k3-j721s2-evm

Moteen Shah (1):
  dt-bindings: ti: Update audio-refclk binding and j721e system
    controller

 .../bindings/clock/ti,am62-audio-refclk.yaml  |   8 +-
 .../soc/ti/ti,j721e-system-controller.yaml    |   6 +-
 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../boot/dts/ti/k3-j721s2-evm-audio.dtso      | 157 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi    |   9 +
 5 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j721s2-evm-audio.dtso

-- 
2.34.1

