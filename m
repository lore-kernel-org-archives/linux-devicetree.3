Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012007.outbound.protection.outlook.com [40.93.195.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE153CD8A3;
	Tue, 26 May 2026 23:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779839681; cv=fail; b=c1l8y+VnnJU76VlOUNMgBZCz9j0q0SrDuw+yonKokTGvZwyyu0krsDFhv+AN4H0VEWmUCc6PhgxoYBBYuzTM3D2qrL4U4KKgecaFoIyI+G8zsHRo+4MFeVcXmJ+JJmzEbaJ/RPYQpc+y9Hf7ziklDdbKz+fMP0QImY7f2ysBIXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779839681; c=relaxed/simple;
	bh=SQD9tiDKSyyO11rzKGwNjLi3iqYlnBKNUiI8XFDRZCk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K3f48OqaCmbpM4fG+Su6D6B/4SJUhkCN+Lkx9gVxnrsHHHG9eXG2DQpFx36+9no5RTULO4ikfT8Q0ECzHKXou07okQ7EisHvggwMphQmUfgr/PQrRYdJ/+MLPN8e/lXLWJibERbCo30d0495K8dr+FrQU5MGKferpUEb+Cg4k9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DKzwoFOE; arc=fail smtp.client-ip=40.93.195.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DKzwoFOE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFyBfS8uz/T/0eA37nVPksArd/KWCWheN3Y5gFcp1kbJzEDHrgihTLnNWxe8C8f3wY3w4tl4cS3Um28CXvP1FiK9xzZm7zGuz5KxiCnQviD11RyGcnLWld+F0UcwuNPWC+7V4A4WGnRxqKbS0hOtijtO5XXC41hoGvCjVD+biDtggEGiXi4nbU0/mxA4r4PuCAd978ipiZxWV/+mzTOXkbfJmCB7ncy1KAjyKVDpvv2p5wFVU10QnOlq8DbCfrp0dRO3MdQyOYbGTdTvO+IyVjd7Y5x2qQH1xs38+7Sfmb9hNavD4YmRvl1zkFD9mx+sHWdjmOadeHQ/MLbZhZ+Ztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zPK4eqo3sZctgPG5SRAOE+TZZKYTO4LbS4Ma8cPCEA=;
 b=ugSVAkbSy1t/6Qj74G5ok6ImL+Tgus73bp5QOofNfTVZh8dv0//RzMRsDu6lgxva3STTUna+2vjiKmeRWR8SB0bd5+c1+o99IVtf7MMP3j3IXFV/t1JY0K+VywNnAjOLIISmrtNmhc9x9acp3KOAWnvGApVFolm/6HIDh4zFrqMwkeVcPI36r7+50dl1O/Aoxk7dqMs1auoeylsks6PR5C2nDPOlimfa5UZsWylFNYy/jWzV6Kpof5Wnzknt92dLkBuoGp45B6+32SxyShC5bzUoQVc+6Sh9JBzTxIRmstfisphf9Tb4NCPmgR2Dw7bW2HGzPKoDJK5c/oUMbWBJBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zPK4eqo3sZctgPG5SRAOE+TZZKYTO4LbS4Ma8cPCEA=;
 b=DKzwoFOEipq1uBr23igA9cOyHv8Oc4dzu0sbNtpDXcG8T323Yy5DGSNxA9eZH7y7OCTvIj9cONYObFmNWmtHYD7nGHn+v1vLMtZFTvHWpeApOPuq2Z3S2g2DK7RYyKEor8KUvCFnkCfCtW1ox+Nb6iV+5u05OfgS0xFxxECjU5Q=
Received: from PH7PR02CA0026.namprd02.prod.outlook.com (2603:10b6:510:33d::35)
 by DM3PR10MB7928.namprd10.prod.outlook.com (2603:10b6:0:44::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Tue, 26 May 2026 23:54:20 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::59) by PH7PR02CA0026.outlook.office365.com
 (2603:10b6:510:33d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Tue, 26
 May 2026 23:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 23:54:18 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:18 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 26 May
 2026 18:54:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 26 May 2026 18:54:17 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64QNsHIQ1896232;
	Tue, 26 May 2026 18:54:17 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Tue, 26 May 2026 18:54:15 -0500
Message-ID: <20260526235417.1326187-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526235417.1326187-1-jm@ti.com>
References: <20260526235417.1326187-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|DM3PR10MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: c1bd5593-782f-4d6c-2a83-08debb8219bc
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	MCM5eVDB2FjXY3OMAXWk3Ylp0FbDGo1BdZFf4YyUIaRIKxEN2JIFz525FJbdfLTP7BB7dHPXaWsr3V7CqcfeLLIhD8FO4ynBAW6Hfqs5+8cvax9+slBdOvI3ymrrZnEWRPlZ2u9pq/FGiIYJW6IjOqal+xrV64oh7IACo21VQmM44wJy/YknIH2qz0nSHeYCXaWvRSU9w9Th+fN7Sj4ai2t1b57cQGXfvVsFdCJvcO6NozRAJCSkXuiq65ziqhNZv6VSxxMIu6cbM7FLD+wBusc4u5z1usyFc2oTpEpt+j4I6eVFizv5GJEGabx6bOKy7IXQtEpw8wUVOsqN3CNaONNtTTGPRQJqPcINQ4SkBNKMbAQdW9bjgcrdWKCU40betV4KJxxkjmp1DMAiNKLWGOpD1UUI7NVFY279OYdPD9eseq5JXvRY+/d2o6VHqrs9Yb2VjD2QTq8EWu4CznwS8h3/cMTGMt18ME0vqftefphkROv+sS/wEPn3PnVN0IhySKS4e089n+GkcV6LlxY62c1tiVQrh7dIFH2qg6xr3fRzeq+QTtE9Nd847Z6pLbnOZrewImSG6pu2n/OmDJyGjP+xpfzV6fjN7HfhryQBOPSq/aZ+tMCv3P5rbe4Gh6gm9cNXLnkWBWCg/9SlBVmx+BwuYlPdjPpZHtjijde/coQrZJ3OwLD52YKDwFCAD40D
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NYLJycGJqZK70CxQMiBv/3JnoACjG+ReDz35Pigm3r4bK1a6w1odweYcch5GNpIHcGaUU7o1J8GcEzakXstCCMKavFBl+pYL97y9oH4oDk0kVotDklONF7qs4+M3BtzwIjfYlqj3qGz9h9OmwH/Yz+wqoi1VAI6qC3JPptwW6MDPRZmpvx3aelEATzu/FXoQuEaxoMhE5T3olB0yaDzVJTsai9hzdiw/opG2wZUVB+nXTISeRCa4aBCjNtsGvwFMJYCbRo2+Hh5tdV1qHiwbiI+b99DvD43Rw7TXdvcAQzHhObzf0yQeTzCbDsiFZFgkirjbsz1mxWBcDLZAMR9c1uyZXntHjQIKsQye/SZYTldSj76Kq0mx/N6pUdi4+my/N/R1yw0VLMW2O7pOkq6PicghaYxr/0hzLl4/Z/FB2W1IbqE2WN3PdZP6HnAwP5Fi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 23:54:18.4226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1bd5593-782f-4d6c-2a83-08debb8219bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7928

This board is based on ti,am62l3.

https://www.beagleboard.org/boards/beaglebadge

Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changelog since v4:
- Canonical URL fixed
- Pickup Conor's review tag
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0

