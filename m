Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792597949;
	b=k0beWBhB12JW9qSH94praSE7ooK15//YwU7d4Gv3MxwwTQVO4dAlYXIMm/H2/rtX/9ph
	 iVDSc3TcBjI7dM+/gRmaNFvCANzxDgeMC3BuoxnAmXSvJELBFOAa6w/meMsJFXcxws5f7
	 PUyd9ZlV+gjvNeu1cg02cBmnN6Geh7hVAasNFCcZee1xN9YPThc38Tohv5+XBuMoUm6lm
	 GiNkjz6kbrMlMkVZMrRX1I4IpVnEfYlujFlrKSEIvzFUSoHloR3vtpgO1J1w818t47v1t
	 ld4j3aECLbvbUi7vL2pJnRsR8BLpRlEMs2/4LZ0Uv/qpsAur+C/fWq1nJ6m77LOxx7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792597949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
	b=WNImXqUrOxefEYo5eqCckLyCcFu/A918Pb/Hki+rFE/oDO0L0CsU/I+uWzHvcYDxBNn4
	 GYcHAjEj3Q0do8phUfBl5rjBdiAoKec545QaAvFJI1emtfm0VVuAU/5QygIFfMYM4lG16
	 NnxoS+DziBSm1N6LCDjy7pWcUKwM2QFP0/axKDCEnG+dv+i1APKnmEfYeSUJmKUitlC7N
	 t8EtE++fNb5XT1RnJ4bU9UWWzmx9RM3BReuKYs/4fYRdoXnSrGG+uW9seXpcbDA8DPWyl
	 D/QoNb8/BHhIeGbL+iR+RKsH/zom4Y2jEsuMJ4nitJ+GhYqJckp9UqiXNuTEAr8xL7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AA1606A325
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AA1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1JkZaaM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbdbjfEk
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTucu2102005
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=; b=X1JkZaaMrgTHS06M
	o7AuxubVAHNYAzDNoSeEZL7PJ8n7fdXBQFkiLgF7WtJ2/ov+PYwQneQBBkjh0NLC
	WfSNd8poJWwVZ56WkR2BJ45KPIORIWZS0/vfNsltIzvoPJNs/VfiNqPuH/zX6da4
	/48UV4Zar3SZ/QSaH6ySYnJdw50tmQf4tcpzsntlvEkD/tSp/RzyEi73Qyl8ZKbv
	Ic1Z7Ko783ll+iL6fmOlCCOtBIkmv4MvR0p3uY9ypvyBonzJxsZw7yuH2Sy3B1xy
	9oqq7kFjeAfSK0kndMy674r74DOW8SS5WZh2+3lgEEDFqDotzAsPcZTnldI6S7bH
	o7B8MA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhar5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:52:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36696c9f55bso921252eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792597947; x=1793202747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=NbdbjfEkAUJfnEOgZvzihS3FCsTQ/Eq5luqXC2kqzy8XSIUgB569FdxvJQSc4ZsqlE
         q7YhhPtgkLq5Q0x3tWf1iFCO5/pb7hZJqv+UpyH1EeNJ7PrZ1O6+Ah/6PeEDtAjGromG
         iJrVKqTQo7z8UfQ7A14Sih7KFs0twkd6oyiP5RjsKGnpTPye77eKNEVm8/qBvrJSd3LG
         5bLMnICoDn3WRFtnga56XiWB0lfVJ3BSm0fw41YAQfHDUu61T5kpwFBBln3jFBAn6uDu
         8ichDtqGCgcYloL3/2QLB0DRzdLqm1mz4Xj/6feijC8WD/8TFK5eVtk2dcV5jH05Fyhp
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792597947; x=1793202747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibYRO+1Znxm8b4rcaUEm8zC3whuBP06nv+aNbLyG60k=;
        b=nzkdKOT0GG2jO2Owv0QYWX7uxEqedB6bD0ynyoJWMW9vgiLglBH92KaSh2VIFi4dBI
         0ga5A75NK1G+WY+0A7r3Oeg1sqQPwXU1KwG2lOE82Pn5qnpavJlh6DBDBZpt9uwlVw1k
         NxGHecPrg00OZQjAbX2gSY8gfluBZI9URGBcOSjvKfVlsnYMFV8GDmWJz2mlXIpUPsTE
         pDBipULq3GC7szeHAlPvRNplgKObczfPQlrjncVZ1FsGpeZJ8VsJ2C98QV0C0HVrQwgt
         DSwLs9zxZ6Dxla10OMGYoBSnNYIi0INM7q3dJn9yAUvUStxHw0SsSI7x86A+vp4id5ZR
         XbCg==
X-Forwarded-Encrypted: i=1; AKwUvBxXnuzvzwgtNPnGuaVFc9PGH3Co+yE9MClxydsKOytQJ8WqY5gb57yvVl0sG3zCDwpZLWyxAGqD3o+1@vger.kernel.org
X-Gm-Message-State: AFq9FYIwGaHII3lgyWFIwlB4Xt7ZLQgV8eV1iLML2bZxzMofbnhToX6p
	AbLKCq9cm2ocFsCPZ04oNQHBZH55H0TIWC4KUFoLJiNugnoOoHjmP7j1/hLi6H3fPFRn1ZqobaB
	NsZG7HHsceh77DvVY7VgrFLBmr3l/2GaTsgQwxQ0FI1Ir4LbZswAa9lynRDoL5Eih
X-Gm-Gg: AYBFou29rxSgmDD8bZEApweX3jNAdvl4KYHnyx/mDFR5n1PvTkfvgGF165zeo+lNiHe
	wEm581WkmOTXJ2bHY8UnhFpLZ4Eva8Ly9ZYh1/rcMZNla89RLdEEb9pHmJkGAX1fWyAKq9NCwSH
	+lipcO7v9afn/askcPI752GvWK7vQhUSz0JnklR5B468hi/2J+aK/OIakfWDSSoJtDVnFdZpQ8/
	pMkQ609Q66d/VRVJIdmbFRDKDgL8o71lcogC/517ABJvmHflCjKxgQcb+AvqsyAqI+wBzidjPzn
	3LhqcVwLKcCKzihjtZLpg3oGky27qj0sPTYYiodGfq36H5NyzdJPlWf/KDhmZ1Bs8TbIciFQeP5
	GJGRnGmntibhSMXgpOUR/oJISfPAk1NncYuJiJmrCAYQ+
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3321011eec.10.1792597947135;
        Wed, 21 Oct 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:693c:2a13:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3674d54bc37mr3320967eec.10.1792597946485;
        Wed, 21 Oct 2026 08:52:26 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1cdsm9445801eec.25.2026.10.21.08.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:52:25 -0700 (PDT)
Message-ID: <d163db9d-5b0e-4bee-aef1-3fe8b7f1fc08@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:22:18 +0530
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
Subject: Re: [PATCH 3/4] dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-3-fd4c2b3cbdea@oss.qualcomm.com>
 <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20261013-quantum-keen-mongrel-c3736c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8dfbb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=mdBYyscGZtZr9QMU3J0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX7ds0VcIVwQul
 qJuki1fdehI91/y0VRfYpCauXW6w1abw0PuGPQR1TEkybn97UbAdeMRDcAGuS9wAQRcFdDpr0ZL
 miJn1wICrtsVDKL8xGEnWx3Jkegqh+c=
X-Proofpoint-GUID: 7EJfDT0PrdxMs7Mizogwjr9IHUyB4cOF
X-Proofpoint-ORIG-GUID: 7EJfDT0PrdxMs7Mizogwjr9IHUyB4cOF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfXy6f3V8rAJMFx
 KIp0RA40wGdCwPlt+HCpNQFNA+zKfopyKrcyRD/bd/ixWjceTBpqJY8Y58MWKNrAseQMZduzuKp
 O2192Gqw/eoPzwhN73zVhUeSRN63INQ+4wSVD6WyDUP+0VxeucdyK6IJsiyAHSUQYrkytJ2MmhX
 ZE2Ln42C4eDwShLDlb1P98RcEYkpNCqcGgkbZ1vfwzvZ/7c7cBO4JNVkhiFhDBbqQbRpBn/8beh
 dd4A93+bRG+ANCCT+YXWwi3RUDCldy480dZ/V1dXtd7QK6XVaFDDLQseb/JnYhDzXd8SCWMK3Wv
 Js68FHTLIlM/6/fRtDAwTJxu3hsMMqe1eDfVHAO3tu7yj0w3UA0w614IuasXM2JIFo60EdM3gqn
 BLw1wnEzoYZM+zF36wyXzH3PLKkPeJ1JxqA/uZEqUYKjSeaQXlKEWmd5wHCjpoE9LO+sfLr1roD
 mgKJzUuORgAecrpc22A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/13/2026 12:17 PM, Krzysztof Kozlowski wrote:
> On Wed, Oct 07, 2026 at 12:20:46PM +0530, Kathiravan Thirumoorthy wrote:
>> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks and
>> has a register space separate from the GCC. The four Cortex-A55 cores,
>> the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL,
>> selected through a glitch-free mux whose parents are XO, GPLL0 and the
>> corresponding PLL. The L3 needs to be scaled along with the CPUs, so the
>> controller is also an interconnect provider.
>>
>> Add the binding, the clock indices for the Cortex-A78 (gold) cluster to
>> the shared APSS header, and the interconnect IDs for the CPU and L3
>> nodes.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   .../bindings/clock/qcom,ipq9650-apss-clk.yaml      | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq.h          |  5 ++
>>   include/dt-bindings/interconnect/qcom,ipq9650.h    |  4 ++
>>   3 files changed, 67 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> new file mode 100644
>> index 000000000000..6b47183edd56
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9650-apss-clk.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9650-apss-clk.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm APSS IPQ9650 Clock Controller
>> +
>> +maintainers:
>> +  - Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> +
>> +description:
>> +  The APSS clock controller provides the CPU and L3 clocks on IPQ9650 and
>> +  has a register space separate from the GCC. The four Cortex-A55 cores,
>> +  the Cortex-A78 core and the L3 are each clocked by their own Zonda PLL.
>> +  Each clock is selected through a glitch-free mux (GFM) whose parents are
>> +  XO, GPLL0 and the corresponding PLL.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9650-apss-clk
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Reference to the XO clock.
>> +      - description: Reference to the GPLL0 clock.
> Why do you need a new file? Looks exactly the same as existing
> ipq5424-apss-clk.

I kept it separate because the IPQ9650 block uses a GFM instead of an 
RCG, but that's internal to the controller and the compatible covers it. 
The binding interface is the same, so I'll add qcom,ipq9650-apss-clk to 
qcom,ipq5424-apss-clk.yaml in v2.

>
>
> Best regards,
> Krzysztof
>
