Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D233939AB
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774613434; cv=none; b=LVyym71wxvDgZkocqEa/dMsXIqwh1/43GcUBwhkJxRC7mxZQJfp/nlbv3vOPBuY8ztREjztJB+cSyku5NiAAE/DVFQfKhmniAxIW89/NnIn+gDQqMXP/9gBJAiS8Qq0Vth26SOUolKnNWsK6XBk/nsvPaHBvEJLvCfqBCvdum7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774613434; c=relaxed/simple;
	bh=7RB9EZqPtA0omj+QCweCs4rq3RGq8GMapB5Xh18U0eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YEB3eBNNeGWOimqoN8Hk/g38d5Z3hZQ29XPWU+hlCycLPxAdEdja+G8vLulv/cuZ0O8nVgS2Wu3f6hmL4iepmdBwUd1PpETVSFCvgrRRXsCWbE9Hw8SmWaT7TaI5f23Wg431+E18NhU0J47/4bgh5e/yL7KRy48QkXWiEPEAQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Up21IAxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvUxO/VQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Up21IAxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvUxO/VQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vi3q731325
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=; b=Up21IAxvjvhnBku5
	1WEMR0plcKU/8LVRwfLOzTqQcWm/3I+FpNYWTAfJE0dN62SjCAwOLiTXkpyOBmi1
	F03PkTNDHh3WcdrldG8ULdMLmcQ/Oc1kjap8+L8KgAcO8jdGI2IPNhmq6/HEfpLN
	Hx1h95vFsrzsa8PP4bVyXCHqy6IdyUtoYOcjZ9fVYdltJ9tbzr/xQ7sFTf2LHYD/
	4rqENwzKnPuPHAvJD0+JtODzjxU2VRtX1Vdi6PlvOy8X1W+bHnHXA+pCGN1JHGBI
	j58bnigDIr+KkVbhN90OmOsKB0BKxod3uqxB7+n9v3z69FMEDlvgerGGDdh7lqqG
	2Kv71w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5a9q39f9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 12:10:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358f058973fso2910167a91.1
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 05:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774613431; x=1775218231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=fvUxO/VQvvL/PziZXF+Qs2ai1RD5lOKeDkatgXIzIftSVeQ2vdNNI+soJmTBj2bihq
         DeHHtrDWbfYNIsDl8wHYewXXSZVPvZNpH2pJI8nHh3oPlMeftrguCOzmKsEhBZ7BDKUI
         irLB3Zn5onIMXrQKK/cvScZIApgrL8GDWxt5cyodXEfhbaJDJK/t+E9Le2VBP9s++cE1
         mzxK6Yrsjiob9nVhbCT+z6s6OyyByvQtIvMLFBOr4JYBjaQ3hIPiI+O4N7M+1zeEd1Id
         VG2EA94hQKdyyuVhnP1iXhUc9BCI8/l1RJ3kr7mvzev7FVx7+cl3ThDwWqR7sh/jWLms
         ErGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774613431; x=1775218231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EE0yGsx0mvjT/GTmYnfC7r+2Fd45Q0DeobTk/gC7vvM=;
        b=gY78IBuoQiFvptbh4+nNdi4z2VT7PctZ9bmoL41ttI6MX7/QPFpIkrWjnoqFoymm7c
         Rrwci4Qkc0g1Ib1bVfRsWbPOdgqnHUWUtIMc6iUyJv41YkJzIveC3ohpasWtYeiZPAcO
         LJZHVFRheDjURFeVjzinPITN4S1CbwzidEv9XTtC83g4caRzrIto7q5Ff4jvOEUXNRf1
         EGjLlP3SffGPOBNVa+oTp03kbjfsmZRFeME0fx4SpUNzlm10zeVg8iSYvdgJrZ03gdC4
         JDOXWuUPFZL/G8h9ed63/3cqCSA8nHAQehuODMgIy3UJKtmhSnVZVfiVtAbV7YCgtt67
         3eVw==
X-Forwarded-Encrypted: i=1; AJvYcCXmSaGk35zzCmNE+yIzygh1sT5+LmsS0LzUaLGd3PvTszT9mCUBLt3ZbPqJQJzFm30nqvRpOPZ163n7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz88envw+0fuzmWcRhGHUK+bj309QcXb4lQ5/FpunFcAqVTE+Ls
	9APo1pyMXyVwLrWX+gX12ozDegfr+ID/08sQpqeq5FJI1JIwahxdvJXLiozE1upic/4wmkp7Fq7
	Whpofr5Y59eGjrK0ZZGIcMHDRietPkLXwp1/irUQSqb3bRPrAV+IDcUntjO3lel3y
X-Gm-Gg: ATEYQzy9WnRevIebOMgaNyQyQ9BhdtvoSoamA6IzGAc1jBQdixoV8KwE8ITVY2z/KIp
	CoY5fqX/8J9DpB9EF7cfWeln0eIvm7oXF4ijoRkeRomkKnlhsXDBJftSKVwBt8HkDI4+ptuHi+z
	xhEGp4pUHJI45CbyNh0cqPccNw25/VVxvMddlt9kHUtimww4hIWUtMClrNz6f2HdGr89M4N/xhZ
	N25S2LdZ4KirGB3Wrs5Ivu3lPfrbvv578+Eylj/GZmBZ5eZr4uhXudVwUINTHBPJ3GNpOYP9uMl
	mMB04lSR6tpDG0sVbgZKxgESYxEoleHmJZtYavQu8oltz9cz4EHGdK41BhgwC/NmwD/4/aM1+J8
	82Xk5qDd1c+21oxba/joxGSDSRuRMi2Zw5zfmtBu6R9Do/Luv4ZU=
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299311a91.10.1774613430836;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
X-Received: by 2002:a17:90b:1e51:b0:35b:e51a:85af with SMTP id 98e67ed59e1d1-35c2fff2c76mr2299260a91.10.1774613430257;
        Fri, 27 Mar 2026 05:10:30 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a81757sm6204402a91.6.2026.03.27.05.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:10:29 -0700 (PDT)
Message-ID: <bc7b116d-de41-4b9a-9c84-1010e226bac8@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 17:40:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] firmware: qcom_scm: Migrate to generic PAS
 service
To: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, akhilpo@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260312062756.694390-1-sumit.garg@kernel.org>
 <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260312062756.694390-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UVbqBaD0oVNJm7UoPnSbwSweifztZ_Ip
X-Proofpoint-ORIG-GUID: UVbqBaD0oVNJm7UoPnSbwSweifztZ_Ip
X-Authority-Analysis: v=2.4 cv=J4GnLQnS c=1 sm=1 tr=0 ts=69c673b7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j567PbXuXaTzagYqJJIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4MiBTYWx0ZWRfXxAMkQduxqOFg
 fl04ltdHoOcSY7htyVJ+gkphU6+tGokYJD0a8jegnO9huJ2t5a6KFtTOQOit5rgpsRs88fgF+vF
 vQ3gaHjiL7ax3JzzrkT2z8LZYtVsJdfOfk8i/su+v8iihGF4og31HfolB7UxZL4FbajyNpEQnWG
 9MW++nokMoS25iX8Y9SiYusjypSpqHBaOBS7u1V9v8DFY8KTR0LRtJ6BzE/824dx0lxI/npDQB5
 HmttdguaYkhsu0APkV2faX75xAClFxMHtHviX/pDS+VQuMBBgSRrUe5qgvjbNqvcO1Yushbh9Hb
 UCRxQvcWTCYrdgmflj/Wb7uJh0s1Tuu7CfMYGAnWvg2xgi6IYyDynf71FzVRafAbZXWaz1LHNzF
 0EKTOW1nFOujDPk/EWk+/veY/1X9evDQtuJr1qhFoFpX8rJmJ6VGrN9odUppa2DEFanpurHqIl9
 cy33NiXbgf71V3KmgLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270082



On 3/12/2026 11:57 AM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> With the availability of generic PAS service, let's add SCM calls as
> a backend to keep supporting legacy QTEE interfaces. The exported
> qcom_scm* wrappers will get dropped once all the client drivers get
> migrated as part of future patches.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/Kconfig    |   1 +
>  drivers/firmware/qcom/qcom_scm.c | 336 ++++++++++++++-----------------
>  2 files changed, 156 insertions(+), 181 deletions(-)
>

[..]

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 8fbc96693a55..2d7937ae7c8f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -13,6 +13,7 @@
>  #include <linux/dma-mapping.h>

[..]

>  
> -/**
> - * devm_qcom_scm_pas_context_alloc() - Allocate peripheral authentication service
> - *				       context for a given peripheral
> - *
> - * PAS context is device-resource managed, so the caller does not need
> - * to worry about freeing the context memory.
> - *
> - * @dev:	  PAS firmware device
> - * @pas_id:	  peripheral authentication service id
> - * @mem_phys:	  Subsystem reserve memory start address
> - * @mem_size:	  Subsystem reserve memory size
> - *
> - * Returns: The new PAS context, or ERR_PTR() on failure.
> - */

Shouldn't we drop the documentation for the exported functions in this file as part of
patch 14/15? After this patch is applied, the devm_qcom_scm_pas_context_alloc() function
still remains exported and available.

Regards,
Harshal
