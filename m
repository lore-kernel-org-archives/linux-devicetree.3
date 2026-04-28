Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D547AF5F
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 18:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401093; cv=none; b=ONhraBkXCgZpz1uv56KFTdGNrgQIkz/ayXOdPLMKnD83lH+Z35cttM3xRwvOBgMgqRrjqwqMT3+WqRuKuPB1fNJnfQCP/cQX7ufcW3TVYb96NXM5UhOghvXnYvJYqVvWnnGfOuDfYUCMWFaX7N3VG9JxizKd/3H5Lff4zgPElX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401093; c=relaxed/simple;
	bh=iDH/c3zTEENo4u50HzLDgRW8cW3epMThsw+Rs+fOl3I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kuwzLPWvXzsQSC1rXlfxpkAM+3LSO1UtnusPdSdkTxE9ccZ+5sdKaJgtv//Hmbme5VhwuS8gA++QBz71RG18lAt0a2rwFGPvc65gAcpD9iz3GD+8FYSsGixd/wWvhdhxgv1BsTSMUO8fvKfFgd7G+vxBJSwj3lXlyvCmVNMVseg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh1ueMFE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh1ueMFE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b0046078so105989475e9.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 11:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777401090; x=1778005890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEQVGIrIBH0Yz8YaiGUBUBvBwiXNHUR5MrPKG8s+11g=;
        b=Yh1ueMFEYx30UBHkFQXajYpM1pxFYUiP19VorNVzsO1Fl6YEpuGIymVnL7kEIQpiDC
         M0dwY2w7Zd+5jA7uUUlWW0B8FR6DI75kc83dwdZWBI1pJTFUiYoJwZiO+gcJNspU8u/Y
         o2fYuEhVXWJniNDB4wL85XcRToPiAvVGQPQODHDBZBP6mTah7vCTvf4+8e1K7V7YXPgq
         H0YGfgU2RVZD35dvjSVnTf2WrmyB+/APRyWAfxVhzk6IZW7xRHNqrH5PDNoMDOgqtXke
         cY8FKk8M93Ah8kF0Zo8Q/7DA6EgoZf74NRNH/VfxF8n0ZX0BP2KE1o4W/fPyalmAJDzg
         mn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401090; x=1778005890;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEQVGIrIBH0Yz8YaiGUBUBvBwiXNHUR5MrPKG8s+11g=;
        b=Y95unSPLXRI/nuHKdLyPFw+vmSDoWxqdsK+p+cedSZhuabrGQkPt7QVeZd+kP36Z0s
         QNMUVMwSh7WD1U2R6Rm+2EezHUY7l4Y1XPhMxSCxL3Aw2GGLViY+Q6efD87ewUG/cqCb
         PwbcuQzACB9njTBLWjjWwlnYWSvgDl60VouGsunsBVYcE5tXb+g6r75ee1c2PYioK22M
         YYJta5CAOVKYjMoxyicLfbcudRwQC4fP5WDtZ0C17vqexYSf9BsT0YjlyK1BfGIsotsH
         TACfrAjvW443F46jWjeOWKvHOIXT4XOPp9YnbymLiqlRh093Kh2gh7rQhnICGRcfcryY
         KpSw==
X-Forwarded-Encrypted: i=1; AFNElJ9ygt4bK0UlgA3swv2W7HeWVQXZXFNVUE9oX4JwbN4BxVlztv8Ui+Evumma/qfkAryXsdCvL5RCvbNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzAi1mvEtwCdbIeSfFfVUZPru2pUOLOnBbKhJfK2YlRkmPXzBZU
	aUsZJh4N3MGpSnj0YDPz38Lt/R8PrxxKBs7tD+VDNE7qm0Th72EfSuM7fdxfz8i7APs=
X-Gm-Gg: AeBDiet5MG4VRI8tiGKN2eJ5TTrN6YOVcJaKV1bI2qVJkMiT/7D767ILUEAtwyiDwhv
	f5nDiEgyzobBMEwcxtpXi7zmniU7CO8x4DXnCTNw4wgjsxmyIykfWrsQu8R9iBFgJw8MPWlailb
	+d0HQgXA8zSTWIIFGjf5P2HrQCi9euVEe2Dr12hYNFNJNcfzrS9BluQ3sM09BOJJ0O5PhAqRkwg
	yrxVP6gqEz/0WAqfxCjnjpHYTGDyKdUo8UwuC4SOn2/H/tuu9PzmIJUOTWbKLzKcu4L1TCPzFrO
	3Zf2iS32prBnxIUgck6WTgo2OB60SIKCHJ0gjNrHCr+zGSAbgrQeKwBRJi/DEdtmtg1/Duw1Eld
	+SD4grrSebcASrzT2e0cNIe6/w/DrShkB0ouiL59z5lMPI4BtGPCfBuNMFR5YLwe4bYyhg+2DJD
	T/h2qpXnh4WFmKnR9DocORjYXPWbu1H4ZWceLzDlh+E9Wjcby6WnLF6N4eP+Sg8+Wxj3xvMPprU
	6Es55QCh7v9gCV0fw==
X-Received: by 2002:a05:600c:3541:b0:489:a4:e578 with SMTP id 5b1f17b1804b1-48a77b19c77mr68824085e9.14.1777401089712;
        Tue, 28 Apr 2026 11:31:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:48b8:3c11:f42e:f0c3? ([2a01:e0a:106d:1080:48b8:3c11:f42e:f0c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa890a6sm7481259f8f.30.2026.04.28.11.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 11:31:29 -0700 (PDT)
Message-ID: <efd6dd15-ab9a-45a3-8f53-2a5516284830@linaro.org>
Date: Tue, 28 Apr 2026 20:31:28 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: regulator: document the R63419 based
 dual-DSI video mode Display Panels
To: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-0-981eb5ab5a51@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org>
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
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-r63419-v1-1-981eb5ab5a51@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/26 16:05, Neil Armstrong wrote:
> Document the Reneasa 63419 based dual-DSI video mode Display Panels found
> in the Ayaneo gaming handled devices.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/display/panel/renesas,r63419.yaml     | 92 ++++++++++++++++++++++
>   1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> new file mode 100644
> index 000000000000..5777930aac78
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/renesas,r63419.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/renesas,r63419.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R63419 based dual-DSI video mode Display Panel
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  The Renesas R63419 is a generic DDIC used to control dual-DSI LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ayaneo,wt0600-2k
> +      - ayaneo,wt0630-2k
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +  vddio-supply: true
> +  vsp-supply: true
> +  vsn-supply: true
> +  vci-supply: true
> +
> +  backlight: true
> +  reset-gpios: true
> +  ports: true

Please ignore this patch, I forgot the rotation property.

Neil

> +
> +required:
> +  - compatible
> +  - vdd-supply
> +  - vddio-supply
> +  - vsp-supply
> +  - vsn-supply
> +  - vci-supply
> +  - backlight
> +  - reset-gpios
> +  - ports
> +
> +additionalProperties: false
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
> +            compatible = "ayaneo,wt0600-2k";
> +            reg = <0>;
> +
> +            reset-gpios = <&gpio 176 GPIO_ACTIVE_LOW>;
> +
> +            vdd-supply = <&vdd_3v0_lcd>;
> +            vddio-supply = <&vdd_1v8_io>;
> +            vsn-supply = <&vdd_5v0_pos>;
> +            vsp-supply = <&vdd_5v0_neg>;
> +            vci-supply = <&vdd_3v0_vci>;
> +
> +            backlight = <&backlight>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    panel_in0: endpoint {
> +                        remote-endpoint = <&dsi0_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    panel_in1: endpoint {
> +                        remote-endpoint = <&dsi1_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +...
> 

