Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D82E975E
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779045544; cv=none; b=Mde+NlDL/+LzHXvIl3zrMIi9Z8OXn67MA6HA5iMjMoUgEqtetiSowLPm44Wb53aWkcSzjUgGxnZNzdPWlJ52t/vPZ7aK3zHi8soCMy2UK/4W7CCBsKIvtsfHeCtouAIY1ExgS4Pf0ubRG8AX616qxoce7L9M3usAQgoSlNc89GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779045544; c=relaxed/simple;
	bh=QAP930bHgohQmEUx/z2Sozwj1fZBT/04e/zV0xsrN+w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ipGCBXpjdTdbE2qdZUhyUE7WjHNFsJxEFZniXY02EkESSqaPakhLOx6UTIEbdgNYUOJEIEFueWx9CDh4m1BLD4+/y6XwCyFLcx82qi1zlPrO88WKJuLUnc2AuDfP3pmDU3IJPldXye1xlLeJpbjxvx4FQRM6DmFHkdmK1uk9i98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QV/+1ycl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QV/+1ycl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B4C2BCB0;
	Sun, 17 May 2026 19:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779045544;
	bh=QAP930bHgohQmEUx/z2Sozwj1fZBT/04e/zV0xsrN+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QV/+1ycl5ovUzZmpepHHP920SnzXmFCwEbvUQfPskyG71432EYkZyNVuyG0QKd6mA
	 Yi6aP2LshYtysCotqwj3GGsFNtbtq7yvw0BOdegsI36IQzTfJ7Tdor/KISokaZdmVs
	 2iVBtqR3fs7+XI6WKJXqi5I4W0KD45xt/eobhrhoWJU+gGU+2d4FiJr8HShsTLh6k9
	 xJgYMEa3N6H6DqEzM6IwZOB6UrWZB+OFClxSputWr2rP22L7qC+8SHwoEssaAasLZR
	 GG39qVoWPfZG8lRaKaVacRFqjNlmisHJR0gpfU8Bmr2SYoL3WStF9LJx8lXg5MqZK7
	 jgi/9/euKCAEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/13] iio: frequency: ad9910: add RAM mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260517-ad9910-iio-driver-v5-9-31599c88314a@analog.com>
References: <20260517-ad9910-iio-driver-v5-9-31599c88314a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 19:19:03 +0000
Message-Id: <20260517191903.D95B4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Incomplete hardware rollback during a profile swap failure leaves =
AD9910 shadow registers corrupted.
- [High] Missing software cache and hardware rollback when CFR1 register up=
date fails.
- [High] Unprotected software profile cache corruption on firmware upload f=
ailure.
- [High] Firmware upload `.write` callback fails on chunked payloads and pe=
rforms out-of-bounds memory reads.
- [Medium] The RAM firmware upload sysfs node and debugfs symlinks are regi=
stered with a `(null)` name.
--

commit 3876f09fc86743085e5099fea5762c34dc150ecf
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add RAM mode support

Add RAM control channel, which includes RAM data loading via firmware
upload interface, per-profile configuration, profile switching,
sampling frequency control, and ram-enable-aware read/write paths.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 4ad80475139d7..86ed350011cff 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -1202,6 +1306,41 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  			return ad9910_reg32_update(st, AD9910_REG_CFR2,
>  						   AD9910_CFR2_DRG_ENABLE_MSK,
>  						   tmp32, true);
> +		case AD9910_CHANNEL_RAM:
> +			if (AD9910_RAM_ENABLED(st) =3D=3D !!val)
> +				return 0;
> +
> +			/* swap profile configs */
> +			for (i =3D 0; i < AD9910_NUM_PROFILES; i++) {
> +				tmp64 =3D st->reg[AD9910_REG_PROFILE(i)].val64;
> +				ret =3D ad9910_reg64_write(st,
> +							 AD9910_REG_PROFILE(i),
> +							 st->reg_profile[i],
> +							 false);
> +				if (ret)
> +					break;
> +				st->reg_profile[i] =3D tmp64;
> +			}
> +
> +			if (ret) {
> +				/*
> +				 * After the write failure, profiles 0..i-1 were
> +				 * already swapped in SW, but Hw registers are
> +				 * still pending an IO update, so swap them back
> +				 * in SW to keep the state consistent.
> +				 */
> +				while (i--) {
> +					tmp64 =3D st->reg[AD9910_REG_PROFILE(i)].val64;
> +					st->reg[AD9910_REG_PROFILE(i)].val64 =3D st->reg_profile[i];
> +					st->reg_profile[i] =3D tmp64;
> +				}
> +				return ret;

If a write fails mid-loop, this rollback block restores the software cache
but doesn't issue SPI writes to revert the hardware shadow registers.
Could the next successful SPI write with an IO_UPDATE pulse inadvertently
latch these corrupted, partially-swapped profiles into the active hardware
state?

> +			}
> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);

If ad9910_reg32_update() fails here, the function returns immediately witho=
ut
reverting the swapped profiles. Should there be a rollback of the swapped
profiles in this error path to prevent the device from operating with corru=
pted
synthesizer parameters?

>  		default:
>  			return -EINVAL;
>  		}

[ ... ]

> @@ -1475,6 +1657,126 @@ static int ad9910_read_label(struct iio_dev *indi=
o_dev,
> +static enum fw_upload_err ad9910_ram_fwu_write(struct fw_upload *fw_uplo=
ad,
> +					       const u8 *data, u32 offset,
> +					       u32 size, u32 *written)
> +{
> +	const struct ad9910_ram_fw *fw_data =3D (const struct ad9910_ram_fw *)d=
ata;
> +	struct ad9910_state *st =3D fw_upload->dd_handle;
> +	int ret, ret2, idx, wcount;
> +	u64 tmp64, backup;
> +
> +	if (offset !=3D 0)
> +		return FW_UPLOAD_ERR_INVALID_SIZE;

The sysfs firmware upload framework chunks data into blocks bounded by
PAGE_SIZE (typically 4096 bytes). Since the maximum AD9910 firmware size
can be 4176 bytes, this driver will reject any chunks after the first.
Can this be adjusted to support firmware files larger than PAGE_SIZE?

> +
> +	guard(mutex)(&st->lock);
> +
> +	if (st->ram_fwu_cancel)
> +		return FW_UPLOAD_ERR_CANCELED;
> +
> +	if (AD9910_RAM_ENABLED(st))
> +		return FW_UPLOAD_ERR_HW_ERROR;
> +
> +	for (idx =3D 0; idx < AD9910_NUM_PROFILES; idx++)
> +		st->reg_profile[idx] =3D get_unaligned_be64(&fw_data->profiles[idx]) |
> +				       AD9910_PROFILE_RAM_OPEN_MSK;

Here the software cache st->reg_profile[] is overwritten before the SPI
hardware operations. If any subsequent hardware writes fail, the function
aborts and the cache is left with partially uploaded profiles.
Could the original cache be backed up and restored on failure?

> +
> +	ret =3D ad9910_reg32_update(st, AD9910_REG_CFR1,
> +				  AD9910_CFR1_RAM_PLAYBACK_DEST_MSK |
> +				  AD9910_CFR1_INT_PROFILE_CTL_MSK,
> +				  get_unaligned_be32(&fw_data->cfr1), true);
> +	if (ret)
> +		return FW_UPLOAD_ERR_RW_ERROR;
> +
> +	wcount =3D get_unaligned_be16(&fw_data->wcount);
> +	if (!wcount) {
> +		*written =3D size;
> +		return FW_UPLOAD_ERR_NONE; /* nothing else to write */
> +	}
> +
> +	ret =3D ad9910_profile_set(st, st->profile);
> +	if (ret)
> +		return FW_UPLOAD_ERR_HW_ERROR;
> +
> +	/* backup profile register and update it with required address range */
> +	backup =3D st->reg[AD9910_REG_PROFILE(st->profile)].val64;
> +	tmp64 =3D AD9910_PROFILE_RAM_STEP_RATE_MSK |
> +		FIELD_PREP(AD9910_PROFILE_RAM_START_ADDR_MSK, 0) |
> +		FIELD_PREP(AD9910_PROFILE_RAM_END_ADDR_MSK, wcount - 1);
> +	ret =3D ad9910_reg64_write(st, AD9910_REG_PROFILE(st->profile), tmp64, =
true);
> +	if (ret)
> +		return FW_UPLOAD_ERR_RW_ERROR;
> +
> +	memcpy(&st->tx_buf[1], fw_data->words, wcount * AD9910_RAM_WORD_SIZE);

If the firmware is larger than PAGE_SIZE, size will be 4096 on the first
call, but wcount could request more bytes than are present in the chunk.
Does this memcpy() risk reading out-of-bounds memory from the data buffer?

[ ... ]

> @@ -1688,7 +2014,25 @@ static int ad9910_probe(struct spi_device *spi)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "device setup failed\n");
> =20
> -	return devm_iio_device_register(dev, indio_dev);
> +	snprintf(st->ram_fwu_name, sizeof(st->ram_fwu_name), "%s:ram",
> +		 dev_name(&indio_dev->dev));

The IIO core does not assign the device name to indio_dev->dev until
devm_iio_device_register() is called. Will dev_name() return "(null)" here,
resulting in sysfs nodes named "/sys/class/firmware/(null):ram"?
This might also cause probe failures due to sysfs name collisions if multip=
le
AD9910 devices are present on the system.

> +	st->ram_fwu =3D firmware_upload_register(THIS_MODULE, dev, st->ram_fwu_=
name,
> +					       &ad9910_ram_fwu_ops, st);
> +	if (IS_ERR(st->ram_fwu))
> +		return dev_err_probe(dev, PTR_ERR(st->ram_fwu),
> +				     "failed to register ram upload ops\n");
> +
> +	ret =3D devm_add_action_or_reset(dev, ad9910_ram_fwu_unregister, st->ra=
m_fwu);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add ram upload unregister action\n");
> +
> +	ret =3D devm_iio_device_register(dev, indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	ad9910_debugfs_init(st, indio_dev);
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-ad9910-iio=
-driver-v5-0-31599c88314a@analog.com?part=3D9
