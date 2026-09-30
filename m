Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A44F7CDA
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774578; cv=none; b=Oupt2RtBD8KUizfVZENdcpXZ7SVEqCoeUhZPjAJxrYXucv6ELrhlPMXK1sM0rogVPEa8TrQl5w+b3R7l75mFeJqC4eP2pU3a01yaJY85lCpsxZvoxp5fUvms6pzihXy14qDFj3GdIhseZXa3JO+RLqEZJtd8lgs5cwBmBxt/OZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774578; c=relaxed/simple;
	bh=LM1MsI49T0fvEyd/N6oOjGXSHve509yPeVpgLIoMUnI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SnjY8qltty6+hSkZTRf2XkujzA9Kw78n/72YaxW2PV7bO4/TNtciKzZkCAi4HAx/Pv1HlxIXk8RxCX7Z8AaWMTKg34EJz3lypHKYgHHHCQ5UALyfCK46VkX7JjJNY+18NSYhnTxIcONLWcN5BzkWNAtmioIeEWf+gAEmqN3483k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FkDNPehq; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FkDNPehq"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93c56f7c1c8so528940585a.3
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 06:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790774563; x=1791379363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=FkDNPehqcrcRvMwbctSV9gEOGXE9an1HdrX4HjSW+FPaE4hF8HuKcAZi/YJBpv+jw5
         vY5AW/t9TIPWGgrEwqrKA2e1q1ljyRAuaw09e0oTaZvopzERl0Gisbx0+afJcns6+LmF
         N04bJQZkRUD0oS3JPS4eYDMCamr2qHCBGJs9azNzmnbM8N7VYPVWVivfyU4bPv7g0UEw
         uEJr2Un7/GUCOSS7Fw6RLEU4yCc8CWQRU2+1iWxbDTsam/7rs7KkaSzyoBzSgh58glbO
         uY069W+naJWgpeIf4gs+2Ta6B3H4mbh0uMQTChIURpQT/A3IaPNVSlD/E7gPWFkZmjkE
         d0kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774563; x=1791379363;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjNzOSbZhH3UC1XcZKT+Hgp+Sdib45z8YSE/jOVoT0c=;
        b=gy2EuwBDZQxMiYuAptcuSKvOEL031sUXn1Jmlqe6AVn/Y/sVQNz5H3KkrEzExiVSvd
         k39qv2EdEOL1Kqt6qO+cP0AoK8kNV+7BCAlB1p9PnpekowHlfwghwHuRjnZnTeXsMnio
         hYXjBgBACwbuttJJYDPzIzJiIriNRa7SqUymB1C7M+cB0WgzpPoFRG0UZnVVzjNl+wYY
         ynFWl/uy4ey/udnqdvbAkml1eOwiS1TGBXqLGSLDHz0gnBWyz8pVARKmJ0WkWL40I9hE
         PUy0vhQysr7N2vsTUj/stMcywUNekjnogoKkyJlGP1ur+roYZAhQv63JkVLPmzArn/TM
         6LUg==
X-Gm-Message-State: AFuF++mZhlc/SMlSZ+BsnorlaJ+g/JZNwExq6YbqBhv24/QZjdl0qZ3O
	+7GnxTP63KpOu8fqkvrgz60Kh/PyQso/K85xpw6wwhHzJdKspinHYc3BzUiywbkeOgU=
X-Gm-Gg: AYBFou150A+VKiunYzLV82qAhLoG/xNNF0C8vDtiBlYi0Z9p1WeR/ICzPs3/GuN90XB
	UJgtZN1HsfioTs1dzBzltwRr0fewvKunhNK17gk2h59I+f5te1nsmVyO6vmFzr3ofM8GFMnc79L
	7ASlG7fZ+/rMUYERalzmwjqOJndtfjkPGz4Y/udtvdQgfZalggGnUzRIQ+u4gNWZ3KPQ/gmvysZ
	n2nXcAz+jrSS+pLACUPNNq2wR81EXgTsGlivxo+tQr4QV8SakI5ZdiPA9fBIeceBIJrZE+dSOH/
	UaMw2xg4orqRYTbd63P5WW7Y+t+N0sWD/HsPh83V3Wo4HVBAU3OPMDwgPvxZCpm+P3ip/ygbGHl
	6HY3JE6573urJ/5ftIqQgS2wwiS8imCjIpG4umu74zrPb6mpXAKUtAoh1YndAS+A4JvAX1/2vhb
	vyR7mo+af7SFjVI70FoGKuUpbFJTQyJfDXAnrzPcrXt7aC3jW5+9CiKyAMa4OE5H95EffyekIJS
	JLLufXQ80TjRuvt1opqUY/TSMXMZcNQy6nu/n+pHCBLleFP9TSTPn/SfU5jX90nvyl7erydIZNZ
	UTi10O4=
X-Received: by 2002:a05:620a:2717:b0:939:97bc:5645 with SMTP id af79cd13be357-93ca96b53e8mr222317685a.31.1790774562686;
        Wed, 30 Sep 2026 06:22:42 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ca82a87f4sm114784985a.20.2026.09.30.06.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:22:41 -0700 (PDT)
Message-ID: <a51f9814-fe65-4a2c-92df-cbc3f00036fc@linaro.org>
Date: Wed, 30 Sep 2026 15:22:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
To: chuan.liu@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
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
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/26 12:25, Chuan Liu via B4 Relay wrote:
> This patch series adds clk-measure support for the Amlogic A5, A4, S7,
> S7D, S6 and A9 SoCs, listed in the order of their release.
> 
> The clock names for the clk-measure channels are kept consistent with
> those used by the clock driver as much as possible, making it easier to
> identify the relationship between the clk-measure channels and the
> corresponding clocks in the clock driver.
> 
> This patchset also includes an additional patch to optimize memory usage:
>    - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
> 
> To avoid requiring everyone to spend additional effort on a separate
> patchset, I have included it in this series. Please feel free to point
> out if this is not appropriate for this series.
> 
> To improve maintainability, this patchset also includes a patch to reorder
> the dt-binding and the compatible entries in the driver.
> 
> To minimize unrelated changes, the existing clk-measure channel tables in
> the driver are left in their original order. The tables for the newly
> supported SoCs are ordered alphabetically.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Changes in v2:
> - Reorder the dt-binding and the compatible entries in the driver
>    alphabetically.
> - Order the clk-measure channel tables for the newly supported SoCs
>    alphabetically.
> - Add the const qualifier to the A9 clk-measure channel table.
> - Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
>    channel table.
> - Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com
> 
> ---
> Chuan Liu (12):
>        dt-bindings: soc: amlogic: Reordering compatible of clk-measure
>        dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
>        soc: amlogic: clk-measure: Support more measurement channels
>        soc: amlogic: clk-measure: Align compatible entries with DT bindings
>        soc: amlogic: clk-measure: Add support for more SoCs
>        soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
>        arm64: dts: amlogic: a5: Add clk-measure controller node
>        arm64: dts: amlogic: a4: Add clk-measure controller node
>        arm64: dts: amlogic: s7: Add clk-measure controller node
>        arm64: dts: amlogic: s7d: Add clk-measure controller node
>        arm64: dts: amlogic: s6: Add clk-measure controller node
>        arm64: dts: amlogic: a9: Add clk-measure controller node
> 
>   .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
>   arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
>   drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
>   8 files changed, 953 insertions(+), 20 deletions(-)
> ---
> base-commit: a2530c83c458a503e55219966217dfd1c36a385e
> change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68
> 
> Best regards,

For the whole serie:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
