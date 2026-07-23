Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6663353A8E
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773835; cv=none; b=V4aPoiUbuRr8QSyvUl+g5xwM5mncbF0VdRmd2wa9OJ62qDVZk4R1lwNL3MhncO+FLI/XTxAiOLjC+UYYxzG5At0owxSN66rQRN0GaY3cEIE3v6/QHVewlulv/s51oFw5ARQnNx/ttjBsMH1dScXowBer2sNIKN+r9UNCzBLA9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773835; c=relaxed/simple;
	bh=+WhStuQ5tWT2R9/i8ZwGe8d3oZmxPuE4Vr+OUYOmmso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L1QsDcUgUoDAwRQbt2Wl+MKFvQphYFAiRGXoG4cBxK4RV3rbMQ7KkK0yxysoq8XfQW01RHQTkUVDf9HUKVnJ/lsSwI5Uj/k3jRmHRDPWUP80jOZ+LC7pfFcumIzYR8xy+CwRMDBrBf6HUxZlVzAjqyQ0rwueVsxbKLx4IRFk5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ms89n2rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZH23PBYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ms89n2rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZH23PBYb"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XTVJ3536547
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=; b=ms89n2rdNeuQNbgZ
	IQfe8k5SEs3SZf9vZC3HiVcNUgG6SNm1p8Of6ly8+uCxzFSh9SQVWE89btH2gjTU
	LmtcT+jwZVqfACaQaTYdi3aSpSg5wna9uW+5jMECojZWmYmVXpvzlKQYp52zX5kM
	UrtkVmrvjbryUCocThlAAmUqgFpbTy9IbD2Qz6cwGQ3WPLQkg1I0/15CaT6uD8ZQ
	aYFVJI5taA6PuWMDbnE5u/SNcVny72vMjA04q0E/0FWEdhbPhDZh2ssGTGgb8M1D
	9C6JbSGlaI/ztiUq3DVt+piiTFl+B/Dm2zmNFOOdDporjltRBGeftq7YLjDRpaH1
	MQpzUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xss69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 02:30:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so169483a12.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773829; x=1785378629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=;
        b=ZH23PBYbf6jZJ5OTfWAesd+JQlEcwKYXVgfSygCSv7HltPFBNtMvtffBYKmooLeIwC
         SYCyZ4ceC3eM06pzIy+3wa9STXntQMG2xIjaaeKIrpyE9uGB5I/8XQw3Se8YsW/M0s9b
         16oodgvnKYRpFSGxXD68AAyqGJOFmRSbKAkue/cwq1zNrvog9QOMWXnY+7VrP/XNt3fk
         B458+lH8JwUQrSesWP4Oy5Ar6rwzDpoLrlaZdZH1b3skwb1QkndgxiK8poeoPYz5AkCr
         A1zPf+VyYKlbEZdSyqx+VbVKxuoQN4Kc/2m64rnoxFcoJUVcegki9tDKj2ZF8tLqRs88
         47+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773829; x=1785378629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=;
        b=V1quLuzlB0t6ABEpbezCjNluP4mq8vEOdm1Mmgd51NEaR/bOYkjAIlw9PnEfK4dE/j
         aSh+vv5GVLONucH4Rd2hpQJ0e39oCu0cvWiswBVBoil/WYuLoovh4IQxJxB6TColfB3q
         0cBQk6CTzF5EyOzeeAPMX76///q3ZlH6tjj++wfynJsnZxYiuqYUgFtRQ7Ks9m+RhF0R
         Qw3f9jL8J9YoAMqGUUuSBTyRTLwUosGHn9ykQmy3c8yUYUGdtPkjkh9W37rVjtkrfGtY
         m7C8eq5GH+ZDI/jmnE9/zc6PCCdxBkXn127AGa99CrqiTQotkll51xZ9fP6Eq5gx7Hy8
         wU5w==
X-Forwarded-Encrypted: i=1; AHgh+RrB1Si3nV4ChICJWeiHHgh7sXq9FrCpN8++mqOkjMg+99JZrvte9A9P25ZPYRoUzBhXsAdHxLXkoPnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yysrtfm+LOA3r9dFYtq5vUcVCW5DZWklDUSUH6cz1xR0gc4JC96
	GUNcUTTuzg6g1ahj6P8FaEi/rAtiI4n3vZS0z7Umlju29XUoFsdKKkueRKYZzQwtLx7xDpLeUkj
	wTELdzCmnppq549T/m80HdfGnSOvx0QShhyEkfQZxmO86u3iRC9G43jdLoZV/gSDoTFVvUxluci
	E=
X-Gm-Gg: AR+sD10rVqrTdfw2gOrrX/VXLdZDM7lo4HwR1qn+MOGjfJJzlFjU2tUjyRXkx8mfi0s
	zZY7gm4k9rRYUVgBX1p3YYfDdHYao+X8PJCi7M8s5my39MsHOtONBzkeiM8hSQxJSuclVCKFUmZ
	F6w5EyzuQFu6ajqy/K0pFWFbrW5awKP6HO1cfJhoAn6O6fPgM/cLT3TgC48WV3k9H1Pkar6vfWD
	ix9+iYQsAawSBCuzib/bvl0V9vfD3EnwL6GtMtPXLrUp2wvb/kPdG1Y5EhJYeAGiN834rNnq/+u
	6LIIMLWS2GKRGYcRMNyQrl1RV7t6nSEvCE16XOGGrgJNZ2MTaBIg9DM29yBDFjC9AbXcqSFHaIa
	dQLrwJBgUSRoXwC9bNPyxR7C1q52bKcCqyK0HPMn/OJYXr9E=
X-Received: by 2002:a05:6a20:d508:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c44b2b6a31mr1190820637.75.1784773828130;
        Wed, 22 Jul 2026 19:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:d508:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c44b2b6a31mr1190787637.75.1784773827627;
        Wed, 22 Jul 2026 19:30:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:18 -0700
Subject: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
In-Reply-To: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=6511;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=+WhStuQ5tWT2R9/i8ZwGe8d3oZmxPuE4Vr+OUYOmmso=;
 b=xdCWBVyDqEd/3RgWIZpx81J37CyJQ/95TdL3VAtwr44gWkQ/bHeozbhZXkgVcRuF3gFG5qGK2
 XiNxjd5jSErCl9PL/L4dDahIRj7tbhkmuzoYT/XXMaia8YQwqvX0DFP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: PlLiRYgiur9e55AmcBTiLpdiUO8_xnsw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX/uYy8D2VSM4M
 PTKh+uuDYvdk2IUUXRwDCCNNtSwLv/cbe4FTQ9J29qH80+LcpaOYBcrnU1rW2kZrgzJyH7qUYjL
 PBk8fHSL3xGwTrnYpOi4ADnxImrFb3M=
X-Proofpoint-GUID: PlLiRYgiur9e55AmcBTiLpdiUO8_xnsw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX3do3sHSLb20f
 1F0Od1CAQPme1jXqMn1WXhnetDryMHS9uttHZanoVem8eik/4+u1oo5JjLop2h2YEUvdA6jdawn
 RE5ywzJepofGRQgw/tKxiQqcw62kVFB5NpWSE21OeKiFfP/J4uIQeVAoJKWQVLzmrNV1PJsxPH0
 EOTps6eg/R+yx7sdkgI9RxTiCD3Yn8al3cDEm1gTM3vSNKkNw0LbQT/GvUp/fqZ/6ETZKw89YlN
 HfjsyQRl3fIp5CccvvTxT/9mJiHFbgjWshsuDjlk/NZcr5V6RWAYXESbkjGgepaLrIyw3d5+KVa
 8rQ6XqmbZe/PIZ7yhXc7U/o4unpaFtOp32zFDlN+YIL4iwOEvC8nky9KItho0lEGcQjpNvye9ME
 M6GroncS/fga9K9RsyfjhzLLJpvVRh75POM10jRE0ukv/kRwVR5YTI0CrptBV1tPR0l1QEvm2V2
 f0m6jTirH6S/vVP45CQ==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a617cc5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yAdxKSRqiqocnpK_7ewA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022

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

