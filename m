Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336064;
	b=dsMo94d0YZ6w7KTo5qNQPnbfX6LyDJCQGGCd0l9mtQOIK6Jp6HfD6uErZQlwYH97bONW
	 vvmnGtOFRGlX40scKaB/vsDtmKQ0QTFo/gQLEHJf4pXq2VgoqzicL/0FBshNPoyHLRcVv
	 ZvtQy2b9rXjw9lI79nEP8r5B2i/rITJhs0D/bQs2CF4ceog8tPlxIQwJWoPjyyaBWquT5
	 uYciYURUkLu+YFwkYN3y2AdfHJRey74fv3QBePrFbJgtBO7a4K6j2lFnMUZu3GVvUzoo+
	 OVDl1qo9j5CVz4bYtRAC4lW+QUK+oG2aaPQeYsAFmSQ/7Fca8qWXz6OTc4nWP0m7zOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wOhK0hwBUgnUxXmfeu0NRp3965Tii6/J0a+SPRv3nXY=;
	b=Pe3FqX+moAlfzVFQ0EOdSXksU4K6kghBIk+gR0UJedH3suuyc+a2Sdd6QUQj/wZMmQ2v
	 YieTLF//UA+nXegGczeSQR2xYky2ptzUaCcRqg+mV3j3izbzkpkE2MQ5Nioc2lg8ZgJe6
	 FyIRfQJhOcSLWH+XQXaJuC7ZmaSqoKzJhoJxAL+zfXiqn2dJsgdd9uLQWDGnZurybCVaI
	 Uq1nb8QB79un6kpY3CH4Su0OKIF+sc2a4/0SwjvhrzjedYjZQYvnk6zwykLLP5N6EGnpr
	 WBu7Xdth0iKXyqLNvT0m6LXwcOEDp6VNPHZWScNr9Pq8DWPcUHQJnIFvvRRP3zmX1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dpggjal5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1B606A31E
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dpggjal5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BA01F00A02;
	Fri, 30 Oct 2026 04:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336063;
	bh=wOhK0hwBUgnUxXmfeu0NRp3965Tii6/J0a+SPRv3nXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dpggjal51bBrPoaKy1ws6WqY11EwgAISC4R10Eov8j6MNNq63upD47AuLO80xvvnj
	 RCsF9icZUVGeyjXxolHgEwtAvqhjWSrWuDk7mwWU+1ZepNZfj/+HO4S6NV6rd2T745
	 wHUxJw45HTJcBVaVKKY4AX2L8xEWjZ8T1cf4jcr3R0e0MgyzhfrjYwZ6voM2MpFuWW
	 pdf05k+m6Ij60Y2jEtBmT34JedFSnSGiknLpY3t8s5TbCeqY2ziQF9rsozKgZQ/Jmo
	 9gELrcoY/0YLfT5HXmk41vV45uJmmSIHJZnaEtKw1jrDsZg9VfRpVzEgMrgLQzp5SB
	 0hK2hEQT5s+EA==
Message-ID: <sashiko-outbox-190440@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] net: dsa: microchip: Add fallback Micrel
 compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260516-ks8995-to-ksz8-v1-1-70d0ef4aa5f4@kernel.org>
References: <20260516-ks8995-to-ksz8-v1-1-70d0ef4aa5f4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:22 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Driver binding conflict due to duplicated compatible strings
--

commit 602050a194c8c1c059a85fb34c0d360b801f20f8
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Add fallback Micrel compatibles

Because of forking paths when Micrel was acquired by Microchip,
two devices also exist with the micrel,* prefix bindings.
Add these to the KSZ SPI driver so users can use the more capable
driver.

> diff --git a/drivers/net/dsa/microchip/ksz_spi.c b/drivers/net/dsa/microc=
hip/ksz_spi.c
> index d8001734b0574..c38eda65aaf24 100644
> --- a/drivers/net/dsa/microchip/ksz_spi.c
> +++ b/drivers/net/dsa/microchip/ksz_spi.c
> @@ -224,6 +224,21 @@ static void ksz_spi_shutdown(struct spi_device *spi)
>  }
> =20
>  static const struct of_device_id ksz_dt_ids[] =3D {
> +	/*
> +	 * Legacy Micrel bindings. In 2015 Microchip acquired
> +	 * Micrel which is the originator of the KSZ series, and
> +	 * devices branded for Micrel already existed, as well as
> +	 * some device tree bindings. These two products are identical
> +	 * to the same Microchip products.
> +	 */
> +	{
> +		.compatible =3D "micrel,ksz8864",
> +		.data =3D &ksz_switch_chips[KSZ8864]
> +	},
> +	{
> +		.compatible =3D "micrel,ksz8795",
> +		.data =3D &ksz_switch_chips[KSZ8795]
> +	},

Does this create a driver binding conflict since these exact compatible
strings are actively claimed by ks8995_spi_of_match[] in
drivers/net/dsa/ks8995.c?

Having two drivers claim the same hardware ID without mutual Kconfig
exclusion leads to a non-deterministic driver binding race, breaking
bisectability.

While later commits in the series resolve this (commit "net: dsa:
microchip: Support Microchip KSZ8995XA / KS8995XA" adds the Kconfig
dependency, and commit "net: dsa: ks8995: Delete surplus driver"
removes the old driver), shouldn't the mutual exclusion be introduced
in this patch to ensure the commit history remains fully bisectable?

>  	{
>  		.compatible =3D "microchip,ksz8463",
>  		.data =3D &ksz_switch_chips[KSZ8463]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-ks8995-to-=
ksz8-v1-0-70d0ef4aa5f4@kernel.org?part=3D1
