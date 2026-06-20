Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033D232B12F
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 09:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781946297; cv=none; b=AMTUy4kkhcK8ltBSRKgXhzCUIl1xdDzsDUFW91fQCzSOi8C/GYjKJ+e7Lk77Ymy6eEcu/MUstCvrE18/gqRgm5X/IwzJMdLq+ko/lPlmALM6fgNiigwYFlebP5T6uLPs19vkH6NiJLT3avpgD8CQ9dTMUfcPbFFLQe3Wn/+e85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781946297; c=relaxed/simple;
	bh=gINH5EMUmmPBxcK3YcHZD7sH/BuGItmQaVqet2l2i+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=daU9vRbph5p/vyVSLLMK6AYfriB/YVl7VkEv9M+joc17qjmpwVbhZgRYw6k4H8R196PyfPers+59laJhQlveFn5flN9av/Ml2x5DGA3jxN+JqPmVoDFD57vR+J5CNT1jER3u8R6E39YhbVhu+EhRO7WSj9y8LhM6wc3fJcJDRcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fp5Dx9wm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fp5Dx9wm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F521F000E9;
	Sat, 20 Jun 2026 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781946295;
	bh=yQuDNsgE6/8sANPWOeNY4azdoWRhogyO5eAGz83v7nY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fp5Dx9wmg8KHjH3oY87XH0uGjF9bBJ5DZGypIvVcA40NJUGaAGt4SgiTIg7M8sTug
	 PcHJ4+C1MHD2qrYkUgw6W3gAFREh4j3DL38jH79yo8O+SMYsd6anUzwM3R5xWrUPtR
	 Mbllf71DV1JZ8sEqgidv87+bvTZeCgGPhxBYIRFalOKG2/V5oY37B4AW8dm2CzAQTA
	 nX9ZuZq7Fgsc5hbPdlM9EzuzV+92yOeM91Yx15O2F9EjDumoLJZdkXNsc3v2RRp6lx
	 5m9sVk5vHNOYSxIqePGLYksD7MT/XiHy481iRGpLfQ2l6iV7v55nb8E4TeURcRwN8P
	 QRY/I9LNXwnLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] mfd: sprd-sc27xx: Add SC2730 regulator cell
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?T3R0byBQZmzDvGdlcg==?= <otto.pflueger@abscue.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260620-sc2730-regulators-v6-2-bbd2db395231@abscue.de>
References: <20260620-sc2730-regulators-v6-0-bbd2db395231@abscue.de>
 <20260620-sc2730-regulators-v6-2-bbd2db395231@abscue.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 Jun 2026 09:04:55 +0000
Message-Id: <20260620090455.72F521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The preexisting 'sc2731-regulator' driver fails to bind and cannot=
 parse Device Tree properties.
- [High] The custom SPI read function `sprd_pmic_spi_read()` is fundamental=
ly broken, reading corrupted data and failing to transmit register addresse=
s.
--

commit 64895ca35a5a54c5838030a81a11a1b90576b82b
Author: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
Subject: mfd: sprd-sc27xx: Add SC2730 regulator cell

Add an MFD cell to register the SC2730 PMIC's regulators.

> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> index aa052f6466231..214bcbef0c271 100644
> --- a/drivers/mfd/sprd-sc27xx-spi.c
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -61,6 +61,7 @@ static const struct mfd_cell sc2730_devices[] =3D {
>  	MFD_CELL_OF("sc2730-efuse", NULL, NULL, 0, 0, "sprd,sc2730-efuse"),
>  	MFD_CELL_OF("sc2730-eic", NULL, NULL, 0, 0, "sprd,sc2730-eic"),
>  	MFD_CELL_OF("sc2730-fgu", NULL, NULL, 0, 0, "sprd,sc2730-fgu"),
> +	MFD_CELL_NAME("sc2730-regulator"),
>  	MFD_CELL_OF("sc2730-rtc", NULL, NULL, 0, 0, "sprd,sc2730-rtc"),
>  	MFD_CELL_OF("sc2730-vibrator", NULL, NULL, 0, 0, "sprd,sc2730-vibrator"=
),
>  };

While reviewing this patch, I noticed a couple of pre-existing regressions =
in
this file:

drivers/mfd/sprd-sc27xx-spi.c:sc2731_devices() {
    ...
	MFD_CELL_OF("sc2731-fgu", NULL, NULL, 0, 0, "sprd,sc2731-fgu"),
	MFD_CELL_NAME("sc2731-poweroff"),
	MFD_CELL_NAME("sc2731-regulator"),

[Severity: High]
This is a pre-existing issue, but could the sc2731-regulator MFD cell fail =
to
bind to its platform driver due to a name mismatch?

The platform driver in drivers/regulator/sc2731-regulator.c is named
"sc27xx-regulator" and lacks an id_table, which means the platform bus will
not match them and the driver will remain unbound.

Furthermore, even if it did bind, sc2731_regulator_probe() sets
config.dev =3D &pdev->dev. Because MFD_CELL_NAME() creates the device witho=
ut
an of_node, pdev->dev.of_node is NULL. Does this prevent the regulator
core from parsing any DT constraints or bindings, breaking regulator
initialization?
    ...
}

drivers/mfd/sprd-sc27xx-spi.c:sprd_pmic_spi_read() {
    ...
	/* Copy address to read from into first element of SPI buffer. */
	memcpy(rx_buf, reg, sizeof(u32));
	ret =3D spi_read(spi, rx_buf, 1);

[Severity: High]
This isn't a bug introduced by this patch, but is the custom SPI read
function sprd_pmic_spi_read() fundamentally broken?

It attempts to read a 4-byte PMIC register by copying the 4-byte register
address into rx_buf and then calling spi_read(spi, rx_buf, 1). The core
spi_read() API performs a receive-only transfer (tx_buf is NULL), meaning
the register address is never actually sent to the SPI slave.

Additionally, the length is set to 1 byte instead of 4, so only 1 byte is
clocked in from the slave.

	if (ret < 0)
		return ret;

	memcpy(val, rx_buf, val_size);

Finally, copying 4 bytes back to the caller returns the 1 byte read from the
bus concatenated with the remaining 3 bytes of the register address that we=
re
initially placed into rx_buf. Does this silently return garbage data for
every register read?
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260620-sc2730-reg=
ulators-v6-0-bbd2db395231@abscue.de?part=3D2
