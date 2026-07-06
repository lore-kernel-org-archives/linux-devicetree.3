Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B80230BD9
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374985; cv=none; b=MSzpvolRM0jhLu8y/wGabEieMy/d3FZa5Wo+gJYBieHAvbA9t2ejElg5QSgr+o11zwYoz0D0rhMnHvi+VkMDCL/g1mjsTwFsaLwP/b2DwpcAZ1MpcFWhTKtyl6Kh1qKkkUJYI6pIf5S21hGB1bG1KiJvPIt1MUIIsu7JXrERYSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374985; c=relaxed/simple;
	bh=UpO4tKWLM6NpkjaToU5bkuiwbjykqdoA95uxnkZptHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhqkvK8nJK8sZsbo/2EhsFQND9pAePJm9vRAxIB0wFGdeqjikP7jhLdlU17vMWdhMb78Js9ZJKRJ++rBP4dVE/7twm/uKkaz0CGqAhhhRETsU2vZvjUjVMa0ezdwjr26FbF+lLCOKvQs6SKJ+CsSi+tiYizT2kNUk5BzG9HGd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSlxawR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UzhdR0H4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSlxawR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UzhdR0H4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDtkk1650531
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=; b=aSlxawR/BBrrsLrp
	S3V4J3GgdBLFVH5XsOppLOymMo59D1CcyK+MsnVve7Xg8I93VdIAqy/Rb+2vPqjr
	qo4uc1b5gPUwyAagrMaFTdRWnCjyA8JXRU+Ip7WGUxq8dXhqxZ8ljDUCSvgRBZHc
	v3HN1fyYz/aBTB9jd9QYwx229j5YIT9hrUHTIniakWSL5de1l5DDGqjbFPPB0Usy
	ctjuHWEBvMsAIi3PIFQrGdnIRUWKEPo82upPFGkhkapz+jPJK/YB7Mutu7vmLS2J
	uXtkmaiJcgYuLaMCiV4VSNSLtKM1svV0ILMYxrVktt+/zD+eGP7+rwJulfaj8iG+
	vbvbfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgu78f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:56:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so15885a91.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374982; x=1783979782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=UzhdR0H41mwTdEcaMJuoZjD/4RNpBeQ23AMvBIHyYiPRcCm0z4RH8/wM8Zuev469x2
         HDJM7JDmma9XBhiESb+LE9XR80v+GN7NaHrhFHjgzgFb93ciWk9nj/Xkb8NH5a+5N/qI
         fc1gGlkzigEq5b7B97u5gCXF0XvTxO9lSrz3mrqWvbeXp5wlFzdu2s6sNchFekzL53zH
         EHeH62UK4H4LfYMYp+7+kIKKqDKUmQsc/t0UebNQBeP1LyGy8Tv6b4XZ0Nr/8Pbdd7Th
         YTC8+D6BZYmJWBl8Pn0ytouKbHfDabd0v6sccqQiz3gxkj72byVBFRnYKty0/wt4MBGO
         5LTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374982; x=1783979782;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVdlz/AoF+GYHSUtVQ5knwxf7V9QHtqCyB2a5fsaD8Q=;
        b=qzbF+OcnUN57oacffpn3l/aJEHnhVJjS17xlbibdf8NXfK3+/n+kzThQuBoSub/WRC
         Wyonw8FQ3A8YUIx3SRgEwYX5zMksdmAyU0N+pogZfI9mXoShSDFH6LPAsFS9BCppHVQP
         GpqyLLJ/ay8+G/n/Wn6E8y7KPl0r1p/rzD6hPeOvAA2yuHAGsRYZr1gUPG7WF3dnY0wb
         GkUyri7Pyxmwyc2YAJQTzBmRU34nYGPTCvuuN8JbHWjchESz506HkU+vWbU7cTnzXCeV
         cBN3j+ctnVmAAg/iZw8e+NPZGOg3cZteofxA7bpBVjiuPDUTiM0TPg19dofVVMT8TidW
         I80A==
X-Forwarded-Encrypted: i=1; AHgh+RpNj+qaSGKB3H/85pQjPHodH59LLhvAPJQ6nrzojXLIHIK9ZNsWFI8i3wNztRAZsTxzPL1FZwdQxFY+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WPe70r1NTJ7FmHsg9ymPbnfXOLZw2ZFmsgI5677s5lUaNE4E
	Y6kLslhbIR897cSpLDlzMhzI5lCDgU4Mu60is49L2qjJpKA7gN8p6TiJdzV4R8TXD1wQabMe8yi
	Oa0msViIFzpO/HzifkmKqCVIQzscMym/QXd/VeJBaaN9qHbzny8Dto7X02FA9QPoT
X-Gm-Gg: AfdE7cnD/HpWfyXoN6CY6RbV3ynlD3eqyVvJcOu6r4U6LLGfTtSukwVYc1PoRQdaFg1
	g2GFz0bdO/8NqtWvOEzQLjsuIclmTJA9ip8SkDOS+v+FUuQTHQ2OZK7UQPFTZhVNceAR2aCrZ1o
	fEorAfCercTjoFU3Poo/BsXyk5NXww8gJCsTLsWvVxPAaGfTUOhIWLndTX2MUhe3drMU3yvR9i+
	2RBgrIdjSzvlIMeBbVZDqQ2e5azbQBRL86H1xS0udfSl9GhKXqq9b/aQ5a16LFHJ38T0jHrRRZK
	2b9zuRC2Fya5mz9EB2ku0Xswt2jiImiCg+zdwCGYYdHJqcHyWBGWFYmse8XMH7KcczTMQ1TZzpv
	dcp12+Zb54kOFO3IllNUyzr+0WxU9zvzUcYQ=
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102072a91.2.1783374982392;
        Mon, 06 Jul 2026 14:56:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr102043a91.2.1783374981910;
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311748394acsm762251eec.8.2026.07.06.14.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:56:21 -0700 (PDT)
Message-ID: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 03:26:11 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _Im-eXx6m2hHhkEBkqqtC5UbEkvPXyfd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfX0tIRIGAhQWNe
 3k+tD7hndaw4uJPNxQ0Bv6Af15Du/ClCvc9Kx1MqIwFbpPjPu8qqQsO/zQj+DElqGc909fk2cRt
 vVlob/5g9+GGPQ+rqSfb/Bl4ret50JDFp+AzlVPz9bLGfJVBAL7xcv4KwyuOi0LqjWPyCmczNc4
 CacuI33SZAgjFy1Vk2nePtU8u0w4aHRabDKDxAmm4bv5D5B66HujpuCK9wNoM+UauOhxkyDxEIC
 B5UQTOEiiLJMCIy6ztQ/+nZKw7Oxt++PQ+aRznO3EFqsPhnaXUwkTfDkpz066b5Is2NVfYzfPLj
 tDXlFKjxn1bRn8qZqbUfj5ljkMAndppqzctVw1e6dUycJePh0Jf8hrmlWh3KubABFQw4+2TR+kz
 5TQmEu8xndU3pUTLatbpeksF8FQoK65r0aNz6bG/aYSLFZCPCD0nEsBCAZ9EGb/BVq9IhnkbIl/
 49TcXF+7f/rHUHoVezg==
X-Proofpoint-ORIG-GUID: _Im-eXx6m2hHhkEBkqqtC5UbEkvPXyfd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyMSBTYWx0ZWRfXxBlEKCFT0HNb
 SvMwCvMC1y3H+RGRJhvv55nbJou4CRnrcDj6gHrs0BOE51C+6epqTIbRP1DolYBkVP7p2Qhgq59
 6v34ABt7pSs9x5LrtISK+IYpqEOuEN0=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c2487 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=mx_oZ8J27MAni7-wUjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060221

On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>> Program all the register needed to start up LPAC and send initialization
>>> sequence.
>>>
>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>
>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>> ---
>> I believe some/all of these writes need to be guarded by if (has_lpac),
>> as many GPUs lack these registers and there may be side effects on
>> others
> 
> That's correct yeah. I'm not sure what has_lpac should be though.
> 
> Something we add to catalog? Or checking if it is a gen that has LPAC?

We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).

> 
>>
>>
>> [...]
>>
>>>           a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>> -                              sizeof(u32) * gpu->nr_rings,
>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>> >lpac_rb),
>> Should we rename nr_rings to something like nr_XXX_rings
>> where XXX is some uarch-generic (i.e. not SQE because we also
>> support pre-a6xx) name for the main number cruncher?
> Qualcom calls it GC so nr_gc_rings perhaps?

How about nr_gfx_rings as those rings can handle graphics workload?

-Akhil.

>>
>> Konrad
> 
> 
> Best regards,

