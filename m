Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACED423ED60
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439433; cv=none; b=n00HqQ/JLXzGuTTTWS4WhoXzjuekWCWEYem40viLHlh/zp3MzpOuaEEpxR1UFdmD+O0lOFhUuOF0voYfV6vQbPr8Vi5jwiOJfs2jhyyErhefJWPiqcrCvKtZkitKJUr/qkYtYZRuKUH58qfEcXxTTajcQMar/hd0hnuj1NgEAsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439433; c=relaxed/simple;
	bh=RVsfiJ/p1QOSvJO42EhNCyE++k3dWTEWvNXh7/stvMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EeYLerqCoVNT2s0ykoF65kO4jrVo1Ofd9VgwTtz1kD5NkGOJF60jeIaDTDp2NbdkEBfPjcXl3xBGVyx7EUrR0dwjRmHN67icDsn3NWAAZEjISz06cNonou2nMH55r/BjhRMARbAvrnhZY9B7G+NY4pwCaqiauRkttXtEdxw+xG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XymeawGh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSL3CRgf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XymeawGh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSL3CRgf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PNvRCQ3892198
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=; b=XymeawGhpcsDSqSg
	l/SiQg5HzhqXg+aGThmSRpAqJ38b3ZwY5lSRI/Fi/D9F9VakXrzsmiZzdkiUaNS9
	LvTNgHOxwdYRvZuUnii/m4sV/F8n7I88g2nEZjIfbyWQTJSFpKet28i5lcehlBJ2
	yODzKN4Mx/2UfbdNBcRgqhs9g/pFD5ygR1SdQ+caOmB2IT5R5NDSm+KA27eylngB
	Ux9kBQ9Pi4ke11Hut1RUGC2MiJz6Itll5q5lbLEFLT0qzd9HWyUTt+tWMQwjG3uG
	xLEWQVdk3Ald1BeC0Q1EhEF4HSUUC9NYRzD6mR3C9M8SYndHmxSdrc4IRBmc7Iq+
	CTp6UA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eew8dw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 02:03:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso282496a12.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782439430; x=1783044230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=RSL3CRgfNzqNhgn1opLvLvPPZTpQcPNcWxss6UQcBoE3XJrY6yb5aMUTHfrizmVwKo
         +p9SJU0fHDYD2y6yQbCwAC1t9GvDnrjnZz3oJiCD0H29M77DlFMFrm4zpANo5YKAUJ1N
         E5QvkbdaEjlOxxOtoBSE5Sf+KBKdoKwDkA9J5efyYh2GtSlc5fGoDoj6WyRwj5hIVVNA
         Csuiaa8A4fEuVWt9qEbP0QYYrV3SuxkYZPCr/I6BN9dzWe7n4moSZG4SmnNxiES/8zsq
         3wbu5nMaywILNOSyrme5O6LhEZLRHL5Io+3yfGG6Rw1sHdCVYnvF3x3rH91V+QnbOzEg
         LLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782439430; x=1783044230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI2OuhHoYS1TEYwzBIeud1+ZcMcRB/y8x6pd7S0Vn/c=;
        b=p1MVQSy+syRVp9/bBqrm8wbEbyudG+HqO4gannxxjxgcaCcpDHh6KPQjQAUn3h7NKc
         PYLqMRN3Zan0Vqtb2f92siTSN1F8pHyHnbikBSWljzzfvEWk7TXIDSwrBieN6XSKCzw1
         Bj2YDsOt51qGapiUo0taP1xFczXeHZ8CKI5uH/X/OEET8ZQvwk6e24oDbpZgb3u5MYhh
         +E8Q0Esh+z49TqYUfSGJJ92eaGFRsE7+g+LE73rWNYRFeokim5WgzWz9MqIcgE6y8TV3
         I2lmPAXQ88fRf8dBlQ/il1N3tUDDNlctER5TdaxsMYEIiNyLms/yL4gO7j/8T+Iri22a
         sHUw==
X-Forwarded-Encrypted: i=1; AFNElJ9Z9Lz99JWhGmZ1fc7JkomS3ieMFkf+E/M/Fzl3ClYym1Wy4t/V4L/fKE7d9qzVS3qMn0WAeqTuM443@vger.kernel.org
X-Gm-Message-State: AOJu0YwnazZjS5g1xSqB+9nrrQkKw6Dc1u6TCBsqyyP0wfTDdMW99RdC
	oqZh6qFzUdrtSdGkylfi4YFCHQy60cxeqJ5pig7O7n6ZyOLRDRctILm6Ew35hsv51X6dRHrApFF
	hDGSCbOGDrtxz8Ofk5WaZYEjLP6ODTeOj0CgXRqqmMvvRvX5Rj1qqgL2MQFjqR2Xd
X-Gm-Gg: AfdE7cki01T1A5CYYh3flcleAIwJnFDhI7rdccspp1JeIlJRQP2vP6SG2b76eaH0I2H
	iNM7EZAirYPHB5YOciFjfC23Ufuqey/N5PoaISCeW+P0Cr5F5z4nfKJeaCCBior3nd1oPz+69FW
	avZRkjilIpudFQwzTLTsbm6GXjEIk1C+oK8ySOq76HzKflajmRufK8+rFXgIU7JGodgPHIgt35f
	2uhW1/75lXGSGejkkgAnOFsv2qkJ0m0eDOBuWamVzUNRu3oLVdodD553qi6hel1mtSgDOhzKOsy
	sEixIWOArvu2C+6Nz2fUIZq41qFA2J0lhW37meXXBl30NmVWxy+KFOZlOsYUrn0rxczCmjhGrsy
	dSSFdykheeTgVMciP+OwXDjoFl2T+BFk=
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588788637.25.1782439430523;
        Thu, 25 Jun 2026 19:03:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:3994:b0:3b4:8818:fd34 with SMTP id adf61e73a8af0-3bd4ae0fae1mr5588728637.25.1782439429938;
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bd55985asm2535896a12.31.2026.06.25.19.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 19:03:49 -0700 (PDT)
Message-ID: <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 10:03:41 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625085643.GD575984@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfX9NFQZClqvFlA
 Xn7xwfco//aserN+rxxCIgONXtqiHpNAyb0JVEk+ntSuQGEk6Pxw4DKEJ6oIjSZZOPjxfCpxOrK
 ZQQ9ID83HoWe5wxEdWctAJ3v4cWtOR8=
X-Proofpoint-GUID: vyTJu2dvADwgN9Xsm9mpLpU_HDk8AnhH
X-Proofpoint-ORIG-GUID: vyTJu2dvADwgN9Xsm9mpLpU_HDk8AnhH
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3dde07 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bmbh54CRVxo00WvuETkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDAxNCBTYWx0ZWRfX1QTgRBOkZeav
 Eom2xsKZOtjCK1mg6i+IWlNT1zWB7cUM/59WdefIT5/vkHvXDjh/fKvHgNqs5cONyrs9VH6+JHs
 ALi+cN8YoM41/4HObgcq8Z5Iuh7QYcvmtDmbpRMoQxpQf95AQyfpNXAqB4xT5HHoOqnGgWYw2Sy
 U7K3OUTWrABDEuqvkkcVdUI4h+M1QiP5e3au+MZQH/EZEO3KjISF/a56AidBuriaQPQOiwVORLQ
 E6bVEocSO0iQWp/8DyMjYYj9Z22xSNuj5NdJ1OwcNDVvvz+E4N70oGB6BUc8BLpKghlISRCG27E
 1rfSyAo/5Kegz9hXmUFgjB0t1SCQ62R9OZ9Qt/n/97exRL49pnTABcv5/PJHUKPUGaNT4mnQyoC
 I6tisimMUHqd3OAdOR1hcY9mZEHTk/0lt5BV41FJe6AwiatVvaYgUFfstCw0tiHD9W7IXrNLfpf
 L1DumHY2v5EOqXDArvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260014



On 6/25/2026 4:56 PM, Leo Yan wrote:
> On Thu, Jun 25, 2026 at 09:01:18AM +0800, Jie Gan wrote:
> 
> [...]
> 
>>>> However, I believe it is acceptable to allocate an ATID for the itNoC device
>>>> and the issue can be fixed with this way.
>>>
>>> I think so.
>>
>> Hi Suzuki/Leo
>>
>> Which solution do you prefer to address the issue?
> 
> I will leave this to Suzuki.
> 
>> The interconnect traceNoC platform driver is intended for the itnoc device,
>> implying that no TPDM devices are connected to it. So, if I modify it to
>> allocate an ATID, I think it would be better to rename the “itnoc” node
>> accordingly? Or it's ok to leave it as-is?
>>
>> BTW, the traceNoC device definitely is an AMBA device with CID/PID
>> registers.
> 
> Just to share a bit thoughts on the driver's design.
> 
> I think it would be better to keep the probe function generic. The AMBA
> probe should not be specific to TraceNoC, and the platform probe should
> not be only dedicated to the interconnect TraceNoC. The probe function
> should simply handle a device that appears on either the AMBA bus or the
> platform bus.
> 
> So the question is: if allocat an ATID for all traceNoC devices, do you
> still need to distinguish TraceNoC types? If no, then the code can be
> unified.
> 

Hi Leo,

To be honest, I would prefer not to modify the interconnect platform 
driver. On some Qualcomm platforms, multiple itnoc devices reside within 
small blocks(one or more than one for each block) and are connected to a 
dummy source. In such cases, two ATIDs are allocated for a path (the 
dummy source and the itnoc), which is inefficient. This is why the itnoc 
platform driver created to avoid this waste.

The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which 
connected to multiple source and link devices, aggregating data from all 
source devices into a single output path.

This device is implemented as an AMBA device but lacks proper hardware 
configuration. As a result, it must be handled in the driver as a 
workaround, which unfortunately breaks the original design intent.

Thanks,
Jie

> Thanks,
> Leo

