Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962377;
	b=l//X6zZnVdaG2b9GI722pE+pYwdpWtubRVN91WQTHN/QC56aHFJJt6J2Bb47V3Jp1cNx
	 Hel8bNijMkxrolPtX/e+wMNNgvVhd+evp8vWY6ZoIQ3T6IDuofPKyQ6IXEdohaoqghELR
	 YPvF3VOQjjB31yN2KMAaD3O+mRenC6a5zh0+mZi9wBLjBepO8+toZBbPeXlAp4MDzJFjD
	 a0a4+zUwT9U/4UkBCuZK9tWHO+tZsnkkDIdFAVJfmJ5Gq0aMezFYxlXpbKdvn/iAjDM5k
	 +nlhXqK7USI7YdczTsPCgE3uOHbzfwIPLajRBELtK2p8Nbe7FCLXDhEfDN2cpXmWFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
	b=Oy5W8LiU92EgxBjHDG9bfMwe8pvXRr1EdjOUGxWyP+QtzmlywzOtftoIr1CF7veYYP5j
	 Hh7EkkbXBb1Js7xN6say/HmzaFKor24/5ruDIW546+JFveDEQlDQHLAi7KNBLNnPeDirL
	 fJXnEwMuf7C+k94MGM8mfo4Tx/uXikPfrotIZSTjWh+FzHOTNNZ6pcZBWDiOJ/vimobjQ
	 oZparc0dl/d00h226auXvwShOC0sz+fOFoYzGWBzdxRtQhG1W8gp+kebIhauOUegrLl3k
	 OOdIMJEhlWH3ggpCrFkRB6yhMKHCPNnhGBH4Sjb3OpHXZUYlNp308c0/hZuvbZDn/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wKTOPBvt;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A0E606A330
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A0E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wKTOPBvt
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so256193f8f.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962376; x=1794567176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=wKTOPBvtJlvXYwQFwduNxulhkI1q15Ez4CeJzSIthsik1J7CJE+Hyr92aM5ECpzrPa
         UNq0Ni/zcyYuUHYxDos49FQTwXTfWSp8iz0LwIgtX90KL7GrQ8YaP1iDPEJjoCc0GGED
         zUKzOBDfkOx7PcGIxRwLHp1laU9sd9Fw7WVA7iAT/XFH752U/x8DmG3pkq5OH/Mp/BE8
         RwAo5FcBFnFtxHnlj2i9kWH1TNTKiOVnMIWweD0w9HudvHxJ7t2uer4WzjcJECtPwYGE
         +Sq+WIcfN5M2gNc10TnxTq3oHWPvzQsR1kextonGSXpgW4ajqkJeZR7fyKZTgGeG1rP+
         TNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962376; x=1794567176;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=u098J2uGLonqhgPYoW42NP/44v7ngzAHFNSVsUWcsR1dhdOd1D9HdHVRDcxvrabS8o
         sbD9b2FizfxdmYUJO9JqCpZexiCEJXpueThraCQGFeIIrqZ0pG1zurtLf86QwHR5ecFy
         d0WWh0PkIRMJtVhh1KWUeHEV0V/erD7m/+UajIej9xs9E7cC8/o9qAQYQaypmBosKjKa
         vcpqOsM+9khzLHWwH0Y1R8Tn64u1qNHtSakI2eovbbv/1plTe/8dBKO3akgdfP1VGbX5
         fJjl74jnpvVoMPU6uIggI+JNCZuCeZZDSGsdkLoBzn5+uixYzLGoMcsnfptvoXq0rMvL
         iE2w==
X-Gm-Message-State: APuU4Z9fHm7XjcMqdB5HB4Quqttxe6SieG67H+wD8F5GZL1PpQh7uW3S
	cTM8juvbJqxQLGpqYl46GcUlF+soATjNtLR+UFJg45FFT1o33zVV51VTogo7tEc04pA=
X-Gm-Gg: AYBFou0AtSEBnNmJ9YGPWL+cZ1bwXjSvvHCEtZhjeFAZ794OvM6yaEx3Tr56aWVhLbE
	OEkooKYkNfiZC+dOZDYBKIwBSZwFcoN6cN1Ym7xYqbamB8v197jSRi+rgwCADAdDamo2nHw/gW8
	yDoEghzkTlzVpk9MRlyYcu+//pgGELqmuEVidcTB0f0oWJ9HM9Gi+t1ElZOAx8eHknVVxo1lO2U
	bKuSQN1xCZQcHFrDp4ynxFwEXsfFwBrvhvvgy6xmvffoKUT8tMRYklIZLUiyYmvqw9yAkZWxWRE
	QLZreZ1LFE/8fdR4Isj6Kg9ug/xpPOCAMLQfAj0jun7D2UUdoqn7fK0v2rlarw9lwrmo2AxVusb
	Gv2LUil5T9ZOJgQhdfR2Z+VK4fcE1NesdYwtP3fO1U8XCNGChmNkUByTc3kSWX9jq2dLVX4SLIJ
	l8DTtuwEgvazegR0S+tF/OqCzsWtyp0ssSHdQ+M2zhvfZok6oHkEFU9GNdCK3HOTkuPV7I6Lnpo
	4Jd5t8MSFRK7wwG2r17182nKk/wrAJkLZUHVz8OADlIRqEUGuvXEjuwLPtR0Z76PWj94/eTutjL
	WgTNu9vlaPSpqrw/j0lCF+XKguHnYLxeX1oD6PK5bN5mjLkBJpb3BwjDEi2iraDxS2U5Mxf5eDU
	pbpUVzIc=
X-Received: by 2002:a05:6000:4a06:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-49278a136fbmr4487405f8f.51.1793962375440;
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492fc80e017sm2563298f8f.34.2026.11.06.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Message-ID: <cd5c6354-58c2-4e41-b7b5-af1e2910be57@linaro.org>
Date: Fri, 6 Nov 2026 11:52:54 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU
 caches
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Describe the per-core L1 caches and the shared 512 KiB L2 cache, with
> the geometry the cores report in CCSIDR_EL1 on an S905W2.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 38 +++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 2a6fbd530836..675db02a8d5e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -22,6 +22,13 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -29,6 +36,13 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu2: cpu@2 {
> @@ -36,6 +50,13 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
>   		};
>   
>   		cpu3: cpu@3 {
> @@ -43,6 +64,23 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a35";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> +			d-cache-line-size = <64>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <128>;
> +			i-cache-line-size = <64>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <256>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		/* Geometry as CCSIDR_EL1 reports it on S905W2. */
> +		l2: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x80000>; /* L2. 512 KB */
> +			cache-line-size = <64>;
> +			cache-sets = <1024>;
>   		};
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
