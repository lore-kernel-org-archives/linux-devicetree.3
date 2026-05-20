Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29783346FA7
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305905; cv=none; b=ZCadJovW3Y7th+63DbaeXYluVW1z0bE5SIiuvxSBw8jQO7szRQbvq3Hawe2MNjnuMbnHmg32ypHtjTZv4Cx7E9MJuIb3BNHlw4+RKgR/MmIqBT0GoqURn6ZcQv+/Qds8/y88JNHfRmmlazfKJTUhssycVSnUk9NxsQgi2uHAOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305905; c=relaxed/simple;
	bh=/V2i2aN9ElYzM1ebwDQYVP2EYIEQj7BDWotrGak3l3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xp98jCvXSaT/97KKfKJpMIRvnvzOYqH99ISCAyYfivKct2JPizRcu/rMv8c2bByY8TLzsyrwkOedGQBh4Jzluv9++XavZDoxVD0rmXJBk8G4bz2boUk2xjMB4fDe1QtmSX9AoBPUzWGZH9wB2Mqsc136OVHXmqUCPt8jmX6KpNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyKqtiok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bh0HK1Pi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyKqtiok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bh0HK1Pi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGFfYT1178126
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=; b=MyKqtiok2N+ELTCL
	/G41MzOXI5sSKnKAYPPi9+YEzNMQC6FtVm2VIwSGycBLu4m7SjicOj1IuDOIrbyD
	QRbjYWeqOJtbIZGoaKlrKSqEIYQ+v2tN0Cg9rTRzHKz8ndTRxmQ6Rk0rI0uYIcdi
	H9zTeayd3WGe2hzxdv3fnxadwWvWCKjC1q7kJEX2sZwVQJCnIjA/gh5thdHWl2YM
	rLATqRcQtaRJlc9pUD+Pm3K+erSBRM2zoEjJBNJJW7tdOETVMMPrMIOO3mO/NFTy
	GYZm8rduLfpyO2P4yjWRjr9CWXHjJwdRMGg6mOJgCpgjxiTxJPs4i+YN+2bTH+CQ
	kY4DXA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6tb0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 19:38:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so2718061b3a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779305901; x=1779910701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=;
        b=bh0HK1PiGoWWnUHW5Tkpjj4j9YGCMHhnnu7Ko17K4eS0cKRu+RviSQZNwUfTfqeA2A
         hl94aw62LV6VF9Msw30+yJ7HsMOyHcQBJwOAe7vDJSD6Vlw/RBXAUI85Qcm5LgzN38O7
         ZetqrAyO/mg1/X8o/zUms/LKRmDsiD+EBG1UM3b76Uu5V7PSHIBzf8YTEq52vdeKy3LZ
         7vUURRgGlMR96YDZkocmeuILCin04cGTWXuHOwuR47jh7bD1enIP1oIWlaEsaFiOmIeX
         vbW49cFVYGrTSf/jPyGU8wN5u9hKUe+yp1kPt7acc1xds0poYWFAkmoHkopugD5FyEWy
         HI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305901; x=1779910701;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LFMGD840PvGCPwkDPrhg8qGWW+uSOyb0Wppoq8dMT0=;
        b=hvg35prwC51rOcro9HifODR382goHqCwoF4CRYOvGVqIBAJd+1gHTXERvy3ZNZ4y8Z
         QkbvQ6RdURBmjkQcosKPSqjApnoFQY+swkcWMmzxqmkHM48drqMxkC/cIuXqnzERtxsw
         maD511CiU0/1mzyaC/mt37t+brxSXfQ3ecMVFDRuXTBAbTmC+k+dg3D2/Ey5TxWsPvTG
         ins6hrzhSLBz3DsWZGXuiKzyKGz5f6Aik+h1Kb6O5b44TibfLEnZm883qGnFDMoHjeqb
         RuVWfhhYy86iGsjvf8IIQ7GKpGm71vGBuF8pqHRVgjWdVlI8PSyK+qsgmkRocYVBbxhq
         ev3A==
X-Forwarded-Encrypted: i=1; AFNElJ/f3Dy3ozk0KshBgpJFb0BkmnQJIujDGxuwkvBUrrJpbQsig9FQM4WmGOEi9FeTzVXX/1bS2slz/ai/@vger.kernel.org
X-Gm-Message-State: AOJu0YzjA/gbzwshRaHM7zmcJOe1uoVP0T/+9HKI8O18yxHvIKhQIRmu
	KmyZLuxkGhaVHsJNjLXKt06+esJ5cHDJHtn7Vs8E1D7aNCrRXdmVRAQmi3uJ6FBSJNimF3SYu2X
	gLChFoYsLroUIakcgBj3JWfhKryIW/qdmjPnxrDd4npDvbubtio/OywWqGYZGlQli
X-Gm-Gg: Acq92OG0tRvtX6AMKV815JAiyqEKcbaScG3BaIAARgh+hyIYObFhxodl4bejGmB4mA1
	zBr+IeiMntUXIfMbVOYPPC8nKLzO/UlyajaUWRQx3R8EBAyTXbc0MLo2JnBOUc9nfLfs1Hp5a2f
	iUqtDeWW2BehdNAYgnKJcLT9gznd4767ic6voZ7+Go2T73CbZqU6J5m0Ml5n/xrGIXl8XbVhH2S
	eDWA6NlkWcKZl0GVMt+hpQjSMze2L9XntM+lL7XgpwKDAEmiu4ppjdqpmrlVywizt4OMDOlSB7o
	tdhl/KEpgpuCKBDDtyZZHBA6wZ4kNCg5eWv+Y1gUyIUn4//k5siWPUCUI18MqGkIY7TQVr4BWuH
	y3xku+/Hc6O7Xpuv46vFn6HdVT9yOw58Jci2dcyHfdrBtVBGi0SXd0YS6FqVLndNh/0rP6z8UN1
	QXmoTGtNpl
X-Received: by 2002:a05:6a00:a10:b0:835:36f5:17c9 with SMTP id d2e1a72fcca58-8414864d999mr613735b3a.2.1779305900546;
        Wed, 20 May 2026 12:38:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:835:36f5:17c9 with SMTP id d2e1a72fcca58-8414864d999mr613692b3a.2.1779305900001;
        Wed, 20 May 2026 12:38:20 -0700 (PDT)
Received: from ?IPV6:2401:4900:9074:ce4a:59fb:b330:7e10:e1ac? ([2401:4900:9074:ce4a:59fb:b330:7e10:e1ac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7ccc7sm26114065b3a.58.2026.05.20.12.38.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 12:38:19 -0700 (PDT)
Message-ID: <01b424f6-6617-442a-a77f-9b7a8472c447@oss.qualcomm.com>
Date: Thu, 21 May 2026 01:08:06 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <3dc009dc-8f36-4735-b849-d952fb626cf4@oss.qualcomm.com>
 <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3vzdlxnee4w6mur5qiyk2rhewlugswxarhevv7l4zo47qnnqah@45oxl7rjqawv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XQ2xs4CmjYIcwNUaRXwwNpwJn-bRjm3r
X-Proofpoint-ORIG-GUID: XQ2xs4CmjYIcwNUaRXwwNpwJn-bRjm3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE5MiBTYWx0ZWRfX4BlzoS5XeUgM
 3XGzfgs7c5Aj80BiOS6aAIRn/52bXs6qHTBg5G98IkJ1n/STQOYljpr8LDOYx2dql6kn15BCpLX
 +3XxERPvtPNwXsoKLt1JgpqtYFBIlFWgtovZ7OZ8JTbe0EVNDGz9rqJRD8KfLD72EzuCiBE8fSo
 DbUD645gq/wftR/m20uM5yh9DsXb5fhBAMCcVrJG7fAPx1MVL8Qav1qssf6QjaUFX8Nc0GdRFVI
 ugxcyURu88/OwZK1L6TpW6xPOYemKe399EapIl3IeN7ZrfH1ZrkGwL6RzPSnLZFDD+RVJfjdPyQ
 9Y/Sc43w2ALZH3EizLKbCHugqReRtirM2AyNODPNGpAGHHdac8+FE2n4L8NSp8BQGRqB36IeoQ/
 1V/hmO0DPKF65wASMFI9JP9NvITigZLrONMWZEeuFRzICWcQ01YvuxwG6OaFtf09tqRjbikzJdz
 S0zK3oCuOjBCvxGYbQQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e0dad cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=vrFTKMbr3VGxMADgOxUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200192

On 5/17/2026 11:54 PM, Dmitry Baryshkov wrote:
> On Sat, May 16, 2026 at 03:52:08AM +0530, Akhil P Oommen wrote:
>> On 5/15/2026 10:38 AM, Alexander Koskovich wrote:
>>> Adreno 810 is present in the Milos SoC and is the first GPU to be released in
>>> the A8x family.
>>>
>>> This series is marked as RFC because it depends on a few other in review
>>> series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetree
>>> support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change).
>>>
>>> Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
>>> review and has been applied.
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com
>>> [2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017cc642db@pm.me
>>> [3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com
>>> [4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f5988c43a2@fairphone.com
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>
>> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>
>> For the rest of the patches that doesn't have my R-b tag in this series.
> 
> Unfortunately patchwork doesn't capture tags from the responses to the
> cover letter. I'd kindly ask to spam the list with individual r-b's.
> 
> 

There will be another rev to remove the RFC tag which will hopefully
have my R-b tag. ;)

-Akhil
