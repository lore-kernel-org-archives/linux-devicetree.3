Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287776;
	b=sqUKLVRZDXzIr9sh/nkDlTVrxeQjqQ8c1WmZmJQ3qfD4YEhHqZ+edWEoFt3181CcbNz3
	 ry/bmgGyMmliOClpDlxKGK3rJGt1zHrCzz1wRzJxLgQYAbdRQs8FN98mZi/w4CE068TFV
	 kXJp+U9QA1OSZz9Ve+O8BMAKbFybWCwucF0Li3w4d8Jkl5I81wafFc5ZCFK3dZOXzDyIz
	 q5ACLxkMIkofxdS89CGyYQDrSiA1FNq3r7m6gnjXF6umnvt7vjO533ACMFXw5tY2Urw6h
	 Sk9LL2L9g5P1iYcmlTEs3NrkHbUUdAVBS0au80fOPn7C9LINKWPAeX5sGdctxW/gFmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=L3FmMT02TimqAXADpWIWzwgxyQYpHdQdpY/CnU5HGcx7vehoyshGzLthHWep3POeB3vj
	 votxAyWrDMuDpC2M/5iYFjgx4hgOdbERqqieYO3rD44AcmErGsTchneY9MVne/HRvre0p
	 v/3tmqVX7FXZVBN4Hh4TBSxKazdNpQoGjV+WXe9722s1GBOGKFwjpUlboyhyVt5Rli1gA
	 QJd81t9mPie9tXj9e2IHbvWCgPtFYb6fjO5cn+NF808xsEwTts3p4obSPdqvx7F28coos
	 PyFl3jMbuaMllO1bHOUDXribjiXP8P8RRbsv8RMFvVdVFRvca6VAHj8Bsrw3XMVU+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBEF606A334
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBEF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJTkI1T0
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c37b612635bso325796866b.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287775; x=1793892575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=ZJTkI1T0FWKnoCCvIKAt80JZM78wIiwL3ZlTTnaOegxkGtq3PBa/KPsLh3bFnEX/xM
         dE6pHqkgeDepM7OIBtdjDyjoHytijTq25QTrFg4XnoD9DOHt7/aPi3Wua94feaPcFxl5
         2KuQhb7RLHiOjdLFPvzsWM+6g1jguedkNjQP7jgHOSnjin20sOH8EmEvsZy/8NtBaFEV
         FdYoLyKNz3QG+VfFXEnhbBNCPJ84LpBcLeIL6J43UY27+8GnSq8NpQ8VPCePNqJtOYts
         x4GwTXOyV+GXLzQCS+l/T7keiMU9abGJN443LNf5X+JmYNNNv8fnXwK4PtUWY0ps+KKG
         oLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287775; x=1793892575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=GpXLDlAHtp+IrrSuHBHsSCFalej/u+hPy3syLMtw7Ls80B9zIm5iJlYm9M24L8nfMg
         HVhOKu+41D+tmqk0PidptBsucQQAlb/HjJCP0fHejZQLooXY2wsxvrlOvoo2sxiOUCqy
         Uz9Arua1yv1faJOD+zz5SpR5TXloVt74FnAZG4tbf1CHOTKzyWisKNshtmMTQoeQcws1
         DaEfds7rEX3rBdr28fqCbsArLjNhw9K8s+ZcUJ3pEH6rge+WUg4mCH+CDuq2D809RPCe
         5Ba7lxEFY43k9JGz1BDPeIXrPs7pBuIaAKvcFwqgI4eQHsTZnh3wV5yKxksPsFNEWwdz
         mwPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpVDxm+WUtz5YX0RlISdbCz8wPAdf4Glw5eXwNeqw4gZX3FRkHlysqlPvg+lm2kVunDNvjHLVlh4+S@vger.kernel.org
X-Gm-Message-State: AFq9FYLh6o6YEfhBKNn5b29L6ZbLLbJHot/jb7BbV74YvjlXcHQi3wTO
	mdlBKB24og4bTz5HCJfzuN5LNJxI6p8pJEUzIA48i/f78eW12QKpxJBx
X-Gm-Gg: AYBFou3Wh3vcuK5sZs6ahXl/VspPJP6fy5bx3tWT91J1YHjvS8TLFbFpwtT+7I4HS1t
	YIoSeObqS2ckv5q4hvrEZIqZnfF9My3wtnt6RmD4QXv66bdcHAofQeXIE7lrmtupONhfd52NXrt
	WAWJ+rbWHD4nlUjKIAN2vPHEjS/bPswVvmV1TzH2LXQ3vqLXQMlUHhMtQ7dtcz88ryk4xP2Vk4J
	kIIlcKFVfhHWenJO4CqbhTX3nIyWKdbSjYmR34+zbPgOSzpQAT7AG9DwKQ4/DVsiZMdniGYUww9
	WtlMzaRgU04pM0KS78M/80agBoEyRppS3R3iZ6uX/T8YZ0CFE26E9DpeWg4Icm27OKswajP4MiI
	bUHW90njVZ1GR4dPZvM3xDLhYxUejJjiZFfNlgQlTnKVnCEFSFOyiA0WEoaCgNGAVPD+dYKVhtm
	xKQdJqHoHk+dglGYKAD/soabcyXOqpyaGfoJLrhDPEBYXT6qWs0i/f2wSwA2P4H2obwQZphmKFg
	JG3KKLiAYk2iEx5hRwmc9lWINzK0K0NOFctM7uF2mlGTImFrSgwWUvjusddfQk8tlqydOey+1Ie
	nZdbtbHxjHHL71uLRrQZy5IuZ5TvKjCgYWTkF560wSYNxIE96A==
X-Received: by 2002:a17:907:6e8f:b0:c46:7645:86c with SMTP id a640c23a62f3a-c49bdff352emr527006466b.47.1793287774682;
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 02/11] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 29 Oct 2026 17:29:00 +0200
Message-ID: <20261029152909.234584-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Hitachi TX10D07VM0BAA and LG LH400WV3 MIPI DBI 4" WVGA panels
found in LG Optimus 2X P990.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

