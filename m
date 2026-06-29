Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9443C9456;
	Mon, 29 Jun 2026 07:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717765; cv=fail; b=hR0vp9lbK0ZVmXUYFuUKlHbQBgoouTWvhh7ePLXTboyI32uM0L9bg0nuA1AZV0q5CGWQHpQSSlV67WVSoNtRIDVEOmfoDoyUsGI9tGOZ0RUQt7cHyCnzBrST6Q5++/zHIGVvljn/VPMxtDAVfQemmOPtzb0nT4SOgKCaPuboMIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717765; c=relaxed/simple;
	bh=hkxVUuXnd8F3MlVQifmDWw/gyIr3/PRj/HRU8DGvXjQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PBL46YGIEffJBLGgcSbRFg/lFnR1cfGLOE5YEBB2HVskHLkURIHIatkNnV+N4ND2KAmuAzyllXHD0MukVuSqLlqcipxF3fDKHMDg9Q9b8T9KzUwC6V8BMCCFFVX9D/itr2NDva+aVFS5GvxAsv5+XOQXxDVpAqObkW6ASvjdrjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ipFIAgR0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FvJ5Phop; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ipFIAgR0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FvJ5Phop"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6lD901397314;
	Mon, 29 Jun 2026 02:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cZy3MvmKfdCC1
	pNSwtsr4GhpDUZbWDyevQxZfe5fsv4=; b=ipFIAgR0B1zFpeWBeSS0ROlaxLeJ5
	HPE9pmcJNnA30FS4sMF3v+28ZQLwQIpGnPnEq7SQoJ1EgKNTzcp5U6i+2F80+swx
	OTKujnDbkkY5uz1O1aSpiI/QWHpeqprf4zS9cQELl7Ly/6wMAMqj7Ao6/9on4R2g
	GY+qRa/e6TGyoK0Z2XjjnyIjgZm0b3YCiIFhwmlQNxwmWp7eV3NLhj5VWN9lhvTP
	qRUEUZDZX4n6kPmb5fEGXMqMoBKKVigHWjnhcutbEi37WEPQzeGxrSUFuJkrbZ8Z
	KHlxHvkfnjc1kkWJifdVWXBYEqOGPuo9Ycx9WTmDFbwB4eDKhop2qK++w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpdwgk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 02:22:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9+TwaKtaw4NTIwvGEJkZZbS1TICs03JtotLM6njE+YMEEanNbX9aYgBM6yRgoE1w6vCLWJlvNz09SVkVdzeD1MNPi0ipg8BdZnWxX607ZExk8PaXv27zTiqqeLC2qFMBx8iWcAmUc1opubN87AJoivrLiTYaZ8d0S7Yhqok2vCM7/3OHRM+iwnQhDh+bCyCJzN5sOyKxR2s/BQ/7gNcVC6YBDD6eSAnl/WBgmhtd4xPBpjh7nML3FDaPXHGzXlPGv7Na7f4nYOWzbYu9I2VBO55mlKVsziOOk09p5S05k//xMq5U/ngOt0e/h9kgdVPZbpwRt090YtsvduPO5oPWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZy3MvmKfdCC1pNSwtsr4GhpDUZbWDyevQxZfe5fsv4=;
 b=mv+P6SsRZ0h5anVXyhdo3KKoAjQDHsFe/H8Wm4Ys95NqyQQMe/KNCkJEpwB8FonjzR1KqJYeFPOQ2nyffPQvxajihp6/9WZ45u4YPW6m7dxMXQ6RajFz9QqBzb7qmeVyFfmc1aTzpJRwTYaWoODMs4+H2XGTE9u3i092TXnahSCaP2aQuraBdy0kqWXE5Rn7BezSCelt/TgHxC3pTVhsfQNGFk/+wCA5QHkg33fTFR2mX0UFZBl4+Hw0moXFofASMO5AvcpxMCraOtqx6YuDWIzfdYwBoumgFQOQHj8I+UO8OZfG5dGYRFBLHJyS3ZThusPncMU5/bRluYNU0BmtPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZy3MvmKfdCC1pNSwtsr4GhpDUZbWDyevQxZfe5fsv4=;
 b=FvJ5Phop9TE11alKPwNL+4U/T0+5DRxP6W8iC1+AmVtg62lkRwtIZM6qIucqrJm8VhUbbdRS+DdHOKsCob/3vcwmMz8iyOVhFykaH/2UbsIHBnA8UhH859W7gpIaGf66iI5yDBBK/w7BjGcZZfnMMIpZpSTMQQ1/UN0TVW7eFfc=
Received: from SJ2P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::11)
 by DS7PR10MB5215.namprd10.prod.outlook.com (2603:10b6:5:3a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:22:21 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:5da:cafe::75) by SJ2P220CA0004.outlook.office365.com
 (2603:10b6:a03:5da::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:22:21 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:20 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 02:22:20 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T7MHWO3509277;
	Mon, 29 Jun 2026 02:22:18 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] Fix OSPI DMA corruption via FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:50:53 +0530
Message-ID: <20260629072055.896322-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|DS7PR10MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: 86885f30-c1f2-498d-d44d-08ded5af28dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sC/waRuuGfNVQ9hgQnBT+JWS029IAxManH7L9N5FtqGqXnDi41K6QXhZ2SJCk2FyHB3QsvM+754M5zBrzCLipJh6oPFRNrERrzLzC1y/ZbjKPfmGoKM8ZtIFT2CGEMwtmuw5czq1mfM+h2kYTIM2WpcgchuNgtinIjIvPDX3TSRXABlV2gfl6dTjLUf3VaRQZwnqwlCW2YeHhegTdrYmNCHm95CULethgl4FECOSur6L4fj2orpvkdeJRZ9tKUC10WvI5G18wWp+yLwlGebwM/sKkz8yNv9zVL2z//e7oLqVnnBurH+k6o1ltPImS7YygVJNBlb5/JFFSfzY+E26lT0t5n1XuioPKbTTX9t0jrLOnEEDzo9sSNtD6B/uluDl+4ltO93RTtSVSPDSJ7qqPz7LuKtWcpZcnjnZ+S/sFWA62AdvcbTnNiWWCQ39Zjwbtlr8pP0nyWiZaKPLX+OFipmWL1DM+TnEkIek2f5eRQYjwqDlN80CH3hWcoLa25CLVuVkd+0HxbyAkBvO6V1js4G/Oh13BUzCYiR+eaxDOOtrhjOWbiSGlTD23woNpw9K8rIVFkqanRqZp614X18Rg0GnJV1UamTKgMVGGpVlbmSquFY8Jd6tXI/YP51dYqYlV3mPLw9dwO0Ua0Wobd0aE5//lqxqkTlh8HTnHI5dhFdly9SCWgfOOaLNgoTaNizLxtXJm7MG7d6kL8wmfX+5Cg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Se1YwA5ltVtYg5n1e4IEkT/kPzpQ5p/QhThV6HnNi6Vz6RmtV9Y67cnF8ADb91pEkx6HCpXUE9qKEgSxn1uWxUPqEIyUSjzi8H7C/LGWVuJ6BuROOfcxIjNuedRr+RVoq4pmmHue1OE3YZ5n3/CEIw0jxOBhZJlpYgA84W7xg8OK3VNLrQqkUTrYhj6jchlaqajvTC6LBjcQpMpjREbm0CVuz/i0SjdwSIuUNP67VcCV/cWULAU1GCnucR+Uq5IJXdmH0PFWl8D/b7X+PM+EXqC85BVJKCdx/9Y0aT3q9bvaeqswIrHgcbjTS0QpZwb+UoTCPBnZ5f+ki8HctpWRBRfUrv4pK/eniHOPh9k33ifMDpmsR0p5ab9dgscs+oxFZIroLnzl1dBk5k8iGwfaSeyZ0XCIMA6DeNNojm32IiZ1KMmciwG2Ami+pYCrFwfV
X-Exchange-RoutingPolicyChecked:
	DVJTG3JrdI5E3eJt+xDYiIfAqtiR1XKWWxJOvzMBXybGiOvlD7otQkAG6DHoNCFh4N0AUHQnZcbd6g3bAQq75pmDRCDEytaxnoJPQIuSrcitZVxfnzQ0xzTPr/Y+vbY7YGX8eBIZHK3u8qAsUxMYi+P2HYWiy+oD0IyR5KyRi+9relmUhrFSR9jziMATkVMsWb+Z5tIM1ofCf35nwRYGCsWiH9V6xVXi7qSI/S+smNXZRpW572SufaIoCF1fZLTCCOsfrUkBsAc4O/MtefRdzzJmD0P38F0USCXFp0X9JNItp1aaiHaG1VgrkvOHi2gc/WsXEBPcLebxjNzuEFgpdQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:22:21.3681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86885f30-c1f2-498d-d44d-08ded5af28dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5215
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a421d31 cx=c_pps
 a=f5Tl6ILaYY6UHEJdjUIuFA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=TiSfEeLu68DA89B8gvwA:9
X-Proofpoint-ORIG-GUID: I7Is1K6xmapstMELvmbKNB1ikYmeUjrA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX74kOB7QsKH94
 pa+0Hxf2FpdR1s+1R2b2RxqCJykeDqq60IsLjg3mQ44VMuRq94DvAsdUP9xxAFFbRw/cZPQgLf/
 9GRrQUPx3MLQ0sHlD7guWFgcUZTnuD8mX3HEGaBL7X7hrZ9Y6b8ToUOOCV/lMAM6iQGZwkuQO7S
 Qxk5UW3ltNgEXH0e5vN3041K412QOUH3FbNUgm3P+dv2nMiwsS6y+6u+1x3m3SoCVniN6I2wskh
 sRlDj1NcV4N4y5RPYKmnvknnsz/IUctDaeUFB0OgG7UaqZv9/RDC0i6PlaSTe9KNb9FwM+nMTMV
 /+P4ypbzGErM7pto/r5ZDivFy0WAPSvN0Z1bIS2IrRA1jGuqmwTbOUH6RYtYYaNdIJoZQwGSz5b
 ysR4o3Zxf9rTwKeIpsLJFikDWFNQzJEwLey9JSiCy0KOgEFFdILMU4ZaW6de2ODXh4mp5g7YuVf
 9e+KClE4p4iK9Popw1w==
X-Proofpoint-GUID: I7Is1K6xmapstMELvmbKNB1ikYmeUjrA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfXyyHoD0PuXov6
 vCvTjhFW/MO+9nt3149I4CwxVdtS0ScOBteTkSJ4YWWk/5oym/KFfL1x+3et9E00nM0i5Kv4tIn
 Ga0s5vyyO1JUUmJObttjsGCWUZ73vdk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290060

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

Changes in v2:
 - Fix $id in dt-binding
 - Use pm_ptr() instead of pm_sleep_ptr()
 - Link to v1: https://lore.kernel.org/linux-devicetree/20260629065517.868418-1-s-k6@ti.com/

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

