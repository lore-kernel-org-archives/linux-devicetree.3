Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34307285C91
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662699; cv=none; b=ua01BIhVMAP6t5FrArjNyqlR4vXttomc1H/STLQefGSn9/AqGtffa+xRJXzD3bALuqzzFtM/POJ4zoMlvI2GGfL3SMFEURl2siBkzORMplM2PEbQXj+3rEZcumvU1LkkODdEuTNTFAlJD3Z8zvdCFOlhIkUow6Z2fkirMK/8EDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662699; c=relaxed/simple;
	bh=B+KfvGpaJ2WgiuCiSUDx4caUUOcVi/IDhDmKYvgsBJE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ChQO69ujjuljDWTE5spDhCChhMSmQO1agwyA/itKdBR2T2jrpauVNpyhdHqy4rnEI3VDHSbhSX2IBe3/uMAIkShOwoLZDjnnytlbEVbaTCqPIna95xfoYn482Uq5uegqaD1tpdttJTk4vD7WuYgOdUV13Q/+BUGNw1bbGJ/xj80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMrOIPTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMrOIPTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E9B1F000E9;
	Wed, 17 Jun 2026 02:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781662697;
	bh=KYQAE6/YMvulmoXYEPhePtebjS++Qkwg9Zs6I3FuktQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jMrOIPTOngnJTB5fTKmywyVjFbrk1oH/fJd2WLR6aLz1jgOcSRVwUC46Fj8agjjMh
	 2d0nL6MDiHhyDaOtZpMcE1l3INMjIPk4NEZ+tamPHzlT23MP35mnAynT+MKkVKOZbf
	 9gywqUheBdodkF8esEumOe7VZEOfq9zsG2t23GomeOIoWaR8L4R4pxuZacgyRyeK9O
	 EqY6ECVLwPNY4sCDmhGnmj0oorihDJ6eNcb953J84tniQMZGVU/6YR9I25+EcjiMub
	 sKiSuKZ+A0iI56WmSRUi0sCXTCt0lG+GBRoaXTc0a6kuxBhjphI6uhlMVOd0uqlENJ
	 aZ4cS0YG9h9fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] iio: adc: ltc2378: Enable triggered buffer data
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <22248e8ba646fbe8edfc87e2b9be527632d5b48c.1781661028.git.marcelo.schmitt@analog.com>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <22248e8ba646fbe8edfc87e2b9be527632d5b48c.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 02:18:17 +0000
Message-Id: <20260617021817.A5E9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Triggered buffer setup fallback is unreachable when SPI offload su=
pport is compiled in, causing driver probe to fail on systems without SPI o=
ffload hardware.
- [High] The triggered buffer pushes misaligned data on big-endian architec=
tures, yielding constant zero readings for 16-bit parts.
- [Low] The newly added file `ltc2378-triggered-buffer.c` uses `#include <l=
tc2378.h>` instead of `#include "ltc2378.h"`, causing a compile error.
--

commit 975300646e8809a19fe7c482edd698d128476317
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Enable triggered buffer data capture

Enable users to run triggered data captures with LTC2378 and similar ADCs.

> diff --git a/drivers/iio/adc/ltc2378-lib-core.c b/drivers/iio/adc/ltc2378=
-lib-core.c
> index 1160f4324d019..ec83e9f2ae81c 100644
> --- a/drivers/iio/adc/ltc2378-lib-core.c
> +++ b/drivers/iio/adc/ltc2378-lib-core.c
> @@ -18,7 +18,7 @@ int ltc2378_lib_buffer_setup(struct iio_dev *indio_dev,=
 struct ltc2378_state *st
> =20
>  	ret =3D __ltc2378_set_offload_ops(st);
>  	if (ret =3D=3D -EOPNOTSUPP)
> -		return 0; /* Let device setup complete without buffer support */
> +		goto trigger_buf_setup;
> =20
>  	if (!ret)
>  		ret =3D st->ops->buffer_setup(indio_dev, st);
> =20
>  	if (ret)
>  		return dev_err_probe(dev, ret, "error on SPI offload setup\n");

[Severity: High]
If CONFIG_LTC2378_LIB_OFFLOAD_BUFFER is enabled, does __ltc2378_set_offload=
_ops()
unconditionally return 0?

If so, the fallback condition if (ret =3D=3D -EOPNOTSUPP) is never met. The=
 driver
then calls st->ops->buffer_setup(), which maps to ltc2378_offload_buffer_se=
tup.

If the device lacks an SPI offload engine in the device tree,=20
devm_spi_offload_get() will return -ENODEV, failing the probe entirely.

Does this code prevent the driver from gracefully falling back to triggered
buffers on non-offload setups?

[ ... ]
> diff --git a/drivers/iio/adc/ltc2378-triggered-buffer.c b/drivers/iio/adc=
/ltc2378-triggered-buffer.c
> new file mode 100644
> index 0000000000000..d1d788fb5cb4f
> --- /dev/null
> +++ b/drivers/iio/adc/ltc2378-triggered-buffer.c
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Analog Devices, Inc.
> + * Author: Marcelo Schmitt <marcelo.schmitt@analog.com>
> + */
> +
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/triggered_buffer.h>
> +#include <linux/iio/trigger_consumer.h>
> +
> +#include <ltc2378.h>

[Severity: Low]
Does this include directive cause a compile error because it uses angle
brackets?

In C, #include <...> instructs the preprocessor to search standard system
directories. Because ltc2378.h resides in the local subsystem directory
drivers/iio/adc/ and the IIO Makefile does not add -I$(src), compilation
fails with a missing file error.

> +static irqreturn_t ltc2378_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ltc2378_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D ltc2378_convert_and_acquire(st);
> +	if (ret < 0)
> +		goto err_out;
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
> +				    pf->timestamp);

[Severity: High]
Does this code push misaligned data on big-endian architectures, resulting
in constant zero readings for 16-bit parts?

The IIO channel specifies storagebits =3D 32 and shift =3D 0, so consumers =
expect
a 32-bit native-endian value with data in the lowest 16 bits.

During ltc2378_trigger_handler(), spi_sync_transfer() with bits_per_word =
=3D 16
stores the 16-bit sample in CPU byte order at the start of the st->scan.data
union (sample_buf16).

On little-endian systems, this natively aligns with the lower 16 bits of the
32-bit container. However, on big-endian systems, the 16-bit sample occupies
the most significant bytes of the 32-bit word.

When the IIO core processes this as a 32-bit word, the data sits in the upp=
er
16 bits while the lower 16 bits remain zero. Since scan_type.shift is 0,
masking the lower 16 bits results in the consumer incorrectly receiving zero
for every sample.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781661028.gi=
t.marcelo.schmitt@analog.com?part=3D5
