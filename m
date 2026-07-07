Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E2C3F88BA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429658; cv=none; b=WxHaTchQ/FZTDG3WKcfDRFDzgStDE9XoUoweeq7VP8y5rvZBOK76cbWryIBFG35QLQ5YwGDbFv6cO1UD/t0KUFk46ZQgTPUHvHr29lIMoiAofpsosJLbckLVkqvKNT/1+XXWd+qtW4N2tk2iSfLCZJ/wO3bGlJpaNy23aX9MlCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429658; c=relaxed/simple;
	bh=KpdPVz19HVrlkW48+Oy2TNpS9/8iY6PDbSnX4WVderw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ab2IqVcRdULzpI1bUFuu+Ijvfzm3SCRQZqVKomQ7QZFHV54Vr5CiZN+c3Pw9dZ1CWwsKyVCvwjzAiOwPJd9tbasRE8YB565+K89izittZaflDPjX1hEi0SiZwACLH78hglVgomtuH3YLDQXT/17FFWBK5/tCyiMgDpobzKiFipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7lEwIfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3zTvpGZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7lEwIfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3zTvpGZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8qBe3749180
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 13:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=; b=L7lEwIfhmrJlWiNo
	1bnUAJMzW/LSGvniuGqYWeTH+CRlhdbiiwMOfmYghtgPHbaud1U60yXSpGBgrTwO
	+zJywcpSoeIQxfF7kb1NPliFdM9z663U9mRl0bVJ2M09b2R0l5K71RhzBOHZ8F/a
	AjKXzUTkpg9zq28puAcPT6U5NkZg/h8HOs8/B6Akgo8FvAqDrueyHe++jUNJAt5z
	SLHVNsNV/IniHraf8Q6Qk/Lv/V4WxvEx5pL7TGLWjd2eclnwa1kGiFhgEozYs3xx
	c+6yrUu2RwKh6refVw23EN5lrymswM2TSZcA3q0OOQw9tiMO9OmI0uYxhNkknl2z
	a3T8Xg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vdj9hfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:07:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738d9935e23so498420137.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783429656; x=1784034456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=W3zTvpGZEPdP+DBfZhWZKLstoz1NEOoinmuRmvZmyHnXyPEicmnUtXnUUEcW/GlndM
         Ek6dz+tOhem3BwnVaC7GpNTCqYEC9Eu4ubzGd3HTIConiDN5ytDinsdkhaLukhtTl7hF
         nj+OOiYTIlEx7i+5Sq2HRbIt0TzKhWxut/7hVF1XgvLv82Kf9vjSFZn0Z/LX213IzqfJ
         6+nnHd+PWbuoapvzsDD6aOYkI+CGrlGfWLjYcMj9mr/rC+oMch/35SMaElhTA24WAtLc
         7fsb6cWmqbQNxMJtlMPkQADCVJ2yw+2UwRIKiUJWD4wGc2HCjuDuFclN4jZkX+Kiw83+
         ak0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429656; x=1784034456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnXcQ3o0MMmuZU0mxgw/WDOefXkSOTgmXJB6YAntbRk=;
        b=BtI89rmTIlFrTrCFaCAG+CPAF+QsIIGYk8G4k1yvqwLINyFx+54bg842HR2bkxzu5I
         Eq2yH7PXETjZuqI2Lt2MPakccQIU3Z/yVAIX3sRYrFZQ5WSg9LbJmEPxp6/DttP1jCY8
         g+TMBO5PoPkjc43XUXgPO3H9KQWKDjN6o5u8G9VWOFhd+KCrMvisCfJwpOoc4ZrhnNZL
         67rTKGWD2pYhekHWkbpyhA480VEJXL+FFSH+7WVKIyKYFHwFfYLLCCQJDzCauuacrXDO
         C4s4YxvxVhGnnix3WZBfHDW42WUbIs2zCNLeKmyHM8MEOKIcMxVxgKbVj6J31Zze/f2W
         XtwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyypVGHKN5a43PYXtB5j7iUGo+mq2JwXf9w3DNSY5xXJUDrnVgCtav3g3wjLeH6VjSD4DALiI7ElAh@vger.kernel.org
X-Gm-Message-State: AOJu0YwXDhwAIxkv2pf+VmSQptOJ5siY7B+D2Hssuz9LNg+XdzbrIT5G
	zxT24UAbF50BRJPCnwtkuBXfuxWdg9S+GFehRTzx5KczHgjP/pEWBBxGL1VsV4mZygXRplqG27k
	Df6PnCb4tZCSrWCxBBt5aDozwuvmjQ9iVtZXh4qTgbsdujkAPNgmg1G9DMeAh9BKf
X-Gm-Gg: AfdE7cnKHh0pI9WrXGrUilkFqikvaJGIOWO9hYt3a0WykOHm34/kQOqw7TX1XCAnERV
	Dtcz2BI3xfaWeRXUr39NKdawWxNpWiJjvXtJOK7jHtGBiQ6PG8Tw8Gmj4BHft0Bt7d6Rden3754
	WuJkrP2WHbH7pzwdzMGUIH8s9Q2nKPc89TM14hWJkuQrNzkDcaY/2xdn2loKXWUpucV6mTy1vqJ
	OGzxHy8KU36FymWjcdjEsokvTkeaeLcz6tzqoXyozPduvpF3LbEwO2PKm4q0v8fd3i4m46/+RUG
	AxP9izE/qZtkFfzMH61f0L86zGVUij9PyvVtxCCv4wZKiSxFs6upFIv9YjLjWA79CmUhYQl3Izn
	Fx3ZGImhMbmB2p0sP5CsnYjatpXtUNHN7ckwga2Q=
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2503003137.24.1783429654291;
        Tue, 07 Jul 2026 06:07:34 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:737:1ca6:84d1 with SMTP id ada2fe7eead31-744b7c5e3e3mr2502943137.24.1783429653657;
        Tue, 07 Jul 2026 06:07:33 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm3703700e87.32.2026.07.07.06.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:07:32 -0700 (PDT)
Message-ID: <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:37:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R7cz39RX c=1 sm=1 tr=0 ts=6a4cfa18 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-8xGkPWzXzLllqT0I9MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: LfRy3BW91yMwA_Q_LxA2qfwmbkLjaEKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfXwj9bSqI6lAwE
 zEuGsoE6b3T+MBDyAxy1Zd8p7iskZJ9D3Bqb8Yd+wHxcj54siVn6kF/2PJVsAbPGGnnHOQNXmyT
 hF1RS24+fmFnZMqEg3hctaNEmMeAkiUmNXWV02UuBQChNX1+sP/O26uJ4NtKTZeJRS+OTdSDVkP
 e6aljSBSZehFxPb584T6tBnq8LsxJ8600g4jUle7SdAGpM2av/ij6tJv5OU8w3D4C/S2Z1YEM1v
 Rfi0zDfVHCZCQLCBcqi9n5m5ccJtKE3Xem1qZadjQDI4B9zj0oOJLpDeecqdPvNF4GiH9s34Sef
 E+pAYaC5KyoWMguNfo22Pb1hdyXL5umSMMfHTe/8DRcX0u2la6HgW5S+vc5Ei0tHpfFfZ9PuNn1
 nFtZ/A1/8p/tInNS0YK3RZzpmphD0h9eKvtKkpXRgkLVgZYgolWT2KgHMtGNVan03+bh9Gtegyr
 /nA9H7s7XVuvipAIUUg==
X-Proofpoint-ORIG-GUID: LfRy3BW91yMwA_Q_LxA2qfwmbkLjaEKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyNyBTYWx0ZWRfX8X2Lx7SjSBP8
 ctVjZNgXIXR9YwCIHIcV/seWL87nZEqgKZw2V+bWFeepFsdLfxd3Za+NkEx9jlejPiCac/IZ5Ye
 W89bxAJhTEWW9emy/4K4ZdkRD2S5MZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070127



On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>> are accessible. Without this vote, the SMMU may become unreachable,
>> leading to intermittent probe failures and runtime issues.
>>
>> Add the required interconnect to ensure reliable register access.
>>
>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 90e50c245c0c..721526f023dd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>   
>>   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>   			dma-coherent;
>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> 
> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and

Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
preventing gem_noc going to sleep when icc_set_bw is being called.

> then drop the extra suspend/resume play?

Not sure if I understood it correctly.
Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
or in arm_smmu_device_shutdown() path?

Thanks & regards,
Bibek

> 
>>   		};
>>   
>>   		gfx_0_tbu: tbu@3dd9000 {
>>
>> -- 
>> 2.34.1
>>
> 

