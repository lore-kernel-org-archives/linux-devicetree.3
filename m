Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA7B395AE9
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335637; cv=none; b=RSfMPrUl3hXPMI02qOqIDtFSrglYutKhaJSdQ3mUnIFOpgogtVMj8qt8hCeBI8BClmp2fw9H2pqLhUT83iDIpJmZjzEk/Gb9dk+xhG+huDcwZfChxlsWkjBFBDn520OchJEeM0gFQzeV73UGo0gBDUkCd4tFZQfHvGGSl+7+0Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335637; c=relaxed/simple;
	bh=291msLMDeIy082FQ37+n3NeDgGnlW1QFaOd6zHp884k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pLC6idEiF1yQfXNL7+qzOB5g11vLTXBFTuq/IFUzdVichoQZzXj1LNKY/YPsuZFqIzJQE40HbuvqZpenGylgjjxOAtvUOx3Q6ZYu4R4+M/GzklCBS5fTsnh5X9GQtH/WxsuoIuuXjtmXRAWJej2JdXXf0BhYrpbKkOzfsnESSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkkxlaHf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkkxlaHf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so11572675e9.1
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792335634; x=1792940434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=349qNNoByqVYF++DU+sob8mJAJG0TZ1Jpek+vaeVwCY=;
        b=AkkxlaHfW4LzsPxkKXypX+CfdZE0GD8jPmNGyYGNL77SFpbCzuTrAZc3QNuIDHbUfB
         G0otkiHf1az04xXgbw6tCB1/Qc8DElqKh4f/cb6Q8HhdKiwVqYx/cDQQ7g2yocZDaYOy
         D1+Ss2V5dngaG8OAf0d7fU+ATc/W2FVncQueISB8Hr4okuW8XCVhbCt/V8UqZCxIU/nZ
         u8bJU6oXK4qmG3DC5M9G3i0I+W7YfFz1+4zI72Hy0S4OzydCI7hNpKco1eN7Rngqvlkw
         g6kGu+E42OhnKhJX+LU89ampLTjo9U/Cv7OjZiVaktCu2kjAotK4Ch0Z1yRQdcUyvsIZ
         ZJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335634; x=1792940434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=349qNNoByqVYF++DU+sob8mJAJG0TZ1Jpek+vaeVwCY=;
        b=XPbk/U1x3QzKA3AXYMA9YWMjKJmDkPqKCGsOw43sjedA6uDP4ybOtSBfnShM/2q2F+
         y3OeobaqjUEhFAppg0T11BnAafMithd57Ap2PZu0LmvrH9PLHJ5gplNLP9oIpVT+LKdp
         plkm6MDGr4ke/n7wFkbDyoS/rI4rNQlDQwqgKxnjFahgTCqCe2t/MIPlJ/jLJaUjp0fD
         Tn/zjMKoYMHaJpbMizY8Et4H+8PVWWYaxno/LtrhnvzQlxCrmJcLolSpYvQZDVCElhN1
         /MTsblWmmM4OZoqRc26nDY6nYM7SXq1gdemgM1+j5fu8TaFDiDRfQbFXpojCpwqYK5Sb
         38hw==
X-Forwarded-Encrypted: i=1; AKwUvBz4aFw6byHOAu2bVt/XrTt+4XeTSHmdZuRlgsMGgf+dbgAQ+ksyQVBtXVy+mGjvJKpcJdaMtrPj55DM@vger.kernel.org
X-Gm-Message-State: AFq9FYL5xrBrnrMxtunBgBK0xZYIX1HIGIhbKMe3C/4cTpcPS9Qde30N
	MCl+al8GobDLYt7W4k/XAx/fSRh8Pq+7SSGHvDlTkWW20Y7zse/7QfHh
X-Gm-Gg: AYBFou3rOCXm5Ad8VVrzlxidNmDJwOGjDrF/8D520fchUfR0noUrgB6xifGvsSa1P9u
	bpp/jiVBh0iIJ0pEhJcKT1kLwwFeO1dxmoHHcNaS6CFBTxYp06rZenbs3T+2VwoqeNtZz3ymomm
	fsrxwHIpo6fl8fmSeq55Cfi34uFGAXSAdFK2Ewj4zkWxGuaSHq9GQU7rC9XOm+rnC4qQ/yM4IZd
	X6uSUX657MN7OujYqBIaLGIFEBRbNPy8uGmLNt+j2XFx9Uh6LuJsXAwtdapsU9B8ZqhX1v+WSmb
	ZjNb7Jbj4lIogd4uVb5qnagVozMLSBfFnWdpVy2t2cWSmly/9l3SpdSUSregE0IU3ly622gMoJT
	QR2n5boK9fJ8an/zq4gkuAI6P3uezT+K3sUWFN1mr6zM/xc4a0UpFklG9vRcMTFt7Zyah3mb+Ef
	v2Q+0pGNhgFNK9rqiAkIiP5uxH+X0fEiVApUJ7myRq04vJ90YetTkVI+a0H2IIxm+Ou05rR2ftA
	a94iFi42V6nHcqdW+wdhjj5gVhQG+lv9okPJ2bCIEAeI0auFU3/yAQA
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr115503175e9.13.1792335634123;
        Sun, 18 Oct 2026 08:00:34 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ad6245sm212868925e9.3.2026.10.18.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:00:33 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com,
	pbrobinson@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Sun, 18 Oct 2026 17:00:27 +0200
Message-ID: <20261018150028.1047172-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018150028.1047172-1-sander.speetjens@gmail.com>
References: <20261018150028.1047172-1-sander.speetjens@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 5 has a built-in RTC that can be battery-backed
via the VBAT pin. When a rechargeable coin cell is used, the
hardware requires a trickle-charge voltage to keep the battery
topped up.

Expose the trickle-voltage-millivolt DT property so the driver can
program the correct charge voltage for board specific configurations with
the attached battery.

The property is added to the existing raspberrypi,bcm2835-firmware
binding (rather than creating a new RTC node) because the RTC is
accessed exclusively through the firmware mailbox interface.
We only $ref the individual property from rtc.yaml and do not
reference the full schema, because the firmware node name does not
match the $nodename pattern required by rtc.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V12 -> V13: No changes

V12: https://lore.kernel.org/linux-rtc/20261018143712.1040152-1-sander.speetjens@gmail.com

 .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
index 983ea80eaec9..dc71fd57834e 100644
--- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
@@ -133,6 +133,11 @@ properties:
     required:
       - compatible
 
+  trickle-voltage-millivolt:
+    $ref: /schemas/rtc/rtc.yaml#/properties/trickle-voltage-millivolt
+    minimum: 1300
+    maximum: 5000
+
 required:
   - compatible
   - mboxes
@@ -144,6 +149,7 @@ examples:
     firmware {
         compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
         mboxes = <&mailbox>;
+        trickle-voltage-millivolt = <3300>;
 
         firmware_clocks: clocks {
             compatible = "raspberrypi,firmware-clocks";
-- 
2.56.0

