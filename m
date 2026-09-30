Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7021B43C047
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751976; cv=none; b=Ox5AwHrSiBqrNiHtcuwVeglS4SrwA+GHt11ID+pFYVL0juTGTmQRVjtbqThD05osmEQuIiu3VgfwYjJyQyvyUw1ntTu0BEj7T/gv/Y+4VWKdz4SCbBCl0Oj05/mmCZ4WdApFa5gHgUmE/Vif42mgZ3oCq8cKElwGEmpngKoVBy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751976; c=relaxed/simple;
	bh=+aDlPONG6UpGM8pzNDt0ZnArqs2t2sWmt8mV+5mbkds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2LBe5MsaRHK5ARkdgGxlZ2pLiqaqSagqjymAgGc4iyPnSjaV7RkI1qRNSuWI6l5pWjkoV2fWp49nG4g28mICR5+CR+f8fJf9aeyASoJaPamOgq4P43m9ffldhIJkTNxXyxt7kOZ+7ApQfryrra5TV3mnqJXwNmCIKSNEHA6cPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvSDZokd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvSDZokd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so6512985e9.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751964; x=1791356764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WNCP+MgExkv2yvoAQcyTiZxwG6dNYRxx1MxpmqPtKeA=;
        b=LvSDZokdBAvDETIX+xIbrl0O1Y+InIq5K5IQIscpEn/ZDRX1C6fdrRtrp6BYUiWYsF
         GZkXBZsk+aZEp7Pkyv3+5p3HGMMWkVbFzWN1s1Evg5Y2mJEbTHp2GzoRjxh0N2DyosGS
         wEkrU4QgpQj6nu3xsB7HzpB9MgAhXhmphcBJBokV5xryfwlSILUWwoV8hzxeWoTROBwW
         D67RHqCrSe8UPCzHv9So9zhjyOGl3sR78QAUww70YgHAPM2EvNc9uI54thOFJcPSbpas
         Cx+imwC81Crmeax7hNVEy916FvpUA/t1t70t4X2x0lbIm7KqTi2PKO9bbNQWuMRJECPC
         gT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751964; x=1791356764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNCP+MgExkv2yvoAQcyTiZxwG6dNYRxx1MxpmqPtKeA=;
        b=ACxZlM394S4RW/cfRHuq91m3m9AVj3f4qFPpwSF5/f/MznMhsPvVLL7RcleMxqB8lO
         J+m64lbRReMBqdH56cyOCB9BfkceFxCD6iTSAABBTQLu7b/UETQgNp82ZMurO2aC+K1I
         iKD0R9Uh5K0zCqwRiizjKNoDODmJw6cp0FOHzoYQoh1i8QADQrAQMoHLWktsZhfQP/S7
         2NTp94o28hUskCXEO2aE3tkFcb0RgNloNx4a47BnwNhkWBfteqs7Fw1AWDodTdmLTLwR
         wOBUJW2P7Ehctyd+9Egwud/gjPQVTjsKvlURqXgHyGGkmiJ7ODeMjBajtHQ22BIas0WO
         cooA==
X-Forwarded-Encrypted: i=1; AKwUvByxTyMzTPvOiZmNR+JQTumEInBv4zFauqPOBi7Q1UALuS/XgzOcdHbZKzyBLbh2awBGDjt2hDsLYjFD@vger.kernel.org
X-Gm-Message-State: AFuF++nkg1kcQwEZjIDB3IN6Aaj6hAXDqbHqwI/g1SNbmEe014+gWAFH
	SNDuohUkp3xoQxYa32rf/LRHpxUFqdycQCbTrqNkB4AlfS9Y4peg7Twv
X-Gm-Gg: AYBFou1ryi6qGXclDA2jMRqB6Wx5MRAuWAemyinPZ6Pu88GOs4LeH3RbH/5nd4ubmmW
	Uh84rEICnX49m71feXzorfqQ/Vsdg5N08HvPemJhZChnkTs19ydOtaPKF5WHQ8iGEwD2uRzmyRE
	24/JdJ7bh7XhYwbi4omdc8RfBGWTaxaH/i/KTvT1DD9hdHqmM6y9cloUq5w6XDYnTu05CqaPSRe
	AokKwXXESNOVep4K0t+zpTQOTrCCdsThN55RwafiDHOD2ds73PbG1nhWnlgOy3wK8TePmFcjdRt
	gmaMgbGRYn4HKSBcTDZKazPlTfiwz6teNUlGmqnwiVgb8kK89xR/32IfEO1ZlNbYW6X5SB3545K
	fRjcsqw9RrJQD8WuFPGhn5cc/gSEEYVj+bEQsX1/B1GT4UkHWa73J8qO9f7ej7P0Kh9cLO35Vt1
	TxjX6TDX8Gug6z/ZhwKYE/Q/TCBMVZXYDdZKJwE9X2rVSkCUj0vA/FzmN56OPWhB+C0oJPSbI+t
	3Gmnch1VlNe+9nAMMHj7C14k29drA==
X-Received: by 2002:a05:600c:4f8e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a01b196740mr4474045e9.6.1790751963864;
        Wed, 30 Sep 2026 00:06:03 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:06:03 -0700 (PDT)
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
Subject: [PATCH v1 5/6] dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG LH400WV3 panels
Date: Wed, 30 Sep 2026 10:05:34 +0300
Message-ID: <20260930070535.47130-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
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
 .../display/panel/hit,tx10d07vm0baa.yaml      | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
new file mode 100644
index 0000000000000..ab839d9e4e111
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
@@ -0,0 +1,55 @@
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
+  avci-supply: true
+  iovcc-supply: true
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

