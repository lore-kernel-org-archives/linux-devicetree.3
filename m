Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E458545DF65
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526007; cv=none; b=RAAUchgfxXnmKynk0Vok+WA4Lx2aywhZZHZ6Y0ZpOML3pQIIzrR7Zt4TkJ0ew2Uf0hTX2RdTmREs+b7z8XbqaeGFLNp2d9U6fLxZHIt/PR95eWeZWOkI4CI5PkNU2yRpUW435DV4RnZF+aZ4KQD4xZCNn0fMgXR+07nSjinRiFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526007; c=relaxed/simple;
	bh=SYr1TZ5XNZanWRUb/B1PiwAwrHRseZfqo8tAGnidSxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hP7TzjAOccFhuUE0JJEM4vkEcJC0vNectsdT6Cfd3LhSCIiH1uUTqHBBTIqSdoyql1Z4CujMdwtWNBdDVDAIyTDf5P5mUaNuZY4KJkWDmsn0E/IFPlhOnL7A8+b9NVVlxFrH6F0bsXuKqXekaOZO3DZW1VvDAiH/z00HrkaxRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhvtXagk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN/snx/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhvtXagk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN/snx/Q"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIdDsW959255
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1a+pjvqfvnIeH9xM7I1DK9VZhGOz5/cQtowc/XoBuXE=; b=PhvtXagk+2gdIRiN
	8ozpA17aFh2/R2pGIhJ35ZSPmMPnRLNbclC2Ir+vEfrordqGPgvJvLdNF/PcbH8a
	8RW3T3y4BJORvwn+W0ak+5frpfb4BHo6rsNEiwCe9+dDmb0XYyCRy0GTprf5r7bw
	6NHm4mcRyvv2tWQHMArQmf4OPqoss4/m2drLkXirKjQwKWFPPwx5yz95jHCGEXsz
	D9gmnAbIesNAbcsLNozN34psKAWbBgBKhSszGoR+QzfCmLwT0SVeAaLhfValKa4N
	hjOv0M1iSssTXIT1vqQIfoG2WHCPs5+EiHMTnGv+mcebhm6w4cVkkcuGg76Ho0nH
	spJZSg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1324pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 19:26:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8db414c7so17707981cf.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785526003; x=1786130803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1a+pjvqfvnIeH9xM7I1DK9VZhGOz5/cQtowc/XoBuXE=;
        b=BN/snx/QDdsCXExQ0dfkN0FrKg352XXGtEqY8RCo0nTVOay00JW6kXHynJouaW/p8B
         JykKI6PlL06osYzzSwy3F6/Lp93ttz7ysODedxz+nVbrhUnCSw4ytNiM53kuQuKZERUi
         Tx4EQrU4Ip82FiwN416GHQDl8NDvAlV8K8IlmAJ+VwTjo5Vc2QOncZ8aPqkGL7Vpnxv8
         Uf1VtgcFit1Lv32TqkITTQak4b63LmQAw1LMPKBEkEdcJS3u2Ur37aOQYuXc6T5VxhCA
         aCBNgxdEDiSyB0KhXBOdHtBLVPLbX93hfBNE61Hqkl8H8wX5jt+C6cbjMK4l4v0onoDO
         ZTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526003; x=1786130803;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1a+pjvqfvnIeH9xM7I1DK9VZhGOz5/cQtowc/XoBuXE=;
        b=ZO24WbVDk03NNj2PGFXX4160jC6G5KyJrFHpq/W3WEXWIjvnE8i6o62sQ+YKGTw5ia
         5xLS3KvWDcEasbq77KNmoZx+MJ5964EucQgzOgbwhjrbNtwhGxm7WIP71JYk41xouRxu
         YzrSdQZr0m5Gk3di92h0oHyD3nZg6I0WHIuk3sBxj1eocucgDJC7ptyfSsVK8XbF6iix
         Mu1elC+G4WK0xR7iwRy3tvEaz0Hrl8auPiuLUBJoyg3M99wOuuNefNddxaf/9gzdZAuN
         9D8WTXhDo8RcoFtecnlR0mbI2lNqkgPOdXPyMEaXBIMYzLCcrW72wt8t2VfUkCWFlQeo
         utdg==
X-Forwarded-Encrypted: i=1; AHgh+Rrf2LJ7vLlVAF/Xs9ZztLKeaLQLD1z7k5QR/jUx6N0kjQxO6m0/6s6UTZ4q/Xw7opqFKMQmCCI/NI/Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YxFqMcOQRtYZDfzw6juZmfRh2+OnzpqcPYEI059ctYge3U1b
	mxKx48A1bcteKEw6ePs407Cy+/ZTo9qRQrFHDK33N7Br9V8YMgEilG03TVZEnri8onSHi6Vtowe
	O3cRO53ljBxC38B2/3XA6UG1cDsRM/hgEaa1awhyaIDU/m5EPdn9OwO/ZB/QiMxBq
X-Gm-Gg: AR+sD12MZO6qPXrWznXr4UO6dI9XxURw+psc2QssTEBtJHulSj+aczJzqPxAq9xUReq
	AYLdnkAMngqlcMSeG1O4ap8q2WZkvzIwmxyvypLAFTwaK0KphqOtYa57ezYjTwv243Fc9jhxCtY
	x/dY9qZxUtn52GRiUNzvSOck4B2UjmNvuQRPgftcGI5dXSREFj+74BVpP5rqzp1E6emJBXimfjO
	gymbsDdi8W+fMePZGlqSXKfaeFmHubN5H7e74qpH5QbaEhMUS9YMgSqUlL6MXzh9RULijP9PTS4
	MZxuSiJredVMfYbgwuXrH4fCwDEnKFruCavCGhMYwFw1Rk4rS0Gdh5FY3bKt1IMIifXAu7/fyUC
	xTGxun0TFzp/z37dGAPnMtmNVXUGz9VgGBHWWeY+NJ2cQJpMkQO/uEzD3+MnHdtaFMw5wk+Pz
X-Received: by 2002:a05:622a:c07:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-52b56770802mr32401201cf.29.1785526003046;
        Fri, 31 Jul 2026 12:26:43 -0700 (PDT)
X-Received: by 2002:a05:622a:c07:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-52b56770802mr32400531cf.29.1785526002466;
        Fri, 31 Jul 2026 12:26:42 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fdfd6c57bsm190842866b.17.2026.07.31.12.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 12:26:41 -0700 (PDT)
Message-ID: <fcc464a8-3d1c-4b6e-ab2d-ef61c4b18b2e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 22:26:39 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
 <3cbnmjmit4gsldga5nzct4odg6hpixzlwxbj72elnogyevr2tg@6esyjj2mvyom>
 <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <deee4b5e-167a-4f37-b2fa-84f06ec33721@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfX8i5Eulj4Uf9N
 g32sLSs3Ht+LEFrGMQLRF5HDdHGGAhTA236Pe57TBKzQAuK9lLBQ4tWMtMnHqyIfvh/KGtZkP2N
 pPYr7Qb50HRSVQ9UGLJzNy+kGufpmFw=
X-Proofpoint-GUID: 3uKRmbXulYYdyLcHNxC2TU28p9xlWtAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfX4EWokuHj5llq
 u8DUUMN5uxHl7mxsJ6VKBIEQRXcgUahXZcGdwEa4SUKtZBSojhbshbeUikVk35F02n0aRDJXZD6
 4uTrGO4A07lcIRqUyDVd3Cl60l/gDUagJyl00UGP8ND1JDIlvRxD8KgR5janCO9ujfOAuU4c+s7
 tNLKJhTrm0BLz2BkyAgg+gMcdZjLgjoQanm2cg+1nf6JQ2V1+2BkOmo1M3hUAjaLSonlpulznfR
 DFsZFt+/2epjeYY4cNe5QpVHqutlno5bnrXWxf0OstHJFCv8hYywnYIsMyRMQanG0FS7Yp+N95o
 fjvFf3GwDeVKFMyw6z47b9F4GaZCuQZ7naFWuj+8eCqxLsSxaiMf4ML3YjSmXcrldcQegovV6Pp
 +MY6WkOFsuGdFi7KvT2VzeHcY+VvJ1hX5Dgt1ocWKE0FsbeHgj5jgdVzNH1B17feAw9Ibp5FrXn
 GwpltBR4sgjs7vTobsA==
X-Proofpoint-ORIG-GUID: 3uKRmbXulYYdyLcHNxC2TU28p9xlWtAV
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cf6f3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=D19gQVrFAAAA:8 a=EUspDBNiAAAA:8 a=mxSf8TMmKuAiwe-N5oQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310147

Hi Dmitry, Atanas,

On 7/30/2026 7:24 PM, Atanas Filipov wrote:
> On 7/30/2026 6:39 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 30, 2026 at 06:05:22PM +0300, Atanas Filipov wrote:
>>> Add device-tree binding for the Qualcomm JPEG encoder hardware block
>>> present in SM8250 (Kona) SoCs.
>>>
>>> The JPEG encoder is a standalone hardware IP within the camera subsystem
>>> that performs JPEG compression in memory-to-memory fashion.  It is
>>> separate from the CAMSS ISP pipeline and has its own register space,
>>> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
>>>   1 file changed, 156 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>> new file mode 100644
>>> index 000000000000..70f573100573
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
>>> @@ -0,0 +1,156 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm JPEG Encoder
>>> +
>>> +maintainers:
>>> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
>>> +  The encoder is a standalone hardware IP within the camera subsystem that
>>> +  performs JPEG compression in memory-to-memory fashion.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,sm8250-jpeg-enc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 5
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: sf_axi
>>> +      - const: core_ahb
>>> +      - const: cpas_ahb
>>> +      - const: cnoc_axi
>>> +      - const: jpeg
>>> +
>>> +  power-domains:
>>> +    maxItems: 3
>>> +
>>> +  power-domain-names:
>>> +    items:
>>> +      - const: titan_top
>>> +      - const: mmcx
>>> +      - const: mx
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: cpu-cfg
>>> +      - const: sf-mnoc
>>> +
>>> +  iommus:
>>> +    description:
>>> +      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
>>> +      for the JPEG core engine on SM8250.
>>> +    maxItems: 1
>>> +
>>> +  operating-points-v2: true
>>> +
>>> +  opp-table:
>>> +    type: object
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - interrupts
>>> +  - power-domains
>>> +  - power-domain-names
>>> +  - interconnects
>>> +  - interconnect-names
>>> +  - iommus
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>>> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
>>> +    #include <dt-bindings/interconnect/qcom,icc.h>
>>> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>>> +
>>> +    jpeg-encoder@ac53000 {
>>> +        compatible = "qcom,sm8250-jpeg-enc";
>>> +        reg = <0x0ac53000 0x1000>;
>>> +
>>> +        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +        power-domains = <&camcc TITAN_TOP_GDSC>,
>>> +                        <&rpmhpd RPMHPD_MMCX>,
>>> +                        <&rpmhpd RPMHPD_MX>;
>>> +        power-domain-names = "titan_top", "mmcx", "mx";
>>> +
>>> +        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
>>> +                 <&camcc CAM_CC_CORE_AHB_CLK>,
>>> +                 <&camcc CAM_CC_CPAS_AHB_CLK>,
>>> +                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
>>> +                 <&camcc CAM_CC_JPEG_CLK>;
>>> +        clock-names = "sf_axi",
>>> +                      "core_ahb",
>>> +                      "cpas_ahb",
>>> +                      "cnoc_axi",
>>> +                      "jpeg";
>>
>> What are the pin input names for these clocks on the JPEG side? Can we
>> use a better name?

The name of the the clock on jpeg side(based on documentation we have) is 
cam_cc_jpeg_clk, There was comment from Krzysztof "https://lkml.org/lkml/2026/5/15/1112"
to drop cam and clk, so it remains cc_jpeg or only jpeg. 

As i can see in ope patches ope_clk is named as "core", do we have some general
guidance how to name those clocks? or if you have any preference or proposal it will
be included in next patchset.
>>
> 
> In my opinion, there is no such thing as a better name; the only 
> important thing is that it matches the HW documentation. As can be seen 
> from the clock names in the FW shown above. So, could you be more 
> specific about which names you would like to see used here?
> 
> Regards,
> Atanas
> 
>>> +
>>> +        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
>>> +                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>> +                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
>>> +                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
>>> +        interconnect-names = "cpu-cfg",
>>> +                             "sf-mnoc";
>>> +
>>> +        iommus = <&apps_smmu 0x2040 0x400>;
>>> +
>>> +        operating-points-v2 = <&jpeg_opp_table>;
>>> +
>>> +        jpeg_opp_table: opp-table {
>>> +            compatible = "operating-points-v2";
>>> +
>>> +            opp-100000000 {
>>> +                opp-hz = /bits/ 64 <400000000>,
>>> +                         /bits/ 64 <100000000>;
>>
>> So, you've identified the issue earlier. The shared clocks need to be
>> scaled, taking all users in account. Please come up with the solution
>> too.

One proposal is to have camnoc icc clock provider, there is implementation
available and it will be posted, What is the preference to have different
patchset or to have camnoc icc provider as part of this patchset new version?

Regards,
~Gjorgji



