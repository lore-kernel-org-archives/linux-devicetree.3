Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318781DF73A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431551; cv=none; b=OZ3iUSb57b1/1b3NBqdouXGiMOxk7QMfvzeZ2X+LrJ7RrusMELuy6aCLbVLMeU0HES2jJ0Vx1uP8GlMkhitWvtyYtXIiVWgmRi3hTsLxT/Ez7g+0xCbwBm77gEvdMPwNdOsYwezvGkWp0u6ytnRNFhc2p3LojhU1mNNJ3K9LWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431551; c=relaxed/simple;
	bh=T6aKKqobYl9sb0mGO6q5/+FnSwMCgfiCvawGlmO1vXI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SMVlQGggM0VLzt8U53Nx+1csUNrFLrOqBe+JualD5yBTC9ZgmKSS3pew/WQM+lDvBQgurkhvk4YZdZWbanSQbgWvYLe7KhNg0nIjVQjPtx5sNVDa4spQSlFKZJMcToHZ7nxkZUx+DMwEwtO3W3X2g1IJ1eAJMyqg9foE82CAF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=saySOYCI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="saySOYCI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43fe62837baso4080114f8f.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779431549; x=1780036349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu9DBbAXcmIE6VMEm/Kiq9S+AfKSqe00wCUS0ELv6nc=;
        b=saySOYCIjXgYVhczqURmB7UuBjKs7ZpSTK9yGUMqKB5oKjHEY3psImvz0U99PGgQ2N
         eSC/UxpXcMQrkskeIRkAihVSV6jU8MzjKXQPmQWeKWc5p9J8y3IGX3nbzVXulcUl5u+p
         7Ohh0pSqnaTkonJt4EptMU2NvNfggdOqQAw1kJZXsAzHQDIlGltk1zizLHfgeRP8qiEu
         3RiGKYlKle6okAAlVYWEfbYIOe9ZXM3ML2Jt50aQJWqPoLYxX3+9Gt8dxfQWkyJrlPas
         U5azgrRy4kr1slc37MZNuvN/wBRm/4LPNgmEPhcl/OqgkNn5pMQt2cFiak2jQT/6QrEp
         /ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779431549; x=1780036349;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cu9DBbAXcmIE6VMEm/Kiq9S+AfKSqe00wCUS0ELv6nc=;
        b=MLzFeMQlx18iDTCKIhsyl8UoIIRnUiVPJLjmAQPKU9ub/Dk3wYDQpktvy0C6U2C1xj
         5VaxOYO7q3KhBxDQokXuvdcg/lAP6rIRbHbVb26VC9gjtKevltbMEYeYeWc6qY+kyC44
         svtPUGwsW9Jt+q6UQlpBMyidBuGYMn8cTGE35ehyRAQtiDFVftCd8D1qLL6fS3AHHjjH
         o85MTqIVywA/o+eQUrqWOv6F3M6Dsndr/yt8AHIa/e6ijTP6HmASpSIyYxTkD5TiLYim
         jWOw8zeHu5FcC6nri7gwcOaFHGhTMu/2qmadN8lHxwlQOPfVDiMNyO8ExeKbzHjhmo4Y
         fC6w==
X-Forwarded-Encrypted: i=1; AFNElJ9L5GZqvs43awbm219iedgWsWimey0+BlgiqqwEKThakCDCRNOXitXJzu3vv71wEF/3c9Oo9vzepe17@vger.kernel.org
X-Gm-Message-State: AOJu0YxkITg+0zk0lFPUplwYKygYs8oAwqcL/+NuyCZDvmkjXedCU8uZ
	dH5AFLALTT3bN4hMICeSxZYGmf8ajhDxRVK1uTxEY0sUsHnKrM4xpTpDIT3uO1iWZBM=
X-Gm-Gg: Acq92OHYFgYwSftHsQAkJJ71W9Xf5fcVGjm0km6yitXVA65E/yIglfUDL0qEYh/kE0N
	SIczltfCGSxFHaeUeo7FD7uOcIyiOMLua3JCiT+lpNk6fQB2eh342SbCIxnhv2EeOSRrx4Jyi7Y
	PW77vBI6UD0Ow8A19bQU71/fG4FTRt8de7vfV/CyqIdJJLKRXJRej9CvX/msy3R5zx9VDMZDNaN
	cVml4glUM5ly4TeqZB0AR36mhSiBBA8PqpEf8anBy1LXANLE9ycbWPvWbPhstZD99WUgGImoep3
	gelsyCsLvltq2CkbE3Qr7dqQvJkAPPuGpZdwEcOeyWSbuVqWkUYveUs43l1LDWVGFIitJaStt++
	BhDj0GUojSgf5ivOEy27qnCf64cv8EXfaHipIm7JDeHZzieMdMSKoyyr91/wACZKXpJd2iiRdvP
	FXV4Wvx5qer3MfWW94Q7w3WU95GaMS5FytQqcgaAIXpQv1yVG4RUqcmX6uxymu23vJrYxlIZUMG
	jMjKkU=
X-Received: by 2002:a05:600c:a410:b0:48e:8741:fd3d with SMTP id 5b1f17b1804b1-490426ab78dmr22498335e9.14.1779431548511;
        Thu, 21 May 2026 23:32:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:192b:8d21:b456:cb51? ([2a01:e0a:106d:1080:192b:8d21:b456:cb51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904174a145sm14887925e9.0.2026.05.21.23.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 23:32:28 -0700 (PDT)
Message-ID: <e0713238-886e-4ae9-b8b0-52e355e51edd@linaro.org>
Date: Fri, 22 May 2026 08:32:26 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: display: Add Synaptics R63455 panel
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
 <20260521-sm8650-7-1-bonded-dsi-v4-4-a4dd5e0850f1@linaro.org>
 <2w6cpuzwxht2dv7a3xj57ukuzqa2b77ba2syl2ewdmq5bprczb@g3rm2k7e4l4h>
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
In-Reply-To: <2w6cpuzwxht2dv7a3xj57ukuzqa2b77ba2syl2ewdmq5bprczb@g3rm2k7e4l4h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 22:24, Dmitry Baryshkov wrote:
> On Thu, May 21, 2026 at 10:46:06PM +0800, Jun Nie wrote:
>> Add support for the dual-panel system found in the virtual reality device.
>> This system consists of two physical 2160x2160 panels, each connected via
>> a MIPI DSI interface. The backlight is managed through DSI link.
>>
>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
>> ---
>>   .../bindings/display/panel/synaptics,r63455.yaml   | 125 +++++++++++++++++++++
>>   1 file changed, 125 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
>> new file mode 100644
>> index 0000000000000..a94b355ed9557
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63455.yaml
>> @@ -0,0 +1,125 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/synaptics,r63455.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Synaptics R63455 based dual 2160x2160 MIPI-DSI Panel
>> +
>> +maintainers:
>> +  - Jun Nie <jun.nie@linaro.org>
>> +
>> +description:
>> +  Synaptics R63455 is a Virtual Reality Display Driver and VR Bridge, used in
>> +  pair in Headset devices. The Virtual Reality Display complex is composed of
>> +  two strictly identical display panels, each driven by its own DSI interface
>> +  but forms a single virtual display for the human eye perception and thus
>> +  requires a strict synchronization of the two display panel content update.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +        - sharp,ls026b3sa06
>> +        - boe,vs026c4m-n52-6000
>> +      - const: synaptics,r63455
>> +
>> +  reset-gpios:
>> +    maxItems: 2
>> +    description: 2 reset pins for 2 physical panels
>> +
>> +  left-pos-supply:
>> +    description: Positive 5.7V supply for left panel
> 
> So, is the R63455 driving both panels or are there two panels, each
> having R63455 controller? What if somebody gets a single Sharp panel and
> wants to use it in their device? How will it match these bindings?

It's highly improbable, those are very specialized panels that are designed
for xr usage in pair. Yes a hobbyist could try to use a single panel
but it's only usable when placed close to an eye, and barely useless if you
don't have both eyes.

Let's skip highly improbable use-cases and focus on the main use case of the
hardware device.

> 
>> +
>> +  right-pos-supply:
>> +    description: Positive 5.7V supply for right panel
>> +
>> +  left-neg-supply:
>> +    description: Negative 5.7V supply for left panel
>> +
>> +  right-neg-supply:
>> +    description: Negative 5.7V supply for right panel
>> +
>> +  left-backlight-supply:
>> +    description: Backlight 21V supply for left panel
>> +
>> +  right-backlight-supply:
>> +    description: Backlight 21V supply for right panel
>> +
>> +  vdda-supply:
>> +    description: core 1.8V supply for panels
>> +
>> +  ports: $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +required:
>> +  - compatible
>> +  - reset-gpios
>> +  - left-pos-supply
>> +  - left-neg-supply
>> +  - right-pos-supply
>> +  - right-neg-supply
>> +  - left-backlight-supply
>> +  - right-backlight-supply
>> +  - vdda-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    &mdss_dsi0 {
> 
> Please drop the MDSS specifics, there should be one (or two) DSI busses,
> driving your panels. The rests are details which are not necessary for
> the example.
> 
>> +        vdda-supply = <&vreg_l3i_1p2>;
>> +        status = "okay";
>> +
>> +        qcom,dual-dsi-mode;
>> +        qcom,master-dsi;
>> +
>> +        panel: panel@0 {
>> +            compatible = "sharp,ls026b3sa06", "synaptics,r63455";
>> +            reg = <0>;
>> +
>> +            reset-gpios = <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>,
>> +                          <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>> +
>> +            left-pos-supply = <&vpos_left>;
>> +            left-neg-supply = <&vneg_left>;
>> +            right-pos-supply = <&vpos_right>;
>> +            right-neg-supply = <&vneg_right>;
>> +            left-backlight-supply = <&backlight_left>;
>> +            right-backlight-supply = <&backlight_right>;
>> +
>> +            vdda-supply = <&vreg_l12b_1p8>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +                port@0 {
>> +                    reg = <0>;
>> +                    panel0_in: endpoint {
>> +                        remote-endpoint = <&mdss_dsi0_out>;
> 
> What is mdss_dsi0_out?
> 
>> +                    };
>> +                };
>> +
>> +                port@1 {
>> +                    reg = <1>;
>> +                    panel1_in: endpoint {
>> +                        remote-endpoint = <&mdss_dsi1_out>;
>> +                    };
>> +                };
>> +            };
>> +    };
>> +
>> +    &mdss_dsi0_out {
>> +            remote-endpoint = <&panel0_in>;
>> +            data-lanes = <0 1 2>;
>> +    };
>> +
>> +    &mdss_dsi1_out {
>> +            remote-endpoint = <&panel1_in>;
>> +            data-lanes = <0 1 2>;
>> +    };
>> +...
>>
>> -- 
>> 2.43.0
>>
> 

