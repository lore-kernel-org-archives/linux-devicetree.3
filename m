Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0587B37AA70
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467787; cv=none; b=kY8GSvqOwokBWwsPq6HCPKk3F4Sm4eftRG1B+h4CU6zV2MJFtn+MXrEn6oVV8SNnv73wl3tiCQq2SUSNyv4I3nq4IfprFyhCCsG+4bEFSGL0cBayFhg0i8xtRVPRtTQGhehlld8lqmhWruZEyb6QW8J4AQfUOarvcCdu5TE/SYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467787; c=relaxed/simple;
	bh=BHTHri+ZfTV1XCCUNlVrsRaVpUzXRsYsnJVN6lmdlbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uxnph5WS/gOhndln1mpR+1EuMxQ/cZo7LOJ5nC5dAwdQQumC0izE9yvxe3YXxKVdVwVinH3/EfTWiFRjSnVCwY8wVP5CfhQ6nCmGdhxuNTwk2rBUt04K4ATgM7NPKrxm+WS/rUa12UiyOUiXV2gQuCXNRD871zZ/H32ALM03Ygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crb0II+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIe0C0xV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crb0II+v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIe0C0xV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667NS7Tn900400
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 23:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=; b=crb0II+vP0BN6QJN
	Pe86QFgoW/X5MGSZwF1FBCJ1aht3tGKmd+Tp0PRWp0akQxy+ZjXPm2aTvzDqmhnD
	jRrzqkqN7cjlykUDc+wiwz7GDCtJe5SXwPfDuON54NEOfkwFeWwuKtXxz+y7jV1u
	rP36rPNN3z2IVLK4bufQgimjEfK1WXw5CUSxV+szI5khyIjOrUdBn4sDrd9uJwfM
	LvS59jaVqrxcEgRsXpsdIsCzAsvVmjDrxWBJKg7rzlA+l7nCM+tpHvoMn44UFUv0
	66PRhE3W2ScSwyWheEUIXc6n+fkXryWX4PG1MAxI4SQAAEscF4HUCNYbCWGPbxOB
	mryYnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g819m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:43:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso176074a91.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783467783; x=1784072583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=;
        b=bIe0C0xVdEUZYOb9beqHvkKLMTaj4PNOffnHxbfme2AsTz764+X7ipNZLjgmV+YZnG
         1vl9FfGMIoa39mwNTlah4vadLa6BeCVmZoL/z6c7agzCOmB9gMra4lhE/fsAkvheqa18
         3UDw8Lrd19zD1uqg1JChckW+/3NZA71+e34VirLc3p/BIjvG+lie8c1S8PrXo0daAkwv
         e86MU+DE/RpLt45W6N73MmscWuoAW0eRIwl7Iqjy4Lw4jfV32FeluAp/FlpFvFrm4NU4
         cVzNq+FmxA4/PF77qe2LXQI5fRVk6mBUMJZj0dvekub4D2ygFAIc1NHvYqpbSi1GtjQS
         TmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783467783; x=1784072583;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEw6ilYXdZ3qjUDqz2rKqYftoPq3jdoTazkyvgRqJAw=;
        b=SBD01N2WLqD4CLkxTCn3xCSpYXt1T0gzsXptfZTBEbW0kD48jjFgC+bXFJNNbzTyxn
         mjhkSW17ExAOMTXqSXUu0kTnBme9wXx1+Fzx7fLCSahfSM+E4OIydhezkfodN8eEdtt1
         RZNkwM+8rSXz19STBBK2rqbow9RsJcfIlrPkGYOERPW4sZvL3vcfxemZ9yjJTla9nuNv
         FFGafx0pVqmqRueAiAEHI/qXjCbx9nEB6epolEd7xzS8cRBnmM6dS5yMRGm6w4ozz08h
         Emb4/9NwDnjMfoSuKMGHqdY6ORb3RBRmw6VMSc22DFxbgZm87BEydxSJVM16sap89Zl1
         HmCA==
X-Forwarded-Encrypted: i=1; AHgh+RqvdmfSATFag7xoLDm67Pg96rP7n7fHJG4bylAHquq/WNP1jl13W3gDOk5dYlHLJ0QGOW3j7g5Sn0DE@vger.kernel.org
X-Gm-Message-State: AOJu0YwgntBRHnmJdTjPzjBk6mUSDedb8/7MVwTYSd92q6Tf8Wqgr2Pp
	yxTZksbaiH50JvSfxk7JjYIKiYyZul8kkdE5Ef64vS9x/+IqlKhBSqFoTITxMN8P6br62pS+sIn
	r1nNVGJXy24x+10MDqGnJ7Mei8PuulaeDr8Hg1LXBmtm1t7LSvTDiQO8Zt4nvf1J7Mvyi7Q6b
X-Gm-Gg: AfdE7cnpucv6gNxkpJ0ebvJMroQfdbnzZ/LysafGGNjXek9XSvNbB7HdPmP+6bKlRRw
	03GL/z2Km/eFDxfgYAptbl46P+VwjzJbjebiUDkZ5dbhVx3zXlva4b9zVVh9DoJAEvM6P1quHjd
	MAFwIpNkRwXFL5wPKcQ7iy07NaD49BUtII0TUxRZq/SMRwYQmjL0PNikXVat4b3uTjiFKzY8Qri
	nP/t+tB41EZ6FpuMgmw4hfxeHuve93euOwmSn7G1Gg9tiGqjEHnhtNeLu879/gNSUcaaWau9qFR
	gyBhqJOGkSgk+ZgTCtqYDRkjGfP+zPGiZl1pG37zjZA9/w4CuF980hRX86v8e58I5/IFHlEaIn/
	vQOEsuK4QFR3tWaF17z8O8XefGlkMEZKn07mSLRm6HRBJk+rIqjWjBvn2IlwgjSNbjXFzR1ZptJ
	W/0IA=
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr49544a91.5.1783467782802;
        Tue, 07 Jul 2026 16:43:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2685:b0:381:bf9f:be37 with SMTP id 98e67ed59e1d1-3893fe5c1afmr49517a91.5.1783467782353;
        Tue, 07 Jul 2026 16:43:02 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm9721413eec.18.2026.07.07.16.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:43:01 -0700 (PDT)
Message-ID: <ee352411-4275-4411-9b78-2e5f7694f195@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:43:00 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260703-manipulative-mauve-centipede-f8c95e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX+dxNDdTBS4po
 GHk1aFqN1nM9j71cDYNGnyDVpVi03vzIYcFnPMeALbsvXiVSACDn4IRVL0s5Zx0+uDY0EJs+yUP
 Bn9248COAnSVy6mGsf76FKtlYMouBYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfXzzF9QBeDXeXd
 sUOIuJXgkSGLoduXjMTcvw9ltwpHm6bz1e1wXj1JkzAwACOS5IVWr43Q+2lZG4q/M6iNM4ZACme
 pPigAd1/Hv5z0rH/HTYsXuRNKO08L6BLkrFCdDY6ji/VA2MhxJmTcfjtJOE10kLRWu75nQC/HwU
 D9ta7VGWKARooBs71Ue3fER7VkW8uZCxDCJzZshf3J2bovekmvq+3stSy3k6KlPbOQxveM/5Cs2
 tm8z2n+D93zSRQPTtDmnRPcm46onilNvJAyUKFCm6PXqmWwpFHcgGhRE8XfeUXFndeywNe9x/yq
 bpVJabxlZJQpAMxHPd8yE7forkA54L8M1mub9s5Mp/kaz6ZfOvz8Owmsnr8y+YC/tkfnrdxNSqD
 5dovdkUHNrhMvGRZ+PPhJexz6l3ihoF64Bov3+6pG+ozImQFH6fUxRw23mZAUzkgIOcg3harve3
 cCi7ElxJ1k4OGXBNg5A==
X-Proofpoint-ORIG-GUID: xWVbEDKq58bEzziZ0DubrCCdno_vMbPD
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4d8f07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1DRqv9_6FyKhlAIeCz8A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xWVbEDKq58bEzziZ0DubrCCdno_vMbPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070233



On 7/3/2026 12:45 AM, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
>> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
>> independent High-Speed UTMI paths, depending on the SoC configuration.
>> Each path is distinct, with its own connector/controller connection
>> and role-dependent UTMI routing.
> 
> You miss SoC specific compatibles in the patch. Binding describes ONLY
> SC7280 but you claim here it depends on SoC (not sure what is a
> "configuration" of a SoC).
> 
> This should be also restricted per each variant as it depends on number
> of controllers in each SoC.
> 
>>
>> Because the EUD sits between the USB connector and the USB controller,
>> it must relay role changes across the UTMI path. In device role, the
>> EUD inserts its internal hub into the path to enable debug
>> functionality. In host role, the path remains directly connected
>> between the PHY and the USB controller, bypassing the EUD hub. These
>> hardware constraints require per-path role awareness, as UTMI path
>> roles may differ.
>>
>> The existing binding models only a single UTMI path and assumes a
>> uniform routing model. While sufficient for simple device-role-only
>> configurations, this representation does not accurately describe EUD
>> hardware when role switching and/or multiple UTMI paths are involved.
>>
>> To address this limitation, per-path child nodes are introduced to
>> describe individual UTMI paths through the EUD. Each path includes its
>> own ports description, allowing controller and connector associations,
>> as well as role-aware routing.
>>
>> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
>> ---
>>  .../bindings/soc/qcom/qcom,eud.yaml           | 55 ++++++++++++++++++-
>>  1 file changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> index 84218636c0d8..21f75038a81c 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>> @@ -45,10 +45,63 @@ properties:
>>          $ref: /schemas/graph.yaml#/properties/port
>>          description: This port is to be attached to the type C connector.
>>  
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^eud-path@[0-1]$":
>> +    type: object
>> +    description:
>> +      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
>> +      to associate role-switching behavior with specific port connections, allowing
>> +      EUD to manage role transitions independently for each UTMI path.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description: Path number
>> +
>> +      usb-role-switch:
>> +        type: boolean
>> +        description:
>> +          Indicates that EUD should act as a role switch for this path.
>> +          In device role, debug mode inserts the EUD hub into the UTMI path. In
>> +          host role, the EUD hub is bypassed and UTMI traffic flows directly
>> +          between the PHY and the USB controller.
> 
> role-switch is per entire device, not per path. Either device has role
> switching or not.
> 
The EUD wrapper relays role information across each path, and
role-dependent UTMI routing is performed on a per-path basis. A single
EUD-level usb-role-switch therefore becomes ambiguous once EUD spans
multiple independent paths, as it does not describe which path is
participating in role-relay/role-dependent routing.
>> +
>> +      ports:
>> +        $ref: /schemas/graph.yaml#/properties/ports
>> +        description:
>> +          These ports are to be attached to the endpoint of the USB controller node
>> +          and USB connector node.
>> +
>> +        properties:
>> +          port@0:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB controller.
>> +
>> +          port@1:
>> +            $ref: /schemas/graph.yaml#/properties/port
>> +            description: This port is to be attached to the USB connector.
> 
> Add one more example with eud-paths and its dedicated compatible.
> 
Ack

>> +
>> +    required:
>> +      - reg
>> +      - ports
>> +
>> +    additionalProperties: false
>> +
>>  required:
>>    - compatible
>>    - reg
>> -  - ports
>> +
>> +oneOf:
>> +  - required:
>> +      - ports
>> +  - required:
>> +      - eud-path@0
> 
> - eud-path@1
> 
> There is no point to provide eud-path@0 alone. Ports are doing that
> already.
> 
eud-path@1 is not applicable to SC7280 as it doesnt support EUD on
secondary USB port. But eud-path@0 alone is needed even for single-path
SoCs when role-dependent routing is involved.

The existing top-level ports representation only describes endpoint
connectivity. It cannot describe path-specific behavior such as role
relay and role-dependent UTMI routing associated with a UTMI path
through EUD.

The legacy ports representation is retained for compatibility with
existing users (if any). However, the goal is to make the path-based
representation the preferred representation going forward, as it
accurately describes EUD hardware when role switching is involved.

Additionally, like you mentioned above we can restrict paths based on
SoC hardware when we add more compatibles.
Something like below (SM8350 maps EUD over both primary and secondary
USB port)

oneOf:
  - required:
      - ports
  - allOf:
      - if:
          properties:
            compatible:
              contains:
                const: qcom,sc7280-eud
        then:
          required:
            - eud-path@0
      - if:
          properties:
            compatible:
              contains:
                const: qcom,sm8350-eud
        then:
          required:
            - eud-path@0
            - eud-path@1

Thanks
Elson
