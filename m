Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794540905;
	b=YPEuZQGVVfr9w2WFP/2FTXknggtfc2s7GnbBQWNk1I+JR7IYvW6FKyN23ZBEuwpn1Kv1
	 C4SO6tscFFRoEJOf+RJTesRknsTLq8tix9MPbYLj49PYier04rWggGzstaT4Pv48h/K6D
	 VQvca4F4wA1oTgTgfYq//bfk4WfZIHYakmr4KpG/BwR1/iaXriGI472Sx37nUe5Vhk+xk
	 hd22NtBEwbAOyOjyPkbL+S1oyl2UIE62XTkxunU/i53Peil5naIhi9oe12iHi1h8Sh3S9
	 m3yPSaOVjtiQt4lbGAKBaRoG3vjRaBcL8keb8Lo1wLjnRYolINTPWQtbwHzFlH7ZitQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540905;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
	b=cW13FVh7LcnQ3SRwZu0TP1rePmQqkioy/CxTKPlGOXHy5E7lZeGuThfwTRXFiL4VPwX5
	 uprvITrzXL4V3SgnDX12lrg4B9BjcOLa9E0bosxfr/XKG1js2g3o348fO55AwkFnVdp4o
	 /Lm3ke4NEV7+DKpfo4gnz2LbTwwRvC8ERCPk28uZl0xXtDxmYpe3QQXBWRn/fw7LfGZJV
	 k0A8t4EbSRX/1Afunj4qqtNF/AxqQCI5NhQEDn95sMVXmLwYWS9Ez2VGvvGddL3sRsPyf
	 /2nMGZKyOkirqURNYoY879u8kfpe0sROQoEmyskxaq0t6domPGBbvQbtxJouUCwgWrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRnXIVRB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTaLV2oO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DF606A32A
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512DF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRnXIVRB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTaLV2oO
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KG7F2179923
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:35:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=; b=gRnXIVRBJDeM8ySw
	aPNieEiH7Q31za35m7BrDXSXEwzVomjsjQmGkm4/SgoUxgWkcCtfB99OQ5Wlez8X
	p9Avu5YAaCgt5F/3mUxfJKrMz3MVgU3cglt6YLqxcYi4++JGPGeE1Y+eNB1RfbiF
	IldTPCGIsLsb0GZL+cK3UUv/y2gmhXNyhvVqhhvROtlbLIONAp/gGQOABiUI4+ly
	+eSxZJxnhnrFlgzT2lAyrrN7M8gC+r7K873liA/SHsrV+fN8oTsW70bHscT1jGgG
	Jav1fzcVOB5XlpJ6DVvZSPVnbZv+aDbbCyjNq3plOrf3KVAuTOtJFOQCjQQRstLe
	8ppyDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yumdpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:35:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9995cea88so4500175ad.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 19:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794540903; x=1795145703; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
        b=PTaLV2oOe3UKjSpdSc2iI73FcRNBDEWGiPqwIg+uPoJjTj9JmjbHf5BccxN3dpSgDK
         YRQYmJ3P9kZDUMYkZG/JBG6UB9Mg8M/B2qJGCP3PvORsfJOcPknJEn7hYwiTDYz00RS8
         GcBCrI/eGVqXgJa41vBvnvnrVqUdHHl5tdKQgO62tbZ7zaGjCXG8jRLY2KXpEg9Cafyi
         F3rRyqiIzDyJ7lXZmhRFwkkTFH1ZNEB2Fx26g9t7Z56eLx1hthODRXG69Ro6i97bEMCk
         TtXb9CZ1Vi+AD1Mj88XbivvmOrKeaVTVudNJpl9Cn8tEA7Zu66pEIXMWu/1+8VUyuAtr
         NWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540903; x=1795145703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPZ3HOktLUKO7C6+7rK8PWwT7CibQnKEc7TizM3393o=;
        b=Ac7xvEcwmlJNhWwNNzlEDkCVH3zSFU9dMN9mpcz0Ygph4cjmF7yy5gbqiTlKyKdnH4
         oQh4nKuSaLFvdc0C8eoaylfiZYiN/OqL9u7bJpsxD1+ZgiCkC2Y9ATYCOhToJfsXUI+r
         /sI9nyvcPWhz2X7E1or4DZUjzWglJVESGjiimz/4SSYBp7XgCPykRq7KEAuiDxPQ3Tz8
         BEWfhtBNQybbkTRQP0YLyuCQ8MXsfIMtN1jOZGsNmTSbtqMbqwS34tnhBmv75N4RIzzy
         nbRcAnpoGq+kgCwzhe15Cg9UvaHRxv/1wDdI9IEaqYatLDJYOpmj08XZkGcl6jwSTrRg
         i0IA==
X-Forwarded-Encrypted: i=1; AL+hErFRgWI1MEPTPBGxu7wv9y6pkBrPAbhN3++8z4wmGfFZQhAFUrKjKYpwGt3WIfpZeOCb9fKxip2yd1gK@vger.kernel.org
X-Gm-Message-State: APuU4Z+UeEDygtPjR7BlVxgVdBPnQON8zP8rj8PNQxMb73f1YyIQ9ofg
	NYhptGvSiz2Wzew3dfaBD6GcL/L0y3QtT1OyanRzlmTzy4pXC9m62IB6IqIb+DmiWmmGOqEPIxu
	1vXbkiFg2tp0EnvDoTBY2W04E8O1HEXPSNjBuAEh+x08+wyEHhSZX/qWTvYL2ID0N
X-Gm-Gg: AYBFou0QfxXf4Y/lqkVodI/IiXMq3a77iE2Xp/aLdHJtjuDuSnocwoZIhyCZfMemBbN
	qz5L0l2sCNYSD4rFdCFLMLIhZancadTDjbsllbil5TQ3vhwMccUcJWEGzRHiqi1/ac6H7LK/qJY
	sePIETdIgETnlSxk2Tp6U6ELPgVulLb+zQsN/zQR/nZgLoR+C/V5PM4qXg+9SBsMiseogkNyx4r
	FIP+WgFoE55ImXEsXL2WP+JiyaJf2uJLjvxyUMmFIjjy9tKUbUveexZHzF6ofTXoum++e2d6llO
	ozTCaHhAW/H0rTmA707ierv7S1KBLz6xn5NtOeokFHwr7aMPbFQqaVBLiItDB5I3DwsYlBlnKrO
	MCBmUb3RX8S33UpTZGkB5jV54WjfbuZJOnsYxZT5QJqWScoZqEcz4PvbDo13bum2Bbp+i+g==
X-Received: by 2002:a17:902:e882:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2ee0da31ea2mr13290155ad.7.1794540902709;
        Thu, 12 Nov 2026 19:35:02 -0800 (PST)
X-Received: by 2002:a17:902:e882:b0:2e8:3d48:4d88 with SMTP id d9443c01a7336-2ee0da31ea2mr13290065ad.7.1794540902273;
        Thu, 12 Nov 2026 19:35:02 -0800 (PST)
Received: from [10.235.8.108] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e4e47sm3464175ad.38.2026.11.12.19.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:35:01 -0800 (PST)
Message-ID: <15996045-3f5e-4680-95f9-925c97301ab0@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:34:53 +0800
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
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add NSS clock controller
 for IPQ5210 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        netdev@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-1-7e2c1dda3ed2@oss.qualcomm.com>
 <20261112-wild-accurate-cockatrice-a80efa@quoll>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <20261112-wild-accurate-cockatrice-a80efa@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RLULzlh2-tjLEAsZivIaqZd6ypLfqQC9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX9HAc5eV0pC7Y
 vcoPSpAh5GFwk5tJOJyjP3k8ZCod+wVb7qWJGRm1st2hVxvTIsRBucn5T79mfFXn9By8zadzlam
 PhY4FMHXqszg2NOXAnRxvmzDMYNhZ9A=
X-Proofpoint-ORIG-GUID: RLULzlh2-tjLEAsZivIaqZd6ypLfqQC9
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af68567 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vjzNbMJ68Ufz2hOSJBcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfXyykCprrA6kd9
 U9TKGdH4UyZlZOMgpzTQKunuW5AuuJkc5gSr8YF9MTwGyKd37jQYXu0zitGDMNoFDujWxOcrdjs
 U9FB0S0bgu6GXF0huyfpuTtShzPovVIij6rChtRVcNqqGUaffGxbxBcK7JPbsSc1ggYnsTg+8hE
 Uk/li1A+/qVXapXSIYEHQvHRxaJIObXTYk7t+2NthuJt6ZfEB5UTfIHjm5M+LhuAbvihJSCFFYa
 rR6S9pa18Plgec/ITBy2H4Sk+vxGGI08d+je69Ct9gIXA06isOauoDgMBXgSiGPCOCeCtKOAp29
 gqjuPV3ObwRnGyslkWfchhaxHx50W6TQcWOy67HLpty0MvUPdulBCr+OVLRRi6vG/Y22Ktux3+V
 ZPuKA6nDq5XkSKyieIHo2qb67RVktpAC/MQdOZnSDw+1RDsGoJtEVaGUBJxX+WfO7mWjKLfo9zv
 mYHbtT+x90H8uxOaaHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130014



On 11/12/2026 6:57 PM, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2026 at 02:00:55AM -0800, Luo Jie wrote:
>> NSS clock controller provides the clocks and resets to the networking
>> blocks such as PPE (Packet Process Engine), UNIPHY (PCS) and EPHY on
>> IPQ5210 devices.
>>
>> Add support for the compatible string "qcom,ipq5210-nsscc" based on the
>> existing IPQ9574/IPQ5424 NSS clock controller Device Tree binding. IPQ5210
>> additionally exposes a pair of EPHY-RAW Rx/Tx clock sources used to derive
>> the clocks for its integrated 2.5G Ethernet PHY, so extend the clocks and
>> clock-names lists with "ephy_rx" and "ephy_tx".
>>
>> Also add master/slave ids for IPQ5210 networking interfaces, which are used
>> by the nsscc-ipq5210 driver for providing interconnect services using the
>> icc-clk framework.
>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,ipq9574-nsscc.yaml         |  47 ++++++++-
>>  include/dt-bindings/clock/qcom,ipq5210-nsscc.h     | 106 +++++++++++++++++++++
>>  include/dt-bindings/interconnect/qcom,ipq5210.h    |  18 ++++
>>  include/dt-bindings/reset/qcom,ipq5210-nsscc.h     |  60 ++++++++++++
>>  4 files changed, 228 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> index a35bbc7b1924..dc7d90a99dc7 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-nsscc.yaml
>> @@ -4,24 +4,28 @@
>>  $id: http://devicetree.org/schemas/clock/qcom,ipq9574-nsscc.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ9574 and IPQ5424
>> +title: Qualcomm Networking Sub System Clock & Reset Controller on IPQ SoCs
>>  
>>  maintainers:
>>    - Bjorn Andersson <andersson@kernel.org>
>> +  - Luo Jie <jie.luo@oss.qualcomm.com>
>>  
>>  description: |
>>    Qualcomm networking sub system clock control module provides the clocks,
>> -  resets on IPQ9574 and IPQ5424
>> +  resets on IPQ9574, IPQ5424 and IPQ5210
>>  
>>    See also:
>> +    include/dt-bindings/clock/qcom,ipq5210-nsscc.h
>>      include/dt-bindings/clock/qcom,ipq5424-nsscc.h
>>      include/dt-bindings/clock/qcom,ipq9574-nsscc.h
>> +    include/dt-bindings/reset/qcom,ipq5210-nsscc.h
>>      include/dt-bindings/reset/qcom,ipq5424-nsscc.h
>>      include/dt-bindings/reset/qcom,ipq9574-nsscc.h
>>  
>>  properties:
>>    compatible:
>>      enum:
>> +      - qcom,ipq5210-nsscc
>>        - qcom,ipq5424-nsscc
>>        - qcom,ipq9574-nsscc
>>  
>> @@ -42,6 +46,9 @@ properties:
>>        - description: Uniphy2 NSS Rx clock source
>>        - description: Uniphy2 NSS Tx clock source
>>        - description: GCC NSSCC clock source
>> +      - description: CMN_PLL EPHY-RAW Rx clock source
>> +      - description: CMN_PLL EPHY-RAW Tx clock source
>> +    minItems: 11
> 
> Please place minItems at the beginning, before "items:".

Thanks, I will move minItems before "items:" in the next version.

> 
>>  
>>    '#interconnect-cells':
>>      const: 1
>> @@ -63,6 +70,9 @@ properties:
>>        - const: uniphy2_rx
>>        - const: uniphy2_tx
>>        - const: bus
>> +      - const: ephy_rx
>> +      - const: ephy_tx
>> +    minItems: 11
> 
> Same here

OK.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 

