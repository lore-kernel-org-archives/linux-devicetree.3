Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61784347BBD
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791657131; cv=none; b=JE4Wr6CuPTvh6C/Wctz6P2QUmlR7ZQOVVoe1MwJ27rgAyZBqubnVANtWNgIw2XvhBj92qs6lLeYsSjNZCzRdTOXKQ5UQGgc/HKysz02DKV15wF/KKuv8Y8/XqqSeEmxFRoYg+set8wk2FgjAFzoZutTGozFjsbADaGmp9NUgIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791657131; c=relaxed/simple;
	bh=SXvwJ8BSd3eVjtlfJSOmc9OzyN+sFIvjpe/mMhiMaNI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kVpolK9OU0PFNO4eDZJw+vekRWe3n1U2dq10FoA76l44UdpbluUZZKRGmyyFvSRWaBK9Mk+qkVbRzVQXGw262vruOQTBCMKnnyIAALP9piiilMbOJKPQghAu4JJcswM6JU7FI7adzmwZV4bAGkTg0xOvx7l53IGrYcZIoXItbG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXfsRpC9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXfsRpC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2091F00898;
	Sat, 10 Oct 2026 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791657130;
	bh=I3x3CvJBIVGPrumhKNXV4G46egSfqQwrhu7SO3oYeIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DXfsRpC9wl/wPMvHGN4AVqkYDFtNDqI0FzPzHBcqXCn/pZbwA2FnKKWpUhvD8QZ28
	 OK2oylvQZgnBXRAibRMzZaCQ+rrBDZ97v0JzoZrR+nZrcSAMPjMMHIun/F21wzxelU
	 2xZf4v+/Ucq1rCQ23P+3LoYg9lLOtmFmyMb7ZMwqsYf5QhnrxeaP4CnPq3uzHQ+OX2
	 uuYd34gCuhKyetmnmmbamNsJ1lqDcahlbgbu6XYhlzrQhqqy7oEi/GJHJlfUu++CI8
	 dxxm0GuzfQ71fbNOp74IiTZxzgAv3ezE535gvEJSPVrulgS6Iz0OEeW7Wsq1ThCGR6
	 F4dUd8/7PSOGg==
Message-ID: <sashiko-outbox-166810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 08/12] dpll: sit9531x: add support to get
 and set frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009183151.78497-9-arouhi@sitime.com>
References: <20261009183151.78497-1-arouhi@sitime.com>
 <20261009183151.78497-9-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:32:09 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk: sit9531x: endianness bug when reading DIVN_NUM and DIVN_DEN r=
everses bytes
--

commit 0b96c7bf8e03b2b8b37f84bca16849f39b173d51
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set frequency on pins

Adds support for getting and setting frequencies on sit9531x pins. Input
frequency is reported from firmware, while output frequency is computed from
VCO divided by a divider. Includes logic for programming output dividers and
phase flush.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index 79520640dfc88..ea15830b0efae 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -1342,6 +1481,672 @@ int sit9531x_input_prio_add(struct sit9531x_dev *=
sitdev, u8 pll_idx,
[ ... ]
> +static int sit9531x_divn_static(struct sit9531x_dev *sitdev, u8 pll_idx,
> +				s64 *divn)
> +{
> +	u32 int_part, fracn_raw =3D 0, fracd_raw =3D 0;
> +	u64 fracd;
> +	s64 fracn;
> +	int rc, i;
> +	u8 v;
> +
> +	rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +				  SIT9531X_PLL_REG_DIVN_INT, &v);
> +	if (rc)
> +		return rc;
> +	int_part =3D v;
> +
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_NUM + i, &v);
> +		if (rc)
> +			return rc;
> +		fracn_raw =3D (fracn_raw << 8) | v;
> +	}

[Severity: High]
Does this loop reverse the byte order of the fractional numerator?

The device appears to use Big Endian registers, as seen in
sit9531x_output_divo_write() where the MSB is placed at the lowest address.

Here, the loop reads the highest address (SIT9531X_PLL_REG_DIVN_NUM + 3,
the LSB) first and shifts it into the MSB of fracn_raw. Because
sit9531x_output_freq_set() verifies that div64_u64(fvco, divo) equals the
requested frequency, could this scrambled VCO frequency cause valid
frequency set requests to fail with -EINVAL?

> +
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_DEN + i, &v);
> +		if (rc)
> +			return rc;
> +		fracd_raw =3D (fracd_raw << 8) | v;
> +	}

[Severity: High]
Does this apply the same reversed byte order logic to the denominator?

> +
> +	/*
> +	 * NUM/DEN is the fractional part of DIVN, so |NUM| is below DEN by
> +	 * construction.  A pair that says otherwise did not come from a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009183151.7849=
7-1-arouhi@sitime.com?part=3D8
