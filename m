Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4335674F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439506; cv=none; b=ZU5MU8t3MZrAlzSfXrr7npBmBRPa8GPO74BvYmR7LtqRGtuWG8+vbMsQoWGFF67O59L3x376cqe2HFzdi8KIruiQjnpUDHB8AC7+ja2GPE1fGIhH/FBajuqUSaiCpN/Itr0U6bOB5tf46Ytoz9JIUoU9o+dQ1n2rYi04lkT97OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439506; c=relaxed/simple;
	bh=QFn6RRh+4bw3PweY88Vbhp/CzHphVZOghhltBCzKp9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A++1g6c99yo8uSjC/QkF7rckf1SXhAes9TcLZXNz3ueHEhmqiVKkbwKrLQFhf7Q04euDiz7X9Lwk1jaa/QkEZft33YK8MYVuPlFjfNApcrTxIKT0EpjaYkulhlqz+2cG+KcJKSH2RYzc/2vwPBuea02TQMKmAl3pKWjVE3p/7UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZXHlGHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZXHlGHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148D61F000E9;
	Tue,  7 Jul 2026 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783439505;
	bh=S5crrjAiDasGswweUZPIsXmE/808cFoDBUhuXJH7cRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QZXHlGHToIRkQmUEICzov9bYeYJFkmxmPSZi0KMPFG6mtmdmG5RJDAgT6dcuucVkA
	 /HOSUq0qDd9m34oVn1h1cCJ4jRcPjPm68YfWBmxv3XIlY+Fosjecge6dCNE3rQ5JNh
	 XJCOPQuiEnHNhfH0d2moCZhjnjzLQSHOOk7NOsa/F2DFh8Bjm5kp1sMlAz5Qm5Buzn
	 D0+ghIid64lFtlff1lHF/Oi6k/e8obxNkkbhgqrO17gacMwbyu5Vs7jJnNy32nB12X
	 RtVFK/NZ37CVEd90Al1aq9qp/Xm9jlTdWb0PJlpD55Hnjkcb95GJuML7+Jctu1hy6J
	 /RvI1zmGQSPiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/17] iio: frequency: ad9910: add RAM mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260707-ad9910-iio-driver-v7-13-a4ec30f63700@analog.com>
References: <20260707-ad9910-iio-driver-v7-0-a4ec30f63700@analog.com>
 <20260707-ad9910-iio-driver-v7-13-a4ec30f63700@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 15:51:44 +0000
Message-Id: <20260707155145.148D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Flawed error rollback logic during RAM mode toggle causes permanen=
t driver and hardware state desynchronization.
- [High] The `st->ram_fwu_cancel` flag is never cleared if `ad9910_ram_fwu_=
prepare()` returns an error, permanently bricking firmware uploads.
--

--- Patch [13]: [PATCH v7 13/17] iio: frequency: ad9910: add RAM mode suppo=
rt ---
commit 5060a2af896ab0dd152be5844e3fd333ab0f85e8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add RAM mode support

This commit adds RAM mode support to the AD9910 driver. It introduces
a RAM control channel for firmware upload, per-profile configuration,
and modifies read/write paths to handle RAM enablement.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index a37e3dab105bb..f6550cc9717e0 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
> @@ -1121,6 +1222,41 @@ static int ad9910_write_raw(struct iio_dev *indio_=
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

[Severity: High]
If the hardware write fails, this rollback loop only restores the software
cache. Should it also call ad9910_reg64_write() to revert the hardware
shadow registers that were successfully written prior to the failure?
Without it, the hardware might commit partially written profile data on the
next IO update.

> +				return ret;
> +			}
> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);

[Severity: High]
If this final register update fails, the function returns immediately.
Does this leave the profiles permanently swapped in both software and
hardware without rolling back to their original state?

[ ... ]

> @@ -1401,6 +1572,137 @@ static int ad9910_read_label(struct iio_dev *indi=
o_dev,
> +static enum fw_upload_err ad9910_ram_fwu_prepare(struct fw_upload *fw_up=
load,
> +						 const u8 *data, u32 size)
> +{
> +	struct ad9910_state *st =3D fw_upload->dd_handle;
[ ... ]
> +	guard(mutex)(&st->lock);
> +	if (st->ram_fwu_cancel)
> +		return FW_UPLOAD_ERR_CANCELED;

[Severity: High]
If an upload is cancelled and the framework sets st->ram_fwu_cancel =3D tru=
e,
this prepare callback returns FW_UPLOAD_ERR_CANCELED.

Since fw_upload_main() in the firmware upload core explicitly bypasses
the cleanup() callback when prepare() fails, is st->ram_fwu_cancel
ever reset to false?

Could this leave the firmware upload permanently blocked until the
module is reloaded?

> +
> +	return FW_UPLOAD_ERR_NONE;
> +}

[ ... ]

> +static void ad9910_ram_fwu_cleanup(struct fw_upload *fw_upload)
> +{
> +	struct ad9910_state *st =3D fw_upload->dd_handle;
> +
> +	guard(mutex)(&st->lock);
> +	st->ram_fwu_cancel =3D false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-ad9910-iio=
-driver-v7-0-a4ec30f63700@analog.com?part=3D13
