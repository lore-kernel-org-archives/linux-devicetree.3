Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AC3F4DF8
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096284; cv=none; b=mMrYsY6iiLVGe8sz46YFvWITBzDjpkzq9dpS4zBhpTftPqF/tw+eYx9JFKLlWRujRj+coFn0/ZswZ8qRW6ClALLO6zzjnikZ3GOeVHJJHJD+XpfJMfEMytqzGo9z6f8HKhG9MBJDcWyRpz6K2iyK7A2JXHd7f/dxbt6jg3Jxl30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096284; c=relaxed/simple;
	bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lr2kEbYuBYgkbsToFmQIhp5oId6kTEe1MzXwuFrhEgDrhwdK2URHrafP8zH/lcmHiJMcHDqhAYvDv22Fup7enk7YCK8g0DSG6c068bAMQih/KAmcCmME59aAQ719kougNyG8CwVBvFo5CjWw3AaeoxhB2ts5xyBUOmsh6BD0pyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoV25cY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIGleD41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoV25cY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIGleD41"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67787aSg492879
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=; b=PoV25cY37jscBNbc
	hrIm+0L7fDaH5fmKvWw1CixAq4oxwu/krvi1bADwogxKbkTD1AA3YJODzVNMfrUS
	PuRwlk8NHcNz5y6XisgejZX8jWYD+xO6nwLbkvGG214BHTaGvN0snI/KHjGvuU2m
	GjRkPKZDP569dphNjkKnLqxJrd631z+mPu9p7qHr+MP5rJ3NhottHaQTBWezqd0/
	gybkDlylFB3+Dbm6R/NJdLvosN6cYjOkzvDIs/q96aSt+qbzHkTyMkDe/ZI3Rsbt
	9pQ/8SsJxEKZ7Dhc7yMJWhgwtmNLQ0BxuwrEiIAxAuPQAlT0T6x2Wwsw2pM8fPjr
	JD1cuQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb8y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 09:51:22 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1771894b3a.1
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096282; x=1786701082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=GIGleD41K+gd2gx6S3JBaBs8HT3IaXSrGOcpfq9O7m9eBbCiwYG3MHKGe/MwP/ZVTM
         ShrGFosKMVcAGD8EUUwI4yrgJChb6KQIZ4nELZMXBh5YJB/JWMfBBitpBjGhjOrmttf/
         PEyK9D3ZBe/hrq8hncyQ2M2VUsy3jllA8nI0zYvzDRkLGimvbc5Cgpc04+L7MwA8QT8k
         vtxvKAIC60p3d+E+abA/bLODlZVvq2378T6BCVg/us8P2bHd0f+qfMCF5u5REgWlE/Tw
         NDMSxQhowOhSe7zpeNLlyHR0R4q04496DrgViodeBL5CQFsEG9MhVEYz4OouSqOUhyqV
         BBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096282; x=1786701082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=gt6PwRGEqRv906VgzdlKK5RkrjRVcrjdU5Mru2ixGtvSl3n0BcfSsP9kATyrLjlPpI
         nU6pvNX/qMaAf5eFA48o2tLJKFi5ffx3rixqL8ASuW/5SrNAtDOiir3LmE8NXPPgUJp6
         ooOaamCyy55D5W0zTGWtUUY/Hx3QFTcbgfGj8SoLENPNRYnq7Fh4TJ5x4+l0XXtLeGm0
         +YLTYJL+3iVGpN3EhU4HNtT9XDmYrHhM9NPyY1qCjM/L6ikfh+T+lAI+rrBUi7xXw+R5
         QDFvcmopgXMOzsxAzuzryXRgp3C605haB9teDSiHHEeqISL7bvKgXGhzFcS0k29nrdAp
         if5w==
X-Forwarded-Encrypted: i=1; AHgh+RptD2Sj4qANrcAemfo9T1qEM9X/Ht75Ca7Pv8ASKmdNQWckT1bN3gtNiKjDnygYqzKbxe0j/wT4P1Ue@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6WCKEtMzlbOLQvj9d0P8tuWD7FB5KZ9TGmKx9G5jr+WaFqiup
	9c/PbGe5W/zCaUF6h0zVcyH780531S9IfBXyORUrsv4+zXdrSOHQ+fCHf+AuQaVWtwUvsOxlHpD
	r20pgpSEgBS5CCDGdZHRdQWvvwFW1YdFHmKZw8tpdI5lElm38cwTjB5Ujjc7dZJgD
X-Gm-Gg: AR+sD11RN7RDVp9FT35FHlQrhcPGbHZTxYeqz2VqSJe5t/5v+xpeCStQGMS0EarJ+Aw
	DOfYV2gNFiR9VMSnP6X+VmF3/8ZI3d0ORkCdDIrFdHzR7bh4mGC9aBqnScebQCyYasjaAL3sZd8
	stqrjgMNZ6rd1i4/ujR3eMf2G3tDsjdNKsq6sXezN+SC3dOL+DBcjSw9oFgHBBGvJDO8LpgmPE4
	x+mhrLNSDkd17AQWLT/t0U7M0+Upb/n7u/ZZNhgkCvmlKgoQA0fDbpMY3GEskwo7jEkbDHJkNws
	DJMF731I6uw2UW0Sr/n8Lfy6DOxVkpiYNB7O3cEyFxxi8nZgFpaA3PUqFUlmV4DhT9zs8hRfu2f
	Mww1g5QyBBKUeyeLKJnF98kn+9aSU1oA9tWo4Bap/mFUacVA=
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr11222614b3a.17.1786096281972;
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr11222568b3a.17.1786096281534;
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:10 -0700
Subject: [PATCH v9 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-1-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=6637;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
 b=E8dY8N5uWjW+uPlM643rXPJ0bF28E3PgyBrktmNAwKSXJRAiFRHD9EfphZMBIvPqnsKTdUQFF
 cve1PZeI2yzAOCh4o0xmtPs572G998MQoPyOrPvy7RKH5xemeU8NK7X
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX7kF3hwzN5QQ0
 9sOQOJP/aBQJdp5Gkj5VHwP60pA+9h4jxR4zpV5TL2Nyc01lTpLBL+dvxg0XEvtG0NfYqPPIEyw
 KNcyqsKDSRWR41dJXf63Lap90fxAsSxGxxgmRm1Fx7tZIbHIOwGclRXUv3HwDf62vxyabSwPCbK
 g4xNtfZILJiFPT5LMhnqr6JcWkxzp7Z8fgyopTxWBvEMYVUnhp0tt1G/FDxPWK6bQCTRvDVk/pg
 4ayvM9Ln4bbDGQsb0OEkfYwuMLdbTl3qYoWc3L49limbbfTukqrwjBhE/KVxFcc3VPRJbOtJt6D
 Wm5PI6cENB4VMHP4c6bCyYkVmuNvN4tICuMjqWMiXDU/LaPu/N+dgpFl7IFP1jON+dpzne9Q3lk
 +WhIUvs3Q2oKmCgWCZ00dcTqgp+vozJv6PaXiiEDVGDaVF7G+xOTlAtxHyiuRpWSTaxZ1wUKc4g
 LJeYnlaQu1hqcCwKodA==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a75aa9a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIvzfnD_jG5d2KfScrEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: _Fm6BdMB-SrNtMPHtZzYmC5BPdF6RJ1s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX8UkJQJsSCNvq
 xJeKY/ykzJDCFOKOF5XEAhTtqtVGUV7J4pMb1cxdgdeNhp+ynd5iy4gBR2ILRtQCljJTxbCN7Zq
 B3qEujmHvxVKlDA47oaOXw2g5xsffyo=
X-Proofpoint-GUID: _Fm6BdMB-SrNtMPHtZzYmC5BPdF6RJ1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070074

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

