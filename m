Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83353D1CAA
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734938; cv=none; b=nBJ3O35HVeoc+n9+SxWyXePc2Ot3Btl8YlhN+yYYhWXOTRFGLICluPOQaDaNO3zh1ZJJX0q7lvg0XD3XSgByk11odWqjFBx0+yp/ETRHnSHZu4V9K78Ry7QDKctj8r7lsRy9xCfBR/4eE7Vq27dfp0k3j8H1ZujOsBcj6Z9Drvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734938; c=relaxed/simple;
	bh=0k6bV3LH2ghjcSL5r5b8oHagkbu8nFD06A6dOv4SBPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvrNA5VNTlw5HkEQBmEbXfT4cXMJGULqAc+3iOEBAEQdiZIB/XbdIMbcuhXq30FAZSGUGah1ZTai4oyl8NSg8uBNkUyVEAU5dfOGG/3mqlqHy0t0mC5Wm0/6koZMrqbabfxaJkJsvDLYyzLX/k9TVD0fRHqUTE58CeLtM4yvL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCtFr+a7; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCtFr+a7"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7eb68bdf53aso5136155a34.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784734933; x=1785339733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=hCtFr+a7eKK5JEtn0q9fxFuyVBkJ1F/ZLxiV2qgx6zJSBOaUCa6NgM+xbnFRtivXUI
         yRBcH1/0/E4Mx98W34qzzEbaHZVnsTGVvedbTjhq/ndzj5aYw71e+HxPbjIkEBY6wvOW
         EICkYNyO0qQ+egjXQiyov6aRTiLbfCrrLSNfUI7Qo15k9dD3KWDfZ9eAmc9o+/QboX0T
         Er3ZDiSEdGroK5A7jzlyK0rV2N+9uSHVIyKljcyJ/O4FJlL8pZKpgw4sIbKsWYHag0aJ
         NG7MUTrAQmc3O5yJKIREK2Cbtg5TB3hVWSS8oEDQ90GZ0uz7mpksBpP57BscblOYGIzV
         3K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784734933; x=1785339733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GK+FG51ApM0c5ceijH9gfcRis3iTLtG8+LrJylpTuMY=;
        b=PwAIlwwvF89Y7NT1poGI7VP9jewY0B0PkBrwhPhgndMAENnqQQZYlaFJCRmc/UcaB4
         iih/kVRDxZG9rdhCxcTWmu2o3HwMdu1ZSsjsud0LMYzKQfwsmd4xG8OViFmdmSvKWLjr
         VePD4FPUvxpmyLxOMSmygHzlXWR0C0n2RRuLc6pgF75nRN4lu7Z2qz7jLDC/6URbmcQU
         coOAvAOUGvUvI4Z18DwWsoY72FvuapUQhsnL13+7TlaN5ag7mIV42MMl6CBY03S+ZJ1e
         5u0PMQz5AvEDJgBeOQ6izOYLUjkC7MftI1Scz3DNDbRuDgz0DMkkbxffaGO9Q6H0h5nm
         IZOA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9csCY89sp/QtJbkDs9YtslIXwPLqWonvT1DAxZQK042571M5DGV4vtpyL7I2hg5W/CSH9zzgGJhe2@vger.kernel.org
X-Gm-Message-State: AOJu0YzmF2uytFhdkPU4CYKpoKE6uiomHhB4EMUQGf8JtKU3yjKrkg/j
	ss9YLZq4h8tyt6OljXmFlGCXloSSJSq3Oqi9jnTo/jLNeev0YGboO6tZ
X-Gm-Gg: AR+sD13k7V8fhmaO4iZrAi8/xfyWsn+tttb+wxLBddUGTxD62ZX7y15NE9/vFbjo/QF
	HOpjtTJSv0Lk3TUMmmjnWa0UVz0p2kVSk+GqVl/XnAf3yoKEfFfKBEnYn3hEdp/e3Bs3ORDvDMZ
	BxhzcI6vr26rxsxDz1uO/QJK0GfwhoUnBPlhQ9jikNSjpc69eaAARj3EPtTnhUiLUkMVosOnuab
	oYyYWJOJ1iqRBCHWXjTe8+9VDaTodTpAJnuBcjsFOBCvDCQbIOOEtvsx2O0KdJQnNRNRLb9Pvpt
	nx4u+8zt/BTWs3mhq7MBzK4oKRwgFXHa+9nawzBPPA2+zG2BBfOO5KfjugDfkzD1O4iSAGtIf+F
	baoHTjw0oCbll50UZEQIxDbz2qce84EFNmmvt6FeXwfJYj5ZwOFUPL6LVAVbjFdD/eRveF+l/6z
	uk
X-Received: by 2002:a05:6820:1844:b0:6a3:98e9:c979 with SMTP id 006d021491bc7-6a5366a2cb0mr12382376eaf.14.1784734931621;
        Wed, 22 Jul 2026 08:42:11 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aac3a494d4sm1300804eaf.3.2026.07.22.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 08:42:10 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V19 2/9] dt-bindings: iio: imu: icm42600: Add icm42607
Date: Wed, 22 Jul 2026 10:39:33 -0500
Message-ID: <20260722153942.144387-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722153942.144387-1-macroalpha82@gmail.com>
References: <20260722153942.144387-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add the ICM42607 and ICM42607P inertial measurement unit.

This device is functionally very similar to the icm42600 series with a
very different register layout. The icm42607 currently does not use an
interrupt because wake on movement and buffers are not supported, and
cannot be implemented on my test device which lacks an interrupt line.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/imu/invensense,icm42600.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
index 9b2af104f186..81b6e85decd5 100644
--- a/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
+++ b/Documentation/devicetree/bindings/iio/imu/invensense,icm42600.yaml
@@ -30,6 +30,8 @@ properties:
       - invensense,icm42600
       - invensense,icm42602
       - invensense,icm42605
+      - invensense,icm42607
+      - invensense,icm42607p
       - invensense,icm42622
       - invensense,icm42631
       - invensense,icm42686
@@ -67,10 +69,24 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - invensense,icm42600
+              - invensense,icm42602
+              - invensense,icm42605
+              - invensense,icm42622
+              - invensense,icm42631
+              - invensense,icm42686
+              - invensense,icm42688
+    then:
+      required:
+        - interrupts
 
 unevaluatedProperties: false
 
-- 
2.43.0

