Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7119A3FC5CD
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511463; cv=none; b=C/WXgZDSsS47xlPtK/47KG4JTMAnb2+Fk5txe8coEm+6OozrazPg3CdSboKiURfqeGWjSoDKdGozLvO1dj2H/8xQeaq/u2BX2dlLw7uX8g2IRVX+9TOVVHe+0u6OKx+Hg5igvnGGHdYFZWWjYqpo6YC0ZmOiPrQPVtR5FgEQUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511463; c=relaxed/simple;
	bh=evX7eHGckJlWiDjaLlRDSEr7EUj3T3hqiY287BkHQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMe9RIYBKbL4jelhdekJEFK9XrprUUDD+idCfJW0k5vF7IMYBGWyPJZTMbSihzJZxDGrsp21IEeRaX08qLvDT9IYYL6Uinu26JyRBU+oa1punX1kyqLkegkH5LPgFqjfWo4iK+AtL7w+jRFL2N9FQNYP2T+RD0y+Z2FbMkTZ6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i7jd1jAN; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7jd1jAN"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e041ea211so597977a91.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511460; x=1789116260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=i7jd1jAN/cvF3lS9xWNw8MRRyDr1mJPvvfZ7pbD+BIvVJ47STZujpsyw4PtEswQgGv
         ZVLYDnsJmATaJZ/9AQTRjkr0fRIMMOSPd88C6ixfjfoFMa9W3mnVVMQWyzc9ZZTWS0Dw
         NKX8loQt4z6gQMNvhWoYu9BrFrB2jYogTJ4UM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511460; x=1789116260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=Q3shE8qT7FlzjacFjl/DW+4kMv8D3B6rkDWoNbXcd5AZhj6LjJuBxIf+swcbeGKPhK
         z2gd87mJoaDKEU9fTrkDO1hJiahzKhyxakmhi+4Uq5hjn6E3w7NNXlnpSrDwqU9X5jdl
         RIJ0j+JsnOuJqZ2TrzHC8H8sGqsS4fIaR0avgdNV/XlJJEdG2JoiskzFRXpm1qAxBBw+
         S5HpdITbdDTVs0DwgRifuXzUJ+Q9rxT2ZiDR2xVjbqfYgA2jOdFKgKhHQOWPHu4/27gX
         90Cp82DG2srMvhMevYW/k/6P6YewRChhBDIMhEa73Zk3tViHOcr5oyfPjZu8BCUCkVwc
         Yttw==
X-Forwarded-Encrypted: i=1; AKwUvByL4mobmBvu6Kw0m2DdcFP2pwi9bSHyCFdzfm8LasZqyl7Vxji4ON1za8G8lIQ2mlWYN2mmL77lQCJ5@vger.kernel.org
X-Gm-Message-State: AFuF++l06sobyTQ0bLgRntVoP3ICEhdBfjnXCcxglvuElmUKs+OoqxEL
	HDq2ePNEyHwynQqy0YK9P9PoNm5rFtxbKGD05Pc3MZhVi62LbRtd/lpu0cOvyrEwlA==
X-Gm-Gg: AYBFou3Cf3HewoXu86hxx43aEvEvvwzmNHe5FXU06w0uOWpnteaW8n4Aiuvar0k/OBX
	21xgMuhLmNQQEHohNJ4GWy80K9m9XZlONeGoWCscPpLCVlajqo0AxuIFqXgl6wVssdV8G9YB8aH
	wzJfVKUreQdj9kGP+lMGSFUOffWTa6sAcp4KxAggJiJTq17YQR9EIyrLnGz8hYCT0N7XFc/pTYV
	niiLFhzFmO1SDTcr+NQHPtqgvyfVXtndWGntTEMeoj9Q2CCiG9kuQhtBqfk12txM5bzHktOfzY5
	Z+ruO72YONtw4rCMISpUWkOUIg3FOw/Jmgyok+Hxaut2zwTladV1RugoEBDcH7TfY2U1DHvSmH2
	Qn7MlKaSMo/Aqg1Ra9VCTbN9Rmrtu2owRFZ0MdenB2v0CorQjWSEL+/MpfHuEuBih+YJnc6maAF
	bZBHOL45/+4+F2tZ132zt7ooAv9oUhs0tQtgt8VAKZuiWzDW181eEplhcdfLObjZ/Z0MFKWpbIC
	ZdqnskCHBeZpjtJcU6FqGSBoyPTgRkzvcfn00mWgdaI
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr7039451a91.18.1788511457565;
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  4 Sep 2026 16:41:50 +0800
Message-ID: <20260904084158.1341550-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.979.g7e5102b832-goog

