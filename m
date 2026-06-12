Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD76390C9F
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781293465; cv=none; b=aRaj2jqMKgM8+pNnIlIhpJWurQzJHlZsaNChd+FeD5EKD52jTGWSeN0Diy9axwsFI59rIH4YMAH46i/lAmjMG3OxPV6TMU3Y4alMb99Q9vHI794RVhXldBwnfCotDZunKp917nObK1wuc8Gel96SNSRnAhdDuglyDjh4hzzxzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781293465; c=relaxed/simple;
	bh=J9o6uiC3hi8q182stCHjWKLIz7MjXttP7UeclIVpQzk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HC6egrGQwFp+MnFfNOEgh9lAzQqJIo3MmrYpZECgNK3Id6UKc3MO6zeRbigh2Z7Ev1VT7d/lokWssfuVnWPknBoW2mrAEd2pvVzPshAmF1ly4FdwP61OCIDsaDL7evRb3L8JsWQCD2wRhYPSQ/UgI69GjRaC8fR+eHwX01ulReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaHvfdw+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jvyX7jS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MaHvfdw+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jvyX7jS5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGTBVU4114360
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQY8vaHCT+s
	6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=; b=MaHvfdw+R4kWe2I2ygXJBk4KCr9
	jmv4LGOcAz0Mv+G9qGMxhpHhjQe+8Goc8zzg4db9SjCrCjsg7AhwHuOuNPf5Z1Ni
	T5p1Ua/OhfJoMw6e4+nXKqA3GA9auL+W+1AOiGzq8Gx7QQZGCa5zo+lxno7QIDlI
	7R+S+Gecmm1RqEIVN76tzNe0apH/KTaYCtihDRxDLoBaWAei0eRMqVJn57RDYZYd
	DOkfFVQ6LiYTM6R25Qc3yuFMR4xw5cDendEPbtM9U0VTXHY6zwu53I515+bqrsKi
	pUOtsCbP6zkFZXiEAWNCF8/gcM1vg2ztfBKmk1LUn8XeHEvvRN21qu4BJ2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ctkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 19:44:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915d1d4fc5aso225235585a.3
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781293462; x=1781898262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=jvyX7jS5VIqz3CTpBGqm7xmrwoq4TEh4/Epk1U696tX027zGcWz78Vk+WXJB3GS7hc
         M5XeuTCI/zTEJuUmuV2Zpp2SDEfNoPmwEV4ONg9Doq3p/YgWKpJMqFgUrOAXcbUaCEhl
         wofmPnMdU6JuHVaDqpueYQpmjLr0v62IKdTI2GcymPrOoHBc1oCQhMs5bKCA/Tl+SoLD
         5kUnM5Jbog78JVuup+vIeKfoWlrRyOOyK6L1axHA7EWWZyw9V4w+hRFNWOfZR9+7IYlA
         kWjIe1nSDYq3z8xCcp0JMEhEbIp2SfAY6rR/mAdQkN1HYDtgdsSGMJ3t5wzplBeQo6+P
         wJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781293462; x=1781898262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQY8vaHCT+s6pSmQcKdPxEExsD1nYmMloB07u5w9rOA=;
        b=KJx1sZ1q28und25e/ifFK3uRdce5bO+ENQ0+ll03H9CaKswdcRZuSrojON5UmaTSi8
         y/SE/r+YSNdGLoP0PodA00uy2F/6NtBCo1ul9DUvXlzahcxQZv34PYZtpXPzOOpc+G30
         +vDLBV0Q7N4fl8cZsmk7NQVezyThlvyJCaDC0UcgQwY+bFGckT5fNmLZDhytS0afJicH
         spvUdmylU1fYcMMMAHemWzJV7/lcJed52jzGRCOH7X1vMzFvh/m2pip8NRfRnyY6aItr
         qOkNOx89r/+Xwel3e51afgU4pL0+WNlahZVK0e81TW7JlsNcBr4ljFYSQ7Vbu8goclob
         nZeg==
X-Forwarded-Encrypted: i=1; AFNElJ9fUhHBRzudCAFYqW7OoXW8tnxP1O67y/GtrbMUrwSwi8465mloOAVWhpEMWHrHhQ4EppKA5yCwcaHN@vger.kernel.org
X-Gm-Message-State: AOJu0YysXyVyVtqeM3ieWPpo3RGSWAkkUmZL4+W3f7uM6y632P4ms6So
	2Mqu73c/D+9hZcZCsGUdZWUpl19gjtI20pEQ/OxC6o1HFx56ubPhKwKB0B/Xs8U11ehEoHHFEJ4
	KEr/3TGW+vK0udpbO74X+naaBYpjAe74FcGRX4eQEIgbemxfSi716vUC2Anx+jmEW
X-Gm-Gg: Acq92OEl7CWp/rC95BvnKd3ijzmGAaWVT45UYH9RjbE+62xgEW482IofKW6ROd2fend
	2zF7T9McIMcBp7paNW580VqvwwDcE7nTCFvW+Q+f2A9h4X+HyxyM9qfuo+twy0eM4bHgIfSMZcd
	btNdDb3vMpeeQ3mQM3vBBn7cXkuG0209jitNmTjn8VaJfaED7TtNNcgG7BfCR7AQLqL3YpV+NOQ
	jQVgtyPvJpyWGXrIVJ2ZW9z8iZS7ChR141Cd7ZfwmfkdN7i3TXYWwhp2Dusv2zncPXLDu6rQoGH
	fjJ7hBJ12dRInGHbvUCTOp2ZyqI3QxN7Wc7V/tyoIblzCbICyDaQ+3+IQKGMCHqs4DOFT2UsKtK
	H1m2tO4X6UKSd3ZzkVy0hi3f3NRGyCDWb0hISGsodBJqRNg==
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589395085a.54.1781293461666;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4152:b0:915:70b5:b204 with SMTP id af79cd13be357-9161bf58dc3mr589390485a.54.1781293461248;
        Fri, 12 Jun 2026 12:44:21 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420570sm138396466b.11.2026.06.12.12.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 12:44:20 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org, bod@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, atanas.filipov@oss.qualcomm.com
Subject: [PATCH v1 1/4] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Fri, 12 Jun 2026 22:44:14 +0300
Message-Id: <20260612194417.1737009-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
References: <20260612194417.1737009-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfX90l2p36XgKEp
 Xae4GKs0qseZ15onvtW25/YtqSK4QfCvYizWT06zX4bZgATeNtFKYN1+RtrwsyQKmC0aG+LsLXd
 YSacwqpiYnEvkJAgzdbxZrYdg68/quQKvGsJ5LRleGnZOyQKAkzYInjTVKAH2Qp90+CX8tB0Hr7
 CtKVMbjs58r7dXRg6sBmdgW58K/ovvDQfmVOa/vkDJmfQP1gydgnbORR1Nc4y7Ymh/bOZH7T1an
 1Kh3ySKD9+7alXr4oA/Rzmd+nJkQAkA1cPyeVSW0ERL3hnXRRm7LzPUExnA3qgIEQ+4/APwB2Iq
 5sQvO9+VXVGFHIWsapxLf5jDF5Gfu+8qR6BtXjlUzXqAap38Amw9HdZax49nE0cBwcFVD1MpbWq
 KL8z7ZWQCYUPAqpDHDRAm61+2ozvJGYvtgj0bNjWz6bi0R7H/KeY0O+esqlPxNVPjswi38S6vp4
 xn3C4+zC5Bkyp4WrEvA==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2c6196 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=8hwD-i0G8y5I-v6eKTYA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: inM6PwIZ0WNO7ovtnFyTT4bBNUp_HZ57
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE4NiBTYWx0ZWRfXxQexJng62Y4m
 Ewg2QmbN+PdO+prT4rygWB7wE0aEkIynXgH9YcTN7YkdpNrxza1PGrBbJeV0GGEAVdgT0Tvuifc
 tUysePfVxeGSASBsQorWY7EBsNBoTdo=
X-Proofpoint-GUID: inM6PwIZ0WNO7ovtnFyTT4bBNUp_HZ57
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120186

Add device-tree binding for the standalone Qualcomm JPEG encoder
hardware block (separate from CAMSS media pipelines).

Document required resources briefly and scope initial support to
currently used compatibles in this series, including SM8250,
QCM6490, and SM8550 class platforms.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,jpeg-encoder.yaml     | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
new file mode 100644
index 000000000000..83f19719a869
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,jpeg-encoder.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>
+  - Hariram Purushothaman <hariramp@quicinc.com>
+
+description: |
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+
+  The JPEG hardware IP version 4.2.0 is shared across SM8250, QCM6490, SM8550
+  and related derivatives.  Platforms based on the SM8550 register layout and
+  interrupt wiring can reuse the qcom,sm8550-jenc fallback compatible, provided
+  the correct register base address and IOMMU stream IDs are supplied in the
+  DTS node.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: qcom,sm8250-jenc
+      - items:
+          - enum:
+              - qcom,qcm6490-jenc
+          - const: qcom,sm8550-jenc
+      - items:
+          - const: qcom,sm8550-jenc
+
+  cell-index:
+    description: Legacy JPEG HW instance index.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    oneOf:
+      - items:
+          - const: jpeg
+      - items:
+          - const: jpeg-regs
+      - items:
+          - const: jpeg_regs
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 6
+    maxItems: 6
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: gcc_hf_axi
+          - const: gcc_sf_axi
+          - const: core_ahb
+          - const: cpas_ahb
+          - const: camnoc_axi
+          - const: jpeg
+      - items:
+          - const: gcc_hf_axi_clk
+          - const: gcc_sf_axi_clk
+          - const: core_ahb_clk
+          - const: cpas_ahb_clk
+          - const: camnoc_axi_clk
+          - const: jpeg_clk
+
+  power-domains:
+    maxItems: 1
+
+  iommus:
+    maxItems: 2
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: cam_ahb
+      - const: cam_hf_0_mnoc
+      - const: cam_sf_0_mnoc
+      - const: cam_sf_icp_mnoc
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - power-domains
+  - iommus
+  - interconnects
+  - interconnect-names
+
+additionalProperties: false
+
+examples:
+  - |
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jenc";
+        reg = <0xac53000 0x1000>;
+        reg-names = "jpeg";
+
+        interrupts = <0 474 4>;
+        power-domains = <&camcc 0>;
+
+        clock-names =
+            "gcc_hf_axi",
+            "gcc_sf_axi",
+            "core_ahb",
+            "cpas_ahb",
+            "camnoc_axi",
+            "jpeg";
+
+        clocks =
+            <&gcc 0>,
+            <&gcc 1>,
+            <&camcc 0>,
+            <&camcc 1>,
+            <&camcc 2>,
+            <&camcc 3>;
+
+        iommus = <&apps_smmu 0x2040 0x400>,
+                 <&apps_smmu 0x2440 0x400>;
+
+        interconnects =
+            <&gem_noc 0 0 &config_noc 8 0>,
+            <&mmss_noc 0 0 &mc_virt 0 0>,
+            <&mmss_noc 1 0 &mc_virt 0 0>,
+            <&mmss_noc 2 0 &mc_virt 0 0>;
+
+        interconnect-names =
+            "cam_ahb",
+            "cam_hf_0_mnoc",
+            "cam_sf_0_mnoc",
+            "cam_sf_icp_mnoc";
+    };
-- 
2.34.1

