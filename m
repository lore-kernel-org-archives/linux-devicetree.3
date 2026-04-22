Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A793314AE
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854617; cv=none; b=i+rCtVvwdKyuvVxrzwiEAQkM2otdYAlfv+ai01JG/wJrctWm7kvlKtchWl0qGnKEUQM/VwX3rU4NdM7AoCdENZR8Esv7E7WMvi0MlrcOVYjWe+FV/TT/8PVK2X6VAl2g7816HnURrTrs32/ANx54nH4kAyRMFS/N6UODAyf9pIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854617; c=relaxed/simple;
	bh=Vac8R/pnoXXWv/sp0RAq4RlOi6uIOf4fA0u1PWbPNOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgA9WWjIz2Auxj/aMfr/ULD0V5xsmE04Xyv6YNAy/sfqGA/0ZiFnKimoP6YY5lyoJ+r3MBDEABW+0ItQNsvMBtq3FXZdCtJPGqLXRvbGsVdz9EE1Wg2k3OXRDCmxgFjjZOSupquTiHM56YRcC/bqMQ3Fq2aZv3963JOexxuC5aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l331lwpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sr1DjKyw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l331lwpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sr1DjKyw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5I8Eh2209284
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=; b=l331lwpEa3QuVn80
	zTLqb7iN3ucCWjx+sPvKyZT8pQHQVQUo/rRJ97RMmYjv85FgCpI0slRkTjjkkCdz
	LxqP200GZfDnhQeD04LNR8I3+Jj0D0sLxjFUfPnW+BeMq+fCVMZQWA4J5+1NVTy3
	DQSgFsi+8MdJ/jJqyHuXsmYrcupTFuPX7H4INDbG2DLq9vPbUxOzoc58hIvrnvH1
	DS6YTqgNhzIXvrPVRuSdx/7hkl5GbnepPAf0M4d6RwlSO85G431BGpZ5mTO1h4uN
	bpRWwdH6yMk6wfin/BcbSglbhsrbwOnb5ljH4O37kqTA2viK+3CO3iQV5ZWiBlFY
	BoePbA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengay9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:43:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca281aaa4so9996246d6.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854614; x=1777459414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=;
        b=Sr1DjKywAFNLn15gEOC4FzDqJCninnYzp8AzP2WnpuYeDAHsU1jX6oRsDKvDxkp/lF
         ZKlq0M6Ox3szSce/fTRK1s/C/pR/4KssZZoL+Pp6jxXRSjl+wPZxbNBQ0OShTUf2u30P
         Et1zupql+rZhckGViXrfbaQzWNtLPsM/6VOgH9haNIG7sjCvZaw9wecWPUZniD6NR4VK
         0GzyaswbeXVGGvz6Kdsh/LFwxrf3GGAGRsyZyE/dDhzQlFrpOqoDZc+42AeH1iohKkyk
         9Yclo8SXVBMDlARGkDGmXTmdRuMN+HuZ2nUxZLv9lBptXCkBTMGI2b62qHy0vw4cJGQO
         Isgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854614; x=1777459414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2COB/KfnyQdus17jKNLMja3RQe4vqA+L5nHYjjYpqiU=;
        b=qVAplH/6Zma3v3o1i+0LSpbFwd4MrqWb+XA9YsDwcuQSD1SreXJ3E9YK3AtCCEXg2t
         kXdKpFZ3tkpv3WKDcWkD0HIGVE1aaLL+RvGzvjfX7EIRbOzr8iZ0lUKa64r2C0eMeB6W
         USz+sJ1qXG0gCHZljC7fNFhZDSvlCnisVavm6ObUKdO8tuoV9b9iTl6sPybzKPHLi1OG
         Jsx7owmxdtuhsKUcTOQDyOQv/Qg8H5BVLv3ZKWsM4Pd5p5xJ6tWCCYRBxX8lk//wy4Io
         Bpjfjj07Yg6+jBEZRl+PRMxFZ21Fi/5bYUM17S6Yv3GJWYkv1xIla1RYLVdlYjYgL4/N
         V1yQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Kfl3QJZA9OSc82VL6AAml7dNF2KYghpE4NzrfZFKkRtznnFv8tYrRqgBnslSTvTCyL5VhW/1yFKRP@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNcERi6y5bkQDFrLwzhKvQpAZinrsCqMmzmWr8+Bss5x1G3mW
	uIUWzFiAItPuzGE7da7YNdVvDkeTmXcUHENkOcBhfBq2KLDAe1LVbfNmaMngZaBQtgWx67P9S5o
	TpWkjgwyv/+VRN9GL8Ihf3t5MPcYT1Uzo5tE1y5tpvC5MseSUqfxoJomWagBYaph0
X-Gm-Gg: AeBDiesTs0LL43U5YWUSqV9du/8ohXRaT+IdqS3UzzzD98sR/SZBamCnCbhWDn5sk/E
	LjekXO79kDJcXrjvMM30RN1UY5zO7153VYSqQdywyG6fwHBaUfBlNkCJnk7m0NPRdchS+8IWamj
	OYVFRetABFndOFxfqFF6DEOaB0ysbJnKblYlhQJJ/sFpzt8wBiq9LPwAKVVrDSr7ytHQisDPoqH
	cCukpgAhNnyAl+D4fqD/G0v6m7GIFXlXINW+2awI3+LW5hwgdPvuERDluhvcAgksRClHIf+DI7z
	19vTH2YXb8us8CpFhPoWGf+hvdiArA/jsv+4WwFKy2rxXrcN0HDrh4C2OiFoP7TWOxc5qjPiAOb
	xYcDIJNOGAjZfdAjU+EaF6i3UVkSIhLnYwniQuKbPajnKUH8JEFZrWtWvfd5v0JFndyp2J9/TvS
	3w3yZZex0Qv8Z4Aw==
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr242061206d6.7.1776854614183;
        Wed, 22 Apr 2026 03:43:34 -0700 (PDT)
X-Received: by 2002:a05:6214:411a:b0:8ac:a91c:c9c with SMTP id 6a1803df08f44-8b0281fe001mr242061056d6.7.1776854613845;
        Wed, 22 Apr 2026 03:43:33 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cdd2b8sm535272766b.25.2026.04.22.03.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:43:33 -0700 (PDT)
Message-ID: <3d50f17c-060a-4a1d-b539-1bea9b3e6cd0@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:43:31 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
 <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX8dcAMZ/EaPbv
 MP3H6nMD0xOjee8/+avhfqt+EuEQ0WNQH31RZ4vq1YN/S6eIywxLrQR/mK1PH0cpH9wtmNtamu5
 w/etY0OYTq8uNsTgQueEAeTJM1hBmUHQ+PoyJld7VJT1T8FRZe6PKu4RsDoQn0KFH0C2ZKb2tIY
 4SjTuz1Adsb7HlmlbYwymTO/o6M6G8VAFRkSpN7NxV3uRG3LAqWeJIoPxyCVFICD3qpjKVsXSMp
 ib5x1LANtmV06UUz46DqAOG/9ImYObwKdTjn9XOBafGHcXyrf8Vhyci8xYLmgrNUhmQKfxRiU4f
 nqhA38PDrhazG8w4oMpC0znjar50G0wbG68dPdF/iZnKgVwU2cmcaq6TYIPoBSokDi6HbG7HLBZ
 5BNG2UxrUTIUDJ9Qj8G6PjRYDcXkpMuJ4flw/rzW2QYIq2+pT1dHmn3zXm8Fx3R0kHPbYenXree
 jmCqBb7G/YKKVHulAdA==
X-Proofpoint-ORIG-GUID: 42g4NZ6tXL8CmZP4wpoP5hvIoOLBXGin
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8a656 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=wI2HHqrEW52EUbEo9zwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 42g4NZ6tXL8CmZP4wpoP5hvIoOLBXGin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220102

On 4/22/26 12:32 PM, Prashanth K wrote:
> 
> 
> On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
>> On 4/22/26 11:39 AM, Prashanth K wrote:
>>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>>> super-speed enumeration on that port.
>>>
>>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>>> Cc: stable@vger.kernel.org
>>
>> This is a feature addition, not a fix
>>
>> [...]
>>
> Sure.
>>> +		ports {
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +
>>> +			port@0 {
>>> +				reg = <0>;
>>> +
>>> +				retimer_ss0_ss_out: endpoint {
>>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>>> +				};
>>> +			};
>>> +
>>> +			port@1 {
>>> +				reg = <1>;
>>> +
>>> +				retimer_ss0_ss_in: endpoint {
>>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>> +				};
>>> +			};
>>> +
>>
>> Stray \n, but you should really have a @2 port here as well.
>>
>> Konrad
> Can we ad port@2 and leave it empty?

Why would you? Just connect it to port2 of the connector under pmic-glink

Konrad
