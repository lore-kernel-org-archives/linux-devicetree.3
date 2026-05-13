Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154071991D4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778646206; cv=none; b=JUS0NsTYAP4JbCLTm4GlX5UYGdALMTtuGWOyXfxF1WEyGvBd/2+L6qv4NFk8l0GqfTuIj1GuAbdOw2DPZogk83mqt9hMX6+9DTL9Fs29A0FjzhFr9Wp7TmcEIC0vAHiucvyqezYmmN2SjDV5Igf9W33netQKOOFncul9nMPaxrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778646206; c=relaxed/simple;
	bh=PZ/stj5XwONuojM4fh7e63S+aSsQ5CgPvgW41XgsnxY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g7iz02lFHfanmjHtIovxOcbrhnW8DIZVuyMb0fQNssR8047aTfqOLkN6CkgUc8p542qTK9oS4Tah4E+GaaeCri90l7aGIpdRVW/DN2k8oPBw2fd9arVeS3+4fkbAyeGEELT+IB+f2lTtFi2NNerrKdse8ALiShZ4W3U90AHgB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrEbVfnY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrEbVfnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C09C2BCB7;
	Wed, 13 May 2026 04:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778646205;
	bh=PZ/stj5XwONuojM4fh7e63S+aSsQ5CgPvgW41XgsnxY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HrEbVfnYyqolt9rhpCMb9t/3WY1H/G94Qmdcy0h4HNtlH5Zp08nLItg417HT2QWXW
	 YB3zceEBN9xPO6ZVX+UJiJRS+69My6s1ly8VWD3ChwrVRNbjAzHsP63WPKJuHt5WwF
	 QgFABXUzu2Vqp8kMLCVa0puA9MZjY+wxXjDMPN0Wg0yQW9CYsZLAukVGtrlIDP7vK0
	 KCJQLDdZnl6WVJYQttId96tCPySgYZtQL8i1y3odigIFBC0jdH95dAa48kmWCQi37p
	 qaCGr3BtNjwiN9oq7qEahFevLm8mJH8800FSND6tGJ6I7y8eaLrcNOIvaFDa8/Fd2V
	 In/zyjPUGf81Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] gpio: regmap: Add set_config callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260512033317.1602537-5-eleanor.lin@realtek.com>
References: <20260512033317.1602537-5-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 04:23:24 +0000
Message-Id: <20260513042325.68C09C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `set_config` callback leaks the underlying `struct gpio_chip` t=
o the driver, breaking the abstraction boundary provided by `gpio_regmap`.
--

commit ac512057e733370619e59d76ffbee25d7ea97d9f
Author: Yu-Chun Lin <eleanor.lin@realtek.com>

gpio: regmap: Add set_config callback

This commit adds a new set_config callback to struct gpio_regmap_config
to allow drivers to implement hardware-specific configurations like
debounce settings or other platform-specific GPIO properties.

> diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
> --- a/include/linux/gpio/regmap.h
> +++ b/include/linux/gpio/regmap.h
[ ... ]
> @@ -142,6 +145,10 @@ struct gpio_regmap_config {
>  			       unsigned long *valid_mask,
>  			       unsigned int ngpios);
> =20
> +	int (*set_config)(struct gpio_chip *gc,
> +			  unsigned int offset,
> +			  unsigned long config);
> +
>  	void *drvdata;
>  };

Does exposing struct gpio_chip directly to the driver break the
abstraction boundary provided by gpio_regmap?

The gpio_regmap library appears designed to abstract away struct gpio_chip
from generic regmap-based drivers. For instance, the reg_mask_xlate
callback takes a struct gpio_regmap pointer rather than the raw chip.

Because gpio_regmap sets its own internal structure as the private data
of the gpio_chip during registration via gpiochip_add_data(), drivers cannot
simply access their private data using gpiochip_get_data(). They would
instead be forced to use a lookup chain like
gpio_regmap_get_drvdata(gpiochip_get_data(gc)).

Would it be better to have the callback in struct gpio_regmap_config take
a struct gpio_regmap pointer instead?

> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
> --- a/drivers/gpio/gpio-regmap.c
> +++ b/drivers/gpio/gpio-regmap.c
[ ... ]
> @@ -371,6 +371,8 @@ struct gpio_regmap *gpio_regmap_register(const struct=
 gpio_regmap_config *config
>  	if (!gpio->reg_mask_xlate)
>  		gpio->reg_mask_xlate =3D gpio_regmap_simple_xlate;
> =20
> +	chip->set_config =3D config->set_config;
> +
>  	ret =3D gpiochip_add_data(chip, gpio);
>  	if (ret < 0)

If the struct gpio_regmap_config callback is updated to use struct
gpio_regmap, could an internal wrapper function be added here in
gpio-regmap.c?

The wrapper could implement the struct gpio_chip set_config signature,
handle the translation from struct gpio_chip to struct gpio_regmap, and then
invoke the driver's config->set_config callback.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512033317.1602=
537-1-eleanor.lin@realtek.com?part=3D4
