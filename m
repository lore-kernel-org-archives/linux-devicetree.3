Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308A383993
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112553; cv=none; b=mKpCXw5kYuF5Taltd/LTRbeEQYZNSIFV4uvwFm9UITMVdtEJ2sGYRg5KR1JnkWEk9ZjikqqMekDo/NYJXDe9QJj2mUoibp/HMOQDWZh4hZIE4c3QaVchBbJEQ+3nE3N0KuEIRHX/bLX2hDqJfl3sHDb7kW0O7CXaamwnBw1n9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112553; c=relaxed/simple;
	bh=J28xWWhBWqCfIpHOKlpEQuPok325qQi5nVSHUlh1SK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pehDcYvTxOkGRwXsbogI6+hEaHF9jPHA7IiGqXxH6UvZUH17QxPYH4ZoWTR+v/F4p2CPNb7fKpmOk2euDX+F6VWYMshktISRdUuhCHEjIy7wyFZAwczadEvLMQfCBXQTZh5Hkcl5MKu6xqtcE6AuUr4IxPgBdoDj1zu+X4KGRwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iw5pfrql; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iw5pfrql"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2874556a12.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112552; x=1786717352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXqORpQuFukFf4CtgnQuCcVwYnWDFuCVbv8LufyxBXY=;
        b=Iw5pfrql2Yk6H0sPmLSSL/5+9VqiD3tZRY5IBoyuUNvuJB0f4WUAm5NXRiPPGlWN65
         b6QlwtH3BfZuw8w85SQ2W8IZHnJ9KXZ17B59Rd79ZkgBxw2ITDgLzEUn8itHMXD0j+j7
         W5Eo4t3H3kat71TLYdf4zpRF2ogC6ua22heY6aXANMptrM2nTnwCD/Dn73B0B7ZWia5L
         Xz50UGJyqA616Ql7xbrLp2LTzdIH2OTPbW1H7UT9jJ0QlXeYaMmXFpS9oBY3NmUi0OI/
         MwBV+KF3elOLYWvdG3yv2ZbC45S2l2l7KEv0SWiPlRT6E8DOmfwJbVrQgB05ynT4IyUI
         6acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112552; x=1786717352;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXqORpQuFukFf4CtgnQuCcVwYnWDFuCVbv8LufyxBXY=;
        b=EieeDjFglyPdNY6eAQZFHgvUucy/b/uSGA7T7Z6xwYXFku1nizZQsgspPTscP0IAV3
         /S93cglRbHW8R2ji7l+HnAYj7e5Y8ImYex17xQ/3IaOgaAmKBBTGUYP2qnUIoKEgxy53
         sR4O5cpmjBNglWqwdm8hKAcN303gVFEDaPnj/4vcGkfEFvlc4MwPXWVerpZIwvTHabJU
         pZtE0TFdlwnZQFObvlNl286+DtDWQgGA7gE5vlRW0RWG58ql7CL6+ylWhaIArlTgwBia
         6MDbHK0S55KZEXxtHt0jMH0vaORkqbdkoKoW/qVsQa7e3/Xnp58VJl9J6io0MA1XtPT5
         HBbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZ1D7aqxS3M1sLHjd1vEj2AQWzOlu1NBe2dSKcnOLauz766zAHGpqdhVE5IqhgguxcYc9D4IJYrnd7@vger.kernel.org
X-Gm-Message-State: AOJu0YwcsY+XV8FwVM/jNiNRsPZRugabT8+caF3bz1tG+zDONigSVr6p
	JPRMQZj1NCXT4gOUJssmfLM5mG0VtQg36jB+n6s509udV+ql+NIEt2A=
X-Gm-Gg: AR+sD10B00xzRCRYhwfE5Ex3DKPqCMPvQg0tt1hN3Rf+ZVfqUo9bvQVjM1nXQeuMv9a
	ZKOPPZVjLkqaNwkHGqLMm9veNwdSQhDY+cwQxDdfmEno+DeWhDoqx28NiLq3Jl2jOpp5Fd4ZuEw
	m5CJ17twUIUgurBDA/+GMi5h0SM982qFtqiS4IxlG1Gd+yIgshLxka2F6AUF+AZtB6nEr12Pw/p
	hzwmRiLT7FwNuRip7/GObytgxG5TpdMpqQl0T/DwL8SHTX5j7P4ZbNX0IXobDH96CopiudzS86a
	VV72jTLIOF+aVirrEzRaBnu9eyLweDk64X2M2Mn1uMXSyQp+NXA9ad+t+q3ImLKs0zML77XpLwB
	CFbV+A9bWfw/yr/D1cyPTHSsQvWXP8qJHqmCOq84C3YOxpkVKuyOJzIlpD7bctOdrC9i69MiPO7
	YcaYrDlBbRFHzPCp50YHMkn36qDPsw2oALYrv4sf60U7dSJDexf/ejcfjNuBRxpc82n0bo5IXV2
	QhjepqsA1oP2HsSF1GqqEuw5MaQmQyhjE6bl3+X
X-Received: by 2002:a05:6a20:1602:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cbce98a610mr966402637.33.1786112551619;
        Fri, 07 Aug 2026 07:22:31 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:31 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED controller
Date: Fri,  7 Aug 2026 11:19:50 -0300
Message-ID: <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786110720.git.nico.antinori.7@gmail.com>
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 .../bindings/display/chipwealth,ch1115.yaml   | 73 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml

diff --git a/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
new file mode 100644
index 000000000000..29d55da85d21
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/chipwealth,ch1115.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Chipwealth CH1115 Display Controller
+
+maintainers:
+  - Nicolás Antinori <nico.antinori.7@gmail.com>
+
+description:
+  Chipwealth CH1115 is a controller for monochrome dot matrix OLED
+  panels.
+
+  https://datasheet4u.com/download/1576606/CH1115.html
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: chipwealth,ch1115
+
+  reg:
+    maxItems: 1
+
+  invert:
+    type: boolean
+    description:
+      Display pixels are inverted, i.e. 0 is white and 1 is black.
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+  - first-page
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      status = "okay";
+
+      display@3c {
+        compatible = "chipwealth,ch1115";
+        reg = <0x3c>;
+        width-mm = <12>;
+        height-mm = <8>;
+        contrast = <127>;
+        first-page = <1>;
+        panel-timing {
+          clock-frequency = <0>;
+          hactive = <88>;
+          vactive = <48>;
+          hfront-porch = <0>;
+          hback-porch = <0>;
+          hsync-len = <0>;
+          vsync-len = <0>;
+          vfront-porch = <0>;
+          vback-porch = <0>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d2ba67c4c8e0..1d158ac83ce9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -325,6 +325,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chipwealth,.*":
+    description: Chip Wealth Technology, Ltd.
   "^chongzhou,.*":
     description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
--
2.47.3

