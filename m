Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70332376BD9
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785188424; cv=none; b=sXb0pGxDaxQAfIiUtcAG0z4IwPDThhDu6dZ35PlVkN2ECsUgQcwc76VRnVHA0ZpUZwzbi9V5LL4VYSRH4mmnGQK3V2PzYxdOHf9JIw+F5/dZr4aPzaaqj9VN4bVqlLO5NOWt1Q3mu9oVTn/StAWB7gfcwCmmD801S7sN3R+DInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785188424; c=relaxed/simple;
	bh=Syb4bgvHTSDtnLfOApIIKLLwyUp7hdzKKltnb16INcM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H0unAFBQplq0X7HKSCqdVeqvF30YVZMU75sDQHCAXo7h4FeDLNy/HQDQYnJaWTaTpcpWE8f9Z9FEoS3WcSmJofBJXGOvOKNzm8r4wWseEiN3E4mlFZLzmJ9lIzs7z4vfhvjaq/n+BlCEdkpBVdK3KSznz+V9W5Q35RyxGOyEnMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzKKSJm5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzKKSJm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C81191F000E9;
	Mon, 27 Jul 2026 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785188423;
	bh=eFYDUUye9kvCZliELXUXKQOhZcRMP+LRK+a6UkeuxAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzKKSJm5rNfvCJEzhSspcgNZQmv6iDyFMN4vhgx3tYMDdg9jEnm2rZ82XbaKim07T
	 PuM4gaT99x2Bb3rza0Lzvr+npcCuUX8yiW8WpS5UD+YSeGKiuNb+yamRgIl1EcodeN
	 NZg0AA7gUxD+qcW85SMkd85KVvPuELmFtnGs5kp4tqckB7YQLluMvOMBQgnn8kSuU8
	 NScgJTxw3NL3AdJTYEQl7zMD2mDOs87uZIF+03Z/D+UOwo1X94B8DSuOFbV4XK4X/O
	 wGiwUeY1Cakvi8jSomJdDmJX2Dc6ZUcolmYAHub58MJI7A8n/dFLCW6IYFC5GRKd9X
	 HAusJdZ63WmGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/6] iio: adc: ltc2378: Add support for LTC2338-18
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <39f2ff86cf736ff97286d6451fcc45fdba6732f9.1785186980.git.marcelo.schmitt@analog.com>
References: <cover.1785186980.git.marcelo.schmitt@analog.com>
 <39f2ff86cf736ff97286d6451fcc45fdba6732f9.1785186980.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 21:40:22 +0000
Message-Id: <20260727214022.C81191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Declaring a variable immediately after a switch case label without =
a block statement causes a compilation error.
--

--- Patch [5]: [PATCH v9 5/6] iio: adc: ltc2378: Add support for LTC2338-18=
 ---
commit 29728b1d34f34b2970657e2d83536de22940ee2e
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ltc2378: Add support for LTC2338-18

This commit adds support for the LTC2338-18 ADC to the existing ltc2378
driver. It extends the driver to handle the internal voltage reference and
input signal attenuation specific to this part.

> diff --git a/drivers/iio/adc/ltc2378.c b/drivers/iio/adc/ltc2378.c
> --- a/drivers/iio/adc/ltc2378.c
> +++ b/drivers/iio/adc/ltc2378.c

[ ... ]

> @@ -383,7 +395,10 @@ static int ltc2378_read_raw(struct iio_dev *indio_de=
v,
>  		return IIO_VAL_INT;
>  	}
>  	case IIO_CHAN_INFO_SCALE:
> +		struct u32_fract fract =3D st->info->internal_div;

[Severity: Low]
Does this declaration cause a build error? Declaring a variable immediately
after a switch case label without a block statement is not a valid statement
in C and usually causes a compiler error. Could this case be wrapped in a
block to scope the variable, or the declaration be moved to the top of the
function?

>  		*val =3D st->ref_uV / MILLI;
> +		if (fract.numerator && fract.denominator)
> +			*val =3D mult_frac(*val, fract.numerator, fract.denominator);
>  		/*
>  		 * For all LTC2378-like devices, the amount of bits that express
>  		 * voltage magnitude depend on the polarity / output code format:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785186980.gi=
t.marcelo.schmitt@analog.com?part=3D5
