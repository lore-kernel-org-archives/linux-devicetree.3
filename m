Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0EC40B6DD
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781595450; cv=none; b=IalDMRfm6SmjsDcQwTGUGuzyWtgBHmZapfgOHmxO6CnDca9Kj6qdMuYkF6x1IqEE6Z5u+7fusAnauO5Q1xGNNXeXnnmrbH7yMYDUFACXRtHnAroAZWz9ikf6AfThoa2JBxT46yPjTKE0SIHwc6E0sUMQLnLoFGgK7NkW3qrz7zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781595450; c=relaxed/simple;
	bh=HHefqtqBtw2VllwmKz8l6gZ9QtCePvCHwD5VnO+skCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LR/Xm/xAh0G20EPO1GluOdfwzcxMLe3k5/asJQ+RrhDR4jNPXhxdf+RDKQTCAgwiXgwK+FwBNvG4dPGYIwPRBFEHvX/76stRbeMkcJwWRC5sWpthWjhcIeRkwYs3+lXLmMrUo8ig42aYe1TNGLIp8m1Gd9IoY1ON3+nkSuDMxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDrwt/Hv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDrwt/Hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA601F00A3A;
	Tue, 16 Jun 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781595448;
	bh=eXjtccLPAfGeShrYROeA5eeXh4S7mtRVbMxYs6aBA8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gDrwt/HvnaKcM//jfuxjFSdWh1lV/RcyQIspyLQG9bfwjcir7hF2rDkp+kzreCLQ1
	 vWuBp3sUFM/VhCmTY3n0nme/THc5X5xIM4GddyDx5cKPeH/OzI+el9qA/GH5/UgKaU
	 XK4ykCGdCUAJv30GR+yoEbL33C9MjwCCyaoiWBB9xJ36+/qJn4Nu5XZC3d7B1154p1
	 ugULi8wlSYoBhgrj79Irdhpc5lxKyLnTQB22EKZA7T2hwCl0i9ZsgnGA+9iyI3lLND
	 w7gVJH5iU7TxsGBKG4Fl6ePnyt2jVErsG4OvKvk2yRNxEo5cBvBmCgCC6IcbEaMMCY
	 ZW3tjr1mrp+Aw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 5/6] iio: osf: add UART transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jinseob Kim" <kimjinseob88@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616072242.3942-6-kimjinseob88@gmail.com>
References: <20260616072242.3942-6-kimjinseob88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 07:37:28 +0000
Message-Id: <20260616073728.9BA601F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The frame decoder validates header fields before verifying the fra=
me CRC, returning `-EPROTO` for structural errors and causing the stream pa=
rser to drop unauthenticated payload lengths.
--

commit ca765586fd1687d99b4b8cd4c1d18456513a142b
Author: Jinseob Kim <kimjinseob88@gmail.com>

iio: osf: add UART transport

Add the serdev UART transport and the initial OSF core receive path.
Enable the required vcc regulator with devm_regulator_get_enable()
before opening the UART, keeping power handling limited to the simple
probe-time requirement for this RFC.

> diff --git a/drivers/iio/opensensorfusion/osf_core.c b/drivers/iio/opense=
nsorfusion/osf_core.c
> new file mode 100644
> index 0000000000000..137fb7166febc
> --- /dev/null
> +++ b/drivers/iio/opensensorfusion/osf_core.c
> @@ -0,0 +1,99 @@
[ ... ]
> +int osf_core_receive_frame(struct osf_device *osf, const u8 *buf, size_t=
 len)
> +{
> +	struct osf_frame frame;
> +	size_t frame_len;
> +	int ret;
> +
> +	if (!osf || !buf)
> +		return -EINVAL;
> +
> +	ret =3D osf_protocol_decode_frame(buf, len, &frame, &frame_len);

[Severity: High]
Could this error handling cause a regression where data is lost during pars=
ing?

osf_protocol_decode_frame() validates header fields (like the major version
and header length) before checking the CRC, returning -EPROTO on structural
errors:

drivers/iio/opensensorfusion/osf_protocol.c:osf_protocol_decode_frame() {
    ...
	major =3D buf[4];
	if (major !=3D OSF_PROTOCOL_MAJOR)
		return -EPROTO;

	if (get_unaligned_le16(buf + 6) !=3D OSF_FRAME_HEADER_LEN)
		return -EPROTO;
    ...
}

If -EPROTO is returned here, the stream parser discards the unauthenticated
frame_len number of bytes instead of dropping 1 byte for resynchronization:

drivers/iio/opensensorfusion/osf_stream.c:osf_stream_process() {
    ...
		ret =3D osf_core_receive_frame(stream->osf, stream->buf, frame_len);
		if (ret) {
			if (ret =3D=3D -EBADMSG) {
				stream->stats.bad_crc_frames++;
				stream->stats.dropped_bytes++;
				osf_stream_drop_invalid_head(stream);
			} else {
				osf_stream_discard(stream, frame_len);
			}
    ...
}

Because the CRC wasn't evaluated yet, frame_len is derived from an
unauthenticated payload_len, which could be a large, corrupted value. This
regression might cause the stream parser to skip legitimate frames hidden in
the incoming buffer under noisy conditions.

> +	if (ret)
> +		return ret;
> +
> +	if (frame_len !=3D len)
> +		return -EMSGSIZE;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616072242.3942=
-1-kimjinseob88@gmail.com?part=3D5
