Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B53FE35E
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274824; cv=none; b=Z0/1IyVYHYp83xB2W/Nc9BC2P5CnxKn2ZgaVrU80BOwlSLWJTE3OzzqUQmDTretx3+sLwxAAjG6cCuPj0iKnk1zci11nphtrtppoZZbQwd4Whg8QotCfRusEewQPMqQQVcgO9Co1NNwljudQatnZd41yZn4qMq092thbS+8R9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274824; c=relaxed/simple;
	bh=Voynoi7FK7wZuVEljMB+c1IhZBAOetk4/fDf42KT2dU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pIZ6w7i/7vu/KogMhPAfVRSoJiHd6E91+tq9daLK1nv0LXu01zyphri+STDRGTLbkwC1z5EkU3DEaM97Hkfjw9Ke4HqSjXfIlhfAqf3zqHbVBemZgcAyv62kFHhvTMQCqDEt6dKOLg9tdo+GcNZqz1J+gIu7pZO9LckFzc8mxLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g07Uxoeg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g07Uxoeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CB8C2BCB0;
	Fri,  8 May 2026 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778274824;
	bh=Voynoi7FK7wZuVEljMB+c1IhZBAOetk4/fDf42KT2dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=g07UxoegQrNfj0CHa3N+Q8hsAo8LSjFO81URr5oFIWPirxn+xXFVxehDU5cMXUIq2
	 iD0RYMs2cBX5fumIWBCYAgNAhKc6f0/4Wz2FrjJg8RqqwqfQteppXCmC/Cbf8x2YwV
	 +nYZ6zn7/1dfqyQgwoSQutvl4Typ89y1XlhYbOUATxF6VXCH/crC8dCCRyQiBQSZMO
	 zJAPOVxxftgR1eGzwVE/B0FR9SFGyiGk6ayAregFxpgAUZcoWK+B5vpPlZ5bKUXg2r
	 H5cCZAEoXCBy623GBPvGoKHH5NvI6EMP4zy0uhHlh7W8YV+6vFj23I7pprf2uMXl4A
	 ULNrupBmXZEhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] drm/bridge: Add Lontium LT7911EXC eDP to MIPI
 DSI bridge
Reply-To: sashiko@lists.linux.dev
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508134702.4713-3-syyang@lontium.com>
References: <20260508134702.4713-3-syyang@lontium.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:13:43 +0000
Message-Id: <20260508211343.C6CB8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Regulators enabled in `probe()` are never disabled on the success =
path, causing a permanent power leak.
- [High] Reset GPIO is driven high after cutting off power, violating power=
 sequencing and risking hardware backpowering.
- [High] Synchronous `request_firmware` in `probe` can cause permanent prob=
e failure if the driver is built-in.
- [Medium] Missing `depends on I2C` and `select REGMAP_I2C` in Kconfig.
- [Medium] The return value of `devm_drm_bridge_add()` is ignored in `probe=
()`.
- [Low] Missing header includes for core kernel APIs.
--

commit d9cebea8e10096b0200ef8f220724550dd554963
Author: Sunyun Yang <syyang@lontium.com>
drm/bridge: Add Lontium LT7911EXC eDP to MIPI DSI bridge

This commit adds support for the Lontium LT7911EXC eDP to MIPI DSI
bridge. It implements I2C-based setup, display configuration, and
provides a firmware update mechanism.

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index c3209b0f46786..fe45a9052aa0d 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -132,6 +132,19 @@ config DRM_ITE_IT6505
>  	help
>  	  ITE IT6505 DisplayPort bridge chip driver.
> =20
> +config DRM_LONTIUM_LT7911EXC
> +	tristate "Lontium eDP/MIPI DSI bridge"
> +	depends on OF

Should this config also depend on I2C and select REGMAP_I2C?

The driver explicitly registers an I2C driver and utilizes
devm_regmap_init_i2c(). Building without I2C enabled might cause
compilation or linker errors.

[ ... ]
> diff --git a/drivers/gpu/drm/bridge/lontium-lt7911exc.c b/drivers/gpu/drm=
/bridge/lontium-lt7911exc.c
> new file mode 100644
> index 0000000000000..d50fc979ebd4b
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt7911exc.c
> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Lontium Semiconductor, Inc.
> + */
> +
> +#include <linux/crc32.h>
> +#include <linux/firmware.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

This isn't a bug, but it looks like some core headers are missing.

The driver uses kzalloc() and kfree(), msleep() and usleep_range(), as well
as regulator_bulk_enable(). Could linux/slab.h, linux/delay.h, and
linux/regulator/consumer.h be included directly to avoid relying on
transitive includes?

[ ... ]
> +static int lt7911exc_firmware_upgrade(struct lt7911exc *lt7911exc)
> +{
> +	struct device *dev =3D lt7911exc->dev;
> +	const struct firmware *fw;
> +	u8 *buffer;
> +	size_t total_size =3D FW_SIZE - 4;
> +	u32 crc32;
> +	int ret;
> +
> +	/*1. load firmware*/
> +	ret =3D request_firmware(&fw, FW_FILE, dev);

Can this synchronous request_firmware() call cause a permanent probe failure
if the driver is built-in?

When built into the kernel, probe executes before the root filesystem is
mounted, which would cause this to fail with -ENOENT. Because the error
is propagated without returning -EPROBE_DEFER, the subsystem might not
retry the probe later.

[ ... ]
> +static void lt7911exc_atomic_post_disable(struct drm_bridge *bridge, str=
uct drm_atomic_state *state)
> +{
> +	struct lt7911exc *lt7911exc =3D bridge_to_lt7911exc(bridge);
> +	int ret;
> +
> +	ret =3D regulator_bulk_disable(ARRAY_SIZE(lt7911exc->supplies), lt7911e=
xc->supplies);
> +	if (ret)
> +		return;
> +
> +	gpiod_set_value_cansleep(lt7911exc->reset_gpio, 1);
> +}

Does driving the reset GPIO high after cutting off the regulator power
violate power sequencing?

Driving a logic high signal into an unpowered IC can sometimes backpower
the device through its internal ESD protection diodes.

[ ... ]
> +static int lt7911exc_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct lt7911exc *lt7911exc;
> +	bool fw_updated =3D false;
> +	int ret;
[ ... ]
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(lt7911exc->supplies), lt7911ex=
c->supplies);
> +	if (ret)
> +		return ret;
> +
> +	lt7911exc_reset(lt7911exc);
> +	lt7911exc_lock(lt7911exc);
[ ... ]
> +	lt7911exc_unlock(lt7911exc);
> +
> +	lt7911exc->bridge.of_node =3D dev->of_node;
> +	devm_drm_bridge_add(dev, &lt7911exc->bridge);
> +
> +	return 0;

Is there a resource leak for the regulators here?

The regulator_bulk_enable() call at the beginning of probe increments the
use count to power the device, but it appears the success path returns 0
without calling regulator_bulk_disable().

If lt7911exc_atomic_post_disable() later decrements the count, it seems
the count might still remain elevated by 1, leaving the hardware permanently
powered on.

Additionally, should the return value of devm_drm_bridge_add() be checked?

If it fails, the bridge is internally removed, but returning 0 here would
lead the driver to successfully bind to the I2C device without exposing
a functional DRM bridge.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508134702.4713=
-1-syyang@lontium.com?part=3D2
