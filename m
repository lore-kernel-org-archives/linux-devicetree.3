Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C1409610
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506534; cv=none; b=fyPbyAW6Nn+/zy6zQmuwMhsR3WQJlzHSfe/saEzG4YL+x+9LA+K+TFnZMvmieWTnLFZdwJzxLi3D7dHUk3Zph0gCdX8ZBrdBdgoljL8AXP12ztt4gV1xXz+Rtnk1aUKtRiNFwlj8svZ6OZPmkWKXWdu8GOQE8XS8SZe5OvecL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506534; c=relaxed/simple;
	bh=T+YudoEqU0gmjCwLQrrgsNuIsIATGlpgiIivT5AysPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ddk8aj98tr64X+sYq2KHUcQUQtZD8Kb6EsGEvzaL5R7qw+F2CRJ0gwaSor5yvj0vDSOjVG/VgkfkNBZMqKaociXvodFBO1BDIVl8vphw8aGdXDlDRE4iGZ+UEtHiEoSOITI4KltL2V+pAnByi057N7uWqHrrpQ4+bcyOD4bTWmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yCd7Wac0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yCd7Wac0"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-399c1225f22so127071fa.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783506528; x=1784111328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xHPnRrFIoOTHJ0es5XHY5x8jGBMXqt/1gGu6E0UmX+s=;
        b=yCd7Wac0Cg6Ji+PrbRua4XqGttMDamrIUcGwlNipvN9PayLsMGXI8VpbCgJUO4ygk0
         oKO2aCWeNx4OeMIaGCyiO/hP0vQ5O5lkUL8iq8tOGwML5FMHyKR2Acc8uKV+5zqAS4Hn
         0EyvFC9dU94vNbcteREPOITaZw97H1stdcK6j/QjtKh1zH1AQYKdPzs89dyHH8PpY5hR
         xuXO5fzxENiHu3ABFM9RmMJ44CTMENRxbsEErXtkubnCPyGX5UOYszLW1eh86+qJsKlK
         RtAkJeHwBuWbEd0r7vJcmYsdROiUoEnG9gO4oT61/7gdHCW/482goXiLnJYWhZHtO54x
         wYQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506528; x=1784111328;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xHPnRrFIoOTHJ0es5XHY5x8jGBMXqt/1gGu6E0UmX+s=;
        b=juSoO8YyvTAkUwja71a8LY8FurJLgNrXOCEwZ8BN3iUpTnaGcHMx4E92I6xjyYOl48
         UQOp12m4vhIlZ/cXYGrjaP8SKRnOx/aj9qqmIi183wTnGse5gwnP87D3xSJI2kysJOVS
         F4jI5lu1TqVUn7EC4loaU5Nhjyum6J26eITvNjSUaKnKMUlTO95IPKv2qMFSogoYdifg
         xo74TJitkdji/i92lKga0PxDBeK28US92UaM0UpBwME5ec5vrC17LZdbyxWb2mMcIxGY
         +YLb2O+rRXyECTxSLWlxfeXyoxE3rnmMK1hvxq58ZiTobpdEh4PbhQcWUgFqDrgGlETH
         bL8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq7wWd14xs80xVzS6dzzHvh2uETuQR3sruz/YHCmn7/IN+UtLyVmfFZn++I0bw/Z4otHZJ6rHTVBBEk@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbdH51nLy87GnKMlq7a1sC05Q5nXQHWSAAYR1vyrRY4C61ICn
	tNrfn6VfRSJ7ukUUqWLOV8kljdFCCuT6jFHvq+PioRQt2N8LlTKmKMInwm7YF/nIh4A=
X-Gm-Gg: AfdE7ckZarKYVkkLLXRVASW6tCB9fOGVnEP8Mjgz9mzHF4FLs9CLEnUJdLEjeOpDX3z
	y8PCvRiuspkqhfpJObMwuz1HbVpXcInvtEengautCQdFW9LpHp0fzTwtSOwDYcFQQweNuhLQb8L
	2rcnlLEERBekYz9n83MtYt2Gbx/OPf5jLBFldUlSEKze0X6OHzXN/Bs9kqxlVcf0EHckguoEBzm
	8p0eNoSHlCEXBPHgisAIZjSlByjISRvJ/NZ6Qv3x/EcEj8UUhdcaLLOTwWwvfDPJy8XoSb8uWVj
	hZymPVJ2j4frNxlZj0af4+w9jfprH+dR96eoYVaGTlYrUVt4t42XZD/w/0kL0iuJsJG3dSNNLqw
	pQvKKkaOmYn9UGpAdAjR3ucT5j8E47qlLK9iukXH7jLHTuT3Z5vTZGTZGc9b0cH2IoOz4K8g5s0
	gMozHkcPR3d089Bzd7JZposdINdHRp79JCKIndgICB+l6jCLXMof3/b2uXHRadLsaBKLrCjyJtU
	JtESg==
X-Received: by 2002:a05:651c:1473:b0:39c:754f:eaf1 with SMTP id 38308e7fff4ca-39c796f1452mr2908571fa.2.1783506528197;
        Wed, 08 Jul 2026 03:28:48 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ad1bdbasm34252791fa.5.2026.07.08.03.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:28:47 -0700 (PDT)
Message-ID: <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
Date: Wed, 8 Jul 2026 13:28:46 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gjorgji.

On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad,
> 
> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>> Hi Gjorgji.
>>
>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>> Hi Vlad,
>>>
>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>> <snip>
>>>>>
>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>> QCOM_ICC_TAG_ALWAYS
>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>> QCOM_ICC_TAG_ALWAYS
>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>> +            interconnect-names = "cpu-cfg",
>>>>> +                                 "hf-mnoc",
>>>>> +                                 "sf-mnoc";
>>>>
>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>> the device node, they are found and should be allocated on parent's side.
>>>
>>> The interconnect has functionality to handle bw requests from different
>>> clients.
>>>
>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>> to vote
>>>
>>> on that (actually it is possible in icc framework) but what is the
>>> benefit of moving
>>>
>>> those to camss? Is it not better to create camss icc. I understand
>>> you want them to be on parent side. But how to vote on bw? Most of the
>>> time it
>>
>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>> at this point of discussion.
> I agree but there should be an API for icc voting which Jpeg need to use,
> currently it is fixed to some values, but voting need to become dynamic
> at some point of time, because it depends on runtime parameters, resolution
> format etc.>

Sure, but I believe it's quite clear that any software implementation
should be discussed only when the hardware description is fixed.

>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>> could be considered as a "bus" device) to this new JPEG encoder device
>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>> get hardware descriptions as children device tree nodes of CAMSS parent
>> device tree node naturally.
> I agree the device tree is best to represent real hw topology. >

Well, it's not just the best, it's the only possible way.

>> Copying of the same identical information about clocks, interconnects
>> and power domains from the hierarchical parent device to children devices
>> is not needed, and practically it only lowers signal-to-noise ratio.
> Here also i tend to agree.>
>> Since information about the actual defect in hardware description is
>> reported, the problem can and should be avoided, the handling of a better
>> hardware description and dealing with any kind of complexity will be done
>> in the CAMSS and/or CAMSS children drivers.
>>
>> If you need to get a bit more formal point of view on the matter, I'd
>> prefer to see descriptions of hardware properties organised in a tree
>> topology rather than in the originally proposed star topology. By doing
>> it the system complexity is reduced from N to 1.
> 
> Maybe I'm missing the whole picture of your proposal, but I want to add my
> point of view on this matter.
> 
> The JPEG encoder HW block has no dependency on the other processing HW
> blocks in the camera subsystem
> 
> It shares resources like camnoc, clocks, GDSC, etc.,
> but does not share anything with the other HW processing blocks. For me,
> the JPEG driver should not have SW architectural dependencies on CAMSS.

To move forward there should be a clear answer to a simple question,
does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?

If no, then JPEG encoder device tree node shall be located outside of
CAMSS device tree node, all resources needed for JPEG encoder device
operation get their descrition in this stand-alone device tree node.

If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
device tree node, and only resources specific to JPEG encoder device
are described in its device tree node, because other resources are
already described in the parent device tree node.

> The shared resources within the camera subsystem are reference-counted,
> the only exception is clock rates, which are set based on the last set_rate
> call — but I think that could be handled by migrating the clocks to be
> represented as an icc-clk provider, to keep the higher clock and maintain
> the needed policy.
> 
> What I think would be best (just a proposal) is to introduce a new camera-icc
> provider that handles all these resources — camera operates on bandwidth
> anyway, and rate calculations should be done in icc, since the  infrastructure
> for that already exists in the icc framework. But I think this has already been
> discussed with Atanas, so maybe there's no need to go over it again.
> 
> I'm not sure how to move forward with the JPEG encoder changes.

First of all it should get a reviewed dt binding documentation, let's
do it, and a software implementation will follow the agreement.

> I see two different proposals:
> 1. Independent sub-nodes (Bryan's direction) — I honestly like this one more.
> 2. CAMSS handling the resources currently managed by the other frameworks.
> There are good arguments for this too.
> 
> Bryan, as maintainer, can you say which direction to post next? :-)
> 

Here device tree bindings maintainers should share their view, if
hardware properties should be literally repeated in each child device
tree node and their parent device node (star topology, N copies one
for each child), or not (tree topology, 1 copy in parent's node),
this is a generic question.

-- 
Best wishes,
Vladimir
