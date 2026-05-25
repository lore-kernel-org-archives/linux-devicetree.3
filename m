Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BC3E025F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706315; cv=none; b=d20a60T6jqAQTIndebG8tjck5dcxzI9bWiOsuixvewEjP9NK5kTQI546cQ5u+pwrHFlp1E23/urfxaoDA8zvdP596uRtszqfWKVkroOhcLmGdp1fS9WGOdihycJ8ohf+095KGVX8P1FakrTbulSoli+AsboFpNyOOocVf32kd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706315; c=relaxed/simple;
	bh=EoAF4YHy3iYTq0qtbpAuxEpwDtw0CacTgV3exikXeKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IohkL0on5OoimVdqFRcEII87nVkbt05d72q8OR5pVn0r8dYqBGexITLJAylGCW57yw9OI5LDmYI9DZwAWg0phkw2kGQ2WwUR7u96/yRDodqV0kfx79DsDTam5Y71PfsCLNDK/a79Zu9MXQYT69krqQNI15rQgyhiPZ0HzTrsLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxJzXkQ5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxJzXkQ5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3664df30f53so5622752a91.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706313; x=1780311113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygX2OtS8jtfRsEiUpxVA4rgdEOhC6dRMuJ3m7A2/544=;
        b=HxJzXkQ5rxe5Rd4uWXWIjPaVgR8KxN2cTumIZeaZaned0FATuWmH5u1zHCv/QvRi5O
         5G9gQTUmxUuBHEAhqx0uuZbc2BPkyvgg3cGWkptYjBw2Z+5GW5oVlkTHxAeusqSCFxUL
         a1B9lNbgtdBjdN92/a1eo1L3szpdMoAMfg7Tdnkm7M5tFA/gOWbc5z0unohNAYgwKPVD
         UPg+lxO78OZGb5aeM926Dgu8tiis/9OE/UI9zYY5X2rvQGNwXGNS3tkJPwC5Nd4ogDgM
         CTpSnxobVtT/N/xgsQAh2igywtKiGIibsVaDPz6jSXeUbbcNlTnIrh8XCL1ztQE0hDe6
         eCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706313; x=1780311113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygX2OtS8jtfRsEiUpxVA4rgdEOhC6dRMuJ3m7A2/544=;
        b=Ga+vTuWAyzxq1mzZoauUEBodScsDUhMPaQqK5GE/c6KUxiZvDg+fAyBSszuhtRiKJ1
         Gqr7WNxEQ6yT2T55BpUqqvk2pR1JN9VQyNWwWLWbS8SYcUVg8038Q0OF0zzixBp1sRZQ
         kaZSGnbpifbRgSbUPDhh4uzIxDTalf/oOywj6l2jAXOfQ+tjX/sz45BONwh4PecRJ9X+
         fT87BpyAFMH3iGCZf+pksPMATBHYts/6NPYlFoau3wwng7emJjqiraUhcVXsKWMBBnle
         BjBjI89lDNb3p5WlNc4Plmxh+ZrP4wabDWwDtRqKRVYUNDodCRWpaRC7swcCUA7RMCnF
         Z18w==
X-Forwarded-Encrypted: i=1; AFNElJ/ae5w1qW5nrKy3S5WLQFP87VqedB0LEEUs3+0gMNsh3tSpbCK0vsGx+faHQiw8FtcmDnGwxIqojhv3@vger.kernel.org
X-Gm-Message-State: AOJu0YxFKT97bQFEIAKLGPPxYfQs55A+ULQ6j2A1l7XU4qRO1jTwuoy/
	ytGvfa0bBADkHqZrJnHNBd6OJ6BPwUzOilGUNYHuaE9DpbOx20Aexj5P
X-Gm-Gg: Acq92OFE1BpXpuHhdGbAuQJiu9FG8T9O+PkRCiAvRLDiN2pXVwyIR9IbrhxYZldcFPz
	dYAlPEbB6RfsO3hf9fNSCuo+/LNb2JvUnopev1tdrZoOl4HPFIASZi/UdoD5E2xKJSHcmaA3VS6
	jZVX00k4RHx8z/yBsnkAyMiucbyet4VAA1YWgJzjMI/89MSKRjUGesVzu6xUfbP7QtRWv6fHMVT
	IeZTBlCnzpjleEyY2fHUK1FhBIeDAjs3IegfiPhU04/pqCPDl2QEVV6Pm4MGJBEJpM1aSH2NsRW
	N4M3U/GDsaa/C2/8W+4pYoo/+B8m1hI2SpO87udtK+76Ch/ZXJqGtnorX4Df237c4/P137a99yP
	jEir6a1MhpdoPb6AHDIAPkHPRL02NC8tm8rO6shqlU18WC5xtVPZIMbRPr0F5UpCcEdKWVtPRMB
	uo7hDi6LoGmWiQ1g61Hu60oU9UC7jBgk11li/CPkDFKRawcuobPd5bcZb2G/UZf0mQ+l7KUg4tj
	xuAfwo/BQAIm40G6dir1BxfvYMaAtNR4VqlR5EnuQ==
X-Received: by 2002:a17:90a:dfce:b0:369:932a:2b6d with SMTP id 98e67ed59e1d1-36a67402bccmr11933827a91.6.1779706313343;
        Mon, 25 May 2026 03:51:53 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:51:51 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Mon, 25 May 2026 16:21:19 +0530
Message-ID: <20260525105127.180156-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional RATE pin GPIO used to select the HX711 output
data rate.

Update the example to show the property in use.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index 0baf620e9057..099235b5fd54 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -46,6 +46,13 @@ properties:
       one channel monitors the DVDD-AVDD difference for battery level
       detection.
 
+  rate-gpios:
+    description:
+      GPIO connected to the RATE pin. When driven low the output data
+      rate is 10 SPS; when driven high it is 80 SPS. If omitted the
+      RATE pin state is determined by the board wiring.
+    maxItems: 1
+
   clock-frequency:
     description:
       Controls the SCK bit-bang timing. The value is used to derive the
@@ -70,6 +77,7 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.43.0

