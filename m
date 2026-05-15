Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6363FB046
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846909; cv=none; b=X/NySu1hfQEcfcIybArbczS9X5xJSQswvSGcaSCH9WGR3SPBICebMZddx5lBY9musz2r7zXqObs21YSDOwaNHFIPt6/nd55XPWsWJfWZjJnjBz7Ixasa62l0UprVxr7mmeaGB/mVPqlzx9i5abvcw0MAVjPcYCWMFTWdPPNdx+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846909; c=relaxed/simple;
	bh=dY5ohTYSSLIisrq33bzUQfunxnvHPZbbwmFUmnE3HHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPf4cIY1pViogD3SO8z5rD/6PMEtTcvtI2VXX3zlXe4tXLJTCQKsvf/fE3EJ9DRioFdtHL0I11uIrhqVtLVoVB9AJvTnQgLgDEaIZN8MiHf3lb1ZKEVQz+jCmfmoNUkeomlqlrPHQkFuaa9b4sAZW37t+QlpvmHCYgz1No4cv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bd0UIjqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dwobPeEG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bd0UIjqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dwobPeEG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBOEbF4020774
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRk8b5cg5dV7V982apf7WGHOng/bJOMGq6jOWe7tSQs=; b=bd0UIjqg8MEXSfA0
	YPALlbRmS2BpLag5rq3HzwAyBZLBpbqVfw1tJsmIhljvbw0PaGiPU4WWZvdVH1zn
	hmSOjjmzW/UJcutDQgo9V7kFkcUtPlwdYqSYR/9GUZu5C7NlOWqIoswn8nrOnFmT
	G6++RM+VRpVo2WvqSN7XbhJXzqxgA/tpK4ArJjWxt3lwtHP/3Q4sIvpf1Y8xt5U3
	xukBPfSzI1le7wtok3npCTjO0jdU5sQz9MvTEq3Hn9jgZXJiMORFiY5KOkFekTJr
	0P3DnSJe+1HEtf7gtERNwB91uZmi4lV63laBd4g7uFU0KvRlZgACCFPMvxbBoSuy
	42OwnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1ru5ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 12:08:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so9652472eec.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 05:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778846907; x=1779451707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRk8b5cg5dV7V982apf7WGHOng/bJOMGq6jOWe7tSQs=;
        b=dwobPeEGt8981S9b5X+O7pheIH9qQoHQSY9WzVPXLsxZwNxPJYkYTdR+6rS/ZwGVZj
         5GYeeTUXj2OHrpk0o15KFzNQTQpV7WJ6dpYyZPYZRGUHFbeiMjlPnZpt+uD3XZMjQd6Z
         6hwOojFYSyFTp41+kYv6fOnL3fFMI8qqW1hQyQRDp8I1hhGTzII70o4ZEoLAAJNUlAqQ
         cvuTzMLgeUHqXRXQKHn2OdsTe7oI/l4Jj+bSavtrRBYWKQSibIFnjRQqiBpQL1lr/Mrd
         g6Wev+rvQxdO78bYoXU8UgGerCYvMXtY3ff4YHreBDKIWMx74EWldH9sypsjM4QZCQPo
         dEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778846907; x=1779451707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRk8b5cg5dV7V982apf7WGHOng/bJOMGq6jOWe7tSQs=;
        b=DWY51Ifcn1SSiyEzxR2c4aVsNG+/UAn3//06bp59eDMkvK51H7H3BRJIiSBfh8vLO2
         hCsiV+pWkMIyd6zZrPFMJ48zbqLed8aGB7/Yvb66UaEoWDktAVl1OJqm1cunu6njwN92
         EgelL2TZZ3Rp4T8iLgdUekbFIvWC5fsONNRp44+sULZBYsNNfHu4o5WkfaxAYMgtFxc4
         NdMHKSU/2coN3ym2OZNIzAmO9xuc3TJu2C5iHKAoYVElYfb+pW9Ikz5iAoLk1R1W5F3C
         W4zOmLX+Lk43cLv8eW59jO1YCDgTmuKngEBOdgh4MuF/ZHQIfQPtwfNeBODpXP6lWRl+
         rVsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hv98OB5DRUys3o5u69WGas6csnEQ24pa0CmqRjj085pFWQmfW0B64xpCKYR8jytkXvoce6ViU+HBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+nNH0p1HmmwSaCCjgulI+K0y9OYoX30byoQlP9cpT5qMU1HB
	Yolmza+sUrdw6pQW53PB5Fbo+dHOw0gSLHolyniKS3zRtkmNXD0QDyuwmWJl3Gr2l5G0Ne07+Qp
	GUpk8gfYHw2HYZiXskYmFS/ZRnmjWgLxaFasiPtoj5kQCVxPBVy0/wtKhyLCBfcCI
X-Gm-Gg: Acq92OEi2gJyooYyoBJmnyZ3/0kakOf8YsUu2w5OyBv5Zq7iFQPk/DDTGDyTRQCBm0n
	U2PBhNK1RYjy9cco9tvkKAWbmM/X/YMn3T1c9Y0UN3tum4HxaWf0DcpvvUhA9ZXZWYY2/wxfscM
	5aftrSe2FS6DKeOA3hVUT54mKGsh8y0ZutOO+SwLy3qljX3lB7/AUoL1KcmKuxbBxsQYJ9swWu8
	t3qRbRP55PqOTz6+Marv6FmV3aDYU4oVH/zvxmRyBGOJJyfLp7TF4T9csGgGRxdpLs3qSgN+6Jg
	CBdSV6/59+/h+nJOdGDBzsnTgKgFEoNtm/8lAbW/2bacZBMXFsYpdj6oCNrR3/JvFWka1JKqiWP
	VA580DD6pfMSh9TTcFduaOBavxtH9f4rotgHenxyzR5mO6Vn/wmiTnhBnxglIvMQZmvtJkk5Vap
	LhUA==
X-Received: by 2002:a05:7300:6c05:b0:2f2:32bc:788a with SMTP id 5a478bee46e88-30398652e89mr1866679eec.25.1778846907053;
        Fri, 15 May 2026 05:08:27 -0700 (PDT)
X-Received: by 2002:a05:7300:6c05:b0:2f2:32bc:788a with SMTP id 5a478bee46e88-30398652e89mr1866661eec.25.1778846906513;
        Fri, 15 May 2026 05:08:26 -0700 (PDT)
Received: from [10.110.108.139] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302946f2149sm6464126eec.11.2026.05.15.05.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:08:26 -0700 (PDT)
Message-ID: <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
Date: Fri, 15 May 2026 20:08:19 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 04fBn9u7TYaxSlY7DyIrMfn61r-5fplX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfXz0eeD1tNNrIG
 qkI/LDLAhljF/7oCIdM30wDvnCPxEUnssv8AuPGy7BOfSEhDm2cyvro3EAtx04p5SbkFBEr6dql
 bfrDY2tsEFHHNilYwKFcbABCAl5GV3vgk2b5+mOyV2eohKb84B5JzG7dZ7f1DpFko81wmaxQZMW
 V19+SOGP587iR5Rjk8j9BUAOoDOF7jy0MEoSRqf1bviaGIUjoDkKcqrLmGxYFzkIoYxtyjQ2jQ+
 WW8d4fX08jJqTBOG1MW55X6PEORfJn74wmkoB7LF0yzqyOW//cdL7/Aq5BrPcL8vixtH8HzmTYw
 we9K7gXYIE6ld+b/nashwMnfYAWxwnVdKr5GuycI0OCj3Ik5VJuFgINKiP3uQhrJoB4tt8+y0mr
 QRNIarGSo+AKqqtrKN4DSG9+M9NEf6g7+AEe5ZX0YmXMOb0B7Y00wzMqeBWOhTlq7oSjovHljkl
 tmPcBFQCJO1+/f1X3Pw==
X-Proofpoint-ORIG-GUID: 04fBn9u7TYaxSlY7DyIrMfn61r-5fplX
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a070cbb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pz6ac7PCcHMNlcGWspsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123



On 5/15/2026 6:51 PM, Konrad Dybcio wrote:
> On 5/11/26 10:48 AM, Qian Zhang via B4 Relay wrote:
>> From: Qian Zhang <qian.zhang@oss.qualcomm.com>
>>
>> The QCNFA765 M.2 PCIe WLAN module requires GPIO56 (wlan_en) to be
> 
> But isn't that just the wlan-en pin that the power sequencing driver
> takes?
> 
> ref: drivers/power/sequencing/pwrseq-qcom-wcn.c
> 
> Konrad
Thanks for the review.
It's not the same pin functionally, though they share the same name. 
There are two key differences:


Different power topology: The pwrseq-qcom-wcn.c driver targets WLAN
hips powered by an on-board PMU via the power sequencing framework. In 
our case (VENTUNO Q), the WLAN module has its own internal PMU, and 
wlan_en controls the power-on/off of that internal PMU — it is not part 
of the board-level power sequencing.


PCIe probe ordering: The WLAN module connects to the PCIe root complex 
through a PCIe bridge that does not currently support hotplug. If we 
were to use a similar node configuration as in pwrseq-qcom-wcn.c, there 
is no guarantee that the WLAN module would be powered on before the PCIe 
root complex probes, which would cause enumeration failure.


So while the pin name is the same, the use case and the timing 
constraints are fundamentally different.

Best regards,
Qian
