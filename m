Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416667;
	b=OHlUD2Jq9ZUCHCeCicA0IsZwTuoDDftDPttK9r1gMBirjBE7U5R5IoLU+pCTQk+srY/4
	 kiI9GfNTqWLRL32dtS6yKjmaXDxS5owveJQbp/oc3r1l3R0BDz3ZRKpe6Kc77NT+XtOt1
	 kr0rvTAa92G/r4WHqZ0TjMiFtjolF7CN3rFxx69AjliDjypRjPeeMOc6ScZLmDf0nU6Hw
	 PAC2UqXjCuK2cc1BwPlx9ugqDyLJ511Dl8aLcFSZdWloyqt3Kjdg0BV+j6xMJMlvERh3H
	 yR6xn+LZrI39ydA+cjYRJtLLur5tIgjXPPQzlzrePGScG5nwNQnBU6wyPYon00Yk2cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=;
	b=pQyflbCjr7FEU39a9mHF047D56Ovew5/BfSSd6qepQfiIOoyIC9V+IdDLMC7JvHX2fcj
	 oKJONxGy5PrahXNBf7X9o7wIrxEk8yEc7b2lfeCGmkNlBXhWaGSUNL0fxcYIIzNTFYRTT
	 YGmlutrI0kNdmtdiUSLjSBi5RTGSWJAoa4xzhTRFV5X+qSAKKx8We4oyPGF8GbrcDphJU
	 kMGqHy8mbGU7QUo13uF71wWJRIYjUYEaRuzcdGWaWYf3578vskjuk27IoTO9F+Wd5s+AQ
	 7vUWWPWb216bN/HRUjCyyzz1poU/KKZd6jNWAs2aXGDl9isWEd5SQOVeixhW81b1q1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZNRYqMd;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6A606A32A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F6A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uZNRYqMd
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1412075a91.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 22:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416665; x=1796021465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=;
        b=uZNRYqMddHXQOC6oW0AUkhXO0R9EWJ/+wjPn5sLWZQnaAsgSmcPq05o1vTQCEoh4BZ
         T4mR39qjdsQsHDOdI4TKiEf+LYUw3Pa+jqvxI1xlmpihfj3D7Cocc5EOse6EavQCBnEr
         dTDqkM8abBj52hlvFrXCe3GAaavuSU+PqscgICvBQiPWu3QTF2RultaAUP06kQZ4mbB4
         CgTDsvuVSToJcr/Z6TOax3DOX63AUDpJI5hw5atGmmVo7aobKWTvb3gKOyY8ZhhbbM5x
         36QLwxNZj2y4fpsTyyv6IridV6Dc+/U9lQCyN/qenBk59eHcOQwM0devYpoCrpkktnkm
         2trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416665; x=1796021465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d7N7akItKXqErTZCoCZXojsQbx4u2LaeuSFiRq3q31I=;
        b=Vv2LaAl8kB1jTIyJZ9DqZ/1RlfvSnJB/p7BAG7fWV8l72Z9nVVF2A6TigqN/7s4CkF
         Otm/gjkuqiRHbXule3coR+N0EtaOXE+7vbPM3SrhMyrr4HtwovGusLvP+IumSRO9uTZh
         rziDwJ54uX9c8osBLEZdj2Ta109L0Zs/HfhnaEu6aKLIx1FMkeax+sADsg+D54MAsfGk
         5xfB6gjlKKRwpHPyGoSuQNt4tKIgx2qVZTJVU76+A+bGJT3RHCk6o8JOrHxdO1+AiTzM
         vOpcwOVcpfLvnfAArt9Svbx1XV/EUJEoKUuRxDy7jbSr2J4IvmV3ZxYc6gKwYXVG+xa6
         r4YQ==
X-Forwarded-Encrypted: i=1; AL+hErEa3De230auprHBgfsLnp6NMCMTXAH9+SwS+G0chcsMiYJTJm4Q9NVk0Rj0E1ASiN5ogwmN1sAr/aCL@vger.kernel.org
X-Gm-Message-State: APuU4Z8pEa3fras+sPgmgZMtBqBXOi7jHZ2opkSbTKWjWqfT2iYz4bpO
	5xOwRpHzA1jyCsKExs7EGLfQesYF4uD2hIyUVdD6K/P/G45LUyc34Hi1
X-Gm-Gg: AZFdTZd4Iwq6UJXhzG40XiFNdcpsrv3+mGzUvFOYpgCmR4jpo1IlPCPBQq3SyQv+3RU
	MD1jim3mOxXKnnsAvX/dz52ASKYGVd1V/hSfkC54RtzTCPyARpUvXGYDU05XTP/QFW2bAYwX/b2
	F31/KsWkRM/3fs1WRz5XyK3hPF1+QDjC1vgnn4evyva5MSwW2IUy76Ar9WYkToheV0ER4qXx4yy
	t/aIL6U4kGlFsNi1koNcQTklVVio7aWbiM7d6JBx+ln0E/a40UHkanrkCxvcc6TPFhDcTGAixTJ
	1imJpNZw4BQQ+ZpBs2tyO7Domgd22CjPqC+dvLYyBB8SIYJhseSSC9u+exadmZzSuvnt1agdYhn
	wRU1y0F3cJOV7aM8o6fznIwwh9gsHEP/8Z3LZXLzWfNssuVkjS0AWpmHoEipxvt91Hf1QMCMLxP
	Hin7kIfTKO40n8YOQoW5UkPtdbuxO/3bzNu/ohgye21SqyLmG2rbfDnhM2KVmhMBERKWJJBE5dF
	IGNV7CpWHkYBcyMrr8TEpZX/vJSnT+PMZnzYKP2CbqsOFytmL6OwyYNkd7FGjcr7e2MFDqtMa3E
	6Kc/TZbSe9SgL8ZJ1haLaBwHGOY8gC/DSKtr9GAAhjyPGAaR5ci/XC9fv4d1UQ/DAwi93L64OzD
	AwWeKZwphtG7BDDQ=
X-Received: by 2002:a17:90b:3810:b0:3b4:ac3:8af2 with SMTP id 98e67ed59e1d1-3b41c9cf6famr9184421a91.27.1795416664913;
        Sun, 22 Nov 2026 22:51:04 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm5224811a91.9.2026.11.22.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:51:04 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v7 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
Date: Mon, 23 Nov 2026 14:50:06 +0800
Message-Id: <20261123065006.28768-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123065006.28768-1-cwweng.linux@gmail.com>
References: <20261123065006.28768-1-cwweng.linux@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a PWM framework driver for the Nuvoton MA35D1 EPWM controller.

The controller provides 6 PWM channels. The initial driver supports
up-counting, auto-reload, independent output mode and period loading
mode.

Configure the waveform generator to drive the output high at the zero
point and low at the compare-up point. In up-counting mode the counter
counts from 0 to PERIOD inclusive. CMPDAT = 0 therefore generates a 0%
duty cycle, while CMPDAT > PERIOD generates a 100% duty cycle.

Limit the period to 0xffff counter cycles so that PERIOD is at most
0xfffe and CMPDAT = 0xffff remains available to represent a 100% duty
cycle.

The clock prescaler is shared by each pair of PWM channels. Preserve
the existing prescaler value and account for CLKPSC + 1 when calculating
and reporting the period and duty cycle.

Do not modify the controller during probe, preserving PWM outputs that
may have been configured by firmware. Configure only the requested
channel from the apply callback, and refuse to change an active
complementary pair to independent mode if doing so would disturb the
paired output.

Period and compare values use the hardware period-loading buffers.
Because PERIOD and CMPDAT are written separately, a period boundary
between the two writes can result in one transitional cycle using the
new period with the previous duty cycle.

When disabling a channel, clear its output-enable and counter-enable
bits. Clearing the output-enable bit places the output pin in high
impedance.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/pwm/Kconfig      |  10 +
 drivers/pwm/Makefile     |   1 +
 drivers/pwm/pwm-ma35d1.c | 382 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 393 insertions(+)
 create mode 100644 drivers/pwm/pwm-ma35d1.c

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index e8886a9b64d9..d971760b37c6 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -463,6 +463,16 @@ config PWM_LPSS_PLATFORM
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm-lpss-platform.
 
+config PWM_MA35D1
+	tristate "Nuvoton MA35D1 PWM support"
+	depends on ARCH_MA35 || COMPILE_TEST
+	help
+	  Generic PWM framework driver for the Nuvoton MA35D1 PWM
+	  controller, which provides 6 PWM outputs.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called pwm-ma35d1.
+
 config PWM_MAX7360
 	tristate "MAX7360 PWMs"
 	depends on MFD_MAX7360
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cf..7ad761ea27d1 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_PWM_LPC32XX)	+= pwm-lpc32xx.o
 obj-$(CONFIG_PWM_LPSS)		+= pwm-lpss.o
 obj-$(CONFIG_PWM_LPSS_PCI)	+= pwm-lpss-pci.o
 obj-$(CONFIG_PWM_LPSS_PLATFORM)	+= pwm-lpss-platform.o
+obj-$(CONFIG_PWM_MA35D1)	+= pwm-ma35d1.o
 obj-$(CONFIG_PWM_MAX7360)	+= pwm-max7360.o
 obj-$(CONFIG_PWM_MC33XS2410)	+= pwm-mc33xs2410.o
 obj-$(CONFIG_PWM_MEDIATEK)	+= pwm-mediatek.o
diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
new file mode 100644
index 000000000000..0a6efb660570
--- /dev/null
+++ b/drivers/pwm/pwm-ma35d1.c
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Nuvoton MA35D1 PWM controller
+ *
+ * Copyright (C) 2026 Nuvoton Corporation
+ *               Chi-Wen Weng <cwweng@nuvoton.com>
+ *
+ * Reference Manual:
+ * https://www.nuvoton.com/resource-download.jsp?tp_GUID=DA05-MA35D16
+ *
+ * Limitations:
+ * - The hardware supports 6 PWM channels.
+ * - The hardware supports up, down and up-down counter types. This driver
+ *   supports up-counting mode only.
+ * - The hardware supports auto-reload and one-shot counter modes. This driver
+ *   supports auto-reload mode only.
+ * - The hardware supports independent and complementary output modes. This
+ *   driver supports independent mode only. If a channel pair is already active
+ *   in complementary mode, applying a new state to one channel fails with
+ *   -EBUSY to avoid disturbing the paired output.
+ * - The hardware supports period, immediate, window and center loading modes.
+ *   This driver supports period loading mode only.
+ * - The hardware supports programmable waveform actions at zero, period and
+ *   compare points. This driver uses zero point high and compare-up point low
+ *   actions for normal PWM output.
+ * - In up-counting mode, the counter counts from 0 to PERIOD inclusive. With
+ *   zero point high and compare-up point low actions, CMPDAT = 0 produces 0%
+ *   duty and CMPDAT > PERIOD produces 100% duty.
+ * - The driver limits the period to 0xffff counter cycles so that CMPDAT can
+ *   be set greater than PERIOD to generate a 100% duty cycle.
+ * - Period and duty cycle changes are buffered by hardware and take effect at
+ *   the end of the current period.
+ * - The clock prescaler is shared by each channel pair. The driver preserves
+ *   the current prescaler and accounts for it in period and duty calculations.
+ * - Polarity and waveform-control changes are applied directly and may cause
+ *   a transient output change if the PWM output is running.
+ * - When disabled, the output pin is put in tri-state by clearing POENn.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+
+#define MA35D1_REG_EPWM_CTL0			0x00
+#define MA35D1_REG_EPWM_CTL1			0x04
+#define MA35D1_REG_EPWM_CLKPSC(ch)		(0x14 + 4 * ((ch) / 2))
+#define MA35D1_REG_EPWM_CNTEN			0x20
+#define MA35D1_REG_EPWM_PERIOD(ch)		(0x30 + 4 * (ch))
+#define MA35D1_REG_EPWM_CMPDAT(ch)		(0x50 + 4 * (ch))
+#define MA35D1_REG_EPWM_WGCTL0			0xb0
+#define MA35D1_REG_EPWM_WGCTL1			0xb4
+#define MA35D1_REG_EPWM_POLCTL			0xd4
+#define MA35D1_REG_EPWM_POEN			0xd8
+
+#define MA35D1_REG_EPWM_CTL0_CTRLD(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_CTL0_WINLDEN(ch)	BIT(8 + (ch))
+#define MA35D1_REG_EPWM_CTL0_IMMLDEN(ch)	BIT(16 + (ch))
+
+#define MA35D1_REG_EPWM_CTL1_CNTTYPE(ch)	(0x3 << (2 * (ch)))
+#define MA35D1_REG_EPWM_CTL1_CNTMODE(ch)	BIT(16 + (ch))
+#define MA35D1_REG_EPWM_CTL1_OUTMODE(ch)	BIT(24 + ((ch) / 2))
+
+#define MA35D1_REG_EPWM_CLKPSC_MASK		GENMASK(11, 0)
+#define MA35D1_REG_EPWM_CNTEN_EN(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_POEN_EN(ch)		BIT(ch)
+#define MA35D1_REG_EPWM_POLCTL_INV(ch)		BIT(ch)
+
+#define MA35D1_PWM_WGCTL_ACTION_MASK		0x3
+#define MA35D1_PWM_WGCTL_ACTION(ch)		\
+	(MA35D1_PWM_WGCTL_ACTION_MASK << (2 * (ch)))
+#define MA35D1_PWM_WGCTL_ACTION_VAL(ch, action)	((action) << (2 * (ch)))
+#define MA35D1_PWM_WGCTL_ACTION_LOW		1
+#define MA35D1_PWM_WGCTL_ACTION_HIGH		2
+
+#define MA35D1_PWM_DATA_MASK			GENMASK(15, 0)
+#define MA35D1_PWM_MAX_CYCLES			0xffff
+
+#define MA35D1_PWM_NUM_CHANNELS			6
+
+struct nuvoton_pwm {
+	void __iomem *base;
+	unsigned long clkrate;
+};
+
+static inline struct nuvoton_pwm *nuvoton_pwm_from_chip(struct pwm_chip *chip)
+{
+	return pwmchip_get_drvdata(chip);
+}
+
+static inline u32 nuvoton_pwm_readl(struct nuvoton_pwm *nvtpwm,
+				    unsigned int offset)
+{
+	return readl(nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_writel(struct nuvoton_pwm *nvtpwm,
+				      unsigned int offset, u32 value)
+{
+	writel(value, nvtpwm->base + offset);
+}
+
+static inline void nuvoton_pwm_rmw(struct nuvoton_pwm *nvtpwm,
+				   unsigned int offset, u32 mask, u32 value)
+{
+	u32 reg;
+
+	reg = nuvoton_pwm_readl(nvtpwm, offset);
+	reg &= ~mask;
+	reg |= value & mask;
+	nuvoton_pwm_writel(nvtpwm, offset, reg);
+}
+
+static bool nuvoton_pwm_channel_active(struct nuvoton_pwm *nvtpwm,
+				       unsigned int ch)
+{
+	u32 cnten, poen;
+	u32 mask = BIT(ch);
+
+	cnten = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CNTEN);
+	poen = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POEN);
+
+	return (cnten | poen) & mask;
+}
+
+static u32 nuvoton_pwm_get_prescale(struct nuvoton_pwm *nvtpwm,
+				    unsigned int ch)
+{
+	return nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CLKPSC(ch)) &
+	       MA35D1_REG_EPWM_CLKPSC_MASK;
+}
+
+static int nuvoton_pwm_config_channel(struct nuvoton_pwm *nvtpwm,
+				      unsigned int ch)
+{
+	u32 ctl0_mask;
+	u32 ctl1, ctl1_mask, outmode_mask;
+	u32 wgctl0_mask, wgctl0_val;
+	u32 wgctl1_mask, wgctl1_val;
+
+	outmode_mask = MA35D1_REG_EPWM_CTL1_OUTMODE(ch);
+	ctl1 = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CTL1);
+
+	if ((ctl1 & outmode_mask) &&
+	    nuvoton_pwm_channel_active(nvtpwm, ch ^ 1))
+		return -EBUSY;
+
+	/*
+	 * IMMLDENn = 0, WINLDENn = 0 and CTRLDn = 0 select period loading
+	 * mode for up-counting operation.
+	 */
+	ctl0_mask = MA35D1_REG_EPWM_CTL0_IMMLDEN(ch);
+	ctl0_mask |= MA35D1_REG_EPWM_CTL0_WINLDEN(ch);
+	ctl0_mask |= MA35D1_REG_EPWM_CTL0_CTRLD(ch);
+
+	/*
+	 * CNTTYPEn = 00: up counter type
+	 * CNTMODEn = 0: auto-reload mode
+	 * OUTMODEn = 0: independent mode
+	 */
+	ctl1_mask = MA35D1_REG_EPWM_CTL1_CNTTYPE(ch);
+	ctl1_mask |= MA35D1_REG_EPWM_CTL1_CNTMODE(ch);
+	ctl1_mask |= outmode_mask;
+
+	/*
+	 * ZPCTLn = 10: output high at zero point
+	 * PRDPCTLn = 00: do nothing at period point
+	 */
+	wgctl0_mask = MA35D1_PWM_WGCTL_ACTION(ch);
+	wgctl0_mask |= MA35D1_PWM_WGCTL_ACTION(ch) << 16;
+	wgctl0_val = MA35D1_PWM_WGCTL_ACTION_VAL(ch, MA35D1_PWM_WGCTL_ACTION_HIGH);
+
+	/*
+	 * CMPUCTLn = 01: output low at compare up point
+	 * CMPDCTLn = 00: do nothing at compare down point
+	 */
+	wgctl1_mask = MA35D1_PWM_WGCTL_ACTION(ch);
+	wgctl1_mask |= MA35D1_PWM_WGCTL_ACTION(ch) << 16;
+	wgctl1_val = MA35D1_PWM_WGCTL_ACTION_VAL(ch, MA35D1_PWM_WGCTL_ACTION_LOW);
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CTL0, ctl0_mask, 0);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CTL1, ctl1_mask, 0);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_WGCTL0, wgctl0_mask, wgctl0_val);
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_WGCTL1, wgctl1_mask, wgctl1_val);
+
+	return 0;
+}
+
+static int nuvoton_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	unsigned int ch = pwm->hwpwm;
+	u64 duty_cycles, period_cycles;
+	u64 divisor;
+	u32 cmpdat, period, prescale;
+	int ret;
+
+	if (!state->enabled) {
+		/* Clearing POENn disables the output driver and makes the pin high-Z. */
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POEN,
+				MA35D1_REG_EPWM_POEN_EN(ch), 0);
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CNTEN,
+				MA35D1_REG_EPWM_CNTEN_EN(ch), 0);
+
+		return 0;
+	}
+
+	prescale = nuvoton_pwm_get_prescale(nvtpwm, ch);
+	divisor = (u64)NSEC_PER_SEC * (prescale + 1);
+
+	period_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					    state->period, divisor);
+	if (!period_cycles)
+		return -EINVAL;
+
+	if (period_cycles > MA35D1_PWM_MAX_CYCLES)
+		period_cycles = MA35D1_PWM_MAX_CYCLES;
+
+	duty_cycles = mul_u64_u64_div_u64(nvtpwm->clkrate,
+					  state->duty_cycle, divisor);
+	if (duty_cycles > period_cycles)
+		duty_cycles = period_cycles;
+
+	ret = nuvoton_pwm_config_channel(nvtpwm, ch);
+	if (ret)
+		return ret;
+
+	if (state->polarity == PWM_POLARITY_NORMAL)
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POLCTL,
+				MA35D1_REG_EPWM_POLCTL_INV(ch), 0);
+	else
+		nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POLCTL,
+				MA35D1_REG_EPWM_POLCTL_INV(ch),
+				MA35D1_REG_EPWM_POLCTL_INV(ch));
+
+	/*
+	 * In up-counting mode the counter counts from 0 to PERIOD inclusive.
+	 * With zero point high and compare-up point low actions:
+	 * - CMPDAT = 0 produces 0% duty.
+	 * - CMPDAT > PERIOD produces 100% duty.
+	 *
+	 * period_cycles is limited to 0xffff, so PERIOD is at most 0xfffe
+	 * and a 100% duty cycle can be represented by CMPDAT = 0xffff.
+	 */
+	period = period_cycles - 1;
+	cmpdat = duty_cycles;
+
+	/*
+	 * PERIOD and CMPDAT are loaded into their active buffers at a period
+	 * boundary. If a period boundary occurs between these two writes, one
+	 * cycle can use the new PERIOD value with the previous CMPDAT value.
+	 * The following period then uses both new values.
+	 */
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_EPWM_PERIOD(ch), period);
+	nuvoton_pwm_writel(nvtpwm, MA35D1_REG_EPWM_CMPDAT(ch), cmpdat);
+
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_POEN,
+			MA35D1_REG_EPWM_POEN_EN(ch), MA35D1_REG_EPWM_POEN_EN(ch));
+	nuvoton_pwm_rmw(nvtpwm, MA35D1_REG_EPWM_CNTEN,
+			MA35D1_REG_EPWM_CNTEN_EN(ch), MA35D1_REG_EPWM_CNTEN_EN(ch));
+
+	return 0;
+}
+
+static int nuvoton_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct nuvoton_pwm *nvtpwm = nuvoton_pwm_from_chip(chip);
+	unsigned int ch = pwm->hwpwm;
+	u32 cmpdat, cnten, period, poen, polctl, prescale;
+	u64 duty_cycles, period_cycles;
+	u64 prescaled_cycles;
+
+	cnten = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CNTEN);
+	poen = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POEN);
+	polctl = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_POLCTL);
+	prescale = nuvoton_pwm_get_prescale(nvtpwm, ch);
+	period = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_PERIOD(ch)) &
+		 MA35D1_PWM_DATA_MASK;
+	cmpdat = nuvoton_pwm_readl(nvtpwm, MA35D1_REG_EPWM_CMPDAT(ch)) &
+		 MA35D1_PWM_DATA_MASK;
+
+	period_cycles = period + 1;
+	if (cmpdat > period)
+		duty_cycles = period_cycles;
+	else
+		duty_cycles = cmpdat;
+
+	state->enabled = (cnten & MA35D1_REG_EPWM_CNTEN_EN(ch)) &&
+			 (poen & MA35D1_REG_EPWM_POEN_EN(ch));
+	state->polarity = (polctl & MA35D1_REG_EPWM_POLCTL_INV(ch)) ?
+			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+
+	prescaled_cycles = period_cycles * (prescale + 1);
+	state->period = DIV64_U64_ROUND_UP(prescaled_cycles * NSEC_PER_SEC,
+					   nvtpwm->clkrate);
+
+	prescaled_cycles = duty_cycles * (prescale + 1);
+	state->duty_cycle = DIV64_U64_ROUND_UP(prescaled_cycles * NSEC_PER_SEC,
+					       nvtpwm->clkrate);
+
+	return 0;
+}
+
+static const struct pwm_ops nuvoton_pwm_ops = {
+	.apply = nuvoton_pwm_apply,
+	.get_state = nuvoton_pwm_get_state,
+};
+
+static int nuvoton_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwm_chip *chip;
+	struct nuvoton_pwm *nvtpwm;
+	struct clk *clk;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, MA35D1_PWM_NUM_CHANNELS,
+				  sizeof(*nvtpwm));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	nvtpwm = nuvoton_pwm_from_chip(chip);
+
+	nvtpwm->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(nvtpwm->base))
+		return PTR_ERR(nvtpwm->base);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Unable to get the clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Unable to get exclusive clock rate\n");
+
+	nvtpwm->clkrate = clk_get_rate(clk);
+	if (!nvtpwm->clkrate)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock rate is zero\n");
+
+	if (nvtpwm->clkrate > NSEC_PER_SEC)
+		return dev_err_probe(dev, -EINVAL,
+				     "PWM clock out of range (%lu)\n",
+				     nvtpwm->clkrate);
+
+	chip->ops = &nuvoton_pwm_ops;
+	chip->atomic = true;
+
+	ret = devm_pwmchip_add(dev, chip);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to add PWM chip\n");
+
+	return 0;
+}
+
+static const struct of_device_id nuvoton_pwm_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-pwm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nuvoton_pwm_of_match);
+
+static struct platform_driver nuvoton_pwm_driver = {
+	.probe = nuvoton_pwm_probe,
+	.driver = {
+		.name = "nuvoton-pwm",
+		.of_match_table = nuvoton_pwm_of_match,
+	},
+};
+module_platform_driver(nuvoton_pwm_driver);
+
+MODULE_AUTHOR("Chi-Wen Weng <cwweng@nuvoton.com>");
+MODULE_DESCRIPTION("Nuvoton MA35D1 PWM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

