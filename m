Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856B63E2AD1
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 16:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491315; cv=none; b=lfXE0p54xWBWJz+7gGSfNjRi4XAfgGBDdZUHv1WsCslEKKgVumgomlLpcCb3O+SMYdoR9HV4mlC5g6lrbXOR7CeGOBvxziqBSshH6CAx6gEIOm3rrjc+PlM7fLToYJTnJM5JhK9u6v/jRX8B6vKX7KM8n9hRWn5CqoEyBUWYMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491315; c=relaxed/simple;
	bh=AyGvkWwTv4ogOyG1zIhLlq6xGCfCJJ5jNJbBhIdKnik=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jBRSqmO+ycJdEsm08AdNQ23vC1uspht79fx+YzSKSyXQCHtfpudNW8ENZXdVoTywQ+1jl8g6MSoBwfdgwgyQl3wp/WcNL5d7wmGjjVVSQRcozQpOGFC8qwmfNXKXWCCra8Nt7onhEfaYYy88SbqaxGPmpnxIdYCnY7yXogq5BO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb5IHedM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb5IHedM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39FC61F00A3A;
	Fri, 26 Jun 2026 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782491314;
	bh=RHJI4XhPzlHUfN69Yev6UhJ4NCYP/fOSaUknmomm8Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fb5IHedM2OfA9ekgKeOf144PHT7EmvaQFr8ZGxgxwREWdE7e5U/9oxY2+vbgX0c6X
	 R1W+QrEMP7X1MIFzplw6GNu1kCTZHNMoNQ7XTQwe8pDcFrfcAeZBsfCHWZX1NJ0WgA
	 kkpI+SvuMbcAyYFkDV8HHhqXP0j+YszZ24x5NVizUXLxG9E15HD2aOgFnKoHfwpTEa
	 WgIWmOfPnmKF2hWEV1e3dhu43ZQxUX6dKwgOgI4Dzyme7+4nvSvCjP4bBgkt5NEXzW
	 DctmzM1wPEeKuw9NEhNjhJZ0pPtP6Di0LLwGyFsd+Qx9v2xfBsa4EWt7cgzHUtQH9N
	 H+5WUDRP4oDXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V15 7/9] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260626161230.93069-8-macroalpha82@gmail.com>
References: <20260626161230.93069-1-macroalpha82@gmail.com>
 <20260626161230.93069-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 16:28:33 +0000
Message-Id: <20260626162834.39FC61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Temperature channel rejects `SAMP_FREQ` read_avail and write req=
uests despite sharing it.
--

commit 44a4695bd590583ad4160f9a70b38ed7f1470dfa
Author: Chris Morgan <macromorgan@hotmail.com>

    iio: imu: inv_icm42607: Add Gyroscope to icm42607
   =20
    Add gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..c7215b3826adc
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
[ ... ]
> +static int inv_icm42607_gyro_read_avail(struct iio_dev *indio_dev,
> +					struct iio_chan_spec const *chan,
> +					const int **vals,
> +					int *type, int *length, long mask)
> +{
> +	if (chan->type !=3D IIO_ANGL_VEL)
> +		return -EINVAL;

[Severity: Medium]
Does this strict check reject the IIO_TEMP channel for available value quer=
ies?
Since the temperature channel shares the SAMP_FREQ attribute with other
channels, in-kernel consumers attempting to read available sampling frequen=
cies
might receive an unexpected -EINVAL error.

[ ... ]
> +static int inv_icm42607_gyro_write_raw(struct iio_dev *indio_dev,
> +				       struct iio_chan_spec const *chan,
> +				       int val, int val2, long mask)
> +{
> +	int ret;
> +
> +	if (chan->type !=3D IIO_ANGL_VEL)
> +		return -EINVAL;

[Severity: Medium]
Will this similarly reject write requests for the temperature channel,
preventing updates to the shared SAMP_FREQ attribute? (The same behavior
appears to exist in the accelerometer driver's inv_icm42607_accel_write_raw=
()
function).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626161230.9306=
9-1-macroalpha82@gmail.com?part=3D7
