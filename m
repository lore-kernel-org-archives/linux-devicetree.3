Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037624EE866
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891109; cv=none; b=H2fYuObfdG6ZXPN8/APmzZdcqJqqKOgbyQGiO76F5n28KrfKSK2b14hUuV/YUn4Wrg/l8UM0hwY5opYjHMzSFs0ivc3exRC1RxOtuqmQZlXRM/T8b8AKGG3kfSGXApqbsGLqh/iQla77c4z8MI8SbTxfqpcftGPZEoto8KRJqdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891109; c=relaxed/simple;
	bh=aLS0Cj4ByLerlum/DIE1LgI6i8of+YBEzIj+/lLssmQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=t3ON1R1o+XCJehKIQXWhKuhq4FveyFFoFFsBwA5fHSb1ZMT7dVRqmdi2Ua7m5e0LpnjTjgTzLA6a2Rrz8SW/K+FIroSMyzkebuHYeYzYZnTxJTPhmIxSnVqyAmJzb3Ox/Yr7G2Ixa81b/r45NK9ZBdU3LJ75U46otxEkgSOQQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivGoTDdT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivGoTDdT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5962E1F00893;
	Tue, 13 Oct 2026 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791891107;
	bh=DiC/XqsZDUFzXbsWC0/wUNyrvGT7H0efhdTdBETasnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivGoTDdTrlL9RkEpjo5z+6qjkFBId1mN+f1AOyJxMhG1ILp/orSFZtsBSDD4LUX19
	 quE+GsEYmFI8C972wG/2KhX5OJ2kx4+SeyFklEZY5P/DK1tSKCKpdDTCU4xy7juscp
	 cmrD5qXkeXpvDQv7UydAiZP4Id5ETQEsfxyuAb3yvBaaYoYCenVX2j9cVIP4jbRx6J
	 UnYPwkomEeezsOG/IA6RD/IH7KR2VpZMOPBzPOXq5WqXi8ONbnrts/2whA86NNds+A
	 C9UsrpDN5HoV6EmTOuh+FS8Pa2G4CK+WEI2BGaUga2Vkdva8XDBtI2CggSaMKux/yT
	 HjtD8my0LMdgQ==
Message-ID: <sashiko-outbox-169629@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/6] iio: pressure: dps310: fix overflow in the
 pressure compensation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paulius Zaleckas" <paulius.zaleckas@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013112124.1878296-2-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
 <20261013112124.1878296-2-paulius.zaleckas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 11:31:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: pressure: dps310: signed integer overflow in compensation edge=
 cases
--

commit 0579c95e71d8f32f605a58fb3d4e9b5b43e70e29
Author: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: iio: pressure: dps310: fix overflow in the pressure compensation

This commit changes the pressure compensation polynomial in
dps310_calculate_pressure() to use Q20 fixed-point arithmetic. It replaces
the previous div64_s64_rem() approach to prevent overflows when evaluating
higher-order polynomial terms.

> diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
> index 85df58ac18090..3bc690cc86090 100644
> --- a/drivers/iio/pressure/dps310.c
> +++ b/drivers/iio/pressure/dps310.c
> @@ -660,71 +660,56 @@ static int dps310_write_raw(struct iio_dev *iio,
>  	}
>  }
> =20
> +/* Fraction bits of the fixed point pressure compensation */
> +#define DPS310_Q	20
> +#define DPS310_Q_ONE	(1LL << DPS310_Q)
> +
> +static s64 dps310_mul_q(s64 a, s64 b)
> +{
> +	return (a * b) >> DPS310_Q;
> +}
> +
>  static int dps310_calculate_pressure(struct dps310_data *data, int *val)
>  	__must_hold(&data->lock)
>  {

[ ... ]

> +	/*
> +	 * Section 4.9.1 of the DPS310 spec in fixed point. Dividing p^3 * c30
> +	 * by kP^3 directly overflows s64 at most oversampling rates.
> +	 */
> +	ps =3D div_s64(p * DPS310_Q_ONE, kp);
> +	ts =3D div_s64(t * DPS310_Q_ONE, kt);
> +	x2 =3D dps310_mul_q(ps, ps);
> +	x3 =3D dps310_mul_q(x2, ps);
> +
> +	pressure =3D data->c00 * DPS310_Q_ONE;
> +	pressure +=3D div_s64(p * data->c10 * DPS310_Q_ONE, kp);
> +	pressure +=3D div_s64(t * data->c01 * DPS310_Q_ONE, kt);
> +	pressure +=3D dps310_mul_q(data->c11 * ps, ts);

[Severity: Low]
Can this code still overflow s64 under maximum theoretical raw sensor
inputs?

In drivers/iio/pressure/dps310.c:dps310_calculate_pressure(), the
intermediate product data->c11 * ps is evaluated before being passed into
dps310_mul_q(). Once inside dps310_mul_q(), multiplying this product by ts
can exceed s64 bounds when extreme hardware values are returned.

> +	pressure +=3D data->c20 * x2 + data->c30 * x3;
> +	pressure +=3D dps310_mul_q(data->c21 * x2, ts);

[Severity: Low]
Does this nested product vastly exceed the maximum capacity of a signed
64-bit integer when extreme hardware values are returned?

For example, when the sensor returns maximum possible 24-bit raw values
(e.g., from a faulty or maliciously manipulated I2C sensor) combined with
the minimum configuration scale factor (kp/kt of 253952), ps and ts
approach ~33 * 2^20.

The 64-bit product (data->c21 * x2) * ts evaluated inside dps310_mul_q()
exceeds ~1.29 * 10^21, which easily overflows the s64 maximum of
~9.22 * 10^18.

Since the kernel's -fno-strict-overflow compiler flag guarantees
wrap-around rather than undefined behavior, this results in a wrapped
garbage output, defeating the patch's stated primary goal of fixing math
overflows in this calculation.

Could this overflow be prevented without meaningful precision loss by
reordering operations, such as computing data->c21 * dps310_mul_q(x2, ts)
instead of dps310_mul_q(data->c21 * x2, ts)?

This flaw persists and affects the new c31 term introduced later in the
series via commit "iio: pressure: dps310: add Zilltek ZTS8032 support".

> +	pressure >>=3D DPS310_Q;
>  	if (pressure < 0LL)
>  		return -ERANGE;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013112124.1878=
296-1-paulius.zaleckas@gmail.com?part=3D1
