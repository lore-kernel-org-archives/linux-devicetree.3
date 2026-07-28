Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8840A943
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227695; cv=none; b=hr3xwDCk3FHrjzd4sccUxNcKj/3nQILZtV84tWIXiE6nV/ZaHk+LQ0PATQwxe8aVFOfGUzasDmyWEpcfy1XHnb3V33kQ1o1FEtMbov8TBdpcg6UVgku+TkL7iBF/gQkw1HhIu5vWwrZ1W00WNiNQ5X8oeZnu/jBg62Gb908c8SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227695; c=relaxed/simple;
	bh=YaqLHZ+bGjHhdZjvbQNgnxP5oZsyYbbCKX2+YYhgC7I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J/I0ppFt8KMU+LxxXctRLRalIY7bUMRJkQTOXXd7OCnzaRvpmcfNMURr4Ee8F3k17ze98C0DCmayJFTDbMEe2wSN4atcaaLvf74rX0qDY8pqd4r8GzRId9osSt5gfbvQRImS/RdsjMDDwwZrgTcOF80RF8E76X0VpKjMbhkwoDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jR822Dx6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jR822Dx6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495635a85d2so29435305e9.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227688; x=1785832488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZnqPhGOn3Vzybpvja/5hfqkybxvBtnzPFBr9hYn61Q=;
        b=jR822Dx6C3cwd04v3naWj6nCK1VGmpKETWW/J21AOGpuhOGtr0oTOjNDe0Z3wGMDYc
         wiliQO/FHgHDaLTxj176T4dionwlhVKSNFg3Z1eJZzwweUCgK7lilKjrjkjGccI2i2+4
         ieTlwd+fjEucydonJCXI/XlieOa3sFZQ4PKzu+vJSuJPNm0ftV+F2t1uVr/NEPlA7Dph
         fC0DfDiz96wAsOdrmpbMfjEeODuDvGjD3+Z1UfBezvgSeW0js5dPFzO8Alu9ZOGP5w5c
         8qXmb/77ez8PjuPSo30iQV860/ORyerQAmqSt42pwE+/rbVk9NhUjd9l8ONYQ/AZjtok
         nepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227688; x=1785832488;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZnqPhGOn3Vzybpvja/5hfqkybxvBtnzPFBr9hYn61Q=;
        b=dN2O+cIhlA3v7xzHwuADNe9yDZOqmDTz0rSxtu2Chw9a4SqC8knbzcgnZdyI7iYkmG
         pFLbKemUzYfD3rasgpINH0oTyssTAClKRPqbquJD4sP5af9VK6L5eABAFFnzhtcBWCjS
         HW1EqjdpXOO8dVsTugjKiP7ZduW9AUjWj5ZEIZY6DB4lviO3tYYxqiKsDc4TptDH6WYb
         EAm6K8lTE4xZmo2GWA88Te9xeqqRTA1+3fFPeWbGD2H88b2chEZ+pu/lGmxFQEtQ2N2G
         aKxiV4/oTnwaDm53IwcpqZhfGya8FX8CNpMA1Ku4OD5pADq4kAImsWygsxhoYAri021M
         haRA==
X-Gm-Message-State: AOJu0YwwPZBVAtkhi++NLIcyMNCCvH+UoOZHtZLBfO5Hz0obRhVFbMPE
	/jgJVCYoiQdF+oTHtpeCwEb9zRTLU2zMmVP4w71pv0gK5rmlbmlEos9x10RZFbjziok=
X-Gm-Gg: AR+sD12UFPLYdgmLolqbPUm/5COvopyjVIY9lHUAoLRt9m9P5Biq4n1S8tcm+MourKm
	NundkSQuje+BUo0wK+FW2JZk1JXt/VCV7FlKCcI/g56jO8zCCBMWTOyAVQsx5AvB3HcjID3Esze
	Gf/ouAPG+CT3Vz3J0ikwW1n7KVwkJSgFdNLTGle3uFvFcLhDfImZXhqEDUpwaSXlBLdObog4cro
	8Q2Eq3koEyDSso7Xfn+eBM2QX57ytCdnfzaNeHdouep9K/HFMmNa8HXT01NU/u7bHyqWiP6BQ2m
	/Bn0n7tnWDjd7pDtoupUqRrrMjO9mw5ChLnQxwN7CqkFwnEQ8mGxSA8c1yuZB19bpJ4nfpKYd/4
	vec1tYOBEH3siP6gWgjQhLINw3fzn6bdWUo1SYHtG5i96x1USvVTYwtpkXjc6dvK7r4Zydis0AO
	zfbi9CfpJfN+hAaxdsTFeMBdSYlbhgmY5OTMLb5YreQ5qPxqZ7dw07pdkt3+6RufwZ0+yu
X-Received: by 2002:a05:600c:3512:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-496c6568ffdmr13771205e9.19.1785227688277;
        Tue, 28 Jul 2026 01:34:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfb20ddsm254637715e9.3.2026.07.28.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:47 -0700 (PDT)
Message-ID: <822ff7be-7d89-4523-99c6-051fcda9efaf@linaro.org>
Date: Tue, 28 Jul 2026 10:34:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] pmdomain: amlogic: Add support for A9 power domains
 controller
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
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
In-Reply-To: <20260722-a9-pm-v1-2-1fe20a44bf2d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/22/26 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add support for the A9 power controller, whose registers are
> in the secure domain and should be accessed via SMC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 69 ++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index 1d2f371d2d7f..133549956efa 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -16,6 +16,7 @@
>   #include <dt-bindings/power/amlogic,t7-pwrc.h>
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
> +#include <dt-bindings/power/amlogic,a9-pwrc.h>
>   #include <dt-bindings/power/amlogic,s6-pwrc.h>
>   #include <dt-bindings/power/amlogic,s7-pwrc.h>
>   #include <dt-bindings/power/amlogic,s7d-pwrc.h>
> @@ -175,6 +176,65 @@ static const struct meson_secure_pwrc_domain_desc a5_pwrc_domains[] = {
>   	SEC_PD(A5_DSPA,		0),
>   };
>   
> +static const struct meson_secure_pwrc_domain_desc a9_pwrc_domains[] = {
> +	SEC_PD(A9_DSPA,		0),
> +	SEC_PD(A9_U3HSG_U3,	0),
> +	SEC_PD(A9_DP,		0),
> +	SEC_PD(A9_DOS_HCODEC,	0),
> +	SEC_PD(A9_TAHOE,	0),
> +	SEC_PD(A9_DOS_HEVC,	0),
> +	SEC_PD(A9_U2H,		0),
> +	SEC_PD(A9_U3DRD_B,	0),
> +	SEC_PD(A9_VPU_HDMI,	0),
> +	SEC_PD(A9_U2DRD,	0),
> +	SEC_PD(A9_U3DRD_A,	0),
> +	SEC_PD(A9_SD_EMMC_C,	0),
> +	SEC_PD(A9_GE2D,		0),
> +	SEC_PD(A9_AMFC,		0),
> +	SEC_PD(A9_EDPTX,	0),
> +	SEC_PD(A9_OPP,		0),
> +	SEC_PD(A9_VICP,		0),
> +	SEC_PD(A9_SD_EMMC_A,	0),
> +	SEC_PD(A9_SD_EMMC_B,	0),
> +	SEC_PD(A9_ETH,		0),
> +	SEC_PD(A9_PCIE_A,	0),
> +	SEC_PD(A9_PCIE_B,	0),
> +	SEC_PD(A9_NNA_4T,	0),
> +	SEC_PD(A9_HDMIRX,	0),
> +	SEC_PD(A9_CVE,		0),
> +	SEC_PD(A9_ISP,		0),
> +	SEC_PD(A9_ETH_1G,	0),
> +	SEC_PD(A9_U3HSG_HSG,	0),
> +	SEC_PD(A9_U3DPPHY_U3,	0),
> +	SEC_PD(A9_U3DPPHY_DP,	0),
> +	SEC_PD(A9_PCIE3PHY,	0),
> +	SEC_PD(A9_U3HSG_PCIE2,	0),
> +	SEC_PD(A9_MALI_TOP,	0),
> +	SEC_PD(A9_AO_SED,	0),
> +	SEC_PD(A9_AO_IR,	0),
> +	/* UART_B is for console log, and should be always on */
> +	SEC_PD(A9_AO_UART_B,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AO_UART_C,	0),
> +	SEC_PD(A9_AO_UART_D,	0),
> +	SEC_PD(A9_AO_SPISG,	0),
> +	SEC_PD(A9_AO_UART_E,	0),
> +	SEC_PD(A9_AO_CEC,	0),
> +	/* SRAMA is used as ATF runtime memory, and should be always on */
> +	SEC_PD(A9_EE_SRAMA,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AUDIO,	0),
> +	/* DMC0 is for DDR PHY ana/dig and DMC, and should be always on */
> +	SEC_PD(A9_DMC0,		GENPD_FLAG_ALWAYS_ON),
> +	/*GIC needs to be used consistently, and should be always on */
> +	SEC_PD(A9_GIC,		GENPD_FLAG_ALWAYS_ON),
> +	/* DDRPHY is for DDR Work, and should be always on */
> +	SEC_PD(A9_DDRPHY,	GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(A9_AUCPU,	0),
> +	SEC_PD(A9_DSI0,		0),
> +	SEC_PD(A9_DSI1,		0),
> +	SEC_PD(A9_CAN0,		0),
> +	SEC_PD(A9_CAN1,		0),
> +};
> +
>   static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_NNA,		0),
>   	SEC_PD(C3_AUDIO,	0),
> @@ -425,6 +485,11 @@ static const struct meson_secure_pwrc_domain_data amlogic_secure_a5_pwrc_data =
>   	.count = ARRAY_SIZE(a5_pwrc_domains),
>   };
>   
> +static const struct meson_secure_pwrc_domain_data amlogic_secure_a9_pwrc_data = {
> +	.domains = a9_pwrc_domains,
> +	.count = ARRAY_SIZE(a9_pwrc_domains),
> +};
> +
>   static const struct meson_secure_pwrc_domain_data amlogic_secure_c3_pwrc_data = {
>   	.domains = c3_pwrc_domains,
>   	.count = ARRAY_SIZE(c3_pwrc_domains),
> @@ -468,6 +533,10 @@ static const struct of_device_id meson_secure_pwrc_match_table[] = {
>   		.compatible = "amlogic,a5-pwrc",
>   		.data = &amlogic_secure_a5_pwrc_data,
>   	},
> +	{
> +		.compatible = "amlogic,a9-pwrc",
> +		.data = &amlogic_secure_a9_pwrc_data,
> +	},
>   	{
>   		.compatible = "amlogic,c3-pwrc",
>   		.data = &amlogic_secure_c3_pwrc_data,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
