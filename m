Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE33DFC80
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346949; cv=none; b=sqOMfzAJpdQpumP64Im59wMQ4Q2Psp/nz/cXsyfiF+3tlkePhh9MfMA+NFMo5QfaXhGxiXFSB2tm1V5ObXLk+OHzFBuJeDwNtXuMgSMDe2mLlspzs4wHdpllEJ6O6CEZOCkDoKCcQ8x0JP8UrQzoacfwaWN46rhWdlZ4PNi0xAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346949; c=relaxed/simple;
	bh=2NdXQyf2lc9XJgdc/KUyq7NFd1R/OI3Y1Q8DKBtBWj4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PehwgzgBnoc7QLD59612hJoXxqfRmvF5EP2sk0owj0XCU4zuQokVWIDxTrsrbX/8NSRn8nht4z4msZkcnrmtu3vwOhcA/4aaACX1NZm0IKVYLBp/8U21K4/PggD7RwVQTzJDjgDcWgat3wzQdEniDKF76ZlL6dMeaQdB4QpTgf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk; spf=pass smtp.mailfrom=pinefeat.co.uk; dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b=poy0jId5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pinefeat.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pinefeat.co.uk header.i=@pinefeat.co.uk header.b="poy0jId5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso96749335e9.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pinefeat.co.uk; s=google; t=1780346946; x=1780951746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HO3wl142riasjJepHp4iBoN8QUkvS1GbNX0jwvu13jo=;
        b=poy0jId5zYd2d/AuIiOAv+HxRQrKcOpUL6wy2h6IfVg/EtWxcjGeLz61R8NVWySsIn
         qMp3d+EJoWXG2vujg2bCu2Xbhp9b+1v4EiWIGR7W+/6+mpntK26KqSnrKQB3HARRtP48
         7b+nqQ1f+k9fWauoO50eCAUPYNluRaEKsKJNwca4XjJ6a3PAaHTU7c8DNZilgtig1Qfd
         seRzbdZtLThmhRRci0GzkEJMwv/diTuJksJ+hwA5ekZjOhp//dBYxzMZcyBXS8+o5Y30
         irgrRhOspUgI/krlCD2rkIIeKmed1u5vAK3Yf1/Tb67m6QKifaWK8r8w3VFEmmeksYFo
         azsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346946; x=1780951746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HO3wl142riasjJepHp4iBoN8QUkvS1GbNX0jwvu13jo=;
        b=b3Rxy/F3J0rmRoBd28aR5vvkW0lPWWcPfZAeojnUoRB3VjHTGP9H01JgTi/0Ul5cgT
         vGZDRuS48wjFwGeXSoVeZyktMCpfGWc5dumWpNsh7/aHfwsmyQbV5lW7/1A4GBwZgxkL
         MoK9dY4TvAqgHZ54jG4hOxcIF5xI4AR2foXp8nUOpq+AAoBdSC0weg84wKhw0j8m4Kqx
         fw5jXXyYrjZkIs3rnxCjwO6A6lXB/WRuMT0yAGcw34EkXVrbnEK3+xKmM3fihqdLF3j2
         XswEwrcMsELPAFZ28wVNh70G4rX5LdG1PXmSxtxcgrKGd+Zd/fpcxr3QyUS48X/yyubz
         DGGA==
X-Forwarded-Encrypted: i=1; AFNElJ9q3TopvW2aRZlQahAiUNc86d6GE9VfacSsL+hUK6UFgjFea1/ihDhyAXVqUcwuESuPmKdylTHhbdA9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+rBTbT5rDWisl8AGddOhebaDSSjDAVO2TV08Z955ikgJLTJ2M
	UuTcIazI3UGbEfS4LTEvvE3VkP+h85FWCkzUEktn9anaxmbAGnNlnNLDvjoh+s75LyU=
X-Gm-Gg: Acq92OGR4Yc5ytNNvPui+IseF9Vx/K5v7KJjEw1xxZgYYhCOl7jByfRI57h8t4LvhUV
	qINb5MvhofjK0IssoyiC4kvc2kAEKmoQ1kPgXlxf1GNaxBVtQB+0PB3Zys6uBT9WvwACsX/Tmbs
	6HWlWpou2AZNbQNXyYlF/k5XWJ0NwhMPunVI35PnnfOTzc/s0bQEcriskylqMAcFQZd7v2iDqeZ
	9SKLCvAs0FDCHtvdQajhiZaT4od+rJITSjOgco9n4WMDwqnKCP20jcSC4CQeEl7HyvUD7SVGlMQ
	Vr90chaZi4/Dl4eb+xudUs1FxQmuXNOsBnbEmC7CG0tWSXlOdHwZMgNeuAxPwBX8CDWqo8ZU0+O
	OpJ1BO3LD02V/WYnCaKolc9pF9j42PQVIIyEGkWgi2vOxwjcAv0efGf2Cg8w5J/+Rhm3Q/c9Eei
	f/9ahFqykgpkGhXq9FsKsCKJBk/NGZbBVFcywYa6Z5g0SgdwZgwc0w
X-Received: by 2002:a05:600c:190d:b0:490:abef:dae6 with SMTP id 5b1f17b1804b1-490abefdbacmr80856025e9.19.1780346945632;
        Mon, 01 Jun 2026 13:49:05 -0700 (PDT)
Received: from asmirnov-G751JM.Home ([2a02:c7c:b28c:1f00:93e4:a0af:c443:477e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e76153sm16493715e9.11.2026.06.01.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:49:05 -0700 (PDT)
From: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: Alen Karnil <alen.karnil@ideasonboard.com>
Cc: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Aliaksandr Smirnou <support@pinefeat.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org (open list:PINEFEAT CEF168 LENS DRIVER),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 1/2] dt-bindings: Pinefeat cef168 lens control board
Date: Mon,  1 Jun 2026 21:48:13 +0100
Message-Id: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601204814.19148-1-asmirnou@pinefeat.co.uk>
References: <20260601204814.19148-1-asmirnou@pinefeat.co.uk>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Device Tree schema and examples for the Pinefeat cef168 lens
control board. This board interfaces Canon EF & EF-S lenses with
non-Canon camera bodies, enabling electronic control of focus and
aperture via V4L2.

Power supply is derived from fixed supplies via connector or GPIO
header. Therefore, the driver does not manage any regulator, so
representing any supply in the binding is redundant.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
---
 .../bindings/media/i2c/pinefeat,cef168.yaml   | 47 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
new file mode 100644
index 000000000000..1295b1f4edeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2025 Pinefeat LLP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pinefeat cef168 lens driver
+
+maintainers:
+  - Aliaksandr Smirnou <support@pinefeat.co.uk>
+
+description: |
+  Pinefeat produces an adapter designed to interface between
+  Canon EF & EF-S lenses and non-Canon camera bodies, incorporating
+  features for electronic focus and aperture adjustment. The cef168
+  circuit board, included with the adapter, provides a software
+  programming interface that allows control of lens focus and
+  aperture positions.
+
+properties:
+  compatible:
+    enum:
+      - pinefeat,cef168
+
+  reg:
+    maxItems: 1
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
+        camera-lens@d {
+            compatible = "pinefeat,cef168";
+            reg = <0x0d>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..4e5307a9c5c4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1289,6 +1289,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pinefeat,.*":
+    description: Pinefeat LLP
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
   "^pixcir,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 9ec290e38b44..06668674e167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21146,6 +21146,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/input/pine64,pinephone-keyboard.yaml
 F:	drivers/input/keyboard/pinephone-keyboard.c
 
+PINEFEAT CEF168 LENS DRIVER
+M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
+L:	linux-media@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
+
 PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
 M:	Tomasz Duszynski <tduszyns@gmail.com>
 S:	Maintained
-- 
2.34.1

