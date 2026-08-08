Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE258374198
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162159; cv=none; b=Qlo1SiKKlrNx+7ihDaKVa8EczP8fubi8SqsrMLt3qzoM6zfslWGrmjuR9FBbzK5T+vl6cPJAXB1vUkTo6bw0R1wwbe6F8cWSoNPBFSNjwArLSr1itdfN+Eom15qycVtynUsdQStD100UPZPHfCZPovdo4dJg75VXjrCTwLogbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162159; c=relaxed/simple;
	bh=UV6ac/N4G43q4aXvzQSkuX1RmGAA+EgnxhSZte/ii8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jk+ZpSiJWSI0BPlrAv97ck4mnZ6tMnzi1SrQzVT+7Sb1PDlRYd1ujqpXxVj3WGYE5W9Q/gE+erJ+u1i+FvjsZBIe8K8HE5apnZpe/kB3to26LOv1evaIdY6jLuVwbDERYw8Ky4IS7Hhf/lwT5Rm0Qxpa7znQIJlrg6f661t7Q1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cX4wQQc4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cX4wQQc4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE861F000E9;
	Sat,  8 Aug 2026 04:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162158;
	bh=zLNLHfTyFHGAcQUafNJi/OBV429/jVkLq95StXe+RbQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cX4wQQc49m68lXfG7xQGQ6/WF+goSniXpPdmm6CsrEUmAC4saRkI2/MhE8v9xDsqg
	 F6gQXYd5/Fiud2VeypchT/o6WSHEs5FnPdrUgscZUZ6+0Ii5F+CbJfPYo+5sgNKJze
	 yrxCrAEwSo24SY+VQQKDv6BEMxi+UT+Rq3aZc7MVPSeHnnn0ScnJ3oiko4aSCoIySm
	 T1utq8B7lFIwjNxoaTh/FVcIuWoHbWXKArydMqS4DMgTcaJ9wXqevDGpqbPzZLiFkJ
	 jq7l3aYAlymYAGfrAc7tQNnXx8fPaor8yaTkq7uC+5XSermuN6x8nBfK8rjH36jaXi
	 FKDiGevCIRX/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/9] iio: adc: ti-ads1262: support triggered buffer
 sampling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807-ads126x-v3-7-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-7-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:09:17 +0000
Message-Id: <20260808040918.2EE861F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition between the hardware DRDY interrupt and `reinit_com=
pletion()` causes missed conversions and timeouts.
--

--- Patch [7]: [PATCH v3 7/9] iio: adc: ti-ads1262: support triggered buffe=
r sampling ---
commit a9e8c114122dfc9b8eb2cdf234373c01ea35d2cf
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support triggered buffer sampling

This commit adds triggered buffer support and a data-ready (DRDY)=20
hardware trigger for the Texas Instruments ADS1262 and ADS1263 ADCs.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index d5464b4f2bfb2..24a7ecb9fbd40 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> +static int ads1262_fill_buffer_mult(struct iio_dev *indio_dev)
> +{
> +	struct ads1262 *st =3D iio_priv(indio_dev);
> +	unsigned int chan;
> +	__be32 val;
> +	int i =3D -1;
> +	int ret;
> +
> +	/*
> +	 * This routine enables and reads channels in a full-duplex fashion.
> +	 *
> +	 * When a channel is enabled, the previous conversion is clocked out of
> +	 * the shift data register on the same transfer (Section 9.4.7.1). This
> +	 * allows for low latency software sequencing but forbids any
> +	 * communication with the chip in-between or data corruption may occur,
> +	 * hence the need to take the xfer_lock for the whole operation.
> +	 */
> +	guard(mutex)(&st->xfer_lock);
> +
> +	iio_for_each_active_channel(indio_dev, chan) {
> +		ret =3D ads1262_enable_and_read_last(st, &indio_dev->channels[chan],
> +						   &val);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * After writing to the channel configuration registers, the
> +		 * conversion-cycle is restarted and the data registers are
> +		 * cleared. This means we have to reinit the completion after
> +		 * enabling to avoid reading stale data.
> +		 */
> +		reinit_completion(&st->drdy);

[Severity: High]
Can a fast conversion cause a race condition here that leads to a timeout?

If the sample rate is high (e.g., 38400 SPS, ~26=C2=B5s latency), is it pos=
sible
for the hardware DRDY interrupt to fire immediately after the SPI transfer
in ads1262_enable_and_read_last() finishes, but before reinit_completion()
executes?

If the interrupt handler executes first and calls complete(&st->drdy),
would this reinit_completion() locklessly reset the state back to 0,
wiping out the completion signal?

If so, would the subsequent ads1262_wait_for_conversion() then wait
for an event that was already cleared, eventually returning -ETIMEDOUT?

> +
> +		if (i > -1)
> +			st->scan_buffer[i] =3D val;
> +		i++;
> +
> +		ret =3D ads1262_wait_for_conversion(st);
> +		if (ret)
> +			return ret;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D7
