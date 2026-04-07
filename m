Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21B3358BF
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589765; cv=none; b=cBDw6r8MeHrBtG3noIpQQA2BYX3A+C5mXQVWW2gfTKcow4vdzbLXXI7XIvGoMRGbpstwcj/CaICFP8ep6wkuf/nKx9WSSwRFqnCZPHPTvJpK3Ho4fGxSr6orwr334cWt4DDXgWbJKNRaWIw0OUW+ezBmm3CSa+pBWwm66ibYT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589765; c=relaxed/simple;
	bh=CpOMVXB6kI6z3aScP5AmN5971I2kjgL149En9f4FyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOPkYR6uKgS28RvyhwILrND8Sv6CRWYExPHfNryZK7WHV1io7sgbgNMveiFDbckCLvqdxg7ZTRQ26zvogpSZ6qxZVWdJZsJtfjOXmh29/+iwdvNOBD8d6w5EcjP+jJjLAR0e5rN/E46uqfKmFljFK0y6QMH1Cd/O7YIl8jN96+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xz6iU7x7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZcR6zTri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xz6iU7x7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZcR6zTri"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637H7BFK2411864
	for <devicetree@vger.kernel.org>; Tue, 7 Apr 2026 19:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=; b=Xz6iU7x7Mm+f+JZR
	vzAvYj8qZSGTgM0Fp/XB/3GSWPWNIa3HJVQP4PKrWxYEEIxHcssuDItIsZxIKFe4
	IHltDXSRqCutXgXCAfB/O025ZiUWik0P9peLu5I3eU777y8U2W6xfCnAOusGq2Vg
	zCbvqltzNCSTF0ts8QkvmyHOBBn2VsZ9P0Q1Zu63rVETQuKIzpsP/7MtHwjgG9Bv
	AFhnWpXt0xT38UcrOiuLPoUFR2bLNQkJ+r27DmqO1/PmmaDnnDkvf9W5VqdOhy72
	3vNbd/mwzSzxNo0ICX1T3dWt4p8Kb0Mhw25BAImiccPGAgN3XePargDUFZ8xCx0t
	GIpv1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61v8hnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 19:22:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242cbb97aso43472575ad.1
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775589761; x=1776194561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=;
        b=ZcR6zTriRVDmXFywKx0N+4m+9rugm8up7FE/Yxh4yySCmCVqfgFUAo2kqvNNl9WjQZ
         vqaMdX9f4Mm2cy2zej92cucj+YFMUYZ0MBWMBj9BeFVlei2KNa57+Agc/ufzjp6tiQ0u
         hjDtmM9bY7p/To9iSEbibUNpztp7uMMehLXaq3OT/3KYAmkNUaFNsszs13R/JmSb7g2z
         cD84zIui2veBNeG1xIXb6B1wUHf0+o0Tv2bHC1KK2raefGUUCTvhL3biJL9mz8j4AuAG
         xwUdFRnNVgMM88lN/HCU/VLZsLA4mgSzHZqoxjACBtuOfaJbPJvW3xjTfcwCCEqY9zZk
         Huhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775589761; x=1776194561;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C687xfLoeQteSwkKvA8QRz6JT8hljSA+LtUOYoNV2ew=;
        b=do93OYtN/pZVZe3W47WRzW/pDa99/bUKbxrHPYDMHDDpG7iOmIlAWCPWB/OfkT7VAH
         WiswsXRpacU2crVPODiSIO53sHIt1gp4/rFx7k2/VzQk588u9A22MQ6RmAF8/UPemylB
         TgEVvIlaD64XjsPaA/uAei4YsWdrD7jbJTHhpNqq9JZBfSzWNENATuirdY2aMQDIAdw8
         lPsXtqAcKYBL1ym3Ck2YOPiWbsjLkYA1BG2SFv3oN3dkuWuG0bbE3SR7G22GcONGu1Vx
         riSYeE4u45D4mimdmOe5u1X5JVb8nLPp+ODYCmlZWLmdK135++TfvLqEUoM2pONtlAU8
         ZlNA==
X-Forwarded-Encrypted: i=1; AJvYcCXQE+cvmH3E/laOuBy4QvucVAO07TkSBmHAfUuJBDWIpGpuVuCrDCnVIsWcNEdtjos6OUUPfs/0et50@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNAbhw+8uqUWOxmCJ658T8LI/5QTs5q2gQ+ViTH2z6aReyD7S
	q6kBHpDFERgg6J4UHp7xZBczDqgcnVrMNgjBYatQMw4HfijTLkgXe1zCu5wM9O8FvLJ2NZtIzrf
	aK7RBeNTEAyzPYLkz181Dcj6JkXf9Vg5Lq2PMcFT2ndSfKlk4n+hsa/d6uoUvkWn6
X-Gm-Gg: AeBDietHMxyKfRptMz0Fvd+ZVl38O/W8sKCpCBA4sIg53IxvNe/Ow21xJO8VNJizvW2
	2cQQ5JLD+zAFqOxLB4D6Zy5i/xKGpoDAZaE4a7BzP4ZIpN0OwcSdRnOcqg+i+0pLAcJo/mClFpG
	eC1BhrrPBwoAFXwSsIPhy3J9eDKgJzU/ObG5rCQGy6b2Rr8O/S7hQXs68IiB5396lFq0nYoQVfV
	+4iou8sMW18U//6DdMFQvyQMfL1PoDxKj0n1Jkux8M+LGi2UFcKQplwsAL4gH4p6cc0INfILPhK
	+Lv0W7FH0oDUYztkwTKUZu7clvCVw0RP+jjzufEmGWpbslH1sjlFVHAUXG8eRatVzxs6Q85U5Ah
	cQB+xtsRgoFflb6JEDhygWbNFwt795/ywXNcVz3KAeU70iw==
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr187169955ad.32.1775589761433;
        Tue, 07 Apr 2026 12:22:41 -0700 (PDT)
X-Received: by 2002:a17:903:1b4c:b0:2b2:420a:b48a with SMTP id d9443c01a7336-2b28182c458mr187169615ad.32.1775589760938;
        Tue, 07 Apr 2026 12:22:40 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749a3a0fsm238836465ad.59.2026.04.07.12.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 12:22:40 -0700 (PDT)
Message-ID: <948dbae1-0d12-423f-9b4d-c28e844d8fd2@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 00:52:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/4] Devicetree support for Glymur GPU
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDE3NiBTYWx0ZWRfX6hwI/+N8MzG4
 tEvM2D/2DiISlg4wbERny2tMcXDM+OxtVXJXj+PbjgBJypQ8vHzf83wcDGanxIKMwv2OPtQXHm9
 XUAX/UFvVrQAB6GL1wq74FvHQqJ+ACaPZmZLjW/f/w1Nhb1SufDnOKn6MsaEmkHvVgTQPBX7swe
 LY/RrRO8jRFBDzYZZA4gtFFnyCY6sKh+GJQCo3feYRAznkmMPEwBMsjROq8XJbXFSC34Rw3i/w2
 tMNs/mwY7h3kPPrcYhAlAJioY1A7w9djEeU4g2Di+oFVcVQI2Jel40uNyoNI+Lp4Q05jvotGbQk
 mnMr4zxGYuO9F+UTlziYp83BdF63VexIwEeVdNHbGALUMirulSCwXNbDtrFHJNfWs3fZU54mO0T
 BjJOzgEcQ9Hz3wZ8PrMwMAaDud7FDni4WdmLbdIGEey+5jMpQ26/5VvT+foR+F73+KVNhnwEpW8
 7XhRkFSoiSl+mPvqtmg==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d55982 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=oIjhDLspr5RTlLLUpj0f1A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4ZsNYdiHAHguiUsAXTsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: SufAQcmw4FbVvQhBbI1wOhq82CkB_Vk-
X-Proofpoint-GUID: SufAQcmw4FbVvQhBbI1wOhq82CkB_Vk-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_04,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070176

On 4/5/2026 2:33 AM, Akhil P Oommen wrote:
> This series adds the necessary Device Tree bits to enable GPU support
> on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
> chipsets is based on the new Adreno A8x family of GPUs. It features a new
> slice architecture with 4 slices, significantly higher bandwidth
> throughput compared to mobile counterparts, raytracing support, and the
> highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
> improvements.
> 
> This series includes patches that add GPU SMMU, GPU/GMU support, and a
> patch to enable the GPU/GMU nodes on the CRD. Keen-eyed readers may
> notice that the secure firmware property is missing. This is
> intentional: The Glymur-based laptop platforms generally allow booting
> Linux at EL2 (yay!), which means the zap firmware not required here.
> 
> The series is marked as RFC because an update is required in the
> gxclkctl/drm drivers to properly support the IFPC feature across all A8x
> GPUs. We plan to post a separate series shortly to address this. I prefer
> to merge the DT series after that series is acked, so that we retain the
> flexibility adjust the DT bindings if needed.

Taniya has posted it here:
https://lore.kernel.org/lkml/20260407-gfx-clk-fixes-v1-0-4bb5583a5054@oss.qualcomm.com/

-Akhil

> 
> This series is only compile tested on linux-next. But I have cherry-picked
> and verified the functionality on a downstream tree which is pretty close
> to upstream. Also, there is a dtb-check error for the adreno smmu node. I
> will fix that in the next revision.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (3):
>       dt-bindings: display/msm: gpu: Document Adreno X2-185
>       arm64: dts: qcom: Add GPU support for Glymur
>       arm64: dts: qcom: Enable GPU & GMU on Glymur CRD
> 
> Rajendra Nayak (1):
>       arm64: dts: qcom: glymur: Add GPU smmu node
> 
>  .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
>  arch/arm64/boot/dts/qcom/glymur-crd.dts            |   8 +
>  arch/arm64/boot/dts/qcom/glymur.dtsi               | 234 +++++++++++++++++++++
>  3 files changed, 243 insertions(+)
> ---
> base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
> change-id: 20260226-glymur-gpu-dt-339e5092606b
> prerequisite-message-id: <20260303-glymur_mmcc_dt_config_v2-v2-0-da9ded08c26f@oss.qualcomm.com>
> prerequisite-patch-id: a1fb5b7ee94995a24f6e96d1d2524e710d3a7e60
> prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079
> 
> Best regards,

