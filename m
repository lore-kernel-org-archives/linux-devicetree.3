Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440C3470423
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784811551; cv=none; b=WFZPwbofNlKxN627WkxuU6NoTBQg5KE8aZ3+nIBdn/mYVzDFSWU628Q96qyfDby1C+DfrMBAcwJ2LH5NKZk3MnN0VAxTyntapX1dmyk1VCCl9yZjnGwfqGMoU89OxUHMq3tJHsSrZa5heOA/ZxeDdtTjmaIYk+/TNRxKyF68OlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784811551; c=relaxed/simple;
	bh=hO0qbHDOWAOZ04oPeQxtbQV8YaPmpUySFo5BOIm1DxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWJbXwWkA6c4XluCkzSfzcJP2SoYnldq/dt5wyij0N2AJeX4NlFcAj87HyCDsORdd6hNtCrQBlY815iQlxlkgbiZoc59LMJOBSsGaYkbVoRh6mco9HDfJEi3YyiivHewp8l4b7DP9RpW5ZU+EeOwqFpUfGebTZ6Z2ke/AbcPosc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otl+5I2M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C64tkVLe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otl+5I2M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C64tkVLe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvmxH038591
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y9caaeVu42W9UxBCOZ8lVhg5Y4GvFYNcm8Ok1jeCt1M=; b=otl+5I2MkrD3G/Al
	Seg57LrhR8odE3xCDevJwscSBxIk3cdshTUmGszhRKXcDLi9hUbBQGeh2VoxDA8H
	46h0DMv6VN+lpC72AO86xg/xE2YHgsqXIlaraL39SiIKXifv5p9/9vTFuTxYu5yJ
	2THLberjkT/b1C7r+GfJUpfHVGT6DQ/NstAXyGr53KMUGQcO6/dqLxN2ok8st4Jl
	th1wciSH13HaaHVIm/NFxl+NYDIA1IqXCJbsExyQKcg6l755O+YPQeGYu9fPC2hg
	Z7+E3U6yE0wUT9tU2PjvV/9UvafbJZ4VPx07QZgRjoNFRRf7fNJ91xPa3zv1/L74
	O8r0SQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3a7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:59:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so531321b3a.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784811546; x=1785416346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9caaeVu42W9UxBCOZ8lVhg5Y4GvFYNcm8Ok1jeCt1M=;
        b=C64tkVLeDCBVM6zZd521fXvqEfr3UK/BzkFSMDjAEgb+lvmlC7Vfj9Azqr29y9kwdN
         Mw0bhrIOO6FZ/HhsBlL+4tk2Wv+2k86SiNq/ap4plBZHCoqNUhP0SZeYHGKPbmh4S8tT
         C5zC9UBodGamjoywnTx+MSV/5FAkfy+/KYWB4z7WrljVDtO0CLMICAk8xeW7qOMS7ek4
         B/kwYbKIObLJsDu2hIftUPnaVXS94icwbkCQFakoPoPl/V1myLNFTUIkzBAJIHPu6C26
         0fyRyydY9mhEBIBHobBfIjsZR59BM/Cmyt/NhCx2XarDycuhWRfrFwRumU229ralMZBi
         KCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784811546; x=1785416346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y9caaeVu42W9UxBCOZ8lVhg5Y4GvFYNcm8Ok1jeCt1M=;
        b=pgDPX2NWOD+xxIzdYFS8lZtU3XvbQuQBDboj1IM85uGMxrqNv0oAwCiXoXeJfzc6ZO
         C1ElA1CYpJ2qDWzOBXgl5Tw/8Wkz4BUWVhWDj4V+LR70UGLZOtVjl0RHBwhJF/MXSmGe
         qmR++nmhLLrIiClJVwa62XCFwJichmSS6kkEnDoxqgQbVStt/7KPJFdodXXGfg1OyBJX
         VtpxfZdDqF+rmkEbAoBruzM8oS9u8zSozmREsTS9/u2Qqc5cZBrvjkS9IZ7F9CFfDCWz
         ERfZ5AJcjdo49TZvEP51kbKgEXK6nsPAPd5IfS/Cpc9GwUulolYgPoLoSaif9V0l1r1v
         dBww==
X-Forwarded-Encrypted: i=1; AHgh+RqAVIN19+TWPEWxjOberVqrv6ftwRV99fS96VNuQWtdWAdfC0VdNy4P8uixyKTNQIsA3E21lVn7cPN9@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL0IqVSSuxsxKAozlE0aYErNPec04LL5bLONqxYNAxWn7vKMx
	1wAfMKrtQqvf0o2+cV8edhaSIsrtisK3xfGTcc2Q9kgB47egkThE29K3Hn9PJTeLuiWLiEyAjkZ
	bwl4KL+DkJ7CIhpEb/GYAmDeqSlgQngiaxWwHsXS5yyM4G8k4cNh4sxxNg1L6OAt6
X-Gm-Gg: AR+sD13HbpW2iYjI8fAuOG4Ql9di+giD2kgu9zjjMq5SdKU/p4UOwVk+8EpUtMr1rw+
	6y1FPO5n98daumyMYvWknctqL6Fdyg1mGdbJ3skSXh2kuYFDRFZjWG1MaV5ZQyHeAlTZkrwJPd3
	dtkL2Uk/CD7wMzaC87d+ZUAQdFTFCl4dw3w99NloS8oBEkRbCcY/hHNqQqEr3IZ/05evH2r3JnX
	CvvHatIKASq5ijgLHQ8z4I4eQ5FcDEP/b8RnKZVB0UQ3moLDrRmi2VVsaEol4EXCZdRW7oxClMv
	zZQBjTIlIV5iLai9XqroST51etCmstidEt6G4CDHjYZaMLQaMCRd0gIuWUZy6x/XtkMfbvgDagB
	PMud22ucTmqN2P70ZjJ9oaXECW8WSZ2G2noSMVPmfEPxaHhDLZA==
X-Received: by 2002:a05:6a00:1802:b0:848:4809:51da with SMTP id d2e1a72fcca58-84e2bb371d2mr3280715b3a.50.1784811546000;
        Thu, 23 Jul 2026 05:59:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:1802:b0:848:4809:51da with SMTP id d2e1a72fcca58-84e2bb371d2mr3280681b3a.50.1784811545431;
        Thu, 23 Jul 2026 05:59:05 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.139.18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175ea5c7sm3018535b3a.53.2026.07.23.05.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:59:04 -0700 (PDT)
Date: Thu, 23 Jul 2026 14:58:58 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Message-ID: <4r5jtbvifem2p4kmtdfzyxizksxt5ppk232hckcm4htkw66exl@d7ugkvct66dx>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
 <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vf6QYm9fXcrrNk9lq_Df3GFBjZOr3X0O
X-Proofpoint-GUID: vf6QYm9fXcrrNk9lq_Df3GFBjZOr3X0O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyOCBTYWx0ZWRfXxbu7hGTO/rFx
 qNkXAiDQ65M5klj6H1tT9t4PkKDFn54PYzuiZ5niRl5qc4Jia1pe2B4xkvy2UrnEl/JuiOBtep/
 j/rJKDOw3N4BILTXddHWNwfFrt18WVg=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a62101b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fabVTapF7hbH8ecADQZKXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=t2Phx_BFCjayA1OyaFsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyOCBTYWx0ZWRfX4Vtead0QFi/t
 H0FS+dtxBw7bTrTt/m+/gC+aR9WZnHSWSM70xhkVPZlhzjB1tSC/hA92ZLVVCGOjGammLzNcPIX
 oAJhCFXjbsyBB42Vg/bimiNlEN2sIz6JIF8ZwYTXtHD2+rcG/eCnBkMXhn51U0guWELm1Dr0TZT
 677a8OrSPTCvc2Q+uNb7P3hVSeye/7w59N8Ovpw7Dr+fzpsrDMeGqNPfad+TqSx9g0AMBXTG9AU
 uEUI2mlt6cNuopC86RKBtZJzK4zyFrESPHMK6odUuVP3Iwl2xZLF++jt0hHzP3ihcik91OlYvil
 +EK+RlfMyrzeuQtb6bx7f0OnwVWIchufsv+i5p2Y1u9xT2ASlLCSxpQIXXs6nQ1dbX2gngJB+vh
 anY2QW0Pdaplc5dmyKX3CSZeLGerqBa6bhI8hSgxz9fJNft8TvDLttz8PHXG5Fmg7MgEd/cWJfe
 fLdsfHrrwIU1VWX7+PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230128

On Wed, Jul 22, 2026 at 07:30:18PM -0700, Qiang Yu wrote:
> Add qcom,glymur-qmp-pcie-multiphy.yaml as a standalone binding
> for the Glymur Gen5 PCIe PHY hardware block. This block supports two
> link modes, selected at runtime via a TCSR syscon register:
> 
> 1. x8 - a single 8-lane PHY instance is exposed
> 2. x4+x4 - two independent 4-lane PHY instances are exposed
> 
> Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml
> rather than folding it into the shared compatible list there, since the
> two PHY instances active in x8 mode require twice as many clocks,
> resets, and power-domains as any other entry in that file, and adding
> Glymur-specific properties like qcom,link-mode and reg-names there
> would only apply to this one compatible.
> 
> Document the required clocks, resets, and power-domains for both PHY
> instances, and use #phy-cells = <1>, where the cell value is the PHY
> index within the active link mode.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  .../phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml       | 177 +++++++++++++++++++++
>  1 file changed, 177 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
> new file mode 100644
> index 000000000000..759f7f979dc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
> @@ -0,0 +1,177 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
> +
> +maintainers:
> +  - Qiang Yu <qiang.yu@oss.qualcomm.com>
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> +
> +description: |
> +  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
> +  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
> +  at runtime via a TCSR syscon register:
> +
> +  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
> +  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
> +     PCIe3b)
> +
> +  The node always describes both PHY instances ("port a" and "port b"),
> +  regardless of which link mode is active on the board.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,glymur-qmp-gen5x8-pcie-phy
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: port_a
> +      - const: port_b
> +
> +  clocks:
> +    maxItems: 10
> +
> +  clock-names:
> +    items:
> +      - const: aux
> +      - const: cfg_ahb
> +      - const: ref
> +      - const: rchng
> +      - const: pipe
> +      - const: phy_b_aux
> +      - const: cfg_ahb_b
> +      - const: rchng_b
> +      - const: pipe_b
> +      - const: pipediv2_b
> +
> +  power-domains:
> +    maxItems: 2
> +
> +  power-domain-names:
> +    items:
> +      - const: port_a
> +      - const: port_b
> +
> +  resets:
> +    maxItems: 4
> +
> +  reset-names:
> +    items:
> +      - const: port_a
> +      - const: port_a_nocsr
> +      - const: port_b
> +      - const: port_b_nocsr
> +
> +  vdda-phy-supply: true
> +
> +  vdda-pll-supply: true
> +
> +  vdda-refgen0p9-supply: true
> +
> +  vdda-refgen1p2-supply: true
> +
> +  qcom,link-mode:
> +    description:
> +      Reference to a register in the TCSR syscon that reports the link
> +      mode the PCIe PHY is currently configured for, either a single x8
> +      link or two independent x4 links. The link mode is programmed by
> +      firmware before Linux boots; this property is only used to read
> +      the active link mode, specified as a phandle to the syscon and
> +      the register offset.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of TCSR syscon
> +          - description: offset of link mode register
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clock-output-names:
> +    items:
> +      - description: Name of the PHY A pipe clock output.
> +      - description: Name of the PHY B pipe clock output.
> +
> +  "#phy-cells":
> +    const: 1
> +    description:
> +      The cell is the index of the sub-PHY within the active link
> +      mode, e.g. on Glymur, 0 for "port a" and 1 for "port b" in
> +      x4x4 mode, and only index 0 (the single wide PHY) is valid in
> +      x8 mode.
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +  - vdda-refgen0p9-supply
> +  - vdda-refgen1p2-supply
> +  - qcom,link-mode
> +  - "#clock-cells"
> +  - clock-output-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,glymur-gcc.h>
> +    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
> +
> +    phy@f00000 {
> +      compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
> +      reg = <0x00f00000 0x10000>, <0x00f10000 0x10000>;
> +      reg-names = "port_a", "port_b";
> +
> +      clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
> +               <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
> +               <&tcsr TCSR_PCIE_3_CLKREF_EN>,
> +               <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
> +               <&gcc GCC_PCIE_3A_PIPE_CLK>,
> +               <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
> +               <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
> +               <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
> +               <&gcc GCC_PCIE_3B_PIPE_CLK>,
> +               <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
> +      clock-names = "aux", "cfg_ahb", "ref", "rchng", "pipe",
> +                    "phy_b_aux", "cfg_ahb_b", "rchng_b", "pipe_b",
> +                    "pipediv2_b";
> +
> +      resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
> +               <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
> +               <&gcc GCC_PCIE_3B_PHY_BCR>,
> +               <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
> +      reset-names = "port_a", "port_a_nocsr", "port_b", "port_b_nocsr";
> +
> +      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
> +                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
> +      power-domain-names = "port_a", "port_b";
> +
> +      vdda-phy-supply = <&vreg_l3c>;
> +      vdda-pll-supply = <&vreg_l2c>;
> +
> +      vdda-refgen0p9-supply = <&vreg_l3c>;
> +      vdda-refgen1p2-supply = <&vreg_l2c>;
> +
> +      qcom,link-mode = <&tcsr 0x5000>;
> +
> +      #clock-cells = <1>;
> +      clock-output-names = "pcie3a_pipe_clk", "pcie3b_pipe_clk";
> +
> +      #phy-cells = <1>;
> +    };
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
