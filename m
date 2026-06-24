Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361963CAE99
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 20:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333687; cv=none; b=J7g44dLF85rPXnHFTSZxJFDPamLxL2K0OobX++xqFH0lFS4grXOgY5vE/WiyqYEPujv/Du9SyfJVcn07bptx4mAhNTkcS8HXL699peKx06APe8pin0uOXhcvHwSF7QSv9VmQDaANAOdZQ+DE8zCu1Dhj7eD3H37tzn+1m5FW9Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333687; c=relaxed/simple;
	bh=ktFuLBod6PkICS5eU2aAXOoPaoNHT5FsvcQS57K1xyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GxIVdyb+09CQLddnREO3YQprxCb7FAfSNplGZkomPXbblMB+srongJUMpoxRim30gH19nkoFhuTCF6n7uVr+M5EOjR9JUQZ6zZ3KxI4oRAAKd7FEUIHW9NcecxnD9eQlAAOSWmUF8Nsy42cdBYhPCABuigpExJaKkTz0uhx4AwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G+kOedp/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOmz9Mzc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G+kOedp/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOmz9Mzc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJit9j3827657
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 20:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=; b=G+kOedp/l6hDz4IP
	MRKMghCFfffhYlvzlLhU2vsVFfjAUus19l6mhBa8bXp+Hsg2ItVlQLkV98/xaL+j
	6YeSbTAXsRLxxIBSUTxSX1lIBBXbmQpt9JWp7Ia7EzOSVBEx702+RG9+oYaLyBNk
	9O2eajtaQ2KqmA+cfyR/o+ewwMpQ4KDc6s34wSYMilMLAhbxysaRynubMjke3mNy
	HjefyLKQbFrweKdBLEkpQeIm8OXLdGuNVrGlYSyTKXm9GQwSICD6XMMT4CnvJt0F
	+otPB0GdvnNRg7zbZcS+NPgwvwuO34yaE41GLTUIg5CgWb6dMcR1kru8u4Iiqtmt
	osHP3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbrev6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 20:41:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9227d9b3b5cso347712185a.1
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 13:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782333672; x=1782938472; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=;
        b=JOmz9Mzc8MUB4pzitfG8Og5gL7ERfzzNDsYEK1KPUViDmUbHYAAKDs4gdSsJQkZYA8
         z3YPXuyj7fORp1OEIPXB/ncR05WnJPvkp8UJjojuFoZzb8atqjyzmFelOWbtjsSjV/pR
         KqKn9Y+1P7JRYydcGVfhW5dXj8U9HvqjJkysScLvDipY6dk45nVItvZSBD7LBqu6Du5U
         enYF63freqUWg480l3RhNzJi0Lx7DnASN9XN5I9TEkI7Ek6Ucxd4gmMC3KdLk1kyg7DA
         WZCaAUcj8Caj6NcPBudzXsT8p/U1+irn2MffTIGu9HcDz77a8BhTVrhiV2wC7yuYjDOU
         xkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782333672; x=1782938472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RzilcVAWfMphGHBUGGTpHmQyinvK3m8bXOKcthvVDMs=;
        b=eHK/wiQEUzIP0l9RC+uxfPwIqdymrHpGohfs8JpCmaU6acio3OZIj7b91aMCxe5GNv
         6vyzttP2cX6XvwZFk2y7H5Ac4i9evfyga2UkXkfbaLJbiPx33/MBJY+gYHpQYEUVOpGe
         //AMiQSRUiDgOYXew+2bb6OT1buxMSSrVV5Bv/6Ta3/f90l2b/RpWHVr6M/onEu83/1Z
         zvno6/eOlzK+lDV1msvsDxq6hU1O4wUrXVZtX1/KUReP4ofzsm8WJD0a5G+TkW6KQP7q
         6z72fRPyu+NEL1aKHfGvw9EXjadOZ3luzOCAD1IoaJ3mT2e6IXSkrerSIRKgEFX7WoZs
         YkyA==
X-Forwarded-Encrypted: i=1; AFNElJ/2D/HEcPzmBlBDDZtVsGdCm2Q2WHcW9m9ALs1UJusqen5tiMTaSUuzQRKToTvOIduzuNZSVj+EAuQy@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkRuH8wIAY91gdKq7BduV0gfho+/3NJxQonuLML+195UdMM61
	Au+vIpP1GPkq7bpxZQbQ7XkQ3IlIjgYwm26XBqH7/9z+3wVNvyFgeE/uPapWEX7N76K1oV6wChp
	P7Pj9Q8yRDm53tGA3L5P1FiO9jXzjtGtWnBxbBC9SB+FK382OaeLd3AHsO1/wpU5t
X-Gm-Gg: AfdE7cnl5azIbt4tLDthD3j1L7iQs7rSr7lQo7Pn89oY+zi/91UWEXXEH0/KIAIsBQ6
	BgQBi+aVUSUThmEx3KiPpRGvFkmchLs+5uSD0hEfGEIfLfRSYcttqaGwLOuZ2a6+79sGcnWpFmN
	/e5NmBGjYpySq/GUMn6Yu11XWOD4tV97+kb80pkdU1VJG+WRH35VaFc4+EVcJ29p6VMItzQpdc/
	BSjZy0kfvCFBMOpNGxVwG5z2R9Eud4oDeffAGsSYIY3ZN6IW2yrqLytoa+wAZycP+hkgjbXZ6+d
	epOIKRcC/RS8hOwJYs0mDqcwvSryPmvcrhzh4gw5ghMj7wTGT8+Jx78kdCq4zRCADLByc7Tdxzq
	QNuqVzKjhakDVz713AzXcsCggHMCJr0Ii53dTj8WRj+W9bSuIo78e6ZADKpcPk2RbcDnIuHOQJg
	==
X-Received: by 2002:a05:620a:3724:b0:914:9ecb:9adb with SMTP id af79cd13be357-9277f6db9b0mr759156585a.50.1782333671724;
        Wed, 24 Jun 2026 13:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3724:b0:914:9ecb:9adb with SMTP id af79cd13be357-9277f6db9b0mr759151485a.50.1782333671228;
        Wed, 24 Jun 2026 13:41:11 -0700 (PDT)
Received: from [192.168.10.101] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926544dfaesm1511725e9.2.2026.06.24.13.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 13:41:10 -0700 (PDT)
Message-ID: <63d42dd6-862f-4a9c-a950-5bc90ffab391@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 22:41:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: power: limits: Describe Qualcomm SPEL
 hardware
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-1-a3ee6837c18f@oss.qualcomm.com>
 <20260622-armored-witty-tarantula-84a28a@quoll>
 <db8f06fa-0dda-4a22-baaf-8a708d43e113@oss.qualcomm.com>
 <d0528339-8be9-4895-a054-625df96ca926@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <d0528339-8be9-4895-a054-625df96ca926@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfX+ybZYNSD0K2P
 XV2ZRU5GnhzX0YTN+9AFtrUTGCY6ibpWobh0h6wf66WwjDEbH/t+q6siH8BUNC4VKp2qmpOavHt
 UUsT8hl7BdvTh96DIhQOKxpcJIRb2cA=
X-Proofpoint-ORIG-GUID: It1Z3To_3yJM4YyAABXukWbOyNywjAuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3MyBTYWx0ZWRfX4qL5KGebmQHQ
 tu2W3fRJu92wcVtLF3mVo6VQ5Fgb/x4X+soLzRhwRTDkIgTU3sU/JdtoQ0TB6+FUkh+D/u87IXA
 bF2I9QA8TYdnrFXo+Bd5403CQxmgzn0KepvzoErC0Lo9Axrw+PPvi8Lt6MvnG49BgbegUWrvr82
 50pZXFmHiwXkLJVDWme1LM3uS/BGWqx3rPs8/Lj9GurcT9iRee/LiAVtG3CT6FwAjNhglVDz1rg
 m7L6xxLFyPWqwK+1Vo2ip465Kq3PiFm3j52iJPlYuvi83HHzFRGJlsJ2+yGEAGDsMwxoRrlOwDx
 Gk9zyKMDzHCS6jjJZGEQaxic5s4MDwl1Wdy+0lBJJTwZiLIDG0/79GhYGQOZdxcSWps7vQBX8eC
 kewzS1VYumrOaV7CN9gTL7NtFFuphY8166DACvbR5Gvde63WKS2M1fmTUB6G7tW+AKIHUDyoX0k
 hWhCLtbfuP+p1rsLuNA==
X-Proofpoint-GUID: It1Z3To_3yJM4YyAABXukWbOyNywjAuy
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3c40e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PPDuxORCk0BztKokjgsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240173


Hi Krzysztof,

Le 24/06/2026 à 12:45, Krzysztof Kozlowski a écrit :
> On 23/06/2026 11:47, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Krzysztof,
>>
>>
>> On 6/22/2026 5:58 PM, Krzysztof Kozlowski wrote:
>>> On Sat, Jun 20, 2026 at 02:09:08AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>>> based power monitoring and limiting capabilities for various domains.
>>>>
>>>> Add a DeviceTree binding to describe the SPEL block on Qualcomm's SoC.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/power/limits/qcom,spel.yaml           | 47 ++++++++++++++++++++++
>>>>    MAINTAINERS                                        |  6 +++
>>>>    2 files changed, 53 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml b/Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
>>>
>>> What is "limits" directory for? What sort of class of devices fit there?
>>
>> Added for devices that integrate with the powercap framework (exposed
>> via sys/class/powercap). These devices are responsible for enforcing and
> 
> That's a driver answer. I asked about class of devices. powercap
> framework is Linux thing, not a class of devices.
> 
> Please describe hardware, not Linux frameworks.>>> monitoring power consumption limits across different domains, such as
>> the system, SoC, or specific subsystems. Any other better directory ?
> 
> I don't know what is this hardware doing and commit msg is quite short
> on explanation. Power monitoring is usually hwmon, but probably this is
> not a hwmon.
Right, it is relatively new in the device tree bindings. There is the 
Intel RAPL which is the same device but it does not belong to the DT 
namespace.

RAPL : Running Average Power Limit
SPEL : SoC Power and Electrical Limits

It allows power capping and read the average power consumption for a 
specific device (or/and an energy counter)

Basically you can set a power constraint (power limit) to a device and 
this one won't consume more than that power (the power limitation 
strategy is managed under the hood by the firmware depending on the 
device - lower OPP, idle injection, modem weaker signal, etc ...).

The RAPL or the SPEL have a hierarchical power limitation. For example:

                                     SoC
                                      |
                           ------------------------
                          |                        |
                      Cluster0                 Cluster1
                          |                        |
                 -----------------        -----------------
                |     |     |     |      |     |     |     |
              CPU0  CPU1  CPU2  CPU3   CPU4  CPU5  CPU6  CPU7


If you specify a power limit to 'SoC', then the power consumption of 
Cluster0 + Cluster1 <= SoC

If Cluster0 power consumption decreases, then Cluster1 is allowed to use 
more power until Cluster0 + Cluster1 <= SoC

For me it sounds reasonable to put the device description under power/limits


