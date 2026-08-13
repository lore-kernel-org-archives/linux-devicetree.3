Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2469473C8C;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786622401; cv=none; b=JbX4KU7OIEEwTjVdWEh+6WoG8SPc254fink9vdxVjCiZXYGLaKBj1WHUWlWZQE3qlmF16EBvTR/mAUWIqajDadFPOhcc7U/DGwzUYxmTG/1r4oojYyA+maJ54/2+5YcqWQKi8S3eBmKFcZyftDFCdOZ1K8sC7D0TA//uL6ZqaN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786622401; c=relaxed/simple;
	bh=rAuUTuhk4arTff/ub+2xkJknpVOqCl6uqwl2q+e0uZc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgEtqhh1nI3F370zm9ySCqB7ONUJP5HArfxoA3A8ImypugRIJH0ZE2kKTL9FIcT06vaGqV9vvZaWh8OXEzs4rk2epBitqNeyXHbuEBLykOGRPlkLE3lIPuOE1j5kUtA/loaDsyOFol3paM0MNjG9xWEQyaZp8CZAooT5EWtjVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDTLL/gr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDTLL/gr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57E01C2BD01;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622400;
	bh=rAuUTuhk4arTff/ub+2xkJknpVOqCl6uqwl2q+e0uZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CDTLL/gr1So9I4/cCdLXlp0oyJFuhpj/N2CtoHB+1bhvJzPDp4pG7APAwNH1GNtDn
	 xtT6/ZjSPxwxTErTCYw1F2rC2k/etY89VpS0JrFosxzd3IlXfNjuVpjN8d8MBm9ACL
	 uDR8sveCpp7tAARnfmpSj1vxBH49BwliEnNPyo6oh+yYfc+MM4oze0WJx58kx6TY9s
	 T3lJa+MzxL4yBgzjl63EpB2Uxqpr2LeM293+UcGzEth1GabD5KsZ3LiQuZ8w/gWy22
	 rkhnba1Mu3qx2vy+PSlcpI3PYK2Ug3wj/pxYJDv9ZLb7Z4WV0h8d/Rqi9pluvEXRVb
	 T32IgLMo6bbpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33935C5CFEB;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:40 +0800
Subject: [PATCH v5 10/15] ARM: dts: aspeed: anacapa: Add LPDB fuse monitor
 GPIO expander
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-10-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=3733;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=iRt5dSDALZ6dumrYugDV1SM8iNqVZO1lxfanv1TXY2Q=;
 b=Rcpi1/hWJBtFFO983ci0PvRhB4Kf7s3+Vwvvx17PoSzpamxGe+SeVUlZawFIYbGG1p7o1uFHX
 qzZgAW53nUGAedIhMAIWmmhjlTOsXNJhbyYzEZjWYBakVTSYzCWfX/M
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Add PCA9554 GPIO expanders for PDB fuse monitor signals on the
Anacapa DVT board.

The patch adds GPIO expander definitions for both the left and
right PDBs under the i2c8 multiplexer and updates the associated
gpio-line-names to reflect the final signal assignments.

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


