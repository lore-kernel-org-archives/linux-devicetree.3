Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40853E8C62
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 10:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778150858; cv=none; b=KTeZ7rThoYwPAqp2kQg2uKhhC0fs4uq3DLb+dQqBk0sYGPqW+jXBdzaWxd2KENdg3r3W9u+cEkMSLArn4YQvJqPAZeXOx0lLwpts7NfJThRwjfjcDvmYjEls2pDzwSjxZbVKbwgxnXQ7Dyy7CK9IKuoV+h/E9UJYylc4yoiaiaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778150858; c=relaxed/simple;
	bh=vsyg7SzQr/MhpQWX2R69i+dy06+2L6zetPs00hCeGyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oYdfboqVsh3cFP6XGtb+LXtIo4eWysOkF9cdxgEiKD1Pu2elmdKmXfePkV735WHQ88ievNtyZJOyS8N8q1Nn3NOYDlCP37vAKBUtd2LWCio1cX6X+h3sV4HCZAElnxLnivChfOXK991/uhBGBa71rOI3zyYyHVzjhhTFj0Avcpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=xRFvAfp+; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="xRFvAfp+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c156c4a9efso903662eec.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1778150856; x=1778755656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zaZMoEIQ1Jf5sIP1IUKKwF+M8lMdZJxB7U7Jjxi7VqM=;
        b=xRFvAfp+4vO4qu5nkwmyIIkNhlvaYg1Y+YVrFm0ulpLChQEA573HV3wLSKxiY2paJF
         kLqeiM57SzjmYf60voDecms3noZPOUnG72/wn/1fthGpLigv9nebrryuCbhrDAV2vnWK
         eZnlCfMPExFyA3vFnfwRm1cffXR4beniHi0PkRZzvwCFeQOTaw7KNucUHwc/RIs2Kpyb
         nGM3/8Lgai7Anrk1t8e8o3T9iTVv3jnhdP9FXEQCdaNibbx5fHC5ut+zUJmHnahTArKw
         wyK2R/rG7/LUzjj06t5uzOFZYHd8LvKU+X0uELsj+oGAFBMaGx9PYVgWRZTWOoXhSWkG
         ihLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778150856; x=1778755656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaZMoEIQ1Jf5sIP1IUKKwF+M8lMdZJxB7U7Jjxi7VqM=;
        b=eaaszZQ6O884Ptjl4nHMl2xbC4s556ERsFztJ+1GepyBQqMTcbEWen3uVaqpAV7XFt
         zuD7MtlNv92NUBZ3jF+h10KzIK9wzKc5Bf7EL7DZXo9R0WGXi4JvG1wgtIBHLURO8aQN
         X8QZzrHGV0Wvt4Za9x7a+G9gAVa3d66vLQnBaGKLL4faaEJgec2Rt8m4m4kgmEm0A8SU
         vt1IYxeu7J/03gnPJ2cI7dyrWTF9kHa/SM2pHvwak+kaH5/uSam17zNjISL7mxZtTXOx
         jYKpXo4JhtNEr4/ejsZrfXAE+UTPWamCjgf8G1KuyBvwwr0vKeQDv4oUrbQkP3xF0ARs
         MCGA==
X-Forwarded-Encrypted: i=1; AFNElJ+ogvARhd9G8IJMSxpDl6WFpyt4cRjwYaKOPllOJuAkE8qCeDXFq5Tfe6pGyl2joy/DFBMrwbvLzeii@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKsSQMH9mnHkOVoucvKvFheZdqK6Zm0vD5ipHfpod5UewLKDl
	RzAAXL29Izq7En8EQ8+aBwD3RFrqJf7SW51vFlPSyOGrKhm0P6riGBkp5HzwWxSfr9gtoIdtqa8
	JD2Ktpxc=
X-Gm-Gg: AeBDiesWAOPfva5Ea/KjvoqcS9oL3uImchf4Q+Fx0338zy/TPsEyNEdmrBt7Ml+thnz
	WiibRshOoPCRYag9jG5MZ1EYpbGoWlgkBoC0p7y+8tdJtUAzvfJeFWwykaXOb1swstHz7GRyHaK
	UGGDFa3QHqZgzXRlynrlCyzyXRDomV4v1Kc4xz8qrDWjSFhmqnlqZ0WQwClCvCJ6oroPEZHJo0c
	N8PBTkvFLQBx+sLHQQLSQ/BaXwBBsO/L9NsGylL7qfNVhirQzXozS1Kstx48vVU6c+6zhmLx90f
	3zwkVqKVmFJ7GEKd36WMJV55SLoUoCvuQ9PkWnC/S0lJo7w82QfExLsUsFiSozh9xfN+7e4ke9X
	BV/4pVdkEsJu/1HTOTEmrq5buiLhUd+boE7K+/4BepkV3W/0OQDvCTzxppbNvWtmMjMRheGpRrd
	iey8G0xfMcKjtLcNzIFMvChplbuQ8988ZELPLkx0+aNncoE+NFmFjSurOAew/5tgbWl+/lU/rk3
	3sySTQd2R9GaTy/bgYNZbikbHojaDth3ntNH9ruOj242uipvT8=
X-Received: by 2002:a05:7300:f191:b0:2c4:61be:1d33 with SMTP id 5a478bee46e88-2f54d69b008mr3592034eec.6.1778150855826;
        Thu, 07 May 2026 03:47:35 -0700 (PDT)
Received: from fedora (cpe-109-60-83-79.zg3.cable.xnet.hr. [109.60.83.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec5d8asm7040271eec.3.2026.05.07.03.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:47:35 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next 1/2] dt-bindings: net: pse-pd: microchip,pd692x0: add port disable GPIO
Date: Thu,  7 May 2026 12:46:54 +0200
Message-ID: <20260507104720.262641-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip PSE controllers have a dedicated port disable input that like it
name suggest, will disable PoE on all ports.

So, lets document that GPIO.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 .../devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
index 03d9ca1cbcc0..f883dca87bf9 100644
--- a/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
+++ b/Documentation/devicetree/bindings/net/pse-pd/microchip,pd692x0.yaml
@@ -23,6 +23,10 @@ properties:
   reg:
     maxItems: 1
 
+  disable-ports-gpios:
+    description: GPIO pin to disable PoE on all ports
+    maxItems: 1
+
   vdd-supply:
     description: Regulator that provides 3.3V VDD power supply.
 
-- 
2.54.0

