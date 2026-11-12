Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478556;
	b=aE4R+l7r8zxnxwq6B7ie8gHK2Hf4jW1mshMXsYYxJZ70J2EFJGdnBHSL6SzNL1IP22tk
	 WTmBHfeN3dVvjRYDAXZs5ScevZ0GQYjlOcEN6kjoLmdhqJyKMyv7AE5jSxbW4y7FZKDjy
	 QLA7qcqPYSK8WB3lxREQ/+S0rs3b3Kl1vJx4bnPJ/VVmFiAfguMmsAzfjIGwb4rLxd3GT
	 3KYRuVRUyxENizUoHmDHzSQ2M4OirEtB8LebWeJQ0A8zNfpyx/cTp7BidDwXx5HJMWWsE
	 li3YPWgNWEfIvi3aZZwcBRG0529Uv/T5vE8eAtJixuJpHjzS+NRN0BW/7ZE7RB6+LEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
	b=V18hKi2kMkrRfIygV1J2cyAaK/kngVlU3q5SGy/41V8SujwsjAp2XeaOdstNLC/Pme2Z
	 xwwmwIfEkn17GWJxVMH5fg1uIqXMs9Y0TRvZqeSoyCLy3EzwNGOMTUkZkyBz4/aYHbW5b
	 iAYsQpQcPMuRaTmfGCsWrX2emCdpTbSo/6JfPmrJnsTX6gxuCU8gKbfKufVhB0n+/h2bI
	 SL8zpZbzyJevj4QjuTOtVCyeTllw1d3lDn66daFLFWgT6L45s1RlO02V6LFY9PSkYB/cV
	 QNbHsEge6EOq4EOEGUCR+plKBhiFoZB2mMqQYmIaTc8mF+mBWH9gi17UVpBkRPK1mwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACEF606A330
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACEF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fzmqt7oK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STW2KqLq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iq2L125791
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=; b=Fzmqt7oKnOcfFg2u
	ewzqXgKKfY296D6RBHlr7RPnrOCjgyuFJnbMJqhtiEJQWIJBTquuOKWIYGdBcwot
	INFto1MfBzgi19DZZPHb0y0z9C1zYCmBUx70VgrUgS7cFxaKyDLdeH1pfFedbjSf
	i9dg2DBH1hCX2MTlbZef7q8nvqOO70v4NGKtKGIZe76ZSwVpvfYoOciD9jL2Duts
	3iCpK2mkIi76LYki8HF9r9jbPqHjuwI3K0/Bg3hqLCa5J3aiOP1BeDVOhkV6ptQh
	G7pE7dwjRtZ/+RgsqHyBvuVAJM6MdQ+0ns20RyFcDT2ZyRYrQb5hlkuB6q0BsZYo
	D4zh8g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a08j9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 10:15:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso2455829a12.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 02:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794478554; x=1795083354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=STW2KqLqOztywiCCS3HM/5CkZC1TphJA0S6mo/W5O1wXA20QU/BxB3lrfVfcclmodt
         b9/z5lIThM3gLmeh0f5dFhfhy9zt0obpjdzJKttabHHblefbLLjEnuEnbiPxUKRE0JYT
         WSHHf1RB/wZIGwxHmEdARrdQhoO4aRv7K1HJN39FECqjdhNIW7jRBg63xWHXNCjjMrzU
         EhkvI5DLh4iinHEEBsKgGmk1D8+7tGQTv2XSYNwqZdQ9XhP4J283Tdihdf45akeCROAl
         4UEsstIXrHGA5xPw7ekcv21eM6akJCiSc2gDKKB1iHkezdDnT7llYgyinqah35iWO9lq
         gtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478554; x=1795083354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y+7ViZgck0V8RkyIHFto0Znqk/6YAtzFgiUxh5asDVE=;
        b=1XurPlIkN/3GMSZqUQgo6N0eXXVxojw5VN7ee+q8hV/Maiyay/f8rwiSoh0zEoAdi0
         vzcqd0ea/1KCT4uLVl5mwn90pgPrNKtD4CkQs7PMXf82orBRwZuk8GmGA7G0RDmt0MB6
         xR8d8UY++6pMifKEPKxUeCrRrjpK3YlCyynvbrpSElUeqZJPV6Rxl51CovCap6pDe6Ja
         g9rpe3aLdkDYcBfrfbhRI+jM+8KuPfBxzL+4VazMlXCBqLzrss0BYfXYE9Z6kHajoe9n
         NdTo3U0Qbhqwf2Q6//yexI7c78CaV4X/QcQRelBnLIbbPVW29pMnrUIBM5xITTtIkDjd
         WeUA==
X-Forwarded-Encrypted: i=1; AL+hErH0fqq9WUqs3lV/HySVPlV+4WB+mcuEzJJz3p1q/AK58uGJ+hcIMCqFSsibqnuQJ3S9SE3a2REvlGwe@vger.kernel.org
X-Gm-Message-State: APuU4Z90ySwQLWuEAozPHIYsrC+E77LiX2jtYzWwCVJg4EEoFNQ4QQtk
	nDGGFee5eCGrlhcjaJYCL+sHLLPnt6AqXhnySRFcOIWYHqzu2Ifp97vhoaz1uqyOEtXOGy4sY6d
	ClBFvuhF6TOvDX3zK29Z2/URKQQ67LgYjb4PxXyCjQqadArldSVGGQynC8TPr1lMm
X-Gm-Gg: AYBFou1TUs0pUN1zjUKgEfD3Oj9BayCGVBS9759ZTBtDGVWTbXDvzX/zv08Yp22aFLC
	A01lBsml43iUPrJ3FUVqaaqYVT/Mg5mzK38SJ2oecT86jDJuZ/3q7MoCk3gGc4XCWyV320/FMNx
	LnZSu3c97ktZi0IIvox7PaEaAf9JQNucVxYOBXNkgAsNVfp/AH65NgKVeNNyUzyhDDPxEOKfI3M
	fofGRqYexVjr+pr5SX1nztx46n7w4+ixV5ba9NE+d1uuAh5uHdmX+15Cb+EjO9x14QoKzmOGiQz
	IdiwcRX1JL1Vw0bYRzcoCwE7hDr/OhW4szafYk7W4kJPT7ed0P+G8xsl8nzVBtS375kElmUH1Oz
	nvhrZXvhATjsN6piw8+1ZGdy6PSYqEMA40Ol/QPUe9tH/jcAnyoGjAfKUU5NN6v/2tZnciaHeFo
	CC
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825425637.45.1794478553655;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
X-Received: by 2002:a05:6a20:258b:b0:3e2:b400:2b04 with SMTP id adf61e73a8af0-3f2fecdd04cmr5825386637.45.1794478553168;
        Thu, 12 Nov 2026 02:15:53 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3185872b3a.36.2026.11.12.02.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:15:52 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:45:34 +0530
Subject: [PATCH 1/4] dt-bindings: display: bridge: Add Parade PS195
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
Message-Id: <20261112-mahua-hdmi-v1-1-b463d7b1dd7e@oss.qualcomm.com>
References: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
In-Reply-To: <20261112-mahua-hdmi-v1-0-b463d7b1dd7e@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794478537; l=3963;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7LNEKtT4mDMRU5sAzssLKLYmcuRayyy/4HBNgkZ2SGg=;
 b=U/AdJ+o45wb9voMrU2x2MRI1ftHCAd8QA/V23fnJsMKleV0BRWd/NRWn4JvLwt39el9WdiRnd
 TVKaAHUSTjhD7TYJe6mGwPBnrsgR2x2fHIzka11OamsKRpe6gDMvKmH
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: MsX8Mm6feBFuqegz7zZfU3RNTJGFOLDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX8weDPuv3GIFG
 lRwu6WCosGLeKXrpblmdMqNNpRkq0sI9pEQKsRdehW3wEO1HRsILx0cCFgLPrQwtmS87kc/xWp8
 MSk9xCOe53Qpn30QV6HbRwZeX8Nu/Im42miggWN29QwgDeAu9KYP942nBS2KMH0aOYrmK9heg7n
 zNgrRyZCxb4e3pkgNNKPnma0CFAK5XWxeA+jVBw2+9KMy0lcL70aciSNv3xVqnLnN4sCEAPkHuE
 cnzPl2hYi6V3IOznjo9w5AWbv7fuGGxkKHb9UKNgZLhzzvlA4Egg4nqysCcI96nseCPEQ4TaVkT
 pMDjBIRaKbewTJ7P1xUfghEZ5yVHmJQIcyoKmuKOsG4acgPP7WKiCh11u3vBRRKJ8B+tdncfb5x
 trye0dUvzi61TocaE9b1xGLXH/Kb690Rt0ksQgv1fBQAMV0XZZzScIFMc2vcl8+eeJWySIj8Rsx
 dsnfHEEWsf4B0iOkB5w==
X-Proofpoint-ORIG-GUID: MsX8Mm6feBFuqegz7zZfU3RNTJGFOLDm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0MCBTYWx0ZWRfX4SVLSUxHynQU
 bOD/DPUAaExRDXrtuVHzDzJJpkNgfFKdWDAZo+Kklug1Gfj1YaU2Y4UZi4LB1tQ7iFrTqfFhCnl
 1e0b9sEOqAYFfRVLISxGcTjyzo6sePY=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af591da cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=xQKGsFAfKFO7eTD4QCIA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120040

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 98 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..089191570ef0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/parade,ps195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS195 DisplayPort to HDMI protocol converter
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  The PS195 converts DisplayPort input to HDMI output. Firmware loaded from
+  an external SPI flash handles link training, EDID access and hotplug
+  detection. This binding describes operation without host control of
+  the device registers. The optional I2C control port is not required for
+  display operation. Reset may be controlled by a GPIO or released by a
+  board resistor-capacitor network.
+
+properties:
+  compatible:
+    const: parade,ps195
+
+  vdd09-supply:
+    description: 0.95 V core and analog supply.
+
+  vdd12-supply:
+    description: 1.2 V I/O supply.
+
+  vdd33-supply:
+    description: 3.3 V supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESETB input.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: DisplayPort input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: HDMI output.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - vdd09-supply
+  - vdd12-supply
+  - vdd33-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    hdmi-bridge {
+        compatible = "parade,ps195";
+
+        vdd09-supply = <&vreg_hdmi_0p95>;
+        vdd12-supply = <&vreg_hdmi_1p2>;
+        vdd33-supply = <&vreg_hdmi_3p3>;
+
+        reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                bridge_in: endpoint {
+                    remote-endpoint = <&dp_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                bridge_out: endpoint {
+                    remote-endpoint = <&hdmi_connector_in>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..9e1db88ec1c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 
+DRM DRIVER FOR PARADE PS195 BRIDGE CHIP
+M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
 F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml

-- 
2.34.1

