Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61389489884
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256740; cv=none; b=dCxLv016y7+fRVx3NacEGRF2vi5qI5iiPgohEU3h8xb9hm/i+z19SuFje6iBsankJBJnW2j2aXQm8zbaI2YghhJLpxb/e++aZ+SUDb3BFMEZP9a20kcA3pfeN4JKHK0E+uqrjzO1X4vs6sJNDVfcPb7nzBZ9hqywA1AhRJwdC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256740; c=relaxed/simple;
	bh=fr9RxllbuuvUiYfvgXQ45JoP4nvW3wrZ51yI8K7VT4w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cVcGYtlHgnQc2J1VQP5pUpzANYmXY2VbBe5j91fJIsfObD1nkR+oo8HSrMy/2daaLjjpm8/U9LzUgDDwUJzJrofGehqShZBQCD5bwp7RKYxd1ekj6eNVb/0BtB4O1UcZfPLnj5lIkJTMaClJhnSfesMYgziaYacaLPo+sCkDdEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/a4yed4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/a4yed4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso15121125e9.2
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790256732; x=1790861532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=A/a4yed4zg1dMMxN+9moEBVVU8kEyNsjOXk+obsLQoiGRwHD19M8CNVHAzeusiWaCe
         6A/6vumAe51e+x+DSBx2M5o0LVoI0vcXkc/hJTUTiDZqTjUGPLFbzAG5uluRbcd8g6BO
         +JRvDijPtgI+BdT7tbBP6+gCfFmWeq8C30BP8Mn4n9E6G5AoqzKVsWHpuii5EBMD+BKt
         LJUd4ZE7oCHkK+7Za5KqUiLdcPP/YqYpRxa/UnZzMC7yRTBejWSdlH6J9w0IY/zoZnro
         bZnABnwHEWuZB2V/HhZ/cZpiMvV9NcdcyiENroSbw+ZRV4JpCBRR+oKd0UN4oFARxR/K
         QYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256732; x=1790861532;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Oz3plDiKZZCia6T0UyGOKiCd1d6w6OxiQiVqDt00Z8=;
        b=Lkr6Q0iE2KrIsZu/WktOG0u0laZVrRaQDy2L1Q+Ai/c0AJ0C9stFXdgHs4Ay0ffAdc
         b+spLiHNuCrgvQbbA+N9VLusvyKDXzV7ZqHfpN3VnYen1YUWW0nYZGNWKH0fV4N+P+wJ
         7Dfbu7VVx5a94XXbOZYzntvNTfqtSAjpdOKJin9vbcMrk59lefJZmxE43A0WitrMD5Lw
         kBR+cN47hZoXk3bnhyy5H8e/9LUTlDqzzFEQsHJ/mhrTKaUEbiUYnQWAhSZ81OVRKkTe
         FWgdfTZtXFKq1Tc1RYMR9E+h+WUVdNY3HeuWZ5aPK79FUTiljHty3h16SUB84FxoLKKu
         +10Q==
X-Forwarded-Encrypted: i=1; AKwUvByzKBQl0gIPl+2r4WkvMkY4YGN1o0F4erqueskCUstV+y41oN3tziwL4JOmkdLwwF5nlcMp/YqbAE5q@vger.kernel.org
X-Gm-Message-State: AFuF++kr/iK3BsLikVhGC6g6Y5U2Pk+msPVHD4gsl2u/5t1pvSzhcgwQ
	+V34kw6umf8ejTLM8T4QNzILdcqhs538MbEGhV33uUy4kr8tGL6r7ZoU9tbYC33Anrw=
X-Gm-Gg: AYBFou1pUetZf4c+uOToIwzzifGVd7Wvx9qXOfy5/3PdFYfqnfhahIxQNLvVRD6DDw8
	sGEhfLOrGZqahAxanBROMMXQ/F8i0PbmOGRFCv8ons+j7R4VTGso4J3SFMNYETOI//o5EaqcZb2
	Y6jMhs6DMuEDGGGmBzm/+CXQCbSrpH9uNH00kUPiSROSQ5oVqds8lb8QDbSW6HgY6blwOlftAmG
	Xv1pshXWixtCZzDPbE4Y8e0KcMHMJvUhQbpE/O7PgTGCEQYHbPAVfKQX+6C7LG9WK3wyMkcc9xX
	orH/TRTRhNyh7lo8as9cj8GYy6vcFVpnP1lybRGHBMCNuxRaTwPxFI9T4ELlOfIwPWlNvwEjsXv
	Z5O17w8+iNRsgiT7EEnqQbO2r0mpuKrnBMjOLCbZ85xk4sqGwp1RULzNFkeBviYTKasiw4pE0Vb
	nTxU88z4uPlzp2Tly1jZiSbdX7wAdI484s/r4TWEl9azk8bjvrJMbkNVvR4CbiY7gdd+0D2JZ7J
	S1v4RqFGokjMDlizj1FFbG6fltTM1xnDAI53yffSeTWO8pQDV24Dw==
X-Received: by 2002:a05:600c:1d1c:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49fe66c9ae3mr43287325e9.3.1790256731984;
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a? ([2a01:e0a:106d:1080:336e:a1a0:8f96:9f7a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm66794335e9.6.2026.09.24.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:32:11 -0700 (PDT)
Message-ID: <42dea883-cbbf-4835-b8f0-b27a016ec339@linaro.org>
Date: Thu, 24 Sep 2026 15:32:10 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
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
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
 <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
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
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 14:51, Nickolay Goppen wrote:
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

Send again with a commit message.

Neil
