Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F6A32AADC
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534022; cv=none; b=edwN9TW43NQwfDKlsPM1gMulNUdqijS1rnqvlvhcO0tT1BOJU13BiRdkfsPj9se+ONCJPSP3yg6PQVyDxiTGNDSFKQOvhaIryZWTn2qapS45e/xrzeQRSnPgQ5eyX8spw2Y/vTx40vPVHn5P/7a2C34n6IMbl6FJX1zhdNfCfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534022; c=relaxed/simple;
	bh=dXC043kF1i/9QUGmIWXlYj/uJcLQAyomZNu5T2c+lIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qsZ3gzUIMgwWvUiuRAWILGcg2kp/zTKm/wNBYrNsJtXo8Ku1Q/NNimpwji/nfubwZaM3eCBE/qsrWzqzHQRkGFFOlbw8L6pPx08qlPfUlDbpJ3WQMRllm/pY80GMNFt2gnYTgP6Wxj2RgKeBvT9XQYh6b8BAitjq69LYb85OTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uydrTcHx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uydrTcHx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630C9C2BCB0;
	Mon, 11 May 2026 21:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778534021;
	bh=dXC043kF1i/9QUGmIWXlYj/uJcLQAyomZNu5T2c+lIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uydrTcHxWx0FsKCPG/ld+sLGRKVhZ11ghxxk+7fAkColGsBRRpyzizOjJYUaZC9wv
	 zilxywFR6HvtFU7w85EQ2A0+ouH5pG0euIkO0HHYVHGQAE/uHfFZ5xCuV4rq0XrHkq
	 8ieiBCh/WA8u6dYbfjn3tbGQIoanQWV4Emn3T54GM/NB7I8/FLY8bGVAGlEC8QCH97
	 f+at2oq2aHj4jf4ySN5rJY84jn7uOMN4lucwSgqwncCnwtThg/dIsRlP21wBaVVfQw
	 J6iI0mcJhvb8PgXgF15ogQRGlch+X6vVuEr6MKTeKpQMSUzE7p+kTUkcXr08itip0X
	 bsPKqX9FhUgoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Reply-To: sashiko@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-4-49700fd03005@smankusors.com>
References: <20260510-pm8xxx-xoadc-label-v6-4-49700fd03005@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:13:40 +0000
Message-Id: <20260511211341.630C9C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The new `.read_label` callback and pre-existing `.read_raw` fail t=
o uniquely identify channels, causing incorrect labels and voltage readings.
- [High] Race condition in probe exposes uncalibrated device, risking divid=
e-by-zero kernel panic.
--

commit 50e7569708562dacb984c644e8571f2c7c6624cb
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

iio: adc: qcom-pm8xxx-xoadc: add support for reading channel labels

This commit implements the .read_label callback to allow userspace to
identify ADC channels via the device tree label property. The name field
in pm8xxx_chan_info is renamed to label, defaulting to the datasheet name.

> diff --git a/drivers/iio/adc/qcom-pm8xxx-xoadc.c b/drivers/iio/adc/qcom-p=
m8xxx-xoadc.c
> index 282a67b46a5eb..4a1a0cfb4699d 100644
> --- a/drivers/iio/adc/qcom-pm8xxx-xoadc.c
> +++ b/drivers/iio/adc/qcom-pm8xxx-xoadc.c

[ ... ]

> @@ -716,8 +716,21 @@ static int pm8xxx_fwnode_xlate(struct iio_dev *indio=
_dev,
>  	return -EINVAL;
>  }
> =20
> +static int pm8xxx_read_label(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan, char *label)
> +{
> +	struct pm8xxx_xoadc *adc =3D iio_priv(indio_dev);
> +	const struct pm8xxx_chan_info *ch;
> +
> +	ch =3D pm8xxx_get_channel(adc, chan->address);

Is amux_channel guaranteed to be a unique identifier?

Looking at the hardware definition array, multiple channels (like vcoin and
atest_8) use amux_channel =3D 0x00 and differ only in their pre_scale_mux
values.

Since pm8xxx_get_channel() only checks chan->address against
ch->hwchan->amux_channel:

pm8xxx_get_channel() {
    ...
    for (i =3D 0; i < adc->nchans; i++) {
        struct pm8xxx_chan_info *ch =3D &adc->chans[i];
        if (ch->hwchan->amux_channel =3D=3D chan)
            return ch;
    }
    ...
}

Could this return the first matching channel instead of the correct one if
multiple overlapping channels are configured, causing this new callback to
return incorrect labels?

This also appears to be a pre-existing issue in pm8xxx_read_raw() which
might configure the multiplexer incorrectly and read the wrong hardware
voltages.

Since adc->chans and adc->iio_chans are allocated together, could the
correct channel be resolved using pointer arithmetic, such as
&adc->chans[chan - adc->iio_chans]?

> +	if (!ch)
> +		return -EINVAL;
> +	return sysfs_emit(label, "%s\n", ch->label);
> +}
> +
>  static const struct iio_info pm8xxx_xoadc_info =3D {

While reviewing this driver, I also noticed a pre-existing race condition in
pm8xxx_xoadc_probe().

Does calling iio_device_register() before pm8xxx_calibrate_device() expose
the IIO sysfs attributes to userspace too early?

If userspace reads a processed channel value concurrently, pm8xxx_read_raw()
will invoke qcom_vadc_scale().

Since adc->graph is allocated via devm_iio_device_alloc() and hasn't been
populated by the calibration routine yet, calib_graph->dy will be 0.

Could this result in a divide-by-zero panic in qcom_vadc_scale_calib()
when computing div64_s64(*scale_voltage, calib_graph->dy)?

Should iio_device_register() be moved to the end of the probe function,
after all hardware initialization and calibration are complete?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-pm8xxx-xoa=
dc-label-v6-0-49700fd03005@smankusors.com?part=3D4
