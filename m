Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792142;
	b=ll06QFMvyyRqxysbRcB7pz1vWT63RJKcNuoXPoBY4QIXij45JT4kGeBYOJEkFG9cjNWu
	 uhuX98Vt3faQrYX8ZMJZZ+iltgmtXv2MlrUMtda6nxxkpyMjXkQsp8g6CH3N2oAPkm7Ar
	 3NqEZ/tJuPk6hGMcsM+/2Shs/Bf3padLgTX8Pg89qbZp58SEnZQSQVgKCk+Axgrs/pDFj
	 yrKJt/MVIzHQaKous54dw2s0vuFBjBe8Gv6ws64iL2psaBSSw1pPWJXEEXitpcWPWs6rD
	 SHJu/hS/OtZz9eHfLr5F4ywQvhuT3QY4Gq1UAvFCV5KMxYHekH/PCMbtEbxs+0vyizw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
	b=1lM3iLTaxZgbw13Bk6diYaWAhLbcsxBGkA/l/6gPKcHGiZogbaRqEylnCTlDjJbCOp0Y
	 AA1Bg1xnovs+oB+vg9QDnRQmGNJagOYpFilGr4q/bTTTjFschMmROmAzx8GtACtzVsddp
	 bClhNGq2hPRFMF3VyhnCzLhCN3Dg8zzOn9tp7JA9JceE50ZTwRkGzbSMYriwYD8w6n+c9
	 rBokcBRmRKaSpODpJXJbp6GPgnVqFrRvc8bqlWfQZDVf4pZKh5e6g1uik7RKItWf2zWVh
	 so/vmL1egmsJlynl5rs8BB+8h+H4NIPo36OZ1Rhu0vS+hknYUletPOjRQB+KDdQzYXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87787606A326
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 11:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87787606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ck02Y+UJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NDuh9B3F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4B5Sgo2243087
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 11:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=; b=ck02Y+UJvwJSSmFS
	M55HtH/FtnsUGn9Tbee4EBYAz+jiBvjtOuOhvidebv/aZCR4K9F6bFyWTu6Tsg6q
	eliAVRowRn4LyU93XUJbaX2uTm6MOITccmE+N5GYNH/sp8PrnDIwCeitpIME8rKR
	sT6OFiTlqGJRVoamGQ0E9B3f9UVC6RklxeUyjcyRQnCnclYS9L1IXK9Y/271a4tC
	jwTwMQX7G+KkBv2ulIFSZmN/ql6UJ5f8THjzCGWBSrvEMD+8ksvwo2mOfr7Idd4B
	Vw4cytVN6dqxdtlS9Wit2Q89X45rz6VtcI5TqXAnKanyuOfAvzqPYEUmfJAaXCAZ
	OAIliw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mumh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 11:35:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed08b07232so5823165ad.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 03:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793792139; x=1794396939; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=NDuh9B3F8w0RRQbk4DOFCTn6/pF/Q/Yc63kQVlkQXByE6x0t7x2MSnPnWfoOxkGSQF
         dF0UiccXhotfXe/MF2aS+8uyapCV9O2oojioOQZ+UwjoQSuZoI51pVqlKPeOpsr7iu1s
         prslK+7+tIp6F0Tb9Oxhl6xfmUkr0VQu+Wa1gGJUcH3e5EIO6M/qmSuFcw9HrACfCW6y
         c8HYiPqMO3V+IGm/z4TRhT5Eahk5zVoDME+6IoaZj9+oGkTuRCGDxudetjDRcv5Mhypi
         ly8WY8VL5Qw8uV5XRrNPmNX/2B0trrXe16JJxenzmNeYPbHcX5G33FUuievp81LFLZa2
         Ym9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792139; x=1794396939;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txitwvcbrK3UUlmG/sF+VNbr8sls515kGNNrpbN6uNk=;
        b=QB46LjDsXq6VK+aZ7KvpwARa7HkpRW0fyPFp8ZtW15sCk9wur0uzxqQw0Qe8adGsZr
         LrlIzXhEHxICyGs/SDWiidtySnPGlplJQAht7ScUTccb/y6XW79WYMTT7ppt42B4b4Ri
         /+i8Okn+7ZaNLfSKASV7NuN9dvlhiERVceFMUSB0iJwzFAsz6wp+2jWxwl0152iQ9G2i
         Wbo87riJmJRCjs26WgYiY7Br+V0r3oVGwe7CQxT6kFEUSsOcZoJMeBqZZebaOhS/RY6q
         PndAaq8MQ6Wf6X2OIOWJDd7ocBvAfnisqFfA4oNCHFsND6R4641oeKcH5I1W5yO9SI2K
         sTGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzFYUYWKInCCN9vAf68gL62JfzKP8qh8LFev26nMa7dr3IPFm5CFuncr+uUmBhV60S1guOaL0MZpZA@vger.kernel.org
X-Gm-Message-State: APuU4Z+aStpO8VlPwhzdH6e36ESCFh5JvoeYuHh6zNUWAuW2P4Oz3oUR
	TCr7kjAeu1gxIoKYECzFZAoeayxqwuTV1U0cpdS9+wdtsAP9KAGXvITF4FzBFkxhKlCA+hmMY+Z
	nRYQoLulTcNz4XKiAy+0oZ3+nSnpKBrgHuw0nN3MTX+A71x8QcwmJo/LKB5xKNbGX
X-Gm-Gg: AYBFou1UcIX492jWB8tmgI8gNoNpVUkfn3XlTFNxIhLdlt0c/szpFoFL2kh6zRJMMJo
	NbYwxzHCM82uvqsopOrDHmvtB8UodLCJ6UUXKAw8pEEk3LZUwQIC4RijgAp+PemnKgGk3P36/qa
	KlkH1ZFB+3FuwVpf6AlYuLSkQdPDvIPCwBvRABsFZAU6QJNb5lUipodUhGHpYMa8/y1246DO7qS
	ND7NcazgV83NHi8HJ0hwXK55hy5xF4YIdxA1VtVQlAcrIhqbRXA1t4YvCqLLdIOYVIRKNli2QCY
	JPVtz7gfmQPyDjgEjrVarKEdXOFB2dG9HlArUnrDDYKaIcyic7tUQ+zPUs5EPRKwU/QeRWPd708
	km/5N/nx1WE2hTUcNhO+9n1aEm/FFsGQyl8IqwR/RCnkiwRFsHt7uYquMdO5jj05LK04psuiGyH
	w=
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142899255ad.32.1793792139075;
        Wed, 04 Nov 2026 03:35:39 -0800 (PST)
X-Received: by 2002:a17:903:388b:b0:2df:9d04:403b with SMTP id d9443c01a7336-2eb364b5c40mr142898975ad.32.1793792138559;
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5845sm6106805ad.2.2026.11.04.03.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 03:35:38 -0800 (PST)
Message-ID: <402ecf6a-357a-4404-985c-9540f6851f8e@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:05:33 +0530
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
 <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
 <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20261005153737.opzzuflsioi6cxqo@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ah7Igyv3FgX4l4nHj6UW9C7enijyyEkx
X-Proofpoint-ORIG-GUID: Ah7Igyv3FgX4l4nHj6UW9C7enijyyEkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX87mr82Lgd57C
 LV4e1H6Nc4Nd04/bp/hnZ7MC9g+QTPnYZBKtipn6yOsR1AnyBewy7aquJfBUXgauI6fRM4XyKpu
 xgdKqYbBDVpBrQfjNArfhhA36mBkLIEFZtN/Z6sq9RLiB+PsMfeNjq3o80Hw/XiVhDTD5sXrK0H
 ukx0+UMI8thWCdj3q+2oVorNSGIRq3frtgqWWuhkaxm6P8DgjMxmPerlanr3lpoOdx58XeMq/C0
 rb57W2K+9Y0FBxL/0F+nxKweYF4NOUXxpWIn3pySma3SfbZJOpSqzVHzbDxUl3YXNxHDoHnHaRg
 ycMvuVyp18OKKjh/jItYWD5ioVcgCsdhQ+lYrDtALdIEtEFRJ7q/8pKO2ZxHYKImB5h3gGfuVbA
 Ho7kuKqZfE1y9LsGRm/NNiBJy4oKbCk2N1DZT0Cue1N3Jyj7Nv+DyPeJWVKa/rsGeBJB75MOzhH
 tXiEiySoVfZOu1JagxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0NSBTYWx0ZWRfX435xgaY8c5nL
 ma18glHJQqGPlOVfvKZAqIl3t8Lf+ep8mlmeE2cVgDS2TcAg7z/9tNYFZlBB4dTh0nEpi3fNm74
 SQHNGcbPYx8/L+dNuTQVkSgVvvyGI3I=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeb188c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=49plGf3O2Pee3ShZFYoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_03,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040045

On 10/5/2026 9:07 PM, Mukesh Ojha wrote:
> On Mon, Oct 05, 2026 at 04:44:45PM +0530, Komal Bajaj wrote:
>> The Shikra LPAICP PAS requires three IOMMU entries. However,
>> qcom,shikra-pas.yaml inherits the `iommus` schema from
>> qcom,pas-common.yaml, which limits property to a single entry.
>>
>> As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
>> with the inherited `maxItems: 1` constraint, and a valid LPAICP node
>> fails schema validation.
>>
>> Remove the pas-common schema reference and specify IOMMU entry limit
>> for each Shikra PAS compatible: one entry for CDSP and MPSS, and
>> three entries for LPAICP.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> index 34a2f15e9361..4196f61a8ba0 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
>> @@ -32,6 +32,9 @@ properties:
>>       items:
>>         - const: xo
>>   
>> +  interconnects:
>> +    maxItems: 1
>> +
>>     memory-region:
>>       minItems: 1
>>       maxItems: 2
>> @@ -92,10 +95,14 @@ required:
>>     - compatible
>>     - reg
>>     - memory-region
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,smem-states
>> +  - qcom,smem-state-names
>>   
>>   allOf:
>> -  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
> I think the right approach would be to remove iommu from the common binding
> and let the corresponding target put the constraints.

Agree, that makes more sense. I will move iommu constraints to the 
corresponding target-specific bindings in next revision.

Thanks
Komal

>
>> -
>>     - if:
>>         properties:
>>           compatible:
>> @@ -112,6 +119,8 @@ allOf:
>>             maxItems: 1
>>           firmware-name:
>>             maxItems: 1
>> +        iommus:
>> +          maxItems: 1
>>           power-domains:
>>             items:
>>               - description: CX power domain
>> @@ -134,6 +143,8 @@ allOf:
>>             minItems: 2
>>           firmware-name:
>>             minItems: 2
>> +        iommus:
>> +          maxItems: 3
>>           power-domains: false
>>           power-domain-names: false
>>   
>>
>> -- 
>> 2.34.1
>>

