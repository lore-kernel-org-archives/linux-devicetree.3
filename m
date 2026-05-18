Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9D399365
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 22:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141771; cv=none; b=iUm5PFmk7dqI2kn/Udpphc9bjQaZCfid+pp5Z3LTz8hB2s2xkp7z00UA7E1x80i+JJ3nFqA+bpnSEsrvOksFAd1PULldVQQqX1LQywp4ep5CJzfj/N+u0fWQIQ+pmbQgfKqezMBKHWsGeQ9dtxc8V+El75rh/sorAYNlL0a8650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141771; c=relaxed/simple;
	bh=iOpsr7xBX7iZc/Y56TCDEse6CoQ7xoJPWO4TydbAp14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7xmTOWcNAInhxdDgdzp+9w/mjoghxl5s/ss36YnqzjHtlY6C5YqIjT4sap7pBiBgTaW5qOu01mcndMSvuORJ7Gb5LTkdj2KAICIzaaUpfkHtP5B04/Btc2RnM4yauNR3s7llWq6sC1UUQ997OpYXtPsgV2Y7kM2lsBJCs8wEgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ9jwT1V; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ9jwT1V"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-837dfccd950so1266348b3a.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779141770; x=1779746570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkqgpIclOI6u8+yfVZQ8lp/GgYb/zGUhAdnG940poqU=;
        b=fJ9jwT1VB+L2OHlUSP2Fd0qpob3QBM/vTE2FpoVMDdeu5GDvM1LoEMzMi6UVSn5ca/
         722oVlm2RdxWXf/mxVP0pYFlL8ee/WUqhu924s4R1o16KgAnIlu85qIXE6N1UD1yPxU0
         dgAR+xXO99HzjoMKOxXWBIYgQmuxi+V2oez9EECfPKiyRUL1QQ5SNc3bIyfLFG5oLxr/
         d68D2Bo721htJlQ9wE43qAmBdcjNXiONuUzJeNpNoedoQyl5mgH7p2dOismLrG//uMSq
         zLErwfIoI89Zy/pqqsHEGp0zQ9Z1gwed1q00sykvkb8SPCzeqxk2CkLE1HA+aZWu9Q7i
         V2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141770; x=1779746570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wkqgpIclOI6u8+yfVZQ8lp/GgYb/zGUhAdnG940poqU=;
        b=TUs5djgMFRrVjjlouLoZbmza1TZHHLGwYZOGgAcJaVuwnYhcI7NLC9NuQZBxQGBdm2
         zy/auLQgyri4pakFhdystidq3iB/DA1UR5a7MNhpNPSv/Q3JEv2YlHmWMgm8Pfa0CxgE
         K7vUYqnkNyBffpgOd1/TVHOPddNNe1v+Wyl+PNE3O3HQDPfQdM14ghD79HxNwpMIscu9
         rl1CIssE88EaXCUcfkn0/h0S62WYPPI62Rs3smibkmdGzZ9s08LXLB8P4g4v6QvOvO0O
         umvzQ7kKrfZvo03OBftSx+iYJ7MCu5cfjlXXqAkZIZR9a6I2Pk5nzk4ms5PvnA4bSTBz
         M9Nw==
X-Forwarded-Encrypted: i=1; AFNElJ9qXtPp1x/zefPyqf+ECPtDIC4Le6X07t4hd9qwbtwVBSR2I0xfYsX+jhBog638qjIq1Pu5F+bz9h6H@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8H8Ca75NR09WIWHmYRN9zwsK22/T+x+bUVS+h7vPoTFKu6aV
	1lYR6F9lX4v6rHPMQXkTGeOtHiWVLzes0E4iQ+FbybLKIS6pcb4rYxSf
X-Gm-Gg: Acq92OHHDRJ584cxjRZL6fjvcOOfkmKpB23ih/LDpRpfj0RjYjK7Z6DXp6eAV8393HK
	tJGKuuYXvuYVmJXDbUTGn5h4k4nTOgX4soKpr8vpVBUONe6jnA8UvQmUcTAtXhagFutVQn4qesG
	2ZUa7lJ4sOqp1G3PoJ1RYbDUAYYys0hnsbtqEO/M03MzhMLnAaG1P/+1wu1UxKOCP1vcusw+/4X
	IWXBHUk3IY4x45TlW60b9CJ7792O6UqZtySh8jc2/u3hMXAEsz0rQQR6XJr3jvbm7zZo4k+qRTI
	lxh11JtoD6VTjs7+CKmTmVsx86vuiyhi9cBUe0MNwA7sdt6lST9AdXxEP12Q5TOuJkBsxfRMBi+
	kO5YgeGHIWCC7NcJ9PCudl8FiHeZFvjUjb9dsmFuE8RVtS/ywsG1mjJRAsmik5EY1vP6tdedGhp
	SU5ZgCrW5bt4mxWBKgJJB91IB/uWGmLCGAmUlkxwvjquiW2stIEL86Wm6MfXhYKE4ZS65biuSoY
	JTQBaCyfCcIT6184Pn2EZkVI2w72VB5k3Ncvby4D+wNNzJCmgf2MQamlagOSWmbSq64Fqc=
X-Received: by 2002:a05:6a00:2295:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-83f33d547ccmr17483191b3a.39.1779141769584;
        Mon, 18 May 2026 15:02:49 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1977b128sm15772960b3a.22.2026.05.18.15.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:02:47 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Klinger <ak@it-klinger.de>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v9 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Tue, 19 May 2026 03:32:19 +0530
Message-ID: <20260518220228.63322-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518220228.63322-1-piyushpatle228@gmail.com>
References: <20260518220228.63322-1-piyushpatle228@gmail.com>
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
No change from v8. Already applied to iio.git testing branch.
 Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
index a8eaa1f18de5..9134bbe41379 100644
--- a/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/avia-hx711.yaml
@@ -37,6 +37,13 @@ properties:
     description:
       Supply voltage for the on-chip regulator (VSUP).
 
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
@@ -61,6 +68,7 @@ examples:
         compatible = "avia,hx711";
         sck-gpios = <&gpio3 10 GPIO_ACTIVE_HIGH>;
         dout-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
+        rate-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
         avdd-supply = <&avdd>;
         clock-frequency = <100000>;
     };
-- 
2.43.0

