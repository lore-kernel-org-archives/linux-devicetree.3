Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794741814;
	b=wtp0R/dGbu0QIqHyygXr87SkGz//F0j1uxfBA2BLe/i0WmSStk7ltaGI5/TCiLCytIW6
	 T3a2h7AmeqohbT1Uni0TAALeWlYXeVQcQdI04I68YgEeYvm8dfi7tv6/9z+PLYxRXaKn5
	 3ePYAdbI2k98mliwRlcQWXDWspjGmY78RBRWWzVqbJVpVrQ8BLEw/1MkQ5hkKrww8U+Ic
	 Mmhly4rLuFHXTP7L5KQhsb2i9uIyX5CI/8/7/EhjAKQeYg+ietI9pWWQJKVGhFvgolcy6
	 nqdMx6lEUe+aPS24xfbc4JbUHxMsH+aftMALbhe9aZSoUHvHS3L3aBAhfRX0ldnr/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794741814;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kX53oJXe6zh6Wm0f/NLw/xzJgNuI7GT7tZ/9xrnt5WI=;
	b=mq1JfA2a+IqJgIwirWWDubxfYK+iqAJ0McG2IVQEj0YkwmHDw9PVMaj9lbpb5oZXL8ew
	 9cyc5DMgIyjvkSpF5WQvsBbbwOIV5dULTU2y0ISXyY2lLyBeNau6igbB9bvxT4hL5Nl8l
	 OtPTqJvbkmPKLacjfay4OeeDlRB5P+DjtCb+iWwp8d0mfglFTTgg4mzqkjYPJlTwkHNX/
	 BUo4U4CYHw//Tpol9qUIE7gf/d1+Ft2j+TjmPEFh+mFpNbnl1eu6YqTt/gB1T3pxqHvVg
	 1WPi4v9whlVN3ccZtv1stQ/wsMzleL9nVKNnKnYW1BSVZgsfsd/0cxaas1sD9Zk7LuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n03mFvQ/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D28606A329
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n03mFvQ/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FBD1F000CA
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794741813;
	bh=kX53oJXe6zh6Wm0f/NLw/xzJgNuI7GT7tZ/9xrnt5WI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=n03mFvQ/1EXrpr5LWQJtiZYHd03TFTWFjfs47QxSHRguTJtgURTEOt8VLNSFJQc7V
	 8L1ioyNBXKcSCdeXyzO3Zbbq7rjPZUO5cdi/KH5O4/8SmNHFf8+dhb++ZDR9jqF3XN
	 eQFMiMpw558ksTpnDxbW1Uoyf7SrURXsJJQ0NdakMTHtLX9GYnKsAyAcFTWDVL5PDQ
	 a/d4B9e/Eyv/g1jr0gu0oHnuMdcm9UInKtOVUPZKT16D06n3S52QgoPjw78i2DiGFZ
	 vrwsvnDFcXKLM5i39Jx18tUFh+8lkX1DtcjgfTRdaOPBvKEB8tN0IQtjsJEAqkI/0h
	 pWRFQtnQ60VhA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so24429651fa.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 03:23:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHuKwB8kdIuVzUdiykr/UsQFjuV1ts5TapQbG3VDF3TyPXLEMhQk0MAEGtZgPLhg+Rqr1kCgXyRn8r+@vger.kernel.org
X-Gm-Message-State: APuU4Z+vsy7NIAkkuyaAW1I+7+Z3tK4OMEYZbwV35x8SD2NFrZcoMDES
	cGKZcgQqMnimK5MpY2rJr1ehH3BWChn565b9Cs3gfalBWRWEQDTxLRLCcAFG4k/Wc7au8I4To0r
	CImdQvWDkt4DXAdRshNviLVp1Zo5gDOY=
X-Received: by 2002:a05:651c:a142:b0:3ab:3bf3:1610 with SMTP id
 38308e7fff4ca-3ae2b4cb4a9mr19055231fa.10.1794741811994; Sun, 15 Nov 2026
 03:23:31 -0800 (PST)
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
Date: Sun, 15 Nov 2026 19:23:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AtwrqViwOdwd9SwXAxXKv7U1za72pj2BqcdqegVnYpA@mail.gmail.com>
X-Gm-Features: AclHuK8ZAVIclElCusS8bGm9wRGMlekW6DfDLlnWFEB8TeBA8l91MdVQ65LV97I
Message-ID: <CAGb2v66AtwrqViwOdwd9SwXAxXKv7U1za72pj2BqcdqegVnYpA@mail.gmail.com>
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

FTR I found https://github.com/armbian/build/commit/3432b23f09c4a3fe74d6760=
b42ff01cfff8dfe1b
which probably came from https://github.com/armbian/build/pull/10902.

It says it was from an KickPi K2B v2.2 image. However the latest source
tree dump from KickPi doesn't seem to contain a GPU OPP. I can't tell if
the v2.2 refers to the board revision or the SDK version.


Note that OrangePi seems to use a different table:

https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-6.1-sun50=
iw9/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi#L1520

But anyway, if it works, that's fine.

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
> +
> +               opp-360000000 {
> +                       opp-hz =3D /bits/ 64 <360000000>;
> +                       opp-microvolt =3D <820000 820000 990000>;
> +               };
> +
> +               opp-384000000 {
> +                       opp-hz =3D /bits/ 64 <384000000>;
> +                       opp-microvolt =3D <830000 830000 990000>;
> +               };
> +
> +               opp-420000000 {
> +                       opp-hz =3D /bits/ 64 <420000000>;
> +                       opp-microvolt =3D <850000 850000 990000>;
> +               };
> +
> +               opp-456000000 {
> +                       opp-hz =3D /bits/ 64 <456000000>;
> +                       opp-microvolt =3D <870000 870000 990000>;
> +               };
> +
> +               opp-504000000 {
> +                       opp-hz =3D /bits/ 64 <504000000>;
> +                       opp-microvolt =3D <890000 890000 990000>;
> +               };
> +
> +               opp-540000000 {
> +                       opp-hz =3D /bits/ 64 <540000000>;
> +                       opp-microvolt =3D <910000 910000 990000>;
> +               };
> +
> +               opp-576000000 {
> +                       opp-hz =3D /bits/ 64 <576000000>;
> +                       opp-microvolt =3D <930000 930000 990000>;
> +               };
> +
> +               opp-600000000 {
> +                       opp-hz =3D /bits/ 64 <600000000>;
> +                       opp-microvolt =3D <950000 950000 990000>;
> +               };
> +       };
> +};
> +
> +&gpu {
> +       operating-points-v2 =3D <&gpu_opp_table>;
> +};
>
> --
> 2.55.0
>
>
