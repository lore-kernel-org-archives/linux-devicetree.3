Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F5A374183;
	Wed, 17 Jun 2026 17:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781718120; cv=none; b=H8DQj3RA2DljB9OR/bjoxyk2ppZciFnqyYw+PrqasZb+5TRVowsxXngGtL08gBpkpCX1CTuFGuo1TGsN4Kz90rJQp0bvbDpmA7SUT3uIQdpdbfTOo5H0Vfl3Y+DKN1bCqrOtJt6DigvE3mf/BB6+r7FkBnhDpKyFmgbQFXn3QbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781718120; c=relaxed/simple;
	bh=rH11rj5XfrPigCs9y05QCpXMTxgey/fHMocbG34Al1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Im1zRHzAlwNoNB/BosO5ugG8IRCVLE+wlqqY9CB24PTBmq39EulI7VmULG8cXRikdWFHKGwKr2nLYD3XcivXzxvcdV8u4Vyox18rTM7ZQkMhzqKrIkjT+yLR2AKEQirSkO1jTNg//y8tpkgS9/1b0FyUGNrVlisbpMKnyUqKc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+Mzdag9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+Mzdag9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F281F000E9;
	Wed, 17 Jun 2026 17:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781718118;
	bh=9RC8jmYaG6xK0VuQBqROoKrirquMSwIRTfAs/g0x82s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N+Mzdag973iH4hO6Sjg54nL3kg6ofkz0cQfNurdpysbU5SXY/OybFr3meSgPBeGPw
	 wfc7JmVDLkerB4mclX8PUwiVTc7O4jklyyIuXclD2Bx5XTAR5uQ8SWKX8g2Aw/bcZf
	 rgggTSpe6fhEYRPoSkxLmQmgd/hqkxfr3VKqIi9gqXYu80iouiWDWiLLrWWAxwoAbu
	 lCxCY+2R3aZDnnhAx+upRayjijyJmLPe2wdZSyds8EIW4mB5FFxeR3S2Nv4Q6ntixM
	 MYNQoq3wFKRu/LxhuyF/lnd7l9Qh604Je7hagQs5OqvaOu34TopxyUtf610uLzaBkc
	 MwTa3tHMZsieQ==
Date: Wed, 17 Jun 2026 12:41:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage
 for panel nt37801
Message-ID: <ajLbyqELjduwbKC_@baldur>
References: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409122110.214680-1-ayushi.makhija@oss.qualcomm.com>

On Thu, Apr 09, 2026 at 05:51:09PM +0530, Ayushi Makhija wrote:

Here's a link to "v1":
https://lore.kernel.org/all/20260323102229.1546504-1-quic_amakhija@quicinc.com/
Which makes this v2.

You also ignored my feedback.

Thank you,
Bjorn

> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Fixes: 4fca6849864d ("drm/panel: Add Novatek NT37801 panel driver")
> Signed-off-by: Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 3837f6785320..6ba4e69bf377 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>  
>  		vreg_l12b_1p8: ldo12 {
>  			regulator-name = "vreg_l12b_1p8";
> -			regulator-min-microvolt = <1200000>;
> +			regulator-min-microvolt = <1650000>;
>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> -- 
> 2.34.1
> 
