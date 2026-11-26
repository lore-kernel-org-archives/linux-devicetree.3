Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685088;
	b=fxfsHtkL48Q5SN/T9/T+WH2mIPCqML45RK9d6y9vXAl8IrIoZv8UZtsNAYoTPGxjJ6le
	 E5ekpRLIx8llmhZBVUtkImWimhHd42/IZ8zv3Yc1/icBdyQblQ+yU9XIVaa0pLaNgz5Vc
	 dANDtmwoSEsGlMGLXPY7bLPbx/O90fq9mHk5SUglqtX69JfRuF42PM+dxQcbsvyh78Cfh
	 +lkh8/elCEaB0/GIIJ+7lLmuMDNI8zSpawYrJ3bqhy+ykEKg7A0zNmeDhXxk1XiF2iRO/
	 PWG9E8/u6cKA9M5q28jbwqj9bMwTUYK7IbRoFAHyWQjY0s6rsbim+krdcLeurcFeWAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685088;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fZkKn5vSQtlxkzbTPbIyQnm09780zoVYrW7t+kh9CQk=;
	b=2WtHBnV4shw+U5KST9AzDpoptl5bAte877wIjWKpWVbFYH5L5mLzlQGsUBM8OZbZp7yD
	 op2JM5rZDNbHgxvuTJON9GVMRd3WZUJvD8warChLEbB0UpMBjznlMMvNzcZVNsmwBLk9P
	 BYKaxQckLAlWbfH4JlJBMN/qRKlALbPvb0bLFdKAGjylQ1w6XLu9KPaXH+55h/t/wlT6T
	 Gx0j88jBjRriFqUYG9q03iFMWui8WOIm7l78oCCUY2XwqLWiK4Q++jrKP/2VrBmVRa200
	 VURXaB+8XRQTg4Zu8YXKLtSdx3RLe629Erav27HgsFn6Au71fMQCZOJhp8n0DCDVT8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1e8DjRh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816E6606A335;
	Thu, 26 Nov 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I1e8DjRh
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685087;
	b=Ct1RwUWlAuoZaZnh+l5kv9kMN5q//r4QDhnFq8nLCvspt2cxoXxlXtG+Icta3MYwXHgT
	 3Wxm7/U9s/BOoxVUzT9WhqKxgvn9VMYCuRjyzyJpf4BRhxpC1+40X1AYo7R/gplB5ZZEU
	 1DKCmaYlt4cIKEEUOXaWqBlYyxfiqeD0vhWQpnhAxAamz/AvWRAHI8p+sgRHTwH1Nr4T6
	 lHe6kCXlcTeY9dvY8+lhrsQi6ZT4lRkhGaSczpWX0GS4VyQCUrtITDEXuDR46iWYNwiZ5
	 6cnQ3iuvsc9opaI+rUifivVNnyn2XxdYM6tKy1w+T3is3/cVyHgc923TTzzj0hJ9bxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685087;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fZkKn5vSQtlxkzbTPbIyQnm09780zoVYrW7t+kh9CQk=;
	b=gvMEgyNgwwiSH62bqse+j9QAm1OpqEHMT0V5ISYKKF2i0BvOwWbmE1xxqasx3kU3GDr3
	 KESWhjCvjItNk28kUHdiTRk7aqnEOFN028/guJ3M98S+8YSthU2L5IIe8mSczWW38T/hU
	 tzVV/Z/AdawZsquAOQLhp3yPqGtBMdbFKr2zQGiJuFmzL0SZmP5h4tSsiKDraVqVtMYiR
	 3UVQBD99sJROE0fMa7DDvUSnOGowS81QayHC+FtaczMrFCEnG0M7s3b9Tc1gDJ6W2iEOS
	 UEm/oSzCwuMBKePxmzloZibLaExOCjrEB2eYmBDN/piNrB+n5kZuBsvT0UMtuT4sX7g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E2EC1F000D1;
	Thu, 26 Nov 2026 09:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685087;
	bh=fZkKn5vSQtlxkzbTPbIyQnm09780zoVYrW7t+kh9CQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I1e8DjRhhtjQ+pohZm8tlKT8GqGWzdAzVerWa9kElmKr/K2jAbBfHHqlFW0EQoINJ
	 NcrsuDnN70TptuO5jcua7iAeJikxKOpGi4+0SU7NPaFXj4FX9Li02upkqH4Nnknoh5
	 FitOZ/LF8vm5URTUaICmMy5d4AciOWB+1piaZGi/unMJj0jD/PKBMfzMD6S4RY30f9
	 R+cEAsc7FXoVwViLFuBscbSbyjx7NQoYKgVpUxUvBnxKTb76BZS9TYTun6qxO+8yWY
	 lonma0k8R6AcCabEtan9E1RlNKnJYRFUpIZ5mtN7/2sI4l/C8XDFPysV92pfdtSR0r
	 dEgXppQht8wyA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F18E84D35D;
	Thu, 26 Nov 2026 09:24:34 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:24:19 +0000
Subject: [PATCH RESEND v2 3/3] arm64: dts: amlogic: a9: Add reset
 controller support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-a9-reset-v2-3-e3d850e68725@amlogic.com>
References: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
In-Reply-To: <20261126-a9-reset-v2-0-e3d850e68725@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685071; l=9265;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=KPSKiieHlM8NwRcOZLlCGxmJILcSIOkleC7MDSDlDD4=;
 b=PgvBwYfMLvc1mZcW4Ro+oFADF7fHfQ/0JD7K1Ypd9E/LTtThUL/EnVZ+RtOZYS8NC37CJDD2I
 av30lAbQ6y4CJEtU+pD3kgI2FtFJDnTwcfEXpeDkXKkAQu/jWM1VNiC
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add reset controller descriptions for the Amlogic A9 SoC and include the
corresponding reset IDs header.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h | 247 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi    |  14 ++
 2 files changed, 261 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
new file mode 100644
index 000000000000..55fcaa54cd56
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h
@@ -0,0 +1,247 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved.
+ * Author: Zelong Dong <zelong.dong@amlogic.com>
+ *
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_A9_RESET_H
+
+/* AO RESET0 */
+#define AO_RESET_APB				0
+#define AO_RESET_RTC				1
+#define AO_RESET_BRG_NIC_RTC			2
+#define AO_RESET_AO2EE				3
+#define AO_RESET_BRG_NIC_EE			4
+#define AO_RESET_WATCHDOG			5
+#define AO_RESET_I3C				6
+#define AO_RESET_PWR				7
+#define AO_RESET_PWM_A				8
+#define AO_RESET_PWM_B				9
+#define AO_RESET_PWM_C				10
+#define AO_RESET_PWM_D				11
+#define AO_RESET_PWM_E				12
+#define AO_RESET_PWM_F				13
+#define AO_RESET_PWM_G				14
+#define AO_RESET_I2C_M_A			15
+#define AO_RESET_I2C_M_B			16
+#define AO_RESET_I2C_M_C			17
+#define AO_RESET_I2C_M_D			18
+#define AO_RESET_IR				19
+#define AO_RESET_UART_B				20
+#define AO_RESET_UART_C				21
+#define AO_RESET_UART_D				22
+#define AO_RESET_SPISG				23
+#define AO_RESET_SED				24
+#define AO_RESET_CEC				25
+#define AO_RESET_AOCPU				26
+#define AO_RESET_AOCPU_POR			27
+#define AO_RESET_AOCPU_CORE			28
+#define AO_RESET_SRAM				29
+#define AO_RESET_CAPU				30
+#define AO_RESET_UART_E				31
+
+/* RESET0 */
+#define RESET_ETH_1G				0
+#define RESET_ISP				1
+#define RESET_U3DRD_USB3PHY_APB			2
+#define RESET_U3DRD_USB3PHY			3
+#define RESET_U3DRD_USB2PHY			4
+#define RESET_U3DRD				5
+#define RESET_U3DRD_COMB			6
+#define RESET_U3DRD_USB2PHY_APB			7
+#define RESET_DP_PHY_APB			8
+#define RESET_DP_PHY				9
+#define RESET_DPTX_1P4				10
+#define RESET_DPTX_1P4_APB			11
+#define RESET_EDPTX_1P4				12
+#define RESET_USB2DRD_PHY_APB			13
+#define RESET_U2DRD_COMB			14
+#define RESET_U2DRD				15
+#define RESET_HDMI20_AES			16
+#define RESET_HDMITX_CBUS_APB			17
+#define RESET_BRG_VCBUS_DEC			18
+#define RESET_VCBUS				19
+#define RESET_VID_PLL_DIV			20
+#define RESET_VDI6				21
+#define RESET_HDMITXPHY				22
+#define RESET_VID_LOCK				23
+#define RESET_VENC_2				24
+#define RESET_VDAC				25
+#define RESET_VENC_1				26
+#define RESET_VENC_0				27
+#define RESET_RDMA				28
+#define RESET_HDMITX				29
+#define RESET_VIU				30
+#define RESET_VENC				31
+
+/* RESET1 */
+#define RESET_AUDIO				32
+#define RESET_MALI_CBUS_APB			33
+#define RESET_MALI				34
+#define RESET_PCIE_B_PHY			35
+#define RESET_PCIE_B_POR			36
+#define RESET_DOS_CBUS_APB			37
+#define RESET_DOS				38
+#define RESET_MALI_SYS				39
+#define RESET_CC				40
+#define RESET_DSP_A_DEBUG			41
+#define RESET_PCIE_A_PHY_APB			42
+#define RESET_PCIE_A_PIPE			43
+#define RESET_PCIE_A_POR			44
+#define RESET_PCIE_A_PHY			45
+#define RESET_PCIE_A_MAC_APB			46
+#define RESET_AMFC_APB				47
+#define RESET_ETH				48
+/*						49 */
+#define RESET_MALI_MBIST			50
+#define RESET_ETH_1G_AXI			51
+#define RESET_VICP				52
+#define RESET_DEWARP				53
+#define RESET_GE2D				54
+#define RESET_VGE				55
+#define RESET_PCIE_A_0				56
+#define RESET_PCIE_A_1				57
+#define RESET_PCIE_A_2				58
+#define RESET_PCIE_A_3				59
+#define RESET_PCIE_A_4				60
+#define RESET_PCIE_A_5				61
+#define RESET_PCIE_A_6				62
+#define RESET_PCIE_A_7				63
+
+/* RESET2 */
+#define RESET_AM2AXI				64
+#define RESET_DSP_A				65
+#define RESET_MIPI_DSI_PHY			66
+#define RESET_TS_PLL				67
+#define RESET_TS_A55				68
+#define RESET_ETH_AXI				69
+#define RESET_TS_CORE				70
+#define RESET_MIPI_DSI1_PHY			71
+#define RESET_SMART_CARD			72
+#define RESET_SPISG				73
+#define RESET_TS_DOS				74
+#define RESET_U2DRD_USB2PHY			75
+#define RESET_PIO				76
+#define RESET_U2H_COMB				77
+#define RESET_U2H				78
+#define RESET_USB2H_PHY_APB			79
+#define RESET_MSR_CLK				80
+/*						81 */
+#define RESET_AUX_DIG				82
+/*						83 */
+#define RESET_U2H_USB2PHY			84
+#define RESET_U3HSG_PCIE_PIPE			85
+#define RESET_AMFC				86
+#define RESET_U3HSG_PCIE_PHY_APB		87
+#define RESET_U3HSG_PCIE_PHY			88
+#define RESET_PP_DMA				89
+#define RESET_I3C				90
+#define RESET_WATCHDOG				91
+#define RESET_PP_WRAPPER			92
+#define RESET_MIPI_DSI_HOST			93
+#define RESET_DSI_PLL_DIV			94
+#define RESET_MIPI_DSI_B_HOST			95
+
+/* RESET3 */
+/*						96 */
+#define RESET_HDMIRX_WRAP_APB			97
+#define RESET_HDMIRX				98
+#define RESET_PCIE_B_0				99
+#define RESET_PCIE_B_1				100
+#define RESET_PCIE_B_2				101
+#define RESET_PCIE_B_3				102
+#define RESET_PCIE_B_4				103
+#define RESET_PCIE_B_5				104
+#define RESET_PCIE_B_6				105
+#define RESET_PCIE_B_7				106
+#define RESET_PCIE_B_PIPE			107
+#define RESET_PCIE_B_MAC_APB			108
+#define RESET_NNA_TO_VGA_PIPE			109
+#define RESET_CVE				110
+#define RESET_GLOBAL_TIMER			111
+#define RESET_COMBO_DPHY_PCLK			112
+#define RESET_COMBO_DPHY			113
+/*						114 - 118 */
+#define RESET_U3PHY30_APB			119
+#define RESET_U3PHY30				120
+#define RESET_HSG				121
+#define RESET_U3HSG_HSG				122
+#define RESET_U3DRDB				123
+#define RESET_U3DRDB_APB			124
+#define RESET_U3PHY20_APB			125
+#define RESET_U3PHY20				126
+#define RESET_A55_ACE				127
+
+/* RESET4 */
+#define RESET_CAN_0				128
+#define RESET_CAN_1				129
+#define RESET_TAHOE_CORE			130
+#define RESET_TAHOE				131
+#define RESET_TAHOE_APB				132
+#define RESET_TAHOE_SYS				133
+/*						134 - 135 */
+#define RESET_PWM_I				136
+#define RESET_PWM_J				137
+#define RESET_UART_A				138
+/*						139 - 143 */
+#define RESET_MALI_AVBCD			144
+#define RESET_MALI_AVBCD_APB			145
+#define RESET_MALI_MCR_TOP			146
+#define RESET_I2C_M_E				147
+#define RESET_I2C_M_F				148
+#define RESET_I2C_M_G				149
+#define RESET_I2C_M_H				150
+#define RESET_I2C_M_I				151
+#define RESET_SD_EMMC_A				152
+#define RESET_SD_EMMC_B				153
+#define RESET_SD_EMMC_C				154
+#define RESET_UART_F				155
+#define RESET_PWM_N				156
+#define RESET_PWM_M				157
+#define RESET_PWM_L				158
+#define RESET_PWM_K				159
+
+/* RESET5 */
+#define RESET_BRG_ISP_PIPE			160
+#define RESET_BRG_HEVCF_DMC_PIPE		161
+#define RESET_BRG_HEVCB_PIPE			162
+#define RESET_BRG_EMMC_PIPE			163
+#define RESET_BRG_VGE_PIPE			164
+#define RESET_BRG_DMC_VPU1_PIPE			165
+#define RESET_BRG_DMC_VPU0_PIPE			166
+#define RESET_BRG_NNA_PIPE			167
+#define RESET_BRG_NNA_SRAM_PIPE			168
+#define RESET_BRG_U2DRDA_PIPE			169
+#define RESET_BRG_U3DRDA_PIPE			170
+/*						171 - 173 */
+#define RESET_BRG_NIC_AOSYS			174
+#define RESET_BRG_NIC_AMFC			175
+#define RESET_BRG_NIC_GIC			176
+#define RESET_BRG_SRAM_NIC_NNA			177
+#define RESET_BRG_SRAM_NIC_MAIN			178
+#define RESET_BRG_SRAM_NIC_ALL			179
+#define RESET_BRG_NIC_SOC_BRG			180
+#define RESET_BRG_NIC_GPV			181
+#define RESET_BRG_NIC_AO			182
+#define RESET_BRG_NIC_EMMC			183
+#define RESET_BRG_NIC_DSP_A			184
+#define RESET_BRG_NIC_SDIO_B			185
+#define RESET_BRG_NIC_SDIO_A			186
+#define RESET_BRG_NIC_VAP_B			187
+#define RESET_BRG_NIC_DSU			188
+#define RESET_BRG_NIC_CLK81			189
+#define RESET_BRG_NIC_MAIN			190
+#define RESET_BRG_NIC_ALL			191
+
+/* RESET6 */
+/*						192 - 216 */
+#define RESET_BRG_PP_CLK			217
+#define RESET_BRG_PP_NIC_CLK81			218
+/*						219 - 220 */
+#define RESET_BRG_PERIPH_APB_SYNC		221
+#define RESET_BRG_VPU_APB_SYNC			222
+#define RESET_BRG_DSP_A_PIPE			223
+
+#endif
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..fedde52c2e89 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include "amlogic-a9-reset.h"
 
 / {
 	interrupt-parent = <&gic>;
@@ -105,6 +106,13 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,a9-reset",
+					     "amlogic,t7-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-a9";
 				#address-cells = <2>;
@@ -204,6 +212,12 @@ aobus: bus@ffa00000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffa00000 0x0 0x100000>;
 
+			ao_reset: reset-controller@2000 {
+				compatible = "amlogic,a9-ao-reset";
+				reg = <0x0 0x2000 0x0 0xc>;
+				#reset-cells = <1>;
+			};
+
 			aobus_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,pinctrl-a9";
 				#address-cells = <2>;

-- 
2.52.0


