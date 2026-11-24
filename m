Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514201;
	b=vqLGoa2MU8bncTHmnbKh8GFGudL2tduFMhNxCMBWXAL+uJyfbI1f2NnvTfDx+j9ZFG7f
	 ONskNKfMOl5cUjlYISxgDk0+G46FjtC/yhzL2RYNKpnhMSXvalKbbpIInUaj9j4Tphb9j
	 z22/1HRST7HHrTjkYCr/Jdj26BOiUuPvonCmLgx7QOdWgKghY4A57mTGE9t1ppSBzmWK9
	 lk0D8aHUVB142TsK8RvBDhm4blDlIrmF4OLBHFn618zC3WrYZIxFDjC+rdX4Lg72YbDG1
	 cu5squ4LRtPBY+AEHa26BBO8AyUmeufNIityvbLN864UqUNFiK7W96tC/vH/T25ySYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	b=X35qkOnXkVMvUHBEWISus4jf2eaCRmIVGqHM3yv6Eli5ONgvwinlh4vzi7SPVbBsZ0n3
	 JkaXX06egMuoPB7nfxZ+l3gLYyjZb3ZphbzbtgItflQ3nh1djXZ4al8YKUnKRASMVe085
	 3nV2R5LjaLr2uFUSahTNgbmG8qvKpDLejLmG4EFNoWEq09sx1Dz51CapMq6ntK5686kZe
	 nwGwSFF1PLVy5MO9BB6wUpVL3p/WGvpuyrvCnrJw/mwFW4co6LW+gWTA0pk8ILPoP9Sga
	 +lfLi6Zbjw58seESuynaaFkCyJ2Y4VkqpmItR9U3P6sQglef99mrQ1fE/HCNUWXGpWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1C606A32E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882F61F000F2
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514200;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf2VEmI12JFLEgUGjVFCTv0QjW3DzCel4nyHoZURtSOyTH4f6ATQ1F9160ju0vvcJ
	 1PxA6UlQXZt13PWLF8DKe4G2fyNtZEfkNquipMkfq4cB4Vyyt9Vb8QLIjeBylBY68V
	 8fkdXxi2Q/3e9CgZNUHA8x8SIhVN3xZ7Go/+IbWqCEQoBiEztDO1QPeqv+6bOeCBfl
	 eGtwiPdREEoZEEaGpzvmpTVcOtD31t91A/v5X3KXjPTtvGx+yrS5sJKsvgO+GX4oTb
	 OlIqX7l7+ISlIVFgCxMWp9ns6b0uSX94naPiT/WMszXh8HjzkH/+81WGhZ75t3GckW
	 FxW2yjPsT6HCA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab4354db11so41959971fa.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:56:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEJNpuNl9YJupo7xcZKizJbrklPvNGVOQEBB/DxlT5G+KhK0rZCeXEeb3fJanNyfBeoxx/Or9yyR4Td@vger.kernel.org
X-Gm-Message-State: APuU4Z9xtZq7yCgL2cNalMfDtf8jS949VH63qerr6gHQuaRgqyBHNYk7
	8W/GZuO/TfaIoY9jKJ2/JJaqLJVs7djPqheCb9psvJ9DIYd3gaB5cF6H10LxhyxL6l6Xc4U8YcK
	JGnhQBiEROnGiyV9UG8moxTb6g1BUvzw=
X-Received: by 2002:a05:6512:1048:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1bc81c49bmr3664194e87.55.1795514199208; Tue, 24 Nov 2026
 01:56:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com> <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
X-Gm-Features: Aa3M54pJBPNtS8HBHNO_8ov-NITzhFzIUmDM0dw5V6Dl7sMdZPPnTtRSJZShNYc
Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
To: filipp.dunsky@gmail.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:27=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Use the global syscon regmap for the five GPIO mux registers. Each
> bit selects GPIO when set and a peripheral signal when clear. Support
> GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
> port. Do not guess mux settings for the other peripherals.
>
> Use masked regmap updates so independent pins and users of the shared
> block retain their settings. No register changes are made merely by
> probing; only a selected state or a GPIO request changes a pin.
> Register and initialize the controller before enabling its own hogs.
>
> AI assistance: Codex prepared this change from the existing OpenWrt port
> and GPL vendor sources.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
