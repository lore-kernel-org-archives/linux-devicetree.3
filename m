Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE63DB99A;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406704; cv=none; b=BF1TYgD1eF5M+WY4PYMXpIbRM2s5ZqJtfbdEhttsqzFT/G1h52tfjT86nV52vOAjzKvO9dTfagTHCzFjrxCI7SYz41b2X0wE9am8FCuU3mWNk3C0g2dSr+KpIketbJBuHF/NCHxF9iYxlkxBli2F0h0k26/8/OO21mYAOpd0KvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406704; c=relaxed/simple;
	bh=KXlTSNgL7obcfAAu2qQszrvsiNWFTE6hySuQAhmN6t4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrSj74tMN1pMAYqkMYhi0LCpQiJttojtYjAGpMWF0gVrXwL7Wm0Ozxh69j9VubdTNC45hRF+4nh5jO18FQZukp+9Ht1trZXCVjZlZVqHDUt87dElpGjlS/Y2ddvZbCw4jGBJHlJ/QGa63cimnj4gntMR5eg8fQeWPmH1jJr0fv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCCLIBgU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCCLIBgU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8D25C2BCC7;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780406704;
	bh=KXlTSNgL7obcfAAu2qQszrvsiNWFTE6hySuQAhmN6t4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OCCLIBgU7SDRJ5uvr0/7to+jOC3wXfax7eHfi1ohTBeHCZUJvl1bEyXVRnNEFHRaT
	 T7Noz5ghUpTLMRpOO4ZOtgcHPCUXl7Mri/75PjGsIpvHfYHhV5Ze5U7Vrp87PHw+qv
	 eedVKIJ9OWyiW+VKczhZXn59Plaic7jcG5qxZx1yMvkqcscnHkiUuj6MEDe2C1/2eu
	 v2+7b9X2ihzG0CSSbNgLqk4yTEzm15FLBhzFEZHXuQPphQiQUrpeZR7dvuozEJKdpk
	 KmQtxkxbmEKHlUwenZLsUvytur1K77w0RVDzW0UaqZ8PWCm9EBM1e+EGE9LK/I/oxH
	 QK0hF7m7BqoXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9843CCD6E69;
	Tue,  2 Jun 2026 13:25:04 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 02 Jun 2026 21:24:58 +0800
Subject: [PATCH v3 3/9] ARM: dts: aspeed: anacapa: add EVT2 devicetree
 inheriting EVT1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-anacapa-devlop-phase-devicetree-v3-3-7c93c5df8d9b@gmail.com>
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
In-Reply-To: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780406700; l=5864;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=uFd3k24VxEypaHLespXpLRjwFFWss5Y43arELHuz9Hk=;
 b=IGP+iwYoH8nNBTlhrnVf3e6Q8EdQ+EObT8CXIpcKo8f0tIyghQWm+WP3fgr7aKGBibkBfcub4
 3jYd4pPkaTJDiXkaMD+W8G1UbuNtG3iPvAj5j6R5O/0ugYIT0/9e1ZD
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Colin Huang <u8813345@gmail.com>

Add a development-phase devicetree for the Facebook Anacapa BMC EVT2
hardware revision and update the Anacapa wrapper DTS to reference
it.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 178 +++++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     |   2 +-
 2 files changed, 179 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
new file mode 100644
index 000000000000..4a6ae7c6cbf8
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/dts-v1/;
+#include "aspeed-bmc-facebook-anacapa-evt1.dts"
+
+/ {
+	model = "Facebook Anacapa BMC";
+	compatible = "facebook,anacapa-bmc-evt2", "aspeed,ast2600";
+};
+
+&sgpiom0 {
+	ngpios = <128>;
+	bus-frequency = <2000000>;
+	gpio-line-names =
+	/*in - out */
+	/* A0-A7 line 0-15 */
+	"L_FNIC_FLT", "FM_CPU0_SYS_RESET_N",
+	"L_BNIC0_FLT", "CPU0_KBRST_N",
+	"L_BNIC1_FLT", "FM_CPU0_PROCHOT_trigger_N",
+	"L_BNIC2_FLT", "FM_CLR_CMOS_R_P0",
+	"L_BNIC3_FLT", "Force_I3C_SEL",
+	"L_RTM_SW_FLT", "SYSTEM_Force_Run_AC_Cycle",
+	"", "",
+	"", "",
+
+	/* B0-B7 line 16-31 */
+	"Channel0_leakage_EAM3", "FM_CPU_FPGA_JTAG_MUX_SEL",
+	"Channel1_leakage_EAM0", "FM_SCM_JTAG_MUX_SEL",
+	"Channel2_leakage_Manifold1", "FM_BRIDGE_JTAG_MUX_SEL",
+	"Channel5_leakage_present_EAM1", "FM_CPU0_NMI_SYNC_FLOOD_N",
+	"Channel4_leakage_Manifold2", "BMC_AINIC0_WP_R2_L",
+	"Channel5_leakage_EAM1", "BMC_AINIC1_WP_R2_L",
+	"Channel6_leakage_CPU_DIMM", "CPLD_BUF_R_AGPIO330",
+	"Channel7_leakage_EAM2", "CPLD_BUF_R_AGPIO331",
+
+	/* C0-C7 line 32-47 */
+	"RSVD_RMC_GPIO3", "RTM_MUX_L",
+	"LEAK_DETECT_RMC_N", "RTM_MUX_R",
+	"HDR_P0_NMI_BTN_BUF_R_N", "FPGA_JTAG_SCM_DBREQ_N",
+	"Channel6_leakage_present_CPU_DIMM", "whdt_sel",
+	"", "JTAG_CPLD_TRST_R_N",
+	"", "",
+	"", "",
+	"", "",
+
+	/* D0-D7 line 48-63 */
+	"Channel0_leakage_present_EAM3", "",
+	"Channel1_leakage_present_EAM0", "",
+	"Channel2_leakage_present_Manifold1", "",
+	"Channel4_leakage_present_Manifold2", "",
+	"AMC_BRD_PRSNT_CPLD_L", "",
+	"Channel7_leakage_present_EAM2", "",
+	"", "",
+	"", "",
+
+	/* E0-E7 line 64-79 */
+	"L_PRSNT_B_FENIC_R2_N", "",
+	"L_PRSNT_B_BENIC0_R2_N", "",
+	"L_PRSNT_B_BENIC1_R2_N", "",
+	"L_PRSNT_B_BENIC2_R2_N", "",
+	"L_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* F0-F7 line 80-95 */
+	"R_PRSNT_B_FENIC_R2_N", "SGPIO_READY",
+	"R_PRSNT_B_BENIC0_R2_N", "",
+	"R_PRSNT_B_BENIC1_R2_N", "",
+	"R_PRSNT_B_BENIC2_R2_N", "",
+	"R_PRSNT_B_BENIC3_R2_N", "",
+	"", "",
+	"", "",
+	"", "",
+
+	/* G0-G7 line 96-111 */
+	"L_PRSNT_EDSFF0_N", "",
+	"L_PRSNT_EDSFF1_N", "",
+	"R_PRSNT_EDSFF2_N", "",
+	"R_PRSNT_EDSFF3_N", "",
+	"HPM_EDSFF_PG", "",
+	"", "",
+	"", "FM_BMC_READY_PLD",
+	"PRSNT_NFC_BOARD_R", "",
+
+	/* H0-H7 line 112-127 */
+	"R_FNIC_FLT", "",
+	"R_BNIC0_FLT", "",
+	"R_BNIC1_FLT", "",
+	"R_BNIC2_FLT", "",
+	"R_BNIC3_FLT", "",
+	"R_RTM_SW_FLT", "",
+	"", "",
+	"", "",
+
+	/* I0-I7 line 128-143 */
+	"EAM0_BRD_PRSNT_R_L", "",
+	"EAM1_BRD_PRSNT_R_L", "",
+	"EAM2_BRD_PRSNT_R_L", "",
+	"EAM3_BRD_PRSNT_R_L", "",
+	"FM_TPM_PRSNT_R_N", "",
+	"PDB_L_PRSNT_R_N", "",
+	"PRSNT_EDSFF_BOOT_N", "",
+	"PRSNT_CPU0_N", "",
+
+	/* J0-J7 line 144-159 */
+	"PRSNT_L_BRIDGE_R", "",
+	"PRSNT_R_BRIDGE_R", "",
+	"BRIDGE_L_MAIN_PG_R", "",
+	"BRIDGE_R_MAIN_PG_R", "",
+	"BRIDGE_L_STBY_PG_R", "",
+	"BRIDGE_R_STBY_PG_R", "",
+	"IRQ_NFC_BOARD_R", "",
+	"RSMRST_N", "",
+
+	/* K0-K7 line 160-175 */
+	"ADC_I2C_ALERT_N", "",
+	"TEMP_I2C_ALERT_R_L", "",
+	"CPU0_VR_SMB_ALERT_CPLD_N", "",
+	"COVER_INTRUDER_R_N", "",
+	"HANDLE_INTRUDER_CPLD_N", "",
+	"IRQ_MCIO_CPLD_WAKE_R_N", "",
+	"APML_CPU0_ALERT_R_N", "",
+	"PDB_ALERT_R_N", "",
+
+	/* L0-L7 line 176-191 */
+	"L_EDSFF0_PG", "",
+	"L_EDSFF1_PG", "",
+	"R_EDSFF2_PG", "",
+	"R_EDSFF3_PG", "",
+	"HPM_CPLD_HEART_BIT", "",
+	"RBB_CPLD_HEART_BIT", "",
+	"LBB_CPLD_HEART_BIT", "",
+	"FM_BIOS_POST_CMPLT_R_N", "",
+
+	/* M0-M7 line 192-207 */
+	"EAM0_SMERR_CPLD_R_L", "",
+	"EAM1_SMERR_CPLD_R_L", "",
+	"EAM2_SMERR_CPLD_R_L", "",
+	"EAM3_SMERR_CPLD_R_L", "",
+	"CPU0_SMERR_N_R", "",
+	"CPU0_NV_SAVE_N_R", "",
+	"PDB_PWR_LOSS_CPLD_N", "",
+	"IRQ_BMC_SMI_ACTIVE_R_N", "",
+
+	/* N0-N7 line 208-223 */
+	"AMCROT_BMC_S5_RDY_R", "",
+	"AMC_RDY_R", "",
+	"AMC_STBY_PGOOD_R", "",
+	"CPU_AMC_SLP_S5_R_L", "",
+	"AMC_CPU_EAMPG_R", "",
+	"DIMM_PMIC_PG_TIMEOUT", "",
+	"EAM_MOD_PWR_GD_TIMEOUT", "",
+	"CPLD_AMC_STBY_PWR_EN", "",
+
+	/* O0-O7 line 224-239 */
+	"HPM_PWR_FAIL", "Port80_b0",
+	"FM_DIMM_IP_FAIL", "Port80_b1",
+	"FM_DIMM_AH_FAIL", "Port80_b2",
+	"AMC_THERMTRIP_ASSERT", "Port80_b3",
+	"CPU_THERMTRIP_ASSERT", "Port80_b4",
+	"PVDDCR_SOC_P0_OCP_L", "Port80_b5",
+	"CPLD_SGPIO_RDY", "Port80_b6",
+	"FM_MAIN_PWREN_RMC_EN_ISO", "Port80_b7",
+
+	/* P0-P7 line 240-255 */
+	"CPU0_SLP_S5_N_R", "NFC_VEN",
+	"CPU0_SLP_S3_N_R", "",
+	"FM_CPU0_PWRGD", "",
+	"PWRGD_RMC", "",
+	"FM_RST_CPU0_RESET_N", "RBB_CPLD_RISCV_RST",
+	"FM_PWRGD_CPU0_PWROK", "LBB_CPLD_RISCV_RST",
+	"AMC_FAIL", "HPM_CPLD_RISCV_RST",
+	"S0_ON", "";
+
+	status = "okay";
+};
+
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 209eef65cedb..1848ca347621 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -1,4 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
-#include "aspeed-bmc-facebook-anacapa-evt1.dts"
+#include "aspeed-bmc-facebook-anacapa-evt2.dts"
 

-- 
2.34.1


