Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9DC1632E7
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912440; cv=none; b=nxc1BdD/lfmZ4SYacin6xZVhzyV7q0GCBCFtqk+GJgRXwo11nfnS+L/esUXE+Z6ZTr+cdD6MwILM+2A+fLqRFwPqpE1k1/a1BVYX0cpWE52YDDIgEN6ufT4DLLonkBYv9r76HQZQUfP7CVwg1nAZX3HC0Be/iQeiTG+tGewaJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912440; c=relaxed/simple;
	bh=fjrpGqBSBTKl1ijnWOQCxINJXrqtw7GaycdDQkmpm8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BB6ncN7zyVxNN+TnNZlEWE6ek+0zywCS6inHc9NT9XaRJuqbpSQzj7I4M7r5SyN3xANYWepdbdZm63DtQFbocGUWjMkwJt2U2KixIfSOFEt67wGTtnoY6ytPJgiDbwuYMwXvwq+4DLXvDPdwY1cpxWC9jBBkrjVWaxwxwGOx7YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ldz+jpSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DoktqbaI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ldz+jpSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DoktqbaI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RFG9U52282571
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=; b=Ldz+jpSOyS1wu2Bc
	ueaZniAnFBvtHLlYfTZnUavp9F7iUfpZma3GFIItIaC5tWH1hGzZcyFCnk5FVM/v
	wTbvhcDtRfmC59Ed6w5sxw4onlcHcyK9qXS8xYYhQ0OG88rCmHiUyWhbjXBP6H1w
	2skDJG1miRbjPWosmBT68MDryGa+KTGDeivqN3qcm1hM+h2XwFk8VjUbqOd+vEXC
	Bjn6Gfbso4QE6+lyC3T1sWOu4k+IWtzJdHfkWUlKiNjerLYno6BkZdHaFDt+StLI
	M4tMOi9mQZ41BF8fcU6QotU73dJlojN3l2XoBV9+hyRwPJYdp4RsIm45eEsKo5E7
	1UhhtQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edtvcu8xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:07:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc6899bfb1so128657915ad.2
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779912437; x=1780517237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=;
        b=DoktqbaIYm8WMzeMmiMQJ9kkIOZOgPuvqwQ5Bo3fmKEgWP5XnM6wLJKm+Yst2zW0fy
         7ncppeAn72MVBxQgb4LTufAw5lde56GNnleT6Abm1yAzwzi9FTOl0no/YjSKjgga0Rlr
         3wXIa6j5mvGirg3epXC+/rKaDhwNfxSc18OsrAixZg+hwqbpf9EPxleHDpsmA3Lz4CG+
         LfbYN7OttDE3hf17+YV6SCLJVZncrZogB1CYtkrHp7Ryl/ROf3xNWaQtQgkPktg1yNJn
         ex1/UwaG/rWhYOYMPp+C/XPHbokz6uRK059k/eWAb/8dGLr0SuE3vJM39hjhinuXS5Z6
         L1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912437; x=1780517237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYNjxQcCSvYU6+1FueqgSrFzwpQgaet5EeASApuehzI=;
        b=l/hBKJRCA/jwnvPxhpyHjh6haEhWjYsq+CWLH/GfHZ0wgGIrqw+8VXY4F4oTQg26Ic
         rvdT2blmoP0CzrhCU7My+mhb79KA4eEsElbuKtkJscXB5Npf2p8VA72nEI1jl2u2mqUf
         VOpsqi9jdjKTOe0uAsx4Z6nROWvuF4cdpukiHQ3s3CwYSeu16RiuZ2ED1+Hw2XswoG4L
         DADc75B0oXHDryY4ibqXB0ZaxMVuDKncyCGgJCH4MwywbxmL6Wyo14IFikm5gL9LUOYj
         eko6t4g2WzzDg0BTigBrq+35duOV78Frkhmw2yI6IAHlGVBMWUZ2XLWlydVjwv5iU7QI
         yx+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+QbgH68OkvyzUNKxhYTDX9MSw1F9Ee1o03RKIFub3fwsxsw6T01hpE1frU1tZhXGZRncMoMGoXlEte@vger.kernel.org
X-Gm-Message-State: AOJu0YzNgNWzHujnx5vibs5O5OW92WDpPGvNqG/AWavlzJ+P4gIZlshG
	/ClJvth84/OEsT3hdB2vb1u4avrQmfJnSEY3zwmQ18BuOvIQEy/t2m7grf1QpoEiFHX7V8BMSHj
	OAYYzc+f9qMQ/mt6q7pS4TAl306jbA2RgfOb4wQV7r/TA2P1IxF6DqHtcwp4201lW
X-Gm-Gg: Acq92OHV6ZHYcCQWg01nDjN0s3yXaj00ef0GJ5QtpPJCip6gob+3H9vJwlG1bz5gu2K
	fE5m+JEGghs09r9F/J0Mfj5gPgrpF1atHojQvoNEnRbOojvSiivh0/2rEClKAp7Ks22awsARz2B
	9rUBFzvqgyXZn1dbzRjxCcLyDqrfTLW0yFyxnHKkkjn0nltGA1YTIgdjxjixMR6os/wUq0vnRR3
	F1ik+JKaWA342o5wk5jhea5i+OIxv01iyTopWrPfl0ZZBkxlwIsWfPcJcNOSVCl6Q+3EOYfHY+F
	XxGHSutUEz7RMq2PtceShv72LNFBshGKsRvt8uOfx2kDK1Ycs+u5k/gZVamq2QFovMK1tHkLS/Z
	cHkI3HrWFaLrkc9FI2p+6Xjxj0BtKClfh6IhAMwFOtZAWzY6YIRTS
X-Received: by 2002:a17:903:46cb:b0:2bc:f3c5:ff0a with SMTP id d9443c01a7336-2beb060dda9mr261786885ad.30.1779912437389;
        Wed, 27 May 2026 13:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:46cb:b0:2bc:f3c5:ff0a with SMTP id d9443c01a7336-2beb060dda9mr261786325ad.30.1779912436658;
        Wed, 27 May 2026 13:07:16 -0700 (PDT)
Received: from [192.168.1.5] ([59.94.127.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5900b8bsm158088605ad.76.2026.05.27.13.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:07:16 -0700 (PDT)
Message-ID: <25812e14-d691-4e15-8fd9-82cacc203eee@oss.qualcomm.com>
Date: Thu, 28 May 2026 01:37:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
 <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
 <191d66ef-7d36-41e0-b29f-1ddd47812b75@oss.qualcomm.com>
 <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9a999b51-8131-4032-82c3-72d7eccbd222@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZOtnEmmBUU-NZA0FWJIKUS5dChHZxfvA
X-Authority-Analysis: v=2.4 cv=CY84Irrl c=1 sm=1 tr=0 ts=6a174ef6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=WNRV5uGD5AkuWIfm3QAnlQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=U9EV9gB3usZ6apLK0C4A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIwMSBTYWx0ZWRfX/3F6DOkceGXE
 oYlom7O5fSl5wQaOEGUwdM/ftuPICUFAFoNLBucxBEZOHEAxhot+Cu+/DNydy/X490z1zJQekKj
 f5yDwHveaGhbVs2ACubo5AqI6CPRLQbhY6xAhhf6CtmMu3ULbsZEr23aGxLHiV+6gbwg4JyjBml
 1KiHeI+A6eKm06Y9pbvnG5NrKSHdQ2NVC6zRtcYFZdh3cr1plNPWDPhM21mhhUmsoSTE1tIZtgW
 EE4ts+tTSA+FvW96mg8GhvgM0YnHrA66xSvF9GbtpMYan9kwSb6eJkL8cC0HS+I8SaQOXtP+gPE
 uY1sQx0VRVaVGAOde6S3CZfj9MBNzFXUkx42pOG+iC+kKlxSPcElS9e+JqPy2nvkECj1uB3vw+6
 +K2Hrm39QJAfw2FaoXYKb33h2bDmG1atZIEVc32jStOqeqlXVnNAnwF5DSM3Og9CyC3U1Hkcpp7
 QlqUarfpGVEttRhjSYA==
X-Proofpoint-ORIG-GUID: ZOtnEmmBUU-NZA0FWJIKUS5dChHZxfvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270201

On 5/22/2026 3:11 PM, Konrad Dybcio wrote:
> On 5/22/26 11:39 AM, Konrad Dybcio wrote:
>> On 5/20/26 9:38 PM, Akhil P Oommen wrote:
>>> On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
>>>> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>>>>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>>>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>>>>> the A8x family.
>>>>>>
>>>>>> This series is marked as RFC because it depends on a few other in review
>>>>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>>>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>>>>
>>>>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>>>>> review and has been applied.
>>>>>>
>>>>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>>>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>>>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>>>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>>>>
>>>>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>>>>
>>>>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>>>
>>>>> For the rest of the patches that doesn't have my R-b tag in this series.
>>>>
>>>> Unfortunately patchwork doesn't capture tags from the responses to the
>>>> cover letter. I'd kindly ask to spam the list with individual r-b's.
>>>>
>>>>
>>>
>>> There will be another rev to remove the RFC tag which will hopefully
>>> have my R-b tag. ;)
>>
>> Do we have a resolution on whether the proposed fuse values
>> are OK for this platform?
> 
> Ref:
> 
> https://lore.kernel.org/all/oka0Q911ixJLZzAbfWBx54dOmxbQAre36QqHUX4iDZoH3TE5jD-IqTAHspti6B8kfpLQ-OTnuWjFdXtsqJM-CUC8G9R3x_9vFI--LnpppiA=@pm.me/
> 
> Konrad

Yeah. this looks fine to me.

-Akhil.

