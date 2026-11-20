Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188854;
	b=2/XOY+ttGGIAeX6v7cHN/dBlOW9k9GoSBHyY/sbmsoeDxdkWqkuRDhcw0MCWMwCagoL0
	 bkTtGWDFH0CbpdEbW7gxib9vso+H48/msDOWPXU4Jnqb5yGHHALPc5Ti6Wo8Gv8AmGBfB
	 Vy7cDKukANVSNmDpOhY8LRV3/sTIV9GmTm9vm+8OSnnk6T8dxSrWFinjDx56y1hjXpBy2
	 AkEbHkwKs3ZHtI9GgbWFzFq/39QSOfxSBSU8XXYnZ48z3KzCewH1YBshW1Sd9rtp4W+Ep
	 pJ0YHwK6GmMC+uq1zZ3am7jnfRPWq6nhZo7Tge3mQGkRV5USF6uAS+DFAV06EFeLh/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188854;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=;
	b=okDsOC7ntPGSbbGHkjioukE/Cc8QO0CTPyDlM36dgMOLNxSzJi+4JuFUeCz57xpz5q9h
	 XKC1Gub6qBfzUuC09MK2Gsnv0u9qB4U1XF6uepzEr+NSkaZpuoNRgBmDSMeCt0nH0bxrA
	 x7op9nML7nGxiX2TNNE0LHwf3mzNuDTG6Z9PhJoK8mNgpdsVrJT1rjg2Nm3ObhxjO6s1J
	 y7ooYcfKH1RkIjQpM0q+0IpW/gyhp/JdH+1FHeMqmUSrFkq6smyA6xfWdB6WR6yvNqqAD
	 y+X++JfrExV00CcnhnTPI3GZ4qVczuEUjP2FRpjlLMZp0BWHcOUqZw5KJ1YGSnfBj8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diq5dYJw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0A9606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diq5dYJw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4491F000D1
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188854;
	bh=jmWJeixrMEXpie6DAXTK5CBYLs8pa8Ts1AuNfFgx9pw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=diq5dYJwexIEqTPONPlehD1IJUyXPFrZnvm/bNqWSZmLM2zjA4Y1R2aZtJEFdumPp
	 fTX42Kd4HRTy/GqOdEgojO2vGN50XdQQy/z9i/sBi8HiqRhcvrQz7gazoDYtGZKDzC
	 E0ps70NLaBHMpKo25cu0/+n56C8xwUtFcvviCcVBmh2oVf/gKeAy0BA0yA7MWeJoXk
	 xpZ59LBQaRDzGT4MMO5AOkFfE67L7I+jQDOSLCFu+cWbACiEp2ZMhB9omlMZWG0FyT
	 U9zsnq2WaDClLdcbaRIHTAPdFBWFtt7Hy2ools29GVj7xLS3Vej2JbArQVpJps2FOb
	 qUHVY17bERT4A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso642553e87.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:34:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE4cgOn9lWkLoLlvsLUf64TkIy/aDxsob4YOeax8VEtjq3NDknaIbQTHIi6B08OvNj6xfHp1kBFOnb5@vger.kernel.org
X-Gm-Message-State: APuU4Z9a8NscVGaN0dSwVHPNg0suLuocCSKk9Sude9AT/C0OHKhnja/t
	kUuIekjTChqkPF+c/We15aa8pdlBxb7LMr602BuaTjSYv3Ir9VGfr1xdEAuGnfJXYmqSZet3b5J
	3OgeEQ/ZMs9f6L48+SQIj5weyw7MAqsY=
X-Received: by 2002:a05:6512:3a83:b0:5c1:4bd3:ef75 with SMTP id
 2adb3069b0e04-5c1bc6f6a8fmr1168547e87.1.1795188852628; Fri, 20 Nov 2026
 07:34:12 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-1-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:33:59 +0800
X-Gmail-Original-Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
X-Gm-Features: Aa3M54rsbUPr3cLC2JjkyHhLV0j0Q1SzwSnaTdHQp00CEqW85K3o6tde4cQxGOw
Message-ID: <CAGb2v64homW4cRqrtDVj3N29XDw3f4ZEmAok1btW+XuWd8tBbQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 LPO clock for AP6212
To: ipfarher@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:40=E2=80=AFPM Ivan Pfarher via B4 Relay
<devnull+ipfarher.gmail.com@kernel.org> wrote:
>
> From: Ivan Pfarher <ipfarher@gmail.com>
>
> The AP6212 WiFi/BT module needs a 32.768 kHz low power oscillator (LPO)
> clock, which on this board comes from the RTC clock output (osc32k-out).
> Nothing in the device tree references that clock, so it is disabled as
> unused during late boot.
>
> WiFi keeps working without it, but the Bluetooth core does not: with the
> LPO gated, the BCM43430A1 ROM answers HCI_Reset and nothing else (no
> Read Local Version, no firmware download), so the controller can never
> be brought up. Turning the clock output on by hand (RTC LOSC_OUT_GATING)
> makes the controller answer normally.
>
> Reference the clock from the WiFi power sequence, as other boards using
> the same module do (e.g. sun8i-h2-plus-bananapi-m2-zero.dts).
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: osc32k-out stays enabled and the Bluetooth controller
> answers HCI commands. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Fixes: cf8e19e1ec15 ("arm64: dts: orange-pi-zero-plus2: enable AP6212a Wi=
Fi/BT combo")
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
