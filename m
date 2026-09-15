Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AF23D4107
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440576; cv=none; b=se4BLlZ462IWhxBGxAb3EXv+N8Z/cc1eGVAxmBe1qvPKObo4R9RninJM0fBSwV2GQMY0F3R6f0CzSkCV5ZXoXlLw2cfMVxLqdrMCjxxuUewbcIaiZyhCS/kF6AmUPgj5miuEUHyRDSayICFx96VWpzYhmUOXJE5tB7Qu72sdHZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440576; c=relaxed/simple;
	bh=EqMM7tTheAmiO2pL0AejZmpC4UNuhUpme9BMfGc+edc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0p+HNbaQcp8JJFkDU0OwwhWPOS0vsVlWUdfhZ+0/xgW+yg7nNeg8/hX/W/5ux6iFWSnAiz5EY/SDASP6lbOzqLwrqBo0rYAvpPck1UYgr75/lYmizh0AZAG/Lqb1EOh9qRMZHGD7T11TJOGmTkGbRFC4Xa1pQLkrBEFDYwb9hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fl7YelN8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UC/9EXzB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fl7YelN8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UC/9EXzB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nThw2992682
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=; b=Fl7YelN818eUZTu1
	0Kzflq90g7OCnKCWBJgKVz0EOsFkpXAHATYPPJoWI0f7W8CmKsdS6gTpcz9DneIg
	H5zVO+yu/8JQmTB5p/6nzQrXcv5DvdTTl8tw9+QDpWvIsCzXKVrNHWwCrn/8n7h6
	eMUyFXWcU76o/b0O901lhOAqp3q7HdV6UYg0Ep8hRicHAyG9X84o9JV/zV7ejPYq
	Q/pYa13wA5453I2eMTN8Q/zL19Ma0jiriEc4REQk1P7H6EwZvPNbbTuCS1QfBH+v
	QP5jZ3UVK7yPcf2WxRPk+Nl/WYlVEFHBO5RvFq3hVhXC+t4QBuU3MNj3xiH+uko1
	ZVFF/Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevuy5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 02:49:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso2677547a91.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 19:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789440572; x=1790045372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=;
        b=UC/9EXzB7OQurkGx41vfxjzyG1iMbYtTedI65UbEBpWI92AFNte6ofPIO+ZF0cE5Wk
         7uPwOUpjgjN6kPhn8hX2S9IYSqQ4zE/xI+uAVCj3XPwXnXD2sMJT8MLf9ryDzbBI6k5W
         LhR1/iBzyuyOi6JYJnDYaeO7SYNAziw8EVnD97/qqL+MOpWr85OI6PGmw4PwnNUgvooF
         7L8kT6WrnkkZPwWYHPBbf2BAxw0f8yo4n7qSeC58h4zY0kYHlUEM4bjBJ/o0LJaanldH
         Z1SYx3FszRrIZtF59lJYgjKjhOjI8HN8n5B2wgbbAloXrYoAgC6bFRYPky00azbkmzO7
         0m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440572; x=1790045372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5L/sut4FAKbjGdymDCKaX2hkXlq96ynrY1kfZ9pBAY=;
        b=0Hg+IsXMZ216s97NCllkJYUE/7mjmYxqic9B1CNcGFMRJLyx6RaiJgGj5TY0mkLQwC
         2fI/Sbv3ffdKO4gRi76yWOfrprk7ZfEwjuEAZ4jIaMsTFh6GyXDc0UkCtUK2/PowuP33
         kJ6NZ6h5JXx7icEOVXHeowitj6e75PT8LEMqJsM4SHPlSwIgOaEbp5iJIKKq5zAgaZui
         2GPJfc6ZX0+EcCw/B9sO+rQvLCO8eUeuikSMPDF39FeJAfafPIpGNsCPj3nbd7QdovxY
         C831WnhNQX8pG028SktIyA7MxJkw6h9TE4HjQfg6R9TlR9rfMK9QNFBRz+nJmEXSzKIA
         Ridg==
X-Forwarded-Encrypted: i=1; AKwUvByi7BXs8UCWvalxyy6XvBW+NZ4uVFc92DhlFNAU3FhTSGMWMSv5lyCKiGZo5tbWGlint6CXIuwb9F+T@vger.kernel.org
X-Gm-Message-State: AFuF++ni71CI+0/7Uxo+M4lhWIRWWPGEDWuY9vPPbLEWqQv54M49zJPB
	x66hWvTlXcqGfNiZgjtNlY9+c71R97hd6qZtv/S7NH+L8tZVv9kBJ8zztEETfWrL0clVMIO5GS+
	HO8DsWMkna/XSi3Y90qW90z67G7yls589+1JWrHjSzIKrhrwXkUZY3msdXppWJAHddZUd0+4cP7
	M=
X-Gm-Gg: AYBFou3OlEdEwICMsFwc8vQFWDzkHKM/CVHM20pfgi2Wtbw1iD826sgbJi100PNMV2c
	DGLBEh7Ihqj65xXkEYR1/MpyMxIZ4iqizFphKZNIe5SPvfyOg+3ztLs0c1cw2NDNlgYAo2INZ3T
	sduo87m4/07mG/N5TkZcmU7v2x5iTrTryJCSJTpCEwIa2yaDC82nH2fXBi0EqZx5F6IE1yDR9xB
	zzIXRB8m4bz2/KNH0ueL+NhBk+7bvPtfkNddZY/jgA1RWJXOfgocoteplckIP31ulwoLdgZpPsT
	4V1mKVJqJRCn+8rjxJH9HlyZGR17P3Dlph18nCTpqyOsV216ZaRmEFOsCqFBma+25ReaHl817Y1
	qFoNBrKivBFpdo6oqdU/Ez36qDupInfVQBn/zU63b5Rk9Bc5o2zF9Q47cYkAK0go=
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr2340009a91.9.1789440572259;
        Mon, 14 Sep 2026 19:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr2339934a91.9.1789440571725;
        Mon, 14 Sep 2026 19:49:31 -0700 (PDT)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm2127854a91.8.2026.09.14.19.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:49:31 -0700 (PDT)
Message-ID: <38215e79-34b6-4731-9853-d7f529861162@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:49:22 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
 <f71cfbcc-2e53-4e37-bb98-693996542396@arm.com>
 <07d32b4c-1f00-45e5-b318-0f28bbb46f33@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <07d32b4c-1f00-45e5-b318-0f28bbb46f33@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rcFa-VGd0L2mcgaX1uwyNzJ_3YZWvWLy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAzNiBTYWx0ZWRfX0MsZoNJZ9uwS
 vGglWJTQ9anvZHxi83WF22hBjs6cUs0lqUY0bMV8DZHayaVOIoe6WXdRA83QtW1w7oTHfH04Jji
 xIJXin5UxAnWKCEdHQUzXiVQBjW/AaE=
X-Proofpoint-GUID: rcFa-VGd0L2mcgaX1uwyNzJ_3YZWvWLy
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa8b23d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=uI_jzqnufFvfmlbxwmcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAzNiBTYWx0ZWRfXzhTg0ElwPfTw
 44lgydTFrH6Up2n2rc2dsck8/vn++iSplGOvJa1mxpFK3FNhBQQbuOe3Plij3CZ0orXtPsQGz8H
 8O57wwleX/njuFzojeccR7StegSz0DHEQWca0kKH8OPLMggUU35iCinboR6Gv9J3O97PCnYv6Df
 HmVTkKh6M3ckz+KjDYMtYILaX4S49vzE15RXtAvtqqHtilw5lzUy9ein9V1XQAsOmueP3DbS175
 jnZFc6F7JxwCcK3VKSHwwvt6O8RuaL2tv92Q48fJLPY6ranXGA/OU83utnvXHx91kn1HwI99UPG
 2Qdwnq4UT+uTXjLd6qDCUhyii05fcEhuLviRQFP5G3ouxlxiy2U4l+ZAIxYRpDxP0K7lSY+io44
 ccjIyT/0Dnyldi0BOf7J9jtL6bggNez3qLVY4LmUuTybYR1eRodK/3hIXv4E6nI+bdPeh+v2fmd
 gyR4BxCGDbAbuS7y8RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150036



On 9/14/2026 10:50 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/14/26 16:41, Andre Przywara wrote:
>> Hi,
>>
>> On 9/14/26 11:37, Yin Li wrote:
>>> From: Rob Herring <robh@kernel.org>
>>>
>>> The binding is designed around the assumption that an MSC will be a
>>> sub-block of something else such as a memory controller, cache 
>>> controller,
>>> or IOMMU. However, it's certainly possible a design does not have that
>>> association or has a mixture of both, so the binding illustrates how 
>>> we can
>>> support that with RIS child nodes.
>>>
>>> A key part of MPAM is we need to know about all of the MSCs in the 
>>> system
>>> before it can be enabled. This drives the need for the genericish
>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>> until a h/w specific driver potentially enables the h/w.
>>>
>>> Cc: James Morse <james.morse@arm.com>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 ++++++++++ 
>>> + ++++++++++
>>>   1 file changed, 199 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml 
>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> new file mode 100644
>>> index 000000000000..53a6fdbbf05f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>> @@ -0,0 +1,199 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>> +
>>> +description: |
>>> +  The Arm MPAM specification can be found here:
>>> +
>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>> +
>>> +maintainers:
>>> +  - Rob Herring <robh@kernel.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - const: arm,mpam-msc                   # Further details are 
>>> discoverable
>>> +      - const: arm,mpam-memory-controller-msc
>>
>> But that doesn't match the examples below, does it? Don't we want to 
>> allow just "arm,mpam-msc", but also the memory controller string, with 
>> "arm,mpam-msc" as a fallback?
>> I guess the pattern should then look similar to interrupt-names below?
> 
> Just seeing that you fix this and other things up in patch 08/10 later.
> I think it's confusing to have this split now for a v2 still. I wouldn't 
> be aware of previous review of this original patch, so it doesn't really 
> matter. Please squash them.
> 
> So I think you should merge 07/10 and 08/10 into their original patches, 
> otherwise reviewers might just get confused.
> 
> But you might wait for a bit with a repost, to see if there are more 
> generic comments on DT support.
> 

Hi Andre,

Good catch on the compatible issue in 03/10: you're right, "items" 
requires both strings to be present, whereas we want to allow standalone 
"arm,mpam-msc" or the two-item combination. This is fixed in 08/10 using 
"oneOf"; the iommu example with the TODO is also fixed there.

On squashing: sorry for the confusion and agreed on both points. Since 
this is still an RFC and the original authors haven't commented yet, 
I've kept the fixes as separate patches to make it easier for them to 
review. I'll squash them in the next version.

Thanks for your quick review!

Yin

> Cheers,
> Andre
> 
> 

-- 
Thx and BRs,
Yin

