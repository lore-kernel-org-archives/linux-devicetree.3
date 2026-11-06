Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962507;
	b=z6J/4Dadyt0nLy5a612dQw5COCB9H9g6DcMcCmdadBdKnww3nlQkJA6MAAeWe6x4m+wR
	 9/OISftTDu9381Uuw0tyvXFMQTTSmIMgDiv6r+UqzWauU5WruIjYnArR4vWViK0ethnha
	 SLZdiaj52fGAxE7jbu7srM2BBUaFVKyoIwjUupnCanEWQLONiAd/+j+maxO8GxK6P2/Qc
	 D1a59td3P66QFo9fzcjpqy8oIDWRu5fON7HXLoNR04DPWJe7J2fxPCi/AkaVOywTQoJMS
	 YQpa4JH+N2H+49QfUib5uCxbitIgUB91l5A4ulgeO6Sp/NCvJWJ0tCsJKdbAwkavI8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
	b=zAbwGOlG8ITFu3JT9J/0zyxOLG/sHipuIgft/OrBIOQTviQ38ndv47u4hte8eFhhULBr
	 t6OEvKg3WL4CKB1BGnm5iJSbEsX7f6uMo72BJoCJGti+ffGravlyUZ3TE9GEl+a0Kebus
	 Vw7ePFj2rXGtd5pPwnJR63S4JsBLdb7nHMfbN2Z4Xx1Ehrq8ApPHEKnMlLeC8cr3kjDkA
	 USm7w28+5evOm84LZIULoeVxs8liCP1AX8f6fOpVh1tZB4CX/Z2xwjyRkO8g938YDDCic
	 QjuglXo0QVGIlh0WhCV9jQZ978TExtzR9MZlMJ9VjFLN0JYaf6BtPOazrkx3TxPa7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcHB8DZr;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF9606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CF9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LcHB8DZr
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4773715e9.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962505; x=1794567305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=LcHB8DZrTKuLroG52e10jCH0CbTBPyHDfxnH2EuAjr3gEoMxb/58aOIkAsKSxIZl7O
         rhLhUWHSNpQpOnFJiIsCOuf6GShcSqHqeu7f9y8pllbkle7J1YWAEeQJNYEFyrhIppAB
         8Y1YVwlA3k4SITQr4JCFv8aTmISFc9CiTzSup+p8TyUkFNkfkCVvvsb3Nlh115BFM633
         4Szm61MMnAP3HpwKtvIlY3SYQbg++1yUf1zBdVzSEghyoHyjGNuKOiudXPW2fBu0wWQ4
         RVvkAiOjXan7MSaszIIJwEXtSVz03leWtn2eiSIZYCPgunSUDTzT998yDB6JdCXUSSYl
         pbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962505; x=1794567305;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=296xUxU8tn6mPRnshqQK79RjtnZgHDOcCRgt0Ddd2s8=;
        b=eiGWHklgE7jEJJnzJSR3bcA4l0zDHtPOHmD4gsIpIwH1srNdxoPqPGhDjfpIGQ3Rdo
         g20CZFIbDW32GIaE/txYBagMWgZhd40FA3gBsrwhET0c3GqTWE9ukgSRd7lwSsbvjusO
         Ze7/71x0HLWNXZ40iXWpnVpYZc1V0OLG/ZfgS6vZtSyp+IvjMSEQDLCUtoPQ+uMYp5a2
         5YMEpm9ncuFcgxXTN/D5UrHA8ZoQzpguPNUCMIg864uoG/z5OM1YMPk0OF2qf/2PQ5f0
         0F40Eq9F16a4UjOcLuermUb90RV3tP7ABjSyIrdYHvgz88WduuorSLTC37QHtoIpPYOz
         Qtuw==
X-Gm-Message-State: APuU4Z+LYcjUi6k5ss8vMZkC3yPXojG4REjLXVDpOxrfnu3aA1mUxaja
	TR0JG0J0ic1TAs2Q3CQaAIGsJmc4JpUI6lqtVDOlEe2kiiB/tmyXTsAPQfigKgnXQk0=
X-Gm-Gg: AYBFou1JefybTjzQEidbCYbbvk6TEl7Hms5LBLjm7OeFQjJzio4cAMnl5ZZ+scoWWGG
	/0VshH+HQyK7P3qwAsUlzOaddhEqjkmUprtTpai4G7XIsA+tlqz+fzjPm3YZcayBKEOYmlc8y9n
	GPp0ZwvcNlxPWV5Pg3YoeM+sTr1cXGCQH5rGVbI3YX/uXirPnKpk9QjHGA4mTzlnoMtOnYmzqwn
	VqV5xeuDKFMchRAUpbvFkTzT8cFm2GoyKR4174uJwNpD8WNqMfSjBituKSjqZWOS5GUDOaPRJby
	0K3tFiysDfHf/crovye2eXpL/lKm4buGhDMY/lSi+UL30mYZwcEs7snMJnbdzYr3sdpMpj3V6uW
	eixY4IlT/o5DE1tTUGob06Z37LDR/NIn61absPQ6kxqrhi+q3GDUJzW4XMKnTJ2yyVFzhLZkb9d
	tSroOLGJYLDDQJ6ysYXVwFm+KIjNNaadolQc2bXSkNwwFDhNEqp012wcQTp8+9K+myOG4Ik2ea0
	FmLFVDl0PJaba4450y2IslipIKqb6Wk8FWyNSkz3nIQs9h+3wwiyR6Dkxhh4g/KYMf8dj/dcx86
	Yq3WjOR8UXTOaKu8W9ENAvf/F259nUMR3kIGbY4bpmx35DggYx2wFoqsIfr7LqYMfo1SXSGYyRk
	mDhnkXP8=
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr33245395e9.11.1793962505296;
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm46157125e9.2.2026.11.06.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <d089bf43-5037-4ed6-93a5-c067ad1483b1@linaro.org>
Date: Fri, 6 Nov 2026 11:55:04 +0100
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
Subject: Re: [PATCH 08/10] arm64: dts: amlogic: meson-s4: add the USB host
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-9-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Add the two USB2 PHYs and the USB glue with its xHCI host controller.
> The S4 has no USB3 PHY, so the host runs USB2 only.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 45 +++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 8bbd70e52a29..155997649dc3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -770,6 +770,26 @@ cpu_temp: temperature-sensor@20000 {
>   				amlogic,secure-monitor = <&sm 1>;
>   			};
>   
> +			usb2_phy0: phy@3c000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3c000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY20>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
> +			usb2_phy1: phy@3e000 {
> +				compatible = "amlogic,s4-usb2-phy";
> +				reg = <0x0 0x3e000 0x0 0x2000>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +				resets = <&reset RESET_USBPHY21>;
> +				reset-names = "phy";
> +				#phy-cells = <0>;
> +			};
> +
>   			eth_phy: mdio-multiplexer@28000 {
>   				compatible = "amlogic,g12a-mdio-mux";
>   				reg = <0x0 0x28000 0x0 0xa4>;
> @@ -988,6 +1008,31 @@ mdio0: mdio {
>   			};
>   		};
>   
> +		usb: usb@fe03a000 {
> +			compatible = "amlogic,meson-s4-usb-ctrl",
> +				     "amlogic,meson-g12a-usb-ctrl";
> +			reg = <0x0 0xfe03a000 0x0 0xa0>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			clocks = <&clkc_periphs CLKID_USB>;
> +			resets = <&reset RESET_USBCTRL>;
> +			power-domains = <&pwrc PWRC_S4_USB_COMB_ID>;
> +			dr_mode = "host";
> +			phys = <&usb2_phy0>, <&usb2_phy1>;
> +			phy-names = "usb2-phy0", "usb2-phy1";
> +			status = "disabled";
> +
> +			crg_xhci: usb@fde00000 {
> +				compatible = "generic-xhci";
> +				reg = <0x0 0xfde00000 0x0 0x100000>;
> +				interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc_periphs CLKID_USB1_TO_DDR>;
> +				status = "okay";

Drop status

> +			};
> +		};
> +
>   		uart_a: serial@fe078000 {
>   			compatible = "amlogic,meson-s4-uart",
>   				     "amlogic,meson-ao-uart";

With that:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
