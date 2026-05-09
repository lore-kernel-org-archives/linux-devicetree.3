Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC5039DBE4
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778355708; cv=none; b=JsntnyLwykF030lOJc1zYg4U/CRW0S2lcx0eY8iiyQLkHM8xqXsZyj6GTcNd8HRgSZnfFEcD0UocSi72yQ3kpCMYmfBhyL5xSaa20kfhPKnmmF004LhEWlFRVWwNdrLFmn1dGD4vBFrOtIdkwgZ83n1TyeNX6QhyBKSsNHrkt5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778355708; c=relaxed/simple;
	bh=3VJ4xdMEKtzx+yrVv52AeVk6+9Kk5I6v3j22iWy1eb8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N1MMWIqI3P2AYGrulDTIrHIlF1imAWtRLSGuTk24jNW4M0UJgtVc6wpjKxxCuvM3LHzLEiumGZN7CcUrQtUhTS2/RSeTFGE0k3jeqNvZBjW/5mve+yJgewMN3TtmjUw51CpAnGYCM5nTl2UEAwv7+yP2TDrv/RhS9LwjCEfPnWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c914jLRS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c914jLRS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C360C2BCB2;
	Sat,  9 May 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778355707;
	bh=3VJ4xdMEKtzx+yrVv52AeVk6+9Kk5I6v3j22iWy1eb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=c914jLRSgJFSLz/PEs4kdJqlr86/+mXkUL4mDvFNd4DI+uzLVVARXZKaZO3vARpTq
	 yczvnKEpbCasRfB5C5gCa/t7Igvq2oqrzFOfwlRI49R4Z+93CTq/vNdybhfx5OkVkI
	 UKqoROEJ6GZ27A6I1kPPOf84ZiEafxJVLBabZ1uEvwX8pJRDtGb527V+zJ/dHaNZF/
	 00qUjmeWOoDPHQPbixfaKq4i0i7yMNrRjfbJQHcGhQNUGnMNQdDNX7zKJmqUCpolBK
	 N8I+X0Qkuo9h1EHvpmWsnAAarFCzJDwVgX51y58y+CkrXOQDnJem446DrRVkmwyPwh
	 5An3N5n6MP5Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V5 03/11] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509191907.24734-4-macroalpha82@gmail.com>
References: <20260509191907.24734-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 19:41:46 +0000
Message-Id: <20260509194147.6C360C2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The return value of `dev_warn_probe()` is discarded when a WHOAM=
I mismatch occurs.
--

commit 6349b0a7b12b07b3aed999d0609cbcf30437d378
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

This commit adds the core component of a new inv_icm42607 driver, including
setup functions and full register definitions in the header file.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..e84e84416dab5
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup bus_setup)
> +{
> +	const struct device *dev =3D regmap_get_device(st->map);
> +	unsigned int val;
> +	int ret;
> +
> +	ret =3D regmap_read(st->map, INV_ICM42607_REG_WHOAMI, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val !=3D st->hw->whoami)
> +		dev_warn_probe(dev, -ENODEV,
> +			       "invalid whoami %#02x expected %#02x (%s)\n",
> +			       val, st->hw->whoami, st->hw->name);
> +
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);

Was the return keyword accidentally omitted here?

The return value of dev_warn_probe() is silently discarded. If the chip's
WHOAMI register does not match the expected value, the driver will proceed
to perform a soft reset and configure what is potentially an unsupported or
unresponsive device.

If the intent was to abort the probe on a mismatch, it should probably retu=
rn
dev_warn_probe(...). If the intent was merely to log a non-fatal warning and
continue, would a standard dev_warn() be more appropriate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509191907.2473=
4-1-macroalpha82@gmail.com?part=3D3
