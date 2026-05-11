Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3F3374E7F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504162; cv=none; b=Epg2Pz0lJsx/TG6WHBczdHQ9j4PApjFFlz/6Qm8g06gv4ozu50sMGCDXzH7OS4edSr/1VxCwgO7oQo0nxWQpN8MRLk+hOzCOSA8Vunb7TtPrcQusr8wjrTDbnLod6z0Rj3L2TUoDeYizs8CnfFuqvaRV/0zWimUQ1Pz819gNn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504162; c=relaxed/simple;
	bh=+1iU5z69pi6F2Na0HC2kOduM8kBeZWewHfD+r34glp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fDOsl1SWsFIYNKD/KgbPlH5ftt8xB4BWJv9MsYv5TzYo15aZhC1NpvspCxO42EUUSMYNfUxAorFSfD8fIrIVQ/lKTpBeEf3EBuZPKoJuk4EUKSp5ZEpYde/IqXajWq6qXRYWvQu8pxtDjREygrhQJqjKvSgxHcJr3gIDMStEhw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vpJ2G8Q9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vpJ2G8Q9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ad135063so34542875e9.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778504160; x=1779108960; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uaDWiTODxxK8q8M5whzLuto3vCTYPlcoAVZ4yb65DCQ=;
        b=vpJ2G8Q9fkFguqezQkyvVdk07JmOL0lrgXPWQnIedhieOhKeFmV2ngsXQWkXspRI8O
         UcHxriHN0RglFqikE9UPlo/IoH7jJzaR7gVFMzTcgTcgtVEYwbKnAbqec90Qt8nQ7tEY
         VAXmEGtg7QU9NvlH95LcC7FFoBytNKqG7LLX3Mi5bPULYHOvt09zPsnWKhQSazD+FLE+
         yRvVJELtZbR4q0Egi8r1kB59yoaJUtRbQ6GXswjn84oPacK9cFsufJFYtL8JHDUV3e7+
         bt+eOjIM+Zu/5Rr84TSRNNFwVka0UUTsaoheE0aSqX3oOpmf4RcbEut4F9QA5TOXb9xJ
         iBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504160; x=1779108960;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaDWiTODxxK8q8M5whzLuto3vCTYPlcoAVZ4yb65DCQ=;
        b=JedUBS2bjrsKfjhtTn+FV/jmGHW5BD685SM1nMpG9g8Q6W2GG/DnioBynVHWxvjGpq
         QFesmT58dEHen56vHWnMo4vfHo4WipxfTIx1FyiGqzN+eHe9CHVC31g2ubfdIY/qN8AG
         ZQN7FziBmj6yqDpBPFce9Mz2+8kGBzCPYZsoPyHXCjyaA8CYHpc/lyIsayWfYe2H6DNr
         yOoNmjXdm8iE/r9Xq7ZXkbb2idyb5TgWFAvTxvW5dpr9e6eT/ZSnNmNHksNJq/IhLwme
         xmBTxPx/3/XPY/EqG40u4ZueHD9MUlrTvt4E1wxhPujF3OZ3D3zvo8EDrAPdyZx9gf5T
         su/w==
X-Forwarded-Encrypted: i=1; AFNElJ/OGr5ve3Sl7NqqjcVpnbi0CsM5ytyqp6NN2wUdBEBHEczNtS1+6F5pdasFSmBrjIa1a9V/yal5PTPb@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBCBz9V5ymxVqGCGIBQoB2JQjsFv48ejdL1Ef4BZIM2JHTaz+
	PajV5DovHLoPwIXAAss2YqcN6md5wgI8m8oi5xs3pCmLR8A2A9Sy4DGPHROhTIJPFxM=
X-Gm-Gg: Acq92OGYuHhvuMWSqYH8KLKn4kEkEj1BFYWkDF5t27GRh5X1TGnyPwFhY4AJAcF54Tw
	JKGSEI5Ltt1UzeMTdAGtv6L6/Cd57H4C7TfMw3tGdLW8rdkZMuJjjRcHsJ8PNKm6WgTRvolL/ER
	NRveq06Ksophsxux9qGFf0btTiWEEFMTl0R+0g+qfRcpFPVwJTeM4xyM2P9wqti2hrIbneCanUA
	hDEzHHjrwLGFiGINDg4k/2HbSQ2M3R2QQF2+tEk+blPjyRIyzBAuaR8giAZ/+/not4qeZrXWGC+
	iF8jAufQnMhygiEZwTm51BLpZ09JQlvHfie2MoYrVr+owGQLN+jWQEryrEN42bxIfPwyDngJoAk
	DIvnmdz+6T8P+C2jHyXWnsCoWPIjckW0oqaBn480BBoyklNvqA+7gRF19M7Mg/owKXv/AJw1UqO
	PVFhBo0uJe1z24/whF/iKXS2BfrYGe8SjegCsKlvoSV8kGf7b8TMDruOw92AYD6hc/jIJrVphxp
	OC2JJQ=
X-Received: by 2002:a05:600c:35d4:b0:48e:74dc:999f with SMTP id 5b1f17b1804b1-48e74dc9b4cmr165718935e9.6.1778504159596;
        Mon, 11 May 2026 05:55:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:63dd:7879:45c5:21b9? ([2a01:e0a:106d:1080:63dd:7879:45c5:21b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db09943sm64859725e9.19.2026.05.11.05.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:55:59 -0700 (PDT)
Message-ID: <e7997c4d-dd20-4f2b-8c84-6c75389f6285@linaro.org>
Date: Mon, 11 May 2026 14:55:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: sm8550: add labels for thermal
 zones
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-pocketds-v2-0-299dd4247f2f@gmail.com>
 <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
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
In-Reply-To: <20260511-pocketds-v2-2-299dd4247f2f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/26 13:33, Alexandre Hamamdjian via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
> 
> Add labels for the cpuss, cpu and gpuss thermal zones so board files
> can extend them with trip points and cooling maps through the &label
> override syntax, instead of redeclaring the zones by path.
> 
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 912525e9bca6..a9c678fc9cb2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -5764,7 +5764,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss0-thermal {
> +		cpuss0_thermal: cpuss0-thermal {
>   			thermal-sensors = <&tsens0 1>;
>   
>   			trips {
> @@ -5782,7 +5782,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss1-thermal {
> +		cpuss1_thermal: cpuss1-thermal {
>   			thermal-sensors = <&tsens0 2>;
>   
>   			trips {
> @@ -5800,7 +5800,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss2-thermal {
> +		cpuss2_thermal: cpuss2-thermal {
>   			thermal-sensors = <&tsens0 3>;
>   
>   			trips {
> @@ -5818,7 +5818,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		cpuss3-thermal {
> +		cpuss3_thermal: cpuss3-thermal {
>   			thermal-sensors = <&tsens0 4>;
>   
>   			trips {
> @@ -6028,7 +6028,7 @@ cpu6_bottom_crit: cpu-critical {
>   			};
>   		};
>   
> -		cpu7-top-thermal {
> +		cpu7_top_thermal: cpu7-top-thermal {
>   			thermal-sensors = <&tsens0 13>;
>   
>   			trips {
> @@ -6536,7 +6536,7 @@ reset-mon-config {
>   			};
>   		};
>   
> -		gpuss-0-thermal {
> +		gpuss0_thermal: gpuss-0-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 1>;
> @@ -6569,7 +6569,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-1-thermal {
> +		gpuss1_thermal: gpuss-1-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 2>;
> @@ -6602,7 +6602,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-2-thermal {
> +		gpuss2_thermal: gpuss-2-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 3>;
> @@ -6635,7 +6635,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-3-thermal {
> +		gpuss3_thermal: gpuss-3-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 4>;
> @@ -6668,7 +6668,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-4-thermal {
> +		gpuss4_thermal: gpuss-4-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 5>;
> @@ -6701,7 +6701,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-5-thermal {
> +		gpuss5_thermal: gpuss-5-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 6>;
> @@ -6734,7 +6734,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-6-thermal {
> +		gpuss6_thermal: gpuss-6-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 7>;
> @@ -6767,7 +6767,7 @@ trip-point2 {
>   			};
>   		};
>   
> -		gpuss-7-thermal {
> +		gpuss7_thermal: gpuss-7-thermal {
>   			polling-delay-passive = <10>;
>   
>   			thermal-sensors = <&tsens2 8>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
