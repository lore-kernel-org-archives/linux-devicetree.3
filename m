Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D035C1A1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251334; cv=none; b=gtHXdNXocds6nvGNtWkg3w85VLmN23KHVTAwqzmg9CArNx4nu8QRyI6anNrU2uSNGHjri3ZPq/KE35HaD9I8u2Dq4Aw+wjrBvuD7jFpIZAhbeeS6enH0nclhKxH/+7a1BsxUeFCo+YFl6qSgR66K6vh/fFAZRg4qVttLgrmc1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251334; c=relaxed/simple;
	bh=4cMssSzC9x3YznfsLASdUieBfszbi2Dc1q0Kfv/ciD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dG22ccvuY7xLy5rdJhqLd1y/6H5Z76IV1jcPvTfVtvvTs1hl7bZ7j7zQw1wLSSxhR8yVC6/Ci16KqRVSa/0zRohOhWDQO1gLb9Ch9TnAG/6vy0Un0yrvlousuWdO16eukhTaIIrUzKx4LvefjzrYlMuFnJCOb3Qw9JgojfiCXiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l6qvCOyc; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l6qvCOyc"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3966e5e7cebso247231fa.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251329; x=1781856129; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=l6qvCOycLXNfotY4/FVwmVAUOJ4TrnIDsKqm3PcHmIFWpXsyb9VlUMTrOOeCEqLVi8
         +o9tPkdI7rRY3AwCfWqIgPXeUUy43hoCIaQk+yzImdilm2v5s56m5J6Cexo0xZmgUTdF
         tXvi0UpAlMomIxtKds4E5TKqxcr/53T5atx4EDzUHqHYK+IkJNE0MpK96X7JoJ5YG0Vg
         eugc3/b1oGfi6Qr0w5TBSDncUZD6zUu4tBBULE3dz6Fn1Zd7y1HHgVvACmdDqFWkEOKc
         6Wp4nmImnGkUtflfdPZLbFbUvkwDIqEOg11MhhdinIQd4jgtJ6ZiMusx9DJUUaZXdSEy
         bUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251329; x=1781856129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMhkGFekCaaDNI8Y6IA3kIgQFx/LhDxMuNSn8eII840=;
        b=It0qr0ZV4xB5G35a2YLUhNrk4Ei0BcKcTUg4iSHAng6Ye8RdJrtPLXN4wenkfpt2Ta
         p6oJY6lqKsFb+Lw2y39Wj985RbopRHfT3VWXJCmv3kCGuzLPRdeHPLzgyo9JIX3rqjxM
         c6XywDNlfsQ6Jq+rD8g1P7QurRK4dtax9KsjdDHhn4F8jF+Doxsuy7jDhO/vw76LeqU0
         oeVeKe0wX9XlfzyTWQvcbAvYOPvlgVWECKD4XA9SODLlldoc5ExzO7OPNLYvblOekA2G
         KrwHF60vQO9t4eigfVJvq/1fEe5D6hI5MTlK2dwN4gCwlRUfh4mP1Vs6q8f6iZEk+Tx4
         PVnQ==
X-Forwarded-Encrypted: i=1; AFNElJ89seWm/ZA/G7RJAsejFFgthIw3caa60f0ai9s/T+d1EKUuzwBZQ5gYZhuhbpxXtsVKnXmHg2evqWkx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg63Cq1SObf6olynEXHpzawYXGZjYwvK1KS0HYuseY1Jl5zAVB
	8a9Plg6Fj8NElJI02CKoojOhroEBQpc/xfwZ6dI01lYLb9xzKBw4tWVOthpF1wzfcAw=
X-Gm-Gg: Acq92OGc84cFDf7NJrTqmIokfiyHKpSgrihmNPxkU0rb3G0gx67hIKPG+Ehp71iVNbs
	S4Jw43a+kRbNQoTp7hi/PhpH4SuuuYgpazzf/+IHV7T7f8y4+EfS+QY06SWXATj/oX1xT3qnm2i
	SmpUBj4DlFjopwoom7WWFr5YC6qSG+0SDGBtpE7++rB09Pj67Aklm48O2wmCwSW40asn2yDNQ/D
	U/KRldvX5BYeex5bSgZqQTW+ilHEE9Is3YAeiPRe1g4ZvLHQ6CRiBdvooTM4xo9yz/sIYDGlRYi
	umK+BBi2X2TooIPrVRWE0PFpYTtexZ1FtBUBOeRWifBl1mUphKmloVHh4/ullD0mB/kVSBvhDgI
	PGaMoI3JuU9bnc5zY23HV1AvVPJGgZKH/Y6yd4zPwrl+m9JNjMjjHhygNEp6YyA6yzwg5vsVZJw
	MemrxHJ6CYBvYPzD4fkC1nEZZXT3jvGNJso0QSHxnFZw6t7s8pjp9AUNsmZUiJ+t0e2zZgxdVni
	i/2IdaIQY8q/RJ5
X-Received: by 2002:a05:6512:3e0a:b0:5a8:bd9c:a2e1 with SMTP id 2adb3069b0e04-5ad2db2fa46mr249662e87.2.1781251328767;
        Fri, 12 Jun 2026 01:02:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e17014fsm324975e87.28.2026.06.12.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 01:02:07 -0700 (PDT)
Message-ID: <b3a6798f-a7ea-40c9-a9b6-3aaba57c8ce2@linaro.org>
Date: Fri, 12 Jun 2026 11:02:05 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
Content-Language: ru-RU
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-5-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index fed71131491ebf6e261bfcd14b5d4a2624837878..2f0f7710c2897e140495afd8d4e8bde50f356096 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>   				bias-pull-down;
>   			};
>   
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
>   			qup_uart0_default: qup-uart0-default-state {
>   				pins = "gpio0", "gpio1";
>   				function = "qup0_se0";
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
