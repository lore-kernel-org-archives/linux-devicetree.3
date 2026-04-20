Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9BB3921DB;
	Mon, 20 Apr 2026 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776683688; cv=none; b=lIUAwr20Hdc9+2fIpzF6TNy/7aLb+guTMLxTebrl87VvX1GJgDqk25i7/sz20kPN661vHqtQSy+QcoNcSDcG/U4RlVLENX4duhziQvcHNHR1Szhsm/1vHhtdvyfMagANstWK/BAp6ELzRI0VKqDlEsFzf0bzZCP2PrFE1ikJf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776683688; c=relaxed/simple;
	bh=MW4N9QsMfGRIB/wVdWforxO3hhp9OHH7Sj/gjKngHPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9+dn5WThnNN4PrLVQ0lbSSy5oYT6FLnLoZ0iIKxYFyemcEkZwaFrrhko0KCvvMZqJrl+mD/WoMU9t/MbQZOv3s0MyzWmfBZdcRDZ8FvG4TpYuC3oPd+xOD5KJUslwp2ZWlA12xIWCxmCeBXO9DhFCAFxMWAPpixzqAHDIacINk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKQRjrca; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKQRjrca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA0EC19425;
	Mon, 20 Apr 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776683687;
	bh=MW4N9QsMfGRIB/wVdWforxO3hhp9OHH7Sj/gjKngHPs=;
	h=From:To:Cc:Subject:Date:From;
	b=aKQRjrcajW69yY1mebrRHL2/8t9lOjacTxLyAvvvax4ARwpfjEGFVWEy2TmozL7Xx
	 amTDPf14A6Wvfdp4i1Rh3mbjC9bT2dz/NdtKCmL1qvRDD3rXUuzyINdMYR+jb9Lhxd
	 1/Pblg34JjnR6EcU4+56UiZu3g9FWrhtwgBloi84JYg5UV/IHcqCk1pSQOjWyWll9/
	 vquBbED0vsiZw30+XWpYwNLu93FamTLuWdSqqnukNMOU70U5hYOtE40tShCykmDNdb
	 DuCpkW7jwrs2cvR1ly6RD9xvSc44iUGSa4e5131/PH/o5wssBsF8qqujlTYegat6ic
	 kqOKdD6uVKNIA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: microchip: fix icicle i2c pinctrl configuration
Date: Mon, 20 Apr 2026 12:14:31 +0100
Message-ID: <20260420-blinking-unselect-955dfecfa26c@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NenzT30jUyOlQbFBBkdogMhrluIE/UqTZ7cyQnbd6b4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnPuGZeyEmsnr3qwTtNHnbzoGAtacVi/71Oslk5f5b92 tG5jI21o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNZpMHwV/SI48/f/aYiExsk dzQtEEo4d/eXT2D1zZ0ZSv8CZb50MzEyzP0aleYZPSl8EedB9QV/jz7J2zrrnqTiyzU7JG6kTk/ kZwEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Unfortunately, an erratum with engineering sample that I was not aware
of was exposed by adding pinctrl configuration to the icicle kit.
When routed to MSS IOs, i2c signals are never anything other than tied
low. Being an FPGA, a Libero workaround for this problem was created,
that involves routing i2c signals to the FPGA fabric when the MSS IO
option is selected in the configurator and then back to the intended pin
using the debug "fabric test" capability. This is invisible to user
facing information in the tooling and not mentioned in reference designs
documentation. It manifests solely in the .xml output from the MSS
configuration that the HSS firmware uses to configure the device, which
Linux now overwrites using the pinctrl information. As a result, I never
noticed this.

My original submission had the engineering sample configuration, but I
modified it on application after I was told it didn't work, not
realising that the report came from a colleague with a production
device, where the erratum was fixed and the workaround not automatically
implemented by Libero when creating a design.

Move this part of the pinctrl configuration out of the shared portion of
the icicle device trees, into the portions that are specific to
engineering sample and production devices so that the different settings
for i2c pins can be dealt with.

Although the reference design only has this workaround in place for
i2c1, as i2c0 is genuinely fabric routed, move it too since the
erratum affects both controllers.

Link: https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/Errata/polarfiresoc/microsemi_polarfire_soc_fpga_egineering_samples_errata_er0219_v1.pdf [3.3]
Fixes: 123f4276b521a ("riscv: dts: microchip: add pinctrl nodes for mpfs/icicle kit")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 10 ----------
 .../dts/microchip/mpfs-icicle-kit-prod.dts    | 10 ++++++++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 19 +++++++++++++++++++
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 2d14e92f068d5..9078e5b1e49c1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -101,16 +101,6 @@ &ccc_nw {
 	status = "okay";
 };
 
-&i2c0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0_fabric>;
-};
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_mssio>;
-};
-
 &mmuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_fabric>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
index 8afedece89d1f..636493f6584d2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
@@ -14,6 +14,16 @@ / {
 		     "microchip,mpfs";
 };
 
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_fabric>;
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_mssio>;
+};
+
 &syscontroller {
 	microchip,bitstream-flash = <&sys_ctrl_flash>;
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 556aa9638282e..6fadce815c9a2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -11,3 +11,22 @@ / {
 		     "microchip,mpfs-icicle-kit",
 		     "microchip,mpfs";
 };
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_fabric>;
+};
+
+/*
+ * Due to silicon errata, routing via MSS IOs doesn't work on ES devices.
+ * Instead, i2c1, appearing on B1/C1, which are normally MSS IOs, is routed
+ * via the fabric and back to B1/C1 via "fabric-test" functionality.
+ * This is done silently by Libero, so the iomux0 setting for i2c1 has to
+ * be fabric IO, despite tooling etc saying that MSS IOs are used.
+ *
+ * See Section 3.3 of https://ww1.microchip.com/downloads/aemDocuments/documents/FPGA/ProductDocuments/Errata/polarfiresoc/microsemi_polarfire_soc_fpga_egineering_samples_errata_er0219_v1.pdf
+ */
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_fabric>;
+};
-- 
2.53.0

