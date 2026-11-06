Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990993;
	b=ZMN3QDLqBbIN80jjTlUEyNg4d8i/XWqhIAgSfT0wBQK+4ziYp3YWmKHnClUDwQpmWDIT
	 n0SmSfY18D3kj5rj2V1CTHtQRXxJHe8RZWOEd0K85LKk16qB4m5yvelXLdhIDuZkjE88y
	 DNEbHjxmfuyLjzFPYDZrgAguUkGq9g/HxJZ2dA1Ym/ReH7VLNPHRYN9WFf3wkfAzr9BJi
	 uwQ/Cp0SEshS2UVzYPQmwfm/7315U78He5YDd2Wf7M+vBueitxgCYXFWAKLYsXzSoY8Y8
	 Z+uXPAL4zT8K1+zU6XNv1wKZDlKZ8NJsUa4RJhzb0thvWLC9Khsh/1YYx6wGUUp5Y9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990993;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vV4vKNQIMcqzdAmCbyUaKDGDDzSxd9Nsc6ykZrOqeT4=;
	b=bkVgz4QjGIBRe8AZM2/nyv/8GOUwJiRV15G3FzJDha3fyD6ZhjHfrxvap8mzTbFJD5Ad
	 BxouXTLOCKV5NRL9OGK6KUmFDdIfD7Pxr52HzyyTBG4vOBlEHoiAXbUyYl33g4cd25Br5
	 YLKrIleRMldopQ/pdSf9LgY0MT0m7zWIY6tYVz+HGDEgkSDEY4xpjXj267FD2jnbN/fcI
	 KwCT/aGPwINU66Z8MS14uBF51de6RYYuj8NqAXE2qucsHiCzO5ECv4f+U7G/e2NEjqm2l
	 NlCWBWgx8318PLreEKcltXlwAnfLygdXflovzGa/6uFze9LBUx9mUq73QGOsUgLzktw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHBvsLeo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A24606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 18:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KHBvsLeo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF5B1F008A1;
	Fri,  6 Nov 2026 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793990993;
	bh=vV4vKNQIMcqzdAmCbyUaKDGDDzSxd9Nsc6ykZrOqeT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KHBvsLeogZWFkbbjcTRwnVQevb0YISl6+ioFX+lT1mHunF5IySh/6x9l99eXm1fSu
	 H1xVWnFfTewtE46W/bpWWrRrAflGjR+yE1jALE1CPTXyAnHduVF4BaRI65RFRb2A4C
	 eOPspfsBQVF9fanDg1jPmDXjVsFqgEauc8jO6HrCbPCTC++tHit91IhGuIVe3Q2fwd
	 cHGe2yULhZ3VZfzpNc++u0DO0FcSJi6xxR4UQiPvcfjrmtEJD5sZlD63ZbPMHNSoXc
	 cCbRLaYamHOu7gt0UcZfVSZw1/dLanNSITbfMdTLRINtEdjt3doHb3cgCaB1/yOV4N
	 Gr+N2NV5/IraQ==
Message-ID: <sashiko-outbox-202104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/7] media: qcom: camss: Match VFE lite clocks by
 name prefix
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gigena" <mail@andrewgigena.dev>
Cc: devicetree@vger.kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261106-sm8150-v7.4-rc1-camss-v3-4-0103e8a0bbcd@andrewgigena.dev>
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-4-0103e8a0bbcd@andrewgigena.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:49:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] media: qcom: camss: undeclared CAMSS_8150 in camss-vfe.c breaks
  build
- [Low] media: qcom: camss: missing Fixes trailer for
  vfe_match_clock_names() bug
- [Low] media: camss: unguarded lite clock checks in
  vfe_match_clock_names()
--

commit 304a59495a7a3eb87dc5d254ba4381a9abf0957b
Author: Andrew Gigena <mail@andrewgigena.dev>

> media: qcom: camss: Match VFE lite clocks by name prefix
>
> vfe_match_clock_names() builds the expected lite clock name from
> vfe->id, but vfe->id is the index of the VFE in the resources array.
> On SoCs where the lite VFEs come after the full VFEs, the generated
> name is vfe_lite2, vfe_lite3, ... and never matches the actual
> vfe_lite0/vfe_lite1 clocks, so their rates are never programmed.
>
> Restrict the new prefix match to numbered "vfe_liteN" clocks (digit
> check) to avoid matching aux clocks, leaving the pre-existing
> vfe_lite_name and bare "vfe_lite" matches unchanged.
>
> This affects SM8150, SC7280 and SC8280XP. On a Pixel 4 (SM8150),
> streaming through VFE-lite0 left cam_cc_ife_lite_0_clk at 19.2 MHz and
> failed with "VFE reset timeout".
>
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>

[Severity: Low]
This fixes VFE lite clock matching on existing platforms such as SC7280 and
SC8280XP.  Should this include:

  Fixes: bcd2adfef23a ("media: qcom: camss: Allow clocks vfeN vfe_liteN or =
vfe_lite")

> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765f..29e04d0971163 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
[ ... ]
> @@ -346,6 +347,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u3=
2 sink_code,
>  	case CAMSS_6350:
>  	case CAMSS_7280:
>  	case CAMSS_8x96:
> +	case CAMSS_8150:
>  	case CAMSS_8250:
>  	case CAMSS_8280XP:
>  	case CAMSS_8300:

[Severity: High]
Does adding case CAMSS_8150 here and in vfe_bpl_align_rdi() break the build=
 at
this commit?  CAMSS_8150 is not declared in enum camss_version in
drivers/media/platform/qcom/camss/camss.h until the following commit "media:
qcom: camss: Add support for SM8150", where these two hunks belong.

> @@ -914,6 +916,9 @@ static int vfe_match_clock_names(struct vfe_device *v=
fe,
>  	return (!strcmp(clock->name, vfe_name) ||
>  		!strcmp(clock->name, vfe_lite_name) ||
>  		!strcmp(clock->name, "vfe_lite") ||
> +		(vfe->res->is_lite &&
> +		 !strncmp(clock->name, "vfe_lite", 8) &&
> +		 isdigit((unsigned char)clock->name[8])) ||
>  		!strcmp(clock->name, "camnoc_axi") ||
>  		!strcmp(clock->name, "camnoc_rt_axi"));
>  }

[Severity: Low]
As reported by Bryan O'Donoghue on v2 [1], should all lite clock checks in
vfe_match_clock_names() be gated on vfe->res->is_lite?  Only lite VFE resou=
rce
entries use vfe_lite or vfe_liteN clocks, and once gated on vfe->res->is_li=
te,
the vfe_lite_name buffer and its snprintf() call are already covered by the
numbered "vfe_lite" prefix check and can be dropped.

[1] https://lore.kernel.org/r/ac2e970b-1f3a-4aef-9a84-034d7e460c0f@linaro.o=
rg

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-sm8150-v7.=
4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev?part=3D4
