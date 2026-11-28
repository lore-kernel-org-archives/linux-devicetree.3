Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795838002;
	b=y0Bx0rR1j9AeTQZCJsRdh1BWLIGuhgXeunKV1z2lWYB0+1cOL0ksIvBUuqtC0AR1wwbJ
	 m/c2OkYzKJoutpTcYqVzyOBK+ATrqthNkcJ7p78sgbkNAJ+RRDdhM0rN4Ty8mBcugH0Jj
	 +QC8Qe2FIce+cD/pdOFwYUJP1mHSIo6NGsM5ieY5oFSgo/lEWcty1dyBAttn+cEV69U9G
	 1nJH0/JNJzG0HpEiytJj0ksg+7hSjSlZ2laWQki59blBgkJTXqkwTzgxlZPxxjgCjEsNe
	 F53LXCNvQT7n8idr4aoGsiQp4s6cCMo1f4gyL+GNPTxLelb6o6kRpFKyQzI5GxIpKaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838002;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	b=mO6z1vBjTee0lWLKI03FW8Sy0+TTm/1bzOro3witgO3Li5nP20r98hmQebyDbkcTXDSv
	 nxQ9z/hUb6gzEcDWe8R44EVUR4TQ/OHJ+s7KFCYyu5Qt9qwarn2jhIHgU9ebJiery82JE
	 R7mpquv87KQYbiU84RLgxS23X4dTK4g+ZA4fk5pshu8iGU5z8fNg2MlG3fIqWo6XnOYwZ
	 gkgTVeN4Q5VooFjCuysmpQ3PnX5oONFXpI0OiMFjXcYR4glFfLKhctTxg9eWTw56/AxT4
	 bvnCBTLmt/sblwv0t0ErUu7ABMxK+iZgXernMv5OgLeC+kzYmvA/31iRgQlSzQCnsKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPCG3nEJ;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99A606A338;
	Sat, 28 Nov 2026 03:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hPCG3nEJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795838001;
	b=CayyJYIdKEcRXg9ipnkPW5WWxehRThuXvhVLKhklN94FvikXK3Zf4++9mnvJf8rYpOGQ
	 tNcQOS0726gMfoMiG/i1E6Or9opq/GO13sorRenyVNCc4UJRYHiYFkjrdg1bqN5YI5qXN
	 tCjmge2wCt4ppSWZWEhBQJRJR2AtvPZZabYJ7CbxWkK+xcKZ5ye5jyG3uOy8QEfldxGvr
	 C/fW085VAH6LI0s3Q1sCPgP6+alQ+W+nwVjbRV8YI7SA7uflB5anOll85ZuvquFlEX53q
	 z2cZy94MkQ3cEbfKFzQdfAyQd+xEFrH4Bo5MCQemWp69Fl0P89l5MvN4MrMAzmh0O4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795838001;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	b=iZWlWQiVkfNoFPnBixo6vT7niq3pwW4asXDfjMoMwr5QAV0Hb32Bgxd5uoCS6Nwm9nDK
	 BInlRDW8KXQNS+dMPgzE/iw7GGZFiNkvQsqCv59SwiVs8TmNxb6kIkzQc+8/bSCUmP8Ew
	 06X1SV/5FYz91nRBVTUMUIVV+k2hV1cwosrVQdHQpojJoqlUtdtlzUNcacco4HxTseDXw
	 qGjpSVSuI2iiLhI8ZKwPAx/SESZEtJJwLUYfea8ZETvuPHAh0zUP9wKgjkH+vDOPnaQnQ
	 izg61w94uAy3fgfolIJqOjl/BpYkRmEU9YAmCyT1nj7mv10zcqptqJIMvh7UepljQ/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 136D11F0089A;
	Sat, 28 Nov 2026 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795838001;
	bh=flPJC5TPyfcUaRSjCiXVflWIMov3erhkAc8yqSsIO/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hPCG3nEJB72oCS2FbLg2rFuzARwbp0oq9Km0i8Or/bYhXtmeY2H3al/aYxvFzIKGb
	 f8mF6oTf25p96DQFkU6RqUO22SUhAXtQU2bAfE09X7kYgBsg8qVB8elW4/KaTs42Kn
	 ZCAz9QGPm+0Zpn7A+THtUXWzaHD4WHHDNZBfJTRQq+v6IbuHhK3kM5LJKxjMPNzgw8
	 AXk8zFdJ7UDCVmP7aJaOeV7pDNBVibBEIqXKLjGPoVBquWc+rvY4I6la2P+itW6TIj
	 +3mjrMsDE0DJt/MkJG4g1vSwgmYv83+4jqnagV+h5W6ZWflHljpDKqpZWVLM1MueeI
	 MnnLY6/eoDODA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 914D24DF8C;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 06:53:11 +0300
Subject: [PATCH v2 3/3] ARM: multi_v7_defconfig: Enable CS7542 board
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
Message-Id: <20261128-b4-cs7542-peripherals-dts-v2-3-ccab93aac77f@gmail.com>
References: <20261128-b4-cs7542-peripherals-dts-v2-0-ccab93aac77f@gmail.com>
In-Reply-To: <20261128-b4-cs7542-peripherals-dts-v2-0-ccab93aac77f@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795837989; l=3974;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=vT4krSx42qoR3S8n7cGSEM30fEtc2yONk4X37rZ0GVY=;
 b=XuGuP6fD0i6r7vNmPvxYK1kvdDMzsB3gjHq72kKVvwTOPqaHqGt0PueI9Sun6pI8jPI/R23I6
 SQV+bcXz1o+BZen95vVDz5U5ZznUe87zPqiX/zjuNwOt43pr6VQAT/h
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


