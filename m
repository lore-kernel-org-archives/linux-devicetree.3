Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4B36AB5A
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377773; cv=none; b=naq73kE6sm7f4S4o6B3N6d1tDwBl6oH5lzuVz5Hx5a+/URn0dkTXbfzfjf3Ol4g7mSMwkygJTsNRDKArFxDxgk8dptTrEKrC1HyWlQmsT4uM7cJ1ZnFDxaob1a08mdaurdn34XdNBfeUyzngpWQAKGgLzJuXuWduNEeCmXHKyuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377773; c=relaxed/simple;
	bh=rGYF2CUBtEnyhzpYsNB5Y6dzRnLg4IpMqoZMJVYk+nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxYOhZT7q6z61CsWnPIrKObUyzdDtadDVUKnFUnWTnRSZ9xDmw5S96P6HFOnMOKW6XCXob4erVI6fzV/ARcHfyZ7mzCGKRGI++9q9hHHsvLVXwBR2Ma6F4MmMW+5QgutDg616kOcNd1ahbFyMLA/CESVMWheF1n2wHJ/QnGBj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gtrt33Ni; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gtrt33Ni"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d7e23defbso3549782f8f.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779377770; x=1779982570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWk6GQzhGW2RryhVAKkuT+Tv5fS5Q4uWu1yky+LSRfs=;
        b=gtrt33Niu2bkgLybMhWfgarNi4MOpC13Ubv2PME4nJHuWiJeeemWZTYKdfyT2T6a1A
         9gWz5EYkEAWXklpPGjPrnLx9jWtHFAJJ17/Q14Ecl+kbs1AVBhu4juB21sOsyAQOVFpk
         BN+KZGh7W5cf2Zwkiy4zSd2jCtZhu355ffjoLWB7fBQh6ShMwuRUANsYcWp7i40YxAzu
         WwjaFOyJLFSsgS2t2Rep9nP6TRp80E0Ii+B5gu5PZqIyF9GtTWPRJuHsdXI7X6i1odOi
         a0ccFwORUmhOiRFmvRz9NQJyZL+rZXMDi/YJJBfRA13dxUoXouZioSXbZ1mavAP8xaAE
         PwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377770; x=1779982570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWk6GQzhGW2RryhVAKkuT+Tv5fS5Q4uWu1yky+LSRfs=;
        b=SqrTg+kg5UOvlMJhuAKiJVPepHWF5Et84QHkM13HZenrmm7mWaKafNtEHkm9VIvids
         lSnz8WE7A/Qk0lSLp/GC/YI9K/FjMTVTFsFlcpIJNnc5WVYR9Kg10GQj1CLrGNHp23jy
         q+jTV/CdiPWBjg2dc4IAHVdc7u5BkESG8UTotmX/6BM3POtqz1sigdcYQsI8z+/+ZEV4
         iljxZH7nI6n0uM5FsCbXXbOKVAAhobN7mgKuiMHtUmT6CkkL1zxy1tkM0EQSVCVFpJxG
         ZRCSSlZtoKp+mOMJRU4zwIpUFwUeO7+2nzbJvFvg1y+/t6/N0e/hgmd6OVoaxOvr9M2Q
         zG9A==
X-Forwarded-Encrypted: i=1; AFNElJ9agy1tz/sFjcpINaSmGUSi4b/FHoAYJUP90zo+0qtWaGgeoNa6kbnuLoexf4CCEBNEEtKfHc0GpM5H@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8wCEjzxCEhdIuMLJGuPGmWWRYt4dA/EwaNkQcw8cWp+4cQG5
	1hCnPK8FU0x5zaFMrEvWZkBVkrm84K8v/z/HhDgTWuykVmj1p3uy3nDAMnl6k30fXhz4Xbn8oOA
	WpZxLAic=
X-Gm-Gg: Acq92OEirhZn9JrDRvn2hYbfKqa7yMTQZvEBGHgfZRT5O7ij8pSJiTrqjJ1/648i45f
	Mkz3gkjRwjXx60waUXawLA4l+LGI9NQ8Q2H3oPn0NgWzh3bAHNRXqewmlM8Q2zJ+9LUXkypVejJ
	MtrVPK8DUewtSubbXR7CpVO0zFu1uiOG2+r0bxNs3sI4GTmDJWdDSxYg/5MLb/DTwTpUgZE2dcc
	zL6tsZU+bSrIa3moh+Z/tGAe1FZ+DTAuKAYYyEHLzzQpUqG1QeH3QWXo+48fmDb3kw9XN5T45hF
	KvcrXic2DmR1pJKgwyowJtGhNGJaMQJ4++JJ5R8KosMnK7KUKO1br+VUOFHKZZtZxzYgkol5z32
	SNrY2im0qnBEo2dJaxunxfoQ7bTiPIqRYrwTuIgpLs2ok6BuaEjVWriSCkEltwe+04WEkXXrxxT
	I3oIOuipTz6QQB2LDkhSWBTVCUvWp4xSaXEA==
X-Received: by 2002:a05:6000:1ace:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-45ea37bbfb9mr6086071f8f.11.1779377769950;
        Thu, 21 May 2026 08:36:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93ce5fsm3749850f8f.33.2026.05.21.08.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:36:09 -0700 (PDT)
Message-ID: <634c0951-dabb-4505-ad52-4101a8ec0bbd@linaro.org>
Date: Thu, 21 May 2026 16:36:08 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org,
 robh@kernel.org
References: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
 <20260521122645.3EF9B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521122645.3EF9B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2026 13:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The schema unconditionally requires `clock-lanes` for `port@0`, which incorrectly breaks C-PHY configurations.
> - [Low] The example device tree node is missing required `data-lanes` and `clock-lanes` properties in the `port@0` endpoint.
> --
> 
> commit bec75335fd5214a065f090cefeb28f9c895cfd3c
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
> 
> This commit adds a new base devicetree schema for Qualcomm MIPI CSI2 PHY
> devices, initially for the x1e80100. It supports CPHY, DPHY, and DPHY split
> modes across three ports, allowing per-PHY voltage rails to be individually
> defined and required.
> 
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..c9116246c1e9e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> [ ... ]
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Sensor input. Always present.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +              clock-lanes:
>> +                maxItems: 1
>> +              remote-endpoint: true
>> +            required:
>> +              - data-lanes
>> +              - clock-lanes
> 
> [Severity: Medium]
> The commit description mentions the PHY supports both C-PHY and D-PHY modes.
> Since C-PHY embeds the clock signal within the 3-phase data lanes, there isn't
> a separate physical clock lane. Does requiring clock-lanes unconditionally
> here break configurations that need to use C-PHY mode?

Fair hadn't thought of that.

> 
>> +              - remote-endpoint
> [ ... ]
>> +examples:
>> +  - |
> [ ... ]
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                csiphy0_in_ep: endpoint {
>> +                    remote-endpoint = <&sensor_out>;
> 
> [Severity: Low]
> The schema definition above explicitly requires data-lanes and clock-lanes to
> be present in the port@0 endpoint. Will omitting them from this example cause
> a validation failure when running dt_binding_check?

Yes this is what happens when you ask the question "should I run the 
check one more time" and say no.

>> +                };
>> +            };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +                csiphy0_out_ep: endpoint {
>> +                    remote-endpoint = <&controller_in>;
>> +                };
>> +            };
>> +        };
>> +    };
> [ ... ]
> 

