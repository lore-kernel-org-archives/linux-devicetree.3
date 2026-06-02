Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2E367B95
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780397124; cv=none; b=dv+qnWvR+Ws6woHQZKKFtRZXGA6x4bi5JjHiQKsZjKNz9FuOVVCfhXXHyQ0uk+DvJ5AfaZCjjBkMrizJjWTaolBOspF42KhC6tvcjT1haJzBmxsr36fg68VGojqs+aCwSWxTAGlEWIChblZ3ovm2J3mYbXXum0Y1NqZG0N3bAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780397124; c=relaxed/simple;
	bh=/1gkKzFdpeAETfqFptgj36A1DJK7L2OVGNPFI3ERX5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=szhrZbX+cwf89zOZCSBzxeXnZo0KGmBaAzOOufFDaNrqpA/OMvq5O5do//aFsJ2m098yp109bdvoP1MrZghrka8OaB+gFf5KmIbTYzohfQE7i8PzDXEzRo+jsDssov5FlKHOighvBwOL+IzbkU6kX8ul3mBdOKLb/RVfqgU7Vio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1rUVUN8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1rUVUN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2CD1F00893;
	Tue,  2 Jun 2026 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780397122;
	bh=qU/wkm+jXqfHROxcvCGVdB7Mf6A14EdMpKSr7PfxgAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y1rUVUN81Y7yjP/wugvT9u/g2jqM4MJywaZVD6a9ebnDBmYAQROQGGTC1XHXuXSFE
	 iC1hWrfGyAmiO/cXZs1VZuNO62BaXM4thkBBy3ypsDTJsMDvFPo10qadka6h/U9dSa
	 F33JDkStIjuckUjPv5RC234o17Y3M1N42jYbGyF5vsUcmFLBvQUgG1h3bwC8liaKWP
	 WPeuSeiHZXuprx+OgHlyH2Bl/4UQrlIZHZ2UrY4U/t4WRZaPhYasKKgajT84RQhiMo
	 CXOFWtYEdXqvfsbu04KYjOZtFcRDjtwFxQrZmltqEnogrxvpFus+I/4iesbZ3Lac7O
	 kdjSuJrAZ8H0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] ASoC: rockchip: rockchip_pdm: Reorder clock
 enable sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260602101608.45137-4-phucduc.bui@gmail.com>
References: <20260602101608.45137-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 10:45:22 +0000
Message-Id: <20260602104522.7D2CD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] If `get_pdm_clk()` falls back to the signoff clock rate, it le=
aves `clk_out` at 0, resulting in a division by zero panic in `rockchip_pdm=
_hw_params()`.
--

commit d4ba65106b95a91e9e92f74421222069efac6183
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence

Enable the 'hclk' bus clock before the 'clk' controller clock during
runtime resume. This ensures the bus clock is available for register access
before the controller is clocked, keeping the resume sequence symmetrical
with suspend.

> diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockc=
hip_pdm.c
> index c69cdd6f24994..8f78f7bc1806c 100644
> --- a/sound/soc/rockchip/rockchip_pdm.c
> +++ b/sound/soc/rockchip/rockchip_pdm.c

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential division by zero
in this file when the clock tree cannot synthesize an exact frequency match.

In get_pdm_clk(), if the code falls back to the signoff clock rate, it
updates *clk_src but appears to leave *clk_out at 0:

sound/soc/rockchip/rockchip_pdm.c:get_pdm_clk() {
...
	if (!clk) {
		clk =3D clk_round_rate(pdm->clk, PDM_SIGNOFF_CLK_RATE);
		*clk_src =3D clk;
	}
...
}

This 0 value is then passed into rational_best_approximation() as the
given_numerator, which evaluates it and sets m =3D 0. Later in
rockchip_pdm_hw_params(), the driver divides by m:

sound/soc/rockchip/rockchip_pdm.c:rockchip_pdm_hw_params() {
...
	rational_best_approximation(clk_out, clk_src,
				    GENMASK(16 - 1, 0),
				    GENMASK(16 - 1, 0),
				    &m, &n);
...
	clk_div =3D n / m;
...
}

Could an unprivileged userspace application requesting a standard audio
format trigger this division by zero and panic the kernel? Should *clk_out
be updated in the fallback path, or should rockchip_pdm_hw_params() check
for m =3D=3D 0 before dividing?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602101608.4513=
7-1-phucduc.bui@gmail.com?part=3D3
