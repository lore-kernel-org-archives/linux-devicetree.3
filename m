Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4A4C040D;
	Fri, 15 May 2026 16:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863864; cv=none; b=NcwFRkvitByLh3fFUaU3ztUiDGT1EpKwrPpMihu31/N8CdvrN4b/waJh4rH+KGJxrpUJspys3Cc72xAZMtTLUCrVD4+LyQN2Z6oXC21QWt/eWE//+v4x1hluH8luWFvJSh4fJ1vTsh7wbaM4NAEJI/kTtezLbwH8b2kMu4dCFR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863864; c=relaxed/simple;
	bh=BReUGgHoYTDJh7cSrs/u1F61XWcA/9TtEZBk5WoaNXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PugEnT8fn0BBth3xicH8jLpU7jdyYg0DY5LoHwG7cNBxmqxuEKmO0mJubduKuorH68/ST5h+ZaPXFd+pCKp3z2Uk6QGC1nKQH82AwNobj7H79mwl21vmbUtbP1dTsFgvSdhxxwVmCxPR+zeBxqeN+F18Y7no9Mrx/P24nviwPtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bY6tYAil; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bY6tYAil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DF7C2BCC7;
	Fri, 15 May 2026 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863863;
	bh=BReUGgHoYTDJh7cSrs/u1F61XWcA/9TtEZBk5WoaNXc=;
	h=From:To:Cc:Subject:Date:From;
	b=bY6tYAilDsW6nxBiun3BUTKPpj3Py8uxttjb0Mevx1dedsXLndxyHn6WOIqgWmitp
	 d8evHBewmLdlzF6aHgUt13fHWMcQuDDd5zojOxZ2Q4YfQNawRgP9x/eH89st45Tcgx
	 gs/2RighS00AW+67HuV+2itB+Cu46Ub6NRW/j0E5zFqiBNT2TsyPGMmDndkM/nOHvf
	 i3mgCeQaxbMkaB3RUxIfSE2sqcysBf06bOR+bwIi5UoJiHCG9xKhLODjcHm5a1rcQE
	 Y+448r7SFhDoQjiRsyGB1XTpZOg5eB3db95ao6wVC2+AIwEinahBuRuy2M5GPvnD4h
	 rcK+iLjIHKHUQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: microchip: remove redudant enabling of syscontroller
Date: Fri, 15 May 2026 17:50:42 +0100
Message-ID: <20260515-fetch-antennae-2eba5bf45593@spud>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4396; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=+j3Q+HJOMszU63lc/mKAVJp2ABWAuiZDnQ2FzIBLAgE=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFnsfo9Y/lRs1ZtZNpszsmHKs7BLO7b+WFn0MMTotOSn6 +vfK3n1dZSyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAin84z/OEROXSuaVaoANvT t04OfBJcFYVz7yx7k6pn1M0cvmRjqhvD/5T1bTssl5d+qnZcvTwyZ7HQVvlfG3ZeDDp1UFAky07 8OQcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The system controller is never disabled, there's no need to ever enable
it.

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
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts       | 1 -
 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts          | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts         | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts         | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts            | 4 ----
 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts            | 4 ----
 arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts   | 4 ----
 8 files changed, 29 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 7bbd400b71039..6d7037c9528dd 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -328,7 +328,6 @@ mmc@1 {
 
 &syscontroller {
 	microchip,bitstream-flash = <&sys_ctrl_flash>;
-	status = "okay";
 };
 
 &syscontroller_qspi {
diff --git a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
index f769c9d5d7b47..da2fcde263e3c 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
@@ -199,7 +199,3 @@ &spi0 {
 &spi1 {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index 7816408343a32..a11e3103b8f25 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -238,10 +238,6 @@ &spi1 {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &syscontroller_qspi {
 	/*
 	 * The flash *is* there, but Icicle kits that have engineering sample
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
index 86234968df486..973e34b74be44 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
@@ -179,10 +179,6 @@ &spi1 {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
index 510d59153cd07..cad0871a62a5d 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -112,7 +112,3 @@ &refclk {
 &rtc {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
index 8f1908a105671..46ded8a4fc363 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
@@ -149,10 +149,6 @@ &rtc {
 	status = "okay";
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "otg";
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
index bc15530a2979b..c6950410e918a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -171,10 +171,6 @@ flash@0 {
 	};
 };
 
-&syscontroller {
-	status = "okay";
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "host";
diff --git a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
index ef5bff3093fc3..180fd8891903c 100644
--- a/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
+++ b/arch/riscv/boot/dts/microchip/pic64gx-curiosity-kit.dts
@@ -170,7 +170,3 @@ &refclk {
 &rtc {
 	status = "okay";
 };
-
-&syscontroller {
-	status = "okay";
-};
-- 
2.53.0

