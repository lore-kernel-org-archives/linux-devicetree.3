Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3ED225788
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 06:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244301; cv=none; b=QjGEzbOdv2v16LbpYtn7mr2SW73/+ggh4g+lZmW0qs6dvUra/sBDXrPr7e5ImJkHB5UWbsFg41EszWzdg3Dk+/QwPawtkr4NR/evvqIl8DFgfzm+U3fepM7ajR4EbvRRlAuAUNK91whSKERmv85XJyejWNoUiKoC3y3GA7zjSTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244301; c=relaxed/simple;
	bh=LQ3BSCSIRHPUsUlvPK6jyH+yUL8VHldljnNrkMuWqy0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ENCdlv07nmxQdsHIzbMnEb64aI4IWhRp1LAv9YlHXuKb9O6V6DWvslTMwx45q+sV1xc/k2KpGZZx81ZWt0lDlfrv+dbX1sGYv5EszdFefk9s9TSfNZKO050p5PbG/NsU8OZfiPNPI3Kin+q+AvTE8DBqpn2EB+tEWQe8jXezOCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YCBpFOQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRZ4MjnG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YCBpFOQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRZ4MjnG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6812mXv91132603
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 06:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LVxLmfU/AGh7oRf3ENjjPTZVAsrw2+1VZEQGXlekbXg=; b=YCBpFOQIJl+PtwVW
	DqEPwxxActOiHj2AOYdcPr5hF+DBntuoCsXyTN3X9RyCuCb3HwxsZxgHXsFJ2MVs
	ZxWC3ViVhPvuVx6MTlxLOTmU1qtvWlA7QdopSZF27Vu++Nd7camiPSVuLeB02SGG
	VURW8l54rPKIYwvTnVuKtaEnXcIBeuU5dX7Dw2yCDrR/VZsYLmSmplsWzLKNyI1O
	LQrDTGULrtMENb0h1RJFDS7+e0r4NqG9WoZib3ZfB/ahQjsQHu8w+Stg56EOsWwi
	Zi8CWuZX+1xFAE/+fVcVnO16lplRIYZVZu9GyxyUnGDq6U85JEzKLJoCFYI+v1I7
	iOqAhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8frra6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 06:31:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so863214a91.0
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788244297; x=1788849097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LVxLmfU/AGh7oRf3ENjjPTZVAsrw2+1VZEQGXlekbXg=;
        b=cRZ4MjnGnuS1doU+0eRupn0VTY6GWKyRxzL43ES0tOn066HzggZd2/QBTNazEwtpQH
         AO/cawHmtaDiAevKYFS4bt4S3ed2ovh0nqMs4y5lXy4ZcHJ60eqGcBCy2RyFiDElZXVV
         KwSDblgVr5RB3+t9vVFAaDAeLbY7xywHF6DheO+zyjdaXH7opzjreJNgiBn30Ph5pVnw
         M6UDLGnde9ww4aZI45CRgXwjGPwbwk/wUV6JZ+dhdjsVV/F1KByaVh3WkW3TgKmMX2i3
         IkVqbp3JJA5NBXeG+ABuqmskd7JqoDC5y6IHzTPcTS06D71pbg+Zo9TIl64+MZhjQT4H
         FRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244297; x=1788849097;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LVxLmfU/AGh7oRf3ENjjPTZVAsrw2+1VZEQGXlekbXg=;
        b=EiTXLxnwkaLGU+phI5IggYIeIlAqpmHf+OJ+0oLkcGpBnxVfNdTryTXodXdWawHKqv
         /wfHlr+SN37Nb03Dg0hSnd6M0n64SVueKEPJTsp50w+ZygaOverlHx+EtXMI9QChmtW8
         jO8utcZ8hikftUJziM/y9tsHan4/C8kjAT0JEQMQwIcPIHtv5oTzwundGhgd6vy/be48
         mshU10ufOxo11Tjm79wz7GVG62ltAmHvoblAig/+fcDsUam4LLWmeHXClno0P7Pc9j2e
         lLAQEItSCG1ajDIdMO/FdUOSz+mmnj+FGzJUy9I9rkDpQMWvHelo/RRE8CxEivcKbHXw
         FSug==
X-Forwarded-Encrypted: i=1; AKwUvBxXx77v1bdXKwc0cpWNNMnf0G/jzelN/8uqx90HubNZsgeQp+wTS8Hq4mMIq+PAQNMuXTAQ3h30daWi@vger.kernel.org
X-Gm-Message-State: AFuF++nz5tnx3ATycT+NkxHGWUAhDtQEnwycc/SLcCOnSjNt036EsHOR
	f0pv4S/kb9dv8TXoCtjwmY8Gjo0tBzTEkkSreIxj249qShGr8OtGr4qFze3TWhUbvQ/L9y/r8UB
	R34pxH6C73X8+Pmhk/dtVJL7P6tW68xqp9qPHjLfeFV3xyrA56px+xdqtQEL8k8F8
X-Gm-Gg: AYBFou3Japyf+C5GUB7ni9LtZXNgg2HZ/DtXP8tDmtaLET+JOv5r2lkupfQ5xVzJ/lJ
	mlKbP85UPb2LAwQmSY1r40MiPqpI1NmrMtWkdKAadvKEjjgmWjPX8tjHglulI9xFT9hBUL0ZsBu
	50JsenYWe+igGfoWPo+bfqld0PCU1qSnYfa2YC+vTcLfgH81bpYFWZNY/0KlJkBGZQFsl2GICVP
	nHLNFLog0IDKgsXl5StkgBUZZzzI43/XvW/SKPZan46rSduZYP45SAcXsJ1U0pXaekrgkIxp+1N
	bftroR9kx4i6Rcib3GUE8iBWFlPO7epSYFhysySGLWj9AXF/hQuYIu4roODvCGgn/v9AFmEZX9n
	CUMwG3HLc3hM2ECaW/3XaMOGoc+lK
X-Received: by 2002:a17:90b:1c05:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-3989bd135b5mr26939865a91.22.1788244296727;
        Mon, 31 Aug 2026 23:31:36 -0700 (PDT)
X-Received: by 2002:a17:90b:1c05:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-3989bd135b5mr26939759a91.22.1788244296111;
        Mon, 31 Aug 2026 23:31:36 -0700 (PDT)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm4453130a91.1.2026.08.31.23.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:31:35 -0700 (PDT)
Message-ID: <640acacb-1704-4ee6-aa34-d6be3b30b44b@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:01:27 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
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
 <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
 <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
Content-Language: en-US
In-Reply-To: <02792987-7ad8-4a6b-81ad-559c63174bb0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5Ekbc5KJMYKAvxIBwQEemuPnmfl1J9pe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfXxtIsZKevO5Jf
 MFnCQ9wYFdQs4QHPL23cE9WLiuoX0kfPVu3PNfCv9c+iMKWYdm4E2wrwMy04IgFyDPdo5DvCsr3
 ykquK5XWc/XDHj5X1cInoGcG+KiO+ww=
X-Proofpoint-ORIG-GUID: 5Ekbc5KJMYKAvxIBwQEemuPnmfl1J9pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1NyBTYWx0ZWRfXwczRy3E2CHUa
 H2bXwbcDX8W8G52gL+eKOdToAmvArUtcfPcHtmzbSbqJjzbudDQZVQ9ZVQib88mBunut3fh8Tpp
 ivMBoTy6rmrbOqBtfFEpo0mauoCutwEa9dQ+7FBjLOIiGHF3c+H3NXnx2edHAo/DhpkIWNKyNgJ
 p4Oo6tpAInNZywp5sWu+jXb2vP8x8U3oljwGEDDlu2la2vV27G/8ZqvhM5dNVxBwWvI5q5vb3ck
 m9qnZAg+ekU+//KmWgETfQrUObT27V0SrE28xLYmG4Eojio427LuA3zzOGHRDm7ablXFIO/Ehtk
 s3IgP4Vz0jwk/u9jSQdMjJOJvUQv9O24vWKAduVaAWBQLsA/cVEvHOe0SPjIpBumI8x8EVlRXN7
 hyl2bPkMqxaNhnwFvDkQhrn89ICOx1DQNaz86X64Gy4ScgfltdoGMUzQHb9o8qE48ocQ6SnXgEd
 aH61D9gCI5XL7OlFoHw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96714a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=b3ntf1tsAT8mX5NXGroA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010057



On 27-07-2026 09:20 pm, Krzysztof Kozlowski wrote:
> On 27/07/2026 16:10, Imran Shaik wrote:
>> Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
>> on Qualcomm Lemans and Monaco SoCs.
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
>>   .../devicetree/bindings/ptp/qcom,lemans-tscss.yaml | 198 +++++++++++++++++++++
>>   1 file changed, 198 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4cbe4b00ff7dcacbd8cc111e2b4b61ebce7104aa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml
>> @@ -0,0 +1,198 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/ptp/qcom,lemans-tscss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Timestamp Counter Subsystem (TSCSS) on Qualcomm Lemans and Monaco SoCs
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
>> +  clock along with the summary interrupt and slice subnodes.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,lemans-tscss
> 
> There is no such SoC upstream.
> 
> 
>> +      - items:
>> +          - const: qcom,monaco-tscss
> 
> Neither this one.
> 

Apologies for the late response.

Sure, will update the SoC names to sa8775p and qcs8300 respectively.

> 
>> +          - const: qcom,lemans-tscss
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    items:
>> +      - const: tsc
> 
> Drop names, not really useful.
> 

Sure, will drop in the next version.

>> +
> 
>> +  clocks:
>> +    minItems: 2
>> +    items:
>> +      - description: TSC AHB configuration clock.
>> +      - description: TSC global counter clock.
>> +      - description: TSC ETU clock.
>> +
>> +  clock-names:
>> +    minItems: 2
> 
> Why is this flexible?
> 

Actually, the TSC block can standalone work without the ETU support as
well. This ETU clock is require only when we add the ETU slice sub
nodes. Hence, keeping the minItems to 2, excluding the ETU clock.

>> +    items:
>> +      - const: ahb
>> +      - const: cntr
>> +      - const: etu
>> +
>> +  interrupts:
>> +    description: Summary interrupt raised based on external event for any of the ETU slices.
> 
> Please follow Linux coding style.
> 

Sure, will update.

>> +    maxItems: 1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: etu_summary
>> +
>> +  assigned-clocks: true
>> +  assigned-clock-rates: true
> 
> Drop. From where did you take it?
> 

Actually, we need these properties to be present in the DTS to take care
of the clock rate requirements.

Please suggest on how to handle such requirements.

>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^etu-slice@[0-9a-f]+$":
>> +    type: object
>> +    description: ETU slice configuration
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +
>> +      pinctrl-0: true
>> +
>> +      pinctrl-names:
>> +        items:
>> +          - const: default
> 
> Heh? Which code do you copy?
> 

Each ETU slice has its own external event pin config, so kept pinctrl-0
and pinctrl-names on the slice subnode. Please suggest if you prefer
otherwise.

>> +
>> +      qcom,etu-event-sel:
>> +        description: Event selection value for this slice.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      qcom,etu-slice:
>> +        description: ETU slice identifier.
> 
> You do not get identifiers. Please read writing bindings.
> 

In general, any ETU slice can function with any ETU event sel, and this
might not be 1-1 always. Also, these ETU slices can be configured by the
vendors based on the requirements of the GPIOs on the board. Hence, this
etu-slice identifier will provide the flexibility to configure
accordingly.

>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +    required:
>> +      - reg
>> +      - qcom,etu-event-sel
>> +      - qcom,etu-slice
>> +      - pinctrl-0
>> +      - pinctrl-names
>> +    unevaluatedProperties: false
> 
> Please read writing bindings.
> 

Sure, will drop this and use additionalProperties.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        clock-names:
>> +          contains:
>> +            const: etu
> 
> etu is third clock, what is the point of it?
> 

As mentioned above the TSC clock can be functional individually. If we
need the ETU sub block to be functional, then we need the ETU clock. To
make the sub node properties mandatory, we are using the ETU clock to
distinguish.

>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +        clock-names:
>> +          minItems: 3
>> +      required:
>> +        - interrupts
>> +        - interrupt-names
>> +        - "#address-cells"
>> +        - "#size-cells"
>> +        - ranges
>> +
>> +unevaluatedProperties: false
> 
> Please read writing bindings.

Sure, will drop this and use additionalProperties.

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      tscss@1c80000 {
>> +        compatible = "qcom,lemans-tscss";
>> +        reg = <0x0 0x01c80000 0x0 0x2000>;
>> +        reg-names = "tsc";
>> +
>> +        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
>> +                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +        clock-names = "ahb", "cntr";
>> +
>> +        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
>> +        assigned-clock-rates = <15625000>;
>> +      };
>> +    };
>> +
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    soc {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      tscss@1c80000 {
> 
> This is the same node as previous.
> 
> I don't understand this DTS.
> 

I kept two different examples with and without ETU slice sub nodes, as
TSC standalone block can be functional.

> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
> 

The recommended DT generic names, doesn't have the node names related to
PTP/PHC. I found that other existing DTS nodes has the ptp/ptp-timer/phc
naming convention used.

Please confirm if we can use the "ptp" name. Accordingly, I can raise
the PR to DT spec repo as well.

Thanks,
Imran
