Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7808E477E42
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580188; cv=none; b=DPhxrVwNgNvt6SbD9e9fP4rvMNzDEND42c87fr6RsC2qF+Qh3ZCWQ23O1HXy5Z0ONRdlsVBQq+k8vwq9QElmqRIv7YbSeD83aUSRasBK5OHtHB8aHmtTtaIVtbrcIQOUYABweQh1HDUgnTPJbEgCE2iRD12O5r3iO77i/wqAPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580188; c=relaxed/simple;
	bh=BxsTUewbsv2I+gfWh6SizCCW8tttS8dvRtp/YVKPd90=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgiqlfwR2Y2LMjf4XNMcrvYNWyp+wEjLEyi7kVq+KFX0hn0aIkxQHEQRBevnyFbac+PWEjZOJXyJxtWpEDSzGDmn1akFblpwDCmwj/lKTpI0jLDMjAczqfJ/Y7j4JXMaRKj+VcMCjzyFkjfOaMKtCkItFbNEQ2R8C+aVOTBYR1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=At7uDi71; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="At7uDi71"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b613a17bso7232235e9.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 06:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780580185; x=1781184985; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v6GdKVvECywjXiT0mRrreIU+7xtDE0HxPtley59ewis=;
        b=At7uDi71P2HCtL5gFy41UzG7ALjLmcyPb3mXBXJU9WuJxUgYZVL92W4c6sfb8CoTlP
         tpHsToZk4FXBoWpDz7G3PFzxvB9re30iqQQFs8IrkYSpalT7VLyBBEjtqGxNMJT7LPxZ
         uvkalLmHBsOUaCYRY+VrO9gzEIzm0YTg9SN35yJdD8bBxyzrfo8D5HA2C8h3JIaWtdE7
         ibRLPkr/vfW1iN8y7AXd6YdpYfjSmmd6F6TrPvOKaTa77/+xbSJ0mPpNPVqphHhnUXlX
         SuIBtyB4/YF0WA7IDWmNK15wmLbHyr0upmkjAxKqNi+idPoIN/AiT8c2G7fefgIXYGeV
         m8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780580185; x=1781184985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v6GdKVvECywjXiT0mRrreIU+7xtDE0HxPtley59ewis=;
        b=GrGBfOn2nzyLeUlMoN/FyIMVwBgI1e9RjcRV/ronsvBx9RJ0Zbr71PB4hkpHkSHUp5
         7reyQaeLERGTcmHN0Lc/0TS6q9GBJE9eFlVuFpp2kEFpKxdDhv6hEoo3EEkouTraxUk4
         l8uqXfAgEXY9nHTCEaO+ENLho55u8B45ICeR7lKiNiCOOLh3i/T6RT72GkFHgOqflsVf
         8Sc95IQ6nJjLTG5yK7k7q7aF1KreDRHmj/+xPERuI7Qb4x1VCrzghlcTz4H4sFdfu0CZ
         cBYZMduzTgKaeiSmNAPFTA8WyVDLtgUIUQKEKJqpxf2lKvynjfXreuaIazm4pmAVE9LL
         svYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b8WxCBQr7aOLlRgNmMH3+A4trfDJDMZPDdqXLpE7JPDKiAjGbrwDF+iUrWt2sD0VFw5Ce4B/qXhSH@vger.kernel.org
X-Gm-Message-State: AOJu0YymRQbAoeCp+BZl5cIU+ypyxxnLkKHIzf2+Sd0qWjqePi7zCbLA
	Agul2Dtr9+hnOUADea/Lx3Tp2BH4F/SRHZ8JAu1pDImSXIQUASU9C0Gt4gv88LHXtO2QRTnHpmq
	H0MAMg5g=
X-Gm-Gg: Acq92OELGE966IBGZzgn+BnStZaOfZUmhCZfza7ILCmjJXnzshj1ynxgAVx+N8IZ2cx
	v2hzNaMzU8LtQs0rfuGKtNoF1+QXRHF25pZc4APEx/k/6GguJCR6A2koOpoR+NuU+dKJ9tEySeO
	2FC3JJhWvb7gzTgwqectYzf9hBIMDpdmRZHssTY+t074UhffnqX14q1jIGq5wTW7m8zh7NmCckq
	nNasOMJPLmfP4GMTFIM2tKjfdG+82XCe4WVWjnglhhAFWZgGKyL28Dp4VRuGwvpQmeLMW70HHH/
	WH2tTsDawdPaqFGh4tuBLH6p23LDTBWhBSTiWFwCuA0Lcq7QzZoJFH2ngrbhbF3vXlEz8RiAGay
	ySV+c/RUV1qCSV7EN4F44vJKDO6398g05kTsu4U5AGsRQbpWTh1OzNkWZiEzNrgSYz7mBVzatV1
	cm3NVL2J2zQ+lq+jvenamAPEiyyme/I/Lrma30Z3Ts9Q==
X-Received: by 2002:a05:600c:638d:b0:489:2005:b36e with SMTP id 5b1f17b1804b1-490b5ecc90bmr142484515e9.19.1780580184781;
        Thu, 04 Jun 2026 06:36:24 -0700 (PDT)
Received: from localhost ([195.94.146.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm53001575e9.8.2026.06.04.06.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 06:36:24 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 4 Jun 2026 15:39:44 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <aiGAINsTG8VZLn28@apocalypse>
References: <8eef956a5eb473f051bbda89ec4c9991c1b47de2.1780498640.git.andrea.porta@suse.com>
 <20260603154716.1B5C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603154716.1B5C41F00893@smtp.kernel.org>

On 15:47 Wed 03 Jun     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] Missing `pwmchip_remove()` on the `of_syscon_register_regmap()` error path leaves a dangling PWM chip.
> - [High] When disabling a PWM channel, the driver fails to clear the polarity bit, causing the output to erroneously remain HIGH if it was previously inverted.
> - [High] Registering a devm-managed regmap with the permanent syscon registry creates a teardown asymmetry.
> - [High] Hardware channel control registers (`CHAN_CTRL`) are not restored across system suspend/resume.
> - [Medium] Non-monotonic period limit checking in `rp1_pwm_round_waveform_tohw()` causes larger requested periods to result in smaller hardware periods.
> - [Medium] Calculating `period_length_ns` from hardware state suffers from a 32-bit integer overflow before casting to u64, resulting in a zero period.
> - [Medium] Calculating inverted polarity duty length underflows if the hardware is configured for a 100% duty cycle.
> - [Medium] Returning a positive integer (1) from `round_waveform_tohw` incorrectly propagates as an error.
> --
> 
> commit 90d2019e94496c6949f2d04c2605c6a197b16d6a
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> pwm: rp1: Add RP1 PWM controller driver
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM controller
> with 4 output channels, alongside an RPM interface to read the fan
> speed on the Raspberry Pi 5. Add the supporting driver.
> 
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..052c3ae770569
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> [ ... ]
> > +static int rp1_pwm_round_waveform_tohw(struct pwm_chip *chip,
> > +				       struct pwm_device *pwm,
> > +				       const struct pwm_waveform *wf,
> > +				       void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u64 period_ticks, duty_ticks, offset_ticks;
> > +	struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	int ret = 0;
> > +
> > +	if (!wf->period_length_ns) {
> > +		wfhw->enabled = false;
> > +		return 0;
> > +	}
> > +
> > +	period_ticks = mul_u64_u64_div_u64(wf->period_length_ns, clk_rate, NSEC_PER_SEC);
> > +
> > +	/*
> > +	 * The period is limited to U32_MAX - 1
> > +	 * to allow 100% duty cycle.
> > +	 */
> > +	if (period_ticks > U32_MAX) {
> > +		period_ticks = U32_MAX - 1;
> 
> [Severity: Medium]
> Does this limit check break monotonicity for large periods?
> 
> If the requested period translates to U32_MAX, this condition is false and
> the period becomes U32_MAX - 1.
> 
> If it translates to U32_MAX + 1, it becomes U32_MAX - 1, which is then
> subtracted by 1 later, yielding U32_MAX - 2. This makes a larger requested
> period result in a smaller actual hardware period.

Ack. I will set period_ticks = U32_MAX in that if.

> 
> > +	} else if (!period_ticks) {
> > +		period_ticks = 2;
> > +		ret = 1;
> > +	}
> 
> [Severity: Medium]
> Is returning a positive integer here intentional?
> 
> The PWM core subsystem expects round_waveform_tohw callbacks to return 0 on
> success or a negative error code on failure. Returning 1 could propagate as
> an error up to consumer drivers, breaking operation for very small periods.

It should return 1 in case the if any value is rounded, which in this case 
is the period.

> 
> > +
> > +	duty_ticks = mul_u64_u64_div_u64(wf->duty_length_ns, clk_rate, NSEC_PER_SEC);
> [ ... ]
> > +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> > +					 struct pwm_device *pwm,
> > +					 const void *_wfhw,
> > +					 struct pwm_waveform *wf)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u64 clk_rate = rp1->clk_rate;
> > +	u32 ticks;
> > +
> > +	*wf = (struct pwm_waveform){ };
> > +
> > +	if (!wfhw->enabled)
> > +		return 0;
> > +
> > +	wf->period_length_ns = DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1) * NSEC_PER_SEC,
> > +						clk_rate);
> 
> [Severity: Medium]
> Could this encounter a 32-bit integer overflow?
> 
> Since wfhw->period_ticks is a 32-bit integer, the addition of 1 happens in
> 32-bit space before the cast to u64.
> 
> If the hardware register was configured to 0xffffffff by the bootloader for
> a 100% duty cycle, 0xffffffff + 1 wraps around to 0, producing a period of 0.
> 
> Should the cast be placed before the addition?

Ack. 0xffffffff should be deemed as a non valid value though.

> 
> > +
> > +	if (!wfhw->inverted_polarity) {
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty_ticks * NSEC_PER_SEC,
> > +						      clk_rate);
> > +	} else {
> > +		ticks = wfhw->period_ticks + 1 - wfhw->duty_ticks;
> > +		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)ticks * NSEC_PER_SEC, clk_rate);
> 
> [Severity: Medium]
> Will this subtraction underflow if the hardware is configured for a 100%
> duty cycle?
> 
> The driver allows duty_ticks to exceed period_ticks + 1 to achieve a 100%
> duty cycle.

The driver is not allowing this since tohw() has this: 

duty_ticks = min(duty_ticks, period_ticks);

Anyway, if fromhw() is called first and the bootloader has configured 0xffffffff
in the period register, should it returns an error? The period should always be
at most U32_MAX-1.

> 
> If inverted polarity is active and duty_ticks is strictly larger than
> period_ticks + 1, this unsigned 32-bit subtraction will wrap around to a
> massive integer, corrupting the duty_length_ns.
> 

This should not happen for the reasono stated above. I'll add the correct cast
anyway for the sake of completion.

> > +		wf->duty_offset_ns = wf->period_length_ns - wf->duty_length_ns;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value, ctrl;
> > +
> > +	/* early exit if disabled */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > +	if (!wfhw->enabled) {
> > +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +		goto exit_disable;
> > +	}
> 
> [Severity: High]
> Does skipping the polarity update here cause the output to erroneously
> remain HIGH while disabled?
> 
> The early exit skips the read-modify-write block that updates
> RP1_PWM_CHAN_CTRL_POLARITY.
> 
> The driver notes state that when disabled, the output is driven to 1 if
> polarity is inversed. If a channel previously configured with inverted
> polarity is disabled, it seems it will continually output a HIGH signal,
> violating the PWM framework expectation.

I'm not sure whether an inverted polarity pin shoudl stay low when disabled.
After all, the inactive state for a reversed pin is high.

> 
> > +
> > +	/* set period and duty cycle */
> > +	regmap_write(rp1->regmap,
> [ ... ]
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	chip->ops = &rp1_pwm_ops;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = pwmchip_add(chip);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	ret = of_syscon_register_regmap(np, rp1->regmap);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> > +		goto err_disable_clk;
> > +	}
> 
> [Severity: High]
> Is there a missing call to pwmchip_remove() on this error path?
> 
> If of_syscon_register_regmap() fails, the function jumps to err_disable_clk
> and returns an error.
> 
> Since the chip was allocated with devm_pwmchip_alloc(), devres will free
> the memory, but the PWM subsystem will retain pointers to the freed chip in
> its IDR mapping, potentially leading to a use-after-free.

Ack.

> 
> [Severity: High]
> Also, does registering a devm-managed regmap with the permanent syscon
> registry create a teardown asymmetry?
> 
> The regmap is allocated with devm_regmap_init_mmio(). If the underlying
> device is hotplug removed, devres will automatically free the regmap memory.
> 
> However, the syscon framework does not provide an unregister function,
> leaving it with a dangling pointer in its static list that could cause a
> use-after-free upon subsequent lookups.

The device is not hotpluggable and the driver cannot be unloaded/unbounded, so
there should be no dangling pointer around.

> 
> > +
> > +	return 0;
> > +
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> [ ... ]
> > +static int rp1_pwm_resume(struct device *dev)
> > +{
> > +	struct pwm_chip *chip = dev_get_drvdata(dev);
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(rp1->clk);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to enable clock on resume: %pe\n", ERR_PTR(ret));
> > +		return ret;
> > +	}
> > +
> > +	rp1->clk_enabled = true;
> > +
> > +	return 0;
> > +}
> 
> [Severity: High]
> Should the hardware channel control registers (CHAN_CTRL) be restored across
> resume?
> 
> When the system suspends, the southbridge may lose power and reset its
> registers. During probe, these registers are initialized with required
> configuration bits like MODE_TE_MS and FIFO_POP_MASK.
> 
> This resume function merely re-enables the clock. Because the regmap is not
> configured to cache and restore registers, a subsequent write might update
> only the polarity bit, leaving the channel mode at 0 and breaking PWM
> output.

AFAIK the RP1 is never powered-off, so just shutting down the clock should be ok
and no register are reset to default.

Regards,
Andrea

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1780498640.git.andrea.porta@suse.com?part=2
