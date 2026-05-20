Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517193F54D1
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779300813; cv=none; b=OgSiH7hF18reCxT1/8ebQskBOG+zz3/Yv+RsHajYk1909I0drRJ7UGieV6Z6zZhNNNYm6ngWtCxUfWsqqhQTwVtjj60+ilODCxm/It5rXyOnSOg/3HTUcQx64RA8Bidi/rYaIzu88G4j1tkjIhXG/9Uqe0hv2gcPodKHYa0Nx1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779300813; c=relaxed/simple;
	bh=VGBAg70L6yRE+3wY6u2w1pvPpMW/hIWgg0wzLNi2yh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDB4h1ZVVt5n7g5B/blTw+5+QgNu95JUSpXFUR8DKCbpATiV0UofgMw5hepmXTfRoCllRJLjLocu63Ioe7arYoBUYe4ulMCOctsuLuvyIF6yjnIDi0I/b3NltFNmANfyNZ8to8GPf6BWWeV+mK9XYh4eWvweKwki0ImmD7whjOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKhqo80d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWUhseL/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKhqo80d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWUhseL/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KBZR1Z3084892
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=; b=dKhqo80dgDn70xdW
	rOaLg+L3cxWEkCulCKsvvTWiEI6VcfV/vvG6YoZBHdgCtsfaSGeoCD9QukzHaxf6
	Xmdbv/s8ZXUF7y46sAXcREZ7+HrLEV4PWaMAPYFbTqmStLQKtSf18Hpd6angxnnB
	QFfDepGLT0gRCmuSJLZzvgEKfC77Lggs/XZDhavL5rl37OqdfVLVSRvKCd61MNpw
	2LzvGujWpjxo1RKR6t7JHu/NtBhDeqnxluTj7Qspj1WmqB7uJe0mipE7pySZvjY/
	m2BtqSxTqebHH7+c12fA/n6jwmcdMJahZpB+nHmwsbcttRQZEDGpKKPNyDikJZ1G
	bux+YA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f1nu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 18:13:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f99c8ebcaso954466b3a.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779300810; x=1779905610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=iWUhseL/Twn+1GVHz455uTUlnr8YOgP8qitfYlqwGjCTj+nLw+SPZUa60gfrwniQVk
         95Wh0FhwSTNqErCb7u4Twa4QHVdBw2YUHpT6ySzk1VwN/Ahr6Jnp86AhV05ururXD6jf
         r4KKEGm6pdeZBEVCgLVPSrGl6OMW5ltkgLPQetlj37dSXnlPbx20OBJ5Zbb/H562MTIL
         yDPkkGED8XUjySAZW+HMtuMuBWUICuEPXRurvVmOrNqitDqvGC+SyrLw04e0sRNI7fSz
         N5atUn0VHLFaMW3iTmgo87VkkupjGGpqGVgqlMRoXZxquWOwDGibckb7lV/IvIELHAOp
         qKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779300810; x=1779905610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3POHqsQDxTwqW4qayTc+L30XYDNUCr7AcHGHbDcIS8=;
        b=ke7KAThntLHTeC92CL2J37kAacIC3Rr9uxLvnMy2ZWJMsH62M7usosoCQjYPWYAibf
         ZLk/FXQz/1K2wTBvb991rrkJ22euTdw0xX50h21eDM6j8vjN+x5KA+ZidP1soaCERFHu
         OD6CTOlV4awiSzc0aovXR0ZEVC1Yq+yQVozY7HNVN3GrvTI1A6+OrI4ZDK3YQbm/RtWl
         sZ2D81shdagLEgTviFln07kYcd3SvIFGKher8/+fn0p0dmBelY7JLdjAh9EKfd6QIaoc
         2hEPSRbccc4Zat1w3KcYcFyAyrL95aRGhwZNotr+ErCIoZbxOcQT35L+WuKEEj/KLmG5
         gBqw==
X-Forwarded-Encrypted: i=1; AFNElJ8UyaVcyfOtkDHVbYuI77oyCKJ+Nw0+kBCUC3oPxXwTtIW1/9bWWCCekqcOOfsEfPUFdpcVkmoorrFf@vger.kernel.org
X-Gm-Message-State: AOJu0YxMKylMq4C3IB1MSOzPrKe1ojin4I3UmZJNwPC+X4EwZ8Z7K/zB
	nK1Wk/ZKvJxemWsprFaDTdp3ZefLIi9T0OVbH2KVhTN62angaoW8I9VTQVhsAw0qgpiAyGh2ikR
	oPMBSL6j4eYzsHLIWGr2dRT9s/1NXw6GVWz85JCirEdV3MHhdGuSTL4NOnijfuhWX
X-Gm-Gg: Acq92OFlgRLHYukO9e3+wkgCado8Xt/5gdb/c2ckdkYpOTFnx0yjLorbNnnrK43HptQ
	Q77M7XfuZPX2CG/YeuMR92VcvCKUds+ZKSDNRPVPKJ22kxzSHh4RUU7ku1U2O8y+48Vov/B1rWo
	Ng639pMpa/5uXWZ00RGSRI6IZ8Ts3/9lxBDbCAcYRXan40TwMgKZQMPW2wv/jUutq1waHp/AJyp
	N+b+XErJglYzBpOJzVTriCb85oxKrbf8CvwjRC64fkxETQYSMBWMVd1sRWm804k5p31wnoYN7tR
	k3XT542AwBWO6EQMnnHQB98kEno+3WfCLPl0em8Sp4Rwwi1O+9vVeEvzsyGtBX7bz2AwXBwqNCh
	SkL5dIdxOMPtOWuhsKSsKEXhvKWdGbAe0JXwaD69qEdJ3nnEf
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248427b3a.7.1779300809981;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c94:b0:834:e09b:de73 with SMTP id d2e1a72fcca58-83f33dda422mr13248414b3a.7.1779300809371;
        Wed, 20 May 2026 11:13:29 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.26.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f24cd0422sm26506189b3a.18.2026.05.20.11.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 11:13:28 -0700 (PDT)
Message-ID: <48e298d0-f4cb-4afb-8ba1-a6b39f3285cb@oss.qualcomm.com>
Date: Wed, 20 May 2026 23:43:20 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] dt-bindings: arm: ras: Introduce bindings for ARM
 AEST
To: Rob Herring <robh@kernel.org>
Cc: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-5-d5d6ffacf0a5@oss.qualcomm.com>
 <20260513175823.GA1471517-robh@kernel.org>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <20260513175823.GA1471517-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0df9cb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6DK/O5GeEcI+fsUIEy35yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=3A8QVl99vi6_thLXI7oA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: JMJGhtbsateDglJdSJKWAbaOGDrBWsTI
X-Proofpoint-ORIG-GUID: JMJGhtbsateDglJdSJKWAbaOGDrBWsTI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE3OCBTYWx0ZWRfXzC9gyOdpU8Ir
 DAWfVmziU4Tb1AG9HoUEm3jkvTGBHG5GYHpv/Ihdn71jenm/8dc6jt4fsco+OdW3QysVcbRAbr+
 aVmR7Y7m7h40NZAWz6LMgjNd0Pqh69xyAw+FjwFvhh36+GXNElYMCobuyIqxBAFaW7CghJF3QGr
 dkLI1T+lLOd89RQoY45dvudX05J8Ko2VEvdRFdmFQRMGQCa8vnoCiEz8cVMFdi6cXOH+Tu2Q8XA
 BpEVGzf2fOCocAZ5Wgh8eachbJwmhWD1fPDtY3xFAKpz/S0mC3PPqiBHBbe/MgE0E0CdEXrcO+m
 JJOzCu0ajVBnrkBCvQzQ8XRAlE4ZzQeozZezOvFfc8IlwmFU+mgRNaCiRkM0cWYqB2rxnUdXJ7w
 dS9M9UtBU3laVFyFg2LkKP29AKz3ie1X+1B1/0ejjJGaPlGLH+EwdroPhVgkUo7eJc/wIBULU9B
 NSRg2dVUNd+CRv9qRsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200178

Hello Rob,

Thanks for helping reviewing the code!

On 5/13/2026 11:28 PM, Rob Herring wrote:
> On Tue, May 05, 2026 at 05:53:49PM +0530, Umang Chheda wrote:
>> The Arm Error Source Table (AEST) specification describes how firmware
>> exposes RAS error source topology to the operating system. On ACPI
>> systems this information is provided via the AEST ACPI table.
>>
>> Introduce Device Tree bindings that provide an equivalent description
>> of AEST error sources for DT-based platforms.
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++++++++++
>>  include/dt-bindings/arm/aest.h                     |  43 +++
>>  2 files changed, 449 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,aest.yaml b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> new file mode 100644
>> index 000000000000..7809a0d38270
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,aest.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,aest.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Error Source Table (AEST)
>> +
>> +maintainers:
>> +  - Umang Chheda <umang.chheda@oss.qualcomm.com>
>> +
>> +description:
>> +  The Arm Error Source Table (AEST) describes RAS error sources and their
>> +  register interfaces. Each error source exposes one or more error records
>> +  through either system registers or a memory-mapped register window, and
>> +  may signal errors via interrupts. The top-level node acts as a container
>> +  for one or more child nodes, each describing a single AEST error source.
>> +  Refer to the Arm AEST specification (DEN0085 / DDI 0587B) for details.
>> +  Flag bit constants for use in DT source files are defined in
>> +  <dt-bindings/arm/aest.h>.
>> +
>> +properties:
>> +  compatible:
>> +    const: arm,aest
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +patternProperties:
>> +  "^aest-[a-z0-9-]+(@[0-9a-f]+)?$":
>> +    type: object
>> +    description:
>> +      An AEST error source node describing one error source defined by
>> +      the Arm AEST specification.
>> +
>> +    properties:
>> +      compatible:
>> +        description:
>> +          Identifies the type of AEST error source. Each value corresponds to
>> +          a distinct error source class defined by the Arm AEST specification.
>> +          arm,aest-proxy represents a proxy error source that forwards errors
>> +          from another error source.
>> +        enum:
>> +          - arm,aest-processor
>> +          - arm,aest-memory
>> +          - arm,aest-smmu
>> +          - arm,aest-gic
>> +          - arm,aest-pcie
>> +          - arm,aest-vendor
>> +          - arm,aest-proxy
> 
> This is a fundamental difference how DT and ACPI get structured. ACPI 
> defines new table for some feature and puts everything in that table. 
> For DT, these all belong in the node for the corresponding h/w. For 
> example, if the GIC supports AEST, then that belongs in the GIC node.

Thanks for the feedback. To clarify your suggestion — should the AEST
RAS properties be added directly as properties of the hardware node
(e.g. arm,ras-num-records inside the cpu@0 node itself), or as a child
node under the hardware node (e.g. a ras-error-source {} child under cpu@0)?


> 
>> +
>> +      reg:
>> +        description:
>> +          Register ranges for the error source. Absence of reg implies
>> +          system-register access (interface type 0). A single range implies
>> +          memory-mapped access (interface type 1). Two ranges imply
>> +          single-record memory-mapped access (interface type 2).
>> +        minItems: 1
>> +        maxItems: 4
>> +
>> +      reg-names:
>> +        description:
>> +          Names for the register ranges. The base error-record window is
>> +          unnamed (or first entry). Optional named ranges provide access to
>> +          the fault-injection, error-group, and interrupt-config register
>> +          windows defined by the AEST specification.
>> +        minItems: 1
>> +        maxItems: 4
>> +        items:
>> +          enum:
>> +            - fault-inject
>> +            - err-group
>> +            - irq-config
>> +
>> +      interrupts:
>> +        description: Interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +
>> +      interrupt-names:
>> +        description: Names of the interrupts associated with the error source.
>> +        minItems: 1
>> +        maxItems: 2
>> +        items:
>> +          enum:
>> +            - fhi
>> +            - eri
>> +
>> +      arm,fhi-flags:
>> +        description:
>> +          Bitmask of flags for the fault-handling interrupt (FHI), as defined
>> +          in the AEST node interrupt structure flags field. Constants are
>> +          defined in <dt-bindings/arm/aest.h> - AEST_IRQ_MODE_LEVEL (0),
>> +          AEST_IRQ_MODE_EDGE (1).
> 
> DT already has a way to define interrupt flags. Why invent something 
> new?

Ack, this flag is not needed for DT based systems, will remove this.

> 
> Rob

Thanks,
Umang


