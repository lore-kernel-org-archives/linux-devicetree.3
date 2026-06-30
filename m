Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86544368D60;
	Tue, 30 Jun 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827027; cv=fail; b=H8iBUfgKR/dzgjzP8fWesD3ooA1joSJqL0hdQiXVRQfxFq2tV1Dd0Xg8a/PLumLJ7alkHLquooptMwdccL5EXbNjwGngRBzmeD17XdsHtnlXJXJ7xgRQQie/bxxrtTp6a4pMEcIpYYHr2MwV+tNoh2lj30LkKQks3N0LsBdghds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827027; c=relaxed/simple;
	bh=kZgbdF/B+m/tMXesLrhOcYBIIIlEen+D1A856eSeJ90=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kb1ditz51Po6D0RDDQhI2CtD45eK2ncDsbnsbkJ4q+mKsRpXtvbvN/ZslhLWEP0rFjG0w8Lp6HfofQ15c1TGQXeGGln+lSvuEeCrAZEpqLs0Fv8ZL9Yndr8pEoHZr+tv+5tlqw//eh9TjCyY/J0OEWOsbSxA3SZX2lpXfEZDXE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=S3j9cZiU; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bMJ31qT7; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="S3j9cZiU";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bMJ31qT7"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65UBCNWC401219;
	Tue, 30 Jun 2026 08:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=wEFP8RvYL8oVv
	2yu+5niZACOu/qCfFgSfWHD8nYBECw=; b=S3j9cZiUhwt4CRu2KgLs8ifg+f2L0
	/RRylLBqcJLTUTsSkKNcvrgRiC72i++AEb85CiIAWDcgP3VgBJUbEJbKsyGIJNHa
	WP+/AS7CymHNxjt/Oizym91+4UCEZkJ57K+BW6n/Lwh5g2RC4Jt06X+10CvwhBMb
	PsAuaJTrTFBjoUM+HhokM0HsC5HynH9XSvQvdt+egco3+61mTmAgGXzQ2KU0g5tr
	R63dIPGOqs1IYZbjusWAuVoP+ZoD72Vivc8wktbvluAjq/OHbpZEeX5w3Zx/mq/F
	Mct1uEfs+XPly8NdKguCgkZigNIeH3paxddXlPAs0Zr9Dehrb2Fy+un9g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013000.outbound.protection.outlook.com [40.107.201.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f4cqj8tvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 08:43:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKAuxgfIzQDD+7/tg1XK1BezIqtgPfq/UPF2eBNpSdTuZyi6N8+8Dq5EZBR0E5j9QWJvSmfENlJwwKkXK1nDYa1E/T7xS8E36oCZKLrfQeBcq40BvZcow/rkLmplDdAA2m+xnDVlXg5IMjz+KBz5ip6xyesEChgvwcY0fy6gzHo5M2qPygleShN1fsrFFJsOgAX4Hu4/QNgs3P24XQCsW0HOeyioPrdijCinygjXYIqtRZlX4i6vPN7nCO39sAfEek2KzJOdCkKuJzgv9WsLD+P0Zs7B60MuCuv9efsq0HT+UmvURVKuk5U7pJvaCJHFDwWnHqu3qZllObooQsCmuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEFP8RvYL8oVv2yu+5niZACOu/qCfFgSfWHD8nYBECw=;
 b=PZFOK+UdlzTmER8gesQN4Lds3VV8qFexXstmqX6vMFkCfj5KlU4Wuur+CDhMSVNU+TJ3qVLKLUob4ho2b7J1BLgZ0ozzR5xSJRXpXeB1Xt8lBCkTNcmbe7Uf7cYkUQsXHegDPCeeusjBh1AxloQmW3OzzjQq6WkgzM7Stzjvr0aSenPNwrX40IY5zbUtil8Xq4XfZln/lCxrNwMNjj5tdYBTg+VQw5cNLlPEOuSepK9mGEUhzpjAx55hwsc3KpuH1+sYx5dTdc9F1GxX9GKnCsKsmFYItJh9u65Fs1XmjZsRt+MY6eTvJWWYnDuRYcaeQ7amg2mYJ1ZPbXGfZpDX5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=cadence.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wEFP8RvYL8oVv2yu+5niZACOu/qCfFgSfWHD8nYBECw=;
 b=bMJ31qT7Qpeop5ei/N+/lRd0CzXiX1rmaGOiho6AZ3e/YAhg5+GKbXweDUUEoNqDyDQVe3sXYnP7qbAvpsEpePXKp1XMBVJzKrk8bk/yBpVHvZed63hYSy7KMgRZPCiVmFtaH6ueQJcDXaRQoBoDOZhYWo4qSu+ylu5jsUAPhuo=
Received: from SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31)
 by BLAPR10MB5089.namprd10.prod.outlook.com (2603:10b6:208:330::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:43:37 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::9c) by SJ0PR05CA0056.outlook.office365.com
 (2603:10b6:a03:33f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 13:43:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 13:43:35 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:29 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 08:43:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 08:43:29 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.50.145])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UDhOMZ2614781;
	Tue, 30 Jun 2026 08:43:25 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <neil.armstrong@linaro.org>,
        <nm@ti.com>, <robh@kernel.org>, <sjakhade@cadence.com>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <yamonkar@cadence.com>
Subject: [PATCH v3 net-next 0/2] Add support for dual port USXGMII+SGMII
Date: Tue, 30 Jun 2026 19:13:22 +0530
Message-ID: <20260630134324.61085-1-g-praveen@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|BLAPR10MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b86346-6ee7-4a03-fc19-08ded6ad9557
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|23010399003|56012099006|18002099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
	gx+eUK0WlWzYc6GKNvBreIvQoQM5AhWVpl3olp9Il0K34AOm4QnrADst1VQ7EJ5SgKTUvU1zG3teIpvVx9blGJ+4OymSIlJm6w9VQuEe1UZnSo72hpzFAaKag5uk/XNj3JRnJF9XMEj0Ca8l16yUN+2GuLa2grsseIIgVjcIT5oRWKZ/i3S6jBd/XDtwFJ9Me3ftagIdermsYjhasEUGurDFb4reEIhq38tPPGeodNp96UToologb/PDLGxFWg9449rLfbunTJSVKxx5isqAc3B4kdEd7frJMJSLBORSKOtgp+v8iNnR4rk3tQqVnIyXiPQvwGpG47kO+mfN/lRjQsOVBYtgjt2R6DWcZW8rd/timhNG5nufcmqb1SLb7CrqgGMnp4i9YMlmGy7iffpRkevJHy23TdIZf6UEz+xN56bAphbqtDcIviM3H8pwgj/ZB6CjfAOJcIyyWA1uLPrwbf8YncRc9UefXvnmlq62U20HVNMppQV/WD5S/YQS0/B3Mog1wjRxbrB/omm86k08MK6rMzCOKDMq2iIvpNMGq0OIqLM9CgQDAEXdninzQ7iSrwRjh1w8mAJgzRWhaTy91/aCYkOkJyc9IvXfi+ChzTfGpjwNWqm8QO5S+JYwH8cYUUcfmT9c3zC4ZuoVb4iDW8jwmrzFsv5Vxs8ByFA9yzD1XA7otDxl/XU8GYqO3gvWrUsxj3R0dLuKZDe4XjnNL4hc+hJrQbem6NNuKxCyley00964c/EQFxYTeWzeZ85T
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(23010399003)(56012099006)(18002099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mbyHTUIh3/NyM+/vQZDp/8Q+MZzgMeLBuLJ6UfPux7kAumsUl3Rjw5pwWnAxucP4lVpkLk2xfgJWiBPv3pjAt47kqvyqDoH1Mo3H1lkT1japOs0crn7FV9Q6RJOVkDsAymroDLhyFUqtUEwxWpslUXgCXZCDfJirdtWnxvEbYnJW/03FxgLVR3WNV5vXpCf9UK/8BrjFpxWHVCQqVCZpljcVr14/D2i6vKpDcZ/OTBjrsr6rmxWQmkBmv9D6iR1Ug5Cptp1Nld+Wj0pKwJ/9WmwO0M55oqmQdACJfN9dsHWGOtb3qzjhseX//WFuhcHFiRQ5YtPO2Ju4b241lwLFQrRlh/KT64vwunyBD5cd50yeSEwInsT5106fKcrRvkGxUt+G75ravFGyV2zTt/kU+1+R+oR0uHjL+8NsY6oyKSpkjee2Hzbq/kv3VZuyc4En
X-Exchange-RoutingPolicyChecked:
	r64AePxaMLoT/YGbjrHCjxI7NzjgeENe2UTgJCsmr17GREIX3/FjafWNxYdeu9G1cN0kDlBwkOm/PbIHYJeIQfB3u7g9S8EeisvsuFwnM27MKwvC0pAWY4rGmtct5BqoYRMygORmTRwFXOLIzyreHBBU5pln36kqc9vT6BaCge7Ew/0tQqImz/XrCX1BO91T19qP+OjIs/dIkuN+4R9aCajIXbzJx9kJ177yttOWQNIMzzVWh3GdJNzch1UbbA0ECUAAXbQm0N1KQJCLw2he1eIHxY2ZyPhoamrFLHf1ujcDTicMYb5Tbsw2nBrNSdPMzSM5a7eVXQsdG2365cKLBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:43:35.5130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b86346-6ee7-4a03-fc19-08ded6ad9557
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5089
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfX/3l4gHLDN6D2
 WrjdpiDKHt0CNwntwpMDPzSdxZ55dUob5GSuTZQ+ppw/pX99F9Jf+GOpykoqOwpuDSL1T+xbwi1
 nRYIJx0qnZCbLoPUcdbUkQQsSjei78cmeLRIqDPM8uTo20lT7mvBrnSNYCRRTwuDnmK2MqZiobZ
 s32OtbMzAB3pve+uRlSJsGPNIxIkKYrddyB642AgFekym5DL6lAGdAzlnH5wiyZQu5VLgsDmUdH
 HUHMW6UKe9d6dRh1ZvlxvJz4DOAUmUrZsPWrdcHwkX6D0L1fTZ6KbxB/0tCk5VCvCriNPjjFVys
 P2iNXtuCxdgdFlCP4y3/cvWCyEI39hBZX11TiN4rWnmUvThYPIZKTo4XAIYC3B9eXhXfkIBluOT
 PW9x6OFbTVSEoBQ20AtuYOJxP3hyFicPgpdURalJ4IjL25vLUwzyeqChr14+k+VbGKCO+Dtr599
 1fWnRTVsNVlvLda9qZw==
X-Proofpoint-GUID: -EGejqiWm-8PdBh6g6X9UT56noiLuKAE
X-Proofpoint-ORIG-GUID: -EGejqiWm-8PdBh6g6X9UT56noiLuKAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyOCBTYWx0ZWRfX4LZVmXWVFQX0
 gJb8UNzMOEqmiWYPlBszkgD2k9zO6MtdQUwOLquUWRdS3M8NylAd9deLezeeOkjdVaGwLWqVicP
 GB5sZtxoMZPlRqkv+1TTXm5L81Ele8Y=
X-Authority-Analysis: v=2.4 cv=M5N97Sws c=1 sm=1 tr=0 ts=6a43c80b cx=c_pps
 a=kza0H2G5rmQD+2VTu+diIA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=WzQKXWopGxF6fKYYR6MA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300128

This patch series enables dual port USXGMII and SGMII Ethernet mode
support on the TI J784S4 EVM platform using the CPSW9G Ethernet switch.

The CPSW9G instance supports both SGMII and USXGMII modes simultaneously
on MAC Ports 1 and 2, which connect to ENET Expansion 1 and ENET
Expansion 2 slots through the SERDES2 instance. The series includes:

Multilink SERDES configuration support added to the SERDES2 node by adding
the PLL1 refclk.

v2 <==> v1
===========
* Added modifications to the device tree bindings documentation.

v3 <=> v2
==========
* Added net-next suffix in the patch subject.
* Added a separate bindings patch and added appropriate subject
  format expected for Bindings patches.
* Updated the cover letter description

Gokul Praveen (2):
  arm64: dts: ti: Add PLL1 refclk to J784S4 SoC SERDES node
  dt-bindings: phy: cadence-torrent: Update property values to support 3
    clocks

 .../devicetree/bindings/phy/phy-cadence-torrent.yaml          | 4 ++--
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi                    | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1

