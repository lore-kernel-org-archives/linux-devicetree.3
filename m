Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497E3E0229
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 13:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963755; cv=none; b=grZznYcNyEKLoIHO4CYxUniWEH1gQ7Nb5EFm5fJCAuGGZeMcOS19BQmJRrgyoqsoe2/fxn6mUZlXW3yA4KbvVd5rr8TgIqwNeWI9H7E9rVNedOFXZeqepeME9xaP0uFZZ1liwrbcErJd5n2ldUkn4b+YIKBMAkvppGc8+dboSJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963755; c=relaxed/simple;
	bh=sjgHIlOjJIUqOmCKtxBoJhAEO+KEsYQgiP0C/Ip9OJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0M65ZFZuKoiIdA3zpOAC4177fkunSpmZzzs+hnQFuDWaZAmeR9dAn+geDEj7aW7U/J1DOdL/F1DjHYHd+N7+LuoYS0nLBQDhNC8n5cKL/uL4OkZvl95VWRnVC6NXM4iR9/sL+rGc3+R8pyiwlNlEAlAtB5tnl+98tCC68qlItA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WpOsP9m8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WpOsP9m8"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so857783e87.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774963750; x=1775568550; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=WpOsP9m8wsDKoZi0UvIdqw6AYOYuUQA8SBcB1QugxeJspgjXZUg1iMaV4/GBqDwmNK
         xAMWy/kNfIiSY9d2DakMpdMwsxCtWZx74P+dopMXiZ3v3jbGPvzzGXjZ5aVnWdCN9MU9
         QwDRtTRPbFu3D7yeSqZpHgvXYDr6yfN/JvHpQH8mhMwviEvyW1l64lTrOCcMXjUUG9tw
         /m9y5EfJavMvbfUqONkju9QAcaUMEbVoWp8xWyB2xjwVNOsajX/zCD09k2BAJXcW2ZbB
         n0xXNuk9oaFZeM4AQwUuy6lNHm+iFzlaalrfIoM8FG54ewahC9KjwzXb2F1Kk9J8GyVV
         6qIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774963750; x=1775568550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbFdFY1ryYFC+hM/WPwZzfOvMcgDCJMGIGsqBBOf6+I=;
        b=Z0zOyGPu2ZP3qVgImIayxOtkA+HiugnCOPbSV4c+fZ46CwYdBH2entiiuGQyUjFAaq
         QCd4lTlFpCr0nRbwIiaAYFvLhuOIY501Pg1CTBkul/ruFSyDjl1DCA0X59mLTm0GBRo2
         9Alf79F9WRRlSI970jhsouwCh+ZjzeDlczi2b/XWIna0cJ89GeaB+FcUitCKf0YdLPno
         P9wLmvYEGLCePjUCcjmqXqb0FO758bTU0w9w/WttME+HLlhyxYkoNnp0fxhf4DYik/Yd
         u+EyEA9h/3QZ7+Z+/uQiWdkJyf5DKnnp2Q4+Y9I3YyCS0fBgELPDKA6QHUQFFbAHRbnB
         xKuA==
X-Forwarded-Encrypted: i=1; AJvYcCUfSg6n2ZRtJB0baBtUgWhi87EfHDPAOHTpKuMbFMWan5Bcu4gPuOiN6BCvE0Y14CqaJs0XObSrSmrn@vger.kernel.org
X-Gm-Message-State: AOJu0YypTIKe+k4/YrlJKzQkjIC+F3m2cHuVXEKoqm3hyEfXy+KlXuBg
	6UgIkU66ceA3Q27ZnqT6B1jMoeCC7dC6xdQVh4Vkcp13QJdPZ/hlmRVaDO9PgqyDhxg=
X-Gm-Gg: ATEYQzxaPQEi8RMHD3a+lF+26me7t4FaugRTnSrn15Ohr28JfaqahMFNXt+9/LxBaQ1
	+GIR7hgoB1xcQ60zLtuEzc1Us1Kd0MfasSj80O3O9E5xEjTFzhoNf77iCoESKb5MrGfx79jjXd+
	5Iqnp4limP1Gp3LjuLDsrO9ZVKToGC9NwzZy3A6tL0i2YkcURRcWuKdn1qn2K7CsKy42aWH/mrJ
	ZTC60Cy2Q9iveuCo5Jxsl6Ddm4H0hk3Amu54UMMQ63FdW/PjqtfXUecZgULjx1yeVm4In6gmrWl
	y23p1611tALA2hxZ4PLJqj9h4MWPjg1l8U+XS7ligH5zjLJF08Af4tFZhXxsYXLkl05UX6dnrTj
	OSk39iHne3LyMrB7t5JHhHRbkXc8/81yBmntAhnsRZ85OrIpxUKdMh7pO2RTDXVFrQJQOQTZFRj
	5PI0qsXPBvq1OZqB0hi/sigJyQsWywmLjo3oKHk+HF9FxsUwhfXzVwuXV36UDQ2cz2p60mKV2Hy
	guZnQ==
X-Received: by 2002:a05:6512:39d6:b0:5a2:a52a:c69e with SMTP id 2adb3069b0e04-5a2ab913ef4mr2989896e87.4.1774963750387;
        Tue, 31 Mar 2026 06:29:10 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f040sm2447874e87.75.2026.03.31.06.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 06:29:09 -0700 (PDT)
Message-ID: <55d61750-07de-458d-8668-09f84a35220e@linaro.org>
Date: Tue, 31 Mar 2026 16:29:08 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm6350: Add CAMSS node
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
 <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260216-sm6350-camss-v4-3-b9df35f87edb@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 10:54, Luca Weiss wrote:
> Add a node for the CAMSS on the SM6350 SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi | 233 +++++++++++++++++++++++++++++++++++
>   1 file changed, 233 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 9f9b9f9af0da..9ff9508c5ce6 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -2161,6 +2161,239 @@ cci1_i2c0: i2c-bus@0 {
>   			/* SM6350 seems to have cci1_i2c1 on gpio2 & gpio3 but unused downstream */
>   		};
>   
> +		camss: isp@acb3000 {
> +			compatible = "qcom,sm6350-camss";
> +
> +			reg = <0x0 0x0acb3000 0x0 0x1000>,
> +			      <0x0 0x0acba000 0x0 0x1000>,
> +			      <0x0 0x0acc1000 0x0 0x1000>,
> +			      <0x0 0x0acc8000 0x0 0x1000>,
> +			      <0x0 0x0ac65000 0x0 0x1000>,
> +			      <0x0 0x0ac66000 0x0 0x1000>,
> +			      <0x0 0x0ac67000 0x0 0x1000>,
> +			      <0x0 0x0ac68000 0x0 0x1000>,
> +			      <0x0 0x0acaf000 0x0 0x4000>,
> +			      <0x0 0x0acb6000 0x0 0x4000>,
> +			      <0x0 0x0acbd000 0x0 0x4000>,
> +			      <0x0 0x0acc4000 0x0 0x4000>,
> +			      <0x0 0x0ac18000 0x0 0x3000>,
> +			      <0x0 0x0ac00000 0x0 0x6000>,
> +			      <0x0 0x0ac10000 0x0 0x8000>,
> +			      <0x0 0x0ac6f000 0x0 0x8000>,
> +			      <0x0 0x0ac42000 0x0 0x4600>,
> +			      <0x0 0x01fc0000 0x0 0x40000>,

I notice that this memory range is very distant, can somebody with
the access to the specs confirm that it is a part of CAMSS IP?

> +			      <0x0 0x0ac48000 0x0 0x1000>,
> +			      <0x0 0x0ac40000 0x0 0x1000>,
> +			      <0x0 0x0ac87000 0x0 0xa000>,
> +			      <0x0 0x0ac52000 0x0 0x4000>,
> +			      <0x0 0x0ac4e000 0x0 0x4000>,
> +			      <0x0 0x0ac6b000 0x0 0xa00>;
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy3",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe2",
> +				    "vfe_lite",
> +				    "a5_csr",
> +				    "a5_qgic",
> +				    "a5_sierra",
> +				    "bps",
> +				    "camnoc",
> +				    "core_top_csr_tcsr",

Looking at the memory map I have a feeling that this "core_top_csr_tcsr"
is not a natural part of CAMSS IPs, it should be clarified by someone
else.

> +				    "cpas_cdm",
> +				    "cpas_top",
> +				    "ipe",
> +				    "jpeg_dma",
> +				    "jpeg_enc",
> +				    "lrme";
> +

The .dtsi change strictly follows the dt bindings description, won't
repeat previously given concerns here, so

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
