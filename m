Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383595;
	b=AAKJ/d//IeRuqSSjkz/4RZHTON9FrnHXS4mbQUTb+fbZBCXlR2/sKFnfrh04BjftSIIK
	 vgqseLV6UKAURJSLKN47L+V+l4S9IiXwwhhtCIO6tIFqBp58Puz/8eG6JizYk2vaKAVgl
	 kDDvNsJt3EePajHNv7216t07J482SfGYm1LVssIqMbrBGafqPj19Mj7vC4AJdOm4QkQL7
	 c/jAPnXMcDq5xCfR+51cpAKCk5juHPSKDbdThYQ1QLZSK14jUka9ehU8gqPQaAnYJNSZ6
	 d8Eubx/MVse21AfQT1t21hGat8JdNP8rBjEFdrzGgUJ8luEQGZbl/zNT1z1ZvLBBRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383595;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fuo8zVNQcdlqClB3SOXT2beeoxrcGsbCXbsk7s/rAgc=;
	b=xk/F9wpOqZAU66u/XZXflTsn9HYxo+4L8PlA75ZcPyGYbVf8+SqcP9NFt1DVv96iOfX8
	 zrlDmCH7NB0HmMXqWoDKlwZA1K0dYPO8AYKTpPT7B7iYNkIf/abwWTPZeFk0U5NC7KSx0
	 3BT8S/2RFyyYhnSUkIzLTKghTWiEH4yp+NlNDEOqkeBlNJGhIggHfpr9GKGUt5z1jh0xu
	 8I6JhD4qFpEoug1rcJp0nP5SlJii/Ep1GdDP+DKWFP8Imz4HpkGr4S5NaTJ+uk4eF/5Ka
	 TVbKEl7wRzcL7yp6DnoDIB5rYXRgMdAvWSsTdXrDxmuC6aTEK7IkvCafwQC9hyFU83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NEMtA1of;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC3606A320
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NEMtA1of
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398401F00A09;
	Wed, 11 Nov 2026 07:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794383594;
	bh=fuo8zVNQcdlqClB3SOXT2beeoxrcGsbCXbsk7s/rAgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NEMtA1ofUF56rCWdA0vwJQp2md0yRhHKh45wP+TtmA/C6gzSVRCHxHtA2WLV+iwZu
	 hHnPUrYkXDL4TBMemvDfTr5VFO0yx49W6e9QOicJfv91phCGa505IlHiNc9ot5DC2X
	 JKbmEdo5F8JTsVczUeQ6MogZ3XXJWo2MgJk3Pa6MI/hNll+i4SSeO2WytrNMmFET2S
	 NSSShVvg5ANleXin6UWvnjQ8fEwVn423gnK0GDiFVkmOUdQYYpwbxbd1/WpCmJKenm
	 jyeAFPz4z+5zONpSyFhHQI9CUGWEr/2KOq8sSAP42BlyCnsvGKYgdXjpGxO9dFF/DT
	 pRlcIKtglnxSg==
Message-ID: <sashiko-outbox-208548@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/12] nvmem: Add the Raspberry Pi OTP driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
 <20261111-rpi-otp-driver-v9-5-0a7292a7a5b4@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 07:53:13 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] nvmem: raspberrypi-otp: unvalidated fwbuf->count in
  rpi_otp_read()
--

commit 5f43735ea021896029b9b0fd1aee1fb3cdeb2562
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: Add the Raspberry Pi OTP driver

This commit adds an nvmem driver to access Raspberry Pi OTP registers
through the VideoCore firmware.

> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> index 0000000000000..2c632781f6003
> --- /dev/null
> +++ b/drivers/nvmem/raspberrypi-otp.c
> @@ -0,0 +1,131 @@

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
> +	memcpy(buf, fwbuf->data, le32_to_cpu(fwbuf->count) * 4);

[Severity: High]
Can this overflow buf or leave part of it uninitialized if the firmware
modifies fwbuf->count?

rpi_firmware_property() overwrites fwbuf in-place with the response
payload, including fwbuf->count.  Because fwbuf->data is marked
__counted_by_le(count), updating fwbuf->count also changes the dynamic
object size seen by fortify checks.

If the firmware returns a count larger than the requested count (such as
0xffffffff on error), memcpy() reads past fwbuf->data and overflows the
bytes-sized destination buffer buf.  If it returns a smaller count,
memcpy() only partially fills buf while rpi_otp_read() still returns 0,
exposing uninitialized heap memory to callers such as bin_attr_nvmem_read().

Validating that le32_to_cpu(fwbuf->count) =3D=3D count before copying (or
copying bytes after checking) would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-rpi-otp-dr=
iver-v9-0-0a7292a7a5b4@linutronix.de?part=3D5
