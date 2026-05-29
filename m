Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F130CD82
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780029060; cv=none; b=Y3jq5HVC5FtvpolcDRePAw/AjxwlzGQjP1etLWQyqEPxZVadS6CBA278Eaejrhpow5t1gPhpngQzAniPVkprjalwheaGRBjvvoWxq4TS9DnDAftV2630V2FBPkJ1/xBw9ROc8lYtyCtyyzkkCl1a61N2lba4zHlorpD2bk3JLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780029060; c=relaxed/simple;
	bh=RTu624FOaFYsSVqzRNcr94QrkGuIwKPpDR/vsnae1sY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u3h/+BH+VVeuAoDbzriwIxWeraqkljWGcDMpl2NqIrAyU3TMnUoUE4uSihxNE9b1g1tdw0azvv7wSmNFusR2KkcczMvMxKu6r35aGAmZAdfqkTbh9qvAME+9DXIF1D/p6BpZcOyFrBJ+E07oTwRw+A+iw76thMAKkwJtqWCuHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1D48ruc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1D48ruc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845D71F00893;
	Fri, 29 May 2026 04:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780029059;
	bh=X7FPX1IaTFbUqUIvOIe03z5wU1RLGWPHY8UrwiNFqzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h1D48ruch97nUnOymybKIz75tmHTTw8ZGXhe3AvjR1cSjZQzRKE8i3o4jPyMuR3Rk
	 Uwq8Fun21YeQ1W0YeYttLIP0gpz9hQKcJZjbmZo2/FHDkbzxleBKJbaj8AjDdSLX1c
	 cxabqvOEzg9uQ4LbiJDKSIvt/XaG6o8c/qe1Ilncr0pg+WFBydYKp9EydOywYtsn0X
	 y+ewZaSuBKgMr7wL4r3TRX7xG5rIDSctp/+u4CFMWYnkxADS7cokS9jN7LWXgjCxyp
	 MDDS3f7aFcuW3F6ubO1cCddiFVYd1QZ8CySd9647UwCfjRNr2Dkw7ei/uI3p/xXXwd
	 UR7AJET/agh9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/7] pwm: tegra: Add support for Tegra264
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikko Perttunen" <mperttunen@nvidia.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-t264-pwm-v5-6-7bf9e405a96a@nvidia.com>
References: <20260529-t264-pwm-v5-6-7bf9e405a96a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 04:30:58 +0000
Message-Id: <20260529043059.845D71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver assumes a fixed PWM depth of 256 but fails to initializ=
e the new configurable DEPTH register field on Tegra264, risking incorrect =
PWM frequency and duty cycle.
--

commit a215267521de0fbfc0019ea87d4d0d3a5d3250ea
Author: Mikko Perttunen <mperttunen@nvidia.com>

pwm: tegra: Add support for Tegra264

This patch adds support for the Tegra264 PWM controller. It introduces
an enable_reg field to handle the relocated PWM_ENABLE bit in the new
CSR_1 register for Tegra264 devices.

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
> index 7c7b884d44363..50e72139cbc34 100644
> --- a/drivers/pwm/pwm-tegra.c
> +++ b/drivers/pwm/pwm-tegra.c
[ ... ]
> @@ -215,6 +257,7 @@ static int tegra_pwm_config(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
> =20
>  static int tegra_pwm_enable(struct pwm_chip *chip, struct pwm_device *pw=
m)
>  {
> +	struct tegra_pwm_chip *pc =3D to_tegra_pwm_chip(chip);
>  	int rc =3D 0;
>  	u32 val;
> =20
> @@ -222,20 +265,21 @@ static int tegra_pwm_enable(struct pwm_chip *chip, =
struct pwm_device *pwm)
>  	if (rc)
>  		return rc;
> =20
> -	val =3D tegra_pwm_readl(pwm, TEGRA_PWM_CSR_0);
> +	val =3D tegra_pwm_readl(pwm, pc->soc->enable_reg);
>  	val |=3D TEGRA_PWM_ENABLE;
> -	tegra_pwm_writel(pwm, TEGRA_PWM_CSR_0, val);
> +	tegra_pwm_writel(pwm, pc->soc->enable_reg, val);

[Severity: High]
Could this cause a regression where the PWM output is left in a broken state
if the hardware resets the DEPTH field to 0?

The commit message notes that configurable depth will be supported in a
later patch, and tegra_pwm_config() continues to use a hardcoded
TEGRA_PWM_DEPTH of 256 for duty cycle and clock rate calculations.

Since this read-modify-write only updates the ENB bit, if the CSR_1.DEPTH
field defaults to 0 after a device reset, wouldn't the hardware divide by 1
instead of 256?

This seems like it would cause the PWM to operate at 256x the intended
frequency, and any calculated duty cycle value would exceed the hardware's
maximum depth. Should CSR_1.DEPTH be explicitly initialized to 255 here to
safely match the software's TEGRA_PWM_DEPTH assumption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-t264-pwm-v=
5-0-7bf9e405a96a@nvidia.com?part=3D6
