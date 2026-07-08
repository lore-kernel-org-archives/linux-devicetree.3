Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18BA42DA37
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527912; cv=none; b=F/h/1xI1XPQEDzH479vNC/n4KieeeECyKo5bz/rxbKepSI6IuJqGBEGTq+qZWxsH+agaOVo+P7Pq+opybA+bL2daSf5CgZhZhRPSTkK55u1nhf4tjr9DEDM2E85iPfNJcyA/l7JnO9xPmY0CAR9BfedZ7N5XAO+TyvBoojjnpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527912; c=relaxed/simple;
	bh=Y9gAqWT8nIFFmj8ROh62A1gTksGLsatZQYucfa6/WeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1IsnD0mAptaEjG3jNrqhP1t/QLGmOpd8G/yj3ZhMG9dmrDmighhdfMMqVLfyQjIKR2YnTsT84o2qcYDIOTFa25OjH0eZU2bXOAsATYbpf0Ic5UTM1iR+DI6ACD6kH9T0RwqdodeXHBbIjTdIf2QJbDn4fKGPMl3g+ou6ZWsHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UB3gY70u; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UB3gY70u"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb40ebefbso239410e87.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783527909; x=1784132709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bI8bxULPVuuKF+NUa/BzsFjIzfQczSe5b/Q97O2fZ7A=;
        b=UB3gY70uk9ZjUH4FiwDjQsMlA58EQjAGZ6qIRj828FHRVlNFpcr1r9kLNtTibMzKvW
         ktZsy9sMIUmFFnM/PucPZoR2A4RIXwy7WRe2iNPKKGZNdpEJ2zgWzdmW45IWUVB9z6Xl
         8z5ssKXJ84udw67U2oB5mB1d1jfg9sZDFGKspNHw59nZLDxVVpDjByaxN6H7dyTrOQ6p
         +GcOoc+v7+yROvREMcs3h7AQZ+lxD8yTynGTFnkx4Naqsp6B872HPQ1tj5QiEhzzZJol
         j4x4vZsz7zQ2QVU0E8vHtXG07eap5wehHYLwygxm4vYzqM0lRgUMuT0Qqsg1GkK9ozV5
         ot2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783527909; x=1784132709;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bI8bxULPVuuKF+NUa/BzsFjIzfQczSe5b/Q97O2fZ7A=;
        b=SVzyG3KO15LQJHY8UZU9eFa+F/YKVo6IT9OaxKj/65mWahqrPOhEisrdwI9QIWImkC
         ZVdw78R41DO1Nk0DbatmaGqzTlvdz+iPpNgkShhJEqBFPZSBARFFd2BqNg/Ea16TOAFe
         ewzRNkCAnuzUUaG6TjexdNgkSR38BXkDSbWYkOYogDfSssibX7rwwA7QlNrDkm1E2AM4
         gAyfgFak4x+Czp1ACeT1edlxiwSqYCyulm3niOBm/M8j22+26slp03jEnYx0mDbn0+ga
         Nr0ndz5UHhvo8vIELgafYkW7FN1XxxGExJJF+bAZ3wxwsOTNEBauUv/uzlrIpabUEPes
         HnFw==
X-Forwarded-Encrypted: i=1; AHgh+RoJ2Gnlfdi0JXimAoX48SAiNxhQSAQMxkeLwunbtOTTu2+joqxgbC8G+T3TAHFfdOnd2HBl3mQJC8BR@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJ8C30lZey9CYNUqAk4Lc1ihPCvI/eB7ynCWfTfhc/F6zH4nT
	ziLPA4ZdhRnJV7sqavl7mosbPAmG9wb6FjicdR7+vSZ5tzDVCUWsyzqOYY6Ns2N140I=
X-Gm-Gg: AfdE7cmjHJF06aMujKDOwuM5k1Kp3pgc0Un1jW6+6GS33L1Mjq2Y4SKa6qulpX/SDZG
	HWHFuchATJJ5e9k+bgfSn04kHo/SRDZfC7TWiYqLWo9/OOJsN16r1KI2wZT4QTfxS/DCkPpVaxy
	M066NHiCRhbJYAunO0BuM7YmCWFHEw+FGnUx6zV7bbxqQnDzxmOQJ+lY6TtxNfp5YxjPAp29mHS
	PqbC+F7pPQm9AfRno9q2dGnsBBjAdTYZv6uVHtjVilS2h8l8Jl8MGyVvXAAVcr+H6FQyBuI3gIh
	i1recQjbf6t28V3sicXzatKCzeJvZczR2L5nagX2ox3842DkLkijRnvHMmUBXNwTUuIiquX26LI
	VN28AFvmk81P1P4MQlMwa+N3GL5u3vZr2JGJu6YHJehOzNd/4yy7hBn1w3t0Va6FBbB4GH+blGU
	kH13ACKUsnclQe2s1/FBbdztOKLr+6zPIL2H84M3zXEwAVBeODIARKYxyT93teey092xY=
X-Received: by 2002:a05:6512:1292:b0:5ae:cfd3:4753 with SMTP id 2adb3069b0e04-5b01145a409mr457052e87.3.1783527908746;
        Wed, 08 Jul 2026 09:25:08 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377096sm4537514e87.25.2026.07.08.09.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 09:25:08 -0700 (PDT)
Message-ID: <9af2a2b7-1aa2-49b9-bdd1-1ab37cce91ea@linaro.org>
Date: Wed, 8 Jul 2026 19:25:07 +0300
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
 loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-6-atanas.filipov@oss.qualcomm.com>
 <51a0abf2-2a72-4551-894b-2c2de91ba0c2@linaro.org>
 <74a5b549-987c-4dac-a1a0-ff81150cd6ab@oss.qualcomm.com>
 <56f1fd7e-42bc-4034-81dc-302cb7c22951@linaro.org>
 <dd34b44d-396e-4267-b383-e4f8d20f8ef4@oss.qualcomm.com>
 <fffc51f1-9137-4951-b9b8-9f7f263c7878@linaro.org>
 <wwk4nyczcecnllwivqd2lgnbpzboumtwigk3vmundsvgqtqpy7@duq6zdulc7sc>
 <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
 <0e9de1c7-2e39-463f-b4db-f228f37a8a13@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0e9de1c7-2e39-463f-b4db-f228f37a8a13@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/8/26 18:44, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Vlad, Dmitry
> 
> On 7/8/2026 3:01 PM, Vladimir Zapolskiy wrote:
>> On 7/8/26 14:35, Dmitry Baryshkov wrote:
>>> On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
>>>> Hi Gjorgji.
>>>>
>>>> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
>>>>> Hi Vlad,
>>>>>
>>>>> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>>>>>> Hi Gjorgji.
>>>>>>
>>>>>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>>>>>> Hi Vlad,
>>>>>>>
>>>>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>>>>> <snip>
>>>>>>>>>
>>>>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>>>>> +                                 "hf-mnoc",
>>>>>>>>> +                                 "sf-mnoc";
>>>>>>>>
>>>>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>>>>> the device node, they are found and should be allocated on parent's side.
>>>>>>>
>>>>>>> The interconnect has functionality to handle bw requests from different
>>>>>>> clients.
>>>>>>>
>>>>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>>>>>> to vote
>>>>>>>
>>>>>>> on that (actually it is possible in icc framework) but what is the
>>>>>>> benefit of moving
>>>>>>>
>>>>>>> those to camss? Is it not better to create camss icc. I understand
>>>>>>> you want them to be on parent side. But how to vote on bw? Most of the
>>>>>>> time it
>>>>>>
>>>>>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>>>>>> at this point of discussion.
>>>>> I agree but there should be an API for icc voting which Jpeg need to use,
>>>>> currently it is fixed to some values, but voting need to become dynamic
>>>>> at some point of time, because it depends on runtime parameters, resolution
>>>>> format etc.>
>>>>
>>>> Sure, but I believe it's quite clear that any software implementation
>>>> should be discussed only when the hardware description is fixed.
>>>>
>>>>>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>>>>>> could be considered as a "bus" device) to this new JPEG encoder device
>>>>>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>>>>>> get hardware descriptions as children device tree nodes of CAMSS parent
>>>>>> device tree node naturally.
>>>>> I agree the device tree is best to represent real hw topology. >
>>>>
>>>> Well, it's not just the best, it's the only possible way.
>>>>
>>>>>> Copying of the same identical information about clocks, interconnects
>>>>>> and power domains from the hierarchical parent device to children devices
>>>>>> is not needed, and practically it only lowers signal-to-noise ratio.
>>>>> Here also i tend to agree.>
>>>>>> Since information about the actual defect in hardware description is
>>>>>> reported, the problem can and should be avoided, the handling of a better
>>>>>> hardware description and dealing with any kind of complexity will be done
>>>>>> in the CAMSS and/or CAMSS children drivers.
>>>>>>
>>>>>> If you need to get a bit more formal point of view on the matter, I'd
>>>>>> prefer to see descriptions of hardware properties organised in a tree
>>>>>> topology rather than in the originally proposed star topology. By doing
>>>>>> it the system complexity is reduced from N to 1.
>>>>>
>>>>> Maybe I'm missing the whole picture of your proposal, but I want to add my
>>>>> point of view on this matter.
>>>>>
>>>>> The JPEG encoder HW block has no dependency on the other processing HW
>>>>> blocks in the camera subsystem
>>>>>
>>>>> It shares resources like camnoc, clocks, GDSC, etc.,
>>>>> but does not share anything with the other HW processing blocks. For me,
>>>>> the JPEG driver should not have SW architectural dependencies on CAMSS.
>>>>
>>>> To move forward there should be a clear answer to a simple question,
>>>> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
>>>>
>>>> If no, then JPEG encoder device tree node shall be located outside of
>>>> CAMSS device tree node, all resources needed for JPEG encoder device
>>>> operation get their descrition in this stand-alone device tree node.
>>>>
>>>> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
>>>> device tree node, and only resources specific to JPEG encoder device
>>>> are described in its device tree node, because other resources are
>>>> already described in the parent device tree node.
>>>
>>> 2c from my side (for both sides of the discussion). Please keep it
>>> separate, if the block simply uses the resource which is also used by
>>> the parent (e.g. there are no special requirements on the AHB or sleep
>>> clocks) or if the device needs to actuall cast a vote on a particular
>>> resource (e.g. for this to function at this performance level, the MMCX
>>> needs to be at the turbo level OR for this to function at this
>>> performance level it will use 123 MHz of the AXI clock). In the latter
>>> case the resources must be described as a part of the device.
>>>
>>
>> Even this "description as a part of the device" might be not quite
>> necessary in whole, let me try to explain.
>>
>> No doubts resource usage policies specific to a child device should
>> be naturally described in child device tree node, and it's applicable
>> to any kind of hardware policies (like opp tables etc.), but a list
>> of needed hardware resources still can be obtained (also by a driver)
>> from the parent, whenever it is found applicable and unambiguous.
> 
> If that is the intention than that can be done without significant
> changes in the jpeg driver.
>

I won't expect any complexity on driver's side, but firstly it would make
sense to get to the agreement how to describe hardware in a proper way.

So far I haven't seen any technical objections to the approach I promote,
and since it gives complete and simpler hardware description, it might be
preferred over anything else, it's still under discussion though.

>> This is to separate planes of hardware dependencies and policies/controls
>> needed for hardware usage.
> 
> Currently JPEG is part of the "camera peripheral block and support" (CPAS) in
> the "camera subsystem" (CAMSS), CCI is there as well. Then maybe we should move
> i2c-qcom-cci into CAMSS. Note that CCI can be used without CAMSS, and it can be
> used for some I2C peripheral devices which are not camera-related.

Pracical usage of CCI does not define its exact placement (grouping)
on the SoC.

> Also, to reflect the exact HW configuration, maybe we need a CPAS sub-node.
> 
> One point of view: in the hardware configuration there are no dedicated
> camera subsystem block (CAMSS) registers (based on my knowledge).
> Those are a group of HW blocks belonging to the camera subsystem which share
> some resources, including camnoc, clocks, GDSC, etc.

There is a number of dt bindings which introduce "Camera Subsystem" term,
see qcom,x1e80100-camss.yaml or qcom,sm8250-camss.yaml etc. Whatever it
is, and if there is a justification for such device tree binding to exist,
it sounds it should be rationally and prudently exploited, for instance
this node already holds phandles to "shared resources", this cannot be
removed, but fortunately it can be reused.

> So, based on Vlad's proposal, the changes in the different drivers will just
> be about where they take some resources from (parent device) or the current
> device — so the changes in the drivers will not be significant.
> 

I hope so, and my anticipation is that dt bindings will become simpler.
If one day it becomes obvious that the properties I vote for removal are
utterly needed, they can be added without breaking dtb to kernel ABI.

-- 
Best wishes,
Vladimir
