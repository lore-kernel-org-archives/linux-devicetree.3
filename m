Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F257413605
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102797; cv=none; b=qyNL1Zq7vBBStoW1FDDBwMAqUivmSe0tAiJOsA0Rgm/UjE+v0ZvXhgoux6vAPMXOF/Q2kbCncrak2kmzBBlaJxEraGXccpIyNJQYfWEHyp+jDQl5pB1hK/44wUkncErCjfahujGrLhGGq84eNuJUWyGZFEK9W3Y/xwRzdAUGTPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102797; c=relaxed/simple;
	bh=6zeq4UuzZ6DuSBZb/JT2zRSKjC6UDSSa+n34qUlZhsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7+QBUKBE95gdyB4OQnm3//e9DOFB7RXjw+cPdjv965+FhOOp0bMPy+zvj86OGDppEsubHohmUNOEsVOGV3lKofuv6iSA1QlTD/Uba3e9kZSVCPzAYZSxrHPxn+na0YYy4f7XnenC2jz8cN8gXTEb7hMkcjH+df2ZOgMHufOwLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gInUUjKs; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gInUUjKs"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6cfdc8382so5094387a34.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102795; x=1781707595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30zAwmg3oIaQnbQVRTHeWC2+fYihHaBtueim4W7iSKM=;
        b=gInUUjKswENlmHUGCbNP/EA72/akP4gGtQlhb4uHPhmOLRpkPXgmzk/dtOT/KbOnvH
         K5pIW3v5hu/kN9xM56ehHL5iTJPOkdtG9DO36HzfJ2u8/LGd50g3L951bTJRtpaZbwia
         lNNYrTg2VrRzWNf2+qL4rJxaYmf/q6sVO++Xk5J9iejbAYWJwDgazUrg3/usWfOMmEb+
         503NUBetoLOm0DlOKAVNfEMQIjtOVNhtoiJK09D0prK0zJSQWUgzNIbt2ay0IzbSh4Mc
         6FnNqDNrEHMkqd7Jp7PHDPU+6BN/ElKgrJXs0SwYvUzpazdEWqXqNTUKVeg5yT4m1Q8O
         TqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102795; x=1781707595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=30zAwmg3oIaQnbQVRTHeWC2+fYihHaBtueim4W7iSKM=;
        b=TxSQXKt15i5LEzY0UGtKZXl2+VjhP+zLTpiYGgjDEdkHmM+nlX50XDLsVklaNHpHLP
         +FbvyDalDB7x7V/O8eXefnV0YUActTNOZdAJeT+/XD+S3QJNlxIATqwV0KNNB88R/4Mv
         aSeKW0uXd6TQVIKCvGgvqKlMBfrxgWD7TbfvTiEWZRbAvXPgyIljJpVJjh4glCFl9Uxh
         8OIbXtrjbpJl2lxCLRU5RWoxBMQ1rHNGzasyf78xKiPExkmkbpuC1i68VTCSBucw5Xn9
         9aLiBmf0L37S7ylZ+6D+z2Wha6owqx/OtRVeXbrw5KqzVuslOkXoEgRIQVD7lzugu4tH
         dDCg==
X-Gm-Message-State: AOJu0YzRDDjLfKeP1QBhiOYC0WinMgrqqLJhL57MSKqcDdp50uvJouhH
	web72Y1yQcnV7m3JOyxba33bL5o8yV8SuGewaDcTIjQYzclV/lUJKq7I
X-Gm-Gg: Acq92OFfAx1yFxMWvVnGrkGr3fci12ZTD9SvRR9WEoU5hfHeRgkyPd6BISufUSV31SB
	3uwVOgShDrOxdxNY0GpJip9LhAiNHwuo8ukIlj0Cg/7RBvLmCu3druhiqWqu4POLATP/QjTF3d9
	aO1xZfqYUF+T1228KUN2pJhZ4r6N/EJdykZy9VomFXCAPiy2zwssk9SeD80HuWy/Lg9+OXco7KB
	E+3qzVRfXFtvRh6KnZWZ4ewqBQkmBr78h0mR1RpQ+StNk7mTys6gsKqJxW9HELU/jeUnsReVp7r
	MtpXaxWPVkg6WL6ddaWppau5o2e4d5EQ7FuR5aQxN7X/aLJ98Qi3PZWVz0A1g8eMwzzdLea45o/
	8TM8g8+EuaWubsI7Qhyhl9XfnQ3T74tytvj4nfQboz+YMLZR57hgPiS/kNLFhMFBJtQeXaUq8jL
	wosv+U9ooZ5Pdsxz5/wbxPlAVQHL+FPZg=
X-Received: by 2002:a05:6820:8107:b0:69d:f760:9870 with SMTP id 006d021491bc7-69e68b5e61dmr14022718eaf.18.1781102795058;
        Wed, 10 Jun 2026 07:46:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e4644ddc2sm12069165eaf.12.2026.06.10.07.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 07:46:34 -0700 (PDT)
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
Subject: [PATCH V7 3/6] dt-bindings: display: panel: Add Anbernic TD4310 panel
Date: Wed, 10 Jun 2026 09:44:04 -0500
Message-ID: <20260610144407.438846-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610144407.438846-1-macroalpha82@gmail.com>
References: <20260610144407.438846-1-macroalpha82@gmail.com>
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

