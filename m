Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF893803FC
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 06:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111015; cv=none; b=pp1vprX17Yp+juVb8E+Oaii6l0rWLC/Ca+w7wd8iOSenrfddDBPHqowRzHVqR++76B9RX/hyCDw8pPxvgOknR5VX/B6Gok2KCw0w0g4ZYiVMz7YqFrdxdTPg4JhteYwI2nP4EWtDmkOpQ4f7KKU0DTirNFUFurfBCgw63pmGUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111015; c=relaxed/simple;
	bh=D3aPBt49l6gIFaw/fDGIGCeyPym3FOmV2xWEb736hos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfUK8Pb5i1kPByPr/F2+ojuuoCiZoxZInlLwC3cnK/ZRNVMLUfYhDJMl55sS1S3ZD/IB3g+WygNBS7T/O/a0Jilv4UExGdg6irdvFJrHcJXkJzSdAfTtjUkYKt0onI+MwLwXt1TOo3XlmNgK5gDh4e44vYSsOBI/PIGSbmyPSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oj0E8lqo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAUEkf6h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oj0E8lqo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAUEkf6h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M43R52798842
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 06:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=; b=oj0E8lqopYiA8QTG
	jtoiLOTWx3tUqzJGSNXX1ijxKUcAWpQYxqKY4UR8VJrTRpMNiZFNeTqklh2rhWyl
	5w3dYk128x7Mam9l2h41U5XVENgUOKDBdhO8w7Uf94a7UN766zDwEyVRlcxsM0Sp
	TbZijP6i+37yJb7tu8jmRrk2EV+6bf08MYGVXDXuzjO3xXfAAAltsysBLqpBWsLx
	3EcIcVzW3N9f3ATWC5RCkDEy1ucPHqd4rX4lsxejfaE9SWmqNN3dEdppn7FdboJw
	fXh7kn/EAYgrVtllfNUHuvC53FaZUMUocPHZXT6BAs1O/zk10k5+W2MbGgQ13pE5
	OLJueA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk2kdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 06:23:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so529972a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 23:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775111012; x=1775715812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=;
        b=HAUEkf6hU2uUpm2Jh/30ufc9Cd0gyGvmbryPXHZkFvbU2xWhOHEGbxAl52ALHsW8YY
         hjXBbyGhi/6d97VW5i5BCKLV4LanrlQs63lPfObW11VnPL78Swt0LqW40DP58IYyfiN5
         NEutKDZnyQSijr5bCYsaYy7cEirAPExVmThZ9Ig6+c9lb44YkB0LjDqQRObUFLPgeGg0
         X7oaHkIU3qoCj7d03ULvDLkyEA5QvK8UXQcrxJYwbnXlB9S4LyrP5eSde/VuNVK4yJjh
         ll3cUd9vLhmVSDPFMcm0UjLoxuJ4drxfP7ZbPqE6rRxZ3r/FK+sa+ryUJVfLeX+aaJrS
         V9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775111012; x=1775715812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOIp8NE0qOhUlChl5x7MNpi2LiiMlPjZ1ManOljSZPE=;
        b=LgIcE+vfmvlev09MAincOzfiaOS/2Wvgc/8wpXWBK+rCZH4qMtbIKrWNrCf3mvJYjT
         WjwEBmwS6yyj10Wt7m72wu0o6w5TekbHisr7wMFNamiNG4Xxg4qfrbygaUWVDmTjUwnK
         TsrccQDtyuJ5phphGHLU4ALU0s/nGX229dAHGi2BnEYXe+AAUbZCZ7eH70+WPLs0u22n
         0TIFMIXq5JPv3YxMtI1UihEGK6uBJxlLCt51Xrag39136psXrNUhrxnNd4pi34kGw5ju
         IWbffnsryN3RjzXzNoji8m1wq3KP3/ZVcvBJRiPCuK5tKTEaOEcMb1TBns4qrHz4CXjb
         vhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUbO3LgZuAXrtHLLv64hSFgssn+DXXIPt7aGDeKHYP2dbahOkAeGJCVd6vI66lQBP0gG894rK2kKzq@vger.kernel.org
X-Gm-Message-State: AOJu0YzW//Mfeq2RHd5T2hn0jPBUbilm30XIcISSSN6e7CYDoDcndYoa
	vlM0X9vS+3aPjOzXgIH0mXYc8v/NXdLzgbfMGgZ7WP1j6YlD7+MDqx0D0aFpCJ9SQcwt2B35iR8
	S4VEWI+hBzu657ef0jO0UVQ9bmHJWiXXNeYfbvVnA70mcwlsyn2no3HPeWlh/sBwP
X-Gm-Gg: AeBDievynRRFJYXhJC/sRhLWZk9Nrw2RyIQX8v5PDQTroFsTybAel0eF2jue4DEyHQl
	m/lpZx36lk+taN1LfMR1cH5j4YM6HCKd8Mc8PQkqSXitv8B7YTbsAto4misOd2xgM87oByOfraq
	8/1+infWu/Vzh5RWiq4qUARnYAP4/FYFn7tfdc3QynA7BhCKxhtl3cpuB4G7EM+Lu07+vMVl/i+
	HZ2AuDbIO02MuoAL7Va5QnWc1YDVkji9C3D6RolRpKczyZX3hwsaM6WiBaBvsNY7WmM7/fE2XzA
	P3XrErkBIgo0LlzvSST7frjY3rAArDGakFnOV4u9wTsVQWDEkyGHLYJl2DUCtmPqzYmXhK3ifbQ
	yfr8r1HgqGGnmxW3T1kLCJwGceiffQk3uVpFm65K7Wjt3vgLQTlmr
X-Received: by 2002:a17:90b:3cc5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35dd3e172c8mr2079222a91.6.1775111012236;
        Wed, 01 Apr 2026 23:23:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc5:b0:359:f0e1:f8c9 with SMTP id 98e67ed59e1d1-35dd3e172c8mr2079204a91.6.1775111011687;
        Wed, 01 Apr 2026 23:23:31 -0700 (PDT)
Received: from [192.168.1.14] ([110.225.167.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e3621sm1738507a91.4.2026.04.01.23.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:23:31 -0700 (PDT)
Message-ID: <3496027c-a479-44bd-abac-3382a4155632@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:53:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: monaco: extend fastrpc compute cb
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260326154111.2781802-1-srinivas.kandagatla@oss.qualcomm.com>
 <fe9bba47-13d8-4572-af8f-d4c0657f7195@oss.qualcomm.com>
 <3419a58c-c099-4dda-a019-4900419aea9b@oss.qualcomm.com>
 <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <d2fb3b02-d4d2-4bf2-82a0-3432c3c3404f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1NCBTYWx0ZWRfX+NwPRmJHaRP5
 rEVnYMGDZuyK1/YQJj94UdAn0CTpMpTILlXb3Hx88yi6+fkSV6DhzFZN3cgz4OZmifIrd4CWipD
 3SDZgW4rI+cWzSxaYOybspSfqo4RtFmproVqI2PWv87VIlf1N4hMnsueuaU8dUVWe9x4GVT+ABE
 tYsTsHpKG4XDDYrQB9UNNC4M8+fu3sesz6TvAXq+WO6IXlT1dVhdm7PXA5bTKCq3Ps1Dh/5lTGb
 S9bgEV+lSOSYcM7RHETSUb7+6vWau2prrASSWzwQohf70Gl3Ruv0jHh0jTSc3VNgxwBNDmJq7j0
 YLu0nxk9Pka6rfD3K590QUuDcUH85MClUlWkk/GSmXBysRUomXa4x9RqwdFZPi4ezWgLjEb03D/
 aPaSsdj4CufwN/aG1hJHwpGTcOYagY0U8uyISYK9XR2bizsOOmTuA4DdVZpPKLyiCuWKivmuDPh
 /9CbmPv8MzWEj7ByYlg==
X-Proofpoint-GUID: kXpV-QV0buRg1IVkv1gAIHyKqEuOdhVc
X-Proofpoint-ORIG-GUID: kXpV-QV0buRg1IVkv1gAIHyKqEuOdhVc
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce0b65 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=GstQyB7T1i92F5dDEt+vJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zxRFMbGF7xCxgMMR7R8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020054



On 3/30/2026 4:20 PM, Konrad Dybcio wrote:
> On 3/30/26 10:38 AM, Srinivas Kandagatla wrote:
>> On 3/27/26 1:10 PM, Konrad Dybcio wrote:
>>> On 3/26/26 4:41 PM, Srinivas Kandagatla wrote:
>>>> For some reason we ended up adding only 4 out of 11 compute cb's for
>>>> CDSP, add the missing compute cb. This will also improve the end
>>>> user-experience by enabling running multiple AI usecases in parallel.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 49 ++++++++++++++++++++++++++++
>>>>  1 file changed, 49 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> index 10e799dd4a78..38fbd44c7d8f 100644
>>>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>>>> @@ -7739,6 +7739,55 @@ compute-cb@4 {
>>>>  							 <&apps_smmu 0x1964 0x0400>;
>>>>  						dma-coherent;
>>>>  					};
>>>> +
>>>> +					compute-cb@5 {
>>>> +						compatible = "qcom,fastrpc-compute-cb";
>>>> +						reg = <5>;
>>>> +						iommus = <&apps_smmu 0x19c5 0x0400>;
>>> I see that the other CBs have 2 iommu streams, the other one
>>> having "DMA" in the name - could you shed some light on that?
>> AFAIU, These DMA streams are relevant when NPU dma engine is in the
>> picture, examples can be data pipelines which involve transferring data
>> buffers(in/out) in-cordination with different IP blocks outside DSP. May
>> be something like camera/video streams directly to NPU without CPU
>> involving...
>>
>> Personally I have not tested such usecases, but for upstream fastrpc
>> clients AFAIK only application streams matter as clients will explicitly
>> allocate the data buffers, even for sharing across ip-blocks.
> This would be nice to confirm somewhere, perhaps even denote in bindings
>
> +Ekansh could you confirm/speak more about this?
> +Dmitry for awareness

Yes, upon checking about this the details are in lines with what Srini has
mentioned. These streams are mostly used for video processing type scenarios
which is not required for this platform(as per internal discussion).

//Ekansh

>
> Konrad

