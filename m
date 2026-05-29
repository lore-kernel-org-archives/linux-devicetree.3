Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D018331A4C
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060988; cv=none; b=ieVeDk/qjNWkStwA+H2MDY+RFX2YVdlKdJUJ2ObYDGsW9aH1YCW/OaxUG2ArkQw8qhR6r5ZL8GQyOvre/g7SM0lZ5dK8yN/HBcKHCyCBLS6R3rhCltDG6zGTzeS7MP1giavlZ6lL0I60A/Cm24YkHX7diF98useVdC4cwpVTKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060988; c=relaxed/simple;
	bh=iBsZj4HJLOWhIFx7WeSf35ikMqGtADIt+EFmP5YELh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ns3vaQUl1c1qvguCIHd9iPdnXW/iKeM097ws0Ws9hwHCL3LnJSGjQHaEeCibuwzXTjB5UuNUJXGpmmdLXyccJdIoAj0mfKIfdIrhVsoEMuvLwwh9CJDacrmGdGxdM/ajYiwdnIfJBU0bo/cmG+2I+4Jr+XHwzOGn0dO0mdm4rRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZ/ILdee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZ/ILdee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1791F00893;
	Fri, 29 May 2026 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780060986;
	bh=Y25lZZxrM1Ns9GkfkpB5COW9e5zzT8vST8cuCsKQUlA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZ/ILdee5yhpWOCp8HRf9CAtbsPsGctUdizRiOfVEacmwYiiDXB1E+JLe+1/BE6B3
	 VkXLW3dwnmFTJL58XKFhqTrcZYGqkvsHLtDTYFNwnlttMzA14ff3MNfDD9+Ye3S45g
	 TWpYVA9yd4Je+MiaYa1RW+ZtlUBBjKVajWNkZudJ7nt4Y95KMgZqx/dX8Efeut3sOg
	 XO0zIKCK72VbsbfsJEv8cRN1uaYUE4CbAkP+1bTPPspQv8kAsX+JglV51omvofkDAX
	 vYvqn+d91WYb2wKC9jWLcrJblIIKrWfvy4K6ZRl704JJeC39jDfuTLLlSekkPJdVX2
	 NpwjSxc0hwt2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/6] iio: adc: ad4691: add oversampling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260529-ad4692-multichannel-sar-adc-driver-v14-5-e93c2747dc1f@analog.com>
References: <20260529-ad4692-multichannel-sar-adc-driver-v14-5-e93c2747dc1f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 13:23:06 +0000
Message-Id: <20260529132306.BD1791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Out-of-bounds array access in SPI transfer setup when the soft tim=
estamp channel is enabled.
--

commit 432eefa94b45dd8bef36e14221d32f97f7de44ee
Author: Radu Sabau <radu.sabau@analog.com>
Subject: iio: adc: ad4691: add oversampling support

This commit adds oversampling ratio (OSR) support for CNV burst mode and
introduces manual mode channels that omit the OSR attribute. It also manages
shared internal oscillator frequencies based on OSR.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index b1d1b42f724e7..043143ae95608 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> @@ -241,23 +294,91 @@ static const struct iio_chan_spec ad4693_offload_ch=
annels[] =3D {
>  	AD4691_OFFLOAD_CHANNEL(7),
>  };
> =20
> +static const struct iio_chan_spec ad4691_manual_channels[] =3D {
> +	AD4691_MANUAL_CHANNEL(0),
[ ... ]
> +	AD4691_MANUAL_CHANNEL(14),
> +	AD4691_MANUAL_CHANNEL(15),
> +	IIO_CHAN_SOFT_TIMESTAMP(16),
> +};

[Severity: High]
When the timestamp channel is enabled via sysfs, will this result in 17 act=
ive
channels in the scan mask?

If so, when iterating over the active channels in functions like
ad4691_cnv_burst_buffer_preenable() and
ad4691_cnv_burst_offload_buffer_postenable():

	k =3D 0;
	iio_for_each_active_channel(indio_dev, i) {
		put_unaligned_be16(0x8000 | AD4691_AVG_IN(i), &st->scan_tx[k]);
		...
		k++;
	}
	...
	st->scan_xfers[2 * k].tx_buf =3D st->scan_tx_reset;

Does k reach 17 after the loop, causing an out-of-bounds access to
st->scan_xfers[34] when setting up the reset transfer, and a similar
out-of-bounds access to st->scan_tx[17] in the manual mode path? The
st->scan_xfers array is sized at 34 and st->scan_tx at 17, making indices 34
and 17 out of bounds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-ad4692-mul=
tichannel-sar-adc-driver-v14-0-e93c2747dc1f@analog.com?part=3D5
