Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720893822BB
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642890; cv=none; b=XPn07uEJjL3v3JSa9Kfhf5J67TFUfoj1wQ4nN6XELKX/T9zp5DijXdjnmFl80ETj8QYwqQaV1s17FIaGRoO4SHqYC7V6NV2HximRm4wk2cK0qZSpIRFD+imCQ4mvSOR64drJe4C3wwcuevBWimMkI9DZWWV/ijSBEMlc68KMWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642890; c=relaxed/simple;
	bh=6CheN6+OVjsfVtGuo6dkKN7Tt+6tPI94k6HXxCnaqII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J5zzNsVm/+JieddhddyRPv4bN7VubrAJ6URwW9IuaI9HDlK9ooeYT7I+/1gGpT+Sr9Rs//eJT+OkfbBSIKH3RhlR95KML9ZXdwrDYD5KquurtWabmSYmwfoNwoLZ9mxa2MXoLXYRdIpg2Wd5Jg9CpYHdcAbxhzTLnhOrVfABn60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAKf//M8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kVnjTgmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAKf//M8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kVnjTgmc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfwjY1912530
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1M7mpcofjqw/XMWOvLi7P5m1CkUODXC/fXLdwllUCI=; b=OAKf//M8UoHkdRCd
	Y3k1HeI2CuEauWqnNTmncNBqHQexI99+Zia8Ivuk05XHES3VDBRqqeskxnG+KSpO
	FONCDkK41iS7ZnecEOHo8iRi2x53HYewQloDYv/Jt86vA6IrTA3OK10rZF/LIEQZ
	ni2gRtYX0bZLIjNFD5XKLPJJrFLyAEElvV5iQJ3HSOyxrx/fd1tBwK8MTc4zPta/
	hccYrdOxWvevoJ3+JeoHIQvXtYRewShBh4zTgQpbhQsoFR+jwIpseOYBZPQKbgeH
	aQrUtAY6Z0GZRlYFLTbWNXwHaYbRacwvA7vu4YgzsnxhI0lxPAVP/mjEAxmmZ8HB
	mQpn9Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujruy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:08:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb835525b13so1525003a12.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784642887; x=1785247687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1M7mpcofjqw/XMWOvLi7P5m1CkUODXC/fXLdwllUCI=;
        b=kVnjTgmckL/NCPuIJFlEoofjvl2GJXjJOC+Lmy07oKp3I5Z0TWHF7C7S9PxIp/f1ct
         iEHzFNdF4crbdpvWZc/j9CYltFd9vlcngZzvXnMKHJFGzh8p831IQyihfj6Zvv1UAn58
         e7T8uQ82GD+kVrbCstBQug9eTlF7IcSkgQ4j+swUmdkECBASRf1O++Va0LU5w6lbL3+K
         kTbjUsUZjhRdR/phWBGhURIsprgOJZq7TGiUmx0+MyaQ2KS+5fyv3q/oRyzG+eAK5kSI
         onAdtuzwOYxEyvvgIOr7gWZ3+BKj+ByXNYw6x+kIoa7sElLAE/OVcH4K7wntaM0aTZs1
         k3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642887; x=1785247687;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1M7mpcofjqw/XMWOvLi7P5m1CkUODXC/fXLdwllUCI=;
        b=Y3qmLI8F3YWEHyR4EhVOucv4WtK0wawjUJyj9a5P9jOArVvRx/Eg8Ku0HCsRDIx8B6
         veBKtHE4g/T6X/ro3na6O5f9w4yQN2SCNGKjkr8+39FmlULjW+oX9A0IIANHbpKZpVCv
         qEbKwrbKy1H7ZlYvH2cwAJ2uuQHKsgv29Ot4zfPluydXFCk2aCqAwDPETfff7M9jyNTD
         5UpJacYxsi+vMuTtopx5MLn9IvoS1OENOa8UU3wa172LHwUoIvsOZx6rIrSHMRGXAMml
         OAeUAOxRFGEUN9By6eqvxd3ET95EXKjCLG+OMdMWMwdI9iBhBIwdcMZqxtzyESQ2q1vU
         xIfA==
X-Forwarded-Encrypted: i=1; AHgh+RrOZySBi2fYINdeWdzad91MYsrSIBANMVXJdQQ6Wq3t08Hl5s75J3zz/s12DjX3JXHaSKMHFWIlMUNl@vger.kernel.org
X-Gm-Message-State: AOJu0YwfVEnK+QVsEW1kjTXTDN5mRWgb1SPXrmay+HU/+EAizsCnvPHV
	luJCSzy3KRypp15SGwxYQCerlqtiaeuxs+PO/Eg6z7Y+dSwpbsMUK/g3ClaKVBj66znHJcu3Nw9
	Do+taQnyRR9/LOr2srbB+i7/RblRxaGSv3FanU6yBomYy9b8uG96+5Kne4Q2B1Yzp
X-Gm-Gg: AfdE7cnhoXq3wlblqQBr0HUd4s8fE66Quh+RaCyLtB0aABjwrcMFzrk37lSl/49334m
	AFnOH6gGKOX2CtaI0dEPH3wtstmSuy3UagdmqFbs9w+9WVKs+Y+fqCVm9pHx4Pq3EErl2irHPLW
	9tDTB9FFgWeOFDDzvi6AcqyjqtzXzupemK5rAWPmTQj1eOgYE7Awl9Vgf+x8cx+h7NX393Tu1Km
	43o5LlFoN3JVU2sNafsjX3rwoobh2cLK3TWRu9YbUqC4g5zAWOg8Zo9C1YRb5CSBaaQ12kjzFBI
	1rWtRTBuHWNfU5Sy2B9fwCDnHlmzEYLTzpMNbBxJNxjHENLRUKKkFD1qmCBGKxkhp4zwoEu38dn
	oc9XM+w5IbWmW25BjZZSO0sxFefazB4we
X-Received: by 2002:a05:6a21:a44:b0:3c3:6f6c:aa18 with SMTP id adf61e73a8af0-3c3ad7923cbmr19375600637.14.1784642887102;
        Tue, 21 Jul 2026 07:08:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:a44:b0:3c3:6f6c:aa18 with SMTP id adf61e73a8af0-3c3ad7923cbmr19375557637.14.1784642886644;
        Tue, 21 Jul 2026 07:08:06 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm47319999eec.13.2026.07.21.07.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:08:06 -0700 (PDT)
Message-ID: <5d213d08-8e00-4e7e-93ae-ba05f22f09e7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 19:37:59 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YEerYXXM79i19pRsYY3CSJetK4oCx1-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MCBTYWx0ZWRfXxZGRPynHClKg
 QsU40jkwCd7atyJQyYeT8+ceW9toY7BfakdzVYoQ1ecjCDFIwHCQDYkErHGpgf1dyafNd4lhd5b
 QRmPQ3oDJUqnHbEksix0Rbz6FJYcoLJ1+b+4n8dEUCOZBJHveM5oVjHAYMl2hEJG92/k3zgNR/x
 sXDvxO6tIJRVFyr1cyzWHdh1Laf1gQNO6RqeywPR7cXSefp5flwFOZUScqCTv9ZNTup/M0PcWxz
 jEMy88yVmzqghZmJWfDsy8ywT2gq+GN+ajJrE/Dv1uscXhsek0yyirMkPJ6jMTro3RbszJDCbcU
 Upuy13aD9xop/Xvw2otHaEKtPL+N1i1pzj8wOQIvQq4XB+WWGhkTYtYj8bZdMhz+jL2wlACK/R6
 VnrXUKwLwmrkagT9sh743I1JpMBzFL+KPg2ncqHezpkpuW3HD2F0k/0heoq1WdK2hMug501cFD8
 9bEQGPq0h7ajzCzeR5Q==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f7d48 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eItqFN5HaNNU1I-o3asA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: YEerYXXM79i19pRsYY3CSJetK4oCx1-8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MCBTYWx0ZWRfX9forQ7FAfVqa
 yEh29A9goVYNCjp23q8kaOdUowon9ITTPiyys1ny1j2cQTziXyKI9K8roGZ+pOzn1ebZZuCGkNF
 EzH3PzYb2JokKZPwthiD3fLRkoaatKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210150


On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> The raw formats supported by Iris were previously advertised
> unconditionally, assuming UBWC support on all platforms. However, some
> platforms do not support UBWC which results in incorrect format
> capability exposure.
> 
> Use the UBWC configuration provided by the platform to dynamically
> filter raw formats at runtime. If UBWC is not supported, UBWC-based
> formats are omitted from the advertised capability list, while linear
> formats remain available.
> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>   drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>   2 files changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4c8bc7aac135..9fee5f28097d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>    */
>   
> +#include <linux/soc/qcom/ubwc.h>
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
>   
> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>   	V4L2_PIX_FMT_QC10C,
>   };
>   
> +static const u32 iris_vdec_formats_noubwc_cap[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_P010,
> +};
> +
>   static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>   	unsigned int size, i;
>   	const u32 *fmt;
>   
> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt = iris_vdec_formats_cap;
> -		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {

Do you see a possibility that ubwc is enabled for a SOC while VPU 
hardware does not support UBWC. IP document for qcom,qcm2290 lists some 
UBWC configuration, while VPU does not support UBWC. Not sure at this 
point if other blocks indeed support UBWC for qcom,qcm2290.

Regards,
Vikash
