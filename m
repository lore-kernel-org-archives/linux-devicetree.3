Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5C749A3BA
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405875; cv=none; b=kccCd8pBOwK2oiMYrgCBILbH4FCRqbJhrPTRVTi/7qo3PSvkC5Tpx7dWxdCfppVjd6HNTOAuoEO+fKCK8eAOcJ75xJ9S5ygYpXfm5WdITLlJREwIDnMyoIQY6kX7vRWiDpfDj378FkpyDLM/qa5B4YVDzoZ+D9p2NCpU7FQL1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405875; c=relaxed/simple;
	bh=xLOGKGdR/TkesfS5Hh1P1f17v+nmPE9pRniwwMVSoy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q77GeE5oUVyp+iucxLCNkwCmqjpscYEGLdM3JPKi62uzuoP4sOFDfR2SqWoDdaLoBjTXCIAzhtVMGv2umvZIiNAeRgPuXiUaH339hyMOz/rLTIL3vI/7rNDI+JyvCQ2jB72WLndnE0/5WUomgoyb4pW0w27B1mR3eYhToJZu9Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rmw8KTi0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/DWDGJQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rmw8KTi0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/DWDGJQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YhgO2688721
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=; b=Rmw8KTi0pUVSCpBY
	wiF8RiATQWk60bVp/6dCGSJIy1eEb7SEmXjJhM/T7Ku82wna+2M16RzB7oHjuq9I
	6EBZlQXb+bAbnaQMACOajPSc8TtRZobmWmiNNB6yQWiVu6RA/+QTUKUAwJKbRKSo
	vB+0NY8vnFX0nqkI676eJNB7IdeamuyHa3VJJU1FCBJlK+CoBWZF7I33jluOk2ni
	naStfiVbo6lArR7JOy9y9iJhB0p6t6h6qc5U02bdBMZmxIrPt9B9UofwuranTAEh
	xvTDVLBoxxPGcGDNG624IEM2QfeM/qsWE/eI4/pPRErWn0Kei0r45YawOfQn6RG6
	zwIyBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0en1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:31:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so34024785a.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405872; x=1793010672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=;
        b=Y/DWDGJQDghumupjsoRc03RZcYQrn4wOYTsiy8WUXasIF9YWw9h5YnAYYj4je2LQfA
         uD89A5OgVcJMkDFSHbS85oD3nc6C/EHr5scGdTi+3XB6tqaYb/Vc+Q7LeR9HbQh27vQ7
         e6jtVPNQlE+iTJbPcTWoRvq2lyAzXn0Lp5x8AlUjc4AI5RuFr/kAvbNLDbotKNky18hX
         7UV2fKZ2cMx9JWndYmKsvVTfSDQklM7MCZYMiFneIXOntwUFIdAEZ3jNwtzljVPRe16S
         ZGgYXjpNd4h048x4/1d6ZOYPyXP5tzV+mFygWKyhKuGP6TvkLYgrnUIdwZhrceS1X/te
         9bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405872; x=1793010672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYK1463Om0BeLkjtSbKer/jvmkMwEuX1kL+uNM6n95M=;
        b=AwV9Y4BM4w4CFGNBxhSzy5ihRPmuMK5TUswBfqmX1zrAKNnev6h9rA6A4bES8K2K6Z
         Dvf1K2etOAIHaKEJJpZLPvWDYZiZZQq7lvL+CKBFUM08CwH3usj6U/WMoQLmIN3zxqqC
         cW4dHksjyTvmPXkSv1nsTUuO0dqEdYPyevvBAwOC2CQahWA0eU7YQJrAbkJQXJ1zTMwj
         nCjZY2A1vNFEouTVxyWmZ8Rx1PQ7dMYqv/8j59ioVmgGxVzN6XwwoGHVF4YxxaoiwpeC
         ASDtDlvz9RVFS/IPR+uE0/B4rc2lkSH37l4NVL7lkK+nyxiqeDHL2yhq44KqlTaJ2cjc
         eu9g==
X-Forwarded-Encrypted: i=1; AKwUvBySCRb1gWc34Hm1F7B0WISmEgNN+18nmwaMxFo3HIQnvcO7sGDGeWkubVGI75cIo050QZ4zhlireU19@vger.kernel.org
X-Gm-Message-State: AFq9FYK/gQDd4fAPA7FmoHsPKcicZyLeEGJmljox5iO5q6FeDOw6xC1P
	vlxTrNTuSiVqGT1KoxpqXQ+Xz3KYM7Jk1m/hNp65ZjmR8TixMF6WtoZiDVJIz9Qglu9NsljFuNX
	WMjrn25Tzn20h1ZUY7ZgJuGuWvQTsRtSY9xnZkUvXrZo1F5J+hScbgzbOp4WotdpB
X-Gm-Gg: AYBFou1g+GvZSEryGsj4TYw4EUH95lmCWfTnUeXMvUxi4VHLhPScVNGMktnW5z3bX0n
	6awTfZn/2v9rFptX19V0fMw2Wto1xrtXoW/FnoELizsSBVeT6W2rEo5WGqnhtYrx95MwS3/W29C
	D+STEPwlihOmkfB74I/PlE9OhovtoHqiXSUDwaQZFcsHyHwOQSY7tm8EbM+D9zJriDSDmbqD2Eg
	Scnv2JI3EUKEzzY5lOaH1K0j3bZ9ABExCCO7zVXahlfOlHx/sEoxXbO4lZZocKxYpckP0H0xURI
	10ch+IbThLr8AsWs2nnmHCl+zJO172OT5yYh5LWiPCZVQJJQt1pNDFFTdJ+X5xMyJOGgFi3g0Z9
	18KIa65tAztYCsL5a2aEZCw==
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1364648685a.1.1792405870998;
        Mon, 19 Oct 2026 03:31:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f29b88632mr1364644685a.1.1792405870444;
        Mon, 19 Oct 2026 03:31:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091fade41sm343284966b.82.2026.10.19.03.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:31:09 -0700 (PDT)
Message-ID: <5cfc6414-735d-4df3-868d-c8c3c4a98e30@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:31:05 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
 <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
 <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f624b075-df3b-4862-8231-8fcae7f18d50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXyad8ovRuaXjo
 YEtBh3gdUzRVt0x2CIL3hukiYMks3E02aV/0AtRhNwjjCdsocBEj9AcIxrf/BmLDmj9oDfC9+F/
 8FdHpPtgpcMouMEeUmr822AsyK7uLPU=
X-Proofpoint-GUID: S89FnlJu263CJXDCenWiz97q0OnquqJj
X-Proofpoint-ORIG-GUID: S89FnlJu263CJXDCenWiz97q0OnquqJj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXyWsafSAwRJoz
 1Q5Y+o7Xn8k3Jqx8wJJZIhv1b5uNvO9w9WAw9C7zVJ27rSxhdgok0cgS/VRn1oVPfstMcEbboOs
 k31PMXBv0YYdRxAL4czfm2ng2kTaK2pEPDdxUUz/CUEnH4QUSrBE/dmLFitmkdwmrd+hMZK1sW9
 flMm1aB6W1ybdWzDey4p3aoHSu1DsOkEE/OW19N4ci/DbJRg1BKfBg3PG2J/jyzCcncQfE1nhuv
 YhMuvfr1oH3rIxsU0/odcjO40BXp+A/LIqOlECVwOVNRWi/niPr2+nGjTTmU1WLhhXPeqwFhywj
 56799NEYgMnWW9cXT1ff2K3y6iPlcYZNxnwsW454RVs/n1FJJigMwdiJQJUX8V52NMb0IinC9U8
 ohIwEB7iMXhh7SNBzuxNxpmVXoKFUHTGTvUX6FY7m3tkzZT2DWiB3VhzWR8isbNwxtlFT82PkoG
 6o42ZU1Na0Vc/NjwRQg==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5f170 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=-HwF9I-Zzcp5qfXbVEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 10/16/26 11:26 AM, Sibi Sankar wrote:
> 
> 
> On 15/10/2026 19:02, Konrad Dybcio wrote:
>> On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
>>> Hi Konrad,
>>>
>>> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>>>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>>>
>>>>>
>>>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>>>
>>>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>>>> ---
>>
>> [...]
>>
>>
>>> Thanks for checking. The only matches I see are in the MPTF thermal
>>> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
>>> else mentions ROT.
>>>
>>> I also checked all the ACPI tables but didn't find a codename there.
>>> The tables are here:
>>>
>>>    https://github.com/aarch64-laptops/build/pull/176
>>>
>>> Following the Lenovo gen8 naming, would something like
>>> "microsoft,surface-laptop-gen8-13p8in"
>>> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
>>> whatever you and Krzysztof prefer.
>>
>> FWIW the "gen" naming comes directly from Lenovo's product name,
>> i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".
> 
> Official Documentation say "Surface Laptop, 13.8 inch (8th Edition)"
> 
> We have to create a dedicated board file for the fifteen inch variant
> since it is expected to have a sd-card port and another one for 13inch
> specifically to enable ufs. All of them will have only lcd panels. So
> how about if we go with the following?
> 
> microsoft,surface-laptop-8-lcd13
> microsoft,surface-laptop-8-lcd13p8
> microsoft,surface-laptop-8-lcd15

sgtm

> With this is mind it might make sense to create a common
> file mahua-microsoft-surface-laptop-8.dtsi that all these
> boards can import from as well.

If they're sufficiently similar, sure thing

Konrad
