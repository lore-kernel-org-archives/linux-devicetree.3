Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA862C11F3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309908; cv=none; b=VxKMTRSH9tWUbcUFdD9EYekKZU7W/iQcoXhcHJao7U1WlGCOPTbn2qadboJ1pUQUgi3dFU8KmUR7Dvbe93gItfyJXVbNwxCIoyCKkxfepCzCQlbpavD5d+hy57Uuqn4c5jBBFujIBwegLKHLAQ+4vzrPJuGqeO4Of7yRlbjtU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309908; c=relaxed/simple;
	bh=SDZR0f4mn+dW4ydcs/xXwRJsr5lrh50NfNsz2U4AOGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0IJ2iTNzkDcwMibyscMwdaR/i03KoRJE1OscSnW6IhH4K1bkJ7OecK+mCd8JQVxVV/4McTxIOgmQyVLYychY1+A/PHCL9rOPG4exRgUmhsh31fLbLHv2JGbYIR2ab9mq/1T3h7BDeTDqleiZYJerK2P6pIg/sS0HzwocsQUt7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHN2a/eV; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHN2a/eV"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-463a0e14abfso5251667b6e.2
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309905; x=1777914705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm0WgPLRhpaE+/n98mlMN9+6F5W+8cs8HRYLALKl0Vo=;
        b=QHN2a/eVmSWT4u2f/rvlVdtMTbkO/9gWssafsvO/qmS//TG1d2lx6/rg2Q564xeCbI
         PZCSQtg4sLoNqKXTN/lNs826ME2Vp3M8uNxziQ61isrTnah+6cJk2viFiDnbmjjXP6A+
         MwjoOOw6n98IQenO3dkLo5EFsgGj+rlRttrFeBc9gSp/feZWedk15Ddm3k+A8wekeP30
         DdCdYdFWcY1PpAH5baxF7IaQ42rjWjlri96bm8cSXFN1leyQI52kdfhh7LFVu2Iljy+i
         mLI/ci5MU7gWAIoO3l9nbHYwY9VopSR1BBZMnO6kCx5hF3X6CLlxrdTrWJGUD9ZPODAf
         p4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309905; x=1777914705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qm0WgPLRhpaE+/n98mlMN9+6F5W+8cs8HRYLALKl0Vo=;
        b=k0q5oE9cnNW77NJdx/PSkC6WGzB40hQiTIOp0LJnhrCzn4RmsP6sh5KKoalPeUSJ/5
         odFY2V1kQTv2CAVrAiYS8lrS/BYd5cYhQMikiAGeqD/DSkgIqouq87oQ62esUcN93ZLb
         Q3xgtTRFPc9iKBmN/FXR6GSHKqyLDX+dd4FLklIGb115MlAMuAXfrlA0/LxvrWeht5VP
         SaiDPG7iqnYzUVhU+AQwEPAqhsxzPzwxaGAojzCO1586dQzI4xkM6MgRtGc4jiSVbe+o
         sTKXp5wwjGPF6nOzWoCsvXME0UqRmya187hGpuestAIaSgpv16lFQSxi2FkX/ZDeMHnV
         BRiw==
X-Forwarded-Encrypted: i=1; AFNElJ8EW2kHFmbpQOHiiX6dqHMQg/nNwDJiqto0nUMFUyNDfAHKdRQLOAcYdafBZRNSQ1IQt8GRlGD+CrbS@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLRySESkCa15n9PifXxqaZvr/rY7Xc1Xv4QPFrPLmqctj8oYG
	GojsrghgX8z0MaGySEbHREY3YgwZMYpql7fbfvGW00eFZPhczAJKDENj
X-Gm-Gg: AeBDiesqJlTsxRYEmRuy3nRgtTbKZjpGE7brWEz4SB3BLqtSYO76bZ4355dNVG/M0Ag
	+38b/bUB9PDmpmf3wftzKsSK/TElnK9BmxVHXCHI+jgNyd6DMw8T/EzVjLzTUb2AUATZaWfYM2t
	b/tmRw+DrgiTJp0MCJ+8H1n6ueUeD68g1CZidm7yGDIs0/cDOkx3R8M5RaqHCEGqfUuDwXPwxax
	D7RPg+c6zwGUi7vLN8Xuz4YRNcFsK9UwlaBJlVx7yPBLnvKwXObY6FzNgxfqjx2cITuprOdLO7u
	jOnsffS0Cw4ZSEMVlYvwfLc2HF0Nva6eboVx1hflD2hB3OysUD0OR5g5j6xjbmVyEszE684GoHJ
	Cny8mMEnrN0KibyNKsKW0VjPlohi34cwD+EFrxBHe4ELt0JJgdFE1eLGkHNFinQXGSu+UhP8Jj6
	j8ArXGgmKRLDNpVwHje9kDxy7iaQwbK38=
X-Received: by 2002:a05:6820:1996:b0:696:1dbd:9827 with SMTP id 006d021491bc7-6961dbda16cmr10887373eaf.12.1777309905398;
        Mon, 27 Apr 2026 10:11:45 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6955036558esm10261236eaf.14.2026.04.27.10.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:11:44 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH 3/6] dt-bindings: display: panel: document Anbernic TD4310 panel
Date: Mon, 27 Apr 2026 12:09:11 -0500
Message-ID: <20260427170914.5062-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427170914.5062-1-macroalpha82@gmail.com>
References: <20260427170914.5062-1-macroalpha82@gmail.com>
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
 .../display/panel/anbernic,td4310.yaml        | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
new file mode 100644
index 000000000000..2da957cd5d49
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
@@ -0,0 +1,63 @@
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
+  Bindings for Anbernic TD4310 Based Panels, such as the RG-Vita-Pro
+  panel (a 1080x1920 5.5 inch panel).
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: anbernic,panel-vita-pro
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Panel power supply
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - port
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
+            compatible = "anbernic,panel-vita-pro";
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

