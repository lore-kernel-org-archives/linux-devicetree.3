Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A76A3B841B
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087324; cv=none; b=t6+fS1XOQKfgE8y8ATe4IIYY3X/om/OKg7B8dvUnxu9kUeUzFIRXC/6xQkU04R/nG+WOUejQDE1PLb72OSgQ49KiOY+OY24TcVwYExoIZ6HFzNeBHWrfTV6xUIoaVbewM7kTovaeoYMx5q5Ke6zyrfbrnLvOPwLt8Pi3eN0foVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087324; c=relaxed/simple;
	bh=smKVd21B24JWPd9FUvi/DZRQx6ZDhEUqbJzis2L6HMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eiiC2+18xh3uwqhbjTK+sYgnL171ePsmXZcSVSbs3Ewmoh/d6kNM+BkufljjqqeqlzTWjg+tAOUIJfo4LWxtwfbFq+eyl0ZU0C3JU7B6RXNJOcVprqhTmIb1MIlSeTwnDx49y0vYlOM3NyCYnV+niLMZYyhZQIEaVtYYLL4WA+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLp5R03E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLp5R03E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4121F000E9;
	Fri,  7 Aug 2026 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786087322;
	bh=dKZWg8pcqDfadUvloZRP1WOusXizy7jFbfywdL7y6es=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GLp5R03Ek2850SXKoP/kdzZbGGAEU/Pct5uItNfZ+PJsqktRTJB9sBNALoG4EPgY0
	 5VDgG+JugaBv9QZqhN1bEWNaq/LWn82ND+NKX4Susioxy3Zmj6eCcpkxj5tTmXlJyT
	 3puRhdwKoXahuLAYZELmABRZXC8eTjj5mrmQBhsKwzDIsA+Li1EgWzRCgu7J9MJh4D
	 h/KY90n4AuhS+QOtKhv2HlIK7I1w6PklHSsXdWxkAt6J04D+ERUeP4VrAv5dewk2oa
	 rYhnBPNDsOkS31Nh74Iw8qDAydiUfThs9zBtDIkQ42au5TBqsH4dbrdZWOmBruItjc
	 fUvD2ZTGiOiLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: Update IPQ5210 xo_board to
 use fixed factor clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-12-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-12-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:22:01 +0000
Message-Id: <20260807072202.4E4121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The DT topology incorrectly parents `xo_board` to the raw `xo_cl=
k` crystal instead of the 48MHz WiFi output clock (`ref_48mhz_clk`).
--

--- Patch [12]: [PATCH v2 12/12] arm64: dts: qcom: Update IPQ5210 xo_board =
to use fixed factor clock ---
commit a2a14fe4e6a6b7af2b47f570d64cc8151c8401f4
Author: Luo Jie <jie.luo@oss.qualcomm.com>

arm64: dts: qcom: Update IPQ5210 xo_board to use fixed factor clock

Update the xo_board clock definition to use a fixed factor clock divided
by 2. The commit message indicates this is routed from the 48MHz WiFi
output clock.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> @@ -26,7 +26,8 @@ sleep_clk: sleep-clk {
>  		};
> =20
>  		xo_board: xo-board-clk {
> -			compatible =3D "fixed-clock";
> +			compatible =3D "fixed-factor-clock";
> +			clocks =3D <&xo_clk>;

[Severity: Medium]
The commit message states that xo_board is routed from the WiFi output
clock (ref_48mhz_clk). Should this be parented to <&ref_48mhz_clk>
instead of <&xo_clk> to correctly reflect the hardware topology?

> +			#clock-cells =3D <0>;
>  		};

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boo=
t/dts/qcom/ipq5210-rdp504.dts
> --- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
[ ... ]
> +/*
> + * The frequency of xo_board is fixed to 24 MHZ, which is routed
> + * from WiFi output clock 48 MHZ divided by 2.
> + */
>  &xo_board {
> -	clock-frequency =3D <24000000>;
> +	clock-div =3D <2>;
> +	clock-mult =3D <1>;
>  };

[Severity: Medium]
Does this implicitly rely on xo_clk being exactly 48MHz?

If a future board uses a different crystal frequency, this setup might force
the board file to specify a compound divider instead of modeling the analog
block's physical divide-by-2 from the WiFi output. If xo_board is parented
to ref_48mhz_clk as described in the commit message, would this physical
divide-by-2 relationship be more accurately preserved?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D12
