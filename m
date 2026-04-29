Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894314F70
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434342; cv=none; b=ts4rv/sEM44bd7HvFdevzZpi4cZYUWcu2IK0uFVHANAoVFRF1nyPz/mcFHtXNopjAFMDo7tbWqTtzB9s9LQoqLLGctZhR9tR6tmgiLQmDNLE0QnT1x1Ny1CoouhU14zOhIbeUtByfwpi1OkEXNOZj0aumoSVFXgASo4CjOaNzAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434342; c=relaxed/simple;
	bh=wbTQJeDm0ersU6wMu6P47zsx+mFfkeoRq8XwtWhXcNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlPhwYrI8Qo2VwTISP29Wdi5WGkQskkBmECnC0GkgBYWPokjCntK19N/nwRh6MotoMlHGmODgE0FExuQeGwXjnwJRnqz3aQZ3jNOKuotYdG++4OMn6x9lC16GW6TYxnCzv3KDr4pnIyOfPRBFjEmeiVEG/mfLG6bhmqT+o+O980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxD+YDod; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8DquPV+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxD+YDod";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8DquPV+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZV0P1016145
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=; b=JxD+YDodv9t/5pZw
	deuztASi8PevLk+eqPKsItdDx7So2bzcKvkOElD2Zu/hBG0OZmDF5prFkpOMHCGw
	pPTyiQztylcvqEJkLIlQbo8ooEcOy1e/QFsCxOg9ThmDicZdmBy3bOPrHgUTlR2B
	apbF0SgLKqX4f3Ggmbapt2o2Mh1bCHSG2LGnY4+d0mxW5aUQkE6Rla/gLSGIdSTc
	z8hU1VLDzbbxVjKTBS+uK2mP0pwR60Ds5V8txoWP5bhHQmBkl8i85TisWAwxnc/+
	9TqzVY0wiY3jqEmtvWhrdAvPAc1yDS5f8zZeo3hKGayjIV6tOcnPW792zdG/0gcX
	4iukog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua73013d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 03:45:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9e67f6dcso16487072a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777434340; x=1778039140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=g8DquPV+1WuN6ajJt8hdV0KWVfEXnNeHU5AvDZzzr+RR0cl7/Iop9MNnH30l+ZpvbF
         sy+whxkhZ3BABwrjc0TUNC4cyv8Q9D+EKLnqetsbiiD5LVCGv4q/hI8Q1/Pl3CEXeMHL
         T/jZbFsWiQiuBmexe1yOpY2mLmN28n0zjIvO09XL8T08AB2zgF8w7mMdSEIOYIzGATDo
         5Q+cviURhRqGfXnAQ3yJmR07evIkZLg+Y5H8Y8w6xU2W4v9gTyS0xoruWWLXn+RviUEv
         EBLkn76kGMpi//S209NQjzzZ2bwrxWxhosbmsoBRusYMOnu+a/6UFfGDv6e1BMyTnr0+
         g88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434340; x=1778039140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNT4rzTgg6PTtm2cSdeMVfAs3gh6lbBElOgnRLEOjpM=;
        b=YW5/Oz+M2x4IuY/2jsTeJrhcHmbLXxtAGttkUDvNLwd5RUYnnvj/et3TvJHKsamOvp
         fv/3gx/ZYI06Mj0DkmwNkTc1ESxjLj/rO4FmU8O9BUwFcHiabxIBzl8+kAJaunZzNiXT
         MPddTiQba2eDvztEI9jUH2IiDYjW6c7I4LajqkNqxazDCdxNHURyYut2xmwpD6Xqtkjf
         2cEL7ZoLo+e9e7iovycg2yPO1FIsVgNtcKk4qYzyMI7uJBlwbqApkSRVaAT+CctNLx6k
         wCTuCgR8HLOxeDdSgsfxMnozaxb648Xi0JDxdJtXZgJ0aKxNG0qwW2IEeTrKDCkIw474
         J7Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9B6mhvti5WUv9HZ3/n5x96z1XKoDd5Ox4Ar6iC5yur8enT2CD/H9ZBYkpnuMVBRKi8pjwihKc4p4a9@vger.kernel.org
X-Gm-Message-State: AOJu0YyvopRbQj8enYRq+zoK55np11prfZ/TSIJDwAdQtT4XnHux5WJz
	HjL31MrdIgFoKuarSg2d0kTBi7I8sLMzVRKnyW5A2eMMovF4BrKD3Fp09uuvnJjxiwNZ6NV06s8
	caFxK1jVV/OLOC4irhtiUUI3NOQa/burChv5r8F7EA5cHHvfF0H5oZWk+cKPQHrfa
X-Gm-Gg: AeBDieuFAGs6rx+Bs77awxgUm5tVNaYMjvCl7CB8luJdQdllGPXcTlJLfegZ2W27fS/
	e+nO+Sx9y89v7IPM85mmBr7J9ZPO3lwG6OBXpZqHfbk81XUSQPESOF/IDe7194T1GNPlxyIy7pj
	jsJm4V4tfS3y10FBNhldoVVN7q+h5XZHHzz9GMUL+XFz1XJ7XMkBPSeqaAEX77M9H/nqI+sx/Op
	KvZSQuthhWSG711jN+kMOJz9LlIff3jOEuHkdnNEPMk2xiPXZgFAHLFvfIKZn9S9e1fkJdqqXpG
	TmBJFUlU6wRZhE/3raIq+KZ55zcL6sFMxSmc3UsikOEp1jQSB+gvBODMH3a9FeZAj8a14J73dBG
	itxI8TE8jDCkAbaMjHGMPf1nXKlKAqdoeYakraKWUnKIK1/3TmRYrSr1U2/rmM0aI
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791435ad.2.1777434340400;
        Tue, 28 Apr 2026 20:45:40 -0700 (PDT)
X-Received: by 2002:a17:903:1b67:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b987359abamr20791055ad.2.1777434339943;
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887734d6sm7084525ad.1.2026.04.28.20.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 20:45:39 -0700 (PDT)
Message-ID: <3217c494-aa6b-4060-9487-2d5b57c2db18@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 09:15:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: glymur: Add camera clock controller
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com>
 <20260402-glymur_camcc-v1-3-e8da05a21da7@oss.qualcomm.com>
 <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <6eeb24a9-e2ee-4727-af25-5dfbb95bad59@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f17ee5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VcKEMVW0aYsEEJBu7dsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDAzMiBTYWx0ZWRfX1o0bcwbrReZc
 hTM0zAp6xta1SsyUSyUmthkttas20yxsbBL234fgCE2onsaZx5HmHij4Hx3TSEsHnrlFlfdNFhT
 Jz09/5vs71uPvwKKYwlDl9za83z7FjkZ2MShXk5cn8na8HCubP4nxK9ZLFvFm7ClqPw2R0ycA0u
 Sg8cx7e1Ak137IlYMCG79YlywtjtqobrPIGyBIzmRozS0Yrg6QlkVCCH3lq13GQADcDmfsE/Poy
 3qFe4NS0SWCktbD/QRu4VPfCPahg94BKhF1BFtNf1jlm0JrmwZCVFdultm1FlQXMsXPWkWuyCjR
 OX01lzKkGC8LLXYVi2KEDsN2z8tyvepWTulCD/cDZcJti7ReQmE1rXWO0ON1AoP3gduljRV/eJU
 s5USxizOY65l0xsCArgYRlSFu74YO2pJHuF/gnpZbqo6QAmhGEYifuGZqtQhchcVMQ9s5KyVYv0
 EXduHymSozpXJfgJGjg==
X-Proofpoint-GUID: ZFA0ccgawITtiXt1Lpce9eJpmIg-poeW
X-Proofpoint-ORIG-GUID: ZFA0ccgawITtiXt1Lpce9eJpmIg-poeW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290032



On 4/2/2026 11:48 PM, Krzysztof Kozlowski wrote:
> On 02/04/2026 08:15, Jagadeesh Kona wrote:
>> Add support for camera clock controller for camera clients to
>> be able to request for camera clocks on Glymur SoC's.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77a4138deeb4e00dd8b316930a2feb..c32f0b84db2f38ec567485e36e8e50529e886775 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -4163,6 +4163,22 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		camcc: clock-controller@ade0000 {
>> +			compatible = "qcom,glymur-camcc";
>> +			reg = <0 0x0ade0000 0 0x20000>;
> 
> Please use hex, also for '0'.
> 

Yes, will fix this in v2.

Thanks,
Jagadeesh



