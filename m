Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762E34041E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779253473; cv=none; b=Ehj8TUTwOcNUY2+vI5HSb5a0Ok/ppMQ462dw91H3aY29MKyrCv31+6hBWp0G3Z1Vx9gOhsOP09ldBD+RrsUf+OGMHKWKDNYIiUvCVRqV8XRIwiWY+bF8Qd2RExgL23U5fZtz6du73QiL/qPW5VWLyz7TG58ajFr81V5WrLK5JOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779253473; c=relaxed/simple;
	bh=GBw4sTQ51qv3RHbSz6bJbjqhdBcQ63A9uBz66nhSXZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTbMyHPLhLxhR3d5ElN0t4SJDzQkxIl80NpCGRoZRBK9SvkizLJm8F1WwfCI779gWStv6oCgCZGdcjv84Y3+8C1YAXPyeDuFUwoLnaCgIUfHJF3y1lXLJhOCTY1LP7ow22PMEwnfpaKzVVUeQgnSNf9MSKuOeJjsaWDXFSF4s5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGxCSdId; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBT6J5w8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGxCSdId";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBT6J5w8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JM86Sg2867863
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=; b=AGxCSdIdhznPmytD
	r5V/e9lDrCuH3/0gRJtb8HQ1SX6d/D4TTxqd452zKW/4bVNVhKdIOtWoTy7rkUtz
	oaHp51iBf5NigPanwjK9HgCS1hdYtLEI9UqckFlx/NNqSrCGnFInTO6ibecveqO8
	by2G3adovXR4GpPtgBxlOAlBCIQNRTTOrWK0Kr1FrGr4Hr+cmXpnt1mDNd8jfAm5
	qThdm3DxJPNVxI8uZV/X+ZlYS64CfDduc/Cps0PSv3bvVO6u9PrbDFSLQbHgcsvV
	ei7VuDKkJjQP7E0DGy/2l/GoktWqN2/s+cHPdy68a/MxslOAhMj3ikC6biXtdyQQ
	sv3Q7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3wb1ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 05:04:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba0c548e6aso8866005ad.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779253470; x=1779858270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=fBT6J5w8af8boljQ5ifhwwhAbnTAWqATRGdNUqLM8Y9FhLKSdleIFHBnFIB/FWD/Vo
         +go76bZLayzU4nR3N0md5WCf08Wdm0dYRISSGbcwkj52Kr/2yDvLoyNUdOcMdnepgMnk
         HLzNC+MGVRRnTt3DV2dJPYhYNFH8aZOjdGUsTEUMfporaS6LuCUGeCWi285UaeI5EpSk
         5ZRiD+bDmdwjFa+Ftmxt8H3t1glbX7geBQiQG60rpcughej9yjyHgKSyBwR9AV7vrnB9
         i5qqQkgCHt9KOlH6ooADj46+haK3OvYiKtQPiRiMrr+tIYjugBd33+mogn65miNAKipr
         REEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779253470; x=1779858270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmSQknuukmFtpHIF3IEi2WKgAfnolG31trNYBiHuO94=;
        b=APOO603Nl4Pbt8Uq8bb1+7WmtjEwzfGyFOkj3pPlj0Avsb1BJnPvEJF+Tj5JPmg6l+
         6udEe/newVzboebbrrpNRur0s+NFtH74dF7L3JcR47iKhd68f63nhdqfJOK/AjkZxV31
         kNTVj34XekSTVPF8kF+/h8xDvnefHP5V1YNIoLbh4yjKQD0E6UFdvt2VhLosNs4WlLRx
         sHiImho9DI7KAK6+G3qYtqorX0rpzyAvUs/e8ayjGWtnErC7yCrNb68ZGyB4EMNjj4Qn
         jRzUWqvcwamn7Mod6XsnTq7P50MnA9Q17vH2tQdmJeRL5YYzCa0OlK4J13lXBFaGC56j
         BkRw==
X-Forwarded-Encrypted: i=1; AFNElJ/Dfp5XgG0/wi6Se4jq71xbYxWOStnr8CY2Q8XluhdMpqg54FWBbpjRRmt5zwvhTkSGYZb/qO21o3eh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+O+Wefe62wa+LkCMXQyELp9gW8Dmv8OF0cGUzS+AVkyNiJ1qQ
	axZIK5oxKFh2sXO5DTZ1u2s432GGzXiByrzE+qdwSbDxfYgGLwLX2No5iqK0LPjcEn92cZD+zVm
	ivw+m5NFbYYKOF16oXCk9wouz4C+kvEX9968Hr8tshunmt/8+Q6g8V2j65EtiiSWd
X-Gm-Gg: Acq92OGqVb77kkIjZgBF+5UkSAf1w/tlu749CQeWlqcL6GYJFh3SERyCNdwztS41053
	k65vKgdtilJBFx8mm+WrzFydUhkUDQf2qVHiV1FJEBqv9jgBuuLAqTIWF1ikD9pmIWE0kndAGP1
	yho2Z1iDqiVWTsJIbCCRFiPj2YvMefmvOGUUshWFWjyn8PYlVVVMFebdCTW/uHIprmqa8GKG8I/
	OcMHk7SodcU8UM5R639vlVfMrKI4Q9DiMwwu3qdu7Rcs4W3Y2+dODikIZCpRBVMtP4P8mgNfGwx
	FzMBZjlisyb+vOpoU7OW3xkURcCUxmWEq3H6Y312pMsg5FwF+1TGss8VgvEvpAT+o/Ag2U95po4
	QbLAu2/1QYE+LBouetM1Ghy1HxSVM7iQ8G9WLQiqa8UK5pYswfW4fF3YsGSgthw5oNg0p8DLA0j
	GQpdZxYA==
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206365ad.7.1779253470283;
        Tue, 19 May 2026 22:04:30 -0700 (PDT)
X-Received: by 2002:a17:903:3c6e:b0:2bc:cb8f:c286 with SMTP id d9443c01a7336-2bd7e8cfe0cmr139206045ad.7.1779253469796;
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Received: from ?IPV6:2406:b400:b5:60e5:312a:8741:b738:744? ([2406:b400:b5:60e5:312a:8741:b738:744])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f287sm270216785ad.24.2026.05.19.22.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 22:04:29 -0700 (PDT)
Message-ID: <55470717-3e9e-4548-b12a-8e2a2e1f6c63@oss.qualcomm.com>
Date: Wed, 20 May 2026 10:34:19 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: monaco: add AEST error nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-8-d5d6ffacf0a5@oss.qualcomm.com>
 <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <71eee892-1c0b-49e7-a82d-9016c56e8592@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA0NiBTYWx0ZWRfXyHTH3ERlEwl6
 sHrxF7DoImDGqSL0PtaoqpI9CzXGLFGPnqd3i1PKcGINxtokBiekr6EbK7rKi913Goz+BoyAjlP
 7rooe8k7SAbAgSknOR2IJq5u8XGILDFg6GJXQrwPuavy1lncZLPjr3C/MmuUG3ecydq599Yrdoi
 lMAq482yYD9xh46FSOsTJHolWm2QZ1NHHmSh50mnuE8SDbHzWPOnmVXP4OULVThdoe7DfTlh0i9
 3hLR+77qZI22s0kpOQl4byifZOjkJtW3JKQIIS3NPmhHmzH1aQ5d8KYmHsTwzlVuGAKUTT78t+I
 PW7BxtS1TLZvarodwWK7u5Z9rvBcIzJmZtzaJ8AdteRySeSonP7Ex5/DM7mIgnB6wa2ZC/K/X4I
 UU7o7ODUXgOdK+FrrqRLB0oV7n+ueJAqraGzbfu0/1cB/ZXHvzCPSRYPyrETCE42SYx3PtJNArn
 fnUygv/W6tC0qEscy6w==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0d40df cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=8C-fUGBXRnHmYMWNGq8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: GoYFyqCitgBOvNAuqfiRziBkwdojc9Zv
X-Proofpoint-ORIG-GUID: GoYFyqCitgBOvNAuqfiRziBkwdojc9Zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200046



On 5/12/2026 4:58 PM, Konrad Dybcio wrote:
> On 5/5/26 2:23 PM, Umang Chheda wrote:
>> Add AEST RAS error source nodes for the Monaco SoC.
>>
>> The DT describes a processor error source covering all CPU cores and a
>> shared L3 cache error source for the cluster. These nodes model the
>> hardware error reporting blocks and associated interrupts as required
>> by the Arm AEST specification.
>>
>> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e..8e43ceed7d84 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -3,6 +3,7 @@
>>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>   */
>>  
>> +#include <dt-bindings/arm/aest.h>
>>  #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>> @@ -29,6 +30,46 @@ / {
>>  	#address-cells = <2>;
>>  	#size-cells = <2>;
>>  
>> +	aest {
>> +		compatible = "arm,aest";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
> 
> These 3 properties aren't necessary if none of the subnodes have a
> 'reg' property
Ack

> 
> Konrad

Thanks,
Umang
