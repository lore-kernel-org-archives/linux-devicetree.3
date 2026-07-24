Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259504908B3
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877370; cv=none; b=NRNNS7Cj/f4GuImNfe8Fmr5oynIWvokFjH6bXyIvTw1Eo66MoImsd2OQBVd2Tb2s+xaHiKeUqTPvP77adfMYNa4H53n9tRdIzTgwd35pXHj/v+v0EExoch8XSy/isxMt3C0bSAeStmld8XPr3LKt8KzvvoaYi5HRai5/wtYvvK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877370; c=relaxed/simple;
	bh=0S/dBZaZIjQaLoHVct76/lS2eY5Gsp2YfmFYKvs10/s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X4SjG/0XbIK1HafhgD0lIq6ZJsElviNgT4+SUBleLS/0yj9F3Fi16uYzhFz2mcHu/Zjqn5nz4m0Uu5utIcTUEzE/O4BP/PEGtq/NFwcDwRIzsXIHSRSgWl1jxl9bvayEdYS0sAKTc6DJt+/0CEAMBBWCu3TxXeJymN6GePzkK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GrOvOIkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GrOvOIkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACC41F000E9;
	Fri, 24 Jul 2026 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877368;
	bh=+4IWhtuFRIrmQydBixVdMD0bFYP1Rq35pmFdpkfn9l4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GrOvOIkWrs9nI5stk6Vb183U+jxbm0w32wnocdR4U2uVD/ZrGlANbKKGBiRtLYCF7
	 YHeOYjZYge1SYPzNN+sXpwUpJRoQ4uqQKPSs11ZQgtJp/sXwYXdUiaZ538+5slZmzA
	 xpjEyQGDZwr5HgQOWQ678V84lFSgJh9gjYjqnMqKIHzpq5SaVd9cLiIODurl21a2UN
	 W2JjKKctmFIPL2mulH3GKpjlGo8TbOsx+MUN2AfKWCiGDnvJ5OE0KjqJ8HFqtdj3Pv
	 oc6ZH9UvYYp/vitrc9aIXaQCsAJykYzv4LJrfZD9yhZ8vkL9O3hsqnw/V9w0H7pfEM
	 yulmEFi69l2RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loading
 SMC call
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-1-6072a7ee7428@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:16:07 +0000
Message-Id: <20260724071608.5ACC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The command index `SM_LOAD_VIDEO_FW` is used in the command table b=
ut is never declared, resulting in a compilation error.
--

--- Patch [1]: [PATCH v6 1/6] firmware: meson: sm: Add video firmware loadi=
ng SMC call ---
commit 4e1de8a3e47aa991a20a91f21ed6881a59dc9c49
Author: Zhentao Guo <zhentao.guo@amlogic.com>

firmware: meson: sm: Add video firmware loading SMC call

This commit adds a new Secure Monitor Call (SMC) ID for loading video
firmware on Amlogic Meson chips.

> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/m=
eson_sm.c
> index ab9751a59b552..887caa5c625db 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip =3D {
>  		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
>  		CMD(SM_A1_PWRC_SET,		0x82000093),
>  		CMD(SM_A1_PWRC_GET,		0x82000095),
> +		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),

[Severity: Low]
Is SM_LOAD_VIDEO_FW declared anywhere? It looks like it was missed in the
command enum in include/linux/firmware/meson/meson_sm.h alongside the other
SM commands, which would cause a compilation error when building the driver.

>  		{ /* sentinel */ },
>  	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-b4-s4-vdec=
-upstream-v6-0-6072a7ee7428@amlogic.com?part=3D1
