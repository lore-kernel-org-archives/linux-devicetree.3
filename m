Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795813184;
	b=tT8B0oJFKSVN7bkVAKtACM9xydEqieBFUy3O3j6huapyG70dNVoWc3yA6T7/wzbx+npX
	 jMz9Cz70oV8X07R5Z8AiXBY4m3DSnDjro3tmtz8Ej+rP2luDwTA1/t1Ztw5ZEnRJkodg+
	 pIxgUryjgp6CyA508OSRKHVBb6RGR0/czpJ5rH3VCEVO1NOG9K686FHp4NGQ7QbXfkKAK
	 uEmgxZJbxm2KDzxsiYdgeMUGKD+bcAO3AB+uYUmZqdRM5cDkunJv67jN6sZOLNttxmj+k
	 T0Cc8ThreiTeAl/IhYBXn/GbzpCuNTS/PUlgUQuSEGedDPGI2n7kubf0KmiMasWe6pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813184;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	b=4nn1Gv8zfk/S8VrFYQyviCckPxZLa1hN0V0UiMBDncM3WcKuTVfV5PNSpE6kozLy+7vf
	 JrRjtdjzstGQxycBgJqxsLYtL+KR3zhgV4PQTqcR3yKcfh9SImEnZar2R8WrF/U8NkIZv
	 KD45KMcZWIyYFYkQrB3+4XcCWnT3wekZeoPBChmp4I5oGqlY3GKvN/ziWEVD0YmxtHfjK
	 nnMqyFx2ahESQD3JBlcufEdxAJeYYUrbgbVZINVfT/1wPgxELoXVTXwXdfBx/x1Dbkuvm
	 Ee0JJsstRD9mw1UBC+8TTDcOkFelNNHbxGTRjBPMEiNDrNMrDEFcDoqG+va1iODCC7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4AYB2rM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7E606A31E;
	Fri, 27 Nov 2026 20:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4AYB2rM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795813183;
	b=c9jFN/SEX1xkdEJnmM3KF2xrbAttZ+soTh1MR6MaoIzbXcaQD47Z6/1Sbs0m3+COyaGO
	 GhZU3YlrsikSEk0u/WCChTzVPe9G0nMMx8LiI8ZXRjT6mGWc/WlUCzL2rSwvcYX4UkAsI
	 jV2hiVa+wCBaZn1pW8nVeK1Wmhu6iFgUAkTqP0l8MzuRd3HRHr5Cov3utUXraZEJisomY
	 ejWMYWcHU1eFanOXGFn9tZ/5zETAB7anBjt957JSC0uXxYx0kO+KYcMPN/Q/MK0TjSXG/
	 li7yMiiBDJWh3/m6R7+eCUI2bcnWISXTnJ6R0/WrbrOF14A8dr3+i0TLymL1EXl0XhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795813183;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	b=ktrxKLHAsvxjMR3BnkHNRklSfC8DJQbH8VJY7ECEreGRwlztgWomB2/QJEJl1KrVOg5F
	 J9L9TlWja9VIz14zNLCgMC8JsG5C61FSOf4NagyBCw8dmrjLzy3CIT0fPCd0MW0hITL0V
	 XXfjRKzPiW7UwqBg6z4N30MYLYL9HT8PsAVmjvwD7Wnttyg4RUUHri5LTykLIKIZk7b7+
	 Ukmr9oxdkRy0LafL7yZSnBteETcwmjn3fEO2xucQ/M4jnk3IP+XowanRGapK27PHGAm5J
	 VjVSX1TzH2NTwbuY7Yufew5xTzg2TcoQ+IM81c+yLfzUEYOxvZ/J12O7CbpLLBDkghA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89E251F000C1;
	Fri, 27 Nov 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813183;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l4AYB2rMXR8w+qFBOPWTLBo8USWg7sxooeJhxsbBF3euQD998vzSzUAIl1UzEQ8of
	 g7rciRetj75FX73qkxZbH3gRcce0K/q93iLrvot4TrelhPqmISX4dllAGkvLO0PT9Z
	 7XXL//naGv5zBxfkfvrjb4fyFNIAjElRYT03qUGvBLJNyjzLwiwFX0Xw1oDXkPr+DG
	 Smsg0VcvpBVRGD+vEdpy9+MsrNuF6WEEmgMW8SZilOdYu6CgAYOyjCPICZiKitw9AC
	 b6LZon64Vt745OVvzXYRDxIjXhdcAi1n41Ur2cVhvBNuiwJ+K3TqKWK+OKzC+oFquC
	 55HYU9E0kic2w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 11B8F4DE03;
	Fri, 27 Nov 2026 20:59:30 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 23:59:31 +0300
Subject: [PATCH 3/3] ARM: multi_v7_defconfig: Enable CS7542 board
 peripherals
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
Message-Id: <20261127-b4-cs7542-peripherals-dts-v1-3-7ce24b842b3a@gmail.com>
References: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
In-Reply-To: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795813168; l=3974;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=vT4krSx42qoR3S8n7cGSEM30fEtc2yONk4X37rZ0GVY=;
 b=JnNh2OsqjQB8T29kElxKlhthkalR+XyeKtbWKGwlRRQDveyITHgUctsYWVPZPKvJHx5ysYhU+
 /UISyGB0bWCCKzsgqmP4NrKH/fXN3P1qFDVKK96dvzj+S+q3iKUnjRM
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Build the shared providers and boot-critical storage, watchdog and
network support for Almond+. Enable the QCA8337 switch driver and U-Boot
environment NVMEM layout needed for its factory MAC addresses. Existing
generic ath9k/ath10k and xHCI support supplies the PCIe endpoint
drivers.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 23f144359..dde9393ba 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -177,6 +177,7 @@ CONFIG_NFC_S3FWRN5_I2C=m
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_MVEBU=y
 CONFIG_PCI_TEGRA=y
+CONFIG_PCIE_CS7542=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCI_RCAR_GEN2=y
 CONFIG_PCI_LAYERSCAPE=y
@@ -203,6 +204,7 @@ CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_CS752X=y
 CONFIG_MTD_NAND_DENALI_DT=y
 CONFIG_MTD_NAND_OMAP2=y
 CONFIG_MTD_NAND_OMAP_BCH=y
@@ -252,12 +254,14 @@ CONFIG_B53_SPI_DRIVER=m
 CONFIG_B53_MDIO_DRIVER=m
 CONFIG_B53_MMAP_DRIVER=m
 CONFIG_NET_DSA_BCM_SF2=m
+CONFIG_NET_DSA_QCA8K=m
 CONFIG_NET_DSA_RZN1_A5PSW=m
 CONFIG_SUN4I_EMAC=y
 CONFIG_SPI_AX88796C=m
 CONFIG_BCMGENET=m
 CONFIG_BGMAC_BCMA=y
 CONFIG_SYSTEMPORT=m
+CONFIG_CS7542_ETHERNET=y
 CONFIG_MACB=y
 CONFIG_NET_CALXEDA_XGMAC=y
 CONFIG_FTGMAC100=m
@@ -300,6 +304,7 @@ CONFIG_CAN_C_CAN=m
 CONFIG_CAN_C_CAN_PLATFORM=m
 CONFIG_CAN_RCAR=m
 CONFIG_CAN_MCP251X=y
+CONFIG_MDIO_CS75XX=y
 CONFIG_MDIO_MSCC_MIIM=m
 CONFIG_USB_PEGASUS=y
 CONFIG_USB_RTL8152=m
@@ -409,6 +414,7 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_ASPEED_KCS_IPMI_BMC=m
 CONFIG_ASPEED_BT_IPMI_BMC=m
 CONFIG_HW_RANDOM=y
+CONFIG_HW_RANDOM_CS75XX=y
 CONFIG_HW_RANDOM_ST=y
 CONFIG_HW_RANDOM_QCOM=m
 CONFIG_TCG_TPM=m
@@ -423,6 +429,7 @@ CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=m
 CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
+CONFIG_I2C_CS75XX=y
 CONFIG_I2C_DAVINCI=y
 CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DIGICOLOR=m
@@ -480,6 +487,7 @@ CONFIG_SPI_XILINX=y
 CONFIG_SPI_SPIDEV=y
 CONFIG_SPMI=y
 CONFIG_PINCTRL_AS3722=y
+CONFIG_PINCTRL_CS7542=y
 CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_MICROCHIP_SGPIO=y
 CONFIG_PINCTRL_OCELOT=y
@@ -492,6 +500,7 @@ CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_RZN1=y
 CONFIG_GPIO_ASPEED_SGPIO=y
+CONFIG_GPIO_CS75XX=y
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_EM=y
@@ -568,6 +577,7 @@ CONFIG_UNIPHIER_THERMAL=y
 CONFIG_DA9063_WATCHDOG=m
 CONFIG_XILINX_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
+CONFIG_ARM_TWD_WATCHDOG=y
 CONFIG_AT91SAM9X_WATCHDOG=y
 CONFIG_SAMA5D4_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=m
@@ -1018,6 +1028,7 @@ CONFIG_EDAC_HIGHBANK_L2=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_AC100=y
 CONFIG_RTC_DRV_AS3722=y
+CONFIG_RTC_DRV_CS75XX=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_HYM8563=m
 CONFIG_RTC_DRV_MAX8907=y
@@ -1097,6 +1108,7 @@ CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=m
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
+CONFIG_COMMON_CLK_CS7542=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_RK808=m
 CONFIG_COMMON_CLK_SCMI=y
@@ -1223,14 +1235,17 @@ CONFIG_PWM_TIECAP=m
 CONFIG_PWM_TWL=m
 CONFIG_PWM_TWL_LED=m
 CONFIG_PWM_VT8500=y
+CONFIG_CS75XX_INTC=y
 CONFIG_KEYSTONE_IRQ=y
 CONFIG_RESET_MCHP_SPARX5=y
 CONFIG_RESET_SCMI=y
+CONFIG_RESET_CS7542=y
 CONFIG_RESET_TI_SCI=m
 CONFIG_RESET_TI_SYSCON=m
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_SUN9I_USB=y
 CONFIG_PHY_BRCM_USB=m
+CONFIG_PHY_CS7542_PCIE=y
 CONFIG_PHY_HIX5HD2_SATA=y
 CONFIG_PHY_BERLIN_SATA=y
 CONFIG_PHY_BERLIN_USB=y
@@ -1264,6 +1279,7 @@ CONFIG_NVMEM_RMEM=m
 CONFIG_NVMEM_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_STM32_ROMEM=m
 CONFIG_NVMEM_SUNXI_SID=y
+CONFIG_NVMEM_U_BOOT_ENV=y
 CONFIG_NVMEM_VF610_OCOTP=y
 CONFIG_FSI=m
 CONFIG_FSI_MASTER_GPIO=m

-- 
2.53.0


