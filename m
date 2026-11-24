Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510398;
	b=oPq/bocAHnQUoHKGq+1+oxQvF2ZQ0yKWmd176VG2/lsWZgdqH72HDPgb11GIQDjZ9/5N
	 t4hUZ1S3sbAfIAzb/3/I64QROYXtXQrDu7y+WpxI4FjR5BiJTTN6tnbcIvwqlIon4Bgye
	 Ii2MjPRqcmfxutHeHiTVTy1god7SRr+y0aPhn2j4e4aLwi3rCGyGQJ4rpyoZDQQnG92lz
	 UQP8lRuSO8ltpyLuuuhBl+o7cfQvPFNOrJtwf0m+1402bniLvICNS7fCJMgKKU443wQrX
	 MJzn8VJcjQHZC59y2ja4WoTfnGm+2+GAzrhVyO5V24ocV3raLvvLg1FrFkA0RCin/3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
	b=kaE3enxumlla3x+s9h4gz/9qYEUFR35H4ZstTnrO9kdHSujU+KmfveTey5OrrnkZBIWQ
	 vYd7ZriKUfZIifqd5nCDctTa7TBiQYjMn2vOct2y5P2mhSpxg5VTUKVp5Zr//9RdJlF0H
	 A+mtybu6miDB8hufNOHGHjJXOTgOnoC3HhifvTvOjo10YqTfxAiUtklafQ0NuY94rHB4s
	 +ARN1PJmdJiWLw1kzntrpX+PP65sj9laC8IbxEWAuhRwcgth/pDWly4ALmpRcaVANndLb
	 p5FNigS9qDQ1h9qFBaSWwj+7hTFv5u4oebFnhDDqlw7K2hEVWUJyAGww6dcevRDl5/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XX0BvHHe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQ6Cluw2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFA606A33F
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BFA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XX0BvHHe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQ6Cluw2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO86ElW3701099
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=; b=XX0BvHHeq8wlMcSb
	CGve3uTO/o0iAKj522oUm4L9g9yf3yQAxxpqHsQlXIUO9TKRKNGZ4ij5z2VmcZFU
	nkwgktBCxaYHYXsxq84+2px7LyRLu0b3Lmgx5g6BHfain63pT6QdG4Zoy/jrbFBR
	gjoQjDvrXtk+gI1lnZJGGtxrrfWpkwwX0VzD0T8dGWvSG5hJQaMf1fh7/U9MJG88
	JX0VvsIgUqvIMQAQdPC+BItOfheNUvGS2Ab0GMO6puQh4NHNZDOmUtUmnFf/TdNx
	Q3UUdxPnJilYDOhywhbNsOAEOLIKp3sBW9lJetmzesYDCL8bR9cdbzzlmpR8IfFj
	zpNnhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky1ks9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:53:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso5312824eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510396; x=1796115196; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
        b=EQ6Cluw22IKM2/HrC0Yr4/28JVEzqrJHj4gLv+6OfQR+iwHBBv1VKNinoIlpMQ+qsG
         OK0bgCblIwIk8Zp0m7bc8sAoUE0OWP9yNXCnVe7LNjq6lECU8l0KPUx4ZAqdX6KvUwDD
         PVomME/oNd1r3JVP6XXz1RolxGxzKwWQwMLw72LH0xYuOO2LzmDqJiJCnB4ZEt7NGL5a
         VPZ+g1TvzX1y+U5xVi1kaGmNuTJe4a92oXVlWUFV+UJ6/RBS5awpTsvbIFHdrUoxQ0jf
         Z+3wrZte4SQTsdJwluWscA5vwKdvd814a2C14HUYq5cKG4T0R1Dk+aJU0sNgfjxy68wU
         PI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510396; x=1796115196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiuyQxU7otFRnJczyF4pNHyMZczqHjJ+eDDkfF8ULA0=;
        b=KxMBxm+Bk6r6mfPtyN/nfNnEcj215/kK3d7Ac1S7Sp50IIbSWOb9fKMJuf2OHyCeq4
         oqLslZoUMMuclSHxN4vdrZu/kPaHvQ/jeAFGyVn8sCgbDtgB3jk89DkiL+DiU4TwUWzp
         ZW8bMBmBxOzVgS5hF5A0mQTBWb4rws7vB15QbQiyapuWEUrMaus9k9JU51lTfhGgcjZN
         KhJ4K0zkL5uQ1zRQS288YpE5DDg4JMScV3+I3Qfi3NWMLW6UBZUcXXA+IvMxCEyVU2Z+
         9IukBZ4cRGWpUh01nsPnMVkp0Xl39ekZ2M+60lDouKocENImUCCqknE32hs1OYpOp8Ay
         tTEQ==
X-Forwarded-Encrypted: i=1; AL+hErHfmHksuMhqtGRDgX9ES48of86BfAGjajukMdeW11rd+WxIbXhcn6q4QqN8KFOw1Grv/CmK/ByyTiaA@vger.kernel.org
X-Gm-Message-State: APuU4Z/HitfKRz/fQZsOzY233jfNHDuaBcRaajH2i8xuY2qpVdQek+qi
	OZyo4QZ57Wl3KI9rU3UfArUDx6nTZdueAn5ombzb+vA/B6KGQi9eiWSKeWrmlwVDOt2SkUIl/vP
	2G7RWwF+mAmadpzD5tZQ4LzZL/RF/T6Zge2Uny+WOcEm+Yspwr1Xj3nKbRUgB4vYo
X-Gm-Gg: AZFdTZe7EWTUiqs+ikEfSZvw259AH+i47N9XLdYT6fECMo1B0PkzqjUGh2ZeIzPp77w
	wlDvEvoFNAIP29/RPc6sYLZf4nP7DRVUTMHHa1qNnEi6HZv9ZUYJOxR8X6fTWF7kQyPGG38WVZD
	82gRY/zf2pog5RbjyUoW85lgIX2l83dwtDRAewRrVMg6wuUCN9K4hEWpfqCxM4xbtg+1QCoFzvj
	BTp4dssetLc5JKuwTugWJPo+UL8OCw/rmCTY96yiioB2xtYLujWvSEDPJwKOzLoB/nh3HFEt6NN
	ki0oC/6U048vQWdAZzpA/MjIMew/iiAbLhoyObekl9f6ayYBaUWOoGiwE9NPUYXNc0xZRcCOVu+
	3pUYSdaxqybwbWhWKiFLrVuyH0/50eT3LalIhpERdTxrjcFTkft7PzKutiJOA/PdB/Iboil0HNU
	v0PA==
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr13844766c88.15.1795510395923;
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr13844739c88.15.1795510395382;
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:15 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:05 +0530
Subject: [PATCH v3 1/4] dt-bindings: usb: cypress,cypd4226: Add
 cypd6129/cypd6229 support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-1-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b05507c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8 a=Ikd4Dj_1AAAA:8
 a=XHc7JM4WsavI0pzJt2IA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: 3wxFpmXYYvW9HpSDcpg7HxEBzn5sGnO-
X-Proofpoint-ORIG-GUID: 3wxFpmXYYvW9HpSDcpg7HxEBzn5sGnO-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX8FBRWCPbqMxP
 Ib0kumot2JyGYO0T1F3w3y0aQqNWaybaiZIkg8Aj8WsEpnYndejsFPN9ztmGWbo6B0LFUSIbTGH
 twgFsvHXJ7RP9nxXARd1PzDKNclLrco=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXy2N/XNELEGRF
 MvRhexiF/59/fbI091lTyXt8F+cbllcrq29BWOjdzK68dcjWAemwJCSuXHcGinYwW2pg4dZCNrr
 9R+5tKomPUYXETUbosufV6PRlByVoYPz2MqpfWYZwjS+7PXaKflnMSoFc7uFU/Nr+3atEh3fPyG
 lJY598h/qFy/1Gf90X1eVe4F2BkhKrLH3A/bPgwlhrXd1ukQA1HBeMjT5BHtq1YkqdaAvreKiE6
 MLWs0JxDfWBxNy8WSKvziGKxnmKSTm/Db4lhbksRNtLA4R+A1N4tmJdDyOjddjXPCUuAb1Sghnc
 JKVUpyzH0k/6nlBagto/Hz6tI+0id6YDy3gC1ezwrM/kxSC4WX85WYPxVq3d5TisWrjAaa15nNs
 Mg1otRO00t3WY2RfpaJ7QtHDnjdm3OSTEM1rMnvP3KNx36bCudfhAjE4/PDi8TP4r4cztm2eo97
 6MIuA+PnMCNDdCnylbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

From: Akash Kumar <akakum@qti.qualcomm.com>

Extend the binding to cover the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers, which share the same I2C-controlled interface
as the cypd4226. Also add pinctrl and wakeup-source properties, and
relax reg/interrupts constraints that only applied to cypd4226.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 90 ++++++++++++++++++++--
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

