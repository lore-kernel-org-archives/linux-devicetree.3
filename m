Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458382264A7
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 12:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982667; cv=none; b=YDYdS92L/eT5GXXPjUjadnkq8wRePqsNf9ed9kCJJ/rXLQ3PYQhjZJ2XS6bzhy6YL790enQQLsTYBtSljJkO4zPceb/igFTmjECKC50Bjv0YqefnAcvhltFQN0gvXc5/6uP8MLUf6eYpLu2wfV1EQ5W8YR/+G3CdwheNOkpZmMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982667; c=relaxed/simple;
	bh=1WjSSSuN1m0HT8wBqRmWbiwSk/1R/MNAC7B0IzGQx0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jlb3skrRfzMHuGrK2HJx1D6jXj8Jc1FLiaVdHMAMFEvOm8zqNepG3M8GhTf3MbCjc/x0HXnggStTPh67q59PxN24pv8PJwnfdYyk2U+rZgYRhTiNitKmOKRx/GKwDciODp0Ie/04npznPzhHbPhU5JSfwaWtNEE5zWrl1HZ0cZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=df1kxSup; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="df1kxSup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F151F00898;
	Wed, 14 Oct 2026 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791982652;
	bh=XK6JRULEEQS0QFoOXSZ/Y2S3hUUnJazwERTb7LZ/0M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=df1kxSupHmz42lxiT28tel3pI40ayRTHsFr9H3mY82zQ9MR9h9j7lPl3NtqLqz2A0
	 9OKKb/qSSX8LCSVIYdx94F1V3zoOAf17Va9ZxefLM6nNbBl9g/8y3edGzK+/jkeBHI
	 kahpwsCXysZ621dRK3qVx7E8f5fVtZaqvNvUZzg9AZ0e7630BobkzVdl2qZ6E7OGxe
	 2rdS2WbBdF+d1IiF+LOBXsEPAuw5I0NIKK+g2v30+sUJCYcFGGHY1qQapc6GGV+oj9
	 zPASUjSUvO7/JE8amCdoWmFX/tRZxALVlpZncr1GpydLJp0BIAA8ebXWIgpeQLQLor
	 /dLu+ua8hW3kw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: altera: Add support for the Agilex27 SoCDK
Date: Wed, 14 Oct 2026 07:57:09 -0500
Message-ID: <20261014125709.2106261-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
In-Reply-To: <20261014125709.2106261-1-dinguyen@kernel.org>
References: <20261014125709.2106261-1-dinguyen@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoCFPGA Agilex72 platform is being renamed to Agilex27.

Remove the agilex72 base DTSI and agilex72 devkit dts and replace them with
an Agilex27 base DTSI and Agilex27 devkit dts.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/Makefile                         | 2 +-
 .../altera/{socfpga_agilex72.dtsi => socfpga_agilex27.dtsi} | 2 +-
 ...ocfpga_agilex72_socdk.dts => socfpga_agilex27_socdk.dts} | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename arch/arm64/boot/dts/altera/{socfpga_agilex72.dtsi => socfpga_agilex27.dtsi} (98%)
 rename arch/arm64/boot/dts/altera/{socfpga_agilex72_socdk.dts => socfpga_agilex27_socdk.dts} (67%)

diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 8f41349103b80..40248dbb5abad 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -3,12 +3,12 @@ dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
 				socfpga_agilex_socdk.dtb \
 				socfpga_agilex_socdk_emmc.dtb \
 				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex27_socdk.dtb \
 				socfpga_agilex3_socdk.dtb \
 				socfpga_agilex5_socdk.dtb \
 				socfpga_agilex5_socdk_013b.dtb \
 				socfpga_agilex5_socdk_modular.dtb \
 				socfpga_agilex5_socdk_nand.dtb \
-				socfpga_agilex72_socdk.dtb \
 				socfpga_agilex7m_socdk.dtb \
 				socfpga_n5x_socdk.dtb \
 				socfpga_stratix10_socdk.dtb \
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
index c29c2afcaab70..369981fe85e38 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27.dtsi
@@ -7,7 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 
 / {
-	compatible = "intel,socfpga-agilex72";
+	compatible = "altr,socfpga-agilex27";
 	#address-cells = <2>;
 	#size-cells = <2>;
 
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
similarity index 67%
rename from arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
index 998f19f492b36..15d331cdeeb47 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex27_socdk.dts
@@ -2,11 +2,11 @@
 /*
  * Copyright (C) 2026, Altera Corporation
  */
-#include "socfpga_agilex72.dtsi"
+#include "socfpga_agilex27.dtsi"
 
 / {
-	model = "Altera SoCFPGA Agilex72 SoCDK";
-	compatible = "intel,socfpga-agilex72-socdk", "intel,socfpga-agilex72";
+	model = "Altera SoCFPGA Agilex27 SoCDK";
+	compatible = "altr,socfpga-agilex27-socdk", "altr,socfpga-agilex27";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.42.0.411.g813d9a9188

