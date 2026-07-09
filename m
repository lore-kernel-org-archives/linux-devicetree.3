Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881932694E
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604573; cv=none; b=S5KWjejfimEltoFRI1tE4ilHlLUSAjnvWhaSEKhqBrfNy2vF7BQLvGipskRK5NTClqLiUfJjCE9wuj1vC2NfkhjAFcvQpmeJxoqbMRuo4W/5J5JTmzyN0RY3bAVdN2gikjAo3jKVaWiPUnJPB9ebiMvJcCLb/rjgkWLY9gJEdvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604573; c=relaxed/simple;
	bh=Gg4niW8kVv3b3g7jDE+c+5OksWid4lupNeBKdemEzvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOayrRTe+H9lPaXvlS26r+whwDv2tMKPq7TU41x+/H7y/kCO+ucI/iOXmPys7KekimnogvjsU/dzcP5JQn1V2W41VsvujS/J7CHsyjXKbHka0QGc0wHUDo0vRHvswUR76sKL7r7DEUltiZstUnk+BqU/CqsNOVDYMQ62YeI/WLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9Hch3o4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X7ve4I0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9Hch3o4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X7ve4I0I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNTvG1575699
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=; b=F9Hch3o4T7NJsf1P
	wYr85a/DCvN6Lk4nLUGhMp6PTQ8FGNyRBL4yiBFkchly0uHRxjitwucI7vHbO41Q
	tJnar2UtGCxsFj+B9TnV3UlOd8lNnGyad1xFdI9HqkhQGq1dnAAE75yCjkndoECa
	R4gcK36CkRDIXEBDX1V7M1Han+SiynAuFBVvkiZwvIWLJuLueTQRYwWZH1yDT+z2
	4fLwJINlvXvRhk4t6gZnB0o7DCb9bUdfxln07nk7QowDBzRE+SHAg+wyvCC9DSbz
	Mmq2P3Ufltc2M6WYNQiyUmUJ/CIbHY6mcohhCoLsG2pqULDA3YRb2fhaUH9vjLSW
	DbQShQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwcfxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810e5c5871so3475962a91.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604570; x=1784209370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=X7ve4I0IczmXIz4pogUOghKS9qyZaLIfkZ+VEa8uep+AjbWe8YhFk6vGqlcjM2fGx8
         1obN7x3/nwQB1Uka0QoJMWZBpPxT9OWEY+OxTflNYMYMGY2WsPUPkWbcdcAsh+RwOjv2
         iVFwubz9byKWl1yGpfLhy6YGE0rZEghNbfLJM8pmPov7EUZAc+9wctkMFqf+x8z9bOOk
         YWXx1oYIcqZyNWR70KNO3GL2QIbomq4DNsbfWhbuHAxB3RzO0RRwV0AmSccyZ1QRD/bR
         yht8FHHvvPKPZMPoxi1Rdki1xc8Gg21IEqyskDOEIWz6DM2ERSYFJHmts7IQ5DKPFczv
         gmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604570; x=1784209370;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8bbQ0UFrJNgIEmJIIRtCAu5z0XVNIydSzCgLYqggsw=;
        b=bdAzatJKdGdbdYkKXOduRqxM+gKt+L2RmJSgNZ91clh/ltPqVNv1JXw1pud+z0ItHF
         bD6pS2bNtnEzc2k5T3Bl8e7EgOPfTht3cP3rNOONzA5DYOJ+VQ2cMa+pvUlKWfsCUADP
         3N1s9Lgsmyu380V9Hkr2M+u+kl0MfIq/qNEX+FDiEDZn34qDOiEc17qZq8Ydejpo6DEu
         /pTsDJ2s+qEsx3C7BYFlhQlOoXLC2xqyeM+PZ9gycoMh949rxL2QdpOD+MI5uifpHPhe
         W8yFvSzSbVtP+E2supmIfUYG4xEaol3XEZOcl0MHez5g7T+tN59I1/DAfu1UH27w7Kto
         4UXw==
X-Forwarded-Encrypted: i=1; AHgh+RrWOEjOON6X3JcqeHD1F+XlJAkw6DQ2B+vdDroUksQExmVu+F+gZi0mS/9LgI/yt4QPGop4N1/VhN1P@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfCAh0hP1DDMHaRX8ST2lKvmbeZRT8wMj02sZd/5mko01B2fW
	yN/eDrOHyXhH3W4DdlcWCyWRHxgy9Bdh9qajZ87F6udZursOC5V4niqYKYo5be9IrSiiuRpaEfW
	EhONzJr2AKIjq9YBg+b9DAW1sHR6BgAe3JWn7RHboVmyVaXFDLQk7hxYicbxvRmMl
X-Gm-Gg: AfdE7ck57WQEl4nSytSBgX5jVqT9OQ/oXiboTPlsVtbKcWII+4nmN4Wj23cr7u/YSEj
	YFHGjxab6YgdU3NaKHY91nIYNI84GlfQX3lLrZHhWgZ2DkIqyLKBH+fFyUBU2k/TKEqzj+PU9xx
	7pyKgunfsSI2awSszubcVOSTQ56r+TBZBFxc9f2QRdQZrcAJ6hPV37VNSstRdoieUSh+0MnsutU
	emXxKRZfSQNijlHpnIbjrfqGaULDi7HrSwY8Xt2ZlTOjz/NbDkIdszDEgTJCPAqia0p3yzPd90M
	oHOemCMC4U3qAgvmqDFmzc21YnseH6yfXpXXJ7oOJ/EFPcu3fgx/243YR4/2Ba63Mm1T7GmZ21v
	Gy57GjDDGwd9B9Jrtho+G/++fWHTFoH5BntA=
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6905008a91.3.1783604569742;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
X-Received: by 2002:a17:90b:2d91:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-38941102108mr6904955a91.3.1783604569291;
        Thu, 09 Jul 2026 06:42:49 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174892711sm32820196eec.13.2026.07.09.06.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:42:48 -0700 (PDT)
Message-ID: <54cb37bb-aaa5-4c5d-a563-acca4822dd35@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 19:12:39 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/13] drm/msm: look for lpac from dts
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
        Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
 <rwohvfbsw2brpxrfg26egu5arwe6g7n2etelo33eegmu5cz65k@3syofuxzsjrc>
 <dc5aef2e-600e-4e97-b76b-dcc8bd72c709@gmail.com>
 <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <m4vwrqt6yyaawpvkyrqfzs3kbipbhygmtrhphuthl2gmjvkgyt@u2d3dnvl2phy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX7q0NTg5ftXXN
 o5QyG81a0I0rmAfIJleExai9kipAIDID9utUKp+kA5YeqmuKNQv5lwLr7dvQbCN6yMmxVZGUtfP
 lRRIRFyQtmp7Tm1q9sEMgHYN0bLK4ktHl9wAP/O8Y2xkXsUtmK8rU6/uvH47f6N3mt1+dD7C20x
 WKB9nUhcYWHIwLNdjS+JO+KWfBJRYEQVAwH90Pgy7/lJy2nlpSRuiKy2Fdxw5kV6m0EdQFDJP9o
 QjPJRgWJX3k6KLVdSyZlfhED2invGq82R4bNd35eC5ejqs5VVWzFbtVl+V2g0ocZAe/IoN9A45z
 JYA0LVC74K/FdOGHkUepTLBLTOxFY0oyqyMlGhiLSL0ubstAVYgpe7UVMnqBKDC7xNagPOh7y0c
 OgF4slxbCPCaIzAHhCUaIyJfPEuvyohnyuXadAPun9pa3zNR8e92Tb05ldo9CmVXzh84TxWYML+
 8drrbf3OI6G9iK+b+Cg==
X-Proofpoint-GUID: _e5x6vg-q_k_n4AM-gOBtEPxgDmrbE1O
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4fa55a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=9jRdOu3wAAAA:8 a=pGLkceISAAAA:8 a=mritAz9d6wIG9kTKuDcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-ORIG-GUID: _e5x6vg-q_k_n4AM-gOBtEPxgDmrbE1O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNSBTYWx0ZWRfX+N7F+9zy0KUK
 1zgu2PdIhroEsQBskHacnMhyWAJfDflrIbWyejalB51iD53pv/t3TLfonGv2DEhTEzxRq5uJyZm
 NhrN2/5j2pOueYsO3vVd3CwRfiW9xwA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090135

On 7/7/2026 10:09 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 05:02:43PM +0200, Anna Maniscalco wrote:
>> On 7/6/26 5:04 PM, Dmitry Baryshkov wrote:
>>> On Sun, Jul 05, 2026 at 09:13:37PM +0200, Anna Maniscalco wrote:
>>>> In order to associate the SID used by LPAC to it's own domain and
>>>> context bank we need a separate node on the DTS.
>>> Can we use iommu-map instead of adding a new device using the same
>>> addresses? You provide zero explanations, but it seems like you are
>>> trying to separate a part of the GPU into a separate device, but it's
>>> unnecessary.
>>
>> What I was trying to say is that we need to map sid0 and sid1 to different
>> context banks.
>>
>> From what I recall, so long as we use the same dt node, the iommu drivert
>> provides no way of doing this.
>>
>> What kgsl does is having a node for the iommu and then subnodes for gfx lpac
>> and secure.
>>
>> The address on the lpac device doesn't really matter. I have very limted
>> knowledge of DTSs but I think we could just leave it out altogether?
> 
> I think, you were poined to the Glymur Iris patches. Another option is
> the QDA driver being submitted too. Both ot them use iommu-map to
> describe the same usecase - a set of SIDs which are used by the device
> but which should not be a part of the defaut set. With it in place you
> don't need to have separate qcom,lpac devices, no additional properties,
> etc. 
> 
> I'd recommend following the same approach.

iiuc, the conclusion in this recent thread is to use child nodes for a
similar case:
https://lore.kernel.org/all/20260618151745.GD231643@ziepe.ca/

-Akhil

> 
>>
>>>
>>>> Add the code to look up that node on initialization.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
>>>>   drivers/gpu/drm/msm/msm_gpu.h           |  1 +
>>>>   2 files changed, 21 insertions(+), 1 deletion(-)
>>>>
>>
>> Best regards,
>> -- 
>> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>
> 

