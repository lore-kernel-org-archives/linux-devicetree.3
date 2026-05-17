Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A01B3C5853
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779038702; cv=none; b=Y/M2yh2cAJ2Om+B6rtKxRm8RnW8NTBmZ5n5x1pvvYBKpx/skni0TYef2faWfc+JKVbtby9N7+vyK7lIwFHumPW+10AtNjQ5sVTbl86fHpak3eNsyMWK+oxyagQuJzHKGCDV4biq+ZIEdIZmuzmKZx691ffek7AvvYkdhH0IOsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779038702; c=relaxed/simple;
	bh=wolJ4ThGe8dC9+nkGWmJ3EDbmW5mWWkDH7iALQvuVsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN2Bk+1juH/XN3mO/419fiweGHxbjPZQNu/QOEO75B7mY+XxDJeGhWkVylOEabgFcsq5u2pi4NV1TRd6ctfMlTXCb6hRPZ2aq+bmWGD8m/cKSYw//op/J4s+GvF2JStUr6XxLooWt4d9GkPIi9zIJf0blbMZF0r50wd+u4rQx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meKhTaR0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGoQFSQ6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meKhTaR0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGoQFSQ6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H8b33U3355337
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=62y0GV+EuCwNt4/8lErab1ei
	sydCTnrzt3JbW4c45hQ=; b=meKhTaR0O2rYD2EE1otQpoGUaBG3tt2BzmrbUqFS
	JbAn64r/SirYpK/2EXzHaeLMDZss2LqyV0+/K6lZKUywebHVvJ6dwQC/Y9OxP4bX
	nYFxCxJss2OEbUS7YPc3ymekaZvkBmOxZXS8EAscEgngwL0JQIy5wWzNuK+4T3bs
	vPqvRMKmfDOCgXvSlPpsDn8DtzskgTmTQF/Ldhwbt6PDGJ0z94k8fsko66Z/iSP6
	QdWAnf1S8AI5oXv78SmeA97VofYrhu9yZl+3F//BHO5fbEqzaAU2QOI/MNTfyqPy
	9yK5C0S8dy9pdUoSv5YuHEe6DQwtE2aKHmcl1Kr9InpyLw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcj53t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 17:24:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-515224a8aa0so75787951cf.0
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779038698; x=1779643498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=62y0GV+EuCwNt4/8lErab1eisydCTnrzt3JbW4c45hQ=;
        b=KGoQFSQ6voJnniUqyUfV+LcEB+6k7pjM25V6bD8vXAjGlI9VKX/H04sS+jxRrD1L5s
         qlJm/sAdc7JRdIwPoF1rc2M2V0/8f8ZhiRyqqEMc/GrK4IHff6HWfeZNaExUT+kvlyzp
         465FLr6QpEmFKalg5LkwXgCiorO2jYA4ThaI7HyeIycWw1t+V03FkF+H6L4S8jCCwA+f
         gm31q7I5ZzPVk4Zp6wZrV2mHZdCtMZer8R8QaGV+FoWqqyRlAYBAH+HWt+pnj2bFYKnR
         a9d/kY4vp6Zi2GvNKmLH02SKystufOqzjQFtCsb7ImrvER1bCCiT8KUGKUOD2CP5ItTB
         8p6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779038698; x=1779643498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62y0GV+EuCwNt4/8lErab1eisydCTnrzt3JbW4c45hQ=;
        b=ZhthsJIDCDzw9wn1srx+eODQAzPh6BrtEn+oQaXGyyZvBIbxEhHhvcDZtSRbmt8+RI
         ysSeEa5ehLzwPS/PRCCOGQpIT0oZzFT+HTrlDd56VKjT+yxtagLtNTtrqsXeuOj6ajVO
         MpqVPNLNVVunM44VMIaJXr/YE56cke2f3O69xZxgrjcVBmD0nJxhmXPAhi4seDrw+onT
         /zb5dUbFIrFEtfzgbicQ1hEi0oOPMFZj/UVkgpObSe1wGwpVFCe9iUgSiFp1pRpBNQZc
         /hEcFzsC7MizoPhKm32afylOloLW2V4v/RZ9k98ZkipOVIiB/pi4Vewn+vr+1dBmfWtf
         LJ6A==
X-Forwarded-Encrypted: i=1; AFNElJ8CtvJTWmOb4m17s7nXnQqWldZg0FQNEssJJgvsI70g7+3rAnoE4RC3spFM2Bwmhs7Cygx254jA2Wrv@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0Qm7hywKUGIWp4Ow0cNOGvSCDziQjbWo9+kHTBERoVr13j8Z
	LRvKry7cm9h3E5DSpe1M7tyWRuGfqire9VagApbo4YUs7iRLOTMlgOy+ywbuvRpvp+AmNbusAEF
	Gf+NuikNOK/pyxJjSGzGlGRUpYWlhG5wQxlDiG8JrbKH5dbvLFEIr7RN0GHVYA/kw
X-Gm-Gg: Acq92OG9E33UCkXi4FSLN0jGqGNUWkcf6jIMks1Vdix3OzWXkUDZMhrPbqtZhnvTnfD
	qhamfBUoAnLiELo4yNejO4T9bJTrge+gxDR+oPLVPnXQ+FxOshwIVeFl2qQcJZTBEvAFtT530JO
	Pc6X+P+pZ5g6vy//tjv964Dob/78tD19DTuHzlGkKVKFplIAyvU2nRUB4g9LeLiowhZS4i1mVRo
	Z5xmBAQgrIYiklDXNgPnkuVdx5mMHy1VjfHBPu4aWseiRNmIIZ6WYoc3maG7tVo9dPIRmItEbxO
	XMegdV3lcVUn6cgruI/zHgd3iayHFkwvn2mJb68KWPokSFKoUzrraDQa2ev5xJYl64zOxkhiQhq
	IP00lt6vEa6HdcY76DPCrfvphp8hA6YYfhBWUTJkB1rkHBQrTW9GYNbFiZHFwftsShzEA6jkqB9
	8G81A5zXsDeFlMO6TK0uzUz2EWe2M40DmQ4MzwAq7l/Kqujg==
X-Received: by 2002:a05:622a:1dcc:b0:50e:5b04:810b with SMTP id d75a77b69052e-5165a0a4091mr177101741cf.32.1779038698558;
        Sun, 17 May 2026 10:24:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcc:b0:50e:5b04:810b with SMTP id d75a77b69052e-5165a0a4091mr177101371cf.32.1779038698161;
        Sun, 17 May 2026 10:24:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958874ff29sm6451821fa.22.2026.05.17.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:24:57 -0700 (PDT)
Date: Sun, 17 May 2026 20:24:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 01/14] media: iris: Add iris vpu bus support
Message-ID: <5l4pecxynb7mip5tmzspxrjnzy6jkjxr6fru6lgfy4lt4vo2r6@cm3w5t3bfksg>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-1-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: XOUcgaMzjmmIpGguSSPffXZ7h6P7Ttiw
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a09f9eb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=iwIdmoSuwSNZiPAV1xIA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: XOUcgaMzjmmIpGguSSPffXZ7h6P7Ttiw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE4NiBTYWx0ZWRfXwckWw8B2tIp/
 3whpjMLVoPcbFzl6FcEK7YoK7xJF11Jr+deTd/PJ9+08pqC982lTGKnirLzB9lTIyytzrqqGUWD
 TPbYrt2VuXga8I4nnsddpsT+6O2cSnO0WmV8D+yAtdRuw1qlBT1VjNafRf5DhXOnpo41jMep0hm
 wwLxuA/br/p8HZsjFGf4vTWrnDsXE+VQExMF2zIyEf4Kvk90xOgdaOBYglRsP939GQEvXD1AHIu
 UPpZLTDeAraI8CR8c+RA+hTCsb3mXlSB1Cqrxt1XY84VxGiifihJfi0hfiSK3v7tXfVBEjNOStw
 Ql52sqKxE+shBkzyCd8pOngsnwKqNOOZT8gPESScVWycC7qurn1tdZ2uALtNXAIu7VuChuBq4aF
 mgzTmntYlc0mJi7B2VaYu3jHs7WThgZZocTrZDGEXN0nB2PdayY/g8daIh1QK6OqddEGLHYJEx0
 cBu0bCXu8ITOR94Clbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170186

On Fri, May 15, 2026 at 04:51:16PM +0530, Vishnu Reddy wrote:
> From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> On glymur platform, firmware loading needs a separate IOMMU mapping with
> its own stream ID. This stream ID is defined in the device tree with the
> associated firmware function ID in the iommu-map property. To create this
> mapping, a separate child device is needed so the firmware memory can be
> isolated in its own IOMMU context.
> 
> Introduced a new bus called iris-vpu-bus. This creates a dynamic device,
> and its dma_configure() callback calls of_dma_configure_id() with the
> function ID provided by the client to map the corresponding stream ID.
> This sets up a dedicated IOMMU context for the child device.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  MAINTAINERS                                     |  1 +
>  drivers/media/platform/qcom/iris/Kconfig        |  4 ++
>  drivers/media/platform/qcom/iris/Makefile       |  1 +
>  drivers/media/platform/qcom/iris/iris_vpu_bus.c | 61 +++++++++++++++++++++++++
>  include/linux/iris_vpu_bus.h                    | 25 ++++++++++
>  5 files changed, 92 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
