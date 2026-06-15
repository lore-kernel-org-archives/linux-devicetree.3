Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0C407577
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539046; cv=none; b=kpIN8hK8QOcREiyRQL9O15UFEvRfVpaTec6OC+gH8rKyq4PCe1otIhjhnIkjjM8UGR9WC02VDAss7Ai5qOszPZN1yLEpjydGyrtlUGzBYW34BMkS4kxes10DwKCBfgQVZsMmVjDPI4xnhXFmyZs+3TYVa2wTALKYPcjqX6l6fj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539046; c=relaxed/simple;
	bh=dRjXHWGGJhnNyDkZCAyAlfClaba/96eBdVDzu25t46U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G15vqJs4TpUu6KuQJlatE+GoflqMyuPoohjdkHm+XLAe2latZCC5F01NDvF16tKwHk6vURDEw2MY3nc/069bjBCz1aaZpyF0bqrBPZJdczI7OTWmBRo6STGiiGXqYb58qSmH4xLNcb+rtPQexUMftO7CXKWwTIZlmyfE4z6TOsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rnki7qg0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rnki7qg0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5A31F000E9;
	Mon, 15 Jun 2026 15:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539045;
	bh=NpL41R7k84u6Xss+LUK0OpwKmPhY11O1AHsyt23Hvww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rnki7qg0c3mOCuljNtRzoXplagNGIi8V1kl3nhkmnhy9mQcvOnY812dwot9jv/sT8
	 5Blc+43x5cvVZbCqSCLEsDNVmRz5mBAMPbxudEu4cRyjwLoUFduNhceeOnKZN5ve5p
	 0k0yffkPeZwpvANSbANIFxv3PAeEOdu/ip038pSZ2URuP5sWaj28aGbH9D7LwWp+H6
	 vGjhE17LlrRTIA6c9wXeuvSob0p1/zV7tUvqvP7kahK4szfjiHLR8w6H0wqaiKZbWt
	 ba85pJxfUCRaaFzYLK45gA+3nenQk1BkG7WOjkeM7ZAsZEs3NJmvbDfg6lhR8PSAuz
	 YPWqNBBX4EGhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK
 for register access
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260615154805.1619693-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:57:24 +0000
Message-Id: <20260615155724.CC5A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete refactoring: open-coded logic remains for RZN1_RTC_SUBU_=
RTCA0FX
--

commit 2e16f66c80c483d619655d20fbb859a42e9d1b6d
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access

This commit replaces open-coded shift and mask operations with the bitfield
API in the rzn1 RTC driver to improve readability and match the hardware
manual.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index c7ef3c81180f4..9f9cf9882fc49 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
[ ... ]
> @@ -306,7 +312,7 @@ static int rzn1_rtc_read_offset(struct device *dev, l=
ong *offset)
>  	val =3D readl(rtc->base + RZN1_RTC_SUBU);
>  	ppb_per_step =3D val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
>  	subtract =3D val & RZN1_RTC_SUBU_DECR;
> -	val &=3D 0x3F;
> +	val =3D FIELD_GET(RZN1_RTC_SUBU_RTCA0FX, val);
> =20
>  	if (!val)
>  		*offset =3D 0;

[Severity: Low]
Since the stated goal of this patch is to replace open-coded masks with the
bitfield API, should the remaining 0x3F masks for this register be updated =
as
well?

In rzn1_rtc_read_offset() just below this change, there is still an explicit
mask used when calculating the offset:

	*offset =3D -(((~val) & 0x3F) + 1) * ppb_per_step;

Additionally, it looks like the write path in rzn1_rtc_set_offset() was mis=
sed
entirely during the refactoring. It continues to use open-coded logic rather
than FIELD_PREP when constructing the RZN1_RTC_SUBU register:

	subu |=3D RZN1_RTC_SUBU_DECR;
	subu |=3D (~(-steps - 1)) & 0x3F;

Would it make sense to update these locations so the bitfield access is
consistent across the driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D11
