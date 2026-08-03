Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295303264CC
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726940; cv=none; b=PhtoKv0ZFBF9mJdPkHo53vuXkL6Gvv2Br7dvI9meUxcLN/4u/V0q7OOJbH/F68z0JB8033DT0p2kTBWjXZalTSVw/315t0fiGwUrqFigvWwoQkxBu4YY5rpHiG+MovT029LagAkmsyAf7jteuVuoGKNEfZOOESH5PPmgv8dPw1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726940; c=relaxed/simple;
	bh=Ms8xCSaOs/jykWnpXTey6hmewHvpI4F5jGwv7/LeqII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+iGCh5bbsQBuz5t8UR3oG/iMhe0EWzkbd8Bgr3Pwo/cHdVFe18pTgPkNaLpKZl9EM2xe2WxyzBdduTo74zqZDPWeMVRDixkk7zD9Qm7TzSD08T2v4kOkVrCZpSOis2x29zs2nNoBvG1Ato8ib2WlxcbPriuUipbFMVmVR2clsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMFxrHhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdPe/C21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMFxrHhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdPe/C21"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVrmc2552962
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 03:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yj9yTw9oRgk
	ITJCjIE93n/SQASuWUbkhzKAsAeSQGow=; b=CMFxrHhTxZ1G42ZEnq+Jnl6Fqa+
	LFg6koyCTJSQBcKGZ9kksVwzKBXqqFBq4fkYR0V5fHb0PzqVHehMgoPPwm1e5Y9l
	nZtrVlpGeBZOoSxCJ3USfHV4Vrpcb2BXM3iH2635tICPWLG5GA3p7/VcZ1zi6fL0
	uFYdMfysYMVf8a/XfylRqAay2Hv+HCQ7zbWssTpwoCveE4K66e+iIf3g1fkVVUri
	O0kUHpkSRhtUIAXFbqM0eveXN/7r7B9KdCJtudrgaTU+FrxEz7K1k8eBMgs7GCEu
	mT79P28eBxEKlGq010ckHKBqiOgvfT4pb3lBm8RcbtXQcDeFLHJ4YBxDgoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa3842n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 03:15:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso80664665ad.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726938; x=1786331738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=kdPe/C21AdDuXLtSzd9dkZeFCjXDJHxtxET+aq24JOg3m5hxqTCeFZ4oztNIlerPsP
         fRDIRRwjdWCqr89X4ESTZdea7TzpvhFbbVYYrNVQ3ezOePgHV9GyJACljwGB02puLXa8
         a6zEB65Qiv6wd39oKWfHavdsYQAURXH2ABn1tjyACSGUBLQY77WpYRPivcj43qsSbf6P
         LKy/o8sx1ssQQZDu9P/dfquf53T56Ym6uN3ALcThG8qBsvzuJ+nL1q6Yr34MEZZEfvR7
         BwTZ+5aS1njEqxqV718sd4pRTRjgo4CAlFiEQDiJcnKtNxju2YVxqFFqmoJwzKguQsen
         GbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726938; x=1786331738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=oPsIblyqYMimB2HIyBdXeOYtbN0p8wh2MNdPsod3qIZJWlwo3JBdLHlnK2Wfh5cC9S
         7PEbPhvxUYwPsGKz968J4FcRI5+TFRSb3/MxHNALDs2l7JEpDV/dDWPJPhkMMH5OnUh6
         X7QZHrMKN/3IZyHBQuYyDchhghNAgmvxoc5tRBmXdh66Cr0TXGv1EfkEHu16MfrcbDrH
         zoa8ZnMhGBKvJ/JL3R65KN/UHDNOV/jOo0nblZacr3D9hqqWA4xKKDS4WL33djnE41qt
         j69bMNoW+sGQHAOJdOOBYeoWC5hzv8pgMjXRz7SRxBHaA1fmZ1S6Pn5rs+GfNHHT+R2I
         IedQ==
X-Forwarded-Encrypted: i=1; AHgh+RpR/DX0aFCP2S70iJez+XJ4JqjoZ+MfQpy/4nK1kq0PNTtc0f2pOgZz++QDW3cl/SSZWr5iEq5wzBio@vger.kernel.org
X-Gm-Message-State: AOJu0YxeM490uf5jUAJTTzSVxo1vZV0Y7JFdox0DlJihzzEI8r/W5o9R
	nm3c7rHBAlaptwGIHr9kAcjybnnJZLLPf4dck9X6tdf0ux5pIMokg8mR+QC0Fy5En2/32pxOyN+
	UneXJAJbEJnp+ze7b7qhntEq6HhHaQEDcvsaBOT2E+h2RKOcRzKXKejjetHgy+Tyx
X-Gm-Gg: AR+sD129PMkOqZQxEYn5M1Gf2cAOatP/+JGbZqrxsUQOOkhqicucTQnwzdECAq2fgoD
	lgYywrPBzWibGOx9nhZxOHQU6deTDgxoAofyD6+C76mJkgMYTi7/ICMYl19jcqkxb+0xAfQKbIi
	1jX1zMGINCjkpOKICFHmzclywMBbiA9VjQahtFQSA4PMYTmv5SR7neG6wzU8V0GoWV8Akfrma8H
	RizOZVlPSDApPVYAwWfe0bYiqwAh7RCnw/gFlwuDLTrHVZwzbNvXtSigKs255O6HvtA6OXQZbFw
	fhX/E9oiU4grgS4HtdO0XvIATH5gvdVugjWKKDSwD6D53dDvGFYbcBmxk2G039q36aleJIYenUu
	6IxkKj6SY/N9V2HTwVtR3gqY2wYzqNRTJQRG2AMB1eQKvhkncv3Zg8A==
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639756637.72.1785726937677;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639735637.72.1785726937285;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sun,  2 Aug 2026 20:15:26 -0700
Message-Id: <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a7007da cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX042GlyQKVVv5
 oyFrrLbBS+hnbwoXx9TJ6dPJ6IjDWksUb1lZt3+J37kNYkf2oTDnyQKZqN5rOEOusNXfc2ZrZ9a
 pnw13HXIMI2VuFe39uwCnL4rLiotcRw=
X-Proofpoint-ORIG-GUID: iZwdnDf3qeYRom78_5YbM--2dxVxn17E
X-Proofpoint-GUID: iZwdnDf3qeYRom78_5YbM--2dxVxn17E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX6ule0XIOTpGI
 ivLhJsEOlogMJaylyA+/I802rtssGtUFGdHIM/i0gS+OUrCJeEZCKjO7lZ9jcn/2Mj5KuAC5vPn
 hm+gHgZZG/nnQwrMFVZuXg4nO4lAGJRsivCDhYa/dd6n7FJN50alexKu9/4YIbVe6ToUS+o4iz0
 M3fpCe99lhZpGSyRuD8YBwBMXslIJe7UFbh15HjzpMVBceYPSovH7Cy8NuB9ubVmngmNcuFdUmL
 iFBufTqD6cgoH9X4nD5e/On6OlH1G43JtMM5pTJKCtj309FbNM/X7UzaSx6wstkXIoz3S9iuNL1
 WGOGr0FMbhZOVrpYml88JKxswdAmuh1SiQh01BJ6ZL3+r5jL0FQJ7VW6MgAoyAHF6uCk0ksYlPx
 EAuhwy/hPvxgI1MCwrr2c7QjXpORD0Ox8WbaKlHmTs8wXm6U9adCwZosWT/rIDFLPzYscHJPMGC
 Ird/pwK4+yNQEkqchLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

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

Model each UTMI path as a separate child node with its own OF graph. Add
an SM8350 compatible for dual-path EUD topologies while retaining the
legacy ports representation for backward compatibility.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..6fef958487c8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,82 @@ properties:
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
+oneOf:
+  - required:
+      - ports
+  - allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sc7280-eud
+        then:
+          required:
+            - eud-path@0
+          properties:
+            eud-path@1: false
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sm8350-eud
+        then:
+          required:
+            - eud-path@0
+            - eud-path@1
 
 additionalProperties: false
 
@@ -77,3 +150,56 @@ examples:
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

