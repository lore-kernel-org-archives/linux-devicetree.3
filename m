Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E03A5422
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791128131; cv=none; b=rLgaMYpSB5S0O7zq73DzRAzpvRqKAkd1YKI9/QDPXxrYM9DWH5z5qE79PT01p1Gm5IG6TwzNFJODIk1pBLLycbqfFlAfEp7p53YWdF8kE6rrSoEdwvq900mlgHXIT2nUWHIJsOrV+GROOSeD0bBFr4zqlPIXAwdr8fbzBiFuHz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791128131; c=relaxed/simple;
	bh=sViDSdZKQRI9ydvQk0h3/BkhqBPxKExmezC30XiSMd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XVAT+jgJBslp1Id9dKrQLfqAUcEwirGEI6J8XCRIKCf1sI/4ymoz4zFZMfDV6weK2D0IB+9ueb2uVo0unaDQbS/eivRabj6H/HS3QsJJ0OzulrLilz5PTk4HndXzy4nRvzNCC6RE4xoXYonvY0UnL9wiCjO6pnP9XWHFxSbaqtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1728d8dfcso212795e9.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 08:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791128127; x=1791732927;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwyDMGKhrQUUcZw1khziLYF4shBI37cIxufrD9bOvf4=;
        b=QpnLGu7ZWsTGp5Evy+YuJtoV1YwuUKij+dN3NcT8aPGLUO1H30TLgyRmBzpVltH5Iy
         VIlpi+2h1josV4OUOwCHZbVV3PbAgzDJJbbJerJ3VF+4luq2Bt+hEQuxboHfAisfkDl+
         zTmo8pUHf6PpaX5NoEYvVwYA4uHVCshlseVTKoWLQPT0tx8wel1nGSfnXXjk0OqzrzZ1
         6gTgYS8En9qCLLrO5caTGnQqUE/AMRxWYuhogHeFcXUrDqLxfCYU2UroLT1jwKwowlNb
         7e5CrUY4WUKdr0g44VPVA5BUZodcGoic5OEcCMrMbCeK9Bk3dqLXBj78fV/Fo6E6FZBB
         lwAA==
X-Forwarded-Encrypted: i=1; AKwUvBw6pySSia0GlN/RZbfrKABSiVv47h1Z9EUdPgsMGHr9qFVMciQGiGiVGkaa8J4pGHPXtXxIKiSEqjbo@vger.kernel.org
X-Gm-Message-State: AFuF++kUtuDZg3KqUro4PfaRuyrw+KqgzUeDpmUsG1ghanr3N5XRzj8y
	pTpf4T0K/ssd3a+DdEO26t28Yvr8rufcPKTFart1X/BRNAQKVCiGfwov
X-Gm-Gg: AYBFou1En0m5S+CmnH3gFe8toBH5IS1y1SeBLttvDwNfXWbxMtD46Q7fR3VG2BK1plg
	vxGD1KCFbmD9mc+2Dtc1drikhBGHSbEZTalyvFjSbIpp7bz1t1f6HkS0l3GHey363KSL+ibDv25
	ajj9G3lTvHLayQd1oPIMC2bqNhmi8A8jt4O/tOU4HH8YQsiR74QVTvt7Ykiqyc7yd1M8wH/4EFD
	cR8hQIcTabVwutuq0o+3gXoz3wZoRSntXzDhggNLNscmkCJkWQvVACK/+DFt3Cm5uj/Sm9GffpZ
	9VlT0zsQxjggUjm2FiPw0cH6CrUPZkC0Fv6pUACJdABNc1phATPdOUa5meJUvamRRaaDMiFUeuK
	HG5/QXeU1Rsf4kuQTv5qa4BS2tJVRqtIPGsTNUK/oJJ4neNqi2DvoQzFKbdcoS36sjef0xG7UxB
	77NDtpbtW4EZxbvgTabSu2shHiOwNDX0Yt01bVJ0ovA0GSkPk62pZE2b+buXtVvrNjNMd5b9eJ3
	7stn02OWtweQgvGiyo6Txzygh+a
X-Received: by 2002:a05:600c:348d:b0:4a0:c02:938c with SMTP id 5b1f17b1804b1-4a1680f405fmr76449125e9.25.1791128127431;
        Sun, 04 Oct 2026 08:35:27 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0316b2524sm310617265e9.1.2026.10.04.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 08:35:26 -0700 (PDT)
Message-ID: <54b064f8-8e01-44da-be40-4125620ff9d0@linux.com>
Date: Sun, 4 Oct 2026 16:35:26 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
From: Lucas Tanure <tanure@linux.com>
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
 <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Language: en-US
In-Reply-To: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/10/2026 15:06, Lucas Tanure wrote:
> On 24/09/2026 18:21, Conor Dooley wrote:
>> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay 
>> wrote:
>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>
>>> Add the T7 compatible to the Meson DWMAC binding.
>>>
>>> The T7 DWMAC controller requires the following compatible combination:
>>>
>>> amlogic,t7-dwmac
>>> amlogic,meson-axg-dwmac
>>> snps,dwmac-4.00
>>>
>>> Add a conditional schema check to enforce this compatible combination
>>> when amlogic,t7-dwmac is used.
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 ++++++ 
>>> +++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson- 
>>> dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson- 
>>> dwmac.yaml
>>> index 5c91716d1f21..b529ca5577a9 100644
>>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>>> @@ -23,11 +23,24 @@ select:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>     required:
>>>       - compatible
>>>   allOf:
>>>     - $ref: snps,dwmac.yaml#
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: amlogic,t7-dwmac
>>> +    then:
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - const: amlogic,t7-dwmac
>>> +            - const: amlogic,meson-axg-dwmac
>>> +            - const: snps,dwmac-4.00
>>
>> This is not how fallback compatibles are described.
>>
>> Instead of doing this, which affects all other compatibles in the file
>> by allowing dwmac-4.00 for all devices, please do this the normal way.
>> dwmac isn't special, it's just this binding that's weird!
>> Can whats currently in the binding (before this patch) be largely
>> replaced by just doing:
>>    compatible:
>>      oneOf:
>>        - items:
>>            - enum:
>>                - amlogic,meson8b-dwmac
>>                - amlogic,meson-gxbb-dwmac
>>                - amlogic,meson-axg-dwmac
>>                - amlogic,meson-g12a-dwmac
>>            - const: snps,dwmac-3.70a
>>            - const: snps,dwmac
>>        - items:
>>            - enum:
>>                - amlogic,meson6-dwmac
>>                - amlogic,meson8m2-dwmac
>>            - const: snps,dwmac
>>
>> You'll have to check this yourself against the amlogic devicetrees and
>> see if this is correct, but with this you should be able to add your new
>> device without doing anything special.
> 
> I have the same patch in my T7 work and checked it against the amlogic 
> device trees: meson6 and meson8m2 use the two entry form, the rest add 
> snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example 
> needs fixing.
> 
> Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
> in common.h, so the core is 5.10a, not 4.00. And the controller reaches
> DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
> so clk_disable_unused switches it off. My node lists it as a fourth
> clock. Does the AN400 differ?
> 
> I will send my series today so the code is on the list. Not a race: I
> will drop or rebase whatever overlaps once you tell me.
> 
> Thanks,
> Lucas
My Ethernet patches 
https://lore.kernel.org/linux-amlogic/20261004144046.391444-1-tanure@linux.com 


> 
>>
>> pw-bot: changes-requested
>>
>> Thanks,
>> Conor.
>>
>>>     - if:
>>>         properties:
>>>           compatible:
>>> @@ -38,6 +51,7 @@ allOf:
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>>                 - amlogic,meson-g12a-dwmac
>>> +              - amlogic,t7-dwmac
>>>       then:
>>>         properties:
>>> @@ -93,6 +107,7 @@ allOf:
>>>                 - amlogic,meson8m2-dwmac
>>>                 - amlogic,meson-gxbb-dwmac
>>>                 - amlogic,meson-axg-dwmac
>>> +              - amlogic,t7-dwmac
>>>       then:
>>>         properties:
>>>           rx-internal-delay-ps:
>>> @@ -139,8 +154,10 @@ properties:
>>>             - amlogic,meson-gxbb-dwmac
>>>             - amlogic,meson-axg-dwmac
>>>             - amlogic,meson-g12a-dwmac
>>> +          - amlogic,t7-dwmac
>>>       contains:
>>>         enum:
>>> +        - snps,dwmac-4.00
>>>           - snps,dwmac-3.70a
>>>           - snps,dwmac
>>>
>>> -- 
>>> 2.52.0
>>>
>>>

