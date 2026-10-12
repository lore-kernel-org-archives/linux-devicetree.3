Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D44718C1
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796635; cv=none; b=YfAhax+VswDUzFKEJLHsr9Lboyc3EarY2YMYTqyxauDfGBpznjzUcLjM0NjUFZOPz/ojjfdj9Mr9+mUl7PzNI6xVfU1m35HV+50FpId6vcI3ZXIlbS1Kfip7LiFpOvDQFKObMzF3zkBp6muv/oSN5Xs8ziH8LT57dZ2Dzx/dZcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796635; c=relaxed/simple;
	bh=ERdYVZaMlLhw3GO0KL2/q91sDPj4O9nP4Arhh2pwFYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyhlyQXGa9TT5lgyvPAZEvIgW2BqmxCZqrfjWGkw+K2aVFVVwNdPpY9gTBTg/c8sMxjjuWBO8y+vGSbSB5AxzZkxRyytKG7Jvk4BZkeI1RdQFdXd6PJ5HvsRRCChGEyr4CIV0bTF3TJt1OLBYy9NiibbEZcQtIqSpSAFwBEReFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUFrmwix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VY4uDjJW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUFrmwix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VY4uDjJW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8LEjm1754767
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0JuEQDaDLEo
	WHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=; b=kUFrmwixoEP350q3wZoXTlH4yN6
	CsXx6gKPvQ77dGgPE7RCkZlflqdCclv5HK5B+vouGMIHBYNs47/XYDN4uWzAK8h2
	6Tib8wVsVKzc4gpcbWhpWXsHzmZPIkY736lM2kc38bhk4RbRAyZLezuYlWN8idWu
	ScmBNYVk/VyfwrVRQI1fnmh6JF3ah8TdD8zzO9RwfKLUi98LKsiiGmXjbGtB9EUC
	Jo9JnvfBFsIpFPEn3vFxJAItRkNMlkBtCe7th/RtytBQnJ0wE5csIPoGeUDLq+eM
	yG/nR2bcenuSsTAWJ65fmyErZeyXvUPNSxUfYB1QgdJvGjgU9jPA3WEm6qQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j7121vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 09:17:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso2960547c88.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 02:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796631; x=1792401431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0JuEQDaDLEoWHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=;
        b=VY4uDjJWCDYdW5tC1PtswNuiYQoU7zE2+8M+ShRUn/YOK9QG7AZc65mKXwduNsWMsz
         YujGjyUSWiTH6uYwawBoRhyGzG2RLoGJgNi1a57+XlqKIiQVHRiqZIJA/21Hkh7xQmoF
         VrXewaVydu3hDnsBvQHp6dkIQWlaBK2VIiheGYVHEPm/4kBYyYNmCtaE9ch29nRjqUnz
         zlzBuFy+89+9efz6LmOJNXjiV1ZpvftVO25Gk0Zf2wqfnWbsBCnT1QWiOFB8JCcbwIN6
         2Wpdlt7clYdHyDRkSWimKW96ClqRXP1qkrB1yLZJmVP77bHFV6PDsdo490Kowy8kiecM
         xDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796631; x=1792401431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0JuEQDaDLEoWHQDIjRKLQvacsm/SmjN77wxLJvd2r0w=;
        b=w16Cn+tb3PbQxqQWNIsCoUTXq4mODYTAjz8EGMgyDk/Q5ybHm731WrF0G0hYOdhzMO
         bNpYD/+JwVVAl4z/EDVbKlnvyJ7k1dlaBVZZ8VcNezeSJjOc0gdxRSy9gyHOaRTmU558
         aG5mFlxaCJf8RlnDuMkBE2pgCMoUvtWsOAbdWCYooskzg4g3k1kcq6gYmR9U1Rj7+tM+
         TDBZzyUZ1slZ/JeBERfQiHBPobrLcesz9EkOK7INZRGM2sgbuuKHXT+MKeqwPN6hYrlb
         mbXp3fx3cUgJHZE/nH83Xg9t/FeZy6iiyYUirr0vHfyPJfmYp19JyiIHvMkQMmMB7IV+
         5EDA==
X-Forwarded-Encrypted: i=1; AKwUvBxycUIxYj0xDIUGNUvZlm7S/kwRFX71LygkyHb6c2sFcTLZaf+8/MzYMx+zFvLvFluGxfRhlU1L9Q+t@vger.kernel.org
X-Gm-Message-State: AFq9FYLo3+nw18qLK6Gh/yyZE8eZ8RVNjWvdR9Nr6CRyGj2Z3ZAWmmRf
	MJH9TW8pXUWD6nimE//x5vneCBkDm8jRqD9kUTJkdmlUGIGy21hy3eJ0z8QKfjrjFUsk9fi/cjA
	vb1wzW8X0EIHCxQoIP2+wxyT6hDFl4X62mv2AWCZdaIbA6sRWUjw2q6HXBCdas6tQ
X-Gm-Gg: AYBFou2CR1gboBIIXYAl4We6WbMgRsJqH/S0REOqkp5Qiqh+sOiXJ15s4TPxv9qJEOw
	cKbg/WnmiYT+cdgwxke6oJIpHKpMLyesnMYYx1Bdr1yc+/8Ei97GWCMJXIXEdbx/wrnDXVn/5sL
	JIlvh68H0t6Z3O/fdpYSP6Pn0agUvTyFsY4xabhlpyAvb90pm7V6+3C3mFOTeJL3jhLgS2FWvZU
	+K2++rV3GoHWP7NAUxSmXWqoYc0GwXV1GlDoRwOC9QEVKs26U6yOXUt3dH/JznbMM/x/ynXso8I
	O0++exSleKlLLKmLI30EF2RaDq/wjfJmvk0Sjhmtsr53lKcYRkE13XzDq5fzOxJHySkdeWbDySr
	vg56OrA6/+oKSUoa5XbOOZNdfPDK+
X-Received: by 2002:a05:7022:b054:20b0:144:f47b:58b0 with SMTP id a92af1059eb24-16a62228bc3mr14448263c88.47.1791796631159;
        Mon, 12 Oct 2026 02:17:11 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:20b0:144:f47b:58b0 with SMTP id a92af1059eb24-16a62228bc3mr14448242c88.47.1791796630577;
        Mon, 12 Oct 2026 02:17:10 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:09 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
Date: Mon, 12 Oct 2026 14:46:57 +0530
Message-ID: <20261012091658.635441-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwJ/VxS2msH1Y
 tD7b55R+5W0M0lbuAS3WGH7wZfX2cwfyavzmR3Jp3yLUoeE9+JU+4jEW++yKquFBRjextr1Ggh8
 B7+Eu2C6QmWFk22R6jPZ6J/CFSBeAxs=
X-Proofpoint-GUID: 1kdCxO8UszZ0Cvq0veYNbBap_gDGMItO
X-Proofpoint-ORIG-GUID: 1kdCxO8UszZ0Cvq0veYNbBap_gDGMItO
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acca598 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=mE-VGU7V_AwKJsAmMTEA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX0GYAGBk4kZ9w
 hxaxYfy2Uu2Mzu446wlYxaj4EkfYVClYTuGWD0Sr/KR4YsUG5mdl4HXRjEbNlq7u/rqbjRf/2NM
 y3ohy0rbevbhd+XoLZGgof6kzNUF7wnSDBxC9p3EQOFe+6Gx3L1hh52VECgkx6MoZSHA7tMzLZK
 /wOpFUvtdTdQcS3zABjasJ92m05Fd8+Ws3JlzTPqFqTl2QuVnv03oWXv6qICrJQ2IU4BmdT5IdY
 3hvS8/VlnJQQFlptN5PL8tuJIB9BV4e/YRMYQljhKxQirAQLXt7orSiFKNDAylSGoGenyOhPbLa
 hy8oidiWl8Rq1z1u+ZJNewtZ8kxOKYOrqURuPa/RYzsUauI+duY2eDMcnbGwFbdwm9Wk4umy9fb
 SPiim82+QR6sRS+MywoJ/s8+VeSQB31t9THSHydkEH0H1ughTQgHTObcyxRAdJK4eHpgb3mWyHA
 l2JBZIsBqbk17WiOwVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

From: Akash Kumar <akakum@qti.qualcomm.com>

Extend the binding to cover the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers, which share the same I2C-controlled interface
as the cypd4226. Also add pinctrl and wakeup-source properties, and
relax reg/interrupts constraints that only applied to cypd4226.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../bindings/usb/cypress,cypd4226.yaml        | 90 +++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index 0620d82508c1..d923ef82ecfa 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -4,18 +4,25 @@
 $id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Cypress cypd4226 Type-C Controller
+title: Cypress cypd4226/cypd6129/cypd6229 Type-C Controller
 
 maintainers:
   - Wayne Chang <waynec@nvidia.com>
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
 
 description:
-  The Cypress cypd4226 is a dual Type-C controller that is controlled
-  via an I2C interface.
+  The Cypress cypd4226 is a dual Type-C controller, and the cypd6129 and
+  cypd6229 are dual Type-C PD controllers. All are controlled via an I2C
+  interface.
 
 properties:
   compatible:
-    const: cypress,cypd4226
+    oneOf:
+      - const: cypress,cypd4226
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
 
   '#address-cells':
     const: 1
@@ -24,11 +31,10 @@ properties:
     const: 0
 
   reg:
-    const: 0x08
+    maxItems: 1
 
   interrupts:
-    items:
-      - description: cypd4226 host interrupt
+    maxItems: 1
 
   firmware-name:
     enum:
@@ -40,6 +46,19 @@ properties:
       - "nvidia,gpu" for the NVIDIA RTX product series
       - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
 
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+  wakeup-source:
+    description: enable IRQ remote wakeup, see power/wakeup-source.txt
+    type: boolean
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -57,6 +76,24 @@ anyOf:
   - required:
       - connector@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cypress,cypd4226
+    then:
+      properties:
+        reg:
+          const: 0x08
+        pinctrl-0: false
+        pinctrl-1: false
+        pinctrl-names: false
+        wakeup-source: false
+    else:
+      properties:
+        firmware-name: false
+
 additionalProperties: false
 
 examples:
@@ -91,3 +128,42 @@ examples:
         };
       };
     };
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@40 {
+            compatible = "cypress,cypd6129";
+            reg = <0x40>;
+            interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-0 = <&usb0_intr_state>;
+            pinctrl-names = "default";
+            wakeup-source;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C";
+                data-role = "dual";
+                power-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_role_switch0>;
+                        };
+                    };
+                };
+            };
+        };
+    };
-- 
2.43.0

