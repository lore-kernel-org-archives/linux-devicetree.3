Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F93F4DEE
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790309; cv=none; b=duoBnf0QQ5tLp0+xkv2/jfluLPfkSU+3naQ11GPQ4UjI9oBw/EZSSHxy/CO5g6/tIPWc1IzD2P259wcPp+pCYkmMjn7XyZgbY5u6d1xGpzAvFGkBGVrYdhayYThUlpJp667ko677XIp1ZrDdmBM0dWFvdwXWc8m/2LviiUDFXak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790309; c=relaxed/simple;
	bh=ZAJNf00OOBQPdgh6qrAd9ebHI9IfLrFQXCVJyrEUJKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UiXHRhQEmwvBlPEEva5iOvAkdL4+s7F9rV6sTWAdJNsqMbo4dBHOYfSx0d5WUNM0o1nhzT2e15OVQ+GE1MHI0MSiUveKrRR/siXGz7xewvv0Ikr7ue5hp5l89jqCmKPxkIiaXpLXyrhvL0It5gIWlciJxHcf8Tc6KncPRkcAdKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QzkglXJa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QzkglXJa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA11F000E9;
	Thu, 18 Jun 2026 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781790306;
	bh=I3wrqAjy7rGbSeoYS+/nLx1+CwjpsSM6e7j3uUoboss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QzkglXJaKhYYnJtqj5Dr+mqC67eUxMT7mWMWHtPmKeItMjgJdB5tjlhpNuppQCEy4
	 QxA0kmuVKEB3NAcGRmMMxIYHDqy1BuOE0Df8EOwqs3AKEDnkU/jxany+bDijKArNEd
	 3QZJF67sK0m5woLh3kdAJ93+umgYrPgK+ErT2WobCe877Tp9a/e0Fsmz2cTUJv6pnq
	 dGuwEBzUTsoJeLTpuaiZ/4p/CDgcodf8RHS/sSm1OdoHkqIDe7ZwD6UXba4Ftar6aS
	 lmEm6622DeuCCwdO02YauW6y0vvWQJLdgYRyPbVXCRC1M1zkQmgPJwYL2qZGPb7W+f
	 UK0Z1UKEIGTaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 14/16] iio: frequency: ad9910: show channel priority
 in debugfs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260618-ad9910-iio-driver-v6-14-79125ffbe430@analog.com>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-14-79125ffbe430@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 13:45:05 +0000
Message-Id: <20260618134505.BEEA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The parallel data port logic in the debugfs source attributes is=
 dead code because the driver does not configure IIO buffers and omits `.sc=
an_index` for the parallel channels.
--

commit 1430aa5467e635315d439ae21891376a98143557
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: show channel priority in debugfs

Expose frequency_source, phase_source and amplitude_source attributes in
debugfs. The implementation follows the priority table found in the
datasheet.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 890499f67bd56..b39eeb8d9cd45 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> @@ -1960,6 +1974,158 @@ static int ad9910_setup(struct device *dev, struc=
t ad9910_state *st,
>  	return ad9910_io_update(st);
>  }
> =20
> +static inline const char *ad9910_frequency_source_get(struct iio_dev *in=
dio_dev)
> +{
[ ... ]
> +	/* Parallel data port enabled and data destination is frequency */
> +	mode_en =3D FIELD_GET(AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +			    st->reg[AD9910_REG_CFR2].val32);
> +	if (mode_en && indio_dev->active_scan_mask &&
> +	    test_bit(AD9910_SCAN_IDX_FREQ, indio_dev->active_scan_mask))
> +		return ad9910_channel_str[AD9910_CHAN_IDX_PARALLEL_FREQ];

[Severity: Medium]
Is this logic effectively dead code?

The driver configures INDIO_DIRECT_MODE without setting up any IIO buffers,
so the IIO core will never allocate active_scan_mask.  This means
indio_dev->active_scan_mask will permanently evaluate to NULL and the
condition will evaluate to false.

Furthermore, even if buffers were enabled, the channel specifications for
the parallel channels do not populate the .scan_index field, so the bits
would never be set by the IIO core anyway:

drivers/iio/frequency/ad9910.c:ad9910_channels[] =3D {
	...
	[AD9910_CHAN_IDX_PARALLEL_FREQ] =3D {
		.type =3D IIO_FREQUENCY,
		.indexed =3D 1,
		.output =3D 1,
		.channel =3D AD9910_CHANNEL_PARALLEL,
		.address =3D AD9910_CHAN_IDX_PARALLEL_FREQ,
	...
}

Could this debugfs output silently fail to report the parallel data port and
fall through to incorrect fallback states?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-ad9910-iio=
-driver-v6-0-79125ffbe430@analog.com?part=3D14
