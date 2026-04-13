Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9D3B38B8
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776091568; cv=none; b=GwQbCReXE4KvYkiiaSXhC8Y+TnG6jEMMqmvfudoeUVagMhSDBqeXhrO4eQHzBaX31Y3IJTNFj8XgJ4Apq2iGIrRmdHxVHTFJG6UfsmeulI91xYyLXC1JcACnpUyq4qUsKcRDY9evIAHqwnUVm5uT7HWeIRVhnZg++f9SB7tYzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776091568; c=relaxed/simple;
	bh=etnWuUY+rBc0xF6He477b0GmCpvthmdA6FQ+Ka40mNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bv5EQucPNid7S89rQI1N5ae67M2hi320RlQcaPFXcr1MCZQyjSiCxUGKcCs12QAu91IVCmsF3F1l9iplzeh4P1j2SSyzK9dUAAzmM21lNvRK0Y+Hxy30YXJ3xvBHn9csZO3GLYf3bPu8bBAcr+QbgVXXh4WsykjQ/IkwpWbtAMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntE34wr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntE34wr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37173C2BCB4;
	Mon, 13 Apr 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776091567;
	bh=etnWuUY+rBc0xF6He477b0GmCpvthmdA6FQ+Ka40mNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ntE34wr+8ga+iHMdZBmt96NVcdyg3ff5+sYhmD8D6MQiL97p/Rb70pZPHq+qkzCpp
	 DsV5KV20GfzSTQFc6bfXPFNKDfUz1rhXvAy4gRPxlMm/cyCnCZoWvzi8z1d+eYrHQR
	 obToQY90gYUx5/v/lyPGUNYo+bTYv80ZwEq3TUF37L+BQJBL0faaV1bT5XZLaBJ4ez
	 Ju34KxJeU3UdIda7d3rpUN/bkZW4jadBVrBJvyA6M46M8E19DOXekdGaGPpAoFQCwQ
	 LV77t4pVb+dzgisXY0GKp0E0VE0xWHV4ws6RctEO2ZbxW9Y/yIBfslewaC/RKTEs2Y
	 EhCEuEuWtXuKA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Subject: [PATCH 2/2] arm64: dts: Add SoCFPGA Agilex7M devkit
Date: Mon, 13 Apr 2026 09:45:53 -0500
Message-ID: <20260413144553.132737-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20260413144553.132737-1-dinguyen@kernel.org>
References: <20260413144553.132737-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Agilex7-M SoCDK is largely compatible with the Agilex SoCDK.
Reuse the existing Agilex device tree while disabling the QSPI
controller, which is not present on Agilex7-M.

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/Makefile                |  1 +
 .../boot/dts/intel/socfpga_agilex7m_socdk.dts     | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts

diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 33fcc55d0cb9..088a03b89c99 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -8,5 +8,6 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
new file mode 100644
index 000000000000..164556e0a785
--- /dev/null
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2023 Intel Corporation
+
+#include "socfpga_agilex_socdk.dts"
+
+/ {
+	model = "Intel SoCFPGA Agilex7-M SoCDK";
+	compatible = "intel,socfpga-agilex7m-socdk",
+		     "intel,socfpga-agilex7m",
+		     "intel,socfpga-agilex";
+};
+
+&qspi {
+	status = "disabled";
+};
-- 
2.42.0.411.g813d9a9188

