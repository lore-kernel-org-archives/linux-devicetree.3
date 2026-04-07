Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682652DF717
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 21:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775596664; cv=none; b=La2jsuG0yA11jS/LaUf8Z2G3n96o8JLY/IJnq2MTnvxrLZPMH4P9Febxessf5eRTrGX8bdYKLAz1ztwmfhIBWmPFzLll8ax8KUwa4wV0104vxkEyyB/nvHU8h3xRd7OT258TbDHz0bzo8uR5J6I/y9IIMnP/QheUKg3Qt9oT7I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775596664; c=relaxed/simple;
	bh=CW2mmqVPJOfpQ+uwXf2PtNaHas3MeOWFcHTYfSdcq0A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lMHABwDbgwSu51nt74a9rORcqZ9nnbzpLUAeT1DKCPE0WYDcQWnqJ+qXr4axD8kXMDTcr0wMwiSbiAKMxSpR/OIFu/COgtyvjWIQqU9t4v87EMTxCJOxZZ2QFWNj8fMbpuqLb24TjpF5kzdfC3ka1GeY2vXpSEwX/QovcEBzhEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9Z7GZ1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRTrAy0U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9Z7GZ1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRTrAy0U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637JcesC2009327
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 21:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=; b=L9Z7GZ1Q3EFl1S+D
	FtFp7TyJHqGUwFpXxRrSIYRA6txv+kkIweUM48X00KEOV6T6z0Cfhchg0Zj3BLbF
	Z+e0ZUKbBQyQ+V75gWyVBd+fZvhGxjoRj0yIv5DZ3gaQAQYgls2I/T1q2hvze8lY
	uhtGm2yx691Or2svpfLQvIgv0zFO2MI94EdaY98w+vvBE3IZcAo2GfVrmySKhE6S
	W1hagftbsjrgTXR2AFh6Ic6/f1AViEoBHwQLyY1TnbqddzDkye3o5x6SmE4+2/jU
	p+UNWjbhw9618Fa2eU5S7SOTk2D+ZLu7CQe/xMEZSUtT38ihJ7ier+XgGEceV3oz
	EyD1xQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrvkt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 21:17:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c83bd48afso3106070b3a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 14:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775596661; x=1776201461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=;
        b=CRTrAy0UVS9NLszitUdA2d/it7gkgpWC4UKWYkiv9MOlufKlaPh/zgQ0caiEoTpOsp
         qLQl7mSxkvVRYHy9FtH5fzD5TMk9TNWo0zFuL1ptpXzgxj52GKb5iW9tT6CdbBVXROxG
         nlBrGz4MyFy4+x+FJ85STZxJm5e3/+ODAtSaMiiAwGK/LMT86Ksg3yu3d5zicS2bA2HX
         DrBPz+lH4ZphvoCq85ecUet8kzboxWIzByRUsS1yMTbfyzTZi1T6o5OWv2etyxaFxuCz
         ztT/ZkdOS7h6S8Z2crQNBHP7fplLCb/Y2YS5hB1UlCCQvM0izSuURqtzc303cnsdkRJS
         cFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775596661; x=1776201461;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEwzIG/WP3KfeGGQytAvkF+cLGebDaMgBafkG54molA=;
        b=cP+dXlqlh6YKfBEOIKmMXHBCF3w40ccG/nYc9XQARQBJdHk0gDS0KHAw0kCZ5v8xZS
         h4u0m3MVZgH9gIQoJ9+NYmxOiNervKNLRR9eYxGy2Od7HNd9yKJ7HR36I5Rk3J6+cutv
         4NYBf84xx7vAL/FyR9YxB7omFCnjbkjEnFogCYScYkei+edKdu//j6JtGgtJXCV5OO9i
         cfJTb9Ndubp9LpdCpkquNXqZYIdM0d6Z7GXDmQxhjtioh5T+q1U8L1TWx4RqlNq9mStP
         SwQEot9cXLteJLAcimTb0j9I3nV9YblrvHLMbWsxLCB0zow9ZqXgCY8adw+irjNSuhyK
         e2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU3TUAwIvYM1uM+yCYAb/8g7WhNSr0BsH1Vn7cxjD4ulevxGx8fgjlCVMXj71HYvpgXW092cNoisAT/@vger.kernel.org
X-Gm-Message-State: AOJu0YzMv93FyMpKL1+oOd+OQFPirMxS7+97GT2X+nZZax1xigp/O2/F
	i/gAuSLhl5aXrfg7dh3i4sNl8YOYWmvUt1epbBMfSgzKrBKWtgfYuSptB5ZhSgkLKvmKnUl/4jU
	NXeSjh/7XPCV4zfFIUhgdx6EMGhSjsxO59bI3kALsyHwQdKN7C0/8j0wMDgTD5B7B
X-Gm-Gg: AeBDiev3xCJvnVYkeLSTGAzymsGO9dRVSaZvj83QX7uBaA1ms0uHWrqsQ7OdHEKurr0
	0kWaCoJ9jMFXhtlMxNgW5jx/nj1C8nqJBdllFeF9AVyU5g+THMbSS3xtLAw/8FIkspNC/LysU/P
	rhDruiRVAFIS3mJjGgd7BeUEIl5aM/c4HZhQvBsomaAg4bbqPeONefjnhYPJh93XBIv6b9qAq1t
	7S3pshI07BIKpfyD0UCUwhHAuSQAxXCzZcr2+7Frx4K5GGJe5CIuVc8Arn88TdbDt6ttxcCBfdo
	bGbit4WcSc0KzJwc/21gpL5SQSuTjkt4y9y/9LROanuXwGIbmMrYCw0e1qzj56ymXttDxpQWmBe
	rB8nisX7ATwN4dxi93TjWzH90G7W08NaEYgblYqtuTwJklw==
X-Received: by 2002:a05:6a00:1ac9:b0:82d:24f:2516 with SMTP id d2e1a72fcca58-82d0da2b115mr16522200b3a.11.1775596661252;
        Tue, 07 Apr 2026 14:17:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:1ac9:b0:82d:24f:2516 with SMTP id d2e1a72fcca58-82d0da2b115mr16522166b3a.11.1775596660698;
        Tue, 07 Apr 2026 14:17:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm16813935b3a.23.2026.04.07.14.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:17:39 -0700 (PDT)
Message-ID: <27e2e6c8-fd8b-446a-9ef5-802e1af0fb2b@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 02:47:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/6] drm/msm/a8xx: use pipe protect slot 15 for
 last-span-unbound feature
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
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
        Bjorn Andersson <andersson@kernel.org>
References: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
 <20260402-adreno-810-v2-4-ce337ca87a9e@pm.me>
 <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f85253a3-e03b-4f33-a7ae-df18ba01fd8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE5NCBTYWx0ZWRfX6QoNevbWk/Wt
 QnM4cqD8jKLIrdKd1m66+yfpNlRCPpoFgsQsp7qGEtzJ7kq5opbtR0wlNRmwJYL//0QOqJOV0L2
 S5dyIXm+8Tc9f0AqMaH8sGIms3FZtDTd524BreWtv5Lc2AlHP+sPh0Kxyr8jgvhpLTsxqfxvni3
 yocE8DwWXTIolX5G00t2rpneEV2n6SzEGLTyNSC6vacaNr3zpswegxvNCAAKD1i4ZPC5oSBtcg8
 SaWlGnVDqLipblSH6dtfVG6eWkexkncykwn78D9fvBgxWeB15XG9Bwm4GQ69pOciyENUxP7WPgy
 FaldxeBtQNH7BQ6rR6z7WVP1l4JB0Wh5EwbQxNOtAAV0WhfLCX0pZAaYeDcu5Neq7S9+DmgQfwm
 vWCIadmLxpamm5Hhfgr3CzlPy/wroNIyywbhirVm1EETaHfYUhB2BOxVAgjiZGoRNJO2tVe60Oo
 llKi9OPLg0fpTJdIBVw==
X-Proofpoint-GUID: IMNMaAdMCPqNpOCtGGEuMJ_eRXM0skvq
X-Proofpoint-ORIG-GUID: IMNMaAdMCPqNpOCtGGEuMJ_eRXM0skvq
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d57476 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=qS-k9e48XBCiOm6aCyoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070194

On 4/8/2026 2:44 AM, Akhil P Oommen wrote:
> On 4/3/2026 4:39 AM, Alexander Koskovich wrote:
>> A8XX GPUs have two sets of protect registers: 64 global slots and 16
>> pipe specific slots. The last-span-unbound feature is only available
>> on pipe protect registers, and should always target pipe slot 15.
>>
>> This matches the downstream driver which hardcodes pipe slot 15 for
>> all A8XX GPUs (GRAPHICS.LA.15.0.r1) and resolves protect errors on
>> A810.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> 
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> 
> -Akhil
> 
>> ---
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 8b4b022d9a6b..102d5e751536 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -252,11 +252,12 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
>>  	}
>>  
>>  	/*
>> -	 * Last span feature is only supported on PIPE specific register.
>> -	 * So update those here
>> +	 * Last span setting is only being applied to the last pipe specific
>> +	 * register. Hence duplicate the last span from protect reg into the
>> +	 * BR and BV protect reg pipe 15.

Not sure why you modified the comment. The original comment is accurate.
LS feature is present only in the last PIPE specific protect register.

-Akhil.

>>  	 */
>> -	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
>> -	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(protect->count_max), final_cfg);
>> +	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>> +	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(15), final_cfg);
>>  
>>  	a8xx_aperture_clear(gpu);
>>  }
>>
> 

