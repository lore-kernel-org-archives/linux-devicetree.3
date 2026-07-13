Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BBE3B38B9
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783931898; cv=none; b=j5pC6Qnxcw28j78owrUFP+rESrqLN+bUavLkNh48VH0NYPU1fPOLZJqijw9CW9+k7hnzM11R631U4D+9Z0ewKoWSXTHrG2C98cMHHYkZt0jSXG9Xlzm5BxWnAeL2wWz6lsqg9Vak7LdJitNMZFOKz/SQ/uTK600x+OH8PN4grx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783931898; c=relaxed/simple;
	bh=w9gymKIIY8qbVxG+ONMNM7bkins/+X393rhhygMu0u8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTyw5WSCNELa+V7zkqPdmXYwiOthZS6jdkJqRtlkW1b9MgIFNK/aaDUbGyZgN20OagJMbXOHOOfRKu+vNApTPjuco79vHSjSTD7eKV8PRlfKFUp8rXbCw7bMcZ5C5nwiCBEuIskS98UvHH97G6MXKYd3Pt1z5UFo77Mw8eiBaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGe8fOXZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxyVw3KS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGe8fOXZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxyVw3KS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KhpQ775116
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=; b=NGe8fOXZDVZke2TI
	vA7XP22Wgo0nlckpbfs2mkA805wV5rVsSgjwBpv5xCRmmC2GpKFDaJ40qNzpNRdQ
	4LQlOE1GWOA9YAJUXOH+jMTklPohs4ye++UDZMv5kgpxi/le+xjGRVDHTDqtzbrV
	rhtWKmeXEc8iZRKdr8h7Y1Ruy9/gkTTAOQ/LKl8v/IfS3RD2vas6h1MzdsEk0HYK
	NVHrX+xMh9DoHEqTf/jollWt/vP53ahMDy/bnexI+RPMLAVX2WZZTWJi7s6yIGVF
	mJsRbgLTHa8ivTWXGel+pX3Q+6UjPzMwtJepNCjvCZWeSBRs7+pZyMMEbEyNZMoc
	l/OErA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj009ub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:38:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c12e43b98so46683311cf.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783931894; x=1784536694; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=;
        b=JxyVw3KSm8bsUWy/XNzYxx1zykJMqWG0cJCo8G0kg6Y1WU7zxLY2WZTKz88hnmHnOW
         aAnqSb8ANe6klR/tl/kOFK9U9z1SOMKnsbtCiMfBgHdPiVcGLDM8epffQlYfr+2Plm3r
         EAhP1RbSSXqOQJotD73IrMcQyhFZpj4hRzx3b48rSrbIf67DQA98zws1MCq4CbMDzhR9
         Dx+PDOCuJtHHBwCvqKyABAs/pCr9uUKZY5De+p828B5rRp2yXcdIDIaelEE/8uIIe2Be
         Q9ej0eJzFZRIysr1C3eAYVcet5kGL7bMX1/D5bAZhoFUUSRFCPI67IipqrT0ncijrgQK
         Rh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783931894; x=1784536694;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPN1d+VaQFa2WiRxdgb2v0onTMD3U0YsB7IwP3R0BTo=;
        b=mEb1S+hiwHAYPcklxdhNUTSm1MfyE9b+YdlSVtTflfHBVAk2yWILLTdfcR9wesFC2l
         wVc/VBCRVPRBuT9F8xWGp+JJ2cfNb0H5t3hCAKzpUB1eXIc0iPPJKpZLUlCeVIU+EGHc
         7hRac5FlmbC7tikZ77kc9hdLJiDcQD6yuWasEWWqWdKsdY1bOMpjTybUSpJ95j2IEMUC
         3WHUjnjjmWZuAl1Y7lvSZRb4mC1WoleN96qkZwAwp7WZjMFHScbsHZPr9wRxri+PxrKz
         +anh1VWPICJxSHweiKLVRR3lqPgge73HbTqQG8J7uIjKJWOXM0upZK2LaQkZlP7b05hE
         2lBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZqWzZa/mmG0BXy91IWMGaDupSm5OwNAd055S2QkB2I+F99WcUmWmakWWRK3LcHSa4sy8LWld8W2ma@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJPr27+gQ8IMA0a2Agq91FpjHLROxZnordkspiOIXu+mZ6luW
	t5lTMCp8VLd1lmMXavEtNTvmSQmtR+3gADqjAXvVoMq454cOjXF6HSRKWPsUstyB3py7dNAbkzJ
	L+8bZKP+UlKwNdJDdzmacmnzXuL9TSacZRC8FKvUaueayW+OGt5AI9rvLfPLcoTc/
X-Gm-Gg: AfdE7ck3xPd+s9KijXWWaw5125ZbmrNi/jWH/nIERtC/mYWXk7tH/WXPTJ8SIvQlXTV
	URsDSkx+b2Ksdi9JcaLUPPGBcKNGLAdjlKYwy+SCo4Cnwb2xLnI5ura1pQ7W/uO37wc0C4NwAJU
	3PBKInuLOHdcXNQU1q1CoIFKgQRCwCsOQ78k7/AmbyWV8hSqgGwPr+yxv0uz3sRm3Q6bl/M8hFd
	YqLSvpwZTrEWCgnMwtJlFmW/SzJq/QwP2i73SycFgzjCHHIpRCnHmrzY1nbSuJMd4OI2uPe82Hf
	psxdDwGyFfSSR99c7J+ENhitNmnItNai1s6YWtZzD44+06yVs/9pOOcGg0Eg88IZnQOxp+us/4Y
	rKYtouaY5uficMvz1kNg8gv44kumxba1bHA7sKuWbZD0=
X-Received: by 2002:a05:622a:259b:b0:51c:9ad:d77 with SMTP id d75a77b69052e-51cbf280a7dmr79968621cf.51.1783931893880;
        Mon, 13 Jul 2026 01:38:13 -0700 (PDT)
X-Received: by 2002:a05:622a:259b:b0:51c:9ad:d77 with SMTP id d75a77b69052e-51cbf280a7dmr79968471cf.51.1783931893405;
        Mon, 13 Jul 2026 01:38:13 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3e54e83sm742060466b.42.2026.07.13.01.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:38:12 -0700 (PDT)
Message-ID: <ecf8cad1-47cc-4b07-bab2-d0fef6648bae@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 11:38:11 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: media: qcom: Add JPEG encoder binding
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-4-atanas.filipov@oss.qualcomm.com>
 <alOpwQx-43WNPHcL@baldur>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <alOpwQx-43WNPHcL@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX3WyqzIwXzpDH
 EvgrnDg+mOtO2SKN3CkWQgyIlLQY/HXh7+lz2K8emoCI7z6OPs/PeGqsremb6luvoixMuKwn5ux
 V6pkfnKgp//7bFotVcHAhTyd3ivAhFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4OCBTYWx0ZWRfX23KLnz5RtMGC
 nYAZh1TM/z1IJr8FLynuaA9xgfw5Jk5eR+cTiNGW+kD+btAPaHFACXmzJJbJ1J3oLzrsJnCkpl6
 ZB6c2z9jksElBwHwPqslHpZgIJiVkfFdToDbvnJMitaMCoKxE/AfQ46voseaJW+HPodsZkvnPM6
 8NyaJrpgCErBayVbllOtsnCpvDIqFDlry8m0SuX1YGbXlW90O49R3m6Nhc5GRrxKfVCESC3YgdP
 SicdHesmGH8aAGEjRbr41rdgSMUxWPT6A7DTt0QgJbLVPhTuRJdTuAnrFr/Uvyp1CA5j6+JzY06
 EKsd8YfrIp2twlbQ92n1shuo1DZ1SJGbtyVm9qTOyyHemC+h3fALVDo1IyHp/K2EgdKTGJjfRO7
 7kOIBAe5iQRD2RlRaiz/MnK5ISiS55Rak6x/bhoOumzErHCeNx53fFIUGT2cg0xYOiAFI7bpfPW
 1m+PuTo3PnxhQvVTdJQ==
X-Proofpoint-ORIG-GUID: 5dGkM0FZaxZMj8HBpGCTdPxMBM44QQZc
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54a3f6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=2iqQDksCm9cAjr31UZcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 5dGkM0FZaxZMj8HBpGCTdPxMBM44QQZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130088

On 7/12/2026 5:55 PM, Bjorn Andersson wrote:
> On Mon, Jul 06, 2026 at 10:11:11AM +0300, Atanas Filipov wrote:
>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>> present in SM8250 (Kona) SoCs.
>>
>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>> that performs JPEG compression in memory-to-memory fashion.  It is
>> separate from the CAMSS ISP pipeline and has its own register space,
>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,jpeg-encoder.yaml     | 151 ++++++++++++++++++
>>   1 file changed, 151 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> new file mode 100644
>> index 000000000000..e4c16388ef07
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
>> @@ -0,0 +1,151 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm JPEG Encoder
>> +
>> +maintainers:
>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8250-jenc
> 
> I suspect you find it obvious
> that this is the block than is used to enc the js, but I don't.
> 
> We have space, can we please use some more letters here? How about
> inflating this to qcom,sm8250-jpeg-enc?
> 
> Is there a qcom,sm8250-jdec as well? Is that a completely separate
> block, or is this IP-block actually the qcom,scm8250-jpeg block doing
> both encoding and decoding?
> 
> Regards,
> Bjorn
> 

Good point. v5 will use qcom,sm8250-jpeg-enc.

Best regards,
Atanas

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 6
>> +
>> +  clock-names:
>> +    items:
>> +      - const: hf_axi
>> +      - const: sf_axi
>> +      - const: core_ahb
>> +      - const: cpas_ahb
>> +      - const: cnoc_axi
>> +      - const: jpeg
>> +
>> +  interconnects:
>> +    maxItems: 3
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: hf-mnoc
>> +      - const: sf-mnoc
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interconnects
>> +  - interconnect-names
>> +  - iommus
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +    jpeg-encoder@ac53000 {
>> +        compatible = "qcom,sm8250-jenc";
>> +        reg = <0xac53000 0x1000>;
>> +
>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
>> +                 <&gcc GCC_CAMERA_SF_AXI_CLK>,
>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>> +                 <&camcc CAM_CC_JPEG_CLK>;
>> +        clock-names = "hf_axi",
>> +                      "sf_axi",
>> +                      "core_ahb",
>> +                      "cpas_ahb",
>> +                      "cnoc_axi",
>> +                      "jpeg";
>> +
>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +                        <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>> +        interconnect-names = "cpu-cfg",
>> +                             "hf-mnoc",
>> +                             "sf-mnoc";
>> +
>> +        iommus = <&apps_smmu 0x2040 0x400>;
>> +
>> +        operating-points-v2 = <&jpeg_opp_table>;
>> +
>> +        jpeg_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-100000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <100000000>;
>> +                opp-peak-kBps = <76800 104166 104166>;
>> +                opp-avg-kBps = <38400 33569 33569>;
>> +                required-opps = <&rpmhpd_opp_min_svs>;
>> +            };
>> +
>> +            opp-200000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <200000000>;
>> +                opp-peak-kBps = <76800 208333 208333>;
>> +                opp-avg-kBps = <38400 67138 67138>;
>> +                required-opps = <&rpmhpd_opp_low_svs>;
>> +            };
>> +
>> +            opp-400000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <400000000>;
>> +                opp-peak-kBps = <76800 416666 416666>;
>> +                opp-avg-kBps = <38400 134277 134277>;
>> +                required-opps = <&rpmhpd_opp_svs>;
>> +            };
>> +
>> +            opp-480000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <480000000>;
>> +                opp-peak-kBps = <76800 500000 500000>;
>> +                opp-avg-kBps = <38400 161132 161132>;
>> +                required-opps = <&rpmhpd_opp_svs_l1>;
>> +            };
>> +
>> +            opp-600000000 {
>> +                opp-hz = /bits/ 64 <400000000>,
>> +                         /bits/ 64 <600000000>;
>> +                opp-peak-kBps = <76800 625000 625000>;
>> +                opp-avg-kBps = <38400 201416 201416>;
>> +                required-opps = <&rpmhpd_opp_nom>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
>>

