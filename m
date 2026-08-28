Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E48275870
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923279; cv=none; b=qVGCselzLJGJEosITerjCv7Bym94v48h8BX0AwCzFrhgiB+6XmPJ2H/nd3foUyH8QTPjn0esiKuVXEJX5Uphc3ZlZdzp6m+PQUPSAsx4B5XQFoHZiJolqeYJuLmkOipa+JIst+FHKrGdYvVyhJJoQnsAlFQKcuK/ImdRaigUQPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923279; c=relaxed/simple;
	bh=+QD66ohnt4455myiMUe0r3VX+Y06LKc4EFoNUQ4895w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KccqdWvbwGSecVdrm850bmSpyqFhlhtVcQ4MuiYJKyhk4lsCvwmDTOj5qPY3YodyGt8kXpJIAXHz0K/GR/upknP6vL7MLRjD+r1ptgMPMATAoJu9MeAKy9fqrIYuVQ4F5vVU8F1dOj0RGAgxZQKLiPt7kaZ2Is3rkKZiv3J1jkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Piu+G5eo; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Piu+G5eo"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47fe89fb333so596176f8f.3
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923275; x=1788528075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=Piu+G5eo3IMV7Z7UYX4bDR+4m2xxiXktXBtcmroZkTq+bgzpqlqmtgD8SOJb3K5UBD
         C1/PROj0ylfLYDBMqfPX0JkQiXlOSpCBxe04B+4381DOReKIX13YHM6xDEUUQgKDy5ss
         gseBfYahYdkMK/+Mj3LXAzuKYbq/c51rIik/ZY89uOyhs/j1yG9AENQ8A8+SWLBY6b8h
         iNleWGEgDoLRUgdAr+oMbrbPHePPuj14nPHqQtR6BgBqdhRIrvDfpF+qz+myBUkyYi3u
         j38oEDBaY0uAurVMmRQJ7j+W5IuC5SX8/KmYMn1d+5h4Q+4q+d9NDha7Jdy+IfLQa+eg
         oOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923275; x=1788528075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNWYppkVSiPppKcj5pQcAVUYrxOSKsES5k6fcIP4yAE=;
        b=g0hE38Z9OuWt5JwcxHVoqDCpg1QgM/gdDsBVfaVU6py3iKB9zXKLUP4XB+Dc5Z0H9u
         YghTDJteZjOKIw6+SdHPXspd9VBEHlFVwsIEN2FwJ/90RojnA4AcOcvLhpYj0ICXL5Tj
         Y9pLMXz1gCZTfNkQ0vlnVeGgN5V+qkizy1/ztwXQrT7fId5ZaHeO4buNPRH+7qTrPgYq
         KnAvKjcqtiCRnfcAOb8xiUWWVym5+8Ky11kEN4OgAj/A6dhGoGD/MQ1ss+tZhZMThHf8
         qNXJGC8pDR69xZ/KAk8tGoz6CQBhQqp7i5QYntFNcbySB++UCNZS0lyxe2RD1sUOgsdY
         Q61g==
X-Forwarded-Encrypted: i=1; AHgh+RoQ16P7Vx4qYEFVcWXJwPxvp6iPbzCWCZL6R7zA6b0vQ1/LJPrnQVIlw0fZ/aKltnLSpbhFAfWjar8s@vger.kernel.org
X-Gm-Message-State: AFuF++n09R6wOGapFqY9IDMRzIId5X2zaGtwHN8o7+RGC1UuiAHJTdp4
	kXn4v1qSRRu4wfBOxik3/cLRc5JzFo2YIFKXbskXTtt4GqXOh4Mj8Nni
X-Gm-Gg: AR+sD12Mtd85kefG7+u38JcQTAfowwO6bIrVlhGwYU896ebPydpohxpHYMWpkjV5okN
	exaUSdgk613YAvlg9qtdbqs6MC9q0noKL94ldUD4QRcCRThaLGEyc72OZ9hnUqk7/SiUtnPN2dT
	WMiV148QuvKU2LVhfQbYxf22O8IVUQElwLBF6pdRxRL1byXqZN7Dxx72boB7BCYBQs4WLmvLRIT
	JMJuVcxZ4KYxb+QfgrynuJAgvmko2PocEq852oWKKFxaXSKbo3nlqdxfn+4gqYzvhnhF7C/SClX
	qmSzDeUraV35iWh9UOGpy9g4z00608D7VZNpUa2QuLpdrn2F7QwE3t5g69nhyym3egPk58z6c0x
	VMCphfukWEVrCOC1SJLUj1SW75JOS7CwRqiYeL1f9/ZAhRODxTw10NHYl+X0GSensylxGKwPCZj
	+LWoXkQajHiyJ3hmU90ha/g2GfKRo9XsvKDlQYuSAr72DQMi0lkVAbt4lIZkdhL1+JG9lEEhkq6
	sfvSE08KVx6wrelWimR5vHrfU2TemEMeYOINZEbKUUcX62/TLE4MyOZBpwq7MiyhlgJ8Y8xU1FN
	CP7PoR3rOG8oxS83fgQ6SXGmYQ==
X-Received: by 2002:a05:6000:310a:b0:482:c0bd:42a9 with SMTP id ffacd0b85a97d-482f7992da1mr8545056f8f.6.1787923275496;
        Fri, 28 Aug 2026 06:21:15 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac526dsm3997335f8f.12.2026.08.28.06.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:21:14 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Robert Bozik <robertbozik@gmail.com>
Subject: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:21:04 +0200
Message-ID: <20260828132104.21473-4-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828132104.21473-1-robertbozik@gmail.com>
References: <20260828132104.21473-1-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sensor configuration for the OV32C4, matching the _HID the
sensor enumerates with. Without this entry the bridge does not build a
software node graph for the sensor, so its driver defers probing on the
missing fwnode endpoint forever and the camera never binds.

Assisted-by: Claude:claude-opus-5 sparse
Assisted-by: Claude:claude-fable-5 sparse
Signed-off-by: Robert Bozik <robertbozik@gmail.com>
---
Changes in v2:
- Signed-off-by placed last in the trailer block (Krzysztof Kozlowski).
- No other changes.

 drivers/media/pci/intel/ipu-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98..7d3c7e09f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,16 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/*
+	 * OmniVision OV32C4.
+	 *
+	 * 400 MHz link frequency, i.e. 800 Mbps per lane. There is no public
+	 * datasheet; the value comes from the vendor Windows driver, which
+	 * carries it as MipiBps, and it is confirmed on hardware: the IPU7
+	 * D-PHY locks and the sensor streams 3264x1840 at a measured
+	 * 30.00 fps, matching pixel_rate / (ppl * vts) exactly.
+	 */
+	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

