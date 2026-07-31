Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7613D9DBA
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488119; cv=none; b=kOIsR2hkNb9B/tpQXXUItTCHqQQkusghOgdeql0LxU14pPRE9w/U8VfiuCFezxZEscPtbbLC3Htwxyxbv53asL9WGknDKJ+zdxXTnTqh2lIuN07y4wTJdQK3dS3dSzMke7y4d1wFvBCmv89qQ1g+p7GHNbHms9BEbdaxhQxX22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488119; c=relaxed/simple;
	bh=yIpEzvjKVOlYYV/ZI/h1Drlk6YvOIqNwrObuWA/sS8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PJLtJ4Ex9X5OiA3oOMq95JKJNvyI4AvCyetRUBnTDGpr46GnfiiX3Qw7Mh7b9o/xtiAhc1QZi/ZRIhdkjj9fOCGj++pTzm/GlTOhsdnJMvlm6qINYVl2donX772F1VQOwLo3KuzXr0WSjjzGORFFBLm6ZOxKymWSU06/McD74no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgG72Ui5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgG72Ui5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so310138f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785488114; x=1786092914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkKzcL3RL55Va2wcGsVulbs5kxhckxkItU6uV2P+1l4=;
        b=qgG72Ui5UTjTwxE2CpyF4iAszRHTIfR8E9CMDd2PIxVp7x0ZowUJZiwk/Gjhc3BKbJ
         jXoJNbnnTXvd0DvgVbCteyDfVvgfK2ITaUgWzXcCCXeBziaIqBFNYjTqNFQsu9X+D57A
         kYCIuOPHgRCJiPKRSZCC1HiKJ/zffTzfzKj8MsA0pys8CkQGVHJDfMk/xKcAa54Ap6cD
         n7T+MUzPODDLdfjNBUmt7Jo3PAG1ZtffqtW52NRu25dClFg5NEoXzOxRXvTXJA3xHzLv
         +dU2rkYlIT8svlXTExftOco7jpq29QpZTomkSRH/CR0P+oDLJ2VPxGtJr6u6Ud17/Vce
         oH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488114; x=1786092914;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:from:references:cc:to:subject:reply-to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fkKzcL3RL55Va2wcGsVulbs5kxhckxkItU6uV2P+1l4=;
        b=Uo7K67lXo1+oGy5R7Z4sW8ZyhDPZWedEEfXG84R9MY5QFASNlIVr6GYgCFJY95uufl
         cwuKEc3jivW+fg1cg3QGE+bWBUtk8C6tsEfAuQE/jPTydEvdzEyqIsR1Ym11h+8THZg+
         NRxAhsmH+FO87OAetHxb977BJeGQqAdB5q3oRQh4/NnIA3jpc2jbMNKJzexvL7c1YqhA
         ZwNQWPPWpEHg1CLUFjdYz9UWon9fwg0mHOdyuYlSHDJtlECqyQHisoWgUshysMYnduXb
         5qr70J+2nVX4tVyaUcTGqJkrV5Xdf430jdhu2ObGfgKV0oNmzAk3yqH7QpvCt4BFpazl
         2VvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpwq1oKMbMR5lYB/Ky+sPmu08p1PMOElNeE+Ppj9lHe4fEGNiGjYt/ZnD967V3B1CaKPpKyDlcEW5Tt@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfywUWG+fOtX3nPefqT6TcEGU7r8UqFVIOfjhm865YPbxerPI
	MHtajVca0rOG+5COjSjBOa/kcCvWN+DEHCXCixRzliW0O3Ap9GSHJ1m4C/u+TATPeCbGvbnEXK7
	Hfwn9
X-Gm-Gg: AR+sD12bXOA3osrYkb8kT04RYnjGLqa3jzIHUXyb/6tgRXuwNb9VlOfmsklmMGiyxTP
	fV2LjLUtUTP9H2plf7OyW1j0dRXUWVUajm7bIWjUf7iqOJxo7f3LuCBjDxS/EeeaX3ZHz6ORBNw
	VjwoTDAsn143njgq0aL12RiLI7QizxafNOhp0Dpsm5jZ2DpmXWDI6sIhoXvdnLAKHgQmznw56Wf
	gyRqRJwN8S4BvLtChtl1X26pi720V742GrT3JVxW4DUJjU0Jj6fu/JH2IWVgXRIOnVkrXB0Lc3Y
	Du3/YZpf7CDwLQ3hLtd5cQB/P1dM81fUHmorR1N0c5aai4u7w5SJ36MfSFg5NBxFLuXoM5lVTx4
	ZmC14g+6YsFHc0Byoaz3YWoKVUmIEXghd9bIyO+dzfYhNZ/VHY9wf0VqZpFpJkoXu9/SflA38wJ
	y136D4FzPP8hCgPkkU8PdoLk/kjEDMuqnM9GZOJOXtsgY2bEOYmpapz5m57F4TrGGdInf48m/19
	W08DzoPnyxREq+bLEaEDAm3NIX3CNThTzNS5dkNxw==
X-Received: by 2002:a05:6000:70e:b0:47f:91eb:342 with SMTP id ffacd0b85a97d-47fd2ac9f82mr3008798f8f.13.1785488113613;
        Fri, 31 Jul 2026 01:55:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ab61sm2254023f8f.25.2026.07.31.01.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:55:13 -0700 (PDT)
Message-ID: <34d2df7e-1754-4c0c-a685-c1b511161702@linaro.org>
Date: Fri, 31 Jul 2026 10:55:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: Assign CCI clock rates to
 37.5MHz
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260729112719.1151700-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 13:27, Vladimir Zapolskiy wrote:
> Setting CCI supply clock rate to higher value of 37.5MHz allows to
> program the controller to configure its I2C bus speed to Fast-mode plus.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index a64922c21267..a14e11d81488 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5615,6 +5615,8 @@ cci0: cci@ac15000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
>   			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
>   			pinctrl-names = "default", "sleep";
> @@ -5648,6 +5650,8 @@ cci1: cci@ac16000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
>   			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
>   			pinctrl-names = "default", "sleep";
> @@ -5681,6 +5685,8 @@ cci2: cci@ac17000 {
>   			clock-names = "camnoc_axi",
>   				      "cpas_ahb",
>   				      "cci";
> +			assigned-clocks = <&camcc CAM_CC_CCI_2_CLK>;
> +			assigned-clock-rates = <37500000>;
>   			pinctrl-0 = <&cci2_0_default &cci2_1_default>;
>   			pinctrl-1 = <&cci2_0_sleep &cci2_1_sleep>;
>   			pinctrl-names = "default", "sleep";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
