Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED833B1B3
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162276; cv=none; b=dblr1D05FoOoFVrZf1rh7TqWVrjUfdti64WGnZAPnVnliN+v2z6Ec2zt3f/e0fOhs45mkBn2Nf0P65bSQn4P5uR8UzNOGEw9uyb4RUYYbx6r36Gi9A+UbDD2aBwMBlkDLdK0uMhbgpIkmh7ptpmUj+iSt+cj+r/sdQd6O1SybSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162276; c=relaxed/simple;
	bh=7gKw9tguPNAUR2vO4BcZ7L2dl9iMNDz7dH2ZQU49Gwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mromZDAo+J6Tj+h/worvVtzz/uVpi1svhVCeK3x/bi0Gllh4+BlPfnAQW/tXoi9piHXq+uSgAUvv9ExQrDPDUDoRDh0no6eg7y2E22KxD0QRtjWW+TwMsicajl55de/B+wJQQgLG8Rq0nk1a0W99T4TE+e7+kRlLS80Bqp0Srp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpoYh4Tj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpoYh4Tj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291731F000E9;
	Sat,  8 Aug 2026 04:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162275;
	bh=C3urOIho5jzJPLnc4ektcxw/g5ODC6TtYeUHPP2p27E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpoYh4TjjFChzWVO9QoK2kI4XNbtH6zzKap+zJ9uhUJ0e4uIWaXB9+rFS7GIQpZSX
	 EDZqkkn+7MckPj1vNQBF0jSHmdboDAFRiQdOFAiY5UZ8/UGl6JoI/qQL0LIgevg1rf
	 p8qOmcMd8TL4qAG107CnNlnu043HDKjEJHU+gO97pXPJVQcO9t+6K7cW/wtY3u0QmA
	 s47K5XMoBNTKmmyVWtLNfkGlAPP3s5TeW1ShXrqI8SFhOOcuNBcbTo7mMpV26lYS9a
	 bA+78IuMRLjGBoZeo7uvW0SrEa3R4sB81O6hfxUDleWIc53Kdc/qLZEI2AnKB1o+yw
	 1cHa6uHYMLS0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] iio: adc: ti-ads1262: support REFOUT and VBIAS
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807-ads126x-v3-8-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-8-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:11:14 +0000
Message-Id: <20260808041115.291731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `refout` regulator is registered with empty operations, causin=
g `regulator_enable()` to fail with `-EINVAL` and leaving the internal refe=
rence disabled.
- [Medium] The `vbias` regulator lacks a `.get_voltage` callback, causing i=
t to incorrectly report its parent's full voltage instead of the mid-supply=
 voltage.
--

--- Patch [8]: [PATCH v3 8/9] iio: adc: ti-ads1262: support REFOUT and VBIA=
S regulators ---
commit 8d51db315e9b593705eb805bce9b112c942e4ee3
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support REFOUT and VBIAS regulators

Register the "refout" and "vbias" regulators to be able to use them as
common mode supplies.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 24a7ecb9fbd40..533574169b044 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -961,6 +962,91 @@ static irqreturn_t ads1262_irq_handler(int irq, void=
 *dev_id)
>  	return IRQ_HANDLED;
>  }

[ ... ]

> +static const struct regulator_ops ads1262_vbias_regulator_ops =3D {
> +	.enable =3D ads1262_regulator_enable,
> +	.disable =3D ads1262_regulator_disable,
> +	.is_enabled =3D ads1262_regulator_is_enabled,
> +};

[Severity: Medium]
Since this operations structure lacks a .get_voltage callback, won't calls
to regulator_get_voltage() fall back to returning the parent's full voltage
(AVDD) instead of the expected mid-supply voltage?

> +
> +static const struct regulator_ops ads1262_refout_regulator_ops =3D { };

[Severity: High]
Since this operations structure is empty and lacks an .enable callback, won=
't
regulator_enable() fail with -EINVAL?

This also means there is no callback to configure the hardware by setting t=
he
ADS1262_POWER_INTREF_MASK bit, leaving the internal reference disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D8
