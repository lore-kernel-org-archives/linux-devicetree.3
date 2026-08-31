Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27553546C6
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145313; cv=none; b=HI+ZyuC13gxSmsS3e7/nrKj3dQRzf/TZajCkPY3EuYHJM5EMyarZrS6yGb1PY+/XuL+/jF/QtbkhuzsSlwUo3a4NHTpliqgARxSqIgl3jqbHsFjopP9OXU9KWMa0Oo0Ko80/EmzpAFFfqhXdCfIGpNecLMnJw8fiSPtUs2qeTuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145313; c=relaxed/simple;
	bh=iWIKG0GsxJ37P8HUU/8Um+QELLwdikK/1FiCSUl8mYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hH+h1ztxFqTOaLK9LVFF2/pHOpDSxTVrYRtdVVeQlEHE2w5ynWeMEeIpnw3mjc2nSo1AlpAwIKAmWTjSHXcaue2Tx+dLRHiqRADv62kPiiPyXxhRyjrJ78eOdlQtZwJEAr4LUyQfXGyyq46ZF/hVI6i81NXARKw2hKC+Ric1PS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfvXYaml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL+wbcgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfvXYaml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL+wbcgS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bQD61496302
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aWYKs7l6+KL
	Di2n39qvOHhp68UV5V4YMkiiC01L1WMc=; b=pfvXYamlRMnG3qIWKlLQ5TRkpbL
	Oa90EyscGEd59WvIwmhkM33ImEYeWJVWZDj10VsZA7rU6kcCeboCfqcj4/oL9PqA
	hsE/nRBM7TG12wyNkXUL7S3+M+Cc/yWkWbx0h4Ox3HQN+BXEVn8XfJEGXMlo8qP7
	25HzjD+rh62Sere2GSLtMLxapjZllEHNV7IZ9F63D3mE9BuuMDIFo7AxmdomTz06
	OU2PW1AUmnALJk0DSM3P4bxW6+UfCG9S+GLtLLwUoV3ptsN3D/XGpbbGIAuPuAYn
	J2MvQHDv/dJGJM2gT4WKEhFbKdHl/yMH6oMcqTK+klvgASZ+LjK+TeFZgBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrq844ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso42812885ad.0
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145310; x=1788750110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWYKs7l6+KLDi2n39qvOHhp68UV5V4YMkiiC01L1WMc=;
        b=eL+wbcgSZGFR96j9mxmC2MTpuILOxJgaeOW31INURJAmimbWQDtea2f7s1AnXaiy/Q
         CMzQ0+aDQ3n1tYuF9QgwGt0bcduIMazE331qoKYYYjeCjib/DsTmGOPOQKy7zS7VbAWE
         PH8aUXJzHrV+E6jj4aWTLGiXJg2SxhmXli5cWX6VffPSZ9mSu6naLdFJPzd/3scDrhGC
         iFfyjeVg1l54wbAWNgKoLpRyO4KtjaAc8rvMLQ8S9akUSHENa/xx0FwMJMhAiS2Q4QAe
         omqebczFKPsGP6iVMRoCBYDhVrNKQ0fYAQMcz/j13Zb1A9JJ6IFTOORG4UWBcytuUV3p
         riQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145310; x=1788750110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWYKs7l6+KLDi2n39qvOHhp68UV5V4YMkiiC01L1WMc=;
        b=fxRcqhjENcPNIuaf3GMgd3U9mucjenu2dYlBGEVMO7oqNvyoWfjJ+G7oYqQboyvBsb
         IZ85KxQzdmGZdklkgDCVCbLGefmK/seJPt2e8X7N3DDE6KmVw+/F3xHUkwhYtes7t8NU
         DQmYEvAz9J+ixALDO4bg040VDaFHgNUtyG5+f5k3zUcDuiY0hCGLbYJW66v75Ri7fXXg
         pb5SuctoaEkTExYBEd7Y+21y/tyUdYPV3mg0Ds0EIyTslodOnAVZ+C3R15TjeN3lq5r5
         DbZ21uqxummPCV77ki6lrdzGwwvT84Lhjw6Y63/UVpkbngXYH7j6dpkOGbBWo2PXk0jz
         EHpg==
X-Forwarded-Encrypted: i=1; AKwUvBxbqD0LSDCWU0R0ItgN1xrh17sH7PfvmDTZ1kEWNpM1lASxHvmSTmx+rA3wH6+ggwecgRvMlVg4hXKa@vger.kernel.org
X-Gm-Message-State: AFuF++ld2XWqWnXJGxns/cZb/C+K4lsWgUmKtKwyDAqelnbDtOg0S1wU
	P7b3hbgFBNS7CXt8rR1LNQ8LTkTem/EV4PMV5Cv8MNrXR1aRQe4+R8CW9XYqQyh+qZevaI3VdkZ
	ZMME2IoobhYDYq5wAadbhIAXSird/Xp7U3kQDDJoYPHBfZQd/pXkJk7e/p1bGabCo
X-Gm-Gg: AYBFou1pzCKsHtO0nNjfXfkkoP6tvPrVIhWX1/8Wc1cb2pETXQycaNtRY6RqK/S8SJD
	oh2x1kXXooQ6/lgHGgIbsjeN0cfOCU/9TV448KbboVn0yTVFnnYVaXdJR0BuT4TxXLjJg5vbIr0
	cnMNcNTlayC2KkoewThLzaEeHRvbeVONo+KfHPZ5kTnFVAHwvM7iAgn6YuYXPDdSZOwG4ia+CUH
	dJwEQ/8TdgvoPtR7zGM7SEWGHc/A7JN8y4TliMwmG4nmEjsKQTHdqYCOTOIl04HMDlEC2WOPCay
	XVpqYKz/m9kgpOLYyX3e6uLAokPCkg00MwrNU05Vm2eVHdOx+FPgwvJhQE2sUNTMZ6uxEPEojcU
	J4nLh5L8RYNPJAbGSD3eCQk0NbnTmjbjVsVEB1Hy/emiTbQi4vnAcnQ==
X-Received: by 2002:a17:902:ce8d:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2d93fa2fc9bmr5107025ad.16.1788145310335;
        Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:ce8d:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2d93fa2fc9bmr5106315ad.16.1788145309878;
        Sun, 30 Aug 2026 20:01:49 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:49 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sun, 30 Aug 2026 20:01:40 -0700
Message-Id: <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rSn46cTjULNPn8FI1yXHHJ38gHtuPWPV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXxJP6sytAiH6i
 ApzSC97YFAmnAl3vzqN8btrlpb4dvzqaTTqbdln/jRThCYvyFrNHhuyYSr1DpvzSIifdnDEnCiY
 ucuL8YrbwKvfe5RSJMLqOnhxkuNXjiU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfX61ECngptXcpz
 zP2IxsLOJifYQ4aMaP5NaL+84xBf7Q5nT+6ZwokdwVGT3rjnbcMAaWbjqQ9onKhFd3SjrKsPKZA
 MAEWNq0ogHlLPr6t5kS2/TYy2xAKh27PTnIfZLVHk4NYxSVvWlaDqbzP9r7e6ladYH0tBEj8tqX
 Qgw6qhL6ymbmPpfn6l1OoIdIKfAy+eMvv3i8pLaqmxfVOOzULufuk/n+0Vry6csIF4yV2pbJAWz
 OL6zR31BCwuzDq+F0eqeO8cbDNCXcCRohnb4vIL6iVgBXjTVJZOIQ3OFMkup6IuELaAFZGMNM+X
 WaZEo6nTgWAgrJSQAMZZak+YUpnID5ZpG4N/hAd/hERv30/dJIe0nwcn3FMMCyDBDpX9WFNNc+X
 /TXvZg5TI3o4VVUdbeC/Y/83/qUKkfZnt982y3yLgRzmmn8BoZG8CBH+ZfQwq8YKYDwUEGjEvzm
 uYUIAmmOxwNzdcVUxTg==
X-Authority-Analysis: v=2.4 cv=ZOPnX37b c=1 sm=1 tr=0 ts=6a94ee9f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rSn46cTjULNPn8FI1yXHHJ38gHtuPWPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310024

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
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 134 +++++++++++++++++-
 1 file changed, 133 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..c377a77d623c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,88 @@ properties:
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
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +156,56 @@ examples:
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

