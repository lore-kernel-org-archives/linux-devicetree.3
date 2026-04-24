Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4337CD55
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777023788; cv=none; b=IUVkdwGd/0340ZUJN6pr0h65cAzJl6RwYnR9ohuW++VbuGym88C6iV5fkEZcQMbkKKbN4VxmJxxkRvCeOiw4m6gcs6TDE9rQ3ymojdndR0uksIoDz0VO2bJZYqsjw7/iqFQcDeO2L7kyE4wFjzkeGi1w37ylgUD5bDqSekjo9Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777023788; c=relaxed/simple;
	bh=1GBQR8G2n6aMoWw0TMUO+qQMoVYADfYP0sxtdfMQREs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZN4H+oA91JYWPWawsp2QFRSQZjMUxZ9xdJOsIKMXcZXkzjpBilz2Dx3YxP9NCqZm3hKBNHktR7Nyf2zGRHHepyjAIA1WUoQXGvDlKwZkQV+ObdCa3iIZQO+2YuSIa4ZtuRnTTLNdDGEpRRaBzwAQ6Fa97Gh4W6hRLu44c0xVbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0kWWs0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V3mNySgW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0kWWs0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V3mNySgW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O9SFcK756631
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=; b=Z0kWWs0HRRHhUCDh
	Bj6R0qs+G7JWX8+lBRaEq+R9aXQLYHqrINVCvQRw336uX+FhlREq2010BSNcPqOm
	j7ZQ2LygmT6ON8+r2IROtmo2LViFdmASZsEVwN3P7ZSsN/lo+d/CC9rV46X0NUrh
	+81SU5dsinCXFbzAKMXwSYeyc0z2E5H7f86O938PbuqKhI2lwKS2TePmw6sPS7uQ
	o4+Cqsi2yBQkv32EpFVb6qBwxMARcV/+Tzj88v+uuvznTz3fWrMImRHq9cYhNboY
	yMiYLPkTsLtPcVXej6Z+KSBYuhdtITJs5tmmikoQvv9+qs7EsFZ0XFS/Bnb8tC5k
	XfcqlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqr4bkcbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 09:43:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eab2831ba2so103979785a.3
        for <devicetree@vger.kernel.org>; Fri, 24 Apr 2026 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777023784; x=1777628584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=;
        b=V3mNySgWRC3Nr5NDVctXzzfrv8X0cZ+r2I5tW51cXj1SKCbrMqgx+KIzydmwR+Vr3Y
         0GbWSgHwBnC80EmFQBFLGU0pubhlm9pZoAk/3qWtuySP+y1JEG+pAaj2k18T6XruRojS
         bfb4W6NrgrfQf7J6fdUcztTjIBHGD4CmjA72uKMiMp+UttVbnTa3kxAACaZnueyLyYMJ
         FoFcmBVV2vxXrAelJQp9jMlgiiYM+V6ACr65SNnN3uBc2dhlTTPIWtiKFNQk0YISEGvF
         HlvD9UjR99NygWxjjCIY9XL54JCYBiiOSVaE+zpQbnxkQuEk8gi5JQfYbj90Z5/cF++p
         LP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777023784; x=1777628584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3Xl9azwQ71YTf5iuXr2g/rv15sTTWVZVILP1WiTlxs=;
        b=aaNb1v0q6zwVxvz2OYQiktrICvMiVr2AdwD5EmZayhfC0NeSoCOdvJChlRiGVjje/S
         2ppLfyw2dVGfLClQQSu8RBOzDT1X5Ryh0B3Io6toWWpZqOourrQTKVd0Z0MZLBDhZTsJ
         W5kMwbE95tskGZebABuFkttEkK3Dtz1EjodWiM2mFP0TaqZ7c5de09lzV7CJxjb/s4HP
         xPo/LNiyIMyq1KYQcG8LE53XJewnsQqAQcLfjDJjywap01Ik1y9zwQKeVKiS80lYki1S
         fiOByZWArp4EnY4ah1bhbKdtApv5y9Xajx5SnN8hYHrxxS58at8wrMGTjmAHYOA+KmYc
         Z7JA==
X-Forwarded-Encrypted: i=1; AFNElJ9bw7vHzBsXdqkbpLQzuX1/s/lPvYJeuePj/thZ+d8RqpaMZykzarMEwQGkc7r7UomcbvWXI7hnLERQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2/sqhpZnxZxMNGr7gxLm9DJ1ErnVm3Tp2RMB9Qj+8IBmjh1D
	6WJ+aQdlKR3xqLbs/EhsICXrdIkNUBTxlE+zpIvBp3x1mH7ix7IHUoMhm+wa6aBnZenkzsftHGN
	R+ikXPk3gkCLBU3JAuUgvNKhNiCKPlmL3uT4cUcib6NS9tGanWaSRldxX3Ubednum
X-Gm-Gg: AeBDiesOJoqS1ZRI69mft4G3k//MazQgnTZOBSpdqZogxLtXbbkUHxOACkLDoLyWsCL
	kYtxzrbFezvLnQ/7BZB9/gcf4zuQJpNQDj2msrumwCQdWTHeIVvdKxvXUrrPGLskRBq3mLfWKFu
	P7r5i5IfSEtCl5q1lJFjkyKYJQ8Jp5PjL5bMjvRiTP70ieR/5LLWfzaNWw2wjCCbFjN56YYzFe/
	CxICBSawOv7EI2e4pHa76A3MvZMLgs2fAE7DupAxDlImA30eyQW+yIIIp7DlYYqvDKVEeckKgAj
	g8dzUjPY2vUIk8f8R2nAHkyjnKXK6Zpu4t270W3jy6s+Tq82xB7e3vvzyNR8f/CNEZmn5SX88xy
	r3puYAlRtKUseOGm0xf1AMQZ3OJr4z+Ktg9b6fSddXsQc8LpVW41D+tfAftDEFEjsVoaIDusRX3
	YwFxK7H7Co05/52w==
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr207534251cf.1.1777023784271;
        Fri, 24 Apr 2026 02:43:04 -0700 (PDT)
X-Received: by 2002:ac8:5f0c:0:b0:50e:5e6a:c7d5 with SMTP id d75a77b69052e-50e5e6ace9dmr207534041cf.1.1777023783763;
        Fri, 24 Apr 2026 02:43:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4516f7b11sm754655766b.14.2026.04.24.02.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:43:02 -0700 (PDT)
Message-ID: <1706c9ff-8c05-4855-be1a-1ff4c6792996@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:42:59 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
 <20260416-adreno-810-v4-6-61676e073f8a@pm.me>
 <eccce3f2-01a8-4454-87d2-3a599a15b34f@oss.qualcomm.com>
 <RxsrYj7kE1fS38uw9Frlum-uhzNhpKl4jkrZhaTmBCLLg5ZXTIG-2qdD8HTAyeyHfGMxjV8BAtwwsJJx28J6XApr3P2cFFmNMux3uKTUKgo=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <RxsrYj7kE1fS38uw9Frlum-uhzNhpKl4jkrZhaTmBCLLg5ZXTIG-2qdD8HTAyeyHfGMxjV8BAtwwsJJx28J6XApr3P2cFFmNMux3uKTUKgo=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5MCBTYWx0ZWRfXxf9f+KmWh1be
 v3tPu/Z+f5xHP4VRteG0lSJw6UdNbvdcFsYZXS1TFgsQ/ltlm/EASCfG5jz9TqcJ9P6jYhTZshs
 bQ214+vZtH184vDn4Sy177VuNzcMwDYwFwYx6jWYkLt1Ovx4DkPEZ2L3mVi8laag7qfuhnr7k/v
 znKOu6LKD4hp/K/mTn/0BkyeRpmloPuT1LBr+9N3dXs8MRv68+lA/JgB0qYlSM4zgenDcXeE5ZD
 CO883gYs47yUYsW41uIXret8Kucfy7mkN5amKJhjHsms1pmUPn+JtRVcXGgXzs7bEAj0Rx0zzZl
 dD0tcr9tM8WSRS9Hg92yVsIsgFxT5GIE5358WSB6GR3OEg9Szc+/X/vi+orYmbjAYc8cDnZ/XQA
 qulGRa+5NM1rxcytbWmXdSIHrRKiyDlP3EWjFfkFiEwasTlIpSLsDNJVI7/zP/jbrfFYX1GAE6j
 AZVeui91pOruEFUb82w==
X-Authority-Analysis: v=2.4 cv=TtnWQjXh c=1 sm=1 tr=0 ts=69eb3b28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=mNBZ_Hp9KTgF1tjAaBMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DYNPVzTTsEK8AKlWoy0sLQGe1-H_VInb
X-Proofpoint-GUID: DYNPVzTTsEK8AKlWoy0sLQGe1-H_VInb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240090

On 4/23/26 10:27 PM, Alexander Koskovich wrote:
> On Wednesday, April 22nd, 2026 at 9:04 AM, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 16-Apr-26 13:05, Alexander Koskovich wrote:
>>> Add catalog entry and register configuration for the Adreno 810
>>> found in Qualcomm SM7635 (Milos) based devices.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 296 ++++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 +
>>>  2 files changed, 301 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 550ff3a9b82e..1190804632d6 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1799,6 +1799,259 @@ static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
>>>  };
>>>  DECLARE_ADRENO_REGLIST_PIPE_LIST(x285_dyn_pwrup_reglist);
>>>
>>> +static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
>>
>> To align with the latest kgsl which includes all the latest
>> recommendations, remove:
>>
>> { REG_A8XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
>> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x00000724, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_UCHE_CACHE_WAYS, 0x00080000, BIT(PIPE_NONE) },
>>
>> { REG_A8XX_VSC_BIN_SIZE, 0x00010001, BIT(PIPE_NONE) },
>>
>> and add:
>>
>> (below RB_CCU_CNTL)
>> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
>>
>> (swap in place)
>> { REG_A8XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
>> { REG_A8XX_TPL1_DBG_ECO_CNTL1, 0x04000724, BIT(PIPE_NONE) },
>>
>> (below UCHE_CCHE_CACHE_WAYS)
>> { REG_A8XX_UCHE_HW_DBG_CNTL, BIT(8), BIT(PIPE_NONE) },
>>
>> (below RB_GC_GMEM_PROTECT)
>> { REG_A8XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
> 
> Just wanted to clarify if this was a typo, since you also asked for RB_CCU_DBG_ECO_CNTL below RB_CCU_CNTL as well.

Looks like kgsl has a duplicate entry here. Just one is enough!

Konrad
