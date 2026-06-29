Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A63A9D84;
	Mon, 29 Jun 2026 06:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716149; cv=fail; b=aM2KTxskmYagnyTGbaYzO/awRi6HO2UmD4Tp0awsBPwo/aBoM0i/CcPmEQXGC4PGvoAV74a0fCwLxspAhQ5tY67yOhoW1p8Z89ddVPz1MiPGpnpelkrmlxL5K8G68jFh/3so7GvQQ4OFbYXOglRITR6+5uWCWmp2mB577tJ4Agw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716149; c=relaxed/simple;
	bh=mPHcgrtMVUJVz0Ce66jIuWseVJBTThh5dKu5HVzPYRM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JKY/Tr4r1ryWI85iltsgVbib4xISR8egjz9IC9+iKuO+9vD+H4Sb/Im9ZWktKb3HatUQpitg+HAECsac0JPjqiB0ZWHeVeJJcz8HqKYCeXGau1dDApVn3Q+gTNLw6X4X+MNf23+KaRWQ9Fo1kdJYf741N0vuOUco4bJqnxY2sbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jNObyhOM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=P8eL4rIL; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jNObyhOM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="P8eL4rIL"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65T6kiqe1217038;
	Mon, 29 Jun 2026 01:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Ks45Dx5UKhq87
	o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=; b=jNObyhOMnjLGVnvJfjf6IdHc2oWay
	bbpQ0blCoj/k8+1ISJJ7FIThZFcGKZijbHhrwnUB+lASDcKWeukAUkrNxXzh6knG
	TowZgRaDLNGHBZz3WMhCIO2UgBZ1OHxWHmB4ukv2cGCzfac5v8BNosujeAr4IdQA
	x/LhW4cRiIxdMG6LXQ0k/ALPsBsYdlXB1EeAfiD44hcBJmW8uc9Le67TuGdW4X9T
	iE8NiDCGqxFdQM/5TLAAUPPp5YwtmgeLtr2UUvO7//9Ghirx57oYl3OQF+F/yz6B
	/LWyhh66jlvOeexrWzPY2ZV9Xre34AVilFZ/1qLUEnnY4gEOg98JU3Dhw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f30fsdbmp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 01:55:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yqx9KikG6TVLrln9sSuEa89KXA20EKVXMhXDesfctK4em/JJm0MTNF++aCfz0tRyeTu7bihfqtXuhB+unIqxUBRmYj+jeKrRGG6MBA2KNoufomMyGuNg4Alh/Mbkc+sW7dnjnc3gr/Lr0QDWgUrYFYYyHTCuP7KME48UrLEtupACvWY7f4Y+Wzv/h//iY6Tyin4uQGlVH0Ao/dnKZKPNFjsTvkfT+GmPUDOuZcOTnhsiNck8An0bMc4rBmnB5SxYPk4yHT5u1y4UxyXSO0hrVeR87gopSrDRy/z3pToUWJcp4eQs63thSAbQsjgZaKI391V5ZGML2SglaFMxM7XBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks45Dx5UKhq87o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=;
 b=kdjFex69LIfdksURMx0T1cm3kh+D1AZTiDEdH4IFo3KNiYELz4HJf0EYHSemtooQLYfCjEt4Rf1iNph1K4XhSGOLAUNK6/tv4El/MK1w1FttgOKpZ+st+wTwj663a+k4SzFY5lftijvE8uGI5xvPRzTfCae/vRZVWd/6sbx+6omFjI2ZhsUY5gg6HxtahpAXS6p2yjjZMZZPLrVIPvJNEKAuyncrMpogJIKf2ZD5bHdC0Gtbmc9DLD5emRdjsxZChmi4D8JfjC15x04OmD3HPp5IBvpbmZzcY5xM/zQJ9l0Zeik6h4Fj2lvMJVdIJMPrJzOLCmsT7sjX7u6jzG/1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks45Dx5UKhq87o3Wf2wWzzjZ1EVGv+mx3YiTFUZizlg=;
 b=P8eL4rILPhKMDprHbQdv61Mdjv6eQjK3s3cPoPPQ6J6S1pKBBPmq42NGe/C+YP9ExFm866rzJXZ//kVGrU+VL0bUEGjR/mkMMKHlrHzTIcfLrycwxdwU2tUlp5OWLafC+VdNKAYEFFFIViJxY1L/+/s6QGL27y1ojR9MQQuA8is=
Received: from SJ0PR13CA0154.namprd13.prod.outlook.com (2603:10b6:a03:2c7::9)
 by CY8PR10MB6468.namprd10.prod.outlook.com (2603:10b6:930:60::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:55:41 +0000
Received: from SJ5PEPF00000207.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::ab) by SJ0PR13CA0154.outlook.office365.com
 (2603:10b6:a03:2c7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 06:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000207.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:55:39 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 01:55:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 01:55:21 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T6tJbU4031738;
	Mon, 29 Jun 2026 01:55:19 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [RESEND PATCH 0/2] Fix OSPI DMA corruption via FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:25:15 +0530
Message-ID: <20260629065517.868418-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000207:EE_|CY8PR10MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ab3ff01-31c3-4375-d4ea-08ded5ab6e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	K9lz1cVd2G/LBuyZXKin/xod7Q23dCLBv3OWXOKGbrK2no+JA0ddKSgTB6KsOykSHvuRGto0kbdwsB7gOjf6pn3a+X+pw4jmgg27ELit0q/78E1ldmeFpou6AeFw+RIsCNmPRacY7iVTxsUP7YS4mHZLzsobj70MYDZmV04r+rTzVUa7YKo0pZpyzI6r/AJotRmXItZSd20X4srKohDIjvcVVnWrAx4ic0jPFP3SbblTkkMn+3ANbaKJRVCsN/h1yomimFe1KE5dD1XEN+0+I6alC+zMnkYRmW7dZXNBO7u2nSEysRb9HX1R3gOQlwZ0UUd1yGipBeugG4+/PW459hW0pKBtBLPz9VctlV8bdWnUDcd771+rLOMtsqVBB7p6qChkxBFSGpbB5p3KY5e8jT5Hn9Urg7PUBAkBzLE3r8AJqMUTmcB3cws8oP+osBP8UnDfNgduPQo3SaS+pom35UYhBrPKnqbnDVE/Gn1UO2YZKk69AYFpys5uEfVKNqyY3ZXn8+9O4RJcMGE4p84QarHeuNBataw3OTadP9lhuSHN0GIE+ZdOJRPrOX82eLrh6V3uHqiKie/o8YV08ENYAHk9bnqHOmZB5rYJlALeAL22W5/8ChQczwjTLgbTjB9jSZrhgdEulG9TqGN0fRwGMC7ywFRFacQqvdWAdQ70uKbyNtEPFJ2Ll2p7lf0Pd+8OT+d8XtLEU0xMCLlkKysWpg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BWM+BMW9juRmJwEojAoORp8qPDaQA040uT3Aql/AT9PA/CMAPnkYTKgROTqcQ5TcblrDyfJEBkxLCg/Micmrl12Q0pjTpMgCCUj5xBV+ybh4KOt7mD8ra4KbMH74MGxK7K7hWJS9WYHRu/O5bQjjqlsX2Kclh0px1NpzsHjg8vxwuY+6pNiDixwMOm4n3E/5BLodRQ2NZYuOEQAo5185qh3ao9jZ0QDQbzDHNwbIV1uZcvP0VD0s7BEcqaCntUVyaoaBKDvyEdo1xREsQGQf+F/YWc21xFZwTCLYlgHluk8V2tnoROSxpzP3Tkf9KYT9RYi8dobiSVqZkNe2p7k5sH802f/TamZnWMnQH9Knu++g2bWIaOY/yw8rKd/4nZRJzq/q6hXTlNRmMwXGjs85xGGoeMagli8YFCnXdWCFv3Lku5/yJA5Wp9KZ/z6AU+cO
X-Exchange-RoutingPolicyChecked:
	Wk2xP7Oa9tBWeUcO6DzRMHLmyfXpaFewe9WgSUlHQ+jkV0y1/sB95D/gvZkOIo9Hvor7ub8dCF7+LW5IraAifoJ3s35mZoCXajzu03ELXfpOYVMPgOcGx1pStw554O6upPPfYmZRjyLZDP2VEdmu6eWrTpwfACQ91/GeLVhlDNkxmDLdDRYGOSBjCtpzkps/0JSxvNjHMOfELE+GZ0cIHOPIo8aPuMZQeyT36UOF67Uac0ovO+quHcbjLec7yuRTgbf8GeAYUFk6lmMNS3uxYKfMCAkzm7lr9ws/0ucfnfW6M5A0sN6m9ypYX8NJzE4rSLsMF9gG/7h+1i/ao+jnzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:55:39.8295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ab3ff01-31c3-4375-d4ea-08ded5ab6e48
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6468
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfXxoBEdIVPcaFC
 B4GmrVoromyhp6b0Kv4c+zbLKlPm9LuMacB3clen1ktqzW3cG0qspXOH+d5YGlYppvtALEKxNjS
 bdIxkHT841I32W8QqxC8Tmq6XiqCpoc425SU4Xe7A+hXChiLF4T84x8+BU+XYhO4NaneQHlmjd6
 gJZoLQm+GzsB7DhzqI658OVCkoySXEEU9D98dO6pZonKy0mnKGdPKNQA08+9AdtCOXYe0a7i8zW
 qT/CtVjE22iWVxnYwSNmKTzPTVPSM7ksCywEL2Hn//I4f32xbPEcfFJowPNwXvVqhRszuEHOxwI
 vVhyFhHT3u4yIHBVA5OR2KWX5lwUENJVq3ltu1gIXkeUKk0Yh8ILjTzthPMJf1ugihSqAFw/RSk
 D8Z6Y/W2ObYW9If3Ppm/lJIj5Agn+jOgc3FPGHSTV6kj4421Sy7ASU2esmKBcCAAAA/pFN9ZA4n
 Mn6t42xLEARZekJrprA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NyBTYWx0ZWRfX5ixCbNBXK00k
 jMljo/HaVK7HPoil1pViaGKQZQwpHa/BB1szjcYjIfTLb8eh70FUee+Mj2cIks4qNBYW3wyHhod
 ikoj65ZbeCu4G8Jhn9XFXsu/TrrhgNk=
X-Proofpoint-GUID: _Yrg_H1nBopVbcnJqzZfTrYOPCP1e4Ar
X-Authority-Analysis: v=2.4 cv=dcmwG3Xe c=1 sm=1 tr=0 ts=6a4216f0 cx=c_pps
 a=V6LhDW2JNEJwPIi/f6b7qA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=TiSfEeLu68DA89B8gvwA:9
X-Proofpoint-ORIG-GUID: _Yrg_H1nBopVbcnJqzZfTrYOPCP1e4Ar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290057

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

