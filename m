Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB153F4828
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781785824; cv=none; b=HucA3Oc/p56ITPY7rcac7pgGIZbxT6ZPBvKTzaaLzN8L/IPR+04uikb1dIfGQc5lsKIbQYoQLJs97cKpQrSNAYi6GvZePKqNtqe8ozq9TVyiDDz3XfWVAEMnUIEJUG62mIy/fakFIMuY/a/hL2CWfGuTgcWqtR+oyz25CrC0AcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781785824; c=relaxed/simple;
	bh=0cAra00Ak049b9s2bmtE/U+MjaLArd8s5x8l6HglVMo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mh0Xo8eoLDcxBGX3OJ4UmDo/3TDzqc0wbe1OXzTQqZuPouDpQHm6t86WdYi/jFr3C8SQPa3WgM5ZsjKVRRkTWaK3XN6k5WWJKmR19oECZWwpSQB24cIMCLwS8pYyHh2Bk8vm4WF7UCZzuytFTL13lIZelBOY7wolw//QO6VR1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ow1v3+59; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ow1v3+59"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4624c1409c9so667957f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781785821; x=1782390621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T87pQD65CNc83N4OFeqqd6eZRLgKX3mUIa9gwzpc18Q=;
        b=ow1v3+59uo2QsBnKmW/LupZ/GvGq+WhKFMJ6RXZbAaOh95RAOK6Wnp4Ns89PXT51mi
         piGjkOHn3M9jh6A03rzWHcAqKa+V64aHUuy2PLPVkCJggaAuRp2eP68scEXsqbqHPrlg
         vfgO2+w1y+AHtbMliiRFNCcE6s9ZlOm2UHRoAToGwnZB+8LbAhAMBPn63cYqxFL6l/pW
         gWKByRCHKItSQVtTPosmnZxqdAGPHabWVQvHdulanFM4Sqs8jnrYJLxEx2+L4G/Xxo3s
         0K0ayt5RXc6eqc7b+ng/hfVzur5Rz9eDif8Xycjg53G11GaOtXrM3t4BIB5J7GuqFRxH
         5zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781785821; x=1782390621;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T87pQD65CNc83N4OFeqqd6eZRLgKX3mUIa9gwzpc18Q=;
        b=V765lZlR5qdj5GfA5geVd14+3+2BFmLFOyq/yPfF5UFqla1qy4SImwbc5/OZo0NjLH
         I8MHluHEvxFQZ6kSI2uQzOLYAK1veeZmMoiMg7BCISbPNyN1rkfMGGIEHU1jr5xNMXak
         qXR5tr0PsdSOtvv9zrQn3xGMKy597OAk68eKMw0G8eX13MW2442ByRB7GCceSbw85rMm
         Tns87HttZgIa5YtMKfD3uLLlUN6LwmMgWqLSiJRhkOTcEsa1GQuPJx92b0+YKQJcgwRV
         hcJGTiIlWjbnMaugv5OtXvTmWPOvHmcoBZXNh3TudsNp+Iho2piPR1azz2ztsJdW/r2r
         lSrg==
X-Forwarded-Encrypted: i=1; AFNElJ+ryasq6oH+tqEC6TddzfaFRFW7lgmVhOJCapvGJyC4DZmsF6LqhaVEYqqsa+CdqkvXXvOL73y+21QY@vger.kernel.org
X-Gm-Message-State: AOJu0YxNt8oHhBFXOzEcvDXA6iwppHXzmW6UbuNoEJSsD57DoNIeYNKe
	KXz+VJy5zp+YL0aMIh691m/KnxH6aF5/aEjr0YTKeU6cUiGdOmYSL+BT9r6nst6v6FM=
X-Gm-Gg: AfdE7clf/GrKq4+3qtBH0X6HfLshsPJdoZRjCKL5OyBql8go74m0vZ9WxNuJBan/J4l
	uZmzzY+E55AVn+VvjPsl2xktqMbuH/koDOZ3mViUdiB721Dhq7kaSMVLC4RL0P4A1CUgCLVSHUK
	UWRh0+vM1Ygmg7MCZnJvxw5AgHlJIRWwaRjDlyn30Y7ulEE6+JraJWhKf/0tzy/DDMvp2f+Pf11
	YQfPkyGsIiqc+uwzvMC14V+9RMvu8HV4Tm8AaeXAW+RRxtRPe6Q7NW1hBedPSsd29p6Cn8sT69g
	V62y9IJPccLc4lVBC/Ibrd4IsLdvSgZdYKPH8jjDVPTkZw5S7EzRdWpW91ZL+zYS1dnZm/YLWlY
	OV1/HhE3FVwEDAvYYGDH5J780tOKZFl+oVHmnqL4ToItntvPuM3EvX2MBk+o++5rvEySXh4rfb2
	nSZhhIFvE2ZIZsusZ1L7RQfAcXeKZng6S/xegMi16adTIwUfK3Xa9hfPXcb15t0xA+l4GvAZiaF
	QWw
X-Received: by 2002:a05:6000:2405:b0:43f:dd91:b022 with SMTP id ffacd0b85a97d-4641d5554c1mr3156524f8f.35.1781785820908;
        Thu, 18 Jun 2026 05:30:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0? ([2a01:e0a:106d:1080:6e1b:5a5:b2b5:b2c0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46289c3b3a3sm14692642f8f.30.2026.06.18.05.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 05:30:20 -0700 (PDT)
Message-ID: <a8e62db4-716b-4d9f-abfa-4027bbe0f37b@linaro.org>
Date: Thu, 18 Jun 2026 14:30:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/2] drm: panel: add support for the Renesas R63419
 based dual-DSI video mode Display Panels
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 KancyJoe <kancy2333@outlook.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-0-b84b6da84293@linaro.org>
 <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
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
In-Reply-To: <20260605-topic-sm8650-ayaneo-pocket-s2-r63419-v7-2-b84b6da84293@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry, Douglas, Jessica,

On 6/5/26 16:50, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Implement support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig                |  12 +
>   drivers/gpu/drm/panel/Makefile               |   1 +
>   drivers/gpu/drm/panel/panel-renesas-r63419.c | 366 +++++++++++++++++++++++++++
>   3 files changed, 379 insertions(+)
> 
<snip>

Could one of you get a look on this patch so I can reduce my backlog ?

Jessica, do you still be marked as DRM Panel reviewer ?

Thanks,
Neil
