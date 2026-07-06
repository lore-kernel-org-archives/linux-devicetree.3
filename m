Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1003D4314BA
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 12:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342335; cv=none; b=FFiBTWwNdxeP6he3qwu1ME1ugfqjdlwFUtEJ+7CjlYx0maoy5btAa+0umJ+qvvuGCLVlvyY2PVSnOfdME6bEyAl1SC7fR5MW+ey/UMgguCgq+lGbOTmDhn6DpMluAby77V1dmVOPTlCp5yvCXT8TF6fD61Hnx1Bb6KtMHP8qygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342335; c=relaxed/simple;
	bh=01tUab+QXYZqIFMiJHlLYHaVnDV0K0j6KpSsLb+bmY4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g60trPHT6R8Vk5gf9cVaNZ1RlTtFP7Qy6VtCMMJRfRLeC//UJq7ZIyD4Btngw9uIxr7+ieM3tdgpcTKJTtKNB44dtebTFu9rVYtLr2qj9s0ErbmXV0N+3V4Vaff9dZ6bJ4SiOMgVnrSPACpojDpUavKhEkcB7PSE23sbBJjB8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dfqKCigQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dfqKCigQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de008b020so535384f8f.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 05:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783342332; x=1783947132; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t/yKVbyngN3gqgkVNfnrlZX/6yUtx8Ot3odKhjh4k48=;
        b=dfqKCigQHQTpnXQOsWEVzIYwGBknTYlttJFT3GSPPh1nBAWphDTZjxkkZ+aYNxMrvb
         zQGNRjJZHbazz25u+hdx1OWTkMI+9tkfoy6+KLyu2CgQu/oG8TIvwnfdruRK3sW1QKJD
         ICuUYJqQboMwZRP3I4iGXxNJxqWPaxqC6CSBLlp4m4uhGytwkiEUOIjdiVrHsMk7Fm6/
         46QVuwRzsuAKLrSUEfZe2sw9ILmpJZWM4+yWj8xON62snuagdkQWpz8NArshpEwt6Iw/
         mvCpuAjCbvW38RqUk7GHd3+aIFXHAeQgXZQNWoEg0hcLU0MbnBQZ/C1Fs0VAT/mXo46T
         dA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342332; x=1783947132;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/yKVbyngN3gqgkVNfnrlZX/6yUtx8Ot3odKhjh4k48=;
        b=YtHI9BgtfbxhEItqo53ltGgJ/QTj4XSzXxmNALXspmDd9HzvNED3WNwMW7WanEl15C
         VpJ7mar3ukLZWWKXlWQrhaPi1wi+MWrxQMpr/mL/KPHII/+1tyEDA4GGpOVwyAcn87gG
         CpFh/5VNsEkWE7n4KwLnJUcCw4SJ7YpzMRSufARZSJpucs5lVfuQsAVkDG8QpJdfEPji
         zvwu10vrsA/9sH70g+ZVCwLxLmpBnyyOPPlGW1oIVMrJOTh00D8Dx+CKaroyhbjC52zd
         3A80KCvS8Tphy9CxzaDHnhYNSa3MBNZJLvKGnJxYq65iNjT/OtstYNQiABWKVT+mNrPa
         vsNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrwjxmMiv0YdJjkbLVQdeEoQ+A01zP7L9dCkQO0Zfg9LuUowzgP+5z0icle5jnyFEdXuVYJKw9Dhxc@vger.kernel.org
X-Gm-Message-State: AOJu0YzyZBnXf89CpB492MFWsiIF+WF2CRyF1FfVtiYYzzwe1AB1xPZU
	u+dOY7LcJ1fsln2Zx3vrGOFUUrBGo9DvYDylajVOtkHoLsF+VIg05f0XR583FjEWjsCnNAOZDJO
	g0/vMm/o=
X-Gm-Gg: AfdE7cmwBooR4uJlg06jXPh72xxXX8X6GtpOaqqy+Ih+d1kdjiZBTHFRCFfLkV7bz7Y
	PUdkwtq2xB/OXcSDDPiKVQan50Ew1alhno9NwlqiRJlfvFB6gtsw34lVqMSGdzncWl6bYO3a/tg
	rnlrMTkqi9hiBUQlk706ptP07jtdOahrRQb3lnkM3FTuVJ34bTpXokDv7wQ8thkor3y4V5Qs8Je
	80ZIrXIQz6C+4B1jDzAXT7bt/4o0No/kX6jUDlAIe7vumYPEdTMUC1URlvhmzU4aoY7OzvdAT9x
	dUawnDv07LUpSDQPyVF7TcdRivrNnMHq8EhNVxyBdbnEO5P6XAqJx7dHrPeAjn5IxdV1ARTGuZP
	9eko0MCnnMjkhzVr1Cz7COf5Mue13cH+QauvhXGYQjD67aRyusmFP/wsEq87Wfe9bjv5/nMM+BX
	VQ8IvbjHV6ujU=
X-Received: by 2002:a5d:64c8:0:b0:45a:5392:3a19 with SMTP id ffacd0b85a97d-4793685fb5amr17868797f8f.16.1783342332395;
        Mon, 06 Jul 2026 05:52:12 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm24085229f8f.36.2026.07.06.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:52:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 6 Jul 2026 14:55:39 +0200
To: sashiko-reviews@lists.linux.dev
Cc: Andrea della Porta <andrea.porta@suse.com>, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <akuly1y9_oNlK2wS@apocalypse>
References: <cover.1783097764.git.andrea.porta@suse.com>
 <5171610d8bebdd10eea44bff5236502d765b5918.1783097764.git.andrea.porta@suse.com>
 <20260703171707.D31F51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260703171707.D31F51F00A3A@smtp.kernel.org>

Hi,

On 17:17 Fri 03 Jul     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Dangling syscon pointer and Use-After-Free upon device unbind due to devres regmap cleanup.
> - [High] Non-atomic Read-Modify-Write of shared syscon registers causing data corruption.
> --
> 
> commit ed6030e515052cf4e3fde5de4c8c7ffcb06a014a
> Author: Naushir Patuck <naush@raspberrypi.com>
> 
> pwm: rp1: Add RP1 PWM controller driver
> 
> The Raspberry Pi RP1 southbridge features an embedded PWM
> controller with 4 output channels, alongside an RPM interface
> to read the fan speed on the Raspberry Pi 5.
> 
> Add the supporting driver.
> 
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..8ef5ec9ed3a07
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> > @@ -0,0 +1,435 @@
> [ ... ]
> > +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	/* update the changed registers on the next strobe to avoid glitches */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &value);
> > +	value |= RP1_PWM_GLB_CTRL_SET_UPDATE;
> > +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, value);
> 
> [Severity: High]
> In rp1_pwm_apply_config(), since this regmap is exposed to other drivers via
> syscon (like the RP1 RPM fan driver), could this manual read-modify-write
> sequence race with concurrent register updates?
> 
> The regmap lock is released between regmap_read() and regmap_write(), which
> might allow another syscon client's changes to RP1_PWM_GLB_CTRL to be
> overwritten with stale data. Does this need to use regmap_update_bits()
> instead?

The registers are guaranteed by design to never overlap: the producer is the fw
which writes in the phase register and the consumer will ionly read that register.
No other registers are shared.

> 
> > +}
> [ ... ]
> > +static int rp1_pwm_write_waveform(struct pwm_chip *chip,
> > +				  struct pwm_device *pwm,
> > +				  const void *_wfhw)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	const struct rp1_pwm_waveform *wfhw = _wfhw;
> > +	u32 value, ctrl;
> > +
> > +	/* set polarity */
> > +	regmap_read(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), &value);
> > +	if (!wfhw->inverted_polarity)
> > +		value &= ~RP1_PWM_CHAN_CTRL_POLARITY;
> > +	else
> > +		value |= RP1_PWM_CHAN_CTRL_POLARITY;
> > +	regmap_write(rp1->regmap, RP1_PWM_CHAN_CTRL(pwm->hwpwm), value);
> 
> [Severity: High]
> Does rp1_pwm_write_waveform() present the same non-atomic read-modify-write
> race condition here when updating RP1_PWM_CHAN_CTRL?

See above.

> 
> > +
> > +	/* early exit if disabled */
> > +	regmap_read(rp1->regmap, RP1_PWM_GLB_CTRL, &ctrl);
> > +	if (!wfhw->enabled) {
> > +		ctrl &= ~RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +		goto exit_disable;
> > +	}
> > +
> > +	/* set period and duty cycle */
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_RANGE(pwm->hwpwm), wfhw->period_ticks);
> > +	regmap_write(rp1->regmap,
> > +		     RP1_PWM_DUTY(pwm->hwpwm), wfhw->duty_ticks);
> > +
> > +	/* enable the channel */
> > +	ctrl |= RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(pwm->hwpwm);
> > +exit_disable:
> > +	regmap_write(rp1->regmap, RP1_PWM_GLB_CTRL, ctrl);
> 
> [Severity: High]
> And similarly here in rp1_pwm_write_waveform() for RP1_PWM_GLB_CTRL?

See above.

> 
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> > +
> > +	return 0;
> > +}
> [ ... ]
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> [ ... ]
> > +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> > +	if (IS_ERR(rp1->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> [ ... ]
> > +	ret = of_syscon_register_regmap(np, rp1->regmap);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> > +		goto err_remove_chip;
> > +	}
> > +
> > +	return 0;
> 
> [Severity: High]
> In rp1_pwm_probe(), because rp1->regmap is managed by devres (allocated via
> devm_regmap_init_mmio), it will be automatically freed when the device is
> unbound. However, of_syscon_register_regmap() registers it globally.
> 
> Since there is no mechanism to unregister the regmap from syscon upon device
> removal, wouldn't unbinding the parent PCI device leave a dangling pointer
> in the global syscon list?
> 
> Could this lead to a use-after-free if another driver attempts to use this
> syscon client after this device is unbound?
>

The device is not hotpluggable and the driver cannot be unloaded/unbounded, so
there should be no dangling pointer around.

Regards,
Andrea
 
> > +
> > +err_remove_chip:
> > +	pwmchip_remove(chip);
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1783097764.git.andrea.porta@suse.com?part=2
