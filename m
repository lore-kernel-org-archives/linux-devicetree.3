Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA5C2E2EEE
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276723; cv=none; b=sjWsMOGqS6NuUlc8TKqvKlQjEy8zgu5V1lXdLxvZl05/4+fwKayegTbzza2Pj+6D5LDargYiTkMpI7/kQk28K4nRSX6k2izGBu5B3MAPVuYYcgOp/cpk9OF6xevq5I+XMXaC9CU7QihoD9hKg4tKKY/z1bvJlpMK4hX5RuuJF4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276723; c=relaxed/simple;
	bh=Kc4TU27a69tKrnIe5Dwv1k3/6NOOdNrHRXtt86kBTDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AiucvEb0grsPuIbAOd10Xo5/26LAAmf/foUtEVOd9hWhha714WEHmTeLY1cp0kHABuiTGQxAz1s73QHzm9i0L32nfFSvQIyBYtlmfUw/NmnxsDLQXhOUj+SB3QqfRDYv921aj8ZBbYabgPtdGdEF4T0zwyXfXp7cHfjQKDRe/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbYy/YPt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbYy/YPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09BCC2BCB4;
	Fri,  8 May 2026 21:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778276723;
	bh=Kc4TU27a69tKrnIe5Dwv1k3/6NOOdNrHRXtt86kBTDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=DbYy/YPtS7JPNThsGGaaQ+zl1dXe6MhzSAqU+t6QmlgLBmSxwcnPQFPVAxbq4U/sd
	 V+OZ3Ha4jane1/LaaEsyXYRPUBB2kaXTvhXekJ6WBZavdj/FmDG4rDKYm264GdmEHd
	 umxuQ5BnE1nH8XeccCmdJNxf964nY7urxEzQ5GVxYjS43wiXDJ1aL3jRkqJhlrWM6T
	 X02INZE+0LT8LX8+5P/W9wldNtCSmqmswuSybpnWU6aP178xzKCL02QzkG385+fnD/
	 MCmIfI+sKo1HSM8QFRgXazbkMkFP06wimrLUfT4PgZ6j2MPlH09Wv7veSSsOD95dKX
	 n08Yo1Fm4imkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] nvmem: Add the Raspberry Pi OTP driver
Reply-To: sashiko@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
References: <20260508-rpi-otp-driver-v4-2-cf8d725d8821@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 21:45:22 +0000
Message-Id: <20260508214522.E09BCC2BCB4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The driver exposes sensitive OTP memory (including device-spec=
ific private keys) with world-readable sysfs permissions.
- [High] Unchecked firmware response size modifying `fwbuf->count` under `_=
_counted_by_le()` annotation triggers a fortified memcpy panic.
--

commit a8dbaf078fc585c391a3307f1adbf25d7433260e
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: Add the Raspberry Pi OTP driver

Raspberry Pis have OTP registers which can be accessed through the videocore
firmware. Add a nvmem driver to support these OTP registers.

> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> index 0000000000000..393640cb9e32b
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
[ ... ]
> +struct rpi_otp_header {
> +	__le32 start;
> +	__le32 count;
> +	__le32 data[] __counted_by_le(count);
> +};
> +
> +static int rpi_otp_read(void *context, unsigned int offset, void *buf, s=
ize_t bytes)
> +{
[ ... ]
> +	fwbuf->start =3D cpu_to_le32(offset / 4);
> +	fwbuf->count =3D cpu_to_le32(count);
> +
> +	ret =3D rpi_firmware_property(priv->fw, priv->read_tag, fwbuf,
> +				    sizeof(struct rpi_otp_header) + bytes);
> +	if (ret)
> +		goto out;
> +
> +	memcpy(buf, fwbuf->data, bytes);

If the firmware performs a short read or encounters a partial error, does it
update fwbuf->count to the actual number of words read?

If fwbuf->count is updated to a smaller value, the __counted_by_le() attrib=
ute
will dynamically shrink the bounded size of fwbuf->data. Could this cause t=
he
memcpy() to trigger a fortified memcpy panic, since it uses the original
requested bytes size?

[ ... ]
> +static int rpi_otp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_device *nvmem;
> +	struct rpi_otp_priv *priv;
> +	const struct rpi_otp_driver_data *data;
> +	struct nvmem_config config =3D {
> +		.read_only =3D false,
> +		.word_size =3D 4,
> +		.stride =3D 4,
> +		.reg_read =3D rpi_otp_read,
> +		.reg_write =3D rpi_otp_write,
> +		.id =3D NVMEM_DEVID_NONE,
> +	};

The commit message notes this driver supports the "device specific private =
key
OTP (BCM2712 only)".

Does the nvmem subsystem default to creating world-readable sysfs attributes
unless explicitly restricted? Could this expose hardware private keys to
unprivileged users via sysfs?

Should the config set .root_only =3D true to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508-rpi-otp-dr=
iver-v4-0-cf8d725d8821@linutronix.de?part=3D2
