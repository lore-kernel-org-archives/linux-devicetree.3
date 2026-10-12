Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB8E44A3FF
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797164; cv=none; b=eOReZe5UeFE5aZiEQjYvXgPedaw0JcK8U2+q5Czh242FzHO0plMaQ9+xMO5hCmr/OQd8Z//LcQCyn/4uAk5De50EnQ4TDREnncunatD5l/YGUiL+yxJ66FGzsCTXipx75tee7eM+J6iGHqJke4IRSLdX7r0XTCsdn97KR2ataHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797164; c=relaxed/simple;
	bh=wIo0/c7IRe3Ts5XyPas26K04sTrkN5tIqRH6aK/PMjw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VHJZmOzwp9YwkAm77Co+gN6HIQAwt/hbfr6d7480fW6j2NSDzAbP/rSxalrsKVo9ZJ/9kzZY8KeWlDpvZeZfDFs/1MNUcmhdpubRdzP46z1gglJBmj4KPVkJZpAdc2pYs4RyN4WfbaxJMiWvIMirKs84Eg8zURLHsEI2KGvCpvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s8kqKxVe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s8kqKxVe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so15115675e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797161; x=1792401961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk95jI3lhRqF+q2Y0sX+t13akZvJa78d7yUGx/ACAu4=;
        b=s8kqKxVedozSXDPeRENYMMQcfiev1+AkX1MVhEt+KgIjDyin/CNPjG262sxY7Bexcn
         zpJsNghsFVebahdHRaw7AKi/hPDbJdaiMcPNkvIMukZIxCpgij05PvXAhPFAniyGXn3r
         3bEL9Yyvv1BNqxjP6zeVALppbuERSqjcvTCOPuQ56L7iwee8OYR7GTJ72tNpw4aBsPse
         JTbaVMfOceALb2tmeh2DDG8eT67bYifznG6lWvBZ2T517C5fPYcaDV3ogdrSaXKvVlAl
         A2j+iIrqY9SEfxHopYmg5VZW9kOGIguh5HzOnabnpe5M484sq5PaC20cX2UQWxz55kH0
         cZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797161; x=1792401961;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk95jI3lhRqF+q2Y0sX+t13akZvJa78d7yUGx/ACAu4=;
        b=E9IDObYuSZPpiE6pkmywnMo8CijF4axK9+nmgbPVsGJUxd8CVO68/aLI5hWQnBZmf2
         2fi8QG1JLHsy5EAMMdFr5quDCElmOl9opngt1c76eH9CjJ/bqwPd14gOZae1zrTNWYi1
         Cqtv8dJch/8ZhPa3Z+I4a/GKLqYlSmln6zAZHFrtuMq5L/Z21hvwNB+qzV6lxPq92nCg
         suk/8bZ4zTE+BGWjD6T2uNj1lywnLl0tz51H9etZXe2TxD9rEmPk4lCk7/n69lQmnAeT
         dESwPU5lK69sM7jJKRptCmlS9XmVmch1ZtPBoJKjivcGjqygydOtTZ2j9VYoGUv0HIZd
         bAWQ==
X-Gm-Message-State: AFq9FYJx4MZBQdYQvMYT/8greY3yyda5rEJu1dCaXmpZizDc5h7vBzZ5
	Z21AWNsSqJrIQnIYZM49r+cV7EK9i6EADkKAGJGABjPim9jwkvj65vwj1B9a+4QLebA=
X-Gm-Gg: AYBFou1jW0aM9DBe/yRP5lXdrnDXI4PdJB93uOZK7Wjww/fwFDoTrCj0d9nqXZuhcBR
	2UzHfxSLsDdUx0nQ+xVmvSRANYw8OXCNlxnp9PzMWwG08YnWgycVTxqW98QUXwiRAGMU56NxRiI
	FM4jDIOXUga78m4/1ldgwocxcrPBmSITCB+59SusO94uI9VSpE/alKBP6t7lZ7zp8tYIgdJlF7k
	W0A3f+cVPRIK2FiR96zYZlXrpPU8ZLLBIDTLo7W3grKkwsFx2LpaOd4OTPc3HCpx+lWH9OZ4ej6
	cPRXoyrOqgavcCPTYQhvBMtSIGdqddMsryCYa8ln4axyvQJJZ7CjXytxd1o7rnak6xb0KIL7Fbm
	YZj/D7CNel8gfr6LsJlSw4mcEcM4EuiP+rJjZb/bXEbh3XRAWj2vfVSB/oQW26xWq36V4NJ2wx5
	XLYrGz6BpBFA+q3Y4nyLlvRR88OonmbwdlwkyqRs2kC8VUKxJPf2CdKXi9AIVGl/jBw++x1I5jw
	TVcGjtLoSwIhJOIQ1L40SQYiwv3X3ELaIsKBWDnxcp6RRkTNRY=
X-Received: by 2002:a05:600c:8b28:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a18e499da4mr171146595e9.22.1791797160966;
        Mon, 12 Oct 2026 02:26:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm16729294f8f.41.2026.10.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:26:00 -0700 (PDT)
Message-ID: <1a940a0c-0a90-4b8d-831f-300c2cf02ae0@linaro.org>
Date: Mon, 12 Oct 2026 11:25:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
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
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 20:31, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> The vendor programs a unique factory MAC address into the SoC eFuse at
> offset 0x34, where meson-gx.dtsi already describes the eth_mac nvmem
> cell.  Reference the cell from the Ethernet controller so the kernel
> picks up the factory address itself instead of depending on the
> bootloader to populate local-mac-address, or falling back to a random
> one when it does not.
> 
> The cell is 16 bytes long in meson-gx.dtsi, while
> of_get_mac_address_nvmem() only accepts a cell of exactly ETH_ALEN
> bytes, so narrow it to the 6 bytes of the address for this board.
> 
> Tested on an ODROID-C2 with the bootloader's MAC fixup out of the way
> (ethernet0 alias removed from the DTB): with the 16-byte cell the
> driver falls back to a random address, with the 6-byte cell eth0 comes
> up with the factory address from the eFuse.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 5943bc810..3b74528ef 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -223,6 +223,10 @@ &cec_AO {
>   	hdmi-phandle = <&hdmi_tx>;
>   };
>   
> +&eth_mac {
> +	reg = <0x34 0x6>;
> +};
> +
>   &ethmac {
>   	status = "okay";
>   	pinctrl-0 = <&eth_rgmii_pins>;
> @@ -230,6 +234,9 @@ &ethmac {
>   	phy-handle = <&eth_phy0>;
>   	phy-mode = "rgmii";
>   
> +	nvmem-cells = <&eth_mac>;
> +	nvmem-cell-names = "mac-address";
> +
>   	amlogic,tx-delay-ns = <2>;
>   
>   	mdio {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
