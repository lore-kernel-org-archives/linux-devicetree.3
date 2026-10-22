Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675405;
	b=KE9YdeS+kM665P4c5seQwgCNJO+EOJ4vv1+Hii3I46/nYkd3S78NrhagA7wI03ICNmp1
	 hDqSqz5yGxT90smz3hc+4CGlrgsydquzArmpDSBVtd3hFh6ZUt8aYESU2VfY5kUGDm9uB
	 3xz1/ciY9QjVHGStxtKyeecmDCTenOYGFCgHefeSCZroAdmBHO7wt4rcE5uz1Asrc9VA6
	 IfPrX5Yg+JJ8ZR9M+Spc2UsLjBkfNk2usVd6xj/aHtYWu9H4MhHTvbe4ktPKHGK/3RoMf
	 wBa41Y8m7iCVyOTzolXJy2UO89qFartDbAdMxL3lPf13bd0GCCOtaVMXdsjR8SwD3XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
	b=zXTjt0H7KttQ2HV/140yX0AFGOFHYEgXlT8e6/KfStFwmohT/NkKaO7glkbn8B9OuNPo
	 eWF3UDk31kJOCiHYKGbOz0jbwwrf97rqGPc7Z/YpFpUOW0E0PIDA0qSariPbRUrVtlUtq
	 UXERp3XYrHw8VB4eYd9tISbwKgicES+1Xh6gC7BBwD3HE9q5C060oukYYKkF8Wj5XRaXe
	 YpJpKX6kOtdMpui0Tf1/DbvRAIH5dN0btP6e4U8YcbCj2z0O47Jq7m7Cdrc1ORtGxhNJf
	 mFWcNqMaQ3iM1RVQOT6grRSvQxkyCeiPOIvsYHEJnRGU5R3Mx/Arw6Doe6gRn5nIfuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CE606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1CE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so4128263a12.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 06:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792675403; x=1793280203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=kxLes4frZA1nQUMNbxWsOc+4K9YOsscYvhw/zBnNiif8C4/07HpOicqM1EkFxHZbDo
         Ec1WzxXUW3AYSCI0F6PBluvl9H3csMYIsUnKmyVNY6ySbg8rTyGBu4YdI1Hib281iVHI
         a3Pvl+ceQHY+aXp1KO0Aa45CChYSFkCWaCiMBrZ+AbfBizzIHp3pbn0BU32WtWL/M8Wh
         +CzKM7tbPeQfx1e3hHGFf8RyUavvmHrSZBK3YWFqz/m2lIL5neZwW6OL0fWQw0xcnSIT
         6Euv29SXRXq9SbqJuM+azuCSe4D9Q0PGkQGFQJJsCDFAarcf2yQ7MjIJ+0ImlC85kk2N
         ij3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675403; x=1793280203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CPvjoYy7BE0WZR1WCFgrzG3A2OCzgKkq+RlO5AEapY=;
        b=z6NfSwhEtciGtcDq+UlO03vCSJ/n2dolOHX8X/15OuaRmgxTAG3gM751h/hsl04RUW
         tnn1LGtNxFQnWezpsiMEfdTkdqXYXtLfMfTCR7VBGtaOoqz3eM2KHyAAa7EpfvnUFLbw
         HORRYVaN0H2n/A1ppugqiLY+z4r4l06D1xtkBCJ+KfKUCyz2weJh1Hols+hlXIjDZXJX
         CvV1wtIX8yotTcDBc0VazsPAmSeN9h35Vo0P3cu/rO+TdD0LouY6x+tNQ2wigmU4xkI5
         qCTf/Nz6ZzgiEDpsauX+QIMG+wo6Z02qAYwxZzTJJeKDTym8qnL1OaRoectXRSXFWWy0
         QohA==
X-Forwarded-Encrypted: i=1; AKwUvBwSqnqqvqsldVPcjdoFEjxAsE9fgHwEnuzu1M+velPV79wYcEpFRyOQakZlkNFLGLv3++0IiMlkCyi9@vger.kernel.org
X-Gm-Message-State: AFq9FYKyXjq7Dgm766o+WmJXkIIaPYtJfwG8vLbsnKuTZXdfIqg2/N/Q
	QOKadRyALXJK5/Xf6q0z3VQvZn3n510VGKxdJzpIhSdU9hKXS9pm86u0
X-Gm-Gg: AYBFou2+vHHtn6OPmFKycPJPrMCO2qp7KVDsnevQNpt8psziGeUrMT0/PjsWrS1CWSM
	MEO4cdgmKwaou+qzE3G5kND3HN17jo23iN5CavFtBJ27xuKHA2MegiyHIywssK+zOMz8HOXUrhb
	o6tCIbZ1Z/V+wXcgfFx1+3+F5OkeWJUJSsEcj2wxxqTEfq5jUIDWS4GYYnKvDHQmHtisXsFkhqS
	MC6+/Ecf+vvrjMRq9OS2GTnAAt6lZ8bbaaMlWutcrGfK5zRjasELgmgN8Tt7qPnZzxD0QpsXNpW
	bISh39XtEkPQEdwo4iGQqnblJq/bCmBp4+KYXeWHqkvl+k4V36AAE0JeUk97qgy+qdGoolgOdZo
	zxqSO4Buq7Pusk1d6Pu06VtBBG9k8il+bqmaFGToYFxJG5XqlAGVJnRhd2sEYFJXhWw1YaepMed
	OuMOQawpaRobm6b3XlDKc41wK8MeQoQjiy+aj8Tq/Ota8dDeiI/YgZk2d7K1BE6i53eL3TvpPmd
	G1wCBtvZTdaHYrfZN/69lECf70DURiOUjK0guegCyQdDkSn3BDhXHabUGBu1PwreWFnaMFRiqC+
X-Received: by 2002:a05:6402:1951:b0:6ac:afa3:6f72 with SMTP id 4fb4d7f45d1cf-6b408dc32d5mr5323394a12.5.1792675402834;
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40313074esm1818061a12.27.2026.10.22.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:23:22 -0700 (PDT)
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
Subject: [PATCH v4 1/7] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Thu, 22 Oct 2026 16:22:53 +0300
Message-ID: <20261022132259.240717-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022132259.240717-1-clamor95@gmail.com>
References: <20261022132259.240717-1-clamor95@gmail.com>
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

