Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7584F44CAE0
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034149; cv=none; b=Cuxh8HdUT8acNXBQgr93/MjJ0q7wwg9ot4OwJLzyjH8CtS9H9j6OpR6QCgX5HXEm6QWUtONPJz0VXnlcc5MQ5rvFhidKi//HDxuQxGN1fq/K+Ajm4T0VA2szC8bhMJTTliRa85+z7PBtLCgA8FPuVYBJ2mDOCqCdWHn0aFVbr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034149; c=relaxed/simple;
	bh=GDta4Uhk2X4fc6/jmA/F5JrC1KIEFErRwtrKoNQ1ZJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TieWcJJUYHaIzl7p5yuc9cR/3lwtGxKluIe4EW0p9p07CCH0xa48Rd+aJGqR69uOcYc0yWuc+CoqnQajslJ8w6SdqjIUM+ZQn54Cqwjr+2UGXUqXvTJSyMCDyj6vm83NvbRi/me4hgmq4O1pscuF2cBY7RilRVNW2ugcKkkCKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXyqGxk9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaTWIsMI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXyqGxk9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaTWIsMI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBNieE494318
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=; b=dXyqGxk9fl9b36UD
	MFbKZWKSTcslrnUdUiPRtJjDBOgvYaEsIEVF52NDz+sZI4GzAu9nOAwcrNUqP+Ev
	YkfYT5mdAd5LMEFTXnjPpED3eXIRLQxq9M2FsNaFueWglq6Eg5tF16ZE99B7jGbY
	q/xt8G5ahm3EoVHKWpL5PNcHH1GYas2rNODZM00/ldXUkHc61ITCgaRmkfUSjTxk
	trEODuSLvjaIueKmWVI8j8msWm6rRRdphMnRYkdjJ/fOUPawBH8xhM3caK6lEwTG
	Xr8a9rSqCQOsTsdv7w8MLZbBQTT1YTJKY66gQIb/hr0IslE7xttXttSovkwWjyeb
	glU40w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44cutgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 13:02:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c892143db7fso908339a12.1
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 06:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034147; x=1784638947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=;
        b=SaTWIsMI3eZWsL/j6mt5GlDXrTGGvyEcONBXLWa5g5j9rT+hPRohQK+1JqWzIAVsBC
         Hw/fnLd3yNreqc7NSTpHczqmSwIOdyiWPzDH3bCsBCN/OlJZpZrY9Na8BP1/kQLt0Noa
         WUYQqOn4JWuZgX0Q54q03VYxfaqciJ3qI+pEMENJGWwXU4+g6HtfE1Oddk6w9pmABCAd
         MvXgverXLxUc1el8R5sKQ1Iju77CMccfggI4dk8J+sIcEsT5PgFccl5Hhq0jsgEGhDbe
         29D2RvJwgOzxOK5fPn4AHpNLo6WkWGncAVq48zTDLJd02wmlDzCisIgSuiobDIk6Jg9a
         TJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034147; x=1784638947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=drji5NTNqWKsB2q0aH+BaAkELHZdH35cex72tz1Jscw=;
        b=iVLUVvWQRRMAg072DTBjWUzEkGIVhDntex33/XhlgFY/j3TPYlh2vTDxFXLureHdRW
         U4Q+N4i7S2wbPOxfyxkHDhyrVWinX/GZY/+SWETDR5NNQFjDbI8T7HvEqfnNY+JOzKwW
         0PuHcJLpoJ1iQ51lCsZGDenG2lSCv0uuxFC0FbBnNytgsY1q44YR0Ukyi6v4Z7J+3BV0
         cpfBw2f2eB9iPR1/FYo7CcFVSjfI5tlkTERwXCuzI0dAs5JPmoCx2i+gQ44X5QbM+0+n
         dunx0i1wwiZdFCXz3EzOZTboLk32jzUUIg87zBm1y+ehXXI4gJpfAlC4ckByw7txVdy0
         lY6A==
X-Forwarded-Encrypted: i=1; AHgh+RpnjnS3lz+tQb5IBhFSrRqNrOZw5k/B0gR/jaLCMXrfqiLcGVNchptkUmbxIrzCmX2vEzyyzAQ0uAIb@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTmaQ73sgEo51mZGwNNbAUwB1F0E40uz2q1OUWyXNTzgF9W0n
	E7+tHahSdyzRmInKXBI3fMeqUwF0Y2eUbYjakJZ2WfWBRMVGjoWEciapxgtyxvVktZQ30+6y+k4
	YDgsyN9JogVXd7ZSFQ6nT9Ug4pYiGSe4KYXHjX3YozAIDVFKqkJwQNjelQMqSXXnG
X-Gm-Gg: AfdE7cmr40HXGuIHKvCnHKEfxYQNEb2Hr2GcJzEDhyKbRrPI7xMfNQzNMz5hQuDL6C9
	JKn8oRAQOR6qZ9Kz8rkUNHSmdZsQI+EqHYGpjca/+1EZiCepl36ZugPuH6DZrSq2hwIReiRS8ZU
	KiB+kF50hLzC7svblQuQdfCrQ67L0Ds2MXkDrOfk5wDGSI76l2F1TBsqbo5nNpWVCGRpOksWXh+
	VB+/rEOaXUrX+QfKel/rFDFLWiaLCYUTbDwoJAD09Pqd674/iHnnoLyO9MWicuI4RC+wItP0OAB
	OBLLAmBAeL5NOhbSXoiDibFHatCJdkuFVKANAzy3QKeicbu8ud/UqFOWNwF9WCMNGQ1wT11Wd6s
	4/+tjDgoOBRU=
X-Received: by 2002:a05:6a21:3116:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c110ad50a7mr13918542637.53.1784034146520;
        Tue, 14 Jul 2026 06:02:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:3116:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c110ad50a7mr13918455637.53.1784034145754;
        Tue, 14 Jul 2026 06:02:25 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm143649475c88.14.2026.07.14.06.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:02:24 -0700 (PDT)
Message-ID: <f19076bf-5392-4267-bc6f-9698c045f9dd@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:32:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <20260709141034.15E201F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709141034.15E201F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QoXyxBshHKEHzft4FN3uwFSqPhoAcagw
X-Proofpoint-ORIG-GUID: QoXyxBshHKEHzft4FN3uwFSqPhoAcagw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX1E6NR3/ZzBGU
 ezst7iRU/8BMKIFV3PJs8S+IcqLTolHsononFTbEEOgu01VcDgPzbqC0PU9IX3ISy3A1Hpfl3V/
 RPx8kLC3zXXZj/Lg0vUsT3DzvEyu2NI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX5i7+1xoXVUdj
 t4A7F8+bxMrfi5cICv0dL8aPY8w6XcR3qlt31NiIk/yMOcUFNg/onSO8nAIF/2SzK22FzpviHyw
 5y+yJFo2+Prtf2nvMZWA/VDKyZZL9Zz2HRdkxcu1oWHrHVfwt6LRFSPmdyYcaZHJX3R9Y/tUmvi
 5YmGULSRhTUvctOZZHQhdPXKceZ0QMJ4hEpCaRQTZ2yn2tLtCseL3+07oINENl66KpNoBgFXxTf
 NOEXtJJSliG299uz5xihpHFO1V1j1IksuiCz7mCF9ZLeXl8R3t8rEqoFffOi/K6yudZq6vx5xV6
 stLvqiheSVQtlkgwdlxDsLn2B0KQAjGGwHxX1gfy+AMagopmxVP8ssQo/MB7aDCcX+7Fl7K/i7g
 H25R1QphLcKhjYuZx4BCZ1fXF7VWmAW5UbFJlaGm2uv0RS3XDorkyWrFCOMy237h6JAk11aH4+b
 JjTTRAFouiN1Or7h3bg==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a563363 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9hASng3_XfuON5wlUrIA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140135



On 7/9/2026 7:40 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The `iommu-addresses` property is incorrectly used to limit the non-pixel stream's IOVA space. Instead of restricting allocations to the 0-600 MB range, it marks the range as an IOMMU reservation (`IOMMU_RESV_RESERVED`), which forces the allocator to skip it and allocate IOVAs above 600 MB, directly violating hardware constraints.
> --
> 
> --- Patch [7]: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes ---
> commit 96b940efc5fae7db37d762be78144fc901472a7b
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: hamoa: Move Iris IOMMUs to sub nodes
> 
> This commit splits the Iris VPU into non-pixel and pixel sub-nodes to
> describe separate IOVA constraints. It uses a reserved memory region with
> iommu-addresses to attempt limiting the non-pixel stream to the 0-600 MB
> range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
>>   			hwlocks = <&tcsr_mutex 3>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does this iommu-addresses property actually restrict allocations to the
> 0-600 MB range, or does it do the exact opposite?
> 
> Because this reservation node lacks a physical reg property,
> of_iommu_get_resv_regions() parses it as an IOMMU_RESV_RESERVED region.
> When iova_reserve_iommu_regions() processes this, it permanently blocks
> the 0-600 MB range from the device's IOVA allocator.
> 
> Could this force the allocator to fall back to IOVAs above 600 MB (or
> fail entirely), directly violating the hardware constraint and leading to
> the device crashes mentioned in the commit message?

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

> 
>>   	};
>>   
> [ ... ]
>> @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			 */
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x1940 0x0>;
>> +				memory-region = <&iris_resv>;
>> +			};
>> +
>> +			iris_pixel: pixel {
>> +				iommus = <&apps_smmu 0x1947 0x0>;
>> +			};
>> +
> 

