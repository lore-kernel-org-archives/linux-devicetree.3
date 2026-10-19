Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06E4C1502
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403858; cv=none; b=b4sKLnw7r4mIJaW88RmBzV+kTYBB79SYSei+IlbD1+e3hgNzEOjvSIw2om2yw6G4jd0LnMO3d5TN4B1KfG1o6cXlinvSdij9lh1UplW7bWzZbsM8wVLgTT+SaFJqumPJTa+dBregz7XaUZJ6NnycKRd5h3DU16pzaqMI5yDryZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403858; c=relaxed/simple;
	bh=Ms3kQzZFSAV0sF2Y4NJYiyIxnkk9I6e6pJVoEQlBmMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYoIresqJwT7wR41oG7V5MI0ER+EixYuESGaGOXuOlLlbtf4sNOwaLcVYjmBi7M9W5fn6APWcxlZwFV4qBEVeIITf6JggxC3Q2jSTeEa+MlGBLaW2Ub/zcqnN8chSoJF5Njl1MLWYwgrmNAwyRoC1/HZIi/qbzjoQEoZSDiXSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5Eu5KOc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5Eu5KOc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dfdd431dcso1518727f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403854; x=1793008654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=Q5Eu5KOcYmeFGHl+bPNGsdaOhrsfI7V3uiJnzXWUHQ4h9YAi4ZlfLnGRasJEy1vutp
         AeQfcAmoqrBCnSuezuJRNBwASdK8828f/pvQ0eFiMvzHHx5A6KH565mrTSv2BVNCRoyS
         gUTKpFpev1v4fl03+djZ38NZDEKfsy/9EjxVzXWXPGep74YsLPJrx++N+lcL5Hkm8zi4
         mI9Bjw/nzlo6msVcwiQvyZ0NsHamTyM5koZbqRmMbfDlxxpu6yc+S2wB45gWoAz2OT1m
         wlEW6o3qnzOvcGz6+kw46zXIEeHlvV0XkRT59JiIi5vba0pE/znHdYtSTn2yGyfmijn0
         w/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403854; x=1793008654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrA01rti7Ay/Y5eHy2dsofO3a17OwFZMN974VKrytcs=;
        b=kSZlNlf2dpY53rsxYMGPxO07KL7X5puUPDf/IDG+9BaZbtiuiX90aEF8mzWjXTzEky
         /kHnTsnR+s+VV2EJ/Ji6S4M8Z1UwUb8ugdHTjNYEzDvhTAjxILdE5R7aG11xXew1Evro
         7qkEHVxat5Npg/2at9S8Z8GoouY5fG+1qCPfnxN7254PgfSPdM6u/xsSgOtGvtyictEW
         maqO3lVKZEgciI+cP6LJ20K+AjiZ1KfMp32zmmGy9PqOfNylE3K9ERSUP6ReNaODNm3b
         6xSaU+MF3/5bWK/mt7yZnqt0xpmYG7x9AsZXDBhbFI5dSY3rzdSdOg5519/JC7tlzdih
         Vx7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM/kBB1n7JDzwfZF3o5MQwAp+tML2ZOo5BIUSEALalUxe3iFPSrDL3w4lhMkUIpeyoXlspzLqt2VtH@vger.kernel.org
X-Gm-Message-State: AFq9FYLba1jo3ucg98AMvLnMXirUcW+Ymc0S7Xp5s8IMWPEHJol5/NuY
	Tu5WdWO3sPcjJE8KGXcicVcx3P1aMgtsHzFSEkBEewH6NSl9sQWOZsoL
X-Gm-Gg: AYBFou2DC6zXllb0xIZjgrGDeRTym7Ll7P3JagkU8BemIqChN6zK7deCJv4R5jtS7In
	rfuRFBx7/nrH14rxI5SuNupvBJC7TK8fLYqHVZQgAjSStKZZsvwQfJAETGIBtkN2BCj2CH0Yl3j
	tQ3lBHkSpmdU/d+S0xgVCJ3xelY7aCM4t+VuCT6eA1/hVym5Z7+snnrjV4RMtIf1nVDdXU6hcw8
	fIZkCUmIjHC8thVQyqpSGICk1MIZyFFzo5W/x3YT+K2ti6/ihUcgTvwfE3MNIkLwOStGzEZA/f0
	58lzE05VKeqnDzvOokrkDYy08A2u+pE/zL+vO8l83za7T8K9ZG7pEx/IFs1ZWfVaakxxx7RPuS0
	Jx7WFR1AJvWTv+mdY5gA3o3mf6KZJZnA1qSDfjfeprd0EgX0t8VQ67UkN1gV/6ZAPHAa58XJCjJ
	cC2IbPdMsEgWU7LAUpGpjJGkWwXUNxnnZM98Tnmxi+HzwZVJdI9KpAn0rSDKf3EtZ85dja8BV21
	nebPbVZWd4/O+EuSYWqHW5PZ8HBAA==
X-Received: by 2002:a05:600c:a48:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a1d7612bf4mr152397805e9.17.1792403854260;
        Mon, 19 Oct 2026 02:57:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Mon, 19 Oct 2026 12:57:03 +0300
Message-ID: <20261019095705.91062-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/hit,tx10d07vm0baa.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..4642dc14c42eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/hit,tx10d07vm0baa.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hitachi/LG 4" WVGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - hit,tx10d07vm0baa
+          - lg,lh400wv3-sd04
+
+  avci-supply:
+    description: Panel power supply
+
+  iovcc-supply:
+    description: I/O voltage supply
+
+  reset-gpios: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    panel {
+        compatible = "lg,lh400wv3-sd04";
+
+        reset-gpios = <&gpio 175 GPIO_ACTIVE_LOW>;
+
+        avci-supply = <&vcc_2v8_lcd>;
+        iovcc-supply = <&iovcc_1v8_lcd>;
+
+        backlight = <&backlight>;
+
+        port {
+            endpoint {
+                remote-endpoint = <&dbi_out>;
+            };
+        };
+    };
+...
-- 
2.53.0

