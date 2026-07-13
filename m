Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFF13769FE
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940905; cv=none; b=ckk+aONbtSafvUOtReP0Gg8IWmxkIO1Q6MYGdZBnWbQl+2bmMM1fcGtyZ/j8hR9vCliiCFz26LBfyI83i1DMXnO7squfIhjwSihDrlInFPdHiQdT4yc/l+ahz3W4ODDW33cQuhJeWalK2I4Z3Hn83ZDq4t70fE/SJCuX4TmaZvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940905; c=relaxed/simple;
	bh=MMoWINIf15bd9A+VlV7JSmqw5ECsMjaYJCzieU3Wt0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WynRBy0NcX5y6Zw8q1KO+fXc5yZrqOoF5ecjjvyfyz63DJK+lfjRylxhwfrDDTIifrMMWJmFT3l1hskINlBeuo2MqdjAtP1uiMjS+UD8zJEUlrguDKHdj+De6KeuNqdmFT98wzIE98k0XKDe85i+2Kxf183tlkevZME2JVQGW/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4MfSRy0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4MfSRy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320D91F00A3A;
	Mon, 13 Jul 2026 11:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940886;
	bh=us/zvIee1s7Sm9szi0nE7F6MuQ05pZHulfHC5Z4wRBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4MfSRy0/ul/LGA2kAJpyeME8j/8AQAcUDS9qE8tvHGkNrwOyuVQpEqiR9GpeNXk+
	 iD0Z+zMo1VpxNOPee3Izst9CiLe/9X5UoAuzXnsk+CqNLQGQdIT/gd9WvQkAdywgCC
	 6hX3DJ6EihzCGPL0geFGghMAja1ueEmhYYzl9FyU386yJcsYDsxyOUf2yEu+ke6b+W
	 tzypNoC7LqU1qfUqlS3b4F9n8KHiuAG7YlKSuyO05HpIo9GG02YXrDoIQDA5hXbbKV
	 dvAI/zoAZfER+Cak5vbAqYc85NLgOP9WEurhUs0Q71BIUnJ1PDNcNpqylwcilGrYs3
	 NotGZqKhfGhCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/8] ARM: dts: mstar: sbc2d06: Add regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Palmer" <daniel@thingy.jp>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713105950.1346962-8-daniel@thingy.jp>
References: <20260713105950.1346962-1-daniel@thingy.jp>
 <20260713105950.1346962-8-daniel@thingy.jp>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 11:08:05 +0000
Message-Id: <20260713110806.320D91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `vcc_sd` and `reg_vcc_wifi` fixed regulators specify `GPIO_ACT=
IVE_HIGH` but omit the `enable-active-high` property, causing their GPIO po=
larity to be incorrectly forced to active-low.
--

--- Patch [7]: [PATCH 7/8] ARM: dts: mstar: sbc2d06: Add regulators ---
commit 9f0e98cb27cc735c61124ee041d094826dabd5cf
Author: Daniel Palmer <daniel@0x0f.com>

ARM: dts: mstar: sbc2d06: Add regulators

This commit adds the board's fixed regulators.

> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wireles=
stag-ido-sbc2d06-v1b-22w.dts b/arch/arm/boot/dts/sigmastar/mstar-infinity2m=
-ssd202d-wirelesstag-ido-sbc2d06-v1b-22w.dts
> index b15c40762bc0a..8dbff5e53e5f2 100644
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-id=
o-sbc2d06-v1b-22w.dts
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m-ssd202d-wirelesstag-id=
o-sbc2d06-v1b-22w.dts

[ ... ]

> +	vcc_sd: regulator-vcc-sd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_sd";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio SSD20XD_GPIO_GPIO90 GPIO_ACTIVE_HIGH>;
> +	};

[Severity: High]
Does this missing enable-active-high property cause the SD card power suppl=
y to
fail to turn on?

The vcc_sd fixed regulator specifies GPIO_ACTIVE_HIGH but omits the
enable-active-high property. When the regulator framework attempts to enabl=
e it,
gpiolib intercepts the GPIO request via of_gpio_flags_quirks(). Because the
property is missing, the quirk forcefully applies the OF_GPIO_ACTIVE_LOW fl=
ag,
overriding the GPIO_ACTIVE_HIGH phandle argument, and logs "enforce active =
low
on GPIO handle".

The regulator framework would then incorrectly drive the GPIO low to enable=
 it.
This could prevent the SD card from powering on, potentially breaking boot =
if
the root filesystem is located on it.

A similar issue appears to be present in reg_vcc_wifi (regulator-vcc-wifi) =
from
an earlier patch in this series, which also omits the enable-active-high
property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713105950.1346=
962-1-daniel@thingy.jp?part=3D7
