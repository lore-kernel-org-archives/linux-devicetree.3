Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82557472F72
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 16:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539302; cv=none; b=rk6lAoHPH/BolT7n8haTZgJSSkSp8kY34j0onKiPhTRyLhYBjOONemzYaqcp51rdueVuz19YEl0AY6ChtawOszwj0yAiiYZgRj/usjRLbNbL6CTuIMfBqePV4Eth47fvkZfM3iMYw1KNn37Z/mFKT0nXj+xtgMW8MfdtKLLRYcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539302; c=relaxed/simple;
	bh=aD3s/wMOCNXFuMHsCXYH/3isor+PiXqJw1ZQ5nBqzl0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3gc86hXwcuY/O0gecnoiCWAKc/zElfO5zVe0bYPwNt+/+YD4DCcK7WTyv6r+bxoCbsDsTrEgQa0PPdeYNd44mGDNGLdp5d6gA6KOCFnTgp8UBr06xDSMTkexiOryjeJBDAprViIt5FHWrZ5zVeTIxNf6haJsoPFxgCVIKKcvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UCW9Ti2Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UCW9Ti2Q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482ea739de2so817818f8f.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788539299; x=1789144099; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Pi3sqyteuE0/QZwa01E3S2F0kiuXgMtxWMFjBjLXuI=;
        b=UCW9Ti2QERO7KI+hO60NEMKLbJ08bqFMt5Y/DrGLhYzZmxl4Rz8KwrwX6z9ZOyhqdK
         3xEmeno4Ig0tnaMX6sompocxKIa6Y3OWL0NaEoTIO93kfbeOvk5/p2ZANSOe/XiWyWol
         ApYA3rwmvp8WH699Ia8w8ORO++zH3I8sctp6wmYhB0vVb74YVbFxRYB/L8403bky+NeS
         +HbfjiJBuV+twMYOSzRwWK4C4W9nhDpEP339QsAdCewtV+0QHWYsoYbduS4NfX/Y2aDp
         JsEsFPVIvkdB1rXRjtdDvKsUIq5rep7gHrYnUZXpZzyDF/g5YhVVwmQ/+ZEbUxI6PdHs
         1Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539299; x=1789144099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Pi3sqyteuE0/QZwa01E3S2F0kiuXgMtxWMFjBjLXuI=;
        b=PZwLgSLIjqq369afrHuYV/OT0CeNlmsnX4Q+Hj0OeBtuC+VXQANKfxanYiMW7iz0Ju
         LTF7Y2hrinBJ63/jubKxAQZR7T1yYNer79eE+iBA1rlVgAjShLD2+fW8ZWDHBN2y0Qau
         23sDJ2kI2/6g5tdKxQz0GDktOBI5kmKcYYEO2eIYN9gVMzVwQv0eF59EU/TIOk0gycHf
         BiMVntwhR1YYLCGGVcXUbp2ge9zQmBvXsvIpIZXQh0LQ4hYQwIUqFxrgwrM/5Djx/U6c
         mJZw8joZna/tqBqxiNrRQGR/VnWeALBI7wBJ3SeEKLqpU88LvsVk9D6nnOk5yqvs8tNa
         4oKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMJCCo/sa6Ac4HjHZMa4quIAp/kUCQZLhtrXRyAxmnoYjNQZxAewNHsZFkaKpLP9HW6xWuP6gald+h@vger.kernel.org
X-Gm-Message-State: AFuF++mdm896jnMfPPR2JYi6Go2VdHHqIBYy038W4Yt8S/kJiKtcxQyh
	6zDBAS098U8KzAMhua1SwOgjQUjgwsIl+Uva7+mOq4vKubH3MJVchXg0saaILkZ7ArM=
X-Gm-Gg: AYBFou2PJUfvV4fmoT80Es+svd+tJ2msud0hrBaHVh+ZsFAZBAsi3CflGiIwHTwN6D+
	vjaxQRZ6ZRLBXdkQodK3rp0bgNLejeLeTcAUpJQ+w4Oy7WX2cEsMsgh8XwvZVYpgKbceo+Sb+Jy
	tu7kWbTtfb1vCxKCJ5PZfDqUoLZHZZnIndwq6xaPJ5K0f42uEXinrKihuBIcTtPMbf+1WC2juta
	d+ys8A3blzZY5+V2gpzCrUYSG0CoQtPVAbUBDlqAz0UnNFt9GYCn4iCwGl2OP7cXp5mgvt87fEv
	W3Wd75fKpXgMuH+vjnP0WsoFAH/lrYN9Ul9JhNrLIMAEIgTs7c1ieu8B4NQeZML58I1GSKU2Ptq
	kaySMswvS4zKhOXDkdR8OZ5UCn8C4xeTfUeEALmyCguHlvgBLW7SLwSH4tc4QVSzaNjykBmY+z7
	1rFDawXqqjVdwIZAZ499K7jJ2nQ9m6dEM6rOppCKNSkZcTm3s51v9TfYVU0w==
X-Received: by 2002:a5d:5225:0:b0:485:8435:5a3a with SMTP id ffacd0b85a97d-485872ea457mr9219109f8f.25.1788539298646;
        Fri, 04 Sep 2026 09:28:18 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm8164784f8f.25.2026.09.04.09.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:28:18 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 18:31:57 +0200
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH v7 2/3] pwm: rp1: Add RP1 PWM controller driver
Message-ID: <apryfdwBCHaGJobA@apocalypse>
References: <cover.1784539788.git.andrea.porta@suse.com>
 <a83d65b2d91865eb722337c547c94dce175e6086.1784539788.git.andrea.porta@suse.com>
 <46772551-207f-4795-89d5-6c02a0b85410@wanadoo.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46772551-207f-4795-89d5-6c02a0b85410@wanadoo.fr>

Hi Christophe,

On 22:36 Thu 03 Sep     , Christophe JAILLET wrote:
> Le 20/07/2026 à 11:44, Andrea della Porta a écrit :
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
> 
> Hi,
> 
> ...
> 
> > +static int rp1_pwm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> > +	unsigned long clk_rate;
> > +	struct pwm_chip *chip;
> > +	void __iomem	*base;
> > +	struct rp1_pwm *rp1;
> > +	int ret;
> > +
> > +	chip = devm_pwmchip_alloc(dev, RP1_PWM_NUM_PWMS, sizeof(*rp1));
> > +	if (IS_ERR(chip))
> > +		return PTR_ERR(chip);
> > +
> > +	rp1 = pwmchip_get_drvdata(chip);
> > +
> > +	base = devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	rp1->regmap = devm_regmap_init_mmio(dev, base, &rp1_pwm_regmap_config);
> > +	if (IS_ERR(rp1->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->regmap), "Cannot initialize regmap\n");
> > +
> > +	rp1->clk = devm_clk_get(dev, NULL);
> 
> Could it be devm_clk_get_enabled() to simplify the error handling path as
> done above with other devm function?

The very first version of this patches had devres everywhere, but Uwe has correctly
spotted that this could lead to clock ops imbalance, please see:
https://lore.kernel.org/all/adLTwOTbkJ0VQXy6@monoceros/
As a result, I turned devm_clk_get_enabled() into the corresponding non devres/single
component functions since now disengaging the clock depends on a conditional.
Of course this does not make much sense in case we don't need a .remove callback,
but it seems that I can reintroduce it again if we agree to use EXPORT_SYMBOL_NS.

> ...
> 
> > +	if (IS_ERR(rp1->clk))
> > +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "Clock not found\n");
> > +
> > +	ret = clk_prepare_enable(rp1->clk);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to enable clock\n");
> 
> ... this also saves these 3 lines.

See above.

> 
> > +	rp1->clk_enabled = true;
> > +
> > +	ret = devm_clk_rate_exclusive_get(dev, rp1->clk);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to get exclusive rate\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	clk_rate = clk_get_rate(rp1->clk);
> > +	if (!clk_rate) {
> > +		ret = dev_err_probe(dev, -EINVAL, "Failed to get clock rate\n");
> > +		goto err_disable_clk;
> > +	}
> > +	/*
> > +	 * To prevent u64 overflow in period calculations:
> > +	 * mul_u64_u64_div_u64(period_ns, clk_rate, NSEC_PER_SEC)
> > +	 * If clk_rate > 1 GHz, the result can overflow.
> > +	 */
> > +	if (clk_rate > HZ_PER_GHZ) {
> > +		ret = dev_err_probe(dev, -EINVAL, "Clock rate > 1 GHz is not supported\n");
> > +		goto err_disable_clk;
> > +	}
> > +	rp1->clk_rate = clk_rate;
> > +
> > +	chip->ops = &rp1_pwm_ops;
> > +	chip->atomic = true;
> > +
> > +	platform_set_drvdata(pdev, chip);
> > +
> > +	ret = pwmchip_add(chip);
> 
> Could it be devm_pwmchip_add() to simplify the error handling path as done
> above with other devm function?

Due to the above-mentioned scenario and since .remove is called before devres release
funtions, that would make the clock to be released before the pwm chip, causing
inconsistencies if the pwm is used in the meanwhile. 

Many thanks,
Andrea.

> 
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register PWM chip\n");
> > +		goto err_disable_clk;
> > +	}
> > +
> > +	ret = of_syscon_register_regmap(np, rp1->regmap);
> > +	if (ret) {
> > +		dev_err_probe(dev, ret, "Failed to register syscon\n");
> > +		goto err_remove_chip;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_remove_chip:
> > +	pwmchip_remove(chip);
> > +err_disable_clk:
> > +	clk_disable_unprepare(rp1->clk);
> > +
> > +	return ret;
> > +}
> ...
> 
> CJ
