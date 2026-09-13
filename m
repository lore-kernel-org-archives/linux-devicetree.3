Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A183EB815
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302809; cv=none; b=mWr018yA5H8cgFzlWd+vQTRbkIBp2R3kyNQy/Nv8244gmYTStJgWdsknZnLJ1N0qnz+Vkmlxhlg655n/IpFyXz6AU2pe19BcdpfXc0gnX3p/emZ5XRH5nQV/8cz8W2XVDb5NO2oYJ24cFoCPpMHDvz92bdx4MaJZ4qECqs0n8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302809; c=relaxed/simple;
	bh=I+E/O9s5n2yESeW++6dwadVuhwOsVzwTznjrZtzXSJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BGyg08IPapd/FHvUXdLvFhqG2ZqnC43UXy20vREDJwYjvQtoqxAE3+8iAZ9d9dZSip9z7W66kFPuTnM84VFH2zpE4oMSt0pTUAWRRd0xAB4OONl3VOMUbeR2PaI7sApLaXRX0t7QnWaaw7BanafeoPsnHIPY5Sig0SQViU8p0Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVVBade8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHs0eQCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVVBade8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHs0eQCq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUdnD1469562
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/d
	MeLayogE=; b=SVVBade8rxLppbo1Ks98mM+xoXfjAtHv5CpFFlArSqW0NjbX71P
	6aTGXyaZsEMaoQShDPYZ+xI62W7g16A84R/6Q+o5RkWQWPBZoQKyX1vrtokjU0jF
	J/Gnls/UmWrlY2CmivUqBwBWT3dcz3PXRedESOqdhkclKz4IyMwHZsOOs7zM5e86
	r8J/tA6ISg3X2PH4Pt/9QMZGU65GqPr6EII3JQYyY+XhHfyX6a/T8TFEv80sjiOu
	cDv9SzK+QMBKBOQ2lV16eJyqbFNPBUJvXwDFtu20ejiE3y1D6dHIiZ712rjE1u7k
	lhHPMXwf46jPZiK8YGK/0ZYkbzPaU7IDolg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c375y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:33:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so60997685a.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302806; x=1789907606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/dMeLayogE=;
        b=JHs0eQCq4143wnMZ5t6LvuGS0JWZjlHygu+LDdg//OAj+jV/nWzmKPM35jwtFr8pk0
         Hq+zYWuRm/EakzEPLesDiXebVftG08N8eVcxmF9vy5GnBLp7dxDgyzZwno6myYfBYqoz
         Joe92s6DO4EfbOMJoYA1ZDolZu66z4yjaiTqs36wnnzoClJ0GIp33IIB+CwYSCa3wXy4
         R3PdEWOCUY97KLjF6IPnJn8IXP9SkiiZoAfKM0SalArOg72cCs5XK/uSYx1jF6eJwYLQ
         BcKL/GQXlxN6TfuneU76H23jjT4+042gnZfKOKEv0DvLHQ89uE9xEVRtwoIT80vWk5zp
         qRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302806; x=1789907606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baoczqhIZrjz0uVdn8S3iNYTU/V5HV21e/dMeLayogE=;
        b=Vcok3+ZdKXTLnC5f3eeNoQ1QFXDtHJNjTpl9XWnTfIvYtKeSyZZlmOJPlpdRq4xsFe
         hpbjWHzBAPTG93iTsxybtzQXqmV1grgbnPK/iYIPX1JwY/GBL6/aHVjVeFLxI/iarxxK
         wZ7tKr/2FKNM/eSNOVrLIlJXo5z89GE4LFFCi6lTQWcLIJT517dHRgF0DOKgT5qpv5p1
         foKX/H/O0Y/7nM7mSe7dySVaI53pO3U9agl8qIYdXKfw59oeiF1uKdXA6miTtHBU2hy5
         7ztdTbz0tNAF5Gd+nAmEWMFvaQzVNNbvtsiZ0y9CGKaCozaop+wsijDQtc46Uw+G3pbD
         9BMw==
X-Forwarded-Encrypted: i=1; AKwUvBw9Y+oPde4/WdqavCQO/GPOAkwoXN7n0YtRJ2dv2MqVop/9m+yGhgZhw21rDP0j0KvWxXEUAt8Ds2lR@vger.kernel.org
X-Gm-Message-State: AFuF++k3m1oX8UdAy0Q+nKEguXTu5iKUd1DW+3hYhHXKz8UWYZt9FuBw
	VkBouYhyIDrs4IcfZY7RebPSrcLeaIv34NxDofiXjpj/zJ5WxDuOWpvvcw0z0DTXTexEEu7Fn5y
	+y1pWW770cHqTKsy+lnymshd+y1QHvhR1FgNgsT2JzD+/UENS4eMI9uIxgBLmAtMC
X-Gm-Gg: AYBFou3A7LSHYPapiR20l9pAXwbLreUmA4Cn+w3HbcUaQtB1OSn9e54qUaDKM1XtRdi
	6qJPuGdkd4ipfxOEY7sZbnwqovmgBfiabcmBBKGEgpP+97HgomqTcUJm1itaKj9N7PVPAm1dUN0
	wfKPZY4ya/N5xvzJnovjlL6XB/SsSzuO0G3eLP0G8NOc1CgdwPmU6LKpfKehwuNZiU2evzRF5Mg
	6tiMw7C2MfHno9gwxbHhLd5u8Y4g9VtaHJWbImHlhbdZZk70iZSNtCy4V1oOs+BKrjKWZWc/rsK
	jzDDZ0hwzFrilz+MrM8UqOX+dHIvb0oD3CoZrZDjLuGQihIFi+HpQsaP6UjQjLW7eHNc9ml4SI6
	mORsiQU3tDr27r7k=
X-Received: by 2002:a05:620a:2544:b0:914:afc1:c66d with SMTP id af79cd13be357-939ea104decmr1658086785a.11.1789302801056;
        Sun, 13 Sep 2026 05:33:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2544:b0:914:afc1:c66d with SMTP id af79cd13be357-939ea104decmr1658051785a.11.1789302795835;
        Sun, 13 Sep 2026 05:33:15 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm352484885e9.1.2026.09.13.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Mattijs Korpershoek <mkorpershoek@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Artur Rojek <contact@artur-rojek.eu>, Frank Li <Frank.Li@nxp.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: input: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:11 +0200
Message-ID: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6934; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=I+E/O9s5n2yESeW++6dwadVuhwOsVzwTznjrZtzXSJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppgGbOSr/eJIqpD2Ve0Fac3V3uxuaoogWqn4Z
 8kMdHKbihCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaYBgAKCRDBN2bmhouD
 1xg4D/9TyB0+poLY2P/4Dih94oXcs98iTr9WlRkUNjInZ+dbLhkQJtAZScBdNvwkEAqJPDoL2Rl
 TxYyWXUs02i+ebKWjyrblVAt2u4HqREQGKeMrLr5nMLRludOHJ/RoxwdTh8kQU8kAdqGvTwqg4b
 6aTSTx8ys9BGsvHW5dPJoBWpZDqTtf0Bu09QR1Z0J33BfSO0UheWlRA8Hcjpim54uHh+TwNEJsO
 6uTpCkOEo4Qh0od7P9KM/9zrYB57fwJw+j0tUvzDNtXBq217S8pimR57aRnT3R1/IKjNJMwsTE7
 xPWyWPnV18jaRmO4WeHvJVeKHwyezVh9HUIwMr9FJiLtsp/PWYXXVO+lL7GSeXF0yCOnJ2r6hyS
 yfS/VmyrG+apmE/A5bq9Ll9CqWhyZaBF5hNWd2tWOk+rXUN0ztCzPaYqiPuzybW+J6ug9j0QaHt
 UFde5c/dCp0hHtHOtxQ71+yWGybMnmrO/Oh8G1v9/2s9RtYyCeic0C9xKmsZ7kjthwQ4om3axoX
 69cTZaetMiejQbj0ogzWJoccBx0WC+CLKJeqdIqHQ3VPoF3qx+h7QNGN1uOcPQRToR3qZ3CN1SS
 BXn+ImwgsGjwNvKigUM7bMYwhSEp4stZ3Xxzs1g9EuPdYedCVQZbMUZBIOepPukB0dHr4yiX7lq 0Guw4fs1o2qYM1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eanwzhd_5LabJlFpkDulPnHVUjlNoj78
X-Proofpoint-GUID: eanwzhd_5LabJlFpkDulPnHVUjlNoj78
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa69816 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nrvTzeEnne52kZqV4q0A:9 a=xWRXsgGyZKNAB1QD:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXwKkxLtr47YGs
 rcSuWdaocqbwSrdjE7+DUwpliDNejcQFj2nMhQlGgzth2lyvDJTvkUcmdvtrjjdAabrprrOIQyj
 /TTJeid+eubLiE1W8QHO3619YlyU8YzjR6rhDnVZgy/YHbwV7Sl/8fucAhBSblhFS3FMKO10ZAg
 qD0AyIyvWptMQeL4GMM98+a1fac0QcpNcqQ9IFbMYAlB1Mjg8YFve0SVVtqptuAuB54YpqzXERJ
 6ghYYxtEcxJr0AdHaQW/DahEVq9hOdSKrshum6iWHokTz/58aZXhVU8ij0zuggKelBapXPfi9oM
 PBiQULiiS7CquIhhu6oFyPFdsTPWxK5wPie64PuUF0dR+AF7mGsMJF7SkpvaqaibOqDHvqDtBpb
 xfo18LCzjBg+u8d1vt9M3h+/ZIVNfKYLqUlJI0miiEtUoQcEFJZExRlO/iAWmJThweRs6Bcbt57
 TDXQtPGNUItQjm9CM+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX/M3E5/Bi20or
 +wLKn+wBddu39LaTWJD4pOVAr9os9mciPV4lXi1907H2iRiHVQjarZ9QlI7V7sMegQKCK1i2XJt
 lhdCS7NOGRZmIkJqCddzHXYOxYReZug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/input/adc-joystick.yaml          | 20 +++++++++----------
 .../devicetree/bindings/input/cypress-sf.yaml | 14 ++++++-------
 .../input/mediatek,mt6779-keypad.yaml         | 10 +++++-----
 .../bindings/input/microchip,cap11xx.yaml     | 14 ++++++-------
 .../input/touchscreen/eeti,exc3000.yaml       | 16 +++++++--------
 .../input/touchscreen/ti,tsc2007.yaml         | 12 +++++------
 6 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
index 6c244d66f8ce..ac0ca5aa8212 100644
--- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
+++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
@@ -111,17 +111,17 @@ examples:
       #size-cells = <0>;
 
       axis@0 {
-              reg = <0>;
-              linux,code = <ABS_X>;
-              abs-range = <3300 0>;
-              abs-fuzz = <4>;
-              abs-flat = <200>;
+        reg = <0>;
+        linux,code = <ABS_X>;
+        abs-range = <3300 0>;
+        abs-fuzz = <4>;
+        abs-flat = <200>;
       };
       axis@1 {
-              reg = <1>;
-              linux,code = <ABS_Y>;
-              abs-range = <0 3300>;
-              abs-fuzz = <4>;
-              abs-flat = <200>;
+        reg = <1>;
+        linux,code = <ABS_Y>;
+        abs-range = <0 3300>;
+        abs-fuzz = <4>;
+        abs-flat = <200>;
       };
     };
diff --git a/Documentation/devicetree/bindings/input/cypress-sf.yaml b/Documentation/devicetree/bindings/input/cypress-sf.yaml
index c0b051466272..8492ffd84bfd 100644
--- a/Documentation/devicetree/bindings/input/cypress-sf.yaml
+++ b/Documentation/devicetree/bindings/input/cypress-sf.yaml
@@ -50,12 +50,12 @@ examples:
         #size-cells = <0>;
 
         touchkey@28 {
-                compatible = "cypress,sf3155";
-                reg = <0x28>;
-                interrupt-parent = <&msmgpio>;
-                interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
-                avdd-supply = <&vreg_l6a_1p8>;
-                vdd-supply = <&vdd_3v2_tp>;
-                linux,keycodes = <KEY_BACK KEY_MENU>;
+            compatible = "cypress,sf3155";
+            reg = <0x28>;
+            interrupt-parent = <&msmgpio>;
+            interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
+            avdd-supply = <&vreg_l6a_1p8>;
+            vdd-supply = <&vdd_3v2_tp>;
+            linux,keycodes = <KEY_BACK KEY_MENU>;
         };
     };
diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index 20fa41f691ed..f10bd0f1d948 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -79,10 +79,10 @@ examples:
         #size-cells = <2>;
 
         keyboard@10010000 {
-          compatible = "mediatek,mt6779-keypad";
-          reg = <0 0x10010000 0 0x1000>;
-          interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
-          clocks = <&clk26m>;
-          clock-names = "kpd";
+            compatible = "mediatek,mt6779-keypad";
+            reg = <0 0x10010000 0 0x1000>;
+            interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+            clocks = <&clk26m>;
+            clock-names = "kpd";
         };
     };
diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
index 983f4701b51e..fa95270ac2c2 100644
--- a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
+++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
@@ -290,19 +290,19 @@ examples:
         #size-cells = <0>;
 
         led@0 {
-                label = "cap11xx:green:usr0";
-                reg = <0>;
+          label = "cap11xx:green:usr0";
+          reg = <0>;
         };
 
         led@1 {
-                label = "cap11xx:green:usr1";
-                reg = <1>;
+          label = "cap11xx:green:usr1";
+          reg = <1>;
         };
 
         led@2 {
-                label = "cap11xx:green:alive";
-                reg = <2>;
-                linux,default-trigger = "heartbeat";
+          label = "cap11xx:green:alive";
+          reg = <2>;
+          linux,default-trigger = "heartbeat";
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 930c70104b3f..00bd4062ebd7 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -82,13 +82,13 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         touchscreen@2a {
-                compatible = "eeti,exc3000";
-                reg = <0x2a>;
-                interrupt-parent = <&gpio1>;
-                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-                touchscreen-size-x = <4096>;
-                touchscreen-size-y = <4096>;
-                touchscreen-inverted-x;
-                touchscreen-swapped-x-y;
+            compatible = "eeti,exc3000";
+            reg = <0x2a>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+            touchscreen-size-x = <4096>;
+            touchscreen-size-y = <4096>;
+            touchscreen-inverted-x;
+            touchscreen-swapped-x-y;
         };
     };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
index d9cb53e86512..5ef38d24d6a9 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2007.yaml
@@ -70,11 +70,11 @@ examples:
         #size-cells = <0>;
 
         touch@49 {
-           compatible = "ti,tsc2007";
-           reg = <0x49>;
-           interrupt-parent = <&gpio4>;
-           interrupts = <0x0 0x8>;
-           gpios = <&gpio4 0 0>;
-           ti,x-plate-ohms = <180>;
+            compatible = "ti,tsc2007";
+            reg = <0x49>;
+            interrupt-parent = <&gpio4>;
+            interrupts = <0x0 0x8>;
+            gpios = <&gpio4 0 0>;
+            ti,x-plate-ohms = <180>;
         };
     };
-- 
2.53.0

