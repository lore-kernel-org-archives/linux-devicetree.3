Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43313C279D;
	Mon, 20 Jul 2026 07:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532924; cv=fail; b=HGVX3yBhbfr7kLG86tw9S4LJ7F9T6MF2tzlaGESDfcsm+Tu4MXd15aNCUo+Bj3VFM6skKbmuXZeYGbvvIQvIzoPTi7utk5srKz0AGB7QeoN1fWJn00QHGISQmqL+OBaGM7J8pf+LZPFio3bFz30ReqZcnoVPxMtXlJRU9at/aYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532924; c=relaxed/simple;
	bh=atn7UBN4ICqffvDU08kvoLhnUsYvhP3a0IERfc+bTEo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fh/ERyHHHM0zw+xpcZq7WMN5YRTKwhHmMsxQUuP/vlOnLZwsfPJl0Y56D159uFSbKoxy0b14toK2jno6zPh2N0DtQWpB+YK9auRbNp0DEp0o7OUF/oXeM+aLUl0AvVIbH+Do0Vc6zEaII6RYENg2n8VGlCIKWRAkvZ+jnIYsRxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iUZhEmyG; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iUZhEmyG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H94EMuA5qcUyVyms2OTMgiqNEiiOmqC4S/9krR7vVxGXpywTyXaWXN0pxC6euWzeJ5bOKDiA6ba8b5j4o9hKpo9hEgH1Q5iYGv6SK+d1+wp6TnUoGOaCMIHKfoVcQ72QgB2cwm/c63TMgTcwYk4fgVQJcwsp9q+aBL6X4TqBSKFWfef7JqEUsQTSpI+uiQ+o25DSRvvrAQRoTqvWls/m+OcYkfXslqPnGBwPc3p4dz4FSZ5c7uomNhUMzeN8OMZKF6yK9aFwZzyG1YFnskET9HwwcWYcXUYVsv3DX6SP/ZTAMJBlDUn3p4OD2qCewqhZtREyJ3RPaP4lK9pSOS+5DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+cEBPqCGzF93kxb9usyjKzpryk4ZoNOVS9qnDJKCkw=;
 b=Sy5ndiAYzwZ/rM1VFpmPl/WjYaEfJ+Grz5slW9rm0IsGpZ6/CBmu0p+hg1h3bif/TQudK6zbXn6we4CzEpa9L/crQKcda7Ng79ngyIEAUCnTZo8HuHnpIX0/ddm2ATyHoff6g+4v7yH79PSbvynkowsG4MbLWUJLISGw8pdL3lI3SikfE1jNzdLAL12QmkBCQgiUn5PiBK2Az/0hFpf5xTlaS2OWr8hNMJEFEqNIMMteK1PwGiPsDsus7ic5QRduJE8OIfCEQfc/V4OdggY0skX79bw4ui1xgeAjsmUEfK0cKSxuSFbH4Rb6/Khp/4dRvm/VMo/VFRib6agfp3GVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+cEBPqCGzF93kxb9usyjKzpryk4ZoNOVS9qnDJKCkw=;
 b=iUZhEmyGsDZhelsKwOEjUWYltJlL4fiSVmZ7M0EZYQNa3q3un5zCm+96A4WDtAp2DzV1++wloKiNUuM9816Xvin7vraYbrOZoGFZRK8qoiQsLfeeiB8ovFs2itzb7Rb+JP0fDZ2zYDv35HWYfmnMH6VpJC3tZC6EOhyBAhnkS+U=
Received: from SJ0PR03CA0064.namprd03.prod.outlook.com (2603:10b6:a03:331::9)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.15; Mon, 20 Jul
 2026 07:35:18 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:a03:331:cafe::9c) by SJ0PR03CA0064.outlook.office365.com
 (2603:10b6:a03:331::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 07:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 07:35:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 02:35:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 20 Jul
 2026 00:35:16 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 20 Jul 2026 02:35:13 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <michal.simek@amd.com>,
	<radhey.shyam.pandey@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 0/2] i3c: dw: Document optional core reset and drop redundant name
Date: Mon, 20 Jul 2026 13:05:08 +0530
Message-ID: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b0977e-b6bb-496a-435f-08dee63171f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5MA3qf2s40Rgb2E8gz3SE6QEWWOwn6W1jcf84iNOdKpuizr5HJpp1+kCV4Z+xtmPuT0egvZRux2p1iLkgR907hAE+YvepiTCRWBTXXU3HD/ytHemOWK9k/ltZPMUsKGctv3JNR5gqoBDvYOGHKq6/Yh4MBcqRrnwf2vMONlIiOBIN73i9PAAPuR4v1eOFl/7PzjA8roOiTgE4kjSvr8OpsNKGWIn7rCbSBmdGeBHez3XnLOpNW8R0Y9EYKSQmBPI9H3C4livNIv8mu1qIZQxPfMcgyjyQ4xVBM3vEKa13FqvKwY4LLNUig8J1+dk6Bk9666Hkd6weJvToRzXRALGj5ybc7ZT6YnMByfgLDEMZSAvD+XX0H2cjWJJ8NtdGccvcoB/k0P2sywz0IT0RlKqgjBHgnZ/k9gwmgMtNpZV3h7DJkMVWX+U3wi4x7igBA8ZtdxPsNxpEHTgu9pDdlDbV85jiDVxGiAU2lz5wOlz3lfyhLyQH1i17Zgq47R2alYMBtGETYyUiryMOVo0CjG+8Q0KJ9liUWHYLVk6WVl7qHjKxh0EIH69b1YGf7psq2jfHVhiMWe0MLuUZDFtZ9/emBtewCJLmcxjXgvduq2mURZITVMX9OxOyn5poGS9qxDnqeIcp1Y+IGjoNGxyWYFfAz6HErCyS1j99Z1FFeuyy8ZYIhoZUZ5cZzpt6Aoqu1yfsCBUYZPezR8XgJC4lNdNGQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YtDgeCIr2DvdDmguA/khNhkmpB9w25c9pVILZ06mGjIbl656TrHdBA6ooRCrDoabHVe6IdALprV6sppvyUDwlAQJwF1KHM6FHcUspIX+F/uXkLWpjlKL6aNwUOId2slHE6btqeBv4+kzxBv84RnVeuBhG+20viIZIiGKytwdkqB7E7KXVpnn11/osJyccRJaOCV1DPofBWbQ8QtYmIcvaAQrG2SfqQI133fzfDEwmZR0lP5WKzhEwu4h1FBzt7BJgsxIyd0fNrUEq/8A6nsgH865CagOp5YfMZgBy8v+J6489oHXYn9eGCHikYgfzHnds/S++s5xVu+oz1V+tfNYV8pbXayZzXqz5H1V2BHNCcdaYsbRlLEivTHwusm0fD4TwvB/cdzq3bnVfHyRAFx6bj8NacR3WjITDUl7beD5VlIQhR6PcCSp+V7Hn6oPhheG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:35:17.1607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b0977e-b6bb-496a-435f-08dee63171f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

This series documents the optional core reset for the Synopsys
DesignWare I3C master and updates the driver to match the binding.
The DesignWare I3C master IP has a single core reset input. The
binding never documented this reset, and the driver looked it up by
the "core_rst" name even though a name is redundant for a single
reset line.

This series addresses both:
  - Patch 1 documents the optional 'resets' property in the binding.
    The reset is kept optional because the reset line is
    integration-specific.
  - Patch 2 removes the "core_rst" reset name from the driver and
    looks the reset up by passing NULL, since the name is redundant
    for a single reset.

Changes in v2:
- Updated commit description for binding patch
- Dropped reset-names from the binding
- Added driver patch to remove redundant reset name

Note:
The DesignWare I3C driver support was added by
commit 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").

The original Synopsys DesignWare I3C binding was added by
commit 116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
but it did not document the optional core reset.
---
Shubham Patil (2):
  dt-bindings: i3c: dw: Document missing optional core reset
  i3c: master: dw: Drop redundant core reset name

 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
 drivers/i3c/master/dw-i3c-master.c                            | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.34.1

