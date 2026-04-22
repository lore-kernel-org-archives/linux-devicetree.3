Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237D9364023
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853968; cv=none; b=Et5OrAesUdf1+TmEbQbf+wUV6whUo/oKUpbTId46RWcMCfrCE81+k7Tpyq+dDbFKifvrBorFCe7ACowJQSVDFPYqoqOVSH5iwuxIK1rvtPRc1z/g93PMUwK3n+2CmZq1nnaTX7wtYq+u4WuhnB0PBVcuVNRIdSZvLFR/1zVq/T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853968; c=relaxed/simple;
	bh=rIFfrXsNqItade2pDyhej3CucOfiOYuuR3y4hDhrMAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OapsiCspY2rq7MJ+8s9bwI3OvVm77DnaHRhtxrQBPeK9om53wpuUNSwnCo5TjCna6+Vo4Paovsedqb0LXDLMIeed0cz+JZx9wHFjoSyNFby8Fnofv/n+BERzxknn1cKtRgMwbWmbkege/a1BWLYH/1UMmb6eEMDhjdpSkaByGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVMv3m59; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaE1pbCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVMv3m59";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaE1pbCi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5YE2r2000974
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=; b=dVMv3m59G9nSMnzg
	U6TzqNDpje0grW0dIFlVs/6Gyjp8HD0p48T/KkOTkfy+/eSrATna9LM0Igwrw3Pw
	Kf7JtaZme86UtaEkuqfKVLjOyTZMG4Cw9DwiFVIRa3qZpAeQza8hJpb+p5pt9GZJ
	JwdJZuN/FYEELGL9L6bv+NRiTO5eSZOjhKIqr62zQb8CrolwhQ4jgvIMPcode9JM
	ti69nuse04NiAK69GqLS6fZ8HURXAZsvvk6jz2j5mvGCH+g61/GPin8mUhIwblEo
	CEqiKlwWEg/ZsYL0kALBxPRMdvZnTT05WEh0gWO4Wvk+GtoDke4AUtGnYNH1ljo8
	YPvSTg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfb1wy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 10:32:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so3165565a12.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 03:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776853965; x=1777458765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=;
        b=AaE1pbCiU8EDC4GKBqoxzgezdnv1kdjvNKqSnqNNG2ibwsS7hsmX9EWFPat0JKcyDo
         GDxKzUppsf7IHnZQU/eA2uW2KQrBkqoN9je+wqk6OehKSwU+q7d3PymreLiHt4JUQlQm
         ttzx7ywSmXWGhUVDc3SHWk0F5liZYNj2tdTYOhJYQl+IGO5PfA9FyEo4TjB7iasIlEmI
         y3ZbIix9AMXfNapoy7mr8KDt2jWPHNSUsReqChgKD5ds1e7b6ZZAR01BhOxTkMQaOJhx
         o9XZ5JdZrl/Eas3wv8V6kIz10i6Pc7odzQk/+oIvpsRU2LUlFbEJaJZ+AuigifXRAO2E
         Vhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853965; x=1777458765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS8rWs2PV+b0Pwye+4y9eJeB+rJFDeOBFQOuGjsERsU=;
        b=sEdFWMfAc+yvG7mMvqGj0ndRZoAwivTWRhOhRnKywLv5+e1J927ab1SRDUKLHIJ/9S
         W9u8LbctW6k9YEhHkg5PmyBBxgcuMfTODODHpXu+VV2ombOziEneGTeEhu6P12tqIBXh
         kp9ceAu6FMcsjAemQaEWKdSLQvtK4ZdsknJ+3mJgRJV0lzmophPNV4ka/fIrZIvnfNHV
         SPmpJeMdqMVXtsYU/qPpumOdZJGWVEbqn/sl0btlIGfdVHhpQHJNtgEOsuJ+i6+0QWjZ
         jM0Q0yjxChkGss/0Elq9Gam+B6NJIcQ201FdLID7h7f8RNYq/yVuJ6ckFvUMpXZYAQtM
         rTzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MjavGMSfTGo5/yMQVp4tjoh7X94v0XnGAB5J6VIWXNwkZWnUY2GQr8D64Mk0YJSEymcJlYB27CnMO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0rzxgMeveddeHbkWbMDIIg0gDsW24mkupwQmkIPTba+8hDYf
	TYDFAxwfshJTtY2AMD2oSkldgUB+2/8aoOiKXhniV0SjsziG6Wv8bwGL9gk3PaEEwy/CA5S7xKD
	AUwk8msk8gUabmh0py0/rzqmh1ArRr2QkVCfR9gHuZgpbA7yKJNCfJggVKnEL+SyN
X-Gm-Gg: AeBDieuJBfZAhqNMAHUS1FtznKH+IlDcfFhYhgRTJTy/OobR1Am951oG1Z0YYAqPJ5f
	v96SgRWjH+MRFZSDmpy7aK2xoYhsmCr5TJg1lNaDx+EiYn67Dd/1EFPEaZx4s7LOjugdiIy2OwJ
	pBpip+bct7Rc4CKmorcLIXX7cfi6CzPHmg/g2EJvoihFlrAaOdk63VIM3wUITAm/b0fEpXZ5tCi
	sWuJn6oUh51h9QUtm6cZ2Rc2/aNdFm/0N6GwKuw5QwFlPsW9L2nDy5aRh76LkOmVVeYu/IPqGJ4
	FVp7poiGA1MgpGZld6M8WKGQ9QGFFE1HzJjvfOzfCcz6hD1habmhUYuUxMkZ7jyaFlo7ydx6jv5
	wt+MX3oXVIpBjGPMkDpctXSfmMLyI0M2Mw/5PDGGjuEegI5yEnbB46yzT2hoh
X-Received: by 2002:a05:6a00:14c2:b0:81f:4e6a:7276 with SMTP id d2e1a72fcca58-82f8c856e48mr22036477b3a.14.1776853965240;
        Wed, 22 Apr 2026 03:32:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c2:b0:81f:4e6a:7276 with SMTP id d2e1a72fcca58-82f8c856e48mr22036453b3a.14.1776853964794;
        Wed, 22 Apr 2026 03:32:44 -0700 (PDT)
Received: from [10.218.10.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981829sm20345091b3a.12.2026.04.22.03.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:32:44 -0700 (PDT)
Message-ID: <8cb5e28c-1c6e-450e-855b-32491ee73885@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 16:02:40 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: Enable retimer on USB0
 port
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20260422093924.2976069-1-prashanth.k@oss.qualcomm.com>
 <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <6c2c5fd6-c032-4658-9a15-039c77074c4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aLX3iv11aEaZbwdqu_vxcDf26DJ89ouA
X-Authority-Analysis: v=2.4 cv=fozsol4f c=1 sm=1 tr=0 ts=69e8a3ce cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=SFoN1qW29ypxsV0XCrEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMCBTYWx0ZWRfX7lIKm/4deToy
 y2nNiPPySiAut8VuL6ojyqlnjqz4JPjkYClymxkt9aGdE5FY6XAelPRRHjMpynWRhx5b1t5EAjD
 LNRvaZB1yiVEqPwNWJFUoeOqIYlmA7ktP7sEL1Pla9i+8p8AaaiPcRCxyzIx+SFawmnGRC6I6Ls
 zS0E1jyUl949bn+WexPNjuYbP64CJpNR7tkAi0SaswkrqcZ6DjW+dF8PJdSS8RPaqTdfHbul0VH
 T1T4AQG2cWzym+LSFcSXkYxlqve0FYwhbf4/LjEnDG9SRYsSV/Z8Z1TWll2aRh8kX2KjQGltTdZ
 matFTdhWfLg6BT7BHnK8oEwLB9TttLp2ZuQEuF7jQT/t7bQtfJEmX3IraXmoQT5ACN29GoR8mDs
 07RfR7n5T9JaZBZicIvkKfvlGNh/x7s84uUt2qRFZgK4u4v4f0M3u5xxme1jgdAPiTPuRV/bWiM
 CD+VXPw3YuiG5WCiJ4A==
X-Proofpoint-GUID: aLX3iv11aEaZbwdqu_vxcDf26DJ89ouA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220100



On 4/22/2026 3:56 PM, Konrad Dybcio wrote:
> On 4/22/26 11:39 AM, Prashanth K wrote:
>> Add the retimer for usb_1_ss0 port (USB0), in order to enable
>> super-speed enumeration on that port.
>>
>> Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
>> Cc: stable@vger.kernel.org
> 
> This is a feature addition, not a fix
> 
> [...]
> 
Sure.
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				retimer_ss0_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss0_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				retimer_ss0_ss_in: endpoint {
>> +					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>> +				};
>> +			};
>> +
> 
> Stray \n, but you should really have a @2 port here as well.
> 
> Konrad
Can we ad port@2 and leave it empty?

Regards,
Prashanth K
