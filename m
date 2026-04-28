Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F53806C9
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777390598; cv=none; b=CMs+OkT24GTmoYJP8xzntF2fXwNloYC5ijw08yzXxjFMjNI47wwyI3v6qqwmBqYxhUYttaBFCjHZfDghV6mKWxaB8N9u8X4QwAO68KoC8xIQ3KJt4DDg828GxVlZngGyVf2p6cvg6tXO/OJ9qZzDEQpJH36hgX+o/r7ktGCHYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777390598; c=relaxed/simple;
	bh=DrNGeBlRxTjZoXBtwt3WHPiWKByZ7OZ+6oYAQENqEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dv2F5Eom4ibUem0WwBRe+GwmvwT6PqAGRd1YvLqbOvJ3zaY3GaquFaXCUxKz+6lAfYlJFArin4ltkiKJ9MJDx/QZOoaFNutB7lMYStaV4ilEwjd7RR4oJwA0TYDz9rvWYLIOytcFiE9nKQ3m7NTwbI/GnIUKUGONB1ZTArJtdvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDorovP1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDorovP1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso89022695e9.2
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 08:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777390595; x=1777995395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=mDorovP1vtG3qVNGAvuiZaUeQAB/SVLlSzcMis4/jv5E1v6ZmQEKzXd/38Kx+X4OYs
         A0qYPrp4+r7PrKFMDN4KxvC4cHUvrfUzCVUgENG9clBGm5ub5P4CQCiu0S7hTz2uN6HE
         FmY3DQDWGN+vuiW9PUQw02Ol3xY+488wudtXSHCDajTOkay7JXrbA2UbXHICQOKDLr0t
         ZTb5gVcKsIJVrRjTFrwn3pWt6YtTNhvqu1AJi0RR6NgDaazjr05zcyanvH7vWC1Y0u9s
         2u6ZxfpQ1HpsKjnQXM2+AttwLKgYXvOUPIj+GqYcAW31fVX9jWZb1ml8LpxiduwiA0Wk
         KuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777390595; x=1777995395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KFT7mMG9k0k/BXen8CQg8hnB8vdYe60xOPZB+uYBrVs=;
        b=XrDLw1bUH+MwHSCtiuP7pRKaJAGxrIdQEKRc/l5pjwZvTx6BjXQ2HktGQ1vs+fXRj6
         VPpis8bIGA7SfGz6Z0CQ6rLLU5fjcTGw46CkuE6kXh8f7vdsQt+y0EnPzifJgg78uTUf
         2MhQr/htjDZ7ZLQLJMs+zN1/Fq7InERL8+rB0nzUiXk/rimuJHe0aQKfhjDeqXODJRoK
         N5af25Cu4ms0TO/hA2qc+DDYr1i5tPHaLNrOUpXqruKjJLTMAfZojIPYINtTU+emt0uk
         qkB5tdWdLrgslpAKHGKo+pUhvBiNW6WQOLd++I6OCFrCUEdDnU1/KmdmEDnl4tjlftZ8
         klqg==
X-Forwarded-Encrypted: i=1; AFNElJ8NJvD/s5MjyyPYNo9XUnVFDxx1eh1j81w7A39d/MZaBoQlSuyqYXfs1jvMzPFgG3L5ogJgyfwFxTSq@vger.kernel.org
X-Gm-Message-State: AOJu0YyDFLxiwf8BlwTmZi3S+7wxUDeVLghVhPC+5JTjKg+AV1E8TzZ7
	gwjB74GadfgBxvfSMTbc/nH2SWTq71MO/zC8cBGj7RaWAEGmRspX4/ex
X-Gm-Gg: AeBDiev9UG1UOtNA8quH/pqd1aDMI9o3FEhNlxsmhGWWWD653yFu8YmlNFcncZGlaZ9
	gQepxyHZ+BeXtYIrxShlWaqhroSRwdP+zVH+mynQ5O1xBRiceh7LBJbEpokmLRJ9Xtd7nufav5d
	49swuxw+LZmQ2S3t75Ksl4Fy1GqZSqtyP302ez5ovgP3SWOIkJWoKDTYQYxJfiYvcxnwaaII+VD
	E3hGjtDqUfMo5eGRRoR0leE2dI6RRO+HgA1tMWCNggTxdvEm7qh/W42BSBZBMaOTei9SY7xmTMv
	hTqM3oZ5HI+y1IRVP7k09Jt5e4GSgblpuQ3t9hhCbwamOTVJ2jCPwpRq/lOV3+SKKp82IzHWYJT
	qcg3sG+4jw5pYtklj1Vxh18EnyrWLBShsQYIrNlbo/gMG8RxdQQmRzKko6jK4NoEFG1/se7lRT3
	Y2gkSUJOjipC9tsHG1CsmvDNU=
X-Received: by 2002:a05:600c:530f:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a77b298b3mr56286425e9.26.1777390594937;
        Tue, 28 Apr 2026 08:36:34 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b56c2d0sm1358875e9.11.2026.04.28.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:36:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v4 1/6 RESEND] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Tue, 28 Apr 2026 18:36:06 +0300
Message-ID: <20260428153611.142816-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260428153611.142816-1-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
 .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
deleted file mode 100644
index ebf7cdc7f70c..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Motorola CPCAP PMIC LEDs
-------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should be one of
-   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
-   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
-   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
-   * "motorola,cpcap-led-red"		(Red Triode)
-   * "motorola,cpcap-led-green"		(Green Triode)
-   * "motorola,cpcap-led-blue"		(Blue Triode)
-   * "motorola,cpcap-led-cf"		(Camera Flash)
-   * "motorola,cpcap-led-bt"		(Bluetooth)
-   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
-- label: see Documentation/devicetree/bindings/leds/common.txt
-- vdd-supply: A phandle to the regulator powering the LED
-
-Example:
-
-&cpcap {
-	cpcap_led_red: red-led {
-		compatible = "motorola,cpcap-led-red";
-		label = "cpcap:red";
-		vdd-supply = <&sw5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
new file mode 100644
index 000000000000..c8e7b88a05cc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC LEDs
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. LEDs are
+  represented as sub-nodes of the PMIC node on the device tree.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-led-adl # Display Lighting
+      - motorola,cpcap-led-blue # Blue Triode
+      - motorola,cpcap-led-bt # Bluetooth
+      - motorola,cpcap-led-cf # Camera Flash
+      - motorola,cpcap-led-cp # Camera Privacy LED
+      - motorola,cpcap-led-green # Green Triode
+      - motorola,cpcap-led-kl # Keyboard Lighting
+      - motorola,cpcap-led-mdl # Main Display Lighting
+      - motorola,cpcap-led-red # Red Triode
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - label
+  - vdd-supply
+
+unevaluatedProperties: false
+
+...
-- 
2.51.0

