Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A71514E4;
	Tue, 24 Mar 2026 02:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317856; cv=none; b=qsKOOfHZhLQYPzgS2eEJCE+f0l1N+M0lQt6fKgp14WdVX7KEWqvsfykC8DeoCPq5j92Mqf9uFjI9cJkRB7cthKRJ2/ianVcohmkb9sd+g74lieKVQI0Q4TL60ynRNbutG2jQcw6j6OQKVwt6WC0Fhprej5iIDy2TCtYza7a+H0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317856; c=relaxed/simple;
	bh=PPFIkVoC2rBoIdhXKT6M45k6jVgwNHb5gnHdZ0SHbFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbgudW1FqCK6D8kFXhwacqpUjN89Ar8282Nqij+NQ7mikpCuPsEUxfryrw9Wvrpr1L1PJlhMKvyf3QNpzquYooysI6iW5kLib/Y95c8S/5f+7e46oF5Y13a2Mmo50NNFnTas8VIOGz+pnxLt+7Dn3IhLzvJXbQUhtFGsEQ7S+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCxaJgX/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCxaJgX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A2BC4CEF7;
	Tue, 24 Mar 2026 02:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774317856;
	bh=PPFIkVoC2rBoIdhXKT6M45k6jVgwNHb5gnHdZ0SHbFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCxaJgX/cwReVdpq3ssAtSk5ez5SrjbHqbE4E6u8kew3DMyxZrZ3/AIa53dM2TbaE
	 ipLfSBQDibZtdJvPyRUOFMjMzgNNbKbtooH1fv39zz7WKM7jeLZJnjKCNqwzO3w+gd
	 CTpxub2pJHs0kWnQAMcsOfXIzLG1pd/1awLFVdIr2RZuMoyqvG3UVdfJb+jYnQ/ROc
	 aK3yVVNZqhOaCp7jKLAlZjnNpaxKOasDA9C3/LMVCP3wsGWZT5njYlhSenuGYBJRa2
	 AT0r0NfG/tSdjLsPuvR2tbalnztUzMCs5PNtqeKE8ztikUrrmjMy/sCv30vCa/ji9k
	 nmUJJDi/9MYOQ==
Date: Mon, 23 Mar 2026 21:04:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <acHwvzjcvqNxUjm3@baldur>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>

On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 

Please add Fixes: tag.

> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Please start using your oss.qualcomm.com address.

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

Are you sure it's not supposed to be 1.8V, given the name of the rail?

Regards,
Bjorn

>  			regulator-max-microvolt = <1800000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  			regulator-allow-set-load;
> -- 
> 2.34.1
> 
