Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA4C36212F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778478732; cv=none; b=uoY4Z4o361usCILXX31OR0M1AaaE+nY6htHxuE/coXNOoQxdOgx3FeFrmyI3jA0AUnQQVb0kCZrc8px9BoqGKoU+fMh2LLkzA0GgkewPNpqe+LD1QKjA+VKgaK2E9DJtcE+8ttUSgegFLzLME6ShB7k2fZrN9MAyyN5zsBpRMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778478732; c=relaxed/simple;
	bh=gEygSniM1pwb1d5rEaDZ2qpWQGQVXMOGcEOj7g0O7IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4Vu3kiE3jCOnAlvNcLnzG3/2X0JsHf0GMuKQAt22numQsASETlpAm41cR2bR0Kx1zJ4f8bmdfjrhRys8H6LSvANoFeuLUGEdadBJACM9+kN1ul7BMAjW9dYAYK2S57fD2qRwohgwYFHXb6kYUbN+ORLuOWElDWEScJNlTCCc2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKRQJQIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aB6bbaMb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKRQJQIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aB6bbaMb"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4G8Sb017420
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=; b=MKRQJQIX2JUTzPCx
	8Y2pzj0LgpMtau0ftlz/Vipjpl1U53aO+tONxgAjzzawcI3wcKHPtyV+LmnGU7+m
	VKAiMoB/qDM3Nvd0Q3f1axUa0sq3GNfvPzUMdgP6IWirvXgSv1hG3r8qWYEPuEsR
	04HAX4DXLx9XyDbZ9b6tVhXOGxQzZtkFRaNOcXhraYSuzx59T0tILDg9u7THcHAu
	47AqDLDX2qxuBMwnR3jLqN2sj824KG2b8InEgmRk+AjX3yl68/9hDhuNmcnXu+3A
	JprXAAxHnYzieZUlGWq4ugJARxuF1TThluAVTD7Q5lRCHcmie6HaQD42Wm1cZmxB
	isnmUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfr9d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 05:52:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365bba50e82so3817718a91.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 22:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778478729; x=1779083529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=aB6bbaMbp2ubPqLlNQdY4EsgHg5VgtMtlFHiUBolxAClpHR9JEmXEspuvoYDk5nC88
         1/XfAr7vTkhAVpyV//UtnThwjnIecNWvIEEpggoePRW/MqHY8aNW2ncP+Ql0bh4r3B0b
         EqnGUhYZKh9EAp7K3TOC16oR+uxdtWzKB6MUZ9Z5ojBLIGc+GkRcO1C1QcudqKYc4sZ1
         DFG0hLtnfvx0NXJAhfZAv2eFRNUJaINAbnGQFoaBdaroB3O51ZG9cOvYaJF/RZsg1KVt
         JNsi3zFMZEx2eod2jTKBps2WurRI8onXvX/iRir75Ea98BrFGInMi/QX/wvczdDCJQyx
         AfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478729; x=1779083529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvnm4K8l7T6NPyyBPovwsigFHLr+oEtTC7vrT+0xgto=;
        b=N7OpCtqVtf+YwNXlrW2yysWMsWUfQuVLzPOha3Edz//sNY9BFBLzADrls7gFDT77W6
         6p8GujvHd1vr3xqLiB61+7MuCgBjgstry6GDdAlzAFuLxPGjBgav0skxuJeSugUa84Q2
         RKSVmYDO8Kd/03QDzWJn8kHpRqmXB8yDLx/Ygty8vPU327OmmX7rSLYjpSyUyDW0v2EH
         lLa3vBoWojmxjR/V9bWVP7zyEGjUJYBDcATrENgBr7Uxkb0Qf30vAMn6W/yY4oCvx5qO
         H6tYDCCWvdQ0FVsbc+So1JU8Z6CVi25nL5J99O0Kg4mxGh+T/ckGQfLtbxHrKwLwA4HA
         GavQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fTKnNlonBAS5FhHj0OVXVzwmxeGVkcwgTuBGuyLScqqY4lXWLQQjzVrJ3Krsxx4p9No+2c0eQptlg@vger.kernel.org
X-Gm-Message-State: AOJu0YzdAuFgu+AbkeBHzl6BnQK1tJt9l/n8zV3bZRG0d0/qULs+RTrA
	2995fGz5ZxlifYDKs89S0tAv4BGOwYtnKQvzYfOsFyyqmcze4PEErEEdQAqTSBqj2sewB5VGZTJ
	Doa1QoT9Shz927wakL7ySagKCPL1i3dlkHT0MFufPvRkMs8b+7T6pdSwMLG2SL+4q
X-Gm-Gg: Acq92OHmQrSCXq6+VRvF9rZ/BjjNezF4IKGY0I9A1Sz1F+jd+0QpGwOntuWhCpwV93A
	+8c6pq4kjdh0I3aAP8TnvKLzbMmUJ7e3NTVLVmBUEtzr4x4Ty/j4PqzeEoNc3HBuZVRssy2w/Hj
	ZRKwb3QRDrANKu4G3W/p6a0EuDZshjsSi61SAih8EorCS7fpHhLhbAvwz5KzSfCdD+Gm0CD7YFD
	ptC4eW4SIzbMdpexODemq9Z5OXJveAvheBSp8cAv50othGJQ/9Dl9rKbRZrOqMVbkNw4sh7Iyx5
	wno42RZCBiGLSxhIe1duxlLo1epJxVLZKG2EeB7qtfQgtBu9FJMpynQa7dckxfcVJw0QX6sdSTG
	AQpKT37/dTLovM+0ewDJPcELKNrUuKHsx6ZxFaGuSyFBX/0uvutBC3A==
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7642018a91.26.1778478729142;
        Sun, 10 May 2026 22:52:09 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:367:e244:4c40 with SMTP id 98e67ed59e1d1-367e24450c9mr7641978a91.26.1778478728584;
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d683fb92sm6113862a91.12.2026.05.10.22.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:52:08 -0700 (PDT)
Message-ID: <b473e703-17ea-1cb6-8efc-697ecb7779a3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:22:01 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/16] media: iris: add vpu op hook to disable ARP buffer
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
 <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-5-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a016e8a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=EBYp1ujtl4tFS5Gl5KcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: E1uG9PHa5PTrTp1-bpw2wSlChV3ChIQi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA2MiBTYWx0ZWRfX8CfdcDNKxVZc
 lb+8Hz+fEEIU+4XubQTTXvEQh9XoFS+fsyqFqRbpNy8VnhkBkYqq65JU8dR4QMu64RHwZYYzl54
 PgUpIpwVrsBZdPELbR8jE21H4T2E3DIx2W1wt8fe9BLQfG+zxLbTWtU4di64oQIkN7uNzePRzqQ
 qkBHxbN20Vf+eFvipwHIVUuPfMMxJE6zGeu4y9ZhMWe3CBqK+ui7kflwaJNu7NNG5vrm6UR1dS1
 gH78B/2QSE+IOio10ikuAZrgSLnEZwsJFddRsnNMBFRmcnA6SBeQkfLzZHJb4dfRuI+PYPGOZiN
 ZDud2y5Xjh2OW2LW86HujuxhNW0kTNw8ocgXSAq5VwFrifPiI3w8NQFtC7xnyEZJciG/NfjxzcS
 klaxcc0k4byGm922IZflVvyW56eHBHfjdLWTD4YtD482kqhMkqvK01FsIdpMJPKKutBISWBLTaH
 z1gXS7CsPEiDOFu1eqw==
X-Proofpoint-ORIG-GUID: E1uG9PHa5PTrTp1-bpw2wSlChV3ChIQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110062

On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
> @@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
>  
>  int iris_hfi_pm_resume(struct iris_core *core)
>  {
> +	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
>  	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
>  	int ret;
>  
> @@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
>  	if (ret)
>  		goto err_suspend_hw;
>  
> +	if (vpu_ops->disable_arp)
> +		vpu_ops->disable_arp(core);
> +
>  	ret = ops->sys_interframe_powercollapse(core);
>  	if (ret)
>  		goto err_suspend_hw;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 9151545065cd..71d96921ed37 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -24,6 +24,7 @@ struct vpu_ops {
>  	int (*set_hwmode)(struct iris_core *core);
>  	void (*set_preset_registers)(struct iris_core *core);
>  	void (*interrupt_init)(struct iris_core *core);
> +	void (*disable_arp)(struct iris_core *core);
>  };
>  
>  int iris_vpu_boot_firmware(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

