Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257751;
	b=lVXIlorqLJ6ZnZqTktjIb97HwDn4UfPC08Z4PqFYLyTcc35T090UemfrMPH8/UEbBHB6
	 zumHbF/bE3YPzB+Q+nkMo28oJ1iKFkvEVqr6m1kJ/1Uu504tB9DXGZh62kFMQELlCoUIW
	 1D89krOsn9ng7rJD3+LvsP3k8givQW+Bwt83ZO37AEYEVu0+pwIPU3vBdXjjzgxekPr9I
	 Jb22rUWSI7KniBW14Fpw8jQ0Dlj+YUaNQIifRYIcMYzJP1YmTP37Us0jkGY7Mz0fZ8pBI
	 58Y5omCm6k4Vdjhev/1IF3qrLZ5QpTKC6KxTwvj+/Vi4oBrVLO6dgOpIazSrnShxzJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257751;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FaTHrT0en5HpZWU0GAdTluF5/++AD9A3faeg19oeFpc=;
	b=3Ov4QzJxxCGGbyGmJVyyqNdfMISCaHdZMcrGx7M77WS4i06tGkRmeG7IrpaqhGVPRgf6
	 y1XjpCFLjlJok4KoYVkrpGzxRwB/k+psV7Bv4kf1+63Sx9bMCaGdYsXSl5DAQw5GWKtpv
	 IRo7V6apGalK7xahJqKSGlSYxEQPPslSXgIfJVvG5RnHTTbjsldunrcU8FaG+fBNTMDkm
	 ccRXSFvTpB4du2D1t5Lp99T8KWOMy2nEZ9WsGMDkyRMO7ON7UBN7BSUhMtcEBojqlnRnS
	 uP8r7QRrsF2Cmx3bvB3ULSioofRIqFqLYRhuvzbQtvswE2tlznDlz+0SUm4vlfPjeXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+gDphYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AD606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+gDphYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1E31F0089F;
	Mon,  9 Nov 2026 20:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257751;
	bh=FaTHrT0en5HpZWU0GAdTluF5/++AD9A3faeg19oeFpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+gDphYLWblrYD8ZoMeDR5ZUgx7ez/KAHCEQwtmj32DqblF3v/MMoepvOrIui8OYn
	 DcLFKnFsyF0f2NYvS4ISkQXL11o2Yo1yvuE1xeXb6y3fhaTP+5USYbIsQGPRlW8txI
	 S4iNUMqZDh9kygcA7+AMUxVKvPrypZvTN1+rO0WVT1jxBN1mUcdBAs2w6ZNZGpikED
	 GKMNx51CgAUsJ0sFFsyjCb5YJRzEsC67oAOBmE1wRDRX/IZa9lQztULU2deYGpdMW2
	 JiF9AJMrlCad1O499/0Y5ImdMiqpDLooO3eTh3h0HUJ2YxmCT3CTbWVGC5r83hkc4g
	 pRU2fgesTl9BQ==
Message-ID: <sashiko-outbox-205616@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/9] arm64: dts: qcom: sdm670: add digital audio
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261107022453.159341-9-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <20261107022453.159341-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:55:50 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] arm64: dts: qcom: sdm670: dummy fixed-clock lpass-cdc-bclk
  used for ahbix-clk
--

commit b9856161fbdcddf34face16a0ba725a6845da3f8
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add digital audio codec

This commit adds the LPASS digital WCD audio codec node and its clocks to
the SDM670 SoC device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index e99183c222083..3e5ca16e30565 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
[ ... ]
> @@ -33,6 +34,12 @@ / {
>  	chosen { };
> =20
>  	clocks {
> +		lpass_cdc_bclk: lpass-cdc-bclk {
> +			compatible =3D "fixed-clock";
> +			#clock-cells =3D <0>;
> +			clock-frequency =3D <1536000>;
> +		};
> +
>  		sleep_clk: sleep-clk {
>  			compatible =3D "fixed-clock";
>  			#clock-cells =3D <0>;
> @@ -2822,5 +2829,20 @@ data2-pins {
>  				};
>  			};
>  		};
> +
> +		lpass_codec: audio-codec@62ec0000 {
> +			compatible =3D "qcom,sdm670-wcd-digital-codec",
> +				     "qcom,msm8916-wcd-digital-codec";
> +			reg =3D <0 0x62ec0000 0 0x400>;
> +
> +			clocks =3D <&lpass_cdc_bclk>,
> +				 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +			clock-names =3D "ahbix-clk", "mclk";

[Severity: Medium]
As reported by Konrad Dybcio on v2 [1], should ahbix-clk be wired to
q6afecc (or made optional in the binding and driver if HLOS does not vote
for it on SDM670) instead of a dummy 1.536 MHz fixed-clock under /clocks?

In Qualcomm SoC devicetrees, /clocks is reserved for board-level reference
clocks, and ahbix-clk is the LPASS AHB interface clock for codec register
access rather than a bit clock.  Wiring it to a fixed-clock puts a fake
clock in the devicetree and bypasses Q6AFE LPASS digital codec clock
voting (such as LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE or
LPASS_HW_DCODEC_VOTE).

[1] https://lore.kernel.org/r/87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107022453.1593=
41-1-mailingradian@gmail.com?part=3D8
