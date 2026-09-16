Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC10B44780D
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546821; cv=none; b=l2QRXq3F51whieiuwnbOyBr1TVjYPBbPYHocer6KxQ6nilfx5fxus3w6rq4CV8CNocNG76rQDEbdkwHkKC1bsp74w0GyzFUxlR3JCn2mWteLoKC+IacvLVxRDrR7ybi5u8R1cwxMylfUirUiRc9HgP9oA5F5o6WXSbddqW3o3fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546821; c=relaxed/simple;
	bh=80z8GRIvzjtdofxU0UKC+B1PotR6k6VaPYh5HfwPT5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fH8GXDCH5KLWJYY0pJC6cJ66Y4deM262LyRCoz92RZc3erc1UleQpPJXLsRyrVN6W7ZmgDkynfk4bnegXSibf4GGY+QoQyXIcLTDNN2gt338ak60cWHozIDcIBinophA8UQonaUDH0r+dHvCuHgwA+sAu9IAp6gtY49O7eC4OmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wp4GH5Sx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wp4GH5Sx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13AC51F000FF;
	Wed, 16 Sep 2026 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546808;
	bh=wSzecZSbaRGpSvKsKvUbsRBRkOSQYjMJFH70/7g6E5w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wp4GH5Sx9nWonYRn5EKtYw74+gmDXTgvIIie/xhP8rCiPSHn0pn173U7quQs0G1qo
	 UYq/RuRx4VaA6SllRBr5A+Q2WMCXmEH5QAjhlc2y9Xfvrc5ey75xHps6MSYZGhjmo2
	 ++Web5Nopj2Wk8Cw9rSvtFUEo1u6kN93mcZkVlkYiI48HOpX5ru7V/Dk7VPkiwISOL
	 HIPn/OmFhRIc+QKzkTLw0Z9QB1QDTY7p2serljoCXDupdQbaFj1WjaUfRQ+nq5EeY7
	 WcxhIW5KpsgyV1Dx7JY1n/TRsVbidFDkLtMxWVxh+eDtYw9sCg/Tmm93Yqy072i4RJ
	 NvcoCmQqTxfvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 05/10] iio: accel: mma8452: Only apply trigger type
 when not set by firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916-mma8452-open-drain-v9-5-0dd24fa2f3d7@geanix.com>
References: <20260916-mma8452-open-drain-v9-0-0dd24fa2f3d7@geanix.com>
 <20260916-mma8452-open-drain-v9-5-0dd24fa2f3d7@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:20:07 +0000
Message-Id: <20260916082008.13AC51F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: accel: mma8452: mismatch between host interrupt config and se=
nsor polarity
--

commit d5f9cc43dbeb055ea3109fb839dcfa1634da10c0
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Only apply trigger type when not set by firmware

This commit updates the probe function to use the interrupt trigger type
provided by firmware instead of unconditionally hardcoding it to active-low.
If the firmware does not specify a trigger type, it falls back to the
default active-low configuration.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 8d70fe89110cd..72b4ab32775a6 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1669,9 +1669,16 @@ static int mma8452_probe(struct i2c_client *client)
>  		goto trigger_cleanup;
> =20
>  	if (client->irq) {
> +		unsigned long irq_flags;
> +
> +		irq_flags =3D irq_get_trigger_type(client->irq);
> +		if (irq_flags =3D=3D IRQ_TYPE_NONE) {
> +			dev_info(dev, "invalid irq type, setting default active low\n");
> +			irq_flags =3D IRQF_TRIGGER_LOW;
> +		}
> +		irq_flags |=3D IRQF_ONESHOT;
>  		ret =3D request_threaded_irq(client->irq, NULL, mma8452_interrupt,
> -					   IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> -					   client->name, indio_dev);
> +					   irq_flags, client->name, indio_dev);

[Severity: High]
If the firmware specifies a non-default interrupt polarity such as
active-high, could this result in an interrupt storm?

While this code programs the host interrupt controller with the requested
polarity, does the sensor's hardware polarity also need to be updated?=20
The sensor's default active-low configuration means its inactive state is
logic high. If the host controller is configured for active-high, wouldn't=
=20
it constantly trigger on this logic high, return IRQ_NONE from the handler,
and endlessly re-trigger?

Should the sensor's CTRL_REG3 IPOL bit be programmed to match the requested
irq_flags, ensuring the device output aligns with the host controller's
expectations?

>  		if (ret)
>  			goto buffer_cleanup;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-mma8452-op=
en-drain-v9-0-0dd24fa2f3d7@geanix.com?part=3D5
