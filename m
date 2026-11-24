Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486638;
	b=X77IMYiT46bOvYupz34AFutrlfnPLyRzyOplZLUwYLzQqwDMZ0LszHv0uQwb9GBg8JZz
	 SSssa7hWTDVtMlQTthUurGRpjUoU/RQz79ycWNw5I+PhMavIjjcSPjWk/2FCi1yFJcmNS
	 fTUuKQLBp/FOzWn3P3k6qA2oZSYIEharir5hjYTxiVMsNsfAb7xyF3N6AueAO1+SX7aKy
	 yoE3pssmyR53Rjki42lSToGLleDbjqUiiPseoKUoQIa84BMFRJ5MR9MAbRfp6ug141OXb
	 8c+HqCbjkZ1qrb64dCUaJ3vb9AFNdCD+VguXoVW/mnuE2YjMg54duSEb7Gne0ehbnRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QATfYSTKsbiQM75HzSIeddOFsSvEGrtGFQrtH/4WUtw=;
	b=JdJ/UQl+9JV2iZ+Wv1wovJQKBYxqWm+wEugYWLf5BcyeHpYZYjTtx012HOnxB0Ot3txP
	 8NY+iIghAKpWik0/EaKb6zP9K7Q0mzv1wMMPQwEsaUYUC02c8mioOkJlZZoDmyFIeC0dX
	 f6ZqO+k6Z8ROr8hx4y8qMWq5x9We50ZcDBVNxRgk70Z2ZRU3vTrN0lfEWBaY0IXnBKkHY
	 qrhGdSt3wLJop7J/QbOxXrIjbTMT75Jy5ggka7nlBqDkBpcrPBYycs1zQWMOrFBt4ktYr
	 lizkR8mQsJ/Z68UHt3MmPStHEEIBuE5xXI9OsWclVdHzrpGPItLsINjtsTb4MZvPrxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESletRhE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438FC606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESletRhE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8151F000CF;
	Tue, 24 Nov 2026 02:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795486637;
	bh=QATfYSTKsbiQM75HzSIeddOFsSvEGrtGFQrtH/4WUtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESletRhEhtV27vuGTYYoZHeoYjMJcPocZI4U+AAmOUgLQj6HlUX4dWafV0314Ibn3
	 aMMYXcYmzLd7hF1lgnHa4cehmFXXRxKMO+UAmbiD4xPffMTQJ9VvQVDn93c3n4QwY0
	 WwQHGfLAvw9kGJ/tK+7hrXBhE2eroX8PMAhEAM5sFoiOZbcTA+tVCHGsR4zsk3Sqq/
	 auCATvGW/WKMOGHTKw07QyhX/6AP/XdyD0gsJNv+w5JuqhDbN0QAJ4269vQrI/a1yh
	 Q2Ui4/Ivo2a3Pf928CRCg8oRmA4QqySWeNYWPBNwF2xPo3lj88nVfBIR/bmv9CAIca
	 gmstnDpupq8Cg==
Message-ID: <sashiko-outbox-230394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sdm670: add digital audio
 codec
Reply-To: sashiko-reviews@lists.linux.dev
To: "Richard Acayan" <mailingradian@gmail.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124015611.187024-5-mailingradian@gmail.com>
References: <20261124015611.187024-1-mailingradian@gmail.com>
 <20261124015611.187024-5-mailingradian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 02:17:14 +0000
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

commit d9e07e74287b546598a2354eda9db9ff7cfc53b3
Author: Richard Acayan <mailingradian@gmail.com>

arm64: dts: qcom: sdm670: add digital audio codec

This commit adds the LPASS digital WCD audio codec node and its clock
configuration to the SDM670 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/q=
com/sdm670.dtsi
> index 8de8f3f7ea0fb..1df63c38cf876 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
[ ... ]
> @@ -34,6 +35,12 @@ / {
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
> @@ -2831,5 +2838,19 @@ data2-pins {
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
As reported by Konrad Dybcio on v2 [1], should ahbix-clk on lpass_codec
be wired to a dummy fixed-clock under /clocks?

In Qualcomm SoC device trees, /clocks is reserved for off-SoC board
reference clocks, and ahbix-clk represents the LPASS AHB interconnect
clock for codec register access rather than a 1.536 MHz bit clock.
Depending on how SDM670 clocks this block, ahbix-clk should either
reference the Q6AFE clock from q6afecc (such as
LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE or LPASS_HW_DCODEC_VOTE) or be
made optional for qcom,sdm670-wcd-digital-codec in the binding and driver.

[1] https://lore.kernel.org/r/87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124015611.1870=
24-1-mailingradian@gmail.com?part=3D4
