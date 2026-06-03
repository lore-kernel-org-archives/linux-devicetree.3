Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27873F54DF
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467146; cv=none; b=iscUv/umkGLhIR2zc3OUPYSjX1fR376ygvm6Lh3TITi4Uyj0CJyrvvtZw6aC6ekz52IcbG2hOpny/+GRuSGSIB6MMH/d2oDJ9dpLv5fT8PqaOPynN2MRkwjal+y9rjWhKkt4qrL8Mbfq5yESnQZiQDuIDpFjWt2hYYZ88b4EyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467146; c=relaxed/simple;
	bh=BYXz+dbgG7tFIL/OXUba3stDqt6ldTRFoJ3qFMWbat0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YCzfSTrTUHufIZdWvru4QEpbWzV7SWR6PpXmePpI6nsqTkUJd/J7e7B8J+SvN63ieAhdCUoRQvJbq9WQWCyDIUb66WTQFa5tghPZXQXsJWzDlGgVaXQAY4Mw0pzlYb5mN3cOZeuYDafiwzlJ7Qc0rdTlavDuxj7YFXeOLSj7wSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1tl6Dzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1tl6Dzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6BC1F00893;
	Wed,  3 Jun 2026 06:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780467143;
	bh=kiIujZIlxsDcd1W9OUMI9EgGT3IkQMiBcdpZ6iU/G74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1tl6Dzlkir0b80Ne1S/BANvCAaQndQ6EMikSpodC5EODPwt1ZCu++btz625UvP9J
	 jO4Ewxb4FYjB1JhcYYY89OvG3E8C/21ARMhU7M4bxtDCQ4w0JejmroBy/X5Xp0dJ0Z
	 Uukr+HahxZbbZjj6/jfCzyA4cDLDAaZROVtzIkAc4Z0nFun+xicfkF3Y0t+DdDBETD
	 4GFWeo4S7NQkVZrkxy/5y7d/RtCxu2N2TXBv0XAz6caNp1RDkhWzTL7uphy4ILH8mh
	 929CQIknYqj9cn8eots5CjPZ5U8MyM7nxiEd3VBCzu13otxeUUbDZo1UkJhZpyTpwR
	 SHJ11YHUMavHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 2/5] i2c: aspeed: Read clock-frequency via
 i2c_parse_fw_timings()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ryan Chen" <ryan_chen@aspeedtech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260603-upstream_i2c-v31-2-ba7a02714f22@aspeedtech.com>
References: <20260603-upstream_i2c-v31-2-ba7a02714f22@aspeedtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:12:22 +0000
Message-Id: <20260603061222.EE6BC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Kernel panic via division by zero when bus frequency is configured=
 to 0 in device tree.
--

commit 7def856c61d40b684f656602f5cf38ffd5745272
Author: Ryan Chen <ryan_chen@aspeedtech.com>

i2c: aspeed: Read clock-frequency via i2c_parse_fw_timings()

This commit transitions the driver to use i2c_parse_fw_timings() for parsing
the standard clock-frequency property. It maintains backward compatibility =
by
falling back to the legacy bus-frequency property if the standard one is
missing.

> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-asp=
eed.c
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -1025,12 +1026,18 @@ static int aspeed_i2c_probe_bus(struct platform_d=
evice *pdev)
>  	}
>  	reset_control_deassert(bus->rst);
> =20
> -	ret =3D of_property_read_u32(pdev->dev.of_node,
> -				   "bus-frequency", &bus->bus_frequency);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev,
> -			"Could not read bus-frequency property\n");
> -		bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +	i2c_parse_fw_timings(&pdev->dev, &timings, false);
> +	if (timings.bus_freq_hz) {
> +		bus->bus_frequency =3D timings.bus_freq_hz;
> +	} else {
> +		ret =3D of_property_read_u32(pdev->dev.of_node,
> +					   "bus-frequency",
> +					   &bus->bus_frequency);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for a malform=
ed
device tree to cause a kernel panic here?

If the device tree specifies bus-frequency =3D <0> and clock-frequency is
absent or also 0, of_property_read_u32() successfully reads 0 into
bus->bus_frequency.

Since the frequency is not validated to be strictly positive, wouldn't this
later trigger a division by zero exception in aspeed_i2c_init_clk() when
calculating the divisor?

drivers/i2c/busses/i2c-aspeed.c:aspeed_i2c_init_clk() {
    ...
    divisor =3D DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
    ...
}

Should we add a check to handle a 0 hz configuration gracefully rather than
crashing during device probe?

> +		if (ret < 0) {
> +			dev_err(&pdev->dev,
> +				"Could not read clock-frequency or bus-frequency property\n");
> +			bus->bus_frequency =3D I2C_MAX_STANDARD_MODE_FREQ;
> +		}
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-upstream_i=
2c-v31-0-ba7a02714f22@aspeedtech.com?part=3D2
