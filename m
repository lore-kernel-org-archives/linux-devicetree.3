Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF5E18C02E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786177658; cv=none; b=J19lxsQk2tmiQsLfwpBN5Kwi7/W1knMXoCrqkdqEtt6l0pVG2NZMQxmJFqY+b3emKny7/Bb1yEu6dT1hfJaPFTts9JAltP8QczImemAaSXT+1rtIiuiNpjfWDetW0j9sw1sF8jikdlpwY9Zch9yKjatv0uOwNOTZlZObx057eSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786177658; c=relaxed/simple;
	bh=+ITlIJOSFWjz4ptgLu2ELjakECyImtg4vCX5RmKdQjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tpl1dxHeP5ZVGbkrggHeW5LZM8jqJe3+V2dDqZkrZnE26n5grrOku8sjbyp0Q0zej8VYGD46hKbNxjxkJjHr4ibduJd6kCgYYA7D+YPuMBAMa5XlUmn1FH0A+9WnZY/g2RMCSXk77yL5sPDF/dv1aI9CWHh0vqV+FnfvDmCYGW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UB05PEDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UB05PEDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127D91F000E9;
	Sat,  8 Aug 2026 08:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786177656;
	bh=bfQYD07G80iMm47omQSXfNz888c470ESmjnZlKV0sDk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UB05PEDzOUHEH0Ci21H9hG5VW6wg5O4vyydpk8hzthfTzmm4Dit4IpTswVUvre+B8
	 A097hkF8LKVvHwmxOtDzHtZ4MJWYrBzmNA0AiJsi25xTlTMzT9FDmOvT11Whp6PXyK
	 SKIZ8V5GvTpTnG1QO5O8joejJzf8HOAYQTadbgRCXTXv+CHp/Hg/YeHjY5/xFj51mz
	 Wp3PTSAsDEFOfBo6ESxq0FO1JnAIl6SiMWOrXGn0bWIKT4NWNVwj+qRp1itxs1VT6h
	 BxfyHHy3/U+xz+qtaSx6aDSG/z/sx4v6xV5fw0A/uBvNlqpIYO3y2gfKVktiPoBN3u
	 Y+ADhvYbKsGfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI
 DSI to HDMI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: mohit.dsor@oss.qualcomm.com
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260808-lt9611c-v7-v10-2-ee90a136d82a@oss.qualcomm.com>
References: <20260808-lt9611c-v7-v10-0-ee90a136d82a@oss.qualcomm.com>
 <20260808-lt9611c-v7-v10-2-ee90a136d82a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 08:27:35 +0000
Message-Id: <20260808082736.127D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Synchronous request_firmware() in probe() blocks kernel boot proce=
ss.
- [Medium] Unintended interrupt clearing and potential permanent disablemen=
t due to flawed bitwise logic in IRQ handler.
--

--- Patch [2]: [PATCH v10 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI=
 DSI to HDMI driver ---
commit 22bb13157654c71d5954095ae3d49cee54e072dd
Author: Sunyun Yang <syyang@lontium.com>
Subject: drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver

This commit adds the driver for the Lontium LT9611C, LT9611EX, and
LT9611UXD MIPI DSI to HDMI bridge chips. It converts single or dual MIPI
DSI and I2S signals to HDMI 1.4 or 2.0 output.

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/b=
ridge/lontium-lt9611c.c
> index 0000000000000..e6887f2c89a6c 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c

[ ... ]

> +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> +{
> +	struct device *dev =3D lt9611c->dev;
> +	const struct firmware *fw;
> +	u8 *buffer;
> +	size_t total_size =3D FW_SIZE - 1;
> +	u8 fw_crc;
> +	int ret;
> +
> +	/* load firmware =E2=80=94 must happen outside the mcu_lock */
> +	ret =3D request_firmware(&fw, FW_FILE, dev);

[Severity: High]
Does this synchronous firmware load risk stalling the kernel boot process?

If the chip's firmware version reads as 0 during lt9611c_probe(), it
directly invokes lt9611c_firmware_upgrade(), triggering this synchronous
request_firmware() call.

If the firmware is not built-in or the root filesystem is not mounted
yet, this could block the I2C bus probe queue and delay boot for up to
60 seconds (the default loader timeout) or even cause a deadlock.

Could request_firmware_nowait() be used instead when triggered from
the probe path, or could the firmware update be deferred to a worker?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to load '%s'\n", FW_FILE);

[ ... ]

> +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> +{
> +	struct lt9611c *lt9611c =3D dev_id;
> +	struct device *dev =3D lt9611c->dev;
> +	int ret;
> +	unsigned int irq_status;
> +
> +	guard(mutex)(&lt9611c->mcu_lock);
> +
> +	ret =3D regmap_read(lt9611c->regmap, 0xe084, &irq_status);
> +	if (ret) {
> +		dev_err(dev, "failed to read irq status: %d\n", ret);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (!(irq_status & BIT(0)))
> +		return IRQ_NONE;
> +
> +	/*Clear interrupt: hardware requires two writes with delay*/
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> +	usleep_range(10000, 12000);
> +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));

[Severity: Medium]
Will this second write unintentionally assert the clear register for
other pending interrupts?

The handler attempts to clear BIT(0) by writing irq_status & BIT(0)
(which sets bit 0), waiting, and then writing irq_status & (~BIT(0)).
If irq_status contains any other active bits (for example, BIT(1)),
the second write will push a 1 to those bits in the clear register.

Since there is no subsequent write to reset those bits to 0, does
this leave the clear signal for those other interrupts permanently
asserted?

> +
> +	schedule_work(&lt9611c->work);
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808-lt9611c-v7=
-v10-0-ee90a136d82a@oss.qualcomm.com?part=3D2
