Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA9A4A68BC
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883435; cv=none; b=VKsDXOd/NirMfQODYWlxatjEuHBYsZXBnoThTUVcHD91fQ3uPvdYwYaTt3X5KHMXIHTRkEfbQWIX6WWSlXDsFU/f8mKm1jgsMtZT3htTE2IKILbWknRtsfxgSh0omSD24eMIwEeQRa94nHxF71jgsjJTqhDU1RVpabVovtqPWZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883435; c=relaxed/simple;
	bh=23fUV5uH8hymR3s4fLHnOR2V+sJXZxj9F6roRd4iV08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBrqCbFNhUci+gl7cW0FL5RqaU26xsASjBK2/EUk3H7gybe1r2k6CPJuqu1b3/TFPzllCo9pK1ZITFqEr2anKQ9esaQ99yDYTPy87FbyAjYRwY9Rn1/kWATuT0O8B46MYLY5WKKXAc+buDnL9/ux7QzEOulWClf+ScW6SYs+SCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QshqXNRn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QshqXNRn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so38188565e9.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790883429; x=1791488229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGElhAW7KvUaLn/kwKuU16ekRrncolXMHKfCx7Xylfo=;
        b=QshqXNRnIO7r7QXS8pg3WJES4jrFq7rWmHpU2xniqyFvka/N55+pAHd2DPJf6IBYio
         2P5EfTCUjbBXy52+tgVxCaquoVeBteX7arh75X5VF8pQSprz8rmkkUZCLMDrTs7ef2jV
         T/3W/ShBB39taT2WKhdYjA+u13qXahuLACKC9hArvY4CsGyKxsTeNjNdPQshjEeAec3C
         kiEaFmKtVP4k/5ZrU1x0BH7OO0zNzGvePP9v2xHahKuMGP7S9du00JU1kw5hy751e5th
         cCO76If54ZBL2uB4bWKlJ6g7+tq9BBHt0jOD1u2HeNBAbbqywI5j6OYSkJjFz0erL4+1
         3CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883429; x=1791488229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGElhAW7KvUaLn/kwKuU16ekRrncolXMHKfCx7Xylfo=;
        b=h44Dcb+xEcw/XgPqZMdQnojhsQ1iIuAkzz7AfOfg0J8mbcZVlYdp/T/fasvQ3GHmAV
         0ykmIbjdDNUh+kSxSwwUVyT6c293VX2y1sjSJ32Ga832Kg4QbacXGAGa7v/MVCeibrsY
         3FmSZib3mXJ3o6JKapT6cGT2cvOs+kri95h7gqYlzjRLpQUf0VFB8cSgkeADrQQoVdQX
         zeTSSDlN8ESfH8LfOhB3RwD4GPCRWg9n0VxTRiMUZM67K/oZLAMc7aV50oKnBXdJkn7M
         rTiemS4RXwzfdL8gFsD1g0vYWeZURJqRsJpqeP9jkgXFhtBR4VAmV6jn+2kI5nNUHu8H
         OaYA==
X-Forwarded-Encrypted: i=1; AKwUvBzjA/iIWdZsmDVImpClF/tCwUwVeSpG+A58y4gmNf2nkLDxDdusgCAV0mPE9RFAlTPO3apbQZAtE6Ih@vger.kernel.org
X-Gm-Message-State: AFuF++lRJrY3KXFv34zAbK7g86BS/iG/blFs/Nzvkqc4XEYaNUrrj3Zo
	di7f5cVvX/R7AWyO4Lo/8KCRWkrXfigwaN3gqrEtK3zRkHUGCAam18GG
X-Gm-Gg: AYBFou3AmE1BzuPSrWUdDNkPYFJKEf0naOR0Jjj7Urgdw64WFcYlGPDH2BtL7GPoKgi
	96a7Ew9wdSOg1UHJEXfbpZ2cT36izhX5KOSfmx7mXXh9OF1SmTf5xSt+8GknAcuixIyW4/3Y+bL
	ipvQzzLarLR1/WSlD0hbq0ubwH1fauc+AIrwz94DmiU889KU2Ni4xi43KhEdMreMLB611Iyifbo
	S8tQNnIqm3DhW08VCG8BX1O+sjaChABVYWTtkNyWbM2be2b+7zaPbohBZksJDzsXeb/LAVTSXiv
	Mgf7oTjyXFpCfYkg2meAbeKfRVghMkmPiPn8TM/jpZN3tFEJ8Lq/6B1rT5iwIb1Nvdd7YVIQET1
	iFgDjbrCNySMnF+TpfCY6nQ37lF58sdI1ziP0UIoU+21OppUcubgNn45Hs9tX4JkC3vaIoyaCW+
	mJwyaMnbNhNPI7byRf0pQRm4zKwsIUo/yP7Kxf0h4aJiopfe+DaNIzIaOv+Sj1WQxgYl4InEdVb
	rZXItqCVsOWJbwg/aH3N3Tv0Wi3qOLwSTieYSeWkHulkA==
X-Received: by 2002:a05:600c:1d09:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0276ed19amr10432355e9.29.1790883429210;
        Thu, 01 Oct 2026 12:37:09 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm12312315e9.6.2026.10.01.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:37:08 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 2/3] dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
Date: Thu,  1 Oct 2026 21:37:02 +0200
Message-ID: <20261001193703.734323-3-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001193703.734323-1-sander.speetjens@gmail.com>
References: <20261001193703.734323-1-sander.speetjens@gmail.com>
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
2.55.0

