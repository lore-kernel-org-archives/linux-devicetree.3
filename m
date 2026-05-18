Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF83EC2FD;
	Mon, 18 May 2026 11:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102320; cv=none; b=pPizwdLSOwKsnVoTTAujGRWGBHkp8cKY/huRtYedXENHhSs4yaenSbd+F3BxtqQe/EQMEiJC0vpjot8seQuRSTAx/ta0vJEwJiel3rURVJzoLHfdYQ7ah/81n0vzRvaWyvlXttji8G3efDtZ8OZZNZ+v1kjMqPMYa3puQYnlgNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102320; c=relaxed/simple;
	bh=D0gOSLweKw5oS3Y5ijkYO6YwyEh0iHWt1wtvyJLCtuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBE4eIfXfFvPXzPMIsPz5PBiwDc5MkO9ezGjpD4hi5aJtdX7uwi61zPMx5CHPqIhY+d3ZsQajs0JEP7ndqNzRN5m2gfN+uF3E0TupPD/RicIGLgiEgdCZgV/Bt1JPLHCgBjc/tf+4O+Hsa6Cp1KVfhqf8kFFRLzcVAtOcrUJso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwdnYYxE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwdnYYxE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7dqHo2891865;
	Mon, 18 May 2026 11:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bgQE0Op0XHhKZyY7w+AzfDOIImhNlhM/Z0IM04s6IBk=; b=XwdnYYxEsPjjVqNR
	VawrRiuENLvX4so//GWy5j2Ozs8C/IIxe5MMPqGanwqo8KPrcOcgddq8qGeoLNiw
	rjilkPJTbHByoQKyV5002QgBKKCVyXK9LNyIGk6NxJgAY7OXlD//McyBtqEbLftQ
	zRVb1zR1HFQG03Q0zAKJeQunP/XZko9rx2sjRbc1mm1ayIOQ6MNLjT8uzriEpHaw
	CIITtcbwGTassrSsSYmuA5SeGckMsooI3eDZvBfbqB96TM7zhhPEPcZe761wOn0I
	zv/aJYDE7NTafcGIL/VDRzZWnMv0mGIaKgCitVJ1hwn7ZPd44DHp77wFEaQ88hUs
	1oIYQA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk18v5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64IB52gY032184;
	Mon, 18 May 2026 11:05:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716d13un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:02 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64IB51jM032155;
	Mon, 18 May 2026 11:05:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-arpisain-hyd.qualcomm.com [10.147.248.17])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64IB51gR032143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 11:05:01 +0000 (GMT)
Received: from hu-arpisain-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id 8A2EB618;
	Mon, 18 May 2026 16:35:00 +0530 (+0530)
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
Date: Mon, 18 May 2026 16:34:12 +0530
Subject: [PATCH 1/2] dt-bindings: display: panel: add Ilitek ILI7807S panel
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-ili7807s-panel-v1-1-d7b048163b1c@oss.qualcomm.com>
References: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
In-Reply-To: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ayushi Makhija <ayushi.makhija@oss.qualcomm.com>,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779102300; l=3425;
 i=arpit.saini@oss.qualcomm.com; s=20260518; h=from:subject:message-id;
 bh=D0gOSLweKw5oS3Y5ijkYO6YwyEh0iHWt1wtvyJLCtuI=;
 b=JUEfZ41LV6CCW4SXSuCp1p+xlpT0DAQEoh/q/fghFZEeb+wHWLmjtlZeRuan8Cj1uz689F+UL
 GSfheecMaGEARk3Kg/0qywhyvLtB+RYMO2eUFrOxykMkSkaLiqgUMLk
X-Developer-Key: i=arpit.saini@oss.qualcomm.com; a=ed25519;
 pk=OGOh7FGwrnkILHNlcTTABbBMQxxo319duzbTg0YPDAc=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: bIkLobfGR_w9px3r2EY7_oPP-5jGZU2y
X-Proofpoint-ORIG-GUID: bIkLobfGR_w9px3r2EY7_oPP-5jGZU2y
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0af261 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rkP1aWTRSjUe3YeTyuAA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX+sOwBWI+KLeI
 F7T/9R/dR45rINQ0nIwri6YDosH7Lgy2HzYKarssCcbnwJ91xgFE34f8oycHNdsLPLhlRbIDyUU
 NDWZ4MRmJEHMCZh/CuAeNWDzcJadWrXsJVtaqt6tj591ImegRbpAkO5ftjIZl+1olLhFhIIVXpK
 YPfJIJAM7YKFZ/jCRzx7qlc40SGqWJtLvsYTzvSPk6mFsaDjA3koNQuOhi4A4P/UdF/zOWgcX4n
 7AfhBdZw5wvTLOrvBLMJOYM4fTGsQgvdL877HdAZ+IHAcRbBWr0zyIBnJaaEvtNA8+z9yry9Ct9
 yb7JGe0U+N/qt0VZmw/WBf0SXRXiuB90ZbhoL9T4I3xbiLOsZseKk6o/wUtBSwJVUwC/nifWg5g
 kDEHDJ3wwyqn1a2gPOgnAlVpE9qDhLi8xMYd+EXSqa0TL7+JEv8h9Wp+rioJCzMBzVciUF4SwNj
 Lg52uUoUa2jLbAtwMWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180106

ILI7807S is a DSI display controller used to drive MIPI-DSI panels.
The DLC DLC0697 1080x1920 LCD panel is based on this controller.

The panel requires a reset GPIO, backlight enable GPIO, I/O voltage
supply (vddi), positive LCD bias supply (avdd) and negative LCD bias
supply (avee). The panel operates in video burst mode with four data
lanes using RGB888 pixel format.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 .../bindings/display/panel/ilitek,ili7807s.yaml    | 80 ++++++++++++++++++++++
 MAINTAINERS                                        |  7 ++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
new file mode 100644
index 000000000000..93c511d03c00
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili7807s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI7807S-based DSI panels
+
+maintainers:
+  - Arpit Saini <arpit.saini@oss.qualcomm.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - dlc,dlc0697
+      - const: ilitek,ili7807s
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  reset-gpios: true
+
+  backlight-en-gpios:
+    description: Backlight enable GPIO (active high)
+
+  vddi-supply:
+    description: I/O voltage supply (1.8V)
+
+  avdd-supply:
+    description: Positive LCD bias supply (AVDD), typically +5.5V
+      (range 4.5V to 6.3V)
+
+  avee-supply:
+    description: Negative LCD bias supply (AVEE), typically -5.5V
+      (range -6.3V to -4.5V)
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddi-supply
+  - avdd-supply
+  - avee-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "dlc,dlc0697", "ilitek,ili7807s";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+            backlight-en-gpios = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+
+            vddi-supply = <&pm4125_l15>;
+            avdd-supply = <&avdd>;
+            avee-supply = <&avee>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 26060e51c067..529aed669401 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7941,6 +7941,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c
 
+DRM DRIVER FOR ILITEK ILI7807S DSI PANEL
+M:	Arpit Saini <arpit.saini@oss.qualcomm.com>
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+F:	drivers/gpu/drm/panel/panel-ilitek-ili7807s.c
+
 DRM DRIVER FOR EBBG FT8719 PANEL
 M:	Joel Selvaraj <jo@jsfamily.in>
 S:	Maintained

-- 
2.34.1

