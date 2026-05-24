Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6954134DCE6
	for <devicetree@vger.kernel.org>; Sun, 24 May 2026 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779621176; cv=none; b=OzfQey0pxbf+TbgeWdlxyoGt43rDYUIEmAXJkuT+RO4eWRbH0bJydtHnkBX2tmoJx4ovEV/M81WUyKIsAW1GwdsC56ynBXIJ5+ejaamNWeSH7xNyNy0b+y5MMNeaBgmxE7OncyilrFJWfnrGB12RouaZ8lECYk4tfDFIS1FfAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779621176; c=relaxed/simple;
	bh=OQRrXnIGcapfkmlHUvP5D2UNLj6Cp4XaUoFn+sKQy/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YWSOMj9xs/y9jHif+yp17lVgDP+q/MqX8TNyJTlEfmXI/TBnJQ6G5nml8gmDRXfOHcxV8MwyIQBUtNMV+JBtRjz0zXNqn/H45P8tFbMJj7qDTtdFRNZW/4fsJ6mo1QR996pi85P3Fz00+RhE0DfkWCEefQ6ODCQQVvvgQ/n9aMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCqn23KR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCqn23KR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1231F000E9;
	Sun, 24 May 2026 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779621174;
	bh=vIopfszOXsKI/st1+GBnftLMHFcU1C30RpHzVzlsH1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCqn23KRIfQNEYd6Qhli1h4AHS23wiDAlpMl69uafB0FBDHC+UFgfkYYCvE5x0Qeh
	 bjjmLz9jkxd4XfiHLQ50k0DY1CypGNHa35/myuWH1CNT31Oy04mhZjzUck+m7quEUg
	 ZEIJ3z457o7W6YMgSYoMn4VyT7NwkRa9tOzlbPXR9OshKWpIf8exll2jFTL/Vhj1vn
	 qTDQ7PReIpF2kLCh+8mEQauzjYt8ZmcfPI58WCSgUK144b87neiu3FeOuFc3t9Rlbj
	 HXZic5rNr45hQ1WJ3ZES49NsT1tu23+l3Os7WvRyxe4C2KC+flxr3Rnqkssbrl61aG
	 L65cUppm6LnPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 08/12] iio: frequency: adf41513: driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260524-adf41513-iio-driver-v14-8-06824d9c15f4@analog.com>
References: <20260524-adf41513-iio-driver-v14-8-06824d9c15f4@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 11:12:54 +0000
Message-Id: <20260524111254.BE1231F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver fails to restore the hardware register state during pm_=
resume if the device was placed in a software power-down state, leading to =
power leaks and cache corruption.
--

commit 829389d24bcc81427dbc259466ce431d38418a05
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: adf41513: driver implementation

This commit introduces a new driver for the Analog Devices ADF41513 PLL
Frequency Synthesizer. It supports Integer-N and fractional-N synthesis
modes, high-resolution frequency calculations, IIO debugfs interface,
and power management.

> diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf=
41513.c
> new file mode 100644
> index 0000000000000..6f952ccc675e0
> --- /dev/null
> +++ b/drivers/iio/frequency/adf41513.c
[ ... ]
> +static int adf41513_pm_resume(struct device *dev)
> +{
> +	struct adf41513_state *st =3D dev_get_drvdata(dev);
> +
> +	guard(mutex)(&st->lock);
> +	if (st->powerdown)
> +		return 0; /* nothing to do */

[Severity: High]
Does returning early here when the device is in software power-down fail to
restore the hardware register state?

If the system loses power to the device during suspend, the hardware
registers will reset to their Power-On Reset defaults.

By returning immediately without writing any state to the hardware, won't
the hardware wake up in an unconfigured state rather than the requested
power-down state?

Additionally, the software cache regs_hw is not invalidated and still
holds the pre-suspend values. If a parameter is subsequently modified,
the sync function uses ADF41513_SYNC_DIFF and skips writing unmodified
registers since they falsely appear up-to-date in regs_hw.

Could this leave the hardware permanently in a corrupted mixed state of
reset defaults and newly written values?

> +
> +	return adf41513_resume(st);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-adf41513-i=
io-driver-v14-0-06824d9c15f4@analog.com?part=3D8
