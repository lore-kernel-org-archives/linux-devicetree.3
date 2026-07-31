Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CB3537CE
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474839; cv=none; b=I8WHSy3UXZY5TW98kPRFgILzj1VMssiqKA60EW8vZk6lsF21GYGPxp0tJyityXgaZf8Hnwsel7CoTcLYJBXHInhuWtzM3nuznaYoqSnBkHedr0YNlGZofNXsrqPb98UPqYz6HD2Ab8mKou5sR+ts5guNTq3byscHhfBYgnfhEnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474839; c=relaxed/simple;
	bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbZ4w/dXoVYhXGKO1MquyGIDG0BQqC+IilPCUavKNLoqrk041KqXfi5OSu5g3WEIbQnoGoB8SQdmn8FcK/cSrDV7VP90eM3Um/6iNFLqYR5/qcHRNYJAcRMeKAf7JKph3tC84PgEf3CfzYUcxyB3gElEblCXfetq/aoeKXJgZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hA0WxQkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fnkC2DGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hA0WxQkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fnkC2DGk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4vKSH2995347
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=; b=hA0WxQkpBF0Y8XWE
	83fDGiNdrNsReS+0OISz+UvGwhcaQLCOATR5PW4mfN+GCHJ//HCYfYwm2XFvhEkA
	DW1TNGxAI0tIDPiNa59BgpxUgs4bSLzg+y5N23eJzHl1VSCfLy70NoDatqaI8zkH
	lv4K33m6qFCyzEuWM+GkWxlBJL7iJixNyGRlnXa12HvnlHQGFSH2cXcvVmC2KR5u
	u+FhVRCI5K2LZDiWX1y3z0Ls5blfEnWoFxxOvHrRex89sd+0C5zzCaSpZEU4Q/kg
	JeOS8s4tiz2kRh3LlJ8LOvJZS2sJTFTfXHvUvUxnOV2XJWdG8S3XO52cAhQCpvI3
	2QXWow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn2k0207-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 05:13:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso840197a91.3
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 22:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474835; x=1786079635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=fnkC2DGkWd5pTw39Qs/OzwQjXKg7XuUC084oxejbarQEzcfAcfzIy4eeNx1uRplT0d
         jsIgBwh8Jb8H95wmXbqxoqXwwS0sAxuy2jvaxnXoTWgsl0erTffgFivNyYoaAKrXAfGQ
         hp0e7GDDWKqKsOmzq/6ZpCBmRo1Y9kt3pyCAeftpzMDCbFlgYqOs5wWEJ9YQTPEgUvaa
         Az5RKhyUs2CHHteGdOMprbjc6dHk9rUGgA8lHWFI1iVg7qPrX+PL3eAEzoOX7tq6TpM7
         qrvLlU1tyB0DY/fKZ9btGQyIp3+3qPVYdOXkZXXINnMlefGWD7fod9AiBB+qn7HECNAf
         Yp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474835; x=1786079635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=AnxtZVNUwRrt7MFGiK8+hmxWYCPXQMhjOiF7xBE94ebOpKnSrHRJ35BQ20szg8DEKN
         xpN5fLwceTAeaXGHNBNTPQ+w+jumsRymehREgeoNo+8yEUqqYcGh9ik7STEIGW5Kxu7H
         Mqlssg8ZYPAbJt8j74LjajmTTaTlJsKOimSz4+nHE3//95//FmRtie5nuOG/PYw/4W2E
         nXZcDiIMNyq5QUGnYK9Tx997x7vUKlov+sgTpf6gwZoijIeOhNO/WfnL5biE7sikwPmL
         QTFqx8mCW/g2kVY+nMz+qrm/+s/acfgF6AVydnRiPDt7a1+npOqgnGdlaHScY27rkf9e
         oOIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6gQnbZ5pg246iqTfowbVbk3/HQ7eVL0yT216t58Vod0o5Iqcv7Q0L9xXr7L/9pB0F2+K3pRlhoTTx@vger.kernel.org
X-Gm-Message-State: AOJu0YzWA7PVKRrKaNticspZfQk9E9Hz7PdM/IEtr1G/BNW7Ol0iiYgR
	HeO/ty0AGA+exPNwiXMS9K0OyPvW/h9CmFhWnsRJz/psmVXFeHE0uJhAnLm3DdqpANv7mod0jA8
	OIN2uDJ+H0B4xi97RpAVRjre6t2kkn38GIeVktBtI+12Te0zT+a9xRZ5GX2Mvha9l
X-Gm-Gg: AR+sD10lExgT3hZopZKpCz60HSOGxBWpZEhgeGHBQwQvZ4eFx20g68he82N7rjnFjvX
	J6+FUdbSSJ2VRX/fuKI8sbknVMVQKoHEguS52Qv7kyw7tjzJYAwDzUceRXEvh8J2L5rLR59woU/
	YjMoAApUKCf9COoq65hp6PoqMVf6hRD5tgbKjUDeDwh4QGlY8+UG1LIwgSkdeHYcY7ni8q3H57C
	sBgJyLmHuSsS1oo9mjA044IZnRCCMudjw2E8Jj4WIqkK7qhb5Zh/KqG5sxzcD1i/KhRk7hdyDoA
	D8bs90snU8tLpNrm8BFLUJjHPYB0mo5cdCfqw4bJDA9iY7a7E0nUTTZ4K/IeOygsTzq8AG0G00M
	smfnVz49Mtk8ChPMrBVua7/ntXN7KGMovKNwqJYveqckNZuA=
X-Received: by 2002:a17:90b:4b08:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38fb1352325mr752331a91.23.1785474835095;
        Thu, 30 Jul 2026 22:13:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38fb1352325mr752284a91.23.1785474834502;
        Thu, 30 Jul 2026 22:13:54 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:54 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:50 -0700
Subject: [PATCH v8 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-1-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=6637;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
 b=AqfFaFtX4vYRhYNkdzARenpXkwVTnVBhxzV0dQR9zdx+7me8Bsw+gX49gmdWwsq6wVoMSuYEF
 nbnU0RCQRsVCcQPQz6O2RGW+WFIzmXwcMaeoR1vcCcBaZWdWk7vFumA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: ySuNpRH9DFeF-Mqb97ccTOYQUnFXsh7u
X-Proofpoint-ORIG-GUID: ySuNpRH9DFeF-Mqb97ccTOYQUnFXsh7u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX/1y4RQwJKyqm
 /HNx7728rj1mbL4bOPOO8IRGxZcQ1NK/nP8+3arzWMAZQCZ1/QDEFbC65rQ1v88sojMOu5CKiI8
 aTpfUva3rlkac5gl3EaeEXqtKPzmwek=
X-Authority-Analysis: v=2.4 cv=WZQ8rUhX c=1 sm=1 tr=0 ts=6a6c2f14 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIvzfnD_jG5d2KfScrEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX01WWu2GWcs9Z
 YJ7+LQj5DSor0C+hWFBpdh3enEe2DvAZWkT8tiWiDfqYuc4mG3ed/pgpwRPy/Ko+dSmDLazxqOV
 0+FsREUNDDA8PTJJBkXy5fF/JMGczJHfzdMnq1zZj8FeQWvviT0j5ReEf/JNR7+/VPBG3Qdbp2m
 mtzy/es/AxGrFedQtyOGJwdGZwxV+D6glHyk5+anLftUIUTvtcEoIfelooz6Cupn65EIey/SbSP
 SEZ/5Je/1zJHVqnJbijZJIHXLlIg4eD5RC8qrmccEzyQm+vaHlm+KoGtMBlueOsoQnO6R4GV1/E
 ptmne9EF5b4iF097jQM3gLdbEXRCLHShb3/VbddhmuXjWzRmYFDb0ZtuUa4uqqGAaghNGiKVPei
 H9wjFqRHRiJGXgg9uaSoN4mFm96WuHfn1hKX6ccf9zQ9Wen9MXeUHEDc9tPWbIAKpX4ggZItOew
 OHW2eIlAp15DoiKow1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310032

Add qcom,glymur-qmp-gen5x8-pcie-phy.yaml as a standalone binding for the
Glymur Gen5 PCIe PHY hardware block. This block supports two link modes,
selected at runtime via a TCSR syscon register:

1. x8 - a single 8-lane PHY instance is exposed
2. x4+x4 - two independent 4-lane PHY instances are exposed

Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml rather
than folding it into the shared compatible list there, since the two PHY
instances active in x8 mode require twice as many clocks, resets, and
power-domains as any other entry in that file, and adding Glymur-specific
properties like qcom,link-mode and reg-names there would only apply to
this one compatible.

Document the required clocks, resets, and power-domains for both PHY
instances, and use #phy-cells = <1>, where the cell value is the PHY
index within the active link mode.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml       | 177 +++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
new file mode 100644
index 000000000000..759f7f979dc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
+
+maintainers:
+  - Qiang Yu <qiang.yu@oss.qualcomm.com>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
+
+description: |
+  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
+  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
+  at runtime via a TCSR syscon register:
+
+  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
+  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
+     PCIe3b)
+
+  The node always describes both PHY instances ("port a" and "port b"),
+  regardless of which link mode is active on the board.
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-qmp-gen5x8-pcie-phy
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg_ahb
+      - const: ref
+      - const: rchng
+      - const: pipe
+      - const: phy_b_aux
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: pipediv2_b
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: port_a
+      - const: port_b
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: port_a
+      - const: port_a_nocsr
+      - const: port_b
+      - const: port_b_nocsr
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
+  qcom,link-mode:
+    description:
+      Reference to a register in the TCSR syscon that reports the link
+      mode the PCIe PHY is currently configured for, either a single x8
+      link or two independent x4 links. The link mode is programmed by
+      firmware before Linux boots; this property is only used to read
+      the active link mode, specified as a phandle to the syscon and
+      the register offset.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of TCSR syscon
+          - description: offset of link mode register
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    items:
+      - description: Name of the PHY A pipe clock output.
+      - description: Name of the PHY B pipe clock output.
+
+  "#phy-cells":
+    const: 1
+    description:
+      The cell is the index of the sub-PHY within the active link
+      mode, e.g. on Glymur, 0 for "port a" and 1 for "port b" in
+      x4x4 mode, and only index 0 (the single wide PHY) is valid in
+      x8 mode.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - vdda-refgen0p9-supply
+  - vdda-refgen1p2-supply
+  - qcom,link-mode
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+
+    phy@f00000 {
+      compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
+      reg = <0x00f00000 0x10000>, <0x00f10000 0x10000>;
+      reg-names = "port_a", "port_b";
+
+      clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
+               <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+               <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+               <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+               <&gcc GCC_PCIE_3A_PIPE_CLK>,
+               <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+               <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+               <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+               <&gcc GCC_PCIE_3B_PIPE_CLK>,
+               <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+      clock-names = "aux", "cfg_ahb", "ref", "rchng", "pipe",
+                    "phy_b_aux", "cfg_ahb_b", "rchng_b", "pipe_b",
+                    "pipediv2_b";
+
+      resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
+               <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
+               <&gcc GCC_PCIE_3B_PHY_BCR>,
+               <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+      reset-names = "port_a", "port_a_nocsr", "port_b", "port_b_nocsr";
+
+      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
+      power-domain-names = "port_a", "port_b";
+
+      vdda-phy-supply = <&vreg_l3c>;
+      vdda-pll-supply = <&vreg_l2c>;
+
+      vdda-refgen0p9-supply = <&vreg_l3c>;
+      vdda-refgen1p2-supply = <&vreg_l2c>;
+
+      qcom,link-mode = <&tcsr 0x5000>;
+
+      #clock-cells = <1>;
+      clock-output-names = "pcie3a_pipe_clk", "pcie3b_pipe_clk";
+
+      #phy-cells = <1>;
+    };

-- 
2.34.1

