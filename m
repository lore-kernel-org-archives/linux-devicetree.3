Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132103;
	b=fLKlXf6/+8vjlMprD6fIVFW8flXw9/OeIRHumYFa6rfiC7VfD9dSzx9j6Z5ogg/HbC31
	 KT9kvwWZ8928y7l3N+750nADzxpr9t6fh3uJD0ljdcTG2N4QJP+kpbSUYBCao3PBR8HXa
	 67xj8IbjEJX5ffKJdoWSW4xLyweyvjyCkvR66KxvVavTsuhWQFWEQ78CaMT3srhzGVJXR
	 YCVG5VxMZ0xDw9FnCES5OA3cIo3kunyV/d70RHklAAKtw1QIlJwJUSCYRYYib07htp45F
	 e6EhHGlVQqvaho8dEOnIgrX38+MHIhKaa48+xFBtM68dtC7RlkM4NZdsZwRl25L7mRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132103;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7YPJqeDIs8hGRmDj6ztt9pZjgcqplGQY9qcm/h5LCyA=;
	b=x4t/MCa1hCNJ3tD+6C/8P9WpCf90X+dT1oMiz6myZck4+lU02v8c6QV0iix/xdvitdJQ
	 NTB98ZaAGgjEYrtJUERzQpXNXrkMN8p4Xyw8U09zXKAs6xo47IkC7yoXhCK81HYrOUdqg
	 clpqxpxbw4ziQF88+BEZrS6gfjJ+W1LmZ0CBfGyDEHmvr3JC/FPv46Qkjt70IStoQBw5e
	 LseEMDnNPYuhqNLJuLyL4QvO70ZQqIOdnWtMsQhe6fV+QpGOy1UmZMA4mAuOUdfvEAUZb
	 DrR6vOmkvkJ8xxjbjTRFNaUcEXKghYDthRi8wwrqE31x+JMbJR9ndwp0V9uTHfp373Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nq7EuIXE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A5E606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nq7EuIXE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DFE1F0089F;
	Sun,  8 Nov 2026 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794132102;
	bh=7YPJqeDIs8hGRmDj6ztt9pZjgcqplGQY9qcm/h5LCyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nq7EuIXEacVHKZtSOHt+2t601t7VZmbmI7qgqjYZMrJd9wvLz7IFuHlX8y4YR4g26
	 pJ8LuJXkQSUaTP+Rgi1oaVQj7AelZ9FBdiDecA8pLQ+MdK901Q2yLTHJza1ZbfuM+6
	 NMWHBJsJoNadVjyjhD2ujt3/92lJ2LYtQnd9ZLIhQBitzAcCPxuBWnb6tNeFyBXe7W
	 eTwK92kawoXReh2q5evot+v7sqxPlYrb6TZE/GmZ/TZtVmHASYdn77vlO3Y5vQGViT
	 OnOLGlU+dw+dqRiSG1DNYNfTlqNXyj3qGrV5q6uzAVDR0dMMvhmyjMibjvif5JucwH
	 jIryLXxKGi/kA==
Message-ID: <sashiko-outbox-203677@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108094253.83899-5-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
 <20261108094253.83899-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 10:01:42 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: light: ltr501: call to unexported
  iio_find_channel_from_si() breaks module build
--

commit a70950dbacecbff02b036d8bf018419c3106a456
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

This commit adds support for the Lite-On LTR-659PS-01 proximity-only
sensor, introduces a no_als_support flag to skip ALS register accesses,
and updates ltr501_trigger_handler() to inspect channel types rather than
fixed scan indices.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index ca6c8cffb4001..b97b8da98e86c 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1260,16 +1295,21 @@ static irqreturn_t ltr501_trigger_handler(int irq=
, void *p)
>  		aligned_s64 ts;
>  	} scan =3D { };
>  	__le16 als_buf[2];
> +	unsigned int i;
>  	u8 mask =3D 0;
>  	int j =3D 0;
>  	int ret, psdata;
> =20
>  	/* figure out which data needs to be ready */
> -	if (test_bit(0, indio_dev->active_scan_mask) ||
> -	    test_bit(1, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_ALS_RDY;
> -	if (test_bit(2, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_PS_RDY;
> +	for_each_set_bit(i, indio_dev->active_scan_mask, indio_dev->num_channel=
s) {
> +		const struct iio_chan_spec *chan =3D iio_find_channel_from_si(indio_de=
v, i);
> +
> +		if (chan->type =3D=3D IIO_INTENSITY)
> +			mask |=3D LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type =3D=3D IIO_PROXIMITY)
> +			mask |=3D LTR501_STATUS_PS_RDY;
> +	}

[Severity: High]
Does calling iio_find_channel_from_si() break the build when
CONFIG_LTR501=3Dm?

iio_find_channel_from_si() in drivers/iio/industrialio-core.c is not
exported with EXPORT_SYMBOL_GPL(), so linking ltr501.ko fails at modpost
with an undefined symbol error.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108094253.8389=
9-1-clamor95@gmail.com?part=3D4
