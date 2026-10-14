Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005A3499F22
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966637; cv=none; b=XDjblFeitBfjP6IgYOA+OV9dtEnwKT5ZRC2HVyHgKUjQDPzlklWhIM3QdCEO1sSnOif0L/mm6onnozQY6/eEh018wee7RmyrRfs1Rr8ExI8ZhYftbDIBgS65mfns9kqg6aqDFSP5ke0kxJr1tLJG5jL0Fxjmer0H55uyf7Y2iHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966637; c=relaxed/simple;
	bh=OcahIjz+tK6zZ4B8IavL6oi9IaQ0giE4aDQYX8NwevY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAwwziSAFuf0EGrn4+zHKS7sltetSCTD3DiOQE3qzMaJ+bLSCxqTAGHVF8ZExpvEUCu9uKgEb4b4Nj4w3RnbiecEceFcExPdlgmIwovU59+MGYt7YeEly0rHXkAa7T6VF77z7cZHYaYWKTC3Re4Ookp3vRM3VYsQn5Y02O6sirc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8yYqTQ4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8yYqTQ4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so30090015e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 01:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791966634; x=1792571434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=;
        b=N8yYqTQ4I9N2IC38sWhuVc5ApIY/fiqWqhk7xTh05JtEJdZjbj4sPWeFbGAPmT4WK4
         14YKXXSGUIX9OIcQCd/c6Ypvs5y36wMmP6GvWExI6669u5vMsY5SewgEOr3nGi5jCsGP
         ZKX/6WPBNN8SOAuLXSi0DIq1tEZiDFbofUOKbVwlvdz+ZJqFl2djbyJqHeeSfQuXNQyH
         bcYkUXkWAmZroGJuoTOJ2a46Zoeu05gRAjBA/67er6T5yN28A0rzBh8tvApz18UXhBaH
         Qgk5nYqDKHUk+5MzPo+ybe5LP8iPeHaEx+y55ohtbCRdluV2gtCZGRNverSg//XlRXiH
         M1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966634; x=1792571434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4uyorJjU4yw9ZxRXCkaVYEh792OjjBS20MYURFIG1U=;
        b=GdHXI2wFacUiNK+dIq8NpqwOGSWSUWRdf4Ddzx0x7NITySsFjndnwJFkW4MNH1QP9E
         0ndUc9BhCQGLuLu7OiSQqXs6ErcKWNt35DL31dKkGE/Mh+EU71OteEqH/4Ws7Cqe9hPS
         Nd8kwihy3CGHPA/StOw72yCHnps7CyntBfoFjg9r7/3qKMPz1VX9z4DlDODk2RCA2fHa
         H+379Fh4X0UqIErjrjA0DAaS0H/aASndOMzLzyTORqUpn6BDAUVAyZJ8XcO1Togb03PJ
         j4c7GUi6+i1jKQg5pP+4WleVWv8/F7DLJ7YLpz+qNC4lfBTaoWabwafdvE2rkLXqc4oS
         +/rA==
X-Forwarded-Encrypted: i=1; AKwUvBz+1cCCm2QLCnTbLuf2YIq2utnMGP4ccG7mHfmyfNDrB1gwxucWXbvNzrItda6bO8jDhyNVzP2X20sg@vger.kernel.org
X-Gm-Message-State: AFq9FYLQU+CJf3gGlyxafmOSUUEp58t2wIpAbYHc5nwP4CppFc5W1H3/
	VQkaJxzv+T2yxuy9pg8skRpR7rEs4W7Vuu+V9Y0pf3su+c7NCFvpluGh
X-Gm-Gg: AYBFou2cA/AQ9uGdgzp3f44ikrbixHXKxWGahGINGfE98RkeyThDG3umxhWc0OiAEr6
	umKH78HXhjACKbYARMmm/5F6TDFHNAWU4oQuynMR0P5k3EUg5uSfCHxl8UlJ76jMcHG8QR4MjLA
	OnrR1ZCwEChxzXOlfP4XSP8RWXT+O+5oVhbR+Lur0l3nzxN/t8GVK0FMYrzoxuNNU5CZOuJNcUs
	HZdFWzWGouZB4PG26JFtgkX7wEa7dXX/83c10p850zdOnnaFs0JXC9VlMbULUQ53PHj4/BwfjQu
	DJhzIAdsbjeCH5hJZVDyVPCgWA8Ipl+3vpRvx6kxLYoztGU5Atcc7OI2mnZIa6PJFBgHKN0x/Km
	SsFtQpMM4aAsh6JLPUrfWSLyNmE8DxQRJyqWrA+zMmZWyhuS3lvTFigl6IN2EtrDhz2gqSoop9q
	wRQaHcXUmvBrOrpG/2gbXGMNilpczUhmlUVkJXoS+T92U/isscm7BzVfCGB7t2lFNuhzfHNl3+f
	AKrdprHg7wbkDKiWZ12fPD4VzhwvsoIlqD6YPF2Lr0H8g==
X-Received: by 2002:a05:600c:1e0f:b0:4a0:1f51:ba2d with SMTP id 5b1f17b1804b1-4a18e4adcbamr292830765e9.22.1791966634221;
        Wed, 14 Oct 2026 01:30:34 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c198134sm431809745e9.15.2026.10.14.01.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:33 -0700 (PDT)
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
Subject: [PATCH v11 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 14 Oct 2026 10:30:15 +0200
Message-ID: <20261014083016.332338-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014083016.332338-1-sander.speetjens@gmail.com>
References: <20261014083016.332338-1-sander.speetjens@gmail.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
V10 -> V11: No changes

V9 -> V10: No changes

V8 -> V9: No changes

V7 -> V8: No changes

V6 -> V7: No changes

V5 -> V6: No changes

V4 -> V5: As discussed with Conor Dooley, the reff to uint32 is removed
and a PR is made on dt-schema adding millivolt to property-units.yaml

V3 -> V4: Add a reff to uint32

V2 -> V3: Fixed the firmware property naming

V1 -> V2: As discussed with Krzysztof Kozlowski, this property is folded into
the existing raspberrypi,bcm2835-firmware properties.

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

