Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996B403AED
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737890; cv=none; b=MB3wltOsqtQ0Se/AfXPRD5cdzKt0vsu45NaX7k1tXlUt46GKNKA6qwde/IH2K8kUldvs9VuglO58uqPIA9nCQHESImbhHfCWIZaGtBOVlFx/GCsvKPe8XInEFYfvDpnZtwMBXYPFm+sx5iumw2EMzNBwg1neko0F9TomSy1RBHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737890; c=relaxed/simple;
	bh=GN+ENysdiDdzO37pUY+h8l/bPE2nFulQeO00vlfFr1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIY+bXo570ojCKetVQw5Ir9By2nT3M0dKSwrCyXe+I1NuhPYZF5ggE1NEDnyns5IL8e/GWyYqfDXcJTUsPEsTySaTuZeg6ARDoQNzEcCOYfi9+L0HIYWfdrHYA6Z9CHnQFRU1Qqj8EbPJizkCymfVeSry6dHks9Yp5V1ioHes1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OtKc6xDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PM9tblU4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OtKc6xDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PM9tblU4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATRBe2592814
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PNfdf4Gwdi1FOTJ0GQC585fh
	e2B9GJS+MtypU4Ccw5U=; b=OtKc6xDjTQLyKv/lHqDPhJza+kazCPzh4U4QUz3W
	eFaaoszQcy0iRI7mt0cy1IUI1c2KJ3HcJ5+fxuK5bEdiygLecRmCAyPPyGLqqxvB
	8m0Ak+0Uz2ZmKoJlvdRZn7lSxb355WLcukmme1J5ORpaBGWhH4rAvri349jATJ48
	JLCcLNcLR0kV7fwXT60rI87zU8rquzKzuCAfrTVS84angfvGP4hg9XuuQS0IYuCD
	5AtarUwRikY6rSmlfi65pZXPvB+Ncf/U7WJMbdvb3l2WiVvesj1O8H96lmC8hb07
	vyxE+jVoY5xrwQoSiG1uxEEiKB0AB1CEI2Z6Dj9jOaeShg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vhqgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 12:58:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ae405b5eeso410069885a.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737886; x=1783342686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=PM9tblU4ZtEpcfkZHuTD/3ZFLFfM72Fnqp6S0ZHBAHIBoGbcM+Gc/A0BMorAr8N4Sh
         THG5x8yvWs+tezjf+XDO1gW69KkHCK/GxnB8/Frm6rUN19J6IUg6fU0D9EwYvhZ4PPIR
         Lp052sXkeICnAo9OOXHTRxhNl3Q0r4jpUs2TFPimqOj5hOFC3zr7+48A8bE8vQFGMvoU
         UQOWHPWk9nrsnrPE+nkOOH+0D9ApLFXeoqb35bbUIAy9TwJm7AyTAU43gV+DllxTqCfY
         TloJtUKUTsEqesi8nuQB+u2rnV9sOzACxY6wbGXH+mFCsj2mQIEOsjIYmWAidZvTRjy2
         zz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737886; x=1783342686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNfdf4Gwdi1FOTJ0GQC585fhe2B9GJS+MtypU4Ccw5U=;
        b=c9NTSbeiFDAx+2S3cJdRqTbHYqXvrPw7vOXQolSddrGTvId5GgyGIBIRhexEHjWqKV
         LWO5Da0UCF9a7Z06DC9KfUjXmCb+DQ9MD9kkCJT/xQZdSQAV+nhIq8Rj8jgmuIcIqKTS
         8iZV6RZtv7ezSuyOd2BKR4Y6triZUd1CR4sDecOIYjlExAC1kJknRC/Vzfdg5ArfxNxM
         IjKTh7TiiszRjjyebn8TrPp8uGLgJM/NxlMTzDTNCcB0eDsIykA6EotM755RIH1KR5Pe
         UrumTMhxGWTO6CBiqhu4++yLLS8w46lhtP/8mLP3P81I55u5Ngw6exHZ7ztsWT5OQd1U
         iSyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+0W4hydVRbE9zQ09WF8fgVB9YEyEjJN+S2TbzkakogVVqEb2q1afBUMNGgHdMURjzw7qCfRB+jJMpA@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjVQasgrMmrQ0hUHhSrmdzKce1LBFfUAXgkZjtIaw3jNV3Egi
	cSQaR5CEMjdtZMXRsEXqwzd8URBzlcxu6FqZt2/SfLNnT/ZB2m+Rq5KQkE0bCLT2EJslGbW1/yd
	GpoTL9Nj4qP4hzk9SK7wo4fkWM2PaKywX4K++5bLS3sxsmcADq+1QQpHGvtcJ5agU
X-Gm-Gg: AfdE7cki9I4inTEZbImkA7Wi0nYvbtHthmhxvbYkKHIDJvqf64uKIyPLsaXZnAyOIAQ
	P2Pg9Ul0M/fRT2k5gfHZmD6aLqShYo3UPz8OevQPDuehki7Cyugql7SCUGD0D5JiVSPUIfK2YEa
	c8SZs4PZ/KmFx+hnVY7BwnYT4H5RxA1CaEK/xdOjeVXSttCIn2rBnE4ParEJNKOJTYgWoEquEui
	6YW2OV5LHeCu3kxpsvVrkD83Sb15YDu1Q4Ta9jeLD11iLTS1S0eqnoQDcZwbv86urAmg9r7eJj8
	+8qOoIY77Pm656qKihum2SWkLnIzwIRup2F01sW0RAzOeK/L5H0lCzO4vuPic5nhxIK+U5zvSej
	SqKt+ilxKrUKveytRHEYnB9/+g5K8WRogna24fhjJnaTTjjOGtGQD0G1ZLL7zAR9TN/qMdkjwDx
	6jZVyruOajIZPSuhksEkLYMD+s
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740044085a.56.1782737885991;
        Mon, 29 Jun 2026 05:58:05 -0700 (PDT)
X-Received: by 2002:a05:620a:44c5:b0:915:bf79:3e08 with SMTP id af79cd13be357-9293e3c92cbmr2740035485a.56.1782737885217;
        Mon, 29 Jun 2026 05:58:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1a4e2d5fsm1091291fa.37.2026.06.29.05.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:58:04 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:58:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        andersson@kernel.org, quic_vgarodia@quicinc.com,
        quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: media: qcom: Add JPEG encoder binding
Message-ID: <gaod5k77yywmimg6bajpdk4keym4hirksgdxxbphw6rw6mkfal@oquq5oyies2c>
References: <20260629121750.3469292-1-atanas.filipov@oss.qualcomm.com>
 <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629121750.3469292-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-GUID: H1-r0h_x2Az8-5FMPkWikUFXoRfJuPvv
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a426bde cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=xu2w3LTtMloSOAqb-NgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX2BFFsGDuzlJQ
 IhyAPjUaDJ7rW5uW6YtxCbE3rCViDvHlbAtsuHN94sAk71uzoZAevdzTRfnTSQZBta+gKgUiAGG
 LroET96fb+elMG/VmeOSsnmR5ySbHzg=
X-Proofpoint-ORIG-GUID: H1-r0h_x2Az8-5FMPkWikUFXoRfJuPvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNyBTYWx0ZWRfX7h7aa/SuyZ0r
 julIUpP0AUqdC0X3gTMHQnCprqLPuVL4S1Uep8oprhVi7ZlDKFpH2NBiKZ9MD0hULB/M0ZEvjAY
 ZRXFf5BOJbYWgsUTLzJmZNmVNx36xAGSJI5rBEZmDxCHRhgkG+jpw5Wx5JkdDojewXx7VSXQ8fJ
 3G/UVynsKszDP9mJTvZ7+AiHzDiV9/RRWKg+CTZWSdDrfYWGKmiOTvjq65G4MMuozF1XvAvHi/X
 V9w9Mo4rtWIBkNhnZFLdnMfud5R4b9PUL9PgDueyY0SaaNpsXHk5tyE9tA00VyNNAPAnBWcv85G
 Tvwo5p2jCAjPDNtFc2IQjao0TfUO7+/KPl1AovDhxykvZOJu1oRdRMowEY64Z587C2/5Xx1muGN
 2NQDneYqqVkgYx9qKzuUVP5tIMxVF+/4RetwIoXkg8sCnUwMFjuueI/WQdeXVRz1YcEjMGqw4d9
 cLqrl69TsLz7TdsyrMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290107

On Mon, Jun 29, 2026 at 03:17:48PM +0300, Atanas Filipov wrote:
> Add device-tree binding for the Qualcomm JPEG encoder hardware block
> present in SM8250 (Kona) SoCs.
> 
> The JPEG encoder is a standalone hardware IP within the camera subsystem
> that performs JPEG compression in memory-to-memory fashion.  It is
> separate from the CAMSS ISP pipeline and has its own register space,
> interrupt, clocks, power domain, IOMMU streams, and interconnect paths.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,jpeg-encoder.yaml     | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> new file mode 100644
> index 000000000000..c8b4808054cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
> @@ -0,0 +1,160 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm JPEG Encoder
> +
> +maintainers:
> +  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sm8250-jenc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 6
> +
> +  clock-names:
> +    items:
> +      - const: hf_axi
> +      - const: sf_axi
> +      - const: core_ahb
> +      - const: cpas_ahb
> +      - const: cnoc_axi
> +      - const: jpeg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    description:
> +      Two SMMU stream IDs for the JPEG hardware. The first entry is for
> +      the JPEG core engine; the second is for the JPEG DMA/scale path.
> +      The exact stream ID assignment is SoC-specific and not publicly
> +      documented by Qualcomm.
> +    minItems: 2
> +    maxItems: 2
> +
> +  interconnects:
> +    maxItems: 4
> +
> +  interconnect-names:
> +    items:
> +      - const: cpu-cfg
> +      - const: hf-mnoc
> +      - const: sf-mnoc
> +      - const: icp-mnoc
> +
> +  operating-points-v2: true
> +
> +  opp-table:
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - iommus
> +  - interconnects
> +  - interconnect-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
> +    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
> +    #include <dt-bindings/interconnect/qcom,sm8250.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        camss@ac6a000 {
> +            compatible = "qcom,sm8250-camss";
> +            reg = <0 0x0ac6a000 0 0x2000>;
> +            #address-cells = <2>;
> +            #size-cells = <2>;
> +            ranges;

Drop both SoC and camss nodes. Rework your _example_ to work with the
default seeting (address/size-cells = 1).

> +
> +            jpeg-encoder@ac53000 {
> +                compatible = "qcom,sm8250-jenc";
> +                reg = <0 0xac53000 0 0x1000>;
> +
> +                interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> +                power-domains = <&camcc TITAN_TOP_GDSC>;
> +
> +                clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                         <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                         <&camcc CAM_CC_CORE_AHB_CLK>,
> +                         <&camcc CAM_CC_CPAS_AHB_CLK>,
> +                         <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +                         <&camcc CAM_CC_JPEG_CLK>;
> +                clock-names = "hf_axi",
> +                              "sf_axi",
> +                              "core_ahb",
> +                              "cpas_ahb",
> +                              "cnoc_axi",
> +                              "jpeg";
> +
> +                iommus = <&apps_smmu 0x2040 0x400>,
> +                         <&apps_smmu 0x2440 0x400>;
> +
> +                interconnects =
> +                    <&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_CAMERA_CFG 0>,
> +                    <&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI_CH0 0>,
> +                    <&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI_CH0 0>;
> +                interconnect-names = "cpu-cfg",
> +                                     "hf-mnoc",
> +                                     "sf-mnoc",
> +                                     "icp-mnoc";
> +
> +                operating-points-v2 = <&jpeg_opp_table>;
> +
> +                jpeg_opp_table: opp-table {
> +                    compatible = "operating-points-v2";
> +
> +                    opp-300000000 {
> +                        opp-hz = /bits/ 64 <300000000>;
> +                        opp-level = <0>;

No numbers for levels, thank you.

> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-400000000 {
> +                        opp-hz = /bits/ 64 <400000000>;
> +                        opp-level = <1>;
> +                        required-opps = <&rpmhpd_opp_svs>;
> +                    };
> +
> +                    opp-480000000 {
> +                        opp-hz = /bits/ 64 <480000000>;
> +                        opp-level = <2>;
> +                        required-opps = <&rpmhpd_opp_svs_l1>;
> +                    };
> +
> +                    opp-600000000 {
> +                        opp-hz = /bits/ 64 <600000000>;
> +                        opp-level = <3>;
> +                        required-opps = <&rpmhpd_opp_nom>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
