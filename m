Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9A431B828
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198823; cv=none; b=nmXIhhgReoJqZrhOXx6pDMeCtlsQ9gUflW7vOclcDYrWit8+YXBLnI6ZKz3Mspv8gv3HEFzMZCVtE/0XgWRfRYGBjA+pXypZPusIYJRFjkGiVP2kD04cyHNllujLSL68TBKoRO62U0cS6GC61jBf4CTWEsE+PUOmpIxld/nHXLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198823; c=relaxed/simple;
	bh=oHwjUypwWCW+YQoWIsELatVxLyTMJeuRt5pvIwcrli4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Lfiv+Sldkql9ouaM30tyFf8jvrCTN7QO8DSYGOHCcme/eSIpwcHO/btLMfKOom0YbMhbC6j+9hfql1M5+QghzXK4wQXYIARuuKCxJIcGGlI9ye8sdk4tcXCzfY67kJToJgQWDcuJ4rS/pGBRfd1rVNPaXnFj6A25WnDhNekK/rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BlwPPcz4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlwPPcz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13EE1F000C5;
	Sat, 17 Oct 2026 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792198822;
	bh=zpyuv+LkJJXziBOSFckNAfXnvyDNe5IUOVX2kIqV8gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BlwPPcz4pWvUcvSCZhbUEDiUCV2lD7piCtHX0bOG8JkCiUjFcFcFPiznJdNSOk06m
	 gYiIT/Mk1JanozczbkOzx6/nl6R1Le5UjqcYw50Wk8CSutxGTJqFidsMxPWJ3Qk8K5
	 dGgVRSU5qlAGzaD7LqUZq0IHF2EOURc8fW3tEsOdzkeENp4p9AyHAq4MUgpb2DiJxq
	 HhQdFyDlWgtWpnJ1j6NGXe0/dJX3W5nqzm6k2XZBksKGGfxEC9lCVtTLQxh+7QHO3N
	 wR9JOJklFv0l56mPdpj0k7iUbNRZhKXu3rjgbJB7+dBnO/lx3bC+DFs+SrLxsPZXER
	 WOTxqShmpvn5w==
Message-ID: <sashiko-outbox-175092@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 08/12] dpll: sit9531x: add support to get
 and set frequency on pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016005823.13690-9-arouhi@sitime.com>
References: <20261016005823.13690-1-arouhi@sitime.com>
 <20261016005823.13690-9-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 01:00:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dpll: sit9531x: endianness reversal in DIVN register read
--

commit 1d40f7b3172f27292951c0c38e90a095069d4230
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: add support to get and set frequency on pins

This commit introduces pin frequency set and get functionality for the
sit9531x DPLL driver. It calculates hardware divider values, reads actual
pin rates, and manages device locking and programming sequences.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> index f3dbe949f219b..875a5fe783d5c 100644
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
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
Does this loop reverse the bytes of the 32-bit numerator?

Because the chip's registers use a Big-Endian layout, the lowest address
(offset + 0) contains the most significant byte. By reading from the highest
address (offset + 3) first and shifting it into the MSB position of the
accumulator, it appears to be parsing the value as Little-Endian. Will this
cause the VCO frequency calculation to produce incorrect values?

> +
> +	for (i =3D 3; i >=3D 0; i--) {
> +		rc =3D sit9531x_read_pll_u8(sitdev, pll_idx,
> +					  SIT9531X_PLL_REG_DIVN_DEN + i, &v);
> +		if (rc)
> +			return rc;
> +		fracd_raw =3D (fracd_raw << 8) | v;
> +	}

[Severity: High]
Can this identical loop logic cause the denominator bytes to be reversed as
well?

Since both the numerator and denominator are affected, it looks like this
will corrupt the readbacks and cause sit9531x_output_divo_calc() to
miscalculate or incorrectly reject requested output rates. Should the loop
read the lowest address first, or should the accumulator shift be reversed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016005823.1369=
0-1-arouhi@sitime.com?part=3D8
