Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331090;
	b=JT4xkS4xKktH7wUwhYhe9SoDzG3qoKUgHVvOuRoqbALPS6qvb8arfhMy2G/i7XxqFkNf
	 4Djw64We3CKSL+5Cgr5D4EX5TOIQenSv44wN0XyWYzy9o4VabzeSVIVDEzRU4E2LDwIk3
	 bKBcYBDKJvu1Vd2y77GKbAqB0+6GpMiTX8HTrY1ZGfJDGfKVDXrTcfscQEB1Ceu3rIEPb
	 dN3Jwz9WDYCwE2rJvq31XeYYUpmxWbsmlzMxQgKUzZo3ItJTKw2MZAPSyFNB4OfoQVYoh
	 yuy9GqcGxFlwHt8XToK3G/S2FbdqGFTpLoGjyshA0F72nR5y1vciY4a3ilNauXvhuiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331090;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nEKNXsvy57TPcJGMNUomia5HAPAyWjpiiKmfTB0MWeM=;
	b=FOK5nPn7EZkMedIDAw8HrF1q7yBT6D86+6YMqza6hxqcf+/EuPBOP2/Iq+ptwaCJy2OV
	 VgrTCsooF5Ht2R49KyiiOMCkDCppz58hxmnRpACbnA5Yv/NiSXie2zGCKBEDeDB2/bmz6
	 CUhm3OxwlfTyp8ebUzjmRanzIfC1BIbIoCQ1XT7DlLDaE34sid7DzImif8IugUz/66YO0
	 +8IKVOKVinR4+JUeeS6PornV15QOPvMy3ithqRuIY2lEXNua14rwA1PpOsnWhj3r+LmvW
	 YHQKUO2TvCIiE2RuQSyjEmyKG642v71Bu9RMVNlci7N0mSN9BkdxYxKN0ILSk7yoxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCYiYhRi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E5D606A31C
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QCYiYhRi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18611F0089F;
	Tue, 10 Nov 2026 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794331089;
	bh=nEKNXsvy57TPcJGMNUomia5HAPAyWjpiiKmfTB0MWeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QCYiYhRi5GMOY21AQLh/bhWPJAeyzGq3LI2eu/8Q+YPywr8CI37YfDRmOJds0w9+M
	 nQKGyJUKx/nJB2DVgLiMOV25w7n0gANxk9qxN4vFyDI2CadUOokXkol7V6f/J3gk04
	 L90jBseCzdFwW1VFq/yhYg644rlM6UC8qLv0xAeEnJBfe9u6rfHgiQCRt63htL3G+R
	 PDbb0UN/NdZZgWr5oa4E8OHkiSfmn1SpA6zINGF/+Pe7fwB34V6kBfqvYEuqnGSckI
	 DT9gvLyTL/MHLuZPoIVFs4O9o3MmHMwXNdocMbMIcI5J60fn8zmDajQzmbV4SBbtcJ
	 jTiDCLmEJyzWQ==
Message-ID: <sashiko-outbox-207459@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/12] nvmem: Add the Raspberry Pi OTP driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gregor Herburger" <gregor.herburger@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261110-rpi-otp-driver-v8-5-797e0577d414@linutronix.de>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
 <20261110-rpi-otp-driver-v8-5-797e0577d414@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 17:18:09 +0000
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
- [High] nvmem: raspberrypi-otp: fortify panic in rpi_otp_read() on
  short count
--

commit c10d09bc13f73c4dd03231f9da5b8e776da5b958
Author: Gregor Herburger <gregor.herburger@linutronix.de>

nvmem: Add the Raspberry Pi OTP driver

This commit adds an nvmem driver to access the Raspberry Pi customer and
private OTP registers through the VideoCore firmware interface.

> diff --git a/drivers/nvmem/raspberrypi-otp.c b/drivers/nvmem/raspberrypi-=
otp.c
> new file mode 100644
> index 0000000000000..2e2537ee6793b
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
> +	memcpy(buf, fwbuf->data, bytes);

[Severity: High]
Can this memcpy() trigger a fortify panic if the firmware response modifies
fwbuf->count?

rpi_firmware_property() overwrites the entire fwbuf buffer, including
fwbuf->count, with the response from the firmware.  Because fwbuf->data[]
is annotated with __counted_by_le(count), CONFIG_FORTIFY_SOURCE evaluates
the runtime size of fwbuf->data from the returned fwbuf->count value, so
if the firmware zeroes or reduces fwbuf->count on a partial or unsupported
read, memcpy(buf, fwbuf->data, bytes) will call fortify_panic().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-rpi-otp-dr=
iver-v8-0-797e0577d414@linutronix.de?part=3D5
