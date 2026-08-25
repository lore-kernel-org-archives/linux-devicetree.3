Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3760361668
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787636505; cv=none; b=LBJneck0ENxJhp+xhidGws+6hR7vg6Y+olCm9dTEzV6NWh723C9po9J6yalSPzDWFCPRRkP3J2sNYfR+IO9kbUeGxByAjaFUweW6ETtxpJIinLJeawHdRyw9WRjWGK4P1pbEr8/n3+1qaar9/opu0r7fQYWML9vMu4CrsOzsjYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787636505; c=relaxed/simple;
	bh=8j6G/z+o2BkJtZ1groUWce53Qik2Eqk2D4ZpqQbaSOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iw7OJ1W3KE6N9tf7VRKc7OuftFcU7mHBnT+WhzeyOqjQKhJ8mr0PftxP4cmduvFI6U/s9MHAPUUJhhHlSFK2KXKXUVEvPTghkWZhDnXEAQG25OcIZlp2vahPn8L+z5kEMCKbbgG4IiH+GNC3M2lttAiAcR3ANLgGF/WUkgLmiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9+oRxTd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mp2qzKM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9+oRxTd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mp2qzKM7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RGH9120846
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PsMhhVa6JfKj+h+RBwYduZNFD68eh+7/4Qf4uXqj2s=; b=O9+oRxTdfl84SJU6
	eLbq/y/wdGPDMR3AlWOC5owzdig7AFR/tcKLbA8Vyw7db1y5Wq1JMj0PGt2JdFWk
	BpPtgSrBsZdqN3t2EfsM3vmbuveQnS4N2bNoXcL5LvNGt+ZvFbGz2kb2+pHHrjvv
	qzwZlIjmSMMAAr/DL5L6FJd+/qtym91I1us2VS5h5NeKJnF+bKuYjzeXOLRmq40E
	DgAteCz3i+ycqrLMqEyqB7RaMh2sCZ9Vr4F1hdDVfW28eMM4zWrDughHil/pzNk9
	JVpJDxMadKE6waLBAu8Z+N/vd0Ejz3/u7r5GxdRQF8nF9j7biAiwVynXYSOCThUt
	VGb+tQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dt9wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:41:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so7045146a91.0
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 22:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787636502; x=1788241302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PsMhhVa6JfKj+h+RBwYduZNFD68eh+7/4Qf4uXqj2s=;
        b=Mp2qzKM7zK8WeelwTBN2rYJfIbzTklBxI89gedrcSvY4pwLxcPwX4WoufQXzfj2+EO
         fzmuOKRzaFcea5XIEYQPFoD6Wo1cs6nb1Cbb3pbURA3vSw4ipntS3aNZB+N3/eFKidvH
         ulqriKA2MWf9PxXYo1++uNLekjEM1AsbK4GdbqZ1RrxXsNWBSR3LV6eKiuWvSDKs9WGU
         /KB0Foncd5cCyzYo5uggYPvKB+jPH4JweeVSQ0rSW+ALy0j1YRP3Y7qABIHMKWLHFyOu
         Hwm5gUcfiaiomZiq9O5tf/tIbzc8NLH9drEDsLA/YRuJ7Zl5HbLMVdBVGGhbDLXT18bC
         N5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787636502; x=1788241302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PsMhhVa6JfKj+h+RBwYduZNFD68eh+7/4Qf4uXqj2s=;
        b=c83hulLNA9nrNiu/9wziBgcMCVCmM7TR35TIkqKKNdDpyHsCJDDpOo4bKqODSoUfTq
         mnmNmIi6Y97NeOoevd4Yrf+j9nDqAdufqszJwOlWUrVKkUW0LAtSGMUFsKNT17QYpA0U
         HS8aAM+cakEy/yhpgSnaxCWWS3I9znIbX9D86gvpSXaNfuaxNh94Dz48u8YlZ6aBLMr6
         AMAOXns4gkEfbFH4mMPYlWERdlCBUfYHUCeocOqmwWS0GYvw22CuYNKpkoBuJH/kIaiS
         /P1BBVWKRBUt+q2zv0viyQG1+1so6yWgSvPGNtJ7ubrEztO7TFZHTBXE1r16b1rRZuhM
         Bacg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+igVenZY46AYeueCokxIG9yKieXqNwe6VZo3AQo6FHm1CjApXuID+FhoT3zfLnzeeoM+m6NVuYM5y@vger.kernel.org
X-Gm-Message-State: AFuF++lhDU41SM9i1oMQDUJ1ZDL0WWNpBHqpIpWmas3gT/sXFtBPLEiw
	3LdJSf9RodIsZIXMm6wcHyao9TWLZOjTPwh5l5YKp00aw/4smGXveDGIPl2zsofTpngwRTS9TOq
	nHu8r0gFae1Fzk7iDbsS8xPwXn3oQ2yhGZFhuegQhMbgD8xnjs/y7s8jbA5WZrEns
X-Gm-Gg: AR+sD10RI0ElfZ06d1DzCEy3T6H1kzQ+FRWMIjghVpmzsQhRTXfWM64FAtjGLuloIWb
	hG+DQHRNarj7DDgA7rm9jHN/LJWMVWPtommAObMu9DWVC/tKB0HWvtehlcMyDgKf1NUiM6+OqD0
	fIi3tE3L/2A2AIRMs9Fmgtk3cYbfgSqsMqA01endfjvtU+NOhmm8skriuzHdUo/Eqrt4Py5uR6c
	mQSJ0SHF2XsbZuyjnDkMfbxxSVC64ZzSgKDvRWFaIXfiVURiU31051yRhvjR2Ng19d4mNLoFG+j
	vK30Zfq+M4VPJWmoSBFFhfb3T1HMn/QlFzxQk8yaIsGqS5pgXfnk0E1f/H5VCAYYRhNufNvVjjY
	EhODxDOHEFswFy/heNvq8CDOHCM/0V7HaRA==
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr55627796a91.9.1787636501587;
        Mon, 24 Aug 2026 22:41:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3142:b0:37f:e177:f58 with SMTP id 98e67ed59e1d1-395c35e27c2mr55627733a91.9.1787636501155;
        Mon, 24 Aug 2026 22:41:41 -0700 (PDT)
Received: from [10.217.217.49] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b82847sm2454358a91.11.2026.08.24.22.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 22:41:40 -0700 (PDT)
Message-ID: <cb68a100-e26f-4db3-bbbc-fd581c2adb8f@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 11:11:34 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: PCI: qcom: Document the Shikra PCIe
 Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260701-shikra-upstream-v1-0-e1a721eb8943@oss.qualcomm.com>
 <20260701-shikra-upstream-v1-2-e1a721eb8943@oss.qualcomm.com>
 <hf6szamduxopeuvkjkxxteqauirsgfq36pih7go2wf25o4zmv4@vhmhe3gyzgo5>
 <7a17da3d-c838-4877-8a62-5551dbdaa9e5@oss.qualcomm.com>
 <xxoyame76suxnhzglpccdxmvrpal3n5bgxhvcjeqyznepe2cyr@bud6ob4ecw7q>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <xxoyame76suxnhzglpccdxmvrpal3n5bgxhvcjeqyznepe2cyr@bud6ob4ecw7q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: is9qlSPNnVHu5l1Wrpsr3DSYzBPcos7U
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d2b16 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=JOUT_JFrYYanlDGIWxUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: is9qlSPNnVHu5l1Wrpsr3DSYzBPcos7U
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0NiBTYWx0ZWRfX4+8/8ry5IB2l
 oEXY9AFUKru/VBpHocCM48HvLotvDG9Ru227GJl4OoaYZgTOw9ybHs+8DvnkoP8JJyUFq0V7h4D
 d70X3RunWuQUdApkxuFdwvAhCiMHx2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0NiBTYWx0ZWRfXw0rRy5qEecd0
 axxRtTkAG1QH7MY7yaS9cP3NJ+UYh4lNwfT1PNiLvUqacGq4uX1R1smiZmhJr/v/9ZO0vaUcTxY
 gGgqlJmPUzZoeFJ9TxyCPVUYeJPb0GF7DBGICu13o1Q1cccIr/BXykUHdmSPYfBY/B84EYrmO64
 tgavleeU75OI4tVntOcQ8mPNtwnd23U05dh6p+5K3W87U60/RTzc+aNze75d0C7F1mXD0/PSVoy
 yy+zSQljJ54umtmru2E2mIxZm0lfCmPeJAHRnKPxepVn3cE/e4f1H+A2Lx3yo8WANOtRIXwyPie
 63E8qfBqvvtKgNaUx0RslGLNAPA6DHE3JB/5UFvd0xSy4fX4V6irgZPPMGKYmVhrGnd8AU1+1SM
 /CR47D01JPo6/Qfze8Ce9Um1IZiZKxFArxsvbvefwXhhx3S98+oTwvIs7WrYvVJabwFQD4PGkfO
 6Ddq4U1Y0SeV5p4fGiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250046


On 8/12/2026 6:33 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 12, 2026 at 11:25:12AM +0530, Sushrut Shree Trivedi wrote:
>
> [...]
>
>>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>>>> +
>>>> +    soc {
>>>> +        #address-cells = <2>;
>>>> +        #size-cells = <2>;
>>>> +
>>> Get rid of 'soc' node.
>> If we remove soc node, dt-schema uses address-cells = <1>,
>> size-cells  = <1> for dt-binding check and throws errors.
>>
>> Do you suggest ignoring those errors ?
> No, you need to make the 'reg' entries 1 cell.

As discussed separately, since we have a 64 bit BAR region
specified inside ranges, we need the soc node and the
associated address-cells, size-cells update to avoid
dt-binding errors.

>
>>>> +        pcie@45e8000 {
>>>> +          device_type = "pci";
>>>> +          compatible = "qcom,shikra-pcie";
>>>> +          reg = <0x0 0x045e8000 0x0 0x3000>,
>>>> +                <0x0 0x60000000 0x0 0xf1d>,
>>>> +                <0x0 0x60000f20 0x0 0xa8>,
>>>> +                <0x0 0x60001000 0x0 0x1000>,
>>>> +                <0x0 0x60100000 0x0 0x100000>,
>>>> +                <0x0 0x045eb000 0x0 0x1000>;
>>>> +          reg-names = "parf",
>>>> +                      "dbi",
>>>> +                      "elbi",
>>>> +                      "atu",
>>>> +                      "config",
>>>> +                      "mhi";
>>>> +          #address-cells = <3>;
>>>> +          #size-cells = <2>;
>>>> +          ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
>>>> +                   <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>,
>>>> +                   <0x03000000 0x4 0x00000000 0x4 0x00000000 0x3 0x0000000>;
>>>> +          bus-range = <0x00 0xff>;
>>>> +
>>>> +          linux,pci-domain = <0>;
>>>> +          num-lanes = <1>;
>>>> +
>>>> +          interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 492 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 493 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>,
>>>> +                       <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH 0>;
>>>> +          interrupt-names = "msi0",
>>>> +                            "msi1",
>>>> +                            "msi2",
>>>> +                            "msi3",
>>>> +                            "msi4",
>>>> +                            "msi5",
>>>> +                            "msi6",
>>>> +                            "msi7",
>>>> +                            "global";
>>>> +
>>>> +          interrupt-map = <0 0 0 1 &intc 0 0 0 499 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                          <0 0 0 2 &intc 0 0 0 500 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                          <0 0 0 3 &intc 0 0 0 501 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                          <0 0 0 4 &intc 0 0 0 502 IRQ_TYPE_LEVEL_HIGH>;
>>>> +          interrupt-map-mask = <0 0 0 0x7>;
>>>> +          #interrupt-cells = <1>;
>>>> +
>>>> +          clocks = <&gcc GCC_PCIE_AUX_CLK>,
>>>> +                   <&gcc GCC_PCIE_CFG_AHB_CLK>,
>>>> +                   <&gcc GCC_PCIE_MSTR_AXI_CLK>,
>>>> +                   <&gcc GCC_PCIE_SLV_AXI_CLK>,
>>>> +                   <&gcc GCC_PCIE_SLV_Q2A_AXI_CLK>,
>>>> +                   <&gcc GCC_DDRSS_MEMNOC_PCIE_SF_CLK>,
>>>> +                   <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>,
>>>> +                   <&gcc GCC_QMIP_PCIE_CFG_AHB_CLK>;
>>>> +          clock-names = "aux",
>>>> +                        "cfg",
>>>> +                        "bus_master",
>>>> +                        "bus_slave",
>>>> +                        "slave_q2a",
>>>> +                        "ddrss_memnoc_pcie",
>>>> +                        "tile",
>>>> +                        "qmip_pcie_ahb";
>>>> +
>>>> +          assigned-clocks = <&gcc GCC_PCIE_AUX_CLK>;
>>>> +          assigned-clock-rates = <19200000>;
>>>> +
>>>> +          interconnects = <&system_noc MASTER_PCIE2_0 RPM_ALWAYS_TAG
>>>> +                          &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
>>>> +                          <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
>>>> +                          &config_noc SLAVE_PCIE2_0 RPM_ACTIVE_TAG>;
>>>> +
>>>> +          interconnect-names = "pcie-mem",
>>>> +                               "cpu-pcie";
>>>> +
>>>> +          iommu-map = <0x0 &apps_smmu 0x800 0x1>,
>>>> +                      <0x100 &apps_smmu 0x801 0x1>;
>>>> +
>>>> +          resets = <&gcc GCC_PCIE_BCR>;
>>>> +          reset-names = "pci";
>>>> +
>>>> +          power-domains = <&gcc GCC_PCIE_GDSC>;
>>>> +
>>>> +          max-link-speed = <2>;
>>> You don't need 'max-link-speed' unless you want to limit the link speed.
>> This is needed since Shikra controller supports Gen3 but the PHY
>> is only capable of Gen2. Without limiting the speed, link-up fails.
> This is a critical limitation that should've been mentioned in the commit
> message.
>
> - Mani
ACK
>
