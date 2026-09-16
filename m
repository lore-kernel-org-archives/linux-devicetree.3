Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D33ABD99
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526281; cv=none; b=e0RDPOODfap7tAtKQvq+tqA/bpdygpNxPAhRhG1eiAC5c2ghtNtQlIrmeDVyGx7596CdDcPwMh2DLP6RY8tcdQ1BofMCovHl0Lew7FjAxXI5Jl/NXUZFov6lKZkT9coIm3+YPGHEkC6cR1PZsAxLVV0IOB2F8Stpyz9yQwtuScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526281; c=relaxed/simple;
	bh=961jdHrRF+CpRyf+gLUytWZa5PuCuoe74+y26BY48x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7LdIgRrB0OqY1Wj5MPP2RwJkJcUI6P0lRqDoISGESxmwonhO8d8cjd9V8zolOe/r/9LXIUcshOCVcTYoM2nlKKs1zw7aXdzN8ANTrBR/jRlsB5AW5ry0nkM8M2IwSuFftT+1HPsTHWEWwJYt0ncpHNhmkmuLLx9BzQayBKTYdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5cLV8lW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbWG0l+y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5cLV8lW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbWG0l+y"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYnFK619821
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Ot2irSkqtbh6OTjcjGmne0Mptvsr1+OiCwl1QsDtCg=; b=J5cLV8lWWy3Gu9xN
	DJGvI/tafSMffYE0TwJ3QJmo/LQubDlWYkF+OiNTTSJoJm38WRIRWVqMRwjLGv2y
	fsd3PFW3MNcCL1vJN0yA7sOi3XHEEiuRkuNKce6O/fvNm0Fmw1AI+sVIcABoHQGd
	AUKs7olhKw/7EI0MWUTVZ5QanTEmeD8TCQrTsx0QR7cS5odGS4fnSCeToB34jPfC
	Vo4AwuyKjRtAZMuPo0CiIZB7XrcdDD5nWeg6coB0NqhqNEBmFFcc/if/ZN3V7pS4
	wvNz+cz9cXV/36jAtV+UHDxc48mftmiuxlLQYdQqxAKEdCIOqR798bi403lDF4sz
	PybGdg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq2y2ma7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 02:37:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso9494665a91.2
        for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 19:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789526271; x=1790131071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ot2irSkqtbh6OTjcjGmne0Mptvsr1+OiCwl1QsDtCg=;
        b=YbWG0l+yUZMKe1AcT2qNCJ+upJQOFiBnaKq3I2TIGs3/RKCSL9nQwwFQqH0nHOTqTs
         nqXETsnlzcSE8Nktrn/kiympJ626l9wXeCAAAbucRpt/oNKq6i7yhZRBV/I2TCpAubAt
         TnyTcvjwfI6NCawYVXZEvdchMeHWOi6k8CuC4Q/yiBnxeyfk0cfub3BPz2PqFPCyXukW
         GsDiBbVYV3sf3beNQMqWoivmtj9VsQboAGKPoQB6R3aa6oPHk08fAU3uhr07SopwYGVM
         FAf71hfi8U+jpOVMUVHlGj+lOqs4mOVos981NpzpoDLrk/Ahi8Zbd+9ZC/RkJ8InQtYT
         w0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789526271; x=1790131071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ot2irSkqtbh6OTjcjGmne0Mptvsr1+OiCwl1QsDtCg=;
        b=VD4S7OYcnvvvhLhr8NTM5AgM5SOb/AFFLZyKLSGMz+U/ZWUNf5jAyMbjMoVPYvjRbr
         3T3vRduO94NNwe4zDldfvRQeReHVzLJLd0nspZJHmq33d0jBc1XPIz2hWZEpoWl5IU/T
         uN0B+ysmJ8mxfR2AiOBJ3AnDSTnXf0pU9jcfdT2KsbxDri28drbv5UL9vBExKJwMdQxx
         1623aTB2n58HOdEvZdzzYB3/vXVN/yv7lpVaR3C5yr7yiOSWMR3e1gMKHwWjKN6pc8sD
         4G8SBBBQO/+gn85XY6Vt+IVm1phIUJbbyP5JH6GdUqLepwEbLwUh5egO2xdocf7xhArM
         oWAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmwl+Y7IkBizcCmy1lrPz5W31c1Ipl1btBv0yA/zZ2n0l4VVr4yYVmIAgAibPYN72f7MkOUX2rX4C7@vger.kernel.org
X-Gm-Message-State: AFuF++kT/xuIlPc1a5Lb7FzumaZRwos6W6UxdOlyPJP61MsgTg4La3Jx
	HbF3c4ND/uVAYqQOpQ4HvGozYjC8kxfUt+GJUtqnqTZzKGBrSy5IfdX2kGcz0WIOmTn82UQFbV5
	zvC2eN2EnoMXcYcuw14RdbMjgSpO6Lj9UXiRBwl9Wy0lfKM0+mmTrTo4SJ9ng/6H0
X-Gm-Gg: AYBFou1pgJoo8cVplB2frnq7j0k3ILIzlmv+d7Gij8rhmCTv6Brufihy1zS/D4gHOdx
	eyi4VAjEdBpWHL3D5CGcL2KPrQ4lko64SLBqhnvQn83sXE87lQnwRq+RSITqxupuplHLq3sfV/9
	mgSpvaD/HwoLzYA/TE4UgeL8rmZPm40yg/31GIjH4drThk0zOymS/XA+ct253X7lztDWyF6JKOv
	7XrIpa73HetiAl0hv/swpHSy3WkMV9G9E6dLfmWZLMHypS9HKwfeQ7axDJgvgz9xcTLq/zTxLAG
	prwxoHRlJcpNVGUYjBOlEfmj2JUDhj9qkdNqUaNgV9h763KWn1wV+NEL5dUGip0g129dZ8YWbNI
	fw3t8scpI8s6U/H9Z1BU7SesX690=
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr2128052a91.18.1789526271217;
        Tue, 15 Sep 2026 19:37:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr2128005a91.18.1789526270731;
        Tue, 15 Sep 2026 19:37:50 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19d2c925sm649854a91.1.2026.09.15.19.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 19:37:50 -0700 (PDT)
Message-ID: <4d3ab72a-bdc8-4bbf-9c27-c5bd124f3ba4@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:37:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Ripard
 <mripard@kernel.org>, linux-kernel@vger.kernel.org,
        David Airlie <airlied@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Simona Vetter <simona@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Conor Dooley
 <conor+dt@kernel.org>, freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com>
 <178947727730.1548829.13172666413996021793.robh@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <178947727730.1548829.13172666413996021793.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jRibdK0n75rSGoc35LUrsemHmafZcV4s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzNCBTYWx0ZWRfX34ZGIQ/bVQa6
 WM4k9Mh7QzkelKPCupEE3fhtWGt5yC5S+KcQg16XIzAnITMHvLZML7MMfcmBfuG3mlbTmbo+pW2
 XoH5EZqpv8hTavE7hBE490D/A71BzKtx4Zo1OX/J6L7Vfhpy35p48AhqUXsPywaHJ2Qs8Eq/Gkn
 bv3hEngwFg+UKNRp3U9z+lQ7L9u+Zg0p4tHeH/fbUfTHHxARcjMqAxZPOQ9//szXKv57i468S1q
 rScgcNwm+dctI661zLsw0E+EnkxerZ/FOvgHVfIND4Wb/472Zzv83/MRNcZryOaDaJV2+wPnQms
 GlM7LMDSv49YV3CdYp6AyIufm9kO7OaMNfSFGYOQF9S1fxlNY/Uh+4OqVh4AKTS1hgNbvkOzTUO
 Inlu9kkI69r/voNCYEcfh7fWD0YPlIOO5UTNENuQC18esziBthurgpNpEw1hpbjokBJ2wPUQFvH
 m+1MLp6b4QfSrMawFGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzNCBTYWx0ZWRfX4mV74yfblJyT
 2S/+AovD6DBTltSXBEyvftlzi08p7SSS9cxDHd1Jd7dbC3V86JojOycXvx1u0n5LsTjE14d4xpg
 6vvD/LFhADcTCLG/hqJ2I6UzLDV9cxA=
X-Proofpoint-GUID: jRibdK0n75rSGoc35LUrsemHmafZcV4s
X-Authority-Analysis: v=2.4 cv=IcISymqa c=1 sm=1 tr=0 ts=6aaa0100 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WLdAmb08tD0yJPlYAzsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160034



On 9/16/2026 3:34 AM, Rob Herring (Arm) wrote:
> 
> On Tue, 15 Sep 2026 17:27:48 +0800, Yongxing Mou wrote:
>> Kaanapali (SM8850) has an additional INT2 GDSC that powers a subset
>> of the DPU source pipes (VIG2/VIG3/DMA5), on top of the CORE_GDSC
>> that powers the rest of the MDSS hardware.
>>
>> Describe INT2 GDSC as an additional power domain of the DPU device
>> rather than of the whole MDSS, since it only supplies DPU-local
>> source pipes. Restrict the schema change to the Kaanapali DPU
>> compatible via an if/then, so other platforms sharing
>> qcom,sm8650-dpu.yaml (which don't have an INT2 GDSC) keep the
>> existing single power-domain constraint.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dpu-common.yaml           | 19 ++++++++++++++++--
>>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      | 23 ++++++++++++++++++++++
>>   2 files changed, 40 insertions(+), 2 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml: allOf:0:then:properties:power-domain-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'mmcx'}, {'const': 'int2'}]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml: allOf:0:then:properties:power-domain-names: 'oneOf' conditional failed, one must be fixed:
> 	False schema does not allow 2
> 	[{'const': 'mmcx'}, {'const': 'int2'}] is too long
> 	[{'const': 'mmcx'}, {'const': 'int2'}] is too short
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml
> Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): power-domains: [[4294967295, 6]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml
> Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): power-domains: [[4294967295, 6]] is too short
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml
> Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: display-controller@9801000 (qcom,kaanapali-dpu): 'power-domain-names' is a required property
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-dpu.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260915-msm_gdsc2-v2-1-9157237b8382@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
You're right, that's a mistake on my side. I'll address it in v3.
