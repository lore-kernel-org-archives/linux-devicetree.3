Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7FB3FD129
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469539; cv=none; b=D+IhhNgxSuyQ5Kz7gXQMTq4hF5E/4sKX+/gKz/bLetEB2QUHpmAFfS9MlqiS4Z/jijA7VTrQUWgo7F1lIdDlQmXsCpzQvXQU+4aCHK7hG9i1eVc54Qg/4MyqPVdSGMAnpCdXVo6XQ6lM51kD+fW97Kn+C+wto+XvNhtv08QsW6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469539; c=relaxed/simple;
	bh=8MlgmCf4zwoh87Y1YqLlhl00eWh9D+mSMPCZDrhBsPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdZmIPFWfHzb5ZLQy5G1W/rYKWYlLDTOl56o26FbQPj7RRM+3PRHcTYQ7SSl25MilS/4hmHCZ5uxp8+mAqIr+bYEAtSUp9F6dDElStRs+/o8D4fi9lIJY3MAO5pW3jZ5CnSG2XLXPmZOh7c2qU+c9VuzLmSANaIccGAQmzAsGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4ShSk6m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH774clm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4ShSk6m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH774clm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q6iL1721216
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zlXmXqOMWysl75wyJsPWf9ub
	9kxU1RPWgNiLMjMjO54=; b=b4ShSk6mKXAOrKXOdRb8rgeM9x0E3AOsUVpGffLX
	YHTR3NG/VHJbPyYcC95HQFsUhNe0VmjCUK0JBtUkd5xLFcFUvZngpyRLOUulQDSn
	nhS0ymk5Q/TAqTVAiCkTu/K2KoGMmZd4ITeT38pEf4r1FLCOVVHy8E6SudEJgvCz
	sI9DUmIPcJBOLQH36FG8SrtbCgHiNJttNS8RBr4nrKjz79AgT6VAzVj2EmgqUN5c
	AYY8mOcO8yx/QLoMEJWhB7hiq7WTX1D0YnsBoA1Ov1EpE1a3KvY9F8ZZNhTwA9ez
	4ag4G9vhGXxwOxTZimD4kr4NPA+7utKXEk+8SArbJOKdPQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua7327ed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 13:32:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24af7ca99so171564305ad.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469537; x=1778074337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=TH774clm96wZPhoGmpJeY//uhWuVYJU+kxkCQvnbsNEhyC0I5RdCJw58cgiocmfM4R
         CPGHJojodux+Co8oZMFYUYkQnU1xfclbiJnWfiJvtvuGPUrxqoSLoyYrz66KDp0ifvob
         643q1R2MTYJ07/sFr28PVUG08YF5fTkoJm1wvgWslrWgyPMlVn8MGVhVkqIJFKRwersq
         l7o8DdO3BQNGRIpCIburz7m3jD9bB3iOPXLLtz1kZZFKMlNG0uILlmCfhWdwP1M9Y/iL
         300moZHWS02tcREKfnNLgHTNgayQuYIpmQv8KxyTQoXuZ45QCHR5LJjthuOiiG9z79t0
         5GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469537; x=1778074337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlXmXqOMWysl75wyJsPWf9ub9kxU1RPWgNiLMjMjO54=;
        b=aEhZTgYDtqgX/ogJ+U6Rc1Ttqt4esuMq1s7JbQLA7D87U5ub5LlLJroi2naDPlD3ts
         444YfwVxcuynyW+/PUvHhy9L19nD00ipcSC1kIBcDxfpJqmM3POuo5ztUNygDmsxzaUN
         eCLC5ZlPcq+L91RcC8ODz4xqzWBsWhtVXlBXrWE0wa+cNhVpjHYcl0a27lXpn4hX6LJe
         e5RtJQ8NatQeIdMcssrdiDYELRxXMQ3JBnCyqLcBp7wWP2HhI9Q2tVtMdXvqQ+ay1aDY
         2D/NJxcPYSxs49nmtQmafZznrdsNKCt7G5zowP2ftEanwld7J9jylYtyoC2CwfSfkZlB
         akNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AMStqBH+cItSp6fuKu9bhqbi6llQyTuTj1JEK7Id9M+WOJ/k8ZcHoz/HJjvzogfCvf5hU0+WsV2BD@vger.kernel.org
X-Gm-Message-State: AOJu0YyjwqtNVqVBpT22E5KEtEJGHs5UIBBYLSVWWPXzdU1NagPAzHgs
	NUSUsSuYbuZn6B45GTuqGEI6Kyctlf5D+IfzpDwnoCKXTLdGFf9ZC/IapQ7snRnY6oeDpZvR8V5
	6XZ2dv+w/wur2G/YInYZaXWo13C83p+sZoRa7bcrPtv8Dlm0MSIOT63jeECbP8/9a
X-Gm-Gg: AeBDieto8+j++1J++JMOcIUhxmaXBWuAGQBzvbA4Uv9pvl64d+8EUgz34DNN8YH/osn
	HwYeEbrnRXJEU+dm87SRNJuGLWulGjURtgJJGJBtIa0VaMv0l5jDVLtg0Wg1peVz94FQsZlQ5p3
	xuj3Sh6hPY0v7aS6I06OtzGF624jvuzw/f0NfbF6LaLPPoh19ODtNzxNdTrtlXfu8V7QJBDXSQP
	+7W5Zfelz0W3XS5Yfwdx0Xx61AIh4+X1sr4HIADyQNMazTe2G2JQv64artwOKvzX8YM09a1K4+8
	/k3AmEZss3UsVMR3koNf9XwTDfL5Vmjm+OJ+f3DaECgDIVTEQs74RPN054ZbKYvKITYpfoGkxPF
	i2d8RrmY6wV+LGFKqppEfOFWQZdibP7ht9rvxX8Q+8ZdjBSeuGT5/WnTe0h4=
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44795645ad.30.1777469536362;
        Wed, 29 Apr 2026 06:32:16 -0700 (PDT)
X-Received: by 2002:a17:903:2283:b0:2b9:86ca:5bf2 with SMTP id d9443c01a7336-2b986ca5cd1mr44794745ad.30.1777469535665;
        Wed, 29 Apr 2026 06:32:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98893f0b7sm25818105ad.40.2026.04.29.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:32:13 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:01:57 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/15] remoteproc: qcom_q6v5_mss: Switch to generic
 PAS TZ APIs
Message-ID: <20260429133157.lopr6n5vaik36466@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-7-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-7-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f20861 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UXi9AHVq_sPz40Hf2JYA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNyBTYWx0ZWRfXxEQmsJTt+5mE
 cOF8ApqjkuWEsRO9V6Lkz2t0MUTA8FrLwDhjNL10/O8NsmVOnxRWD8L2C6EQAtGO8T+rlPg7wfl
 0r/2CcYiq4+85IjKCNz/thC5xv01iegWW3lbkwR2igUUWy7h5Ysx4gEJBwIMRCnw4M7IpW4x/Bh
 vh3syrxhNI4olCyvyegWh94tqwz85ZLmzSBdb/2AEinC5CeaGcx9XhLfAJY/gZqoY4T4rHAHVoO
 U+8hAgIVPAooMZheFcX1kGutSiBU0d/Vy73Tnniewqa8hdFHa7prlWRU+bKUa249rw2ejlJA+a0
 OUrx56+WB2vovQWCHrs+H9kY9w4TufczGFeBh0oGXj7TAclXUTcsaCNLgx60MknBHjSOYLz0Wn8
 XEceSjkAmva9sOVBVshH7AjZd7Pa5mb59SqdcfUq9qMtxyaX2V628vs+h0xliq52WYNewIXe4Sj
 MXZxVzrfZsVZgXeSLJg==
X-Proofpoint-GUID: HT_k7ql0QnqYtvVW6FUUoeIhKVqxXV_f
X-Proofpoint-ORIG-GUID: HT_k7ql0QnqYtvVW6FUUoeIhKVqxXV_f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290137

On Mon, Apr 27, 2026 at 03:25:54PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_mss client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index ae78f5c7c1b6..96888007faa8 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -34,6 +34,7 @@
>  #include "qcom_pil_info.h"
>  #include "qcom_q6v5.h"
>  
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>

same here., whether it is needed now ?

>  
>  #define MPSS_CRASH_REASON_SMEM		421
> @@ -1480,7 +1481,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>  	}
>  
>  	if (qproc->need_pas_mem_setup) {
> -		ret = qcom_scm_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
> +		ret = qcom_pas_mem_setup(MPSS_PAS_ID, qproc->mpss_phys, qproc->mpss_size);
>  		if (ret) {
>  			dev_err(qproc->dev,
>  				"setting up mpss memory failed: %d\n", ret);
> @@ -2077,7 +2078,7 @@ static int q6v5_probe(struct platform_device *pdev)
>  	if (!desc)
>  		return -EINVAL;
>  
> -	if (desc->need_mem_protection && !qcom_scm_is_available())
> +	if (desc->need_mem_protection && !qcom_pas_is_available())
>  		return -EPROBE_DEFER;
>  
>  	mba_image = desc->hexagon_mba_image;

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

> -- 
> 2.51.0
> 

-- 
-Mukesh Ojha
