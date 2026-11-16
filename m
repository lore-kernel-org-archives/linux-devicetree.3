Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828892;
	b=HdAg4tLhFUt9+7I5SPlrnyA1xhfEP/VS4v+Tplai8VIkVNKS59ge8VrmRxjA4rXKUw9z
	 231u8UnJUhC42SisDZLnHOsVNeOF+FprhtwZMDTxWubWIHv7TFceKYo8O96BNgMRq1LEs
	 1UhYiZx9YSwZaQ6/tNsiVF8WHzStintNPZGRsuelSNrtiN9TZpGe52Ic7VPlNyaa4sZfN
	 HlWpQkFHz5Zm86qLt8j300O5QUKBuuFbPbdV3Fjk4RJqRK+VHih8GWz24txoxfDGNEyi9
	 N/0HHvN9X//Ir3E8ECPJ1yj4cQsfu+kIdtd9yirRbMsIY6B+IgMHSXpBLbxcfBK6tZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
	b=YPko1TXnh3VMbzcHZ1zWE2aqiykC7OvPyI160TFzfIK/U7eoa7E0CA+4xpj5IxK+nPi5
	 JBX9LM5YKeHhwSCDVDKbNeApptRlEGfJgJCz4Y1ZjBi2zZYmyHEJS4lH9iHqCNI7eQp+d
	 QmIPilPdlHhUTtnkKwK9blAoR4nDUUnA3L1U7VxoAyt1Ea/5dw9bFCRK370CBo8YQtGj2
	 xdj79o0OAUuExvqLwM73Ropgfv2QDr+fXGywa4KQZkfK/0T7oP+uCApt0V5/z3zqGo3GB
	 33xZtDvtgioFHpMuIuxoQwjuoh/4U/JYKWYJSD7r80gfDHWjcoWR35eSsp4NGa6C8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gQG/wRoO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C907606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C907606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQG/wRoO
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLSqx1016203
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=; b=Z2QX+32Y9/8Ixjps
	svM98CT7t5nw8ZiK3q6x0xO2l/iDYJE8ktbl2uCG5wSDEa0hn1SCcOup2LVclavB
	nRO4Sb1fsmByzbRybkNmer9HNSC6zHPbGT98DvohpPOkmqsObH3+9gwt5mY39PUg
	A3CimrVpsK7eq2F3Fd8T0rM1u+Y9QBzVVeOl1rkJemmGgqLyJebzqwNvUGXS8goI
	lA0dYZ+RnWjNFa9+OXi8DNyJuiHuI3ghuiM3hkuJrE2jazUtCU36z7a+aqHlAwR/
	x2sFX8a4O0GmQ0ROAlEeLquVxUnlHXcL8YElvcuHH2OygFEwJE193bXyTqLU4kOd
	kkSR5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003g89j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:34:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so4218564a91.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828890; x=1795433690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=gQG/wRoOhlna4BgUQLnLC3GW6qAdmCaxtKJ5mHeqiYMj1B2uBRmJ2SrfuKNCMHYE/W
         72mpiI0lMujz3FlA+rFzTbpM54vXltVq3yElt6eoEpXuBIm+KCPxAEXuDDJ6gQRiJ+oe
         KGB3P01asLfDqxW1PVOBhZfLWAIB1opKTmoQ7NWg6MCgoUSAMv0J9pmHrl6/GIE7Vj40
         MDTAd3y5NTA0qzH1wHp5a09MIrbrkcK+U+E32Yf8AfVQ7+DGhyY18CBQR2v1mHyeusvU
         q6YoEvYjPmif8cQEBeh9aC8t4MLudkwKF8Qr8Jlqwn2s1hghBVPx/XkNL1Gj8EIydMbS
         A/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828890; x=1795433690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=SdrshgqCC+GEZFLTsIHF+0rgH9iqYpbbTn9k+L0fc1PqsW0pXV6L9XW465ofvcJZH+
         t9ygKS6/U3y7uaEVU+CBS8CPwgzAxW0iQXkjkEJI7wVPw489NullJp988y6jgmo7rW6j
         wvDgSpBb6e6REO3T4SLtadVNKQuCI4wUF0hDkCUhaqwiFeHXomCaSLpC3i5Uqq4rlhP4
         2nRiSyU19NPLxb90dR9+F/DswrSmss7C8pEs1YSHaHIbcHm/D9aDXaWW85dSmaszoryM
         UxaI3iloyKoUjBLLnEvd1g3snT+p1fmcC3jqHygvA68pBKmOx+XDhtZ0gF2IX9Yftquh
         mDYQ==
X-Forwarded-Encrypted: i=1; AL+hErGZRCm2CCMVX3isu9vDRK5VzPFJJv4ENCWgGuwig7YPZHK0O4k/p9PIqOy1nfVZe1kHcmRry/uwmpJf@vger.kernel.org
X-Gm-Message-State: APuU4Z8n0sgRAfDIfrQAZjheGLPORw9fPwfHo7E3Ldx4U7WxK5OUFmpW
	Mv+Ese/3faXMUvEO9lqeR3sQRBfFGdOfpoXnLOw7pjNKXwwsQyVYPhSLAsakHV6bt7onEphLlat
	mla4Jb3ow25HasXQ1G9dPwQM8U5SVLLVi0AiW7Kf5UTeXoJeooCJ3Cs6Tai5iUPQU
X-Gm-Gg: AZFdTZd2QH0wt7pmZT01pXOP+Gv4Ytkddi3FKK/dNQZC6seMFVurrLXLbXLGkt8oe+u
	eVJ4hcs7xQNoIujYljY0Fl7fBJrzq14NEuNrs/U1ZEz84FbLQIHjAvkUJcvIT5qTlaTua0l6X3f
	H/K5tcpqRh9wVXH4q7ajS5iB7Cl0bZHiBQbpbgK6a969NmGpmOdu0gnxRjZOD+Nn4eaTTB6qOkb
	NjAd7VspoW/N9RW9WMAPwz0OqupGzeSRCnnp/4mq/Blg7Vbz7yAeM+oKkabv8pxIcFtzd/cL7vF
	m9HZt5bAhPqyZ0E9fUIhwpXvrSPc/go0ZPFX1tFpi0HcL9c5A5AacFA/Xwil2vnUcx56bzxoFdH
	0j4Tf+Abkl87uyYp/iNZax+j9jbeN8hglF4/0ayGrJZNSb4+GuCfmgD9dKWsOyYR9mrBMjWpEsR
	Q4
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831667a91.30.1794828889763;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831633a91.30.1794828889253;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:48 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:04 +0530
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: Add Parade PS195
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
Message-Id: <20261116-mahua-hdmi-v2-1-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
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
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=4283;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XqWVS/G6kyEGs7FM3vsOHGEHaxWN/UrO6qm6Co6aCVI=;
 b=WtBTscvQ0DovqRE3dOcQSKtm7PgukaEYc6NSnRNGQ6EeL0dXOyYpjQV5IcW+0oPs2xVZ5B56F
 oeXiTxWZuOTB1Znac4fzZm5gCusQZAZeTeJaJSrWwzttE7+xenJOj3B
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: URAr818e-jt04PXWxp7eBl0onCzMH6B5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfXwrmRi7zpR3oj
 PPxbQ9wyI6/bZC6P/MrEIGRI8rxc55uJYa6ukW714rqfJdlQsFqiORdz/5QWH3esV+EGbLxoBSx
 fs/koqzqBZubEZGaK7Z+DCEzaoSKot0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX+m7WzvRYuy9z
 Zr5lt3CWUXIYRLZxIDQOzj4AdPqln+ccdS0LR6A6vdzCDtuce2V/aL58+E9IJSz/hwgUcIsg2a1
 PFQ1rfljEeKYgkXpeiMuuWjCdOet6vlYGmpkkewnewjfwQWdxv0IzL6aBbMj/0jJ8xc8fzuQXhf
 YElRPp2oQKL3QZrwmxYNjoLni+SkzfLPMoJ81AYQfMT1hBz0GzlrIKq55rB1y436wgbo0lE6Mv1
 prDWt00gAyzl/vo1fx1/JhRzvhSRyDUB9fMEsk6P6GTOi5lhyh6uqa6DJg2KWNqGUEmWZMQY85P
 mAAe/ts4UcAeJOTfQqpjksBPmSBodLTBugDoKkl53KVrxV6w1OqHw9YygIdpt6EFFi8okIg1FpG
 /99+eFsUReoDIBo4e9Tz6GPNRyVJVHl8bTzBFVg/XRA+UwD+qQeC8HcfQ3gah5oEjaqVtHIbjQm
 y0s1WBpBlaA4lHK0+mg==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaea5b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=9e7qC0O8hlTshWeg44oA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: URAr818e-jt04PXWxp7eBl0onCzMH6B5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..b7484caf93b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,111 @@
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
+  detection. An I2C control interface provides access to the device registers.
+  Reset may be controlled by a GPIO or released by a board resistor-capacitor
+  network.
+
+properties:
+  compatible:
+    const: parade,ps195
+
+  reg:
+    description:
+      I2C address, selected by GPIO11. The address is 0x08 when GPIO11 is low
+      and 0x48 when it is high.
+    items:
+      - enum: [0x08, 0x48]
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
+  - reg
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
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-bridge@8 {
+            compatible = "parade,ps195";
+            reg = <0x08>;
+
+            vdd09-supply = <&vreg_hdmi_0p95>;
+            vdd12-supply = <&vreg_hdmi_1p2>;
+            vdd33-supply = <&vreg_hdmi_3p3>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_in: endpoint {
+                        remote-endpoint = <&dp_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
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

