Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1AE3F12E1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525500; cv=none; b=uvT3+FaZJ+l0hj7OVaYfSc706pjlYXX7+jQIzz/y5HDdNarc9CDURsaVX7UyIRY81xbOayRyrLzEsAR8JXVyop9lNWJJkVSBiId1jAXeHXvg0lruf7RPQ5yc2dcTFlS8tJmaTXgA92NZkC6B/mNwZ6dn8DqUYKc96S7pvl6EvRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525500; c=relaxed/simple;
	bh=bUSLiGRQFh0ghEbicPP7GtlWPZsKF3rpw03IA3Tz9aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eUf1dRgR6xxtvxTtamsWWCllUDnAkPHt3Q/6HEcTmQEiQ1C+YL1PqS2ljbJa2VldgkqnE07Zi49z10F9999AYheRfkbW+nNrD7UgZw5pH+9r6ibjdzPKUEHbqdqKPuK4fZkS1258/dUVTU/+masaF7DtoNd5BcAEp8TUhheAqeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZXj8jRw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrmmXWZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZXj8jRw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FrmmXWZZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3C512791774
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 15:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=; b=DZXj8jRwtKhmSvmQ
	NoUcfZ9TjjbiWd29t6o5uU/JxIupxagsRtrQFqH/jbM1WmC8Q3nB6mREBB2151rK
	HsuZo6zcZdEL977T/7kFIC7f3On8Lwg4o1egngp+jSJr3YsqM2NZdDsEb31orvyu
	CLfYiF/MkV9TCy2bP4ZEnpsFxKoMdmKXSwD1qfwO+dL3vhhGcw/4laysvDRyqEmd
	8dQ+Nq+8y3Ra9Jo7onR5iyxxJqwGE1KqQgz9xKUMbj9M54Wm87Z+9iZOtZdh/Qr1
	84wQy4EvnbZ96Swg50Mwbyy3qxSevFq+ozRquet/RipvU039chn2sYyeOVuNKd/e
	BJzIuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9cswb8wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 15:44:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so91553985a.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525497; x=1784130297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=FrmmXWZZlNW+hhUOXhcIlFsDpELx+Xwox0hRUOeY6xf09Ubm1YqfIaCe/G+cUt1jbr
         jAFKY6+iX40QRp4YUHtLDBL9cSD1cRerPiEVLgUPZZZLiHuurJqJ/VjyScTqsuNN6q+q
         2v1TVDIJzNq9gp/gVCejJiB6HdCogLFQ/8VHxBjDhE0HCkuv3w0rvdTQF029F+TrNqas
         gZ4ODAHWDGG4gLGdIRSOZ9uumyfh5dhqBwW1/IubvdMAn1t1Yzje+zIMT/Td969HIyHU
         heJNO9Js1b/HwiYaC1Wa5k+ppRUJfdu7NK5a+YG/Hin2LMaR9a5iVqAGdGuRWPXI1v9d
         R1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525497; x=1784130297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaAPWEY/g4XNfXsTs3KtueADcs7Yb9r7IABv5t6GF4c=;
        b=gGFkkuekWX/I6tpOwAsor+u9ocyj6oaUWFjoO80yg7LOwPQGoH2b2RpJOKk0uOjbR5
         ugzwb2IaU4hIj8S5lOUKQWTpemU2ocKmv4tdglNfcUaOFAMkG4EtG81aBaHKXr9gZ+SY
         P0USza9SPt+FvCQMJ2GtwFBIDNyaQsC0dq8GdsKXMG4BS3UAsw3RDziS/9CcWq22QEf5
         TU52rRTC77zv2sOtvFoKNn9VirRqGiBTf24mUpCYhcbC4g/BFspNezvnY5f7aIpK58TE
         o3TneU7NcnbnwUN/kma+7QJZ/zJNgCXPPIzchxI1Rs2cJni4tcJmW/v7fwrT14zfnFRY
         sZ5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYVcQEBrBZ609OauE0rf0ovGQlShZV/MJgOScBxAJbipPxyI4wZgaOtELJgzQSF6bxKw+5K+SEG4C8@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGkdg6T9mRgn9ESZr0qeDwWgdRV5juJSjXZKtZzBmPcRKDDJV
	KgPQctaGL5XIwSGX3R/wiXajx1oT+1UrqobYVkZUAlBUPVltYdMmrTICBxOxAb1APfH1Vm4m56Q
	+XG5dcjoOf3b1dUroCgFonMxOadq61aeigtwBNeHEU+5ITAGS4TFmUiJMLpUatuYi
X-Gm-Gg: AfdE7cl6+PVJsVsDVw/xVU+WOOsuTM2RhRhv8P4WFnSTQRvZ699zc53cQDfckhxvLWF
	maq0jDvg97J/3WdORyxe/pEZAAOJQYrTxPipjps8yAhqcILX05xig1WrHQa00Uot0MpKOvLgKZu
	gI87nkoY/ddzjFQlc0OeCDmZMCALYSLfqtnkm8z/QIRCPw/ffILA6+nUlFU0HLEPEWeNQkPC3mw
	tg8BIYEfGsU49o+3WZ7BmQoRt/4IrXVVFhA7dj5iWyov/NkD3Pk3MwaZEtp6d5bU//DUDUF+1lw
	gybtj+1XRuMWkKU/+0ED/MOBSkfVvi+KaaJDlRNe5zagDZMJdnX+OhRTnWUdDfXFiujWh8S8aPI
	Ug4as1NvdAkkj6j1L0vVJJqU3tNxexTEBOyiD/W53TJDylEBI6nsS6inc70IWpOfZNpicaUigQm
	ekDw5Wc5E=
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31842471cf.52.1783525496610;
        Wed, 08 Jul 2026 08:44:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4890:b0:50d:db76:55cd with SMTP id d75a77b69052e-51c8b5492f0mr31841671cf.52.1783525495521;
        Wed, 08 Jul 2026 08:44:55 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9ea0asm7782436a12.22.2026.07.08.08.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:44:54 -0700 (PDT)
Message-ID: <0e9de1c7-2e39-463f-b4db-f228f37a8a13@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 18:44:51 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <74608907-dc8a-42c5-b188-0bdb08d6be77@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8oc-2UXkeIGZ4dZn88R9RTqm9IcGxc_3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX50Kl/Vc94p2U
 Dbn50xK0WA4z1Z84GLovAnB5udPMqpKHdfKGf5twwDUDlAN//abqtSncYKZIaw4QLqOhON71nCs
 Gfb/m3ABN260osrZGcqTGGL/g9azUhY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfXxGhPW9YV1Wnk
 T5qZJNiQud86PnDTCQ9lK3Q28Zt4A1tkldWKZ79CFnIfpI+2rYB8ld6fd+bCGZZcn7uQE/qmJ2M
 3y8awmWmo4gdju5fKbR90vz+xFbr4KgRGs5Ji9PvATzXEhbGP4muHD88qX5JPzX0rq3M31GMrLh
 n3atPXEadgT15KskCoC8UC1uxKpNq6rQSInXgwZxtGIixuIdWNzxO9cw5PaodXkQjSMBS7VT29o
 m3bhgPt8sPq1kPv6HxNwtgm9VZmrxpD4Cg5b3Pm2iTX9QjLDtEd+VUQOCV17hh0fNCKhPq7C77x
 Gmt5jlfckGI7S3vzsB4kJCdezzDGJj5jn0ksaQzyAP+SuQ25mHDcsND1lkjNAFeRyOW5Zlb+dHK
 bmvzUu6jjZRiw2wLno9lvltokreu3J5Y72sm7RvqgvLzkeyFG66rGTqJCSTsWp7dBxzmvhSKbUn
 E/TCEeyAJHomvniQzMQ==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e7079 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=HRVC3C84EGBQM4B1i-YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 8oc-2UXkeIGZ4dZn88R9RTqm9IcGxc_3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080155

Hi Vlad, Dmitry

On 7/8/2026 3:01 PM, Vladimir Zapolskiy wrote:
> On 7/8/26 14:35, Dmitry Baryshkov wrote:
>> On Wed, Jul 08, 2026 at 01:28:46PM +0300, Vladimir Zapolskiy wrote:
>>> Hi Gjorgji.
>>>
>>> On 7/8/26 12:32, Gjorgji Rosikopulos (Consultant) wrote:
>>>> Hi Vlad,
>>>>
>>>> On 7/8/2026 11:47 AM, Vladimir Zapolskiy wrote:
>>>>> Hi Gjorgji.
>>>>>
>>>>> On 7/7/26 16:24, Gjorgji Rosikopulos (Consultant) wrote:
>>>>>> Hi Vlad,
>>>>>>
>>>>>> On 7/6/2026 10:46 AM, Vladimir Zapolskiy wrote:
>>>>>> <snip>
>>>>>>>>
>>>>>>>> +            interconnects = <&gem_noc MASTER_AMPSS_M0
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY
>>>>>>>> +                             &config_noc SLAVE_CAMERA_CFG
>>>>>>>> QCOM_ICC_TAG_ACTIVE_ONLY>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_HF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>,
>>>>>>>> +                            <&mmss_noc MASTER_CAMNOC_SF
>>>>>>>> QCOM_ICC_TAG_ALWAYS
>>>>>>>> +                             &mc_virt SLAVE_EBI_CH0
>>>>>>>> QCOM_ICC_TAG_ALWAYS>;
>>>>>>>> +            interconnect-names = "cpu-cfg",
>>>>>>>> +                                 "hf-mnoc",
>>>>>>>> +                                 "sf-mnoc";
>>>>>>>
>>>>>>> This is the topic, which may raise a disagreement, but I'll repeat my
>>>>>>> position about the need to remove all "CAMSS bus" specific resources from
>>>>>>> the device node, they are found and should be allocated on parent's side.
>>>>>>
>>>>>> The interconnect has functionality to handle bw requests from different
>>>>>> clients.
>>>>>>
>>>>>> Yes the best will be to have camss interconnect, so jpeg and other hw's
>>>>>> to vote
>>>>>>
>>>>>> on that (actually it is possible in icc framework) but what is the
>>>>>> benefit of moving
>>>>>>
>>>>>> those to camss? Is it not better to create camss icc. I understand
>>>>>> you want them to be on parent side. But how to vote on bw? Most of the
>>>>>> time it
>>>>>
>>>>> Let's concentrate on hardware bindings description, no APIs, votes etc.
>>>>> at this point of discussion.
>>>> I agree but there should be an API for icc voting which Jpeg need to use,
>>>> currently it is fixed to some values, but voting need to become dynamic
>>>> at some point of time, because it depends on runtime parameters, resolution
>>>> format etc.>
>>>
>>> Sure, but I believe it's quite clear that any software implementation
>>> should be discussed only when the hardware description is fixed.
>>>
>>>>> There is SM8250 CAMSS device, which serves as a hierarchical parent (or
>>>>> could be considered as a "bus" device) to this new JPEG encoder device
>>>>> and probably to a number of future IPs under CAMSS. All CAMSS sub-devices
>>>>> get hardware descriptions as children device tree nodes of CAMSS parent
>>>>> device tree node naturally.
>>>> I agree the device tree is best to represent real hw topology. >
>>>
>>> Well, it's not just the best, it's the only possible way.
>>>
>>>>> Copying of the same identical information about clocks, interconnects
>>>>> and power domains from the hierarchical parent device to children devices
>>>>> is not needed, and practically it only lowers signal-to-noise ratio.
>>>> Here also i tend to agree.>
>>>>> Since information about the actual defect in hardware description is
>>>>> reported, the problem can and should be avoided, the handling of a better
>>>>> hardware description and dealing with any kind of complexity will be done
>>>>> in the CAMSS and/or CAMSS children drivers.
>>>>>
>>>>> If you need to get a bit more formal point of view on the matter, I'd
>>>>> prefer to see descriptions of hardware properties organised in a tree
>>>>> topology rather than in the originally proposed star topology. By doing
>>>>> it the system complexity is reduced from N to 1.
>>>>
>>>> Maybe I'm missing the whole picture of your proposal, but I want to add my
>>>> point of view on this matter.
>>>>
>>>> The JPEG encoder HW block has no dependency on the other processing HW
>>>> blocks in the camera subsystem
>>>>
>>>> It shares resources like camnoc, clocks, GDSC, etc.,
>>>> but does not share anything with the other HW processing blocks. For me,
>>>> the JPEG driver should not have SW architectural dependencies on CAMSS.
>>>
>>> To move forward there should be a clear answer to a simple question,
>>> does Qualcomm JPEG encoder IP belong to CAMSS group of devices or not?
>>>
>>> If no, then JPEG encoder device tree node shall be located outside of
>>> CAMSS device tree node, all resources needed for JPEG encoder device
>>> operation get their descrition in this stand-alone device tree node.
>>>
>>> If yes, then JPEG encoder device tree node is a child of CAMSS "bus"
>>> device tree node, and only resources specific to JPEG encoder device
>>> are described in its device tree node, because other resources are
>>> already described in the parent device tree node.
>>
>> 2c from my side (for both sides of the discussion). Please keep it
>> separate, if the block simply uses the resource which is also used by
>> the parent (e.g. there are no special requirements on the AHB or sleep
>> clocks) or if the device needs to actuall cast a vote on a particular
>> resource (e.g. for this to function at this performance level, the MMCX
>> needs to be at the turbo level OR for this to function at this
>> performance level it will use 123 MHz of the AXI clock). In the latter
>> case the resources must be described as a part of the device.
>>
> 
> Even this "description as a part of the device" might be not quite
> necessary in whole, let me try to explain.
> 
> No doubts resource usage policies specific to a child device should
> be naturally described in child device tree node, and it's applicable
> to any kind of hardware policies (like opp tables etc.), but a list
> of needed hardware resources still can be obtained (also by a driver)
> from the parent, whenever it is found applicable and unambiguous.

If that is the intention than that can be done without significant
changes in the jpeg driver.> 
> This is to separate planes of hardware dependencies and policies/controls
> needed for hardware usage.

Currently JPEG is part of the "camera peripheral block and support" (CPAS) in
the "camera subsystem" (CAMSS), CCI is there as well. Then maybe we should move
i2c-qcom-cci into CAMSS. Note that CCI can be used without CAMSS, and it can be
used for some I2C peripheral devices which are not camera-related.
Also, to reflect the exact HW configuration, maybe we need a CPAS sub-node.

One point of view: in the hardware configuration there are no dedicated
camera subsystem block (CAMSS) registers (based on my knowledge).
Those are a group of HW blocks belonging to the camera subsystem which share
some resources, including camnoc, clocks, GDSC, etc.

So, based on Vlad's proposal, the changes in the different drivers will just
be about where they take some resources from (parent device) or the current
device — so the changes in the drivers will not be significant.

~Gjorgji
