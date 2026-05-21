Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECF185B48
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342230; cv=none; b=r+IiDRFFKYJQQsV5MSNgMrw9CVTeqFhI82/lwyhOGc0ePjaeWZd5ijMUG2xDdB7KK2W9q5lidHCwKhQ68Cbk2KTtz9ckYWHMhvHOZWAfWJzyl9T326MZEsZ8YJFYv9OB2gHcpZffl1Wz7DL2jOeDrzZx0sW4KxO759xI6GAZzQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342230; c=relaxed/simple;
	bh=UX9mPeVXdPlTrdlral1b8cH24Evvjas7dfYJnZiHGPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uiADGQKy6jLzFfz+ukltPK3gCsTMkMi1h/sWDGtmMrOykXjET1IU065EVbuUoT0RdK05jQb4C5aN9vTsO/yO+fBmN4lSYdhVwgsIJLxPlWpHvS7EuMNjFQ9P+A/Z7nJOaKZAFfjx20pqkfTRJ6W+H1da8NatmeiPpkWSS4JOYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IL5yV/Cw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=heWFrRSH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IL5yV/Cw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="heWFrRSH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L4ukCu3085003
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=; b=IL5yV/CwcYMQyn5m
	/h6sydk6UgX2c8dXRHHLGCn7K8tGjGWz1X/c5y9XU/j0iGBBbKhV04rPGTcwAP8y
	JJXtojBzBmZQ/teID7+GZYBJqs+gI9xj1P81cHzqzoApwL3BioWHf0LDFYouXdVQ
	VkLKM7SUpjMY8NOuxGmyxNV9QSievzjbg5GZ9STPRBUuHjgT2/Ja6kO3X2vz+80y
	YMUd7FLzr0uCg1j88gBE5faMQ3MqE/skHkr/+spAD4ZKZtg/bRZKIE8tKG9j10bv
	CS+7bIxLBNGwHHUkOAcRxJPzeDFWezqh7z4XE5E/oT/YQvI3XKZw8uNOABPaKNdM
	+7tiyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f3sau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 05:43:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso56946835ad.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 22:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779342225; x=1779947025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=;
        b=heWFrRSH2PE/j9sDoaQPEgyVF2/btdTuzvdMELSlJMaNXGx2X9672vTwHYqsw41MDH
         Qj7eEv0MPae2gi94Y4dKVr6dgNb+kOcAHrEcet8m+TYK29EnbQrqlaAj4+RJ3p7yzp4T
         SopAAlbdPAmh1BWrtY2qKAAbZ+Kx8lFN7aDQ20yTzHlF0n8pYedhvCJ+HgcfTLgcGfAZ
         sI4pn9ynCAQNw045reJMcjWM3hBn2sk+jD61z6LYHrW8ND/xHJGRfEooVtyfS0+pBLhB
         apvkvhgvc1A1uqKfj0TmxPBF/PV6DxgbiXhjFI623rbpZOSBc83eTWsMW6BtHXcRQruh
         rxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779342225; x=1779947025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKpUrY9c+Nt+cLeu7+AnKXbXJe0Cc0NQbiZYl9VY2Jg=;
        b=i4LfrAIR3MdjZr/L9PLfO1XlhJM/ng082JcNecJAIvHEffo+f9BSIIHLmSe8AqGhMQ
         0e5M7sQ3nrYNEWxIkUdlTsCqUvJFZ0xLEC0eHzvRHvkgmt0mp32iA4bIgcxWhmhQQjOn
         LlGBZHNHHcC4pTBGjBQOTRwr7zDBeeRY3B93/Na+FG9REH4XQL2g/TXUcEGepHLFvMLF
         Kzs1I2pjwcSc6IsisMx+X0d1N6r2a+TVw2nn/bwYE5HauWlLHPfUFUao40ylFuRlv+Me
         JCGL9omB9HoPiShea73mQ5a2KuRN8vJ0UDwV2MOJPEzEbIX7KjnzRf77I1lOe8JyG6Gm
         JS/w==
X-Forwarded-Encrypted: i=1; AFNElJ8t+VrM9LeD07Zed+X15m6vGSkvq1z8EGmHkRDE7dF8ZbIuZzeujDd6xyr6oA4+0vDTir7Is8zxmHaV@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuaNXmCkxPYHh0CuOMP8mqI4erwATzviYhZjPW2lSFvYH/HLB
	e1Ig3z0RgSYLpdYqJ2yz/e5OpM5fqKRlPnq1OreI1JPIwN2JLvNjR16xcMuL5ptBDQ/FZzYvmSu
	G+MtEderZwFX0gLHPh7oH5LzAYf9p5N13tkF86nWQTSGewdrT7AEEAkauG84G2TBd
X-Gm-Gg: Acq92OEoaZVPDpatPN31LOfyicapEzu8agN9uKKU01cFy24lU1E8UAk8OgBtLf9QkEJ
	kGZPcnLcSHfvaA+QNXpj0B9aGb7yJMkVoklFu8BPP/jn9yTbR3iu438wVFTuG8yHqrQYEEvtzIM
	mkUaNF+P0aDkA/xlgjfkXZo/ciR9i8DZVog7xPtKETGevdil3kWP05JPaQsWRdp7kgbwUvvEkRJ
	DDPMmJpzjcZdLRUP8QpHqWS1Zzp9mg3Z5kU04PmWTAkIuIAHVZzZEwXzmMc5qAMWPY4LQX2vzdf
	tdLAiZySST9ns5my+xAi7oBemMlAlGqUuWUHxgeX7WrYidvoxz/OeqZEw0ljfb2/n3wsMKkezLW
	GFVaZLz2wa9W0HixguTtkxX01JiN5DDELwkcQ1ACFvfCHZP6iNQ==
X-Received: by 2002:a17:902:f60b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2bea2fa2c4fmr14909175ad.1.1779342225221;
        Wed, 20 May 2026 22:43:45 -0700 (PDT)
X-Received: by 2002:a17:902:f60b:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2bea2fa2c4fmr14908675ad.1.1779342224666;
        Wed, 20 May 2026 22:43:44 -0700 (PDT)
Received: from [10.92.215.233] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f30bsm273593915ad.16.2026.05.20.22.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 22:43:44 -0700 (PDT)
Message-ID: <10674bd3-d98b-44d6-9846-37bf5a22f583@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:12:57 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
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
References: <20260519-shikra-cpufreq-scaling-v2-0-2b09f0e1c9d8@oss.qualcomm.com>
 <20260519-shikra-cpufreq-scaling-v2-1-2b09f0e1c9d8@oss.qualcomm.com>
 <20260520-hissing-rook-of-penetration-b4d6c5@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260520-hissing-rook-of-penetration-b4d6c5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0e9b92 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=DFSuKv5auc15g7BGkicA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: vc5BhZKXBlX-Bhd5pr3wVO0X1ePiixwn
X-Proofpoint-ORIG-GUID: vc5BhZKXBlX-Bhd5pr3wVO0X1ePiixwn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA1MiBTYWx0ZWRfX8x/lFrZ8A98+
 YPtllep53tgKXiCn7+mfOzL9nm8nqgXnYOZdJnCBCP6u+SUgHnUkpWSfxc/OyLX84YsP5iALaNS
 c4esAHUSbGx+cIJ+/Va5+DEhRPhFEBC4otzp8DjwrUg6KY40ziO0e++WC5veIhmEkJ9V88Rbaxp
 vQZ3stXqKsgJoaeuKSH7V9mM+QVyOiv7SfLRztivPOkmlIpZLdutykd6FT7UKQFxbZxJSGWOT0w
 N063bneAUNCWB32lwgd0u0cHMorvlEXck4mVHxVHUqvuGnPgY9d94rs+1b8U/X+ORVwS2iDDolw
 N+etQvGLABuYWps/CIWEV7ylMk4dVINpHSbdiJyZ4OZSOvUp7H8lZDEF1UASlmQeQBHXohHwM62
 qKstT/FMfDHzjFnpXGKR0BiN3NdIOKCgILK849HJUsopGVAy8cpMX/wzf62ebll8HkMhvR9DLLm
 EVTXKRBs1ez+5b+FbXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210052



On 20-05-2026 03:50 pm, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 10:58:03PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml   | 133 +++++++++++++++++++++
> 
> Filename must match compatible. Please read writing-bindings doc.
> 

Sure, kept it aligned with the existing epss file name. Will rename it 
to match the Shikra compatible name.

>>   1 file changed, 133 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..52079ed661671554fcca8677409ee11199f5727b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/cpufreq/shikra-cpufreq-qcom-hw.yaml
>> @@ -0,0 +1,133 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cpufreq/shikra-cpufreq-qcom-hw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: CPUFREQ HW for Qualcomm Shikra SoC
>> +
>> +maintainers:
>> +  - Imran Shaik <imran.shaik@oss.qualcomm.com>
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +
> 
> Drop blank line
> 

Sure.

>> +  CPUFREQ HW is a hardware engine used by some Qualcomm SoCs to manage
>> +  frequency in hardware. It is capable of controlling frequency for
>> +  multiple clusters.
>> +
>> +  The Qualcomm Shikra CPUFREQ HW supports up to 12 frequency lookup table
>> +  (LUT) entries.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,shikra-cpufreq-epss
> 
> cpufreq is Linux term. How the device called in manual? EPSS? cpufreq?
> cpufreq-epss?
> 

Its EPSS. Will update the compatible name as qcom,shikra-epss.

>> +
>> +  reg:
>> +    items:
>> +      - description: Frequency domain 0 register region
>> +      - description: Frequency domain 1 register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: freq-domain0
>> +      - const: freq-domain1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO Clock
>> +      - description: GPLL0 Clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: alternate
>> +
>> +  interrupts:
>> +    items:
>> +      - description: IRQ line for DCVSH 0
>> +      - description: IRQ line for DCVSH 1
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: dcvsh-irq-0
>> +      - const: dcvsh-irq-1
>> +
>> +  '#freq-domain-cells':
>> +    const: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#freq-domain-cells'
> 
> Why interrupts are not required?
> 
> Why clock-cells are missing? The device is a clock provider, no? Does it
> differ per each board?
> 

I will add clock-cells also to required list.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>> +
>> +      cpus {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +
>> +        cpu0: cpu@0 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x0>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu1: cpu@100 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x100>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu2: cpu@200 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a55";
>> +          reg = <0x0 0x200>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 0>;
>> +          clocks = <&cpufreq_hw 0>;
>> +        };
>> +
>> +        cpu3: cpu@300 {
>> +          device_type = "cpu";
>> +          compatible = "arm,cortex-a78c";
>> +          reg = <0x0 0x300>;
>> +          enable-method = "psci";
>> +          qcom,freq-domain = <&cpufreq_hw 1>;
>> +          clocks = <&cpufreq_hw 1>;
>> +        };
>> +      };
> 
> Drop all nodes above.
> 

Sure, will drop in next series.

>> +
>> +    soc {
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      cpufreq@fd91000 {
>> +        compatible = "qcom,shikra-cpufreq-epss";
>> +        reg = <0x0fd91000 0x1000>, <0x0fd92000 0x1000>;
>> +        reg-names = "freq-domain0", "freq-domain1";
>> +
>> +        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gpll0>;
>> +        clock-names = "xo", "alternate";
> 
> Incomplete example.
> 

Sure, will update with IRQ details as well in next series.

Thanks,
Imran

>> +
>> +        #freq-domain-cells = <1>;
>> +        #clock-cells = <1>;
>> +      };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>

