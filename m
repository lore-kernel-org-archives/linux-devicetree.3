Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C98459AD2
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754376; cv=none; b=h87w+0IAflHAbr4Rr6l8bLdgRQn1KD19nizYk+Uv3cMMvsjy9EHMZd0+3apVRz/Jaeuwsn6l5ZGcs2USfJCewLA3XDWOY4P4ajwLPwRHsHgvG+lONtesofqTfPYO0IVtVYhjsgZYYVpZibZEh8vrS2lEwg/Tkpqfn27iT7xlqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754376; c=relaxed/simple;
	bh=KpdsnEaU0XUqgnIgultpJNes7Ph66Xh6nK+rdyFLGAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX0bmfKJNB7gfrKgPs2wyLD2gKM0GFgDVhuFq/+x8kJ5YC7D9cImeC3H0YaRcWDJqRywxpVreQfQTsPQXlVNxumlmxQcq16/cepyBHDSGGMEP05tLNfv7EHF9xcYcQojwDTYmB1glKm9mE/XCvdIZWwTgR5rWFRpdMFYhd9umGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAxyuYYS; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAxyuYYS"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887f690df6so3581767f8f.1
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790754371; x=1791359171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+41Kw8n5nZrYb5TW5ZIYPjdvMg9T8Nts+lEsUDThvXI=;
        b=JAxyuYYShVfSjGoOEGkayTQan24b4o2e2s8H5oIdE7DtGA5LFb+HXbp7K2GEUUWrW0
         TyH2ytNCPzOhxIuZlNbfqaiIPcRvoWNvfdQHwsJ3pYBAxxjruebAlWe5OBzIscZjcipt
         xF3QIb5KQT1P0zv5SejRFS5Pavvhep0ordf9PA0TZGnScHV1O7HHMyamW3LELhvUgI//
         eqmS/5oJ/Djp7jiTJSOiaQ7s5Hiu9CJBzbm7V7Qb07suweof0y2hEQTHN9DyqNKYhuro
         Pdj2o0dTWjRIAAQ99192+Xz2qNDHLhJ32W5lPN3RcZHD1EHV/jY+TvAgCPP6LTj3ZJLJ
         GaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790754371; x=1791359171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+41Kw8n5nZrYb5TW5ZIYPjdvMg9T8Nts+lEsUDThvXI=;
        b=JqFqcIk7SjdD2UDq1tzOCcaPKTYAjJGu1k/XZNJAlIjYjjOEhYlgGTYvKGouxacvNN
         qxgx8DYnE6e6j/ffBqo/MmjTbn2B8UZL+Acu6OOByuEP+CW1EwE1hGad3gTDDHBgOh74
         ZvX1iTtuF3Sg0rzFRo3QqEXJzq2W3wal5RuiU1TmpIJjKXCoa8XjXBTgaSTcBvn5mpNG
         WCbGLRD5q+KwngjRVPEIqXfQ8Xj+3M5GzF7u/yae0k0g0T71mJSn1IOaTbeD1ku9wAAR
         DuTWf0lp7knqpOQxmm4cIHea3rFYj7fMqot2KHZnEUL69A8/L3W3XOSF8+kimZD9kpIe
         Om2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz0PEyr9h7iS/npsVrz2+omTsRk3w/Ytuv5dp+648kMDQE2/UUPaismt8Et5sZhFlhVrRF609lh/gR/@vger.kernel.org
X-Gm-Message-State: AFq9FYJWcKPq2EUGrr7NBQ3u7YsC6n5zLm3gGmTtX9d6d0zIzKJRAsAz
	9h2ztLKMY7XvyMnBZ5mqV0ELMMqPngUUWB5SbfMb42yoVeeX7ZWNQGWE
X-Gm-Gg: AYBFou1OAuCceDSoTyWu5QBo+El3WshtTXLNabdp90vqoKi4inzDEta7Hq/tKABVxpt
	zlQRNpBffiUG145zOPr2zatIfULdR/ok8OWno6mBu6D911/EnK3of7t0jy5oJ18p6Ysp5jBGUWS
	+5ghMV/u2FEnmFxQlq3rDPk3guZGySGks085PxpPiKOQtqtEDRFn2KxxHzOzW8gf7aI4WpbhdZl
	/7NGgTPQmQzRQuVSML41upxGINe3PZEYVK+IFutnrISUmKdNl9RXD/sTKy6Ev+2mc3mu3gBCA+h
	/+Eey4jZ/tNjQY+EFm1HzUVtR4Rx8LrgDR3/N92nMJn76FRBCE14ufGWc1QnlbCpVqHLdrL7Q1m
	wgl9TGq2ViMShUyzy2LaXT0Gq6g7uVib8Fdu6xiMIFWg3cQDpDzz5rIJf4ea/vMAvweJJzAJMF9
	Kq0TnhfHFQaqyXs9vocrtb1PW1qt8rnCrsC+s4sskIc/Jnyd31H68mMOTVtOH+1QbbHj0owT+5y
	lXpJDLdHR855y0HkylmUDMBk+u0C6rX3Mld1uYhbD80JsCGIe3O+5e1
X-Received: by 2002:a05:6000:25c6:b0:48a:faf0:bdee with SMTP id ffacd0b85a97d-48b0252bc90mr1084385f8f.45.1790754371276;
        Wed, 30 Sep 2026 00:46:11 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0185asm1487480f8f.32.2026.09.30.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:46:10 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Wed, 30 Sep 2026 09:46:07 +0200
Message-ID: <20260930074608.479089-2-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930074608.479089-1-sander.speetjens@gmail.com>
References: <20260930074608.479089-1-sander.speetjens@gmail.com>
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
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
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
2.55.0

