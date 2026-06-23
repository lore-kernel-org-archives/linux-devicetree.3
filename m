Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775913D3CE5;
	Tue, 23 Jun 2026 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213445; cv=fail; b=j8MqvF0modwlzsrAuofnO0s6fTJQLvXN7u+eD1qwzZl8gXGS1/6zmgasFenEUU33hC4WZP5pDSgOMATPyyR82sDZ8JcVGWafMGsXW2jmClULqnxZHrRAvRrR85xj9JtDpGyK+HvUFd3NnAU7yr61EeY4v1q3DBz6pK8TMyQTijc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213445; c=relaxed/simple;
	bh=YtxB4BtAyBsNz80c7bYN/GRnAVbLh0wIdal5diEGWiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WFqoPlgDlshJmUKLxm7PKO7xZb5j6nIrNgO22yfRmiDG0N+OT+XyDJQ7hxB6yEKE63NMjGvOKwg96ahCnHm11DjLdwMx+MG5fn9JqvZ1eU4HgtxAYavR5xc7+ZmjFiyGYzorxQc8gELw/60iExs+5Z5NVPkYPDUOnZenvtFvMEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=gWlYVNCa; arc=fail smtp.client-ip=52.101.52.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="gWlYVNCa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fq+aofezTt2CPmV8BDj3t4ZcRwVLkTZyqer2seDY6NrIEwOxv7+wOvnszRfXDjgnJft+Tah9FfYSXhf059K5xmM1TayN27L5pxqbcKLSyWmt5t/lHHpoKaRjNm5qYu8k90x6H8AW7w7+EXLtsIE+XmMR0sMazfzjm1HSQ8IDsNQaSabhfhw2cbIsOz8oRdZlMT/oWQKpfbiglfuSwFrVikxvjA+hUAiEN2zdC3JxCYZl+IdKlfhxlp5Q7SC94Q8j9ncyz7DPcFW9cVimS1PIDqEoKqvyGM3veMUA+PFjOYo/K3y55s9G9QB/SOnV812hxeNoIct581r4eyvvvHIMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Db/HBxr2b2UErb9BtA8qz7gq/sgR/cHDOzoXVII7IAM=;
 b=NfuGNCGNCKc3SI5jZbB8S268wjuteiw6rXC0YswhVmt8Qeo2sjbqqIMvxv/RV7yMH+Ns50Qf3CmrzhrsKBw7zagSlTWiMqGAJXWnZ18rYCDbIrANpfntsvlt07W6iEXD79iF+orOdLqezTHQ7MaLM5KDHI+M4LcyXjlvtUxKWzV0AlF9fl7SZoMm6hJ6vpifahMyu+dz/j+VCDpxmqtfAiItn1X6STpoxJvQJAdr7My9gA1OpHvTKkRvSDQaHg0sAGCTSo8canZV2LN2qrl+BkVbuTW6UQ+4ROB3x7AyRq2um5QB4qUKchXxQtcN8Af4ggJ/m57lYhVC+tgRv+SNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Db/HBxr2b2UErb9BtA8qz7gq/sgR/cHDOzoXVII7IAM=;
 b=gWlYVNCaKej1prXIHnu+7KFkKkjL6sEuYF8syqbqBvqyEBfnwCOgRiFVgzDb1/msGEmxpozQVw7QieBEvPScz6TJGaS/sh2e3i0HsdfDyhyBiVG26jxW72F7NhOiU/N7hF0AoYI1JansNSxFE6s1LuVkgNsKEO1rcN7ZvQDkVsGqKYCfxtrN84Ffm4H/6n4DLq4t4kisdQVBCtLj2ldlfYJ6jjBuGqYFP1KohivzxCjkeuAfsbc8hYbmHw35A4rrsdTZqZsx6kIiZ/wefTJeoUgS6rG+ieDfn6AN77MSaoMUSnEJxymlYcQ3ISAAZi81vRKHu4rw+MbRDdFJbJmPbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN6PR03MB7670.namprd03.prod.outlook.com (2603:10b6:208:4f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Tue, 23 Jun
 2026 11:17:19 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 11:17:19 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: socfpga: agilex7-gen2: Add initial device tree
Date: Tue, 23 Jun 2026 04:17:16 -0700
Message-ID: <20260623111716.16690-3-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260623111716.16690-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::8) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN6PR03MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed82d0e-e574-4ae4-803a-08ded118fd75
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|55112099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Be+3wSds+g/jDT/BuwNjipvHZN1kELQMS85E9Bl5EqI0vv94K8v6Gp/KvETdRrYvkSjBYPsX7O0oabft+ouZSUSKjGW0D48gnLzXK3OcIRpAt88HQ6akHEfueD+nkkTNruqYYtc/iUChPgCr509Cynn/7r1NBXM0B7Lvs0doYnEhTEnBoQ+p7AC9/eZbl89oaor1B4+HENcYyjbPSVufuF+DD9a9fKBLrVibNQBDggl2AKIEwBTx5V7dZc4iAar/0smsG3y+XWOov2zbtGXlxnk4PM5hvq54VqAxtoX20ouJs6Cq2xmag/Zzj9mpPsOZ+IZR3ywprlqeGaopr3fZSPuvTEBxcvrIakFrvV9OmVteeEEU+Yb7eDvgELZapX6od4SB3USWmJSWWsK+5YAfbm+m/0alyYN6GzBYSNCIYW8YPttnfBbvOZVVO6BaeLxbwwm1kTnPxqEEC290J6UmHcJ6+vPb6QLqnsp6EVZ2BmONUwkBQz0O8V6F2uIuyukjpLl24UgVhJSzICq5hYQ8hb2xUfY+LptMebzjNsYQ38pfpod7ojmfJv2hL6MJDFc3Akw6DRRcL1uK8RzKb+vRsRiDIoptInAB9iyFHK1q7z4viZX6F02elEXJi+R+8NkLvRNRC3k3ud7D7pGblcfimC4qwwMe2Km+TzsdH2FZIQ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+1NandJlkf0dt2g/vGidjHqP0NV++AWPaECNXn901bxeSWAihhnycnvtpr/l?=
 =?us-ascii?Q?XhudAwYwvquS/eG9c5BHHvA233hMq7QQtc0A1Iw1fMYHMAFITbhOQ+t0WrB6?=
 =?us-ascii?Q?geeymRfMIQJ+KCbP4pSQ3actsntEXTu/yD9XkrGELTY8UKaqrx/wuDZNtdtV?=
 =?us-ascii?Q?Ws89NiTIGqY9KQU+5UaLhvPGCgDZwtVuQKptMEyDia8VoooNx/5CMkrrCnFE?=
 =?us-ascii?Q?cB/oOv94rizdw3uFTZjw4eguiFDC9n5sQcFUeDq8PzMxcf/UhN0rmQ8fypQv?=
 =?us-ascii?Q?h7V1voqxvGWFWXeS4bzSigHqHF2MgDELGPCuv1v7N8PRBv+mLafo1ukbGmgW?=
 =?us-ascii?Q?2w8x0JR5XJ0tw/nQorwRXJhLRpMYlaVfdLlLQE9OySrwG/b6C/iiMNXkIfW9?=
 =?us-ascii?Q?GEQuMj8aLJEoqhR1pT2EMHbVK0ICYyLaM+fAhgPUVIZ7mJsSWJkxEzcCwgsy?=
 =?us-ascii?Q?lPn7oqpSf7tTr44ouwd9PpxiXYW/bLHtb/0MQHAhGWLdYkSZGzDD2nOodcmX?=
 =?us-ascii?Q?XM+4INFw0EP9bubxPM7LsFWagOb9en4Ud8+0qdCpsDTM7HbNPkJuVmVsCte8?=
 =?us-ascii?Q?6ei8cQLZamgjazYbUWzluBoCJ0o6IpG2EfoKQKM4Q7xBFHLpOsB2fgcGNBAZ?=
 =?us-ascii?Q?72lPP7X0HK0uYGNSAKqqvqVpycG/81SzFBe8Mm78KWONBaXDFBgiPZdZOo/w?=
 =?us-ascii?Q?aln48WVe8EHrsbQ7fFbYxtoMa6S5Sk3XZ1OVUgvcgPfQniIMOC1lbWxmp9qA?=
 =?us-ascii?Q?m3A5DunpQhyRJKYp51u9hwZI7Rlm6YrDLi+E9v0t9xPJ5R2PXfnCJb1uzjrz?=
 =?us-ascii?Q?Iu6ArWLT9AlFXLafvJTyuIw821LNIu1n/3ZefAal3HDxL5MgPjHDNDgJKiQt?=
 =?us-ascii?Q?+WyrVDCak5oz9QJtlDKgzPoTP84hhbUPqKcVO/lXzZFs22f4WX3UOfPpGoGI?=
 =?us-ascii?Q?LTCIUpcaJQPzwX8XtDXVRk8KbF0KmUvv9UPW+5ABhejPawmqo6SZkCXoi8EZ?=
 =?us-ascii?Q?9rBC1t8dxWh94L7DK2WO9Qi3tnDMeHx/tEQ2cy6lo36W8Bu1Bo59Vqdb7Fhi?=
 =?us-ascii?Q?duEVObrxSy7/kabV27Qn3sUZYMWc+eua/zKHx4JgCHotctkX1ClwQN6DGp7a?=
 =?us-ascii?Q?OGgMOHjGb804ZSPsyO7J/JV22Mt1mMOo0JnmtNj4lbZOqecdKUy4FXkXdXk6?=
 =?us-ascii?Q?QfhH5wgbAE/eL9H3DtIQ0q3XFTxfSwevEHs0tdEoTUqvNYEscOUpK9t3lHQ6?=
 =?us-ascii?Q?lxSsxjnWQ1ZB7Nuu/7K8DefskiX6Ygt6B84uwKuSBl+rtfg9OkyepEz9W8IG?=
 =?us-ascii?Q?FFxXISRGGBCUG2gS9pwSof+e7w+Fe3+XTrSHPYmfFFQJju2tGlgcjvvty9TI?=
 =?us-ascii?Q?uthxhFkLhK/DVscTBU/xNQcbfc+zeNtM3LN+Xa2Y8ZpULPODnltesgCrdedO?=
 =?us-ascii?Q?Itr+vNxleSr28q9Hw54kI7eylURvXe1fgtB3ioPnzDSwkKkNw6/r6xE5W9na?=
 =?us-ascii?Q?cvSK+/pDz07XAAbjscTpnf9YZBtnVdTBL89Wq54s+Sc7jVJtEJOb/SICLSyo?=
 =?us-ascii?Q?m2UdGK80LEuNgMGgDPpOXHlfOy+9nZXZqwwE/mU9wS+oMH+g1iKlc+j2ehax?=
 =?us-ascii?Q?JnFYNiLu1/Qq95O4onJ75ktXdAYBJdk2W0sJpDdzH3I9IePl3MXEUUvpFk0L?=
 =?us-ascii?Q?KP1u+Cj0qigOFX9p+nhnGqlHhPM2YNwmiGTx1PjvJeL4h/p7K57BD48PpuI3?=
 =?us-ascii?Q?hmvfFTQPsFmMVl8HkU5fAtHhNhtJ6Tb6q9u40jszvlEWyNpLHaodq8rEamsC?=
X-MS-Exchange-AntiSpam-MessageData-1: 7i4N+Tc8EElT2g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed82d0e-e574-4ae4-803a-08ded118fd75
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 11:17:19.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5pRbu4fRdh/uSYKShmJeDnhIz5IR30KW0BYBJdMpZr+fn+zeJWI1y426k0ELMOyVGELdiv71GTwQl8QxR4/cGpgsoYpvZTD/ekEoLRLB7hHlzcil078mV5v5+9TmgH5oWxHrRKNQIYX/PM4PB0Smg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7670

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add initial device tree support for the Intel SoCFPGA Agilex7 Gen2
platform. This introduces the SoC DTSI and the SoCDK board DTS as
the first upstream submission for this platform.

The Agilex7 Gen2 SoC features a heterogeneous CPU cluster with
Cortex-A520 and Cortex-A720 cores, and includes an SMMU v3 for
memory management.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../boot/dts/intel/socfpga_agilex7_gen2.dtsi  | 119 ++++++++++++++++++
 .../dts/intel/socfpga_agilex7_gen2_socdk.dts  |  15 +++
 3 files changed, 135 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7_gen2_socdk.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 088a03b89c99..7a53b3c174a1 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex7_gen2_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
new file mode 100644
index 000000000000..e3b777408f9a
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2.dtsi
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "intel,socfpga-agilex7-gen2";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		atf_reserved: atf@80000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80000000 0x0 0x100000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+
+		service_reserved: svcbuffer@80100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x80100000 0x0 0xf00000>;
+			alignment = <0x1000>;
+			no-map;
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x0>;
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a520";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x100>;
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x200>;
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a720";
+			device_type = "cpu";
+			enable-method = "psci";
+			reg = <0x300>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	intc: interrupt-controller@7000000 {
+		compatible = "arm,gic-v3";
+		reg = <0x0 0x7000000 0x0 0x10000>,
+		      <0x0 0x7080000 0x0 0x100000>;
+		ranges;
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-controller;
+		#redistributor-regions = <1>;
+		redistributor-stride = <0x0 0x40000>;
+
+		its: msi-controller@7040000 {
+			compatible = "arm,gic-v3-its";
+			reg = <0x0 0x7040000 0x0 0x20000>;
+			msi-controller;
+			#msi-cells = <1>;
+		};
+	};
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xffffffff>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		device_type = "soc";
+		interrupt-parent = <&intc>;
+
+		smmu: iommu@c100000 {
+			compatible = "arm,smmu-v3";
+			reg = <0x0c100000 0x30000>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 129 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 132 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eventq", "gerror", "priq";
+			dma-coherent;
+			#iommu-cells = <1>;
+		};
+
+		ocram: sram@0 {
+			compatible = "mmio-sram";
+			reg = <0x00000000 0x80000>;
+			ranges = <0 0 0x80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2_socdk.dts
new file mode 100644
index 000000000000..416d033445ff
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex7_gen2_socdk.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, Altera Corporation
+ */
+#include "socfpga_agilex7_gen2.dtsi"
+
+/ {
+	model = "Altera SoCFPGA Agilex7 Gen2 SoCDK";
+	compatible = "intel,socfpga-agilex7-gen2-socdk", "intel,socfpga-agilex7-gen2";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
-- 
2.43.7

