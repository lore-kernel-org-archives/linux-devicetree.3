Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D75477E4C
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036902; cv=none; b=kDvEngXoWB8jd3msNJ0UPIZtQ3vmnlzMFrlFUb88i0tnFedhD/ziUQLTq7+QF1n1nMqPMf8FN9Uat9+pNERdtmVwLACwuGT7OiFSoSPUKa+7Ns/JYUu1Wh8dGG+tPLLegqCKpl5V9gcqLJvYxqEA0fHH85z9yB5DE8DMUONj4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036902; c=relaxed/simple;
	bh=OhX5Vz80AZZ9G3vejO5AFLXV9ypVvInloDvuW1jn7D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdZclQahm9esh8zA3N+panYsR55MLG89kPsxkd8icyjzu8f9VgT7cG34RIeq9KGxQ6BHM6ORqy6qiaK6EHoxL27faUj43C5T2V/EFFAT7lA5D8qk8iB3jIEYOViR2IGPatMps1I/ILSLzlAoGDv3K3mzhs7U4AJqP64mB7RHh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFj56X4h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASnD6W2n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFj56X4h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASnD6W2n"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBO9P6378754
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=; b=EFj56X4hQW1+F/Pi
	duH12OYi6QMvFpyhpm8omAu1lCVOiEz2AYaPgmOOyBMaZqIZnuouGH81/sewTxWD
	DsVw0/YyPnT53HDaS3jy6DWz9TlvxDAiuCw1o0i5kzZfqeLg8Vk5WwNoQ32VhpOk
	mD2uggRKO4Ec5VNhMdPV4DQm++6nSlnqm9i31QQ4DQ0aLUOOKWS6cS60DvYxED9a
	/an6myas3qvkVdB9B8vHy6tPWF3j0a4DIvcUqQuf5ghdmykoidebJIk8tXYBMaFV
	mGqgDGExG+4dhQW2cKpY0XZqdv6jsPyQuxxS4MH5vLMjBhAPb1UWxmr3QMUJUAKr
	IKIWTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4ak1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:48:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so2386218a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784036898; x=1784641698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=;
        b=ASnD6W2ndMMU2bP6r6HkafpxqoKovJayZBmgg+9NLySyWF6AwQmAyor3m0L0UpiE5E
         tA/mVY1KDJErC+MJACJA3Ip/a7deDwy2ny8SWhxXstSxz+PytUmiEqbrLkGjgOdmHJja
         G28MoQ+Qq5J8B2vIodoo8rVbauOzpseb/XWLpo8tfoaKnz4yvnVTZXc3uwoJOF9bf5B+
         7ctFv0eWyPV8oP0tq7OdrnYnIlujSEcsUZmAq+qEZadiPhfg70IdfMn8DCrCJ2wlV6c6
         zJsJridTnu1XJZBe+j/RZ3V7zyDDLpk8O9wc0nrVittRthSW2y5zVwRqnvOJeleTfXUB
         97pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784036898; x=1784641698;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qryvjUpCDzgKV4fgQwaIiWJ1Taxd0ZMgBY1VIfSBwJg=;
        b=GGNbcOVL8jGWsqcadpW7HlroSF7zvBZfnNaYgNqF1a0PRbJ9tJtGoIdDTdD/BqkLyn
         LNAReVwl3+LvS8tk98wl2uDeEsxgsVXxQu0lfvLLXuTdarkUw/Yyn9liH1SvF4VVEs/1
         p13/ePpJATu6prK1Cc7fUAWbvYxDF7sp9y96g56G8wi+2teiCg3ocnXuOv2XslYBve3N
         Jm+RejAvy6grKSi79XwpUiGncrssDSc1bQ1xU0ltE4lOe7yUwHucA92MEhbgyo7mZKQh
         KGCIK8OJFsvPUZ2o0oZMVeWLgoCZmXWoRkWyOGSPVkQ0zuZyjlMTCaNzp1uYxvY94FG5
         fMjA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz2YyATmsXjgQlJtbJoJitj6CTIknVQBwHEzazsajzYLsLjysWzwlgQ9+ceWnSpfX+Eck3zIifwQwv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qTlSErEKxUt3XxBB1cGSAGT2ua85B6obtHm46mFLPLAXPapg
	kz468S147KVcjQ83vcbMDSPwTI8yfytHGemfkdP8iqOsxL1iQDhkw8Wq96rwoV5DgD++AldjQqS
	0Yn1Xgf9mmL+5Nwq+/WNirNg8IvkeK3G0fZQ6PRkWGk6yi9ndpCOx0DsomkisDIlI
X-Gm-Gg: AfdE7cmPXyNMsSOKKUD7v8vuZJgGmX+pceAUuKDgIMc+OARM4ysx3bOjJpRrKP0EHOk
	SPln3z5814ONKAwRxtco3y7NVRflpvgVq3RdtfRiZ7v4llGaQR4Whp5VcOQGoDWoJ4hJ1Z08LvX
	wTlhxCYvXQNYnhg4dxR6k5C18DHKr6TyKfDCgkiJvuESIFrmsl1WXDvdZTcoz0AMOMFgqgm+/CV
	x9+o4UZjAYtaaxLHeeRIK1Q+7JKlfHBLGPFkMcrTkY86WTY+Oj6YvGlZIJ8NY61M820sCSaFsvZ
	P+ri5AcY20DABvjO84i3F184jRKaHHN9JYFvv9N/gZTbsWDLHHt7fwjLSMwj8b3vmwFGhQ8ZnPH
	2aB05Tp8XVQIb5pm5XzBLfzgGqp7pRjYUsoEVECZ0ox0=
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr15138782637.36.1784036898258;
        Tue, 14 Jul 2026 06:48:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:7486:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3c110774862mr15138744637.36.1784036897705;
        Tue, 14 Jul 2026 06:48:17 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm37311325eec.23.2026.07.14.06.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:48:17 -0700 (PDT)
Message-ID: <d6ffd6e7-2513-462d-8474-9d24c0c3acfc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 19:18:13 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-5-72bb62cb2dfd@oss.qualcomm.com>
 <20260709134355.3FA4F1F00A3F@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709134355.3FA4F1F00A3F@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fJmRIkGiAHOAME-w-jgVN2zfe_Awgqri
X-Proofpoint-ORIG-GUID: fJmRIkGiAHOAME-w-jgVN2zfe_Awgqri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX041SK4vj0HUm
 MbxK64J/qpu+LsqtkRtkgmL42k/MJMZ9aDutLGtr7SuO8SWfneDRH5n9c4Nsa53Rm1eHE7ksDnF
 WYImzNLLplseyoHWOb5KTbdxO6neL2lNQaH3edX4U4WZ5A46rjfnEcBWVkoA6GvRAaB4oFmi87Q
 Xo+78z8n1q1IwiGqSm6lf13LHa52i/Eh+XsRfki+pA79JZeBUxlz11o1GNLhZvNoDftVI9PojiD
 OIhtwInJJGPE6nopaPfY+LlV2NBfWb9BIkP+6ghxqHV0C36sVHylHY7KuCSZDWkqvAbRRf9zvKB
 M33exZcMdeZF/FYWzSyPsx077snMCQOtHIgKH9yn6o8nSW3EXl0Uipuj5fqDMWdg/DMXW36z2fq
 ffsqzvr91bC0n7NIUCi5s24NRrhJuP/ISGK2If70CQn/2QNquV/KDG30HUbNes1eCrW05fy11Sj
 0zEBszG1kR4XYeUgoTQ==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a563e23 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mXdisibVqaxe05F4JQAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NCBTYWx0ZWRfX03nLKksMGXeh
 9JCpCwGwuRLaFAMGEzrJPAj0W9gMg35yF1NPA1Hl15co9mDrmBS5Ojlnllr4yb30SWTaszo1vuK
 BL3t/fMTah2Zl7f4lS2DCqcv8gv7Fxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140144


On 7/9/2026 7:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing DMA segment size configuration for newly introduced subnodes.
> --
> 
> --- Patch [5]: [RFC PATCH 05/11] media: iris: Skip DMA mask setting to core device when IOMMU is not mapped ---
> commit 767f9e3fe023f5e91b49d0a9ac0e6e7678556f9b
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> media: iris: Skip DMA mask setting to core device when IOMMU is not mapped
> 
> This commit conditionally skips setting the DMA mask on the core device
> if it does not have an IOMMU mapping. This addresses platforms where
> subnodes are used for IOMMU streams instead of the parent device.
> 
>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
>> index 0bce4fb1786bc..828e020fc79a7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -309,9 +309,11 @@ static int iris_probe(struct platform_device *pdev)
>>   
>>   	dma_mask = core->iris_platform_data->dma_mask;
>>   
>> -	ret = dma_set_mask_and_coherent(dev, dma_mask);
>> -	if (ret)
>> -		goto err_vdev_unreg_enc;
>> +	if (device_iommu_mapped(dev)) {
>> +		ret = dma_set_mask_and_coherent(dev, dma_mask);
>> +		if (ret)
>> +			goto err_vdev_unreg_enc;
>> +	}
>>   
>>   	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>>   	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
> 
> [Severity: Low]
> Since the DMA mask is conditionally skipped for the parent device when
> subnodes are in use, do we also need to set these max segment size and
> boundary limits on the subnode devices that are actually performing the
> DMA?
> 
> If an application imports a large dma-buf for video streaming, the subnode
> devices appear to inherit the default 64KB maximum segment size limit. When
> vb2_dma_contig() calls dma_map_sgtable() using the subnode device, the IOMMU
> driver might attempt to process segments larger than the unconfigured 64KB
> default.
> 
> Could this trigger a DMA API debug warning ("mapping sg segment longer
> than device claims to support") and introduce unnecessary CPU overhead
> as the IOMMU driver evaluates splitting the mapping?
> 
> Would it make sense to configure these DMA parameters for the subnodes
> in iris_create_cb_dev() as well?
> 

Ack.

Looks quite hypothetical to have a buffer with 64 bitmask, but good to 
have the dma mask configuration for subnodes too.
