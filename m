Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379D352C51
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057229; cv=none; b=p6EEqj2ujCWBnFP85LZafDyv748ZPdMen7WrwVzlu+rwFD9KGEXgZuItiALI23CLUdVrfxBAq3ivA81gAgtApgDrN6X0ed3lm/t6rAaeXM6tpH1F4z/LG0GeDE+z2kzsFiDIYnoyosrXNyu6PHR8RbSOyZ9fwfQpwjexj+MPhxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057229; c=relaxed/simple;
	bh=sCvCZq0MBkPis0grA1hCZKokR7G5qp8t2FWYDQVICYs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Cm8S4MQjsKV5g6WkdayAc+tWCfjSXRC0oq8t1Mr7V6VWjlrXrF7mPTLVbilvketW8/JPXYLNpQLVaMqogiPwww8nKQl86wK845iBAM9tWnIJ42mLjFuQ1tiSEardMb/owXLOL/QOOCZPCnz0WJtT4ghQV9edFVRqXVOE0ahM+ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmjIFXHh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmjIFXHh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24A11F000C4;
	Thu, 15 Oct 2026 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057227;
	bh=Dz5cwxa/jojxWkE6YHWYWi2VZEFNYI+4jWPGslFRseg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmjIFXHhy0DFXNgQGwT3Ki5yWU8I5QKy+U9Pf4mXxGWAVVaqOD+rSCd4dprSraqz7
	 X+aEhhGTV7cL96VNm3hbdGbwoS900C/Qa7wBgEZTUMUDwvUt1skf5wjmafTpcF7e5n
	 Py5lvhzjTZpBZukWuVPBn75oAQLDlisPjIOhPa0PKE4p1SzWSskFjkiKFRWzVtOQm4
	 oYrdySZeui0TX3ebilxIy2TpzRER9E8iFRo8WdskPV44Hi+HLupBziP6V754qvgO5E
	 zK2ZuCsbb1bXyQKhRL45+V3w/hS0wgfv44WvFGEG4y1Ncj+fQp5443NgsuHO+vbqpz
	 S8jzF6FEjHXSg==
Message-ID: <sashiko-outbox-172587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] iio: imu: adis: Add optional self_test callback
 and fix custom reset dispatch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-adis16607-v3-1-f972d4efee85@analog.com>
References: <20261015-adis16607-v3-0-f972d4efee85@analog.com>
 <20261015-adis16607-v3-1-f972d4efee85@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:40:26 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: imu: adis: undocumented addition of post_reset_setup callback
--

commit 6c20542e733281223a77056f3199ffa32200b12f
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis: Add optional self_test callback and fix custom reset dispat=
ch

This commit adds an optional self_test callback for devices with custom
test sequences and fixes the no-reset-gpio startup path to use the driver
provided reset ops instead of directly calling __adis_reset().

> diff --git a/drivers/iio/imu/adis.c b/drivers/iio/imu/adis.c
> index a2bc1d14ed91d..448046fd2ada4 100644
> --- a/drivers/iio/imu/adis.c
> +++ b/drivers/iio/imu/adis.c
[ ... ]
> @@ -413,7 +422,20 @@ int __adis_initial_startup(struct adis *adis)
[ ... ]
> -		ret =3D __adis_reset(adis);
> +		ret =3D adis->ops->reset(adis);
> +		if (ret)
> +			return ret;
> +		/*
> +		 * __adis_reset() already sleeps the settle time internally.
> +		 * Custom reset ops are documented (struct adis_ops::reset)
> +		 * not to, so sleep here for them.
> +		 */
> +		if (adis->ops->reset !=3D __adis_reset)
> +			msleep(timeouts->sw_reset_ms);
> +	}
> +
> +	if (adis->data->post_reset_setup) {
> +		ret =3D adis->data->post_reset_setup(adis);

[Severity: Low]
The commit message explicitly details the self_test callback addition and t=
he
changes to the reset dispatch path, but it doesn't mention this new
post_reset_setup callback being added to the initialization sequence. Could
the commit message be updated to document this new API addition?

>  		if (ret)
>  			return ret;
>  	}
[ ... ]
> diff --git a/include/linux/iio/imu/adis.h b/include/linux/iio/imu/adis.h
> index bfb6df68e6c94..5d0baeded3c92 100644
> --- a/include/linux/iio/imu/adis.h
> +++ b/include/linux/iio/imu/adis.h
[ ... ]
> @@ -81,6 +94,8 @@ struct adis_data {
>  	unsigned int self_test_mask;
>  	unsigned int self_test_reg;
>  	bool self_test_no_autoclear;
> +	int (*post_reset_setup)(struct adis *adis);

[Severity: Low]
Similar to the above, should this struct adis_data API addition be mentioned
in the commit message so that developers are aware of the newly available
bring-up hook?

> +	int (*self_test)(struct adis *adis);
>  	const struct adis_timeout *timeouts;
> =20
>  	const char * const *status_error_msgs;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-adis16607-=
v3-0-f972d4efee85@analog.com?part=3D1
