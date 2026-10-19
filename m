Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9044048641C
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392351; cv=none; b=F5wObMbPSolNhi4q/kOHyfQO2BeRKO8bE0PPS+JWfEktA32Igw/931bkO50GGKalQje+FRw/EUlf7W52lXIFwciKueJKuQDmJpjseNaoQljRxUoh4KU8BTA91at88DdZU0esFwk6fU0umQHvWnsqCxRJAeRn8CPi3qpg8Xuf9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392351; c=relaxed/simple;
	bh=pfPZE1oNbQbujg70mqVq+VNEU8XoDctbzzic/gjTn/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/ABQbRirjBzPfsuwvoOyg+TLnUJ3QlAMPyZkLCTbggmyfucvfrcudG/loo1qjuNuI/A9pkUmhU9iyQA2t1f5p05zgM5ObSluH7gusT5HgDz1rHjOkWWxdOJSqjMwLJPMxV3M/0XzPfekd2CuDbG503OeHDuD0AE4ZjNRdO2nf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hn/J+RbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWhWJ9P4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hn/J+RbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWhWJ9P4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j3qY238682
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=; b=hn/J+RbS23AsOvR8
	TedeY3Bsg0NhTf5sRVzf+0mHzJ8qwP9oCzAtTS5o7lwEbYW5mo2dL5nVcMjRYW4K
	zYy2DwuKF5pwxaHk4uyyie5gEDyvAlIo6TFc5Ml65qQrP7jOW03pcY5YoHp08Ook
	/ssC941oX/sC71PYIrM6SvTaH9SThaoeaueI1RXHU0QbUkM1Tfxdw3PM+9IDhQrC
	bKTrn+jrlI/a5CpFoKv8BtZA4C8Cy7PeHmtMupCvsyr/rirrsmrvi8LTYgMAfZyx
	y8eZag+4Jq3Xsi9eFTfuP81Yg2hrQCjZw/SQqRSiY3o9FvvzXuQFxrTy7FfqqTgV
	Cc2n3w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k54sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 06:45:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e987ec84afso16398815ad.3
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792392344; x=1792997144; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=iWhWJ9P4a4y6hp0IyIx7dQQVhhOcMyzF1hszxb9hNF9lkDjhW518gurXxYVy6zRGEu
         DaidBQAUgLGccMOfhfFhLedt4O3duWEs+tPl/LcNINlxmSqwEQp35BXuivnBhl0YZ+mP
         CEFxfHi2mEq6a+hq2BbwSLvkp9zTxCTcNfbccKC9LGSQZ8+e25xutVfXl6CbX8PXbhCh
         ibIZiYf4m+ghAvSuFArKGk8seWNG44Vwywv9CVVkOVFcbcIuJ8QxOjGrQvHqdK9dHEPw
         RG7XmjsPHCgPiZdFKlAYpcEtyx007wQSfCehz5hD1JYDdWLU3ei1PosOUSb6dFIerMlj
         6H7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392344; x=1792997144;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVmSeay1XTMpEpXgY2Y5H3fL3jFlEFcncLH042xWGNk=;
        b=rUiXEcb3XFQk6ymlgBCRVJgksC0qrDuXoEvYxX+rmFOQcmT1tRrdy8q6BxjQAGmrvW
         UR2ekF98wE8wvE3qQktTooWM/g8QnW6HKaDBJd78j0/0xqZ+DHcEpkiOUPlOxcGEhnKo
         RptjlfRhx5v1WHfT/1MZSD5aXHASIuUWf/gM3Pxsp+uU5CjC4T9rleiXYnWOme4CA/Bf
         2Up/1KIbOrDoolcLXl9uHzOs+LC2NcMw9NZEndfLfqIE1v5DOujSDZFH5uvmBwSJ6Vju
         1cg9zjflsYSJhX+hCgD0yMsWhwXCyyOAGSfjbL53xH64onr2CMGLl+gWkienqolX2D98
         BpjA==
X-Forwarded-Encrypted: i=1; AKwUvBxngqfVUrTkQkmBcUUCf2LGFnrAAKTPmHSBGiYdTy6pc/9EfXJ6GbvPn2y4uSPinPrJNjdDcyNs/+pU@vger.kernel.org
X-Gm-Message-State: AFq9FYKYoRDU2Tky3xlnlPjCagl4FJq8G4K7y/AySs8lGsexzekNAb8T
	ZtD/OdU0uzwSYj1hXrAG7u0Ll6iQxIiHWVYz5Jnn1gyAZXZS/K+c274NbT0PRmu5aI4amy1THNg
	g82d8hx/UOuHQhYlugeIu1U4l2TrALTTPPtHIz7HdEGPfsc+Q905KFo6nbCYM9XfV
X-Gm-Gg: AYBFou1JRUsd92zTLdqaaT63+BxYAB/kKTBTEJpzod6B7xwS7Nl9br+YxNWkq/R/v9C
	Kfmi/UemZCRgq8A1Blu3mQ2rmCRJ5I/fNvRg4deGoHe0QPSRYCKLoYMP3lEd7VD3TbhUXQN3Bas
	QA5+O9I+/cEhDnePLzUw0cWJZ+2t7ZaBsEyFY1mG8wDuS80zY38O41tgbD4qHgkVOefABtmvGfB
	s8DX4t0CKiF8GRs7Xd7HJcEaGZsGI9yqozRlS6whf5r/7p0mjWrVsNAOMo1RFqyzEpFtEHsFbXu
	DRmXJv+of/GiouPB6N/SnBkaE0aJfQZp4cS40oIyfWiySMczrd5O+/ZJeidOgVuPZJSvTjzzO/D
	XQfRWNUg8PhQgHaYLCXsACohT0RrS4K9SmuAjXC5oEVFB6HA/Gurg4bPetGjQ
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369735ad.22.1792392343708;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
X-Received: by 2002:a17:902:f686:b0:2e9:a090:dd80 with SMTP id d9443c01a7336-2e9a6d25346mr62369505ad.22.1792392343154;
        Sun, 18 Oct 2026 23:45:43 -0700 (PDT)
Received: from [10.133.33.6] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea0cda9d8fsm731205ad.14.2026.10.18.23.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 23:45:42 -0700 (PDT)
Message-ID: <2bb63bef-b1b5-487c-98de-7cb5fa9b6758@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:45:34 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
 <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
 <51bc6576-7e52-4685-b7b2-a355c2b7e1ae@oss.qualcomm.com>
 <20261015193639.GE5059-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261015193639.GE5059-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfXx6ZVeyuE7i/R
 LQhPqQhUXARpUQblu3DWNTrENALkkCuVgCcDu17N0Lzc/IPH1FG/5zLg3Lq9O9wFITmMipizMb2
 d/zvVCJA1+sqOPnLBwADIfaFjXbNRX88XULwUpD3fEaYnrzXty95uK80FMBbD9hxu+B6cELDSa9
 l0QwCEE1r7FIiSMkQc3vU/EWGrSEzTH4lY24oz4bFpPYJ0CuX+53py2R4pTmvk3akHyws5X9Y6U
 saJcIFjPS5NZO+Frx51euNb90FYZA8DdpLwF7WT3l03OPBkIwJBCzlWdh9p+OCidIh9sa1JWVGT
 rDvebmG4zAtyJPTgvR0hZ+meyFIsPQo+CAUNws2RlKNzHuks97aTCkfB45HCfU5Zt1L9nEuoGOd
 9RTkxM7zaSdvEUyfVaFgjsReLILLcXco2hFE6qjRoIkYr0ddWFJ18HuP8XQy07OEkdJwrOJuxvL
 aGG9wJRUg3PlbGo3ORA==
X-Proofpoint-GUID: TxF0EesibTjG_aCEIR37Y98biydWAdpN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNiBTYWx0ZWRfX5806WfxYbkoJ
 hds5VAJQHhpQoDSjnF+t/NqQivsl7lt+p31n13ntFn4ZxRHMMq9KJO3iMqYUu46LwtvOrgOqs1C
 S8wV53dLYmuR6ZyNCFoXwWmU511KQHg=
X-Proofpoint-ORIG-GUID: TxF0EesibTjG_aCEIR37Y98biydWAdpN
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad5bc9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=2vh7TcXBQbIRG-HjRUIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190026



On 10/16/2026 3:36 AM, Rob Herring wrote:
> On Mon, Oct 12, 2026 at 06:24:06PM +0800, Yin Li wrote:
>>
>>
>> On 10/12/2026 3:05 PM, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:27 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>>>>> From: Rob Herring <robh@kernel.org>
>>>>>
>>>>> The binding is designed around the assumption that an MSC will be a
>>>>> sub-block of something else such as a memory controller, cache
>>>>> controller,
>>>>> or IOMMU. However, it's certainly possible a design does not have that
>>>>> association or has a mixture of both, so the binding illustrates
>>>>> how we can
>>>>> support that with RIS child nodes.
>>>>>
>>>>> A key part of MPAM is we need to know about all of the MSCs in
>>>>> the system
>>>>> before it can be enabled. This drives the need for the genericish
>>>>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>>>>> until a h/w specific driver potentially enables the h/w.
>>>>>
>>>>> Cc: James Morse <james.morse@arm.com>
>>>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>>>>     standalone arm,mpam-msc and the two-item combination; fix
>>>>> schema field
>>>>>     order, type constraints and yamllint spacing; fix example reg
>>>>> addresses,
>>>>>     add arm,mpam-device phandle and remove TODO comment ]
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202
>>>>> ++++++++++ +++++++++++
>>>>>    1 file changed, 202 insertions(+)
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..3c7b13a23ff2
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>>>>> @@ -0,0 +1,202 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>>>>> +
>>>>> +maintainers:
>>>>> +  - Rob Herring <robh@kernel.org>
>>>>> +
>>>>> +description: |
>>>>> +  The Arm MPAM specification can be found here:
>>>>> +
>>>>> +  https://developer.arm.com/documentation/ddi0598/latest
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    oneOf:
>>>>> +      - const: arm,mpam-msc                   # Further details
>>>>> are discoverable
>>>>> +      - items:
>>>>> +          - const: arm,mpam-memory-controller-msc
>>>>
>>>> Why do we need this?
>>>>
>>>
>>> Hi Rob,
>>>
>>> Thanks for the review.
>>>
>>> The 'arm,mpam-memory-controller-msc' compatible is needed because,
>>> unlike cache MSCs, memory controller MSCs cannot rely on the parent node
>>> to identify the resource type.
>>>
>>> Cache controllers universally carry a 'cache' compatible, so the driver
>>> can recognise any cache parent and derive the cache ID from standard
>>> properties. No equivalent convention exists for memory controllers, and
>>> the component ID comes from the MSC's own 'numa-node-id' rather than the
>>> parent, so there is no parent attribute to rely on.
>>>
>>
>> Hi Rob,
>>
>> As a follow-up to my previous reply:
>> Whatever the outcome of the discussion on "arm_mpam: Add support for
>> memory controller MSC on DT platforms", we will keep the binding and
>> driver support consistent. If it's dropped, the
>> 'arm,mpam-memory-controller-msc' compatible, 'numa-node-id' property, and
>> the memory controller example will be removed together.
> 
> Which parts are you actually using/needing and not using? If you don't
> need RIS support, for example, we should drop it.
> 

Hi Rob,

The Kaanapali DTS only uses 'arm,mpam-msc' nested under a cache node,
deriving type and affinity from the parent — following your earlier
suggestion. No RIS child nodes are used. However, this is not 
universally applicable. On most platforms, L2 cache nodes sit under CPU 
nodes, which do not provide an MMIO address space. Nesting an MSC there 
causes address translation failures. The Kaanapali DNM patch moves the 
cache nodes out of the CPU to work around this, which also has the 
benefit of making the MSC-cache parent relationship explicit in the 
device tree — though this is still an artificial arrangement for 
demonstration purposes.

In fact, if Kaanapali supported direct MMIO access to the MPAM
registers, it would also need to place the MSC independently and use
RIS with 'arm,mpam-device' to point to the L2 cache node under the
CPU — the same approach required on any platform where the cache
topology cannot be modified.

Therefore, apart from the memory controller MSC support, we believe
the remaining parts — including RIS — are needed on the Kaanapali
platform.

Thanks,
Yin


> Rob

-- 
Thx and BRs,
Yin

