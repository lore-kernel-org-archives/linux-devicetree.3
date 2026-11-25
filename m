Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623660;
	b=ZdL90K4128Fa+KBvqQ+uf6Gfgmlk5S4f6Jg+4iDjAqlfp8FeDhRGpoSIQmfBydb2hrJL
	 jz3tWcMgy/3LA0n+VGGeATo3AEdsuMJNSt6GAPNZp8DguHxJXE6zSdHaWlce7BMJtDWmz
	 Ihp7j5uUm3QeU1emFnHc1Eo7vswUD6jT0+jGYq1nBTQCXGVu+BT4a9W0FqOA20vjiHGeB
	 2leOaYGsGlxTg6YXRSLqGfcQW4djgn5MQufDPYVckMvcrmOsmO1SRnpqfz0lflZylSMJk
	 uuG5hOqQ57XKrVCdtUzzs2P4csnBYmZQ/OgYIwQJnsKN0Hqc42B7cpP1L7yxzF2vMNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=pG5BL8ZNNGX0bHavpvB1CDziqn0Bc8dM4syvlOlGo6c=;
	b=voYtaAlQeZK7nY+pC7hRn+IvTVb5K4C+XqFXLRY19WTJ1sEA1URsHxaf+4ZoAZQ2trpl
	 UDXrDPdXLPxksXajD0vZm7VdeDwNQFN2LumTdKxb2fWloX3wc8HcDTeB0JeM/J8BY2eq5
	 Ggimo//YLzF/NHmaiaxf56AJuu9kgRHQsVB3neD8c40sGww1EtUNauoidueduL3qfUw9O
	 WoSQm0LC84FkVcnPxTvtHx1RQ9HrA8NFAGcJjTUazgivXgbMVKyQCrIQoC7ALm+nclkAp
	 VRi1KVWkfxoi2D7asy2DCvInnh6Rvogf/Ct8s+tfWH7Py/h064Me5zIap9Xpkt4DQ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWEUrjcf;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3397E606A6A5
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3397E606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWEUrjcf
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a9be758734so3791155f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 08:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623657; x=1796228457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pG5BL8ZNNGX0bHavpvB1CDziqn0Bc8dM4syvlOlGo6c=;
        b=LWEUrjcfPFZoGvNJvS869V5MZ3hpDq2fUp+Y5wBcxRpA7am2jR4H3HxO4AsuhUfMEW
         J0GFQQBe0lDz42hjYO9dlv6x8E8izzj7e6VQI2D909p4PiaaENQXuJhXm+y8KCHiWTur
         GjoXIXiLi9cFLc+CZvQTPdpFlynENs2jY8XfSVjVc+54gZNyQNbiw5xvZtk3KR+AhVDf
         SFZbZOxZgs1qWdRljlklb72XBaUd1se791SE/3WgAQtWnOXuIw6XUxF1eII+q39OXAHt
         9EYv2LG6Ubo7AXwbPWptHVnT99Xl7pijeYBQHcZT5H4LZbUtpGlkmTbD2vGkulPn3wcJ
         6DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623657; x=1796228457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG5BL8ZNNGX0bHavpvB1CDziqn0Bc8dM4syvlOlGo6c=;
        b=PLXbxSMThjmalu2511l7gCgAnD28Wx8iDKGzBGfV0fm7Vjrg/LM5Sg0Oa/JKi0WWJy
         wDy1NHXYc1K3LymLBER+4QphfUVIJd5NcPMM9hVrN07ZMrwiGQ3D33b1Unbq25VZyutf
         naYu9STRjD5z3gOb3nUIM/hj/JNmbU7bn/YSwK9PWq32sb+xkK0AWe9QOGvfFPbGBP53
         ME6MhW+9pE9CPQm1zl31GmU2lv5utvtRXl3n3bdUEV6W88M8FkAUVa6AVi0VqCJyk+8i
         GCQ/deCthszg6plB5bsB2f/dDMPQC8zNTGo8Jnf4hsBbVKXaf/TS58l/MY8KVirC60FO
         pD6w==
X-Forwarded-Encrypted: i=1; AL+hErESAlJNEg74V0eZDyCEInSNvh2DXjbQHjfEfnFiPK8vxbXcWYLMLdCBdSHS9IrVIxfw7pKcg3q08n/x@vger.kernel.org
X-Gm-Message-State: APuU4Z9d+fo0tdrFoMNljC4Kx+RoMFzTR1/ZzgOIqYUs14DDemjr8xSI
	p3kT/3In6vwExCRvG2YFfU/qjhrOuLyLfUcajY2i9rgOffbUpntN5himo9Eqi2CaMtU=
X-Gm-Gg: AZFdTZeR+3WkafQJWonqSP+fDYNLv9pjRIzhHDxQJAJfbTK4zaADtaQh0u4+Fi7qdNJ
	Erm93EIwVCxODUj0+a6VLUNWxZEdaEW2xAheSdlZRfI1bi3QEQ755kVd36dIDW+qedWMZpyN1bK
	6CTywjj3Q8oBqiT1qFcuQFgzj4qoJVmrEvpxMW+cFXin6wOLA8DWiVWOzg9xC5SvauDFhFxZIaE
	qMlpMLtThGWwGpxs8YTz5PWaGw1bl67dIt8q8tBCpaVcdNaJbbiOXLVxI3NkN9pwpq17HpRaeWL
	NHuSlAaUxiVMZXe8bQDxLwaLmF8NuEhERXU0I/lBApTu7CWraJ32vGVXHEt1Br5YvL5c7Bff64n
	5SkytzHgh+/O7K90yvBmGCIx1iWqkSfElIspJWD9uxJnG0rfAIy4fDzMwiDArUnD3iZxniSsh5R
	cX0clrnEsN3dokMGA6imTMgUXMLnF+mi1i8ais93TNfpFt5wv2hMn4j1Q+UBTzpx7XA0o42EA+z
	657eTYbLWOz0K1we/xwG5kfr6DK9QCFSCUTWct+NXFWiR6zTqKqJEEtydmtw6kE42IUB64OxL2D
	3srEX0C8eewEcb4BFS47ROW9LcnW
X-Received: by 2002:a05:6000:4916:b0:4a5:e50:ea5e with SMTP id ffacd0b85a97d-4abaf64bdfbmr29467615f8f.9.1795623657333;
        Wed, 25 Nov 2026 08:20:57 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm32227534f8f.23.2026.11.25.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:57 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 2/3] pwm: rp1: Add RP1 PWM controller driver
Date: Wed, 25 Nov 2026 17:24:51 +0100
Message-ID: <20261125162453.23573-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261125162453.23573-1-andrea.porta@suse.com>
References: <20261125162453.23573-1-andrea.porta@suse.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Naushir Patuck <naush@raspberrypi.com>

The Raspberry Pi RP1 southbridge features an embedded PWM
controller with 4 output channels, alongside an RPM interface
to read the fan speed on the Raspberry Pi 5.

Add the supporting driver.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS           |   7 +
 drivers/pwm/Kconfig   |   7 +
 drivers/pwm/Makefile  |   1 +
 drivers/pwm/pwm-rp1.c | 428 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 drivers/pwm/pwm-rp1.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..5c7b280a2bdb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23376,6 +23376,13 @@ F:	drivers/clk/clk-rp1.c
 F:	drivers/misc/rp1/
 F:	drivers/pinctrl/pinctrl-rp1.c
 
+RASPBERRY PI RP1 PWM DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+L:	linux-pwm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
+F:	drivers/pwm/pwm-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..523789e82355 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -637,6 +637,13 @@ config PWM_ROCKCHIP
 	  Generic PWM framework driver for the PWM controller found on
 	  Rockchip SoCs.
 
+config PWM_RASPBERRYPI_RP1
+	tristate "RP1 PWM support"
+	depends on MISC_RP1 || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  PWM framework driver for Raspberry Pi RP1 controller.
+
 config PWM_SAMSUNG
 	tristate "Samsung PWM support"
 	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
index 5630a521a7cf..c07fd24f69f3 100644
--- a/drivers/pwm/Makefile
+++ b/drivers/pwm/Makefile
@@ -57,6 +57,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
 obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
 obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
 obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+obj-$(CONFIG_PWM_RASPBERRYPI_RP1)	+= pwm-rp1.o
 obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
 obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
 obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
new file mode 100644
index 000000000000..30ab06b4cb75
--- /dev/null
+++ b/drivers/pwm/pwm-rp1.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * pwm-rp1.c
+ *
+ * Raspberry Pi RP1 PWM.
+ *
+ * Copyright © 2026 Raspberry Pi Ltd.
+ *
+ * Author: Naushir Patuck (naush@raspberrypi.com)
+ *
+ * Based on the pwm-bcm2835 driver by:
+ * Bart Tanghe <bart.tanghe@thomasmore.be>
+ *
+ * Datasheet: https://pip-assets.raspberrypi.com/categories/892-raspberry-pi-5/documents/RP-008370-DS-1-rp1-peripherals.pdf?disposition=inline
+ *
+ * Limitations:
+ * - Channels can be enabled/disabled through a global update flag, while the
+ *   period and duty per-channel registers are independently updatable, and
+ *   they are latched on the end of (specific channel) period strobe.
+ *   This means that period and duty changes might result in glitches if the
+ *   period/duty is changed exactly during an end of period strobe.
+ * - Since the duty/period registers are freely updatable (do not depend on
+ *   the global update flag), setting one of them close to the period end and
+ *   the other right afterwards results in a mixed output for that cycle because
+ *   the write ops are not atomic.
+ * - The global update flag prevents mis-sampling of multi-bit bus signals in
+ *   the PWM clock domain. This ensures that all PWM channel settings update
+ *   on the same PWM clock cycle. Channels start in sync only if they share the
+ *   same period.
+ * - If both duty and period are set to 0, the output is a constant low signal
+ *   if polarity is normal or a constant high signal if polarity is inversed.
+ * - When disabled the output is driven to 0 if polarity is normal, or to 1
+ *   if polarity is inversed.
+ * - Disabling the PWM stops the output immediately, without waiting for current
+ *   period to complete first.
+ * - Channels are phase-capable, but on RPi5, the firmware can use a channel
+ *   phase register to report the RPM of the fan connected to that PWM
+ *   channel. As a result, phase control will be ignored for now.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pwm.h>
+#include <linux/units.h>
+#include <linux/spinlock.h>
+
+#define RP1_PWM_GLB_CTRL			0x000
+#define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
+#define RP1_PWM_GLB_CTRL_SET_UPDATE		BIT(31)
+
+#define RP1_PWM_CHAN_CTRL(chan)			(0x014 + ((chan) * 0x10))
+#define RP1_PWM_CHAN_CTRL_POLARITY		BIT(3)
+#define RP1_PWM_CHAN_CTRL_FIFO_POP_MASK		BIT(8)
+#define RP1_PWM_CHAN_CTRL_MODE			GENMASK(2, 0)
+enum rp1_pwm_ctrl_mode {
+	RP1_PWM_CHAN_CTRL_MODE_ZERO,
+	RP1_PWM_CHAN_CTRL_MODE_TE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PC_MS,
+	RP1_PWM_CHAN_CTRL_MODE_PD_ENC,
+	RP1_PWM_CHAN_CTRL_MODE_MSB_SER,
+	RP1_PWM_CHAN_CTRL_MODE_PPM,
+	RP1_PWM_CHAN_CTRL_MODE_LE_MS,
+	RP1_PWM_CHAN_CTRL_MODE_LSB_SER,
+};
+
+#define RP1_PWM_CHAN_CTRL_DEFAULT		(RP1_PWM_CHAN_CTRL_FIFO_POP_MASK +  \
+						FIELD_PREP(RP1_PWM_CHAN_CTRL_MODE, \
+						RP1_PWM_CHAN_CTRL_MODE_TE_MS))
+
+#define RP1_PWM_RANGE(chan)			(0x018 + ((chan) * 0x10))
+#define RP1_PWM_PHASE(chan)			(0x01C + ((chan) * 0x10))
+#define RP1_PWM_DUTY(chan)			(0x020 + ((chan) * 0x10))
+
+#define RP1_PWM_NUM_PWMS			4
+
+struct rp1_pwm {
+	void __iomem *base;
+	struct clk *clk;
+	unsigned long clk_rate;
+	bool clk_enabled;
+	spinlock_t lock; /* sync for RP1_PWM_GLB_CTRL RMW access */
+};
+
+struct rp1_pwm_waveform {
+	u32 period_ticks;
+	u32 duty_ticks;
+	bool enabled;
+	bool inverted_polarity;
+};
+
+static void rp1_pwm_apply_config(struct pwm_chip *chip)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value;
+
+	/* update the changed registers on the next strobe to avoid glitches */
+	value = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	value |= RP1_PWM_GLB_CTRL_SET_UPDATE;
+	writel(value, rp1->base + RP1_PWM_GLB_CTRL);
+}
+
+static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u32 value, polarity;
+
+	/* init channel to reset defaults, preserving the polarity bit */
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	polarity = FIELD_GET(RP1_PWM_CHAN_CTRL_POLARITY, value);
+	value = u32_replace_bits(RP1_PWM_CHAN_CTRL_DEFAULT, polarity, RP1_PWM_CHAN_CTRL_POLARITY);
+	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+
+	return 0;
+}
+
+static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
+				       struct pwm_device *pwm,
+				       const struct pwm_waveform *wf,
+				       void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	u64 period_ticks, duty_ticks, offset_ticks;
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	int ret = 0;
+
+	if (!wf->period_length_ns) {
+		*wfhw = (typeof(*wfhw)){
+			.enabled = false,
+			.inverted_polarity = false,
+		};
+		return 0;
+	}
+
+	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
+
+	/*
+	 * The period is limited to U32_MAX, and it will be decremented by one later
+	 * to allow 100% duty cycle.
+	 */
+	if (period_ticks > U32_MAX) {
+		period_ticks = U32_MAX;
+	} else if (period_ticks < 2) {
+		period_ticks = 2;
+		ret = 1;
+	}
+
+	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
+	duty_ticks = min(duty_ticks, period_ticks);
+	offset_ticks = mul_u64_u64_div_u64(wf->duty_offset_ns, clk_rate, NSEC_PER_SEC);
+	if (offset_ticks >= period_ticks)
+		offset_ticks = period_ticks - 1;
+	if (duty_ticks && offset_ticks &&
+	    duty_ticks + offset_ticks >= period_ticks) {
+		wfhw->duty_ticks = period_ticks - duty_ticks;
+		wfhw->inverted_polarity = true;
+	} else {
+		wfhw->duty_ticks = duty_ticks;
+		wfhw->inverted_polarity = false;
+	}
+	/* Account for the extra tick at the end of the period */
+	wfhw->period_ticks = period_ticks - 1;
+
+	wfhw->enabled = true;
+
+	return ret;
+}
+
+static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+					 struct pwm_device *pwm,
+					 const void *_wfhw,
+					 struct pwm_waveform *wf)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u64 clk_rate = rp1->clk_rate;
+	u64 ticks;
+
+	*wf = (struct pwm_waveform){ };
+
+	if (!wfhw->enabled)
+		return 0;
+
+	wf->period_length_ns = DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1) * NSEC_PER_SEC,
+						(u32)clk_rate);
+
+	if (!wfhw->inverted_polarity) {
+		ticks = min_t(u64, wfhw->duty_ticks, (u64)wfhw->period_ticks + 1);
+		wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC,
+						      (u32)clk_rate);
+	} else {
+		u64 period = (u64)wfhw->period_ticks + 1;
+
+		/* if duty_ticks >= period the output is constantly low: keep wf zeroed */
+		if (wfhw->duty_ticks < period) {
+			ticks = period - wfhw->duty_ticks;
+			wf->duty_length_ns = DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, (u32)clk_rate);
+			wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
+							      (u32)clk_rate);
+		}
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_write_waveform(struct pwm_chip *chip,
+				  struct pwm_device *pwm,
+				  const void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	const struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value, ctrl;
+
+	/* set polarity */
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	if (!wfhw->inverted_polarity)
+		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
+	else
+		value |= RP1_PWM_CHAN_CTRL_POLARITY;
+	writel(value, rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+
+	guard(spinlock_irqsave)(&rp1->lock);
+
+	/* early exit if disabled */
+	ctrl = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	if (!wfhw->enabled) {
+		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+		/* just disable the channel and bail out early */
+		writel(ctrl, rp1->base + RP1_PWM_GLB_CTRL);
+		rp1_pwm_apply_config(chip);
+		return 0;
+	}
+
+	/* set period and duty cycle */
+	writel(wfhw->period_ticks, rp1->base + RP1_PWM_RANGE(pwm->hwpwm));
+	writel(wfhw->duty_ticks, rp1->base + RP1_PWM_DUTY(pwm->hwpwm));
+
+	/* enable the channel */
+	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
+	writel(ctrl,  rp1->base + RP1_PWM_GLB_CTRL);
+
+	rp1_pwm_apply_config(chip);
+
+	return 0;
+}
+
+static int rp1_pwm_read_waveform(struct pwm_chip *chip,
+				 struct pwm_device *pwm,
+				 void *_wfhw)
+{
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	struct rp1_pwm_waveform *wfhw = _wfhw;
+	u32 value;
+
+	*wfhw = (typeof(*wfhw)) {
+		.period_ticks = 0,
+		.duty_ticks = 0,
+	};
+
+	value = readl(rp1->base + RP1_PWM_GLB_CTRL);
+	wfhw->enabled = !!(value & RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm));
+
+	value = readl(rp1->base + RP1_PWM_CHAN_CTRL(pwm->hwpwm));
+	wfhw->inverted_polarity = !!(value & RP1_PWM_CHAN_CTRL_POLARITY);
+
+	if (wfhw->enabled) {
+		wfhw->period_ticks = readl(rp1->base + RP1_PWM_RANGE(pwm->hwpwm));
+		wfhw->duty_ticks = readl(rp1->base + RP1_PWM_DUTY(pwm->hwpwm));
+	}
+
+	return 0;
+}
+
+static const struct pwm_ops rp1_pwm_ops = {
+	.sizeof_wfhw = sizeof(struct rp1_pwm_waveform),
+	.request = rp1_pwm_request,
+	.round_waveform_tohw = rp1_pwm_round_waveform_tohw,
+	.round_waveform_fromhw = rp1_pwm_round_waveform_fromhw,
+	.read_waveform = rp1_pwm_read_waveform,
+	.write_waveform = rp1_pwm_write_waveform,
+};
+
+static int rp1_pwm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	unsigned long clk_rate;
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+	int ret;
+
+	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
+	if (IS_ERR(chip))
+		return PTR_ERR(chip);
+
+	rp1 = pwmchip_get_drvdata(chip);
+	spin_lock_init(&rp1->lock);
+
+	rp1->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rp1->base))
+		return PTR_ERR(rp1->base);
+
+	rp1->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(rp1->clk))
+		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+	rp1->clk_enabled = true;
+
+	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
+		goto err_disable_clk;
+	}
+
+	clk_rate = clk_get_rate(rp1->clk);
+	if (!clk_rate) {
+		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
+		goto err_disable_clk;
+	}
+	/*
+	 * To prevent u64 overflow in period calculations:
+	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
+	 * If clk_rate > 1 GHz, the result can overflow.
+	 */
+	if (clk_rate > HZ_PER_GHZ) {
+		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
+		goto err_disable_clk;
+	}
+	rp1->clk_rate = clk_rate;
+
+	chip->ops = &rp1_pwm_ops;
+	chip->atomic = true;
+
+	platform_set_drvdata(pdev, chip);
+
+	ret = pwmchip_add(chip);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
+		goto err_disable_clk;
+	}
+
+	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(rp1->clk);
+
+	return ret;
+}
+
+static void rp1_pwm_remove(struct platform_device *pdev)
+{
+	struct pwm_chip *chip = platform_get_drvdata(pdev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	pwmchip_remove(chip);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+}
+
+/*
+ * The PWM core is never powered off, so it retains its
+ * register configuration across suspend/resume. This
+ * means there's no need to save and restore the
+ * channel control register.
+ */
+static int rp1_pwm_suspend(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+
+	if (rp1->clk_enabled) {
+		clk_disable_unprepare(rp1->clk);
+		rp1->clk_enabled = false;
+	}
+
+	return 0;
+}
+
+static int rp1_pwm_resume(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
+	int ret;
+
+	ret = clk_prepare_enable(rp1->clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
+		return ret;
+	}
+	rp1->clk_enabled = true;
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
+
+static const struct of_device_id rp1_pwm_of_match[] = {
+	{ .compatible = "raspberrypi,rp1-pwm" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
+
+static struct platform_driver rp1_pwm_driver = {
+	.probe = rp1_pwm_probe,
+	.remove = rp1_pwm_remove,
+	.driver = {
+		.name = "rp1-pwm",
+		.of_match_table = rp1_pwm_of_match,
+		.pm = pm_ptr(&rp1_pwm_pm_ops),
+	},
+};
+module_platform_driver(rp1_pwm_driver);
+
+MODULE_DESCRIPTION("RP1 PWM driver");
+MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
+MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0

