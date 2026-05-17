Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836F2DEA95
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779007677; cv=none; b=DK9qM6bPi6d4Q8AwYiZjKRboSYXLDTA2Trc4WGdZTElXyh3VsafdSF6cp2MMHbArg70ncjS4p9xWoq/gUW4X4dQgRp2pyFMXDMrR48R2tDDC5sTCRs0U2ZY9HqAjEVou81lB0vcaNqkDIibSLVZeNAHabbBDlXjUW9J2om78fEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779007677; c=relaxed/simple;
	bh=ZwHosl+L5lDQ9cq+KfvIeLyQAgDZ/OLERgvNwBPn8zI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Il4BhNJnrl/txZiIao1zsO5NKFtute2S/ZVuRKIe/Awc06kwT0beVfFq+weKyO+Sd5u6uRfypkuwnDS74yhvfxOD53/v1boMvHhDLqgoXCZbOykdboqJjPnL/VTUk8xfyscovCj9uNDXMMRO5YIMMW5LlKNjz8C0RafbJN6+Ax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg9Sle50; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg9Sle50"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBB9C2BCB0;
	Sun, 17 May 2026 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779007677;
	bh=ZwHosl+L5lDQ9cq+KfvIeLyQAgDZ/OLERgvNwBPn8zI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Hg9Sle50ISMoJU8sng869LqUmwpxqYd+4VugTyvossXuTYuyjTdbXT3SVz23f8Idm
	 lzDQkGnqhCk27DAC8x5Cc4NPqP/2wDdujYaqoWd+YBTnRUR7BODiC9n0sF07Be2gt2
	 AMIw+GaEnwoEQXreVAkYG2now5a3huJjt4euTfFaEqosmL+c9AgL6i32nX5cbrL20B
	 fKDnAYcNdvK/I5Vhr7qbMcoFwfBBucrCLgdOCR7SX7di6veav31I7+td5dLe5x3ed7
	 rK+AWKFqZ09vUOt5MTJHBBKdUuYQbmEr8Vw0rc3qMoAe+rVG5woYbiWNI0ZR+aWk5v
	 ZvJLdbgeiOyew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/6] mfd: lm3533: Add support for VIN power supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517074306.30937-4-clamor95@gmail.com>
References: <20260517074306.30937-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 08:47:56 +0000
Message-Id: <20260517084756.CBBB9C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Implicit dependency on <linux/regulator/consumer.h> without an expl=
icit include.
--

commit a9ff3766520433ef45982257dcd46aa034405482
Author: Svyatoslav Ryhel <clamor95@gmail.com>

mfd: lm3533: Add support for VIN power supply

Add support for 2.7V-5.5V VIN power supply.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
> index 83ebd780f39d5..131eb1a1c8eba 100644
> --- a/drivers/mfd/lm3533-core.c
> +++ b/drivers/mfd/lm3533-core.c
[ ... ]
> @@ -173,14 +173,25 @@ static int lm3533_set_lvled_config(struct lm3533 *l=
m3533, u8 lvled, u8 led)
>  	return ret;
>  }
> =20
> -static void lm3533_enable(struct lm3533 *lm3533)
> +static int lm3533_enable(struct lm3533 *lm3533)
>  {
> +	int ret;
> +
> +	ret =3D regulator_enable(lm3533->vin_supply);

This isn't a bug, but should we include <linux/regulator/consumer.h> in this
file? Relying on implicit includes can lead to build breakages if upstream
headers are reorganized.

> +	if (ret) {
> +		dev_err(lm3533->dev, "failed to enable vin power supply\n");
> +		return ret;
> +	}
> +
>  	gpiod_set_value(lm3533->hwen, 1);
> +
> +	return 0;
>  }
[ ... ]
> diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
> index 3aa962d4c7473..e355a3ac982ec 100644
> --- a/include/linux/mfd/lm3533.h
> +++ b/include/linux/mfd/lm3533.h
> @@ -28,6 +28,7 @@ struct lm3533 {
>  	struct regmap *regmap;
> =20
>  	struct gpio_desc *hwen;
> +	struct regulator *vin_supply;

Could this header use a forward declaration for struct regulator?

> =20
>  	u32 boost_ovp;
>  	u32 boost_freq;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517074306.3093=
7-1-clamor95@gmail.com?part=3D3
