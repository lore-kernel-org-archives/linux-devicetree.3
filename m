Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2407037F8BD
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358083; cv=none; b=PzK9rYcTAi7qBN1bLhz5W3PZCGPWH2bHqrQLi+Hqoo6rpBNS5/3436CuH9iXBgJW9qvLXpbfVWnGeuIhqn+aYauN/y3FIlmsgz32RDkoNx6Vaxa5+KMoU2I3KWMypnluZAl5LnnU4eh3Fk8fXpYkqt6jWAmSsaSJf0dmut3JUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358083; c=relaxed/simple;
	bh=n8CvLIGN20rYZb8dnJnK1b3+mahVDJg+Z9jAADjJYzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDCn3sP6PQoRTBxLkXqEaUhAGt2v2PZdBz8HpqWkGqBreAgfpJb+uyfOyA4DjQFjDBkp1ynXCBw77tvLs2L3WWnNkyBIFHeDNyAnbHpRNsYaafH6kJDIfiNta/OpxR7sL5LGRqPJui2nraVg6Punu0hrCIYb6Pq5d/X+LvSE5BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSTmZltz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSTmZltz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2181F000E9;
	Thu, 21 May 2026 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358080;
	bh=UVi8zJ4SA7IohJo/CkkYClm03U987hNqpTAPBNh2OYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cSTmZltzCuWEu3Kp5h8zhL90YyzYnhbB3tE9aolNm28mosoTyF3d0L613C1uyMWKF
	 sU5nlcXef+XmI1SQ97/4skNPnH9vm7Eu8uk3JssVeue6UwvcTsJ5Hdei6ycUJPd3wy
	 xPbtqahZYfFd+WHBEuAGjwFgdha57hRAv7/cT4TXyEFi0wAdnrfOSVNSM9Aq9zEqBY
	 pBscQzbVUmkfcN7VPDIb9w4CYEqC+EenKYRUJrdYDjkEuN4Ne5RaDs4K8rBqAbuI6b
	 nK8udnQfKr974D9/QI7PESxFOIH6DGBaHsuUvrBAlWqiJ8fcGeqNXiZNDGyuCHMAtf
	 LzoaVW/Th536g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] pinctrl: aspeed: Add AST2700 SoC1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Billy Tsai" <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260521-pinctrl-single-bit-v5-3-308be2c160fc@aspeedtech.com>
References: <20260521-pinctrl-single-bit-v5-3-308be2c160fc@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 10:07:59 +0000
Message-Id: <20260521100759.AD2181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pin_config_get() and pin_config_set() return -EINVAL instead of -E=
NOTSUPP for virtual pins, causing fatal probe failures for groups containin=
g these pins.
--

commit d4d214b81bd3876c9753372b7321c3f7575490ed
Author: Billy Tsai <billy_tsai@aspeedtech.com>

pinctrl: aspeed: Add AST2700 SoC1 support

This commit implements pin multiplexing and pin configuration for the
AST2700 SoC1 SCU pinctrl block using static SoC data tables. The driver
registers with the generic pinctrl, pinmux, and pinconf frameworks.

> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c b/drivers/pi=
nctrl/aspeed/pinctrl-aspeed-g7-soc1.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g7-soc1.c

[ ... ]

> +static int aspeed_g7_soc1_pin_config_get(struct pinctrl_dev *pctldev,
> +					 unsigned int pin,
> +					 unsigned long *config)
> +{
> +	struct aspeed_g7_soc1_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	struct aspeed_g7_field field;
> +	unsigned int val, val_raw;
> +	int ret, ds_idx;
> +
> +	if (pin > AC24)
> +		return -EINVAL;

[Severity: High]
Should this return -ENOTSUPP instead of -EINVAL for virtual pins?

The pinctrl core treats -EINVAL as a fatal error, but gracefully ignores
-ENOTSUPP for unsupported configurations. If a device tree applies generic
pin configurations (like bias-disable or drive-strength) to groups containi=
ng
a mix of physical and virtual pins, returning -EINVAL could abort the entire
group configuration and cause the consumer device's probe to fail.

[ ... ]

> +static int aspeed_g7_soc1_pin_config_set(struct pinctrl_dev *pctldev,
> +					 unsigned int pin,
> +					 unsigned long *configs,
> +					 unsigned int num_configs)
> +{
> +	struct aspeed_g7_soc1_pinctrl *pctl =3D pinctrl_dev_get_drvdata(pctldev=
);
> +	struct aspeed_g7_field field;
> +	enum pin_config_param param;
> +	int i, ret, ds_idx;
> +	unsigned int val;
> +	u32 arg;
> +
> +	if (pin > AC24)
> +		return -EINVAL;

[Severity: High]
Does this code also need to return -ENOTSUPP for virtual pins to avoid
failing pinconf_apply_setting() during device probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pinctrl-si=
ngle-bit-v5-0-308be2c160fc@aspeedtech.com?part=3D3
