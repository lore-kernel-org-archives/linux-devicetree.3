Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9793F788F
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511395; cv=none; b=ls/JdNTSnPOBJaD5yzclYnbTjjQhbBRQhfJvXb9jJQSTWBQcBl/h+DQau3qqJ+95yR8AHWsK+HsPOddRbaCCuckZ6Pyv0rLPurJgI/Er8Ja38lq9TsFnDPuxXLp73QCucwhaHriKVh/arL9LDIHATZyGjDb0QmaA+R7Btmn9FqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511395; c=relaxed/simple;
	bh=+yHx2vq/hUeMrbD9re+41ZGr5Gp+ckJjvn9OV8ugWSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sBatzPl68B0mWa7ZEM/92gAQHoYvqve12DIwvnR/Mj6+4arWUPYYr8x5A7z3wo0vtpYM/Ak7PYcRp6jfV1nbFNp3UxSNMdY6yLXCd5w0ahm8+F+qAS3U5vfcofgbO+baz2fDHfeN84AQiCJ2+0Kc5n8U+Gdj/RaT97goZyt7kpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsRkY52U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsRkY52U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B1E1F00A3E;
	Fri,  4 Sep 2026 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788511389;
	bh=W41Gchnmbd+oso4r0BSZH2y/GkahKY1NFcw72aKXpUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WsRkY52UfkbFvkQz36ORxl7VqfeFXOCxAH18gO5/ZYWFLaNpdaEw7w9G/UCwZ8yeR
	 vRifSHScyaAkSC9ukp2fx3INvtvuj1TPvUu/Z2Ur6vWr6ThvLst/yZaX4Qf0jQfkEE
	 qkjdRaVJEhj57pqZyHDLJEobI0Z9kdPX2Ys5qG18yk1HzGYhK0g6oeImkyJ07EA3EE
	 d4f/t2VypxQW2lQkMl383RWXIagNUDQTerF52tcaRTJKo6qh+JKOrQ4jItceUo58gv
	 yIxPgYeWdEtCG17D5oShTibEUlDEBivivbo4fJ5bz55thN0+oY8oTXmd2oGpCX3sX7
	 YI0BsDePcuhwg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] iio: ABI: Add DAC current powerdown attributes
 and 15kohm_to_gnd mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-iio-ad5710r-upstream-v5-1-76f985b7d0ee@analog.com>
References: <20260904-iio-ad5710r-upstream-v5-0-76f985b7d0ee@analog.com>
 <20260904-iio-ad5710r-upstream-v5-1-76f985b7d0ee@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:43:08 +0000
Message-Id: <20260904084309.38B1E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch documents out_currentY_powerdown_mode but misses the corr=
esponding _available attributes.
--

commit 8792fdce55087374092373b1e07164bea5a13f94
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: ABI: Add DAC current powerdown attributes and 15kohm_to_gnd mode

This commit documents the out_currentY_powerdown and
out_currentY_powerdown_mode attributes for current-output DAC channels.
It also adds the 15kohm_to_gnd powerdown mode to the list of available
modes.

> diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/=
testing/sysfs-bus-iio
> index a4f5595722ade..a0f9aada5c62d 100644
> --- a/Documentation/ABI/testing/sysfs-bus-iio
> +++ b/Documentation/ABI/testing/sysfs-bus-iio
> @@ -762,6 +762,8 @@ What:		/sys/bus/iio/devices/iio:deviceX/out_voltageY_=
powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_voltage_powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_powerdown_mode
>  What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltage_powerdown_mode
> +What:		/sys/bus/iio/devices/iio:deviceX/out_currentY_powerdown_mode
> +What:		/sys/bus/iio/devices/iio:deviceX/out_current_powerdown_mode

[Severity: Low]
Should the corresponding out_currentY_powerdown_mode_available and
out_current_powerdown_mode_available attributes be documented as well?

The existing voltage powerdown modes document their available variants
further down in Documentation/ABI/testing/sysfs-bus-iio:

What:           /sys/.../iio:deviceX/out_voltageY_powerdown_mode_available
What:           /sys/.../iio:deviceX/out_voltage_powerdown_mode_available
What:           /sys/.../iio:deviceX/out_altvoltageY_powerdown_mode_availab=
le
What:           /sys/.../iio:deviceX/out_altvoltage_powerdown_mode_available

It seems the current equivalents were omitted from this patch.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-iio-ad5710=
r-upstream-v5-0-76f985b7d0ee@analog.com?part=3D1
