Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5633DE42B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660998; cv=none; b=ZpoNXr5V1XjXQKAbRoF3t+PuBI9l05uk6SZDiPFnbYIMsVaenrIkMreCWJAh5FAx3QDYrUGxrBsrle+MwHGYoHEXO4SfdpWxoyE91T8txjoD+62p94DiyAJgls60mz5DHxUxh8evT95O2SiJ3enDheAzOTIkoBP/rJQafWsQX3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660998; c=relaxed/simple;
	bh=NaTCLfR8sWe3pR+9s8OzVp+Mo05/w1eWEqxKYbzdY6c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X8Nkv6o8fji3afNv/WidM9ykEvT7e7TBQ8NgWQVa2M9FikVjqtxcOGwM9YPW3gvIHAATxJQ63w7BdpA/e211e6uJIbgFb7g7UiPgZaeTxIhWydDrWzeAOfQXwdKC//ygBrRuhP756lYznz1XilnGY2x8xzKtzigwjTsVYs7/NdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ye+rxpR8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ye+rxpR8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d75312379so4881126f8f.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778660992; x=1779265792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7BvI9blkmbUziA0Ny+qCXTqAehIoVPCQb4tVX7iVuo=;
        b=Ye+rxpR8/OMCp+NGyG+rPCoIS9fG/QsFHJwVO8XRZy4OFQSUpbLubo1jykfMpAFYwr
         GJ0Psz5k6vWNgUDJzJxoXoI/T8C7dFqBggbk9FEBikOwBwUQz/WWKjvLJR8m+ybsIXAN
         RUN7SR+jRQE1p3ZX0WjVfB4+Wt+jZx4CiRtczSCv5Z4JnhBYeh6XAbhiiffHlcxbJMzu
         bU4rJceSJkpzGuewSnLFi4tZgpjuZiCWenqZ88z/scKHmICskW4f849KBuf0OpW5cr+a
         bdulxNltcWyz0tuEshjTR5chgpZxD6XsDfj4tKa1PJ3nuiEh4sucX0/aLXY49c1HJrUq
         QDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660992; x=1779265792;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7BvI9blkmbUziA0Ny+qCXTqAehIoVPCQb4tVX7iVuo=;
        b=XeaV1C0fG6txAfnmWzapZcvX3WICg8q0O9ELp1j0fG08QzljuvUD32JDAsTtlJwpcu
         g+R5RBCbiz6nFhptdmO5CTGjvKI1vuYqyhK7dKdQPQiJ2BT3IfybgZd0autCATw3xNs1
         9myIK1cwYMQMo8sElRzZrIq2pXI/lw0dThRW2vlW3En9oYMuFydp9aK5JfyLkt7yMSLW
         EFZMAp2+zJjH8bWMpWxznYUkqbY6Zh6MnzWIXrWmoae1M3bU6q3O4wURmoSGsRv7iNSh
         FAS86Wy1/N2GuYHg9PgEkaBflehOAEZBMdLAi9Es8XjYxKrCBHm9qc6vpyLFRxc6QeRF
         +smw==
X-Forwarded-Encrypted: i=1; AFNElJ8eTUmyScVluB0/Vg8GOBk89faQd1qtNOfywg7JX3FkwBoxLbjGKCuIiIJU3D0wgaIEQE+n3Ke+3QsU@vger.kernel.org
X-Gm-Message-State: AOJu0YzmhAmZ7uExWcmRwjzQJp+TqgiN7V3oGUdl118zBW1L+B5+5njU
	Ocnhc+pu45D2LGFKZcOwK/L+vvGeL+pHT/Vh9YSy+4CdPDTjvcRfjmIp1A4z/4qVPlE=
X-Gm-Gg: Acq92OEXPTEqzJOuEQsjnQu68e/3A3C0jFIUj0BnjyCXeidEQNmrmk50YPRT8igZsTB
	cec8ZMJh+DjecWnlE4zWlStPS+pwsPZWiVdVPWwwg6yt18V80JNJ/JRup7SAqrhcaL7i/iSSh3J
	VMMfd6L4wWACrNNYZ7LqQjno+ps+d/IrVGhddGEJfbgYD3uc78wlWxazZw/sd2aiHIko42Xg+cM
	KPh4Xhx/Ujd8Z3mfphiYUoJ9Ba50kU6N1eM3eKe352baNdxM0BpjIomFQpdMwmo1EOypWbpacxP
	zeJ7GpN6jjucKCWmvlcn1Xq/JDHAFeSXCABXF7nIrIz3h13x/qZtHnm+MrpwYj2rsWFPri/F4u7
	1ywhFGh5z9MTrVWu/N85dyWsJjl3tNls4w0uJB+1B4iI4fxGsj9xgLVV+ugnZRYTd7bxA5BISpg
	zhfcqidqZp4yWZLwac6Rvh/r9pzqfTjXKU8HTB8z5dbaxVMcefhW2i5j9o3O1HNYM+529AbHS6i
	3Aa
X-Received: by 2002:a05:6000:2b0b:b0:43f:e571:184d with SMTP id ffacd0b85a97d-45ac3c6071amr7111931f8f.28.1778660991662;
        Wed, 13 May 2026 01:29:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45c7f27762csm3558455f8f.31.2026.05.13.01.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:29:51 -0700 (PDT)
Message-ID: <890de4b9-5481-44ab-adfd-0c58d9ae8239@linaro.org>
Date: Wed, 13 May 2026 10:29:50 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Khadas VIM4 PWM status LED support
To: linux-kernel-dev@aliel.fr, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
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
In-Reply-To: <20260512-add-kvim4-sysled-v1-0-7178719a43e7@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 19:47, Ronald Claveau via B4 Relay wrote:
> This series adds support for the PWM-driven status LED on the Khadas
> VIM4 board (Amlogic T7).
> 
> The VIM4 exposes a heartbeat LED wired to the PWM_AO_C output, routed
> through pin group pwm_ao_c_d. Before wiring it up in the board DTS,
> the SoC pinmux definitions had to be corrected: the original
> pwm_ao_c node was conflating two distinct pin groups (pwm_ao_c_d and
> pwm_ao_c_e) into a single ambiguous entry.
> 
> Patch 1 fixes the pwm_ao_c pinmux entries in the T7 DTSI by splitting
> them into two properly named nodes. Neither alternate is in use yet,
> so there is no functional impact on existing boards.
> 
> Patch 2 enables the pwm_ao_cd controller on the VIM4 and adds a
> pwm-leds node with a heartbeat trigger. The xtal-clk node is also
> moved to restore alphabetical ordering among root node children.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
> Ronald Claveau (2):
>        arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux definitions
>        arm64: dts: amlogic: t7: khadas-vim4: add PWM-driven status LED
> 
>   .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 30 +++++++++++++++++-----
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 12 +++++++--
>   2 files changed, 33 insertions(+), 9 deletions(-)
> ---
> base-commit: 31f32e8cdf59291e467250dfc57d1a8c718f63d2
> change-id: 20260512-add-kvim4-sysled-8cc159524561
> 
> Best regards,

Squashed patch 1 on ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")

Neil
