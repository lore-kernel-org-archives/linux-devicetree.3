Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA73440A23
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738705; cv=none; b=XHVXck64nR2sKrYuxo0pzFyk1A1VS3da6bv3MwD5g/KQ4SSN2PxkGjRVun7zl1BU9T06Csr+DiRGP3ftDjYG4jI6zr802MMBNiou+ueyAo+CaIwxxQjJMcBP0P/WBZ9H6tZqx4x2RepNZjDstuZzoj4JTnRfbvRGDld2tM0vw3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738705; c=relaxed/simple;
	bh=4f/LuWMlzUxZ2LbYcd1UnECENJn6YOggQsoA8X8ePd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T1uEYySsFs907Nlrbeu2CGn5mMtYXcmnrGOsV5Geksq+TA4Han9k9HzF0k6lOQxrtELT2QGahKs3QD5KOJ/MNNym/VlCGs1qjULjFFRbk/PshzegZ06edcwA/jLNcp5cdISTChzJneanClBObU/7E0yXcBEGV/NmnIISznAJuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwD7Egj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwD7Egj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12EF1F000E9;
	Wed, 22 Jul 2026 16:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738697;
	bh=YQMoSu1SskffqreHDUQsv/H5tiN62wgbCqUeztopKnM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cwD7Egj5R7TZmk21lxVJmhCAY6i7sO1w391CVK4nTXCRKnOWci5g2qMh5/nmgY3eJ
	 kyIUdVucnSpkEZymc9xXUUfAew8nfkqyWLZviDvXMrYxe/waGxPtKvZ1itiYBcnndI
	 t05EdO1Bds7sBOnshj9ExDdU4QYxv6lcCOcySzhee3+gXY/IMsNRgJ46gwWOP35kCb
	 nIqAWXCZ8FfBiZ5QD2p/LjVsJh983OhM4CCVuR+qImnhh96q+c0FDNraQMI8BagR1L
	 W84J6Cxl2p7bdjNqee6OHKKCzrxMWa9PKsG9kKz1BSUVXbz8vA388e6vVGjg90im8x
	 AeJzImffkKr3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 13/17] iio: frequency: ad9910: add RAM mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722-ad9910-iio-driver-v9-13-459d1df5ac56@analog.com>
References: <20260722-ad9910-iio-driver-v9-0-459d1df5ac56@analog.com>
 <20260722-ad9910-iio-driver-v9-13-459d1df5ac56@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 16:44:56 +0000
Message-Id: <20260722164456.B12EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Failure to rollback hardware shadow registers and software cache o=
n error paths leaves DDS state permanently corrupted when toggling RAM mode.
- [Medium] The `st->ram_fwu_cancel` flag can be permanently leaked if an up=
load is cancelled concurrently while `ad9910_ram_fwu_prepare()` returns an =
early error.
- [Medium] The driver prematurely updates its software register cache befor=
e the hardware write succeeds during RAM firmware upload cleanup.
--

--- Patch [13]: [PATCH v9 13/17] iio: frequency: ad9910: add RAM mode suppo=
rt ---
commit 3693cd96a1750a5d9f949991dc4f3494e3cfae47
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add RAM mode support

This patch adds RAM control channel support to the AD9910 DDS driver. It
includes RAM data loading via the firmware upload interface, per-profile
configuration, and sampling frequency control. When RAM is enabled, the DDS
profile parameters are sourced from a shadow register cache.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 6c794e1b4b1c8..844cc0cc8f3eb 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -1156,6 +1257,41 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  						   AD9910_CFR2_DRG_DEST_MSK |
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
> +			}

[Severity: High]
Does this error path leave the hardware shadow registers out of sync with t=
he
software cache?

If ad9910_reg64_write() fails for a profile during ad9910_write_raw(), the
hardware shadow registers for previous profiles have already been modified,
but this fallback loop only reverts the software cache.

If an IO_UPDATE pulse is subsequently triggered by a different operation,
could it unintentionally apply the partially swapped configurations to the
hardware?

Also, if the profile swaps succeed but the CFR1 register update below fails,
neither the software nor hardware state seems to be rolled back.

> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);

[ ... ]

> @@ -1436,6 +1607,142 @@ static int ad9910_read_label(struct iio_dev *indi=
o_dev,
>  	return sysfs_emit(label, "%s\n", ad9910_channel_str[chan->address]);
>  }
> =20
> +static enum fw_upload_err ad9910_ram_fwu_prepare(struct fw_upload *fw_up=
load,
> +						 const u8 *data, u32 size)
> +{
> +	struct ad9910_state *st =3D fw_upload->dd_handle;
> +	const struct ad9910_ram_fw *fw_data =3D (const struct ad9910_ram_fw *)d=
ata;
> +	size_t wcount, bcount;
> +
> +	if (size < sizeof(struct ad9910_ram_fw))
> +		return FW_UPLOAD_ERR_INVALID_SIZE;
> +
> +	if (get_unaligned_be32(&fw_data->magic) !=3D AD9910_RAM_FW_MAGIC)
> +		return FW_UPLOAD_ERR_FW_INVALID;
> +
> +	if (get_unaligned_be16(&fw_data->version) !=3D AD9910_RAM_FW_V1)
> +		return FW_UPLOAD_ERR_FW_INVALID;
> +
> +	wcount =3D get_unaligned_be16(&fw_data->wcount);
> +	bcount =3D size - sizeof(struct ad9910_ram_fw);
> +	if (wcount > AD9910_RAM_SIZE_MAX_WORDS ||
> +	    bcount !=3D (wcount * AD9910_RAM_WORD_SIZE))
> +		return FW_UPLOAD_ERR_INVALID_SIZE;
> +
> +	bcount +=3D sizeof(fw_data->cfr1) + sizeof(fw_data->profiles);
> +	if (crc32(0, &fw_data->cfr1, bcount) !=3D get_unaligned_be32(&fw_data->=
crc))
> +		return FW_UPLOAD_ERR_FW_INVALID;

[Severity: Medium]
If a sysfs cancel operation occurs concurrently with firmware upload and se=
ts
st->ram_fwu_cancel to true, could one of these early validation checks
returning an error permanently leak the cancel flag?

The fw_upload framework does not call cleanup() if prepare() fails. If the
flag is not cleared on these early error paths in ad9910_ram_fwu_prepare(),
could it cause subsequent valid firmware uploads to be spuriously rejected?

> +
> +	guard(mutex)(&st->lock);
> +	if (st->ram_fwu_cancel) {
> +		/* cleanup() is not called when prepare fails */
> +		st->ram_fwu_cancel =3D false;
> +		return FW_UPLOAD_ERR_CANCELED;
> +	}
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static enum fw_upload_err ad9910_ram_fwu_write(struct fw_upload *fw_uplo=
ad,
> +					       const u8 *data, u32 offset,
> +					       u32 size, u32 *written)
> +{

[ ... ]

> +	/* restore active single tone profile regardless */
> +	st->reg[AD9910_REG_PROFILE(st->profile)].val64 =3D backup;
> +	ret2 =3D ad9910_reg64_write(st, AD9910_REG_PROFILE(st->profile), backup=
, true);
> +	if (ret || ret2)
> +		return FW_UPLOAD_ERR_RW_ERROR;

[Severity: Medium]
Does this unconditionally desynchronize the software cache if the hardware
write fails during ad9910_ram_fwu_write()?

By pre-assigning the software cache st->reg before checking if
ad9910_reg64_write() succeeds, a failed SPI transfer could leave the
hardware with the RAM upload configuration, while the software cache will
falsely indicate it has been restored to the backup state.

> +
> +	*written =3D size;
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad9910-iio=
-driver-v9-0-459d1df5ac56@analog.com?part=3D13
