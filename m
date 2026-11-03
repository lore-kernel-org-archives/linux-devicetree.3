Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704093;
	b=A8kkGbw5Hh4R9PFyx11UVIL/vaNSjMSVYGx63D3jkEJ+7BV6MapvQSfNvBRnCyV0EvDa
	 cOTYRv+1al2GPcw7Onqhal3saz/tD8V9iJb2in8zA2I7hUf9B42tFas4MLDgcmKxi9qaL
	 8FqCrUmpP5qIHObDAsK9aCBm9sp+dv8DhYmRqzsfx9wDVvH3vaz2OvKDnIc3rPDohqUYO
	 ZTwfuQ54dcMsyhcwqkBLLL8Dr79wYclkpusIZR8p7f8ZBaPs8RRfarMivzsGtpEeXiE+w
	 OgI0ExsBr0dfk3Sa/yRlwQqcrhe8a5kZvJGHsqP+rL9Z8ww5BbPwfpFa1Hs9ckLc8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704093;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	b=HIUdYA3pxm3MadseJJxdYd9d1faYoV1jHDRo3vnK08WuuUx2/is8Cxa9dHUSnoT3eYG6
	 j9tQfX6vmlt5Ion1x/x+c0puUscU4NRbn849GRkaWKwsgWuB+sv6lwI4Gphp4ESp69N2/
	 iNLNGrSM0FWtiY0yOVVCrjIXP8XPTkPLblo++Td9eq2UoNtrpuZ5zEOulQkvmqdhQazMu
	 jBiIRB5d6e3r4c6MOPnlwiaZBJP3vK+NmB0ZBLbVvs0D51+awaffluSb6admh4yGpH+/M
	 ygFdOD5PGQAOOC47s16sDSdJtaf5mD4PFVWL9ZxKj2Ije2YONXjqzYPc2oyzhs3a5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHj7eU2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AAD606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHj7eU2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB56A1F00AD9
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704093;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UHj7eU2yyOQGjbmDeez3g+eYL0Bv/uBQFaVXwnSjXyABHS2vICEdmQxCEJrHP2qju
	 kEAGy47lVIwdWk3dqx9JXTvkAaEe7ImmoKHeTbrMAIPL6tsz/btjcHiUuzd9vYHgIs
	 ACLyFdhhQWwRQyNgLOPxHcVSHobGrMkreSap/1L/sJ6373OYfeVsF+YX84ejAx25A5
	 andD1CvJB/16z3poGAxQPCT7qbH7sp1VcsXrMnPslbovnNMPOpuh6ncs1SFjs4I8TG
	 TgwrunHp7mwg1CLdW7//hRh/UPy0m0rM5NQtIgq8etzTLFKyE/9PA2bxs6d/a2UfBU
	 UytNUnElfgWpQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so36383311fa.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 03:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzMwV2KkvA4H9Bq3DDFZ8bPK2/fOFm6Yo6Gcl2Hy0sfVUFfeLssOTTONpgpRnuzwXS/bmCJCGcZpHKf@vger.kernel.org
X-Gm-Message-State: APuU4Z9C/5wcU/xmVTP5rRcAJlyjXjsoF/8gspMEfLlcXe9zgSzrvbZp
	I6NRPxUZ4hZDopNvs7IQQO0/FKXv8a9PyatnVUZyWNKogkskCty+sCktCuGp6jtbtb0cxzDupJG
	4SmTvI+grjTzIPq4ERn9nIgYcgSQ/rCU=
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr32247991fa.22.1793704091325; Tue, 03 Nov 2026
 03:08:11 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 19:07:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
X-Gm-Features: AclHuK_7MCsHCFGRxCGrHLGiBJS1LagIQXdv248ODfyEYfHWYTzn5PL2aAFmzB8
Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Rajan Yadav via B4 Relay
<devnull+rajanyadav0307.gmail.com@kernel.org> wrote:
>
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
>
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
>
> The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
> BSP drives this zone with the power allocator governor: control starts
> at 70 C, the target is 90 C, and 110 C is critical. The power
> allocator needs a power model of the CPUs (dynamic-power-coefficient),
> which the A100 does not have in mainline, so here the 90 C target

Does the downstream BSP have this? It would be nice if we could port
it over. Then you can properly use the power allocator and/or the
schedutil governor.

ChenYu
