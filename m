Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB22125AA
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418135; cv=none; b=IKD41jOxEEuzSAdZ/U0lZjwux7+wpG/Y8cbljUfEABadar1r3lXNiELyuaEq/sFG1LkQUfXTXSaicsWzB2hHBkZjio8mhksJnj7YwvgD4fPbMZsx6xD1yK8ESrlDxM3kwQG9qA68GZsli/40w7eysZPbV0Nr/sxl33jFUdkaKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418135; c=relaxed/simple;
	bh=x2KkVoMQI1NXabI2h0N7BvI/fSRL3yWbK0MtUn7sBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQiK5oXIxel5ydkvhZlfgJWI25DxH16JTSIh3vPuMLzCgG6nMlO+gPSXDPCpj4w6v+h5lWsRkkHD8Q2BV+lTumyl9SqPNMorijaZviY/mD9UDDXyZ1nLN5Lu4YvR1kXJRiHqTK1PFmQwh/hCKv3iM7c5myNKM1LeukClZkx7pJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BiKb4yPm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYBwS5Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BiKb4yPm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYBwS5Yz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697LtV6I4151768
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 00:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=; b=BiKb4yPmNEbSAUIb
	14/I5FvUmndSoBTWkx57rSDWqaiDeLehQ5sxGe1Sn98VlfxJT91h0QuQaO4On1fb
	MH6TJZXimpc3VSgdRISOrgU+mBS9Jb7TRbAEDnV4xgWCUgpHzDwsT05EcGedJ+SG
	hkUyqBPEltDltkRKzjhU54UMgC6Gc9jVkho8TxSqVVaTegarMci1ett/Xsi5ssba
	R17vmJ76UwRl6ryUN0DdPfaG12Cxs4bShJpTkqGsoofitle/EKMn5iJFB0XS7ZbD
	FhhmJbb8H8V2AlCMDyBx06SkNwRImIAdiZig1f2kskhpe+EIpbIDQP7AdvgC1SI4
	zF71uQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38aj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:08:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so16750822c88.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791418133; x=1792022933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=dYBwS5YzVWY0iyt1dXYTMPQzjYlgB9JX1Z/bKd1i6IRbElfZ8yEO6GwLs7J0qY4efn
         WFS2yJQvUt6FK92yE0/4aldcskMXMz6hMa0BMfCrObU2Ikp2yjn7lPajI6mm+yFvC5Tc
         eytsJuUk2Q5Yku+gAzLi3Nl6s9ZNeyosIBWolvhGkF0xn1DskM9Ejs1CEnguaqAFP9g8
         7vStf8HG0B1Mis0cEwfsrY3KiiH7cl8IgeSri2M2VfdJkh8YZAKhYVSFh+GtiAnNVDv4
         kqdSibN1vRi7IigfYX8PqeD/mwhTtU34WPDNO2P09DVXRuOybBRprZKrnz3HFFCIjYQh
         8VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418133; x=1792022933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wmy83IDApREsOlkuwuGw8eMok3UVFkoyyp0K97hFwN0=;
        b=w/qLhLtXW38JkFmLaZhC1G1qyTN5rFpZGWj/DklM8rSBsVChjbMn3fekoZTwNZrAIk
         WmOdQ2K5mxYuXkwKN1PKv8v2DfzX4LjfrMNIvcUwuPPDaSiY3AWYG6M9z9ZWo/513u4B
         rmXDdDSkOtmrICLgef+LfUOBIyF1zW9ruCZVAW7hYFP5a32E7IZdSuvhpEEDrHELeXt2
         cnhyZFfvA0GbnAixcy5+Q7YqbJ76cGKSimXcasWJw/WBThv1fI665/9DaZHmN6F/3O1l
         afGJtS3Mm6jPyUAbY7W3cr3I0X5cCkfEJ6iqABXIvYxAImJ/u05ePHBb3F7tW1+WZ4QN
         qSyA==
X-Forwarded-Encrypted: i=1; AKwUvBxPFjQkXRtIGB3DRj3Q0BlfkNXHbP957iMtzTacRQcF+9x8rjd5Sz6zJwnSHi4FLfb9RwrmBJfXSkyC@vger.kernel.org
X-Gm-Message-State: AFuF++kbEQsokVe8zWsLEoYpWBqMeAgH0cV/MXHecAvGHKK4Z2nsQb6h
	OOaov2jHds6f35Uqc2GAmKWJlx0nYq546ArmqrXCP58ORlGcILZXm4ZFsZsaK8ZkwpfaV2hoM0K
	e4dqQqFez1JWSjDvZHpJjWK5tw7DfRzGeu7O8Fcv9DSzPy3oxtywVO2s58DidrZCmn0acuVzs
X-Gm-Gg: AYBFou1TLgcF3gEzo2QFtCby4QX53lGo2F4UQ0Hc3X/LF5XXdiv4RD88jjaBP8alUyE
	dxaAiJegSph0XjgA9/rdDJB/fH7tUBOMeVGWWjdLdn3gxlz3fWp/FThISVwR8L5i5hmJHmrMnlU
	A4P0zudj7spWnalA3XXUmXem1tPwI1EoB18EJkf30qvkfCr+CCz0m23J6FLLgooZtHlVuCzmaYM
	+DMn0JlO2T7u6vfXn8Hx9qoI2DwiPgNVc9jqdbw5/dG2FylrUv4H4VGmqjLOZLDcBjb1XgbCVxQ
	3hO0X1FEzgJgxIgw0oAwJwgib3DumNTUHFSsVNr/sSsWyPw3ugTgp9Zw+9edvyETuXoM+wTvQHV
	6cP/Fun5DzwEho+MsVR54bkheh1QKAtiFUY3YZNF5wUJsL7tJUpEap23BOi/SdOU=
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490639c88.11.1791418132538;
        Wed, 07 Oct 2026 17:08:52 -0700 (PDT)
X-Received: by 2002:a05:701b:241a:b0:151:ceb3:e105 with SMTP id a92af1059eb24-162047a17dcmr4490583c88.11.1791418131519;
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16166216f39sm11910314c88.6.2026.10.07.17.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:08:51 -0700 (PDT)
Message-ID: <46903bb4-67ee-49a4-bf53-e7ba2c34256d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:08:35 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] soc: qcom: qpace: Add Qualcomm Page Compression
 Engine driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-3-georgi.djakov@oss.qualcomm.com>
 <20261001-hopping-belligerent-spider-876e7b@quoll>
 <fed665c5-3062-462b-928d-ab60976ce839@oss.qualcomm.com>
 <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <b12214fc-2e06-4e52-8bda-6c6f9a76bd7a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Qf3hYF0mh_vQ8HACQmkoIYob3oWecpeU
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac6df15 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8u56npouWohDfDDlGUsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX0Yo2hHmN6bvZ
 5AH6WxzaIX0v/tbnoRNKsaE/efGWEzxWP/lq2zVpvtWCNFgCH/ser3dB3/uAmiyn4d02bpSkVS+
 oM9w3xOzs4yTGRyyhFd2Uq2ehC5+HqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwMCBTYWx0ZWRfX2rikkL9IGzR2
 8/lvaox/gDpwe7er8WPGmBu078etCWf3tXQGxI65RV2C+ICUAtV8a+fpCIcmNoxf5RyKURSKfwV
 DH0tfoLmhvOxjsst+XHS32ifZKKTefh1eEMEYHRZUeLW+6AaE0zBa87qI+wFyKF81ezyBdMz5ku
 XhjD27NK+iqxuJErcVS9x6IISZ24qkZxazi7xNNXxoQHA50yUoNsyo3VrbnKW3KCnIp1+a4PHeS
 EViZbgm9hDKlf159fl8wbaDP0ikyuQiw1d7zR1/sbi5DduL1EKfqVN/09U+K/Cno8Dea++I7gAB
 a7IlMSQuuf0iExbqGllLa9L665blgQW/SzG49bt9InJfr1yMdVb0+0HVXh7dwIE6cL6rQCZdkrj
 2XIiCAKXQhH+IO6ftUrujSnBovL6+M7lKTx3KRLJVVIz7W85t5E8437cXn38aYdPboZlWgowGCU
 Q/9xFvDiRd/Hj65KJyw==
X-Proofpoint-ORIG-GUID: Qf3hYF0mh_vQ8HACQmkoIYob3oWecpeU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_07,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080000

On 10/7/2026 12:51 AM, Krzysztof Kozlowski wrote:
> On 07/10/2026 01:51, Oreoluwa Babatunde wrote:
>> On 10/1/2026 1:50 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Sep 30, 2026 at 07:52:11AM -0700, Georgi Djakov wrote:
>>>> Add a platform driver for the Qualcomm Page Compression Engine (QPaCE), a
>>>> hardware block that accelerates compression and decompression of memory
>>>> pages.
>>>>
>>>> Provide the urgent command path for synchronous single-page compression and
>>>> decompression. This exposes the low-latency operations needed by
>>>> compressed-memory users such as zram, especially for page decompression on
>>>> the read path.
>>>>
>>>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>>>> ---
>>>>    drivers/soc/qcom/Kconfig          |  14 +
>>>>    drivers/soc/qcom/Makefile         |   1 +
>>>>    drivers/soc/qcom/qpace.c          | 764 ++++++++++++++++++++++++++++++
>>>>    drivers/soc/qcom/qpace_internal.h |  84 ++++
>>>>    include/linux/soc/qcom/qpace.h    | 154 ++++++
>>>>    5 files changed, 1017 insertions(+)
>>>>    create mode 100644 drivers/soc/qcom/qpace.c
>>>>    create mode 100644 drivers/soc/qcom/qpace_internal.h
>>>>    create mode 100644 include/linux/soc/qcom/qpace.h
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index 535c8619197b..6bcb86dcd726 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>
>>> Sorry, but no. Soc is not a dumping ground. This has clear function of
>>> compression offload, so it should have some dedicated maintainers like
>>> other offload engines.
>>
>> The reason for putting this in soc/qcom is because this is a qcom HW
> 
> Every qcom HW driver is a qcom HW driver and they DO NOT go to drivers/soc.
> 
> Again: soc is not a dumping ground.
> 
ACK. We are looking at the crypto driver to see if it fits our use of 
the qpace HW block.

Do you have other suggestions for where this would better fit besides 
the crypto framework?

Thanks,
Oreoluwa

