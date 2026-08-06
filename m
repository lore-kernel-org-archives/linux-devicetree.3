Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A182AD3C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785988234; cv=none; b=HAYBCTxYhz/T9TEuMlfFgJX/KV4gFIDr6pUwNUOfFfNO88/lBfXVQvt8GiYUrJZuSram7GdJq17Dy43hWOqlKyDUOCfcjIDuWMN2/Hk5hcXp3F7BbuBOkZjDn2S3Tn2ZCazi5n2Rir4kfgemFFVV3/Yn4qyRt/RUo7hghQZi7go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785988234; c=relaxed/simple;
	bh=c4E2tnVTjiSMvj4149fxPvJZ7wH5JajUkoantzHx2AE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jH5rTAXUqw7rTaGtBfblzKf54cbF2mSTJSWaG482JJTyBUE98JE9CjymbowRqAHdnc10sZhJD4pf7D7bV+xB5tTGVwTs9CDlNARM1FJDwuOedbjlggTbD2yA04vCqK7vWoe6ZA/z4U6MzcnG+c8Ko3fjrAM0ylKRZnRqxAXGtnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXr13Dls; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVwaTls9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXr13Dls";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVwaTls9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NbUoM226052
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 03:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=; b=cXr13Dlsy+w8ssoe
	v5AxNyVzNDFWGCb2v7dmOMzxHJwNdaMmYmja5qcdvyz3huLFBuaivQlZRkoUF71z
	+u1c5fzroAL7YNpVXvtSW7VSmM7j/F8ICNbw+y129QNtcJXr6xLtd/FSwYkEB4jz
	DsQ+6ov5gnSvQ8w2FeD49NuUUgw0YoOdj1hSGnK7HHhse+MsVUMAyYPzlZIMAHrx
	2JnoUmHHPJjeeyq/DmrTpd+JMtC9teQVyckAhZ6n+AxBIprjk1S7xQ59veyctB2E
	wccS09bKb9emWOOVFaHMKe29zrCXUubX0RPxtJfOzvhoSit1rItPg0Y+8oxEamQL
	KvqNVg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv2r6487v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 03:50:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so18089046d6.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 20:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785988231; x=1786593031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=;
        b=GVwaTls9hNi1o0dup0bR+sWF+5fPqyYoxj6VrZkDP8lGFGAXpr0QKMhPxrwLH+Xndl
         9RiS5wYOsIQYaf+85UlLTcBf2l3FJS6VxIvNhotTP3s8p74HxEY9n5UJ1HhsEwpBVyxA
         U7vfp3+8qMHrxM6aBf50dJ7fLz/b8tnOLGuyT+E7514jGvwnTbnMIbc1DR/iOe8YPDvu
         n4emuxTG/u+xxYJRf5Ez32Amydtz5vatYprXnFBU7YFHl2ch2igWdYW4GB8RJGt6VHBP
         8VrOTo2BhhzHlN0oCGcFL/ey4kG+4ICfvvW/0EhVIrS8XgRIpXqbDX4Z28Nbjq7PJvkV
         ZopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785988231; x=1786593031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xrjNTbkAdJ4wFIRw31jDeeYpxYPcjkaSLFO1o/BGZKU=;
        b=a66T2pTA38NBdWsuKilwhBKTttv6MkTqKyWBP/50fCZGKokEVY5zT8mjcsvoj5zNNT
         ypzltsa59dPxfbnkZJokcosdMF0uZcYTvwmm2PxgK8i8TxmyuW3175cuetUe1iD04ikP
         SRUAfJwt9OTgHYdBDpf5eWC3eOVfmhLbcPWC2uv3uMLRANPNz2KF8czBtM19jw2F3dtq
         3VWkSzspASpaKRemDXHZtRGXffsnBclFOlGU6MfEKPqFFaNatU7tSc3x2KW6tqxaANyk
         /KkKr7FOBE6HJtbwdhp4UYL1MDW2Jl5njs04ibgTD/928SIjohUYVE8DY8Zg7VvrJ7Ul
         7ItA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz/Ty8+0ByX/ivSMa3NQDQ8GWTp3xRXjXG69bODwS4ffaCNTrDNdM1wPMGrgKGwr+rFqsTkfS5l3Uh@vger.kernel.org
X-Gm-Message-State: AOJu0YzFPtuk0U0E3adpUIudPv93oTCFMo0x3AKtr9RbUESmbeoRw7mN
	0bqau/j8jDR+b3LGiKHiPgT6n+dC1Q0Afox5ExBQo+biTk7/4h83qjIZb0imAlVl3r9thGQv8Ip
	RDhp6XozrxJwal9ftWebWk8OW6H4kYZBV8HX5hchBIMapKQHnHqy91BsM2PqlUK5Y1JPjahsyke
	8=
X-Gm-Gg: AR+sD10Dikblgz6zMXErc5Lv5CJTvkud2hre/EcOs7gPXqGWRCKFIVjnWKut4C2DadS
	j1LBYrnURI2NC3Ttactx5KeIidk75pOOty8MICH5d85OhIoWtnriS81b9PqWlPMYNnMbPVp/CmC
	CkAazmrBpO/E5lob58KIRfcxd62WimA48dBPBLcTZBW42k1VINzyqwwK5lm/O9hcQvP5FR9zZwg
	hDnXZYe4V8itaEFnOFzTyUJTVtzhaJF7ylAHko22DbaI8YRmli1WhjRr97GSa+MAvVjnSyAL1Dy
	7BE9qs8GoJMHtH1gToxO4mkTMCJ3joH93xvuJByiidmSZpRBOhX4wfp8F2DMHEcXxSl2pT1Hge2
	Zo/SfSDsfikDEWfrgcJX+e0JPn/lTuTVayn2NzRGDj9gfxCBFbeqE9815tfhvSvYFbq5j
X-Received: by 2002:ad4:5aed:0:b0:907:879e:8df1 with SMTP id 6a1803df08f44-9088126984cmr131321976d6.21.1785988231316;
        Wed, 05 Aug 2026 20:50:31 -0700 (PDT)
X-Received: by 2002:ad4:5aed:0:b0:907:879e:8df1 with SMTP id 6a1803df08f44-9088126984cmr131321776d6.21.1785988230830;
        Wed, 05 Aug 2026 20:50:30 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffbccc9sm41945806d6.14.2026.08.05.20.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 20:50:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 11:50:02 +0800
Subject: [PATCH v3 1/2] dt-bindings: media: i2c: Add Samsung S5KJN5 image
 sensor
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-sk5jn5-v3-1-0b3ac1eadf8a@oss.qualcomm.com>
References: <20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com>
In-Reply-To: <20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785988221; l=4575;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=c4E2tnVTjiSMvj4149fxPvJZ7wH5JajUkoantzHx2AE=;
 b=IKDX+VrCKGsspqYdNVMnbH6cAzEXK+wSbLFT8Mei91oAx2Zf06Bljav88vUnrkNdmjtAFuHwS
 ZHatYtyIiPHAHxwyT/VRDwgEKsga7d6cEv7VIA5NT+Orgm1n3BnCjpx
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=WrIb99fv c=1 sm=1 tr=0 ts=6a740488 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8
 a=6J6j7_AOAAAA:8 a=xYdTjhl2YIFMzPZYPIkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=sptkURWiP4Gy88Gu7hUp:22 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=DoBsnWhqfNmTxX1QClym:22
X-Proofpoint-GUID: gTx0T2iT8asgFu0hCM5iPvIKOGevxHu8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAyNSBTYWx0ZWRfX8tYGWnxcy4GN
 Y/3U4RET8JvosLyTQtP3PnWVB4N0qJThKYQbEJdq0Y6OcEQ5iqhGqlH94MCG2tpiU+vRGY2MazS
 J0TayGlpGTFnsdgT+yuiruMN1hA9k0Q=
X-Proofpoint-ORIG-GUID: gTx0T2iT8asgFu0hCM5iPvIKOGevxHu8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAyNSBTYWx0ZWRfX7e0SR8SYmx0O
 A2QshDKRQQ23thutc6+9l3Wgw1aRQzwJxqMGMIYixoMNR//c6llIHyBOilOpRTk7gJi1T45keq/
 +piTFUA/Tw4BlHnMvAFmCk6SjAqWacEB5bMG39ey0KkfFU99HVGegIhavE4tKh/D8VSXS5EZ1A/
 GbSDPrNzf4UbvpIXNYvCs/HAQnIeWffbjlJsyPBEutaF+bMzgJZe1d3kI66LIy5v7ptfuMksXCy
 9ck/U0zwuUgGY/maBT3Sw5+Wv0zzo21pkTiN+vImGh8Wq9388EJDBAT0fX506bHJHjznsMRPjzT
 M1KqA47OqA4axeV3mxtwfhIKeltJr/jHsrUlDifhf5G7PgNaXjy10ctNU2xU89N08kwDpBhu3bl
 t4TWcGqAhJtk60CewKY/wkRVEDsqb4jBFmCIv229q7rL5wt7LFe/Riw2P0zxzK/ycRT4swyBjZI
 poU1He5oZQCvU+m0S6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060025

Add device tree bindings for the Samsung S5KJN5, a 50 MP 10-bit RAW
MIPI CSI-2 image sensor controlled over CCI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/i2c/samsung,s5kjn5.yaml         | 117 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..fedb274679cd125483961fee7ac922f2c5efa755
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5kjn5.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5KJN5 Image Sensor
+
+description:
+  Samsung S5KJN5 is a 50MP 10-bit RAW MIPI CSI-2 image sensor.
+  The sensor is controlled over I2C. The full resolution pixel array is
+  8192x6144, data output format is RAW10 transferred over 4-lane MIPI
+  D-PHY interface.
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5kjn5
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: MCLK/XVCLK input clock.
+    maxItems: 1
+
+  reset-gpios:
+    description: Active low GPIO connected to RESET pad of the sensor.
+    maxItems: 1
+
+  vddio-supply:
+    description:
+      1.8 volt I/O voltage supply (VDD18). Required for both 1.8 and 1.2 volt
+      I/O operation.
+
+  vddd-supply:
+    description: Digital core voltage supply, 1.0 volts.
+
+  vddm-supply:
+    description: MIPI voltage supply, 1.0 volts.
+
+  vdda-supply:
+    description: Analogue voltage supply, 2.2 volts.
+
+  vddio1p2-supply:
+    description:
+      1.2 volt I/O voltage supply (VDDIO12). Required only for 1.2 volt I/O
+      operation.
+
+  afvdd-supply:
+    description: Autofocus actuator voltage supply, 2.8-3.0 volts.
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/gpio/gpio.h>
+
+      i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          camera@10 {
+              compatible = "samsung,s5kjn5";
+              reg = <0x10>;
+              clocks = <&camera_mclk 0>;
+              assigned-clocks = <&camera_mclk 0>;
+              assigned-clock-rates = <19200000>;
+              reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+              vddio-supply = <&vreg_1p8>;
+              vddd-supply = <&vreg_1p0>;
+              vddm-supply = <&vreg_1p0>;
+              vdda-supply = <&vreg_2p2>;
+              vddio1p2-supply = <&vreg_1p2>;
+              afvdd-supply = <&vreg_2p8>;
+
+              port {
+                  endpoint {
+                      link-frequencies = /bits/ 64 <1248000000>;
+                      data-lanes = <1 2 3 4>;
+                      remote-endpoint = <&mipi_csi2_ep>;
+                  };
+              };
+          };
+      };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 3af0fe95a92fc21c60819b892142380fad2ebd4e..244c7ed5872aa0972a7b055d7e0b19d530820a08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24190,6 +24190,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn1.yaml
 F:	drivers/media/i2c/s5kjn1.c
 
+SAMSUNG S5KJN5 CAMERA DRIVER
+M:	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/samsung,s5kjn5.yaml
+
 SAMSUNG S5P Security SubSystem (SSS) DRIVER
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Vladimir Zapolskiy <vz@mleia.com>

-- 
2.34.1

