Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5BB48EC77
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053579; cv=none; b=Z9wqvL/MWjNS6HJWOtilMiCJmUrM8eJEgus6of5SnQBqAk0I/i8Um/01QGJPHfacZE4aTA6NAp+OKIffKcnLxsjaj/aZMpcCZ8p1YXS/P7l3xRJVvpLJ32lyfkLIZX3w67vnvOzVjlTamv128qdhdqesNM615ohUCWOexqoTvmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053579; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwQQhg3eZgHYPxh3mZN6nmbGNznbDMK984bZz+jy8ZRaFkbkUY+jYPCfG7KGxrUqXeZjtCp+qHrOyochdwwSWwPHDX7Udbl+tKnLC4Ae6IkQLqDGDwCrve1r0db9vUcsu8QlHqG6CNliwo6tXHDdYddc9IM3jB8NhfPoI3qZam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNXCkV87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUhe6oFI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNXCkV87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUhe6oFI"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F8aWeE841950
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=PNXCkV87b8V9vDl/
	WrcQkt2SMWTpKA4duTGUDYX/HcebcOmAmoe5SEA7648Bzb340yuIqOvVDoSHzozh
	y6Uc7UCWzdbEFR77Jf988//jQBU2Ogtiw6Ac1VFY1M4FNn/8iOsSTw3G+kuTKR5T
	IRLtmIyem6WhitMfR3TUvhKhAwTowX6LRYkB5mLsc8Bl1RBmmq83lUU9p8S537T4
	0414gf808jSMUQg/sWDC5I2fDuruxONmjydCaa8BxhoSz7ec/vP3+OGrTq9U5Z71
	sxFlrkXSzACZ5TgBc4hi8HCd7OpvQFLNda5Y2jR8iskUM07TtI3os3N7ApbUFk5r
	gsPFdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wu1yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:39:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso326345785a.0
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053575; x=1792658375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=BUhe6oFI01TZQUk4+bLTJIufFiv83KQTAMg+lDXmaRK+HAevynixg0ZTARumZfTtv1
         QcUCygC40cWwTRbBHAvu8a2IiNazTYKEPA3hHTxne2Pbdr1xl0k9bHGr41SiraPeQI6y
         tdVr8K3B23CWNFS8Nt73vovALogCHvEhZx/T/oyS7DtUqiTq0QRXeOOgv9gl319X2nxk
         /sS8clkoP5W2a1o81+nF0WLoVHYlsWovmImpPwv+Z5JYhl71R1vcdQ4+jNBMoJIKsm/y
         mRI27Q9RcBJiAfvpunW2FfhfvJRh1/+ZWrMYH6g15cjAMPKK/E6uHsZXSLQxcVVXVFcX
         9Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053575; x=1792658375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=JuThNJ/7OBV4YuoMD9mQjs2SmCThLlp0E9WF/TF0SicKe0Wba0xcz7AlZRYPkNS2Kn
         zPAZjtslJsMpOu091BmXbu7jfsM/FzUrWoWpjksGPSMO8uVPDprqT6QlDbDtGIWl97dK
         LB3ays1kWa6V9Hf03bqiV0V8GsUuQ4QypFcTsKYvqp+MbMzoCYg0EgJA68hTiJoqkhHT
         EcUM4RoCCJjqxQQLyvEZlrolTgFdT3b43lt0RwtcnbNq1ff641AcuGZ2CgTc4qEdoFmW
         FANco6mSlMTL2/vGRCQtIkKlQf3Rj9MSW/h5Z2Ulsx0EHaNqI4LCCDRQfUVgp4oL6KdR
         z1ww==
X-Forwarded-Encrypted: i=1; AKwUvByAwfSCc1E5dHuyISU2pGnAEdRO0pJTe+WiN7tU789ELUtvnfYTbfxhmlSsyHyKZ8b4iL2Qy9LBaFyq@vger.kernel.org
X-Gm-Message-State: AFq9FYLTyOmYuLGlFdoclkKqXIbRHREiiQUiFhozWYnovyVrvv7y9HJ5
	6XDX2rlQNp7jDx0IjxBbLsh+E+IqGmEmyZZLWl09TWjw7Sc7TzQbRtT99tJK5OTuKz01mYdcBuM
	nDZg8cIcvozhGaYw7P5LaYmqqn0cH+glttCpwhOKF/Pcmcv75V6aLi4XOprzMqKLL
X-Gm-Gg: AYBFou2N4lJC1DOT7l/TjGT819LxYMqw3p7eh3Q/wyosL1m1ksJCT4ooac+ZaX6M3ps
	aUCKHL43tdcSyJWaqGUSRAnsc+UDuwRdpz2Fc5Sf/d+eHMxwhtW1FgHz3rzvdty7rzlFGnpy9/f
	BBTkwEN8j2HQHFaGo55+d3Xx2pkdyw1rL/DMzrv8fGxPHqO1q3CAms23QItmK3ZAnUN3goZf0eM
	OXYxEVa6N3sAfMcbTqynytMEnoqWG/bA8iTyGzB6LqjEEfZdHbZ6TtDLyv1OQN6f0qmmvo2NWTL
	cNotEGS0pMpApiI2Xk1M4/Mh8siQnorfbFBooXLY8jHM3xBI7XgDqbFk4qJBUAcgETgb1XG+V3q
	1UCkxPR1Q99wdfu3q8ZLlG7qsAhJy88m0blB45+plHq9sGqf6+LopGGTPtAstLdDuaxsZc0BVmf
	QVD5t1iN2P4yRK
X-Received: by 2002:a05:620a:6845:b0:93e:69da:a670 with SMTP id af79cd13be357-93eb9619adbmr2871610285a.20.1792053575502;
        Thu, 15 Oct 2026 01:39:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6845:b0:93e:69da:a670 with SMTP id af79cd13be357-93eb9619adbmr2871607485a.20.1792053574988;
        Thu, 15 Oct 2026 01:39:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:39:08 +0300
Subject: [PATCH v4 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v4-1-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JE9EO7FC4gbOCYABFKGkdF6EAPQMLKZk2U6A
 rKNKqcA2QOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRPQAKCRCLPIo+Aiko
 1bSrB/96k4zdq5RJ2xrN2ces8Sb1LrtiMozuwikBzqcee5xBxtdq0hSh3sIr2oeuDKlCDdsCzOh
 NJo1rMTjyHIwkvm/hqi6Umc0p8r6aYjP1uWUWar9vWuBO9VCtGSv8e/jhtmcQwiQpgxo8nkAJDc
 KgmQKgZPxJa+ClbeXFHSRAih1cvezCmfAg2oUuYMCuNss1MEw+p5wsbhSq0nt4nhiOqbZHXilUt
 7bNdFBVixN5OFpNh52EAYRtXqVLuFqxqtTeO9f0Y7at7cA1QAe1hb/ootFJe7FJuQuJSsVXfpxq
 KRMjhnlauAl1AM9AzmHPHSImCIR5COmpwkPP4kWz62dLaxXd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX+k77nyw7H3Zo
 T3dFvMNIas2fJri/yBq0oFnM944ZLUROykKy3u5wJ+bjhk+TcvcSXu/C3NW/qxrpDTApQO1P104
 HH1bbMwpk5vZjHgqKIGhhM6gxXZ+cSY=
X-Proofpoint-ORIG-GUID: 6cnc75laASdIlGWPtA95bdx5GFtfOFyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX+KGHlwxe/aUx
 basYXuMrqrXFCAqnZ+LpMC87mUEEag2HTdUsJijcqkd6PFMPjX/X2amupbSBanT4NhEAxPzfyxC
 /DsgLocLv8hJ+zIUQxVwOTvAIS7Hf1d/dpDxRUJNKCisxwF9JUiizPLLbaJ1Iy3BiaJ5bfCo2Vo
 05YJZBDZGiCnH+9UYLAbg/St3nWfJb1oVGvOPpKGzHOWtg3VydqNt+2tFkTg8fhShk29Hd2r2v4
 Mz3RSVhpw5t1PHeMp+rKUSW7Publ7uNWZDXbrAUZWbau/1VzxHS07xko/SukyYCPToIqFxBLB39
 r2zvTK99msGFIGRZo4+1iO1tNspl9ShoyBs1eoO8Q1NTuQ2SBtfdyIAV9TR+8Y9Ck0TCAxLN5nk
 HxNPx1EMj4BXjGYSEfTnRxf49Z0lw67psPwXHfeQLHg+UV5ir82/ePUY9BTcwekFu0H6knjqfqN
 Kh2MDn2sIXh/rV1Yqtg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad09148 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 6cnc75laASdIlGWPtA95bdx5GFtfOFyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
new file mode 100644
index 000000000000..1cc63a6adc7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,wqhd60-nt36850.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly WQHD panel based on the Novatek NT36850
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Truly 5.7" 1440x2560 60 Hz LCD panel driven by the Novatek NT36850
+  controller. It is a command mode panel using two DSI links and it is found
+  on the display cards for Qualcomm hardware development kits.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: truly,wqhd60-nt36850
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  avdd-supply:
+    description: positive bias supply
+
+  avee-supply:
+    description: negative bias supply
+
+  ports:
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - avdd-supply
+  - avee-supply
+  - ports
+
+unevaluatedProperties: false
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
+            compatible = "truly,wqhd60-nt36850";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l14a_1p8>;
+            avdd-supply = <&lcdb_ldo>;
+            avee-supply = <&lcdb_ncp>;
+
+            backlight = <&wled>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.47.3

