Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA9F3438AD
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015232; cv=none; b=bka2I8T74DvWJ4OFGfWlBOleEA/2mn26M8wRFZCFA2VIscJqUOTuXpqb9v8EO3HL0W6w2tP4m5Jgt9YdxsBf2yZKAbsMTi3x+TXHGyZdI1yBMbF42hU3AE77YpTG7LTtseW6uWdk94ni1LoJYhvqqHeGM6vOkjbgHD76vAKT6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015232; c=relaxed/simple;
	bh=ryfSeqLL/ix1ixCXMccxVuKBqF/xvY0/wZl8CJK3Rko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t3C8oInZcsl+OKsfIyPcA4VBHFT4EULG3CETrjlwVqxDAZx0Ckl7Txu+89uKfUuPPNLaGEOmwwFxjp70QgvtdY9CUsRIY5mHeRv1KVya11SmXE3n74HBFVsWiP0GRgbHhiDvepntjLWYSntUg0nO//XC3QeQ0SoK4rsVhgDeo/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsbWb56P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsbWb56P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DDF1F0089A;
	Tue,  9 Jun 2026 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015230;
	bh=1WNRgl5sytWdndCzviRGahm/cO5siU4xGJJd734NGVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsbWb56PEQ4373CM9D10ToQfIAt5l2BWZjQGmBGAfRf7lH6nW8B9Sl3cpHWv7ez0K
	 72IqzrmALSDJfQiPW8KFv10s+/kIgW6LOQPA6/xhY652tlGGShKVKMDyeWkfLudtiE
	 JW3SPustfvuHgXtqrJtEYxJvksWUxN4KULaTTd/sOVuHPGAGqS+PgfMD9eSNEzYPP3
	 8TT1EITn8G/qnk8u3Dm4yIKE5RGQmmR864ugSP4qAbD8C0cVN36YjikuY2Avj2Ul8w
	 Orl5OQFKLYWgJYEyTDBcS5YfbM3iiiMvrW3t+3tDuDH6TewypELY0vRQPMtEuJ3uc+
	 PI6R1bgICiaRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:27:10 +0000
Message-Id: <20260609142710.98DDF1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Removing `apss_tcu_clk_src` leaves the static constant arrays `gcc_=
xo_gpll0_gpll1_gpll2` and `gcc_xo_gpll0_gpll1_gpll2_map` completely unused.
--

commit 358707fc8fbfb6b33cbd35ecd5569222e1050407
Author: Stephan Gerhold <stephan@gerhold.net>

clk: qcom: gcc-mdm9607: Drop incorrect apss_tcu_clk_src

This commit removes the apss_tcu_clk_src clock from the MDM9607 GCC driver
as it does not seem to exist on this hardware. Reading or writing its
registers results in 0 or crashes, and its frequency table math was
broken.

> diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm960=
7.c
> --- a/drivers/clk/qcom/gcc-mdm9607.c
> +++ b/drivers/clk/qcom/gcc-mdm9607.c
[ ... ]
> @@ -677,26 +677,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src =3D {
>  	},
>  };
> =20
> -static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] =3D {
> -	F(155000000, P_GPLL2, 6, 0, 0),
> -	F(310000000, P_GPLL2, 3, 0, 0),
> -	F(400000000, P_GPLL0, 2, 0, 0),
> -	{ }
> -};
> -
> -static struct clk_rcg2 apss_tcu_clk_src =3D {
> -	.cmd_rcgr =3D 0x1207c,
> -	.hid_width =3D 5,
> -	.parent_map =3D gcc_xo_gpll0_gpll1_gpll2_map,

[Severity: Low]
Does the removal of apss_tcu_clk_src leave gcc_xo_gpll0_gpll1_gpll2_map
unused?

It looks like this clock was the sole user of this static array. Leaving it
unreferenced might cause -Wunused-const-variable compiler warnings.

> -	.freq_tbl =3D ftbl_gcc_apss_tcu_clk,
> -	.clkr.hw.init =3D &(struct clk_init_data){
> -		.name =3D "apss_tcu_clk_src",
> -		.parent_data =3D gcc_xo_gpll0_gpll1_gpll2,

[Severity: Low]
Similarly, does this also leave the gcc_xo_gpll0_gpll1_gpll2 static array
unused?

If there are no other references in drivers/clk/qcom/gcc-mdm9607.c, it
should likely be removed as well to prevent dead code and warnings.

> -		.num_parents =3D 4,
> -		.ops =3D &clk_rcg2_ops,
> -	},
> -};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-qcom-clk-m=
dm9607-fixes-v1-0-5e9717faf842@linaro.org?part=3D7
