Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDD5368D55
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 21:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787001854; cv=none; b=Pz2rzLnT0j+etVJZqeeot0MoLbjTGzjKEZw60UvVb906ZA6fMhHJsrrk0SNZPlNTJQQg2blw1q1sufssgIPHEbhoDOEmGEQOFsJr7eVVeMTbM2EfIMqUlITTvOhVoLA9ymjXJ5VEUSLH0TWyei7ovHlsfn9UCr5JCTFdJu91biU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787001854; c=relaxed/simple;
	bh=0f7RYQGh2Ej7+nC+fFaz010WZLVfPN8Qk+Gt22qHNLY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mlk1Vd78PeAjfsH4+aQF2LaQRvsRKwKw6J1atUx6dlGr8pGKIMSj7yYFuQcqj7oQ7tHrvKbxG/7xe/mY8nabCrfFHVWD0PA7iMLrueA0Y7MHaIeCOX4BITems/ldxalukcKUjhdZXhDP7RD84qqAZakzwkTYAxZxJ7QSXG3ELv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO5e4yzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO5e4yzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473E01F000E9;
	Mon, 17 Aug 2026 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001852;
	bh=J5r2xFwf1BrGuJ3bePoE4bsSAAXIKP3aslC2HTj7/xY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KO5e4yzR0je2VP/+RyzufNf0VeP07WzKJIooJKILsfdd4E3yej+eFebs8CWc3gFzY
	 TSd5H05Xi0q7A2x6B9/OxD0azcqJwyb3mVeKRp/JlmTuMnTkw+jO+PpuaDhziNoNTO
	 q2Pt5xMa8ubhu7sjUZjGxogjDJdJ//y7JjTPRn4lT9frTuvas6B/KL7aK3ZinQyszh
	 BXb1amahboTrD2oc8+JdCuJkuC59hPc2XTwFoSsrAjDYy/kWeKXVkbFV5I6wP56T+a
	 8yH5DsQeM3shnh0qoM7nEfJQo1XeluI4GIOKyBggTgcMIDyn+LJBp4EDLeHWzKPR90
	 aGbNtcn7fL2bQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] iio: dac: ad5504: Align headers with IWYU
 principle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taha Ed-Dafili" <0rayn.dev@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260817211118.21833-3-0rayn.dev@gmail.com>
References: <20260817211118.21833-1-0rayn.dev@gmail.com>
 <20260817211118.21833-3-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 21:24:11 +0000
Message-Id: <20260817212412.473E01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] API Contract Violation (IWYU) and commit message mismatch: improper=
 removal of `<linux/device.h>`.

Pre-existing issues:
- [High] Potential NULL pointer dereference of `pdata` during probe when th=
e `vcc` regulator is missing.
- [High] Missing locking leads to race conditions and SPI DMA buffer corrup=
tion across concurrent sysfs accesses.
--

--- Patch [2]: [PATCH v4 2/6] iio: dac: ad5504: Align headers with IWYU pri=
nciple ---
commit 90816be5685af9f86bca164af4343c7bef759b65
Author: Taha Ed-Dafili <0rayn.dev@gmail.com>

iio: dac: ad5504: Align headers with IWYU principle

This commit updates header inclusions in the ad5504 driver to align with
the Include What You Use (IWYU) principle. It removes several unused
headers, replaces others with more specific ones, and sorts them
alphabetically.

>     - Add <linux/array_size.h> for ARRAY_SIZE().
>     - Add <linux/kstrtox.h> for string to integer conversions.
>     - Replaced <linux/device.h> with <linux/dev_printk.h>

[Severity: Low]
This isn't a bug, but this description might be inaccurate since
<linux/device.h> is still required for dev_get_platdata().

>=20
>     Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
>=20
> ---
>  drivers/iio/dac/ad5504.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
> index 5e586185d8579..1793af0781dc7 100644
> --- a/drivers/iio/dac/ad5504.c
> +++ b/drivers/iio/dac/ad5504.c
> @@ -5,22 +5,26 @@
>   * Copyright 2011 Analog Devices Inc.
>   */
> =20
> -#include <linux/bitops.h>
> -#include <linux/device.h>

[Severity: Low]
Does this removal violate the IWYU principle? The file directly calls
dev_get_platdata() and uses struct device in ad5504_probe(), which both
rely on <linux/device.h> being included.

[ ... ]

[Severity: High]
This is a pre-existing issue, but could this oops if the device is
instantiated via DeviceTree without a "vcc" regulator?

If dev_get_platdata() returns NULL and the regulator is missing,
devm_regulator_get_enable_read_voltage() returns -ENODEV, leading to:

drivers/iio/dac/ad5504.c:ad5504_probe() {
...
	if (ret =3D=3D -ENODEV) {
		if (pdata->vref_mv)
			st->vref_mv =3D pdata->vref_mv;
...
}

Should we verify pdata is not NULL before dereferencing it here?

[Severity: High]
This is a pre-existing issue, but could concurrent sysfs accesses corrupt
the SPI DMA buffer or the powerdown mask?

If two threads concurrently access sysfs endpoints (like
out_voltageX_powerdown or in_voltageX_raw), they can enter
ad5504_spi_write() without any locking. Since st->data is shared among
all SPI transactions to satisfy DMA alignment, could concurrent writes
overwrite st->data and corrupt the SPI payload?

drivers/iio/dac/ad5504.c:ad5504_spi_write() {
...
	st->data[0] =3D cpu_to_be16(AD5504_CMD_WRITE | AD5504_ADDR(addr) |
			      (val & AD5504_RES_MASK));

	return spi_write(st->spi, &st->data[0], 2);
}

Similarly, st->pwr_down_mask appears to be subject to an unprotected
read-modify-write:

drivers/iio/dac/ad5504.c:ad5504_write_dac_powerdown() {
...
	if (pwr_down)
		st->pwr_down_mask &=3D ~(1 << chan->channel);
	else
		st->pwr_down_mask |=3D (1 << chan->channel);
...
}

Does this state need a mutex to prevent race conditions during concurrent
accesses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817211118.2183=
3-1-0rayn.dev@gmail.com?part=3D2
