Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E249363C
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787329780; cv=none; b=JfrY+1ANkCL6aAPqKvoW0RJDWoSV+T5RO2j8pPFpI4g5QeQV5ocuN2MWN/nz3ErOmkAgg3xF5TsO6NcChhcTWqQLKAeHlX7HSJq19CDm9jmjbZY6Y9QdCtnso9bk2qZY20U5F5Y3uft9XiKEEBimSx3J4B8iv2clIMPsqv9o2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787329780; c=relaxed/simple;
	bh=vXZYcqQZ9G9e42lPAVUa4zO9S++Ew89E3Yen0oSCoIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFhH05iuGaehJrgmMHsdb32KS0G7a/6EXsH4/0Gh5i0O3HpS7vbRXiQsBhuJqS0YlUVSmT9QXqZWJi6P9ESmayvofvVHCbk/BwMV+W8u6O3khupsYDKu+q5CO6Re2FmuhAj+iaoit+f5VGKdInGglXvZvi7SD8Tq/ILyNAH5c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnVFdtSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEfW0KoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnVFdtSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEfW0KoR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmWsG1641191
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=; b=DnVFdtSWrIC5Rfut
	N+aZ9krtfc7J5XCZZThi1NTJzZ04Q6hGJWFZSgAhV2EBfJGJY49ptTfOEnwc5ifi
	OQiTqMc/FdaHgScsptGPd2oHTVcgIKmmRWYBnw8QcEmycGSQ0EB6rOLb4vIHvTgx
	E9R1metkVKVlDDZ7/o44EiNi1nFGpf1rrvXOdYe30yqUQKordhGNOhj8O1h1XZ6C
	REiaXEKL28pCk7fmy3R9gHCT55Yv+Gz3/pJYnESWnKQW5PMBoy71IST/8rXLmo0o
	vpgBDmbmAhTeaLsent2m9+yOJT+UzEG6WB4obSQchFFgoTxjpkEpJEz+LB6h9R/f
	gvX3sQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebutwdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 16:29:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d827597fbso14714101cf.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 09:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329776; x=1787934576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=jEfW0KoRftKx6GZI3xWFHAHG1dQS51bR8NtXK6fM4DAlx7HdC4oOoNWKcUuA1fRdPt
         50OZ8WxiQ3xlGvUqVMwgc1ZKIlarOCS3ucfX3nC6AZqQ48OehGCg2+S8iOc1lgRZNTtP
         zaacijHyQ0V1UpJsz2acv8hg8itfyswhWq2LNRmUGB3ul5yR6ZQkAhe3Xs1orj29rxVn
         bCB4CteP75P1Fu1l9YA+Jqrjns1NqwhoIrA3TcdUOyNmgmGsLtUiDWmyz/QTREhGOgUE
         1xqVTkHCNqL1361nCxYwJ0pe9x2/SkVFXvC9p2WZN2LeTslAgfv5YCSN6dsiseG0uN60
         7VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329776; x=1787934576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=bdSZdSFCkAh5MCWEbS0cGMqphWzwb7Vi/N5JQMcDEB9/BFwAzNQL2bLDRGwUcACswF
         APDOxm+Yq2pxFit3TeJAPYszzSraghY9hseXPLR6A68keUDfCxpcMnjRu4ynVoBwuHzY
         B7KdT4Kyy6SDUmorytKDa5dK8HOpvlQwbz2skDZkQPKtyT2PL42CJrKXLbDlQCOp92ci
         jEey2CGm8YpT6D4Stk70KoouTfiEbe29/Dj5xJsZKfkYFUGXenWEG9mpowovNALUSD7j
         TNzor+Ar7/Dzx3qa5T/lHwiWjGyXfjqAKvfvIkFP2nD7HBgVR1I4XUW0Dop2a3kuTEie
         gFcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmrkCWghaseu3v1gwZnwrKeanKuHKrpDWvSNL+FpyT1t0C4oVLgWDeI2BBGlGtThBCAxnOhwuiy+Dy@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKCVte+widaS3HQszkTeWAXEhtBw1DsToyrAn4BXwfxY3Na3Z
	RlDlMBRslcibdSzzX6CEKnN/YrfFUkAEQHuFgfVVBRa0QJtK8IJXRY3P81oitkN7UbNlZQ6pAvZ
	jEY7e8NswfpFEjWYph4/99Cgs569QzmnCStT5EJ56CgXt8ZsOapJK9isOxziqugk3
X-Gm-Gg: AR+sD13Y5eO3hS/dKutz9DZphcZY6lxPnHqm7leAlCEbA8KtrWUpQwGOEuxr5Jmub1F
	S4DmByt3o7kPa36yEO6BB1ykb0zG+v7qmLnse8a7YlCU5OqxtfpYqvKbbadLE9oETDtMWqhUUsz
	wxnstshdL6wTQMFZa6rXVy3TJknWomU7YS+lzTr72E+DNHYxqIQlAWrNwK6cJvMvIEHPSHaR0s5
	wLtdnj1pEPC5KVqXltj3R5zN30KCAz9MYrJhRWiw5DTq7qtZgnThmmVQqyu9r29e7lMK8WWv8ex
	cuo0XPemvrF4gDfWm3mbSOJHDUaIRRECh8kJG4hvlY/hDG+uksazYDF6UUzU7AxzvYE064hl/jq
	+Q7d02MGf4SO0hdp/MdF2oP99wDImmDqJ
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188551cf.23.1787329776274;
        Fri, 21 Aug 2026 09:29:36 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188021cf.23.1787329775827;
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eec1f31sm66561536d6.13.2026.08.21.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Message-ID: <3f92d72a-9f3e-4149-b37b-e138bdd86050@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:59:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
 <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oP2aG66WtWvf_1B5OUXyvXK5xv-4GtbY
X-Proofpoint-ORIG-GUID: oP2aG66WtWvf_1B5OUXyvXK5xv-4GtbY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfX8yELB88lSWQP
 DK8U6URKKqlHTQFJdBGT3DiqNRO/C/+0wBfuUguB+oJ6Z5PTRTMfWhN6mx2eao6RRtTq3/VEnK5
 dBBziggi1AA2uGnR5/UTcZx3ZR7e4vo=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a887cf1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=acOcqc2iJ3WRxsWVYcEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfXzbQ/fTdHKYbt
 a2ssImWRlEdCJasHwSCX7hksgHUP9fhbCVHFZsi/tWr6IRKfMDj82Eo0KL7I2fSDthkXXxUCuM1
 OkCwg0d8oc5KFfj/+vkzhllExO0k6HxX8q4gazI9zFTHxi15NMnH41ZCKsuaU2kZtG07X95hSCZ
 A1cQkMGHmKnTHV7TDsjWfUOzlth1xr6jVnV1QgwTKbE5UtBf6B0iOw4BUIr74WYcchXB7eoe8nA
 3NM8b3S6qp/NkH1s1uXkofWprdDLs4WMb5N5mOIeSIp6YdLh/SBQD09sMVnOEXRWQd37swfWsya
 idlyNmWbvDj22qEKtCZ3/lG0LqFwSonZZCxm1BQFaodenfJCOqfROjOe4XxjYZGbhJLVmrIRcwV
 q7S7MYn+F/4oZBYlESgt6g2kspy+VU1hJjcePLg1GY6e2lHlDKtkg5PEX7EcX1gcNPhc+BJ3wF/
 4MsrGYciJJBsnhfBlvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210129


On 8/17/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:37PM +0530, Hardeep Sharma wrote:
>> Document the RPMh-based Network-on-Chip interconnect providers and
>> associated node-ID definitions for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>>   2 files changed, 171 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> new file mode 100644
>> index 000000000000..ffbf14356f12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  RPMh interconnect providers support system bandwidth requirements through
>> +  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>> +  able to communicate with the BCM through the Resource State Coordinator (RSC)
>> +  associated with each execution environment. Provider nodes must point to at
>> +  least one RPMh device child node pertaining to their RSC and each provider
>> +  can map to multiple RPMh resources.
>> +
>> +  See also: include/dt-bindings/interconnect/qcom,kuno.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> Why are these flexible?
>
> Look at other bindings how this is done.
>
> Best regards,
> Krzysztof

Thanks for review.

You're right.

In v3 I've made the clocks fixed per compatible rather than a flexible 
range, following the sdx75/glymur interconnect bindings.

v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

