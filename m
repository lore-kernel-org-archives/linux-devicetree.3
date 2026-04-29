Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD3F33C1BD
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441559; cv=none; b=bs4YwcnP31YPZex2LxaY5hQlZ+hj7Ro824dmWLoK7l+QYOKONRGy3faWz0f6J92xQY9oFbMSiV83t6qbbV78C4zrOjDn9C3wYvyLla6G/DUKRnCfsbAeIP6khDTHK32eRIFT7yWrG2Fldy1QqyL3tfFRt//9Fe/nB7r0GZfvshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441559; c=relaxed/simple;
	bh=GGF3jyUqforepyERRKXlYZGTHXws9eodKpfONNX7jDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bie91Y/iKnpvayQJ0HB6b0+7qoo1pHXg26epzv4qKXkte1tHRFT3hqmU0p76JlxMQgdOH786s+VbqppP3p9/NJYYXUJSWE6NW1581gVluIzIk3i3EW2hrxWIU+Rgr+1miMvJNdfBZeo10TPjK4ChqavIyEHUi2urP20ff7EPbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpjVsjeO; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpjVsjeO"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so228942a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441556; x=1778046356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7hco1kjJGC/g/8N1qIFMmlsaaKm/pe8oI1boZvWXSc=;
        b=lpjVsjeOxzELV4T8c+fcI5WTbkVe25kzs9H7KfetunlqZntW9J0hJB71WnaZT/ettd
         INbbvSt6riqBQiAheiJ28b9YZneEIKbY9i84DnEdUM/rK5OVjeC6sFjYvl1yEYLzZfha
         EO74D7T+bbiqbGtA2xwb/kHG0GatBvRfxWM1VnAN9txaR57Xl+3wsMBua9d+Vx6yxViV
         OS3TjBmbNP8oLSwhZXZs4qGTq7+qBxQp7HUxzIxJ8AROsFNPK15CS4p8nnqRdThvuzuW
         8m0v+ZNotjRuXVnJRdABbjPkMzJAHvHVUPtKlt83IZYkquD82zVdSMHE6sRMRJD51LaV
         BUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441556; x=1778046356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o7hco1kjJGC/g/8N1qIFMmlsaaKm/pe8oI1boZvWXSc=;
        b=dC28yCbwGh1xNmMMwGpdOju68R+i7fV91dZY2es2ljZrgs3xV+62QudoiKjZGaQR93
         mNw4U6X7SmcyWjRu9OjWeBkyUWDSQzl9Mlfxhkwj/yDS+qZGeUmsMZk/5PaNXv74gWrZ
         eyUUiUzFxT1Lf436+dqT+xg5Pk9Khagx26Bz7+7+xVFVrLW1Uv92Yz6f1LsGJ6V4chkx
         zKp8HSHGROcgEMsnKpqbAWi8j4uSelmZRSW+VxgvWdrU0b+Ry5IncLKZqdHNOdcdZX/s
         TMEIz274TAFr+Y3EuJg3x5lI7cT3bBBu+meQoZaAr421+Lwd0OxgHmPIbH2gEWWjurJ6
         01Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8uRdVXyMgfiWzUr5vGRZCAH4rpVxnDFCVTnRkEo5f8H4yF2EkgQq/oLAlCr+yZ6FWxKxyyXUdV2BaY@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFH4+RtiLnRHa28YPeJqILquKGomZTdsyykJCm1GoIKOQEjlc
	sYsLZtl6v/AXc9bQPOulxo5xfNOQ0omL5cKQbYRzn9FYStZ1cNDc+xQ+C/0b5g==
X-Gm-Gg: AeBDiesYXc7H2g4jI22BAnDSQprG1pKMQ2NTlrI4gOdrqJqJqDa0BSph+nj7DXhkZpy
	FNJIyLaQVLpTpc7L7qoBA1qiW617kd0tv6apog5OfqQXai8VB03q2zuK1IueRRtwljepvoJX0Ro
	6uRF2oqzpRqDXjmRRPe+7MbMBrKAdJUqgbNU9UMFTc9kx0KlmNUU/WjvoTHrfwT98wmpEtNRYUf
	OHV+iK+8loPQ48gJeeBRjadt39y5HKQF28KPQzOPWwr6SSPNkxcUnUpgQYE4UBhwRJbnPNaPlcJ
	R70rBGYUd0YTxdLoT5AfG+bbKeYTwT6OoBoXLVrhrCynQ3iVD+hMxmXyfnsN9hmDEJI/nBXNjGh
	6Lc1gKo5Bk6uyqV2T01YTpT3/GmpaF4hX9hF/knYcFSKbQlj/GsHg4/3odb/A/VLQQ/z9VpSGxi
	abCNFQhzVwNkR8rhsNXYJ2rqLX88DLFpP2i5UdccFMOHrCcBZ40P/6yCxe1H0UUYwVGaEQPIma+
	SnqMmcYAg7q54oO64bqeLIgqMR4MKJFuL1vouipzGCQlMmcAA==
X-Received: by 2002:a17:903:2acc:b0:2b2:4fc1:f653 with SMTP id d9443c01a7336-2b98836a261mr15391085ad.3.1777441556448;
        Tue, 28 Apr 2026 22:45:56 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:45:55 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/11] dt-bindings: iio: adc: hx711: clean up existing binding text
Date: Wed, 29 Apr 2026 11:15:34 +0530
Message-ID: <20260429054544.123862-2-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rewrite the binding description and property text so it describes the
existing HX711 hardware behavior directly instead of documenting old
driver implementation details.

Also clarify that clock-frequency controls the SCK bit-bang timing.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- New patch split out of the old combined binding update during review.
- Limit this patch to cleanup of the existing HX711 binding text and the
  clock-frequency description.
Changes in v4:
- This cleanup was part of the old combined binding patch.
Changes in v3:
- Restore the example node name to weight and drop the repeated
  clock-frequency default wording in the old combined patch.
Changes in v2:
- Remove driver implementation details from the binding description and
  clarify clock-frequency as SCK bit-bang timing.
---
 .../bindings/iio/adc/avia-hx711.yaml          | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 9c57eb13f892..1ea60dff98d5 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -10,14 +10,9 @@ maintainers:
   - Andreas Klinger <ak@it-klinger.de>
 
 description: |
-  Bit-banging driver using two GPIOs:
-  - sck-gpio gives a clock to the sensor with 24 cycles for data retrieval
-    and up to 3 cycles for selection of the input channel and gain for the
-    next measurement
-  - dout-gpio is the sensor data the sensor responds to the clock
-
-  Specifications about the driver can be found at:
-  http://www.aviaic.com/ENProducts.aspx
+  The HX711 is a 24-bit ADC with selectable gain (32/64/128) and two
+  differential input channels. Channel A supports gain 64 and 128;
+  channel B supports gain 32.
 
 properties:
   compatible:
@@ -26,23 +21,23 @@ properties:
 
   sck-gpios:
     description:
-      Definition of the GPIO for the clock (output). In the datasheet it is
-      named PD_SCK
+      GPIO for the clock output (PD_SCK in the datasheet).
     maxItems: 1
 
   dout-gpios:
     description:
-      Definition of the GPIO for the data-out sent by the sensor in
-      response to the clock (input).
-      See Documentation/devicetree/bindings/gpio/gpio.txt for information
-      on how to specify a consumer gpio.
+      GPIO for the data output from the sensor (DOUT in the datasheet).
     maxItems: 1
 
   avdd-supply:
     description:
-      Definition of the regulator used as analog supply
+      Analog supply voltage (AVDD).
 
   clock-frequency:
+    description:
+      Controls the SCK bit-bang timing. The value is used to derive the
+      delay between SCK edges; keep the SCK high time below 60 us to
+      avoid triggering chip power-down mode.
     minimum: 20000
     maximum: 2500000
     default: 400000
-- 
2.43.0
