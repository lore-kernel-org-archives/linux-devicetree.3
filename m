Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74933439F81
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735628; cv=none; b=O/Zo2xtpxoiKAJnfdOCi5sM+bnNBsRuLeSmbeAzLZ81Uz2xbVEtJMsc7YKo+Qx8g2KRn/hVj3DPT/8rMRB7gHNNX9k/KJmQnh694KJkZa8Mg6V2NV6Jjj++iiI3Qz/CYmpApWQgkOctqA3fyLKxB9Bh5Chyta3DRiLVAYobJTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735628; c=relaxed/simple;
	bh=Xp69F8bFwPiQjRFp2jkHubXad3ALPxJLdxA9+zOBaSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S60X+jMhdjrQpSbeQuB5ZIlIPvNporYDeGa+CvHivRvHODWtaHHadam0dnoZ7/tdtRArW9Mh0n9lk5fIwgCDU9b4KX/GWUNrAGJMYKYRqI9Rc+vai/uUwIWOT/A1qiCnf9woO/7aGf1pA1zOs2BSZ4H9/XCrs8iYqlg1PM/nIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnPJhwLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnPJhwLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6601F000E9;
	Wed, 22 Jul 2026 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735627;
	bh=gukbmT8kmWwNICBEucrmpAK/p0wuETg0Z0MWXd0m+2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnPJhwLGc6GzTVw1KWjAkMYLf0YQRhtzmF4u4P8KyVLNZzmph6QhobUBXqNJp/BR7
	 h6aRiglEYW6KKpr7s9JdiIwF5E7kSMNHCVY7c5Qb2CFpOprYRXJRYjBQcgRwOL2RyO
	 YyjpSQEYfId2gnImfuCm9ABfvCXpHRTC7AgO2tzYX+LViZYrKPNuBmiyV4eU5LDWD3
	 3u7X0qKlhiAJ9fN+cRH2iLH5ZVIICX3+rter2XgM5oq7KQz8E1Dp9S5d2RCRK8fCHk
	 vvS+IBPBWVRqE9YEq7ufmdKz3sOIhHn/rcdgpRmP03eKJB3dl3/U/xmiyADFWzZkQZ
	 bFzuLBPqb+2Gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V19 3/9] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722153942.144387-4-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
 <20260722153942.144387-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 15:53:46 +0000
Message-Id: <20260722155346.BE6601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The regmap_read_poll_timeout macro will abort immediately if the=
 I2C read fails during reset, rendering the 10ms timeout ineffective.
--

--- Patch [3]: [PATCH V19 3/9] iio: imu: inv_icm42607: Add inv_icm42607 Cor=
e Driver ---
commit 126a2bd0ca185e39e3153f40088acc8d7f3a3ac0
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

This commit adds the core component and I2C driver for the InvenSense
ICM-42607 motion tracking device. It provides the setup functions, register
definitions, and basic probing infrastructure.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..6ec1d730017e2
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup inv_icm42607_bus_setup)
> +{

[ ... ]

> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(1 * USEC_PER_MSEC);
> +
> +	/*
> +	 * No polling interval specified in datasheet, so use reset time as
> +	 * polling interval and 10x reset time as timeout period.
> +	 */
> +	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> +				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> +				       1 * USEC_PER_MSEC, 10 * USEC_PER_MSEC);

[Severity: Medium]
Can this timeout be bypassed entirely if the I2C bus NACKs right after a
soft reset?

Since regmap_read_poll_timeout() terminates its polling loop immediately
if the underlying read returns an error, a single NACK during the reset
window will cause the macro to return an error (like -ENXIO) right away.

If the hardware requires slightly more than 1ms to stabilize, would this
cause the probe to fail instantly instead of utilizing the 10ms polling
window to retry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722153942.1443=
87-1-macroalpha82@gmail.com?part=3D3
