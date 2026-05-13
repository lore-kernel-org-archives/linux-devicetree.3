Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEE2E1EF4
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681435; cv=none; b=BKQFc5sp4rnLa/OZjHw1y2bwHXeAcDFmGyVi0EyNcmp17GXKcpwjx+XLN6qOWYt70vqimvG+4UDOJyDBetGaw1+w652GBKqDCTdNJ3BNxNQy9GoLi9AWjX4ut+QIA+YKxK3yHE0scysrGK8x1HYWxnhXcJi5Nw191+6xPQWcSNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681435; c=relaxed/simple;
	bh=m+3FvLJO+xwOla0OXf8VoQ1DLjG55to1DazANcMJeII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7yP07835rB2BQCk4qR1Cg5LUCE3Ez98uK94zFrLtXsb6TiGoo728TEyWKQhwGeRNeVSRl97CcLUk52l2Qm/5iSIOfYIYgaGS6eXaxH292rayEOyx442E1X3aT1lBJMAO27KPo40t+iiLdZhGbW0aXphTo9btKjNYD26CTcTvJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC33L7yK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hH80RNEn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC33L7yK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hH80RNEn"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAe5Dj1393047
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=; b=BC33L7yK8qOiG5Tb
	6HgF1vN2BdmjRSiTnfwFvBYTDniXntRpyVwmizZa9cvsj9GaKc52Wrrfah3Ku6+n
	+WlKdQTos8iT7u7cO/mF1HDk0isf5NFakCqwDcNTdIACXsRNcOz/ga5YoN7ivxUU
	t060ScJtuVBz8U5iK1FEIC1bzJdoWGPEntqOO64DPA63/1LI7BQQZy7fLIjuH9ZF
	j/hwdFH63v64ruuQLWfF+wBSHiWU4VbAXr8bpdEdsUrV5lqzkm1tb+EXUoPJEaKS
	0qhGImPjFUkMfp2rB5UruW/erDnABLHvlTB6BzNDmhhaL0gFdnnGxnheQt9dIjKq
	u7Gi/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k2620y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:10:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8271fb4407so4626361a12.2
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778681433; x=1779286233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=hH80RNEnG1yujPe8GGv6hwpq0jkv5P4aIfhY1GOj8Bg8LPOGDC9SUsfQcOpWwjv3Ln
         zmk19M/TkEwAcI+HExphn92DkbMEiCgSzWsWfT/pkiNb4xO/xdqxSmHaIBxyHf02VPus
         ZK7lDYIpramC6trdEG4QlI48H98aoXisYMVSDkgwHUPHOPEPY4s7yNzuDikKO+BjAq3E
         3LMeHLEYiz8pxmYHgaJ03UkkMZO1EWUgwwqLn3cLeWSL3SxMGPfGKME2YrPwzcsWQzLg
         ZZXFxrYrLw7WodQOz9LPvQNlgqLhGdNT2kTWQLimt7KVgtuoZ/b+kl7twlp5POUeuDVt
         r9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778681433; x=1779286233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNDTjDQxaaZna2YPydS/Qickq2a/bQ5x4h+79jW/W8A=;
        b=WYAdPt4QEuzTYTdnGLraKoKUI6NvY4YQyZ6O9k44/ALyx9Zxtw21dfMNLriOpDmAg1
         KeaK5uAk4anvg9j85pOPcjR8VSvaE8OflL3D4AloTi0bYbU+Al5CGf1LEH+xWHORCpsp
         M+K0F29zD+4VibG2+pC/SspW3PU52lqXELDFQt/A5Ie9KtbUCbY/+VdKNByKw5QzPEEo
         UTreQc3gStv69XPYQM6cJCDq5an3gQxxlytmEjgMYi8RrIcU9qdhoYauXBkm6WKiQnOi
         CKfuRF+4CORlaJXC+yI8yAptxpTnmQAfhqmtNcFmnVwrEFJ2O4WyRrUGqr5wQwCFq76J
         370w==
X-Forwarded-Encrypted: i=1; AFNElJ80ZmJpaOw04x5fQDHn8GvdomwORfn8aPrIslseR4NoHHN+ovIz6ax3CaUaXdIZyyvc/EjDflVGtVfQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwf85JtgE1aBVZKjbxlY8Miyd7nawu/NW0/pF5/4pp2DsQGQOL
	Y6njkcxAMV4y+wbFWNu6mKJqoIm4oYjQxkSsAbr4ckglFAFx8IpiZ0hxDqgmTg9gG6oeqyq408+
	KIBO6H73nTH4xal2whPPvyR5+h2GwoVYsiQEVspUzaDeHxktzmK/fZ7Cylwnf1LdS
X-Gm-Gg: Acq92OEbg4sKnqNPa3Nt90JfPGJDpoRWT18i00prp+Bzk48Sa+xsPu/WWgVV65sfrqz
	XmkeABwBChzJ252XrohJKQ2EN/P2/7hkOBzgVPmQu+CdNMfUeN95cuZPCr/DIrEz2SIg7U1KS43
	/IIilJ/HOg/4pvqJdcgLjI40QUZ7IZ+rkpXnrbhx3k9MWT0QfvT7qikCUhNlgyoa18J0crcvhmv
	qgb1KbEUgEKPavbPB1KvqF7u5M1EWniSfm/12yvRObUV8Bvs680nkegIlYAD9eoBAyqr9QKzxax
	DfI4ZYiyoKqoUEjSqgkfyvsuMgE8nkh80OnUGqKm89GtMu2/UXPHAY7xwzwh15uq5R3Ob+ijZf9
	tREp1gcJDZQow0o66ESAPOYRSkDKXGYWslTWXkojhWupUGMuNotu2TbQ=
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492430b3a.18.1778681433133;
        Wed, 13 May 2026 07:10:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c9c:b0:82f:721f:10ea with SMTP id d2e1a72fcca58-83f03fd3872mr3492383b3a.18.1778681432540;
        Wed, 13 May 2026 07:10:32 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbf0cesm33068690b3a.46.2026.05.13.07.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 07:10:31 -0700 (PDT)
Message-ID: <8541d1e8-9ad9-489b-9c00-b7a92ce0a13a@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:40:23 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] media: iris: Rename clock and power domain
 macros to use vcodec prefix
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-8-7fbb340c5dbd@oss.qualcomm.com>
 <6hr42ins65rf6ftdmme5lok6ham67piz3343kdwxaff2acktcz@oipdhket32og>
 <4eef8b17-47b5-e8f0-4a44-87fdf1d69d18@oss.qualcomm.com>
 <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <cyjxjidbe4qpeb5pwv6u5yqwhldqffenzgp6z4irgxkloturt6@buswzuou2w7z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a048659 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZIVIcBtmlPlGufRlQcsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NSBTYWx0ZWRfX5+LEQ/IuXsNl
 E5TiXZmlZshNeN3M/MnWsmMo7kx9Pk6u/oFq88VoGHgJnPtDtvgRuyURzvMr9yPpdEQCt+N8WeH
 Th/aJUERON6Xv4+fgUSGKQFUrs27V2avg1Po24rUpIErF/sIG/QTMeLBjcyitTOvtCYUFdorsvo
 HF+SlbsB+8WP1iC4EP4x74zV388nqsTi50F2OyIhrT5Pvvjfbu89yEDzPU/gcacpTLlzBq03SzI
 ezHYypYLpoJAEsZc44yU4Jq04+QFc/kpxhw+7bq32eKW/4QnKHFFO1E3L95jlHBOfTLu1iACUzq
 zmq2mMgIEv9NOqmIORsDcjX6Ee+jMUm1eYlOZ/YnurHuScglusdSVwTuVexI56rrXV4u0VpbEzQ
 1vVA3n242lONXpOZ0e9N3gDNCu9UvHCqDzLpfxV21uWT4Cr0u1ge7PbBsUCOoZnN2OUZzpcHuhR
 qLWccYIt4Fiy45dx5TA==
X-Proofpoint-ORIG-GUID: T_NnrPkyI1TLDAq0Uw2rSXYhPTy7AsAA
X-Proofpoint-GUID: T_NnrPkyI1TLDAq0Uw2rSXYhPTy7AsAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130145


On 5/13/2026 7:17 PM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 10:37:20PM +0530, Vishnu Reddy wrote:
>>
>> On 5/9/2026 1:52 AM, Dmitry Baryshkov wrote:
>>> On Sat, May 09, 2026 at 12:29:57AM +0530, Vishnu Reddy wrote:
>>>> The current clock and power domain enum names are too generic. Rename
>>>> them with a vcodec prefix to make the names more meaningful and to easily
>>>> accommodate vcodec1 enums for the secondary core for glymur platform.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> ---
>>>>   .../platform/qcom/iris/iris_platform_common.h      | 12 ++++----
>>>>   .../media/platform/qcom/iris/iris_platform_gen1.c  |  6 ++--
>>>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  6 ++--
>>>>   .../platform/qcom/iris/iris_platform_sc7280.h      | 10 +++----
>>>>   .../platform/qcom/iris/iris_platform_sm8750.h      | 12 ++++----
>>>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 21 +++++++-------
>>>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 30 +++++++++++---------
>>>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 33 +++++++++++-----------
>>>>   8 files changed, 67 insertions(+), 63 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> index 55ff6137d9a9..30e9d4d288c6 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>> @@ -49,14 +49,14 @@ extern const struct iris_platform_data sm8650_data;
>>>>   extern const struct iris_platform_data sm8750_data;
>>>>   
>>>>   enum platform_clk_type {
>>>> -	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
>>>> +	IRIS_AXI_VCODEC_CLK,
>>>>   	IRIS_CTRL_CLK,
>>>>   	IRIS_AHB_CLK,
>>>> -	IRIS_HW_CLK,
>>>> -	IRIS_HW_AHB_CLK,
>>>> -	IRIS_AXI1_CLK,
>>>> +	IRIS_VCODEC_CLK,
>>>> +	IRIS_VCODEC_AHB_CLK,
>>>> +	IRIS_AXI_CTRL_CLK,
>>> Why AXI_CTRL is better than AXI1?
>>
>> Glymur has 3 AXI clocks: axi_vcodec0, axi_ctrl, and axi_vcodec1. Using
>> positional names like AXI0/AXI1/AXI2 doesn't convey their purpose, whereas
>> naming them as AXI_VCODEC_CLK, AXI_CTRL_CLK makes the intent clearer,
>> especially when platforms differ in the number of AXI clocks they expose.
> 
> => commit message
> 
>>
>>>
>>>>   	IRIS_CTRL_FREERUN_CLK,
>>>> -	IRIS_HW_FREERUN_CLK,
>>>> +	IRIS_VCODEC_FREERUN_CLK,
>>> Can we at least group them too?
>>>
>>>>   	IRIS_BSE_HW_CLK,
>>> Is BSE a core or a codec clock?

IRIS_VCODEC_BSE_CLK would be more appropriate here.

Core and vcodec (video codec), it refers to the main processing block 
and are referred interchangeably. BSE and VPP are the sub blocks inside 
the core/vcodec block.
> 
> Unanswered
> 
>>>
>>>>   	IRIS_VPP0_HW_CLK,
>>>>   	IRIS_VPP1_HW_CLK,
>>>> @@ -206,7 +206,7 @@ struct icc_vote_data {
>>>>   
>>>>   enum platform_pm_domain_type {
>>>>   	IRIS_CTRL_POWER_DOMAIN,
>>>> -	IRIS_HW_POWER_DOMAIN,
>>>> +	IRIS_VCODEC_POWER_DOMAIN,
>>>>   	IRIS_VPP0_HW_POWER_DOMAIN,
>>>>   	IRIS_VPP1_HW_POWER_DOMAIN,
>>>>   	IRIS_APV_HW_POWER_DOMAIN,
> 

