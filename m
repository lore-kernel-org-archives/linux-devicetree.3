Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920265;
	b=twADrzCz9Tmq2j8jMkFu30LgWiNhpeKh+rzVchtkprH3oA5DebnHsE1G/mbmgTRnkHgG
	 r9jYdlpfstvxagu5nig8OB8tUS4zQEC0YJHC3bsKowq8T8+LcYwJqumftWWg4rgsyF4QU
	 83vMtioVTmJ9x0kenZ+HG8WFplDSsfm+NoKVxonC/vkk8nGEufD5Qrvpn4EX1RSiLhRQn
	 B5wUocs19KHwWJDcGnUhOMAOLOgUzUUyYd0DrX/eHM2Qh0IBwb7P+WqTecC3ssnWdVbM2
	 3VDui+yd4lnT345/kt8EA6ebS21c0cMANsgvW+qPx1pEX3dV8hb++cLurfKFG7DTmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
	b=eIwgabn2COlH4AgLpky8aF2ep7F3OD9dIT11RSVMuZ1w3wEnOuiYibbEsd5MzRDhhxh5
	 ksziYnN5FnZfuDr1fOzECp4hfIvxKJi5MovczzXnWEFHUHpcBRw9Ofmo3XV5cvwyLeSEz
	 ZDmnaSGSVrQ0ZFyDAgsvlLEg3orA59CD/qCHw3MdmXILxjUnQdElbNJHY+R3O7aZ3M98U
	 VrRWS9RL8kD0vubir/MsEPmg8HTYIgGr5BS7rM0ixIFzrAIRMi62jkS0QwmFB0kwaTHuB
	 62PkCoCtejb4U9bgFAOn3eIJk5Q4sucDDKeg3P8rKmWyDFbT76XiGGo+maw6rJStp4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LKrWpwk8;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026E606A885
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D026E606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LKrWpwk8
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-381d542bc29so585218eec.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794920264; x=1795525064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
        b=LKrWpwk8wxGRk/ZAR9288gUXZasxTQ00We+LFSUuF+2O/S/Zr2g+cLRKoKE3svpJpO
         MNeNZ33631F1AgxLqz5oSoBARxcfPyXTkQyQxIPAo0T8uIFjGMlRqDqcGdcwt0YlazEd
         UxgKd4Dof8YTIKbKiJIi3sPwD2823rzy6aBcgt8KKQNU2LoEYTueE8ytC4CXiJih7B75
         vlcL/XKJ8N2gP8xz/xdggB8uEhKhC6xAanOF7KKyGTbYfzQGk6iIwevPdmLVlxkHz0DR
         hBhITe8GiX8MKXVnQDMM1JOiEfEv3j2tQg70h44ITbNz2DY5Fd9YrbBJAscvxZJrp4EO
         6DNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920264; x=1795525064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQrUEKIgQADfS/33YKuEWTwKC79jGZABfGIvj6qgGpc=;
        b=LCDJ7iW86dDTpUTwZTTKGmRrfn6DYJ63zGT340iSoMyBF7G8XdEM+jXl5gFreK9Wx+
         9QJSMIWrGAWmfXWQpi6mhJz3RpbHDozUndI7njwU7nVL2b8FkWZ6llvocdqJ/YDvZHjX
         QMGzW7KmqK1I0ZBoE3tVggOSgBAakMDbA8iknIy/qTZo4CYN3xBMVbgA0lmI9AfheiyE
         gtiRQDQhS5bWEb3n3VeOL8D+PSO4kFhRFgKHvuMfsZwiS77z3iNkNOEb4Osr4W97pWPQ
         3iNNzsC5+mPleP3Ae6VJBBbNgQmJsMWzrMs8EJb51Pz0iNYw13WvChnKOVqeth3OiEYX
         Jh7Q==
X-Forwarded-Encrypted: i=1; AL+hErGgUDhp12RfNYLRmvLfX+jERf7Wh7oRN5cVseXJzwmBFsmxWfFo/zqZDUN5l48IKrw2iAfICC57DqOU@vger.kernel.org
X-Gm-Message-State: APuU4Z935CDvTB7EQLyXxWNbog1jzebbWoQxgSnftW2A5ZxPOAPXCyMI
	w96uR1gM42I1+woBAiuEt9MaUwApX7JYoNRvuxh02OUYs1LF8kcl6qCVlyS8oahBfdk=
X-Gm-Gg: AZFdTZfWVN1TkjxDmN0rey4v9bXxq1fmHO5A9yo6S9SrkPcu6gbZHfeL6LtqiW45cLy
	bR3WQD/baCIufCn2WfDPylG2PxR0LuN1MlG+Al9WZ1L5ueMtNCS/iIhNRQXUifMksa3Sf+WAI19
	4Axc7KWMSLb3EUG2jqIMKiAIigyLErE/owiwgG+nor1FSWveKN+LTOle0OArRzjr2zZCDFccSx+
	twMzNHbyc7bDWlprveMlfrf0lNkUw7/sQnopgVYA3d66q+4UMh7isn85vixoeZTP+8W4cxSGtAB
	xyNzRJSa4eR+sbXdnsCF10VxdW/nwgviPBu5Xp3wwS5VhK1HvzCV9xG1aLDU1zBcGYhSJXb65eb
	pru2SUH75eXUzYwN4vXV5kBe2iFnqjSiZFIx6WvEqeAcCk8SjUb7sJ1v66hYwc0k7nZaWeALp4l
	8NBLxd8fmaQMwGMzEx+6YLTQXvdR4OXjQruKkJkPi1jJ1KnEgAl25quYixqVexAOXjYU/OSONEy
	2Bvsw4EBmQrlwdbx1W4yb4nGgLJNnl62E9gy1MpGMbculXgCCZBFZJ2HVNhdzl+/DXJBadL4z5o
	T5ZXpdNBJ7ygGb5S0zpZg0JwYuz3ykvJuUc7EO9J91AotScEU9YxV1Rp7Afb1Wi/2/Rn
X-Received: by 2002:a05:693c:8114:b0:36e:a321:5353 with SMTP id 5a478bee46e88-37963371e09mr14353939eec.2.1794920263680;
        Tue, 17 Nov 2026 04:57:43 -0800 (PST)
Received: from [127.0.1.1] ([2804:14c:4c5:8bf0::a1aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm44767034eec.11.2026.11.17.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:57:43 -0800 (PST)
From: Hiago De Franco <hfranco@baylibre.com>
Date: Tue, 17 Nov 2026 09:57:14 -0300
Subject: [PATCH 2/3] pwm: sophgo-sg2042: add support for CV1800B
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-milkv-duo-pwm-v1-2-3f1786ea57b7@baylibre.com>
References: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
In-Reply-To: <20261117-milkv-duo-pwm-v1-0-3f1786ea57b7@baylibre.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-pwm@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16.0

The CV1800B SoC embeds four instances of a PWM controller derived from
the one found on the SG2042 and SG2044 SoCs. The register layout is
mostly the same, but there are some differences handled by this patch:

- PERIOD and HLPERIOD are 30 bits wide and PERIOD must be strictly
  greater than HLPERIOD. As a consequence, a 100% duty cycle cannot be
  represented and the period must be at least two input clock cycles.
- The meaning of the POLARITY bit is inverted compared to the SG2044:
  0 selects a low default level and 1 a high default level.
- A polarity change takes effect immediately, even while the channel is
  running.
- New values written to HLPERIOD/PERIOD while the channel is running are
  only latched after a 0 -> 1 -> 0 sequence on the PWMUPDATE bit.
- When the counter is stopped, the pin is parked at the level selected by
  POLARITY. Emitting the inactive level would require changing POLARITY,
  which would make the polarity read back from the hardware differ from the
  requested one, so the driver disables the output instead.

Add a dedicated set of pwm_ops for the CV1800B to take these differences
into account, and update the module description accordingly. Update the
Kconfig entry to describe all the SoCs supported by the driver,
including the already supported SG2044.

This was tested on Milk-V Duo with a logic analyzer (GP4/pwm1 ch1).

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
 drivers/pwm/Kconfig             |   7 +-
 drivers/pwm/pwm-sophgo-sg2042.c | 201 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 199 insertions(+), 9 deletions(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 729776086879..877d5bfa0bb0 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -671,11 +671,12 @@ config PWM_SL28CPLD
 	  will be called pwm-sl28cpld.
 
 config PWM_SOPHGO_SG2042
-	tristate "Sophgo SG2042 PWM support"
+	tristate "Sophgo SG2042/SG2044/CV1800B PWM support"
 	depends on ARCH_SOPHGO || COMPILE_TEST
 	help
-	  PWM driver for the PWM controller on Sophgo SG2042 SoC. The PWM
-	  controller supports outputing 4 channels of PWM waveforms.
+	  PWM driver for the PWM controller on Sophgo SG2042, SG2044 and
+	  CV1800B SoCs. Each controller supports 4 channels of PWM
+	  waveforms.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called pwm_sophgo_sg2042.
diff --git a/drivers/pwm/pwm-sophgo-sg2042.c b/drivers/pwm/pwm-sophgo-sg2042.c
index 0b6461172e6a..45eb1871a127 100644
--- a/drivers/pwm/pwm-sophgo-sg2042.c
+++ b/drivers/pwm/pwm-sophgo-sg2042.c
@@ -1,21 +1,30 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Sophgo SG2042 PWM Controller Driver
+ * Sophgo SG2042/SG2044/CV1800B PWM Controller Driver
  *
  * Copyright (C) 2024 Sophgo Technology Inc.
  * Copyright (C) 2024 Chen Wang <unicorn_wang@outlook.com>
  *
  * Limitations:
- * - After reset, the output of the PWM channel is always high.
+ * - After reset, the output of the SG2042 PWM channel is always high.
  *   The value of HLPERIOD/PERIOD is 0.
  * - When HLPERIOD or PERIOD is reconfigured, PWM will start to
  *   output waveforms with the new configuration after completing
  *   the running period.
- * - When PERIOD and HLPERIOD is set to 0, the PWM wave output will
+ * - When PERIOD and HLPERIOD is set to 0, the SG2042 PWM wave output will
  *   be stopped and the output is pulled to high.
- * - SG2044 supports both polarities, SG2042 only normal polarity.
- * See the datasheet [1] for more details.
+ * - SG2044 and CV1800B support both polarities, SG2042 only normal polarity.
+ * - On CV1800B the pin is parked at the level selected by POLARITY while the
+ *   counter is stopped. Emitting the inactive level would require changing
+ *   POLARITY, so the driver disables the output (input mode) instead.
+ * - On CV1800B a polarity change takes effect immediately, even while the
+ *   channel is running.
+ * - On CV1800B a 100% duty cycle is not representable. It is rounded down to
+ *   one input clock cycle less than the period.
+ * - On CV1800B the period must be at least 2 input clock cycles.
+ * See the datasheets [1] and [2] for more details.
  * [1]:https://github.com/sophgo/sophgo-doc/tree/main/SG2042/TRM
+ * [2]:https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
  */
 
 #include <linux/clk.h>
@@ -44,10 +53,14 @@
 
 #define SG2044_PWM_POLARITY		0x40
 #define SG2044_PWM_PWMSTART		0x44
+#define SG2044_PWM_PWMUPDATE		0x4c
 #define SG2044_PWM_OE			0xd0
 
 #define SG2042_PWM_CHANNELNUM	4
 
+#define CV1800B_PWM_MAX_PERIOD	GENMASK(29, 0)
+#define CV1800B_PWM_MIN_PERIOD	2
+
 /**
  * struct sg2042_pwm_ddata - private driver data
  * @base:		base address of mapped PWM registers
@@ -155,6 +168,14 @@ static void pwm_sg2044_set_outputen(struct sg2042_pwm_ddata *ddata, struct pwm_d
 	writel(pwmstart, ddata->base + SG2044_PWM_PWMSTART);
 }
 
+static bool pwm_sg2044_get_outputen(struct sg2042_pwm_ddata *ddata,
+				    struct pwm_device *pwm)
+{
+	u32 pwmstart = readl(ddata->base + SG2044_PWM_PWMSTART);
+
+	return !!(pwmstart & BIT(pwm->hwpwm));
+}
+
 static void pwm_sg2044_set_outputdir(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
 				     bool enabled)
 {
@@ -208,6 +229,171 @@ static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return 0;
 }
 
+static int pwm_cv1800b_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
+				 struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	unsigned int chan = pwm->hwpwm;
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+	u32 pwm_polarity;
+
+	/* PWMSTART is set to 1 while the channel is running. */
+	state->enabled = pwm_sg2044_get_outputen(ddata, pwm);
+
+	period_ticks = readl(ddata->base + SG2042_PWM_PERIOD(chan));
+	hlperiod_ticks = readl(ddata->base + SG2042_PWM_HLPERIOD(chan));
+
+	if (!period_ticks) {
+		/*
+		 * No waveform is configured, so don't report a duty_cycle
+		 * larger than the period.
+		 */
+		state->enabled = false;
+		state->period = 0;
+		state->duty_cycle = 0;
+	} else {
+		if (hlperiod_ticks >= period_ticks)
+			hlperiod_ticks = period_ticks - 1;
+
+		state->period = DIV_ROUND_UP_ULL((u64)period_ticks * NSEC_PER_SEC,
+						 ddata->clk_rate_hz);
+		state->duty_cycle = DIV_ROUND_UP_ULL((u64)hlperiod_ticks * NSEC_PER_SEC,
+						     ddata->clk_rate_hz);
+	}
+
+	pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	/*
+	 * Without a configured waveform POLARITY has no meaning, so report the
+	 * neutral default instead of the register's reset value.
+	 */
+	if (period_ticks && !(pwm_polarity & BIT(chan)))
+		state->polarity = PWM_POLARITY_INVERSED;
+	else
+		state->polarity = PWM_POLARITY_NORMAL;
+
+	return 0;
+}
+
+static void pwm_cv1800b_set_pwmupdate(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				      bool enable)
+{
+	u32 pwm_update = readl(ddata->base + SG2044_PWM_PWMUPDATE);
+
+	if (enable)
+		pwm_update |= BIT(pwm->hwpwm);
+	else
+		pwm_update &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_update, ddata->base + SG2044_PWM_PWMUPDATE);
+}
+
+static void pwm_cv1800b_set_polarity(struct sg2042_pwm_ddata *ddata, struct pwm_device *pwm,
+				     bool high)
+{
+	u32 pwm_polarity = readl(ddata->base + SG2044_PWM_POLARITY);
+
+	/*
+	 * POLARITY on CV1800B is the opposite of SG2044: 0 selects a low
+	 * default level (HLPERIOD counts low cycles), 1 selects a high
+	 * default level (HLPERIOD counts high cycles).
+	 */
+	if (high)
+		pwm_polarity |= BIT(pwm->hwpwm);
+	else
+		pwm_polarity &= ~BIT(pwm->hwpwm);
+
+	writel(pwm_polarity, ddata->base + SG2044_PWM_POLARITY);
+}
+
+static int pwm_cv1800b_set_dutycycle(struct pwm_chip *chip, struct pwm_device *pwm,
+				     const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	u32 hlperiod_ticks;
+	u32 period_ticks;
+	u64 ticks;
+
+	/*
+	 * Duration of High level (duty_cycle) = HLPERIOD x Period_of_input_clk
+	 * Duration of One Cycle (period) = PERIOD x Period_of_input_clk
+	 *
+	 * Different from sg2042, cv1800b has max of 30 bits and PERIOD must be
+	 * strictly greater than HLPERIOD. The shortest representable period is
+	 * two input clock cycles; reject anything shorter instead of rounding
+	 * it up.
+	 */
+	ticks = mul_u64_u64_div_u64(ddata->clk_rate_hz, state->period, NSEC_PER_SEC);
+	period_ticks = min_t(u64, ticks, CV1800B_PWM_MAX_PERIOD);
+	if (period_ticks < CV1800B_PWM_MIN_PERIOD)
+		return -EINVAL;
+
+	ticks = mul_u64_u64_div_u64(ddata->clk_rate_hz, state->duty_cycle, NSEC_PER_SEC);
+	hlperiod_ticks = min_t(u64, ticks, period_ticks - 1);
+
+	dev_dbg(pwmchip_parent(chip), "chan[%u]: ENABLE=%u, PERIOD=%u, HLPERIOD=%u, POLARITY=%u\n",
+		pwm->hwpwm, state->enabled, period_ticks, hlperiod_ticks, state->polarity);
+
+	pwm_sg2042_config(ddata, pwm->hwpwm, period_ticks, hlperiod_ticks);
+
+	return 0;
+}
+
+static int pwm_cv1800b_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			     const struct pwm_state *state)
+{
+	struct sg2042_pwm_ddata *ddata = pwmchip_get_drvdata(chip);
+	bool high = state->polarity == PWM_POLARITY_NORMAL;
+	bool running = pwm_sg2044_get_outputen(ddata, pwm);
+	int ret;
+
+	if (!state->enabled) {
+		/*
+		 * While the counter is stopped the pin is parked at the level
+		 * selected by POLARITY, i.e. at the level the waveform starts
+		 * with. Emitting the inactive level would require changing
+		 * POLARITY, which would make the polarity read back from the
+		 * hardware differ from the requested one. Disable the output
+		 * instead.
+		 */
+		pwm_sg2044_set_outputen(ddata, pwm, false);
+		pwm_sg2044_set_outputdir(ddata, pwm, false);
+
+		return 0;
+	}
+
+	ret = pwm_cv1800b_set_dutycycle(chip, pwm, state);
+	if (ret)
+		return ret;
+
+	pwm_cv1800b_set_polarity(ddata, pwm, high);
+
+	if (!running) {
+		pwm_cv1800b_set_pwmupdate(ddata, pwm, false);
+		pwm_sg2044_set_outputdir(ddata, pwm, true);
+		pwm_sg2044_set_outputen(ddata, pwm, true);
+
+		return 0;
+	}
+
+	/*
+	 * Write 1 and then 0 to PWMUPDATE[n] to latch new HLPERIOD/PERIOD
+	 * values while the channel is running.
+	 */
+	pwm_cv1800b_set_pwmupdate(ddata, pwm, true);
+	pwm_cv1800b_set_pwmupdate(ddata, pwm, false);
+
+	return 0;
+}
+
+static const struct sg2042_chip_data cv1800b_chip_data = {
+	.ops = {
+		.apply = pwm_cv1800b_apply,
+		.get_state = pwm_cv1800b_get_state,
+	},
+};
+
 static const struct sg2042_chip_data sg2042_chip_data = {
 	.ops = {
 		.apply = pwm_sg2042_apply,
@@ -224,6 +410,9 @@ static const struct sg2042_chip_data sg2044_chip_data = {
 
 static const struct of_device_id sg2042_pwm_ids[] = {
 	{
+		.compatible = "sophgo,cv1800b-pwm",
+		.data = &cv1800b_chip_data,
+	}, {
 		.compatible = "sophgo,sg2042-pwm",
 		.data = &sg2042_chip_data,
 	}, {
@@ -296,5 +485,5 @@ module_platform_driver(pwm_sg2042_driver);
 
 MODULE_AUTHOR("Chen Wang");
 MODULE_AUTHOR("Longbin Li <looong.bin@gmail.com>");
-MODULE_DESCRIPTION("Sophgo SG2042 PWM driver");
+MODULE_DESCRIPTION("Sophgo SG2042/SG2044/CV1800B PWM driver");
 MODULE_LICENSE("GPL");

-- 
2.53.0

