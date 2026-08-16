Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1143CC303
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909197; cv=none; b=m3uFHjxllqqFA9NmjIHLCGRW8gqL5UgT9FsB1/4u6WZ1sctOtt0fc/ln/cfedea148ViorjI22FgWNgcV2YZbK6o5rcE1M4SZlIld8D954O9Gy1LZTMYBZX4zsyt17N8T278MXureSqPJ554ya7OOqLYeOKH7/+emA9Iuegzh2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909197; c=relaxed/simple;
	bh=p+sNV03OlGGYrUReYHOX7R8PzXHgdO/RXCMs0dYPR+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Su1k6WpWQvvUQTPQSbchWeIJ35A3+ZMSS2VC8PyAc3BaNto+b0/nabjjTmUeor6ukEa0ivGY+IzIsmGkcRezQoGyzG5cEs30JHyzE0eQAqHzFdOz0+pBiGQRbnsBdTsxhlM+RvcyfqKpbgpCQ7npf9oc/ZtDRgitHbkLSyXi3Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP+k0r6N; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP+k0r6N"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dcbade417so2678922a91.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 12:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786909190; x=1787513990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r7CVU6P+Php5YYpvBxb/ynZhMEbMhKfdVoPSFU1jjQ=;
        b=KP+k0r6NVsOODmK7Op08a1NwvY2WxyvbI8G8OQrVwUTzPLpZkPjSm5wS+vy0snjEEJ
         CSwCgarAA0Hw3/ndJDAAFiFOsOTI/BwiTs7Telp4Z2mO1sz9tFjV3jL+69jBcUvkCADK
         2RgNF4zwlIXDXhcklJQ8sxTcuUwQQQZj3T77JQ8zialpLGR3LZ73lRZveXP5umI8PTnO
         LOdaZiLKe4KD+5DdZmTvKfggh4ptetzVr76QV1MFn0WzhVnGon4tHNsMpkGWNTKodaVh
         RAG3YoErD8jzUrgAROR9gwwEDYf0zTntUF8/HncljYm0+ozA/mHTQtGZKuk6D2xt8bvd
         Hxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786909190; x=1787513990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4r7CVU6P+Php5YYpvBxb/ynZhMEbMhKfdVoPSFU1jjQ=;
        b=EWXrPARtyH1vF1toleKIMAU6DsP7VyaqR29qPz0QLBO9O+ukNIOxP1ozBq1VdYMkgC
         JO/mwz0i5ejZ0Zl9OKvoEss3jsvUjx7tPEzHt+UDpWW8fL9rTbFBpurpvmYesrm3qoPu
         nmy94mQU7A49cc8aQfNhB1zpd8Vxnz4sDQdbM+BNvBcHrppFqTVQt33aMjupSDPLidyQ
         pleJD56j4g5K13oWTRT3ffJZ+9SNSS0vnA98JCzhwKB+VIJ8K7Rns34CRG1zVucMDPuV
         /7HDDUbflsW1M0rVuduSDxyrEec0ICP+09RF8o1YrYAMlrA03N/Wes7Wp6Lzy/yTEsJv
         Qhhw==
X-Forwarded-Encrypted: i=1; AHgh+RquksP82oJho2vbAvxK//UG5cM4Zw8sEZhdnabmkOqVo6j1M27zTC9sNfc2C8p6Bkmv7b6Ylnmf3is4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rV6vNX4ldsiYgRwLd4gLDZ3XrNqXsdSw6xkbeRpRvYSDVP4M
	GC3bys5ygPWoNijHmJhMHoLKELhXNafELF9OERqEMCGzpNF7IRZr/3xr
X-Gm-Gg: AR+sD10mFBxcwXZgX81XfEs5txemCGrGbIrr98DNVFLTHHcit+Tq35/+BpakTZ7S/V6
	ZXjbRk2XAN4xPoqpO6NugiQiTwWMUe7DxUwXG8Kj2Q6mTPdv/A4WImGwBTpW2euk6uy43c4WviY
	bUG4fuLfuFfyfEhPirhiOwJow0SU7gVxUe3Wyjd10VNHv6N92t+SqqtrVC96mGl1u7SlpkbQNK1
	GfKsfJwm1Ay13aUWiB3Ri76QageMwjKs+42xpmDUZEjdne56cVu8vjlwilVkymmu7ove53GaS+Q
	tTXKl92Kq5LDbiJtpSxq/Z5F8sHRwWEpcIRXQwWM3/1OS/zKaXc+xrPNT4m00g2Cakr76cnrm0m
	kx/oferC6giy8nGiAxDuVRID84iHLNnTiw4wP7LNcwPgPJkl6qckK0uMWKnstRUPx47Oh3G5dVq
	ejduMl5wIREpxDWxl0S/VaLFL9RQvitzvHR44QNX8wp70yl/TQ6l7WACOextTKCIbA4j6wqNqrf
	YolpypQ5g+O3hE=
X-Received: by 2002:a17:90b:57cf:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-3933b8072a0mr22653003a91.7.1786909189720;
        Sun, 16 Aug 2026 12:39:49 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4cf:1a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e10d9fsm2244065a91.3.2026.08.16.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 12:39:49 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10 4/4] dt-bindings: net: dsa: yt921x: Add LEDs definition example
Date: Mon, 17 Aug 2026 03:38:59 +0800
Message-ID: <20260816193905.218112-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816193905.218112-1-mmyangfl@gmail.com>
References: <20260816193905.218112-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add LEDs definition example for yt921x to describe how they should be
defined for a correct usage.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 .../bindings/net/dsa/motorcomm,yt921x.yaml    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
index 33a6552e46fc..93ba5b181205 100644
--- a/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
@@ -21,6 +21,9 @@ description: |
 
   Any port can be used as the CPU port.
 
+  Each port has at most 3 LEDs connected and can be declared using the standard
+  LEDs structure.
+
 properties:
   compatible:
     const: motorcomm,yt9215
@@ -59,6 +62,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
 
     mdio {
         #address-cells = <1>;
@@ -113,6 +117,25 @@ examples:
                     label = "lan1";
                     phy-mode = "internal";
                     phy-handle = <&sw_phy0>;
+
+                    leds {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_WHITE>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+
+                        led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_AMBER>;
+                            function = LED_FUNCTION_LAN;
+                            default-state = "keep";
+                        };
+                    };
                 };
 
                 ethernet-port@1 {
-- 
2.53.0

