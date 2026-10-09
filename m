Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA14908CC
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791538237; cv=none; b=E/LKBuz2Qg6Ia/AU+7pQT+/Ut4Ji9d3rlYs3ZvNwT58HRJfbnHw7abFBtpwx1Xsp+/kxKsKCeV96J7S14xJbzhnhwhoHSK6PGy8FHnxXJce+Zc2d0qYuZoLyJ4MeWeLitgH8dXlsaljPAfkrQ4rc2hF4IhKQhdTugxbnP/PiBhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791538237; c=relaxed/simple;
	bh=0fZcDdjzml995T9oZE7SVaCVuqTaThJLBP842zH3xww=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CnvfCM7sQh5OCvXvaF9P4kmYoEWpNtTDiAzxsznDshQTF48hV6ILq6KDudqSAi+w9eNNnXmSyI7ufb7xo0jN1xTrOs8cdH9IvgWqBPb+wS0cj6JALEq33+agAOuMgbNbXwjHc301Lcm8GTfwfMfB2d5T/cciPS5dwP7jLy2Nx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WT5YmW+C; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WT5YmW+C"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so33049055e9.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791538233; x=1792143033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=WT5YmW+CZri0kY3T6LyvGNKYhdk4kRw0luCH+HrEDUL3TcZPuM34HBrW6iX0I+Oide
         JRys8xQCqUPdQJwT0w998GuJFLJHAX+WTEG4aNjjVxeFXJwwHb9ozoc5fRvTHpdQ/9Mk
         91EM40r0e3ShZy4FAiV32Ihl9k7aHOTZhOG08vmb4Tx9uU/5esQnBpBBf+2dFxeOGnLd
         gkkbuO7BfBLE0FOUP96+n7IrLT/Q7M7HlJdeHZ+z73M2ExX5ZPXjHSK0KUEnDO4+3TXZ
         A79XEpizubWC3sm0n4EkJcITztUww0ZWNBNIp2ytYLAQLSj4WGk+tVTcc9RAYT8IXiYp
         gIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791538233; x=1792143033;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ySxG2l0k4bpp/Tb+8P52vg4ThV1MvpjerUMZY+o89W4=;
        b=Ep97xvCIC0aY1RhrAIFNtO7vz76FP2dZ2rouOBXfLDGgb/cjFdYa/1FqkXPwbzjk85
         pMMN3PfHYLQ47kv+eUv7jLFKO6YtRPqGbr9R5U29EoSDuJ8USQCla8/K7oCSo8Hqi4d/
         Ylsx22pJDVDw5PnAIUznT47FgOB9s0OB7cVO5ipzQQEBdpprV90coqd9ruMy9KY+hDuY
         wuSL8zKaYgy8/rLOw1FTARzmufNxV3fPYSYBapFqpT05/OafvRK/13HSKbL17PaXA4fL
         Z49xgm53RgOvt0jff7fCHX71vsvAR5yL/or72R7FY7H9jrYH5ZkJCrTEfnhAijIxfMKu
         7rkw==
X-Forwarded-Encrypted: i=1; AKwUvBzY4sMNT4lew3AvZMh//HfUPrSgWkr6emsAB9foVIhyFAXIM5ZGuhdwWXA0Yfool0WzelThmDn39Upd@vger.kernel.org
X-Gm-Message-State: AFuF++neyaXFL+HFH2QzM2kckJSghKnS1E/xJewMVN95pb7d4ZZy4D14
	Lq8QJNVst5dr0YxJVFpy8NddtCrGJQ9EVBPwaZLA405c7qYDjkDM/kSrB4ZPubaDvBY=
X-Gm-Gg: AYBFou281J5JgfM69YhnTVVnGxEsWQmT1qxDoBuWcmu0ci4GC35OuL5B6Vnr40Mv9Jx
	UEW3o6cw1FHeitKFBTUtw+40kMBd5VsDkLxWpA2jpYqjctk+kWwWs4gX29JDFlgwAQKLNcof7Av
	m7UQZb3jTuOK8Gt7FrqOIcYdcuDhr3cWnjA3Lc2ue7F2q0OvoBp1Zc4BFy4e/xRo3AcrNtSdbFm
	fzdqSoXtbT4OmP/AkG7Aeh85dNe7NnHUqkIQZ/LnQicCtY71fYmkQpytQ/jFX4q2AU3Xlr/WeEG
	3c6VE/qrhXQZh4GXWjEAusLaGwVWuHriHF5YBpzgmr3aY5bVf5k41zR+Lig4WBAa3yjupgoS2/S
	nSdciU2LGurvpuoRyZQJgtdgYPBJL/c4Op2FfjBhoiQuiJXmIl6kq7aK+25s7R/KYwEduKyxXBV
	yEfK82kCqBG+wBsKKm3QLFp1S8jt7c2zrcw3whyKrp9SqPO+0jWI2xZ7kmTEU3IutvDstYW+12W
	bSRtCexHDTmhnBEuq6LOgEPqwVsA+Q=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr23240285e9.29.1791538233076;
        Fri, 09 Oct 2026 02:30:33 -0700 (PDT)
Received: from [192.168.151.76] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf35930sm43922135e9.13.2026.10.09.02.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:30:32 -0700 (PDT)
Message-ID: <6b9cdfd7-9f01-4ed9-a4d7-6b2949452b6c@linaro.org>
Date: Fri, 9 Oct 2026 11:30:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm/bridge: simple: add Chrontel CH7218A
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
 dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
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
In-Reply-To: <20261009-q8b-dts-v2-2-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 09:55, Xilin Wu wrote:
> The Chrontel CH7218A automatically boots its embedded firmware and
> operates without host-side configuration.
> 
> Add the CH7218A to the simple bridge driver and expose its output as an
> HDMI Type-A connector.
> 
> Tested-by: Daniele Briguglio <hello@superkali.me>
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 3fba7002322e..fab793fb12b5 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -275,6 +275,11 @@ static const struct of_device_id simple_bridge_match[] = {
>   		.data = &(const struct simple_bridge_info) {
>   			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>   		},
> +	}, {
> +		.compatible = "chrontel,ch7218a",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>   	}, {
>   		.compatible = "mstar,tsumu88adt3-lf-1",
>   		.data = &(const struct simple_bridge_info) {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
