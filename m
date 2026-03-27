Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBCB2E9733
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602724; cv=none; b=nO+95QK03mvPtZdLOZ8KSNkPWPYiA19M2IDh4e6CbgPpOHqSIXQmpNWqLA1i28dDNRdbhnGQz9ozj+GHbS0Fuxg87r+TCp5VQ5lnZI2dwVJLC9VMCx5qn3dcE5Rh15mdxmGHQ17iTMCEZwo+jPimc9fP9PN9ySjfR6+c2MfiTpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602724; c=relaxed/simple;
	bh=hy5PQKDijU0OpVx23K84LxysN+n0UJhSQhLOrVwcvv8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ehSLwdOd77uKmeneLfcTTDIeOnx3FnmoppUDGEEgotyeV36DhOcu60ZhYp5utjARWryx56nY/bNrPbpc/XBDI9OTpJwiZx2iKT0+6c6Cl8OaATOEDk1s/PWp61axRubvPClzt7igGt56WGkXmHOJI/eBkEw+jcOwf3xqpo0eWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcIp9byx; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcIp9byx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b9b190easo1293532f8f.2
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602721; x=1775207521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=;
        b=dcIp9byxDB1yY4b5UHP96iy2Uh53YZbvXY13KfjIfafUfqeD//UKilhDJrhWX6MVGG
         qGpkuSPmJHoPvNoPT5/g2yIEsRWYY4YcCkt+wphAgUhanlxZYwveybbFFr8CNBR+arDK
         00HW7F9r9bZXNq5RYhl80DVmg2gJruLcxyptRc8305PbYsSPeFyH7hqF8RDM7XCXapJm
         QQGy3gQYODFweArpphI95wSOEEDVRndy3vQsg+Cd9He9lw6MJw0YMsXMTOtm+lUdAeHw
         cRESqqJ54P2FqV4GIXG+XFyrAJqAnvlOqua7GF6t0Me+dVl7a5CG+9m5gSkNB5yEmzxR
         jVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602721; x=1775207521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAO6rB0RbVFlGErOM6Fb1ryUWRGmDL5KJlHZYhjSUZg=;
        b=A3Vy/FuYb6a/LQV33Jlz+dOWvxRQF8EB1CM4w9OSON79uiIukugWxpmrZ7jQGDWFfa
         CYjy5URSh8nS3yE7EM76EPvmX8sqPDJjbiMJDnV4DpMrAYL479mgMhh12+wWbh5hxgLm
         6crX20Zpm60n6vdF7cFP8W/0foa8qkM6SnKghtCC3zFW+y4kdFLzjV5xP40j/3SA29yB
         BDOVlvaMAnP+wvq2Fb+MaMozLU+gpUe61vAZnXL+nbMMIWQYrdR930r9reVB0u9QMUjL
         6eGmuZzTPBnSPMBLGIn6MVIoYRdQo4ephOkEoiBarjPIIFYUS9QICB5ZZoundoM4kJlU
         oNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmmUqap+KdAbfa0rUyEmhQKKtgOWNimEFKn3sGDgLz/V8kwYtM/VuXtJdPONIqAhza5enzokXD9BbJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZVTQ0I8YOshuJ0D32Z77R/T4pFLNbzF5k4aod8gAOybIbAKd
	SRAuhjYn+nygZlRRGMgEWWhkLru9QUzmccHh/LcZrfKKnTZXKBS63pes
X-Gm-Gg: ATEYQzwEoVNl/UXDgQ8Nw3db+qWBD///LvYYPnQXIC7COgTfhGDY3wo/2YsNt97+G+I
	ArtYRS+LZcJv87mZcmN8MIYWDK0Wl7dAwF4FJ2ARepevfIR3fHemmw52ovhguEZN5NU5ohIveKS
	skvqkawB/fzlV8iht3o5U+srrpRTCvySO09ypK7UpP/oc0J25BmUm4aZ0lvl7QOsrx+eg/n+Yxp
	HxQ/y6zdEkXW0MwLIn3bM/vhitfA8JcqVXMC08Ax0tkKQ4fckc9+X9GGWfGriFzrqwD5HhUsrQd
	G1+1qL3Tc5WqICf+gbEB1Y69vhR30/hsSlDJDbswPArRwWCAILLPjOlBVucYMN+il1ZhFj5quay
	SN3NKBcD7kDpClsCXZ/G198zToYrAIqo4wlbq61VX78aQMxurSB70TpBN0VHP/li60hE/XYu3Kl
	WW3dyAusHgOL8tXCrXGmU2bpLCfTnGC5loy+f4H3k=
X-Received: by 2002:a05:6000:2dc3:b0:43b:4489:d456 with SMTP id ffacd0b85a97d-43b9ea10799mr2329230f8f.47.1774602721312;
        Fri, 27 Mar 2026 02:12:01 -0700 (PDT)
Received: from rock-3b.levillagebyca.com ([213.152.28.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm14001409f8f.17.2026.03.27.02.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:12:00 -0700 (PDT)
From: MidG971 <midgy971@gmail.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	jonas@kwiboo.se,
	Midgy BALON <midgy971@gmail.com>
Subject: [PATCH v6] arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock
Date: Fri, 27 Mar 2026 10:11:28 +0100
Message-Id: <20260327091128.2458-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Midgy BALON <midgy971@gmail.com>

The Radxa ROCK 3B uses a PI6C20100 PCIe reference clock buffer to
provide a 100MHz reference clock to the PCIe 3.0 PHY and controllers.
This chip is currently modeled only as a fixed regulator
(vcc3v3_pi6c_03), with no clock output representation.

The PI6C20100 is a clock generator, not a power supply. Model it
properly as a gated-fixed-clock, following the pattern established
for the Rock 5 ITX and other boards with similar PCIe clock buffer
chips.

The gated-fixed-clock node references the regulator as its vdd-supply,
allowing the regulator to be enabled on demand. Remove the
regulator-always-on and regulator-boot-on properties from vcc3v3_pi6c_03
since the clock framework will manage the regulator lifecycle via
vdd-supply. The pcie3x2 node is updated to include the pipe and
reference clocks, matching the approach used in rk3588-rock-5-itx.dts.

Assisted-by: Claude:claude-3-opus
Signed-off-by: Midgy BALON <midgy971@gmail.com>
---

Changes since v5:
 - Drop "(100MHz)" from clock node comment, already in clock-frequency (Jonas)
 - Drop redundant comment before vcc3v3_pi6c_03 (Jonas)
 - Remove regulator-always-on and regulator-boot-on from vcc3v3_pi6c_03 (Jonas)
 - Drop Reviewed-by (patch has functional changes since v3 review)

Changes since v4:
 - Fix From: line to match Signed-off-by (Heiko)

Changes since v3 [1]:
 - Add Reviewed-by from Shawn Lin

Changes since v2 [2]:
 - Fix AI attribution: use Assisted-by tag instead of Signed-off-by (Shawn)
 - Add missing pipe clock (CLK_PCIE30X2_PIPE_DFT) to pcie3x2 clocks
   override (Shawn, referencing David's patch [3])

Changes since v1 [4]:
 - Drop phy-supply approach entirely (Jonas, Shawn)
 - Model PI6C20100 as gated-fixed-clock instead
 - Wire reference clock to pcie3x2 controller
 - Follow pattern from rk3588-rock-5-itx.dts

[1] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
[2] https://lore.kernel.org/linux-rockchip/20260304132957.684616-1-midgy971@gmail.com/
[3] https://lore.kernel.org/linux-rockchip/d981fa84-bd05-ac9d-98ca-89ee47177829@rock-chips.com/T/#m6a8289609e6a60691d3c06358b6322c7aa5e43d1
[4] https://lore.kernel.org/linux-rockchip/20260213151452.535527-1-midgy971@gmail.com/

 .../boot/dts/rockchip/rk3568-rock-3b.dts      | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index 3d0c1ccfa..d7d85b090 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -56,7 +56,15 @@ led-0 {
 		};
 	};

-	/* pi6c pcie clock generator */
+	/* PI6C20100 PCIe reference clock buffer */
+	pcie30_refclk: pcie-clock-generator {
+		compatible = "gated-fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+		clock-output-names = "pcie30_refclk";
+		vdd-supply = <&vcc3v3_pi6c_03>;
+	};
+
 	vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -64,8 +72,6 @@ vcc3v3_pi6c_03: regulator-3v3-vcc-pi6c-03 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwren_h>;
 		regulator-name = "vcc3v3_pi6c_03";
-		regulator-always-on;
-		regulator-boot-on;
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <10000>;
@@ -545,6 +551,14 @@ &pcie30phy {
 };

 &pcie3x2 {
+	clocks = <&cru ACLK_PCIE30X2_MST>, <&cru ACLK_PCIE30X2_SLV>,
+		 <&cru ACLK_PCIE30X2_DBI>, <&cru PCLK_PCIE30X2>,
+		 <&cru CLK_PCIE30X2_AUX_NDFT>,
+		 <&cru CLK_PCIE30X2_PIPE_DFT>,
+		 <&pcie30_refclk>;
+	clock-names = "aclk_mst", "aclk_slv",
+		      "aclk_dbi", "pclk", "aux",
+		      "pipe", "ref";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie30x2m1_pins>;
 	reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;
--
2.30.2

