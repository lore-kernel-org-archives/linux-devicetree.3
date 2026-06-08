Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECC7352012
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 17:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941460; cv=none; b=EMqChjJTTOJP5UTYTmJ519GRO8sU5vavKkNKRIkEUO0jTkK+KSkaQkECFQz9V2jXNKHGUOn6RIL67m2Ek7IlvasQriSMjM3Eeg9r3R68x+dl56WS+g9xborbSbyJ8SjQ4douVH7z6Ya7cfIrV4xUhiiZYXE8Gk5FEEnYTFZEXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941460; c=relaxed/simple;
	bh=6zeq4UuzZ6DuSBZb/JT2zRSKjC6UDSSa+n34qUlZhsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mqXh+GauGfocMwegtRRvxx0x8ml3F48M612Lu/x32kGx51D0updj544WoJVz/PFQL1gvm6BfmWc4KRckYKYCFU0x45fXuIBo/0OihKAc21TU4/xtPHtMDmbQUmCOp446wDvlRkn3JUD1wHFX8gTI8MieQG3X9Z/YS6c2C923vJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eif6rZjh; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eif6rZjh"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-43d16405b54so2024728fac.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941456; x=1781546256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30zAwmg3oIaQnbQVRTHeWC2+fYihHaBtueim4W7iSKM=;
        b=eif6rZjh9SjrQTFq46EJmIqvIrgOlliC1JL58dA3NtSwnamw6JUHSiimocN9Zs4NtA
         HIUbNrNgxrAFx19itcHu3kDVIRRspkdD10c/qfAcc6cti3U1UeJYmb3ctuQF2zD8CCTu
         mXVgcMXLEeZ4n5/nP9YshpA8Xn/ZhIXcUJP1EDM1VD4ZtJg/scrd2I4isJji8K5TCeyY
         7r0EZLbcWHqu8+w36yKHKvD/OAaKn5yB+AAnyj9FagqBnRUn6/ZHpPdpzx2sTmDJ19iH
         AbCDD1+GzGO3Vy3R1ua0a/cAP7nJFzqR5+Cwx+iWzqDhoxazOgy6q8EwPtlHFsHXPWoF
         vy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941456; x=1781546256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30zAwmg3oIaQnbQVRTHeWC2+fYihHaBtueim4W7iSKM=;
        b=UlsiAWB7tci+BJuHgARY1bH3hB96YQ2agoOtoy9pa6M+Ueu9aHYyoKfA+lUrf0XRRY
         ykqj5/hc3ax7TMPOO9jE+bykhBibVldCZrxH3aNm8G6kUoEK5+Dn54nLrufIbMM9jAlC
         lN1ZWmZFiEtIynuQLAvDqLqlGiscNwufz7yiqWjij2uEiVs8Sg/ez8f7kLP9QSyqRtLR
         C8e31dJmH+SI/+vQPEiq8cXHbILin8+vsSy/kty34STa4hkoR4tic0fyWxXT83EkbViv
         9XQ01YSpFVZTpLFKy8AdMbF16loUh9wKZ3vOD5oNT3QucTH0VVsIQNPeXR4Pv6KnAPkF
         q31Q==
X-Gm-Message-State: AOJu0YziQT7wQ9yyxMhSOllCffypUIJwKdESn3hcWWNF06k985BM+VsK
	3Q3CbmFuiYvreor3J7ZFtZRbNu4x0kmzrxPJmNWvuBJlgHcCpOL+bo6V
X-Gm-Gg: Acq92OES2nZZaMshZjpm0nyZcniv61psKkKPiTvHMspYKG2QG8iJfizhMwGB3b97F4D
	vG3leug+D31uXyxJnjStJuFdRNPh5Tv7njzIDyGPGqqBoIwYbeBzRVgS7RnNdgnk9sM1z5e8Iyg
	PEGjA/pm8kHRu7/NHCGuRs89xyAdafbJdae18pSnliG7fddJ1KPov8qctcjtlOwNJLeB4uy/OCy
	taXzUgq48RrCzolThA+WooCTVQTH5hsw1vkWL0Sst9yGZM4hvIOul1WMRcTaC2C+tkNhLuP7sPm
	wKe9KEoKLXxr1PePh5iFRWfm9T/ZCw58dZ5EfUqEFYPcPKAvdeT37HQflVtkwUgMgVAQ0eXWUBS
	xIxdNBv5GofY77TvX1mfnt9ImptOA8ZJmmHNbw+4SnUaK0f85uYrITsZZ0kOX2s513KgPDYdRzS
	5bm4pFKYGO/kaKDvw47PStanwpJkXb2dSWzGk5MK1lFA==
X-Received: by 2002:a05:6871:2306:b0:43b:9922:9df2 with SMTP id 586e51a60fabf-4413da47a99mr9050381fac.21.1780941456353;
        Mon, 08 Jun 2026 10:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8297395sm15214316fac.11.2026.06.08.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 10:57:35 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V6 3/6] dt-bindings: display: panel: Add Anbernic TD4310 panel
Date: Mon,  8 Jun 2026 12:55:18 -0500
Message-ID: <20260608175521.67449-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608175521.67449-1-macroalpha82@gmail.com>
References: <20260608175521.67449-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The panel used by Anbernic in the RG Vita-Pro is a DSI panel based
on the TD4310 controller IC. It measures approximately 5.5 inches
diagonally and is 1080x1920 in resolution.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/anbernic,td4310.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..f820dc2f732b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,td4310.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic TD4310 Based Panels
+
+maintainers:
+  - Chris Morgan <macromorgan@hotmail.com>
+
+description:
+  Anbernic TD4310 Based Panels, such as the RG-Vita-Pro panel
+  (a 1080x1920 5.5 inch panel).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - anbernic,panel-vita-pro
+      - const: anbernic,td4310
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - port
+  - reg
+  - reset-gpios
+  - vdd-supply
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
+            compatible = "anbernic,panel-vita-pro", "anbernic,td4310";
+            reg = <0>;
+            backlight = <&backlight>;
+            enable-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+            rotation = <270>;
+            vdd-supply = <&vdd_lcd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.43.0

