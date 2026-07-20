Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740E393DF1
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517988; cv=none; b=tCZNyfLn5vzXJkMEfKrRqxS65jqL0kwVFeu71IB7OcCwEJlEFacWU53rlar+ynA5oJu/y/iwAJFn7JIFlJ0mgwCGdtQ+mHeet59YNK7KsgLLDJVxA66N3GaUa/t2LmKMrmjppgOJ3VM6OYVQZe8L90dRvZ0akMS/tT2uPWQKTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517988; c=relaxed/simple;
	bh=dZrI9Z0/1kEfbQCw5ka6+oBIOW2p7xcj0a58s2isDOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEHeFE3R8IFKZYIIuJuZDBSw+UCLa6NbkvDrPQswYzL5ANEqX0K/GVmWj97UlxexPKz6YZMctJktW9UHKvzAzf/Z26eZ6Md+WMrtbywLHwmn8J9KmWJiuiW+DZ36vcUZTvHw8VZI7mn9iX6SXPPD1Gv5VL2RPnqVd8AuJTE6mYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkrS8Kve; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WBy676Ya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkrS8Kve";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WBy676Ya"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNtOwP941061
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J1/0UtaiBX/1DoCXYvIidJBk
	J2ZdMphY/nvZ/j3Jj90=; b=bkrS8KveYwu3eF9uOHyZAnlesyFMH3FEZNTNBMbr
	7Yd6GuZrTNNNvrPj87hNjLPT9rtKSGBQsepZ8d7SeZMxjvtcuPke7u/SUa+KQJDj
	ZLsRA8AvCBt3ysEHdMcDHGwLPsbs7QGyGD0dHuth9KDyfRp0YuJtagF2WXgj7Eu0
	CdNvN4JQLEKMrcx2yXNUM7yPK0v4/5Up1sTXYliOnFcN340dGGpZludzQ/ovbppG
	VuanEobvFhuZq+2c34HFwz9K7XMhmdPi66P2dP4doLquz5VL7QU/FFZPVdNSIu4R
	ZGiEfpaYEDqUaVWRM7GLLRoS3eKq5z9GltOc5hsoCF4HKQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c6c5je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:26:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so1765917a91.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 20:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784517984; x=1785122784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1/0UtaiBX/1DoCXYvIidJBkJ2ZdMphY/nvZ/j3Jj90=;
        b=WBy676Yav1GPEvy5lU4N5fV3h5STq2Xq7YnAqS2sYyZ7hY9yrPnh8xqRZ6AUKa/Eib
         HmNUmGH6qPD/I8deF7RiwCOQjOx1C4qhnT+PDNqrCQGw86ef+CKQ9T4vv+37OX0jJA7I
         KFYdHqx4O0HCBtPxpluXq33eIFV5lo0IWxs3anKRqi/oV9/XTK3V28VGsXHDXiT00RFK
         uLXVLC5l7prU+/S7b6v87Z2GiNyXqR1RRWPGaFU8cu9UneKNQ+UPLUMvrMKuJdyoAuiY
         GSd5RZs18pMScbX2D+Vt+b4bOETwW4eS8cvCzsLjJUbhCSXqabfaqG50VqUU6/IM1FT+
         JcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517984; x=1785122784;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1/0UtaiBX/1DoCXYvIidJBkJ2ZdMphY/nvZ/j3Jj90=;
        b=eAtZ1RRyGc64BmbMwoSQljtUod0A/75rm2ftlkKvlyfiyO3FMDabv27OvbrJNu8tpM
         xr9+AFTXaqs0mbRhvrYN/DFfIwAC22DbN9srZJh9XnhhGoCXAvXJF0I715r6YMjtKIC4
         k3h1T2ooF79l8TsTMR8l5NzAYpxzPIorjhAcfQOTT8BGyPDcDf9vLGPTBohX1Hw8MqTK
         BulCapBo7Y94zi5/fjG4mtijTFSQv/Nsd5YThGd1y6jzUxCEjR5GtimvS148g55/Nngq
         hsnSuEnKsUrflV4vvCCw5xe6P9LdYSU2+gJhMb1virjtL4pKxgpzbgR4TC6Ca32tqetj
         ySEA==
X-Forwarded-Encrypted: i=1; AHgh+RrA49j6qEbnfb2syJEF3SLUkFTYOUaWXnHdifUHsuq91GQ7C5T3db+mvtnojQKUYP7FOsMEScQiTpMl@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1iiwovUc/TyJEQzcz/2mfduUxChWMyHz7hHDavqkB3w8y7hPd
	Hhm33QyhCfbpXmkr7NLXssqM7vsr1kbc75f5tBfbAj21t5Pv7bblcY1JDGPFvE+nj0ex9+YF4L/
	dtt+wO4OqwioVa4H3nAwOTmkaXXAbdcAeu1YGJJjCmhGVskYski232OdliIOVA/ET
X-Gm-Gg: AfdE7clN5+qkEqI256f8EAH8eKKiBNwrEN+3FSUkdmrR+jOZ5QhdUIsfkswBra8MbB/
	boAzD68OOig64x2I0BX1LexzGemk84sJZw6CoYoF6IWT43hUj2ZdGR7hqEQuzirhE7jvVPUMn62
	ySKbLMVG4ivSEAR5vAMG6XTj7LHN84Xerctv8g0bJYXyQiXhsT7Z7vWZ7UyZHKxGIM4hTKAtK9b
	89fSGdNaxgkk06ipA9oQ0tKW5JyaMdqcR346VKa6PeyiFppdTpyxIm6Iuyn145BWUGZ05XofPLs
	4+lnSC+idvQZN6Lg7HjV6E1OR6arbILCFLpmVYb4svKvhEDcS6qgEY7R5ZgwZ4/tXj9P7rv91yq
	UKYcGeNRyT6TboN4TFK6q3K3SmEP0P+wudcMwRu9FuGnyOm0=
X-Received: by 2002:a05:6300:95:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c3ad7a2edbmr13286552637.17.1784517984257;
        Sun, 19 Jul 2026 20:26:24 -0700 (PDT)
X-Received: by 2002:a05:6300:95:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c3ad7a2edbmr13286516637.17.1784517983711;
        Sun, 19 Jul 2026 20:26:23 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm24577287c88.9.2026.07.19.20.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:26:23 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:26:21 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Message-ID: <al2VXQo8rxzD3+gp@hu-qianyu-lv.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
 <20260717-glymur_linkmode_0717-v5-1-4f9e87a61463@oss.qualcomm.com>
 <20260719-sloppy-cornflower-hippo-8212e2@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-sloppy-cornflower-hippo-8212e2@quoll>
X-Proofpoint-GUID: Ebt1zZ-TO3c9kQxxGnzU8ApxgIyZTI_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX4dTZULiNRfcA
 HEauHxDaU0fiz0U14I/MPqAlEHSeSt8JfvkySeBjbEnL7YPe7OTfAt9iqq0VbF8ygcitpq/pPJ0
 zfSoxhClqmVu1hYpme2aa8d3Nr0fRTOr3baN9GyNQ5w2U6fyBNfaJoXPSTLOh+KEkkzOHEEAVlH
 50HHxNLq8vpwrgOPpqkd5OpNwNWKaVSvrtz/ywn11lguVfmh8Uo4mb3GgF1yoQmH2DrT4LWZvMG
 I9lDqccHSCOoY3NWctC57oHTS9t245TERO/ExhDjtq32he8pvpME2ofaREK1v7ZKaHBTw0j3ppJ
 Uz96H68wBichjc0eW3dh3Nyyr0Ama5X0TILZeBM34vU4IBzGCdMYxL2aZuI1Nx3n5rXsxW552Uv
 vppYgC9z35abI82SvmE6pM6F+pvA4Kmb6xgGPwRhCx777NmgVhRGLSatH4LTAcFeUcvpCkFFqVZ
 IqM8GtqJ1UxzmsNKcnQ==
X-Proofpoint-ORIG-GUID: Ebt1zZ-TO3c9kQxxGnzU8ApxgIyZTI_B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzNSBTYWx0ZWRfX8DDXZDDYH78p
 CuPsiSV5yqI+EajkN3i8go9P7GGW9otGChx0T+X/wFbwo/R00CX1x2b//I00HrSZUQil3pbn0kZ
 YZH8Lic7lCBVp7axsMC0myQwcqISVio=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5d9561 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=wwrPcLtxz8NjKbA9DiMA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200035

On Sun, Jul 19, 2026 at 08:50:00AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Jul 17, 2026 at 02:58:33AM -0700, Qiang Yu wrote:
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
> > new file mode 100644
> > index 000000000000..73550f77e9b6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
> 
> Filename: qcom,glymur-qmp-gen5x8-pcie-phy.yaml
> 
Okay, will rename the file to qcom,glymur-qmp-gen5x8-pcie-phy.yaml.

> > @@ -0,0 +1,176 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-pcie-multiphy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
> > +
> > +maintainers:
> > +  - Qiang Yu <qiang.yu@oss.qualcomm.com>
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > +
> > +description: |
> > +  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> > +  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
> > +  at runtime via a TCSR syscon register:
> > +
> > +  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
> > +  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
> > +     PCIe3b)
> > +
> > +  The node always describes both PHY instances ("port a" and "port b"),
> > +  regardless of which link mode is active on the board.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,glymur-qmp-gen5x8-pcie-phy
> > +
> > +  reg:
> > +    minItems: 2
> 
> Dop

Will drop minItems: 2

> 
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: port_a
> > +      - const: port_b
> > +
> > +  clocks:
> > +    minItems: 10
> 
> Drop
>

Will drop minItems: 10

> > +    maxItems: 10
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aux
> > +      - const: cfg_ahb
> > +      - const: ref
> > +      - const: rchng
> > +      - const: pipe
> > +      - const: phy_b_aux
> > +      - const: cfg_ahb_b
> > +      - const: rchng_b
> > +      - const: pipe_b
> > +      - const: pipediv2_b
> > +
> > +  power-domains:
> > +    minItems: 2
> 
> Drop

Will drop minItems: 2

> 
> > +    maxItems: 2
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: phy_a_gdsc
> 
> port_a

Will rename it to port_a.

> 
> > +      - const: phy_b_gdsc
> 
> port_b

Will rename it to port_b.

> 
> > +
> > +  resets:
> > +    minItems: 4
> 
> Drop

Will drop minItems: 4

> 
> > +    maxItems: 4
> > +
> > +  reset-names:
> > +    items:
> > +      - const: phy_a
> 
> port_a

Will rename it to port_a.

> 
> > +      - const: phy_a_nocsr
> 
> port_a_nocsr
> 
> etc.

Will rename them to port_a_nocsr, port_b and port_b_nocsr.

> 
> > +      - const: phy_b
> > +      - const: phy_b_nocsr
> > +
> > +  vdda-phy-supply: true
> > +
> > +  vdda-pll-supply: true
> > +
> > +  vdda-refgen0p9-supply: true
> > +
> > +  vdda-refgen1p2-supply: true
> > +
> > +  qcom,link-mode:
> > +    description:
> > +      Reference to a register in the TCSR syscon that reports the link
> > +      mode the PCIe PHY is currently configured for, either a single x8
> > +      link or two independent x4 links. The link mode is programmed by
> > +      firmware before Linux boots; this property is only used to read
> > +      the active link mode, specified as a phandle to the syscon and
> > +      the register offset.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle of TCSR syscon
> > +          - description: offset of link mode register
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  clock-output-names:
> > +    items:
> > +      - description: Name of the PHY A pipe clock output.
> > +      - description: Name of the PHY B pipe clock output.
> > +
> > +  "#phy-cells":
> > +    const: 1
> 
> You should explain in description the meaning of cell value. Or provide
> filename of header with constants.
>
Okay, will add a description explaining the cell value in the next
version:

"#phy-cells":
  const: 1
  description:
    The cell is the index of the sub-PHY within the active link
    mode, e.g. on Glymur, 0 for "port a" and 1 for "port b" in
    x4x4 mode, and only index 0 (the single wide PHY) is valid in
    x8 mode.

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - power-domain-names
> > +  - resets
> > +  - reset-names
> > +  - vdda-phy-supply
> > +  - vdda-pll-supply
> > +  - vdda-refgen0p9-supply
> > +  - vdda-refgen1p2-supply
> > +  - qcom,link-mode
> > +  - "#clock-cells"
> > +  - clock-output-names
> > +  - "#phy-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> > +    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> > +
> > +    pcie3_phy: phy@f00000 {
> 
> Drop unused label.
>

Will drop the unused "pcie3_phy:" label from the example.

> The old 5x4 glymur compatible could be deprecated as well, but fine for
> me without doing so.
>

The old 5x4 glymur compatible is also required by PCIe5 PHY, so I'll leave
it as-is.

- Qiang Yu
