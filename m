Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2B3CD8C9;
	Mon, 29 Jun 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717775; cv=fail; b=ZzS922NphUOtS6kAJDG7BPxs36yUKY2CYIS1tSXreH9KQ/nnso8cD+k5HXPH3YkavdiJE1TCquNmEEmOl4lSkzpEMySTZxEPuZ7sR2xTd9CTU4rKNW+9CkbjkY0CEWzEQ6xZIGW9HMhBWEk80SPj5qTGYKcj26BB7pNKN/K86PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717775; c=relaxed/simple;
	bh=78CoGtNbxLvUkABp4iv/oX/DkFXN6NR63+3eB28+iMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ybceuu1Opc6RBEjOI2YnNib+rWprS55qV73Tf3ZiwyOjSEhtlg9UAu/JJLr3HnCO2n6hZ97i3rbO/WEvE9//tPmy9sR1MnusjtbQhCjeEBRrqvyIK7b7Y8KivsdfP7gzx4fgKDWF4uapCNdjnBpnArlvgCJNjDVmvZi5RUXDE7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Kg7K1cTM; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xNIBlU6l; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Kg7K1cTM";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xNIBlU6l"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6lFDo1397375;
	Mon, 29 Jun 2026 02:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=P9ANWOej4Sb72anUNW/mLGZnre7Kv9/fXBtoxaKzT
	UQ=; b=Kg7K1cTMp6kdY/gM4ZYIYDedgDfuQl/RMxzJ+DMtinCa820p4iIjMWdUa
	QqtJ7K58wo7Nik98OFn6iAwxL1SgXfPCAKFfL/ImbjNODC24pCc0em54fnncs360
	cYCzhqBgtxWJjYgY51NjsrXSdK4WNGbCEjyTuYNFuSOOzFGDS6SS5MQnY2wOXx0b
	H7m+ZPsSFpl+N9KIOPyVoB+I8+UzL/Hn0bEg+ML4X53QkWf28a+iBw5MxyCK5Up8
	YysaMFy4zC/R8OXfSclr73Avrd5J9RawBQtlIMBoznPrPX0Qx3rTIuS3sFOInHJ2
	8xl7cnsJuxxnf/HCGaa4prPVKEAFQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f2wnpdwhg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 02:22:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0Y7aNYvdmA7Po8HIKJRpsPswPvkA/rdSXCWglW/9FHnwv1yM8d9QahU6rwjv7yiiNJBUBmiXPCGFxlUELp9fDgj3oCmw64kswiwr4PeagWCsM9nk/Es/3rhcyKneRHICbhFIfPHInnw/udtK9H1fiJ9sfC9+96xgoUInEBgIsP/AdPBulW+nA1VFhxfO4tMgkjNxQPYKrDNaiaBO0LRKaKAI1uaG/ILH6TPoCVRFkvYoIK4f9DVJVBsns1PzWsGm6ud3mGYmBmi/eSWtnjz3wGHB4M0IjzpkeFk7H9Hptt082fjQTBM1zOfpBbH37A+N5AqTZpg5p5bd1h9+pMmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9ANWOej4Sb72anUNW/mLGZnre7Kv9/fXBtoxaKzTUQ=;
 b=QAzxcY8Bp+qLPJjPXJ2bssFrg5RZRsmRwTzw2aNUhfw8T/xjbciC3nvUzVo52lJylmPBGIq4iOGx6i6Aonqq9+TPIFuQe07L0RGjK+mVMilD5QUlR+JeS4G+eMty9uL7pHO62keNBQlJcCUAflaBS576No7A5yWtlsgulP8XFKOGzO3J0Y9Kl/vc/D8TsbTUE5ozu9UU/TQJLbE2WQ9WcaaK7SqtmJNixV7CtQ6OLGwVOdw1xudbQSMwlW8uF6XYYeh/vQ2KQhb0lnt31SW3VvQAflaeZNVODrOUuAPYutgQ2Naj2GB64F106Jd9RACEP7hhj7OmWor0yCOI7az8FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9ANWOej4Sb72anUNW/mLGZnre7Kv9/fXBtoxaKzTUQ=;
 b=xNIBlU6lezRK9+VMLoiUkT0Yj9C2AmnlE/tT6GodRi+RXD8VMffc/Srmo8vBIsNHDNkL07Gv2ud6tiHMTW6KfgWw/ainAh76zrhVDJ8n3knnESadTW3hpm8ohhl3VBKT3IE7XEZ+JfQl+VVgwBWh81RlB1Fap4NabCJZjfnlPwI=
Received: from CYXPR02CA0042.namprd02.prod.outlook.com (2603:10b6:930:cc::21)
 by CH3PR10MB7959.namprd10.prod.outlook.com (2603:10b6:610:1c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:22:25 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:930:cc:cafe::82) by CYXPR02CA0042.outlook.office365.com
 (2603:10b6:930:cc::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:22:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:22:25 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:25 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 02:22:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 02:22:24 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65T7MHWQ3509277;
	Mon, 29 Jun 2026 02:22:23 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>, <s-k6@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/2] memory: ti-k3-fsas: Add TI FSS_FSAS driver
Date: Mon, 29 Jun 2026 12:50:55 +0530
Message-ID: <20260629072055.896322-3-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629072055.896322-1-s-k6@ti.com>
References: <20260629072055.896322-1-s-k6@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH3PR10MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4c31e4-a05f-4360-a5bd-08ded5af2b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|30052699003|82310400026|1800799024|13003099007|6133799003|3023799007|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	33JKZOJjSkJBMJdL6BA02hqjVEAZGeA5B6hVpKFw8Z/3W1K+hcrtaDp6DlRxZDFIColjioEpDDDofnaY8Hq8FkV3uCw0BXYwBZHTQAM7c1uop1yDZ3xM8MRyO3ho6DW/tnXqsHFhtNgex5VUaLcbesldxNycgFg3gYZFUP8xMt3/4LBAa9LJonK321RB41n4W4K9Uz/dttCQmv1FTL/JWqXQPwC2rwxzQgz89bybwZRyXZZCaxp9Bws0jKj8Lne0rSl93e9h7iek8OYbHAcWSZgJQHm2qKZTx/lfdd6AEzHILndKUKG1TxX7aBVaPs/kjfwCg0QFKgwRZD+G7d/cI/hQ7kcQJOcNrTMFsTgZopan6itcc8chvJNGyt05xyaWrmqzUPWXPofJexlooXRr/GfgJ2kH45yvB/lS0GI4WmEB/wazIMqaL4oA7rsiFWKr59yFsElOemPkM1BylV/MPMOiMsPnmGOxAxZkFID7MovIoxTVClt96GGhPrbzxT+Y1/6uleh7XnrAfvP/saf+R/9swyhR/s9AmeDU1bJEhOKQGXSWMFsu11XeoPeSYUoKqbdnvBve+8fB7wyALCKAgdGU22RR3qeb/dlSIGIdF4LDcLGJZ7OjM9Rcd+PV9QknTQj1Tcg88QCn7J+lAo95wQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(30052699003)(82310400026)(1800799024)(13003099007)(6133799003)(3023799007)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d52oI11YTB/1YFOvt47/Nuc11vxhDaAiwHSkfXnzC03d/sNcgsn7WC5s70u4obfQ8VtySrABg9PTwSrF3TcsvGMWN3WZcd9wESRehBg67riSXhRDmTyqfmNbxAwFO0k29q5nDj+j42PyLTrDRXGCxPGE5CFkj4hICAm9KuQoQNHZZiiME+nF1Ci7XrW3HjTRDQyUG9rWsH2+LF3MgKctV3qYDIycBOwn8jZ04V/UpieY8UBmP7kiObEceP1C7LsVGVtsoc1AoJTz058T+qK54Z95PgC1fl3lCNhCPZQi+TS+NF0kgE2kU+/u+1gM0YaIypBQiIog8Dfr8CEeHncQIzp4S2vSJpto0HHLaLQulCfD2BnpyPPSS1K2I5K1cF0sQfG+bLKbzCPL3q8B7bEvU03HFzC2qH4tooQuMyHlZU+fXC3Ow5nMFvQ+mxt1SBHJ
X-Exchange-RoutingPolicyChecked:
	jFP2i7m68dRH01d2Vk/+JtZ0nDGtExF0hu8j3SE27ir/fhomyvk/tO94MECJLr7V2wGpvybPHSFDZz+a+xgkHlfF9tPpifvj3HijOW+SKVm5bC+p8FufbTW9UA+DRjAGIfR80gPV4dx8m2TqpjCdDLE2rnu4gab5LNHcgl5dBWbYO6GyCAePrrgChjul8iOP590Jq+psu/S8K0Ln32t16nEGcAtpmk6/tcjiOrWw3KU2XArDL/N6Ym6ZFmEo5FHogU+uhzmndCReX8KHAJr954EK3vzEeH6AAP2fZVjtAzjVpQUkQHg/pBaSLzr/kwYFWCsDdK0B5K5WX0oZuUwH1A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:22:25.5228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4c31e4-a05f-4360-a5bd-08ded5af2b56
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7959
X-Authority-Analysis: v=2.4 cv=QdxWeMbv c=1 sm=1 tr=0 ts=6a421d37 cx=c_pps
 a=e6472ZuTPXVkOcUbIheXHA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=-BatZKWJN6v7v1n9xRYA:9
X-Proofpoint-ORIG-GUID: DUoqn1yAWandgBXGgRhy_tmkZjXNM-zW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfX61eDlvptGa2g
 M9NfThJ0au7/wH7TMz8jRKhU+ry8ZKy2iv+3N+4i87EyLK/qmT7haSWlmWCR3BvV1/oUEC1Zti/
 Bg1INrkFR7hmm9lZnAGL0KmUgXAyrStcxMVRTOrer9FgfG+AGR7tNJHYnmSAqoskurQ/JuIiklh
 UBMAOao5+y74XSzp5j2dt4v1boXnzqC4CnbJSGSfEilN6bTO2S2+9oa5VWnzKAP3lILAhsH59BI
 RWPyrMxJDJUM0lmlQmiaa+IJ2E0aEZvJdcO3gOlzDaQgX7EsdRY2X07D1LcJEXEmOP4wacVaUUD
 S/jNwnoQYoAv4bkpEPBnHChaymZhoq1Rtm9mIh03Gj5OzZIEOs6ru/PfGjpFhRrYy0mXHRAr2+W
 vhGh7aKoDuVwlzk83pIuRz2P4HfNQ/7AB3/hDvgnAzkvsMGABpej4ZHW97dwZyHCME7VKVJSNkO
 MfygLpJotC9azj7W34w==
X-Proofpoint-GUID: DUoqn1yAWandgBXGgRhy_tmkZjXNM-zW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MCBTYWx0ZWRfXx93x4zzYK26J
 XiBCXNGBk+kviYRl2iJIZOTRTjnCD+xiImEbGOWWLURCWxX6ARXpgJrJNH1aEU0nMVGgH5z9OyC
 ab0Hwt3mvwoIY9I7ur8Uf00TKcFGh9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290060

Add a platform driver for the TI Flash SubSystem Application Subsystem
(FSS_FSAS_GENREGS) in K3 SoCs. This driver takes care of disabling the
OSPI XIP prefetch which causes DMA transfer data corruption.

Set SYSCONFIG.DISXIP to disable XIP read prefetch, preventing DMA data
corruption when the OSPI DMA source address is not 4K-aligned.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/memory/Kconfig      | 10 +++++
 drivers/memory/Makefile     |  1 +
 drivers/memory/ti-k3-fsas.c | 74 +++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 drivers/memory/ti-k3-fsas.c

diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
index e5527020ff33..954e47810e8d 100644
--- a/drivers/memory/Kconfig
+++ b/drivers/memory/Kconfig
@@ -125,6 +125,16 @@ config TI_EMIF_SRAM
 	  sequence so this driver provides several relocatable PM functions
 	  for the SoC PM code to use.
 
+config TI_K3_FSS_FSAS
+	tristate "TI K3 Flash Subsystem Application Subsystem (FSAS) support"
+	depends on ARCH_K3 || COMPILE_TEST
+	help
+	  Driver for the TI K3 Flash Subsystem Application Subsystem
+	  (FSS_FSAS_GENREGS) wrapper found on K3 related SoCs.
+
+	  This driver takes care of disabling the OSPI XIP prefetch which
+	  causes DMA transfer data corruption.
+
 config FPGA_DFL_EMIF
 	tristate "FPGA DFL EMIF Driver"
 	depends on FPGA_DFL && HAS_IOMEM
diff --git a/drivers/memory/Makefile b/drivers/memory/Makefile
index 3ee883c8759a..8dc4860f615d 100644
--- a/drivers/memory/Makefile
+++ b/drivers/memory/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_STM32_OMM)		+= stm32_omm.o
 obj-$(CONFIG_SAMSUNG_MC)	+= samsung/
 obj-$(CONFIG_TEGRA_MC)		+= tegra/
 obj-$(CONFIG_TI_EMIF_SRAM)	+= ti-emif-sram.o
+obj-$(CONFIG_TI_K3_FSS_FSAS)	+= ti-k3-fsas.o
 obj-$(CONFIG_FPGA_DFL_EMIF)	+= dfl-emif.o
 
 ti-emif-sram-objs		:= ti-emif-pm.o ti-emif-sram-pm.o
diff --git a/drivers/memory/ti-k3-fsas.c b/drivers/memory/ti-k3-fsas.c
new file mode 100644
index 000000000000..a5f42afc694c
--- /dev/null
+++ b/drivers/memory/ti-k3-fsas.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI K3 Flash Subsystem Application Subsystem (FSS_FSAS) driver
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+
+#define FSAS_GENREGS_SYSCONFIG 0x04
+#define FSAS_SYSCONFIG_DISXIP BIT(7)
+
+struct k3_fsas {
+	void __iomem *base;
+};
+
+static void k3_fsas_disable_xip_prefetch(struct k3_fsas *fsas)
+{
+	u32 val;
+
+	val = readl(fsas->base + FSAS_GENREGS_SYSCONFIG);
+	val |= FSAS_SYSCONFIG_DISXIP;
+	writel(val, fsas->base + FSAS_GENREGS_SYSCONFIG);
+}
+
+static int k3_fsas_probe(struct platform_device *pdev)
+{
+	struct k3_fsas *fsas;
+
+	fsas = devm_kzalloc(&pdev->dev, sizeof(*fsas), GFP_KERNEL);
+	if (!fsas)
+		return -ENOMEM;
+
+	fsas->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(fsas->base))
+		return PTR_ERR(fsas->base);
+
+	platform_set_drvdata(pdev, fsas);
+
+	k3_fsas_disable_xip_prefetch(fsas);
+
+	return 0;
+}
+
+static int k3_fsas_resume(struct device *dev)
+{
+	k3_fsas_disable_xip_prefetch(dev_get_drvdata(dev));
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(k3_fsas_pm_ops, NULL, k3_fsas_resume);
+
+static const struct of_device_id k3_fsas_of_match[] = {
+	{ .compatible = "ti,am62a-fsas" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, k3_fsas_of_match);
+
+static struct platform_driver k3_fsas_driver = {
+	.probe = k3_fsas_probe,
+	.driver = {
+		.name		= "k3-fsas",
+		.of_match_table	= k3_fsas_of_match,
+		.pm		= pm_ptr(&k3_fsas_pm_ops),
+	},
+};
+module_platform_driver(k3_fsas_driver);
+
+MODULE_DESCRIPTION("TI K3 Flash SubSystem Application Subsystem driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

