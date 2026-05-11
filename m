Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37504376464
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477776; cv=none; b=h5csvKwR6lvVZLd62Zk6ADO58ZZaRQFcWYmK9mc4JfJ51zfo5+020cLTYoDB8Vy0/iwhdhO/6vJOo2UITx99u3mks4PlveTvs2pNkI+/PpOT/lLtTepEN1Cr0CkFz3/dwTVSoeaqYnk4vUyL0Y8GlNqB6h5UsPnac6tqVOUg5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477776; c=relaxed/simple;
	bh=5dpMoIDo8QFJZI7yckDZQOv9pwPa7xc38aibL5K6lfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWo8zNTcELSNUsV7KsM1jDteAxqrJcoXz+ejjnH6yb3ZX3g+pnq12pAzwfy0BFT8PK07w0ndQfzp5i/bvvbdzOpG+igTtSvOg5BEWAmVVc92H0I2TijrZMqrx/CcJNW2k8vPy0YqWghfTEHoqAS92E+BQlecpEC5QgVFOq4OHJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy9mG3XN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8JbwEgh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy9mG3XN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8JbwEgh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ALmJgT3773132
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=; b=dy9mG3XNSCXhW11w
	8CGPXQoJKAbhbSfiAuIO1KaSh6vLKbWZhrViBJFaF3ae/kPif/ZQk766bPI4bpI2
	1JSV4ed9VW3YRrG4jFQMxKiiL3iqhvruom9lLONRuOo0YKJduhYFc2lVGyvWDjKq
	y7MxjA1mBWyyU3YVVBad5mnn//rXsn4TaBhbHNC4/Pl8ZlrkkwZbhReu+ClgUxRg
	QOOxifWqsUUKb21OZ/aFx1bTmtOnxkHOlpi4tFEkN7HYpCfE7jetQi8DWB3DcdnH
	ifCI+4ta0LcxZ8SUt7/HkqdyUslNLCCXZPd8LvBhGsNFG31155ms2OKqy1Z49ybe
	nvaveA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h3svp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:36:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so2842487b3a.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 22:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477773; x=1779082573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=;
        b=U8JbwEghb/W+P/OqPYQ30zZhE92PTBaDCAYU6FoTbTT5o6SVDr9WOQKwq+hjZW0CuE
         CNDRKPl5fpCteNqP39ztlhYfuT1BGMqlJVS3U5HnYYELcEaYIbcLMEDnMQ/36o6axVAz
         2no8q/5IaiSrOINW8qh2sTPRI/VqAwfnYZycu9kIFgPc2pKV9Kq6AH+8+QeCzSVl+WRL
         Ir05ACltFjUsL9mP3x51bwIUbJ6iuu5qYIQyKVRAnbVpNGzh8d7NPNVh2Y6on5RlPMDR
         FYzcYrFzgsYk3/KAxmqNvZ7kmNOWqNgc09acwP7hkkaYg7lMvJIInmjwd4RfFLpAO+DL
         ZLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477773; x=1779082573;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zn3q2tB3nrSjUhvYSb/f7baTDkPRRFRJ7mu22VCIqMA=;
        b=g+y88m1yU7AUktgb8fbvHDk6k/vj1o3RY/5Y6GDMgYVGwP2f8uAfBP4CvNNkbY4zg9
         AhvkPLz5vxIjaoRKXKN2IozmdOCam04qGlWPA6v46+DzcK1I7BCBXd36EiSxlCEcNOJf
         A9dU4mOf3NsWZ5Q4INzVjmxQiSf68d8f1nE6YgDbD4dqS9S1Ba5fz4/3truHN/6CYsx0
         7ZJrr936/lGoT2hXbwPfeflEVb3hLzn+Rva1mPRJH/Hpp3+b2ihH01Krq+yZ09799W0X
         lHSSxS/cs29+H4+dCWjQAgt3g18XLyFiZh0Bh7nNG9Lye6PkMiVAz0Jnczx2ZcgkDreO
         zuCw==
X-Forwarded-Encrypted: i=1; AFNElJ/xo12htnCNBANJ2/Lopj/ta29TxZFIjLYo50VEioMd0wwMfftiql/AsUUmDKu06XgZThVMMNv9RuS9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz87KnjvtEdX0MI3i9EHBnpudW5knrdfg1710FRiobjAvUbkJ4W
	+5gMZutJFgqq5kFkcyh/Vg0PL0AGN+2q6O9+N6B03bKca5QUBHEJ1PS+N2ulf1ExDHl9tWUTbtF
	Em8ZLFS/EmzISVWX/qkNlglGqCWg7anbakco9ZIhUZhXuptrXbpPsHUch355koq2p1gYljui8
X-Gm-Gg: Acq92OFAtIc3xZjRFdhJDc+31X6E/OiSIUzEAHxADH9ZQCybstO9ThzCny4sAGaM/qo
	Xwv1tWx3hGcUlqeBv1EMNWZRDDOYM5kBF1TDgPo0Bjk7xM4z5yEh4jBCE4rxkyfw8IANsLrmHxb
	fxLT+MpkOCWKIgGq7iZJMIiHPiqdIasX7aj6xgnMpOqWV+9+43FdDxMfyf8XVoNEFE5Eoq+VDUJ
	3SxrbG7OmeDnqKRrFZC8sLs8xDjrTI0H+KeimdSUUaF1e9bQC3Cie6PmpFzdhEWrSq5Lc7U/vIH
	8x1wnlctTtiMucKW0IZFY41gihv8X1rvg0zk8/rcUAPstjpK3jN0h0GFb1qy2XU+e+vPJbmfYHu
	ldYmqWxap2pjcRpwZ10Wv8jx/yPwfXmZ4Uqj9FWusWaoUKWG1hAL6bQ==
X-Received: by 2002:a05:6a00:4c8c:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-83e3b2d95bcmr7811189b3a.28.1778477772823;
        Sun, 10 May 2026 22:36:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8c:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-83e3b2d95bcmr7811159b3a.28.1778477772349;
        Sun, 10 May 2026 22:36:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbcf16sm21971929b3a.40.2026.05.10.22.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:36:11 -0700 (PDT)
Message-ID: <20dce5d6-bcb6-e844-8bb0-257598c62e90@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:06:05 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/16] media: iris: Filter UBWC raw formats based on
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
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-2-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NiBTYWx0ZWRfX2UHe8latJ4kH
 BARJ+HAQdQdI0RVV+dkbXyw7D/4mTwbDnuRllYzRR15OLMyVAYHRpWgyO63dvEUnESr7SHtVUEK
 EM83dIWrodXEJLoW3xu35FfGSbRiVmpqJZiQk+Vp15KZh9CqHpjBJdB8mlP449rqtBBfztK2Bkq
 H7UyBv0TNZTVQXO8ilZr1+zCUFlhtLqdgf3s9Z2ruQB5N4tjuKxU6TsR6J7P/Fw+97dVDGGXZ9d
 tWaES0u3cSswd0DTlTz1Yx7R25xz6ReJoxqUJnP3biZyow5ARO9PfBohbPyTJ/h5UJ+ZpFsK1cm
 TWny0CBG88U4yotbRMhgUZQCEAfR5bDT7+5pKLe5/C+tR4njKfCEjpo+dFOYSNJ23kT5ir1/Cg8
 3Z9dqGfSDAtJmxgeGqyv2HL7fXIrY6I+t5mN00IhFJ2akDKqyzlcg3ILPQYkMzCzuD2XZmnnQj3
 ywe29OePeBmx9L3Wosg==
X-Proofpoint-GUID: 6z9Q7CGVkgcdDCo23agPnevZK33CSiL5
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a016ace cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Y1NcAbc3FcPegVIdFrsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 6z9Q7CGVkgcdDCo23agPnevZK33CSiL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110056


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -100,6 +105,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -111,6 +117,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_vdec_formats_cap;
>  		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	default:
>  		return 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2398992d0596..c41f4103ccc3 100644
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
> @@ -97,6 +98,7 @@ static const u32 iris_venc_formats_out[] = {
>  
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
> @@ -104,6 +106,9 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		fmt = iris_venc_formats_out;
>  		size = ARRAY_SIZE(iris_venc_formats_out);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;
> @@ -123,6 +128,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -130,6 +136,9 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		fmt = iris_venc_formats_out;
>  		size = ARRAY_SIZE(iris_venc_formats_out);
> +		/* Last format is UBWC; drop it if UBWC is unsupported */
> +		if (!ubwc->ubwc_enc_version)
> +			size--;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

