Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6B23E7171
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282326; cv=none; b=HXuhC3zRae/H8p3wEXuTsztlArMGVfsagHsziuB/9QDXCg63OpCy2JYf1asUjzTsn1/Mu7XW+M3ztl3MXbRMXMxnXFVdfHF7Ag2qdoSN0TGH4enqgMaWW2PyzM4kTaPICrKtWZXXvusR7WDh29r0PWQdXN7z5zm85z/RptP8pqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282326; c=relaxed/simple;
	bh=P1Qbj/JFHFMO8P73x0LZ+S7oLzHtylxsVmlF1u/snvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2MGibCm9JD+Azvg37OEuyAog1Or+2cnHnl9f4UeyCGN7iFn/mNBDWDaB8Gxxm3hDFk3rXJXH1+hAV4fzHfPzn4HCVSuYrk+58zhCpjJ7bAqxNelF6WrJ3Wn2mk2L7Ti8+jPnyy5mSptGln4s2k4AQKwD886IpaBwIFhAEFFekg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RN0D3KyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSxHCbCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RN0D3KyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSxHCbCJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9uxNa1120401
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+VEJxZksuKjQPEcKoxqOAxex5MXE3UzHoNnHjJ3PSo=; b=RN0D3KyQhlnM0X6U
	vHL2tzYBsZlPp+rBZvyX8xywh3XGsuGSLf8gyVBhljYWQGGMQKFXpUb8ttZz640x
	xMnGv4WMhY8HsgpuUKx0dT1L/m4gV2zbALrIt8AgPzjkOvYdqnLaPDg9i5rqWUHk
	OMvQ3Ympz8GyOHBBORJp0+P4JfgIKPE2iF4nhzwY+i6d7vJM+VHQ7hfGzlG/XxN5
	GAVjg+vepgOyIyW5VdAGkaCdjs13p0eSuCBH+/uJT2PI1LX6gGIzEGSnlzOp50Ss
	BJ0oSbVoWPBCo7gMAEndtTjj4Vzw8FmZHsyG4rmpMd01ZUz/7PcjcaWcrxZc7tw3
	3p2hUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r06r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:58:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38d7fcd1f66so11312008a91.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282321; x=1784887121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+VEJxZksuKjQPEcKoxqOAxex5MXE3UzHoNnHjJ3PSo=;
        b=KSxHCbCJc4JbS5Zeh7GAOeTuGhMXwSIl+4T6f37y/P87OoAyZwF4jy91gQSu3e98p/
         Iq6jmy1WyPzOJaPgWoLZA9gIK07k/lYdq5nimhrcU3MdA51FHJpyTG0G25tuudjuHD7c
         4NncSyzvzhZN15mzvPaGWoItninzXGqU/xQ85HeQTgQaXoJGL/cmzeIBT8SiFx5pVkVl
         laWpqZFZaGDc3g/a05mm3KY00O9TquYap2DqUubijLfyMn35ayWwlj6J/rPYYON7qZ3x
         Uo0NBClHSWyn6AqXv/dh1ZbLfHKfm62PMEDIozLRfNRNib7xQ+MMl6Xp2TK/l4xnPS5v
         IaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282321; x=1784887121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+VEJxZksuKjQPEcKoxqOAxex5MXE3UzHoNnHjJ3PSo=;
        b=gINdxUQc90aZHSRmVVZXl5mLHANs2ZQA77FjsPki3AzTSONrOyOe4cponMCuJhonm2
         t9P8optqx4F9g+yV9TLMZL8ioBFSghiCySQ4exeTfYHS3LH8tc4+crf5DCQrbFruAGQh
         HyzHsbGEkbELw6PhHSIcLqNMZdnDz/OGN2+oyvduqKXEFjZqX46VeJ1nWwXits06x8vZ
         ZfNPD+/2UGHvPYfwgVDx9q7aDpllDN6wlpuYVkcV5L8tkL/cuIuDYlIALqsSa8K52VOU
         Vflr4b2y5qj+4d30Y7rNdi7hgjy+OCBqJW2RX3bK0r3OgQ6QD9s2c4XB013KgTJ+CR+M
         p4/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoqdKi4DuH5kbjRpAvp+nAF++6iE/HI6hxRS6TL4YHhTLG1YudOkc0P1dhRBifAyhglo6iLJwbQaR2i@vger.kernel.org
X-Gm-Message-State: AOJu0YyPWZdQZFfdw/2XufkZYp9Nch3gJp9L7IgWfgJpPvby2Pf3ZzNt
	qyqedw1B6MM0YzSBcvdyl+Xbtb1MgbD/IGHWOY069XHt4NqZ6GOzmDqn9VfhBkUDXlWB1XK5b0I
	flvLVm2+e6+kc9/gX84edvEio38GOHlBStKex7d1pWkLRCIROIUPfHA1egeGoIv6Y
X-Gm-Gg: AfdE7ckhQFkxJ73uUVa+1FInleeI8oTXCfKs19U5Htti/gvrt7tp6zWCC1Cvxdx1TcZ
	oK2eqtW4ry413jYnCCSbwZw4YBNLNoEJV3pQToaNFLqtxeQ9Ff36gvDOs/I1Yc7JNcyno3u3vN1
	m+gkRzoMvo/YE2QUUgMd7KgWhhjiT+Ba4xUwWDQkm2F2qAysPd/djeQF+mMS2A47H+LEXo8c01L
	qaaptuPBx8Vy+C19yFPUvvnmNO14+mo5c1dGummkecWR73lBTynESKbvClTRJw2xFn3E9ePGUyW
	pu+V/5O3ps+3uU3iOneVie/E3+H9bxmVk7fMYShIsfT7EkccesEUlVjeOAOtISBCB/LgnZGt+VJ
	Ax0oWKUByOi8uBphjcSQHBTmNcG8g/7XxZfttF7IhuIHplHM=
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736650a91.6.1784282321384;
        Fri, 17 Jul 2026 02:58:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3dc8:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-38e4b3e1419mr1736630a91.6.1784282320868;
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm5586375eec.13.2026.07.17.02.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:40 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 02:58:33 -0700
Subject: [PATCH v5 1/3] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur_linkmode_0717-v5-1-4f9e87a61463@oss.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
In-Reply-To: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784282318; l=6354;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=P1Qbj/JFHFMO8P73x0LZ+S7oLzHtylxsVmlF1u/snvQ=;
 b=nxZrqHhffQuMJi6aerasNH23mT9WpofnKlw0P9qN1mdklH5XijrHhNugNOK+YCDxWjkt7LeK6
 KWROGe7os7rBhGuHkbWgPZRG5SdBLGpyJfo+4gHmQWQtRd3YTI0BVwG
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX/Hg5/9FzTqn1
 Fw86Y/PHryezFqPC3i4+NZJUPJwsYmtgYWVjx/0wEryqoXeBMly9Tq1qtIb7y6ZdOoxsKVOum95
 /OhPWf9/AxApRmnyNA3SYpcFTmyf8AX3Sbz0UJiIt3EUTPI80SVqM+CM6qYxL0KwgrJVx1r0Ccw
 IkVOHEmpYJ2KkJJjzwkko4wRYNGm1/EVEQxmRIg5skC2jZaF95xxhiBKBh1sTJSOMGsO1t89b1S
 YkCQsTyan/NreTw8ODSHfxuJGV/+A7RgM6vTQ+KIsYhMwIwoeJLmq4IjDwJxFP8tP7XCJmvMZPm
 8IuEI/UxWcwBMoGmTqq7pEUGuiyGyZIlItvNdI1t3og4jzQ2Aa+TrKkNEVbAxwzAcZiPKjFLn+z
 Qraxi2iVnc654DvEJFL0SnT8fa6mS5l+GzY032PnxYmkhmXnbq+MTrTTAFlPYcUTrTA6OPNOOxN
 Lt8/qOHivjIvmwuxD4Q==
X-Proofpoint-ORIG-GUID: 8MVi3nDhpo3rNGikPO1XWmiMs-QlYOGV
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a59fcd2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yAdxKSRqiqocnpK_7ewA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 8MVi3nDhpo3rNGikPO1XWmiMs-QlYOGV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX5PmT4qxGxiZw
 kLDz4BwmuoEBIURsMh7AdF/z7PE2OMoV5lA2w5Q8s/GAT5sY9HjI+ixTOHdfWDT7DFP8zVB4vTp
 BytSmYPXIsc1VnmX3mRCwTJfzEJ3lsI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170098

Add qcom,glymur-qmp-pcie-multiphy.yaml as a standalone binding
for the Glymur Gen5 PCIe PHY hardware block. This block supports two
link modes, selected at runtime via a TCSR syscon register:

1. x8 - a single 8-lane PHY instance is exposed
2. x4+x4 - two independent 4-lane PHY instances are exposed

Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml
rather than folding it into the shared compatible list there, since the
two PHY instances active in x8 mode require twice as many clocks,
resets, and power-domains as any other entry in that file, and adding
Glymur-specific properties like qcom,link-mode and reg-names there
would only apply to this one compatible.

Document the required clocks, resets, and power-domains for both PHY
instances, and use #phy-cells = <1>, where the cell value is the PHY
index within the active link mode.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../phy/qcom,glymur-qmp-pcie-multiphy.yaml         | 176 +++++++++++++++++++++
 1 file changed, 176 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
new file mode 100644
index 000000000000..73550f77e9b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-pcie-multiphy.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-pcie-multiphy.yaml#
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
+    minItems: 2
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+
+  clocks:
+    minItems: 10
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
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: phy_a_gdsc
+      - const: phy_b_gdsc
+
+  resets:
+    minItems: 4
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: phy_a
+      - const: phy_a_nocsr
+      - const: phy_b
+      - const: phy_b_nocsr
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
+    pcie3_phy: phy@f00000 {
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
+      reset-names = "phy_a", "phy_a_nocsr", "phy_b", "phy_b_nocsr";
+
+      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
+      power-domain-names = "phy_a_gdsc", "phy_b_gdsc";
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

