Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471543D953B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253588; cv=none; b=aZXS4W9CrcIZcRDS1QppUieywroTg+Oyr7z76Dwzaak+Hmblsvmco1KEFuePMmpnna16oDUNmNqfot18OxgSNu87U55hEXgSdYP5U+c2bBXf17iKXsgaMDcggr924q6btw5OYagbv1mHHxrlrzM09jXMts4btPN1cac11N5GCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253588; c=relaxed/simple;
	bh=NS67m12FohtVTM0LAceMS1EJYY9P5UQk+hL/TSpoW4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRKlHPRbh7qLXlM6ele8S5M+KwiUIBQAAjLtpWbTk0+Hq4oWgEQcmrifjKuS0VYdsJ2tfG60Y1KSSHvS/VAZGAokEhVmhnO+XbeZ1m4YHOT3XNuyzCfFMNcx7zRH5Bzd4wfPqr2B8CqAlc6XeknX9pR7mvJyDwGHwVJVJKNFkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDUtrZAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ue9Vz51d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDUtrZAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ue9Vz51d"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLnOf01080294
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=jDUtrZASU4zSm1oT1OWb6CujYGu
	3VHS9ZqUu9i2qLC71XTqukm7bWcnoYoqKUQLVFeP5F8aW40RomjcnNFkB6OyU1ij
	2M+7ux7X+/5lDDRy9aYVcfIGpYYw91GEfoQgqs54yVd7q9vzYvC8/On4XAnUL30R
	47cqaZjA50pXcv14fHl9hlEPzE9B/XhrPozkMRT0afoy1pspKFH+q7f54Y8eRJt8
	ujojGJASfisZH1K0rkciGzgrp5r9pnicDVXDTGyVpgO54OIFuPMRRlEGZFgm9FyL
	m7kB0JooX1tovQtYxXKhQgj4c+eF4qeggfZcmptlZD0IeUZujkgFnPbwLKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cj2qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc73f47bdcso25984295ad.3
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253586; x=1789858386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=Ue9Vz51dPPoD5COXhuyu54RdwQDzpLzGYJ4k2pPoklqf9BenF5cezGKZv8NYaSCqpA
         HV1w8xIgyAmA88VnAHalhJc4i8nnnyJJnBXOParNPe54k4J2f7/aGsXJDhhS5s1TwWnY
         u2oxyBv42AJtK33geR1EmbEwlxWI52LNF07oorX1pEe66/Y86lfoayjnTp2639afTlap
         sDD7gTB8pMr8P3DCN9qlToFiknHzq+qKDTZJNDjVah0pOyQg86y7BazKAlLcJaAu/NSF
         eFxcuQr7soRatUM54pV1JRM5xcr6+hDhc87zRPiqBb/yei8u5STUqr+8F7SNkWnYWGX2
         ij7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253586; x=1789858386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=X+O/IsugEbV9PtTCjHslpVyb0seMLjhtdLBl9L7GatTrq8aQVNj9Nx3sBZZUOZvMia
         70ooLFoxdzQha3LuS1JqgC/F3oN1VVDo+mLx4rJdsAK4fvwqMUIlQEDMuLSqaSx/B1ml
         2Ycks77CpT1W4PUi5U0SNPhRksRq8pv1Ox+JGLQmen9WTu/DIDqg1Uy44kugnfx1hP+o
         ih9EGbzijJ2JaOlXLaWRANBxgOM6ieV7ImL+ByMui+Rym/lxmOwIkdTU6/m0gh/1M69o
         Mv8s/KK6yQZx04/rUeaGeMU1O/p8WP9yrsYiTRd3Y1H8POFUp5tXyr4i1H6kVFWTTw0i
         sIPA==
X-Forwarded-Encrypted: i=1; AKwUvBykm+53UinlrZ8c3vauxy52RuuupMcdII1v7sQiNZjPSZljtIazJg41uGs+jCPcT31FJCflzj9eP3TA@vger.kernel.org
X-Gm-Message-State: AFuF++n+g3d0FoJx72gzsdX5BKIZSkTgb4SvKIJxNW2YYx8ULoN+NxUJ
	zTJwp5uaIWCQy1BUhjVhVFRVOQ21shJYbqlRoYbtYl9f8JXTfjwr6aOD4idNTMNB9ZYgNcSt7dW
	Ra43YeW23ROZglPvECfyoLD98qG+uz/uPF5NcaqUOZ378ZwdCEaPDtdhO5c285SGWxZxTZGog
X-Gm-Gg: AYBFou3hTUnQqSRkxwpDyHs8ez5SM+PgVa5vo5//OjQ5SWj8QjlMawV1UhGSc9mY8jz
	cxUM9ctVs8/nWGy/lIjMi908WVZZk8rXW+14A5qaduy2R3s348uurazJxrDlppv94eEAUGlm9E/
	/Ge5KamLYAXi4fVdxpiyrf8I4i/Qbfw45IitsaSRapVNL3rELAdiYXPPbHS9Odfj1rLM0itnFHl
	rkUQik2m7iwRLFcW+U6mkynqmQSZL1QRbz6POfjb2U/Qjb5QRdwQkBZmG2lmRjZQRK5BhU3QjGx
	9dUY2/86rYv7zDpxun1D5akQphuJCVwDEyFavu68nHPjc+xKRantxL4sW8T3uLcXniZ1wKdnpUy
	+uoPiVpd5gzNDyCqVF0qYRfY8U3ZCe0h6IHjvr8f0vPmCEaPRe3rNBw==
X-Received: by 2002:a17:902:e74d:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2dd2a34b154mr185634495ad.14.1789253585801;
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2dd2a34b154mr185634155ad.14.1789253585359;
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sat, 12 Sep 2026 15:52:54 -0700
Message-Id: <20260912225301.3396556-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX7Hs90SAQrY90
 PDJER+P5reIs2P3kvhN56G1FEHxZQSubABi/I4RbUHBcScPqIfVEyxHTotUDdzFN/A9Y1QB3ReC
 dC7LI2qgaUddYja7+yKDp56mlTVzZU9LWGsqIVSEkgwAlqeTg3jp4RRcjsF5BbOAugWAcsKDf8Y
 Acz3DFudcCHIgoAcbVKlHx+be+vTh86YLmeDVGHA3CaqRZVuzEm/X+BgGdjHGZhZRemgFVu6squ
 IqRZ+yjF7OkV4LsgEcbNFrzyE3PaujusW9VGvpSUYARIiFTEZGYj9Tz4/Kxfk/uT7D3gztLD7Oz
 B5FO64e7JCWfjIsIFTRCnQvhf8HebMciLmw/kMaEsUEvtRzeJRBj4ybhQwpOUL115hAl0+mFpSc
 9R/mt9VZ1jobyslgr+vC7+pSEgk4iA0Fs3estK9Uh+Bq5q5Nzv7/F3I2290udZVKJdNtHQa3bSh
 SOOef58xRNtKFzWPwdw==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa5d7d2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX5EFPxzqGszvh
 iJh3SRBf11Omk8nhPFxOHhutP2YWVtOJ3I3w4Xi67vIOwBHPCvZXEM2Fts1SI3KKwWSE1AaCbi8
 N9469Iwz6leU/yCiWmYhgWwWXVkuDQY=
X-Proofpoint-GUID: MHL4xUVfCgMc9znxdtTHWCHv_NDNj3sy
X-Proofpoint-ORIG-GUID: MHL4xUVfCgMc9znxdtTHWCHv_NDNj3sy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. This
representation is used for role-aware EUD routing regardless of whether a
SoC exposes one or two UTMI paths. Add an SM8350 compatible for
dual-path EUD topologies. Retain support for the legacy flat ports
representation on SC7280 for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..90dc104e4475 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,92 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-eud
+    then:
+      oneOf:
+        - required:
+            - ports
+          properties:
+            eud-path@0: false
+            eud-path@1: false
+        - required:
+            - eud-path@0
+            - '#address-cells'
+            - '#size-cells'
+          properties:
+            ports: false
+            eud-path@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8350-eud
+    then:
+      required:
+        - eud-path@0
+        - eud-path@1
+        - '#address-cells'
+        - '#size-cells'
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +160,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

