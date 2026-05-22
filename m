Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE7E395ADA
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441465; cv=none; b=dP71Ocpo0/fCTLn/4Fy2zlG8x0SvzlZ/egQT/5fkfv+i1ZTOznDKjReIqrWE3rHbN2X96S/wZW5bwUqkk2wfOSz2ABeQ8fQD7i1bSy5URkRM1sXIqYIeoUTinSFQIY6qOEAvt1uNM/420lkxWyC0wU0FPW6uIJqIG2siAeqpCwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441465; c=relaxed/simple;
	bh=x3RGqmi02L+B1ceM7ajx1UAM/CpjTvdaSV2SXh5VD9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPFJ/7n9MzkLy0OuwdnJPVmSmWK/qteCuOt5qaX5SvJAnq21F5IOHWbiua52FP1Na8oGW9YsTsWZ1XRQnGS/m5ydUeLBjUvO+7Zj4sOmVG8IGFVzmCBD891oiUSVASawXAahbblyNn5ZC3Yrs2YX2NVM8Fd0XC9cGePImTzQlEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea7evTwv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhLLag7q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea7evTwv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhLLag7q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M77d6m778849
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=; b=Ea7evTwvhGg3h4GB
	byPpTgL7JAzMdGkJwWSTbOsT8P8VAa8n4DxEFfmKHHD9/eTWrCg2Y7jNTtZmgRWw
	jzqHX0KdeSkKgZmgZkujA4mazWYR4ao5khAgwrb0bs9t0LjUfYJihtasCK78bbO9
	q9p8/ORoU0LCw6fZJDo1JZf+AU1xoYsvX2qOGRESonCyR/lf+ShrhKNit/N9cUaI
	PE3+NI8MfKHOUyFGiiZ+KiwNnbYeCrtIp3LjPo+EoFjXJw2B10Mv8CKi7P0p5RCn
	Tyfna8yy0FQ5JkgP6wQ5lwfEuWgOqqA2WyFGWppOzqRZVtydGy1iILboXfE8pn2s
	ni3bJQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at07n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:17:42 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-369ef27fd09so5394313a91.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779441462; x=1780046262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=;
        b=dhLLag7qso9k7z5667xb44CPdYArIWqyFY4Jz2Oz65XPyWOU68MLe2czhQhmI8bsdJ
         1WW5HcpqpR6tow1LF80xQ7PIzpuGaaKFpcfDjNXF3gQaHZxvo2nyVRtFs2IEKTdsJ1vU
         gslwe1LvMarZF7LA0M7YWUN46ag01D7CgcpiKP3znO25bHY77EbKfTzKmqoy5xSI+XOQ
         FtD4MN9kJ7vwUOw3g++mygKcY6sh74C72eHWShtVf9e83ZkW5kTRxRiAnnP7+H5MpQpd
         d6IzLsTWbN3r4fupORxoCqNrGffS6mYcIU8dVq5acbhfA6Y/rqBphWlk7p5wsEmbQjMM
         NvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441462; x=1780046262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzvTTIr3cJGUQwmNxyvJg4Lnn3zUHh4faG+9J1SDeU0=;
        b=Y9n5FC9O6WTeXh2qJd82gy0iMnVL7m3tFq+hpTs2S+ZpkFN/eeGjK5HhKlNm0jnMHR
         UtbFBeSGLtg1Q0u+G+7ig4Trd9Pi2D6TQFGLlm8Mai2pWTSme7jRYLzrW4Q74yViArLd
         wvHDOAD57tlHrJJaWpPwpsUtaTUzOh1gCxDgTpMUlEfysMcXIpe1DB+xVaa7wQA88QtL
         zBvn8ivv0LpYiIsdzgFfW9H/tRNQljutDDns6fxZaNh4azx9vOOm/sgrD9SDX/YR6ZCV
         oiNW4YngYWjQfoRRnA4num+LVo0Wa9Trom3YZD1ZaNlfkv56m7QTatssp3zCK91pqYWC
         cW5g==
X-Forwarded-Encrypted: i=1; AFNElJ+Tea7b+W4+SZBsMP7LIiwmpxSN9dOVZQ85YjUtCNwfg3auMAJf8d+Uhq1E6il9rm67F3xXdRaOBs3i@vger.kernel.org
X-Gm-Message-State: AOJu0YyQQLy/CYMzj8bhYc/gOwKWzzKp0jRS3VuOlVn3roQG5AOWq5RH
	t2hneWWLBZiPWxvvnhe8M2FmUK25AynXLyVVXUXbnjgCony7zfcvU1i5SDMC7wAyZ5y4X1nU9UA
	U2q7AYD/mnZzBuYwPGCh36n1JPaXJFGEkktOoV1KrUc0V17Hg4qGHcHTOOS5i5Th+
X-Gm-Gg: Acq92OGROC+2wyn1dNrRqNpXtMB4RT6DyNCPapyEn/ufhQPMCo+eiCsfvBzFuhpfazW
	HMR1CPL6mNAVSaJ6vuObchsKrtUCpPqLbhwGxWnz9tAtVME2Sn0lMMp0qthtRJ7atYqQaWcNzZ4
	bPoTOfrC7VV8a5hGkIS5RPJ2laiosXGZISuYlidpWgtsONR+YyPuzRy9T642xe5aN/3EPuibFw7
	XZT+10FA38U9XLfkRuX4fe7IciE99SlDKl23oIoYbFtA57LMuQkH2d693ZuT80rDBRrKydcFUmj
	vxB/UeQSrjrFEzWecddo4+8Z266Ldda5vJitxF7oTYKDSHjaWLau4ifmd4QCtIKCU7MeV6b1m00
	v/oE1hpp+4fDHyh8iZvXIaWKIKzujh7GdMFLF01tnO7CoMJbYdg85Dg==
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr1680138637.45.1779441461906;
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
X-Received: by 2002:a05:6300:6d8d:10b0:3b2:8675:47ef with SMTP id adf61e73a8af0-3b328ed49damr1680096637.45.1779441461364;
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
Received: from [10.92.193.94] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165003369sm1548246b3a.57.2026.05.22.02.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:17:41 -0700 (PDT)
Message-ID: <1cf87303-2394-454b-9541-4a3ea4f3ff4a@oss.qualcomm.com>
Date: Fri, 22 May 2026 14:47:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: PCI: qcom: Document the Eliza PCIe
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
 <20260521-eliza-v1-2-97cdbe88389d@oss.qualcomm.com>
 <20260522-calm-bug-of-kindness-2dfae2@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260522-calm-bug-of-kindness-2dfae2@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E-TKmLh5cDOzmhYIPebWvg5FMxq5X0AK
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a101f36 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2kbbHuhoKpOpG5pfR5YA:9 a=YgbPQC_rjE-wQlsd:21 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: E-TKmLh5cDOzmhYIPebWvg5FMxq5X0AK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MiBTYWx0ZWRfXxB+w7lJB0FGN
 j5lwDsyXMO6ZnHPDYDE0EjHNTgVK+gVtrfyvKkOv4FCWfVJhsd+o+7/Tm79iVM295C7WNYyzrIg
 82NEXSYJiQeaWsi34xKnXmzMijS1wlxCra64o15wbXfMlKRgmlk8w5H4NZV9o8zdoSe9JXewujE
 2BvO5ZKA/uBT8k5iMzHocgHRVPa+wRn/dG4xBkoBmhinB7xG9tbXdDcekBcwM5Vl2ni9E6N1HdM
 P5bAem/wFzQY5RLOL1ZFI7Tecinqx10Kp5VHfHjVDFeHMWgN4S28ddisB5Xwb8VJbPENJodM1cP
 GqNs8H1ZzdqadNVqpRMKU9nJBc0rCWhu+IyseROqqIjB+MP+RhyFf375vKx90xLS/cT/XYBwnnd
 Hz/7Gfe6vbWrgMtC3MTqHienht5YUrNlEbOPEHDoD4fAcRauQ6LOe29m8wyRPv1Ap8jRN1vJtN1
 AlNeSIHW4plR6VSEtEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220092



On 5/22/2026 12:20 PM, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:35:30PM +0530, Krishna Chaitanya Chundru wrote:
>> +description:
>> +  Qualcomm ELIZA SoC (and compatible) PCIe root complex controller is based on
>> +  the Synopsis DesignWare PCIe IP.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,pcie-eliza
> All new pcie compatibles moved to correct format.
Ack, I will change it to qcom,elize-pcie
>> +
>> +  reg:
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  reg-names:
>> +    minItems: 5
>> +    items:
>> +      - const: parf # Qualcomm specific registers
>> +      - const: dbi # DesignWare PCIe registers
>> +      - const: elbi # External local bus interface registers
>> +      - const: atu # ATU address space
>> +      - const: config # PCIe configuration space
>> +      - const: mhi # MHI registers
>> +
>> +  clocks:
>> +    maxItems: 7
>> +
>> +  clock-names:
>> +    items:
>> +      - const: aux # Auxiliary clock
>> +      - const: cfg # Configuration clock
>> +      - const: bus_master # Master AXI clock
>> +      - const: bus_slave # Slave AXI clock
>> +      - const: slave_q2a # Slave Q2A clock
>> +      - const: ddrss_sf_tbu # PCIe SF TBU clock
>> +      - const: cnoc_sf_axi # Config NoC PCIe1 AXI clock
>> +
>> +  interrupts:
>> +    minItems: 8
> This should not be flexible. Neither 'reg'.
ack I will remove minItems
>> +    maxItems: 9
>> +
>> +  interrupt-names:
>> +    minItems: 8
>> +    items:
>> +      - const: msi0
>> +      - const: msi1
>> +      - const: msi2
>> +      - const: msi3
>> +      - const: msi4
>> +      - const: msi5
>> +      - const: msi6
>> +      - const: msi7
>> +      - const: global
>> +
>> +  resets:
>> +    maxItems: 2
>> +
>> +  reset-names:
>> +    items:
>> +      - const: pci # PCIe core reset
>> +      - const: link_down # PCIe link down reset
>> +
>> +required:
>> +  - power-domains
>> +  - resets
>> +  - reset-names
>> +
>> +allOf:
>> +  - $ref: qcom,pcie-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,eliza-gcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        pcie@1c00000 {
>> +            compatible = "qcom,pcie-eliza";
>> +            reg = <0 0x01c00000 0 0x3000>,
>> +                  <0 0x40000000 0 0xf1d>,
>> +                  <0 0x40000f20 0 0xa8>,
>> +                  <0 0x40001000 0 0x1000>,
>> +                  <0 0x40100000 0 0x100000>;
>> +            reg-names = "parf", "dbi", "elbi", "atu", "config";
>> +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>> +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
>> +
>> +            bus-range = <0x00 0xff>;
>> +            device_type = "pci";
>> +            linux,pci-domain = <0>;
>> +            num-lanes = <1>;
>> +
>> +            #address-cells = <3>;
>> +            #size-cells = <2>;
>> +
>> +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
>> +                     <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
>> +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
>> +            clock-names = "aux",
>> +                          "cfg",
>> +                          "bus_master",
>> +                          "bus_slave",
>> +                          "slave_q2a",
>> +                          "ddrss_sf_tbu",
>> +                          "cnoc_sf_axi";
>> +
>> +            dma-coherent;
>> +
>> +            interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "msi0", "msi1", "msi2", "msi3",
>> +                              "msi4", "msi5", "msi6", "msi7", "global";
>> +            #interrupt-cells = <1>;
>> +            interrupt-map-mask = <0 0 0 0x7>;
>> +            interrupt-map = <0 0 0 1 &intc 0 0 0 564 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
>> +                            <0 0 0 2 &intc 0 0 0 565 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
>> +                            <0 0 0 3 &intc 0 0 0 566 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
>> +                            <0 0 0 4 &intc 0 0 0 567 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
>> +
>> +            interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
>> +                            <&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
>> +            interconnect-names = "pcie-mem", "cpu-pcie";
>> +
>> +            iommu-map = <0x0 &apps_smmu 0x1480 0x1>,
>> +                        <0x100 &apps_smmu 0x1481 0x1>;
>> +
>> +            pinctrl-0 = <&pcie0_default_state>;
>> +            pinctrl-names = "default";
>> +
>> +            power-domains = <&gcc GCC_PCIE_0_GDSC>;
>> +
>> +            resets = <&gcc GCC_PCIE_0_BCR>,
>> +                     <&gcc GCC_PCIE_0_LINK_DOWN_BCR>;
>> +            reset-names = "pci",
>> +                          "link_down";
>> +
> Drop stray blank line.
ack.

- Krishna Chaitanya.
>> +        };
>> +    };
>>
>> -- 
>> 2.34.1
>>

