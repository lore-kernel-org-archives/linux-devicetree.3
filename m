Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAC47884D
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327737; cv=none; b=NWQMNpxNVECa7RuMDM9FJCh09hiwi7FyDpNPbQQbn7cDmM5cxnWEJr//I9SySnsceo3ZtRniaZOKY3uYpyDRjxqb8jfdwMTtg88O8mmZVp+rQ/wALAbSPdI/KJ07tL0Oof9SMgAFZyYX/a8k90rXYE/sGCbg9uc7JAi8XIkjIpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327737; c=relaxed/simple;
	bh=QZbdVd3wDcjbE5HqJ43PJx1XHy6+qgXALVHgYnjvA4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdAvv/kaiEdWNGaVqZxyCaxQSuYgN7FPPSALH23/0qf3NLQ8bSyzxf2LWY5mWNUF0VbvLG9AduwxkYu6iWeGNT4DuBmemp8M3p5Q81/F/fYCtd426RyofBoIS0BwVzd/NcfPe6526qGUk7gYcHiZb/fGdcGv8zpuJVczsg6FGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RoQsyK5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlpBQExF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RoQsyK5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlpBQExF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66678GOQ3976384
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=; b=RoQsyK5f7fV1iWo4
	SyCXOG5Wkn8sUyU2MNNAjdt+XvirxwPpqH+Vl7KXVFEVxe6G13eUl2I8KVybA5Fs
	bSvo8oIfzknqPfNdnifuLyviUJ6qvjS7+XgDfmJkkkad+KCKBhPrhToiobXU1tIl
	YFdVQfN0zAjEXkvCYS/RJwZyzBnhTM0JKyMah2Xfn8xtenWxWKQbuFKggz6rMm1c
	f7N4t3sUjBejdx8EkRRKelOmwe/39PgIO+IfwWCzvdTvih77/oAKY2UL4gfGdrid
	viv5xUbpgVRpsw0bW5UH4/K4NFST7TWUs7qPFG3KyW7Gj3qOHq9VQRRK1bEMR40S
	50O6Og==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gd37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:48:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfa45b280so7665961cf.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783327725; x=1783932525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=AlpBQExF/jYJfE2d99K0APtxw2UNDxe4YjG/hXCX7s3QiMv7LWYkObQYuKacALvCh5
         sl0IMNSq+u0EceY8U1i3q6t1xFED4H8XPv2AAMj2kQcHMD2FOwjwN3NEsWbANvBeV+86
         tSIZty11TsSmX9jAbu3dOCr/Tewtwc1ar6oc+4qEILwK7lxcfFeVjCHgJuo2xfbxxeqV
         gHsYyFrXBuqCuCQPWlFbYRijuYTTaSWGw1XjeYQHfF//qhK5tkKhjT/SLQ5D98O1dQur
         VOXoc+A0OGfl72heRXuQA+taZSvRXttkFwpYkhD0TaX53I04brumYNgkLB93nOk06YGE
         k7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327725; x=1783932525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyCrsVtN/vgWmUocyd2gtWqkOjFDvVdxEkewtddvF+I=;
        b=mQlPROKqH0kn8TbFcqH3VWYKobfUJVu19npP0zRVgP9DwxY292xeRFLpdi+flvRY2+
         DtK4DsjJg3QioN84HrCyTOD+mVJ7pSIkTPSNx8J/dnLVcSv4JaCoVY0/6ZyA7DcLtw7/
         IljZAMTN7gOKeYwzeJGTFCU+Q9v84BzJVSdk++WqVXyDfl4aiBxhgxqkcEUIoX7fp3Xe
         XR1kWw0+KDMU5BNL2e+/VAqBUv+vHFsyjZJmVroYR5Gm+8bYNrYHQR9WBSz3JLqW3t72
         ScUmyrJs9YjvIZ9oNiD7hS2J/gwsyKi7OXzF+mpyniZtgN41F3kNrmWduURNLYYXL+/r
         /alw==
X-Forwarded-Encrypted: i=1; AHgh+RrxCWqQZeCDR32z8vC8CVHHTzUdNmOFV69FDOqVEExRd2oqV9SquL/fu9HhlVwlHVl1ZlQ1GCCtSKUG@vger.kernel.org
X-Gm-Message-State: AOJu0YzxBS8LPmOihKAhc+x1XaZSFpZWcziiZyHQDhKFx5r43jy6C3TL
	iB63BOXzZH4hewKaIGWwGj7ifxVIQqSaZKUxhTqrv+Oy/0J9l8fZGEXaE+LVO81r8W2pz5/KCL4
	FV3SQBxJj0gPrRhTf09BbYlXdWHiNfTjGlyaLrH96K00sCZjrW09Ricep1awGiUlx
X-Gm-Gg: AfdE7ckmf8h7cA3JeMiSsSGq/ApIPLITNNIt3ceoLQweCYjmuCExdlBfWLIRFKCejaq
	29Rj5a/+8y4upsWhp8LYk/jcn+uSBqM5MHQ+NTZIecAaaWbjCQT5jEqc6aSy+mCtQhInOGRmgkM
	7Obq6NVGSV286N8in1bRrrnz7ySFwhDJ4rt5stKO/Bm9grX0uPcZqncf16vS3SgfYjaUEktRxiE
	DdDR9177a9/e5GcrvMdmYOO0nHXcF83mPpX8bRsx+8sAQGYyNghSyMc3x4G81bcchCDiqF9gMq1
	EL8KA5Nd8ZBb/EPk3gGXIbXbY2du1eHnxbNOmI0YPowGBJb15KHkVaEFNmINY6jvSEij0DrF8Xz
	2Y9fMiEfHFe9nHQMiK9ib/O0n0WFxyOvuuwA=
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210611cf.10.1783327724784;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
X-Received: by 2002:ac8:58cd:0:b0:51c:223:3c57 with SMTP id d75a77b69052e-51c4bf30d44mr87210471cf.10.1783327724419;
        Mon, 06 Jul 2026 01:48:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c2d37sm691730366b.42.2026.07.06.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:48:43 -0700 (PDT)
Message-ID: <3208407d-05ea-4b1f-bb65-91afbcbc858e@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:48:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in
 a730_hwcg
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-1-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX/zDikGh3724O
 2NawZFLrTiQ39V6sZ8k7OLCMQfGOEg7TVJ7qqUFWeVK7H6XYPWNZZCBilLfMuxA5Uw0z6qRqgf7
 +4zjeZ1YNKoJLQAulHLZcwAXRW6MDQXtztjG6HYvpvCJVcCDW+GyG+RsnHjX0XQ7YDihK75UcQp
 mL1jojrMpG/IlFHTDzpWqT2FhTsCk/S84XrYQ0BFrds5wkV3iyjuykA5kBYHkxeqHaeXl3HMj79
 y2D/4csC0gWxg0I8JPBFAGo6+xXFCBUzrJ9P9MnxSEinlvlIfmxBqBqpyVhzdtnB3JEtQjYxAMT
 5xEwmQNT72vTBaHeeP8SBH/iofs6wlJXveCUny/5gsDISjK+V6WLGc/gjwcWaIbQ2/2mocRrzhs
 JcZYUbrT6CW000rsSCW5YLzlSsV2FAVFPjE5snDubsbpBPglpMgY6z2pJrwrFQ8GRB/qi2R0rzB
 GYozWeSR/i49jdJ7hUg==
X-Proofpoint-ORIG-GUID: YX_iuvBLnoH_yhR_pM1esOWVSap1ZvZQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OCBTYWx0ZWRfX+ZmynM/b7LoI
 pIfgeqc9kHzwQ4sDWD6+2YUr4GAOuvzBSflS+WtzIjLOoX+6WhhPSV9dcxj7Mg4Frh6CUQW/o9c
 79+qCt4slKEZQEewbVd5PD8U+fsTfc0=
X-Proofpoint-GUID: YX_iuvBLnoH_yhR_pM1esOWVSap1ZvZQ
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b6bed cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=KnFAnPMC3uCYYmJdzeAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060088

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> The RBBM_CLOCK_CNTL3_TP0 entry in a730_hwcg has bits[19:16] set to 2
> (clock gating enabled for that TP0 stage). As per the latest
> recommendation, clear this nibble to disable clock gating for this
> particular stage.
> 
> Fixes: 9588d2f860a4 ("drm/msm/a6xx: Add A730 support")
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
