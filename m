Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9C2367DC
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514032; cv=none; b=QOUdM29TH1lz45+Soc+SbhF+uyFpXBFup20AQLaQ98pjI2F9D9F6+9s9PQi59wsOZrOGrRdQPV6MwF8s2xFV8qsgIJ5OCObgE/e7QDSNB67I1bobO5+5Uw0oOEo2eSReJaRWtltaeQslv379yky0mxdB7FwOPoTeIEUFCFZV3cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514032; c=relaxed/simple;
	bh=jshjgZiMIwcilVmlXIyF9YBtwwM76mKXDdYGm857RDQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ri6nrAHMUb8EIOByau3ME/1owIbDpYoEKzu06J6sz2peJxGkD3ohnFquv3OCQ4UKYAA04c+uJfBT9qWP9U76BozklroR9XJYQNJk4Ugm3RzMIp8HCIlO9NtNxvzOa5bUfwa2D9a27YrzN6USx5IdtnnE+bKF2t60y5HI6AIF7Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aL1wWndH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aL1wWndH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso6857635e9.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774514029; x=1775118829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlFbzvdK/QjehwI/ahd2UAunEZQRZ3Ftqd+hlVRhyxA=;
        b=aL1wWndHTnn8nRWx5vc/mPKVZz9TwZoQlMy53F6wC1xGbYJoughilFltwdnJOealpa
         GKgSOJ8wJNV7JQWGWcNUcXbU6z0pUT8kMRNlsjlMVIgyjltHdmk3P4IHQ9ZGuKDCCy5w
         k1382m8YUxqspY1NaLF8aRUHOzaw3NuysFwK7LAdZOgl0il8F5Wal6E6ggz4/pmhcGkS
         U3w1yTJSI4grfiE9llmmuZjrIggv7HMVSQDHsHt+Uwh3zYJ/Mr/IkRCTALBWpi/DDq1Y
         K8RAnJCQcHI5pFCHEDk7dzTMo1mxTvLMvdcLH18/IVjGUt30VYJerMW8soU47eKhY9FL
         kB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774514029; x=1775118829;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LlFbzvdK/QjehwI/ahd2UAunEZQRZ3Ftqd+hlVRhyxA=;
        b=M3qv22WbN0m75WM0/HbqJwd8hzJsmiMb1Wr1/roLLjM1oMbxPmFK02lDLVu4dnSZZg
         x9yhbpe6PPcokXj4pRvutdp/MsrNVepoHtE5ObvRhHKcMM6S1zDHKnq6R84J8YWXObuf
         uoBqhH3Jsvwk1y8gRYg1KRRP6WBnqjQhNKUOaMJ0NjVMXycack3x1f74shasNj4/xklM
         Yk/8zq7GrBLomngvVRI5O/CM10y2ojC6PGn1WNIPE5qLtjpO3bIZXHKG6gsAU/JiaJy0
         NFNyjLlPgMavpvIMhiwL5RhJbu9SYrTrn4N1o+r1bKuJXvbopufm07Vy+fn8LG5zTVhq
         1taQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPn17PpaccFfDqNRux1V8p25MxOEW7c7MddasVPYG8hp+NC5RW5NQus/KcV6DIm3efO3CHzl0No8h6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rE+ddZ4QsYMB1cQ1wE5kQ8pfA1mL1sqCGakRKkEZEUn9wtmK
	rHthIASjSfCK/KhCUafYBoWUBCkGDivmoIQyUEWjmw1Ky0DgDrcOVm6q41TVX68svWo=
X-Gm-Gg: ATEYQzwmoNLZWvx+PiKlAp7hXv3/nrQAOXSWWnD7RtlEKY7ID3e9a2eSIDS7dp7aRwl
	awxYORP6/cbkvS8ENBRMBeeswe/0f4aGQFI5nYYcAukwNRSWe6sev7O28vEKxfvco9GX7h3+Fw0
	Y9FfFlz8S/Nv2RY+LesDM5yOYvE/u9NyhWvQPKvFJLF+2jaLOWLT/Hmdgc2/Ds66pO9mPGEfg/w
	rcXZOTztgixy8Z+SHkaHputYamsvCqXAZydu/Lh42+XXY0aqU3sx/ede9wMl4pNpHYFrX+sI8cT
	aaloxe9ETcLoJbg4NlD+KpfECSniHGuAv32Qv+qFS6hPYn7omOfY5dc61FqtL/DgPe86rhb91yx
	9BTTqIaPZApdJNcuFYrOKW0QL3CHdlUMN4asIqc5exCu7kBIHIFH2cPNPiqTNIWSR0c9i0kNCj7
	cNjDf+T7VZrBWDslNBSqE9syAo1pcwDKXv0P/8z/9XeITXa/98A/WrYc9AYR8bfh/isoXbe/3h9
	EejPdta7mpL8p8VFw==
X-Received: by 2002:a05:600c:4ed0:b0:487:288:1199 with SMTP id 5b1f17b1804b1-487160934dcmr99014245e9.28.1774514028792;
        Thu, 26 Mar 2026 01:33:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:8431:f88b:714d:f78d? ([2a01:e0a:106d:1080:8431:f88b:714d:f78d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm20860305e9.0.2026.03.26.01.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 01:33:48 -0700 (PDT)
Message-ID: <3827b0ab-69c7-4e46-b1fb-a9fa99399299@linaro.org>
Date: Thu, 26 Mar 2026 09:33:47 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add Tianma TM050RDH03 panel
To: Liu Ying <victor.liu@nxp.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260227-tianma-tm050rdh03-v1-0-cab78a0d765d@nxp.com>
 <20260227-tianma-tm050rdh03-v1-2-cab78a0d765d@nxp.com>
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
In-Reply-To: <20260227-tianma-tm050rdh03-v1-2-cab78a0d765d@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/26 10:31, Liu Ying wrote:
> Add the Tianma Micro-electronics TM050RDH03 5.0" WVGA TFT LCD panel.
> 
> Reuse panel ontat,kd50g21-40nt-a1's panel description as they are
> identical.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index e5fc9b072404..af84a90015fe 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -5519,6 +5519,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "tianma,p0700wxf1mbaa",
>   		.data = &tianma_p0700wxf1mbaa,
> +	}, {
> +		.compatible = "tianma,tm050rdh03",
> +		.data = &ontat_kd50g21_40nt_a1,
>   	}, {
>   		.compatible = "tianma,tm070jdhg30",
>   		.data = &tianma_tm070jdhg30,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
