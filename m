Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197A23876A9;
	Mon, 30 Mar 2026 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863916; cv=fail; b=fBrgb9mNWg6VQ8oIy66DYl0ZLvJwTfB3sVkdyUrux1JsnQmErFKw9/JaQWmfXowrdpKw1Fpfyb2TqvsVr0s/RR1S7C8VadL+gUc35uWTtsKo1DeDpzoBFNr88JK2qavzXzenZDbEAjwVXXe5jqFwJt0xpU6BBdHWN9R1Zj73nnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863916; c=relaxed/simple;
	bh=jcLk9ShnB8cqI6wzMzoU0Sgdjl8aKWUPIXqte95iyVc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nfgih4dd55APckYFlFQ7Te/nbVVLcldskvwNl9o1yqf9dfIDDA8F71WZi85BDKrEF20GtZ5PrF22EPYqtPLocKbvVbhEKP9LMpl3I3mhXPCFwKVPHt9sVH5EgArwqBnxszRJ5VWDYWgoSSz4kfWZ8I+XNuW08i+l+mJftI6feFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xdOaHT0C; arc=fail smtp.client-ip=52.101.53.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xdOaHT0C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tueaeQo+Tl8vjTdVu4/hPq1nEFuh91QbJd1UrXW6Q/3dqAkOTih+Y7kam7iPZjcuADSwnJlQ8i6AtydpBtPlFnGFpedXWtnMInu+tueBE2oMJNV/83ngRnBNk8jaR06cRrYU7cVJ701nyLncWD/rfma+6CmsbrP+suyNNnBPovjYUoR9U+jQSXGZLMNiL4l6H0uqLqr6KvWoRO4zkx1XJV4curbDBl0JBR7IIALlVviE+KsUHOtPlpC02+4eTZc0RiSEm3vULgZKH5TskYJUS24+LgXgx72rWh7AcZUqcwWM/1ySvD/ouT5ZFeUTs7EThbNxiqELASEyALPt9b2yrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tu5sxxyowtNL3/mhbMSRdJ5Z3bjQfebpk3ZnVZ+JE2Q=;
 b=jJZJrCNd/WxyT/5gw/lYn/DEDuFWGf5TsnW4ThzOZZKmx1gUW36yjhFTqEdqqf1TD+kD6vuXR9bu9Pxhw3QQJJtM/V7TswHLAbV35Ry0S6iwLgmsQEWkNFKkC0QUqWQn7sGXzXpAtGD0S8wod3p45inpZppwUGdELasB7XI/2ucAr2QIQiA0YFkqzfD1wL76ZgQC46aJDVMgMPSw1Gkoe57aZTyB0xVoxVsxE4wGEVlDmcc/ZwS/lGcrDXx+m+Wv7BBEhQxwFJVoxq+ywQklkWu45zqIA5p0kvQ475uHqy5RVmwBec9ss0F7gkWEU4q/rSjNwQdlhVPz6+bBaic79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tu5sxxyowtNL3/mhbMSRdJ5Z3bjQfebpk3ZnVZ+JE2Q=;
 b=xdOaHT0CDsSXFtUfqzQTYgP0pHmbLTA3On0OztSwO9snfAnSzwQ7lOrwN3abdtR6Etd4MwRf04gHYcSHkTSNfrPR2UIkyK6hp8Pv+R7cCGz6520TQ2oMW9xB67URqE2ZvbA+c7HPRRBvWXdLUkkubBu5Q0uIyX+OXO7sKCaTGHc=
Received: from BY5PR20CA0035.namprd20.prod.outlook.com (2603:10b6:a03:1f4::48)
 by CY8PR10MB7121.namprd10.prod.outlook.com (2603:10b6:930:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 09:45:12 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::8d) by BY5PR20CA0035.outlook.office365.com
 (2603:10b6:a03:1f4::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.27 via Frontend Transport; Mon,
 30 Mar 2026 09:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 09:45:11 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:08 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 04:45:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 04:45:08 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62U9j0bh505460;
	Mon, 30 Mar 2026 04:45:05 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v3 1/2] ti,j721e-system-controller.yaml: Allow audio-refclk as clock-controller child
Date: Mon, 30 Mar 2026 15:14:58 +0530
Message-ID: <20260330094459.128648-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330094459.128648-1-m-shah@ti.com>
References: <20260330094459.128648-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY8PR10MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: e0485700-df96-4add-cb9e-08de8e410940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wPyzQP0eC938VY9RrRnKNceWjeGJDthvEYhpMLbOaB3Dou9kT/ny/w0xFyxpA+K0PNCMXtexdJRigCnRFEQ0qazg/MRdsE5AcDPnTOfTdjluV2xWBtHml4BVmZJreDl+LMdq5pOnGuAECj4CU+IwD0Ixc6x5PT0agJyjIkYNzdsA45+8TEAoEBUGEJ5SMIF7lcMbUkTUVzJjmJve948aaIiG+53xL3oPv4ILocXrJlQVFsm3FzhvB6E/SQVpYyAyp4WlOcwbQn3l085HsoMukb765FVIR0ut3BsGIvcOJLbqwHxFtcN8quPfMEJ8kOAo5DtZ1ZdEhq2DqZd04YPvm3krtW6QdVBfdoE464YkR1+n6SYqBRU68ZlEQVsuOM+ssD7mZCYMTc96ooxL7GKmxn9b2yxyBRm++QridfekZvDVsNVDTz9SEs+sbhAP2YGl105b/Um3HSArauEMwfUW8kCM6AQ8m/Paxkutn+Mr3JE/3NrI778Oto1fVb3/8BHZVTnwSGabj0HWjvFtZtHG8ghXCzIz5a2H9HDF61EOaqroRSyQ14djkMQHQfLKnr1gj37eCHzIHqkHzlquPIz20cNpc86C76KlQMIZ5m637SRoUiEgbfvRfbBnYUsFhsrmNUl5jXJ5hj/yeAf6K/P3jz7XZ/YBhgKhVd8jbgj0UcrvyPL27aFW7Vjb3fHUzaHlzrM9Gf0RAGCOZDqitk0VbpfoYW6s18rlZJMPOKdmXFaJbyZW/uznRhYVW4AdtMytGw5KHWqE6RNJclfsUxUJZg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jSs3hhDocxfeuhTXpn52r9wOcAsvgIsx4JqYi4/V20qbXLvHT5/pIoH69jTey9i3HAY0Hy+Vl3lPmhh6UqSh2MA5/p4wafwE9/zoO2MvNG841NA7+S+9JjnZfcQAErOBoM6LWqnpTrM0sQ79aWtqWBIwN1gJ7U/mEuSGE8yL01gPyLV9mcniSutGQqjeycfhVFPGzlfMPE4SPGBsupQYYXQIMsCg25w7hrBoxV6aMjwWrAW1lBZkjcy/AqkJEqqv/2JKkjYkyHHt/U3WeZowKSXMq6BDjHfp4wWtm4b26pApizqN3ZsxvrGaI5alFR3D39CGpUQJKajLmp6Jdkwm2t6WxnMU5qYE2hb5pTiR4MOkjwDOwKy9+SOmOPfm7v0EAx1bZKLkDJQF0AEGVqpNhYoSwt7AKtIijpyZ9Zy8J+3jSv5Pj+LcZ8961QD0IXzl
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 09:45:11.0968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0485700-df96-4add-cb9e-08de8e410940
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7121

The ti,j721e-system-controller binding currently only allows
clock-controller@ child nodes to reference the ti,am654-ehrpwm-tbclk
schema. However, the system controller on J721S2 also contains audio
reference clock controllers (ti,am62-audio-refclk) that use the same
clock-controller@XXXX naming pattern.

Hence, extend the clock-controller pattern to accept either ehrpwm-tbclk
or audio-refclk schemas using a oneOf constraint.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..d5d84a8f1257 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1

