Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC96357702
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105097; cv=none; b=Pskv7K+6mgw8ELtI8Ixs/wcL9m2JMEWKwiW6h4vqZp90wl09LHuEB9F6TGxWPtYlBLqynSWUTZ4MY3ABVZMG67KwCCytJyHgMUF9eJOdAkwMzcVsXsetACauSDMNX4p5WxMkFE8NCIcUre3dxN/mLu8bFgconMJnpd+9/ZINGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105097; c=relaxed/simple;
	bh=WPj6hOdlH8hNWqKJPYnfFON5wMzrQYhCrOHse+tcr0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/B5sbo0Ie+1K4xcDfziKNglTenHShGsSN+exvsrKTueaxtAMfdwLgTOkNA6lmCN7KgR4ywhwxVfGbJiR/Ehxo5RN8IySp8bcdBwpCkIKr+wWeBP421t50a08Tj8wTV4tZEDrsaY/n+eV1hvGffPftV93fQd+DykNWzvOGcGr1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgCCY84M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atbSmE56; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgCCY84M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atbSmE56"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59B8P3786560
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=; b=kgCCY84MFTT4ySK3
	msdptfxsKjxZPJsPzYmy/xHmOwoJa0pTUDvT1o7hHbTktbpi1qpjvHiSNd+t5y4U
	8DDkiWCLNAHLZEmHUDAxa4c8HzoH0YAjTQVSzwQYPqVkXfN/z+0sLqusg6IshDoo
	TghU21Lr3ZVMXZAGb6F7GH8LbUHc1h9WlNYNQui//hXqjvojQC/AsDPrSvkXMKba
	OFCZyIxp8PJGb10sUhBUk/sXawxr8EsuHZpXR6S0LfksOcDb75a6irLlWvdrdfOB
	ZD9CxHOt/UJWPSYSFHBgjUpAPGIj93H3sfI0DLMwxIGoBTPjmS7w5qCJHyJxwpT+
	WOKxGg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewkmecq1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-137f3465368so3295673c88.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105095; x=1782709895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=;
        b=atbSmE56/ULJ8HRtO1jI60V7fKa0FA75CwLYYsoHKOponVNfJP/7fY9OgdvJ7/s1Lu
         3l6jcFfKme85zPvhZPLtFe+cTAHeR2+AYs7DBDdxLf6jjXu6R6/OUdCNMqqV90bsk/+z
         eDAYonYAu+1qS2NhmYGMUobM0xdrww3zU78ICc6NaHjgMUj5KHliBpymJuyVTkxhQ9lU
         H2ux/mTQhRmFXd7e6Ipsv/E1wrVf2JGPvj9ADMLjP6+0VIUeInv/jrth/BLs02ckt4zY
         1i5raKsEyrcUMA914fWGkInSDV6gBkYTbh80v6rE1MxNK4br6y+sVtpt9LCqbHEAWHJU
         P4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105095; x=1782709895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=;
        b=SFpbGmMO89aA3/PYFZXPMzl8daZ5px4Z2I0vpRgjQeJ7L0dE71a9seK1I5QWPPF9ea
         SWWeL5lYGhVP/hFhCrsDb3PzHJHF56ZpXEE4ud218Rca4bl49cbnLLz7taJPvBLId5Bm
         JHhlPGnz2+yQ/kH/SZwU+Cv63ivXkg+gXyUw4JVqOlKbaZds7RBAZoUD21NAr9sgZ6Tf
         D3ZDrg4p0xbbdNXcTfpzai1jBrD9pzI4OrY0XitWz2/1SEB2hPuSk67HgaUy7mJXw/Vf
         yAqUEyaKtGkUId2z0VBT7MYM3kfsNJJouO2Z1kdrtBV92HY1F/4b5JESuFAhIxUwfwgE
         S90A==
X-Forwarded-Encrypted: i=1; AFNElJ/VhD/DmnsZsAUcSrVWViUH0pTNbHl/ITl9/bkXMDcqJoWuwCi0yB6EPwDPYJSgFr4BNyBvZe5j6Fu/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5R6CltCK872/5h5zA891U5Ce7ORAoVcFVpB2HFIK3aqV9ev7m
	jJnENWiKRvgCETO85zYMmFDG86SEe7PjBnriVBVsELXR4Etg26MimaU5HBI3XVCjK26SHvpQeIn
	qXH6io4pcOYgokrbku4knlij6yM6dRkTPt279Us+LfBgZdubLmM5WwLgxcJRvpXdFpVC+rAul
X-Gm-Gg: AfdE7cnI3eZt7urBXj/8IIfuzrJw4olDVr3AzIZjQoTaM28lGvRm0EXURM55sFoNMxN
	aawdMztQGbt5mbRM8lnFhVoRLdIgrWIAFb7x2yegYfLSthiu5KtJurjkPO2vd2TigCUvzuDsBuX
	wyX7IbZGVtiV4RvO6Ke5ImJgxnc29H2i0GmPpUGdc2hwQr2dpXLVE6GY2hcdqcuD534tIA5Tr1D
	0CaxQ9lMRLCMG42mjEgYD26K1Lfvs1gohAIY+rY9TbIGC8dLzrC7AOVFYjSgZ2EOFbgAXh154F6
	7g4g0tBZdraCgB0GhkP4ytA7D6Mb5VSEh+yNzn86kU5n4T/32pq9GE4kpzEGdNZXqYqDeXB4scL
	l3Lb4HUYXlOg5zkSY26NQFWpnCdITifI/jbDRRqAsBjx01vpMRQcpibUhAQ==
X-Received: by 2002:a05:7022:2509:b0:136:6883:c4bf with SMTP id a92af1059eb24-139a2052b97mr8703957c88.15.1782105094591;
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
X-Received: by 2002:a05:7022:2509:b0:136:6883:c4bf with SMTP id a92af1059eb24-139a2052b97mr8703938c88.15.1782105094066;
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:33 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:24 -0700
Subject: [PATCH v6 1/8] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-1-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=5188;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WPj6hOdlH8hNWqKJPYnfFON5wMzrQYhCrOHse+tcr0I=;
 b=wOBHb65uijYQULWH8kJtmqA4AK2ArjifRgOqrQcEOc9oOyuYcAO8rjQRFYnpc7RlBAvq0T90f
 k1KGYvRyEdJB4l2ibLI37KEwZ/LRpu/8BvRVKb+2LnoxYnga9iwRltY
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX+jMcA7uFQVYU
 91HYgEKI6q9KjYN1oXA7msPioKXT92Lmw/mq1GCnj9012pDD5yPoVIpqBOYYnXqr19nXIBKnqxU
 35WyY9MozXw8qcF7eDYu7elEYEuOdjcjTeqgvrkDyEcIpwqOQJw5oLetfCeoGQ/RNz5EynH5smv
 SJpkqAYsTwQZPr13hQMoVDgnDOVAeZbnkHhkl7zivyY6VIYeunUy6yexpnUXzQaGCxzH/mMTHIe
 VEBSJFDA/PUiNHX73BZ9dPrSDXSh2ulcLhnzw5QRPpFaLSx/ypNm0DRPoZQ6L9o2zuOqjunfG/Q
 FNkQDi4VJ3SNj/SCCD7t0vSAEMZOsP3dmTDAXf7MpbN6k1QvbvBcFteTM4KjRYyTnUZ/hLqfL0g
 6kv0TA8EXzVWjvowMeFr1OkyupMr1W0p6lfZLCHpBArUaSiBQ9/X7uJwRcIiwP0aDKWf+AK8Z0S
 8cRkmn8kwDZat6g2XPw==
X-Authority-Analysis: v=2.4 cv=MtFiLWae c=1 sm=1 tr=0 ts=6a38c407 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=12nZpKSYVJl7DlM_WUUA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: Fmm4bWRHcZ0UgJiBICgOXo6_iY5t9jLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX0TR1tPe0oiqB
 55hQHCi9Lp5lqbb4PaMgVPqh7hJjl47mR+MVk7gNMVvoUQj1H81fi995NGhd9cbdkJNY9DOXKtN
 o6efrssBg5knpMBnMVmXBKawW2xeII8=
X-Proofpoint-ORIG-GUID: Fmm4bWRHcZ0UgJiBICgOXo6_iY5t9jLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on glymur. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and document the supply
properties.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 114 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..16fc6ab87f9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,glymur-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qrefrx5-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-refgen3-0p9-supply
+  - vdda-refgen3-1p2-supply
+  - vdda-refgen4-0p9-supply
+  - vdda-refgen4-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1

