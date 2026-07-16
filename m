Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25513BFAEA
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240725; cv=none; b=PHzpm0G3Buo20OtxzrA/kVapsNMAgkf0/kuYQFH7OkABT4tfVtjAb7yp1y8XqSYDpT0J8W3NnbuObnGx3EGpcF4FdzxuK09Za4smlO9pUSoW9SUnW/s+vpc5u06cL1rr8PtqXAUYg8ctcXyvbOaVsdlRBLFQ6MuPoxQhnrqDe/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240725; c=relaxed/simple;
	bh=n0my5HEGItJimrriuzZNpE6o7ysKGH/q3GeIuIdorp0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UGZ6zh8CjBfjECpQd8tO/If5eYhdtqKCMiHOMmWHV3BFuvQZbug3Kwm95ltrJoswmNRDn5h/oDZj15FlqS8SDWTCSezwKDSvCYGYBak2s8UY8ZmrLBqdnYsgsbjy34zRlhiSZAtYf386crsvYpCaLtpH3EOE/7i7bnf6XQmM3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBrepYGT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBrepYGT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC76A1F000E9;
	Thu, 16 Jul 2026 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240724;
	bh=gU0iP13+RfouvfHVkaahFQ1zO465Kj6qHfc4QGCebPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBrepYGTBYqJBAFbekJ3nGuMapJiHV2q5V1BR9Rd5RXKOw/NKfkN/o7hRK2/OZRSQ
	 SiO6/who72wfeiKREfwEPKaSOLqD07+CkcHuW7C383nJXhDf8waH2x66PKm/TTpHzs
	 4eKMv3w+CBtD+L+Lb6Hrg5X0ORmwvxygYPkIusZWXMdjJHoV6T/iF+hwgnrG15D3Cb
	 L8+NHrLOoiNn2DH3e8Vc0Gy3POmPlo1ycAdY0hX84zumSayHZVA/KPGWpKvkl3ccI1
	 K/HIny/tRntioUXPQpyT68HdMmQXjFk06hadCvkA2KoUg/LMRwjOUAyltP2uqADOji
	 c6k4nBPvtxFJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/13] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717-zx29clk-v7-3-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-3-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:25:23 +0000
Message-Id: <20260716222523.BC76A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added clock and reset macro definitions overlap with exis=
ting definitions for a different controller (topcrm) in the same header fil=
es, using the same `ZX297520V3_` prefix without disambiguation.
--

--- Patch [3]: [PATCH v7 03/13] dt-bindings: clk: zte: Add zx297520v3 matri=
x clock and reset controller ---
commit 5ec0de6373fd034a146a7bae84009d3814552ed6
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob. A simple MFD driver
will instantiate independent clock, reset and hwlock drivers.

> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h
> index 1f010ff4e6ca6..09ee3de679d96 100644
> --- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
> @@ -63,4 +63,45 @@
>  #define ZX297520V3_HSIC_WCLK			55
>  #define ZX297520V3_HSIC_PCLK			56
> =20
> +#define ZX297520V3_SYS_TIMER_WCLK		1
> +#define ZX297520V3_CPU_WCLK			2

[Severity: Low]
Could these new clock macros overlap with the existing ones in this header
and cause confusion?

The existing topcrm clocks in this header also start at 1 and use the same
ZX297520V3_ prefix, for example ZX297520V3_M0_WCLK. Is there a risk that a
developer might accidentally use a matrixcrm clock macro for a topcrm node
or vice versa? If they do, the C preprocessor will substitute the
overlapping integer without error.

Would it be safer to add a distinct prefix for the matrixcrm clocks, such
as ZX297520V3_MATRIX_?

[ ... ]

> diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/d=
t-bindings/reset/zte,zx297520v3-reset.h
> index 43db72bb59de0..4682d4a599c6a 100644
> --- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
> +++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
> @@ -29,4 +29,16 @@
>  #define ZX297520V3_HSIC_PHY_RESET		20
>  #define ZX297520V3_HSIC_RESET			21
> =20
> +#define ZX297520V3_CPU_RESET			0
> +#define ZX297520V3_DDR_CTRL_RESET		1

[Severity: Low]
Does this identical prefix also cause an overlap risk for reset definitions?

The new matrixcrm resets start at 0 and use the ZX297520V3_ prefix, which
overlaps with the existing topcrm resets like ZX297520V3_ZSP_RESET.

Could adding a matrixcrm-specific prefix here also help prevent potential
device tree configuration errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D3
