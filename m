Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205652;
	b=t34dl5nAH8Aclk3eKAWByET7JgpaE0Uckb+CqqLU0U005T6Z3Tf3a6JesmiTtXyI5Ig9
	 1obCY63/7ct8bGC8UNLZ+gengVXthCS00DzPLZaDIjU5A94eo2d9GBn9WaOhIPFLhFJ7G
	 3jf/q5+qRj80WzwG0NYXJVnkH11zpZu60Bdpv1lClrdXuwD96s5CHXniMEKsPanq4fJnB
	 mG9ktf3EHg2N7UxAqEBOVuN93MAnzWfG/MTDRlPR6Bm2rbd0D3CxB0g2kc31afGlYZZ4o
	 bfRQdmv7kQRyHX1py+HOFuAcUULVa99S86ca6v/Wz/flze+y+aAOjcmyyZVjG660VBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
	b=J8b/cp9uq7dMKceeOS97U8gAMNxRi57f2dqHp5+aZLTDGvAkA9Pc3BG6GZNVJX1GbJtX
	 C2d/kK+O8Of40B/6SCeDthCeyY8a5FKRVXB3NFSnOfPpLq77Eo4+s/zxN+3AkrN0dW6S4
	 b3Mteoa5j+iMp6TmW+cEnJGujKjoqEYudkoqKRwbtGPMh9uIfYVOlQbBFkHgWsBe9tZFZ
	 WrjM3gzYLroH3WA6Gbkw8FDti3dciOcXcs8K/5hoSL+X9y2pMrq8NwsR0AHDeZ6J6NShS
	 bv1IuMFpud0a6fnZK6CkUz206RgzjnzrsLwFzUsPrlljdxqSDmaUUPfuA8hyYSxevtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZdk3bvi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoqHfO4Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92978606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 06:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92978606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SZdk3bvi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QoqHfO4Z
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AAmn2540203
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 06:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=; b=SZdk3bviUCE91hQG
	+Q1HYTnvnlwwCEt/zwKp3UmDMpzO3QHu20DCO4NdfxNR6Q4mVG2gjiK8YlObLA7y
	o39QtnGz/gigA8qJcgklEq0JDSk+FI2EEYXVoR1tVUy7NHPgoTVehOChqKsqsVMt
	CdzddI0gckpCtZTuSEEhE8idFmg/zueKSA6+TrPOjSnhhNuT2qwjah0qgBb7lPx3
	70qSIkvcBS7iSLg8JMJ216BGgOtgQr8UaCSp1GXbiKtu0rKcAsHc1LZvuDMDq756
	Qs2v/NbFB+wCVAz88edZSSicMnjzGag9yJtGzw47G60Mn4i1JnpxVgE5CwRZRMQx
	J2AxGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6myx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 06:27:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37390b2989bso1983380eec.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794205649; x=1794810449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
        b=QoqHfO4ZkCcnGLsHWv41+PSnCL44wqaug3l1Dl4w8jGqBKUcg0G6rj/jfWrroerYw7
         2dRcvGnPcKragbD82ubAPgU2NuDvgYxC6m4IOIgvpFTSYWW0IGQf2fS5f8IRwwKzvGFr
         NiYH2+yz/YsPYeByLRDcs7D++SBSnY5A2F1KVaxHm/dsr5YvbClfaNptIoBliNOvB5NL
         WfkbdQaAbLLIrCBfTGRZA9ZrKrAeKF0MajWG9UhBfI3h0VN85RNpXEK3Mf7KVOT/BL3X
         n6o6LVIKvJD8oK5gH5KCGOK8yagHU/eefIddZn1hYrfWyuVZv5HAGBWDN4pUmaKca4w9
         ecnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205649; x=1794810449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lJO8yrpw3BUbzBS4kl1WsJ8PY4vORMCggNcE5/sowc=;
        b=f0Ats8W44oyAYu3A/EGEHnPeLWr4LdaCgO+j9tuMWp/RDk71T/r6tey9tdMVhvhWYx
         Z6rdIIyNi1vk1pL24hgJOzcCV2xLVA2D7uXeZ6ck6w/TtLEkQXAXNrzqUxZkWMGDJDCZ
         ZsAnEWjH+mGklEFW/z1ZMeiJT6A52VmOWVe+dusQZUf2Hs6SstLZYs+fLh0l1G6auwc8
         one3cDlN/7v6EiLHoGCyncM1a5TcUQTGrAPCJ2C1WwEdOtd82++kq0l3PvbsgFwmpIuS
         8w5L7jrlqaPjjpoXNRnejKKRfOnV1nuEvC9iPCGOV+RgmLrn/1UuF6S6bYxsz1qp1wuH
         89fQ==
X-Forwarded-Encrypted: i=1; AL+hErGSZhVoJNWgCdgcN/l4MinvgUX+GQ5l8n8GpR8gBG3Rafd6JwcGg936lE08rohtOWKBhLKO/Gel99C+@vger.kernel.org
X-Gm-Message-State: APuU4Z8NvN3urQbOfXipZ602djWI/MnSbh7xQ+bU9CPgkXnDjyEsuTYM
	N5D11GmGeUD0cqnpRRFa1CqYjl6XNYkaIPS8zirCONJ1nn+lTvKCU8AKAcd2ZinhZesHLcAksX2
	QNgSeOv3rSrTSJrplCXQl8RxobZH44g5Z94dTzUjh4IER2j4xvE+M4M2SB9lJ6Bck
X-Gm-Gg: AYBFou0i1/IYPWK+SalDKUcAU82G0+JcKpNZQEqd9elADONEEH96tNRWPHIeUauj3u4
	njVk6A6+8FuXb73X21SeQt68ZQa15xL+LO9GhnJTdTPjCbgwjpLZSXdtycdMnSOZKZaF3OtoQVV
	MIdbe9D6jIlywDWlXaRsmgqBCUfOC5KBa5qhGuK5H/lwCEtMtxZ0nxij9NL7RY8EjAG/ipbB+zc
	0dAy+ZIERimUZSkZIZxGI9hzpeX/46Xo+j8fF9PdtML/iFxVPVO2MnxnCRjg9Fd95LvAfmwGLsi
	NpFBi/r+ph0MOiIphNadqluM2sdH5QXTrmSWJowhngBgLs3u/m9gx7pmsE+iptyYtbyje2PeqT9
	p2YnRst0bCIOlYKbQfacwZIYzecFekOr6uEDxn3Hh65h2YcrM1aulY+oTXewIgbAf5/XEgr9UDl
	I/zElMHGE=
X-Received: by 2002:a05:7301:dd82:b0:35d:d671:933a with SMTP id 5a478bee46e88-3725dd59d8dmr5276183eec.15.1794205649262;
        Sun, 08 Nov 2026 22:27:29 -0800 (PST)
X-Received: by 2002:a05:7301:dd82:b0:35d:d671:933a with SMTP id 5a478bee46e88-3725dd59d8dmr5276136eec.15.1794205648626;
        Sun, 08 Nov 2026 22:27:28 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm15812458eec.19.2026.11.08.22.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:27:28 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:57:14 +0530
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
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
Message-Id: <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
In-Reply-To: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jayant Shekhar <jshekhar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794205638; l=2780;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=6A0PN/ZwhHfEEa/gLa1HSpBnzXndrJU0BtXt+eizvwQ=;
 b=fMXgzr8oSYD/JYtzoIIVvi3Mgn8Phaki7FN3OZeVHeGFDWA2gbXZc/75A9DHViEOdc+wsQEdL
 mrW7HBveoklAt0DgLrAkzJbsNgZs3pJPqYp7YWAJ+yoYIaQ6ZeDB1xr
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX7mW1bsx0LIde
 8OJIOAj278vdquP9KrNMJYgVl+gmk79AqqoWQNdZd4ZlAxF0ImgbapYDLBZFPJ1mmdfDpPmbMsb
 BGQypb/OuSuMZjk1AaVC82d4dtdupNPrOwnK8kITzWh+AtLcQRgd+Lczeezb1leIY42yBfqKNQX
 wEA2O3I6ZJCUTZjUs093CJXGojhJaHyyJ/e6oqtGxTuYKoDeun0jaTL/v6dcts+lhStR1te3gAB
 udiWX+MsbEM+qVJwz6PLM75Jgrzu7tN6p0C7NVAHNlUT1Twf6ZlcXIIv/Sc7qwtHime8yHKFYpl
 Z7FU7V2I4J7YdztSVf/TFvx4JAYoVP0aTGqcI41rurrzo4tK7IW3cznC3SnwFiWJ3vC6NK4tKZM
 JQM/JuQQFx53pzPixp/FyNlqHZxNi8JOWB32bHpmIlrS4I9JvCHhXETjOxBBa1N9nGv6vVVcyiL
 KmvkdTeAMDVInGmUoLA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af167d2 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=4LWvrIubDFmFlJ2n6vYA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNSBTYWx0ZWRfX9r/JE9y6c9wM
 rpmTjvzf6FU2aQVy3EtFueEulqpiU5uN5nuL8u7Wo847ivaGnxra9VsyVLSSBvolxA3cC7Qe5Fn
 dKoiQR8TysSJybal2/KgSfLQ8+OcVn8=
X-Proofpoint-ORIG-GUID: YmD203jRdTkZ_OG1SgsDZrgtySPM5la-
X-Proofpoint-GUID: YmD203jRdTkZ_OG1SgsDZrgtySPM5la-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090025

Document the Novatek NT37802 AMOLED DSI command-mode panel.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
index 1b38c1d0af68..be318cc84d52 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -4,26 +4,30 @@
 $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Novatek NT37801 AMOLED DSI Panel
+title: Novatek NT37801 and NT37802 AMOLED DSI Panels
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
-  Naming is inconclusive and different sources claim this is either Novatek
-  NT37801 or NT37810 AMOLED DSI Panel.
+  Naming is inconclusive and different sources claim the NT37801 panel is
+  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
+  DSI interface and regulator supplies, and additionally requires EXVDD.
 
 allOf:
   - $ref: panel-common.yaml#
 
 properties:
   compatible:
-    const: novatek,nt37801
+    enum:
+      - novatek,nt37801
+      - novatek,nt37802
 
   reg:
     maxItems: 1
     description: DSI virtual channel
 
+  exvdd-supply: true
   vci-supply: true
   vdd-supply: true
   vddio-supply: true
@@ -41,6 +45,18 @@ required:
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: novatek,nt37802
+then:
+  required:
+    - exvdd-supply
+else:
+  properties:
+    exvdd-supply: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
@@ -59,6 +75,31 @@ examples:
 
             reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
 
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "novatek,nt37802";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p0>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+            exvdd-supply = <&display_panel_vdd>;
+
+            reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
             port {
                 endpoint {
                     remote-endpoint = <&dsi0_out>;

-- 
2.43.0

