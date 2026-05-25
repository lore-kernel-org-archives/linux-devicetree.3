Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F930BB80
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708573; cv=none; b=aJ03SbIapSo/HscHJFLDI/FL8nmLvZBfnB+K1pz8PO8TQpG4kkBH1LH/AYPL3is6N3JQnDO9sl2WOZptmWMvLnuuwZ1xvlZCKiAsBm9Yv08hWkYr8/YQvZ0ck5mlNCXiGTPR4UmJqEAx5D7o2DTTrXHqyGQtSD6o5U8yYuvhOPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708573; c=relaxed/simple;
	bh=wrYJxQMq6ykx+v1o9c9dsEkUGOXLmkfljd7O7+sLPGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E0QpZurL1DhUDipzC1ZvEAzJuB+GtmF6JZ2vS+xBzaIPWZMC3ifrSq5YYid0DNHRghhEGGu43ZRTUx/DlIl6QaAqq+E/qLZoRZhQ0mMSbGSyMjl9FAQGtOUedY8REmvOSKAftpDuaBL3RNlizKU+eyAOLMsNXtc/EabStEaVeAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkbRwj7u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkbRwj7u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C9E1F000E9;
	Mon, 25 May 2026 11:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708571;
	bh=emPihVss1/+FVEbgsP2//R6trd+KLO84SrxhsQTC5XM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BkbRwj7uxyqHhJTBG2GlGSmGRs7wRd+WHASAm6NjmReSI7Ukw/ZHhb/vF9uRTrrO4
	 e5sOSH/ByRtrzy3He7UxXlxFLkS5e0yYZ/TCAsb9U0/i0lri8je+wUoUYp4ykGI/sl
	 o75m5G14USm0YY1d/iRO7WfUxcUOiOgi7jsLbR2hBfP7dxL15+aOCdcEuJEmXuVTzc
	 K1UDtUPRWdndhhWxUgw79as2628/c6qrasa8TDeQWb0whC1ajjZMMVoby64ynE4fx6
	 2fhwwtLh9yJwyoQdi94ASo89sPNacpDsJVourz64bN1S1mCoDSoKuiv8qeqkpzUKoi
	 ld1eCUmodoxIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 3/6] iio: adc: ad4691: add triggered buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525-ad4692-multichannel-sar-adc-driver-v13-3-1b7626d3b35c@analog.com>
References: <20260525-ad4692-multichannel-sar-adc-driver-v13-3-1b7626d3b35c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:29:30 +0000
Message-Id: <20260525112931.27C9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The buffer preenable functions do not skip the software timest=
amp channel, leading to array out-of-bounds accesses and invalid SPI comman=
ds.
- [High] The IIO trigger reference count is leaked if initialization fails =
in `ad4691_setup_triggered_buffer`.
--

commit 030fa811287ec8a74c7c84847a685dd970c6fda2
Author: Radu Sabau <radu.sabau@analog.com>

iio: adc: ad4691: add triggered buffer support

This commit adds buffered capture support for the AD4691 family using
the IIO triggered buffer framework. It implements both CNV burst mode
and manual mode for pipeline reading.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
[ ... ]
> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int k, i;
> +	int ret;
> +
> +	memset(st->scan_xfers, 0, sizeof(st->scan_xfers));
> +	memset(st->scan_tx, 0, sizeof(st->scan_tx));
> +
> +	spi_message_init(&st->scan_msg);
> +
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {

[Severity: Critical]
Does this loop correctly skip the software timestamp channel?

The iio_for_each_active_channel() macro iterates over all enabled channels,
including the soft timestamp channel (index 16 for AD4691). If all 16
physical channels and the timestamp channel are active, the loop will
execute 17 times.

In this case, k will reach 16, and the final NOOP transfer appended after
the loop will attempt to write to st->scan_tx[17] and st->scan_xfers[17],
which exceeds the allocation sizes of those arrays. Could this cause memory
corruption and malformed SPI messages?

[ ... ]
> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
[ ... ]
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		put_unaligned_be16(0x8000 | AD4691_AVG_IN(i), &st->scan_tx[k]);
> +		st->scan_xfers[2 * k].tx_buf =3D &st->scan_tx[k];

[Severity: Critical]
Does this loop also need to skip the timestamp channel?

Similar to manual mode above, if all 16 physical channels and the timestamp
channel are enabled, k will increment to 17. Because each AVG_IN read takes
two transfers, the appended 4-byte state-reset transfer after the loop will
attempt to write to st->scan_xfers[34], which is past the end of the
34-element array.

[ ... ]
> +static int ad4691_setup_triggered_buffer(struct iio_dev *indio_dev,
> +					 struct ad4691_state *st)
> +{
[ ... ]
> +	indio_dev->trig =3D iio_trigger_get(trig);
> +
> +	/*
> +	 * The GP pin named in interrupt-names asserts at end-of-conversion.
> +	 * The IRQ handler fires the IIO trigger so the trigger handler can
> +	 * read and push the sample to the buffer. The IRQ is kept disabled
> +	 * until the buffer is enabled.
> +	 */
> +	irq =3D -ENXIO;
> +	for (i =3D 0; i < ARRAY_SIZE(ad4691_gp_names); i++) {
> +		irq =3D fwnode_irq_get_byname(dev_fwnode(dev),
> +					    ad4691_gp_names[i]);
> +		if (irq > 0 || irq =3D=3D -EPROBE_DEFER)
> +			break;
> +	}
> +	if (irq < 0)
> +		return dev_err_probe(dev, irq, "failed to get GP interrupt\n");

[Severity: High]
If fwnode_irq_get_byname() or devm_request_irq() fails, does this leak the
IIO trigger reference?

The iio_trigger_get() call increments the trigger device's reference count.
During cleanup, the IIO core via iio_dev_release() will only call
iio_device_unregister_trigger_consumer() to perform the matching
iio_trigger_put() if the INDIO_ALL_TRIGGERED_MODES flag is set in
indio_dev->modes.

Because INDIO_BUFFER_TRIGGERED is only added to the modes inside
devm_iio_triggered_buffer_setup_ext() later in this function, an error
return here leaves modes as INDIO_DIRECT_MODE. Will the trigger be
permanently leaked preventing the module from being unloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-ad4692-mul=
tichannel-sar-adc-driver-v13-0-1b7626d3b35c@analog.com?part=3D3
