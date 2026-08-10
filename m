Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2F3BE627
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786360547; cv=none; b=OXWe6dr9591O6dssY41GQjquxP7PAwf9+mVEevCcyaQhTO6dFe2YEchaO+Om7T8TWS0GXsG1PGAxIVbGB072nLw3EFI6qJlzhgOjPKyCgbJZQoPRC+93yZvlKpZabEYET2l/xjMvMpDYuKWx+hbogmOLo/dXVtsdq9grzIwMq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786360547; c=relaxed/simple;
	bh=HZmISYgBNEII6ajiUivK45kqAIyJaNVw7YHkTPDfRvQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bl/1HcOtZEGHx9bltQNIR0eRw8+EaaO/rL5b3OBHeK8IFGhXaoAyr3T/vmTU0PZRRdPBaUvhXHQbDeJxIiqiMz1cejmAnoJqVVXp9BhX71YQkJEZbLFBgUvustgKMU1KGdFaWjVlQO0LM2Gg3uvETthG0as4Uu9KeXpBC1uksRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcYbVv3i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcYbVv3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E09E1F0155D
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786360546;
	bh=ctBC48NfaDxfgnTVz5af5ouIXmkk32F3lLulKRkoUJg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UcYbVv3iH192KTvaESXNDdkUl9s+fgxdqwObI1CCrVCXfL57dvPcPPhV1sKvhcPUf
	 vUizlO3clDeamSuCJKejBodHmJWG8d9+3flJEtWg9wiJpI+Ad1EUE0LMOB5BYo92BB
	 xw/mAxDW856YlptJRjAnIYDkciTQkOIa+BT0+l1TZQivBWK0Rfpl7UnBeuN9NR1jGj
	 Pm7KD5GV6HWZvXlCNPvqRSAYnXBZj87xcPg8koPKH/MLFgs585363oKHLEd2vQxu70
	 MUqkpxh6+/JXiW5Hi9BNdxA2tJ3rlRHTwKujcPMy9yXao5vvadBhY+YbQyPeLiQOhV
	 3gLmxCUntQzVQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39f1ac13687so10171961fa.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 04:15:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrehP/7gUujEE+OTGcdrtXMcFv15oJNhOn6j/Eg/64YhZZbYWRhay0b8SvvaBku8x2DJCqr8JFzP9ax@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ufqVjvMcsZmEqASVr+nDH/bYFh8cax6jXSPojyBu52MoX2Vr
	QlM6PMEBjL4t2Br4fv8iIKusAyYCeO/1h4ibpFwkIlZrH60hErIrTlh7/QHI9SVIU6WvfRdQeOr
	I8oKDueQIW7ablxt5CPoYpciacWnZkviIAaJT6ujVTw==
X-Received: by 2002:a05:651c:1547:b0:39e:ec1a:3a38 with SMTP id
 38308e7fff4ca-39fd685d861mr26951671fa.23.1786360545111; Mon, 10 Aug 2026
 04:15:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:15:42 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Aug 2026 06:15:42 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-b4-sgmiieth_serdes_regulator-v2-0-c4bc688177dd@oss.qualcomm.com>
 <20260804-b4-sgmiieth_serdes_regulator-v2-4-c4bc688177dd@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:15:42 -0500
X-Gmail-Original-Message-ID: <CAMRc=McU53T7htpXkqwLUD1xLs0bignVdDsMHrASg25hHto7zg@mail.gmail.com>
X-Gm-Features: AUfX_mx4xed83HkjA-Shp3wdKfG7HxoVe0OC0Q7Cb74CDg4FXKd0uqwuGlZCvzw
Message-ID: <CAMRc=McU53T7htpXkqwLUD1xLs0bignVdDsMHrASg25hHto7zg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: lemans-ride-common: fix SerDes
 PHY regulator supplies
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

On Mon, 3 Aug 2026 21:28:00 +0200, Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> said:
> Both SerDes PHY nodes were configured with 'phy-supply = <&vreg_l5a>',
> which was incorrect on two counts: vreg_l5a is not a supply the PHY
> requires, and only one rail was described where the hardware needs two.
>
> The PHY requires vdda-0p9 (vreg_l4a) and vdda-1p2 (vreg_l1c). Replace
> the incorrect phy-supply with these two named properties on both nodes.
>
> Fixes: 5ef26fb8b3ed ("arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> index cefb8ff0080631e25e9dd3a05cd810c6955bf1fe..923fd8736f31df2eb5198b27ddf52c171f7b2943 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
> @@ -856,12 +856,16 @@ &qup_uart17_rx {
>  };
>
>  &serdes0 {
> -	phy-supply = <&vreg_l5a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l1c>;
> +
>  	status = "okay";
>  };
>
>  &serdes1 {
> -	phy-supply = <&vreg_l5a>;
> +	vdda-0p9-supply = <&vreg_l4a>;
> +	vdda-1p2-supply = <&vreg_l1c>;
> +
>  	status = "okay";
>  };
>
>
> --
> 2.34.1
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
