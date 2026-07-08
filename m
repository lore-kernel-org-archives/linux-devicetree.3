Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CA386576
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504896; cv=none; b=n5xNvLQbkT9uVO46LEiHRZtDg1whnnBvUAV6CP01DOlrxLMX8FFtP4BiPCCaNv31gX0rE0qo6SIjGtezRSQV4aQKav+Zzl6d+d/pUet75o+BaXC7A4lpcffsNo85ew8DwRS2GLYhw+Vj/PpYkiwv9DdH4l0/KgyAaJEFjJ54dBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504896; c=relaxed/simple;
	bh=oKVfH/0Hygcklu+R5xYMT12z1eblv56XDMwOFHZZNzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og2Jr72dxx7ikhHyracgl/IrPrJZ0kM5SDc13vpabU2YgB0YN4hZUSSGdPqNy/hOI0tIGd8Od/BW2SxUnyxZCaiBr/dPcmSemW62nFv2PZyyljEhUbegfIc66UGpkzotrKguTX14U6aK9wu+IYoi5Foia/WFI0q7wSaFwaTsh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oltHG4ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSCCQCEB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oltHG4ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSCCQCEB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889EUt2231152
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 10:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=; b=oltHG4ZG0U80gfpJ
	tYRua4KBzGf901wPuYRVh2i5a1FPhwH/fr5a0zAjX3VDEublxoHPSvbZVaHRjjT5
	CVNGhLqADIgdvEh+ShfpeXP7RXFgIQ32QbejmmRBpxzEg243jUP69Vl3QIpt/3ue
	wOlVnwQMI5cMt5cnRPvam1Gpq/+FxAldRghc0cFUCAhGcdwDssjsTTQtE/2Cv2ZD
	IWjMXV6OPjWh7LeTjXNlTovAKeiijLRzgWQqQQt4W9x5DEJhXHA5z98Sm5mYdGVJ
	a1ACK+xTymCfENv1pL85ypKsPEXw7JDCXTDpWaCUDQ4ZEwRMav11ZN4OetgL0ZVW
	+LRCmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5uvx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 10:01:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845e6a11332so893035b3a.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504893; x=1784109693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=iSCCQCEBF2iep+w3thlr7rHKWYt30xzMplEk9qjon3uBwp6Ggx7LN9IShcbHOqg5Fi
         A1AvhZENbeL9oaKGsHRbL9sQDTxP9leUs6tz4dwrmUOYnEG8bTSP13+aLLHM0EyTDENQ
         wkpdvUmIa+RW3SoHIBpzwf0MBnePNzOqL8Vxic5bsSPIdFfVtO/5+Czcjd9hnUosSVkw
         ys25jiBE3DxfZGQYr9RnNQGcAPi9AbGoOTwQEQ6SYuA7bRKbuWv/EaokTg/zIsnD0AZ8
         l5v24dJ+ah1q00WOOOwjTIO0DZXX2IeR+tptJ8PyVO5UgufJpWbv8PFxCU1dGFkXhhRt
         eSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504893; x=1784109693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ9AX7OhkLOaP+j4lLrbeTNcxF7e4kwK6kGQsbCEXA8=;
        b=rM7GRWqSygy9TSV60mMKxVU1i81iNPOwOb1aVV1YvEhF6rXtVGWRrOFtcwuSDILMxD
         YT7c9UxalhoZBkCXDjJZL+InW5B7L20vKWOkt/HrSpduwc/gvYawtxGLcFfsj+I+yrLX
         kiozfnghN6NXPuPn5Vbk2Lo6R/+1bg9w7QFkQ1kkYWJiNKeCp7PAyA3dxeUF70f0AbAm
         FtZ1abbAPICssRz0m6LYdmaH3NzDF5By/hVykRw2ThlZpacv2Lep8/Ia50qUn8CeQQvT
         d0gVPFGbc/VuURtmKAIMnugrFC1p/V+4kikEwaWI/uTnFgXBhj8QDr1yccsPQoQ4zgaO
         UCUg==
X-Forwarded-Encrypted: i=1; AHgh+RoIpoXlMg0ioxPQDUHzE0vBHlL0JJZQpxCr4WijmuWFV/RcJwAgL0FT0XCSaOi6Pe4A4JiGqiJWSoTy@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBQSLhGQCLnQecu5Q6cvShKxspA8m8yXUnMlIQW9FNj2kHaFT
	uwWE6X8cMuGZwKrvc6Ta6QyMpL3epWwGbUYg0gBu19lLgfsVI2awiwJkHO60L/mVXpW7vYXebk2
	/E7uygy4TdwSPSrkydnsCamrRD0XfkbOICuBUf9QBzSRosZ6pX+FNpsaXZqM0Co3R
X-Gm-Gg: AfdE7clMeWDlztpIs4r2q0VzV8gFlF3Ag4POdbB+w19Gv1O9qR0RmbWqNqQpVYvk6Yn
	KgXw4KGTg35XC6LQHNSIwBW427uVO4vsFNAUgTP8HbLOXud0Lff54g2/H3Rte9p/xay74wePAyk
	68KnTj0I8fIWvR1h9F3Suu7tg5W2pOCXa4Rx73+h8f/5DTbphJWs8CLJdHyOSPKYcg+uigqT23N
	U9jEdSO+xxxQ8mrpvChdylfRJWDzrentfsrF677AJN+xlhcRc+KRGPTR0EZKCrWNpFwYsyGk+ov
	JcIl2449WvEtOn7LE0CM3i2VzhgfI36tQw4sQuxY1hnEb3WgiF1gKQLgd3mr7uhgJTDWR65TSOg
	rILGn5n3dzd5KDsa+bLuBM7A02nPB2Xzth8Z2/sw=
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865562b3a.22.1783504892625;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e24:b0:82f:3a1e:5618 with SMTP id d2e1a72fcca58-84842ee9c8emr1865535b3a.22.1783504892128;
        Wed, 08 Jul 2026 03:01:32 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm6916358b3a.28.2026.07.08.03.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:01:31 -0700 (PDT)
Message-ID: <4e5a3d82-b946-4490-885a-ea7061939c32@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:31:07 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
 <h6opbtr2ced3sannj3ym573qc2sjk7ek3clpto5j5mtqfrfk6w@34sk2zraoqtj>
 <807f145d-88d3-460a-9862-b63fe2a52cf7@oss.qualcomm.com>
 <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <a4f5sod3aflubxkk4mm4k5ozddydqcnqeac4s6vnozkd2nvxbi@hmh6zclsw5z3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0V77a3ikVwRySZPKuqDexCqqQ30j9EiT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfXyolePwIMs7ET
 +b3W/CbwmgZbXj+nJ1SY1u7XK7AJzDuQEUshsU8YrkuTHTZaXPU6jjiCI2xpiiDbrw8pm2/Rhjz
 H96QalkZnRe0KXElJ5M1B/N5Jdsd3+c=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e1ffd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Gb3r-SE-3tiIfwJ9XNYA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 0V77a3ikVwRySZPKuqDexCqqQ30j9EiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NiBTYWx0ZWRfX0+2PTZHTHIEt
 mcPT29MvQ31WYimQ6aysMXm/JN4mSyurQoDosbmEUEJYltUArD0stmBN0DcqDpMcUaaV+9MOqpR
 KifZEsjPlKW9fRyi1+pLj+CYAaFIQuPGe08wUNVsKNJtaj44BAXKD+tVgNZbHLRYfQcFC1ReGUD
 WsS+ixcBmduy7ETv5GQQhwUzpumydJtM6shcWlkWLQoa/p8/oOLmvOs70IrFwrzc+3iZvU8IOXc
 5oQDSGbVhh+kBmKhHv5CY+qZQkr7PWjcR4kCUUXQk4QjHHOdhxN6H4MG9grELxeNF9+89/qmxpK
 M8N3VKuyvcjKzgdt258rSyNNe4mxY+dFFRu72B37Sdpxwz9Gjmw11ynqu4RichOesGn32lDBy+Y
 BMg3TG5bCYrK8iBIE+LYJafDkzD/1qTSZZtlU9TzuuBPd5qY4Tw17DE0Xpo1nGKCQ34wTEtGtwA
 4Kw1iz0lOb77l/KNyXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080096



On 7/7/2026 10:14 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 06:37:24PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/6/2026 11:12 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 10:26:36PM +0530, Bibek Kumar Patro wrote:
>>>> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
>>>> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
>>>> are accessible. Without this vote, the SMMU may become unreachable,
>>>> leading to intermittent probe failures and runtime issues.
>>>>
>>>> Add the required interconnect to ensure reliable register access.
>>>>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> index 90e50c245c0c..721526f023dd 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>>> @@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
>>>>    			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>    			dma-coherent;
>>>> +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
>>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>>
>>> Why is it ALWAYS? Would it be better to declare it as ACTIVE_ONLY and
>>
>> Added QCOM_ICC_TAG_ALWAYS, to hold the vote in SLEEP bucket as well
>> preventing gem_noc going to sleep when icc_set_bw is being called.
> 
> _why_?
> 

Now when i think of where we implemented the hooks, ALWAYS is not 
needed. We should keep it ACTIVE_ONLY since we are already voting it
back in resume pah. I'll fix it in next revision.

>>
>>> then drop the extra suspend/resume play?
>>
>> Not sure if I understood it correctly.
>> Did you mean the extra suspend/resume play in arm_smmu_runtime_suspend
>> or in arm_smmu_device_shutdown() path?
> 
> runtime_suspend/resume. I might be incorrect here, but I think it is
> exactly what you need.
> 

Yes, I think we should go with the ACTIVE_ONLY flag and we would need
this voting in suspend resume path (For the same reason mentioned in 
commit description and cover letter of the series).

ALWAYS would avoid the need for this handling, it would keep the vote 
active unnecessarily, but still that would have been nondeterministic.

Thanks & regards,
Bibek

>>
>> Thanks & regards,
>> Bibek
>>
>>>
>>>>    		};
>>>>    		gfx_0_tbu: tbu@3dd9000 {
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

