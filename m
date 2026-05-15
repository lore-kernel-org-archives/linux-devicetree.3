Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCE337883C
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851418; cv=none; b=VR8eGNpvJX36Dxk4HTbLFLyzx5sJN3PyA3kGy5joTOj8NxItYESVSQYsdn9o+VsrnNl4xkfHnPPLRoaQcaB0Sb0L1ubJHykdwiCZxn3llTmJy8qP9t48a+Piu97s5Anmp++afM+8UOsDJ+FpNqegeoyDK8r73zDxQf7/bD7f9c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851418; c=relaxed/simple;
	bh=2elZsZ+yUEb/ZfIzK+yY/qD7Nxeyn3lO6JnK6NHFNvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvMfqaN+eFAUV6d1Rw8rpe3O0bR9NRrrAtoSjhXBHlRCn2UvoLR2EPb8CTJW0lRFipqaaZj9tau2QzEgXORPha2usndztGITBCw3jW0+vXRZAPy2Qf4ML2cmBSqY3SUozpCXAgHXkhh92AUSUxkQDs/DZGmkiheITTnISgOU0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5h97tV1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5h97tV1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8533FC2BCB7;
	Fri, 15 May 2026 13:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778851418;
	bh=2elZsZ+yUEb/ZfIzK+yY/qD7Nxeyn3lO6JnK6NHFNvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=P5h97tV1vfLvBo6dEQSD5z0UONBMHd1U18CyBY385a7CbAHIfDbUm2FBgs0auO63S
	 ao/mx0MrBuXXqDwODNQWgAzb4xDW9tFqPgkANchB5Mff4R1GKj1P3Dya3jvLuGuflm
	 Q9vtO5+47eYvQgNWIpxLC6DZpQcnzmxNVrL7DWRKizAVMyAOyEEsvT29r7tuCM+zKw
	 XcvsNxoh5QjgCfEVZamHeYK7r+EIWNHUa+3ZkNs7aGscey04P1hd9STDSJiKoD2YtO
	 ECGoMYY5XQdPELEZFvt50i/QzntPYe9WXGEHlCf1Xr0XaVFC/lSYkOky7NwhwbDOFm
	 X+VVr0IQ3wyHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7 03/11] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515130018.237378-4-macroalpha82@gmail.com>
References: <20260515130018.237378-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 13:23:36 +0000
Message-Id: <20260515132337.8533FC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Overriding `fwnode_irq_get_byname` return value breaks probe defer=
ral.
- [Medium] Permissive WHOAMI check allows successful probe of non-existent =
devices on floating SPI busses.
--

commit 4cf92e828a7378ea0e258610a5cbe3601aaf01a0
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

This commit adds the core component of the new inv_icm42607 driver. It
includes setup functions and the full register definition in the header fil=
e.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..9784709319b92
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
> +		dev_warn(dev, "invalid whoami %#02x expected %#02x (%s)\n",
> +			 val, st->hw->whoami, st->hw->name);

Should the WHOAMI check fail the probe if the device returns completely
invalid values like 0xff or 0x00?

If the device is not present and the SPI MISO line is floating high,
regmap_read() will return 0xff for the WHOAMI register. Because this check
only issues a warning, the driver continues the probe sequence.

> +
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
> +	if (ret)
> +		return ret;
> +
> +	fsleep(1000);
> +
> +	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> +				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> +				       INV_ICM42607_RESET_TIME_MS * 100,
> +				       INV_ICM42607_RESET_TIME_MS * 1000);

Later, when polling for the reset completion here, the condition
(val & INV_ICM42607_INT_STATUS_RESET_DONE) checks for BIT(4). A floating bus
returning 0xff will immediately evaluate to true, allowing the probe to
succeed. This could result in a phantom IIO device being created that only
returns garbage data.

[ ... ]

> +int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm4=
2607_hw *hw,
> +			    inv_icm42607_bus_setup bus_setup)
> +{
> +	struct device *dev =3D regmap_get_device(regmap);
> +	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> +	struct inv_icm42607_state *st;
> +	int irq;
> +	int ret;
> +
> +	irq =3D fwnode_irq_get_byname(fwnode, "INT1");
> +	if (!(irq > 0))
> +		return dev_err_probe(dev, -EINVAL, "Unable to get INT1 interrupt\n");

Does overriding the error code from fwnode_irq_get_byname() break probe
deferral?

If the interrupt controller is not yet ready, fwnode_irq_get_byname() will
return -EPROBE_DEFER. By unconditionally squashing the return value into
-EINVAL when calling dev_err_probe(), the kernel will permanently fail to
probe the device instead of deferring it. Could we propagate the actual irq
error code instead?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515130018.2373=
78-1-macroalpha82@gmail.com?part=3D3
