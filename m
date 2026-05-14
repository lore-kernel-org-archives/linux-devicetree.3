Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C0738C426
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782923; cv=none; b=Ws3pSGcwFw6xUUhNLV0RjVtAyFbgYAbFJxN+U5hyA7pkVJFITeSuuaISveVO0Jz9ej6jBIbhT7lYQtaj0+FKvpzRhtvEIBDz/8VVRRWCqV1vWmmxNc5RJMIGm+MzuBlfwNVUHhijQtbsoXQag24eL6/2yMvRVMlRGboXes8M6Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782923; c=relaxed/simple;
	bh=obGmQYKUp2+Yx9Oxx7lFGmmjG/BjG7cPMUWWCocdgto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rpEZdyeJhnJ+jFDsFbrAzqq5S3OaeIAKSWBa1ekP2/6c9vrHnzWmpCNWMi7EjIAFCzehx7u8qQpwLXVjxc+P0YsJoIdceQs21swddnfMO/0Z340WTqT31vuXlM2/A9r2oki/xt2T9gY8UQc58RtCerLpgR0ehbb4dRO/6GoyXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2i1mhQY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2i1mhQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12997C2BCB3;
	Thu, 14 May 2026 18:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782923;
	bh=obGmQYKUp2+Yx9Oxx7lFGmmjG/BjG7cPMUWWCocdgto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=P2i1mhQYeNGkUhcQyWN7fACqjqItLSdCWfTnmbsYaqncBblvxJnL2cHh+OUGkv51O
	 p8qrh/3wnDSpf1W3ic1XObbIckRWLlo1z9cs/F060zVrbaKNubVYh3/v1xJwaPerPk
	 oWs5/5J90yHGuzE7Tf/MKbBwzLXb0Qe+RybsFgyxcE3PnocZzxcSg0A5L562b14R16
	 infT/z4jTajexn5yPy3VtE2otMSr0yIXCrk7mMBBCGCBlj4jygtq4qEj03vEVJcGky
	 y4oXYggEf+Sr0XINdgIda6we7Bgg+zwvlr+/oWNZpbsSKZWzZxfL11uGugfkB7HooX
	 s6fAJgfbTcHaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 18:22:02 +0000
Message-Id: <20260514182203.12997C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] clk_div_mask(width) generates undefined behavior and corrupts regi=
sters when width is 0.
- [Medium] Using clk_div_mask(0) with a compile-time constant breaks the bu=
ild.
- [Low] The commit message incorrectly claims GENMASK provides compile-time=
 bounds checking for variables.
- [Low] The new macro evaluates the `width` argument multiple times, creati=
ng a risk for side-effects.
--

commit 73197243e5c552cead36bc9d0e0d0747fab0a7ab
Author: Junhui Liu <junhui.liu@pigmoral.tech>

clk: correct clk_div_mask() return value for width =3D=3D 32

This commit replaces the custom clk_div_mask macro with GENMASK. This change
aims to fix undefined behavior when the width is 32, preventing incorrect m=
ask
generation.

> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.

This isn't a bug, but the commit message claims GENMASK provides compile-ti=
me
bounds checking.

Since width is almost exclusively used as a runtime variable in the clock
subsystem, the compiler bypasses the bounds check which relies on
__is_constexpr. Is this description accurate for the common usage of this
macro?

> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index b01a38fef8cf2..b986cc054d827 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h

[ ... ]

> @@ -714,7 +715,7 @@ struct clk_divider {
>  	spinlock_t	*lock;
>  };
> =20
> -#define clk_div_mask(width)	((1 << (width)) - 1)
> +#define clk_div_mask(width)	GENMASK((width) - 1, 0)

If a clock driver uses a dummy divider or an edge case where width is 0, th=
is
evaluates to GENMASK(-1, 0).

Internally, GENMASK executes a shift of ~0UL by BITS_PER_LONG, which is
undefined behavior in C. On architectures like ARM and x86, this results in
a shift by 0, yielding a mask of all 1s (0xFFFFFFFF) instead of the previous
safe mask of 0.

Could this inadvertently clear adjacent clock controls like gates and muxes
when applying the mask in drivers/clk/clk-divider.c?

val &=3D ~(clk_div_mask(divider->width) << divider->shift);

Additionally, if width is passed as a compile-time constant of 0,
GENMASK(-1, 0) will trigger the GENMASK_INPUT_CHECK because the high bit is
less than the low bit. Does this introduce a build breakage for drivers that
statically evaluate clk_div_mask(0)?

Also, wrapping the parameter in GENMASK causes the width argument to be
evaluated multiple times. Will this cause unexpected behavior if a driver
invokes the macro with an expression containing side-effects?

>  #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
> =20
>  #define CLK_DIVIDER_ONE_BASED		BIT(0)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-dr1v90-cru=
-v5-0-34f3021aab51@pigmoral.tech?part=3D1
