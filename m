Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188911;
	b=gjGmTMvNn5dRih344kGVyMrS9BZJVVOeYKmXq3Iz0A0CYoATVK0H60jGuzFdOMv7C/PF
	 Gg2i5vgNknParDIelZORBn8V/WjxapsBC9Tt1T+SuTLxR25uthFRyOTp+mA5b8ivGwPiC
	 w9kQjEvG1fmF+RdScwxjISQxooI3t6N8Q9ZXvF/xf4hx3n6dSavow1qATkc4ln7a6gvZ3
	 dpspt3aV2nVFmIRUPP7FQu3I74WRKuaSAIDXV0UJJzrXOAOM0Y7WBGtgagzl9O+jBA4gN
	 rtJFwQbzJDH3qJyQFF5MSTmTl4BvDGqf3FOir4eD7+wvVaq83hp57ZjydQ3w4HZwk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=;
	b=nyZu+WoJeSQwmpLsigb50wlkM2Dr5qfehiT2GLw0VzhFzs0huRw0A8ayOC1vO6XvtH99
	 Lc2qHjrb7IW+JOxbU1kdbZjXBySTljsnDDUt0wNC0Cp4qwbyE8d2eLJQesqI0fBAypQ1F
	 P2l2IABdEbbsB0N3pdZVYvfx6C2nr6ECy05aOYyZUI14FDzli+Qd1aisG3RsXg99G62QJ
	 6nTvF9KeoyAtxfZJUS4PpUKW5OkDrC0n7ScGCaUitozgSKeTlQVSOmz7rPL8iyAUI6z1P
	 hG688yBIQR8Cju87DdsPmKXSxV3rBKVFBC5MGMu6bqHWO6kPdkMzyLMyR0pmPVo2evg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNOhNb3i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C467606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YNOhNb3i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC9201F000C4
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795188910;
	bh=T6IM2hwHTMA/pxCeoMK4wo9s6BDvD9P4Ko0YhtatVM4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=YNOhNb3iyidl8e/8+4SlLOXJ9h4M54YkXrJcpXUHKFnIHJcVCWeuIE0J7ylUBD6/K
	 +AgTutx6MOpAW5KQqW4Vgr4E0fjGSbrxDxaNgYBuhf46CSrt5yIHjoB7EKC3+1HJ4c
	 20R9KNUSifE2ekRXxiExB6s/wQGGNEns0+hYlnSTPur2L9LCNa3d0kHtNEr7Xh+Xz8
	 vWsoghV4TpD5WTshR6o2CAD2fOjy9zqAI4biatkARX0Wh826V8tTvCWLJs3CoRGuor
	 cKT3fIsPCyqfuXWloLIwFg9iy7jp0hcN/nAwr6WSpM5uU3//ZxHEi6vUBhyBN+uCcB
	 jlncilkirXv/w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae7d1ce1bfso9788841fa.1
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 07:35:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEm7FKq0cL/56GAuc/UhRbj6/NSwLe/dbaAqTDphfnl+e7HQ7Mj0zptpKP3eROtKaYgwdS69QrbIhuk@vger.kernel.org
X-Gm-Message-State: APuU4Z9DEBhcYUBeNM/sP8XktwLh46xrGN7HVILX4n5zv8P05CdfluUX
	S+T5rOoGNDZLFXF8aiAfJtDeatyuvyNysaWW+HuAHekLm0pCf09bzui4T83o7p/XRfDGMNiy4pz
	GDW2tZd6GeBqEma0vlIwQnya+K7UNlF4=
X-Received: by 2002:a05:651c:a184:b0:3ab:1207:bd2f with SMTP id
 38308e7fff4ca-3ae7f9da258mr13361641fa.11.1795188909192; Fri, 20 Nov 2026
 07:35:09 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com> <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-4-ecd792189f27@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Nov 2026 23:34:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
X-Gm-Features: Aa3M54oam78LcsG1YLxbfKx9HEBPHDjI2SmmeFo6cqag_BBBoiZ82g26oZ6JYCQ
Message-ID: <CAGb2v64Tvdcn0rZACYmNr0Ja30u_mQb8eLPNRoU=6DK85nAikg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add
 MMC aliases
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
> sunxi-mmc probes asynchronously, so without aliases the microSD card,
> the SDIO WiFi and the eMMC get their mmc numbers in probe order. A boot
> script using root=3D/dev/mmcblk0p2 for the microSD card can then end up
> on the eMMC instead.

For sunxi we do not add MMC aliases. You are encouraged to use UUID or
PARTUUID for specifying root devices.

> Add aliases so that the microSD card is always mmc0 and the eMMC mmc1,
> matching the numbering U-Boot uses on this board, with the SDIO WiFi
> as mmc2.
>
> Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
> change applied: the microSD card is mmcblk0 and the eMMC mmcblk1,
> booting from either. Build-tested only against current mainline.
>
> This problem was investigated, and the patch drafted, in an interactive
> session with an AI coding assistant (Claude by Anthropic). The submitter
> reviewed the change and ran the tests described above.
>
> Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> index 892723b46..4a26863e8 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
> @@ -13,6 +13,9 @@
>         compatible =3D "xunlong,orangepi-zero-plus2", "allwinner,sun50i-h=
5";
>
>         aliases {
> +               mmc0 =3D &mmc0;
> +               mmc1 =3D &mmc2;
> +               mmc2 =3D &mmc1;
>                 serial0 =3D &uart0;
>         };
>
>
> --
> 2.43.0
>
>
