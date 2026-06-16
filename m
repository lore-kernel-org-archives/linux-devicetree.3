Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684D1360745
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781620124; cv=none; b=hoZ2I+yaV2O+2FRi0OnYbgXjHvQmHMxkpopATQ4yUiezNMU5wHOeNipK9CBn72v9VBceg6TLyYGwzUzpxw30cQZ5ODxFmQJFGiy69hfkdAPUv9wkvhSY/57SaCPy87e5Ucu/pBHeVQ9ebmYNoE2s1rHoC56MsuYEwt4qWiWFq0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781620124; c=relaxed/simple;
	bh=TnI4cP3PvusiiVWWumWcTOumwSyvRa3bivIag33PeHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PUKTai2oJMksrHS6D6KPuoQkbgK9U2KRhGpG28jBkwCgb3LpKEM3pqpZsVBXLMaOfhkcYJ7RQ22S7q99wybsJs0PaHOf09GCDAHBVu/UUTOJUu9VrsjFzRqcgNhGErku3h0dulMXJYqVqQwFThPnpOjtKnGrnpXmZRyPwhuN+Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMw/ZwyW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMw/ZwyW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A06B1F000E9;
	Tue, 16 Jun 2026 14:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781620123;
	bh=j+8CZUb8phkD95PIWdQMyeMA37R0PklRm1x4ZsU8vc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hMw/ZwyWoEcFrDBq6urhGlmSqlX0FY6ftUEvgHVvoz8OL65y8wRjMuxneuK5F/70b
	 Ys/TtrwSoecY91K5qqkrk5U6GJPCwYgFIGx8HZOnoKGyi4/Gnl5/BM9pBcuZWJicn1
	 VvzRPYJ97jW653FWOQ3ejp9yAHWpbj/cBHCXUnAMMv7L5v4wc0vsJvs0hHaQYPZodq
	 ujpFUObM6kAGkllX6mF6lVGrZ0dgFckuPkBhdXFByEh7T7GBtjZj1muO2EIImTQZ3d
	 CIGxVsNbYHLMJnjeggvUXbcPGjHtGAuon8vE9CdVsqV9KayexGRnGwwpnyJ7TXcfrs
	 eRchxVfgWuN+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] mfd: mt6397-core: add mt6323 AUXADC support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar via B4 Relay" <devnull+rva333.protonmail.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260616-mt6323-adc-v3-3-1c27c588185d@protonmail.com>
References: <20260616-mt6323-adc-v3-3-1c27c588185d@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 14:28:41 +0000
Message-Id: <20260616142842.0A06B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] mt6323_auxadc_init incorrectly powers down the AUXADC clock instea=
d of enabling it.
- [Medium] Failure during mt6323_auxadc_request() does not revert the hardw=
are voltage buffer enablement, leading to a permanent hardware state leak.
--

commit 6b92fe47672fd5e88ade7a2d9b916034b0dc7bca
Author: Roman Vivchar <rva333@protonmail.com>

mfd: mt6397-core: add mt6323 AUXADC support

The mt6323 PMIC includes an AUXADC. Register the AUXADC in the mt6323
devices array to allow the corresponding driver to probe using compatible
string.

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e0..013b0857fb548 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -125,6 +125,9 @@ static const struct resource mt6323_pwrc_resources[] =
=3D {
> =20
>  static const struct mfd_cell mt6323_devs[] =3D {
>  	{
> +		.name =3D "mt6323-auxadc",
> +		.of_compatible =3D "mediatek,mt6323-auxadc",
> +	}, {

[Severity: High]
While reviewing the driver this enables, does mt6323_auxadc_init()
incorrectly power down the AUXADC clock?

drivers/iio/adc/mt6323-auxadc.c:mt6323_auxadc_init() {
    ...
	ret =3D regmap_set_bits(map, MT6323_TOP_CKPDN2, AUXADC_TOP_CKPDN2_CTL_CK);
    ...
}

The Mediatek PMIC TOP_CKPDN2 register is a "Clock Power Down" register,
meaning that setting a bit to 1 disables the corresponding clock. By using
regmap_set_bits() here, the clock appears to be explicitly powered down
instead of enabled. This would prevent the AUXADC hardware from functioning
and cause subsequent reads in mt6323_auxadc_read() to perpetually time out.

[Severity: Medium]
Also, does a failure during mt6323_auxadc_request() leak the hardware
voltage buffer state?

drivers/iio/adc/mt6323-auxadc.c:mt6323_auxadc_request() {
    ...
	ret =3D regmap_set_bits(map, MT6323_AUXADC_CON11, AUXADC_CON11_VBUF_EN);
	if (ret)
		return ret;

	return regmap_set_bits(map, MT6323_AUXADC_CON22, BIT(channel));
}

If the second regmap_set_bits() fails, the function returns without undoing
the enablement of AUXADC_CON11_VBUF_EN.

This error then propagates up to mt6323_auxadc_read_raw():

drivers/iio/adc/mt6323-auxadc.c:mt6323_auxadc_read_raw() {
        ...
		ret =3D mt6323_auxadc_request(auxadc, chan->channel);
		if (ret)
			return ret;
        ...
}

Because this returns immediately on error, it skips the
mt6323_auxadc_release() cleanup step. This leaves the hardware voltage
buffer permanently enabled until the device is reset or a subsequent read
succeeds.

>  		.name =3D "mt6323-rtc",
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-mt6323-adc=
-v3-0-1c27c588185d@protonmail.com?part=3D3
