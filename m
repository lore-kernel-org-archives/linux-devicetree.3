Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D020476072
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326036; cv=none; b=bVSItyRLqaBuGltQWpsLi1PElJDfKmuCfoOb5t1nkgwNGGgQISAtnqc5FVCfdp9yel23CAnfCKSTQiXgyqUTXaii1pA8cqWG3SAYMfPua8OgxJxaWEcfit5eEZNHnb3mqqNWHFkvkNimk9H7crltvplRuwhLssURtCu3hDsOuoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326036; c=relaxed/simple;
	bh=0p5VzAzONoUlEanrq/TY2yIq2cftImJsp5mS7iKC50U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IEjqumxE3aKpyR2Y4qJuOLlej6+UnEG8elLWqmXvxgZTGvQJL7B/iiCPZt6ClH0Va9l0g7s0B76Rh5jJZXeGzLYCfaoastTmwGnIi1OfwJIMIg1OCrP7WGj1/TkabOBttWF32+p40zyZr0wNvSqclUWpru+MFf7XGna7Vx7JTzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+Rkw3j3; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+Rkw3j3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351832so333397f8f.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790326025; x=1790930825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=M+Rkw3j3Gn6YJYaB6oQWHOe4TAEzuan7cFrL1GzCzFYpacBS1VH6Yos/qwFGE75E8m
         CXh7XE+0jP85zExkkpS0JHYLAi8Q6Wy3WZTOd8gM+YZ+2pFQIu/Rm5RMS2sEirt6D35Q
         TC5YNq2tQ5/ourX+fbJVt/8r5uQpMwpKDdL1FTrqGpx3iyOyaY0tIDSFXbnTlaZW6Or1
         eyN3Uiavz3hLV7e0cN9ofvsv+LTwaTiw/47VBHj+tNtpVC976uQt7TcBun/Jk+8AmT0Q
         sDTMyQ3kvK0kbUio1kcJPoBFfoZ7hSTuTn2mbgauHjjO3fCaXY86A+oakfpxk4BDuupA
         2s0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326025; x=1790930825;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybGJMieDnUAKotpO3xSLkaT24MxuG36dkIyHYhn06KA=;
        b=KUZx39VYn7ND76jowHXhh90YDR5Pz5e9wli/xR8QSzpkia6V7HE7BQiivJYnvhjYgs
         l+Vg+rEAnqsRUy0oirPhT/fPrD+lZv8tJEFbLclTqX96KCqgle9h6pKVaLO3dHB5raUi
         LVbntFBO1ihIYZYuO5MYullFZ6jrlN3GtPTkIVplu4uH1eNeDvEQ7k8wn2GUbjgO54KW
         f7Tdg1DJpa/xrRBdfLppSK2SyMwlG+14ODgd4WjdI/zRjFda5OKZijvDfKMV6dE5LwBI
         n7nphrgfsEUydcwaH9u0y/D1WapU91BOg0ZuUiwVrs4e0NXNT+Vcy43tHSE6t8901XHw
         30sg==
X-Forwarded-Encrypted: i=1; AKwUvByCkIW2mfkmobELlgDDNyUTCVtR20IGtXsmTiwzAl46IPQVWP8FVjO4t5UI7OdGsbyF9RfI63LUyibi@vger.kernel.org
X-Gm-Message-State: AFuF++mtk8zkMvcMGmb4N1IQloO+u9CAwVE1w3hITJuny3m7yLmHnLIq
	gd85NTRPqCV/BJhtowvK50nYfEMQ0SJh/AMNM6fHyOPex9LS7/D5GjlneaE/lfODVWU=
X-Gm-Gg: AYBFou0GXcPcH9eNYbv2/nv54D77sXdxh86Xq/degf0pwAI9WLQBqcOzo8kzmcFyLNN
	aVyqctek0sF13bj45mgAN0Dt2gDl+fcaQM2o1fM253iFxen7DY9BUhisk67BR9Z0JrNe/t/N7FH
	vFh54c1XmH4vJVs+L2SuGtm3Npm4fqDcD437EsPQK526CxbwjDDJgqcmO6XgoG1zgnL0mSOPFvH
	1IC5cgYE/4V2enUQig2oB+nHgx3olDCkUylwAwLAudkiXYOMSOcDy8/cIsAd0jTR8f/N3G794MJ
	iZE1SgPMqJdUCvOL06qULsfny/YnLXnpZaCSVwP3XepihTnIuVY+rJE2Oqg/wSW0p+qfgcLQQva
	rr1tOtSUAkSaQS0TLOjtwfqrjC6hgqITm8iJQFV3Vxl2Bx7LsdkWo5tHSqccl2Eo6dlQf9YVkxA
	pTA2npoPL7MXfrPDzSghhnUfWzNslkE6YcoSoMfHTFygASu2nHk8xZ3cp1SUWP1wZM6Q+rIBoDz
	xx04BMK79FnSL8CLYVXarOU7y8Et8gSes9IM2ZQCU6YxjpqAKwqZFo=
X-Received: by 2002:a05:600c:4689:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fe66841f8mr87493745e9.0.1790326024865;
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3151:fc9b:d41c:770b? ([2a01:e0a:106d:1080:3151:fc9b:d41c:770b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff04440e2sm41053585e9.0.2026.09.25.01.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:47:04 -0700 (PDT)
Message-ID: <6399bb18-f463-4d6c-80e1-0efca5e7768d@linaro.org>
Date: Fri, 25 Sep 2026 10:47:03 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
To: Nickolay Goppen <setotau@mainlining.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>,
 Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
 <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
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
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 17:08, Nickolay Goppen wrote:
> Add a maintainer entry for the new NT51021 panel driver
> 
> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
> ---
>   MAINTAINERS | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7291238bc09f..743c785b4558 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8354,6 +8354,13 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>   F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
>   
> +DRM DRIVER FOR NOVATEK NT51021 PANELS
> +M:	Ryan Brue <ryanbrue.dev@gmail.com>
> +M:	Nickolay Goppen <setotau@mainlining.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
> +F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
> +
>   DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
>   M:	Lyude Paul <lyude@redhat.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
