Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1E346E4E
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654235; cv=none; b=kULkI+iqtMr525KGcyGJ0LPGnsKtJ6OywGrdWKiTfwVNqL8AsI16GcGW/7aNk0kPxcNOTtYj6ytcPnXsNQ6gdcwN8qUOwcyEhvG9yxxnKCzDFrxqTDeWUgC1PVUxb+ZjRdZ/xtylv7Upxu1XFIgqVD310g7kWsEl+jcVSEHx5K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654235; c=relaxed/simple;
	bh=Xq7d/FsWXftgTpuwlB9p6ZlGor24rvZyf5nAekp4QLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wwlei9VVivTgcBM7SM4NL1mIKARSCVn3VvdzixLQ3sk1gOB8Ngh80h6prMdUsypBBlGyeZkLltQer+ChSca5+ItYmEJvphYwSgK16PQkUScrFXUbhEqckm1/kGnimyYbGMwgnsgHbCaCAJczE+N9ayXy62wBuVJHFusHydJtVMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2w2tnKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMOKXoc1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2w2tnKg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMOKXoc1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUl1B2556966
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=; b=i2w2tnKgEyl4Mlfj
	U8enrOZFpMvtR5iuVS8YP4x4kmO+Sf2rp5UA8hnuAS/yvqekipGk63VufHhquwMf
	oTTNAoHg9jt3t9wdranPm7MV+Ceh+DiSJspimHkFa6p2iWa5mAoMQhXzJ/aIKJlT
	XlvS7Bs/6J1acZ9ZxnvLGs04ADrP8jrD8HeJQ6GDuezV6P1vC18w1opLReMRJxfD
	i3dJJZVI1xVdfloS/ryqrc5r9zKADfUoXd4M7ZlQ9KDf3kwWFehgscLOqtZHniAR
	a9xtzfZGlvKhsTLnHUxyQv7GJ/SIUjq6E1Sotu/9RAMXRsRkiYgIsXukQWltO52h
	GJU/JA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8hc5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848693daa20so1051756b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783654231; x=1784259031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=;
        b=QMOKXoc1PcRIV9EtUqbJ1LS57RB+QjgS7ZvryWjlKochIlbJRMljyHT3DBMKp3sANU
         9TqKiYU8f0DCGhihTAtZq+E6rEv7uDVXY20ZudzV/iO1ruCrCTq9UdjOnqb1/GIZYzXy
         m87Zqq0HV8kYmirkZrNKVCXFVJjvkrsB2j5YTs71gmsmDIPhskrxrHxG4EPdUVCmg33W
         t4dc9HhPzIqx64QJWG6TR5G3z6gq7bPPYtY+rkZ31YLp5gTApCqi2IBonB4I8lnx3SAw
         NcD0tKcMj8N0MHAzN2uoSNn/OBc328OQhw6Fq43iuTHQXBszCsr4FHfPEEafeL3iI492
         VdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654231; x=1784259031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=;
        b=mmLsiId7r6rBPNu6wg1dGPxM2eHZkekvVOWzrYDnkXxUfqyyN6jSKHabAAcw+QlBJd
         Ms1kz+oWD0rGNCLbtZ8REEUHYG27UjULmUBQe4FgEJz1KZP37WCv/Ywaz0yfvYo55wXF
         a//tVdHWqOqJnANeV5cwca0+aGNv9iXs3ZsqnohfJBb3+aQak4f14dqm1yZqSa+Xx5M+
         Ysc9W0VYzRN7MdGifAMEmC/iDSI+VjLz1yu9hGsLwDEE+tbJV1vDKma+11X6jQtdSZKf
         QMLljcV/pvBaR8KR8aq3dBao/SY84mg5Bs0QhJMv4JbKFzwaF3+VMDU6MAKdyFLxxMfY
         pLWw==
X-Forwarded-Encrypted: i=1; AHgh+Roo80lyzemBrG3poOjLpSOEw2RWrnHbwaL4Ee6xJAM7Qy5DN77YHvYKRs9Z7VQzWoZnI/d8ox6yHyLd@vger.kernel.org
X-Gm-Message-State: AOJu0YypibYQb2vZOx5bXlR93CwHsxRsM5WuVBiFs+Vlg4gyPGlRuPnI
	fE6GMrQKjQiiSj6ObWgXDbyQr2GUFakQmCNR2LsYflsDrnCI+AW07RbaRQjwmGEK4NiuSWSeUIW
	3USzbd9A/4Awrj05r8vIXWgDWieYDkhn6HI247GFXVzbv/RAfkfptp2Nv3XqcNpuV
X-Gm-Gg: AfdE7cmllRqLz0s8f2NQVU12JPiFkVoz9oE9P/373VGE+2CTcwC2cQBH9Bq4NA7ns6z
	hmG13m0dgZX9jYV+PAd0tqG6dVzRoDWexZOl/6LK5dXok8k3SeU4RyZp7ARdEqTmGNjOi9Py4Ne
	x6RpQL9tNurwZBLEMBKLUgmvk/Xb3u1ES0jhkTjzBK8lcAZ8xllpk5hoUP+dvd2e28TpKSJazH+
	u2uT8VF1ZbWAQmfXeX02clPl+Sc45owkLq/v4POZbw5JhvW629Ajp2c5xcvEivAEac+2hkhJeeZ
	MQStOsY1c+WRBBaDdFaCgptzncWdYRI++IzRlM6CruVcCWCpoBFyHimSAtSKHEDC3lciT4Ss38F
	cFKQCEIesYKBptP/DlxjykpH+Hov9u6Oo4z6Y71JF
X-Received: by 2002:a05:6a00:22d4:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-848788aecacmr543849b3a.18.1783654231430;
        Thu, 09 Jul 2026 20:30:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d4:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-848788aecacmr543829b3a.18.1783654231035;
        Thu, 09 Jul 2026 20:30:31 -0700 (PDT)
Received: from [10.204.79.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483262a17dsm4980282b3a.4.2026.07.09.20.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 20:30:30 -0700 (PDT)
Message-ID: <1dcbc6e1-7b78-467f-b39d-eec4aecbf577@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:00:25 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vXWepJN5ys7b3tHw0bN4yWfas4O60rR-
X-Proofpoint-ORIG-GUID: vXWepJN5ys7b3tHw0bN4yWfas4O60rR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyOSBTYWx0ZWRfX9Yzck1+ERltS
 WXoYPdoz9TEp1KK8KvCSgwXeaPYSc06fTiFCjoipf3+yZoj57CoMs2WOpueVMdfzB+GUUnbrKNH
 RVT7TmpueNnbxFssGf8yVy91oB8LUPk=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a506758 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LFGRwP0lTeoBuEiPW_EA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyOSBTYWx0ZWRfX/wMTqMmIJm2J
 QY37u5c+Mx40jjqrHXefj92ITk43M9NWlRQ9CdvHU4ABSYAF6Eszkyj3/t3E5IEbJP3U9NVad1E
 Ud6Yp+o3+3g1FPQNaZ0CJ+nRCIr6KyOT2EFnyXRpKYBooVp3nz7f+ppjH5K/u5sdLA9lO1niYLv
 y1SrqHya0BwNI5CHlgfD0mJxi7NZqAGNzztFsAb/8GzJcceVATrhKf5bgpkhUza8hmY7MkpoE+h
 Z8zhhijky9+UgIG4DBu+L+0Chfwav5yn/5p5jUiLMY2ckZFH1yHq85aNRnXEcqU38zJ+fNngJYF
 lWB/NEKp7xPth55ZoVCuh0pVdb3olshtKZ7xw+Zu3N+BqrlUQfZqLxsCGYH4St7VT3lMRyjm7Xj
 uXyyd8/BdzyAaAZsGtBnXKY0tb46RnS0nnmSF8nQerFIQrW6lHLCsT1mFu87kvrMJkhkxZylsbY
 SAgV5xqUC9CYLAfBUEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100029

On 09-07-2026 13:50, Shawn Guo wrote:
> Add compatible for Qualcomm Nord FastRPC which is compatible with
> Kaanapali FastRPC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..24fc0752c11a 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,nord-fastrpc
>            - const: qcom,kaanapali-fastrpc
>  
>    label:
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

