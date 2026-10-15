Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F2401494
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058247; cv=none; b=LBXY0BxyxHs2FiTuNwyZJJuV+Dx+/VAn2avILXpY15kFzxea8MtH/iWHHIqACTM37ECgGEIJvS/qDmDJdUUOlXjxuUbA99ZnZnzwQUhseSjHFakyVQzMSEVzBublIg2X9WptzREsDV9+yTnq/Xe7RVMuWqf2a67SzPsgZbY0fyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058247; c=relaxed/simple;
	bh=m7fBCYwiDQPfOfvCg2NYD/p0ZQsHrQGr866hOEFXRQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIdyzeWHAfPm1HtN5vxKN1RE07p6F+LlLzF4uL1Z5MupzpgZSyjcDZt+QdWF+7bZekJefyadvXV6mkRli4/Ltz5dwUTmNSHIBesWgHcOvLuItZ/mWX9zwKWQIVlDk6/eHfswA5BDbCaKh7LMlVNeyMeI0f6yFfAHetPcEJu244I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+/qZHXL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCxwTGtd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+/qZHXL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCxwTGtd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jfwp1955711
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=; b=C+/qZHXL8cJkWiw5
	LpqOlB9iXvRGtnn8ME99s+jcjvbiqJKqSAWKGlCeovY6dYwC/2kQy5tIXNl2SEMU
	6UOtLRPtuaJA51MAecAKnaghh38mx53dMCEfcPbx6+0aoz8E/adv7Ck1j278NJaV
	ZV2dIUAh98oqj++qSeLMbIajqhH9wDLMWZJM0kua5S9mDCk98cZH3/QVnPy2bRuv
	a5d7oL7C8r+vqw5mR/ORtTWMu2ZVe1TyhNT6iti/ROpXYoYekwlg5yPErxRTLa9x
	GxbXTdimVBv1xw558/U9lHwb9sOezK//IOUb547hkRy5pIBUn+tPfGq6LLmVgVya
	4cSaSw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet8cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:57:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so3684690a91.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058239; x=1792663039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=;
        b=fCxwTGtdPPxkjB00ZAcSCz2ARbpnsrShwNB1EREUfZtgojEkdU5DKyWfSrBkc25d/l
         I4eCJGFO9XjIAUI0XJJW2VEPx/ZZb49P4j3P7M+dFIoiMxfdm51sDQheffHjDtmPPhj5
         4Wd4aKbjiSYq8HAFrOKHrSX9aukgUrfsCHJmPO1liU/BYO/+Opr7aL8UrSdGiqUiblth
         z4DMrKPMAK9n7L9FzLWEiZaTHWyjTpYPb8Lc78kBCuNTp7HXzSzD7AxbTtuNJwuZWzsF
         7gQIa71y5oVOnWVbBUoLeoaaE0W8TW6LgmQeWWjP9/5WPi+qO17sxbXY9fguNUTX54sW
         MJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058239; x=1792663039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rthR7zp/u8hmriUiION4Kj0UucDTPcu6h2RFbe5VXg=;
        b=m+/soZIPPIzQT3Lt7gGv47XEAMnZbMklh+Xo5IaPcuGJHYYl0xschv/Kkl8GMN4j0y
         7Khv1BH0/2DGlHF0KggiPbENwHmB620Xja1DzY/Vmzce8nlXt7qx2n+eiObu9bTJgOfS
         exU14mvF+ZPhopjmR9hlJM/an8qJxWHFAtY5TUyInTAzSB+uTTrHKlAgedl08xgKDBbV
         OqRkO9W3WaaSEHaHMFh78DGyVRxQFA0jETyiWOU264voaSA6C/hcTdRS6dtVcSCqXqQL
         oXH5ch6wNUFhEDf00ZOIW6F512E5Ftet4VhCY5S0bOZghABfKJJUQzH1+RXKHP4hy4k8
         QmdQ==
X-Gm-Message-State: AFq9FYLEuHiap8VpgAB3pG8D6s9szbG2eBf6VlUJu3/lZc6/TBZy6WZg
	wvxliaj/vcoI+J89/zXUrXQi8rovuVfc+sUsgVJRYqU0Fi9sfBVM8YerZhUJPRTzDULau6tzA2g
	/kHwzUC0XnsDJ9xGudd8juKae3IMGhYtxwKYlDHGBXF8ONprV0TSn6+MBga4InsBj
X-Gm-Gg: AYBFou29W2AUjLz+G1EE8FGHzYuSXaz9R6453SvvTuecw/NlEyFCXPTSEh4slyOKIk9
	/7ERv3AjDcvhTeLs7AilWOh29kEK5RZwjQPcWKhvlb/LhM9O3QkzcFAcQlZqUXDlZGLS2TN14CP
	zWWzvpWEo904ouj+ehw80DOsH+5xD7KDaET4lnfGGAhBtbBEL8h+PJthN2Np+brvI4AfgBVAyrY
	aeLWAdEQHcaCGnfM19fB3IzPXab6n2JsN/X9p6CIuzq1ANV3UfgwdRTb6W/JyltIylmAwPwJkgj
	/a5cjNh8OUiQTzqPio1UnyJVgIR98xlMirUlW1XQQNedg6KVlHd5bXv4RVRRKPdWfblnIXMgmRw
	JiNca25MEtEvtITZHU5mdH2+SACmCgwQ9XqsCXcXxKpZFVYiOBGgtEzW2j0L3VSHscIZicQC1Ww
	IYYlqO2ehYJfw=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr16168844a91.41.1792058238784;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr16168815a91.41.1792058238213;
        Thu, 15 Oct 2026 02:57:18 -0700 (PDT)
Received: from [10.79.117.80] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7311sm3666246a91.4.2026.10.15.02.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:57:16 -0700 (PDT)
Message-ID: <f5b4aa7f-16e6-47ca-94c9-c361d40ca81a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:27:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
 <sashiko-outbox-172329@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-172329@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0a385 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fJN0sLsdM5QiqpGE_s8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 7yk-RE0lgKzqJ_2hckLPLRc98OLf4gzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXzEqgsZG/2LzI
 +LmmsLr5vh4706F7iQI2sacbDBCYXSRmqf4apcULWWu56+N+kCPtOpBjLnPnFvgSFFiDa7Pl0g0
 TnLmoQje8M9YWVX54+leLeLtK+YjC9RLTOjfFaQyN9N42VvVWsZaFYlOVYIoXaOYWnl2QrfbMBI
 3Mq4JXNDmNCMTi9iF1Vqh2ROoVWlbrwXU26XcSIIKlCRtFJmQli5x+aDPieulu9XQTZapfAhCP7
 UgLaP+AdBrBWJWrV9RdhBXZLjo5Y0MD0x51ekRacZ0mGuysiYEhAvMb4L7VosHIFiGMavgjKIbS
 LUnan8GOpv1G4To7ChXVyvMEtdCLnN3uuTofeTChcrMnes5SYKnNgUy+VgYLIFdEscCFCPWvyqM
 pYDW0tsMrDGR7zBGV5ajStOdAokWzf5S3lHqA7YFYMhF99B9i93eoT8/vPFidTeobHU+xXG/Vif
 NJQh3Ke9ocQ2B1cZgjQ==
X-Proofpoint-GUID: 7yk-RE0lgKzqJ_2hckLPLRc98OLf4gzj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/DR6ZpiOE6ba
 0BrbVdstApf1XIidJW9cN2SmukS1qBPA3MJUpO/QGZF9j4EnJETUOqHfexwkvBEqtBJkHPsqsTH
 UIeXdKxqdPHy5hjCfu/o8tcDGA2qHCE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039



On 10/15/2026 11:35 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] qcom_q6v5_pas: NULL pointer dereference due to early returns bypassing context allocations
> - [Medium] qcom_q6v5_pas: Memory leak of firmware objects on successful load
> --
> 
> commit 3f3270df945541b7e62ff38a77d04e462e6bf823
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> remoteproc: qcom: pas: Support secondary images
> 
> The PAS remoteproc driver currently supports one primary image and its
> optional DTB. OOBMSS additionally requires the secondary image and DTB
> to be loaded, authenticated, mapped, shut down, and released through
> their own PAS identifiers and carveouts.
> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index ca8e61254c449..0bce2f0d5b4aa 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> 
> [ ... ]
> 
>> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  	if (pas->lite_dtb_pas_id)
>>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>>  
>> -	if (pas->dtb_pas_id) {
>> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = request_firmware(&pas->secondary_dtb_firmware,
>> +				       pas->secondary_dtb_firmware_name, pas->dev);
>> +		if (ret) {
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = request_firmware(&pas->secondary_firmware,
>> +				       pas->secondary_firmware_name, pas->dev);
>>  		if (ret) {
>> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>> -				pas->dtb_firmware_name, ret);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>> +	}
>>  
>> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +	if (pas->dtb_pas_id) {
>> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
>> +				       pas->dev);
>>  		if (ret) {
>> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -			release_firmware(pas->dtb_firmware);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>>  	}
> 
> [Severity: Medium]
> When qcom_pas_load() completes successfully, it returns 0 without calling
> release_firmware() or qcom_pas_release_firmware(). Could this leak the
> firmware objects and their underlying buffers?
>

The auxiliary firmware is used later by qcom_pas_start().
I will release it after the final qcom_mdt_pas_load() and on error
paths.

> [ ... ]
> 
>> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>> -		qcom_pas_shutdown(pas->pas_id);
>>  		goto unmap_carveout;
>>  	}
>>  
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>>  	pas->firmware = NULL;
>> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	return 0;
> 
> [Severity: Medium]
> Similarly, in the success path of qcom_pas_start(), should there be a call
> to release the secondary_dtb_firmware, secondary_firmware, and dtb_firmware
> objects before returning 0?
>

Yes, I can release firmware before returning.
> [ ... ]
> 
>> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>>  	if (IS_ERR(pas->dtb_pas_ctx))
>>  		return PTR_ERR(pas->dtb_pas_ctx);
>>  
>> +	if (!pas->secondary_pas_id)
>> +		return 0;
> 
> [Severity: High]
> In qcom_pas_alloc_memory_region() (just before this diff hunk), there is an
> early return:
> 
> 	if (!pas->dtb_pas_id)
> 		return 0;
> 
> If a platform defines a secondary_pas_id but lacks a primary dtb_pas_id, will
> this early return prevent the allocation of the secondary contexts?
> 
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_mem_phys = res.start;
>> +	pas->secondary_mem_reloc = res.start;
>> +	pas->secondary_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
>> +					    pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +	if (IS_ERR(pas->secondary_pas_ctx))
>> +		return PTR_ERR(pas->secondary_pas_ctx);
> 
> [ ... ]
> 
>> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  	if (pas->dtb_pas_id)
>>  		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_pas_id)
>> +		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
> 
> [Severity: High]
> If qcom_pas_alloc_memory_region() returned early because dtb_pas_id was
> missing, could pas->secondary_pas_ctx be NULL here, leading to a NULL pointer
> dereference when setting use_tzmem?
>

I will add condition for allocation instead of returning, so that we
won't return early.


>> +	if (pas->secondary_dtb_pas_id)
>> +		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
> 

-- 
Best Regards,
Anvesh

