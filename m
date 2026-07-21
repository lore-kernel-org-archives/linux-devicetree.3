Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35F37E5EF
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631963; cv=none; b=r1wUYaKHEfYdfdpwPMsj0uXAI9n9+eZqBzC0AN9fLcWXzBKsc725eqpT+w+s/5MCb1GbgbpJ6DdPNWQI+PPAxm4fSTOmcSpbkNsITz7mJEfEYkAe6fvf8+vmOgwnZTXq5BPxoiu64UuJp8jkCKDkEPRm5Vu1Oj6IKw1GzJY4kIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631963; c=relaxed/simple;
	bh=xjYkyUsu349AxyVLrKdfzTXC3nR9Rea/HEVXbtA+EWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6yKXlVv/w8HK4bNXI5jz3gCWa7tQCgRxs7qXeRcVuN8c6nxrB1hdTk9jTfZQ44Jo/GvyMqYECW+Y5ID+OAYlKr+L4HuRdgYgSYPMH5f2JE1Z4Ug4R4/R3J9HyFlflJf0Zj5AKBLYfdApfVpcmDHfvtf+jVBiEHS/2z/VPf3p3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N5KL0Fl2; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5KL0Fl2"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39ee7746fedso953461fa.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784631959; x=1785236759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=daaEWwYjuzuJkBkBAdQ53LZVOTQeD5CURewSiZvT43s=;
        b=N5KL0Fl2MPKVA4eKXryoSByvxyTumAiv2cJzIFNDTUhOONXm7WPxzq43iNq1D3oroR
         tHPxDHo+BPgYPG//wY0nqVH6fMV5YC1Vv7NWnZIwjcPnp8OD7QcosvqST6qDxUmeUDgk
         jJAD3DFmnXaVPb7WAl6P4Yd4VXV7sd3C3v+2HjEcBS7fsox7Mp1dkME0fN0zGlu2xKWy
         CC/JSIbBW6Q5oC1pmtJsVpsSdbDkPOuBrTlqj/RrnF2Ror+oe3j3iQ1tJdcdqERpukUk
         k9jcahBzgJd2iylikmcs/3rQwUmAsS2JXNh550k+olrqdJpOiORVs+GDk+nz8vlESqzt
         P4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631959; x=1785236759;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daaEWwYjuzuJkBkBAdQ53LZVOTQeD5CURewSiZvT43s=;
        b=kksAFW6ntRl34EczHQtOKxe8pYCaADbG3kG3iBT/gF2uNLqu3T4XIOYOaY6Jl+ph3W
         dHxGXlOYiPBxXz9d7R3jgrYT0c1MGjVg8ys+7HxX6/Y3otiyf7i14+nX+Af34QzPltVL
         FNHYtYnTxcGxYFDRvOKRCvx1/TgPSx55Q4hsJvWrDz+0Bq2z4yN8Bzzy7XPJYMjP8wwx
         Md9BGcsWH6ePu25C22zTHpskqw6i6fsaooTiXQ/ofSDRFhFk32fvE6ciWPGuol5MXcbr
         pWwpTJ+uU7pXPZOlFjx7vYUXMV+YQpBBSgJ4e6kePj1b2moIKvLU7r3SNmEK+GYkthWn
         bY0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoJgc+JlzNps8OxvI7/bxyDotNv+DHbEkfwnrrNrdVHWLFX5u744UVlDgBl0WPIurWtW++eH5S3URni@vger.kernel.org
X-Gm-Message-State: AOJu0YzL2LuTsOi1nZ7AiApXYyGopgR0xCkRqRDzzCFYv8SbqN2P42bF
	QDn2m5XdQ26V8ytZUsmsif6hzcSFghYrCk+L1PHLU84n6RG6NsWVWE1Iw22gg4o+DiM=
X-Gm-Gg: AR+sD1311YSv7DEMrvh+BdMRKgw7mnfFva+e70o7U41y3BOCn5AELOTLVV035pwwE8T
	YGjS6kUHbxugcIqTU5bgmrzYXzJbiGloQ3nA3xW8jC8gr58aqzESkLvFnFM5otU27Mv4itbI8iB
	kdU+Ps3X7eZqeSWVuqrpbA2WRv5oNyP36jWz2z1GPqamHDMbmyEESQO4wtQxYkUqoI8v1omOEPL
	iokVgT0m1lp6nBobDzHC2ASWbz6cWrd1J72yPmPlvpFck6Pc0XlIrVWZHfXWNcgFbw0ddJfB6ws
	iw8qSO3PbX87fgTYD0f+R/BZNzTRnDeDwwcoTi6BljP/BCwPGKbZdsum4ol1RnwL7J6X40UP3wE
	EszUOJ4UN1cBhqeQDaYUsBkNnNqqte9QqbyCpa48DCWLEUM6jdjMa17kG9W1ybLH5at6nJ9lGp4
	jCxdoKiEWhj//IEaW9zky6Xz4RUDUDAfJJoDmTMCyTeBe3qJtOEhwwEEch
X-Received: by 2002:a05:6512:a81:b0:5b0:ceb3:1179 with SMTP id 2adb3069b0e04-5b2a4a98fb7mr360657e87.8.1784631959199;
        Tue, 21 Jul 2026 04:05:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d981c4sm2879201e87.20.2026.07.21.04.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:05:58 -0700 (PDT)
Message-ID: <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
Date: Tue, 21 Jul 2026 14:05:58 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 13:47, Bryan O'Donoghue wrote:
> On 21/07/2026 10:56, Vladimir Zapolskiy wrote:
>> On 7/21/26 12:39, Bryan O'Donoghue wrote:
>>> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>>>> +  "#phy-cells":
>>>>> +    const: 1
>>>>> +    description:
>>>>> +      The single cell specifies the PHY operating mode.
>>>> This has been reported before, #phy-cells shall be 0, the operation
>>>> mode is selected by bus-type of endpoints as it is described in
>>>> video-interfaces.yaml
>>>>
>>>> Two competing values are redundant and it opens a door to a wrong
>>>> hardware description, the technical discussion has not been started yet.
>>> So as I said before, I'm following Rob Herring's input on this and
>>> Krzysztof has given RB for this binding. At this stage, I don't see
>>> scope to change it.
>>>
>>> Adding endpoints was already a compromise to address your feedback,
>>> which I hoped would bring you on board with the design.
>> That's my comment dated March 27, 2026, and it says moving phy type
>> from phy cell to the endpoint property excludes the need to set any
>> phy cells:
>>
>> https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-
>> b2bc-1351be62b806@linaro.org/
>>
>> The technical comment is left unresponded so far since then.
>>
>> Since there is no expected phy cells to get on consumer's side, and
>> since there is another link between CSIPHY and CSID described in
>> video-interfaces.yaml, any kind of dependency of this IP on phy can
>> be just removed, which serves the purpose of hardware description
>> simplification.
> 
> Rob's v1 feedback was consumer-decides-mode via the cell; Krzysztof has
> R-b'd the binding with cells=1.

Unfortunately this is not a technical discussion to move forward
a better hardware description.

> I'm happy to lock down this binding as-is on that basis.
> 
> Are you arguing about phy-cells or are you actually arguing the entire
> instantiation of Qualcomm MIPI CSI2 as a standalone generic driver in
> drivers/phy ? Its not the same debate at all.

So far I don't review the driver, only CSIPHY IP hardware description.

In the current version of the hardware description one may find that
the exploited 'video-intefaces' interface completely covers the 'phys'
interface between CSIPHY and CSID, quite probably both are not needed
at the same time, and the simpler 'phys' can be removed without any
losses. But if it is kept, then its cell value is anyway redundant.

> As the CAMSS maintainer, I'm fully against adding more inline monolithic
> CSIPHY init sequences. That could be represented as a separate
> linux-media driver but, then that implies that _all_ upstream CSIPHY
> drivers in drivers/phy are wrong, and I just don't accept that.

Other two drivers are different and should be excluded as good
references, both of them links exactly one sensor to exactly one
CSI-2 decoder, it's not the case here. Also one of these two drivers
has no upstream users.

> The bindings have DT maintainer RB, and the driver has Qcom engineer
> tested-by, review-by.
> 
> Vinod, Kishon - Again, I'd request this merges as-is.
> 

-- 
Best wishes,
Vladimir
