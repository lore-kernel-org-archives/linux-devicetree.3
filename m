Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6F377006
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785126979; cv=none; b=oGQimeru/m57avHNeyBEjQz2iWf/cQTfCFq601t4fhEAgZ1U76KROvwJu4rJgLZORcakI1yc6ELjrmib9as2O0YdA2vbYyKeaFRPw56ELas5mmeZ084u/LEtBnVoFN8XZPxsDdU+SnHXD9bcqBCwO7Gct4avEMzsPDRmDqjJq+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785126979; c=relaxed/simple;
	bh=OpkEkk3jbVeV5MrTx6FPVxE8QuZYIguCkCIzBD2ATT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bqjt/qMgvmjenFNr8hMeqErIIuOj1u7f+9/4E6UlS7JI090HtYNs9F0OnpUbkAaGnJsfwYHptOTFvciU8ptxeR41aptifJTdFNbzq+vRPiFhfgTaxFR7U3euBBT5tpbsux/WHL+wZw5xJeCHqY2PuFHyq4k+9i41U81x/gWKcyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkegrthB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R7GjmMDW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkegrthB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R7GjmMDW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1froV2417733
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=; b=GkegrthBEXnqZPv9
	+d93sblE2AmJmXmb+V/Fy1DUtSOQbS04+qzWjpDEHCnPJbQMlbZJrB95nXOTVfeC
	xANstxzsuyODkxywA/5+P/bNgm+BX02l9sDL6/DOAJNUqvDCtfEPcQK90CF2t9gH
	Zevf78qdzNzXdbt/ibxlyJQqEBUsiclemjE0gfMus5tNzcAaa0lIP49O7+kLpVQP
	80hGJC7cPHVEZClbCVR1N58X56Gdg0VLsl+yCSd4so/HrWI4Iq6Eir/2LHiI5C7o
	lnZqkUi7xpk5NamPEA6vtavRgQLrpy1cT6I+0SaLezuVsOKJlm6qpeOLhVQvWkVj
	fe/JOw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngyssnn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:36:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cccfa32670so30271035ad.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 21:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785126977; x=1785731777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=;
        b=R7GjmMDWoyDrOIuwTPzk4FZPeC7X9DmckL7JDYE/htea0RILFHN2R8vP/6TC/zki/+
         mO9LVRv1D01Hi/LOEaPYGOjcxB1S3z6LbhHRhuCQNsStkXzoUZ2mDHw1BupdxLpYA5Pa
         1nCdfHaI7jfGkr2VBt1pvlZDvB1kcTxqXCHyHux6rlR/lkkQJjE/p94NjUE23hvx1R7Z
         7/4Xs5RDSKJnUn00JUPohHxn27T5KtjbWycoUzlUrOFPTvK88j7UbhNXWyGH2mT0v2is
         C0bCXZDVmEYZXl2yHB/zFrV+qQdFJtOuvlK2TWfV8sJL4+85skbViqAf9hsyvX5gK8a0
         mpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785126977; x=1785731777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr4qG+4xCNN2gbsB6WsO04DOPM2VsmsoKamq6H18COg=;
        b=CH7urxfb3jg6MqfWvV0avomenpIONA7UApgK9xyONozBAIA6g0RH23G2i/NPw1oN6I
         C4TNXwtjlJk3iG8Hbwop38SBbPBavhWJ0OmzYIDROVNtJV7tEF4i8qWA3nm3s2REIM+U
         oY6VKBPEo/nbbiumFTo2hyTqk+BPBFAXV7qcsfiFOQDlNkcC4dRxsCACa7lL3+b6f07e
         TIcWIAc3pt/ZU5Mcc8S0IMZrdoNQnFtjugm5jWJaCtL8onNQMglxmQ0+PoGCzDlI+AQy
         tHp0EyJb4+35kQn+/LP0J1cYpaxERLrQc1rliGDnbLui/YiSXewkFC0A1e5loXL6sQ6s
         RrCw==
X-Forwarded-Encrypted: i=1; AHgh+RpB/wDnnwTp4x0CkKfZ3UyCdCIswV+WVluLRk5ydziYW+lGwXbd1PcpDLnmiomVQl2ybqHNGNHLwdkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwAIaEFRSfYC7h5D6kteGYUy+SnYw1s5bNl0ekSfoRAXoCslv
	rCjnarYIfYJO79h99wZmzo4+Ut2Cu4/Kx3zSQmIm1WFUPqmQmLE2gcav0jM+ul3stA19+ltd1zK
	e5mDVj+sOCgtMmizMDvPA3OVeIhrr/RS71UonLsgmP+mjV4c8viS3irXh+SNDLWql
X-Gm-Gg: AR+sD13dPLAiPpSs0FdWcbKQE9CH7MNpdlosuShYTu5AY1CJa4B2o+YgTcEAZ18B0T6
	8iaPAng0xzmu0venRAAUjx7M39OlR8OGigcN8PjB/sJM9yrfzC3I/ql02h47Zcnb5UpeQqB8wzw
	MOE5LJ0aEN3Xg0daIrYW8Ypj9iqI09VSA6Tofkq+HMav13tzrNxa93jni2gcZT5r3Z8U4mGVLoH
	SSPFw6stU7Ne23mjWmUJcDTptCAtFOs67HfWH4WE7myhSfC6798wxwhMP5IBe6vIEXeiXErJSSj
	bJ07UdW6Or/6CFbV4omD1waYVytDPxGFIL22KEo4L7QWh04ag1KY36YdPc6Ugn4mN3EVI9UqcWB
	8fsu0ipooceFoinWKaTdH8O0lqVzXvLv/Cg==
X-Received: by 2002:a17:902:e809:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2cfde84e377mr72868755ad.25.1785126976468;
        Sun, 26 Jul 2026 21:36:16 -0700 (PDT)
X-Received: by 2002:a17:902:e809:b0:2c9:9dc9:e423 with SMTP id d9443c01a7336-2cfde84e377mr72868295ad.25.1785126975991;
        Sun, 26 Jul 2026 21:36:15 -0700 (PDT)
Received: from [10.217.219.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27102186eec.16.2026.07.26.21.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:36:14 -0700 (PDT)
Message-ID: <0581856f-bcc6-4a2f-b13a-db9fe356c3c4@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:06:09 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
 <2a21f549-294e-43b4-aed6-b779d84cfd4b@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <2a21f549-294e-43b4-aed6-b779d84cfd4b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA0MSBTYWx0ZWRfX95zVy9F/jKEN
 9VkXbaZ+k63bqlxZwaVvMVSR0CnHYvm3/GBp+L3/sA2vy2ldAhAh6W1AkxT2GL+7qEH87fhTsyb
 QwR+6uuG6tytEYPtW3lp36h49IAnsUXhjZnstFGKSE0w4jXNtdIBGPMvQuE6jjwfu4Dk0hAd+uo
 h+nXNgDEVXBn8x49E0ejTuTJUEIKS4R5roFe/hC7R2NVDShnPNrd8n0lRuyHxky2htQ1htm1UHb
 GUOv7AYNQ4cPwKG5AjZQHI8O4F+ZWdSrFuY50qRjbONxJKBJJxASeL3h2wse6iCMwovZb8oXN3w
 iSGCaSk+nfpapWHuhOdna3CDeqMbsedD6rpdwjj9pWwTY5qLW3HLquQAsrCoRKO8zQA2lwIHcgi
 Li9p1o0eZV7kHSvw7Zs5BWH2T3ka0yKcxpzWF6O/XKTuPWdmzHRNyV5UzhCCIY36ltqUvig0+9M
 u3R1BuWN7oX629geTxg==
X-Proofpoint-GUID: B4YT89yV8S7aIAtcKukwXuDJxUnGC-F2
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a66e041 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=BpNlaLRTw972n_5ZLSgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA0MSBTYWx0ZWRfXxJ5gxfKiaC+Z
 XeNN+aihLsi6cATeN9NNLUX2qwRhzLinnGJEQrN1LdWs9pegQ4bJZBOVjKnDnXT/DYIDxV7xu+p
 cOI4k9dihJHRuIRxloe49ZlBggWCgUs=
X-Proofpoint-ORIG-GUID: B4YT89yV8S7aIAtcKukwXuDJxUnGC-F2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270041



On 6/29/2026 12:02 PM, Krzysztof Kozlowski wrote:
> On 28/06/2026 16:39, Viken Dadhaniya wrote:
>> +description:
>> +  The Qualcomm I2C slave controller is a dedicated hardware IP found on
>> +  Qualcomm SoCs that operates exclusively as an I2C slave device on the bus.
>> +  It supports FIFO (PIO) mode for data transfer and does not function as an
>> +  I2C master.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,i2c-slave
> 
> Such compatible makes little sense in upstream. Please look at other
> bindings how to properly create a compatible. This has to be device
> specific.
> 

Sure, will update with an SoC-specific compatible string
(e.g., qcom,qdu1000-i2c-target) in the next revision.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock for I2C slave
>> +      - description: AHB clock for I2C slave
>> +
>> +  clock-names:
>> +    items:
>> +      - const: sm_bus_xo_clk
>> +      - const: sm_bus_ahb_clk
> 
> Look at other bindings.
> 

Sure, updated the clock names to xo and ahb in the next revision.

>> +
>> +  qcom,slave-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The 7-bit I2C slave address programmed into the controller's device
>> +      address register. This controller operates exclusively as an I2C slave
>> +      and has no child nodes, so the standard 'reg' property cannot be used
>> +      to convey the I2C address (it is already used for the MMIO register
>> +      range). The address is configurable at runtime via a hardware register.
>> +    minimum: 0x08
>> +    maximum: 0x77
>> +
>> +  interconnects:
>> +    maxItems: 1
>> +
>> +  interconnect-names:
>> +    const: i2c-slave-config
> 
> i2c
> 

Sure, will update to i2c in the next revision.

>> +
>> +  pinctrl-0: true
>> +  pinctrl-1: true
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - qcom,slave-addr
>> +  - interconnects
>> +  - interconnect-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
>> +    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
>> +
>> +    i2c-slave@88ca000 {
> 
> You need to fix your terminology everywhere...
> 

Will update in the next revision.

> 
> Best regards,
> Krzysztof

