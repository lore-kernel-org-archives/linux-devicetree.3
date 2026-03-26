Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79423E334
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490877; cv=none; b=HpifWD3mocICZOASyVYDinMkZhBvdu+s2zBzKopzPUk6rucJRXDyWUIju83DPB9HKaMXfaumN/RLI3oQwuxv87P7OgnwIcQjaDKLfpnECZ+EyuPJtcRGnXzO29Ig4srJZFhE7M1lSPLWBO9VdRCXlPAnQH3t6sDKxAtoiHCx+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490877; c=relaxed/simple;
	bh=fP5ca+wleAv365iglFP1lOZ6n8fv/yloi+JcxBej+bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGa/WJh/13A5mSyEv7M3z2oWn37AsfwVnHub4MwUUfITGmOCspE1un0f40uxpI/rxb3jDM/WwZNTRq4StQf1TPRCYkgYUrcVE02de2NTuKUnSTLux3TXXM8nbWEOug2Pn/dMn3ySI8Cjvge97SO+98OLGaDOljPpo1MdI+sgLfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u11lRW6y; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u11lRW6y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso307048f8f.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 19:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774490873; x=1775095673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQBV0aIbBMoDV/It9TWPuN/5h+uJKLUgF07SUqXfhYk=;
        b=u11lRW6yTU9igaZ2Yps0O7OWHzDAggN1vfYCEJe3jUvgAEWXFx2FLmsdAZ41cfHEEa
         qwUyD6/4JCm/yti5ttjf8yONy4HtY6RAj/mGsqI24HTNmoGgi7HQ8s6821i5kxU5iems
         eJQU6EFARhixfbBJe6zK1747JUvgpAYMfLoOEftdtW3gMVPtgMnwNnJpGgzopQBwBFiV
         0N7gPVnHcAv/iAd2dIn4L2es/tfcfk9Px+0QQSRgG9/pQ28e3TU1wAbJ5DySJBDp+y3/
         ucrawWKu1ShFtTQ8A0VNWj6952+tTIPBEYIFvB3YPZByWS8pg9upiTofan9Q8mBKNm79
         aU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490873; x=1775095673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQBV0aIbBMoDV/It9TWPuN/5h+uJKLUgF07SUqXfhYk=;
        b=iYBdFap4OnOyl7eQCkADWVWZX0w9PpC+IhBgsuyNKjD7TmO8IgKoHfb6UzCeT6oAFs
         LYUbkuGnoIUxg62oZ9B731FieHZG1HYHuWAzKWKHnrcz0QG8cZw8k+HKoMBmJFLIlL8R
         PG2wrs2MrXZaEgf5NlXb5EKgnVXHiboaQ4HlFVKyY3iezgIzB+mx5AtTyrzJU2+dnE2D
         DQFh/Y62TS+socnu1xnnCFPzNIpno5ytahgefv0RpBIbljv2t39tii1COpHOLQdL4bIn
         OumjD3XoDymxcLZyv5ZiFnIln1FXX0ZfgBj0v/ttAsOJtrDwXdhySf93VjYZvgS/TUpK
         oiyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpGIlI1C7yPlb7zOSpFM6I64z9FXmAZpF2AkL8eY72dp0FL1aerTPnj4j9Ic1wcYd1YV8n/t784f3f@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sSf2CXOjVykN09HGD9iG+8LwaXiY6F7H6ZNRGezZre8Xqssh
	72MqZuN2w+EMWYRQ0UzEx0ChSeQCpuotmK5J+juUF91YMYzWsaWY4I1jJOgzcZavpgc=
X-Gm-Gg: ATEYQzzJGy5a9ElnMafnKOK9pFFWdyUUSWePVFTZXFM9SfxeWJE2JwZ75d9hvtTG8pH
	NQ163KxaFLO4AQiy8MuSoiIeMLfKIibueLF5kd8hL5fLoJ4dB16TTFSSbhvQVht7cX+lhyRtBjt
	V1QmjqXzeM6nBefoE07Uen8W8/E76feHO3WB5jsJcJ5bR5Hx99AXyiDzYkzr+z0Lzk/wGEgnWIY
	Oxr5a4/ER0mld/DbkjoDYnuoEeUr3xrVs5rDtQDHAj/F3wBrH0yUB6oY5w3vpgCWKLcUVPJF1mU
	otPgjR+kaCvCNwSF+H/zLQWBtvh5XU0z7RAiLl3NnLIIlx4TGlrsIHEbYZgoA9ar9yruJx+asMk
	bLnhdN4lv1ot7QcTMwBwc+IKkyo77KrNcepZVodSQAy9+JtVHOrp58mWFEyALhcf/rWf7BCEpGW
	bSz3uuKXFIgM3XgW4BZZy+dMy/pO00LBHZQ+E=
X-Received: by 2002:a5d:5d07:0:b0:439:fbbc:d593 with SMTP id ffacd0b85a97d-43b88a04ff5mr8594238f8f.27.1774490872955;
        Wed, 25 Mar 2026 19:07:52 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7372sm5264843f8f.34.2026.03.25.19.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 19:07:51 -0700 (PDT)
Message-ID: <540c2a97-00ec-4358-855a-b238aab53860@linaro.org>
Date: Thu, 26 Mar 2026 02:08:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
 <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <17ab70a4-1ab8-4384-8537-44dbfe31889a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/03/2026 01:51, Vladimir Zapolskiy wrote:
> On 3/26/26 03:28, Bryan O'Donoghue wrote:
>> Qualcomm CSI2 PHYs support a mode where two sensors may be attached to 
>> the
>> one CSIPHY.
>>
>> When we have one endpoint we may have
>> - DPHY 1, 2 or 4 data lanes + 1 clock lane
>> - CPHY 3 wire data lane
>>
>> When we have two endpoints this indicates the special fixed combo-mode.
>> - DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane 
>> combination.
>>
>> Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++ 
>> ++++++++--
>>   1 file changed, 65 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100- 
>> camss.yaml
>> index c17b9757b2c86..f44138f522bba 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -148,7 +148,8 @@ properties:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       description:
>> -      CSI input ports.
>> +      CSI input ports. Supports either standard single sensor mode or
>> +      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, 
>> clock-lane mode.
>>       patternProperties:
>>         "^port@[0-3]$":
>> @@ -156,26 +157,86 @@ properties:
>>           unevaluatedProperties: false
>>           description:
>> -          Input port for receiving CSI data from a CSIPHY.
>> +          Input port for receiving CSI data.
>>           properties:
>> -          endpoint:
>> +          endpoint@0:
>>               $ref: video-interfaces.yaml#
>>               unevaluatedProperties: false
>> +            description:
>> +              Endpoint for receiving a single sensor input (or first 
>> leg of combo).
>> +
>>               properties:
>>                 data-lanes:
>>                   minItems: 1
>> -                maxItems: 4
>> +                maxItems: 4 # Base max allows 4 (for D-PHY)
>> +
>> +              clock-lanes:
>> +                maxItems: 1
>>                 bus-type:
>>                   enum:
>>                     - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>>                     - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +          endpoint@1:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            description:
>> +              Endpoint for receiving the second leg of a combo sensor 
>> input.
>> +
>> +            properties:
>> +              data-lanes:
>> +                maxItems: 1
>> +
>> +              clock-lanes:
>> +                maxItems: 1
>> +
>> +              bus-type:
>> +                const: 4 # Combo is D-PHY specific
>> +
> 
> It's unclear why both 'bus-type' and 'phys' cell argument are needed
> at the same time, they are equal and thus one of two is redundant.
> 

bus-type lives on the CAMSS controller endpoint. It tells the V4L2 
fwnode parser (v4l2_fwnode_endpoint_parse) how to interpret the endpoint 
properties — DPHY has data-lanes + clock-lanes, CPHY has trios.

PHY phandle cell lives on the phys reference. It tells the PHY driver 
which electrical mode to configure

---
bod
