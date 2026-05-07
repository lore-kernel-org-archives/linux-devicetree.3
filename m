Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771A3A6B79
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778144514; cv=none; b=jpteUwCyW6zuyty0flypNvlWUpt9ym4YpR9gmumWfrvfZ8RpFOB9MsYYT/gn2+DkeqQlc9C+ZyCbntf698dLo1FF6jNufWNzKHwQfFQnBpbTU1uPNsHBjhrsrDJuOAofc0XksdvEQaPRhDka9Uw2sxoGsnJdGZA21WCNpAGe63o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778144514; c=relaxed/simple;
	bh=w48Zy9gh5QY1c+XBDez5fRMIM+TtMcaQ5hJ5uAZ3v3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZIuVEN5wutHjDIjIoar94RkOSDpI5xp3O/1Uc2rJ97155+vGi0tihsRTuZWyXMhhPtvLon/XAuA5ipmVeiTCnBRuvKntEQs7/nj4SPFeUYqo7xa7mZ5zRLftBqLk4l7wjeSTZ2pkVSmfOWzRkzdIIz7waMJxgyU/IiD/iJS5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nbONzyc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ujf/UYrf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbONzyc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ujf/UYrf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6474sjU63924172
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 09:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=; b=nbONzyc7Dl1xsX65
	raPyO7Bz2IFfjkNwR28WjPYmvQgkmo+qIxOfg/K8NEIr7YYkc6vD3Sc45qpVo9Qs
	hUylzDXmpM7Wyn7964ddUzOzQNpd2Cx+DnJkL/Udxda0rDEZBqmSpd7Ar8SeY5sa
	uvIdtiOC5y3aGkQj4WodVIVdGzvOGNxKIfGLrregX0nnmnaaGEQKlYxTOtqCg4DW
	dO2SseyCfJ+rMgyDvhON/iFeQB9WvS8oLBcg2ezuAO+rGIdsOgqN7VV82D84sPrV
	5iBeaXUSRFE1qOeHpe/mwSX7eomkP93YZqZaYTVNuihchgRQEr6jv+uSX3QMOWYl
	TErgiw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0c88abqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 09:01:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69996a2944dso1208903eaf.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778144505; x=1778749305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=;
        b=Ujf/UYrfnsVE6jKzdS/lNeRsgqiWv+uwmUXHdvkuDocCSWpQT+ug3v584UARqi7CUl
         kockesTxUBc93IOn3M7VOpOhjY+nQKzTfHWiHO15Ied30SoaQwCvUH7XVIfH4itQFPr1
         DXukEWomlwHIafIK3KSU0NwSF7uLbs003ZxjUgymZ6G2gFVoHpvM3y7BDmwdc1fJeTmC
         mJ/rvFKQiJlgCVPmy9UB0b7Qo/mkOb4HrRsPhCuCZVvL3V9SmEF6oc3V3/PlcKqEYjsS
         2Um+PDM1MaCcsjxekvf+jwQbWNHrj2Ans4cMbaSWl02fXebRiPTJ9bC3nPNoICB02RIV
         MU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778144505; x=1778749305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRa6k2yGNWTv2u39mO+7rvnN9ZODp7GRurjicrpgf9w=;
        b=ms9CDpvTP6UNOlJtXYP+/CBuYgo8y5fUUdvDC/yBXN4ClVwcSOh1zM9t9D3qrBnm6E
         SFHHY3zJW6hYztMtXvPTvlLu1zIlgyfJDnixOAcaGwPxzi12bxkavxGWJCvlgTIX0piG
         7VZsDUkX4JUoGQ1rMsc/4vbJwahxakNyJu0wz2qLNdtVqEzh06pPaPAY8SlYIi4/BuT2
         aixW5IHoVGD09k+1uSzdhvqkrh1DdO7gXkbyXo3AnTPQgDyotaQn8Qc9Ae9se+rHfGYH
         MnFPb5fLvBAvYo6dK0ZkfOMbaQeFs7bbCQRzRu9yzuMhA5dDsCWCCI4qFc9EX+JU9odM
         bkqw==
X-Forwarded-Encrypted: i=1; AFNElJ/WarO/T5DmDt6TDLdP08z4QOv014JmnXzHLnXh0HSC3FY/YY7koikJI0TMu9nfP2zJUQ8SFzTfV1zq@vger.kernel.org
X-Gm-Message-State: AOJu0YydiZsWJWwNmtvn7wezAZ8hIC9pOL4UjHpKa7daI3fFS0nnjckL
	+jYFHuF7HFfkFBJ5nVD2iE5Uq9yhQ85gITtm8bWvX2P6LCELqwKkZWgmDMCWSlIyDJ10Sd28B+R
	7D1dmfF8jtq3BZeUazeL+7sD4sMw84MymmCB7b8nSsbt8weQZYfYx57j6u0R2rORE
X-Gm-Gg: AeBDieuycGb/t68iy+6Xn27EzUSPt9P94+c7mPXti72bKpksnj6VIU+EPDeDyHfgnNv
	uG+LvQwYOg5yspXDNxwiG5qnFkDdnTIytbJ0gZb2PwEKpKafENtkeajz0M/DoNlEOqNYswmHXBb
	w/9AQ8PztYQa8KKrILdMyRFgn+vYNHoUPuPC4wcRRJrF07eCnqnJM73+9gzVfirsgj2T1vC81DJ
	4F9M9lgqCQsJZfOH9S5navxAKirjNGw3TUzDfU5KqQxq12P/370c9CWifFC9d4qngUaT1/DWDlg
	AlzxppEgRwNpWYsue9TlmH4r4MXOdxy2fGnmBCtPYocJLj9W9R3jEu1OpF3TvLoSTe4NL7xiYMu
	EaBF9NkFMMkmaA5JewtQR0eC+jTwB+cxsjaqdnllUVOycd7ZiAw7gIcMYQOVQbTE2uigpEa7mCF
	/mpI6VsGrfgPPKcifHd70q5FBMbcgkUne3Aaceo+tZ6mxi6FZDYRNtaaYE
X-Received: by 2002:a05:6820:1352:b0:696:2cb1:a019 with SMTP id 006d021491bc7-69998d0fc71mr3582167eaf.28.1778144504695;
        Thu, 07 May 2026 02:01:44 -0700 (PDT)
X-Received: by 2002:a05:6820:1352:b0:696:2cb1:a019 with SMTP id 006d021491bc7-69998d0fc71mr3582151eaf.28.1778144504236;
        Thu, 07 May 2026 02:01:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a870f96cb1sm3480516e87.22.2026.05.07.02.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:01:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 12:01:32 +0300
Subject: [PATCH v5 1/2] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-waveshare-dsi-touch-v5-1-d2ac7ccc22d4@oss.qualcomm.com>
References: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
In-Reply-To: <20260507-waveshare-dsi-touch-v5-0-d2ac7ccc22d4@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=w48Zy9gh5QY1c+XBDez5fRMIM+TtMcaQ5hJ5uAZ3v3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/FTuy7mfOfX5kl07Us/qpiAyzHwTLGyx9ydu7
 NTUppEPARqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafxU7gAKCRCLPIo+Aiko
 1fdWB/wPpnOVm0D7aCjD77DcG2BIksrTgqtu9mc4m1QefgIzAtXub3PGmjaGDderabja1f83ALp
 zo8EPN+tQ0rC+z0iODQc5GXSI9+tts3VhNMtFdsA6RD+zIy8TQhbOH+UQPKrih7HfahBpuOtaJu
 QLSuBephxSEjUKCXAKnVBk+XLwW2Z3qrr2hn0OcHcSftvkMCWOaaRnMADPaO3zOK3C+4h5QZp81
 DxAPUVe2/UnLBw5mbDUVNd1tzbOqwRCv/12pRB1/CZ6/QHVEaP8JaYAgTYdGYl4t3GXiuIAf1Yv
 fVOpqEJXCR9qr1WOCaratjm5n3XioAimdHG3GVbfk2gwfd0d
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 9qMkwCmiJVUdlb6uMsOkAFk-4t35EjzU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4OSBTYWx0ZWRfX0aWCR18nBEHw
 rLwy9LLngV6CtB2v0RjYJ7AjKgCz214m3nzO32eXq6xCEzS9nuhiKbsRjRVlEq6403psTJhDKkD
 yC0B4I6IZFv0kEwFAU6IJEZmdqgLslxXoMDFN9WEM1xfQcNJC+Bd+cSPLlplFwEaDgUowodvp8T
 XiD2nF6gcij3NVPYCSZLsZxqBhwvWArrSICz6qE7kfVQGYBdJoMuznHWrU1Zh669jno5//YAG0C
 ox3oCaRYsGq2uc2O4+YJj934qsWdGVyogl4yaMzy42fPd6YSApQWsxWTJ2wjhAEnTguxckv15vU
 C8pRhu2Tkvwqn6b6/7IJILi0qItGjdP/CFxq7UoT2DRAOvNrk60jz7jQ/5AqhdCzg/F/u+Vx19P
 uh9rc9LC0289k3vB9VqmFMhVxh1FWqp2g3c/vWI0LrhBZpHh24Xfv46YUXgbezQlgcajTP+g3ix
 OLSzAj9GlfjWcsVZYhQ==
X-Proofpoint-GUID: 9qMkwCmiJVUdlb6uMsOkAFk-4t35EjzU
X-Authority-Analysis: v=2.4 cv=X8Zi7mTe c=1 sm=1 tr=0 ts=69fc54f9 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=btNYDYKGUqI20VIe7WUA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070089

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..091e1fffcd47
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/waveshare,dsi-touch-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare GPIO controller on DSI TOUCH panels
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Waveshare DSI TOUCH panel kits contain separate GPIO controller for toggling
+  power supplies and panel / touchscreen resets.
+
+properties:
+  compatible:
+    const: waveshare,dsi-touch-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
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
+        wsgpio: gpio@45 {
+            compatible = "waveshare,dsi-touch-gpio";
+            reg = <0x45>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+    panel_avdd: regulator-panel-avdd {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-avdd";
+        gpios = <&wsgpio 0 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_iovcc: regulator-panel-iovcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-iovcc";
+        gpios = <&wsgpio 4 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+    };
+
+    panel_vcc: regulator-panel-vcc {
+        compatible = "regulator-fixed";
+        regulator-name = "panel-vcc";
+        gpios = <&wsgpio 8 GPIO_ACTIVE_HIGH>;
+        enable-active-high;
+        regulator-always-on;
+    };
+...

-- 
2.47.3

