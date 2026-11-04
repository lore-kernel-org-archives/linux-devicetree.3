Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795505;
	b=SbRPuwXnozjQ/zaIP1Q8scKdn/WRwgSOPpxwp46UDzXmeD5/eOeUyPfFnLmN/znrXGqB
	 qXmZNbq44o8dMG+dx80A/Qcb8ehR9lZaTslE3h4Gb/jRMIvHrDQK0YMNfZf/FMZUzR0qA
	 uhAlqcOOOpr0kK8yCTEhq2CY7hyrrBRiQnwsoTpLQ7YgzWIUSa69fKPhP5wq2keCLEZpM
	 0docKl5TF9/8KMm8iBtY0z9OicCZn6zpChOOKSmTGukLnNZ5L4uzMwsAO5uWBhlGaaVyA
	 DDi+ksgeVQU6W0wtIFkGhOz0a4USjqV2k211nmnFYMt9Y8ShreWulTX4Wr40bbk6BWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795505;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
	b=3rnhjRbwdUUQJBZpJD13SXy7lq5Cim2JGUp5l3m7XS0j17PIkooYGn074lF3AkLZmfj4
	 N9Agm6SC2yyjH3udIYn3sGXJNf45cjeJiQS5cVyLRF7qQXvuf+u7e2FOIxTCDl/ubopH8
	 jffmCuXJLqOlkc8EbeASiKIqDEUK2ZW4II4oqZy398fh63geCRWBy0o06ku2K+l/1tm8W
	 8clALa+bHpNxaC2Kldktkh92aGjzhoSxjB9joyhdQtFlXYFFSBuDGFqx7SOophTNzZLLa
	 SQH2cnR0akvV85tgPWV9T3o4KBvplwlmwxUtXAXoylCYDoxFv31ACae8IIQmNO/3wOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i/BGHETs";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C5606A31B
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 761C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i/BGHETs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZvZ51700409
	for <devicetree@vger.kernel.org>; Wed, 4 Nov 2026 12:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=; b=dK6LpR7AFtsbeFf+
	pRbP3a65/RSfyMrV7sEWkjXVmlyFSwPYC3KG61yqkxRWGe871n3QNtt4jAOEdm2T
	CXtt+2SIY1vwaaYMbQAPvvjvTr6e9zY/YeHdRCXN27ZcPrpJhMnOf8A44HCejBk8
	3tbtA1fjqf9k87+UK4Q0Ty4EuCpXMXjXBwfsJTXH7ct9UAG/MvSe6k9yQxzXx3IA
	cRfseUmvUX9GDl/YwY18g5vBhg7SfpdEshtczwPJVbeoumu4fV5MBLKrtsXNjzvh
	5AvgtXvGIG1vPv60vCx2+t3LHNbx3mavUBsWXaw5bxprY0iRr1I7cg7PWPvfUBXp
	wZpGxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyg9cs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 12:31:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abfcf726dcso971458a91.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 04:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795488; x=1794400288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=i/BGHETsIyo+JPvpwNauVeWz3rx0JsHdEE/5ODyalhqaD3OJSnLj/AGBgND+XiXCTY
         F4ltv/NhIaGCG7WIJ2Dz7cB+O+zJTw0VfEcwzxjoEwX9MzTmr5SmsHnC8S/r4hCn/S6r
         L/sM5zEfeW5RMULordkQ3RPmSyXli8983iq4lXhJOS9GROd2f5SxL7M4eoO3hCVVp8WI
         1waS/bU/AoqYGJ9Uil7xew/sKWYUvFdUqNwNuFzaLm+7ZtN44fcdusuVwz0tcbz/a6rh
         S7ri49qXLFQGN6JpPd3n1aYFx96l38cpHGjhSr3365VE9SrxdaFSlo3FhYTsRJ9uQZvR
         R67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795488; x=1794400288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=NvrGAn4LK2X1aSTs7IyTqAHvHpgrFXfJEx8BrzZC89aOt1JsW3cBfl/m0QOIhvTU45
         uvdxqxilRDx7/jOh/yW3/vWZt1Y5YVnZNil1ZKDKYozs4+ggMonbVfV9bH3QUd1JHaUt
         bIVlYbDgMuAFR7kg2KQk4R6DNQOKxjwlSxQqDE5F1BEuBq+bnnnCNWSfCfuNRKs4yg88
         nTe/58zAjOiS8WdZy5NnHTBEUKWw1+NhIvB0OemWAZT6K+YaENrIfgK1PYksDQTrVvgf
         MwWP0Hz626Y331MQmJ6GRRBB0i5EhF7fHoPvboLL3tO5emPFYFuAw/wcTyAquZpEEZma
         5fAg==
X-Forwarded-Encrypted: i=1; AKwUvBxvLOfTH+cIDY2bn+BFxDSKPloL3c54IlKhesr3oh2HaGgO37B8BYk3iPCfBtlZKY/uyhvGUURMu2sx@vger.kernel.org
X-Gm-Message-State: APuU4Z9P8yB9IUxnKN83j5k6a1XzOP1sNJJQ0gRrU/gOY3o7BQWzFibv
	/qUsblUmsq/uZ5IbME9N4CWtcPkAIkVJG7vkSNSxdJOSnVTEGpuKpMOK/QwVym3ZlvXPwzoE72J
	5RG1nrmkVBkUlr0erUgNLDukvItQ34KfkLKXg+De8Zn28ziKwxyHy8ObbCRKHacqy
X-Gm-Gg: AYBFou2BvcolGQ7zk6XQVkKgKKayghii8IohHQPVPQsUS5c2Uq6Dmkc2A6LV1xIEbdy
	0c7udnP2mAA7MKlzhYpMvMnVw1VcYRTC377jdmVNc7dGSG+q10zWRdka3bSYgBhdFc/zAP9MHdL
	doa+bSUfUcscp4YH81ke3Es4Hso3wRlIwuxl91kMex80XR+CcFK6MPhdSipNNB71ekfeBX65/CW
	R+7co5b/JMpdBz+30TYGj8SWGt4zcPWiXTJh7zU0Ogvdwr3rerQYPOflbMJresXDr6AD6KWpEUd
	mRfKWyT4PVD0X5EOhtbApttYCqPHRkLI5Gt1mP6PEc2DM1OzIuDborGuPLjogllob5NM6xTRnpW
	X1ESlpBApr0Z0hr5kHNh64V1yM1CywSW/LlTRxbkMGjzFObYgiy/g22AqlcLpT/usFZuILhElHx
	tf5QE3
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667811a91.20.1793795484684;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667780a91.20.1793795484065;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm9423184a91.0.2026.11.04.04.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:31:23 -0800 (PST)
Message-ID: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:01:15 +0530
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
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb25a1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=rw-enEzn-TZYpfUHzgEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX/3tdJL/MyvxI
 n48N6sAcTLLHgKHRI8eOhDoaRtY0WFVfwDfsw2ys+1JF2tIOwumtCXSk6Pb4h8pN8tNT7anHV/x
 7rntMdgrYtZOeZ/F2Slt6MAw0Bc6hDWBjwWXeqgkxLpi9XtYnB9OENBiEIBZpjBbvP6Ym3zKJHL
 R8n94ySGC89cPsrVVv4O0P6Db3YvTU2ijNb45gPZ7Q5s6od4eSPCfp+Lr1iXVdwpRyq8QrGlHfF
 gVONP9/y/Y2UNzs/PU/XHoSE/VX/CObPqgQSY6ovgwvr8unUa0jfHJKvs8I0b0+1qBmlUiww+xc
 P2LB2Y7UZi7FlovABfI2ReyRj13/xFSRIhU5rAUujjMV2If4gjlSfpjHL0opU+OfsWGfY5JIX3q
 zzHW+CmvZLQVKcQUkz6jDNjtXV5a9xKkPCPiNeBy1jaVMrQ0mBRNj1hvJjj1uOYMCnYP4dHkGzK
 MUY9oIXwQI5/vDvVvyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXwhZI9gzhneIe
 dlHHr/GyT9fSKzxNveD33XhWpJGhSKYDH1xdYH+fzuXZ/2MNKLzv7qr+HVstgq3IjVRt5pAu/YU
 Qz+LL1u7lXqK4QbDHw9SwCAgXxLuG24=
X-Proofpoint-ORIG-GUID: 6XQRflCbS7czN6vp3yzW914rMHVELR0E
X-Proofpoint-GUID: 6XQRflCbS7czN6vp3yzW914rMHVELR0E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Apologies for the additional email. I missed including the cover letter 
with this series.

Please ignore this series without the cover letter. I have resent the 
complete series with the cover letter included.

Sorry for the inconvenience.

On 11/4/2026 4:46 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm GENI-based I3C controller.
> 
> The controller supports I3C SDR transfers in mixed-bus mode with both I2C
> and I3C target devices present on the same bus. The binding describes the
> I3C controller instance along with its associated In-Band Interrupt (IBI)
> controller used for handling I3C target IBI events.
> 
> Document the required resources, interrupts, clocks, and dependencies
> needed to represent the hardware in device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..bab89aeee23f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) block
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    items:
> +      - description: SE (Serial Engine) register address space
> +      - description: IBI controller (IBI_C) register address space
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  interrupts:
> +    items:
> +      - description: Core Serial Engine (SE) IRQ
> +      - description: IBI controller (IBI_C) manager IRQ
> +      - description: IBI controller (IBI_C) GPII IRQ
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "qup-core", "qup-config", "qup-memory";
> +        pinctrl-0 = <&qup_i3c1_data_clk>;
> +        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
> +        pinctrl-names = "default", "sleep";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...

