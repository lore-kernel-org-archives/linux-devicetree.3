Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6D1313E07
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782677369; cv=none; b=cWPwRFQu3jZSUFDzkckv1dpT/1vCqfPfC8GErYMTKlESqY01Ub5p+LUH/0OZeUyOi0/7+lhvP3vh+QDAWk5+Zoh9dhZpAng1TZuDjphbsGVyjdfP6hpUsCPNP/EUgzYdj3Cb3j6blkzxn5qn43CyUrOqRY3bAyp6IHG2DtGTbIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782677369; c=relaxed/simple;
	bh=ExBl3oKhjiF4kmX6AH+YrEGLqgFtSM7lqD7zFBPISAw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f3P+8KnKO5f9bxXzmOpC1jhbT9+hbVhmfVBT2Tu84r/n/ge6JEED78FkPzBM7Ser/DZ20LaxGL+C0M73JaR3BRpj/PgSEQYdDDTfih9Ndyom4+qMx0NYR0vA6cv5L2W36hLBqqOnZPS9koT+72I5TpCeF7temEkQMo0fvbX6Vj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKlCMYFH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKlCMYFH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238901F000E9;
	Sun, 28 Jun 2026 20:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782677368;
	bh=0WJk51zGt01iwqpTZfHpeo0lZvikWq1zITCdKsA5apk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKlCMYFHFRt8Owg2Ut+KqjbehG2OEjUu9hF24ODN3BFLxnmOaxx9QLYNlngbZIhlL
	 uaPJ8MzfzSGRGDgFiVLEjqmWtD1y32emAMZ8yV+juDIqRTBJ+j3oB1z5O0P84earQm
	 g/mDoRCZHzUnb2WhobLWBV37GkRDQN3OhzGCt5jIUKXohOHnLA86MacO+nc4CwBApU
	 Fc/h0aa01JklbzSqShKAyvzY2g7eel0Jscn9qFEc5vV6Vu4XR63GNVuhR426GPBo8b
	 EaORcwHN5OC+Xse4ABcEFKrQsEeSowpz6gA679+6cgTSkbJrJTi9GSjXbf88nUqwQE
	 YwuokcxI5u2/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 02/12] dt-bindings: soc: zte: Add zx297520v3
 matrix clock and reset bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-zx29clk-v5-2-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-2-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:09:26 +0000
Message-Id: <20260628200928.238901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The dt-bindings headers for the new matrixcrm clocks and resets reu=
se the exact same indices and generic prefix (`ZX297520V3_`) as the existin=
g topcrm clocks and resets, creating a risk of silent device tree misconfig=
urations.
--

commit 5a96f2683fa1c9255c9f0d3649cfb566a763da11
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: soc: zte: Add zx297520v3 matrix clock and reset bindings

This adds the device tree binding schema for the ZTE zx297520v3 matrix clock
and reset controller. It describes the clock inputs, subdivisions, and hard=
ware
spinlocks. It also appends the new clock and reset indices to the correspon=
ding
dt-binding headers.

> diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-=
bindings/clock/zte,zx297520v3-clk.h
> index de1c08b6a5a9f..8a6aa456a7089 100644
> --- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
> +++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h

[ ... ]

> @@ -94,4 +94,41 @@
>  #define ZX297520V3_HSIC_WCLK			86
>  #define ZX297520V3_HSIC_PCLK			87
> =20
> +#define ZX297520V3_CPU_WCLK			1
> +#define ZX297520V3_CPU_PCLK			2

[Severity: Low]
Is there a risk of silent device tree misconfigurations by reusing the exact
same generic ZX297520V3_ prefix for these new matrixcrm clocks?

Since they restart the index values at 1, they overlap with the existing to=
pcrm
clock macros. If a device tree author mistakenly uses a phandle to topcrm w=
ith
one of these matrixcrm macros like <&topcrm ZX297520V3_CPU_WCLK>, it will
silently compile to <&topcrm 1>, which configures a completely different
hardware clock at runtime without any warning.

Would it be safer to use a distinct prefix like ZX297520V3_MATRIX_ for these
new macros to prevent mixing them up with the topcrm ones?

[ ... ]

> diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/d=
t-bindings/reset/zte,zx297520v3-reset.h
> index 43db72bb59de0..81ffc8bc34c5c 100644
> --- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
> +++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h

[ ... ]

> @@ -29,4 +29,14 @@
>  #define ZX297520V3_HSIC_PHY_RESET		20
>  #define ZX297520V3_HSIC_RESET			21
> =20
> +#define ZX297520V3_CPU_RESET			0
> +#define ZX297520V3_EDCP_RESET			1

[Severity: Low]
Does this have the same overlapping index issue as the clocks above?

These resets also use the generic ZX297520V3_ prefix while starting over at
index 0, creating a similar risk where a device tree author might accidenta=
lly
mix macros from different reset controllers without getting any compiler
warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D2
