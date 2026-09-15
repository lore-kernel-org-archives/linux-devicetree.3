Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC24245D5CC
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789506240; cv=none; b=khYb+cjHkTJA1FM1ZxgWIFQMFxGzg5Ip4h4rA8aJdDxrr1kNRB6XeH3OqH7otKu/r7b1i6fP//Y/svAKBqZRRZdySLdJIl6LpewL2sPW1J37q4+BDId1LLfCBzWcaa/MvhKRvNShpyAyNUrir+tpYOoODsVEC1QyqX05g/WKEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789506240; c=relaxed/simple;
	bh=uvxknpfrSTXBIIc+LxiQl0vTuoRuhBUxH67Q/wGa+4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WHJm4p0xI1mLoDwI31iy5WykgZsIsg/f31TKf4y11tBR6qqfMuQoeuo8SfOWtYMWq6V5fujDBLGPMvckmKQXG9o7Op36wzxHksNPZmE9xBy5LONddPzEWV2IFWoYbxG96yMln8hs2pR2ZtwUoCfA1LB+414v+tlAtAe0MoTu9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n66ICA8d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n66ICA8d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D0F1F000FF;
	Tue, 15 Sep 2026 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789506234;
	bh=ZQV6ssqytvvtKAHdm8zAQn8yAkBtgmwEcLHfQhGFEug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n66ICA8dqJMa/IedeiWHS5Ta7BqUOtAspkPk3KObqPWtm0GAoGES2+Li0FlEK18bt
	 FrdzPsRpMWlviZyXGxJ4CZQcCV0kvpnpJ4SoQF2T/7gFeoyIoeGNZZg6lYmkgR0Qrs
	 6iTd8lrqidbD3LgYpIKOGtK0NYG9ZUJRLu+OfDZi0nIxUqT1kv/S1XZ3WSJQmIAozW
	 cdBl7Crz4BJvIs2iIm5F+OOwONLfmaCfPga3A7vmSPkXk/GstmvZoY1EH54gDeQb69
	 BV6mMP125yrYsA9idQGcWG+trzeI5ET7GHJhiuhZG4CG4sH7aSaEolUtf7m1txeojM
	 wnfQsTWmVC38g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: bcm2835: Add the V3D reset line
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260915-vc4-reset-control-v2-4-cb3a25b07822@igalia.com>
References: <20260915-vc4-reset-control-v2-0-cb3a25b07822@igalia.com>
 <20260915-vc4-reset-control-v2-4-cb3a25b07822@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 21:03:53 +0000
Message-Id: <20260915210354.41D0F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: reference leak and underflow in bcm2835_reset_reset via byp=
assed genpd
--

commit a62442494a68213d73ba03025de353d2162a2d5f
Author: Ma=C3=ADra Canal <mcanal@igalia.com>

ARM: dts: bcm2835: Add the V3D reset line

This commit wires up the V3D reset line to the shared V3D node in the
device tree for BCM2835, BCM2836, and BCM2837. This enables the vc4
driver to use the reset line when recovering from a hang instead of
forcing the power domain down.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/bo=
ot/dts/broadcom/bcm2835-common.dtsi
> index 1e76b290510d3..39eea8ce10583 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
> @@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
>  			compatible =3D "brcm,bcm2835-v3d";
>  			reg =3D <0x7ec00000 0x1000>;
>  			interrupts =3D <1 10>;
> +			resets =3D <&pm BCM2835_RESET_V3D>;

[Severity: Medium]
Will this reset configuration conflict with the firmware power domain on
Raspberry Pi?

On boards where the V3D device uses a firmware-managed power domain, the
native bcm2835-power genpd is left uninitialized and its native clock
(BCM2835_CLOCK_V3D) enable count is 0.

When the vc4 driver detects a GPU hang, it triggers a reset that calls
into bcm2835_reset_reset(). This unconditionally cycles the native power
domain off and on:

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_reset_reset() {
	...
	ret =3D bcm2835_power_pd_power_off(&pd->base);
	...
}

drivers/pmdomain/bcm/bcm2835-power.c:bcm2835_asb_power_off() {
	...
	clk_disable_unprepare(pd->clk);
	...
}

Does calling clk_disable_unprepare() here trigger a kernel WARN_ON by
underflowing the uninitialized 0 count? And subsequently, when the reset
path calls bcm2835_power_pd_power_on(), does clk_prepare_enable()
increment the count from 0 to 1, permanently leaking a clock reference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-vc4-reset-=
control-v2-0-cb3a25b07822@igalia.com?part=3D4
