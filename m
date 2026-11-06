Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971778;
	b=KR4oyWkzLPwdQP+FFpkwxeBaTJTyHKR/7cGAAlXIufEK/OJ+Nmxa+aEJCqgYV/XmE7S1
	 DaM9Vavhy2rFgVfM1SFkudXx9nbxykCSspCKNQrOwxnMut02fWOUhtXr0hD3R6hDBubG8
	 itmh0j/0ua8ownG5UnOKqxhlOnuEcYpJ6CMVC5kR7uRtW7TqJX96MpU18p1YJC/P2xSs6
	 7s1O5Zj2TyzRQ8sBt72effjqq/4MUMcZ4os9W+yH52yoD2syoxkt0rl3dSSdKVyVaisi3
	 xEaQcle3Y449S9ccgspPGJgV2zT9SJhAvEBNPzfied22s4TQGtndnjUvxzJD9xUQQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971778;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=;
	b=NqKkL+yyvJXNhrpyQgMNxENBBkIV+h439AXA/Lx46G48XWQbc9TsalXhW381TiYQgF/4
	 mdSd9S3KhjvsbGS/RJLxOYY4YNO191TaGDzT01vV1EB+gcw3i+T1BDNAmeYQoBu+GmJzF
	 FfEWJMajsEKm/T9LYAYjnpJuPLBtPlWyvLGFigU+2UmUz/JGMHOeuJvO4i9jrJv8gKBU+
	 8kw4iqN2PAzV+w0uqD7DshMKeNLdgQmjasTwnbLMNQoCLstfHMsEBWuZ/Bb/Oo6t9TprB
	 kmPWvqaK8bWGC89ooFhjYn2bnnrDmx8g0Tc1SNlFGnvZSWeV/LAp6TvwMl3LKaaDijw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpKVtSB0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA872606A326
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpKVtSB0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86701F00901
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971777;
	bh=9VVN1Qt5s3G19mMDbxU/lzocOYANDZG3AchnpUi2eHw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dpKVtSB0TJS9RXsqGV21BPeypigLT1MKlsDUFBdmKdYOxS3nCIOaxx/bNlEZNmBj4
	 PFtHjkAXLFV2SgoG+LbAYg+BNQFlRjzDjH8XcSbfqnCYzEAN0JoH5p87NRZnspeBHq
	 wSX1OgYJQAvyAcs5R+1RBrI6tczk3nVPKkQyoYXXJqBp7eQCtR/Z8rzEtQ9DiOHiN6
	 t+lQ4XutQcMwA6hei8voK7esgQKt4sxaGuBLbyWz2FgeB+KnvjBU6JYO3B5+mNvZ7i
	 1B4AzRD1jAs5DVh2ilB2K3zO04G1QthchK7KhnLjLGDApGBnPzfemx1GTeM3XRoBWv
	 cul3uD7D31vVQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso678824e87.1
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 05:29:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz0bSp4BlC5OjSWffgzZylJE69vZTV38icOcXMzfK9mCMRV3aG6YLTvhhv3NGcHQRx5qe3i1brlmrrF@vger.kernel.org
X-Gm-Message-State: APuU4Z/so1x6MgDA5kuVT27OBvwXof3LxEXZeGt5neExls2KWSGsWZU/
	vu20cHM61Hhl4kVz6WQHC6Dsx1NPfQsl1pIc7XdbOFKL0PyuU3DggA7wk5J4t+PnuPW++l0K0kU
	kotaCCJT063/SkY2ezgL+IeobMq9SW18=
X-Received: by 2002:a05:6512:33d1:b0:5bf:a12b:9ba8 with SMTP id
 2adb3069b0e04-5c003aef4d1mr778706e87.65.1793971776504; Fri, 06 Nov 2026
 05:29:36 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com> <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
In-Reply-To: <20261105-gpio-vf610-fixes-v3-3-504e19de5ad5@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:29:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
X-Gm-Features: AclHuK8gGR8RrYWVb4JB0yl9dd6W-8aSN-PytpvJXvTm5IBU_II2QIjGbup39dA
Message-ID: <CAD++jL=qUShzXutAz568YepQgYvn0Sv4hU43kfxWm+ZL3D3-fg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] gpio: vf610: use devm_clk_get_optional_enabled()
 for clock handling
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:56=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual clock acquisition, enable and cleanup sequences with
> devm_clk_get_optional_enabled() for both the port and gpio clocks. The
> helper treats a missing clock as NULL and automatically disables and
> unprepares the clocks on driver unbind, so the vf610_gpio_disable_clk()
> helper is no longer needed.
>
> Unlike the previous code, propagate all errors from the helper,
> including clk_prepare_enable() failures. The old code only tolerated
> lookup errors and failed probe when enabling the clock failed; continuing
> with a disabled clock could fault when accessing the PORT/GPIO registers.
> The optional helper already covers the "clock not described" case, so
> there is no need to silently ignore other errors.
>
> The clock pointers are only needed during probe now that devm manages
> their lifetime, so drop them from struct vf610_gpio_port and use a local
> variable instead.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
