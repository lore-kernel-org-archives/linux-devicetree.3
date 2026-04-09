Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E863DDDC9
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751218; cv=none; b=BazcsRoZ0TR6J5Bd5UqcCeFgbnWprSCGaouFFUM+nlkqjCuXKklqdY7SjiyYgTTKrsSUfnacRvn06A28Hnbj7fQsE0YD9E36Jr7asVWAr8VEtoMCmVRSgqGpKGGkTIsFfQKDmbn2Fu3VduOZDzwzXmUylybz+zVcf3VSyXNhx14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751218; c=relaxed/simple;
	bh=lABvhPkfSUEZQ/UrtmnvRvwQE+Cu91hJU6oQtHtIJ/A=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BqSXAi6v0RpxRDK7X0AI7xZ6AyITQZarTjqCke2ynO9iIJqXcTwJvzVC3/e9Uya/aY73YKOxM47rlduYyYs9hHp3/nViHfiy+Mv7w4l/lAOhjjeSSDlEhvn/mF5L4xG48fTrF5O/UTpDDuKHOW7zRy6jLwdDjWoknVXaXBZATf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fvpQq2TR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fvpQq2TR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cfce3a195so686644f8f.2
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 09:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775751215; x=1776356015; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bBKgfLsTkzPVnY3AYieDVnJ/jktPCR6tcs7xRYIk1ro=;
        b=fvpQq2TR8B2jlMC/tWauzBoqG9CyCuqFtx5dXQvJb2Fnt+6Hl0yJzDzkeDzttTO8nr
         ZGHTATQw2c3oxHExBMUKKFtz1RgaZi3XHDfjgWJvhZhpviB68eb5Dc6UbpT7rODrFOOE
         pd/GTM3ZZ4HRu2Kbn5rgGhTmzAALl3N5BtEh5A5ThjbsqbycTVUOsJxHZ24NA+d22L2V
         eLDUz6CYTtDhUSP7RKiGVYi9QLLK9NXd7V+qY9C8Mup2pNQ7aWVZGzG+50PXVPhKx3+x
         FxSDn3053Ma74VJ5lsMB6FhflS5AXLNH3JzhteaJZaP+ujY9H8w6GJDsd493sYv98c75
         YOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775751215; x=1776356015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bBKgfLsTkzPVnY3AYieDVnJ/jktPCR6tcs7xRYIk1ro=;
        b=oe70i3B1D8lRatHsNHys5McJlydr8LtY7VNBvSPWEctYsVemFIJXeBsdY2QMachw3U
         S76LwHDJska8wLDM0X6frhDKAFdRpc93/JnQ8+YriKQRrootibBS1ujVm0JGo/+1E1zh
         uPJPS0dGDb4BOBNVgnGRnMzgU+Uaz2T//Gvlfj5tPAolLBCkHizJmYKAAFOl9s+F2AO0
         SxXzvUn8TorZd9/lkmR5Rob5jNBs/KzkSwVJ3xCTdbL1Dn4c8P6QWiAv67WEOcHu4T3t
         ThtUSOg3swZlmS1/13vlj7xB7GPosfWHLpsDtvH1iwuiWW3YFBoPXdZPJTGGYhZV18CM
         93gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYBZYS63wh1SjisUJaony4Eg0+8ZxN7TBI6msnf5DYrzovBmJrZN9RNhucTbNYeZPuaDv9uH7c3RAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzIUCca0wJ0DrxOPFOdjowSQ3PPbgLFPSddOYG08YvwBPdC0eje
	58gxFX6TzWyDLsbDCF4diR8ubsGa82bDHo034ndLdKqu5zSgx1Ftd5NGkKjwAtuOk18=
X-Gm-Gg: AeBDietAEg2vDiAeMHPaN9rXw/8IM8cHlgBrz3RIQL4s0Xmiaa+Kznro2yXLsnRVnWg
	+j1OCUHScTj71fPHfYmc7JLbZwQj+KUjv4zQIdt1K0cICimp0MlISbTQhroeBZGNVxSzdrtsgsP
	Gyv7vV5UO9i3up516ByKkFcCcD55lsK6PieeJnP6SM+eW9qccCGEHUOndihASi3zrHnYaF9Xzax
	v2x0Vy7AHJxTEKldY534ORd9NRlGhA1J+Af1I3Nix9hk6d4NEQAbhsPYrDoDANmTXv+tBtAhhzj
	Hw4vstA9L/h59GCszhTdSOBZcQeVfXS6sp0YJDxn47ZdEih3NioNEoFOf1nNtYnPXcbh/0E/gxc
	DmApSB0uKQFItjdA8Q1jzOxjJhztwuT+lAGcnYDwiYwnStjYN75qUHxtOgnliJoPDWNCyDLhYS1
	qM0uvk17suKG1zsLZ7E7rJit7puhCYBCobbsgJTaQtMJOk7UGEow==
X-Received: by 2002:a05:6000:4310:b0:43c:ffcc:b682 with SMTP id ffacd0b85a97d-43d5a1a21ecmr6369277f8f.33.1775751214675;
        Thu, 09 Apr 2026 09:13:34 -0700 (PDT)
Received: from localhost (93-41-3-120.ip79.fastwebnet.it. [93.41.3.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm69291174f8f.4.2026.04.09.09.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 09:13:34 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Apr 2026 18:16:41 +0200
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <adfQ6Tvst3Vd1Mxe@apocalypse>
References: <cover.1775223441.git.andrea.porta@suse.com>
 <28e29fbfc20c0b8a115d006233c2759d8f49e639.1775223441.git.andrea.porta@suse.com>
 <adLTwOTbkJ0VQXy6@monoceros>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adLTwOTbkJ0VQXy6@monoceros>

Hi Uwe,

On 23:45 Sun 05 Apr     , Uwe Kleine-König wrote:
> Hello Andrea,
> 
> On Fri, Apr 03, 2026 at 04:31:55PM +0200, Andrea della Porta wrote:
> > From: Naushir Patuck <naush@raspberrypi.com>
> > 
> > The Raspberry Pi RP1 southbridge features an embedded PWM
> > controller with 4 output channels, alongside an RPM interface
> > to read the fan speed on the Raspberry Pi 5.
> > 
> > Add the supporting driver.
> > 
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pwm/Kconfig   |  10 ++
> >  drivers/pwm/Makefile  |   1 +
> >  drivers/pwm/pwm-rp1.c | 244 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 255 insertions(+)
> >  create mode 100644 drivers/pwm/pwm-rp1.c
> > 
> > diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> > index 6f3147518376a..22e4fc6385da2 100644
> > --- a/drivers/pwm/Kconfig
> > +++ b/drivers/pwm/Kconfig
> > @@ -625,6 +625,16 @@ config PWM_ROCKCHIP
> >  	  Generic PWM framework driver for the PWM controller found on
> >  	  Rockchip SoCs.
> >  
> > +config PWM_RP1
> 
> I prefer PWM_RASPBERRYPI1, or PWM_RASPBERRYPI_RP1 here.

Ack.

> 
> > +	tristate "RP1 PWM support"
> > +	depends on MISC_RP1 || COMPILE_TEST
> > +	depends on HWMON
> > +	help
> > +	  PWM framework driver for Raspberry Pi RP1 controller
> > +
> > +	  To compile this driver as a module, choose M here: the module
> > +	  will be called pwm-rp1.
> > +
> >  config PWM_SAMSUNG
> >  	tristate "Samsung PWM support"
> >  	depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
> > diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
> > index 0dc0d2b69025d..895a7c42fe9c0 100644
> > --- a/drivers/pwm/Makefile
> > +++ b/drivers/pwm/Makefile
> > @@ -56,6 +56,7 @@ obj-$(CONFIG_PWM_RENESAS_RZG2L_GPT)	+= pwm-rzg2l-gpt.o
> >  obj-$(CONFIG_PWM_RENESAS_RZ_MTU3)	+= pwm-rz-mtu3.o
> >  obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
> >  obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
> > +obj-$(CONFIG_PWM_RP1)		+= pwm-rp1.o
> >  obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
> >  obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
> >  obj-$(CONFIG_PWM_SL28CPLD)	+= pwm-sl28cpld.o
> > diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> > new file mode 100644
> > index 0000000000000..0a1c1c1dd27e9
> > --- /dev/null
> > +++ b/drivers/pwm/pwm-rp1.c
> > @@ -0,0 +1,244 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * pwm-rp1.c
> > + *
> > + * Raspberry Pi RP1 PWM.
> > + *
> > + * Copyright © 2026 Raspberry Pi Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + * Based on the pwm-bcm2835 driver by:
> > + * Bart Tanghe <bart.tanghe@thomasmore.be>
> > + */
> 
> Please add a paragraph here named "Limitations" in the same format as
> several other drivers describing how the driver behaves on disable and
> configuration changes (can glitches occur? Is the currently running
> period completed or aborted?)

Ack.

> 
> > +#include <linux/bitops.h>
> > +#include <linux/clk.h>
> > +#include <linux/err.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pwm.h>
> > +
> > +#define PWM_GLOBAL_CTRL		0x000
> > +#define PWM_CHANNEL_CTRL(x)	(0x014 + ((x) * 0x10))
> > +#define PWM_RANGE(x)		(0x018 + ((x) * 0x10))
> > +#define PWM_PHASE(x)		(0x01C + ((x) * 0x10))
> > +#define PWM_DUTY(x)		(0x020 + ((x) * 0x10))
> > +
> > +/* 8:FIFO_POP_MASK + 0:Trailing edge M/S modulation */
> > +#define PWM_CHANNEL_DEFAULT	(BIT(8) + BIT(0))
> > +#define PWM_CHANNEL_ENABLE(x)	BIT(x)
> > +#define PWM_POLARITY		BIT(3)
> > +#define SET_UPDATE		BIT(31)
> > +#define PWM_MODE_MASK		GENMASK(1, 0)
> > +
> > +#define NUM_PWMS		4
> 
> Please prefix all #defines by something driver specific (e.g. RP1_PWM_).

Ack.

> 
> > +
> > +struct rp1_pwm {
> > +	void __iomem	*base;
> > +	struct clk	*clk;
> > +};
> > +
> > +static const struct hwmon_channel_info * const rp1_fan_hwmon_info[] = {
> > +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> > +	NULL
> > +};
> > +
> > +static umode_t rp1_fan_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
> > +					u32 attr, int channel)
> > +{
> > +	umode_t mode = 0;
> > +
> > +	if (type == hwmon_fan && attr == hwmon_fan_input)
> > +		mode = 0444;
> > +
> > +	return mode;
> > +}
> > +
> > +static int rp1_fan_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> > +			      u32 attr, int channel, long *val)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	if (type != hwmon_fan || attr != hwmon_fan_input)
> > +		return -EOPNOTSUPP;
> > +
> > +	*val = readl(rp1->base + PWM_PHASE(2));
> > +
> > +	return 0;
> > +}
> 
> I don't like having hwmon bits in pwm drivers. Is the PWM only usable
> for a fan? I guess the hwmon parts should be dropped and a pwm-fan
> defined in dt.

The pwm-fan generic driver expects an interrupt to count the RPM, while
on RP1 this data is passed via a register filled by the RP1 fw running
on the internal core. Instead of changing the generic pwm-fan driver,
I'll add a syscon to export this register which will be read by a new
device/driver registering an hwmon device.

> 
> > +static const struct hwmon_ops rp1_fan_hwmon_ops = {
> > +	.is_visible = rp1_fan_hwmon_is_visible,
> > +	.read = rp1_fan_hwmon_read,
> > +};
> > +
> > +static const struct hwmon_chip_info rp1_fan_hwmon_chip_info = {
> > +	.ops = &rp1_fan_hwmon_ops,
> > +	.info = rp1_fan_hwmon_info,
> > +};
> > +
> > +static void rp1_pwm_apply_config(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	value = readl(rp1->base + PWM_GLOBAL_CTRL);
> > +	value |= SET_UPDATE;
> > +	writel(value, rp1->base + PWM_GLOBAL_CTRL);
> > +}
> > +
> > +static int rp1_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	writel(PWM_CHANNEL_DEFAULT, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> 
> Please add a comment about what this does.

Ack.

> 
> > +	return 0;
> > +}
> > +
> > +static void rp1_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	u32 value;
> > +
> > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +	value &= ~PWM_MODE_MASK;
> > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> 
> What is the purpose of this call?

To update the configuration on the next PWM strobe in order to avoid
glitches. I'll add a short comment in the code.

> 
> > +}
> > +
> > +static int rp1_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			 const struct pwm_state *state)
> > +{
> > +	struct rp1_pwm *rp1 = pwmchip_get_drvdata(chip);
> > +	unsigned long clk_rate = clk_get_rate(rp1->clk);
> > +	unsigned long clk_period;
> > +	u32 value;
> > +
> > +	if (!clk_rate) {
> > +		dev_err(&chip->dev, "failed to get clock rate\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* set period and duty cycle */
> > +	clk_period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, clk_rate);
> 
> DIV_ROUND_CLOSEST is wrong here. (I don't go into details as .apply()
> should be dropped.)

Ack.

> 
> > +	writel(DIV_ROUND_CLOSEST(state->duty_cycle, clk_period),
> 
> Dividing by the result of a division loses precision.
> 
> > +	       rp1->base + PWM_DUTY(pwm->hwpwm));
> > +
> > +	writel(DIV_ROUND_CLOSEST(state->period, clk_period),
> > +	       rp1->base + PWM_RANGE(pwm->hwpwm));
> > +
> > +	/* set polarity */
> > +	value = readl(rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +	if (state->polarity == PWM_POLARITY_NORMAL)
> > +		value &= ~PWM_POLARITY;
> > +	else
> > +		value |= PWM_POLARITY;
> > +	writel(value, rp1->base + PWM_CHANNEL_CTRL(pwm->hwpwm));
> > +
> > +	/* enable/disable */
> > +	value = readl(rp1->base + PWM_GLOBAL_CTRL);
> > +	if (state->enabled)
> > +		value |= PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	else
> > +		value &= ~PWM_CHANNEL_ENABLE(pwm->hwpwm);
> > +	writel(value, rp1->base + PWM_GLOBAL_CTRL);
> > +
> > +	rp1_pwm_apply_config(chip, pwm);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct pwm_ops rp1_pwm_ops = {
> > +	.request = rp1_pwm_request,
> > +	.free = rp1_pwm_free,
> > +	.apply = rp1_pwm_apply,
> 
> Please implement the waveform callbacks instead of .apply().

Ack.

> 
> > +};
> > +
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device *hwmon_dev;
> > +	struct pwm_chip *chip;
> > +	struct rp1_pwm *rp1;
> > +	int ret;
> > +
> > +	chip = devm_pwmchip_alloc(dev, NUM_PWMS, sizeof(*rp1));
> > +	if (IS_ERR(chip))
> > +		return PTR_ERR(chip);
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	rp1->base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rp1->base))
> > +		return PTR_ERR(rp1->base);
> > +
> > +	rp1->clk = devm_clk_get_enabled(dev, NULL);
> > +	if (IS_ERR(rp1->clk))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "clock not found\n");
> 
> Please start error messages with a capital letter.

Ack.

> 
> > +
> > +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> 
> After this call you can determine the rate just once and fail if it's ==
> 0.

Ack.

> 
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "fail to get exclusive rate\n");
> > +
> > +	chip->ops = &rp1_pwm_ops;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = devm_pwmchip_add(dev, chip);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to register PWM chip\n");
> > +
> > +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "rp1_fan_tach", rp1,
> > +							 &rp1_fan_hwmon_chip_info,
> > +							 NULL);
> > +
> > +	if (IS_ERR(hwmon_dev))
> > +		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
> > +				     "failed to register hwmon fan device\n");
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_suspend(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rp1_pwm_resume(struct device *dev)
> > +{
> > +	struct rp1_pwm *rp1 = dev_get_drvdata(dev);
> > +
> > +	return clk_prepare_enable(rp1->clk);
> 
> Hmm, if this fails and then the driver is unbound, the clk operations
> are not balanced.

I'll add some flags to check if the clock is really enabled or not.

Regards,
Andrea

> 
> > +}
> > +
> > +static DEFINE_SIMPLE_DEV_PM_OPS(rp1_pwm_pm_ops, rp1_pwm_suspend, rp1_pwm_resume);
> > +
> > +static const struct of_device_id rp1_pwm_of_match[] = {
> > +	{ .compatible = "raspberrypi,rp1-pwm" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, rp1_pwm_of_match);
> > +
> > +static struct platform_driver rp1_pwm_driver = {
> > +	.probe = rp1_pwm_probe,
> > +	.driver = {
> > +		.name = "rp1-pwm",
> > +		.of_match_table = rp1_pwm_of_match,
> > +		.pm = pm_ptr(&rp1_pwm_pm_ops),
> > +	},
> > +};
> > +module_platform_driver(rp1_pwm_driver);
> > +
> > +MODULE_DESCRIPTION("RP1 PWM driver");
> > +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.35.3
> > 
> 
> Best regards
> Uwe


