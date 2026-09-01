Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFF337B81
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244322; cv=none; b=Ulk7FeBOGzV3YFsXyYMW6ROD00KXygOOd5QgxshUcK70bkLbPvJXWsWPH4zmOjGx2IzZwmqzFfAQ4AeFweUZmL6fPwaVI5E26RFzWq06rHDOHVGUYLSuUaRfQWo+9NIKSc7bHFoaujxhp5s9vpiUbEnSfIV0sQu3T9EkjQ7bppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244322; c=relaxed/simple;
	bh=dQ8SLE497iwC0DArYD177oqNcp5Fug/EARLixjeSte0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=X8IT/RRXIBkift2B282AVZgK/3+eAKKKs2XyRcLwWU0jk4tyDc1CXsTlM7xSM59V72VCbNzVQyFXkAjvcr+lRzUQDoeIWsIewRdsQuHGvjFX2qwVpVzbNcs3CV9rpOta3nBQG6ZnoPmSZwDka8zHmG/FzRKnFjOGb1SQPzZwsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pH8wtk0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGuPtHtL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pH8wtk0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGuPtHtL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6811pwaw585066
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=; b=pH8wtk0hyAhoI306
	u+ULz1hrwveakP327Goo0bRhCDredi48wX2KfEAMyYZckB6Rqb6fECslMSSG3dy7
	GOOxKeB2vzoY52/nQD62I0a5Wsu0xNKbG5/k/PRNQSMfvs109bZX838HZG8LcTTj
	j8CKy2jc0FiH0NsKSg7W16mRYzaDPpuXsVJcNLVNiHPrUuR3JVpVqp0cOkaHvip4
	Z4C8eiLtfRSvS86BWjNslo61UBlU6kPfMLbLcUXP28Rdm5FIUO7hEEbVamYERxSl
	RujrAVdQEpHJRi2F/Cp6QszApeJ5aYMdZQEywO2hxnLgvHwgR4elbltat3My/EgN
	NnUAqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndx8y3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:31:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so864172a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244318; x=1788849118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=;
        b=JGuPtHtLJUfWV3X9rJ4+dkt5duBqOAfH7/Gu1QB7UUmmiaw1sx2fQDmr49HAO3nWs1
         bFtTi4JTzuK80INAj1afLNBF8phIhe+FlNSYO2FqTkWE58wKWstkQ64T9MyeKYJWZZ62
         qKCoFZ+P8gytShkHAf4g6tQWf98GnsZp5r0IJTC1pNW6qSTrd5tbnXgxKACYxo59+zCw
         eUz/C+0649X0NYwkLR5d0+64X8fG+TjAO88V3ks8u4A5JN+KyWZfjuzlDYrrJoquXlHr
         mtHVwgAu3/9S8vhjXfx09dJWfhXQL0CUygN6qBiFPQJKm17SxJlvqr7EzjHATuzY6Huj
         NxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244318; x=1788849118;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cX5HNKxIBAWwbUlALiWmXjsVapEiRZSrc2PP6beZxU=;
        b=Ho/iE7M4wE4bGhAsq5p8Ll7hDu1rYCO7dAAEOHvcuso7cKxFeHNlN78xUU6KYVSm/j
         txn+5MxQl8CIwnsluO83ho8mbeXygAtRvRzkqD7hrnsaDZe/3Gnlh4I0wJBgLaY4+BqL
         iGEEDmSIqSKVhjKK2N6jWWAwHchuOzTO6igFbbKiBvlttHk5VsJJMQYhRdCKzBT8unKf
         KLwudiWGuL+3T7GwU6JOM9UbW6kcVoIxbL9ywEx+qdHiR7xWzoUkjnRYgRhvIhW9Mu0r
         hCAJUIJi3KApboS+YnahEq+63uWO/pOUK35MOfla2LhkWwEdAfyJ09MVzLsrLCPigNbz
         mNnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYRqZFPysCxyR62FcV/0rgVFRmiAj7DnFtNqYlA4pZ5sTgTnJPNvRT1OJJ+xky+VyorWOp0zWAd4Pn@vger.kernel.org
X-Gm-Message-State: AFuF++nF6sPiFilj+3ayKdyOMVQ6uID/0fUkqN/ZG3W+BxO6KrA6Wjb7
	ravAL2fGgjMx4Ady61Ps7bBeQBr48sk+HTWFlGMqQrIWV1krjjPy6Gk3+y5hFpm1zD5uAOdMaOT
	JYf3kxfP+zi6gAb6gc10XFbN053fLnaZjDNk7SkyGHmwP0CLHxZcUKQxLjXIltIdv
X-Gm-Gg: AYBFou2hOv8zCrc+f05IgM1NEz9K500jJ6GhBNpbnLR3Mos9IE5aWDEqf35iE0A5RXr
	DJYYsShVvI+G/OCH8Jd+q4e1hmqg5LL8zwL516O1rUzNiu0QnmswVoReikdTmzfw1KdizRP6vRi
	opuZf6BY8b5puvJ8h+AJmLDBOr3rFJ58ixfXoYAx8JSKUn44IRZ3ntJ1hc3Eo+R2GdMfwwZ4OPX
	oGzWM1fpbnb4WalY4lO5uckyJTTnWfPPEXkprey5+KkeLBjCe/XmZXV3hyJ5pVcLgn8+qb2q4dH
	zBzOtyuhXkFisGwiWQmvuF0LGDSuLwGhSxzD/8feS1oUohZlO1gASNmvvPb7yXKnyK3oLmZzGUM
	w+ewrO1/ZoJn0/3BbgQ34gVUGiL2w
X-Received: by 2002:a17:90a:da83:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-396d0de796fmr49247617a91.4.1788244318100;
        Mon, 31 Aug 2026 23:31:58 -0700 (PDT)
X-Received: by 2002:a17:90a:da83:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-396d0de796fmr49247516a91.4.1788244317572;
        Mon, 31 Aug 2026 23:31:57 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm34010711eec.23.2026.08.31.23.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:31:57 -0700 (PDT)
Message-ID: <87244cbb-53b4-4deb-bf91-d5570879db09@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:01:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] dt-bindings: ptp: Document TSCSS hardware on Qualcomm
 QDU1000 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-2-beed14e72510@oss.qualcomm.com>
 <184d7977-891b-4d18-983f-7d23a7d9ff83@kernel.org>
Content-Language: en-US
In-Reply-To: <184d7977-891b-4d18-983f-7d23a7d9ff83@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PxD7vjRMf5HkREFMLQL9D4ZwjzespGN9
X-Proofpoint-ORIG-GUID: PxD7vjRMf5HkREFMLQL9D4ZwjzespGN9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfX0q8rWo3g700F
 NvwQ19QEjdt8/ONrm3lDUQe+7no9Lj9wHbiqCjjTGmVDfz096mHSK+b7zXieAWhiA0rrnW1ZSt/
 G+sZKJwL3lQ0rD6S4jy1p+Ne+YjGduw=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96715f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VFrjYgP8P-MpaLTDB6EA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfXwE8UOUtZxve0
 Sjo4sG6KbrGsxDw+8BwyDYIaWLmrU4huap+3aRo0kVVj2ZrtapMFBjmPwV91pvaX1zGsgD5hZhP
 a/LzP/1dgrXYkhG3f0/BelUp69W77zpNUf1j7aM1+k2eNYeLuqQvDs+KfySueGs+eutz2Tt6diq
 Vu6KmuBNI6X2uh7xVxxnv2yqwJzkLUNMBpiYZ+XKyzscDHfCyNYphfh2fgcRgJxhJW7laPoJF2x
 cVRoCYCghFXhQPQsjKbJRmcDB4qfUDppbnIyLs66OA/vOGQTnWoZ6axPssUAYaUuv1Npx3+4XCW
 xyjpdGSRN0i/0y9Z26LRynO+LWt8jXXObU3UmJnOXS/Rl8z69d1XeOhoUtGlKc5hquxGKA8EhwE
 SbHJfjAE/E2W8U/Jggi1LRxwFJyY0JnCasHF/Dv4lfcfaeQJcxO5TDFMn1x95Dj7/VTGtKe/6yw
 McEFazzyzVi9agfxtUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010057



On 27-07-2026 09:21 pm, Krzysztof Kozlowski wrote:
> On 27/07/2026 16:10, Imran Shaik wrote:
>> Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
>> on Qualcomm QDU1000 SoC.
>>
>> TSCSS is a time synchronization subsystem composed of two main blocks:
>> Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
>> provides a continuously running counter used for timekeeping, while the
>> ETU captures timestamps for external hardware event triggers.
>>
>> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/ptp/qcom,qdu1000-tscss.yaml           | 187 +++++++++++++++++++++
>>   1 file changed, 187 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..39387614ef8939b7840df2f0d5640b9e142fb4e5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ptp/qcom,qdu1000-tscss.yaml
>> @@ -0,0 +1,187 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ptp/qcom,qdu1000-tscss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Timestamp Counter Subsystem (TSCSS) on Qualcomm QDU1000 SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm TSCSS is a time synchronization subsystem composed of two main
>> +  blocks - the Time Stamp Counter (TSC) and the Event Timestamp Unit (ETU).
>> +
>> +  The TSC block is a timestamp generator that maintains a running counter used
>> +  for system timekeeping, and is functional with just the AHB and counter
>> +  clocks.
>> +  The ETU block is optional and captures TSC timestamps for external
>> +  hardware events, each ETU slice binding a slice identifier to an external
>> +  event selector. Support for the ETU block requires the additional ETU
>> +  clock along with the per slice interrupt and slice subnodes.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qdu1000-tscss
> 
> Why do you create a new file with exactly the same binding?
> 

The QDU1000 SoC TSCSS has the per ETU slice IRQ lines. Where as in
Lemans/Monaco, it is summary IRQ line for all the ETU slices. Hence,
kept two different bindings for both the SoCs.

> Anyway, all comments apply.
> 

Sure, will take care of those comments here as well.

Thanks,
Imran
