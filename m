Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739411;
	b=BikkSWZyckWcdHkle39XqMeQuFDY23C7oITLGe4bd2JweST/u906GVybt1eAFSo+W456
	 eqwvSCcWXU2w+UHtxpaZy+x/1Pjyd71PwRD7OjYSP7HG4e9in3E7NWERKx5LfK6PkiCqT
	 Qx+9HUZfmbwupbucBrwAg/XGJq5BlfgvrvgcJt/7mKxs5Q44mxJ+LsRgkC6kLSuNVSf6R
	 /L8WKo1HivVdDM9kTOoB3dH7E4GmUF4axYMK5vD+Ad88Z+KKM8aTe6WEtAdcC20NCdSXF
	 K+ph1eTRrKD10uPrLaFbuAll3/2lX5n9MjmKkmO6+jCysb3d6Y48MUTSlPiu+T6nLHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739411;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=;
	b=UrdDcpfobBBb1wpkBS18VRdCT9CAPhovLmy7CfTm4xeIkDYc0i6fXBhaOCZp+BeVZo/K
	 x9NYf2idBm3x0rpi+Uv9zzHmy+DoXDV9jDLq7wsj7no8KAbmU1WPHCot9sJVH8Y6CejxF
	 PD640wkGLXwpKPVkzeELVWxSJOmTCUawst9hLnqUDAMeS3EGBIav6AyHp0X/YgfniEIrS
	 y4EgeRjXvFK2hrf9DMeKAY9VhmZ77S1Qr7CDU+TDJ3fseETjo1ENIVu0Vq9IkRHhS01t6
	 J37xX3GE4KB/nax8I1PmFFuIfIerYU0ZnA2yK5R67748TgN99neVrZZifyNfq18NNDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ4Erq09;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC94606A323
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJ4Erq09
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22471F000CF
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 10:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739411;
	bh=0nqnviQtI0zVgBpLZforuUbgldUYw5y4JIwCb3k/byo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=fJ4Erq09Qzat0YjOKMyTHBRMLvmfjqxGwZoSDSdC28ZfjJO8Q3Su8YA94sNC0thqS
	 eqjW5ukayVMnf+1/tbZoKtBlUPiI0N5XSa3T457SmhoaFFGPI83bpv0VUl4ysobvoF
	 mPzrdGiE4hNNqEYLu4G5e9En7KvOCTbM1D28uEbenjv5pYy+twqm1wIgFtW6h053Ts
	 +GRSUaOYIFGLjPRwFT5eFKlpGNRG2fbjOzcz8b572TdfoEE5tyiW/IexZPVMF+BkyS
	 7/Fjx+9ol1vy3BY4S3MY6WqRyWJShUcuq3P+AUduob1zHDmJVL44VsCfAjd/ukWube
	 7cBX8wwa6WqYg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae2fb3fe2fso21189231fa.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 02:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjwm0CNYv5CCF5roBm0uMX9JxCfI3PiENZsGkNwyq7iA0e7FgJaSbAij4UFxkvRSvX7U2xVxZ2NLiU@vger.kernel.org
X-Gm-Message-State: APuU4Z+X02awno5JCEyqjRzNJnKpxk2UcJIr1iGOf2JNRYOaKtjKjh43
	Y0GiF6m0DnxY8F5KG+xZoHbFGUn8bgbl31kb8IEZWXvA912VKDuNHuXPP9/7YwDDxREeMPqyffv
	x6GN42QcV5UQQ+meIC3nrZb+wNUoZ63U=
X-Received: by 2002:a2e:a543:0:b0:3ab:1862:25fe with SMTP id
 38308e7fff4ca-3ae2b49f199mr27144831fa.4.1794739409347; Sun, 15 Nov 2026
 02:43:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com> <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-3-1cd2664230c8@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 18:43:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
X-Gm-Features: AclHuK8HzeMAHozlJAL7NvuOGHQVO3JAeAx6hsTa0bLpIvwSKJtCAkiSGEitsvM
Message-ID: <CAGb2v66CYb5LmHrThjqh4i7kQeG3D=0=om33=mJJUS_u4r=UvQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] arm64: dts: allwinner: h616: Add GPU OPP table
To: aiyengar1990@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:22=E2=80=AFPM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> Add the operating points of the H616/H618 Mali-G31, so that boards can
> enable GPU DVFS through panfrost devfreq: 306 to 600 MHz at 810 to
> 950 mV. The table is the one of the vendor images (as recovered from a
> KickPi K2B image, also carried by Armbian). Like the H6 GPU OPP table,
> it uses <target target max> voltage triplets with a common 990 mV
> maximum: a board whose GPU supply cannot reach an OPP's target voltage
> loses that OPP, while a board whose supply minimum is above the target
> of the lower OPPs keeps them, as their [target, max] range still
> overlaps the supply's range.
>
> Like sun50i-h616-cpu-opp.dtsi, the table is in a separate file that
> boards include once their GPU supply is described.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi    | 62 ++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi b/arc=
h/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> new file mode 100644
> index 000000000000..18989d11c832
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-gpu-opp.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +// Copyright (C) 2026 Arun Iyengar <aiyengar1990@gmail.com>
> +
> +/ {
> +       gpu_opp_table: opp-table-gpu {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-306000000 {
> +                       opp-hz =3D /bits/ 64 <306000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };
> +
> +               opp-336000000 {
> +                       opp-hz =3D /bits/ 64 <336000000>;
> +                       opp-microvolt =3D <810000 810000 990000>;
> +               };

Just a note, found by my review agent:

The temporary clock for the GPU module is currently pinned at 400 MHz.
So say you are just jumping between the lower OPPs, you go from
306 MHz -> 400 MHz -> 336 MHz, all the while the voltage could still be
0.81V. This is likely going to cause issues.

I suggest sending a separate patch to increase the pinned divider for
GPU_CLK1 from 3 to 4, which would give a *really* safe clock rate of
300 MHz.


ChenYu
