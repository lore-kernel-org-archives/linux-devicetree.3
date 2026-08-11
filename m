Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DC3F6C3E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484177; cv=none; b=dM11+BW/YmpFETHQugVQrLoSR4YZoZkAFdGrWyJzravQRIQxT2ruMh7DpOcY5AY/ufROfz1aU2qd1J+AFlA7JVqn1yezMZr+JvZzAljuEZkMelP5ecedK9NMFDoEKa9xPD1y8YO+nsQITrEg7JzBoTyvqgmUbICSNKXdwr4a+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484177; c=relaxed/simple;
	bh=vMN9xFS7+UE4CpC8JHmwvxMa/ZHXGxw+m0BPvf48J2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hXvPDs/BtYtRbphhILoLGaczNWT9qUbsmF5TBNhz9RRt5d6nFyq/XhcYrBNsUPWBtAtrPpDtYkrUTsJy2z7U503D8hKUxrOs+16yrVFa0DXfIdChWuw0O9ZCa0kGHA5bqQ3GdxMlwH7mdOxfD5DFO8Tpf4Ytx8NAKC8GI8rgdeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEKvAmTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EBh0TxS2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEKvAmTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBh0TxS2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQFdc1755683
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y6Vl3S9Ln2Q
	++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=; b=FEKvAmTobjJytMmB9Le3k1W4Elq
	mYQ60EH8zAZ2jda057ej2RJlmJUo1xpeBIfcqb7sg9AdBjb/u+JG/xgTwLG6vchu
	V7sM73cb3NpdQPdZCaGZsMMCwt68EzL9X/0w6PwT5fwJzwN4GRGl7UMzaAhaDQgl
	HHaC5WLuzuB6d6uhu29k06K7lsMNyqmliAnJWBZL/0qU8QUBS6l05glBr9qc+87Q
	tFU+BHpNaRWmoHWMOcCJUOxXlyPLG81s4/OIO5+Rla2j2vrQpaeH12y0WNHPbW0I
	N99bMInffo2ffSpL5wX3OfczJWgLe9MK7ag2GI298+QQS6bPLuvOcmQBwIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gt79y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee57593baso58224a12.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484174; x=1787088974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=EBh0TxS2Sx/akIIs9KeydtbJV8zhkFN7cuH68grGkGSW1hrg7UK0jcIZ4LWdcK4HpN
         tzyr8aVUSi0l3ywO7nNIIe2KRZVDB4y0Xw6W/pXg2b/oHsc95ShBPPDSjO0f87DIx2YI
         2cdvVIx2zhKmHleMErNfjPvsp0mcg8zYJNcDO0awdywAr6MI2rTZxRzuvDcEEMTNe0uU
         sh1zG0O/1qMqKan0VdN6LYykZPFIIq5KJNbV8zYorW1r6NIuhc4TJl4irKGJNUgO+G2R
         K8U7sLeR22gUxjru9n8piXgiwGAv9dxQ5GqA7MF8nkklRVe/9LMogslMv3cVJYqktueF
         3TPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484174; x=1787088974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=dZPw432jHstglrY7861l1W4n/T2QXp6zZxh7wv7AtiGf3OyEsQOHyFYxfHxw32VmjZ
         fCgYV6LvVvtrJ12/wP0oaN/XHsXImwdoWTmWEANCv0AtGx5pcBCEEPrpKqm0m231iLD/
         peD7AaSEnsWn4NVv3rBh18JoGfEwZKZX86lvbGUl21yYkPZBUmtDi6739vSvDKbOZqoc
         64hDlAxqFU1X2T9VnqjZhlz7xpgZDCFYKMXSakuVgd04n5XdfywoH8raOVzboIarGyRY
         1l5Uw58We5kYvr6uDRhbdi5vddcYQ/6XHBaGJ7Ci0DafoAZDHY7ikjgRLHfKxVsnLiU8
         pDmw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2A6yckdq7Hs8+SEsPIQPKeh4V3vXoRhXDLD/Z1nmliJ3ltzX/eKM5dm5AmWXNauYN+AJD0/DzdE3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyvxKCRmNXxHIFXbR3j2bbCZkPQY4uLKPdAxCK25ytzTvJ1kw7m
	D5dnMZDkKNdkqd4tFuGuNZlfz/8ExZ5HPax4qvE9NQAg4ikGiL5l3rGqHbWLfGPVQ1muxx4dyGx
	9MtV5xNyq26jV41RfjmDaTWuWCv7wr5ItWnuuZFY013li+4l7LrRHl2nMMPyi/84l
X-Gm-Gg: AR+sD135+fLYazk4AbDf66AyNEmC2ltFqhgyMPpIDKFRL8JyVwQ3sdV8E6zby1YBVmJ
	BHToVXQw38p+9WFn3CH/jYTRLxGKqKWkxEYeDFwaoBzjMtNyQVskoIZdvqkyQ2QDefFFjJL9Wo6
	JdA6ui45YrbGyG85wnD4NxF4WeQORnYqKNAW0gs2g0qkj0i5jDcJsPTgK/WBJUVfxuMj5H3xxDG
	GtBcYQQdhxnY6DX9aeMOB25QP2OQJbH3Cq6xSImfjq+UOsdR0fJJ2gnhevntrep3xivmk2ucTs9
	2KwbkAKlofJR7g54L0v8g3Y+bEn5zld3jQp3r8Dbn//sM5fr7o6xhbCW0DWG2v4h15zCIg8aoko
	TEDIQATt5QKtmAsD2ECpvE6O0C6KlEDYScERrc4VjU7jCrar+2UcqTQ==
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221726637.20.1786484173501;
        Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221656637.20.1786484172935;
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 11 Aug 2026 14:36:02 -0700
Message-Id: <20260811213610.2956147-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXy6pmKT9E5ZLv
 4PIqWJPNwP0OaxTNxlaY6SFlm3X40oKXY1wqvRgwIRYE/WK2CZhmxPbxznIDmr8TbdTqKRqOtCn
 Ll2oOPTGdbhWSugyA0G7KxDCp+z0a3E=
X-Proofpoint-ORIG-GUID: w6oXjhd2Ry6xxBKc-Rhet0auaF7DCpZK
X-Proofpoint-GUID: w6oXjhd2Ry6xxBKc-Rhet0auaF7DCpZK
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b95ce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX/m9MauesgRXG
 2UTMYIQY8xyycmdVqkrFExYdeHFWFq7ashg7VPQWyY0FjdSzk2fe/i2NAuszwkik8gfXQM3F+18
 toNa6bkVoSSclJAdyrAMXwgXh4bJ1UerKCq3lgZxKHL382/899HECETos4s3tEQha+I63hkwo9L
 YXGBU70v5lIyMiQJssiBrrp2MPn+SndtRweCxtY0nmcuGopBL8NsxepSacByPB0CVshX5wrQIVv
 si2Zg0mZULuHTmTI4lH1jv5yY9WBHKAbfqUNnF7Kh5y+mUfhdzxWbpe2CJN2Ir3G9p5KALBj3tq
 bzzsrHjmEKIYHj9rW9VJ5ubSsPoMcr2W5RPNUHDACABRvLGlGuo5RdUhs2zS2/drghC3yNvlgZJ
 x9T7f9FReblqbpn7w3n+2lOYSdK4B1NkVjdfNbDu4LSVj66evWwkGvfcWHbeYFx77rFVkOY5inl
 ku75tXKlNgUHPKUcnbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 133 +++++++++++++++++-
 1 file changed, 132 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..0e35bc9a9d20 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,87 @@ properties:
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
+    properties:
+      eud-path@0: false
+      eud-path@1: false
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
+    properties:
+      ports: false
 
 additionalProperties: false
 
@@ -77,3 +155,56 @@ examples:
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

