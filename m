Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22114242910
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035063; cv=none; b=GDZSwG36uJPcfAMGlcZCL9Fg5BMSgQFBcyHUTIbkhHyFgyVMkXD9o+IFkD58EzfpnZetPyZELCMqUtZSDVdswvq7UHyYTgwCCEZk3I44bcxoBdJFJXVKD0YvdM2X9j9VlWwH/MhwgOvGkeFROSuJdXGIyM91rKNm24cKWKX3bA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035063; c=relaxed/simple;
	bh=92TlxTjOvGDl5530tHJsDGYIFb8Nin/VxmBlfB3q8hk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k2YMgLcDJL+I0wUOndnu6GVEPWA6SSfJlWouPTMe9Zw7J4XHm/BlxLvTZJc/58ZMhe4F7nbDpR91prcTApC++x4Rz12KxCTGybnhKHFeEGmfP92vsNyp3xox2zfZH297aVusz94e5ocM38t2xWWPlXPchB+wajseUKCFxQZ0s1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOJw0vDH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOJw0vDH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA01F000E9;
	Tue, 14 Jul 2026 13:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035060;
	bh=ItEY/YvELYMkjQgF2MOIgrVSB6nYbDJfbPrySHR6Jtc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOJw0vDHIkoIhyJ+4STavQtBkObITK15fjL3T/M0tXbmi1Y97GGosTmNpXfw/BHnw
	 06mqASl8RCEfuyHsXKizbXxRLVjs8ezka7Ayl7LrPbCcm05ddRejLh0PzyIAgD1vgL
	 5hnU6zNRyHNXKxtWm1Tzz0WIN2d3rTrif9zgCsPDUEKbugeEfvvFUsxRG1vBXQ4enX
	 tll5a9h+a/L0Umn9QDFnzWm1cyjWnAyW8pevdTMArZmnqbkmuIWWJTbngxkgPyGMbO
	 eBTfvqxy6QPlRS1eKk9f4UwYLTaxx5RCkgoSsArBInimwd/VNuOQw2klf8O1AvBBEK
	 Qc3HDlWJkoQFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/17] iio: frequency: ad9910: add RAM mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714-ad9910-iio-driver-v8-13-36939c3c07d2@analog.com>
References: <20260714-ad9910-iio-driver-v8-0-36939c3c07d2@analog.com>
 <20260714-ad9910-iio-driver-v8-13-36939c3c07d2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:17:39 +0000
Message-Id: <20260714131740.2FCA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware and software state become desynchronized on RAM mode togg=
le error path.
- [High] Missing software rollback when AD9910_REG_CFR1 update fails leaves=
 profile caches permanently swapped.
- [High] Permanent loss of the active Single Tone profile configuration in =
software cache on restore failure.
- [High] Use-After-Free of devm-allocated state structure due to firmware_u=
pload framework race.
- [Medium] Leaked fw_upload cancel flag spuriously fails the subsequent fir=
mware upload attempt.
--

--- Patch [13]: [PATCH v8 13/17] iio: frequency: ad9910: add RAM mode suppo=
rt ---
commit 6281373642ceab0e3003ac2ca392ef5cedd2bacf
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: add RAM mode support

This commit adds RAM control channel support for the AD9910 DDS. It introdu=
ces
a firmware upload interface for RAM data loading and handles per-profile
configuration. The patch also modifies read/write paths to redirect single-=
tone
parameters to a shadow register cache when RAM is active.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 6c794e1b4b1c8..fef0e3b360a7d 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> @@ -1119,7 +1220,7 @@ static int ad9910_write_raw(struct iio_dev *indio_d=
ev,
>  	struct ad9910_state *st =3D iio_priv(indio_dev);
>  	u64 tmp64;
>  	u32 tmp32;
> -	int ret;
> +	int ret, i;
> =20
>  	guard(mutex)(&st->lock);
[ ... ]
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
Does this recovery loop leave the hardware and software states desynchroniz=
ed?

If an SPI write fails during the profile swap loop, this block reverts the
software cache but does not rewrite the hardware shadow registers over SPI.

Because the hardware shadow registers retain the swapped values, the next
IO_UPDATE triggered by any other channel write will latch these corrupted
values into the active profile.

> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);

[Severity: High]
If this final register update fails, is it problematic that the function
returns without reverting the profile swap?

By the time this is called, all 8 profiles have already been swapped in
both hardware and software. Returning the error here leaves the profiles
permanently swapped while the RAM mode state remains unchanged, which
appears to break subsequent single-tone and RAM operations.

[ ... ]
> +static enum fw_upload_err ad9910_ram_fwu_prepare(struct fw_upload *fw_up=
load,
> +						 const u8 *data, u32 size)
> +{
> +	struct ad9910_state *st =3D fw_upload->dd_handle;
> +	const struct ad9910_ram_fw *fw_data =3D (const struct ad9910_ram_fw *)d=
ata;
> +	size_t wcount, bcount;
[ ... ]
> +	guard(mutex)(&st->lock);
> +	if (st->ram_fwu_cancel) {
> +		st->ram_fwu_cancel =3D false;
> +		return FW_UPLOAD_ERR_CANCELED;
> +	}
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}

[Severity: Medium]
Can a canceled firmware upload spuriously fail a subsequent upload attempt?

If an upload is canceled after the write operation finishes, or during an
indivisible SPI write, st->ram_fwu_cancel is set to true in
ad9910_ram_fwu_cancel(). The driver does not implement an ops->cleanup
callback to reset this state when the upload session ends.

When a new upload begins, ad9910_ram_fwu_prepare() will find this stale
flag, clear it, and unconditionally return FW_UPLOAD_ERR_CANCELED, causing
the new upload to fail before it starts.

[ ... ]
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
[ ... ]
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
> +
> +	/* write ram data and restore profile register */
> +	ret =3D ad9910_spi_write(st, AD9910_REG_RAM,
> +			       wcount * AD9910_RAM_WORD_SIZE, false);
> +	ret2 =3D ad9910_reg64_write(st, AD9910_REG_PROFILE(st->profile), backup=
, true);
> +	if (ret || ret2)
> +		return FW_UPLOAD_ERR_RW_ERROR;

[Severity: High]
Can this error path permanently lose the active Single Tone profile
configuration in the software cache?

The active profile's configuration is backed up and replaced with RAM
address boundaries earlier in this function. If the final
ad9910_reg64_write() to restore the backup fails, it returns early.

Because ad9910_reg64_write() only updates the software cache st->reg[] on
success, the software cache appears to be permanently left with the RAM
boundary payload where the frequency, phase, and amplitude bits are zeroed,
wiping the actual Single Tone configuration.

[ ... ]
> @@ -1663,6 +1967,19 @@ static int ad9910_probe(struct spi_device *spi)
[ ... ]
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
>  	return devm_iio_device_register(dev, indio_dev);
>  }

[Severity: High]
Does tying the firmware upload unregistration to devres expose the driver
to a use-after-free race?

There is a known race condition in the core firmware_upload_unregister()
framework: if it observes the IDLE state while a concurrent sysfs write to
loading is about to queue the worker, it returns immediately without
flushing the workqueue.

If the driver unbinds, devres will free the ad9910_state structure. The
delayed worker could then subsequently execute ad9910_ram_fwu_prepare(),
dereferencing the freed state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-ad9910-iio=
-driver-v8-0-36939c3c07d2@analog.com?part=3D13
