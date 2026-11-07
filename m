Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022565;
	b=Zf5UIqUNeCeIAw1VrvjYkAHH0Sl6Ii7yyAyoui3DJJGAGTIfRufkVVQ6EJv6pJax/wQt
	 Tgdto6m/QYMiKBzuGrxizVel7YpwXserrF3qIvl+g9IKy0ZqByBA8mE2HD1PGdan8xsEA
	 cC3yq8TOhjp+vg8H211SHb49sCC1BG2XJ0SQZyEgv5r5pil2mrxuXwDzVtbbtQmC1LKOy
	 L/7qWFLiHZ+lJ+SPBY5TkHGjgniUb1HHJnIBPIiOm9gYk21iHnvdKXyeELX+NUQ7XJCzP
	 yDRioYKnb1OfFgyCncKW9Uz/EeIg/XiiLCreaOvy2REr+jF2BWmzZ5IWzyET/RA8UwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022565;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+BQSzNcah1bnmw5EAAbW7rpsJAxZwyuu1UY9Vsy3Ah0=;
	b=IuWg0pRTnKvltqy0qPa3CAQy0rkBl8IHOqaXBHxv38ezU43LqfSVe+vdQ/CXAqYuT/my
	 qFuvU+GyXekf8JlMJAKCQubdqnaPT0K2xTMoZdT6+foPL0BI0WIcfNrIlJ0Be0tcpzlg1
	 xpMhsSFXTkQmQMsYgmlcDRiF/v7X0KqL4TlzxH3ccmfFEJl/Ku/pLV+JNWzhgWY56e3e9
	 enU7T1XD68+T8k+GDOnjx0l2/+xPHt/lsD4n0YSL6jKSf39ajkSr0xExq2ipC71oC33n5
	 zE2CDQB1WNSnqcSCFfEaI8WltoQwSeMg4156gx9MuKdTO+3g5LVQ+Sn84qEkXeglIKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuruANSO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19078606A32F
	for <devicetree@vger.kernel.org>; Sat,  7 Nov 2026 03:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuruANSO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AABE1F0089F;
	Sat,  7 Nov 2026 03:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794022564;
	bh=+BQSzNcah1bnmw5EAAbW7rpsJAxZwyuu1UY9Vsy3Ah0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XuruANSO8NLYlcXzJOKFwdwlPeJK8x42JvOpwLUB2opCKjKyq/sPgh48VjEPEH1ey
	 g9J0Bg3ELZ1wm3b4kGdq1IaKUFBBDKXzXi4cVZNa53VBlXQ4y/FPVx5Wku5bjJvMAx
	 4X8Ij5ISwXmogRofHsouTFd3mdITVzdprYkAtxBbyuWVZoQnp6476KsAfbLuS5bej+
	 Nx4PYQPnbOyx9l4+7OXh5DnvTVg4hyA0L2wXfXdZaOomEcpit9w9t9SF0ibf8Jiz8J
	 MxQtHjKvrB2uV1njSU/OxhkABwB5tO6275HDYr9wBPY/53pxXp3Ub1tU7HadDdCnlS
	 zqoGUjCyop8rg==
Message-ID: <sashiko-outbox-202533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 2/2] pwm: Add OpenCores PTC PWM driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hal Feng" <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107031251.98972-3-hal.feng@starfivetech.com>
References: <20261107031251.98972-1-hal.feng@starfivetech.com>
 <20261107031251.98972-3-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 03:36:03 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] pwm: ocores: clk_get_rate() called before enabling clock in
  ocores_pwm_probe()
- [Low] pwm: ocores: unlocked and pre-enable clk_get_rate() in
  ocores_pwm_probe()
--

commit 33c73933621c3feed0e1d70460454bd0821561cc
Author: Hal Feng <hal.feng@starfivetech.com>

pwm: Add OpenCores PTC PWM driver

This commit adds a PWM driver for the OpenCores PTC IP core.

> diff --git a/drivers/pwm/pwm-ocores.c b/drivers/pwm/pwm-ocores.c
> new file mode 100644
> index 0000000000000..4c7e87cb009f6
> --- /dev/null
> +++ b/drivers/pwm/pwm-ocores.c
[ ... ]
> +static int ocores_pwm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ocores_pwm_device *ddata;
> +	struct pwm_chip *chip;
> +	int ret;
> +
> +	chip =3D devm_pwmchip_alloc(dev, 1, sizeof(*ddata));
> +	if (IS_ERR(chip))
> +		return PTR_ERR(chip);
> +
> +	chip->ops =3D &ocores_pwm_ops;
> +	ddata =3D pwmchip_get_drvdata(chip);
> +
> +	ddata->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ddata->base))
> +		return dev_err_probe(dev, PTR_ERR(ddata->base),
> +				     "Failed to map IO resources\n");
> +
> +	ddata->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(ddata->clk))
> +		return dev_err_probe(dev, PTR_ERR(ddata->clk),
> +				     "Failed to get clock\n");
> +
> +	ddata->clk_rate =3D clk_get_rate(ddata->clk);
> +	if (!ddata->clk_rate || ddata->clk_rate > NSEC_PER_SEC)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Invalid clock rate: %lu\n", ddata->clk_rate);

[Severity: Low]
Does caching ddata->clk_rate here without locking the clock rate via
devm_clk_rate_exclusive_get() and after enabling the clock leave the
driver vulnerable to an invalid initial rate or runtime clock rate
changes?  If the parent clock rate changes after probe, ocores_pwm_apply()
and ocores_pwm_get_state() will compute inaccurate periods and duty cycles
from the stale rate, or violate the NSEC_PER_SEC bound.

> +
> +	ddata->rst =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(ddata->rst))
> +		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> +				     "Failed to get reset\n");
> +
> +	platform_set_drvdata(pdev, ddata);
> +
> +	ret =3D ocores_pwm_runtime_resume(dev);
> +	if (ret)
> +		return ret;

[Severity: Low]
Should clk_get_rate(ddata->clk) be called after
ocores_pwm_runtime_resume() enables the clock?  The clk API only
guarantees a valid rate once the clock is enabled, so querying it before
clk_prepare_enable() can return 0 (failing probe with -EINVAL) or a stale
rate on clock providers that compute their rate on enable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107031251.9897=
2-1-hal.feng@starfivetech.com?part=3D2
