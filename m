Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7879836F903
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436476; cv=none; b=Gya8wRidjAKQ/LVIcsl64x8O1mLlHDuDaZ8ZrSGUpGs0geGRoiIFmnusVLhB3b5qhBN1PdDeKJ6I0jF74m8lmSzs3sEbOR7eIwE5BwVcPKmkwVw94DZeYQD+OpJZgH9+O5XuV5jyXV3gddUYnVVkN6z4PeP0wQl6g/x3wUfzhIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436476; c=relaxed/simple;
	bh=+D/GGUvcOsimqDxyfbKlcMTFoXoX4b6/62l9AGfFEj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ogebqbr+QfyPjxG57CG+ugl9r8oQ30yeMRkMjelIbthtj2WfxyFLpUG+I04lm9vMVYsvSSj1Ld9+wbHcCjh0owC1vrBkKseJtYyE1SR4/r8NW1Zt7DQXEa2IM+hhKCEeg4870TNPFRiyBBtwr+A7PXv1RZExAtPfCbl3tH6ZYjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/TwjlHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIDNLRF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/TwjlHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIDNLRF3"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8gGO3616595
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 15:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=; b=A/TwjlHq75KU/ZfW
	CEJVy/6uAXqhErvWZQH3r7SMvWy/EOLUEFWmmM/iNaNS9FsGg9UMPWtI442kAMJ2
	coSYWWVmTC4sdigS9xM4kr9hNfQjo8rkNJnja5XeIw5haUZc9pUI/HkBICOUW8mj
	5gZt4m/yLpTgZLgEh8BL4FOe9P33CUuZwPHv+xJMkAd5e7niKHo/oXm71RiqMqXb
	sMJbq0c37+cOidroAvWFNDmmAYbteU4b6E5b08bgVK7rkehwTHNzc9ov2Kuq1WL4
	viesWAegCBvxaSSrpU4AS8X5ZI+N1TA0VspkJRvvs5x8oObkzcyujjjlO3rRpGMx
	Q1AvIg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun1vcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 15:01:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478e603285so1096556b3a.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783436469; x=1784041269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=jIDNLRF3ABNqnnYPH0TfxSriV3/l/+GjxxEC1/yJetk9opv1YX+hDqj2jjHT3+S4+4
         /ryV2q40vFEMpWlp5r6aqMpMtXhyU6gOK2kB8kJFUZGjxVeJ4VevU7jbXwQnCTAPJDOW
         OTMQsrwnKTEkdLfXZsO0g3riJOIN7lNss80y2kf5dVZCumYSSuvBooRW3A4wSYl1Mzw4
         v9gHXco6E9b2uFF2/oo89EUeE1GqQExmR6NKpW/ZPmcWU2lKT5F/mcYq9AdNnrDGtY//
         AfkZVilH1oMyM3oBkILWOoDUx7/sx5WCE0xtqZNK56lE9HmpMdzhIGwSitQKfGsmUbwM
         ZlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436469; x=1784041269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROX+UpJqvFR7fE/ZOEkvXIlyQXppUvkxvyHyF/TuUNk=;
        b=QMTsujAFiH4EEvJVgo1xg/nbb2Jn18Mg1DheEZx2PqfwV7nHMJsfkuSQTV0j5JasZE
         weB45bCiu1IfFxEvqnEe5mqVMuYEwe3hLZdeOTTSYLl+nej4GZeXLn7BtJE5fAr4/zC7
         ANA6exuyg7VPweXL4K2UpFgyI56JBL9HxBQWzQxsGc8FZcLW91/hrs1wsyJ4M19PLMP0
         spQ33zCzSCvwSup/HKaf/JVUvBDfCrHqtzPDqo9lAxo0Dma+QyWWNvpWOiha+9XwwANG
         PrbMwBgE1DH9G2J2NdrUTGE18byMWW8ANYCX+IalLJgLT1y6+VRy0H5JgY23A6UDYhC4
         2pNg==
X-Forwarded-Encrypted: i=1; AHgh+RrlCJKImXrjMwwzXB3sXjlh6y6c+mPsma26Xh0ylWDHHeoCARbDgXihEvou/GjOKEF3svNAjcVJCtsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAiMBilIiSZtSyk9OrMPyAlIqWjekh34ps1QdZAT+DHNngDo/8
	qHT8WfH7HMotNU4lb0mtBBhqL4VGRVPh6BLtHP/nyUiSQMX00EadcCdyGJRE5T4yRMXGlb/iw1n
	jaRo4T3Kwxljhs5QlqWKO3jdtQRcT0fEe9TbfegilUXdeazNOFhpPIn52lJy0pE/K
X-Gm-Gg: AfdE7cnAUJ+VZEe+w+CA6l20V9LMPRBJR+9RnrlqeH3KjDYc0Cpz6GKrCJOF/1xFlEW
	X03/scKad2+N5mYh0OQ8iF5T9+Bn5MH/OzWl2AdAGjnnGQHhkYMnM/3aUb+KdpaFtOE0iFQlwjP
	rfOLW3GlyuDg2ynu56w0ug6zwShk8PCY6mr8ErVlXqTiZQvgYZsJulgzB4FAqbO8PT7Ysu3fvF/
	EZmW1wpUXbOGetUYFn1b/V4Z5cl1vgr5RZHdg+jPNXBGUkuVyzoA0hEUOHrwR6yQa3FjwQswMri
	Z90vDdzd3OYirnekikqEC7QYlBecZCJSf4i3Q9Ui+ZDmmMEV3wFIWxoj4f3j4llOw/p5kvSW71Q
	PutK6vwj6QqVXINwh0wBFUzHh80aOXTLjGQPcPQXwNyy2
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970594637.37.1783436469161;
        Tue, 07 Jul 2026 08:01:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c09b48c10cmr3970553637.37.1783436468698;
        Tue, 07 Jul 2026 08:01:08 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6593c9a1sm10749401c88.2.2026.07.07.08.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 08:01:07 -0700 (PDT)
Message-ID: <ccc65b99-9045-438c-a4b3-2d3577f281b5@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 20:30:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/16] media: iris: Introduce buffer size calculations
 for AR50LT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue
 <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
 <20260616-iris-ar50lt-v5-13-583b42770b6a@oss.qualcomm.com>
 <09f6f0bd-6bde-4dbf-9be7-623c17232b16@oss.qualcomm.com>
 <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <jzqblo74y775tml2zwj6lfwcij635wkjivegfccx7peg4m6gne@cgu2leollht3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfX7jHsDYrbWMtK
 cGOMMW+zdi27AC6uQ9Qy/XpcRhvpZs05nIM7OSj5W4FMcRfyhn6iC2Pfa+qB22c9iFhCc/9HegM
 d1+HBVlsE5dg7MP+KKJLckUY5DQQH9Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE0NyBTYWx0ZWRfX8188ZKSVJjK3
 WQIXithiXDyDDBd3nHto3Fb7VQ5EMGIIIAlR8Tif5WoSBW0xza1gdGOG7i1BMMV2bUbXRVt7u53
 Mx4SsBwSh0QrGZCBMhFSVFvWLoGxC2Dyu4pScij1Ake9Gesxsq1JQRTQwLfwpMwq2HIbNjj0DQu
 9e8tVS7d9b8RAiY+7a7R0uPUq/U9j843RVCyhw83HibSj0eB1klKeMs1xVpPCCAo+bdh2IsoMvm
 1wgvLsCawg06UmfZfHRinpmaOh4GKVy8gZNUNepXVt5C5VA4vSVNZlCy4iyt9pf4Qxl8R73qPwm
 WIubtGUWw4g2xhlgQVnU6nsgJmOJYZIGUy38R/Twxy/fXCDs/5icR4qtYV5xBKKQ0In+sY+jhOQ
 qHry4prnEPKI64Dt/jXE9Bd0lb7+1g==
X-Proofpoint-GUID: Yq0qtq8cLCCpeehN6_WeZmGn6Uvcyckz
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d14b6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FtO3_dRub200-A8TgkkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: Yq0qtq8cLCCpeehN6_WeZmGn6Uvcyckz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2607070147



On 7/1/2026 7:19 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 24, 2026 at 08:40:02PM +0530, Vikash Garodia wrote:
>>
>>
>> On 6/16/2026 5:34 AM, Dmitry Baryshkov wrote:
>>> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>>
>>> Introduces AR50LT  buffer size calculation for both encoder and
>>> decoder. Reuse the buffer size calculation which are common, while
>>> adding the AR50LT specific ones separately.
>>>
>>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 401 +++++++++++++++++++++
>>>    drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  37 ++
>>>    2 files changed, 438 insertions(+)
>>>
>>> @@ -507,6 +734,13 @@ u32 hfi_buffer_line_vp9d(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_mi
>>>    	return _lb_size + vpss_lb_size + 4096;
>>>    }
>>> +static inline
>>> +u32 hfi_buffer_line_vp9d_ar50lt(u32 frame_width, u32 frame_height, u32 _yuv_bufcount_min,
>>> +				bool is_opb, u32 num_vpp_pipes)
>>> +{
>>> +	return hfi_ar50lt_vp9d_lb_size(frame_width, frame_height, num_vpp_pipes);
>>
>> pls keep same name across like "hfi_buffer_line_vp9d_ar50lt" and
>> "hfi_ar50lt_vp9d_lb_size" or combine these 2 apis, as the one just calls the
>> other.
> 
> I think, Sashiko pointout a different issue here. Should I be calling
> size_vpss_lb() to take is_opb into account?

The comment is generalizing the ar50 with other iris variants, we dont 
need that for AR50LT variants.

> 
>>
>>> +}
>>> +
>>>    static u32 hfi_buffer_line_h264d(u32 frame_width, u32 frame_height,
>>>    				 bool is_opb, u32 num_vpp_pipes)
>>>    {
> 

Regards,
Vikash
