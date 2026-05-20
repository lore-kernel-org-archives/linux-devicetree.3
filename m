Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD20369D6E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295823; cv=none; b=EnzUIDZ9quK1efwi2MBjSNXc9yoYvZxtI1TJjxjMUnjHBxP/+w8gM6PsTGJ4b+p2GEqXbo6/rQ+pkArNn7ZN94eusmEsiISdCflZ9QDKpQv9gdK0b+MrsPejtTMA2BStf28K8FZ/ahTF9809U/k8cS3PPQ8s8OQ59VXPENmfd+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295823; c=relaxed/simple;
	bh=4StO3GMn4Gxk9XTKt6uPC3P4PuxH61uGY6QVK/IFduQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HY/cbUGVF+ROcdktPL1TJ4h3U0Ig/uxFEY0fppqtSfwhaRmxyyuAsvfMmTEOjrEpCH4coN6p8WP1gIc315i1eOPYa8FmWJEMcvHtCEmaHYUWHPw7/wzqMeAYkldKA9sbGdMVZpo7QANIzY8+cadl3LVo9igxmwcjMh6wTIouaSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXMjNnCs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXMjNnCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E501E1F00893;
	Wed, 20 May 2026 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779295822;
	bh=sfocF3u5HLfFiamdAfLSxEaZCOrKo/tdWFUpAkSfQi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SXMjNnCs5cPfn1p/rB1u3USNpbzfQm9eeNI6aIHoPK3462MbmcAX23OcJlrHSh29K
	 +G3jzSOwB31wt9J45bm17EB3ScAmyj5AtV8MrBY2kdqRSX0uIwTZbn5Uul/4isX8mt
	 46y+Q7FlCpNtIcBEBOe1pmS8C0DrodI/vWzRBz4IxS+3oKx5tTov3eeZOUQtkAQbAE
	 WEUGemWkDbgdHEErGspOXIhXRWNmBWvkjftJHp9wcwMmPaSDx8f4J6knNaXh6cPGTy
	 TFIy+r43qLRfjbJkGIvhsS+BU2ZelX8sqylQBzYtXMEfdxNTxm/areSSyNdz5fperF
	 eNOKo+h/r+X1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] nvmem: Add the Raspberry Pi OTP driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520-rpi-otp-driver-v5-4-b26e5908eeac@linutronix.de>
References: <20260520-rpi-otp-driver-v5-4-b26e5908eeac@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:50:21 +0000
Message-Id: <20260520165021.E501E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing Validation / FORTIFY_SOURCE Panic
- [High] Logic Error / Silent Data Loss on Read-Only OTPs
--

commit 2e3b6ccd5e0a968798b760a4875d946be03546f6
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: Add the Raspberry Pi OTP driver

This patch introduces a new nvmem driver for accessing Raspberry Pi OTP
registers. The registers are accessed via the videocore firmware interface,
supporting both the customer OTP and the device specific private key OTP.

> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c

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
If the firmware returns a partial read and reduces the value of fwbuf->coun=
t,
will this memcpy trigger a FORTIFY_SOURCE bounds violation?

The rpi_otp_header struct uses __counted_by_le(count) for the data array. If
the firmware alters the count during rpi_firmware_property, the dynamically
evaluated object size of fwbuf->data will shrink.

Continuing to copy the originally requested bytes could exceed the updated
bounds and crash the kernel. Should the driver limit the copy size to the
returned count or handle short reads as an error?

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

[Severity: High]
If the platform data specifies a read-only OTP region (like the device
specific private key OTP) with a write_tag of 0, could this cause silent
data loss during a write attempt?

If a write is attempted, rpi_otp_write would pass a tag of 0 to
rpi_firmware_property. Since tag 0 signifies RPI_FIRMWARE_PROPERTY_END,
the firmware will immediately terminate property processing, ignore the
payload, and return success.=20

This would mislead the NVMEM subsystem and userspace into thinking the write
succeeded when the data was actually discarded. Could the driver conditiona=
lly
set .read_only =3D true and omit .reg_write if data->write_tag is 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-rpi-otp-dr=
iver-v5-0-b26e5908eeac@linutronix.de?part=3D4
