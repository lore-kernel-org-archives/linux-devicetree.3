Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0FD1BD9C9
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640037; cv=none; b=IGARMZuoXtsTt72iS7a/V8/5K+8/LmgLyvvvLFhPR8PWEhZJL9BmeuBJZ+pG3lHUcT2oeyR1PsI4PMmLKaPjUn5nWyIAqq2HKRzNQkJBKqlI1u7zbP31Fknc5BduyG2SgelCPpnXPceHnGfRiN+j5wzIqJxxuj909UIZcX/nTD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640037; c=relaxed/simple;
	bh=Sc1tcSTK8gzq/Zh1KcojYKcinQqUPZYcJyiG9A1sR+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=im3s+DgBihFHenUxLdiqwnJpQlkLNkgotrqk88svsN2Y7SCCmPB1OLqiar28ZdSlXZ0fmZWsWmtvjKOaEaOylBQgZXyYgtKGr5we1yBhW72zyCYFJxaFMS/C26oFP8h0aolw+HYIIa1chntUWZaXYJolSDfUmMofz/DnO9vXloA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQTa6Bql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQTa6Bql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E0D51F00893;
	Fri,  5 Jun 2026 06:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780640036;
	bh=TDGh8jtEKUQoK1IXLw9bPS/HuiSK7XYeR6tfkXGhEw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CQTa6BqlwtS5Aud1rqQhGeFgbnWN9K7dmaqYX3rMSdNUpoKbbwunxoMeugagvvOgV
	 xZu94s7azZaColkEOugAM60swqRMzWeOh+rRFdaja3bkery58xqCtrH0bD4MNRsUcX
	 cHcC6JouQLeg4ACBvVXFotqX/sj6TY+lAe+5aTHURHoNv/6wk3Dnsoaglhq/xriqGu
	 Ec4maU7EYhErgEkdBNPg0jfq1ARDldLKL3S/SztSFzUcCNVCgKMFJxprrs5r4qG35i
	 wM2yVhQ9PQK6SLyBRFpET7Aa7mlbchw3G6s7Dilb7unv/qnnXSVzxXHkSfoIjCPwQj
	 dIMTW1e9z5wRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: ast2600: Add reset
 definition for video
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haiyue Wang" <haiyuewa@163.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605055712.118501-2-haiyuewa@163.com>
References: <20260605055712.118501-2-haiyuewa@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 06:13:55 +0000
Message-Id: <20260605061356.3E0D51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASPEED_RESET_VIDEO is added as a standalone reset, but it is alrea=
dy part of a clock gate + reset pair, leading to uncoordinated dual-managem=
ent of the reset line.
--

commit 7d99e8d0bb05e6a9bb226ee4b2b7bc8d561ba78f
Author: Haiyue Wang <haiyuewa@163.com>

dt-bindings: clock: ast2600: Add reset definition for video

Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
header. It is required for proper reset control of the video on the
AST2600 SoC for aspeed-video driver.

> diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindi=
ngs/clock/ast2600-clock.h
> --- a/include/dt-bindings/clock/ast2600-clock.h
> +++ b/include/dt-bindings/clock/ast2600-clock.h

[ ... ]

> @@ -124,6 +124,7 @@
>  #define ASPEED_RESET_PCIE_RC_OEN	18
>  #define ASPEED_RESET_MAC2		12
>  #define ASPEED_RESET_MAC1		11
> +#define ASPEED_RESET_VIDEO		6

[Severity: High]
Does this introduce uncoordinated dual-management of the reset line?

The bindings header explicitly states earlier in the file to "Only list res=
ets
here that are not part of a clock gate + reset pair".

Looking at drivers/clk/aspeed/clk-ast2600.c, ASPEED_CLK_GATE_ECLK is already
configured to manage reset bit 6 during eclk state transitions:

drivers/clk/aspeed/clk-ast2600.c:aspeed_g6_gates[] =3D {
    ...
    [ASPEED_CLK_GATE_ECLK] =3D {  1,  6, "eclk-gate", "eclk",  0 },
    ...
};

The clock framework directly toggles this exact reset bit via regmap during
clk_enable(). Simultaneously, the aspeed-video driver requests this reset
via devm_reset_control_get(), which assumes exclusive control.

Will this result in two different subsystems independently manipulating the
same hardware reset bit and bypassing synchronization mechanisms?

>  #define ASPEED_RESET_PCI_DP		5
>  #define ASPEED_RESET_HACE		4
>  #define ASPEED_RESET_AHB		1

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605055712.1185=
01-1-haiyuewa@163.com?part=3D1
