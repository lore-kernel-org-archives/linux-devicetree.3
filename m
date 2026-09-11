Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9793148A7
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115867; cv=none; b=OK7iMKa7p5v8dqNDEtB1L1t3x0JnQ8ZwUrvJpK5E0hu7/ajiWLvgLFujFEgDbNTn6DCAEmTZDK5tLdx8MtDEiLCgBbhYKwoM9U26Xl51KoqCP0GAc0LIlHysVVfBmIAucsPvdCKPXrJUqXlDOCqKg3DQnrc30hPwTheZUVvsY28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115867; c=relaxed/simple;
	bh=F7Oo2h+NuYgUFEv4GvjPEYKEgsEZ7UrO3UzBsDWMQ9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KyK6/BB41OxgSVUV0IE4K04fct4uugiFl0ZuDMV0aI2UXGMFY8bP8xj6XwyzpfdgsWvAqV5Ob7DWbMtLySpgbqROrlvCg/ReZ/tkMs44IiaQnpaPkK27X/dTsi1zGZ2CFv4UocSHNrTYtgkvVTNban15TN7lM15GVNlRvGJJ9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODVaoip7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODVaoip7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6621F000FF;
	Fri, 11 Sep 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789115863;
	bh=U/+R2RBZtLxPW6+25viO0bXXL/EUGvVqhK7SwO+jNZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODVaoip7GFHffz3k8iEAYoIzaT6bQkrwMLGLBMtw5cxFot0tb4oYVLzr/a8TakBgD
	 pyOE2wEa6LVvHzPWtbSldpN2h4LtZj5+xz9mB1N/TNMoSi9Ro0csvkxbgKhg3g9hFT
	 BlUhaDwPvmFFpQPPuV8RxuJ1ZPLocv0Vqrmc3kYdotw0bOSsbNli+VEO2XcCXL02kQ
	 LrFL24KEj4kIWYkcVx3J5unV/GMEzxABQQISAFfAF3hiONb0UKDtxJRXWch4LwfEfp
	 IeIE+IPpzTxo3l2yF6tc1VJeHs7nB84HHiVOU2jTTgPhpBjI5OR+0W38bHQtAP7DHd
	 6a+Z/gZsGQjAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] soc: amlogic: clk-measure: Add support for more
 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chuan Liu" <chuan.liu@amlogic.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, robh@kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-3-940e269aa52f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 08:37:42 +0000
Message-Id: <20260911083742.9C6621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `clk_msr_a9` array is missing the `const` qualifier, causing it=
 to be placed in the modifiable `.data` section instead of the read-only `.=
rodata` section.
- [Low] Possible typo in the clock name "exit_Tsin_B_CLK_IN" for ID 26 in t=
he `clk_msr_a9` array.
--

commit f03ec42ca0d7092f88d23ba06d4bfb38fc33ede1
Author: Chuan Liu <chuan.liu@amlogic.com>

soc: amlogic: clk-measure: Add support for more SoCs

This commit adds clk-measure driver support for several Amlogic SoCs
including A5, A4, S7, S7D, S6, and A9.

> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogi=
c/meson-clk-measure.c
> index 0d4ba2555d175..671e0c3753dec 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
[ ... ]
> @@ -1041,6 +1041,843 @@ static const struct meson_msr_id clk_msr_t7[] =3D=
 {
[ ... ]
> +static struct meson_msr_id clk_msr_a9[] =3D {

[Severity: Low]
Is the missing const qualifier here intentional? Without const, this array =
is
placed in the modifiable data section instead of the read-only rodata secti=
on,
increasing the mutable memory footprint.

Other clock ID tables introduced in this patch, such as clk_msr_a5 and
clk_msr_s7, are properly defined as static const struct meson_msr_id. Becau=
se
the driver only copies the elements from these arrays during device probe,
the original template array does not need to be mutable.

> +	CLK_MSR_ID(0,  "sys_clk"),
> +	CLK_MSR_ID(1,  "axi_clk"),
[ ... ]
> +	CLK_MSR_ID(24, "ddr_dpll_pt_clk"),
> +	CLK_MSR_ID(25, "mod_Tsin_A_CLK_IN"),
> +	CLK_MSR_ID(26, "exit_Tsin_B_CLK_IN"),

[Severity: Low]
Does this string contain a typo? The name "exit_Tsin_B_CLK_IN" is exported =
to
userspace via debugfs.

In similar SoC definitions like clk_msr_s6, the corresponding ID 26 is named
"ext_Tsin_B_CLK_IN", likely standing for external. Using "exit" here instead
of "ext" could confuse users or break userspace scripts expecting consistent
naming across SoCs.

> +	CLK_MSR_ID(27, "u3p2pll1_0_clk_div16"),
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-more-socs-=
to-support-clk_measure-v1-0-940e269aa52f@amlogic.com?part=3D3
