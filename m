Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221388;
	b=DsssbxLBRuBFfrjj44rsYIzp30tTEGyrDyxMevTUd+RvkcXgqDqPqhfj8zDOGKUVelhx
	 UATKxfMupxZ7Ki8Q6/Ww7tEJnU/icELWUNZGhLiX31KoIhaHYu43FCqtyfqmBrRcUaSFC
	 UWGqe5mImEtX5nFKaHcM/iSP6NaCE5VGjXf06npy5+3tDOk7TU0FJO3AyPDorsps/Niq0
	 gMSXpVKwilupoDskbBdBAawa413fRZP7B6VZu3OTF8VutAzhzTbsa3i/jXB1/iWaMXsp6
	 n209wgHnpy4ZtAKc7+BJn4Sv50M/PdeRS1wCojG+1cxtxZxpq2WErnSZIbP6FH1hjbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
	b=Gm+ejFEP36SeHjQkTt8lFYxcGk4RFfG8yiJnt/kipHJATQeisCOzO6EBp3kHJRU3b0fM
	 XQyg6ZnSajPl2BuTb7+Lf8Pi1Urub4M5WQtX90xWL+4Ta8wNANj4m2fx8kITEcG+PgB9r
	 6L68icZAiByuUtIaF+Zu2bvbCkDKanAuJ86LJFhHzsEDxblcVH82bSUTW8aJiUGrvTiHg
	 yV1i9unkl+sRbMi5LZCpcqVZC8v3n7fxKqV8VlPJldySHl2TC9+fI2CAVW1DtbekXdxL4
	 1N8Du83G89OYYSaWnZs1za7puN/6s/iEh5XntNZWHDOHok/8QO9b603ZS4MNwyOP5YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A75606A331
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A75606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9ae391a05so3714895ad.1
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221387; x=1794826187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=d3TITIqYEQy2nVPw2nwc3LQqZM4/kzPbuGM44hHPAGvIZFeNP1PUYtBhrYtiGZk2aD
         KAvRce1tF3JXHWqC9dHn7JRr6A4nfBgVAcIEZmrrEtB8JwfNzjNWCETv+AGtA2kJnlS+
         BV+1CPLQwcBl8vg7XDgD3/3aFJlaX892W9xWCtK8oDnivRGcOhOW8yvROkjqjdMITkgH
         BKqq5rDsiEuMwhq8/1EzAjSco3LUB2Nbf+dPtpxSTojqXN2BDmSQRyD8KXML4eOo62lM
         rHGW5+ZO5c3XG37HoOIIHZVD4kpUO8Bfjl9x8UEHpP+lXnTyKnggpXRmmshuqoa/54Cp
         rGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221387; x=1794826187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=i09T1FmuWgrIG2MiRHpfHuLGgc9/e5HIZAlvC3FGS7dCAyWrRsKSzqXahiyRYpcgqp
         chiT1CXVFGS0wdO6WQdL8OxjesjpNKi46ie0PSX697g3lyRYV0xmUwJS8rVf0aKG8V/s
         RTbuuHwYALWTmsCB/CMzBJ8384PSrvVvvG9p+k9i/l84s/6HThsOUGqgfCO10DLQAdGu
         XLF5bXUkGmIIDfPTNRwidXCKiHiZR4xj5aMm3RQ18Vio2ewOLJqoFxB3ehLRomlM2yj1
         TVaY56QwrbDR5F8vxjsXKzCm1BTcU1TNdzuxv8yFTj5ux54lmWAF/GEx/JtGlERIxVVN
         jK0w==
X-Forwarded-Encrypted: i=1; AL+hErFdjw6QDgk0XqB4VcVxvRXCjuDEIfQgr/8rKXRuc21WKxzn667IzLR+hTivqVme73BkA55y+jr9y7Ho@vger.kernel.org
X-Gm-Message-State: APuU4Z+y07Jkmi7ko+mxKZeF+58I923333hKhz8EctfW0DcIZWpOUa8c
	TY1SKITPsjBetYkAJwXtClKGurIk4x221uUGelcZui7buyttTyvW6RFK
X-Gm-Gg: AYBFou37V4A9Yheuhthdr03Ygh47Bf2GLRa34Of6MkQBQr+TgfSc9QLO6g0wNP8Yeax
	Gw2QT2RXvL/9dpvUdEWgnI7WUFg9QqX1Xs7K1Wq4rPOJoH7p6tuN6w9hqrA0CX0Sb6G75VI1N/A
	KWOBF+wcx5Dq60ncrMJzhhWfBJgP5Ufmh/ou9EjOiKYLArBWjcCd7wryc0evvyzHLvOMcgCBSn3
	Xi1OhzpYAMApD6OhguYcfYNJH4aNYfPLF5JW1OiiMZcew1aGpFZSRDw148bQfx4fc655dfXgUEw
	s1TFv4XRYwhiGrU4BSSp8S74lwIrdM0OqwQh9OHIQpkynEreR8sZQBK1RqwqfGuq+M3QyBsExpe
	gph+chJ6Cf/UnZlCOjaSu1OastjnvlX+OI3R7iXeq1OQ7z5Hdxlg5frR/7SAQhnT6TAP5TEj3Df
	/qcaa7SLyYo8CUGGGyhyC2N/QDjeUQ8s1aVj2zunm1o+fVgxFRVUP33OzH8XXZ6xo89kwCo/GiK
	PpVzlG6mySlORK3cwSPaOlPPLVqUgoL1R+GJoOMS28WDK5S9U9dKtd0smLppvj6Jn7hC2uIY+4G
	GGV6DwIDor8yG36KXS9mDeF3Hzef/g88828W48rPFvYckXVr6GvMPfptDO1PEJDvdBebu5jMft5
	Tc1VeyQFFttwhXDP1eKofkigOQvVh8A8a2U8go35JjWucGHU37ePR1wHIOiwibVUMoh4=
X-Received: by 2002:a17:903:2304:b0:2e4:cc75:2728 with SMTP id d9443c01a7336-2ed837a7559mr29304325ad.36.1794221386941;
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
Date: Mon,  9 Nov 2026 16:19:13 +0530
Message-ID: <20261109104914.1534-2-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
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

The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
at address 0x76. It runs the fan and the keyboard backlight and reports
the fan speed and its thermistor temperatures.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
new file mode 100644
index 0000000000..be4c845067
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HP OmniBook 5 16 Embedded Controller
+
+maintainers:
+  - Rahul Pon <theflyingrahul@gmail.com>
+
+description:
+  The embedded controller of the HP OmniBook 5 16 (Snapdragon X2), on an
+  I2C bus. It runs the fan and the keyboard backlight and reports the fan
+  speed and its thermistor temperatures. Its four thermistors can serve
+  as thermal sensors, indexed 0 to 3.
+
+properties:
+  compatible:
+    const: hp,omnibook-5-16-bf1xxx-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "hp,omnibook-5-16-bf1xxx-ec";
+            reg = <0x76>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

