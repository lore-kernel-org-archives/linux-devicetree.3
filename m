Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2C73DDDCB
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776089189; cv=none; b=avD4DaSTZWaWKvPv/qpqDjHqkawI+veTxA9a1zOUfW+/HvtYfcHEKYDOeYNvscF1Aivmmz2ohpeRAwSJKX4fNazJkURclVl+rS/Xiu43q4U7uTtjq2lgRXEjztKNeQxOnlnWBHYkF5XeHr7O51kNEEbFk/MIrQxispUSTTA7/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776089189; c=relaxed/simple;
	bh=NxOTOcbnEcq1UCCLVr2MVAq8PhJPaj6hbxOeziIVdG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKnjfhKYlZEp1f1d/gXRT7cjqIaAlIHbTY99Mf93JV40mxuE2WNgFE7jwxTuBnf9l68DBdBw0tnAugxoAdqgRlYSHCOmnvUheNK07aqIjY6uUoiKtIWzJE6I10Hc7gOKiKeYV1ZkHVPCpjcqXhndafnaKB6LCKYpiOZRV7K0pFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbV555wZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLw15uoO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbV555wZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLw15uoO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DDlxkT1496719
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=; b=MbV555wZ7gt/jskI
	8sJl+Yg4FtdsndyBJmwetOSOj68lMxTv0lOpFSp6ZhhQdoqBvGlz1QA8BgbKnbcv
	N3XRXapDFWTgy4TW0HGee0F24WsT953NTEyCcq+Y7cMzIdJU/ioRCb9r8r0f2s0F
	vyZy7XJ+UBx+GLRyG1gE1PA+ruxE7opnrfD3hgM8pb1GrOAoIWjkVBDhxJyrNKgD
	3AfjW66zLC9INGmVllEoLcJEYc7CKYo/NYcyRgCsuwq4F6E3ofrQCkojmwI0ScEa
	J4xibrmPH42iHUxFK65xIvvyoNVI8u8RyxeA4orjQJvscPzRJNjsRLRDDy1NMPOD
	ig4D9Q==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh1pk82yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 14:06:25 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-683b5d81209so8405055eaf.0
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776089185; x=1776693985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=;
        b=iLw15uoOLM/gzCfcO5u5dsNC5rN9OQi/fep6y/+z/ammD+U9aGtjPqaISTbGPx62C1
         Pzf9YKK4eGVaFMrQu+gBQy34bKMzvagSVnfO+mvBdQPgdBtr3gWfkXOC4qU0OuF7GoY8
         dFmmeQT8Y+tBx/ieYsnmiOR2EMlpJFm8RrydAnz7+OtXPYEXeKPdhnds1ez33IPIbfFR
         syIT3GPP4t12r21DSGvA1XfIdZqoQk2uo/9/dbHoZfYiMnCAD5cT1j7rgyURXfI5DBxV
         PwWyar3BMotMWJbXU5gj3AdqzPOH9Iwe47xLWw1MHHSHsWkTQPDtA/gLSpdFltKgUyYj
         ZEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776089185; x=1776693985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WjVXXDUz+b865LEXWgbJquW7AHByUWxUZ2e7FwcrFA=;
        b=lNrD//dCQH/LRVOZY9lr8G6pT7tjGI69WTP3HNtrce20K4IvbSjrP7OQ7v6P/wtHPd
         HrnizhzRT/18rYGu70Ampg2IYorlzkB9ZQuWM7yfkJFAQS4vYGAZsYGP2mRY0664IL+V
         McjL4/klay+k0xeyJAJloFCI195nFlQMYdhYw2QNi+6hf/8R1pisdvTO7KbIwUvk7pSJ
         gEg1mLalgBwD0kp7pRuKqtNG4wc0Db45x8W3EULyeKYnAU9r3ms/BWoDS0oI1DnRoqAX
         hb41R0d0e6sKLOtwPoF+4eoJTxHxOIHxZ+Fa1rg/GgAuYumuC2Umk0MrpejmLFLnanP3
         gSZw==
X-Forwarded-Encrypted: i=1; AFNElJ+Qene6dfBU0vBr43pmYIG5gfl2ZneveTumZafoG/EYqcCFxc3Ni7x1qhlm/Ha73Fibr1kKFI9kPNne@vger.kernel.org
X-Gm-Message-State: AOJu0YyGjU74eLFuufP9jcLCb/ciDMmywgmVbBg36X+VjlHu3RooMyQL
	zimWMtbbdKRpxud23qgjhtzNLILhfSwMKvokvRA0VLEq1IX9xxcRNDiGdFbpcQ/7Z+2xgLntERl
	UXJuvbKKqUYIIjQhWe/M+qpDf2vNY8WxKq8cyDi/pQOIjbpU2i48yi8V1LQ7W2D5u
X-Gm-Gg: AeBDietvoC1w2+ZRhnm9p+GqPmEjEntaHIkOV2JdhZft2irHdM8D0H0I9OI2AvWcsCx
	zEvwnnzPEGLxHeQIEtoUAI+8JRJwnQ+DY+hB9AXCYD2RS0TXmB3wOpzUstwSoa7Um2x7HVnhAmv
	z6HRWSUsfGhcglejz5jIuMdDV2LouoJBpi7b0i6B+P/7OsyeN6LvnQadVotneHS/XUf050Hd7WT
	p/xN58nNPpsuBXRv4hv0Xvj1j4/DFAE8N/w30jAW7ntcMNZGPnm1a9xgFq7hh2HmUE59ROFri5T
	imna+Kd1slEM6bkcV2JaC/vaCyeDwPuAYsYgbUfCmOsCPCCkbVmkeHrWFu7K/Qk7PWwWjBaOmaC
	PpTEJlgjGO8XaJjAgNVPUlGNFs76cF8RsjxQ+v6cpNhcljKM1ze4pPwgsGuYFl1OGYbaZ12Zn7u
	ZTSZOhxehFN6Y8cE3ZcUjOsTV7C46004qI+RA=
X-Received: by 2002:a05:6808:1796:b0:467:db23:25c with SMTP id 5614622812f47-4789f9008e6mr6468624b6e.46.1776089185103;
        Mon, 13 Apr 2026 07:06:25 -0700 (PDT)
X-Received: by 2002:a05:6808:1796:b0:467:db23:25c with SMTP id 5614622812f47-4789f9008e6mr6468565b6e.46.1776089184531;
        Mon, 13 Apr 2026 07:06:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee8c91csm2687521e87.19.2026.04.13.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 07:06:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 17:05:43 +0300
Subject: [PATCH v3 20/21] dt-bindings: gpio: describe Waveshare GPIO
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-waveshare-dsi-touch-v3-20-3aeb53022c32@oss.qualcomm.com>
References: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
In-Reply-To: <20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3582;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NxOTOcbnEcq1UCCLVr2MVAq8PhJPaj6hbxOeziIVdG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp3PgpJbQp7/Thx5AFbDZ3MJz1gCOh8B6IHEIIW
 fv5ZYu/LouJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCadz4KQAKCRCLPIo+Aiko
 1WlsB/9jCSy7PdUg/mLPbALC+8TGXtsfMpAIz+y/8wCXE020hB6PkIF3wXzJPj1fgghhVvm96+o
 V+llBWNzGIG6xJOLUaTAYK8aJ01D7Vxf5h6mjbldw9m3yFVyRI2yys5vSipyVw9Wk1/SzKxOxaj
 PgQVJh37OWIinWagd2PrA+gvCOLqEqRuGG0Kd8CT6oXMH7bBTNQLrVpKS7DfisGHcBMTEaJWvTM
 lwV9+R0HVmdkogNr0isj1DFP92rnsMQXDvdXXoFaAWuTqcbseOBKGVK2RKhsaPoRT7L+GuJ302l
 dI1npvbMOw+/Km9vf9Dzm8uGawi2mmG5y1OPEy+E3LpGkrAI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EjZSGiQwx2fF_lCLmzcZJMAXtDGLshyo
X-Proofpoint-GUID: EjZSGiQwx2fF_lCLmzcZJMAXtDGLshyo
X-Authority-Analysis: v=2.4 cv=BoitB4X5 c=1 sm=1 tr=0 ts=69dcf861 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=ClTKKeZw4Bcbv9k5X4IA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEzOCBTYWx0ZWRfX8w2owxI9k7z6
 dNs7nKa3XBAh5GqMya1D0YGxTe0QKWaz5DpnY5DNwQv///ObPC8qGMgRTU/RVyIcFO5KSo2zuKC
 brIdt7AN8HmZ7azwxqpQC2r61JlyVhWPhIUjhEn6VyoGxmYtKproU92jWBKfhoqnOt5ofmFPb4g
 2gYjKDiRoHlLjUU7uk5hazYTagcdGxudAXBNkZVaDKZaQvuBWFFSnzSR+KJDsWJ4FEKDkRhjrLg
 lHCjYQx+PZFgvmVVpKtjmOhAx8RbX46/8dmVM1xB5YN8R7Ha9OM1gM0a+fl1ZOOBNyJMDObGdqE
 LpV0VHF3plJk1MD8ukK3AzS32lc9nBApcKHAbwLlwCLitPRg/54kdrNujwNfzgjxP+bN2LcG1DD
 uka+94uz15ZDPq5Qq86980ojVt26qgAaIRTOBiWa261JuMpzmAPx0AV6Qz4RoXYicY6Bf8BJmBY
 OwGGgvQiI+mGvqis9pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130138

The Waveshare DSI TOUCH family of panels has separate on-board GPIO
controller, which controls power supplies to the panel and the touch
screen and provides reset pins for both the panel and the touchscreen.
Also it provides a simple PWM controller for panel backlight.

Add bindings for these GPIO controllers. As overall integration might be
not very obvious (and it differs significantly from the bindings used by
the original drivers), provide complete example with the on-board
regulators and the DSI panel.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
new file mode 100644
index 000000000000..410348fcda25
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
@@ -0,0 +1,100 @@
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
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            reg = <0>;
+            compatible = "waveshare,8.0-dsi-touch-a", "jadard,jd9365da-h3";
+            reset-gpios = <&wsgpio 1 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&panel_avdd>;
+            vccio-supply = <&panel_iovcc>;
+            backlight = <&wsgpio>;
+
+            port {
+                  panel_in: endpoint {
+                      remote-endpoint = <&dsi_out>;
+                  };
+            };
+        };
+
+        port {
+            dsi_out: endpoint {
+                data-lanes = <0 1 2 3>;
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
+...

-- 
2.47.3

