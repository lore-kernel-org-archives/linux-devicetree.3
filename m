Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265223;
	b=RFazgzCej9mtnexBB5xd3plaUmpp0mN3R16slYgO1oQfLOi8zkPdGAi5PpnxJfKXkTJH
	 igu3rrm17GNcp44AsgjA8v7vu75Cme7r3QK3p5I4Ffx4w7IDpitZ5TIqD4vYaP8MXAdD0
	 bFYqf1GurPASJU6fgXGJcVk/KBOB25537vjPAd5t8yzR/LflVSaN5a3GehxcLBzp7r4/R
	 lQe+O1kwNlPphud5eIDDT7djvUkD7C0DlpWn3Zb33iDz6lHFL2ncAkTurJ9xfcvKKt2KF
	 eT56dXpZyPVmD4WuT21gewpCPUz+1NbkffVBevmzJ0WTS1E96L2s60zwqcVOV//E+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265223;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9+J8Qm7qXsvnq+ujbgVQ4tcc9BTQH+cri44QyzxVLeI=;
	b=rbvqYDC9qjrbL6kvqVULyphQXnklhmsopBSgMm29LGT21LR0aa6CfeWuIMxN82VA9a+b
	 ycVCwE7wf1Aijre6Ay3ydt3MBZM5WjSjKpUOvjdjjg/yBI16LV4wrHeRcEnH58R/Pxic8
	 yNQ8Eojk5NPxsUE2tbJZcU4kzGejfOin2QHKYyeis1xd9RPzAQNwCJG3olDsiHHxMuO1J
	 Xs8xWFEGx5uuAHQnYZccsgzT6xsEcpYrTi+klLBudwHLJgH4s7kIJ79W1oURe/bcUjgK1
	 mBiUmoXAiPNrzg2WJ2kIpB0WPxU6SbuGlVO5JjWv95U4uS6QqFQ5Ofm6BAfgdwy2FiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtb4SNHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FC606A33A
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 23:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qtb4SNHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDC01F008A5;
	Mon,  9 Nov 2026 23:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794265223;
	bh=9+J8Qm7qXsvnq+ujbgVQ4tcc9BTQH+cri44QyzxVLeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qtb4SNHk/o0++SelDSS0NnbReBGliwk8ogbtRSfnTJupQRVGESZTZaqHM+rxdgbpx
	 wj9iHJ/P9o4ad7AtPXLSpIffi2yWdaOsSdh6Sp73HpKlLXw33yw1ZWZ3W83aPTozQw
	 u1QIYX/yTEgQHEBJX8F9+sswrYeOUQ/RdEDIeopu8z5q55SkEjJPLBwUM57gmLeIzV
	 YY9nUCYg5Rnf0boVprmEHx5hNzIxZytiTdVLtu57zohgwLGX3eUmt6nvWzkQuHAyP4
	 VymXCdcSCRChLd1pW3DNs/9I0qSKJD4XdhfIT/lMUadTXMYXhXhipuHPJjSHwCFv0r
	 ZhYJ5I8ft2vwg==
Message-ID: <sashiko-outbox-205781@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108-mxl-gsw1xx-reset-v2-2-46c1da093893@telaak.dev>
References: <20261108-mxl-gsw1xx-reset-v2-0-46c1da093893@telaak.dev>
 <20261108-mxl-gsw1xx-reset-v2-2-46c1da093893@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 23:00:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] net: dsa: mxl-gsw1xx: gsw1xx_probe() uses reset API for
  exclusive reset-gpios
--

commit 911ba1a0c2756adf7ef65c7eabd51481e6dc7a52
Author: Joseph Telaak <joseph@telaak.dev>

net: dsa: mxl-gsw1xx: reset the switch through reset-gpios

This commit asserts and deasserts the switch reset line in gsw1xx_probe()
via the reset controller API before accessing switch registers.

> diff --git a/drivers/net/dsa/lantiq/mxl-gsw1xx.c b/drivers/net/dsa/lantiq=
/mxl-gsw1xx.c
> index a26f78e1a44ce..94a7eff5e0077 100644
> --- a/drivers/net/dsa/lantiq/mxl-gsw1xx.c
> +++ b/drivers/net/dsa/lantiq/mxl-gsw1xx.c

[ ... ]

> @@ -737,6 +739,29 @@ static int gsw1xx_probe(struct mdio_device *mdiodev)
>  	if (!priv->gswip.hw_info)
>  		return -EINVAL;
> =20
> +	/* The MDIO core handles reset-gpios only for PHYs. Reset the switch
> +	 * here, so it does not run with whatever the bootloader configured.
> +	 */
> +	reset =3D devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset control\n");

[Severity: Medium]
Should gsw1xx_probe() request reset-gpios directly with
devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH) and
gpiod_set_value_cansleep() instead of going through the reset controller
API?

The binding in Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
only defines reset-gpios (not resets) for standalone GSW1xx switches, while
NET_DSA_MXL_GSW1XX in drivers/net/dsa/lantiq/Kconfig does not select or
depend on RESET_GPIO or RESET_CONTROLLER.  When CONFIG_RESET_GPIO is
disabled (it defaults to n), __fwnode_reset_control_get() does not fall
back to reset-gpios and devm_reset_control_get_optional_exclusive()
silently returns NULL, skipping the hardware reset and leaving the switch
in the bootloader-configured state where ports fail with -ENODEV.

Using the reset-gpio wrapper for an exclusive GPIO reset also fails in
__reset_add_reset_gpio_device() when GPIO flags exceed GPIO_ACTIVE_LOW
(-EINVAL) or #gpio-cells is not 2 (-ENOENT), and allocates a persistent
auxiliary device and software node that are never freed on unbind.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-mxl-gsw1xx=
-reset-v2-0-46c1da093893@telaak.dev?part=3D2
