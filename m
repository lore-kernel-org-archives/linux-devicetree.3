Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAF3A874F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857333; cv=none; b=mQlV8NsRLAPrw8HLXSYJmfcexXsrmbOG6jAEVJqvz87p3BkQG5dr499OYotSOQ9pTZxx0cvMCAlknRTspJc0u/JV9IV0qaCW4ZsWpx2MK8fcXgiMlLhU9SfdIvTLNzebR4gJvRbFFb/ej3houJ9a1aalaJliWvSq3aFzo0FP+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857333; c=relaxed/simple;
	bh=MPDWBPm36fsWmva00EjlRjN2FTdNLYptQaxhTf+7Fg8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=luj0ywW5rZLfWwU1IfrL44Iinz/ZlUpEdmdhbcslDs7rYISr2gTr9cLeaY6qSL+mwiOhascXc868c38gSA6OY03EszPjoiPJ9NW81mr7AHs6ObFkE1nORiRTbB/GBXjgxkCusj/mPR1G2MQMRVUb0aCtHeSiZGlt5WeQJ+HxfcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7D0YxSi; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7D0YxSi"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso34976395e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 00:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857330; x=1775462130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=D7D0YxSio7A4uSaBe30ZDn2zK9/eMSYJn+lo+a1N32wH0m0Tc3AG0xavE23lwL+sXo
         SktKSKq6PdxQz8dnJ2QZG7e9b4uZaMTvDtgk4dLzW3aJeHsWd7wVtEzKlyvHhOY8Alrc
         TZgJksYCX50uVaJ34GzXmi8+VHo+o9m8EI4hu/tD6ctmvsgpPCMo1JkHoZlhcYaC0WNO
         eWmHojJd8TMP+3+5+32WAMSHxHs1Ew3oLFdbaHg2Pz0vXxdgCv/j07oU08V9x+m9WbQh
         JSc7myNEoq3kPyKfp+TCGs49uNJYLYPPyHIANwryONs+d9RGqq+zKYMijnFWlgb1vPgH
         wx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857330; x=1775462130;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUItjZv34EZ10kX4LACTE3wjNz+JATlDo11i94BXg48=;
        b=HgiUky/WFWfbpPPo+V3Fgf+5luXdqO9OGhByx4RBlcJNgWPjuCJAiPdNnN13a/6L2D
         YxV9Fwc+oADB5fRznRjfb68p59C3h3VwlTpJyJcqQQWw32VVXGu7bnMOa9rMMoi0o74l
         dIsllnK64fQb8eoTbI7ZMCARqmVbiWl/QCtEmKOCNr/dcrtUJiV7UVQ9pDTeIx9pS+M1
         B1iUiUtRwKV83x3yYRksu6nmil3/zca26FZlmVvUU8qeDJzapCpgMTH55WTV5Djsj6Uy
         wOQf3VyeXXuzewFDw2n3e73BECyho7sm5ytTW4oyE14eoMPILIkn3RLkT40nrafklmY1
         N5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWSWJcUJoUK9hDSOAnp5jsQzYm/oMUOuZbox0U4Xt/riHLNAavTA6/1ebH9+UHqA3iDAE0kPTXixNlX@vger.kernel.org
X-Gm-Message-State: AOJu0Yzud1ryhGcINq4nSupcvJthlg7ymVLz11F8bFxSxmbFvlLVre7Q
	3BD0MtowWlrOHRftJKhuttGFp1oSFnn2tdiepjrh7gv8YzuH8aXbylx2arJOgudW4PQ=
X-Gm-Gg: ATEYQzyq6jiDNiAqwLbjplOansqn/X8jfJICoKm7br2vdGqirCMdKRpAZdzo4JBDlNc
	rttsbfHDD0IPHY5HbCm0sfp1L27BwAB4jjKPa/cSyESxUuK94pmrGvtv3eFS6Odye+qD23mSlrL
	LmZWFhYgFnuLlOAoIp41yPcTRxN77pDdIHm7ASF2KDsZMwqFIdTAL63GvEBLoLupQ088CICOcKH
	vf6c9gRagOCiPlKf8A/U6E0oU6B/hEklZisI0qC2tK7ts2wJrrCKbE2bFiRiMoCbnmDWvNv4w3p
	7LZt5Mr5NuCFyi5R2lckU8ufW2f3T6srP6fWzI54pZrUuODWhjJuGRNM8Ebe4aTVNhDPvhgswMh
	HigocIgLFXu5XIIYBzdYWhDZOk52eykGWucI76XuJw+iCTIsWoc6iPRMLjrWDARFOb0mtCpf+tw
	i4T0dqIKouQqx6mLGVQUrDtUlNdKEZB+fc+BewOG5h/E+hXHa3ZoK2L84hsNDnTseqNpkTOsRiH
	UeBYss=
X-Received: by 2002:a05:600c:4f91:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-48727eda62emr178938295e9.20.1774857330208;
        Mon, 30 Mar 2026 00:55:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0? ([2a01:e0a:106d:1080:cb3c:d0d2:870b:6ad0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48735faac9dsm60393575e9.0.2026.03.30.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:55:29 -0700 (PDT)
Message-ID: <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Date: Mon, 30 Mar 2026 09:55:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
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
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 10:59, Ronald Claveau wrote:
> Add voltage regulator nodes describing the VIM4 power tree,
> required by peripheral nodes such as the SD card controller.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index fffdab96b12eb..2450084d37642 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -6,6 +6,8 @@
>   /dts-v1/;
>   
>   #include "amlogic-t7.dtsi"
> +#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Khadas vim4";
> @@ -45,6 +47,94 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	dc_in: regulator-dc-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "DC_IN";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	sd_3v3: regulator-sdcard-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "SD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vddao_3v3>;
> +		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
> +		regulator-boot-on;

> +		enable-active-low;

This properly is invalid, please send follow up patch removing this,

Thanks,
Neil

<snip>
