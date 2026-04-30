Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A7D39FCD9
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 07:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533341; cv=none; b=ibeJJrPD3AD79SVli6LJeGzQDbJnq8irRqk9mp83ILPAcNztxFeMJi99CGKh5nY+z5SDmKg5Msp8jgpgVbjBXfmnCjVrvkOJFArrOk188KMT30uIStHMociswiRYwBaDGVJlv8GK0xsBzwaRPVeIf2Fy0nJKkrx2GYrcDRrqHXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533341; c=relaxed/simple;
	bh=943u9tGah9fZKkBwSz2vWV6zvES2zNY+ugxae7nl5oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mrLz/SyJCth60DHMqPvS5cKE3nMqazbv083gaITrcFrPa2d7hM3EtsQmE6+OZA9Uia9MO92F9Wim2D//TC3BTy/zc7YuIfYkTb0y7lHSrzA/8iVoGE2571zg6wk0Zgwa4ILhDlwdG0sZix5YpJNoqiXJSehfPFXYY7oaiG+/3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qOpWjSls; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qOpWjSls"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe62837baso297837f8f.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 00:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533338; x=1778138138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=qOpWjSlshHfX2QfWoTTjkcCTyIqnQYo5T6I8dnS5wKZOZG91IPvbBHH5p7naasmH6N
         7MN6PJePxwV8U69lrB+ch3lvFOMOSycneyiLh68PV+fcznyoI8FFC6aLj06nitOI20JT
         tZRgxL3XplTq1dJA/OQq2pwhFCBZpO29JmxxK5FtpojsaOAStm02C/bkJpenwo9UjAO1
         dgdCcI/vhAX9F3KKIYHIgQe9/pMJQckGI0vhXAxEGUxBpGsuByGhBVaaHo5D5W6bs2oh
         t6W0cnkLZXM+l5S53mkbdwnKRQHnvV9oQNsMgaJWVxhia7/0cFE8bXRQv5t4fjbYuJba
         nzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533338; x=1778138138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmRymc3GPUbLGGqxDSkazp7UPTgnpwv2CEs1VA6yd2g=;
        b=mJ24LGRmOpf51bnUM3BKkyW7EhJEFVxgtJVJ3wUSmtfcyKWraiYkcghUDMW98NMRMB
         stBF1IVQxjV0DHsNaZGzlwXcv6ScYU5dy+dKgWfqiHWWQvMQxMbMi8VUmA4FKznsjqix
         pjw13hiJQOfnVr/MGw+Moy+LTwoXXUMREzNZ3JohpW8fXXeg5pOlbmifOlrq0WCErcKZ
         Mp2fr7ihTr82JMDTOpfcP9WQHuJdhTe1zCkgq4tSgvoqPQDPlKIfjHYFhoqAl/cOnp8x
         P8/gZJIltBl2uyrdG6Cd0EOvSNf6xxdAUJtTq3yZiYLKXyEBkAKxZDNXOQvr03Pm8DTq
         48pA==
X-Forwarded-Encrypted: i=1; AFNElJ9mf7jM63rbhLx18/qPJv79zEaxQxjIjubkyQGkVCprrW+hz4BXzvpeiI+O++GJ85nTWluV0toD7IeL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yNGiOrGAQWkWvl9qRla1hmprduQcbrOqd4ZSv6A/+koymt9S
	hXB9L7//xE6PfM9vzoMU7Ic7+glFCssu4HRZuC511ufI1oB3j6O8tBVxaL1Bnsp9hM0=
X-Gm-Gg: AeBDiev1Oj+gmaAqzz3LsL3jMNnBL1NeEU+uI9FxGjNS4VU6vpB4lPGiz7RldF6z8ko
	zDcGL6mFmP+ustp+OIObXyxx1XbV92DBlNg8Mauy75Wfz4aMhNl0iIeT7gZzUnof3pJ4fSYKL3y
	q4R9ST1EoF/raeB0Kh0sTkl7E7Sl253OlrupXTwzPG5ZpIbu/TNT/AGIo8EAexzLdHSUzhPVQhg
	yB1IkGye8StA928irYCx9Dq9uVmxgEwQRmXvX3KssEscWcEDMVdDlsXgPWpQ7sxbrSGSQ1PejOW
	I01s1Ca1uFVgUIA8AIXyva+GHvF5RdSTWprplfRe7Kk5EEiyA3ZIkbLYItbi8UB75kF/a7mrd8r
	7S4LFgujNMREzrX0IF3JzE2pe9Gi+PoDHfYm1Sspyfl9qRfUT3gl45On/sdEHpDJcKJ23WO5pFo
	w40eW02ypbzTac/w732+fbwLpx1xMvT03nFz8KKRq0Qm+VT5wy
X-Received: by 2002:a5d:5f82:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-449403a9bb7mr2449221f8f.39.1777533337875;
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7217c56sm10970745f8f.20.2026.04.30.00.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:15:37 -0700 (PDT)
Message-ID: <749460c6-2111-4729-a5f1-711d674bacfb@linaro.org>
Date: Thu, 30 Apr 2026 08:15:33 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: glymur: Add camera clock
 controller support
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-3-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> Add support for camera clock controller for camera clients to
> be able to request for camera clocks on Glymur SoC's.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..8e2a872988d1c3d97506856e2e5325646db59746 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>   			status = "disabled";
>   		};
>   
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,glymur-camcc";
> +			reg = <0x0 0x0ade0000 0x0 0x20000>;
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			power-domains = <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,glymur-mdss";
>   			reg = <0x0 0x0ae00000 0x0 0x1000>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
