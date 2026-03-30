Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF33822BA
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864300; cv=none; b=sHMl+6KlgclJZeLH/m3H+XFo5gl3t3Xz47J3efXc6BLpMhpJnNkBmLY44RQJeJs4tfSstK8h4T/uYXBiONQMZxhG7ntYCeVj6G8w2HC3BtuehsrB2d/pdIr5hQ8gCENUejDwUmM3O4myofdKu6NmbF2Hw3cTaN8HWnVUaTz4c+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864300; c=relaxed/simple;
	bh=w/joOL/hDFpmR137gtu+NZP9+ywPtTp4/A7lTYDiWlI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckDBNqNSX3aqbalmw02Pw4K/UkOH2k026zelUkbXwKxariZS2EVXJ/oRvtS/zz1lUj/TRI69T9JlJFzvXRFKg3jtst1vhVSBK4WLhTLGyQnPWiJe3PLymsoZIID/d/MR/wEBRehM8cPqVohG4dV1krAHgfloxMk1WROzteORojM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GX9mBO2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu9VyPmh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GX9mBO2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu9VyPmh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5G8Kc201408
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=; b=GX9mBO2YfhTlaO8I
	QQoL+gfHGgKwk0FHr3DCsT8m/jYNc2VPXrFc1J4YJagemL+1MZfXiBmgKj6BRZ2W
	BZCnA4kT5vtBdZnnM03+NwBnrGFhl8IJZzJOh2+UdzN2t+P2B2atJoK/jXXqes4i
	F3bfsap+q4xDSFK7tFIL3Tm9rUiFRkjOqjBMtae9XYSD0FdaPnONqG0gxb49hZyy
	FhRnG0R+doTPxaAxTee3w9Ec5TXWvYkbmVZyJL25QbWl6R6bgg+tFq/Um5TWX4HV
	f87sNZUmvelWQlAIp3nXhqy4jLKa+NFeBbJ3mMEXX3a6WEDqTuIlh6R51AVQxeKO
	6mydTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwnmv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:51:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so17705271cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774864297; x=1775469097; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=;
        b=Gu9VyPmhtToWqpW4/CexhbjP9gcfz0nNXR44N1XIWIiyztV3HAeeQaa7+ZuoRII4Yd
         DjE6/tj5p2Z0EaGjCmxkdFUnlXrhe2KzHDz2Nup17bDRUOE5saYLAPJBFowvZuBfvdZt
         MGccwRvQj0HaqVEGejhuuJ6FUHwLOdaBnVNTSU7QgcHd1Jiy+NlAMDEJwTqOQ39F7Xcs
         Y6ZIjgd4uCoMkHeWiN4Y/yWSBg4y18y8ds9A1oh2CluvVCh5+uRDNHmD0m3ftuEGkytT
         2T3naFX9AjAcE3K3KSkTI9mva5BBhkMyW80Gz0bye7R93N+nuOdEcsPM3KdaqPVXxGwB
         sguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864297; x=1775469097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=URsAExhDIShWcT8dpQmL0WFmSilAGE61mff4TzQ2EpU=;
        b=i1m6651Uus2ezQn0b0kNjEGrUKcz4Paa4VfTWAUDods5Kj0JijxnrrZ887XiAHVNiO
         gqclSVt4BvvR6GsdQc3T7SESsW0iUrbP/icMuq76VhO6oVrCZ/8C0yA0BWmh8z2ScIrd
         EtzCQUq/Vt5Q71HuSvQrukiIxqu8HMIDP5Qmjr65Mi7RmdPygzQDnVwodNpxYQpXL5JK
         3EgRQ1KSUZceT/Z1IJ8HurXPZkkTqh7Eq8TU4am0yieA8fIsoNQ8a+oUy3RcRKShdKeT
         RO0N81nHjimAbGoiK3LV2ZYYNcFhFkWzc8cF69ClTpdbTG9vmVojgVJghnwP2thbFjGJ
         jKWw==
X-Forwarded-Encrypted: i=1; AJvYcCVF75++GIz37dBFZPtwoL2u6ekObDG05N4mW90r5bwmViGf5pF4yWazt23qGbCYZzOYO3KvrhO1Yujb@vger.kernel.org
X-Gm-Message-State: AOJu0YzZBZgPTDwhxagn49m4vg+PVqQSezKujwSBkMIEP+gNbQaXNf5i
	IrabhV94nDwXOQnuht1Br2GNgmq7BLKNkdGxcaezFV5isGTDmPQuQaJb1cV/PEL3vG+VjgLuprX
	NKwwEVU5FKaspJPMptLaRjKKxmJgNdhWAHhdQkkOnykMso1voKFQArgC2dQw6IBvV
X-Gm-Gg: ATEYQzzfXL4BmMkp27rViVKYym+Y0DrUXZhj8GSZhRf2phmTm8+RPMDqmlLuaMF1dUv
	6nhQ2u3OWjVMGEFinNtmyyvmXW8cNcPRNHIwzRRBTy0ppubxEG1Cx0c4vFCu8+FtdM49n5KUtbD
	OPGp+b2JFu5RxJfL2qBOgqf/NDFwWyA9NFlp79wPdPasUeQ2LCc4JvTS5HtfLf8NnM9Ie6ftGmh
	gfiY+T+jBBk6W8Wl3V9FnOEzrrEdVg50OnWqBIaSzoLu/jFe6Lr7cIO1UbZGNqCWvNrKAINGskR
	hFz1sAlWj/POth/TMy67X6f8WrMIWYO6Tf1W7Yu/RDW+I3X5kNaRyTQ53oA0uwoF5s7LZUZPQQy
	aWt5iBA9+RIv338szsA/X8Dc+MhFvBl+vw9WQX1ylw+5u/eawHjEqyD0eUq/Nbs/ZpSvKk7YTWs
	9vHbM=
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr121803841cf.8.1774864296816;
        Mon, 30 Mar 2026 02:51:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1982:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50ba3994ea3mr121803691cf.8.1774864296293;
        Mon, 30 Mar 2026 02:51:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66baa0dfaf6sm1997945a12.28.2026.03.30.02.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:51:34 -0700 (PDT)
Message-ID: <e5372711-094d-47dc-8339-b4df1fafe308@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:51:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kaanapali-qrd: Add SoCCP node
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com
References: <20260326-knp-soccp-dt-v1-0-a60c2ae36e9b@oss.qualcomm.com>
 <20260326-knp-soccp-dt-v1-2-a60c2ae36e9b@oss.qualcomm.com>
 <bb03901e-5054-44cf-a150-6c7d5ee0f78a@oss.qualcomm.com>
 <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <05719918-074e-417a-8209-cbce9d49d94e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69ca47a9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d_tKQ6W3Izun0czx798A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qBnmMQ-Qq1Tdjf5HVpWSMKQgz002wZp9
X-Proofpoint-ORIG-GUID: qBnmMQ-Qq1Tdjf5HVpWSMKQgz002wZp9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NyBTYWx0ZWRfX4HO+zEfTHcXv
 gEi46j7dv42bu2eRN8w2ZM3yS6/7UVK7D/q6sLPDhGqingfGTkWZ0n5dApkJsN62V6IuOeSMidC
 M6XmUJEfm9jxlNs0SWjUGwz5nnM/7gj4fMdwJPxKXHWH3OBEqn7FqVEz/5v+gOO0yRR2p36Our7
 hSV8UVSc8oJY17mKLjOL2xmvuHook+1dy52w8NLYX9wCaZaWEftJl4Jgcq7+JIUhjPsXOpl03Nh
 LY25Tdy6cOBCJebUowKym7RNoAQKyH3T26k9yS1AvHXzcWxe5I27vCB80i8I1XTrCkix+Df9vIE
 htOLSSeAjkrulLjlpRA/cNWB/Lk6PDhtGzAFN/vMCsVzxb+rdjk4NbeOH+x+Im00WXL7e72h17m
 Dd/pJZKRQ+epJJaQAa4nydbD28djl2MWPYUrpPOgF59luBVct73JBMXbM62WgaGFZafQyo1DM8Z
 UiXcIFHmBn3LHKWGjEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300077

On 3/30/26 5:19 AM, Jingyi Wang wrote:
> 
> 
> On 3/27/2026 5:53 PM, Konrad Dybcio wrote:
>> On 3/27/26 4:20 AM, Jingyi Wang wrote:
>>> Add SoCCP node on Kaanapali QRD board.
>>
>> This is really more of an "add firmware path"
>>
> 
> will update the commit msg in next version.
> 
>>>
>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> index da0e8f9091c3..6a7eb7f4050a 100644
>>> --- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
>>> @@ -781,6 +781,11 @@ &remoteproc_cdsp {
>>>       status = "okay";
>>>   };
>>>   +&remoteproc_soccp {
>>> +    firmware-name = "qcom/kaanapali/soccp.mbn",
>>> +            "qcom/kaanapali/soccp_dtb.mbn";
>>
>> Given that this contains battmgr now, can MTP and QRD use the same
>> firmware?
>>
> 
> Offline checked with the POC for SoCCP firmware, MTP and QRD board
> share the same soccp firmware.

Thanks for confirming that

Konrad
