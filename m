Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5B3A48E2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192874; cv=none; b=gkof7cPNx0GvZOgIyLFVU2y/bRZBztlnRTBGKZuJJolFt38CvOlIepSaCLzBmJS6CrwEqGTt+UMRfvjio0WOVRBvkwSgovChj2mkN/KdgWMM9No21OkWE6gGUDYamoHGqjdah5ags5ligcXjil5/KrgIbqAaL2U6Q6k8VoWPmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192874; c=relaxed/simple;
	bh=gZisI131OsW1JOfB9ZtrAqnDtGusGcVOsUKQdK+pbOE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=O4TKmYIpn1HlqA+ZPaTuBVsvVP69ofwO+UF8NS9tky+nrz6Sk1/wqfNgG4uSFIZ53LSaTVd0lJ77j0+B65644MvQkg3Grb4FS1+m/DDFAGIR9JsaKdtj1fuux28sySK2eeeBwIdKTvc9GXIGE4S7vf9vLn73tNxx1VWVNTlR52I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmxgVxmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMKL1mJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmxgVxmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMKL1mJv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7E3uq2050177
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=; b=mmxgVxmu26fymKxx
	k4DN8/I5q78sOqklkyn5lf75wVLpPMVXBozHESeDlHPRdWQoOrcjZNBXaZj7JzLy
	VN8t34mAlZiWq2de64gnDLC3fxMw+otiQBLqmAT8jrDpUxXnN6dMDr+xUM82KskS
	tyWENLgSAb40JfkU+Val4zx+s6IuXni7PomvTZ9gvNmJXSslACYwTB1U7ZBRGj0r
	Y5GqrL7fskZXZhp2IZKl1IIlLIhOqsdANtrbSXq3JASzOhNHZeYAt4zoLzfDCTbs
	uDlY47bXinMN9MJed/khXP7jyUB4V09XOiQxNsPviDEmfFzTRJ8xN2OmKXUA/p18
	sQWtIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feayfm4p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:07:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2622484a91.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192870; x=1784797670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=LMKL1mJvzwzsQOTshlK76JsS/iERSLKou/7a2rGawVzkpQB+xpMD2OfcB/4sCaCKPu
         c0c59tFYPb/4Y5WOLa5qnhWgPEkoyu6vk1daFH85CRkkHDnhdSdvMNDOnFN444cI8jBY
         l76yavyGqRVIP4uCnO1VnfR9r3yhGAToJOlivCFb/86vkj2w2Nrz7yeiI4mhTP8R7xod
         J6Dng4e1+eQdPPI4gb9MORX3O/7Qf/XUzt0wNihfcDUbqDj3UhufiwcLFlMPElLPvtDg
         Dv98vXrAK2S7j7qVwKrcvMmKuRnVCWkChDTtW6jT8ca23XZpYZJyO/EryFiCnwL8Ea+3
         LLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192870; x=1784797670;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuy1oYaAtubcYKQKuKf5EG+7bdtALDSZBRiiK8hfI7Q=;
        b=ECi4MmEbOkJmvSzCPLerTtgZNhH4+wk2XFuIv+LHx0W7ud7obbuWU3MsSbOIKlmFCT
         KnO2gdoBrDyFgDzko6SHoBm1GLIbxE3zSIOt4w56ZEjaEj8geLt0GBdWD9uNAWq2P/hG
         NrQxAE6JWNBl9qVoEn5kxoymF2voIExeihuS/cYCfXY/yh9VVmJ7CF4igLzANX0DrMNI
         EzGIe2RCaUvoBzfFoMoShupODZbh3gj3iQ3uxpYHqx1l9Y+wMyKLBxSSdg7WiMPlWrf2
         jGNppggwXuOS1tYZWwjFVkhDk8aP5YRfW0U4TpIJV3m1OsgFkBddMXQvGPqHHrPW0Ul3
         NUGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1q0o5hzKwjNyXKC8d+9Njg3HDDe4wPjFhFge2RozKt7P5RlR2tD3y30c+iZrAZ0vJTaXUFrHIxYAP@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpoLkxD8GEPCiQjgIOvrKcm7S2m0RUs7I6X9w2r9k0llmCDQJ
	rYl7E/u60Z8P9NQrFVzI+SHeXB34J3INnLhFgN2klTwUplXAKCsrqIgU5Gkh0avjtH3QpaEMMo/
	rdCHrr9AeZAu7k/0ubl4fBBgGsrPLDcL5IIqGP3NiRZqk4um2+CMh/CvyS+MeerLR
X-Gm-Gg: AfdE7clBRaBhUAGFNpl2JVN7/KEW2A6Ty1JWqf0rTSwMy7978elXoFOXlVcJhn7MRPG
	86XxhchmQJ7cO1PwBZtOjlNMiTV2WVTiCz3igikb8jAzzH9h/R7XAugSeoHZz2RaQv1X/46kWbS
	evUgPLXszGNgY9y570w+GiWazZY9rcLzj4qzkYCB76auP2Ul5UMRlOoBO+IgoLL6SwGlOF2Bz82
	05WgAfIzt4aBnIVK7koj5iIJ56yiYlqUk0ZERM1Yjtkh9DSTrMlpsg0edCWIzFxrH8tUepY1Zpo
	MB0H4Z9jBQWcM7pJkM33AobCEAEvlG/mFyrYJPHMFE1aI5hDtTmZvoFB0fVrVB3/NQ3BtO0pWf9
	RSWgQa3y5LD2Lj3Rnsen5Br7zAYpQydtH
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768155a91.33.1784192870627;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5825:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38e1afe7912mr9768095a91.33.1784192870090;
        Thu, 16 Jul 2026 02:07:50 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e4fcd31sm10601985eec.4.2026.07.16.02.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:07:49 -0700 (PDT)
Message-ID: <3128bff0-98a6-44d7-a390-27537e74e9fc@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:37:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <63t_fLehIKEom4-JPN9kAGFEjUG4_yFoHMhB2aEAppwPHb2oPbK666eGkGgXxEAHRJnfTRRUwuf2EqNRYe_gjA==@protonmail.internalid>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <5c8af0d5-2477-48ca-bd7c-0f2475a9dd62@kernel.org>
 <xrfd2dbhmpiy7ftpztcswba6iyzt3dsajqtr4fpq2iyn6tbeny@4wijspe7n2ig>
 <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <00df448b-b492-4c85-bba9-84753825c265@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1U1Zxx1WU271XM_F0kmvLK8sNA4KyBnl
X-Authority-Analysis: v=2.4 cv=WoMb99fv c=1 sm=1 tr=0 ts=6a589f67 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=Rdlk7PUvzP16AkN5vSYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXxdBEDiOYhJNK
 lizmRO2pwj+eWUGGdAiFF8epsbdPNThBtd3N8alh2E+nnW3TdCW492LXfgB4w7WTB503H1XFLQx
 SgGri/H5vi9AKIhTRk1y5m+hXMB+/AHMhqG/9wVa01d64KO5kp7jUJdDD5g4/wcdJYTRYtHDQLf
 sXbywd2OSwKzGbSrJbzPSpQmAvESyEDzl/uBfh/wJeCD1LQKtLadkOa4+WwUAeXB5XjvRAMCEm/
 QDNy4BnyLF2diResjr9kyvgWQK+e7hRrdqz3O6KyHnbtMB0YJEd4oI1R5+r94GSXierE9TudBJF
 Xwq13syZH+zvg9VZ0PvaO4sM4Wt6RjrIWEZ6a58Anm9smMIXhluXQ6ugYw9lMH70PF4B3VywOto
 SNIiGZXeQheM10A61WIMUa6Ks0oU5QTFFSSi2m5ALICHfILifLu7ZT+mt7vFnjUk1aSJxyteguw
 rvzJegDdGN89ywQp/rg==
X-Proofpoint-ORIG-GUID: 1U1Zxx1WU271XM_F0kmvLK8sNA4KyBnl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfXzqVpvxglF6vg
 sX0cYg69MHCpwxQy9yjFKk1+1NwdFBn3V8JnB1M74Jij7B1chiOx7tQrQfVOGiXdkmcBE4885Ws
 pqcXwAUPzIf4zofWAGFBQ1Z5/vIzYc4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

Hi Krzysztof,

On 7/13/2026 11:32 AM, Vikash Garodia wrote:
> 
> On 7/12/2026 5:49 PM, Dmitry Baryshkov wrote:
>> On Fri, Jul 10, 2026 at 11:46:58PM +0100, Bryan O'Donoghue wrote:
>>> On 09/07/2026 13:35, Vikash Garodia wrote:
>>>> The Iris VPU has separate streams with different IOVA constraints. The
>>>> non-pixel stream must be limited to the 0-600 MB IOVA range, while the
>>>> pixel stream can use the full IOVA space.
>>>
>>>
>>>> Using a single set of IOMMU entries for the Iris node does not describe
>>>> these per-stream limits and can allow accesses outside the supported
>>>> range, which may lead to device crashes. One such issue was reported 
>>>> at:
>>>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>>>
>>>> Add non-pixel and pixel child nodes, move each stream ID to its
>>>> corresponding child node, and add a reserved IOVA range for the
>>>> non-pixel stream.
>>>>
>>>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>>>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>> The thing of it is, this _is_ a bugfix - perhaps its not one that can be
>>> backported, actually scratch that, this isn't possible to land in - 
>>> stable
>>> realistically.
>>>
>>> So what is needed here is a strategy for fixing -stable.
>>
>> I think, we need to start with defining, which platforms are affected.
>> sm8150+? SM8250+? SDM845+? MSM8996+?
> 
> All platforms, including venus.
> 
>>
>>>
>>> That could be apply Daniel's patch and backport it with Fixes: - with
>>> mainline then say applying this change and reverting Daniel's patch
>>>
>>> or
>>>
>>> That could mean some other solution for -stable - up for debate - 
>>> what's not
>>> up for debate is this series needs to _address_ what happens to 
>>> stable for
>>> all of the target platforms - and then transition mainline to the new 
>>> and
>>> shiny way.
>>>
>>> That could mean
>>>
>>> - Applying Daniel's fix with Fixes: and cc-stable
>>> - That patch needs to be extended to _each_ Iris platform containing
>>>    this bug... all of them I think.
>>> - Updating bindings
>>> - Updating DT with new method simultaneously reverting Daniel's fix
>>>
> 
> Ack. The proposal seems a good way to me addressing stable, i can work 
> towards this.
> 
> Will wait for couple of days if there are any alternate suggestion on this.
> 

I would like to seek you suggestion on handling for the -stable branch.
The approach proposed here is;

1. Pick the workaround from Daniel, and mark it as Fixes: and cc-stable. 
I have the series ready to post considering for all _iris_ platforms.

2. Update the bindings with subnode, and at the same time, *reverting* 
Daniel's fix on mainline.

This is due to the fact that #2 might not be easy to apply to all stable 
branches, #1 would serve as workaround to fix the bug in --stable trees.

Please suggest if this is fine with you or any other way you would like 
me to pursue.

Regards,
Vikash

>>> And I do mean doing that in one progressive series - a fixup for 
>>> mainline
>>> alone isn't enough.
>>
> 
> Regards,
> Vikash

