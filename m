Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A6236921B
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442169; cv=none; b=P7oeREMKDf2obkX5xJHeIOgVSt8ESHL1u1vTWf8rnk1NHd197Wm+LbhlZ4jWCJErCe5ol/p96NDNMMow2YD2P8NvpCtYpsC88AM94V3yGEl2UjxjTUISvr+5/Q0N6ZhYVVwRG+j6Sm6dqHqiZsLgja8FbECXvl/ox3hLfYauz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442169; c=relaxed/simple;
	bh=HyipYEQjC0KSlMPog+3ry2pd7JXrK6HPvK8qsQUOufk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvIWUhm4hTe4WF6vvlevH9Y26cUvDBLk/sQbndBpAjRxfftz/ubyeOAWMH3GIyrHHjXofev8IJQ9en/OCuYd2TV3lhH/hMpOi2pcc8Ijwp2QblHQ2kxiPClm2daLmbPuNLC75v4XHWmPb2oxY0WFPbiyMt7DnoKHrDaDllX6VPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL0fYQzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHQfrWao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL0fYQzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHQfrWao"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8i09p3532248
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=; b=aL0fYQzk8w5eGQVj
	1L+UqXVCOK9ANtbGmrsH7LgdqW0PtqDgI9Kp9u2j/Pzyvh35Of8E8sERMLiEnxdt
	5cC9uFVK2ibNHm/fMkeNf+ehyG2dxBRsRYtyJudurhAUpvJfMOfWH4KlbQnIo/nz
	X9Vv1OnBjrm1SBlCStlCVqo+P4Kh5Ls3wwnsAkpYB6QS6k6shRZXsyy7FdPn22vo
	1nkkx3WD6vJw4glyyFPz7kCCjwzUe90MY0IIr6QzYMrZpvfnDDulN/Lx1im9NdE+
	ASPYrxetMqtDsJMFo47pm+Fklkp70jwfWeBIQUXvQbUPdg9kRWj5DKmrKmYAiTFj
	mJRYrw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvcwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:29:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b99eb06178so169803935ad.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442166; x=1780046966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=;
        b=AHQfrWaoLpjFG0ocY917zTKx1FWGX+vBPd1+UqZETUZzG7u+MrLZ+rHJPKCCccWiWo
         LsyFXEZmrgCJKxc6CUrXdl2WbIiLZPPrlbNCX5PsDUzJdnYqzBgz/4P/3ntQdtXuzva/
         maRZwaC5MAHpXTHwwbrRGOBx+MLa2uyEYjvY3jB0h5WGIv//8Hc81a/isrsIqwio6K7C
         7NvAdM+zSmcXbUt0BTPgEfUtcFT7ghwh3XlO61ErG9EJKEWopSHuDXtJSAdSc5dTHWsD
         oSYYsp3okc7cekSQ+tjHvII11hLyiBSxpy+xfArNxJXZF4VHqd4y5ApR5ndG8zJA0B32
         xClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442166; x=1780046966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Scedxuusc0uxfD2QhmQPprVEqTr7vKMbjt0LXoZAcOU=;
        b=Vwun2AQ9eeXG+AwWkkDzwXoWEuc71L4LNXtPibSzjBia4GQEvcCQboT4DNE3t8pXCe
         pcVUnBzaQdrz6ySRXm0qwZWxxpJaQFRGcrkvrU43rr8fyZnyj/CTqBPjpVyeBOU4nX66
         iYwwrGEIJzDNSPjAUCYj3sBBftxeh92NXAi4fvOByO2V2oycNEqmf1vYZLGg6Mo1UXqM
         LtAr5WlDHmH07/xch/xR9alSM//hP304eoOoNR56sKM9X75zh8UUs1Ys+67gdwkv92by
         WjyfktdU+JD3xtXHZKLGRddarozgJpXCvhige7PPMBktEP0PM0vjWZmXsYj/NbPXq2ZP
         oM/g==
X-Forwarded-Encrypted: i=1; AFNElJ/bKawLK0scZtGNHE8kxc5X94hzPEdMzoOhTjOTrCj1tMnNd4msvl5oNTQWzsCa7phWpyAtpgvcx00y@vger.kernel.org
X-Gm-Message-State: AOJu0YyPglBDrgDD1PPM9YR5DZ8i8i90ZKq0uvteRftpYDijNpzeDSaK
	R+yVs/8g/JYtjNX6+hSXdHiShLw1Sxt/WsNt0x4oTWgvXkLliIIvCYrTLUXH0bnUUfzh4hXyG7t
	WhUjRWlSwf+/dRIvWnGgkkK97VkM0pEG4ln8E2WfsdTPWDyycmhqZNLjp4zoQn9pT
X-Gm-Gg: Acq92OFBW3tP6J1J/LFdSuVDQYS4s5Dfx9e/ftubL/VaOJy+Id4IkQwTvHXfMX1IaMw
	hZcdHR9pgESrPqm68If5wxjuQFuwYK7us8NLXgB3VL+sI4f0G2h4vzHHjDdpH4rCMA2MAoFkDeA
	Sqkq1VRlV0uDjyoEHiXqc+E61ami1LtIDAydglsnGyr9bWXfOTQwTO9aqn8JA/1lo/lfq3XTOox
	ERMSnZSoWwFwb7P1J8N4PyuCGLzan1s28gewZr3C62P89baJ6A5fCEmNd4UjFzCAJKYk5Ektrbf
	/zzboy5VkpNz+kgXQ9I0SzzoCBgMxBP7paZVJVHNb4nVJUKDuRa08mp+aBbQwvg1AYWmA/AEcq0
	GjS867KfWF3sVDorJqvmLEP8rYLCsJK75TAp+pn7b+hShba7h
X-Received: by 2002:a17:903:41cf:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2beb063f20emr31885065ad.33.1779442166510;
        Fri, 22 May 2026 02:29:26 -0700 (PDT)
X-Received: by 2002:a17:903:41cf:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2beb063f20emr31884605ad.33.1779442166061;
        Fri, 22 May 2026 02:29:26 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm15693955ad.83.2026.05.22.02.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:29:25 -0700 (PDT)
Message-ID: <bc00db6e-f943-40e9-86c4-480d533a8656@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:59:15 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
 <20260522-juicy-seal-of-wind-a2fc50@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260522-juicy-seal-of-wind-a2fc50@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1021f7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=lsxlwQEPlIojZXG5zssA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ZHqInrtppU2YxhdiFITiIfZLn2tH7Fsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX/b3avc4YIJm9
 Ds6KzkNP8mwqSH4+szB0QesWlWLvg0UNlAPgXKoYbn4HoCm7Uk9vejNi6JMJJ6ojQk+Bw0dgJ71
 cjZYbIMcRFd81QvHH8OfhN0DtAqlQVHv9AyNrmWOuB9aCbeDVQoFW3zePQ6oXruMlF1mu+Q49KL
 rNw9NthWvndj7JZtSsJXL4zaxcXLyc2zfn5w4MRp2j+qOeXJ5zzQjjA+32Txpb4Q9CSZkrMYixq
 7ykVJFYgDodapSGIAthScrv5xswgASATYiXLpC0jOu01uq4/Dgv2pKCNPckjiAXIbSnA1Oof3dz
 4pp9Q/IhNTJewqvU/zr6dRRsd/X8oGEKC2BDutENbpCzMNCX1JyBl7p7QAEX5ShELpxLAOpde6O
 AvFcsxwTYoeNPTyGxJBmMzYJQiyXatZidlm92NeHy6RpXUvg+jClyfLC1zTTF0f7zkYvEYptwLB
 5LiYRxhZIxBLwAnhBZg==
X-Proofpoint-GUID: ZHqInrtppU2YxhdiFITiIfZLn2tH7Fsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220093



On 22-05-2026 12:04 pm, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8543fd00d82acdbb3422bde462417118aa4c49d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/cpufreq/qcom,shikra-epss.yaml
>> @@ -0,0 +1,96 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cpufreq/qcom,shikra-epss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: CPUFREQ HW for Qualcomm Shikra SoC
> 
> Qualcomm Shikra SoC EPSS
> 
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
> 
> EPSS is a ....
> 
>> +  frequency in hardware. It is capable of controlling frequency for
>> +  multiple clusters.
>> +
>> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
> 
> here as well, like I mentioned last time. cpufreq is linuxism and I
> asked you about name of actual device.
> 

Sure, will drop CPUFREQ and use EPSS as you mentioned, and post next series.

Thanks,
Imran

> With above:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

