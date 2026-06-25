Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776ED2571A9
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782373015; cv=none; b=qAX9aJyMJ7RQiF6ALiuOQPOBLfXlJnDvELE4NymMw7++lwG0uyhQXuku7lKBaFzdF5mpRdfcPuZu8xqtnoy2TYm6Qq5dDmpm6KH4Rt1AKuWF0+eZvk06xAERmckFMDzr84K9uHRGjCWHKMRuvNtxpg5YiNjIsO5Wtb4QEEoPO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782373015; c=relaxed/simple;
	bh=a8LlYyp3Iz1nyWVPv0kBR79YykpbSiZ5HxSJbixBaIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1igDsBBqbf6uD61NCeP3aM8wUFaVf1QFAjmvo9xgtsJeCNomM13nnZP6o5xaPjwh+F3YiJnm/M9SNm4LK3tbNnxwo/qJKk5Em2KC22t4OPHyNC+sTCTarf1hLhhVq/3YPKsMdnwWFIceTiLHXRW+GPp5QNHdWEtD6sw2AJjVtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSUGFZuS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BhsmMtc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSUGFZuS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BhsmMtc1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P460NO994197
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=; b=GSUGFZuS6UZ4eWQ/
	WknD/a8T+dctpKkPDKJTOJTMNWn0T6gAlaSzlsl5MvIyb7S4y3TcFlOt8W/8tlQS
	i/eKln6AlUmI+eq4miihoRslJATBy0CCnofdcrs43u9UJezXkTzHHWRAR4sgec3D
	JyaXkeAr/XEYWKHt7DtBkGuFMDmlXtXxxXz+bA29P5AIZIcatR0Khyj3mcgrRwdp
	GziDPEUWRf7A8XdA5abU2j9jyROynrjtMuArClxnXRcTobWV9d25pZqPA+uVoD0G
	NQ7Y4Raso+zGblqO5z+ADBSHY/ZTz1YNqysAdGjCUIrjC7MMxl8+bbc5VtkcOYS3
	P16Zxg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0w0q0p4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 07:36:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1270768a12.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 00:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373011; x=1782977811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=BhsmMtc1w8It6V94STRybSCBLpHVrTZPhJQ7aPkqR85yDmQy/V4bGIJMt0X9q9o23z
         SPJxx5RMreCqn1vTEouelREirqVWq7ZWe4pjoC3uCQEoLNPzjxNXgvBOtF2t1grlX9rH
         /d6U4js7j5gaRKv3NJXNmU/cIIoP3ll9c5E7NxfbaTS74N7JH49lQx0wS2IyvUhwzHHJ
         AJ9L6M0LIDsjTalutMYB1j152K8luq0KimEyCezGpyLEJZPzpB7+pYUyT6I7o84NYG7f
         7LmjSkf4LRcwOVkWDDchYMQNJmzOxpAam06hMklTLvxctySQRNeG5+f3Qcuh6c0ue+Ra
         dR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373011; x=1782977811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/g2z6S4UyNyvA2VwtSLOaDO3I/HgkYGv9hdKRgZsBA=;
        b=ic7nEq0TPCMUTd5Gb/nRBuyHUcpTvGnOF/ZQcGoqQhfw0TCwYN7xsuoln7/hlBkz6k
         1256h1hjA8aBkxer4ZKp/iGDq6yeboSVM+vyfC70qyrJndUkkjie/aP6VlmpLT7oipQs
         yZQWJyjMmlMtA8yjHTvuyBw5JQFBTKQB0Ur+pzurRaLMBnZIAS3DTy4OIlUE8I1mVOuY
         2N3DR2fLd2LYTh1wHAmsQdvn9vuqdRmM8mI12QA2lPGJQj2JNVijEYwgrP8nuKS8+rbf
         3kM4OIl/9uFcrBfPjWBHFedUYhb5wSqnqGlQHL2Qvcx/k8CBZj8+5AWtucG4H5m+X7jK
         2tIw==
X-Forwarded-Encrypted: i=1; AFNElJ8r5NJFlKZYZElSWl1ojzg+udKSDyZ9YYlm1eA8RABbRtuDLOZ2N/MXQW7O9C2mX38KTUrTtq6Tgw2B@vger.kernel.org
X-Gm-Message-State: AOJu0YzmWqbgQSpQDvN4GFTHiGAfg4d0fDq8+Ikjxp6I0+osHSLH1KKt
	46nV29hkF+8c7qwOCoYQCQz8FTCu/vwpXkrN6o64vJC3It4pQhKYTF6af1CcwAYFbBO5BeLLBHr
	8earckP2iWcjclPjkeRWGAAmnxPuuHbfJBzglxhCyQibHxFM3dYJd5uZYW6XduMiD
X-Gm-Gg: AfdE7ckKyInaMV1OSgEclHhsg5srJBNl2RIOp6piOO3n3MMY1Iw2v3fbhSZvQNnwT5A
	lOc3vGCznACjdmZdXoMlxwkzXh4OydCosawa5ijTNET5Op4o/zYZxwt2UFhNJ/V9rDVmkdCRSs3
	SrzfL1LuDKMojQafY/zQ/gJUrNXY1G17C23sH2MoEoFyJynsny/1ce9VSdmLu9RUy6kJTYQP0nD
	bL7tND0Pkwogfp5F+eraoStmJCy4CF/fg1CbwLSzzf+Lz745wY5cTRntI9s1SMTwtWuudbUkIMf
	UuwBi60U3C3TVQlRfLlLZJtEYZXvDgG/SLz2lgUvsL9CEGIO/24p4X3ITu4e2+K8DPzc57WOJ0f
	V3opZc+ivWDHn8fA/alcl3mHZLkHhQcaxz83/DNPMYryW24humjupGdEnHHmnLIW3py96CfrEOm
	OC
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907848637.43.1782373011212;
        Thu, 25 Jun 2026 00:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:3991:b0:3b3:1a00:1f4a with SMTP id adf61e73a8af0-3bd4b01fc54mr1907800637.43.1782373010634;
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Received: from [10.133.33.237] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm1180072a12.9.2026.06.25.00.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:36:50 -0700 (PDT)
Message-ID: <e7fa9d40-8efc-4b1f-97ed-cd1e98ffdd2c@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 15:36:42 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom,coresight-tnoc: allow
 arm,primecell-periphid
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-1-786520f62f21@oss.qualcomm.com>
 <20260625-strong-daft-pudu-21471f@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625-strong-daft-pudu-21471f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HnZBl66Q_FJf4EKVwWpTo9AGrxTijoef
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX1ZBDJsKM4JmE
 q25+mvmE0kwC3Yl/e3ZdBpjOv0wgCF/m/0sJXNpnEqZVY3+ezDEQCAHac4/nUXO0wAiteehSSvr
 wUZibztIMys8ZSCVGlu0j2M0sJx7tiQ=
X-Proofpoint-GUID: HnZBl66Q_FJf4EKVwWpTo9AGrxTijoef
X-Authority-Analysis: v=2.4 cv=R6Ez39RX c=1 sm=1 tr=0 ts=6a3cda94 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6mFE72AEMYK6sz6dviEA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NCBTYWx0ZWRfX5o5BrZ9LkWos
 I11siftGa4+KkzaMhdgouzLI0Dnmxt/+36YGLD+tskRBKIZCA12EB94/gWYj2fHahFjhJh+bvf1
 j3ANMYjjDWHijCHQp7Fdk4gAFW9+qJF2PX6lgZAfYeNuWL9vaUXsTyVinsEB4bOrWJiQHJOTkPU
 5GOkhSHFNTU8MRbX4GZrUj3ra5rp+FTg8/xtpWrLPfh9VYq3FFO4+Qsn0HCgHm+qu1azvjieoYR
 sgLRQwG4ICGquPmdaMyBBSVhehTPSkhrdKXJ9qhHelNyOw78kNP2HZZJt3ZR7Im73U45tKO0Df6
 Dv/gPRk4ZIbkMTrQR/cwJUplcijdQtkHHoSuAOEQGVqFIbjnswsbevuGvRXfVUTXRxSXKrW9b+e
 Ttlj9XEprKQx0nRxL3ldz1pkTiPesXjOf0BMzNg9C11Hxl4q+jz/k5pb6M7B33CBY1EaeHZ6afV
 T5BLxY6aL7GLV6MSdOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250064



On 6/25/2026 3:24 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 24, 2026 at 05:49:25PM +0800, Jie Gan wrote:
>> The TNOC device is an AMBA primecell and may carry the standard
>> arm,primecell-periphid property, which is used to supply the
>> peripheral ID when it cannot be read from the device registers.
>>
>> Reference primecell.yaml and set additionalProperties to true so the
>> binding accepts arm,primecell-periphid along with the other common
>> primecell properties.
>>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> index ef648a15b806..9624fc0adfdc 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -32,6 +32,9 @@ select:
>>     required:
>>       - compatible
>>   
>> +allOf:
>> +  - $ref: /schemas/arm/primecell.yaml#
>> +
>>   properties:
>>     $nodename:
>>       pattern: "^tn(@[0-9a-f]+)$"
>> @@ -78,7 +81,7 @@ required:
>>     - in-ports
>>     - out-ports
>>   
>> -additionalProperties: false
>> +additionalProperties: true
> 
> Nope, it is not allowed. Explicitly mentioned in writing bindings and
> all DT introductory talks by me.

Yes, I am totally wrong with this and I should add:
unevaluatedProperties: false

and remove
additionalProperties: false

Thanks,
Jie

> 
> Best regards,
> Krzysztof
> 

