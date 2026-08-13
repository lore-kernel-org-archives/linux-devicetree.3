Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658AF3BAD9F
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607129; cv=none; b=h7B5iCiQ3xMJJIrOBrVQnz1LZ3hfHABkGtGMDju994fwuEzv+PcH8KgHZc4q7UZUNxMJ2WLyaULSMsDJDGsyr9/ArIxfXOrXqS7BblGsfTedPXApJLxLj/wzQpFgVuj7Qop3C+mhwgRo02DOavhevR8X2mfgl6vUlkOWZSrQ3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607129; c=relaxed/simple;
	bh=o1/2zRuAHRZkP0L2zzElQ/qi/n7LBBGbPZnLdCNlov4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoseL1ypxKYYWB/dOxpYSBQFYT8/0EG92ceeHoyChHPCEaE/1+ESzpIaYA4doh/QUqz/q3GSAyhnu4iSfdorEvDnm3Y4HuJYbeTX0nDK6OeFELf+KW3mn2U1k5tJumVoZ3U+gS1y2qj6zO0h1z03rj5ETawVQTWGG7c/kwBxUVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPY7uKtA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iA4NlSdg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPY7uKtA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iA4NlSdg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5fv601875015
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=; b=mPY7uKtAsPiUK2LD
	xFJBQsGTDdscZ7jwDMzGPj9JcznqlTdZHjjrdCCoKB+TIVvg5PCbYU/V1YUFpMf/
	zoZNv+3/gP16bK3VSzZY9oyTKVl4GUqqv4AF261DsgzvdepWIvdFMQ8AmR//4sIf
	/xGjOb6l31s24Zq2TZKcJvcXaXhjA9Z9T2heLn4iUNpiMGU8aGeExy13ak6L8wPy
	IrmAy+LuHJSU3+jpqvygZUMJhohes6VF8Aaw+Tjdxn/1L30LUCpOVjhy4JQgr7DD
	HJc157pZ/zs8Odn/9NDyB2IUA8AvGO7xstP4rLUX5cv+peYunxOj4OBMj72wh7DG
	Qa7+kg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0wt8tv4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so10330411cf.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607122; x=1787211922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=;
        b=iA4NlSdgnXw5HdNqh2YXFVEfC+uw2K7fQAWhGls26mhMJLwCjFIF4bb2+p40/7Moma
         rEBf7waDv5BfpI38JDK3u9FBhi6U2HCg4/l1TeVF3tqmZIyR6ShSqoPknLEr+KRBQwr5
         rzmgy3CxpzMfzTB1PJwK2HkHL2KVQLaHCQs9o2GJ/IOm6mYmTtAgWICCFfJ6YYngUVBm
         mStD0YztHWqd9GNCJxzDr7dozg0D1dHpUpph/nMbzJEfbuFnZI3Jq5GQXYmoZHVh6LAu
         snB3GcAsDRgvt4iqVjl9IAKISGlrwebOc3nrS77Sw6638QnLpoq6l7jHnKJm+mBl44ov
         CBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607122; x=1787211922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mqfMyeLa/enZs1Q/aT9heNul0cQ6BjO2BGjlXPqgzCg=;
        b=lUTGUeoAHZD6nyKGbp6vGxUkx0bvRCi8jVC89fWEGGCIfx2Wr3C3pEnytaotyN8eVp
         h1Z+EN5LaJ4UTik7gNzfHib02qFQPqxv0PFVT2332HWrFBgsBFW+/Yx+tVAr5UMTuXnf
         i57ynDz+AI+ISBLY0ciUIfJusdrOfNYlsTdM6dZzeU6D8B1PRJ4HXYeKaaHBPnzNHExJ
         P2elIa3cvgB/gW3xwwYkQ6ilV9yJYPtHZJkzhY0IR9N6k0zcIOibeWZDKA9EHPfdAyHh
         rVWAC7TtT3INqRoUnsrSxTzwQuFn+Sy6w8cY0vCnRPfpseAYn5B7zNy2IbXQnMqJu+qi
         TQ/A==
X-Forwarded-Encrypted: i=1; AHgh+RrSmXe91oSUZy/oJl1s4ffbP6ZELRDn8YCeg6A5f9B4Kx0k0XjsCv1CovlAZJXlkXq0K48sZd5+/NF+@vger.kernel.org
X-Gm-Message-State: AOJu0YyYfw46AUAUDroNkj8YZsOkt6KLiN3jFU1Ags49IdJ+yJVBb2+f
	HVTdJBh485n+4KcJnyVZ9IUreu6lYs3TsR308cgq9ImBPwhmCkvXDcujHgWe23KjRI1Zf1YhL3V
	FBnxbEfei9fHxuOyTpBrgD25rlgr6dfmd/nHkhmFs2yuLfXfDgLv1lFS07dLnl5l8
X-Gm-Gg: AR+sD11ZTC4OCBlNd+9OGxl9T/SXv5D06nN16XEWivh/HBvZHU4Mz+g2rG5vPEBo7ye
	mtVJP21tlQ40HSulLIgDOBMlR2XlR9ZlK+GplY8pR24Fw/l9dBqbuk5Br/he5iRWn7v3gnWSNe6
	WEXMjB6oZTaG5yF0vXGIqELw1eS/YJi+Br8VsAVzRkTuKXzkgpXN662MOA2R/IX4S3yjU4XWSpL
	IXvo4Hgrsx9qJMmx2lLsc32s7d4nrju2Jy6BOZ1BFIoKwcCOXGh03rfjqhdi28BmTrvF0DwalRz
	yM0mlf0fh/ZMgdMc5C9w520pZXuvZLLeAcETxi5xDSXMKvITthseWkTmzUW36mbFYKnNq+lYoQ1
	sZ6n8aqs3Iq5bZg5ow8S0WvZuAS/qz3gJ+VX1ZXmC9Am5H6glRz4tlH6uQRs4qT1w
X-Received: by 2002:a05:622a:148b:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52d74a35488mr27934281cf.2.1786607121565;
        Thu, 13 Aug 2026 00:45:21 -0700 (PDT)
X-Received: by 2002:a05:622a:148b:b0:51b:f992:9e18 with SMTP id d75a77b69052e-52d74a35488mr27933901cf.2.1786607121072;
        Thu, 13 Aug 2026 00:45:21 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:20 -0700 (PDT)
Message-ID: <b360c4a0-72ec-4121-b16d-b7aa94e1a1f1@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:45:13 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/mdss: Enable INT2_GDSC alongside CORE_GDSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-2-4687866d6cb0@oss.qualcomm.com>
 <nwz6ail4qwkmsejow6757nxkutojc2q76tw7lt6oj3h4pncp5f@w6xkgj3bnlmh>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <nwz6ail4qwkmsejow6757nxkutojc2q76tw7lt6oj3h4pncp5f@w6xkgj3bnlmh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YLqvDxGx c=1 sm=1 tr=0 ts=6a7d7616 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YZRirGJidSSDptMLQzoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX4tRiCqA0NJP9
 w/AsSI5w7Xidk4OXM73B5ofRBwMzi98u0mEJCbkGqMZih6zRhLehvw5Vf1a617FXyLFxr6swYWh
 kSa/reTDNm/DS1GfK19L8aG/vNukvZFvxOzI74DTomxfUidd3IzvxmWJQVFaOBICscEciUJP37I
 awM8q7ODyHLFM3Jl6rEdJCVPF/RxSe1uIWYyevX/gRkSxYh1sh/dezY1LT0ysKpxiVmszXAlUv7
 hlro4b+YB0ObtvvW1v40tU6qNNx0fWpGA8E3UVGV50v0PJ/3/L99kw6vWJt19LDjTfhlmrHi66Q
 sb+DzavYtt1zFKciotn7HFyAghaFiB10wd2x7/1/JnLdKWKnV12bwFY8ZPN8CmqJw0vD8W/16SR
 +0hSdiNLD0Cl+3AJYcmcKQX4ZyTvvVvWGi6Vfpbe/UuVcZB7sUUvKgipFBnRM52q5Cu5K5COl0r
 4b6CHwh81cDh0jQQv7w==
X-Proofpoint-ORIG-GUID: 4eypx4vkOq91ZWgWbiGoHfRq3phZVs6S
X-Proofpoint-GUID: 4eypx4vkOq91ZWgWbiGoHfRq3phZVs6S
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfXym1GwEZLZSf2
 fuDTeu3ZtW8W0KUkZvPywrFR2syASkLZohw5ToMJWdPzVs+r3JYANhGhV0CbewUmoUwMTvVG8XQ
 Q/R0IyTZeYefbypL9aYR6SCmNyK0ey8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130052



On 7/22/2026 2:40 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 04:43:54PM +0800, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC powers
>> a subset of SSPP blocks (VIG2/VIG3/DMA5/DMA6).
>>
>> The MDSS driver currently relies on the default runtime PM handling
>> and does not enable the secondary INT2_GDSC. As a result, display
>> pipes backed by INT2_GDSC remain inaccessible.
>>
>> Attach and manage both power domains explicitly and enable them
>> during MDSS runtime PM activation.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/msm_mdss.c | 53 +++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> Why is it being handled in the MDSS rather than DPU?
> 
Will move it next patchset.
>> @@ -421,6 +451,27 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>>   	irq_set_chained_handler_and_data(irq, msm_mdss_irq,
>>   					 msm_mdss);
>>   
>> +	/*
>> +	 * When two power domains are listed in DT, the core framework does not
>> +	 * auto-attach either of them.  Attach and manage both explicitly so
>> +	 * that INT2_GDSC (needed for VIG2/VIG3) is enabled alongside the main
>> +	 * CORE_GDSC.  Single-domain platforms are unaffected.
>> +	 */
>> +	if (of_count_phandle_with_args(pdev->dev.of_node, "power-domains",
>> +				       "#power-domain-cells") > 1) {
>> +		static const char * const mdss_pd_names[] = { "core", "int2" };
>> +		static const struct dev_pm_domain_attach_data pd_data = {
>> +			.pd_names = mdss_pd_names,
>> +			.num_pd_names = ARRAY_SIZE(mdss_pd_names),
>> +			.pd_flags = PD_FLAG_NO_DEV_LINK,
> 
> Can't you use DL_FLAG_PM_RUNTIME here?
> 
Got it.Will ust it next patch.
>> +		};
>> +
>> +		ret = devm_pm_domain_attach_list(&pdev->dev, &pd_data,
>> +						 &msm_mdss->pd_list);
>> +		if (ret < 0)
>> +			return ERR_PTR(ret);
>> +	}
>> +
>>   	pm_runtime_enable(&pdev->dev);
>>   
>>   	return msm_mdss;
>>
>> -- 
>> 2.43.0
>>
> 

