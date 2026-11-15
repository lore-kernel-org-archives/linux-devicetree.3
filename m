Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723094;
	b=K5DP5dKhgCXT1lhd+TW1Dop7514DcHbzZRUGgctILhye+Tx+WKLknuR6hsTpdDRg7kl8
	 OiTodhs6jyiC+CefZds2KP5ZkSDdVPObbagZVLLhuYHOhsJfgGqCE9hEBvhn6faxZ7CIy
	 yKt0hD87SlDUaio4LmdB8fgdbzOiqln1qMN/3/iNQUbhF1BIaAPnsQnHXIHK8SaPS8UU1
	 YPAMwRPrzf3h25SZStnksG40GGw9r8RBcvSM9BFmY+tVY9w5zuMmj9EPUYHPRkTc14Sf4
	 r2vIQVNgQr3pYbjoimJeOZiGynQXRT6O3ZflcgLDcLtd+3/kUtaJCB3Roqtw0sFRB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
	b=GtV3vSWOBK0GohnshVMai8rqreiG6s+GB6iJ9EYx5uBIk5CfhQAAN4k63HV6cyKfF42u
	 ZFBmF+MnecmNQQY2YjDpL9r3qzyGiSLI04GGClJ5CpjydPhTDvKDJ+9+L2oatD2O+gBLb
	 aUR/0jniXgrfjSbNQYqOLo57bDll9RhkE2ysT/RsBlzTua/wswztm3XJ5bS5J59xIbaiG
	 vOYurFMlkUjJtP5KB602p96MSRYomwlb7M/Fx/PQ9ORz84clm/JEeGu0RCmo5y6qoDgeS
	 GxT7lE5C5UiBPUfOJi747ekr39rIzuWVEx2sFtZRXzg+BeHfGZf++CopoQ16ghWuPzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6FE606A885
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A6FE606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so27711435e9.2
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723091; x=1795327891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=T7iYHYzs0SdTLxO9JARbT2EQUlNflol4Z/wBrht2nrkpgxOq7clOnt5yLxVsu3Owtp
         4/k7u8k5Xl5rGNEq3TDWzV1gb4QGtxhtBOW5umALj+0wOxIQBaheYQY6BXtQbnmu2wty
         c9yOApQrD1mZDjAMoFPHMoIjvYf6bNfcHu2hPIRhDG4hCS7jnjiZCM8F7YvK4DgBR1e0
         Dm6MxKM9D6zKfRuyojALC0IRZqjKkh0t9TWuCYbCC2nuQBDGBCO2r15JdrUR48afQ5pF
         HLBNqgsIS4//U8Cl9qf+SHTCG5Z/7J9fcoJRWNdiu4GSyEUTcNsAFDhMxTC8dmA0lQHh
         Z5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723091; x=1795327891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=US3RvDBJC1n2sAkAa0X3Rw1a21PWrUqKF16rt+5I9v9BFVvLPm1JkKO+4H4ZCc9YMV
         ObztxJpepCCMX0BOMwfD6Qlxbx3J0lc6yfAdD1lRi/VGStEoPZvhQtJQb7LLJ8PnCbqu
         3muBezbGo0UQ0uVZW177+eWcjX+gaV0V/c0vZNacwqmltkQvRQK3GJz+dG11ARZktPju
         Bvj/D2WtNAM5AwJ8meYbl/4L9qiOaZYcF7+BrL4J6/6PuO5Z1spm5sQUlQz84NIj68N2
         LfdIcLPM50DGk+oH5M1BmWdQPo/aP3ykmoKIteuGnIIXSobmIVUYHEvMcXqFGMY3jCm7
         ug2w==
X-Forwarded-Encrypted: i=1; AL+hErElS/7he44RkhTXnuVcH0t3Xglrh81wzIArtEMSK1ALR7NjOurgwH4IhMeZbfUwKCSr1FGKQAClc1U9@vger.kernel.org
X-Gm-Message-State: APuU4Z/P91Dd4ZBS1TmX6iom7cnDnFOv6z6lU6Hr4yHprwXxCtAw1YZn
	NkI7jMkkDBEYsS826xbX6wT7lj7dihpjB+t1u3B3xLuL8ruY/bpYHjXL
X-Gm-Gg: AYBFou1cEmUSG10sSEN+z9JSw7IX+syWUzCkTJLlkTsAEGlqWgFwIPbHl7ogbXYtmAY
	Z9uQkPTniRHAq0PV7UgCnVJX4ta992Y1BJbKs02QhToXe8UsmA4cFyNTRm3X3ppu50xWKLKm04Q
	QPYKPXA/Mk96BD1uHOrCzdsSYUoCD5wSJ0DV97M5hJtzVyhh8B43J5hPcLyDHiOaeRmeQr0Mc64
	ji3Donkgs2qfFyBp24WSw9Tp77umqvoudJC1mFZewmx/XjoO9P/2046YYBJGG9MygNhiNrT9pVy
	bW1TCVhlhoYnYhUVJ8OWoWjpnTj1ItL7m/J83/Lyo65YNx+bOrW0EM6HRuGr79sVhFEJUUVVonH
	PQjRmOe4C4MAmfEP57zWc4StFulgGDLYgsc0Ekk5Y538JjwfHOjEKvr1+WBdHFc2By0qPABEoZd
	BKSkKdZjg3uKASeHQLaMyYNe0AIGAY7T0+Ea3X0L0O9vFP8AmBQhr637vXiq50fs0dgzkNSwU+w
	FwgAwbtsxHVb0EhRUKOgHV/YTUAptuaJooUzMSiimDjXZZx6K5TopcwpsNqycL7e89Vt+zoTFyX
	f5HLs2/RwqpdDbjs9oj5LvEjoHAphwG9aE4vkOw12jkKBBCEFNfw8JOdBVLRstRFAgMUhFw4cvY
	HOPTu+gPSGbvQoiUfVG0HtH6z5LSQu9XVyOrgqgY1198Nd7TZ5kPe2Ain6DXTWhI1CQNqzr2ZIR
	6oPZFmZUVdHeG2i1xn3FGXWdPTT/M/gh9XIRs6wnt73WWJssr6B7lIc26VGukqW/VSLBvzCYk/0
	RF+/1fd9eZaig==
X-Received: by 2002:a05:600c:3112:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb55a4ebfbmr158351435e9.13.1794723091535;
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sun, 15 Nov 2026 07:11:01 +0100
Message-ID: <20261115061102.229680-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0

