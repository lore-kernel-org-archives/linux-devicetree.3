Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1D368D4E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 18:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779473917; cv=none; b=XUJpszBhCsJ1TEaLKlexiH3O+scLLfwxKXEzTpfoWlEg2GyPiQsdgWkuN7wUBVYYhnFwzjvQDifgoNdBTAMnXCCfcZ65vZWQsUdkjBSGv5BQYrwVArUrQaPNoKpXbZJ+G07kMaTFU3hE90e7aBSnSLxR2yRuUFdeUPBgwjGw3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779473917; c=relaxed/simple;
	bh=C+lcC/7434Zf74CHz1g5p91ow8+qnSQ46UCk7hFJJCU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R8YYqnHpD8w6clhR7LAS6B91+qSTPMWzs4F8gOvk9Hs3uZi/OIXMx2fuKjD/mWYAygxR0UQZ3QCz6zxu8/hkYoD56G6OfBgMDfFx63JxBlpkbTWLiLmr5s23wxh/qP7sKLKI7zEDdsr5b3HKFhsrMtcMI8Y6tlR4gptv+ObeD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IA+lvNnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IA+lvNnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F1C1F000E9;
	Fri, 22 May 2026 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779473915;
	bh=Ioe2yeYNCc8hoA2e9DFgnQzYmtKB2scbA3uzQ4Xs6us=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IA+lvNnItlhcOYn9kf3L9cSKd77vlQbvguE9FtnikOPZv9zFXOfNk8GS4VqBgJQWO
	 i9Nx2PTGkLGPtM00Bj00PeVrRe2yB7+ENhLrEbpNMHgNKJxRtPzxGL7dzO3jLOQEl7
	 LSASvavITAYL3kqvmEScIISZAzEL3+jrA7RMy49uoSaFJppXkUMcf8Wa5N0QB6ejzQ
	 ZPFioWLbUkUij4yhH4O8sjfF2OD6lwh7Cqv6nK0tokbWJG7kcT8AhXtOnjaxpis1Sq
	 /71H8Ki6LHSVOQl65MToLWazW7zi1RXjOPdNw0KpkrLy0Cz+AicpHBJfaDmX+ezuEL
	 tbOrB+KVMdJjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/10] nvmem: Add the Raspberry Pi OTP driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260522-rpi-otp-driver-v6-4-b0eac97d1428@linutronix.de>
References: <20260522-rpi-otp-driver-v6-4-b0eac97d1428@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 18:18:34 +0000
Message-Id: <20260522181835.56F1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Potential FORTIFY_SOURCE out-of-bounds panic in `rpi_otp_read()` d=
ue to missing short-read validation.
- [High] `devm`-allocated private data is used-after-free if an external co=
nsumer holds a reference to the nvmem device after driver unbind.
- [Medium] Unconditional write support can lead to silent write failures on=
 read-only OTP regions.
--

commit dcc1b143736646b08c117f369ca02e22f47c7ba5
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: Add the Raspberry Pi OTP driver

Raspberry Pis have OTP registers which can be accessed through the
videocore firmware. Add a nvmem driver to support these OTP registers.

> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> index 0000000000000..2e2537ee6793b
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,131 @@

[ ... ]

> +static int rpi_otp_read(void *context, unsigned int offset, void *buf, s=
ize_t bytes)
> +{
> +	struct rpi_otp_priv *priv =3D context;
> +	struct rpi_otp_header *fwbuf;
> +	u32 count;
> +	int ret;
> +
> +	count =3D bytes / 4;
> +
> +	fwbuf =3D kzalloc(struct_size(fwbuf, data, count), GFP_KERNEL);
> +	if (!fwbuf)
> +		return -ENOMEM;
> +
> +	fwbuf->start =3D cpu_to_le32(offset / 4);
> +	fwbuf->count =3D cpu_to_le32(count);
> +
> +	ret =3D rpi_firmware_property(priv->fw, priv->read_tag, fwbuf,
> +				    sizeof(struct rpi_otp_header) + bytes);
> +	if (ret)
> +		goto out;
> +
> +	memcpy(buf, fwbuf->data, bytes);

[Severity: High]
Can this trigger a FORTIFY_SOURCE out-of-bounds panic?

The struct rpi_otp_header uses the __counted_by_le(count) attribute for the
flexible data array. If the firmware returns a short read or encounters an
error, it updates the count field to the actual number of words returned.

If count is reduced by the firmware, does this memcpy attempt to copy the
original requested size (bytes), exceeding the dynamically evaluated bounds
of fwbuf->data?

> +
> +out:
> +	kfree(fwbuf);
> +	return ret;
> +}

[ ... ]

> +static int rpi_otp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct nvmem_device *nvmem;
> +	struct rpi_otp_priv *priv;
> +	const struct rpi_otp_driver_data *data;
> +	struct nvmem_config config =3D {
> +		.read_only =3D false,

[Severity: Medium]
Will this allow silent write failures on read-only OTP regions?

If a region (like the device-specific private key OTP) is read-only and
lacks a valid write_tag in the platform data, write_tag will be 0. When
rpi_otp_write() sends tag 0 (which corresponds to RPI_FIRMWARE_PROPERTY_END)
to the firmware, it interprets this as an empty property list and returns
success without writing any data.

Should the read_only flag be set dynamically based on whether a valid
write_tag is provided?

> +		.word_size =3D 4,
> +		.stride =3D 4,
> +		.reg_read =3D rpi_otp_read,
> +		.reg_write =3D rpi_otp_write,
> +		.id =3D NVMEM_DEVID_NONE,
> +	};
> +
> +	data =3D dev_get_platdata(dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->fw =3D dev_get_drvdata(dev->parent);
> +	priv->read_tag =3D data->read_tag;
> +	priv->write_tag =3D data->write_tag;
> +	config.dev =3D dev;
> +	config.priv =3D priv;
> +	config.name =3D data->name;
> +	config.size =3D data->size;
> +	config.root_only =3D data->root_only;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);

[Severity: High]
Could this lead to a use-after-free if an external consumer holds a
reference to the nvmem device after the driver unbinds?

The driver allocates the priv context using devm_kzalloc() and registers the
nvmem provider via devm_nvmem_register(). During driver unbind, devres clea=
ns
up in reverse order: nvmem_unregister() is called, which drops the internal
kref, and then the priv memory is freed.

If an in-kernel consumer has acquired the nvmem device (e.g., via
nvmem_device_get()), the refcount remains greater than zero and the nvmem
device stays alive after priv is freed. If the consumer subsequently calls a
read or write operation, will rpi_otp_read() or rpi_otp_write() dereference
the freed priv pointer?

> +	if (IS_ERR(nvmem))
> +		return dev_err_probe(dev, PTR_ERR(nvmem), "error registering nvmem con=
fig\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-rpi-otp-dr=
iver-v6-0-b0eac97d1428@linutronix.de?part=3D4
