Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A067E40DFC8
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936435; cv=none; b=YBGLpatkxqs7/wE805CsbFbF+M3hh2VLlr8/reUjJ2kPKOXVQFryNV3kgz7Li3wiRgM/pZisn8VyDIc0oeezSYiM7jWrqd6EgG/DggQXe/vIe1liVDM7vAeOB7F7sCV8yky1pOqDfM/pARdfaO3WscOmovabs74BQ2VvZpelwCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936435; c=relaxed/simple;
	bh=nxYZ4R1tSO7HPEpkoZJWOxoSq2pxWHShTWVprZyqyyQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dhOGbZmFiiv7JxI5sGhCOuAITisVkHMQKqtt3/9yySFpum+H2b6wDrJhX5Ui3hNOPC5i0P/ecV3g6hzvGMPjtomvUllmXkqRiIdggtp5DV8rMw12lvAgq5EyOq955zi+q7pp342Pzt4y1uhEIVlolBFIkBhPzsznMTplw5O1yMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GB+sptQF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GB+sptQF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so1824592f8f.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 03:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790936432; x=1791541232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7RkLpWpnxrqjWtkAeqPz5vHtmSZUOvXiOkBdgIOLu8=;
        b=GB+sptQFA6N58oFoHASTM4o3LlliSb7oKkzG/vo4LVl27yGdvdB5r5kBEaGIsHhQHO
         SjfF51xJFMJGGGQXFCSHoDCe4BiQW050fM6RV7ctr3ixrdqKIiLqGzz95aLCJyNWOmXh
         TeL8wRUpd0UKGvJuBQrFzdJubK8rwXYXanYQXrdf90tAKc04WYvOd+PHmwDs/PgUknrv
         +CHP35HX/WOXL22hbqbj0QkINrKrh4/45i7t1JLe7LfQZccxTa5B4wcPrzkk1yTywnKG
         Kkeb2Klydf/lFfyKUCFWFEa2NLome5BIjx3gyg+s51Bt8i2FHJgBsL9aSZLrwnfNUWtw
         90qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936432; x=1791541232;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i7RkLpWpnxrqjWtkAeqPz5vHtmSZUOvXiOkBdgIOLu8=;
        b=tt0RMIJz/rpf473tdFnZfgYPbo7FfjX4DhcNJptqQ2bSysCdpRbnQaT1fw3H/+Y7PR
         p+Q8xeCWxFLlUBcZoBwIsY4K92eP5NTCmylp6QMXAlChYtYegd2YfcEBv7ag4piovs7m
         4ITJXgkfEx9bPYzciOlt1JStHSE0Sc74DJNkfsllYBjP8HzCiP/wk8YzGFYLIiNjRIxC
         ifJGZXpTHj56ZLu10mLb73Z8XwMguYCP09D5ubQ2gYqV5ZMX0SE3s+J692jQZRgUqGNZ
         tdnC+F2RILc7EzwqcNXKOk1DG4PqRDWRkR9DkGCXoWlSy7ki/2ZHr4MIE7db0ko0RxXB
         Utew==
X-Forwarded-Encrypted: i=1; AKwUvBzmK3N0AaAYj4w5cFCUDpFL9okNbGPfDJQRCv85l8+u1+CmzAQywR/ngE+NIPOVh1+ISPEhsfZ1zJu7@vger.kernel.org
X-Gm-Message-State: AFq9FYJelqrSH5fHAgFawI9Bf5q7qSDX+xXeGVtfFoLmIQ7htTwW7A9I
	rWc25k1SXN6qfLwWxzyGdC+SuU/kZDq/KoK4pfrvcSgM3i4GBJ+iaqaut8ZGGyRJhuQ=
X-Gm-Gg: AYBFou2fSCx4B6nblhBYrpdJcKF5pfEhYbC8Htunhf16w5DPKnWurm8Kd5zaLhTgLUy
	GsdpolwU5loeqbaEMtEqHuhl987RFFrn9Y3JUz41ZTbKWY4KxqxnaqYQnYhsyBxJ1OwLxda7EVp
	A2VXCoZtKMPm12RwQBp3aCpJ4Fvgk/d37FKn+D8XRQcEJblliX1J5QddYxKwwDT5uhh7DRo/Xcd
	pKGd0W4oJvJF24NslSCxbBndUzuv6SEGptolPEjgO+YN32JD1+m5IN+/N9sqXGBbgcGaB7D8OdY
	qmcLQfu3bjpwS7s0nvjUXZg+O1vavzPdJnpHSsy0SuktFoifpQE2zz+AVjyPqm9otUa4FpnvncT
	3B/+iG2w/HOhoWds1Uibwt+y9gmD6Qv05THlL76HhQ7v8H3fmht4QTauVga98Q7Slul6s5hWgLT
	kESP01cS+NtiP1V0Hnylhf5sUkV8dGDgQCqC3bS0J1WQOb4q3oyM2exxeF7+plY6RxxF3YD6Qb3
	wsfskuU9Uhz+rZPWtNGNKbXZD168MaxihB9Wxd4fU0d4I2Lrhx/
X-Received: by 2002:a05:6000:40ce:b0:487:27f9:835 with SMTP id ffacd0b85a97d-48b1271ad90mr4015469f8f.42.1790936431525;
        Fri, 02 Oct 2026 03:20:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm4617706f8f.16.2026.10.02.03.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:20:30 -0700 (PDT)
Message-ID: <52f4ac2b-430b-4e3e-b3d7-febcf6312afb@linaro.org>
Date: Fri, 2 Oct 2026 12:20:30 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/26 12:17, Vladimir Zapolskiy wrote:
> Add initial support of camera sensors on Valve "Steam Frame" device.
> 
> The change enables CAMSS and adds description of
> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
> - a pair of OmniVision OG01A1B monochrome front camera sensors.
> 
> There is another pair of OmniVision OG0VE10 camera sensors found on
> the device, its description requires a combo mode feature support in
> the SM8650 CAMSS CSIPHY driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Changes from v1 to v2:
> * added Abel's Reviewed-by tag, thanks for review of the change,
> * split default/sleep pinctl controls (reported by Sashiko bot),
> * fixed data-lanes value of OG01A1B endpoints (reported by Sashiko bot),
> 
> OTOH the reported out-of-range '<&pm8550vs_e_gpios 6 ...>' value is
> a false positive error by the bot, the controller gets GPIO numbers
> from 1 to 6 range.
> 
> Link to v1 of the change:
> * https://lore.kernel.org/all/20261001145206.2442665-1-vladimir.zapolskiy@linaro.org/
> 
>   .../boot/dts/qcom/sm8650-valve-deckard.dts    | 207 ++++++++++++++++++
>   1 file changed, 207 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> index d25a09e162dd..4120e9d676c1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> @@ -95,6 +95,66 @@ vph_pwr: regulator-vph-pwr {
>   		regulator-boot-on;
>   	};
>   
> +	vreg_cam_eyetracking_1p8: regulator-cam-eyetracking {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_eyetracking_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l5m_1p8>;
> +	};
> +
> +	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_left_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l2n_1p2>;
> +	};
> +
> +	vreg_cam_front_left_1p8: regulator-cam-front-left-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_left_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l5n_1p8>;
> +	};
> +
> +	vreg_cam_front_right_1p2: regulator-cam-front-right-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_right_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l2m_1p2>;
> +	};
> +
> +	vreg_cam_front_right_1p8: regulator-cam-front-right-1p8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_right_1p8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l5m_1p8>;
> +	};
> +
>   	reserved-memory {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
> @@ -675,6 +735,153 @@ vreg_l6n_2p8: ldo6 {
>   	};
>   };
>   
> +&camss {
> +	vdd-csiphy01-0p9-supply = <&vreg_l2i_0p88>;
> +	vdd-csiphy01-1p2-supply = <&vreg_l3i_1p2>;
> +	vdd-csiphy24-0p9-supply = <&vreg_l2i_0p88>;
> +	vdd-csiphy24-1p2-supply = <&vreg_l3i_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			csiphy0_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam_front_left>;
> +			};
> +		};
> +
> +		port@1 {
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam_front_right>;
> +			};
> +		};
> +
> +		port@2 {
> +			csiphy2_ep: endpoint {
> +				data-lanes = <0>;
> +				remote-endpoint = <&cam_eyetracking_left>;
> +			};
> +		};
> +
> +		port@4 {
> +			csiphy4_ep: endpoint {
> +				data-lanes = <0>;
> +				remote-endpoint = <&cam_eyetracking_right>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci0 {
> +	status = "okay";
> +};
> +
> +&cci0_i2c1 {
> +	sensor@60 {
> +		compatible = "ovti,ov6211";
> +		reg = <0x60>;
> +		clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates = <24000000>;
> +		pinctrl-0 = <&cam4_default>;
> +		pinctrl-1 = <&cam4_sleep>;
> +		pinctrl-names = "default", "sleep";
> +		reset-gpios = <&tlmm 195 GPIO_ACTIVE_LOW>;
> +		avdd-supply = <&vreg_l6n_2p8>;
> +		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
> +		dvdd-supply = <&vreg_l1n_1p1>;
> +
> +		port {
> +			cam_eyetracking_left: endpoint {
> +				link-frequencies = /bits/ 64 <480000000>;
> +				remote-endpoint = <&csiphy2_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	sensor@60 {
> +		compatible = "ovti,ov6211";
> +		reg = <0x60>;
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +		pinctrl-0 = <&cam2_default>;
> +		pinctrl-1 = <&cam2_sleep>;
> +		pinctrl-names = "default", "sleep";
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +		avdd-supply = <&vreg_l6m_2p8>;
> +		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
> +		dvdd-supply = <&vreg_l1m_1p1>;
> +
> +		port {
> +			cam_eyetracking_right: endpoint {
> +				link-frequencies = /bits/ 64 <480000000>;
> +				remote-endpoint = <&csiphy4_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci2 {
> +	status = "okay";
> +};
> +
> +&cci2_i2c0 {
> +	sensor@36 {
> +		compatible = "ovti,og01a1b";
> +		reg = <0x36>;
> +		clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
> +		assigned-clock-rates = <19200000>;
> +		pinctrl-0 = <&cam0_default>;
> +		pinctrl-1 = <&cam0_sleep>;
> +		pinctrl-names = "default", "sleep";
> +		reset-gpios = <&pm8550vs_e_gpios 4 GPIO_ACTIVE_LOW>;
> +		avdd-supply = <&vreg_l3m_2p8>;
> +		dovdd-supply = <&vreg_cam_front_right_1p8>;
> +		dvdd-supply = <&vreg_cam_front_right_1p2>;
> +
> +		port {
> +			cam_front_right: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <500000000>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +
> +	sensor@60 {
> +		compatible = "ovti,og01a1b";
> +		reg = <0x60>;
> +		clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
> +		assigned-clock-rates = <19200000>;
> +		pinctrl-0 = <&cam1_default>;
> +		pinctrl-1 = <&cam1_sleep>;
> +		pinctrl-names = "default", "sleep";
> +		reset-gpios = <&pm8550vs_e_gpios 6 GPIO_ACTIVE_LOW>;
> +		avdd-supply = <&vreg_l3n_2p8>;
> +		dovdd-supply = <&vreg_cam_front_left_1p8>;
> +		dvdd-supply = <&vreg_cam_front_left_1p2>;
> +
> +		port {
> +			cam_front_left: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <500000000>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +};
> +
>   &dispcc {
>   	status = "disabled";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
