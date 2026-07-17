Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7415A86D
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260012; cv=none; b=ac7VlEVPVqFqTORUfyEnsjYIU1IQaJItEVwTbgq0opmDGE+oC5Yd251QoJv/nKN0i+sIioe/QKNAnHa3nfcRHoneUhOjexwz6DqQ6gaElSmZxbsGgLfFr+y7ZuLhAoMzgwSYOpUcqkj6zaQp7X4GVkG+tUEmm9ntmn1PonjWk3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260012; c=relaxed/simple;
	bh=xeS7TuAWqC3a2+4w8CYotSIfCCdHNfwCj0vuvc731FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bjBmB31WgENWeban9gJI5NmkG010FKCE+boIALL3+WBFBUhZ6rTW7URr4I78KhhjrqzdpdEMYr8knTOqiOKQecFkH9tAc3q2cELlGkjV6p3JwXBByXZNVZvqg0VG4/ko/kMLmRKq2w5jabAOCcK2grexZ33zYPzBpcwN0Y9ZPfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWgCcWR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtleqQCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWgCcWR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtleqQCW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33eiV314109
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=; b=fWgCcWR7H/tADzU7
	gv9UAGC9+6P2xGMFkXF3jEJdATfbxdt0AujnvhsWgp9hQde826cM0/hZfPITj+Ks
	Xm+T9SFqEs53sQu5awfkanIpgpK0fumcDstcY6WFx0bu6plas+H76vGi/eia3GNn
	/U2N+F61T2TQmUBIL6mi7bmfzYe/1VP5nLmP+eEJ6mxP6Uyc1bSFwPLp9i0ezR67
	ucFfljNv/6i203QkNpYytbIGpI9NvvdB3z8tZiDcZtYwcKToNYslM8B7GQYjHRv6
	cjt1eNglHLOVUFfU0vxsmoF2KgvdEc4bNxcipKEdi/F9hj1+Z+DqRvEMepEeXYnJ
	Ksy13A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8hvs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 03:46:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso9693313a91.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260010; x=1784864810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=;
        b=MtleqQCWU4cVKnHAGISceqS0hDuZzF6M2dEwP7RW7E1EeYTqnU7L8aKHLjaMlnAe0N
         kA6Pjp8VVfyyHS9GMFqjEPIcXn+9W2OjRC0SxTNyA/yRKH4M1ynA02YG8jzeZBeezI5Z
         kXzKl2jMrY8FzjbsI/YPgh19iA3Na7AnyimHnt1m6+fjZIFBpKn/JSHQyjfWaxPJDQm7
         qOl4rkqqB+89tq/avePEIFayLA04IHw613RIY5IcyrcdpR4gNTGZuUn4tfWA7N+y07Dy
         K9LCq1AKZ9DsmdXJun4mi3g+fEC4UUCZmEQRPi8Kqh2xvKQzzopreKNiB+2CJM8I6lqi
         umzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260010; x=1784864810;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=;
        b=Tx5U8tzj8iIT2W4BWTvDiks1rtZV4+24N1eKbGnssn7VUsZiS+COk6VZRjmOACzPRa
         5Te6hLlK49NtuEiVQokBLPmwhCPWEiBnhjOWcL5hrjINKJmPOFGc6vWnCu+qBIEAFm10
         iA9L82UVCP2i5JD4odNu7Ee8zvDeL5I7NlYeE/CTSA4E7jgzGFDVgFDJKUIFFhufElMf
         y0zYFDaGN9+Z1vVnHn/gCAklnEZQzjDzEfcdKPgbkQ+4CnOTJKpru78GGD434EgrIQWd
         /76I5i1IXErN+gfmkg/FhfzdwLIb3ImTdQx3DeKR2tYZZe5X4n6JqLdGyx50wq9T6nzE
         UzUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqd5TNmwq0McJvME86t9oyEeqBI2qznxYf4UE90TP76OuzsPAGF7UfReCx0dW/X7U5wNuZq5ymNEeHB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+skRUBwxfTaGWxTAPBOVMMTIu4m9NVRo0cFJUoOtwpq1q12+Z
	uH9TSxWp/oZcjHwPpU2owPWv4BASPvku2XaqWy7BQuBcPjCzpDDMmsne9oD0K/4cBsszXYpXEW+
	QDj5+TD1dJ6oRU6UgKNBRKKM6GaQ9YBUEP0PFRO7/OgFasl91T/dO8eAw+8y+UmWW
X-Gm-Gg: AfdE7cmty/teIh6EjXm7uy3o0/2KNT6mlh0w34tS6/kjmGa9AkVVujOlreBmaOTlGUs
	wxA2AEG8gHoFvOwM92ZpfJh2BKQ4STWdXZmxPj4wa6anfD2MI/hb4LP8UVT2vJ/nh7539aEnI4u
	aYqDmsiYSInCqUVY/VdXo4ybQWOJH+r1JEPlNGRl3KniDlxdsqlk+TE6smBqIGJm3Y83eAyry5Y
	Ju4DggcWuwJB/r4ujiXOIC84XvFkdT1zvQ3EtQSZqci4Q8cEwMP01h452/XtJ+nCAri/xurFB5Y
	U23o4cPVkybIk/srP982ExEHqHEup50eFVHcd3iVrMOjllbv0TfeGNvLFVyRcia0FQYEYFodLPl
	236tmB3B5VF9qAIQb0r8wAkjPvY/djyhx
X-Received: by 2002:a17:90b:2b4c:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38e4b5f285fmr791773a91.39.1784260010123;
        Thu, 16 Jul 2026 20:46:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38e4b5f285fmr791744a91.39.1784260009709;
        Thu, 16 Jul 2026 20:46:49 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm1523528eec.17.2026.07.16.20.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:46:49 -0700 (PDT)
Message-ID: <2ec138d8-242d-6d0a-0b87-cd6a65c7228c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:16:42 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
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
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LjhupV9rDtUK-rIGluUCea4FNbam98Ub
X-Proofpoint-ORIG-GUID: LjhupV9rDtUK-rIGluUCea4FNbam98Ub
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX4f5KRFrENUil
 gQ0Ny/NJtE7YQ65n09g7GaVw/Pdpy99kTeilZ4jolP4aA4HrHOVyScATXh+OwCyEb0zqRqIF1vW
 1moBXCQcczvIg6iHkwcyZ+byPDyuv1U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXx6JdaMzHNylF
 vV1+iJiIh2dD9ZTlSgA2hD7gi5w9F2D7swL2iPEMJKOGFzjWnJOX4EG+CKhMwlgkc7RzNWWW654
 Q6XmrFDYCih+4C5MC0JQV3czCxudj0jUh7j1Y0tV3YKiIrCLdYqEYoxA9qg8z2C7OiXgBdxnOt0
 +0C9YBGT6VSqL3vPMBvJCZRCe6Zl4Aspwmewy5tSQBP7+Matps2OdgEn6P1liquI4m5eZ2Y0B8w
 PaVOvKJ3/v0xMCZAWgK5wMBtVfDWINztwzGHLr3i1jmp0/NGOkxuqn5jnVRT7sJCVUgBGpdzwyS
 MFp+GKucMvsYPJ+iaCiZqFJ4LHDNt0GwL+80eaID8yRhIzGbJjLuT7yLv1ID0C2kntYDZS+ypN+
 Hzus5tiSwN6zqzCG854pS0yImYAY6eSpYri6ViITgBD5hmVeAJYvymPtKJ3fbk1UphgzPXEtR0H
 1TDgQg5ZcxMdzc8VjRg==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a59a5aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8n6RmP5xwyQ-3vr3y5EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170032


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
>  drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>  drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>  2 files changed, 43 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4c8bc7aac135..9fee5f28097d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>  	V4L2_PIX_FMT_QC10C,
>  };
>  
> +static const u32 iris_vdec_formats_noubwc_cap[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_P010,
> +};
> +
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt = iris_vdec_formats_cap;
> -		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_vdec_formats_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		} else {
> +			fmt = iris_vdec_formats_noubwc_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
> +		}
>  		break;
>  	default:
>  		return false;
> @@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt = iris_vdec_formats_cap;
> -		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_vdec_formats_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		} else {
> +			fmt = iris_vdec_formats_noubwc_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
> +		}
>  		break;
>  	default:
>  		return 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 16c52ad07e2c..2f2c56bf9122 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
>  	V4L2_PIX_FMT_QC08C,
>  };
>  
> +static const u32 iris_venc_formats_noubwc_out[] = {
> +	V4L2_PIX_FMT_NV12,
> +};
> +
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_venc_formats_out;
> -		size = ARRAY_SIZE(iris_venc_formats_out);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_venc_formats_out;
> +			size = ARRAY_SIZE(iris_venc_formats_out);
> +		} else {
> +			fmt = iris_venc_formats_noubwc_out;
> +			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
> +		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;
> @@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_venc_formats_out;
> -		size = ARRAY_SIZE(iris_venc_formats_out);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_venc_formats_out;
> +			size = ARRAY_SIZE(iris_venc_formats_out);
> +		} else {
> +			fmt = iris_venc_formats_noubwc_out;
> +			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
> +		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

