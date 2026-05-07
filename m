Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C236998F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159325; cv=none; b=UoiFbPuQeFwAxXii8jYAtOvRgi31KG0UZiVO/BvZfxEuhGJkAD99La3MJQSyY4hYzVff4YhgpQUsKh9TzKZBnijXiIOOrayK25DupaBTVUXNFrztR7TuCV/Z6KVPU91cjWqVka+6zQjjfefZPGmRDIyuiF8DCBDBkIhEHuv6nIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159325; c=relaxed/simple;
	bh=z1P5WsyXK6IhfDSWv0FPs0A/+0AfVva7UCu27PBtqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0WJxUkLhJiCN/ImzMU16YiFRO9VP1uTs0JZnWu4ECL2QBLrxTQLA5YNoQ/WyATjQ8Mk9dN9sbH+U5WL73WvpHEOqANmgx4v3wHL26IsS/LkVX/tZ1hopxCj5HbRUbJ0zN9I6Q7h6luTOs4Odh1EJHNfGX5TBqBc8H4kTaq/k0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gaFb/BRj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F325HGPl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gaFb/BRj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F325HGPl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AC8Pt879575
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=; b=gaFb/BRj2AgHG5au
	7YG/MuLJ+Hydf4rkgKkafbnOv/ItWnWGrV35tuOpvnyTkiDXkRogiSBsb6taHbwg
	cilXcEjwlA5Ot0s3qq7TmReROKiGJydiZZtZG18pZ/vGMnc0cmVnBRF//qJm55EY
	Xiv8R/NprSeESrWBJhIfx/XMKrEN7zL12cOlZ7fIPZlizu3WTXKPLCNW0NGvWEOJ
	AXi1I6Gx0dvl0gc3BmvDf8zTPDGr843lDQAycWAzTsRhOeMBWFihpuN/AIk9uoLr
	3wdBGOT4Hkib5L187wxYWy+jiPR8KU5S5vfSfxFq1jf1BqX5TLp/8BLxvdGu3Rag
	sMUzew==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq1w6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 13:08:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9a6d84522so16347615ad.2
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159321; x=1778764121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=F325HGPlUBeK69Ybf20ncipOXpZUNXKMHiMctA8Hhs9MYEwOXIv2WuFzbWfIPCAmuK
         7FME6tjDDmU3FsqGWnqOEGoGslbnu+NizBTvFMLq2rm0YcC9xYv5p7bUT1Ozb5v9Q03W
         lF6wg+OLtTVwD70+idgcWADTurxdzIMa0mQw7S/3+7maOkt/WP1l7pJd/QVvTqpo7eCd
         D38zAUAprf2sCNEZ5dvfX+IeWOX/WMvHCxIZsRngGJnHpMq+zuigdoo7mB0z+bCJJvPe
         xhnPdUxeAKWgsNLXTk58BmTr0ZK/ny1yMflqvXOUnNN5uPZ9DoX/vofFHarEDbmiOf+Q
         FiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159321; x=1778764121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcP2ZZDfQiOaQsuc7xY2K3paWmpBq3v90eSrcpSFHHM=;
        b=WtGztXTYZ/WpnLJcJHF2OzlkvRBYXTACg7ocTKQpBDrcRH5WTOFkvPAVKlGh7aziZY
         y+VoEPxCJPDhVs1q3EU+C58Z21b2iSNLs6/fq8yis2Dyp92UQ+k2/1egh1Sf9hrIxAFi
         W3NPv8iSiC2vgASTC60SCUG94CsongjFzbcDyltUsuMYhyKPD/0iRT0AGXJwnjwGRHcb
         +Rgp/zTEF1A766nYwfnpIzQRW6SL/WN3amhskutXfh2w3rjpKYTXswKL2iPkQ2l9f2s4
         Whxk44wHVGrKApN9vw0V0VBRK9SbKST9b5sH9eXBO3rRMPkxAszbS+qWuJhEKdrEsRJN
         XSvg==
X-Forwarded-Encrypted: i=1; AFNElJ9fkY/jwKC2G9IxCsT1MMAdx5M+LfYxppfRGR25GnlS+lITKhA2Y2HvRxBrWrDDh1Gz7rxlDAHBFejS@vger.kernel.org
X-Gm-Message-State: AOJu0YwxP8cATa+IaOX0WJeGZfojTJ5ntskE8+Ec+v1wcu93k5oLeXIc
	9IgP089aoZ0ey3vfpsWvUZee7+3KYb6usPN5cq6LFbUuQi4gFaW2emzeM4S8Xg03ERD2oV6Q/2h
	W0/AFUl3F+GXyZpRSOIdBJGogtdLzcIc4t31WYB5KvC+kX4qNA69+pA7bo37MuLBR
X-Gm-Gg: AeBDiesc8mByF+sMSMyDl08q2sRA+ycFyk290jpCKOaRgFOlX+8lqfyl0cEN6vAX9z4
	9wHnkpEhHIo1pp1XFC1Xor4VsSJvzgNCeQesJ++BoRcRBmAAlvk2/pah0A/LZf8Gui+2qm/0UQn
	/3Q1H6PbF9ZAH8oxzkamASmWTA4qV9vU0wV7ENeTaWT28qQzrnRv13CK0F/NV2hIO/v/1MMr0rC
	7YFNsxpDcR1LJW3JgeMjzcy41dXXWFH04MKE/pTp1mfH3oWzMujgGh1IohuGAqIxpSW09NKfNV6
	cvsjAhS/ldwD8/Ko4tsJi89TZHwbs20UtzfpF3OsYig9NAZZi3Y4BP/kxieUPoHmBBkUpQ1fK86
	q7shIXUd0NTwzjAR2ORoqneg5AbZ8K8jlbZ36G0aTEZLKD1cDIl9hUniwXD/WvmSSONA=
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38993025ad.27.1778159320968;
        Thu, 07 May 2026 06:08:40 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ba:b738:bc2 with SMTP id d9443c01a7336-2bab7381ebdmr38992545ad.27.1778159320449;
        Thu, 07 May 2026 06:08:40 -0700 (PDT)
Received: from [192.168.0.172] ([49.205.248.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadef91fsm26732425ad.65.2026.05.07.06.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 06:08:39 -0700 (PDT)
Message-ID: <51c9cecc-4724-4d00-8112-175997916bc3@oss.qualcomm.com>
Date: Thu, 7 May 2026 18:38:32 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] media: iris: Introduce interrupt_init as a vpu_op
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-4-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc8eda cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=EkRsrf7Hk27R9rd+nIzaeA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7rbqPpcrvv9w7tgh1RYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 86-DxeCo1bz9nE5cBK6pxEq57TfXjv4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMSBTYWx0ZWRfXxWLsc08asxOh
 gQaUARqL6YVqL6mBct9bQxe/6D+b4cFpsnj/xETUFu8x/pSwQHOANY33OkRUXqXGH8xV33EDtXX
 +Zkc2JmXgsKNIL7IPWgu6/cWWKpP3GdShSpk2cReArugE9rXFu8uMcw1qsOfmYUrhbN+2Jj5tmo
 efG5+t1woNboIyiMyBzk6up8SiIZ3LxyWCkW/m96uXflBx51IMYppb236bWHsVgjqukDTdeNiTh
 0KeEo/V+bIEZw6ZsnYrx+n0P8wczKoTGSPYP131b3w8TGSF3Xhs4zU8TDoZ55W0wn5Q+bihIY7M
 Q4FfQy3gjnrBWD7jgyood36EPlaMFDxM+w6KwM9u0Kt6RrHkenCDari4Cg+ia8MAFL3eLF+CN0q
 D49R20FFccVoDgcr7n4rnGUxvMuuku08BPa8S4rqQcXTtM92SFmgKtvJQDNSneFaFuczyWGpxJM
 w0izqbMQ2s9bYtyPpZQ==
X-Proofpoint-GUID: 86-DxeCo1bz9nE5cBK6pxEq57TfXjv4a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070131


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> 
> The interrupt_init sequence is currently shared across all supported
> devices. Starting with Qualcomm QCM2290 (AR50LT), the register
> programming would differ.
> 
> Move interrupt_init into a vpu_op to allow per-device customization.
> 
> This change prepares the driver for upcoming hardware variants.
> No functional change so far for existing devices.
> 
> Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
>   5 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
