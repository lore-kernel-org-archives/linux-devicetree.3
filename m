Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1523EAB7
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625662; cv=none; b=dUUejeJjUkoQVBhTrrn6cebOVi9a15inchEtb6c5qZJDQmU8e04YXUNwUJYfKe3BAweUuWrQ1j1mL1TRIpg7QHRjn8krLXGM2OvlWHS4HHIEnYFaB2hlQEEggvm3CP2fZz1MwVPidBMR0lP+4I4M2cO7OsP8M69YqFqGtCqj+g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625662; c=relaxed/simple;
	bh=HKYoy9Xgf+hJVHSmfcmGJ8WaOBtC/NXkmKrTGlhdX0c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TdlX2EmxReTYflfg5lgS2bsTb/e2dtvzcAWLa2vQbyWpjHOFbIqmttVjPfIcjIfIK4MCZi58dKIIsiY5atQa0+oALG/xAwtXXuA4KosadXxg/0OiOLKdmeh0cM/yfnA31+iWomKSnY+hnylHRgRushBjkBXcam7skcyi9xb4DkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TXuHQLpu; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TXuHQLpu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439cd6b0aedso1506081f8f.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625660; x=1775230460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjKuvUBQiFpFuXYPv0VREJdyhtsXZOAchMgwkjnvo+U=;
        b=TXuHQLpuyG5rxtXEy5Gsh3SosARaTKQW1mVVLkBTJBimT3hg4hKQ23v4tgfvzNnuYr
         JBVjpGpgrYaMvAXJ3goIY7hxy6V1x89Y4ab7zgACm2qcFaLVocGpNHKirkIDmpEm5eNI
         IKt619uYO4UIBUEH5laKcF5SITEplKlh2Xa6T2smUPGMdHo/iAJqDs7zEPZRDcEI2fFP
         X1SDYyc/msW767Rg17FhZ0yMAuZf/X3ihyAEX8XS52AzXidKeMthobxNsZc/LHKHadjg
         ldDLasa7znOJboeWQXU1bo5zubwDzIzuekk1yqWqh2QgQrGgPOAsiBg3FvM///Qk+sAq
         zbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625660; x=1775230460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjKuvUBQiFpFuXYPv0VREJdyhtsXZOAchMgwkjnvo+U=;
        b=p3k8LD7LS2heeLdm7w5wENunJVP/RVRt5h2kwZbrs+9G/w15KqkOOSFNuVSOZ0sp5E
         lx/O8XO5ssA8VHpPqrmsrnM9BY3lKn9yK08mvalikjLAMi0NSvvfUYpjTQpAzCdi/VqW
         P/IcCfOINJvICDzyS8qP6I+9E+qeAbVW6t0hqDDi0YTyBst35gc07kjoTCbhme5Egljd
         cr8JJ9K7g5K+HEnuBTVEwoZOCuH+OK2gA/82qe4pWo2TVRU3juKUujUIya8fzovtyMkz
         Z4paOHBiMmaBXADuWX2Qw5A9gCycLtJFXqc1jqLLkhcD7qf97CCxsYwv+VcZ3r3m+Dkb
         BhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUsSqnZTBuzO3YL1m3nm5fiLQrJMp01hCSxxZ+qBB+E25GzftUSukYi/E2QeMqctFegW12i/5urjlS@vger.kernel.org
X-Gm-Message-State: AOJu0YyOewTWWTT4yBo/0CbegvH+TV8nqWgAlx7VjCzEcWjmAFzVN5Gm
	H3EttNGcX123585e9HiX2dbg5TDVSH9OKqgprqUhrVTt5sWUmMjer0xNsZFukjTi3YSXXDwLyyF
	t/HMFUq8=
X-Gm-Gg: ATEYQzzT4CSPRgutj0Ef3vmFv4bgFapdAYbWdtWqnHt5U3H0iPLNSPCm7zRO1POcfaj
	44tOcAW9NdgLAwz8TS6Qjq1XUhiW2t5KvPs2L3AtYc8i55QA6Cmo9wQU78XAW9hTob8xjHhvzvW
	VJvtWmd6kVN7my2/Uu6HtMGhLJcNMCR3G3BsPhjSxwQAHLM2JbqGaxAQ0iPyXOQvyrLHgqgC+7e
	GNDbmsDdno+0mnLop3V3M7KU2elxeOEz1rNtMJBaHUOtgwdxHxaQG4U/M0Vbd6R70g0rio0EsS9
	GbGuUtoxocHZU7tomOjC1MhHKd9DPblfqo+xa/WJw+zqQqGpgYXP4CBXgt7ZUSEfxqMluRiOZL+
	p3trXFkoUgMDj1tdRk3I4O4unu81JfPqTkSbnizmMv50eC7uaJMLRbTRo/NlD4yq9MNQ0AVbSmt
	xIEMpgLSZwbpTTCvfcJdCr8yr7c8wK95b/9DpadJUPLF66YDaZHf59l6033zBbRoh9U6/Bb2jQ9
	H5mm0s=
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr5245421f8f.28.1774625659628;
        Fri, 27 Mar 2026 08:34:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm16597152f8f.4.2026.03.27.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:19 -0700 (PDT)
Message-ID: <f8c47b7d-29ae-4aa1-ae92-07dd691b3b92@linaro.org>
Date: Fri, 27 Mar 2026 16:34:18 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/3] arm64: dts: amlogic: meson-s4: add VRTC node
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-2-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-2-nick@khadas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/26 10:30, Nick Xie wrote:
> Add the Virtual RTC (VRTC) controller node to the Meson S4 SoC dtsi.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 936a5c1353d15..2a6fbd5308362 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -59,6 +59,11 @@ psci {
>   		method = "smc";
>   	};
>   
> +	vrtc: rtc@fe010288 {
> +		compatible = "amlogic,meson-vrtc";
> +		reg = <0x0 0xfe010288 0x0 0x4>;
> +	};
> +
>   	xtal: xtal-clk {
>   		compatible = "fixed-clock";
>   		clock-frequency = <24000000>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
