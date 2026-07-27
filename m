Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDEC42901B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175168; cv=none; b=m57uaTkAQi1vEBYR9e55av5B/GG0s4EmTdGzgIGpR/Jsqb+ocmiDQSDdNSjAleuC5C6/qgtC/x4jiSLVVQ6bzZ73OV/cJflfYuLUDa6wnx5WDGDYtZyni5rxW4M56HXTDEmHjxtmF358wdFA2oHCGwGJMSFdmLUQEtYqRQ1mp1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175168; c=relaxed/simple;
	bh=gK2rfyRX6srNMXebLoaRVH6pnA+asOByAG5nhNxTCJo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=naRz2GpEpNvy8BG4yNS3nqOVnw/9u2UWLJsA5kBQjP8VdP7nmrGRF6j1rT8kTdMeqfFaAxsgxqFtT4cxGro2Ah3+do7fxxiWqzMhxwDvmVZF7wpXUEooAdGIEZzUAczA1kg/Y7C8sqLZJAp5B/RUDiq1yFH9NJX5i5GLqaDTjk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqbZzhN2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqbZzhN2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73F31F000E9;
	Mon, 27 Jul 2026 17:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175167;
	bh=3Q44sLmU/qZYG6s1h4UABIX0zJ8RTYk51duX0giw1TU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZqbZzhN2Q1T3I0VpGM7j/APcgO1D4/vMM4liuZf6Ujxs7bY8W4YCg5IXR3QZRJQ7B
	 IRHqywWn4pggESfH/eS+abfEF+MkmR5q2xDAJvwnOP6//LMQ0me7dTaOPzhK0aozFE
	 ShrV0IIY7aS9rAs4Uj9/0mbYbXJgYHMjRcWi0DLIiYIAQ9ElOn6YIxXxW/CyNpILK3
	 14d7fGiQFtbbL8OVSS77RW5/x3DNMDl5tCjjthsEUtS1J7C2p6DCxY/rnVEaM7BQej
	 DfdcBFA1UwhV/NThpjeqYdJQ8v2bJ72ZXQ67aJ6PTl7dgSdmdQA3/4mQuv4gKMvNQ2
	 MyFxYKQ2aUWPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V20 8/9] iio: imu: inv_icm42607: Add Temp Support in
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727164815.65190-9-macroalpha82@gmail.com>
References: <20260727164815.65190-1-macroalpha82@gmail.com>
 <20260727164815.65190-9-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 17:59:26 +0000
Message-Id: <20260727175926.C73F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing explicit header inclusion for <linux/bitfield.h>
--

--- Patch [8]: [PATCH V20 8/9] iio: imu: inv_icm42607: Add Temp Support in =
icm42607 ---
commit 46e567544f942f68bdfc6154721030643ea7abd5
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Temp Support in icm42607
   =20
Add functions for reading temperature sensor data.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_temp.c
> new file mode 100644
> index 0000000000000..8681ef2b49e21
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2026 InvenSense, Inc.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/iio/iio.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +
> +#include "inv_icm42607.h"
> +#include "inv_icm42607_temp.h"

[ ... ]

> +static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *te=
mp)
> +{
> +	struct inv_icm42607_sensor_conf conf =3D INV_ICM42607_SENSOR_CONF_INIT;

[ ... ]

> +	ret =3D regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
> +	if (ret)
> +		return ret;
> +
> +	accel_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
> +	gyro_mode =3D FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);

[Severity: Low]
Does this file need to explicitly include <linux/bitfield.h>?=20

This code uses FIELD_GET(), but relies on implicit header inclusion to find
its definition. Should the include be explicitly added at the top of the
file to prevent potential build failures if the implicit header inclusion
chain changes in the future?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727164815.6519=
0-1-macroalpha82@gmail.com?part=3D8
