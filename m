Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378D03BCD27
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774800; cv=none; b=gT57fvgwlgw4+pmGNg4idtnj1R+1re4IEKoWwEtJJyfUjToGYLY4A5QY9cREPwHEBug4QBj437oqIzJeES9urbLC1FWpTVo+S8yXID1zzmsbMxWIv5DQFYKB89PhUTKPeJ3Fw/gwOsU7i0ole6caPVCLaWYtNmaFu5hTRsxLjSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774800; c=relaxed/simple;
	bh=PQFzKq4u1Zz/DS7sc8HllALi6A+WiTA8yxPA4PvNbK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1dZdv3N/1aRt+LZ6282tSfBMgwhU9GHCmxBwMUDU0HTWrRkuXjJSDxod1DAQSVbzpJIHC/nbphzAT2ikvKjq9+RkgGa+Q986U6URCvxdWR0R7ymlQ1VTbBADioRp0TiCfUzbM/u1mz3UKbJg9rC2n3waBH2Jxe0ugvhxCWwTto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaLU2eiK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bpp+yuc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaLU2eiK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bpp+yuc2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G1NL1157433
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=; b=iaLU2eiKyGioQKfF
	/1fGySA5k47KEhF5b7rmC+ewjIjlpA8gHmg1f2K1rynLSajU8h3loDZFIzXimb7U
	5Td/y5PXvhBxvY7hi0F0W7TOoNeJsCTT3O8mfhL8d7pLvup+prt1hIiqJcn6cUmY
	OU17XVNl3Uevnom7ONAipUD/sFYQTqDwTrJI8K2SSViWZqze7un2V+JaK1/E18Ef
	JKwKRR5OVCcSvbUX8UkMQq7IGCWNAX8d3xtojTjKDlgouxO6hmsQ7F9yFHb04HJt
	fN+1MT/OC5Nt/WWguR4EMqsV8IqhFPFc3zk9Jmzp4XRq0yJ1UuCau4T8T/GDxd16
	ER0Jzg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev19a2rbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:26:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915976b2dffso15148685a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781774797; x=1782379597; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=Bpp+yuc2CVZYKrVbyXR8w1vgB/NtC+URg00vc+C4YDcl02RIGYnO/9e8eFafhxKoFP
         8ARkK9zLtGU1zkeqEICgJZ29isUBaDFcwJTmnpjNbIeJbragPx3lBxDAQtZc5Tos80aW
         qVgjN4veevfn/MPCk+y4US8VN/BKdDjAufJNP1QiVvW4uhJbcfS9+vJkCWiW2M8A7AnB
         WOLyf92AaLPHbPhgo1KnCfDSmaS2BmzpPLnR4YTaN0Qum9FyZwed8oRBloLLrfjKAopL
         zLGPD4DxwOOczpp5BJDKWXV/PwCR/tU17VddlsGb7mNHGLjCjVxwMuV9srtRYUWQ01+n
         7C4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774797; x=1782379597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ce3Ew1kgGBzVv6bcwdm6x/HblgO4rzUZSXd+QkZ2/04=;
        b=nbsySoS+DZzp96sV5UuUn8wa6bjZEdKTLrlkBRs4z5BqpX4cILJd6P2+Bm1CLx1alq
         IdY4MLbfraHT1JXZBxzXyz1cSFfBo8hdYk4I15obM/0DrvNZWUJ6g9VOMVc6rN4ERZBw
         JiajE4k4je1n7xb5lTZ2KtLHJxXBLfIZLmhgfb9CY1Jk8EXl+EqK9tQRWlHu44L7GHwB
         OY0rFKMt77YCq/bBnj+aluk65gEsS4MYc4wy+hcL08FHwffRU/nGL0c+K/kfQRaS581K
         rHKN7TnXWtsnO9j2tOVK91grJ7a2bCtDOmmlqUg3unO/M0HbhVZ/KoFd0u85TM2LLwJk
         nPwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GPre1R0FwZlXdQmsCzlwg6+tboEsTjHUAXFrwZxy3q6adpU9Xm98uFQIigx1au+1DnbI4NgMajpt1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsn/XmhFTwug3XGZU/T1FkBwBEv3Pltqfb2HJ/fBweGlCaJayr
	eZ0vHPqmqdkiQBj81l5LkRY+AnWzxixrJKapU3S42lLYUNIGEm8kfWxWm54NMn7fhleOmSPiM46
	psjGtC5q3/bdNEJcmCItx47kUYDgbQsmCc2VvVlfcp9+9bJW23N+jBYXEkl9X0C5c
X-Gm-Gg: Acq92OGInM8AsA4wio9uL83bd0JnxV6DJKHQU3e0Jx8K1+9cT9+/xKEF+LfiwCWY8tQ
	EQF4TjpcOZJ0RHyVeMR58c81jvBsjyZBb5zEVonnss3jzTK6+EiKx/xcuYnbKt5PqkOc9Q7onmL
	gPv6L29jNcTglvjB5Srk0J+JbUug3UHG24nNFDrNDb78kUXegQ5amQYvwPm8/d/Z/frUl8Zr3d1
	cBMSBVKmP+C65mwYe7n/PkyU0d3Bu+oOe0SxdwoWm88U7f/BsFjb/zscfAyS2Cj5WxD998+PNpP
	yF2HD2WnhXP0rOMHigpc5kdK2Kb/UKzc9Ymgk+6auizAhksONa84sY8E1kIgFZyJA6NjKF2lFAm
	L5WJ3Dtev9EG7W6XG+xe3ldBF2FZeNygbwLs=
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290817285a.7.1781774797384;
        Thu, 18 Jun 2026 02:26:37 -0700 (PDT)
X-Received: by 2002:a05:620a:458a:b0:90d:11b2:80f3 with SMTP id af79cd13be357-91f2b477d71mr290814085a.7.1781774796807;
        Thu, 18 Jun 2026 02:26:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb83428a8sm925516266b.44.2026.06.18.02.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 02:26:35 -0700 (PDT)
Message-ID: <3384ecdf-599f-4862-a3c4-9f54b4ddfe63@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 11:26:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YbmNIQRf c=1 sm=1 tr=0 ts=6a33b9ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HaZQysj9wVKA4b69cM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX3VXyeKfB4eoU
 0M1u6eLRXy3DpqRDb0Q0mBspib+TigOlAMeGkjkNZXvdlMmNlQ6MMVodExDKOp1vu5k/s/2KqfT
 ShASj4TKSMuTorrPgP6uAL8acTqgEKE=
X-Proofpoint-GUID: oDkQo4arUALRB_-l0tg_paMLYLF2ZbqA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4NiBTYWx0ZWRfX31mXWweglQg5
 lMB77O/xzZMpz6BbbMsJaEZ5TjhWHJg3O9NEnf5plmlKkOGWvALK/WUrWF0vZx5vvDMISEzMMqs
 97RTh9hchYPznMA9LhMzpGezEuiIgIkNJlkAbl0HSy1fXdoXO8PU3sNwd1Sd00TNeI/00VUtyvW
 BbYz3bFVaY+hUqq00jtp0Ycp7IVd8slJOwMaiQvpQx+sJ3G0T3cyQJE2rErkP2PTA4uOIqOvtCQ
 BhAOUYwcB5x5Un5o+UJCiz6w+C08/PSuWW2xk4i889IlkKqewibe2no60WLBb4at9PEAcFgc97d
 oobaAKuZq2Hgwepc/A1YR1dH7eoR2Zzc4+T1sDxeId7E2xSDI8oz5qtNbiMm4jj5qEiBWViXT6u
 We/qa3N2SZ18HNnCeU88EDCrxhsej+JEUtabdTxAnFyCHSgLnWXZ1Fsci/uewaN7YNKxC+BHVbJ
 pP6VnImnK7fZPXg3h4w==
X-Proofpoint-ORIG-GUID: oDkQo4arUALRB_-l0tg_paMLYLF2ZbqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180086

On 6/8/26 4:37 PM, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
>> On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>> are accessible. Without this vote, the SMMU may become unreachable,
>>> leading to intermittent probe failures and runtime issues.
>>>
>>> Add the required interconnect to ensure reliable register access.
>>
>> Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
>> be voting on other interconnects too? I guess so, because currently I
>> see that TBUs vote for various interconnects. BTW: should apps_smmu also
>> vote on the power domains?
>>
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an

Mainly or exclusively?

Konrad

> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.
> 
> Thanks,
> Bibek
> 
> 
>>>
>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
>>>                 power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>               dma-coherent;
>>> +            interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>> +                     &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>           };
>>>             gfx_0_tbu: tbu@3dd9000 {
>>>
>>> -- 
>>> 2.34.1
>>>
>>
> 
> 
