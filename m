Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64503E557D
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906647; cv=none; b=qQDFEWpyti6SKafhoXMO4pTjIXNogtXagYWxM/dOTY7bf53e5Aot4QpdLNgMm43IzQfMmJ2yTssB4VH8olS+tHyRi4jo2HXpjKFvE5Yqwn7lj2TzMJFaphKwaRq0H78asXiWl/J2LghnUfzE1FXasYbYbS7QClsah8AHbv+alBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906647; c=relaxed/simple;
	bh=Jk+qkV75ilHOAI4p+1pjg2Qm5Ifc+Amub/MY2jnEyp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lUscBXYlubsYejYxszgSsLEB63neJYNbfKnNOELXEhjVXmvjNX8nLo7KmcimlZKhDsGqyIFilCP8iAD3sC/SqnNDyRnl5HX3UaTT6VQBGZu5YkaNfShzHZ5wFEzey2pOVJFn5Fasl/wum/LGTe9ydMgublEDITtmbqeuY3eA2dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afLW/XmG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yid97sWb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afLW/XmG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yid97sWb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66uuX2515373
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71tdgYNgaYiDhqnIbl6jtVyEhIjCStyRj+6OG2MV96g=; b=afLW/XmGv/zOHAZx
	zmrLfJR/NLosaSNDDeVe1fYksfFjmhEwp++pFVsm8tgtuRJINFSLoBfKYDD7XLmv
	Aq2BTtToe1kNHWStrbYftwWBSKKWX3ES5X8h9eDufRVFTczDpkvxFKzrYS2zL0vZ
	I7i9vOkLMtzDOdv9NORoZKjwmOcqgedmae+Ijebta847WyjUD+BGfAuZ2ySvsKIf
	lVNuMzYHhKEnmKzDwLL6QwRATmBxKsQ8YDaaEzlSlpTv7x1WBy/+doLFTYU5ueyS
	hiwG4I94xtKLjUdtHj4aREo1NqVL4H/qT8rYrHWAtaB5wkQrMeRGGvsSjqvvM626
	oZnZGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb47n0rb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 08:44:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so20340245ad.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787906639; x=1788511439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71tdgYNgaYiDhqnIbl6jtVyEhIjCStyRj+6OG2MV96g=;
        b=Yid97sWbyT8kbK9cr5xrFbU+zUS8rVD6CXq2XgklOO96UzgdW+kgmcpfJasujXuTQV
         +Ge10ibvSb4ffbhxlGSrPhvLRdsEtgeAFBG91mO7NEWPlLqyIoz3PLIYR2IItYIIbNFn
         Q/6Nlw8Jsld6c8C68YTwfW0ywSrVJPvrCW49JOPbzjKTbdUs1zVhe1Aaev/1vYGJy/gz
         F2y74n5lEi9uk1Q6J7uu3UFo4by7LjUfi18kB7PiFu5POlXA+74aF6dq4fg1wU50IRpv
         RLjJ6CPQ1mWC5fa8+eQGYzO4ynI1OispDW1LKKrQw/YNS9mihK05AmZTlhgRNEj6owXx
         aYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906639; x=1788511439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71tdgYNgaYiDhqnIbl6jtVyEhIjCStyRj+6OG2MV96g=;
        b=se++/wMiet5UJeaHOr5E/MuU4pcI7tu66EkkY/4Z4naaWOOqGQvJxuWiYc/U0+J6ww
         ayZbAnm1qlMOzAFyyALYTIVsop3QQl5vNJ2stk1+ewdtV6sfRKXsPDi0haQ4z3KjsjVZ
         R3rA9GvaOzEymz13qtvsVmtUqoNDIW3vSZnDgI+4Xh3vbgLsoKRw8yJh1K6RKRsPMHqN
         tGtgBiEB+6Nq+vq/OztCKFb6UYgBQ0oqsy4d6TIVnfe5aVgxW+PlMNCRgLlkvIF6sq1P
         Th1nPE4io8CZfNqKPjn+/RIm1UUZ0jOzsKAX9Z64uJen0es+ZxHLefMEuKPEQkEZ+qYF
         27Ng==
X-Forwarded-Encrypted: i=1; AHgh+Ro1LFD4FdHGrTdM1VsRBIXnPPLfUmtfQOkXiFmFu1+kV+Pl3Sll/jvyr7okfGOKyDslQK3hme7Xo4Hd@vger.kernel.org
X-Gm-Message-State: AFuF++lGQSQvUl9Dk0PD4dVTYw2D1yiFhbzOgTldSC29L1Rmp9+Ykn6o
	azu0hwjV1cXZW8u3rAQ6UYQCvyrk7RyDRrkg7KpQ9ek1Iohw6ucKCN9KlXpMtv73iDOPG3rm/PW
	rOnZqDzw+fh7YAQe5TkJskmghDdWhFM2sMhmXqsak8vVT402QqQUE5gogL0NOWKR8
X-Gm-Gg: AR+sD11kTJQE3KBjyA2QcO38a+ZwPgui92Ia2oZLptwdgfqclXmqYcmlMpASgrXauQ9
	sncZLWSo7z9JzB8eozRhZ/a4Mu5Jv6CKqZNsPDO2WgVVNx9L6dy4LPoILVseT842R6t2YgMSeA9
	cjjDfzNAaOANrT2NfQFki3yHn1hbO4EIs3UK9AG3mOShI1gwA5AIt30mJAjsRYy5uRHPZKgncTf
	6M90VS9Y4iqdBRjefrzrV+tA+2IoXYkbtdk1D7ZLguPPAHZ8vvBen7Eiys2fb4NXMKmi9SC8yOr
	Z/MYVjmTfmC8XWmUmzLOIfg6fcPpaIBqHl0DGeIvJk1AHCLsq7C/75czvyFGUYplcMjwjw9XpeD
	Q4HtmGdrh7sL52rCE1QlhsE73uCl4fIa38sQ=
X-Received: by 2002:a17:902:d2c7:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d74ddc21d7mr98937705ad.11.1787906638767;
        Fri, 28 Aug 2026 01:43:58 -0700 (PDT)
X-Received: by 2002:a17:902:d2c7:b0:2d7:7cb:a44a with SMTP id d9443c01a7336-2d74ddc21d7mr98936885ad.11.1787906638267;
        Fri, 28 Aug 2026 01:43:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f784857sm3673459eec.3.2026.08.28.01.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:43:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:13:35 +0530
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260828-nord-v2-1-18bf59d19d6f@oss.qualcomm.com>
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787906625; l=10074;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Jk+qkV75ilHOAI4p+1pjg2Qm5Ifc+Amub/MY2jnEyp8=;
 b=BaocjX3hNwPZDPjC58bWjzi7h3fJ+5pTTjHJLSBB2Y45ZqQg7qGcanky3BIw1plFfd8kSR5wC
 gHot4zEPHxlBYhoPFel5SpgO5D75je03WXlu8caOAthbhqnb6OPRfOB
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=a8YAM0SF c=1 sm=1 tr=0 ts=6a914a53 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=m1JAq1APDOtiVc4_LWMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: xezpbr59HTqPr35DEOCQdZ3XBfvgXCRr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX93cLhOlDrDXl
 KvZGePbQ0gN/5Irswf+2Kdynp4pp1a+uJe0WTDPkgMtFEOdbTdmxMt46J6hLPQ1CrOzyZZjDnqC
 BSYEraxbiGAvL+WABUYwb+vY1Wb+1/w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NCBTYWx0ZWRfX7VKZXxa0yGcl
 VVkbAJiJDzixfM+Y8Z6Vh5BwFbLU3h3C8J/6mO4cYGj6EaAtRcvqiwKFuIyv6cg7699q/UOIa7N
 wyzuqiraw8TR8fJkG0jT8fkbxY90GDzolpzkQuhXFxqVeZuopyl5/TqKK0qMB30jUebCvZmmB5b
 Jnub4nM0902l6QARqeHONH64LGCC3f7z9gFVknQbZwsG4PhsxnUTF4/zW9RLQ0TVfHWKzlbptMP
 25IsiBOSVKTkaBF6GJbe9HTFVBuWdHzqBBgHc9ezpXATBKjlt+5biwZ6h4sdX7+/lgzLwBINIEO
 u279P+ul9qZ6Ha0qHvlPmErGRLxvnZyXP/BNCXGD8Aou7yKWGAbPk+mHg/6amXjJuFMTq3KSXNR
 s74IeMy+sSH5t2SrZ79MUdDs8OtGfCvQYL8Fl0MwaPJHpPKiHFv4lawhirWcGRNNSsWIPS7Wwct
 RqglT32hXeit/9SilPg==
X-Proofpoint-GUID: xezpbr59HTqPr35DEOCQdZ3XBfvgXCRr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280074

Document the PCIe PHY found on the Qualcomm Nord platform.

Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
lane configurations using four PHY segments (A/B/C/D). The active
topology is selected by firmware through a TCSR configuration
register and may be configured as x16, x8+x8, x8+x4+x4, or
x8+x4+x2+x2.

The binding describes the register regions, clocks, resets, power
domains, regulators, PHY provider interface, clock provider interface,
and the qcom,link-mode property used by the driver to discover the
active lane configuration programmed by firmware.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml        | 276 +++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
new file mode 100644
index 000000000000..37198f82c611
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml
@@ -0,0 +1,276 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-gen5x16-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord QMP Bifurcated PCIe PHY
+
+maintainers:
+  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
+
+description: |
+  The Qualcomm Nord PCIe PHY is a Gen5-capable QMP PCIe PHY composed
+  of four PHY ports (A/B/C/D). The ports can be combined to support
+  multiple lane topologies, including x16, x8+x8, x8+x4+x4 and
+  x8+x4+x2+x2 configurations.
+
+  The selected topology is determined by the PCIe link configuration mode
+  programmed in TCSR registers. Depending on the selected mode, PHY ports
+  may operate independently or be grouped together to form wider PCIe links.
+
+  Each port provides dedicated register space, clocks, resets and power
+  resources required for PHY operation.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-qmp-gen5x16-pcie-phy
+
+  reg:
+    minItems: 4
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  clocks:
+    minItems: 17
+    maxItems: 17
+
+  clock-names:
+    items:
+      - const: aux_a
+      - const: cfg_ahb_a
+      - const: rchng_a
+      - const: pipe_a
+      - const: aux_b
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: aux_c
+      - const: cfg_ahb_c
+      - const: rchng_c
+      - const: pipe_c
+      - const: aux_d
+      - const: cfg_ahb_d
+      - const: rchng_d
+      - const: pipe_d
+      - const: ref
+
+  power-domains:
+    minItems: 4
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  resets:
+    minItems: 8
+    maxItems: 8
+
+  reset-names:
+    items:
+      - const: port_a
+      - const: port_a_nocsr
+      - const: port_b
+      - const: port_b_nocsr
+      - const: port_c
+      - const: port_c_nocsr
+      - const: port_d
+      - const: port_d_nocsr
+
+  vdda-phy-a-supply: true
+
+  vdda-phy-b-supply: true
+
+  vdda-phy-c-supply: true
+
+  vdda-phy-d-supply: true
+
+  vdda-pll-a-supply: true
+
+  vdda-pll-b-supply: true
+
+  vdda-pll-c-supply: true
+
+  vdda-pll-d-supply: true
+
+  qcom,link-mode:
+    description: |
+      Reference to the TCSR syscon and the offset of the
+      TCSR_PCIE_LINK_CONFIG_MODE register.
+        0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
+        1 (QMP_PCIE_NORD_MODE_X8_X8)      — x8 (port A) + x8 (port B+C+D)
+        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)   — x8 (A) + x4 (B) + x4 (C+D)
+        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2)— x8 (A) + x4 (B) + x2 (C) + x2 (D)
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle of the TCSR syscon
+          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
+
+  "#clock-cells":
+    const: 1
+    description:
+      Selects the pipe clock output by port index (0=A, 1=B, 2=C, 3=D).
+      GCC pipe-clock mux parents reference this provider.
+
+  clock-output-names:
+    items:
+      - description: Name of the PHY A pipe clock output.
+      - description: Name of the PHY B pipe clock output.
+      - description: Name of the PHY C pipe clock output.
+      - description: Name of the PHY D pipe clock output.
+
+  "#phy-cells":
+    const: 1
+    description: |
+      Selects the PHY instance by index:
+        0 — port A (up to Gen5 x8; anchor in x16 mode)
+        1 — port B (up to Gen5 x4)
+        2 — port C (up to Gen5 x2)
+        3 — port D (up to Gen5 x2)
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
+  - vdda-phy-a-supply
+  - vdda-phy-b-supply
+  - vdda-phy-c-supply
+  - vdda-phy-d-supply
+  - vdda-pll-a-supply
+  - vdda-pll-b-supply
+  - vdda-pll-c-supply
+  - vdda-pll-d-supply
+  - qcom,link-mode
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-gcc.h>
+    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@1b00000 {
+            compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+            reg = <0x0 0x01b00000 0x0 0x10000>,
+                  <0x0 0x01b10000 0x0 0x10000>,
+                  <0x0 0x01b20000 0x0 0x10000>,
+                  <0x0 0x01b30000 0x0 0x10000>;
+            reg-names = "port_a",
+                        "port_b",
+                        "port_c",
+                        "port_d";
+
+            clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_A_PIPE_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_B_PIPE_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_C_PIPE_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_D_PIPE_CLK>,
+                     <&tcsrcc TCSR_PCIE_CLKREF_EN>;
+            clock-names = "aux_a",
+                          "cfg_ahb_a",
+                          "rchng_a",
+                          "pipe_a",
+                          "aux_b",
+                          "cfg_ahb_b",
+                          "rchng_b",
+                          "pipe_b",
+                          "aux_c",
+                          "cfg_ahb_c",
+                          "rchng_c",
+                          "pipe_c",
+                          "aux_d",
+                          "cfg_ahb_d",
+                          "rchng_d",
+                          "pipe_d",
+                          "ref";
+
+            assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+            assigned-clock-rates = <100000000>, <100000000>,
+                                   <100000000>, <100000000>;
+
+            power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+                            <&gcc GCC_PCIE_B_PHY_GDSC>,
+                            <&gcc GCC_PCIE_C_PHY_GDSC>,
+                            <&gcc GCC_PCIE_D_PHY_GDSC>;
+            power-domain-names = "port_a",
+                                 "port_b",
+                                 "port_c",
+                                 "port_d";
+
+            resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+            reset-names = "port_a",
+                          "port_a_nocsr",
+                          "port_b",
+                          "port_b_nocsr",
+                          "port_c",
+                          "port_c_nocsr",
+                          "port_d",
+                          "port_d_nocsr";
+
+            vdda-phy-a-supply = <&vreg_l6a_1p2>;
+            vdda-phy-b-supply = <&vreg_l4a_1p2>;
+            vdda-phy-c-supply = <&vreg_l4a_1p2>;
+            vdda-phy-d-supply = <&vreg_l4a_1p2>;
+            vdda-pll-a-supply = <&vreg_l1e_0p9>;
+            vdda-pll-b-supply = <&vreg_l1e_0p9>;
+            vdda-pll-c-supply = <&vreg_l1e_0p9>;
+            vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+            qcom,link-mode = <&tcsr 0x71050>;
+
+            #clock-cells = <1>;
+            clock-output-names = "pcie_a_pipe_clk",
+                                 "pcie_b_pipe_clk",
+                                 "pcie_c_pipe_clk",
+                                 "pcie_d_pipe_clk";
+
+            #phy-cells = <1>;
+        };
+    };

-- 
2.34.1

