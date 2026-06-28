Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B93A9DBA
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782657028; cv=none; b=cgoIOA+qZkB0zGJb+lo4ZDSNP4RLUa7WFXKthwOQwCyLpWxIbD6BPIwn4OfYzZpabqK5tGSxaqtrf0jMJkoMby4IEM/MUEW9DsoIsylB3K8pt68KKqkLtK4S/ttgD653LcnLibUvvKgJfef2ZrKrqrdVC0cJn9agD5Pj7Lomay4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782657028; c=relaxed/simple;
	bh=1+3/PqIYN9PCYVUV4bkaySoTEecwKL1vEkjb4FOu4TE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b2BRa6MUPc4td63k+ovLRBsgIDCunI0DUKm9Td6RKneED8B8GkO04UM6aL+ykI9mj7vJg8JEuvZmehXnOKSKIQkRlgY1/DxLGapUTyTe7AZTcX7cIAPRznSiTu1BoNDIMempq7ciq4AEkP/1dulP2cW/57PxZL6lSrGbSWRk2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF7Z/d1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF7Z/d1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6CA1F000E9;
	Sun, 28 Jun 2026 14:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782657027;
	bh=KO3EzQ0dSBeD0XLj/1xtT8/4SukBDybUWfPSZTkzf6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dF7Z/d1h8ZlMS/pAx6/19x9kOtooAThw6GtCmdWr/5CV7lSxTY1zkromSDwNnSF7B
	 UY28UPaOJ3VIcP2pHEFlnwrw0fNcUvMUOMrnMgo019n3mgs3AxFaTA1WyIW+xxuvQG
	 r69JoBuV8tZ5v4PCLhn3BcU4wZ+3EW17DjmXEf3mhsAGAIIx9lUofPZG/1VvfDKIES
	 b3LXFS1M7vj6YWEtF7IyTW/xkey74p3O4glHkaPaQ62TQndDJN8LFhGSdmeo9r2xxM
	 muXNYFT+c0d9pnqgsdnrjPVvD/sz1ixBF0gUmP6BtzlSYnjaOGZCCKzKMvXDnh6F1t
	 5j/s9wYY7K0ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] iio: dac: ad5686: add triggered buffer support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628-ad5686-new-features-v5-11-577caadbf7c0@analog.com>
References: <20260628-ad5686-new-features-v5-0-577caadbf7c0@analog.com>
 <20260628-ad5686-new-features-v5-11-577caadbf7c0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 14:30:26 +0000
Message-Id: <20260628143026.EC6CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing data masking in triggered buffer handler allows userspace =
to corrupt SPI commands for AD5310_REGMAP devices.
--

commit 2caa0f8a9fedc3f66e7b64f897087b47952a9915
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: add triggered buffer support

Implement trigger handler by leveraging the LDAC gpio to update all DAC
channels at once when it is available. Also, the multiple channel writes
can be flushed at once with the sync() operation.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c

[ ... ]

> @@ -467,6 +472,60 @@ const struct ad5686_chip_info ad5679r_chip_info =3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(ad5679r_chip_info, "IIO_AD5686");
> =20
> +static void do_ad5686_trigger_handler(struct iio_dev *indio_dev)
> +{
> +	struct iio_buffer *buffer =3D indio_dev->buffer;
> +	struct ad5686_state *st =3D iio_priv(indio_dev);
> +	u16 val[AD5686_MAX_CHANNELS] =3D { };
> +	unsigned int scan_count, ch, i;
> +	bool async_update;
> +	u8 cmd;
> +
> +	if (iio_pop_from_buffer(buffer, val))
> +		return;
> +
> +	guard(mutex)(&st->lock);
> +
> +	scan_count =3D bitmap_weight(indio_dev->active_scan_mask,
> +				   iio_get_masklength(indio_dev));
> +	async_update =3D st->ldac_gpio && scan_count > 1;
> +	if (async_update) {
> +		/* use LDAC to update all channels simultaneously */
> +		cmd =3D AD5686_CMD_WRITE_INPUT_N;
> +		gpiod_set_value_cansleep(st->ldac_gpio, 0);
> +	} else {
> +		cmd =3D AD5686_CMD_WRITE_INPUT_N_UPDATE_N;
> +	}
> +
> +	i =3D 0;
> +	iio_for_each_active_channel(indio_dev, ch) {
> +		if (st->ops->write(st, cmd, indio_dev->channels[ch].address, val[i++]))

[Severity: High]
Does this code need to mask the value popped from the buffer before
passing it to the write operation?

If userspace provides 16-bit data with bits 12-15 set, it appears it can
corrupt the SPI commands for AD5310_REGMAP devices. For example, looking at
ad5686_spi_write():

drivers/iio/dac/ad5686-spi.c:ad5686_spi_write() {
    ...
    case AD5310_REGMAP:
        st->data[bus_data->size].d16 =3D
            cpu_to_be16(AD5310_CMD(cmd) | val);
    ...
}

Since the command is shifted to bits 12-15, an unmasked user value from the
triggered buffer could overwrite the SPI command.

> +			break;
> +	}
> +
> +	/*
> +	 * If sync() is available, it is called here regardless of write
> +	 * failure to allow bus implementation to reset. In that case, partial
> +	 * writes are unlikely as the write operations would just queue up
> +	 * the transfers.
> +	 */
> +	if (st->ops->sync)
> +		st->ops->sync(st);
> +
> +	if (async_update)
> +		gpiod_set_value_cansleep(st->ldac_gpio, 1);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-ad5686-new=
-features-v5-0-577caadbf7c0@analog.com?part=3D11
