Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEC63C09F9
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820664; cv=none; b=BtstRfuiq1C1GNcWpxuT4FDg8sBpq5J4LGo9hkLQPp9Zu+CUpE8qEWyp4t5tKqXW4uy2DQ2SX2P1QRozd1PHlzoFpZJF2//nVTKX/eaboVip20pONFJ2+KMHx/1wQPH90za0ctx9ryPjtWbGDpYEgDqme3TmnYZy4pnAu7BwBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820664; c=relaxed/simple;
	bh=vC1bKfBXahyCKuRMQ0+Qr6ZvKGj9f4KVu4CaiAVLSFU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ub3byUcAApUrCNASjKN6+4nwFIPzUS/4h4TpdfhQYqOE+RL10DxsoTwGeYNZ/x66Wyf2AlVg0dZoVorZ9/DV5X4BDO9ardqwG210ix4ZamglFyEK2mccPOrG162r4dujMJcwQu1j/sx9fcrnGe4jasdFvm9A1KhoW8MYzWQnfks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CyC+GT7p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CyC+GT7p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so2285485e9.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 01:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820660; x=1788425460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=CyC+GT7pSJzzJDVHtxEnGCICySd0xqT4kCJtItspFBtGgdlRw6ew/jG49diE1DeUC4
         SD8ufMejs6cZt03dlT8R1rskrEeSiuTOpfE4Ff3wjFGk03kil5OYOIguB71fhz74wTDC
         Z0x1FANj1Ek5eRfxySr2yayBt2HCmVABQZXGA1zeqTtUWHdBOFcxT733eaIr66ayRCrD
         7aI9vzWMzaIiSn823PmIg3SjBAuzvhaWPUXwQ2H9Mz/UfODwruCP/vvvAb3Zy/Nc0G9z
         FpE52i7uQeyAsY6OirUzWTGMAkKlRf9yyE3QP3wRTF4Guhcp3yhokyuBx3rYMtBvNSve
         gM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820660; x=1788425460;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/ECa4tNd88XdLDSwFPQYikw5L3eXcClU7jpbYu21eM=;
        b=llxyiZggGLWtxe5zTzmbHk1bfGqa8OucGxW3b+LCCheplE/IJiXwJjuz5n56yuNgsr
         Jdowdoh1X+oKvbyUfo2hPHLzmUawKP/6TeqLZiIciLRyoxfb1Wi2NPL3ug9/3TlsvOu3
         3Ot63EhZxMXo0I6OjIe+qEBcUXEOvLRw0Qw2gQOBebQhgEcg/J+6DW3kyZrIE0L3S/w4
         fArlt4JEplDTsR6HD5yj/hufH5JNQRuu/ztDvxtazFTMYV5AVuYUZVopLFYJtfTTC5NJ
         w1CcQ+qRA2506uaj9s14SZSH8Nemwgzvg+WTec6NVBRac0lTRZ3QeKV0q+F4b+cHwbDJ
         quYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5rdaxkZmAXPWBMq9Mrk1+0tlsfGpQLMplzR42BzPVh3574B/85MKSGYQKsOIWxnPavl1PoNSE0Lp3@vger.kernel.org
X-Gm-Message-State: AFuF++n5bxv2L3aPPpcEuyTnBb87UJPdtlsI3PTuO2bQHQHP2THwX40O
	aedJCVZQTfc5fxLQi20l3A2wqgpCC6vM4XLME4wOcU3VyeH8+sIvQRB9nMf7srYBIaI=
X-Gm-Gg: AR+sD1119fGoof6w9lO/ouNmR5WUkLS99GHxHJvvlGIVEci+qnn+Zr98FBNAf74PYnT
	8nlSLRRgS/ahBFiImCoofPUr8nDd+hxNeeK1NkooUAW1MACgdOPPqXd1xx5tytHVaVOZ+C79YRI
	jH9v1jcGfFl/+i+YQuuxu1ocZIUrjZ1Dmo60tU4pr6wO8/z6jfJLblN28pKN1+OJhiJTSWe30qD
	aHP/I0YWX7NBMioREEf/sG2/4csJUhuj5qi7mqCySS1/Q0jdL9IXCeig2d3Wv0iCvHmjO5mDho/
	8RrXr0zG8ZpTorzP7KY+pCGBxOipKMq3Uayy7uMtF9cl7P0swREbBD5cTG+cb7MMaH/sXbw+1ty
	82j+w7xbD/XGYkk1+YVXSssACrlLlIgHrkr2WGqtgpfhAFgHxVsSukSTQim719HqnFjzcEryypv
	lmQ3HEoywRhF2BivG5ACodk5qOwcpSFz1RdeiWZp/BIYjSjgrgT/KOOxtYQ1G+/jm4YrejXQ==
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr154198865e9.3.1787820659765;
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4ddf5023sm30302265e9.13.2026.08.27.01.50.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:50:59 -0700 (PDT)
Message-ID: <57e0daca-485e-4672-abf4-a1f8e55777da@linaro.org>
Date: Thu, 27 Aug 2026 10:50:55 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260823115335.102219-1-tanure@linux.com>
 <20260823115335.102219-2-tanure@linux.com>
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
In-Reply-To: <20260823115335.102219-2-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/26 13:53, Lucas Tanure wrote:
> uart_a listed the 24MHz crystal for all three of its clocks because the
> T7 clock controller driver did not exist when these boards were added.
> 
> That leaves the real UART bus clock without a user, so the kernel
> turns it off when it disables unused clocks at the end of boot, and
> the board hangs.
> 
> Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
> instead of the dummy crystal clock.
> 
> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> Assisted-by: Claude:claude-fable-5
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> index cab2ee9ea0d3..ca7536f772ff 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
> @@ -33,7 +33,7 @@ xtal: xtal-clk {
>   };
>   
>   &uart_a {
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c41525a34b72..75d81ad6830d 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -266,6 +266,6 @@ &sd_emmc_c {
>   
>   &uart_a {
>   	status = "okay";
> -	clocks = <&xtal>, <&xtal>, <&xtal>;
> +	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
>   	clock-names = "xtal", "pclk", "baud";
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
