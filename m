Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35B374E6D
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787237453; cv=none; b=TnaZXvM+n6ywCYQiziX6UQRqBYrjcC4aKaOr5nWr99yrA3WMnCF/uKZzz/4UL2JIinl1cjrFsNCy9cHCWOb67ZNo0y+9AclDjWlQwnJbLferwwdqeakNeM/GKfiKWGPxF3czxVefMHY1TYCsBK/OLu3zPfk4Wlfh6Qj0UudCHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787237453; c=relaxed/simple;
	bh=nnn2VvmmY04QPKvQdTFVcUFoN3Rvxlc3uGFzFkpIl3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+0UEDzVGAGGBwxLbXIhlfcVypo8UluyCHda3cAbuL7IyH3oUzXdDBHnfOEOJ/XlXU3XwAeFQIoK/NVAXDi8hImKFM2PD8Y6MTWmiF2r1qE2L+wckAM5IHPq1C5pOnK8Jy869V8n7BNs6RXvcdy/fefAhEA4b4gvRPQKLQ25YgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8w76avN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EW0FODES; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8w76avN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EW0FODES"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7gqD3234825
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=S7BAfSM3xAy
	lZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=; b=c8w76avNVE+ySgMegkHf3kJOS5a
	uDxaJn5bH0JOkd+w5pSnKg3Cdqa0GEF13tWtrCfcpH44Tb1AXUJuTsglN8PXd2v6
	Wtt+tRq55Gn2IWi+kJGBmQpaaDM9CrJ7KDnxVBE527YgTtnTz4bggfSn81bNIZuT
	4P4LoIsk7iTIpL5vLenp9eGzoCVQJttqiVUru87DUCfeKqcNbOZYqSfI8Eosh3Ji
	0scNrU1JAL+nOLAgVAm3VUMr4ce4W+7u+A0KPBQGGalHZ4AeYxODwGxnl/AyeDtR
	tdLtW1/yFWAhJm/0zuXHkqDl2TVscg4+6POeEWkT1EXGCnvL3/brRi01XiQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv9evr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:50:50 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9f6a49e69so3227914a34.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787237449; x=1787842249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7BAfSM3xAylZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=;
        b=EW0FODESl+X+nwWA3DJ2dDircqKSDqUm1nXXjvmc5AdyBED3biWNp4cpRy2CnmGT7C
         jyjubhpOUcIQkLYhmL/XAD4HReTg1HfUrGTqr6dxVfEqYpZi43CFLhPpJdj5+vR5d1Mx
         he7KFg+PwXvYvYdDwLXKwrMm0lyvbsCB9/ppp9RLX0Wa5uuZMnDlw6l2Q/9d5iCIy8Eh
         oQI6Cg11tcA9OyVZ3K2simvIAak1MPDHPt1fs+TEQh3YMVdY0/+W/ply8wBTMGiMCnpH
         SxlSJzBIoPOWpVhgION+6XsrX+PYhLdgCIDQhNsj4Q/g1pXw8oEO0RJfNhP0EX5Wero1
         xFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787237449; x=1787842249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7BAfSM3xAylZQ2ziEWr2lR6yuzSoZq5hoVHdXm5m90=;
        b=a6mz7Ffg6txUXqInfRXDneNiXJwFzRiAHtifTs6DIJseII6Q8Vrut0ILcKjhi9oRgc
         ZE+XR5GsCNkATObi/BWDpMCxDI+wJGmG8P3gifKvjxdkJZmuOdlKg+d0dIwOsJikPkJJ
         yyPWAguq3jjKJCG9IYK95QlPl5n/k0WMRLpZbKw2+Q+w8SV6jDaY7spMGIQbwae3oXJ8
         piap8XzlfIh/paj5ciZiRe8/9GaMf9IzQKiI/WFWDss3AaG6xMmMxCUNyfgc7B4jozit
         1w2zfg1m+JZilvP1/K+NKwO38txIoWGo6sMX5/+oLa79BWkAlrEbhGK9FoAO9s+8hy5W
         tnZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1iOjBq7G8YRTtyLnWbzfchDoXCd1JsztcTx3z8NXQZ9FXcvL9JcVN8o+cTDydwTQGqTN0Gv4DVaAy@vger.kernel.org
X-Gm-Message-State: AOJu0YzK2+ndcL16O03xybU7P+LzTo+4Wn4SCU2yYOa/WKphiyKFjAqx
	Ei4BD7ipjhuGubdYBTAgAK4YK0cG6SicGMfK7xhpr8pSfqK9lG3RBMUMqhHwlI/wPKThRtPxcPx
	ke4ihCAUI185o/LcJqSjLzDCYXAtx8kKYj6gzpTchYJV/FE1XIqc0FoMFMsIDhIbn
X-Gm-Gg: AR+sD11yU1dJgPmo0j+0xoziFjFOUkCUt26psQv0A23QdIoG0irF6IBQxwwvSI5opHF
	VEfEwT/1M0mT+1slXELtyWpztQHtJkjevqWOsMDWG000SoDSgttwa9IOa65ZRHk6+axjy3Cmtvz
	/TNrkrhxnkKPm+8RnkxLDzk32xuiAYLkbRD+W0GvTQGE0ptle+k6mt7+yoe2Vv4Ti4MPsonexba
	QNg2I2LN7C5tuHDDl5dwUcRvVqLpmfKbiQKCr/rw5tUc9WvbgFSwWMVFA+jB5uSrD5is5BvGqeN
	jdbjvRR7qH2xI1uyqO8nONZysT3buQsdS5d8Ilw8i1yUOkDokFjzkznIbjqha0o30fyiFmnNae/
	UlIE7UKpqsODpz3V7SNjfHi5DKPJM
X-Received: by 2002:a05:6820:4dee:b0:6ae:aa38:a0bb with SMTP id 006d021491bc7-6b13c64e72amr12538948eaf.33.1787237449319;
        Thu, 20 Aug 2026 07:50:49 -0700 (PDT)
X-Received: by 2002:a05:6820:4dee:b0:6ae:aa38:a0bb with SMTP id 006d021491bc7-6b13c64e72amr12538882eaf.33.1787237448849;
        Thu, 20 Aug 2026 07:50:48 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f440056836sm5147383a34.20.2026.08.20.07.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:50:48 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
Date: Thu, 20 Aug 2026 20:17:36 +0530
Message-ID: <20260820145036.2035641-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a87144a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=PyXS-OjWu00qIW_W-2gA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX2HX6Auy0ER9h
 KdK03xFrwxPEyttWJYfT/rwvj7LK4y+mBgds2vclX/GO30nCz8S69+N6gn6xBwGC/Ms3gin7ZQY
 AN2AzlXvNZRIWMKUsIIFKhF89OBKK+s0cOndRYFnLccaud2yvgaW23pSpoA4su8JzzmLEmJvoji
 nOaQ4qJZsqDn62oCgEFGmaMy0tsoG+QiQvEJnSpLmIVoJpCXViFSzAaiBlT7Jtv1hn8znmwo4Ei
 djxyTqcBngjmBjIUAEsqUbvdTGwBgVaOBOl5ianC1fmzz6JY8+ZGRLenJNfHEc8MstV9Rf9S0Mz
 OlA/nOvE6IRqUuQE8U+RP7Cs/0EgwOxp+dECxwd3ZejHVPCmh9Zcj9qfRjrE6giPTv2G6RFPj/8
 DUYEvuEVeJFGWazfEnzIBjmdx5yFYX0ftGSj203rBEFJj5Xi52S2zN8AYZea3xRGvxw26sFIrAf
 HxbiHiTjBCGq9r4g1LQ==
X-Proofpoint-GUID: KSOq3xKb5ROYlGqP4koMLPTAlD_nmFr0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDExMSBTYWx0ZWRfX4XkPBsWAHqx9
 lHxfKqA2Z+ohWBOynNr2M1A2wOZdeIqilV8ppTOX/LBcB3sFQHQ9mvgZqdALeZKgaFubSw6gAP7
 0p1M5ukBq/q3zCbT4GjcgER8bPSW79I=
X-Proofpoint-ORIG-GUID: KSOq3xKb5ROYlGqP4koMLPTAlD_nmFr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200111

Add the device-tree binding documentation for the Cypress cypd6129
and cypd6229 dual Type-C PD controllers. These are used on Shikra
CQM/CQS/IQS platforms to handle usb-role-switch for the USB Type-C
ports over an I2C interface, similarly to the existing cypd4226
binding.

cypd6229 is a variant of cypd6129 and is described with a
"cypress,cypd6129" fallback compatible string.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../bindings/usb/cypress,cypd6129.yaml        | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
new file mode 100644
index 000000000000..f709f82f2092
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd6129.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/cypress,cypd6129.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cypress cypd6129/cypd6229 Type-C Controller
+
+maintainers:
+  - Akash Kumar <akash.kumar@oss.qualcomm.com>
+
+description:
+  The Cypress cypd6129 and cypd6229 are dual Type-C PD controllers that are
+  controlled via an I2C interface.
+
+properties:
+  compatible:
+    oneOf:
+      - const: cypress,cypd6129
+      - items:
+          - const: cypress,cypd6229
+          - const: cypress,cypd6129
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+anyOf:
+  - required:
+      - connector@0
+  - required:
+      - connector@1
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      typec@40 {
+        compatible = "cypress,cypd6129";
+        reg = <0x40>;
+        interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+        pinctrl-0 = <&usb0_intr_state>;
+        pinctrl-names = "default";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        connector@0 {
+          compatible = "usb-c-connector";
+          reg = <0>;
+          label = "USB-C";
+          data-role = "dual";
+          power-role = "dual";
+          wakeup-source;
+          ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+              reg = <0>;
+              endpoint {
+                remote-endpoint = <&usb_role_switch0>;
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.43.0

