Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3653EDAA1
	for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370818; cv=none; b=HGt0aC5Y3P+D3iOvl+7BGcq42XITLLR9DCuenUDAjl14lPC0a69L3/amkSUIs7GDpWwQx6kFKOGH2IVmnHcZtGYzmfSEPb9kiKMcbFoZDDePmOdSDvUM1qgTyHvbT3m+TaZIWs75alvlSpgqMare8IB7RHUC3OS0hjpYCTOmADo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370818; c=relaxed/simple;
	bh=6ya4n1fkm6PPu+J+UXJaoxYlGEf50l80a0QukNljqH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9Tugclnd5uo9B6f/zlsAzrclqHd+1aMNpH+IlxJJIqjNY/Ftjq3doK1U/FUZrBtuBpLfS+rjnRIl99Cc8VWuVDAshz6tKF0FkoJMPkDlQquWUA6d24UROp4dbtt31efvC4Ys/IoqReYapSjIHDIZoV4WC7YktqpTcUlWBf0LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnR0l1QD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnR0l1QD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so8557372f8f.3
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 13:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776370807; x=1776975607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfPIq++ZptNB9NoSORTQP1Mg8nMLS6cM+zxyxGdj+8o=;
        b=RnR0l1QDTGOLlxsgzcTf7QHJfghcBK3vkJurKuJMvbhex537PScWSME7K3YZl1YT7t
         Ahvgn5Va5+FYnRkZjZf6CC+ipaCA5CQh76xasK0nhcDfdIdbjYVm5g/L18iSnlYfw0dO
         EroxE/W8UYkzkObsldzdPNIJZnSJup3DHMPqNAyM0KTxCqs8A+VTmSgBrdpwZvzMRGA1
         yY2qV5QOyBRI3DzN5fM4v62GhjbK/sFRoufSFeRgdLIfHm+CAb4O93/HRkOC6tPIc46J
         gwhbEOgfBWr40/fOaSbADWvHAq/U2MrdsMWcjn+BwzhN8mA+N1Yowsfte+DslOkZzz0r
         Vl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370807; x=1776975607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RfPIq++ZptNB9NoSORTQP1Mg8nMLS6cM+zxyxGdj+8o=;
        b=RclEul/6Zk6lwhhU5xsTAPZmWblLpjeOo7tWDJU9F8bjPWSlLgLPRECIL7qEdCtcVb
         C4nY+RZZpUxQnH/alQUy/3fS+lCwwZlqWhMqyiMmH89kw+/s1GPV1FtQSqsH7qRFSARX
         BEHQp6D5WuxLgDAmL9eLxktjmfXizSPGaxY+5O2dYhnGLviiHhLWvLP18nLne2R4ovjJ
         k+vp9wHn23Q+DBOSR6ksYqs0erGCbQ/jVO+SYmgbMWYBCMx5+V0G93pI3W+/XYuDNz9N
         6vrm8T9sDYvie0QNrCKIt4NHQczl6qUWVZUFYUb3tHGQsNmM1o//niqm4HHcgTH405X+
         CZVg==
X-Forwarded-Encrypted: i=1; AFNElJ885x6AFj7aLbp1/6JkM6Vs6Jxsrnu/g/fjyYVDFi5oO2NHRJBvN49+eg7fz+dVSBUBsyYNdiropwBD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7noYSxx/8ICeIp55kmpk3iCM5w0szSXBiWSIOdBmSIIckaTo
	Rjim89CUWu+G+WMHTBt3N+OAkq1EjaVx0I1Jp8FK2xzVyDpe1aAMpKn/
X-Gm-Gg: AeBDietc89fHUhN+HlVurlqjYVl3wLmxXWGrDGqi262G2R8f45kYFxb8yzeaKwyqjHW
	Zfu/uGBdz7mUTBpx9YQ8YsSW+DFXYETOxB/ttfb+hMaZJ9/yq4EL0gunCukgHqAh803jaJ93CXk
	UczkCe2rXxzyzd0hQVV3xQy5AKwz96pnEm8lWxEwQp+48R9KURLpbJ0h81uNyqawCkuCZJqUHX7
	KJ18dxHDEzuyDzyMybplzRzMllsqevlDjQSdF/PWn+idW6o9Bpu94ouxUZIGXAOw8H2kltVRhmU
	2KPQnQ3Bm/RUSTPeM1K3pCPxXZhTTKGTWQVx2vUaZVS2APZ/4cuM+035ARw2zp1Z7FvrA8UxDQm
	Y22apEr/zsEpV4cyKcgqQrkhcmaAJUZWE2wz+WvN90n3MPJShYHX5rxo/SKQy4Zb3QgBOSopfYf
	4231WGTOQmCZ0mn8qxbBVncSfN7YM/fvoaAAZNzbYV53/NUg==
X-Received: by 2002:a05:6000:2305:b0:43d:1df7:ed24 with SMTP id ffacd0b85a97d-43fe14920ccmr1106467f8f.21.1776370806537;
        Thu, 16 Apr 2026 13:20:06 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead35c026sm16180624f8f.15.2026.04.16.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:20:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 16 Apr 2026 23:19:16 +0300
Subject: [PATCH v4 8/8] ARM: defconfig: Add a zx29 defconfig file
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260416-send-v4-8-e19d02b944ec@gmail.com>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
In-Reply-To: <20260416-send-v4-0-e19d02b944ec@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3027;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=6ya4n1fkm6PPu+J+UXJaoxYlGEf50l80a0QukNljqH8=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp4URLRFT9WUgaNwopIp7Mpr1SgGCmmWEuwj7ar
 WVx31IEDDWJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCaeFESxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJCTg//bkjPztbQVJQPtpbuLkcvfvMZhtuQRHY
 l33l22HlA6SP/heWkI6T2qAPFy1M0Ure63fHDxMyVsuv3gxrVpiTaucJEgKv0fiPsZwRkQFmyLi
 /yiO1Unj3iYdV/kzF86tniNudGNMW92JEHVa/sM9Px3laSJVV3JBEj90VPdnWccaC55hY0Je/Rx
 XoJrAexRUkpqczSXjWKKkXEN8Ve1EPCbfujoRvtuW6aZ77E0KiLIx3mpXZikz9vfrx5emrUZ5qR
 jU3NsabY/ogXdbZKOwArmyvGNDAXz16CrSDiRdialp6+wzlaFhn5IL2+CiPy+9vK7sz/7z6G1pT
 E8aCYbXMwoWtf1H09lCO8zhcVUNTIlGY6isvToY+WxjRmFIh6yzp65M3tvJqcywcPy3K6pYhsP0
 0lesl6GO2X0AjJ0x/h7OTrK1U30R47h2Tfb+H2zitdYZvUD2/MnR4SRY6LqYqg8Wt1TZ7X4+QmF
 1KHbL2+y95uoO5JBK58zmNi8asUxR/pBWRGguhBEdljObYEralQfrAsp4djUMPWGisNdUSQYrB4
 zj5WgqwMUUVoeX9na9QhiMLZhfpfJn7hjQygPgnQSV/gcij467vFsFilq0DiKH965TjQ1AEygP9
 dWfea67NGOlgz3pscNDsJQ/7GWs5F0DAk65YCoWpG7ZJTw7V0kss=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This enables existing drivers that already are (UART) or will be (USB,
GPIO) necessary to operate this board even if they aren't declared in
the DTS yet.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/configs/zx29_defconfig | 90 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/configs/zx29_defconfig b/arch/arm/configs/zx29_defconfig
new file mode 100644
index 000000000000..dae2d86c7583
--- /dev/null
+++ b/arch/arm/configs/zx29_defconfig
@@ -0,0 +1,90 @@
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_RD_BZIP2 is not set
+# CONFIG_RD_LZMA is not set
+# CONFIG_RD_XZ is not set
+# CONFIG_RD_LZ4 is not set
+CONFIG_EXPERT=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_MMU=y
+CONFIG_ARCH_MULTI_V7=y
+CONFIG_ARCH_ZTE=y
+CONFIG_SOC_ZX297520V3=y
+# FIXME: There is no PSCI on this board, but ARM_GIC_V3 depends on it
+CONFIG_ARM_PSCI=y
+CONFIG_ARM_APPENDED_DTB=y
+CONFIG_CMDLINE="console=ttyAMA1 earlyprintk root=/dev/ram rw"
+# CONFIG_SUSPEND is not set
+CONFIG_BINFMT_FLAT=y
+# CONFIG_UEVENT_HELPER is not set
+# CONFIG_STANDALONE is not set
+# CONFIG_PREVENT_FIRMWARE_BUILD is not set
+# CONFIG_ALLOW_DEV_COREDUMP is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+CONFIG_CPU_FREQ=y
+CONFIG_CPUFREQ_DT_PLATDEV=y
+CONFIG_PM=y
+CONFIG_PM_CLK=y
+CONFIG_PM_GENERIC_DOMAINS=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+CONFIG_DEVTMPFS=y       # FIXME: This is specific to my initrd. Remove before upstream
+CONFIG_DEVTMPFS_MOUNT=y
+# CONFIG_INPUT_MOUSEDEV is not set
+CONFIG_KEYBOARD_GPIO_POLLED=y
+CONFIG_GPIOLIB=y
+CONFIG_OF_GPIO=y
+CONFIG_GPIO_GENERIC_PLATFORM=y
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_SERIO is not set
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_SERIAL_AMBA_PL011=y
+CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
+CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_DEV_BUS=y
+CONFIG_SERIAL_DEV_CTRL_TTYPORT=y
+# CONFIG_HW_RANDOM is not set
+CONFIG_MFD_SYSCON=y
+# CONFIG_HID is not set
+CONFIG_PINCTRL=y
+CONFIG_GENERIC_PINCTRL_GROUPS=y
+CONFIG_PINMUX=y
+CONFIG_GENERIC_PINMUX_FUNCTIONS=y
+CONFIG_PINCONF=y
+CONFIG_GENERIC_PINCONF=y
+CONFIG_RESET_CONTROLLER=y
+CONFIG_POWER_RESET=y
+CONFIG_RESET_SIMPLE=y
+CONFIG_LEDS_GPIO=y
+CONFIG_USB_DWC2=y
+CONFIG_USB_GADGET=y
+CONFIG_MTD=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+CONFIG_MTD_SPI_NAND=y
+CONFIG_SPI_MASTER=y
+CONFIG_MMC=y
+CONFIG_MMC_DW=y
+CONFIG_MMC_DW_PLTFM=y
+CONFIG_STMMAC_ETH=y
+CONFIG_STMMAC_PLATFORM=y
+CONFIG_MDIO_BUS=y
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_SRAM=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_JFFS2_FS=y
+CONFIG_CONFIG_TMPFS=y
+# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_PRINTK_TIME=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_DEBUG_LL=y
+CONFIG_DEBUG_ZTE_ZX=y
+CONFIG_DEBUG_LL_INCLUDE="debug/pl01x.S"
+CONFIG_DEBUG_UART_PL01X=y
+CONFIG_DEBUG_UART_PHYS=0x01408000
+CONFIG_DEBUG_UART_VIRT=0xf4708000

-- 
2.52.0

