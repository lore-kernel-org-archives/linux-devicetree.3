Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013037.outbound.protection.outlook.com [40.93.196.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE823C3F72;
	Mon, 20 Jul 2026 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532928; cv=fail; b=jtUm6OAbDzCK+P0R2BZmZZsRyrTyCZpvlgdRS6K2/pgrGuCsSxC7CG3oZDVRM74F+FLjHIW1JGvpEZjc1tOq8n5nlmlXGix3Xo5U8gAr3XfeNlV/gpVniB4VCorbnnfNQs12H4WYNSIsewSienlanP8NBaYb9IgH0NkiVLWzP7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532928; c=relaxed/simple;
	bh=n0huj8v0N1EuDMdJUIYRdjWUgCIJvIoEQiKJ1L96OAg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YqX4JXA+trcZstikhx4xwaVEhwAGVBO4v0o+JBqeBRsbroaMfh2n8hIauv8qWZNdPMLi3eYjEezEfV87/PEuQAtL5eeZiAWmMtMhD5aO837OcdPXQa8avWI234SxfTV1sWBBUi12SD4KINcJZxK9JLiSVkzzQVILImpeWXMkh/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s/ibA4s3; arc=fail smtp.client-ip=40.93.196.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s/ibA4s3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elPBj4T8R5VSLT+37uR9DAcKFgwL2Q/kyeUr6QKSVSNlC3Ir8xaoaWa3o/4xVSZo4mNo+lTcYHcQ/Q4056kkFmOOOpvKocCLAEeFm8Xvw3NyJoYQ1DhlMV7ol/Xbp6WLyZLIY2tq80oQbvJWKdnkmrYI5Z9OtpmkzlKmPEsIQmnBE8R9D4nC6pBDNrfxnW9Yqu3vdIdGS1o4jIv/SRYSF3rLGSTvK8jVIPh9XH0R3c85HeInRhLpCCpyTL31ahLF/QZBgym0jE5Wi03LNiWxeKoJmDmzN4pnEkS3juDBdbb9MyUcF4pzP2seiZXi83US7+uGsMaJmzckwjCSaNroJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaWm6jhdhawTiWJmy8cXvT9rtaDYQ77js0w1f8IxmUQ=;
 b=Z2qgOw+u6OI6q5ZkHMvCd6DtRfAm/htAVOQ9+N/lFUTUFEILKvBttFLQmOVvTYItczkSRpDtijehnc/+KiUZLZdmfLS2tDgIzkrt7hWngc+DMKmanVqlpikRzDophCtA5NAHfa3iBypbhDJIxeNB/sB3eRF79caXOIpU0nzP8JVJldngf9b6F42LWmygWarFht7NT5HHgVmpIQzRTOEZRqSm5tNf5DCdxkr7CaTOSLlQMU3WF15BP5B7jTkqzDWWt7lzMiTOQ+j7RPNe0kPmaYHKDhBMHPtUw+0wGdsnXyHeMgA1XR/EXbab6JJKKX5tHXwzACUM++WW+hrc27XZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaWm6jhdhawTiWJmy8cXvT9rtaDYQ77js0w1f8IxmUQ=;
 b=s/ibA4s3XyhEoAX/qv16SAvSkhAv02RBqt0yfCz7QucOistgnUrMlVMJAT+z0IE9oYmDb3/4PKK3B5kW1Y+IF470zFDzwkxUfWhoaIIhcV8d3PqmQ6G6E/Vkkm+V9RPo+JtP26Xtv/xF/Ti8+zf4U+FgzbQViv0bcYRRQYb6064=
Received: from SJ0PR03CA0086.namprd03.prod.outlook.com (2603:10b6:a03:331::31)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 07:35:22 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::a0) by SJ0PR03CA0086.outlook.office365.com
 (2603:10b6:a03:331::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 07:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 07:35:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:35:22 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:35:21 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 02:35:19 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<radhey.shyam.pandey@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 1/2] dt-bindings: i3c: dw: Document missing optional core reset
Date: Mon, 20 Jul 2026 13:05:09 +0530
Message-ID: <20260720073510.1869623-2-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b359f4-74b5-47b7-956a-08dee6317526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|18002099003|22082099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J+oqKrSzg7VLT03o5rU8DS4Yn+RnShTZS7/5Zst2jeLsMSkRI7+XgSewvqZA/V4jfNSKIysGlNX722NIOwmHzbXz+oYk1iaPrwohXcso9lL/NrQCrqQl0imG+KAsP5XdMZV96Hrp/Zvutg+4zBQVRbLnlG0zwUikvq4gKPfl/od2fXdqJBdOTXjr1VsGgy7CiD8VeMgqfYZBD/6gjbgl0ooENnUK76HdZnlBsfnVkOPAEa8g0sntTvXzIV0tXjT3j7onID4gPzfzdOneSCrhMDMaOpxTz7vPPjjXWB8TULgvzXJ+TPjJqiPzBhdOzRMEjfsfNshSLGK7DdBo1APPhO2iniqSntftmV7WNn8Yx1aXTn1XMMWd7wx8HuuzkR4eKxgTthD2aZEH0oxoH3YRy0cUfR5/fqMU/1VCknCVWLi1aLBNGmG1AI9zQOPHVLxtc0soLELJTbYaxwgpWhDByhDttw4T4m4FjCGHMRhDj68QY5Sio0kXWemKGtkkPZ+Lau5KtX8A7ivuHbbV/dUBsHGn+9mRytBGD0ChEctB180ChI/VAnExW9a1vMDFUXj5awjHUiysciJIyTeb1sW2Paa74rVEimnzS5DzBvRYiUQLsAdiPLzdh3b7de66lt/XFjY+ziMkKuwqBVuDl0hagQJ+854QY/6IVqYVoCLU93z3xrQuSJKjLfr9KCFG7On9S6r8TCLZbArngooxWJZC/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gsruY41X1GvmdNdqduWy6m1mtO05ACZgNHUeOp4xZNVA9678YHCFg8F7Zkarlcqhi1/9jpXbDX8aIwEFA/Ww9E9/Jjp86rjrqy6mwxxrnMwhzrPelHzPlx4M3qu0X4sJp5GL4uXVbdQI0NpoSe67vBhYzEqjv1g3r+ltssCFALt9eZbYyCtCTmV3MlH5LHvM7iYF3eK0toOqLzun8V3dDhIR8A8E/OGlw8Rh5MzsE+s8dLtoR7INrMzne/LsXSEoS63f6TWUvpXGA9Gxcaq4t7w+ZwH/5zFXbWeL7rbvjPd9SKz050G+46qij0UgpGgFWj7sB9Mxbam98cPPaNjUrOpoo/aI1/1Z1Zy2c8Ppsqzx6nxPdspoFr5aqempGNjiUrGW0KWus5hZ3eaI5znhoYDUpF7ABNm9rTcHVC8GvXucJBWeJppShVZy4aUz8wJM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:35:22.5408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b359f4-74b5-47b7-956a-08dee6317526
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428

The DesignWare I3C master IP supports a core reset input, but the
binding is missing the corresponding reset description.

Document the optional reset property. Keep it optional because the
reset line is integration-specific.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in v2:
- Updated commit description
- Dropped reset-name from the binding
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f55..dc7ee38001d6 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -38,6 +38,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.34.1

