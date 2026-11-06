Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962544;
	b=2HEGlsecDp3tYtIRf40mbdC3PZw/vnEhXtA87sI129LSILJGCx0xgl6zONYzF2cOtElX
	 KdbjBdcu7U5A+trIbNqO+DpvVjLaMDoMU9jJ9LMfzGiswq3KRUmWkPciJjOBV652tASwC
	 rN/SPadOmEBNzdD0CcZ5AvEViOj0XnmOKU2ik7hgVtb27MZeIvOc0pb8Cfp6d+Nf0vcAK
	 jSqq/JBHSN6H9K5L0Bk7mPAcn0U8qmu6Y33/rOqx7eB6lyi8KiJPm84ZyBeopOtDVP8TL
	 nX5HdmdRRYEyvSM09t8JuUNdPQLQRMYrE0r/IdoJMi+nI64np7lZ63DgoXNNcCoj8Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:References:
	 Content-Language:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
	b=LUUXwRlGZULEnv+m+vpwRlpVNyVQHmkN9hAzP93yT7lsO6uZAA+YNWS0NuLkqYIUxLsO
	 0fjbN1A2GOhmR/OJ447DInjeqcXGSuiFxGVDP47Fm2y55YSZe2ZEAkh8LB/9K6FpPw87K
	 3UMTD2XVjuRoNldR3tKlw662kB0kzsBwL5uR7E7FLyhh4mkTgrODbXfbg9upMmmVZhsKE
	 Xs7lDOJ7a/QO+jx4BCS8tIOMm86Fj4IndBRcPIM95aFb9nZk3or3Inyk5r55+3wXiNtW8
	 VHGgYfFEmzdNdrSoI6YX5sRnfuoxPg5v1Hz5gMgSmKt2JtBQ2+96nUfkdbKshWZoxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TbLlTdxs;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7FB606A334
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7FB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TbLlTdxs
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so242043f8f.3
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962543; x=1794567343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=TbLlTdxsEPMevL+7udMCEgwmstd+dy32twU5RDz6uuzIbaPcR0eFmhC4R4lgr4SV0I
         PmH04+hkPGJib4QmQWFg4ZEte3/MJ/twMVKrs9d3KGMYCWe/ds+lM/Hr8eUoq0U1Qx3a
         UDerKkYAhk19DeiL4YcxUbn9K4Rd9ZB4LjMWX7UTh2ie/+LsSxgfUr50xCjdm/RcCJbg
         /lMXQOb+MGgglurHVpj/WFbpYmUOTkrq5Fnun/tAqpCGLCDJ6gZSy51magnsJXAIB4YC
         s3CqGSJhQa7uff7ixh7kyaYDwkfgBKg+IQV6yxjE8OpKJM+zbp+Xn/niuBT68UmK0L1Y
         NfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962543; x=1794567343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=DCmlZg9h/q4NsUx4gIXF/9q9eE0LUDcd5cu/kWvmSwZsOO39iXtCtF/GOSZ8H3bD0c
         6L44qfY6hrVwlnlcfvvUsGD4aSpEob016BER9VPCQKKYweyITNJdL+jfs5Gro4IUPkvd
         x0FTFVtttZH6nvFk5U5+UQT1OiGaA1G05kEJUW9XUxit7X4WTWk7agOZ77qmU35zjjQ+
         HGPQCFxcVXF6DMD6VAL0m77o7moJgksTNBL/VthBaFspDUMwQ3DsIxEt8eRCt+2vTO01
         PtolKbwI3GnKeCYfjM8QEf9T1E52z1ZQd36Ob+zNOmJ0hU9/LhlVCCROnovRZiHqyFLV
         6mgw==
X-Gm-Message-State: APuU4Z/EE77KH4djCghpeG8YdUVy2eVIMhnmNgNTtXgIow246hErIWk4
	Sak8CD3TAMVRSMAfPcppchrsLz+knrC77TH+I1T8Zq+uMkra4TltuLEo7zBu5detDXQ=
X-Gm-Gg: AYBFou0ERilKcHZilWlapDh+D3BQXbGYxPEfVyIxdFJ1G4fJ18/3C8IH2hP4WS9SgVk
	NT6GrdSFG9QSyLVKGH5DwJagU9pKK1DBqylmq4j0/Vkb/gvp6GIf/6A7lr3eCdo0ewY4RhQ2V9G
	cIsaZsyvkezL7+SiOGpdWrLKNu7UuBAcrzpJ1FuNACphDfREi3ZBQNnOSoZ0lIS976ZbNl6BHa8
	P1wEYHa6+PwFVHn9bkLAWAFWpwgxiujyim3Xr4XoSV5+0hdlOSf1/jUlXLCRHYwRkI9FeW3JG3E
	V0sMRwxr0CRH1iLFV9zC9jRoNOTfSp/eNGlNFy9PTe4LYaRQWYjQ4TqHoY6nZ7h7grG2xnV0bDG
	o6B38kDXc0FKOLEzeCErTB97W3Y99IB5TKku1tojtNTdFqd7DSjH+ypcTxQ4puzkIQtMHCju3cS
	pedjdTA8jGI9DNQlkwg0PYHLUaLoEPmXULRk+wCGb/Qus2VPxReOy4RO/lSjrqKOV0O+BwU6fOs
	HWGHRqlDkZ+rfD7G4vpHQ39/PQY9yss/RKLIvSJZzvoqgWMtSFSa0OwBfyo4tE5XiPknDkr9Agg
	o8fNe9+wCnYa+lWJfwsSBM8mZKyqaBDI2KbM/2rPuIZb1K599oB1ecXvzGa5t/I1If7H4ITLY3z
	oGf18vdY1Khwgu8rdd9GsXBkHczvoqw==
X-Received: by 2002:a05:6000:4312:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-492784552d7mr4914008f8f.53.1793962542588;
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm3100072f8f.20.2026.11.06.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Message-ID: <3018aa97-ba40-498b-8292-122476fbd3a5@linaro.org>
Date: Fri, 6 Nov 2026 11:55:41 +0100
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
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/26 11:46, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> Add the AO_CEC_A controller and its pin group.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 155997649dc3..dd51e786d29d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -747,6 +747,14 @@ mux {
>   					};
>   				};
>   
> +				ao_cec_a_pins: ao-cec-a {
> +					mux {
> +						groups = "ao_cec_a";
> +						function = "ao_cec_a";
> +						bias-disable;
> +					};
> +				};
> +
>   			};
>   
>   			gpio_intc: interrupt-controller@4080 {
> @@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
>   				amlogic,has-chip-id;
>   			};
>   
> +			cec_a: cec@44000 {
> +				compatible = "amlogic,meson-gx-ao-cec";
> +				reg = <0x0 0x44000 0x0 0x14>;
> +				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
> +				clocks = <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
> +				clock-names = "core";
> +				assigned-clocks = <&clkc_periphs CLKID_CECA_32K_DIV>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
> +						  <&clkc_periphs CLKID_CECA_32K_SEL>;
> +				assigned-clock-parents = <0>,
> +							 <&clkc_periphs CLKID_CECA_32K_DIV>,
> +							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
> +				assigned-clock-rates = <32768>, <0>, <0>;
> +				status = "disabled";
> +			};
> +
>   			ir: ir@84040 {
>   				compatible = "amlogic,meson-s4-ir";
>   				reg = <0x0 0x84040 0x0 0x30>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
