Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348915E5DC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127542; cv=none; b=u5XIA7non8J0zI49zfz+pTx06uGVsLq4DtwArBzdZmmjEjVr+wbtxizxg86nQgJChWrx8kzkH2O5ySGEhgobIWzDHwh9Ua2a+Zbo8CzhdtkzK1KcLgQguizib3CkT/ZX/y7dzJe2RIOKHNKzgP4ePu9FnsKZt60VR0CUtmAVcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127542; c=relaxed/simple;
	bh=OkW+cX+gS0kBDcV6nDeljLGq0m/6QdKnrEVj81G78Cw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gGmDTqppbyehM99JZI9XZvVGvcBP3bdN7DAq8P4c0KSNdz0AdBGqazA9wVSHok7FTTXRLKDOka/b6RUAFbOxqSaE9ACo065vMtGpxJKlPQ2fNEsJYukDS+qcO2qcjlGu81OYh4M6sxSczPYqNqxcY33CCEjgg/72AlFmNsXeetE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEEknjCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVLsGHc6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEEknjCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVLsGHc6"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fecH2571717
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=; b=EEEknjCNQqV3VNQ9
	rie+BNjaOSG7NCX0SAP0TSquEgSJqe6iRJRH8JtMt7Ihv2033JEDkxb1Xb/g7ZE7
	d6IWV62w9OsWNObB4K4Ot3mg4pJOju4SQExmVX6M9mIj1yM8NyrbFSNoHZxyYeg2
	vX7Tamrb+1DHdegm5NLL93ggO2kztrN6sYAMNIh2kgpwVaGRAf5X2r0PhBObRkZ2
	MrFz4pInwMxNm1yAVIfKWDuyqxmh/kHBQXYHrmUZ3i5Pnrir+0DPf/oLS5mvvLKd
	43VNjyHYQSLU1OoSeKmhI9YwbjFxJerOJuaAi3XIsh3QsrvObYd9336v0WyOvdyV
	GxToQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3scjxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:45:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so31074565ad.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785127540; x=1785732340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=;
        b=GVLsGHc6YnSmE4ry0oyLs5SpLo1Klb4+rdHvlZzEy1Bib1yeZPkCm1n+UOIjJ9Rs5K
         XP3eP0OINU2Tk/5cRc/v/IzxZ5IKdZb77KYi81MvHNT4nDDLVeEF/4PlneX2XDIsIy/V
         n8zhmz+NfcBms/sVxASzslSQsBURFb5xKjK78NuLtl/CgNGDaa0d3R62hGHLu2YXYwKt
         2USZEhrpf+bmLVBMjL8x6cu+/Zy79hE3qMBMefwAuuHRcpHXdjmHb3QllulbA6GJ/pdv
         5JAQvnSBiOogDUsl/UWsKqHbPeU4PDGNHkuImR0ay0uUfClzAkYp+14Vgu3Yb8z7gqOl
         sQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127540; x=1785732340;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq5K/HQyci9JZnB+A0dArWLShtBEpz2XoUszBdMr7Vs=;
        b=E5iFIEySf8rzhvy42iSueUxT5H/CAF/lNdmVLAlipJCGbmG7KGK4BzXDRAEIrqGTpE
         cLcyhg1m2/SCmBEYFWNJ/YEA8uDTTpmCp0gbxnk0EVzNozuwa5MRzTHVa4hWtcMhrxXk
         G8fUyLkJ6A1dorvZdHzhEyVOGIDyqbUnSLF1Xpb8ZY0eNSUR35rCXM9P8pjk006COlJu
         DcuiPPCN2Ir+mb27pQjSxmaCVX4hs1iLRjL1MReZUr0BLxSBbLeipD6dcpXmZL/5/4wj
         aPrLldlGn0k1mgeqhYFjXsBM7s3k9FRXg1wl4es5dUN03b3XTRjkJYH/e1yQbzJH69lU
         JAQA==
X-Forwarded-Encrypted: i=1; AHgh+Rrus3pjxpN9INIdoBPD8PWmR/4PThg1xkDQaSv8VmVMJKEOIaXbpcGInEjk02eB6wvr9PEqn+oGp/GX@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOECHjb9BxRMsU0YiFmnDu0OPbFvKmQIcKSPRpvjMngIYymEP
	WvcGmqhQeKZpFfz6+wIRIne6uhg6qOFA7ntDTDE6LpUXBjC+UW89TyObD8G+eVeFbzUjLpLIaqK
	CJyrPTNKeVSkYQHzoOv+DRVECVGxjEibQ3x/YLMiLMA6+MjElpLvWXlz36lBxoxbq
X-Gm-Gg: AR+sD132H4K6KukJ7FFYPsnp0ezXrI34OcjstvvZcC08nki18EsGEsXzEucWwXFmtqB
	6LyzJ9z6PS6a8UdM5uzF2+R6Qx2knnNiWnZMEQCP63tyzqPTvLYuJSg4REIbwCDVgm2oii0rBr0
	XQay0A8QCOAQ8DOqe9XOt0mPhGEZRoTqofPAwcoHfVxbJ+Ec2OGXpr7XQRRdKljUXFMmQNQ7xs+
	PkCGraRCVqcptNPlCM2bdQ1+pmKbF4J9QyTE+Spg2NJCw5wmegyL/KSPnaoUyUWRPsRmirKdqK5
	BPd0g+4/UwUOaX/MXS/3+bxaDB4uIu2tATOVu9jW/ziZG+RTYANdVhCt04wb9ECgfxec7j4s2Z+
	U6yNJnxvU1WcmETmUVu4ZhQUG//Ncw5qL
X-Received: by 2002:a17:903:234e:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cfde683786mr66091085ad.2.1785127539694;
        Sun, 26 Jul 2026 21:45:39 -0700 (PDT)
X-Received: by 2002:a17:903:234e:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cfde683786mr66090915ad.2.1785127539254;
        Sun, 26 Jul 2026 21:45:39 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419e3asm26441512eec.11.2026.07.26.21.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:45:38 -0700 (PDT)
Message-ID: <04ec7e69-3225-1a5a-e19d-561e6f74f643@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:15:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v10 06/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        media-ci@linuxtv.org
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
 <20260726-glymur-v10-6-de451559e88b@oss.qualcomm.com>
 <20260726060844.53A711F000E9@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260726060844.53A711F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX56mgGaHKbGDf
 9H31MUfQ4GScZDPVPIgNnDHvX5tqtLRexttEt8hHQ3aSW0D2C2J8xYI1e92GUDGW9Ch0q0VLP9y
 prtAHRly86rHILk+cVK6aqId6bqaNI14c02Yr+C48cTKWWnnpc7Jc+UpYThmO6yHwLAgRM20SlK
 286sZDagLsWmrl/O/w3vIO6Xmrz67wT1m6VyxFv0RHSC8Y1T8TomvdQO3x6yFgImx3oq05yFfpr
 9mSQnXztYPYTT+d6BLADBMZzgnYPGIYlNEPadaq++JqU/xT80W39o85IXr64buZThOIsA2D/gUw
 is8IT038P1d+7raowKEbyt/IT9fcCY13IOFYDavw1hFCto90OmAJAZRRC2eRtYPLMaDNfNweSP1
 1oUVTaxg+AIdxAQT0nMVuWvvfXcvrLMS4QxLZorYL7AopcWDQQ1csc/T7ECXhXgrokrcn2NCo01
 kYbUH8ibG8/lbQeoyQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MiBTYWx0ZWRfX7dQmyXWJHGTs
 mXxQAZBNZTrT4SAByoxWWluBhoutkIDqqZEFaH89VbfaWqQYdkpz9b8rPplv7ShuGbv1Zb5mqcx
 PcsoAuv1jH08obqGR2j+7R4k7Ol7wrY=
X-Proofpoint-ORIG-GUID: rIoZRuzCqfwyOLnWCLigb9uHyZepPTY_
X-Proofpoint-GUID: rIoZRuzCqfwyOLnWCLigb9uHyZepPTY_
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a66e274 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y12TZTguZad93lnPc3EA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270042


On 7/26/2026 11:38 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Incomplete Implementation / Dead Code: `core->fw_dev` is never assigned, rendering the direct IOMMU mapping feature entirely dead code.
> - [Medium] Potential NULL pointer dereference of `core->pas_ctx` in `iris_fw_iommu_unmap` during asynchronous error cleanup.
> --
>
> --- Patch [6]: [PATCH v10 06/14] media: iris: Enable Secure PAS support with IOMMU managed by Linux ---
> commit 4079c73feb157bb490aaa33ca1d6e4970df1c4f7
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> media: iris: Enable Secure PAS support with IOMMU managed by Linux
>
> On platforms without a hypervisor, Linux handles the SMC mapping and brings up
> the co-processor directly. This patch adds support to the Iris driver to
> manage the firmware context device and IOMMU mapping directly when the
> firmware device SID is present.
>
> Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -85,6 +87,8 @@ struct iris_core {
>>  	struct device				*dev;
>>  	struct device				*np_dev;
>>  	struct device				*p_dev;
>> +	struct device				*fw_dev;
>> +	struct qcom_pas_context			*pas_ctx;
>>  	void __iomem				*reg_base;
> [ ... ]
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> [ ... ]
>
>> @@ -53,9 +65,23 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>  		goto err_release_fw;
>>  	}
>>  
>> -	ret = qcom_mdt_load(dev, firmware, fw_name,
>> -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
>> +	core->pas_ctx->use_tzmem = !!core->fw_dev;
> [Severity: High]
> Is core->fw_dev ever assigned a value in the driver?
>
> It appears to be declared in struct iris_core, which is zero-initialized,
> but I don't see any logic populating it anywhere in the codebase. Because it
> remains NULL, !!core->fw_dev will always be false. Does this unintentionally
> make the subsequent direct IOMMU mapping logic unreachable dead code?

core->fw_dev will initialized in iris_vpu3x_init_cb_devs function before
reaching here. It's there in patch-11.

>> +	ret = qcom_mdt_pas_load(core->pas_ctx, firmware, fw_name, mem_virt, NULL);
>> +	if (ret)
>> +		goto err_mem_unmap;
>> +
>> +	if (core->pas_ctx->use_tzmem) {
>> +		domain = iommu_get_domain_for_dev(fw_dev);
> [ ... ]
>
>> +static void iris_fw_iommu_unmap(struct iris_core *core)
>> +{
>> +	struct iommu_domain *domain;
>> +
>> +	if (!core->fw_dev)
>> +		return;
>> +
>> +	domain = iommu_get_domain_for_dev(core->fw_dev);
>> +	if (domain)
>> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->pas_ctx->mem_size);
> [Severity: Medium]
> Could this lead to a NULL pointer dereference on core->pas_ctx if
> core->fw_dev is properly initialized in the future?
>
> If an early failure occurs during iris_load_fw_to_memory (for instance, if
> of_reserved_mem_region_to_resource fails), core->pas_ctx is never allocated.
> If a hardware watchdog or spurious interrupt fires concurrently,
> iris_hfi_isr_handler could overwrite the state to IRIS_CORE_ERROR and
> schedule iris_sys_error_handler. The error handler calls iris_core_deinit()
> followed by iris_fw_unload(), which invokes this function.
>
> Should there be a check to ensure core->pas_ctx is non-NULL before
> accessing core->pas_ctx->mem_size?

If iris_load_fw_to_memory() fails for any reason — including pas_ctx
allocation failure — the caller does not invoke iris_fw_iommu_unmap(),
so core->pas_ctx will never be NULL here.

>> +}
>> +
>>  int iris_fw_load(struct iris_core *core)
>>  {
