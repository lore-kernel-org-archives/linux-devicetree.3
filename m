Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083510;
	b=I00khhP0XvqpB+z/1dicHQvW5EsxHLzo3dI7dGBVS09dh9LI8tg1qii9CVung/KvFe1y
	 DtcxoZokblo4Wb7bJ+pBEVVQbGznpvI1bdGCAeB1VhmUcStOLQ3Jcr//QLAtvl8O7FTVR
	 A32o6QHWTk0ITZV1ZMr4O9YJOqbHMEZpbdTRTtXEMf5eoA9894fL3f03UO893QBJqMiRH
	 IS+Dk9mjS1X3tSJQBHHPU6tK6yusePmhGdKygAptoxo3H192zr/ZYwPs2iSbnfrH/xlFe
	 tJ9HfUn6+yUZHCHpvetIIcczIYT+TbF3GpeE6JYrfl4cPz+ZqOC2iKT7LG8SAjUzGKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083510;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=KteObu6WtQ22B4B3okN0YwPb92tlQcDJY6ve1F68Ygs=;
	b=EVPZ9Hks+60MhlD3ORc3DG6IWD9r1aj2AuKZBH9cr4vUSbPVIDpic812bfBTpNSUDarL
	 o+Op560cpNUYku3PGkMWMLD5RyBVXDU1xMDBZ6P4/CklwGvlW0ROYCrr7SH8PWKdB4HXO
	 JvNSewRTKPvSG5SXwVxoKpyYUsynLDIhV+3hudnSZfBfgfO220wgzaTmcL5F497But8QH
	 gxnAuW2SoNKwNOxvlg9M4VSLIyIoAMSGVaXODaVGBPGWZxGWAA9ZNjxF2ZA8B2nROXFpO
	 XS+W0S8Xr1wI6JK3LNvzDcqlMnmFfVOooXJQtZqGIxQPfHDDa99cZmOwMIEqDBTcOGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jwuhS8Ls;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.64
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B708606A320;
	Thu, 19 Nov 2026 10:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B708606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jwuhS8Ls
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfP620svVzObWPLZuLwCrIleR1sP1vhn//KFw9hKF+VQ63Htw7N7nmXv1llx8xZHeVrOa2Q/QG8JOND3gu9Seqp1WcabJOl+TcWVvT7Rx9R1rXjnN/0+Vd+wHN05wcKO2JvgPOpDXeD+AwCF/yW5cuZSoqVIpY1Z8FPHPCBa6bOE91SQjkNBZHOM6iey3yxFt+sSt6V/qGa9f+HyaLabMdeinOHX5MrPLfJQitb7/cpwkMu6izEZOlYcx0dAFzEunlV9JyNAoTP7MDMcObqQ6PuSpo1TsyMk2TzEz8jCRPMNyWhJShLiemzBCL14yRDM/d4/HX0u6eV9IwrOF4Vj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KteObu6WtQ22B4B3okN0YwPb92tlQcDJY6ve1F68Ygs=;
 b=BGSxhUAJVMQSbCMnPpAujSEz3xjuYZfQHem0vbM7r+xV0ggAcEN4B4ZnQkhnfD0SJ4Djprik+9f9gOMZT5TL3im39Sv+1WeXXAiO6wEG8agxkJDg+G/hmFqQYKj0seCmBW6d2RSY3QCWUIlkiYgGdZN/09/8733X5bEO9BTfNVGIxKsFABwMT+8MIJb9hAWzI3r2jMycrMFXru2mRhIe+QyA9HoA3bjZMXAW5vVIeegd/ogbn9lGpP0Cv6FEwB5k9sAtbrU2xHkjQjaDuT2zIp4ZXtW4BlUIkk+qYmB+DVaHCQkF8nZnkv8xZTAYf8TOoZ5sndwO8Wl0bdVX/3LjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KteObu6WtQ22B4B3okN0YwPb92tlQcDJY6ve1F68Ygs=;
 b=jwuhS8LsudNYBVi0Ge/HQhrB/lQZEn0pcJaBz1Z11DBsxfTBGnEpMmDryJSR8KRLnnj53mVLMeqjuJ92dof44xIFpI4L6XR5w76iSxBCAGCVOklYKBUKB+39jCt0IeHRSBeCiTLGrNVM3esu+5jvEVa0eKleZplIz25jPVEViuBziuYi/VNw87tFE+2Ct22vLB5RSnWJSspiskrLKdGfq6HPc6XZiGsdzmuqEC42aKI9p0rsR0Eip6D2TKQObqQhjB/Y9T2QX4993tAi3XswpqdtR56U6QYwuzjNVksn6Vxy2Qx2w69dYr61jbOlqihD0GQmSNbsGYpKCzjnHAleGQ==
Received: from SJ0PR03CA0098.namprd03.prod.outlook.com (2603:10b6:a03:333::13)
 by SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 10:17:16 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:333:cafe::95) by SJ0PR03CA0098.outlook.office365.com
 (2603:10b6:a03:333::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Thu,
 19 Nov 2026 10:17:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 10:17:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:17:05 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 02:17:02 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew@lunn.ch>,
	<devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Thu, 19 Nov 2026 19:16:40 +0900
Message-ID: <7a3f142b8142b7c067182799d30b33b026e74221.1795081735.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795081735.git.jackyhuang@nvidia.com>
References: <cover.1795081735.git.jackyhuang@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b8ed1a-0241-42b6-ed90-08df46264972
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|7416014|10067099003|261009223027099003|261102123227099003|261021121427099003|261026121527099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Ahrb3B8PV6pa/C/2xJHV6Ke6Fjmw0LdOWj6wT3JTXF9/6gg/kyEfjPRymzn5WPI0GQnk6dtwIjGffscSupTw/0vCFmQXQUDR8nGcq7MbvQ5SGz0guMrG9VAQ8l2QUv5UODRzX2wEqjFIytk7zw7EhwmONxdWiichD6tbKI0DUKGWS/hwweKuwtU6Loj2WJ9ouRP+U1V6+lXeHTrr3GT8PFSol+VszrexLHFxFV9QGZ8EXGBPhpdPOQ/Hv16g6cVei8VeJ69QSG2D0IvjBQngOYPCfcPYoN+qadASu5xtJQ9lxy5ILv1sqyJvCT3Uv+WBXlhQjjqQsOvapNp8AuEISdsnlXmevEV/midGMLN8NerbQspVqEhtb5KGrznzv9WEURehYDAyiU2Xa0F9yq3WE3dDcYk72D9hx6J2Js1a+lfpgnowVB52c0XaPiKeQdnHACj/towTPZIQW5RygoH48abW5cWjfZTxaYtEG81OC10QuH+ACmwnOVJTl5fvMPum8vLnmLEjEBQbtCN7RSUsCs6nNv4Pmw5llUamPcrWIXnsN/U+Dxt/A7t2E+xPzpfZ+wI6BJDd2mNxFp1aT9GCLqLiYXBGZgFx66hFLv9UhFnn1OD3QyFP82Q3bfWH3w2c0HnjmTAORwwnSgKBOpWSmvYhuSJ/CjEVAW3xAVwTBFs94E3Cb/2NvSTCUslnwCBO/P0c1sX1wHenAIVlBc83bw==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(7416014)(10067099003)(261009223027099003)(261102123227099003)(261021121427099003)(261026121527099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 hGUj0mCNWPnFpA3E5nydH3E4PR3L4lhL0MelszFXrecVxKG8Gw6OdQ/wcIyvQkAQki/cYK1uU+brRi0Z9xPD5LeQSUJ3R5o7Kaq+O2S78tX2QUlwjP8bOD5ZYbFGXbEJL4grDxSJrCwYWztbN44jUeV0ex2tf9Dfj8TWAhHUC9K1XTT2zTlGn/ZeqnZVjMGIhcuGzlVSAbp9VeboM1Wyq4z/D4p0173AOMy2OSSVmlkgYrOUvW8XjZUO44GhEAAm99mY/MY+r2HZW9gg5GFYMjWbymHbjY0PiP17UavMnH/yd1ORtrOXncs2+yrEEWy8s0QMRdl5lQEih0/WiEkrB57bw+LuYkok2R63WimotjMUGJa2Mn29O7Fp9y8PrWzk1G7iCQzj2PAqv58abEfl6Z+phXqbCVITrCmy7pNOTNpmF8FjdoaIom9Djxk5cZy1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 10:17:16.4592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b8ed1a-0241-42b6-ed90-08df46264972
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878

Add the board compatible for the NVIDIA MGX Vera C2 BMC, which is
based on the ASPEED AST2600 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
Changes in v4: None.

Changes in v3: None.

Changes in v2:
- Add Krzysztof Kozlowski's Acked-by.

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..92127d7c4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -115,6 +115,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-c2-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0

