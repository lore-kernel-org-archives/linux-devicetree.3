Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4ED38F655
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775211328; cv=none; b=urE6CwfxekfM3tn6LzGbCSjKTOQ5ZgFy7evylHsHIF8j6aFOolN45W896ujaST1oPP/O41oTrF9CSxNzytrBmDSAH5Ek6Nh5lig7G3ylmCXflztX2DAod3Fva0znWoea3IRK5wzQ44IfFN5I1sN1gTEo+FVbRlErjfIzKYpBd7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775211328; c=relaxed/simple;
	bh=IpM5hFB+kdNbV7lli0k0M4KR3AimfZZxqbKqhSv0u4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ataBt1uR470JP5oM3pLxA9sKz4K5mMoVj1FKdzoFjGiLapxaWm3+Tf4oqa+xsr2O5kXRMsJ3Dd2p2FpnWVr4MPcxojTeUFh48+OsNoywipC52eBvO0me+EnDCII3JUjzw3RkhW/g4eh2S+nuCCEwE33JUkAOwCYKCuDVXx6zNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hk57mXo9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hk57mXo9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad21f437eeso10065115ad.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775211323; x=1775816123; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h21ovezJUJbbP7dsEh1vhqxhJxf8p0z1BeveGGiIaz0=;
        b=hk57mXo9IK/VQR+9l0hIBRrefOOp6LEgnSlt4VAWt4KsXq/u1UYYj8TcmiXYroGMA4
         56ORcORf4NkFWXOHp1P1wRO6kwDQzBbRmXWiCMqB4m/HBZh77NiXsJMk5e+vFONt26IW
         kFJHc5rdmSWDgwuHwcySA9hLLSVcc+sLSofQtmAiMw+Yyu1kgPvucyyyht8MmmsWaY+V
         DXjhAZ1VR/BIKZFpZeuw2Crgn/ljNh1aK3b9gUbAij1en1I6Cg0pZszi7s0wWzgxm+mq
         gKmDUvW3bAcGO5YaGEBESdvhBqDfoUI3OYokBrSX97WfTfWGgJLAZRz5OsXztFAFf4Lx
         M3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775211323; x=1775816123;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h21ovezJUJbbP7dsEh1vhqxhJxf8p0z1BeveGGiIaz0=;
        b=NLIZwu/7zkQdn/vCTwio51sFzNlIE8mvOCTxQGCsqQeS5wZRyukgxP5KoSuE+DuOVE
         +STs5qWmGVpKVCw613fuvoGtTBAr6hO27VhT/y3te0GzenuomrT2ghHmUYh/OszTvbIv
         gqBPHaSrtlQiIsBzVXvIAFoBcJzzTK87BQZnT57iNvBCWQKGC+KEJOuXvyK9QGvGoiEk
         2FTjzjG2b0KxihSJFINhxz8PDRG7FIJLlqtQyce4xbdop3Ns5AxViGi7plhJf5pMS/vI
         5p2+IVgIzYjlKn6xc54WNIkoPkei0hSVJfnU7qrJR/0f+YzubVXXA9ZqVI9E7M42JzEZ
         9b+w==
X-Forwarded-Encrypted: i=1; AJvYcCUjIkyQHE3OxIX1bXj1p5QmKLzqG4z5g/f4JP37YNWG5L0138C6FFe6XzvR64fncoQVXPto9bNhx1Sj@vger.kernel.org
X-Gm-Message-State: AOJu0YyanC1IJjV7rx9wk0p6AbI/ZUeW9mXt2nIxrTBbAEFjUb22AU2g
	kFauK/6dPi1AK0L9tzFGuyitqCwcAcyeLkeQYQxk1dekShjIXwMUjC8ySrCzYU6qKjQ=
X-Gm-Gg: AeBDievgTcJCoaoC2G5FHWFycGqfTir066WR9IRhEQUEpZeWacNd7tJqXTPfn1lnVgt
	LG3irG7ekItWRqKzSIOlihkTOMMt1C/B0L2g4v1x/og1A9n1UQ1aSBBjmtBvwf0UCwLgWZkzdis
	jp38TKUi189HIaei2Mn6kU6shv8HqjlsIpwOx14+tWp7CSKhdoE8zT/sx+6l3mPbuQeryQ3oEIW
	CX7dlGyAtIEI/+SHPt4LAFlIw995I6kRVAUZoWii2DFdSFLjo12oac0gW+IVcqfJbywq2x8krs7
	BuKT+h7bH9w89nVMMFPays7T2CyCXKdAiqbALV5USDk21g19JCUsSCupKbP0lD1/Op9ZIySx4NF
	wcTmK8hboS5TIIo96yn7twhGKr1PyfLzLhoPF2D4cJZXX8B0yqJVLZlanWmYIWNCp3zZILo+Dge
	YUsoF/EFc+yUP2CuMlTZG6VMHNr4fdGdMvvDcAeO3z4wHHRDuqT+GC
X-Received: by 2002:a17:902:d2ca:b0:2b0:b557:6fe5 with SMTP id d9443c01a7336-2b277e88764mr51371725ad.30.1775211323213;
        Fri, 03 Apr 2026 03:15:23 -0700 (PDT)
Received: from ubuntu.localdomain ([27.217.83.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2747341a8sm54383675ad.3.2026.04.03.03.15.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Apr 2026 03:15:22 -0700 (PDT)
From: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
To: linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zaixiang.xu.dev@gmail.com
Subject: [PATCH v5 2/3] dt-bindings: trivial-devices: add Sensirion SHT3x/STS3x and GXCAS GXHT30
Date: Fri,  3 Apr 2026 18:14:55 +0800
Message-Id: <1775211296-63722-3-git-send-email-zaixiang.xu.dev@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1775211296-63722-1-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

The Sensirion SHT3x/STS3x series (and its compatible alternative, the
GXCAS GXHT30) are simple I2C temperature and humidity sensors. They
require no external resources other than the I2C bus and power supply,
fitting perfectly into the trivial-devices category.

Historically, the driver matched against the "sht3x" wildcard compatible
string. However, as pointed out by DT maintainers, wildcards are heavily
discouraged in new bindings, and specific part numbers representing real
devices should be used instead.

Therefore, document the explicit chip names (sht30, sht31, sht35, sht85,
sts30, sts31) along with the fully compatible gxht30 in
trivial-devices.yaml. Note that sht85 is already supported in the driver
but was missing from the bindings.

Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a482aeadcd44..e6efabfb1b14 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -125,6 +125,8 @@ properties:
           - fsl,mma8450
             # MPR121: Proximity Capacitive Touch Sensor Controller
           - fsl,mpr121
+            # GXCAS temperature & humidity sensor with I2C interface
+          - gxcas,gxht30
             # HiTRON AC/DC CompactPCI Power Supply
           - hitron,hac300s
             # Honeywell Humidicon HIH-6130 humidity/temperature sensor
@@ -399,7 +401,14 @@ properties:
           - sensirion,sht20
           - sensirion,sht21
           - sensirion,sht25
+          - sensirion,sht30
+          - sensirion,sht31
+          - sensirion,sht35
           - sensirion,sht4x
+          - sensirion,sht85
+            # Sensirion temperature sensor with I2C interface
+          - sensirion,sts30
+          - sensirion,sts31
             # Sensortek 3 axis accelerometer
           - sensortek,stk8312
             # Sensortek 3 axis accelerometer
-- 
2.34.1

