Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699609;
	b=JvIvyM8bQ7nKJT9viN3EZQ8hQund8q8DgLNUSHbv8x2qM0CcKMLV976OYZkZr+ifevid
	 2fR8nulYru+98eKJerYwRoDEfyYiDyMXD6A+mTA9eqD7SG4IErQa+1zBFtFoCDPL5T6yv
	 2BNY+y2AbmSwHoMgKTaypCJLB92FLI8IcOFb4+oE0e5KngS0Zu8CEUVln8k/VmKq2f0HJ
	 yCR1a6AySZN+v1vgY/W2KSF7QLPvAwYeZ4yJULdVl/avb7bbmPl7lDk8H7uTRN0beKlm5
	 IW6Ns3iWaxE6jCWHZzpdipEAQ3qrLlingUHrSYDpsZmBPpdQ2eKF3/IQm0J3HkzXjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699609;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
	b=o4FBqZ8cth9m/nVBl/aPds/PfDnjix4zVpOmP3y7duI/GIDZCFtTuo0zFsyRzHawDZf/
	 54ZFgmXeAaxM3O7QhLFSKbyrBZPKLiMiGIpOL/RhyvOfj2EArt7NaBzaYIhulFtY5Wjqi
	 Mx+Oz8GZ9l2DkT0spsTQaY2BlHuvw8bRjabu5j5YOj+q0WzsTD5nGddB4VbMVvEoAqrT7
	 5bXsSOPPLfhjKTny8lS0wmZ33LtmYD0tOT8p5+01Dr2bvpsrKUtmKoVdpDdH0xg1ck7ht
	 P9N8PaWaErf6oFNaZ+fNDBGMN7rRIUdn36Fm5c37/tsE8xZtnRUqnssBmNjMWWvcYuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215C606A324
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F215C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso1932075e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699607; x=1793304407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqXWTwTTRqCzzF0bQdyuAykpcOnACxEXXIFplcbdvJY=;
        b=P78o05+RLtwy/RL9imnRouM3Sji0Ya2JA+oNcToayGhMCijOoeg4z9vuNG80vGl23a
         RRL3lnp8Or8LLzSYW1D3VTKfM5qKSAeE7Br0QPjtMbLtY5uXz+JtvKK5WxxmjU+4JjxF
         P7e4UG3TMprvFkz0xnd9XuW6eemx195mx4eJ28MDn3uZ0sZ9CfoQwb3sts8WTahsU1z6
         s3GER27Agg9uXWpmji/J5lEgGa1KIDKTobuove57tmdBKW3URENq9WeEcP4SCLs9g8qp
         xNEoTtUbzYBp0rTbaHkIjb1lyzjlDuHr8sYaQ4EMAd9Khr4F76TQ/SW7arI4P5gDYcxn
         aS0A==
X-Forwarded-Encrypted: i=1; AKwUvBzAOshOqMYi23yqTZFXofjGfzpEv41lHDz0p5ZXET47GR1YThvvYoBhZR9P7LRlR5dKF+pS9xvUfb6V@vger.kernel.org
X-Gm-Message-State: AFq9FYIhiF/Sa4QaSJDQPClaPntZtIQ8oviUz2dIIf/RAA05kr0yTGd+
	rChAk1AtIwqCDI4kCa8Z2QrWx+zZkzM9zPV5jm4PWMW8kG+UVCXfG08/
X-Gm-Gg: AYBFou2WVlfnW2DUOjHUEhr7svHpFh5S93Sq7gGfOo1AhIS4jqyhyE2mIGlQERfZ3Ue
	XUkcwVnmOfOW52LarvzAj8oh9b7tVI1BxLU9t555pbQbM7oyjyvIQCY9soQUWNYH616emN7ZbOH
	wor2RrGdt8/r/S0R1iQSJiZ2Er4FmcpHe2hzesmZj0nZWChdf1yLB/xYzLiy9YWun6IVoLtfj7v
	glHrO2EZwzOxCiyAfGI6x8Dkf32rQGKXDEsSAypHgfYQ1Qf+h5A9Q+tJ48AKrDPp7NMkRR72jYm
	sBecmU89w+i52g1yHnge/1A2m7EPfMCWfLo5GznSDR1qpKy+NTvmuPEoMru1P2gGb2I2GkAScI0
	gOXX30PB922zLfQEhWOT18SE4whbtkDNGAGI9kFzlIcwCh+sD+J/jOlVB0xckdX4UU/NDEbjBL3
	rEx4tAu8j1fRd/bLdbfOzSEg5znZXDmYUBiMBOl7H3yQ6ZrHUGS+U+9IHry+4eKDfZpaggR2g8C
	M8xgj9nebAbhTCy1BIamXdnn2Erk10qlq2FbvD0pYu7F6Zq3Q2B6lm2A11ykH1IeCFpoVSjNUxZ
	Q0+11HdveFtIwiqeuYfI6X+A2BBzDo5fX0/0
X-Received: by 2002:a05:600c:5247:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a211caf3a5mr2595685e9.16.1792699607284;
        Thu, 22 Oct 2026 13:06:47 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:46 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Thu, 22 Oct 2026 21:06:34 +0100
Message-ID: <20261022200640.3101932-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees use: Meson6 falls back to
"snps,dwmac" alone, the others also name the 3.70a core. The Meson8m2
reports a 3.70a core too, so it joins that list; its dtsi gets the
missing entry in a separate patch. The example used a two-entry form no
device tree has, so give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 29 +++++++++----------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..69244afc4ff8 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,19 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson8m2-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - const: amlogic,meson6-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +171,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0

