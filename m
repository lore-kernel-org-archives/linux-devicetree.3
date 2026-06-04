Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8975130E859
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780611029; cv=none; b=Yghfhoy8A2jS4nFWG+ssWwOga2ErzlES2K2glE/8OihHAV8sadK3wUFB5gHyv9LILlxtTyEyRYqA/SIvTEC+F1OzIHi3nsalpuGWrtsdQtCVHTkKfn6kSljoZalbG2sGaWpCmCOuusWQScFLshrmI0IAj+D+JlC8STG9xfY+Rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780611029; c=relaxed/simple;
	bh=0NME0sM49RF5DaMChUXyALkrZCsgLNDsxmIMYYiB3/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=az3J3h2jREuwBXA1y7rokMlJUiD1jw8sKkoCTQ5tTEN8rtSkt0sj/H6ThVJJ+xioL/E3GKpkVry/az5EnSkbI9nt2WBF++5CB0DyunHY7Adi8tAgrhZ4wETuDT99yINoLwaZTeoHZilvEn4+71zDSrHFl8udYsiG2Tbetbzw7KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQLOVY3A; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQLOVY3A"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43f1f2b82c6so986383fac.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 15:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780611027; x=1781215827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=ZQLOVY3ABLAutgwMPMtaK4EyaR+b/RtYjbqlDHk43q2n9qmM9ynF2fD4BD/RYbsxNc
         UTPpoanFwCjpfidQZzzNzb1qRdSvXMyrh19ii0EgGzemC85hEuvX70Y0vba4hbQh1qml
         B8OYUkSvtKyZ2SibHmzh3gY4pMeQjWPVWxOlliX7JyIPmn+5M/81lwdIKLIRDNqQvuXF
         gMBnycytc1ax7Oy6YngDLdFfk0UxK+HoI2+uqDWbPUZd0xBM35fpbnENoTYeOH0UYkU+
         ZSED8lin+k/pDl/Y+5ccaUjDI3Hi6bO/Aa3io3Ue2WZwGXJMsQBKPGZgZGS0Aj2Keenu
         UfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780611027; x=1781215827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FI9ZQ9CgMmpb7a0bvB8JNCWm0010rqvUn1D/bvnZnqE=;
        b=BgLM51Y3pLhpsUTjb9Eg/GjKaXRt1ZafnzEbGrcUGuuX8rpN8UPffPuoBVMUC90/U7
         wwqr5SuTYD59ACRCJ0MyHmRPX6DImkoGZ685P2gU8PGkewcEoMOT+88y0kNZqqzXJsQT
         IdiPExz1lTuQY0vGIxP8HIICM50GoaT0LmgbMqTjZaAPm7V91egHZrvjv0lkphBnN3XZ
         u3uFPorFlHD8OGIcJel+R4+F5rMQHRUPnmpkuYsvdsDxXswdDkJbu+KuX3i9nUzN1zyT
         w6yIOgsFNCIUhlY96MT008GJTxJZh4NOSV8G0kxcj7g0DuleUTMtU3sPFt54ILDl6NDw
         kawQ==
X-Gm-Message-State: AOJu0YzHUMa1mwF5qSLTv2hVmBGSbmDduMUziJm5iVWcW+QM0Z0pyYDR
	DiKTkbhRH257/AqTD2WUjyOH/rkNh3HHuPp0nL47f8JamrZxHmWnHM4D
X-Gm-Gg: Acq92OHzOJVbcuOrmFbG0LroNkiloHwZgwn4n0G/Gkd3yd+DvAIK8cpJhpiMpY0e/kP
	sayCqYw8DSwT4Jtsrnz1FdPC7f4Zg4mkpIDd4Ggkv42Jax1dELT2qqfGoR5yaErOn3yPxkremy4
	LjKNuGlRne0XnHNRoU8uVTnWruK+/VsJoqiuisZj+Lwfq/HWvD0DBFvbQov1OF1avXlaZi/l61C
	ZB/wS9sXYo6KiDFSc1YXYVFVHK6Li9o3Oy07xxp5WTnaDtrkZRTNHSshKyxhaoQooZIBvD0MZp+
	796sl8KGP2ahSexilOAKo6IYFs9URMwwpS8XcIHS1gpB0R0/k1kZ5nr2FuHN/ybcX4V8zCMH/Cq
	hq9cPjbhLcnqIyuU92o6A0w9t65kjiVieAu3sgmtBbRbX8pmoTsWEdisolbYuwKrNyc4AKgtaVV
	RTGCse8s78p4s7F7fPKImdAzHXJCStHNM=
X-Received: by 2002:a05:6820:1844:b0:69d:ff30:172f with SMTP id 006d021491bc7-69e68b5f811mr585576eaf.21.1780611027662;
        Thu, 04 Jun 2026 15:10:27 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d84c0ce2sm6802987fac.16.2026.06.04.15.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 15:10:27 -0700 (PDT)
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
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V5 3/6] dt-bindings: display: panel: Add Anbernic TD4310 panel
Date: Thu,  4 Jun 2026 17:07:58 -0500
Message-ID: <20260604220802.119107-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604220802.119107-1-macroalpha82@gmail.com>
References: <20260604220802.119107-1-macroalpha82@gmail.com>
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
---
 .../display/panel/anbernic,td4310.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..6f7f92b9c860
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
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.43.0

