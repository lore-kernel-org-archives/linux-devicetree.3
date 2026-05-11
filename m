Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326713B530A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 21:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778534063; cv=none; b=YLt4JSK/rngbMD4PIsFGDB21bX55K/hCK2ETPzN80wp+8IHsn50lCbNgJ6y1XskwR63hdtuxr/YoZ/f3o1ZnQca60hExqLMY3ZO/Z88OQH5MKM6gUABHG8fumcorDy/xzb+Gfm57UrXVUtTEJyg+FRfAYXgv3kA9G3RlP/vQKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778534063; c=relaxed/simple;
	bh=Pz03f8KSKak8DO18gycA8/PjIX5Wd9fJZn4E9O9Swyw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E72rhJ+nJlpmSZVGQP/JZGO7RmvctD2u+hT90bWA8bSP+xzHvmNIkwawPXSFXGtMbD3OlAp/lTYXpMi2PRr12ObuF0nVMI9l0FZvFA4Gd0v/lMzWSeBH5RrP9HTb7j00GrMORdqOdoIiPaxMDS6yIgzENpLWPKC4yBtpeXo5EEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3KILTCk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3KILTCk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AC6C2BCB0;
	Mon, 11 May 2026 21:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778534063;
	bh=Pz03f8KSKak8DO18gycA8/PjIX5Wd9fJZn4E9O9Swyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=M3KILTCk+bIUohoq8F6ukzxBodXC0NAjI6ikVXXQ7oweFhhMkmGOQCAp59udA6Iq/
	 /kaTlIcw1Yh4IegxlxMjI3DOmYcUM96kQDebZzP862ntFKydptVnvuFfuRjxiwqX6I
	 V643U1XhjtdxZ4LN2KMCYDjUlOEkkHsc/a+PVLZBlkntj1+jytKRPRvq/Q3bcyKHcX
	 oYw5f5T69+OC/ksMTh1h1bKYYtcE4J7T8wqZvidffbPftMy7JoC2NrC+qneRtcFmRa
	 ho6cxpFJhS29MppVk82WyisiJyBLUTOlIOyd7L63jWljVtJle5JLhXOVNsnvIC5ckD
	 VGoAJrzDKGgAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
References: <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 21:14:22 +0000
Message-Id: <20260511211422.B0AC6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] kstrtoudec64() incorrectly returns -EINVAL for strings with a deci=
mal point when scale is 0, violating the documented truncation behavior.
- [Medium] kstrtoudec64() incorrectly returns -EINVAL for valid numbers tha=
t end in a decimal point (e.g., "123.").
--

commit 4ece498f1f16417e4dd8a8ebdad47a15b89527ef
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

lib: kstrtox: add kstrtoudec64() and kstrtodec64()

Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
point numbers with pre-defined scale are parsed into a 64-bit value (fixed
precision). After the decimal point, digits beyond the specified scale
are ignored.

> diff --git a/lib/kstrtox.c b/lib/kstrtox.c
> index 97be2a39f5371..da7b5f83a3c59 100644
> --- a/lib/kstrtox.c
> +++ b/lib/kstrtox.c

[ ... ]

> @@ -392,6 +393,112 @@ int kstrtobool(const char *s, bool *res)
>  }
>  EXPORT_SYMBOL(kstrtobool);
> =20
> +static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> +{
> +	u64 _res =3D 0, _frac =3D 0;
> +	unsigned int rv;
> +
> +	if (scale > 19) /* log10(2^64) =3D 19.26 */
> +		return -EINVAL;
> +
> +	if (*s !=3D '.') {
> +		rv =3D _parse_integer(s, 10, &_res);
> +		if (rv & KSTRTOX_OVERFLOW)
> +			return -ERANGE;
> +		if (rv =3D=3D 0)
> +			return -EINVAL;
> +		s +=3D rv;
> +	}
> +
> +	if (*s =3D=3D '.' && scale) {

Does this cause an issue when parsing a string like "123.45" with a scale
of 0?

Since scale is 0, this condition is false, leaving the pointer at the
decimal point. The parser will then fall through to the trailing character
check:

    if (*s)
        return -EINVAL;

and fail the conversion entirely. Should this truncate the fractional part
instead, as described in the documentation?

> +		s++; /* skip decimal point */
> +		rv =3D _parse_integer_limit(s, 10, &_frac, scale);
> +		if (rv & KSTRTOX_OVERFLOW)
> +			return -ERANGE;
> +		if (rv =3D=3D 0)
> +			return -EINVAL;

Is it possible for valid numbers ending in a decimal point (like "123.")
to be rejected here?

If the string has a decimal point but no trailing digits, rv will be 0.
While this correctly catches invalid strings consisting solely of ".", it
appears it will also incorrectly fail strings where the integer portion was
already successfully parsed.

> +		s +=3D rv;
> +		if (rv < scale)
> +			_frac *=3D int_pow(10, scale - rv);
> +		while (isdigit(*s)) /* truncate */
> +			s++;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adf41513-i=
io-driver-v12-0-34af2ed2779f@analog.com?part=3D2
