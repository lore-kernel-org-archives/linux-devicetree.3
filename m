Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF1495517
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778082926; cv=none; b=VAH7EBsBWb9VcuFMLNi+yCmgqiUo7GQsvSNRQ3YPteNi0lCvG1M2i0iguFu9e5POLS0NXdPYP+guxzT2zc5pRy0IqdFaCjkAZFJSFJ2+E58NuOai0ZN16zpXgBx+5uqc5IyRfvvcyvXv9VIFu5+X2L21qxb9me9WOKt4nQyI2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778082926; c=relaxed/simple;
	bh=TyBKEitXSOYpOLdZrSe1cpQT0eEqwMSxLUtGZaEeL3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R7kZrxTHrlnzyymy8Bsp7drsGo+vlu9CHA+1UZ+9iYi0fgnqGgEta6DZVdB7wJBmZ5hbM/pzbUmuFbIYTzWj6jL4OGWSPDzyP25PrIcxN6BgPrEu6l2ISnT0i6vp0j9+abQgt/QSTxl5qtVbifYXECWqCK8qr8wL673UWmKDGWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRl7JWMf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRl7JWMf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so78605755e9.3
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778082918; x=1778687718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=CRl7JWMf5XvpYEXcChLH9WYBJL+LbF9Q50n9yCHvzV+gYXG5BViA6NNxnH5MgEixrB
         2er7PkErWayX5efXE8xTAwhd+vMcZxqxoEeGeYHYPfI3xL/gJs25dkmOAO2kB1iBrdDY
         hnMnL9bvs5BVtH/8d9f4P1WPoE5iQZbOkaSBwvNflVa8i1kOvlgJiVNx9gLuZvlvEE2+
         1qqQhrZSZ1JJv+mwXziKYlmfNr2kEAvFzekjEnJc6UiivnR+jhPV3xPdtwIm/YCLwchg
         FpQTP4GHWwimZ3wRLvgCcKUg53bXaJC4NdScdiTl9DmPtD2hDPksnFQ5wQUSii0+6iwn
         cAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778082918; x=1778687718;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMDmbK31Q/cBTRDNdYVwkrUVXvsO29GTLMWDni5jKAI=;
        b=BqUbVgIih41GA/OrqMfe4I+HtGh5c3GoNxBmazIqIsdXxv7NS7XWO/Ty7iEYl4HIZs
         J3D34hRThcnyYPcLz6xpEAAMTBlXHO1z+1Tt1iMDtHVPWhHjrOmq4obI8uXSGChsZ7SN
         qK0+lOUU+i7IBKtaQ26Uk83yxd2Nl3hnLhbDguugfdilNQaCQY9jKyuvPPzQbGQ4sjos
         GKED4SNPuJNOyOCv9F2OSJY9EGh565R7NhibUobbN8CbZAKoUAXrRma0RR3v8STQnF4N
         n4Mb8iMbXxEnrK7Jcg8Q7Azfwv2VshL0AMjDSNDkhZfKWws4vjqX5KjCfcJXA9YIFgQq
         KgJw==
X-Forwarded-Encrypted: i=1; AFNElJ8juEcbiMJzewTvCBbU/Ei0IEJajmocjui7A+E6zFU4DSq+tcql4MOqAd+6FvQVEeS7co7uTAFmwbNb@vger.kernel.org
X-Gm-Message-State: AOJu0YyOGP7xu7E9RLNbFgWko8qzF6CdnUoHSQeR5Jx4h8UNoVEeTGLP
	CNVxUWOjemWv7mjJKwcodJWvHJrKtyb6Ov4mI+wuMtJSGOqWd84prbGaziv092k1VGA=
X-Gm-Gg: AeBDieugGhnyfPm3yaJvQgPegiaeYj5rZOmrSc2A9ElF+scX7Irku9dVr7yEmZdpvNQ
	QJTyFnMzY3Z0D66qH4gKvS0c0Ybb5rjsC5shlDR8iz6Qip4diEQCtdjSxONeQGDF7dCA3QWtFU/
	F1VoaPJegfk5769K/8pHsWQf6Tqr8v3uHb2sRBVi2j6MIEmLYetFCegHr5w3VE7DuxRUaLyYOSH
	AYshgfBvnC+lOM8W7agyet6QIlBN+uAoHuc0kSBvHdrHcWaKMGbLdbFC0Th5jERCQhyFCGxstS7
	a6VtTE1Qxw0YNs0ILnQ7ySHMfiDV29rliHAvjTyCQRuOqLY8AWnlwL2ignnUwoetdRjeSelCyI4
	8E812oRJ/z3etkqgQD+eFjZRut/fMiOspDkU01HrT8Pj7hfAf3BEKoxUjmsL/VzLuH2Yg6TVHgP
	uUkK8xrHsEOcpPxfEMZohLMIPoG6thCmULJ/HEPwW5Vm+lOLorcAu2uarM+oJDCroJmfAoPadTO
	dVzrBBS8aQY50gQKQ==
X-Received: by 2002:a05:600c:3ba8:b0:48a:7676:30bc with SMTP id 5b1f17b1804b1-48e52bd5035mr71562705e9.14.1778082916975;
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5798:67fd:c866:b378? ([2a01:e0a:106d:1080:5798:67fd:c866:b378])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a547bsm62226385e9.5.2026.05.06.08.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:55:16 -0700 (PDT)
Message-ID: <27d7363e-b8bc-4e69-a9d2-abd7e12fe562@linaro.org>
Date: Wed, 6 May 2026 17:55:14 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 linux-kernel-dev@aliel.fr, Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260424-add-thermal-t7-vim4-v5-0-9040ca36afe2@aliel.fr>
 <20260424-add-thermal-t7-vim4-v5-4-9040ca36afe2@aliel.fr>
 <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
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
In-Reply-To: <f4bd99bc-00c7-47f6-a914-e398dd2c3bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/26 17:45, Daniel Lezcano wrote:
> On 4/24/26 17:45, Ronald Claveau via B4 Relay wrote:
> 
> [ ... ]
> 
>> +static int amlogic_thermal_probe_sm(struct platform_device *pdev,
>> +                    struct amlogic_thermal *pdata)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct of_phandle_args ph_args;
>> +    int ret;
>> +
>> +    ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +                           "amlogic,secure-monitor",
>> +                           1, 0, &ph_args);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!ph_args.np) {
>> +        dev_err(dev, "Failed to parse secure monitor phandle\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    pdata->sm_fw = meson_sm_get(ph_args.np);
>> +    of_node_put(ph_args.np);
>> +    if (!pdata->sm_fw) {
>> +        dev_err(dev, "Failed to get secure monitor firmware\n");
>> +        return -EPROBE_DEFER;
>> +    }
>> +
>> +    pdata->tsensor_id = ph_args.args[0];
>> +
>> +    return meson_sm_get_thermal_calib(pdata->sm_fw,
>> +                      &pdata->trim_info,
>> +                      pdata->tsensor_id);
> 
> This driver has a dependency on patch 2 and 3. Shall those being merged through the thermal tree ?

It's fine for me.

Neil

> 
> 
>> +}
> 
> 
> [ ... ]
> 

