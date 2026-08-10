Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AAF3C108B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360560; cv=none; b=jn0nD4hs0iNvDiKdmyczwZIqaW4vmWb1FuV0lE4y62we9WWVwEdsqojSGssGU/QJ/axDiC734lCZDoDKV/idsJEVqs6BRfUe8A9YitKUipngoMfBUIoiTdtQeQEGXQyYnTWCqSHy64ddHYDGXJv1wkf7+dTWhYscVHnugUp1kRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360560; c=relaxed/simple;
	bh=L5k/KcOGv8PFD7oYUeG9duBBNGh3gLwJ8R8YpYNn7tc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAfnzKwIDXaycuYKJdMfGrS0AwHzs9gD6LKlB6gnjEymVNaDHEIslDWhp03jNUW20ghgrz0L8bt8JazRnAZ2x2zwqt9i+/+wJDqkJeAlNAcv7npFV/HhpQcC8RW5mnZ89kBdWlOmCxmKeYOBDw5vLvvb6ujDwpINeZlI+8aMEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJU+pj4w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJU+pj4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200A61F01559
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360555;
	bh=Ree105FpZDD4Gdo/SFuh9gERvhFDmrcYOqBHPp8A6NM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IJU+pj4w9t8xYk+mYwihO1wBVuJ86Gjc4Q88gezEsDxXjBsrbNJuTeph6eLqsKzEA
	 JRlhSSiw6Oe9sEPoqEdTYc0XaxHzBJLpCu4JMLZ0ZTf+7iw9Pdb1yudOIQgfjhE966
	 qO0fG8YMCX5FncLYnGxV/s1sPk4kFhhZW92fOBfou4rxhJZB7mqWsiZcuQJZX8kU7D
	 dZ7jm1SjQ7zeK549Z7OAipfrKeuqnSk0YQamekeAhHkMhpkmqddQslavgOtd4c+ncx
	 6SogNaotKZJ5jo1xl45gjmR0N4IbT8eFUPlPtwySbGENqqyfSGtFXA9uJpQZJRvUIq
	 ZISq2yS7HWmpw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b01cb18515so1630415e87.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp+Vgx7GLXZ7F363t7JNW1HcR7rCBg0/sPXARbn/R082EJY1pcFn6Y9b7bxUlSyjVAqtocPo07dgoEh@vger.kernel.org
X-Gm-Message-State: AOJu0YyjlCPH/Sp8kgLvv9/qpXpkJ7v73JBs7+xmmfkgDpPZzKLYH1SQ
	tKAmdDNYjqAXEKUCEQlqqsZ21zcEf5csRwB7+I3uJ/cGGE3PDIDCdTbZ7Vi9PCxhYkOsPzDVcop
	wD6YgP6x6a8rDJnsu4CoFd09nQfUj3vF3oS3ac+Armg==
X-Received: by 2002:a05:6512:6890:20b0:5b1:59ec:2452 with SMTP id
 2adb3069b0e04-5b2f4b803d2mr3556931e87.9.1786360553844; Mon, 10 Aug 2026
 04:15:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:15:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:15:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-5-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:15:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdF5spUDL3onVBxTzpcVkF1gAcv2ou8=iS+aMMRDPoCkw@mail.gmail.com>
X-Gm-Features: AUfX_mxL4wZkP-fvXu35X4Igj96F_u92cxpRY8MHEp3IGJ1ql6hpIkFfcfIxbME
Message-ID: <CAMRc=MdF5spUDL3onVBxTzpcVkF1gAcv2ou8=iS+aMMRDPoCkw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: monaco-evk: fix SerDes PHY
 regulator supplies
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Wasim Nazir <wasim.nazir@oss.qualcomm.com>, 
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>, Umang Chheda <umang.chheda@oss.qualcomm.com>, 
	Yijie Yang <quic_yijiyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Aug 2026 21:28:01 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> The SerDes PHY node was configured with 'phy-supply = <&vreg_l4a>',
> which only described one of the two supplies the hardware requires.
> While vreg_l4a is the correct 0.9V rail, the 1.2V rail (vreg_l5a)
> was missing entirely.
>
> Replace phy-supply with the two named properties vdda-0p9-supply
> (vreg_l4a) and vdda-1p2-supply (vreg_l5a).
>
> Fixes: 117d6bc9326b ("arm64: dts: qcom: qcs8300: Add Monaco EVK board")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 9d17ef7d2caf130564efc2d0159ac0de39126e80..f787e78b35ce48d7544116e4383561b81def8ec7 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -706,7 +706,8 @@ &sdhc_1 {
>  };
>
>  &serdes0 {
> -	phy-supply = <&vreg_l4a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l5a>;
>
>  	status = "okay";
>  };
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
