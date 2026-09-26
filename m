Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF1B47F2F8
	for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432746; cv=none; b=GDYNRWQ2yJ8NIzd8Dz60nh+ymGAbKNIJ1QluJG2XtPj7wq0SxtnizjE5Wl/Th1ot2xudt3zjZAxXzgdsM9tdZjVlERajWQ/7hQFjguPF08iw/kgtPZZ+308Z9s8a1JsJZ3NcPsb2qGPaZ5y8DC/ZpUEaNOf7e4xwsc5mY8PNwl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432746; c=relaxed/simple;
	bh=sjXsu7Wk9oEJK2CdX+yMd1S1zZaVAPHVkhDsFazZ8Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7Rx2nyErgqOxF2teO8VLSuvhrlGzCborjp64JLmCBYnFvOxn4PDxBwdN6ry5evSue2trb+gRO6E1mI14e4qtKLTME5rMIhz7FV+8bdEyKw1d+apBpqdL5YL6kcdz9mOXdktbXXV7MoVg+q3YR7V9zIfsrzJWCrl/0OopnrcZZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+J2Rni3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+J2Rni3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so9372415e9.0
        for <devicetree@vger.kernel.org>; Sat, 26 Sep 2026 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790432741; x=1791037541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=E+J2Rni3FaKWzzynITShS3+ZWZso5J0+VS4o7JSQAuOYIQs77EHACLSHEQ05RLEnr7
         Yhhhq4lsEBbcQuRD6w88Xu4QCBw1W/hAPZ1Op/uiBbcRiZ/NG+Zt88A0YtDFkHYxh+mW
         di6jOPDy690zs2AY0kl+fEIOJ3nxbOmMT7gt6s8NNNC4dfed9w/wwaF29AwtrEWAJouE
         25vyoHv9ErxSEYHPh5ek7dPxd9ZUs6a8xz5vW9TcPdxDZbOS/gI2/uxoa0gVPmf0gjer
         fxLNxHlr3vIH2iD9oCupWmt4j10vgUPxOk0FXwqx7pj0Htm59AV7j35j74i8tBA59uvi
         LhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790432741; x=1791037541;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y43NkA24svrY78BBtc2WACNWICreOcqz7QrQruDzQ7g=;
        b=eyE9KsvOsfYd8e3wwtkvwtEqRdcW8LvpYoYnXKSgTNHtTYK0sialo+otFCrVX8C17+
         WjEYBDbOnjWwbzn2Jula2XOcumIcYlyVatNFA1HquKL/W/e86gxgWdDi6G9RxBpqb4DL
         7EetR4910tQFCCSfayBQqAJcKUyfwYqs4/2++sPwYx4bVms4Gges5sauchVky0ngajWZ
         qHU4xqzZMPRmbx6xwVmv+pIXtDKUn0fj6064x461gABavhq/JNQVpTzxkBpodUBvzqnG
         kpLpgi4dLRU4G710SYmM28NsDTPoF2DiXg32oEmxUg4xiMPWGUreR6RULHL/bg9utiZl
         kEmg==
X-Forwarded-Encrypted: i=1; AKwUvBxTjSLb7AZ4QxdTFvx8x4eJ2PES17u0zNrbySZKMR/pae/Mb26Wxd/qp0/67hi7ZL6LBFUADhZEubVy@vger.kernel.org
X-Gm-Message-State: AFuF++kQfQCcdwLezvRHsF30Gs6legi86WgO5Vpsh6YpDsFP9pKRy4g3
	131lHLojaHU5oqoHURc631FiWhc/VSqbrxjoQgWdaggqrg7qPNA6X7yOyA5S9y+ED98=
X-Gm-Gg: AYBFou3pS0VC+ELXjjqthUrv8gfxr1NjrrF7CorpCWCSGiiJ3dKygaKx36GaGPG1W0e
	fa/kYeECJVGM2bvsP3M8sQ0VvnAhXNn+nZC3XJ7jkM/CCBWHMi+vEp3NEadBqo65G9JzBrNjfvk
	GkRJpjZnC4aZHkE8nBoZtY27xNw81sM2+7igsOoWVBy4v+SBMTrpJ6SmZ2pjSr2dxQHlnbrXYQ8
	eK5NpAqRtfi6qz3bSNfDG6Cda+UyS/g+Pzwaw0cRTr+4w8qP5mXjh6Mjh7zxmwcdXs/LAgPYanw
	3TFoz8IztBpegYhAF7vtzwhEChCJJhkRnKfGPP5IlHbFAg88WbN6JVFUUphfotrlA8cTUzqH8Wp
	v+d56rx+YMjwoaQNZSiFTjjVDgILCTYL/e6SYgp/AzccyRbIS4Ne8LYfIWVl2AN7fDerGpXpIEe
	S4G58eMWTkLc8RAohi8Iky7XnUF4OqA2qcpJdWYdVe/x+8BNeVL/fDcuUqE3R4Os1UkY20tvicj
	l6PCnvdTgg=
X-Received: by 2002:a05:600c:698d:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-49fff32848dmr11092055e9.16.1790432741347;
        Sat, 26 Sep 2026 07:25:41 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef5fc189sm101995495e9.3.2026.09.26.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 07:25:40 -0700 (PDT)
Message-ID: <10108920-4109-42ab-960b-85bfb4a49a80@linaro.org>
Date: Sat, 26 Sep 2026 15:25:38 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/12] arm64: dts: qcom: pm660: Add USB Type-C port
 controller node
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-7-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> Add the PM660 Type-C port controller and PD PHY device node.
> 
> As on PMI8998, the Type-C CC logic is part of the charger's USBIN
> peripheral at 0x1300, the PD PHY is at 0x1700. The node uses the
> 'type-c-change' interrupt from the USBIN peripheral for CC state
> notifications, plus the 8 PD PHY interrupts, including fr-swap.
> 
> The node is disabled by default; individual boards enable it and provide
> the USB-C connector description with PD capabilities and port graph.
> 
> Assisted-by: LLM
> Signed-off-by: Alexey Minnekhanov <alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   arch/arm64/boot/dts/qcom/pm660.dtsi | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index 156b2ddff0dcb..37965a3607417 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -85,16 +85,43 @@ pm660_charger: charger@1000 {
>   
>   			io-channels = <&pm660_rradc 3>,
>   				      <&pm660_rradc 4>;
>   			io-channel-names = "usbin_i", "usbin_v";
>   
>   			status = "disabled";
>   		};
>   
> +		pm660_typec: typec@1300 {
> +			compatible = "qcom,pm660-typec";
> +			reg = <0x1300>,
> +			      <0x1700>;
> +
> +			interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x1 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x2 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x3 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x4 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x5 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x6 IRQ_TYPE_EDGE_RISING>,
> +				     <0x0 0x17 0x7 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "type-c-change",
> +					  "sig-tx",
> +					  "sig-rx",
> +					  "msg-tx",
> +					  "msg-rx",
> +					  "msg-tx-failed",
> +					  "msg-tx-discarded",
> +					  "msg-rx-discarded",
> +					  "fr-swap";
> +
> +			status = "disabled";
> +		};
> +
>   		pm660_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
>   			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_RISING>;
>   			io-channels = <&pm660_adc ADC5_DIE_TEMP>;
>   			io-channel-names = "thermal";
>   			#thermal-sensor-cells = <0>;
>   		};
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
