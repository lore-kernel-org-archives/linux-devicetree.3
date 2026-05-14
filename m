Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766CA37F73E
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778745298; cv=none; b=EBe1ax9d0NOcNSiIG9/2uQ74061efiCfTXp7bzmaaZ8T4swQvl+DbxoV4Kz/qnKVZTzmwoQUrOvLwrbLQsSnH8R2Z+ga2omysYdYmnso4Y21YIAq+jZ7FaW+XPL6GRkBEcZX1lxn5hQwZT1Zo+aSK+RVYLNAzsmg0JJMOfyL5ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778745298; c=relaxed/simple;
	bh=5NONM8NBWljHxceP8Ndi0NgIXTWVPeluGqcaSxZXrFY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=so9uA6pb26xrXRz68stg/ZK3mXEt/iUJOHKrZToQBsGFsuXejtQ5ECWSysaezJ3TiCEeRr7xkDYmVMkyehcweu4uMMAm0YgLKTIu5QmFtB/DyyRUBPTPcaFyWGu8lQut69GrVTFa5TRe5zDMCdMcmVgTybIbWFJNGP/huDUEE6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kA7axzYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kA7axzYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6202C2BCB7;
	Thu, 14 May 2026 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778745298;
	bh=5NONM8NBWljHxceP8Ndi0NgIXTWVPeluGqcaSxZXrFY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kA7axzYkYuUjod8VrvuWJJUINT3JjzrYgCSuosCWtQv3pOs895hH5djTCoVgyRvTZ
	 y6aOBKoAraK0Ufn2WUvYvXOSGi2wtPGg9vP8AIXcmuHN71fmQmj3n7upPlNxYUUXBO
	 +qHqDdGMFsZaGIQXc6wuAsZ9MjAuBZgphAeEfDiPfR9gRgxAh3IWaLn1ZI0CsYWP39
	 j8e+ydiwb5DhBGGtB2TTzxhxm7fA4tBApxPSKZ8ScDVQnESO/AS7zlFncYE0XqE+7h
	 QotEscQeaJCZaVrajJG7K9sHDF6skNM3knyNAQwzMEzPWypW2v6/9mjY7iFbTX6hIg
	 pZ5NFqYeIkoow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] iio: light: veml6030: remove unnecessary read of
 IT index
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-veml6031x00-v2-1-4703ca661a1d@gmail.com>
References: <20260513-veml6031x00-v2-1-4703ca661a1d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 07:54:57 +0000
Message-Id: <20260514075457.D6202C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Setting the scale arbitrarily overwrites the user-configured integ=
ration time (ABI Violation).
- [High] Missing IIO direct mode locking creates severe race conditions.
--

commit 74466b38c7e17d127927fcfba05be4a756ae8325
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6030: remove unnecessary read of IT index

This commit removes the read of the integration time index from
veml6030_set_scale(), as the value is read but not used afterward by gts
to set the new scale.

> diff --git a/drivers/iio/light/veml6030.c b/drivers/iio/light/veml6030.c
> index 6bcacae3863c0..745cf3ad7092e 100644
> --- a/drivers/iio/light/veml6030.c
> +++ b/drivers/iio/light/veml6030.c
> @@ -521,13 +521,9 @@ static int veml6030_write_persistence(struct iio_dev=
 *indio_dev,
> =20
>  static int veml6030_set_scale(struct iio_dev *indio_dev, int val, int va=
l2)
>  {
> -	int ret, gain_sel, it_idx, it_sel;
> +	int ret, gain_sel, it_sel;
>  	struct veml6030_data *data =3D iio_priv(indio_dev);
> =20
> -	ret =3D regmap_field_read(data->rf.it, &it_idx);
> -	if (ret)
> -		return ret;
> -

Instead of removing the it_idx read, should the driver use it with
iio_gts_find_gain_sel_for_scale_using_time() to attempt to preserve the
current integration time?

Currently, iio_gts_find_gain_time_sel_for_scale() ignores the current
integration time and picks the first matching combination from the gts tabl=
e.

This clobbers the sensor's current integration time, which might have been
explicitly set by the user for 50Hz/60Hz noise rejection.

>  	ret =3D iio_gts_find_gain_time_sel_for_scale(&data->gts, val, val2,
>  						   &gain_sel, &it_sel);
>  	if (ret)

Is state locking and a call to iio_device_claim_direct() missing here?

Since the driver supports a triggered buffer, omitting this allows userspace
to concurrently change hardware configuration parameters mid-capture, which
can corrupt the buffered data stream.

Furthermore, this function performs independent regmap_field_write()
operations for the gain and integration time.

Without driver-level serialization, concurrent sysfs writes can interleave,
leaving the device configured with a mismatched, invalid gain and integrati=
on
time pair.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-veml6031x0=
0-v2-0-4703ca661a1d@gmail.com?part=3D1
