Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBEE30648C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778535911; cv=none; b=Qa2ZkJGZEZXNaumGKeFR9CCXMzHpju4XAV4/b5JAa1eXn4wJz3T8AuZiE7DSoSrSCaOgKQi9qy3daG5ha+dq3uXokWH2obWqzTboJLvc5pasQSYHs7mPCWyXfFrblcRTg4ksJdMomDyrz0Vs/0HWqbceVjuLgsqcfkMBse6vRuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778535911; c=relaxed/simple;
	bh=QA4ysdj3DkQT2BYIUEcdyt7IIx0R4iawIHrXKv02Sf8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FD9CDHRJ/hvsVNlgJ1QwXdbyF8pR/La2uhEB8n6FG9jkZqmNqSL2bXArxUMyHhoO/7RJABwccCYJ785s6quoQsI7v2FDf8CsnTqE4Er4Bmi2EUnokwheGpFzOX5OiE13hTEonnB54a/TplFRbNHMemifx5eGQ/K9bxj7P37VKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKez9+Cq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKez9+Cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECB0C2BCB0;
	Mon, 11 May 2026 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778535910;
	bh=QA4ysdj3DkQT2BYIUEcdyt7IIx0R4iawIHrXKv02Sf8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VKez9+CqA2t3V49Rx1/lKTcPuJt7g1OmBRq7LYe/e3DxJyDCKsvrY+lu+fmniSoLA
	 bFX5kSrs55i0m41pxxUKCZ/6yl4V1ssgGfakbXd06+HpxkI8fwgq4Hm6FqLzaajUG3
	 zZ2WhOWfccj7HlKPSJfb8klT3V4quuSkb9GOC7fd9aKR82FtWKCVodty/yB2crjhsg
	 GSseCyMFg19yNKOoCiMY63LewXaU0tw4HX02ra0vZAl1C5KrzTYq2PM7Vb/GT9yJhH
	 G9SFWsM9qtT2S79N5OSa7zuEet7bpcBt4IhifsRbQskszJRoWqRNXIrvkyBIj2ZUEF
	 Ip/f6+2AFdSLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] backlight: sy7758: add Silergy SY7758 backlight
 driver
Reply-To: sashiko@lists.linux.dev
To: "Alexandre Hamamdjian via B4 Relay" <devnull+azkali.limited.gmail.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-sy7758-v1-2-999a33081304@gmail.com>
References: <20260511-sy7758-v1-2-999a33081304@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:45:10 +0000
Message-Id: <20260511214510.8ECB0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Premature device registration exposes initialization race
- [Medium] Redundant global mutex causes cross-device contention
- [Medium] Hardcoded sysfs device name prevents multiple device instances
- [Medium] Unhandled I2C errors during initialization allow phantom devices
- [Medium] Visual glitch due to hardcoded brightness values upon unblanking
- [Medium] Improper brightness bitmasking limits resolution and breaks line=
arity
- [Medium] Lifecycle race between sysfs writes and device removal
--

commit 0d56a1ebe95bbf1d06c227b2612ebb2fdce6d26a
Author: Alexandre Hamamdjian <azkali.limited@gmail.com>

backlight: sy7758: add Silergy SY7758 backlight driver
   =20
Add a driver for the Silergy SY7758 I2C-controlled multi-channel LED
backlight controller. The chip drives the edge-lit LED strings of LCD
panels in handheld and embedded devices, and is for example present on
the Ayaneo Pocket DS handheld where it drives the panel backlight.

> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/s=
y7758.c
> new file mode 100644
> index 0000000000000..6a318bd62030a
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c
[ ... ]
> +static DEFINE_MUTEX(sy7758_update_backlight_mutex);

Could this global mutex cause cross-device contention? Since the backlight
core already serializes calls to update_status() for each device using
bd->update_lock, is sy7758_update_backlight_mutex necessary?

[ ... ]
> +static int sy7758_backlight_update_status(struct backlight_device *backl=
ight_dev)
> +{
> +	struct sy7758 *sydev =3D bl_get_data(backlight_dev);
> +	unsigned int brightness =3D backlight_get_brightness(backlight_dev);
> +
> +	mutex_lock(&sy7758_update_backlight_mutex);
> +
> +	if (!sydev->led_on && brightness > 0) {
> +		sy7758_init(sydev);
> +		sydev->led_on =3D true;
> +	} else if (brightness =3D=3D 0) {
> +		sydev->led_on =3D false;
> +	}
> +
> +	sy7758_write(sydev, BL_BRT_L, brightness & 0xf0);

Does dropping the lower 4 bits here limit the resolution and break linearit=
y?

The max_brightness is set to 4080, but this masking maps blocks of 16
consecutive brightness values to the exact same hardware output. If the
hardware uses an 8-bit resolution shifted by 4 bits, would it be better to
expose max_brightness as 255 and shift the value internally?

> +
> +	sy7758_write(sydev, BL_BRT_H, (brightness >> 8) & 0xf);
> +
> +	mutex_unlock(&sy7758_update_backlight_mutex);
> +	return 0;
> +}
[ ... ]
> +static void sy7758_init(struct sy7758 *sydev)
> +{
> +	sy7758_write(sydev, 0x01, 0x85);
> +	sy7758_write(sydev, 0x10, 0x00);
> +	sy7758_write(sydev, 0x11, 0x00);

Should we handle I2C errors during initialization?

Since sy7758_write() returns an error code but sy7758_init() ignores it, the
probe function will succeed even if the hardware is disconnected or
unresponsive, potentially creating a non-functional phantom device.

[ ... ]
> +	usleep_range(10000, 11000);
> +
> +	sy7758_write(sydev, 0x10, 0x40);
> +	sy7758_write(sydev, 0x11, 0x01);

Does this hardcoded value cause a brief visual glitch?

When the display is unblanked, update_status() calls sy7758_init(), which
unconditionally writes 0x40 and 0x01 (brightness 320) before update_status()
overwrites it with the target brightness.

[ ... ]
> +static int sy7758_probe(struct i2c_client *client)
> +{
[ ... ]
> +	backlight_dev =3D devm_backlight_device_register(&client->dev, "sy7758-=
backlight",

Is it possible for this hardcoded sysfs device name to prevent multiple dev=
ice
instances from probing? If multiple controllers are present on the same
system, the second instance might fail to probe due to a sysfs naming
collision. Using dev_name(&client->dev) might avoid this.

> +					&client->dev, sydev, &sy7758_backlight_ops, &props);
> +	if (IS_ERR(backlight_dev))
> +		return dev_err_probe(&client->dev, PTR_ERR(backlight_dev),
> +				"failed to register backlight device\n");
> +
> +	sy7758_init(sydev);

Does registering the device before calling sy7758_init() expose an
initialization race?

If a sysfs write occurs right after registration, the backlight core could
invoke update_status(), which calls sy7758_init() concurrently with the pro=
be
function continuing to call sy7758_init() below.

> +
> +	i2c_set_clientdata(client, backlight_dev);
> +	backlight_update_status(backlight_dev);
> +
> +	return 0;
> +}
> +
> +static void sy7758_remove(struct i2c_client *client)
> +{
> +	struct backlight_device *backlight_dev =3D i2c_get_clientdata(client);
> +
> +	backlight_dev->props.brightness =3D 0;
> +	backlight_update_status(backlight_dev);
> +}

Could there be a lifecycle race between sysfs writes and device removal her=
e?

Because the driver uses devm_backlight_device_register(), the sysfs interfa=
ce
remains active until the devres cleanup phase executes after remove() retur=
ns.
A concurrent userspace write to the brightness sysfs file could turn the
backlight back on just before unregistration, leaving the hardware stranded=
 in
an ON state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-sy7758-v1-=
0-999a33081304@gmail.com?part=3D2
