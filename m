Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246480;
	b=x35xDAd6oorhCS2rrUBnZrN9N6wJyVRXukNsjRI8kM8fNNIsZSVa/lA6Fq1mdRW8xNM6
	 h/6aEHl0y4bPSBPaw3Zynf41C8x6AuSTPWEHxydan5il8KhbORH8Nr2IEzxnV3PhOE159
	 ncD1cBwrOEbIqj3PvqtLutOFb5czAvN9Mpfu2Mi57ewQJx/FTtCIDNgjoraIqZxOH1zcO
	 KSwrBkfxAXjkURNWr5SeM0Iedkke7p0PAPUpVmOQP5OCi3l3iitlng0Acq3Kajv3p0d3u
	 ZJbrVmjI+pQeoRKFY692ziunI+dI2rDYFtrMCNegyXs3xk4WdGBazlBTl22IKwBmd+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
	b=3MTJtyPRN7rdFcMskFnSdVR6HhNBrvfwSIjk6R00yLnxgTGM6CcKjUPJRPGKedt9QyzC
	 3P2FZFudEVra2Nd/eLQDCCqhDR8UhxvJG8Rnx3YCuydwpkxfT3gFCYIABQTKOafHJl855
	 Xlep0fbxMYy2iNLsxSzISG5gR83EcYP6UaVHWVTF0Yuwkq4njkbItV4LqhEqlUXD2Slg/
	 z+TvhCrlToFn1JS09MU95O5uwXiqcVEruM4vgNZBE3MnfOU1QBBd3YZKUYk05SwJToCCC
	 OlMPrYW5N4iI/llPZ8dtXlVJVsdbIJ8jLq5FuISZlklhjC15XpOsUCnSFJvFcoeITVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b="Lkus6vZ/";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06D3606A339
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 17:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06D3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Lkus6vZ/
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so12018625e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 09:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246478; x=1794851278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=Lkus6vZ/PEW5s/E5sett25uDWAFCHeq199L2QKvptiDfvqImhdPNi81hCSE+NGbwFC
         3RLkM0dI2rwntuKSisFIEGQ0qXBg2S85ZS7HJY3bY8WG8s22NZ/eSmbhkhhab5z6WC4Z
         7l1z0jGTTADnpXP/56YtGk51e31DxQYJYd1R/TYrAM46sxskGSDsbyPeh42opCk2cAej
         z1HlIFi0YWh54hWy7tj6d3MCRpmbx/HBawHxOjcnBm6TU+Ob7NFdEWN6CBRBu6n2T2B1
         G1aErT/W3snaseiTZx5oTL4I/crEkVmCarFOwp7PckxGxGoG440QxcaV0sPU0qqhHsKv
         +hqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246478; x=1794851278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPQrRdeY/kRtnbmlFvQBDv3Ep9Z0Ve/f+uT8OM+fsyc=;
        b=gBcH8MvKUH/uS9kbTR2jh8q7nTLsQk8cvxXLuD1GhmPOi9FyHCyuqDYyUVUxieTaEY
         O3+sYUonaQYrvMUrlyTPG5XeEnYptWFfAsNjFgXjXXVDw4QfZ2HiV3Wcdjd1Ss4EJNXU
         8r+5hP4iqDQAvjN+2lKOuiy6YVnD4GJ9kbDobmJ/rN9i/fYKtYaxmXhrBUZnu8NerUhM
         wMw79M80vrcwi8CQDBvTbdlUmVpMiZzSD15r8bNuKgKpnMEsEFx1YEXDxlikpu/YypwZ
         nGzXNlzBYAvt7W0lum4yPJKmQWivMXZRHBX0Nk3lFV8+INJiNUnh6ZM/wwSVWCCoHlM9
         ML7Q==
X-Forwarded-Encrypted: i=1; AL+hErGbSRRUEqCUkE/ardfCcwGbtITgYE/b/4IPuzGizcS48iiMawUi2zSXYEfwA9Vglb7pT3fGAswqP5wC@vger.kernel.org
X-Gm-Message-State: APuU4Z8xf1YpV8BHBZAZSwmvg0dz0F0RzvP74DbIlWtNF+T8cyLyWNNu
	Tin2avPgXXPMURlQCIUfpGJxIPKzLpcxQ5A/dBPi9uoMsCh2rFYutrZTO35nv4Xmesw=
X-Gm-Gg: AYBFou26haSfmyW8EnFH5nYdKX0EDHY3Xu/sr/xKNOXiCIdXCmbx3hd+XTSYETYKJcY
	DTCSI4ALbhq8lmReoWymQ+uJHPr4oVAMSkRouNvozHfco/yJbFzJgtWj9QVAf8UeN2ChKW6Kf+Z
	nVi415/Gtry9s6qMoWo0Trlx1BsJaHd/sxchQauvspMN72OImLLmZqPMrVe6zT8TBSMAfHFo2GD
	jh4JMzCz03xMMj13d9bAos9Htn4xKROA4K+eLzol+nOqK5DcqVgWhsXciN622oeBcN5/sR2uCF5
	9X9ub8c2TuM2Cx5Fw0cOeYjY9LFKCEvsJdIWSU+JvQiExWp917AslqooiN2TJE2aa3sqYZFHHCs
	A4GMu2Y1JPV+p1CcrmAyFqBCC7juW4XpHNWDWFK2++B/8FBpt0iy5TiZhlevj2rhyBizfVg83jB
	48vQ6AoagUDLo+FSEAUDGuWZsSrZ4HsEiYSSqjOfi60DGqtu6/1AlWk2Pi71AWvKdg2g4KLHDnR
	PEbc5ckZCIwMwNTn1MW8VLXm8U6FNY9mg8piUeNnCjKITSYPMOXcTkzuWsPTCKEhcyDIeOOyzjU
	2p1hCh/mQdEiqNfpu0uU84x2UQgzBX8GRDfopjQWnFK8IpIHSd5d6s6vxreECF3G6h4MUAYhjhW
	oS/XjnGVd
X-Received: by 2002:a05:600c:46d0:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4ba023052c9mr134995e9.4.1794246478209;
        Mon, 09 Nov 2026 09:47:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.47.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:47:57 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 2/5] dt-bindings: display: Add the Ingenic X1600 display controller
Date: Mon,  9 Nov 2026 18:46:37 +0100
Message-ID: <20261109174640.96951-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

The X1600's display controller fetches frames through descriptors and
keeps its interface and timings in register blocks of their own (X1600
programming manual, chapter 10), so it shares nothing with the
controllers ingenic,lcd.yaml describes. Its registers are those of the
X2000's display controller without the composer, which the X2000 and
X2600 manuals call the DPU, as the X1600 manual does in its register and
clock names: hence ingenic,x1600-dpu, which an X2000 binding can extend.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 .../bindings/display/ingenic,x1600-dpu.yaml   | 61 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
new file mode 100644
index 000000000000..0e9f4442e4b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,x1600-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 display controller (DPU)
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The display controller of the Ingenic X1600 SoC, the DPU of the X2000
+  without its composer. It fetches frames through descriptors in memory
+  and drives a parallel RGB panel or a smart panel; its registers have
+  nothing in common with the controllers described in ingenic,lcd.yaml.
+
+properties:
+  compatible:
+    const: ingenic,x1600-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The pixel clock, whose gate also gates the controller
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: The output, to the panel or bridge.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    display-controller@13050000 {
+        compatible = "ingenic,x1600-dpu";
+        reg = <0x13050000 0x10000>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        clocks = <&cgu 16>;
+
+        port {
+            dpu_out: endpoint {
+                remote-endpoint = <&panel_in>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3aec082b0a..ca3f1a4bbd3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13182,6 +13182,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 DRM DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

