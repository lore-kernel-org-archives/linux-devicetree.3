Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2760A35AC13
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495120; cv=none; b=rDZQ6Bt9vcabs2Z1pH5rVTbZOWF2tS/72aMKN+bzOpZfFBGCweADN0ARda6wRHWiKMJGkNvy9SbE2n6HtJT5eXlQGdyVlZDL3Y9xw+upXn5u7ARN77Q6Oa9wwzdpqzFsRxmcPlAhqCZOJMmkgspYGyuI69lWY0Gv8nJ5XCBFxSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495120; c=relaxed/simple;
	bh=CSGPbkDH8ceEymg3BcXM6VIlskjDz02fGGgoN3NE3aw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WzhYKjCeh7Iv8HCgB9SelgshfqX53JoojAS1MWncyQmYk1YvUxnZ+xn/Qfj/VaNSALHLbcXNPjIA0v673+FQvuaIZsxzs4eM4AN9cTPtMN6Eui5wFvE/YhAkj/ylvssDDXUNww66bSmgxT5YLrE9fiCvnUBR8K8NhoNvtT2zC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FKfAopsu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FKfAopsu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso39544705e9.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780495112; x=1781099912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRGP5npAnw6bhYXF7IBZn80+XY3pb3wy/EBvJAjC4Ew=;
        b=FKfAopsuO5yuS4d3WEPITJHkXZ7PKrqhFMlqu0+YRxVnZPRMShU+ajte2vBtBwUt+v
         6b7GdWqw2L0agcA5Sk9Ea4+VdYk/0UlXZrhDM00MDy5Myo8bftZjPIBKuI8UQ5FrKoIU
         hxXpOg2+CwwiDG1brMKEsrR+SRgKnFBrnvYKUt/iPt2v1Y00289D2gc8iEDRgS7Kilnq
         ZxZE1sLdhvlFfKEl5wmdPpT0rOEIrEDHrNuQcho9u1b9JgClM+PhI5kCQyHQY63cYdWg
         fpnqpyoCL7yQOLZ41iylvodQwg+Q7HZ+rUmNM6O+VWgJveYPswu0p13XfAE+xQY7TEEW
         knqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495112; x=1781099912;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRGP5npAnw6bhYXF7IBZn80+XY3pb3wy/EBvJAjC4Ew=;
        b=YpaM/CKDTamL43a6HWJ0rHktyDdPsRt98TBqqoZh5W6h9PSMKxBrw9uS7LJmuJPifJ
         DvuZerdUKeuqW+V5Pzqe0Oywk4sbpW/x3WYh+aUFWpPllZCbws+2nnnHKYYcxsObs8IX
         c9oqMbq5QSJuhqSJvxsTXugg5Rk+HxmRrvND61pNLiluZNNlhLirn+psb3V6k5KWGShw
         G7O47tJR4cLZluMsN96ryEuVzCkcKERCMT0wvoIJRLNo3MmZC3/Qj23f1mWEH/s85b4o
         yL1MvrgGavlAILmpMRrvUQNi4IqInJVOJSyui07ChBS0GAE6+OkU7LAqA1bJUDbh/gjx
         acfw==
X-Forwarded-Encrypted: i=1; AFNElJ80Jcog67WPv12B2eKf0efVbZLieXmsqNil+OICjEVLM1XsBFHqufIeZ4SM+IDl3JQr3A3PcTE5vRGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZEhPBv7nx1jTlEPbN9yeV0vEx0w4T2VkPiYovi+JqrQdYI5vO
	U20AeOKUHM0vWqD1AbaoUyRF/wE6BqJAQ5s8VSs8y17QNTnoxmtBfWCc7uqixzE09/M=
X-Gm-Gg: Acq92OGZ9dhq6ezKMWBhjw4OXIVxUG58YRbaR5gfDVJ0TQZkaIPZqtui4AikZ4qnCR/
	4RhB+D7zrzqbR6KbfRYxecrAOtPXqsYRvTPJWfPQ6QkDon/RzHYaxzTN007AQLNAzja6okwK9DL
	MphB6wVt+JLPBaFLAm4S6YQofh7RJ8VQs51WB9at2/yZ3dMqtqCRGR/99yjey1sRnNncDRiBeYP
	gW8pc0rbmayPQhg78smUVqXDYwj8cQWT+/3dz7Y6LwNx6J18rzp6fHoMIHVNZV5hlEJm2GR4hwS
	Gzs6cHP1ci7mna/Ni9CT7YUqEgbbp+aEldJzxHTMxZk37XVOUBED1n2aX3DFtKWF3iZ+wIBa1Zr
	bdg1LeFKZrV393CcIdkiTNdZyuGIRd0+lTqb0SDzccPVdDByb36+1wAIuUULavtoUHB7six8gvR
	8Ll2yC5NVDlmOsmt3Lgnwgf+kMm+RMFmOvra/aRY+HOPWC04US9P/AUPUWsYozsbdCY9eNcPYCH
	hp/te58sO3BR+M=
X-Received: by 2002:a05:600c:1392:b0:490:52fb:12dd with SMTP id 5b1f17b1804b1-490b5e8cb8amr55769715e9.10.1780495112132;
        Wed, 03 Jun 2026 06:58:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e304:c6d:bb75:4f69? ([2a01:e0a:106d:1080:e304:c6d:bb75:4f69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm8093399f8f.18.2026.06.03.06.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 06:58:31 -0700 (PDT)
Message-ID: <4a7c19a3-bb00-4a68-beea-146ef65f9e5c@linaro.org>
Date: Wed, 3 Jun 2026 15:58:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Document BOE
 BF068MWM-TD0
To: Alexander Koskovich <akoskovich@pm.me>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603-asteroids-panel-support-v1-0-109c6ac81c8f@pm.me>
 <20260603-asteroids-panel-support-v1-1-109c6ac81c8f@pm.me>
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
In-Reply-To: <20260603-asteroids-panel-support-v1-1-109c6ac81c8f@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 15:03, Alexander Koskovich wrote:
> Document the BOE BF068MWM-TD0 6.77" 1080x2392 AMOLED display panel used
> in the Nothing Phone (3a).
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>   .../bindings/display/panel/boe,bf068mwm-td0.yaml   | 77 ++++++++++++++++++++++
>   MAINTAINERS                                        |  5 ++
>   2 files changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml b/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml
> new file mode 100644
> index 000000000000..840ddff709ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/boe,bf068mwm-td0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BOE BF068MWM-TD0 6.77" 1080x2392 AMOLED Panel
> +
> +maintainers:
> +  - Alexander Koskovich <akoskovich@pm.me>
> +
> +description:
> +  This is a 6.77" AMOLED video mode display panel on a MIPI-DSI 4-lane
> +  interface.
> +
> +  The panel also requires ELVDD/ELVSS/ELAVDD rails but these are
> +  internally managed by the panel via EL_ON1 (ELAVDD) and EL_ON2
> +  (ELVDD/ELVSS) control signals, they are not managed by the platform.
> +
> +  The driver IC for this panel assembly is an RM69220.

If you know the DDIC, please switch to bindings & driver around the RM69220 DDIC
instead.

Thanks,
Neil

> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: boe,bf068mwm-td0
> +
> +  reg:
> +    maxItems: 1
> +
> +  dvdd-supply:
> +    description: Digital voltage rail
> +
> +  vci-supply:
> +    description: Analog voltage rail
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - dvdd-supply
> +  - vci-supply
> +  - vddio-supply
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "boe,bf068mwm-td0";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
> +            dvdd-supply = <&vreg_oled_dvdd_1p8>;
> +            vci-supply = <&vreg_l19b>;
> +            vddio-supply = <&vreg_l9b>;
> +
> +            port {
> +                panel_in_0: endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9f2780b2d31..63d0224bba3b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8000,6 +8000,11 @@ S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/tiny/bochs.c
>   
> +DRM DRIVER FOR BOE BF068MWM-TD0 PANELS
> +M:	Alexander Koskovich <akoskovich@pm.me>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/boe,bf068mwm-td0.yaml
> +
>   DRM DRIVER FOR BOE HIMAX8279D PANELS
>   M:	Jerry Han <hanxu5@huaqin.corp-partner.google.com>
>   S:	Maintained
> 

