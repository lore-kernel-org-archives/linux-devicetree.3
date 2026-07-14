Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6122C37A856
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027222; cv=none; b=EqmeSkIfYLsaSJnQThtMXnGDrFB1figDyS/Ua9ruqMx5Bh8zQkfWPK62uL1Uc4ZACa3yHC2mLxXS/xxtKnxJ2w1Yn3THmgCfGOSDO70SufHaz6p/vZ5oz2RMHQ+7xEEuRzgssTYdM0uUqJb4q4c+mJ0uH8Is5rEfXx6G6DApZ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027222; c=relaxed/simple;
	bh=/oCGcbO92CXJxfjee+oJlAh76ENlf90mIXAMCYrOx/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qs+aNGhfgV/VwiAD3cIUlg1PX+q6eB87Tgu0vJW3WSfIEzsDQi7Ij2hTUzY3AY4ehQFma7HW3o/4TrQ65V4mW2/VYbCCg9m8o96w0NKZ6mMkP7t3UzE0iP3s+yVNOictwQwoodMLIgZNzVGJHbNDTIxMq7ExALSZ1bf/A34wop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fukgx8a0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=To/GRpws; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fukgx8a0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="To/GRpws"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SQMO3912687
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=; b=Fukgx8a0y5FjnFXM
	8Xg0LeLvtLFi4iWNBJ7b6VjO8N7BA9t5v3HCo7yf355UbMZ/Zvm0T6vowuZSP1Nj
	O5KSjOu0YeThYW1P2TU2U1dLYphOpS6mCf1BNO1RGDbFsV4HE/3XXz4sp+vz8kaj
	FMDHF9FG0lvADK2zNcbUwrtrBgkAka0SdnGq7plB9/ksxJB6hjdveosQp+5kcd+n
	AwLP6Z2UJ/9Tg6CM5yVd9sHD9YQgyRSIeq5qpaXrVk5QugkDZ/xQ8eOcMr/lKL9y
	psqeIQw2W+2MABT/9tDibUJ1IIPxXudOwFSBzI9Vlp8ZcGIMSuceSF7omOqbjxw5
	e6XPdA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4habp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 11:07:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso2077476a12.2
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027220; x=1784632020; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=;
        b=To/GRpwsxOo4agH3aKMji6DNxeKGajH8FI2rVfJwz5MSIfJlKZLY3P30Yq+h5prnVa
         S0CIWnPR1fZ1by4fTvKQZK2wqGw95JtjBy+lpx3nCd9GunydY1i1mfqMvJzyvAqog4gX
         DdPBLYdk+u3SGlFjKJ7FTQJvkG3CaYLwasP0u8bB2hN5YkYC/vGXN1Eido4P3BbyquEQ
         KdtHBnlKH9e5YfnpbagSO0msmJvFMG8FUFhPj2HqcCLLV+rmqxcE3sGa5Jn79vEU4gcM
         CTfJa2PX0xCYYHeZ36VOoDIZaE6gbtsoYaciyeBdYFrxTniuCLiz9meKT69GZsX8uUDs
         yxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027220; x=1784632020;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w40NiGxj6RTgqfp65+txKyvRxDgIluHYs0R3BmaIUuU=;
        b=dY3qXyxFkiW99sCCJXIh3eu17tTGV04sXM776NLk6OgJtBwbVn5OXl3XSNn+um+9uy
         x2F6qB/Ik4uC0uAvmH8Esz+kC3IvSRtypBNtvDIHcurdTvdtO9YJRPlojND4F5SX4I8y
         FMKRmlrj6R2sPtGJjqH7cGsOJVTaG8Uns0EFSoPSv3RHUlv3D7z2vzaDOVh6+4nABP3f
         gnOZRQDgTO53eaaCli2u5rRsMYo+24/pnkj1XPaQ8ExHmXV4jjUN7n4N3HYXCkFsb/GN
         wrxAtgKqBi3D0In+vB0DNmfIHyKlPkxYL/qfnoXaxh3qUElSLo5242d1TUkWuBpBsP+6
         3GUg==
X-Forwarded-Encrypted: i=1; AHgh+RpqmIPdAkB5U/amyzK8UieXHD8nQet902cesWzp2NaDSuETXZY5GLJbOiyjQV3IiLh5WO1Rtfa+p41z@vger.kernel.org
X-Gm-Message-State: AOJu0YwbSQPPd7mwQc1pAKelu28MiKddgncFlFOnNrLaOUoDQ8I8izjw
	wlr95eMKjYHMlgDmJ1F1alyR0I+J/Z7X+M554VX+vDkoHJI0VjDkQkm2I0hnKCfZGLYeyVvGyNF
	bMNl0YRKwpn0wUwWSSmeQbUJo/dP1+iT2scHKtjKMK/5RcuqeyjwGIfyvGG02yrvo
X-Gm-Gg: AfdE7cmOGD6+W9XSYkaLZQaBONGxyebxgHeqpI7QN4iaFpc+D1cGQZk2KlBRrItmMEL
	076IV9BHZxnqjkIjCPMnAgJc7NOwM76YyreeapaBBllo3qMz9Ehqu2Jh4yxD/nsWypdlK8O0upL
	aLqFk9veKfQ2aHBkC2yr41i+iCt0ZFO9NDOvVBNUHPNH/Qwyb2a604clVK8kVjw/Rw9YoP6clAI
	2N42Y/60lO/+AvwmKLndGZWebhQcdtoqtlk9PQbAjZ1epW1XoVSCjdp1nsvsJM/Ttm1YkHIghPG
	hfXUuVe2ED5bllfLIl2OBEqsn8On+1hsaYsySbI39Y3X/MfwOW1mBvoZFWGerc23YaxPhlzZTff
	flnXZ7m4ZOFNoWQZLrvL4NoGnG03kFtjd2YnaKFBb9bvj
X-Received: by 2002:a05:6a20:7346:b0:3b9:545d:c006 with SMTP id adf61e73a8af0-3c110009a30mr15146526637.15.1784027219837;
        Tue, 14 Jul 2026 04:06:59 -0700 (PDT)
X-Received: by 2002:a05:6a20:7346:b0:3b9:545d:c006 with SMTP id adf61e73a8af0-3c110009a30mr15146485637.15.1784027219359;
        Tue, 14 Jul 2026 04:06:59 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86158936eec.19.2026.07.14.04.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:06:58 -0700 (PDT)
Message-ID: <b4812174-4316-4ee6-9342-ad85ff9a2a32@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:36:54 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-11-72bb62cb2dfd@oss.qualcomm.com>
 <20260709152938.B4CCA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709152938.B4CCA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hzf7x3zKdNtzKHOq5QzaGjGQfsd2xAaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX87CkdRAfRiSM
 wYK1CriT3331Fzbyu3djXKZ3q8xAyjeOOUuu9UjRhpJ5YsHgejBqfpaACVl/msqNLyJ3SGwXz39
 8kI0LN5geEqHZ/5fgcy9SzJUfhw1PA+aUkGgrAg69p4Tec7kCrV97siSvnovHY073ih94RE4rij
 NEQCqFn+Zb7ZegwC8JS6JvrUGenaaZWcwkqHnf82vE4QQVaif5qBoAeo2gy+WIizlLZ2kvyNEm9
 98M+zpolXMt6/oZqs2Unmt3OegYdXmdJJXK+P5/8yJdS3DKKm3JyTPqf0MN+mfrKeW8+51+dYA6
 P9gPY9AF4O/HOq5plwY4Ev464axN3La28Rhm3OaaanW2typrWqiqL+v6yBtZg6wYrGb4k+9vjcl
 xwVpXBGfrT90wG0RNL9nx4exf9zRyQ+P7sEfu4XxTXN4AcOxi8FkGydPxmhU4m+RLW5CLwKh5j5
 ebzdihJ3amvrDa5QlBw==
X-Proofpoint-GUID: Hzf7x3zKdNtzKHOq5QzaGjGQfsd2xAaW
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a561854 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=29mSHvePwSPkv5shI3oA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfXzZ3k7z2m75ZB
 X0SiyAep4B8DcZnWf0yiH60UMh38JXFrH/5EtAs7bgqYn+gjT3lCkt5ZYIok8f0IrdAbMNIlJXX
 sAeaOoVVeIe6r5JE4E5Cz0I+Kh7plBs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115



On 7/9/2026 8:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using `iommu-addresses` without a `reg` property inside the `reserved-memory` node creates an `IOMMU_RESV_RESERVED` region. This explicitly excludes the 0-600MB IOVA range from being allocated, which completely contradicts the patch's stated intention to limit allocations to this range.
> --
> 
> --- Patch [11]: [RFC PATCH 11/11] arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes ---
> commit c2708742df23b3eb0cc33ed47303581c81143971
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: sm8650: Move Iris IOMMUs to child nodes
> 
> This patch separates the Iris VPU streams into pixel and non-pixel child
> nodes to enforce different IOVA constraints. It attempts to limit the
> non-pixel stream to the 0-600 MB IOVA range by adding a reserved IOVA
> range node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 447b788fcbb96..f9c03de1317f1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -1849,6 +1849,10 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
>>   			reg = <0 0xff800000 0 0x600000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does using iommu-addresses without a reg property in this reserved-memory
> node actually block the 0-600MB range instead of allowing allocations
> within it?
> 
> When the non-pixel device is initialized, iommu_dma_init_domain() calls
> of_iommu_get_resv_regions(). Because iris_resv lacks a reg property,
> this function returns an IOMMU_RESV_RESERVED region for 0-600MB. The
> generic IOMMU layer then calls reserve_iova(), inserting this range into
> the rbtree as occupied.
> 
> If the 0-600MB range is reserved as blocked, will dma_alloc_attrs() for
> the non-pixel stream skip this region entirely and return IOVAs strictly
> above 600MB?

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

> 
> This appears to contradict the stated intention of limiting allocations
> to the 0-600MB range, which could guarantee the very device crash the
> patch aims to fix.
> 
> [ ... ]
> 
>> @@ -5231,6 +5235,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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
>>   			iris_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
> 

