Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5D3B442F
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095088; cv=none; b=VXdpoa1BvxSlqGpMIvf7ygIRVFGtvw9bPbbKoVpcnh5qDu5EuNjyOfwi9gbcwbSCEsZRfh3hsIwnNL1h7FYRfLgRGcu5OTzdiEiuLN1ce+sV3XSY8mUNZZ/QqZByATsj8ddJV0tzIPgv22Erk6xBLEk/S8zIqxnEkXS7ptZx31U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095088; c=relaxed/simple;
	bh=Lh/QdKDKUhi+nstzx0NETNDyYUB5yLFuyQqV576Cz3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eiggV9T/OQJpoS8GQ6xDwSxJW+Iy4sO5WJhb1yPHS0FfmBInnhlBX9pfwWPO+wf1BoVND+QkejvKQKL7HP7Hz42rOH1X12cePkOr4s/Zbacw36HIPC47sigIInBlejYlPR4gMpLOcvuf1Z6ve7ON0UlURD2MSzFtIImbymJjQ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4w1cqA8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4w1cqA8"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48431648f33so615777f8f.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095083; x=1788699883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=d4w1cqA8Gr2WlVB/J3GPJJsnw8be1LaomneXeoWWY1mIon5XW+OKErMadRhdX62thc
         vs3VNPhbyUTMqFZSD0mA/VHmx7c+Jh0WPClnIRs9RDCakf249XJ13gd8VDofk+SCXULb
         AM3MbV1wold7gcst4oHsNbSiCB4ezdQr7EfTsDd3TtcMrZ5yC2Bos4UGqzKl/nbvOCGV
         zRGWpn9th4QIjrybtS9vV4JRURoKDDm7KWDaYKkxH20VyjFykzI/dgUZeWt9z4ZH8pLf
         GtKcSOPMbdX9MANr5BN1cq0U9zIsfcfY3sdg9jHtMk8SkRKnxwRPzc5L+97zth+yaOXI
         LiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095083; x=1788699883;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=OtZ1R2uFl4RmlQuExnJ9bVf1StyxqCEqUv4dHlLEHMVPq0jqDYbrVsKLxOjJ6nW+XL
         MFcr9pX8Mf0VtNGCZgrzzoZohy1z/ksi4lf8O8KLuRmh0k/ecH6Av2sZe5kUggr4wrdS
         fzBQF6rLVVTu5KyPi1RtIZvvbzB1r6HWl0ZiJsFo57JOFEGjGNb9dkVERR4lMgO0LCnP
         Y3g2IYabFbrLnbuD985vOG2Gy+SBpH2Cl2k684fLLaLZ9+qACtzsTn9esOYXd1SFusw3
         kFl4EB8D0CF/wQIokJ9pXFAI7ma6R6Ra9coNi9eweCZlzk5vcK9JN+T9RScgK6lE3HqB
         GdBA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+2HCTcpkkuzcY2XwFWFTlaVFcFG02ulGLG/csznRiybr57Kn4CcYfJpgrf2kOQeN7p9DEWsuITwVX@vger.kernel.org
X-Gm-Message-State: AFuF++mygWz1UvwViSR0sEgY2EP2AkJgKH1EFQaR9Npldjlr8xhfFgSh
	/qRCfXrttW5FiA5BwF1WO9+Qe6xVrYFXV6YxGKM4Q9YTjcfesstYMfyvbYvHyVMrXsY=
X-Gm-Gg: AR+sD13pEM1/2NgyQc3ZjGLkc0bwHx56v0X+6kvGqluaDmeeXFaAlJZU719lCwlAxQq
	32QyDDsxYDnW9UgYSMUeF6m7VNFCpQn1sRHRxpE22quhgThHfOkRmVwmlPftJPi2+LUQPSEGWKn
	w4Sux1QBDNICciJVn/a5bhDSBg7MqpD+mIudnpIumSY1MNvlBytoaGG2d3vNwPyMCNm7cyDiC7m
	kzgPZlMCz2Mm3ESxSunVP/J0jCCjCu2u/9CioB+sM4338GgNwLhWNZbzKlE/0M11jyqLdcjWt8J
	caL9DpyawaVwxR0WM9Yo6egnH1NVEGL9ujSAPdKq6ou/33ruiv2dgdOkEu2caOj4v80voj6WYxV
	nHVptV7aX0zlvo7n8x4s+sv802IDm2vTuLmGd3rDg/4eE9cvbm7dlMT3NWfkZt2AOPeww9PD0/X
	JDQZHWjm66HhX4MEw9XCeGlWUy306hCU3rcRIhJoVNtQVvFd4Sef23dSzrNR/+u+mRD4X0WgOT
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr35600565e9.8.1788095083121;
        Sun, 30 Aug 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95018ee8sm205342395e9.15.2026.08.30.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:04:42 -0700 (PDT)
Message-ID: <d4ba8298-fb80-4fed-b1ce-7fc5d0adf5a0@linaro.org>
Date: Sun, 30 Aug 2026 15:02:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the
 vsync PWM
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-5-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 11:47, Lucas Tanure wrote:
> The vsync PWM output can appear on either of two pins, but the
> description named a single group that does not exist, so anything using
> it would refuse to start.
> 
> Name the real groups instead, one entry per pin. No board describes this
> output yet, so nothing changes today.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 8c4bd683cce0..719e111bc3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -546,9 +546,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_vs_pins: pwm-vs {
> +				pwm_vs_y_pins: pwm-vs-y {
>   					mux {
> -						groups = "pwm_vs";
> +						groups = "pwm_vs_y";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_h_pins: pwm-vs-h {
> +					mux {
> +						groups = "pwm_vs_h";
>   						function = "pwm_vs";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
