Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6F12FFF9D;
	Thu,  2 Jul 2026 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783011388; cv=fail; b=EQKKIr5LKxaYnrHgytDQwKC+1A3/Uodg1e+iwc7PxRKlsDW/H4Ox/FVs97qYGG/aCI5Ms69PW/loLr05tlF78PhPmfO03+lNhF/zaaHeBmPbQnMcTowS0vDXenlUsHr9dqzXxAesf9A4r80Vg2xk6yRbGeAA7s615zSGJ93yWrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783011388; c=relaxed/simple;
	bh=hW1zSmGowZ16l44wirbMNFjMq5QnRM0gYoaQpLlygho=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RTtxBCfgNq3ZT2sbS5gKspFKxA7WMjxkEUobRl5gd/f0tGZDM0iw4JARcjX9MNi1IyYdkBcREnuR+JC2+j4T4pvm6lXOufxniAsj18SdhWrhUE2NQjygpKRScKMJSF7gMs9EcrHxlOCnsXZLEv+jGQtqsNUpYjBXzc0fE/JcPpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rUytVQ2w; arc=fail smtp.client-ip=52.101.48.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUytVQ2w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCo1+ByiE4+SfH+E709uR6u3A+DPCkDTqNNQEhH+WBN8FYhM39vMK2vr926ndrP9QGvh7X91IR8ZgSyi20jNKDVuLJEvgOU+ZS2AIDsxNpLL79OFgcpkYVIxeii/dkbVlA41IeeuQs4uoaqJHGUjnnJVLIXQipQASMMBKhdPVIvL0BtR6iwz6mniLeHr9MC01rmNe9dpvmPNzOMQ3bDWE8cUG1/vgUdJbDuswpV6iJCVRuGNTtSXOfvrwXl0ZgQxEapyHBUz6fAx3BPtbeK/iSLdM0N8cDNQb8+vX9TaNITrvST25vSqmUnDnNbZQdomSZVpEQLBmOM0CisL8fLXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moeswr1uLUprQD/Ko7eiYcwpJy8/RSTh1wI38gpHwpY=;
 b=NHZ3FnHY7ZyiVZhbE7yugV2zqIijt3JLsK52xsmT42AVMgbF3h17HqESvfBBlxL+n0WLyuxRvnHySJaV1zMbirq4T0K0f96weBqqY8CP5tkEDulKbOTdrz11n8h91V0qjWEv99NdTry2yQTsZgFHiC4sM5j81K2uxF/wBB7JLI3/Zd3XO8kL1bSX9Uft/A97qSw+uewm+1awlZgjE7cT11ri8nSpNS+7p2dKj1ZBJmoopOI10R9HMB+PqQluO2UtiNqifr61idED2q042wvNi74NDrIgRcJRkhjpCwKfweXoWJ0SMi65U/2eF442AMeh4hyF808FuLRAj3/fYUXVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moeswr1uLUprQD/Ko7eiYcwpJy8/RSTh1wI38gpHwpY=;
 b=rUytVQ2wnmKutjFmuq4DG6W3Xq4S4SKhLV3kaS5jddiAUiPppkO5C+U56m/VO3kY2MSKjYus9VQZE7Cw0kXK+TU0nYAPUdyJTIkepWuOJXrhJ4MAyzqLT1pBLhw8Ba4G8OjoHvm55pT8MMPniBh6xtep9woRv1/jlSO+GDGZDb/F8I7gFiVgwZ+yry2U/DQ16inelVTU8oejV/Wqf9ixlchm/qN6RDaXYSn8iz3wqb6dZnd/YR60D0xryILlCyvtXtdoCgm9nuPyVl4NYBDwiIVH6l9nU2tFc+QewCqSotUDa5ZuJ0ns/kkBHdoRhA1M1y3sP5FxsEQWSbXf29dONw==
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:56:20 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::61) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Thu, 2
 Jul 2026 16:56:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 16:56:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:59 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:57 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jacky Huang" <jackyhuang@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Date: Fri, 3 Jul 2026 01:55:23 +0900
Message-ID: <20260702165524.2168091-2-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702165524.2168091-1-jackyhuang@nvidia.com>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: f0db5b28-f64c-4ba1-a9c7-08ded85ad706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	r7srR4l/uF+yualu9QtAI1y1EdPJwVxqO1nMn0pLKAjle8jOxkmjLC9bdV83Z+j2vmyZoUhtYz8Nk8GRQsrXwt+Ji1cdcGxqcat2Ko+crRXYVDo6bN/RIv1q1MT4PptixOol+BGI1NaEfgZeBLbAAbtvElTh3wYoNfMhhNy3zfyfjyY1GaVaAHxgq/zRYHWjHRYkZjwwlthf6lkUqQt1s9faPlpuBx2PzCxW8gmCGgOJ4IKLyLs4oG20j9W9SGS78/KDHWMpzkzaKtg8MbzZ+GKsW8MdWFMuNFDA+8ySYnJlr1oTtuowYlrv00oY+XU152phHR7nMKri93/jSWTZgPb1Qf8CoWOIfxFlbx1XNyhkRFvEw+ja90n4Dj1UXBBbJoO8oXEtXFYwkRrwTgL9v0JP66nS1p5uAEF/cN//KVAjElUGa7AMUR6zLggZq29n9cEgwwueSyQbneVDObIM3670tMw6WdMNApZBbXsHzHhrfaUmvUt/N1O5lMLLEecVm7JWW076Qr7dhgFddLvKVUfryJ70FZfA3RvHkUbuNvhKehXSR04EzJv+/io0L6NMp/7z4TQMv5VVJpA5v3n8ORn6s+67MbfOOfQhQCN3DNbLRC1I+0iXhvRYYcD/KbCoPPul1Zfy5NpKIbvfMifrFRCGtQHMrtvaAV98wBW872yxmlnNEmApu63RsaX6c5BLhFy+luvQJM4AnABBfXNfxw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	805G6GAIlQw6KA7vhAx0I2P0iECa7k8T1cFjMp+ZCmM/pNMn4fp6lCC0JYO81PM+OelFmlD/Gg9noRHn3r1UBqeXwzDLfAXoETwxebYqQa21R5JN4awNjC8/L6hJusPLShbUhlAnWW1sBpJyUtfA1dM1zFnvqD8BDAtLmfT+ghjmmPavsnnhr4dsS9iWz2XfNGHMj6J9LZ6qk41009rA9bj1HAFz7MbaaHpVRX2CIU43o7YzVxmTcXLZ714uS0yGezFOKMnn8yf8zMehrhTxdLKN6bJj7+QawdYcYdyD4OXGVbdE87HEMnU9mstIvstK8LAvlWtf/hQMuEP9sHsbvrUhlZ7F312dO9fij3tMnCn8oD82rtALUgATUJmhy+50JyIDjt+uvnxLopViRc5Mf146TC0b7zfc2bmrtf8mHdzhw94hKNa1PrW2eFowBlXf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:56:19.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0db5b28-f64c-4ba1-a9c7-08ded85ad706
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374

Add NVIDIA's VR-NVL BMC board compatible.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..ce893553cfc3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -114,6 +114,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0

