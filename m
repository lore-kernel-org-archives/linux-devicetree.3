Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7C46EF94;
	Wed,  5 Aug 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934991; cv=none; b=HGiy/vWpXK3zxlTOxmrcMH64NBuR2DvdY1e49BKGU2Af+5VHdEHpD+ZB7e/RIsAhLThdLWstuItxXCd+ZxUs7/38hcygrGcsBXdAdzeAJYliyVuz4OQOK9CtjyV7REoK7Vt6Em1uXWMwSBDfnkpMat7TGqX35g/J2BYio1Z4jnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934991; c=relaxed/simple;
	bh=8axNV0qz+55gS2UiiJda4kv4M/AoCvvKFE19+hHj11I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mgv1o8O4XoG9Y4lcexdKABPBrngaFk8zXw3dHXbo5cpXLCtuR+uSl0xEe1BbGhRkp/zOpnqfMkpXDiB5rqcr5LZQOnMl4uI5fYTTu7x2CjWOarDMGdUV9eNygkQmrL5R2jy5S40U3JFkwT3Ark6IoG2juaN/KDxJcu0qdoIDuIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/EwwSmx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/EwwSmx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84EEBC32781;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=8axNV0qz+55gS2UiiJda4kv4M/AoCvvKFE19+hHj11I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S/EwwSmxwQD9OrzOJZ88LCvr5u572OasVBJ6eyuQF0fwbmM5lfnL3TmeGrJEMH2DC
	 lNPgxvvg6bksyJgJMNFVFqBche5eAaRObrw3WyMpebvXvQ9gl8xENuiy5I50uZfoUZ
	 4tfy5c9fYMwUhyqtNyj3V/WDSTlcI5M+tTspph7OZPYr+MnEka9ifrfaXBS93ELdc3
	 0yIY45xEfOvRCse8o9E8LKOO/Hgz5Tk24VX9Fw3oqBLLgso4jFiBtRmwbQG8497gAJ
	 EYtZgkseLCDdeCcJKdfRU5Rh9wE6E8Tq3XsVAJAchOGpnC/HHZ9KvtlEDxmDztRo8Q
	 deJtW3DRBfHOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BA7C56205;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:38 +0800
Subject: [PATCH v4 10/12] ARM: dts: aspeed: anacapa: Add LPDB fuse monitor
 GPIO expander
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-10-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=3520;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=kGTVHDij4WGDqWe9Tp6hUO68XWQC9ip/+ELRTxuQLWs=;
 b=T/R1BvgIP4u03YPyUa5vxerDdM8cZYUmxK8T/yWCFavVndMWWIftCzROXI1hq0pEQ58entGwE
 bX4b0pYVUkXC+4HGEYJwM6VZWGqp4R8MIG4r8v/+KpjYC9i6xteKpUz
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Add the PCA9554 GPIO expander for PDB fuse monitor signals.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
index 0eb547ad0ec1..f09dd1abe77d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts
@@ -8,6 +8,93 @@ / {
 	compatible = "facebook,anacapa-bmc-dvt", "aspeed,ast2600";
 };
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c8mux0ch0: i2c@0 {
+			gpio@22 {
+				gpio-line-names =
+					"RPDB_FAN_FULL_SPEED_R_N", "RPDB_I2C_TMP432_U8_ALERT_R_N",
+					"RPDB_I2C_TMP432_U29_ALERT_R_N", "RPDB_GLOBAL_WP",
+					"RPDB_FAN_CT_FAN_FAIL_R_N", "RPDB_VERID_A0",
+					"RPDB_VERID_A1", "RPDB_VERID_A2",
+					"RPDB_ALERT_P50V_HSC2_R_N", "RPDB_ALERT_P50V_HSC3_R_N",
+					"RPDB_ALERT_P50V_HSC4_R_N", "RPDB_ALERT_P50V_STBY_R_N",
+					"RPDB_P12V_MB_VRM_ALERT_R_N",
+					"RPDB_P12V_STBY_VRM_ALERT_R_N",
+					"RPDB_PGD_P3V3_STBY_PWRGD_R",
+					"RPDB_P12V_STBY_VRM_PWRGD_BUF_R";
+			};
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"RPDB_SKU_ID0", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+			gpio@38 {
+				compatible = "nxp,pca9554";
+				reg = <0x38>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+					"RPDB_P50V_FUSE2_TVS1", "RPDB_P50V_FUSE2_TVS2",
+					"RPDB_P50V_FUSE3_TVS1", "RPDB_P50V_FUSE3_TVS2",
+					"RPDB_P50V_FUSE4_TVS1", "",
+					"", "";
+			};
+		};
+		i2c8mux0ch1: i2c@1 {
+			gpio@22 {
+				gpio-line-names =
+					"LPDB_FAN_FULL_SPEED_R_N", "LPDB_I2C_TEMP75_U8_ALERT_R_N",
+					"LPDB_I2C_TMP432_U29_ALERT_R_N", "LPDB_GLOBAL_WP",
+					"LPDB_FAN_CT_FAN_FAIL_R_N", "LPDB_VERID_A0",
+					"LPDB_VERID_A1", "LPDB_VERID_A2",
+					"LPDB_ALERT_P50V_HSC0_R_N", "LPDB_ALERT_P50V_HSC1_R_N",
+					"LPDB_ALERT_P50V_HSC5_R_N", "LPDB_I2C_P12V_SW_VRM_ALERT_R_N",
+					"LPDB_EAM0_PRSNT_MOS_N_R", "LPDB_EAM1_PRSNT_MOS_N_R",
+					"LPDB_PWRGD_P50V_HSC5_SYS_R", "BARKLIP_PRSNT_N_R3";
+			};
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG", "LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG", "LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG", "LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R", "LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R", "LPDB_FAN4_PRSNT_N_R",
+					"LPDB_SKU_ID0", "",
+					"", "",
+					"", "LPDB_PG_P3V3_R";
+			};
+			gpio@38 {
+				compatible = "nxp,pca9554";
+				reg = <0x38>;
+				gpio-controller;
+				#gpio-cells = <2>;
+
+				interrupt-parent = <&sgpiom0>;
+				interrupts = <174 IRQ_TYPE_LEVEL_LOW>;
+
+				gpio-line-names =
+					"LPDB_P50V_FUSE0_TVS1", "LPDB_P50V_FUSE0_TVS2",
+					"LPDB_P50V_FUSE1_TVS1", "LPDB_P50V_FUSE1_TVS2",
+					"LPDB_P50V_FUSE5_TVS1", "",
+					"", "";
+			};
+		};
+	};
+};
+
 &sgpiom0 {
 	ngpios = <128>;
 	bus-frequency = <2000000>;

-- 
2.34.1


