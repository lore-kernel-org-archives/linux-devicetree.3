Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8D442134;
	Mon,  6 Jul 2026 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783332970; cv=fail; b=mQISDieE27whFaYs3W4Li6gHo0EFED8a8rG0ZeNbwc85egV/fQX7Pz4ve9NsM99gW/92qBhYXRpQw043A6AstD+I1WtoITqGPD6fZgl/nqd4aljSc7hIYY8ShEDl1xoH9UsEhVA3E+A62gKQklV4iGRG63t8rT3mwUw9wkj9HhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783332970; c=relaxed/simple;
	bh=ND8Dw4TqOaQV6kqmTmw1Av6smSYsoOPkKay5mLm2Vr4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aGvFRG/2mRE7dBwPTVZTwe2gNc4IQmh5/F4lecL9u9Gyqdm9PMuMiSCX1yeeKh7YDNQe02q0Lx4cyq/0Lmc5R1vZbmOSmtCTAg0O0F1F8FWM0yXnOpzP0wtgTyGJWLXmEADkRPHtwJRXdozyIV1EfrVLWCRUkfGfz7Kiuo8SEtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sd/U57b2; arc=fail smtp.client-ip=40.93.196.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sd/U57b2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7jKFIG7MY+kkbnHXrwsCpNQ1SjhsnqRi7VihdO1quC/I+DCVNdudHc3b5QPzdFzrrkLneqV/X199knmHaXHT1HJJd8AuiEuTUpissF8aeGYee7LeBdjpvfnv45aJ1Qx67Z5BCbTrzmFRIjqjwuzCz1nk/s5N//IKVJIYTXXgFwDRnElXM7ivxUT9O0AXm/S7z1i/V8mEWBXmcGTvdMzXwFb4CcBrr2FpmWdmZ+uWfz0M06nTK4aWSUjUJKVvs2oFRX//lB/QzhrTIHdJjpjFavMPUNSW+G4VipB4rDiUCY4r/Xk6gv03xGWUOZqOrsRGbjWZW4p7ZF5fQAw4oBmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9dShIDrXz9ZEgKE4IWIb9zNx/vklBUxBTh3qSFCQdI=;
 b=ALYUxAjvMW5cfblKlYrKSV8jkrg6F35UgoljqaqMA8sJswBuxQTIvvEhZY+ktTmoLaeYd62O2Ix6uend47Xn6iUVQIiHlWt2NToIeWkupYlMRTsXTmxOj1dCCHh7rxxUIbdFhSR6pcb0Llh1dkw1c7FabdHaN8vEOYpUPrmsiyYWvzEH2OLzoPIfxvxSSBt0gpkQ1CqEJunE2NpVqBmeLgwjoJLcoPTXVo+jnmpONcoUn8qpjK36y9yNf/6l9LeSr15HzamEx7utpwngCYW3WQroIpxwpgOg//GPF9uN15V0pqj/WsZbRTuUjwKKs9/QCn9qa02enjQWcN+3fLD+ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9dShIDrXz9ZEgKE4IWIb9zNx/vklBUxBTh3qSFCQdI=;
 b=sd/U57b2ZTXvlLIOm8KCLhySvF1RdT6UT14x1pRolFDjyD4sSxQgB5GAjAPrkMvYwcxKAuoQcrgHd8qPZ6yJPixPUlhVKrb5QP+rBfpfbHdYLlilEWckQVQyVK3SIFyhTY5ltNcxkSCb9JYp04vmMnWGzOzuuGwzq/j35+4efjowt7XfYlNT0yXja9KVb2X/YRUQuyQTBSRB58DsfWHOvso42Zl4A0GgFzGi983Uk61RtX5UZOibHu80LBvZ58nbVFq6kHkZmdT6pL6jvTZ1W6REeI2MXzF+Rklg3HQzsHqB1GBkYG8hzScUQn8nCbZzkm+jzyhinTdFMiR63Lz7pw==
Received: from BN9PR03CA0168.namprd03.prod.outlook.com (2603:10b6:408:f4::23)
 by DS0PR12MB8272.namprd12.prod.outlook.com (2603:10b6:8:fc::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Mon, 6 Jul 2026 10:15:58 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::1f) by BN9PR03CA0168.outlook.office365.com
 (2603:10b6:408:f4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon, 6
 Jul 2026 10:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 10:15:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 03:15:45 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 03:15:41 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>, <joel@jms.id.au>, <robh@kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>, <conor+dt@kernel.org>,
	<andrew@lunn.ch>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 0/2] Add device tree for NVIDIA VR-NVL BMC
Date: Mon, 6 Jul 2026 19:14:03 +0900
Message-ID: <20260706101526.2556226-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|DS0PR12MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 848875bc-ca22-47fc-6aa2-08dedb479256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|7416014|376014|13003099007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	E6F7CKJ9cBKwymqcvFVnjs5NqdGccSHdynwyX+eRDuBGfnzUzM8WQwMyvMk6uxaw+hHLbw8wVEmmLjCsfwgbzFiF4HHBouppfOdqNV42co9lKkiUarX0lYtdlJiBADZhjB6o8YTRDq5BIR64RoPT49QrJQW5urmLT6jDHDcA0XKOK4odgQLKS7XdRjRcgxuVpxKA36W7lh/Z6Fb6dRcDO+Rjm4LPoVbYGCdFhQ5G6gU6cVBKO0748lwL9I/qj18bIqZ98OGJK6AnHXnun5nXmUExm93GWZx8nkiHh/wMI8uurLd/j6w7Z85FYzHTLL4lF2cI5ikb2ZnloV8CyrtXPy/jEyMHfhcy8HiFIdY63ie+rDSj/ubWyltwXdxJ1DLnA2t1dOyqv84QcDcZpPOZ+UvkKFJtx66B+JwU6zrY01qdzlLMutrxYNMYKQ4xeBOowlnnbPmXFTJcgf5Zh2qj2dPhlJPaWyZc/RW2nxeIuQUgbjYTfcgMj/YyYhTjIX6DbuXfdOl93MFr/vsJbpckrlDWeJ0wZipM8/99yXL0nv3k3Ht13Ta6KPVgT1IsHPjiDP1lH1IvULq6HwBzvqhx5rgPKzmiu3CLcfd86WZN0jKwioLim0BVGwfv7b6paU173LEfcEbjmA6HRIGdOHMhpGRom0wE3yUg8CFeg03NOmGJKRBGaQsnP3UjZ/ha3u5t9O7UZUMp1nMmdM6RPiuYdw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(7416014)(376014)(13003099007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tc/O1yH35cHZpbJRx+obPpnUTsewcbe6LbGho55dPXsK6QyDnf3rpN7Bo354ssn49gR2cStObX0lYvNVvJI2S//Dg/pWTwWg5eGuXUoazsrq/i6OZYINwMG3HE2mxdnf9iMKMjDEM5JBaEamd+hlW/hQ3BTwxGyCSHBQqcUwY7bl+xAMktWPsmz/MMNzXmR3vh0wS77nDVA2k/3EKewwzeOXSyQ64tmHH1EhN/cYbp8QyHI/uC2RFPhqXpgHtTGqRwZV9iD6m+IHyJYxK0Y715djC/7TG4Y2y6B2AGI0IK8FxIVyR6Oage+9+tz4ND26+UnJGeqtbIjUzlTPCyOCgPiHci/ze1NQijpq5jasrsM9VS19B07KgCB+juskzanHU+wuQ6Xpssz9XDAjf8unDouGF0QcBZBvmlCAc9xLEAFzFnsGYDFhyGv2bgc+VqpM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 10:15:57.5720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848875bc-ca22-47fc-6aa2-08dedb479256
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8272

This series adds the DT binding compatible and the device tree for
the NVIDIA VR-NVL BMC, an Aspeed AST2600-based BMC for the Vera
Rubin NVL compute platform.

Changes in v2:
- dts: correct the compatible of the PDB I/O expander at 0x75 from
  nxp,pca9555 to nxp,pca9539 to match the actual part.
- Pick up Acked-by from Krzysztof Kozlowski on the binding.
- Pick up Reviewed-by from Andrew Lunn on the &mac0 and &mdio0 nodes.

v1: https://lore.kernel.org/all/20260702165524.2168091-1-jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
  ARM: dts: aspeed: Add NVIDIA VR-NVL BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 901 ++++++++++++++++++
 3 files changed, 903 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts

-- 
2.43.0

