Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C8F43D4FA
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610680; cv=none; b=rx3X2uyPGgLpEsY9wMZmcH6VOZR/xKzoWNfJ6MvE0gYeC6JCL0XP3Pc5qsWhMXXbi2CAHJEBfuNI6WOXsWLgsTg1xUCCqJIoi+Q/lCslN9ClUnhqNETrFwdOsNWitT0eFDxOKClvQqmNvrPSkbFxk8QEV3bwMHZLApemtt4nucM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610680; c=relaxed/simple;
	bh=S4Pr7OC0zUgcE+WVa02kJXmu3HUXXKm4UWEwo3FFliQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=li5covGFj/SDRIMrT0emhpEpncrIeD9JbxdqaImN0vLFsEIHaYCK2/0EHD3qZSFVSAZz2Jb49bUO+8GFqb4kOyuqAtQT8VWEdeEgb8cKWkk5K7I7PKZHa6tM6IrH4n03ffMujnf8cipff5gpv1uUAY6ZuFGV6WPADybLer6O4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iO7rqEvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXbFdp1X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iO7rqEvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXbFdp1X"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9h342799365
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=; b=iO7rqEvObgNKJwvp
	NwiNWmBkuePzRnGN65Aw5XfkbxnBRmDSdiQPgNokTbxzbigkSDq+k1NcqFLO30N+
	wBJhW2diRYdOEPpeoWHqN7wiJjR7pg0DANP8XuRWw9GSd/KckTUyFgELYjiNhBG3
	2vP8iu2sKGtgFOIrvoCd3pSp5p4rHNQqk45hbLu75XMwppJy9jJc5XardSuI9J7b
	SmLUPCbh1S3+4Jkc6rHQu1GtOb7VLEf3F2eu6yRg9fQGuvTrSC0TyF+6NsccemV6
	wxCmOQKJ87cSZ1bMMPrWE2WnF/DZiMuKW+akNnvCV+Z7LOlIOpuXsTzwtB3Hof/P
	cRBKMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7smfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 11:51:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915827fb1a3so30835485a.2
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781610677; x=1782215477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=;
        b=WXbFdp1Xw9F7QA0ZFs1pirEMWywFnVT2Mujdb7w/H5zz9J7DQ0WeQ/ET5Dd5Huse/v
         jFa9b1iCE7qaNjsfuRaurJQFjEsXgwQMeTUie5AhVKf9ir2Z1kTNGUqT/d9zxlPPCEck
         2opQbrV9/wCprJg817JeTeIawisMc10ijJMrS0WsEM4rRjw7wNrcb4fnLxD1djVNIm0o
         d3lR1IqRsFIBcS24VBFtfKDEzsth6fkJZAVgxiE92Vwym/oxwwtnFCbCX7jIreTaHzih
         xRwwKr/+FrPayYmXgaYny24ncSspF50UIQcYWd527AmeG+S3PFmcsAzLrx0YxYN4Ln42
         0dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610677; x=1782215477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1zI67otVq+aJIZ3IRAwoCMpz4lJ4T9Rvgd77tzIR4h0=;
        b=UD/vxhHnA+zxheCw2m7h/TZvLtdqxS9GdiPfwp/QbdnS3biUgM4FP4DqgjfQsIrs9v
         lzwwEyb96YzYpK8Ga0qvJeDEp8eIPx6NPY/U+fcaqA0v1etS8X+iQt/QBz4tNrr30+Hi
         HAmP/h54fY7G0zAEFkkhV9rCB/94AbPP9Wjd+PFpUwkjjAuAbuB3+1hz/ym+gBQt87S3
         QzU2UQiCuE7WQKhRBYpwsy/I6d1jRdTwVA/yakd2MZyhsqKoGy1R1A/ve3apLBE4/KqL
         KgUZSf/zX+kIPuBRbv+byhHOQTeBXZmiJByZTSP8w6t+Aga8cKHgeRt0a3UjVfyuz0St
         Gznw==
X-Forwarded-Encrypted: i=1; AFNElJ9RwXCRUXTgFapTg2FzcKlrKnN5/SRtDrVPvA+bZURFFZx89J0PvQnSDTzq0blZVRXXDDJjVIhgcU36@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0WR/9tgz68i/7xepkyh5bSRiA2LkM883dB26Tee8xUVyuvdj
	HhpZoDmmY68om71ien0g4OrFTh2iqek8i3CXbUPs2YYOXulnwlXkDJrmWeufacOx0xnMKB3jKvy
	sjp/VMhpy7b1LKra9/lz+I0yXlcmEZqb7Q9YDfKXmqiKzXL22DR+nAh5IxmFB3Bog
X-Gm-Gg: Acq92OEv1n/dvdNp6g2fUp9h+nGZv7iv7RD4bbL2OTASuAV0EDOg1KiKhH78yqZ5ArC
	kffVqM8emNlIhKArsujyWgnyWFGYVxyOXNCx5g5SW25Jfrm+GkWQnomEok+xQHxu+7/zcMaxLmb
	3Tl4Xak37If44It28WlwyABCktIDAKYgd2/MVP+d6SD+9T4M9AvX/b/IAm4rggTQhbC+Gf5fLg0
	BJTEEALsJUrzh8XcFo2DGOcFQsRvFw2AA9F5s66kfMFHv5pvN0wRCLsVK8ndOmw7w4ho19903oU
	WZWEEl9G411HaoZUNpqpqaRcQJs6ar3fwRqVmXdglJBv+ki+0oU8VoMNY5oww16D0URZdkBSQzr
	Jh31NfF5e95LnPrwZEBkDS6Z6P8IGs7wu0f4DzNhD7q59bA==
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1639850685a.0.1781610677147;
        Tue, 16 Jun 2026 04:51:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:916:1a60:ee05 with SMTP id af79cd13be357-9161b94f702mr1639848485a.0.1781610676676;
        Tue, 16 Jun 2026 04:51:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937938a0acsm5185937a12.19.2026.06.16.04.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:51:15 -0700 (PDT)
Message-ID: <d91431db-6f71-41a9-8912-42d74e19173b@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:51:12 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: glymur: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519-add-coresight-nodes-for-glymur-v5-1-3dad99fe31e0@oss.qualcomm.com>
 <3c2fdcf8-957b-4b28-85b7-3a50ab8ee485@oss.qualcomm.com>
 <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a8bb974f-4886-4adb-baf1-9e6c352bc6cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfXzl4pSEtMCOlv
 bA5y+9oo0NlYkBr7LmqdcAmx/hAbDLy7aWW4wolqn9MXHCcRNfQ4fqaoPcaghYdtTnFQzqOULrV
 3AENvEOEe9htbLD+hyqzCaNluiRqjBXNi9+4ZCJkk1BcpnQOmQFwmcx1Xn54L69eSFPTzpjq9iC
 2S+G+BExL62owTK7XexaYZsaxoso6wy8h53gHUImaDkK9h1ZRM3KwP2khbXk1MfW7Hevu3r5vyV
 M0r9n9cl6N9SX11U70ViraD4msF6DRpd3MbyaNF+sU25P/e2M/iCypd5/7oBDm11OJM2+AHde7E
 ZxEwmGpewm2TUiFCDmdxzPnnYEupVPKblaXSmi3RgAASu6t3TuxY08O/6KNTe/SrffOI4PVKjIf
 kQzehW4KkXXXq6QuX0ZmYR7qD341bK5mbslSLd2XNK9PqZrdTpegYyM2PhoaWlrijAqumnWkJJl
 z+ACRKKGakCLRYCSmbw==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a3138b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-p3cA0bc1xiosEUZoXEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PbsIJDmS4dN7hMoKB9jEMvFEIw9uz7nQ
X-Proofpoint-GUID: PbsIJDmS4dN7hMoKB9jEMvFEIw9uz7nQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyMCBTYWx0ZWRfXx1L/wjfVLdfG
 BPL9Wlr5FiDdRclA5+X4sosJJ75S+rC+fNzEYCrAQXgcnuwPHv6a7lwv5AGhaFiR0DDoVPAqWo7
 9TTDJUjl5slVSeqQeIEBluC5kuu55mA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160120

On 6/12/26 1:11 AM, Jie Gan wrote:
> 
> 
> On 6/11/2026 5:28 PM, Konrad Dybcio wrote:
>> On 5/19/26 3:14 PM, Jie Gan wrote:
>>> Add CoreSight nodes to enable trace paths like TPDM->ETF/STM->ETF.
>>> These devices are part of the AOSS, CDSP, QDSS, PCIe5, TraceNoc and
>>> some small subsystems, such as GCC, IPCC, PMU and so on.
>>>
>>> Delete cti_wpss DT node on Mahua since this device will cause NoC issue
>>> on Mahua device.
>>
>> Another good explanation is that it simply doesn't exist there!
>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>
>>> +    tpdm-cdsp-llm {
>>
>> Nodes without a unit address should be sorted alphabetically
>>
>>> +        compatible = "qcom,coresight-static-tpdm";
>>> +        qcom,cmb-element-bits = <32>;
>>
>> Do these other TPDMs not have the "DSB element" as the driver
>> calls it?
> 
> Depends on the design of the TPDM.
> 
> tpdm-cdsp-llm here only supports CMB mode.
> 
> There are three types of TPDM:
> CMB only
> DSB only
> support both

OK, thank you

Konrad
