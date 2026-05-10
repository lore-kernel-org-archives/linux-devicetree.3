Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5632BF5D
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442655; cv=none; b=jwd+Zu+ucXVkc5O8l2cOS2gbu9LAmC9zQBXTJvkk9j7kugCpbOkfGYryqN7a+4ZdJNaUY8pi1c/PB+/oYxmRhu+yMcTqAoVWbMRhCyWFcoO/G4njgy5EEy1vlo7pMX2HdrGb84ALUbqeqn98me345I8JK+iJYtkooIdi5r6tlSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442655; c=relaxed/simple;
	bh=we1AKANq/NREsS4tweY9WCb0aVw3YLaZgCYIUAl/3R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvbBKDq9kCBh9VP+KPrgUs7JQPvjAiMiyXvtRjw5+8lzf2CBq+0ppEibuXL9aA+UIxWea9np4oMIfDUa8cF2LewIZ9CPpImEIBnV9/Vbh5RXUFd4mQICOnjmV5X7Xlp+gM2VRjhs9i2bHGoKlERdDrzFbZSZzdOW38dAFnwPfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pMbOCS6e; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMbOCS6e"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b4583f0a1aso22298865ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442654; x=1779047454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC6iaLaMepNHbep9t8aKdIuhjAiXuoDAQZC7jBmjFtc=;
        b=pMbOCS6eUUQ60mrUQO344U7qWZ1rDBxtw68sOellFHwSOk+7yDnsRJy6fXe635UGsS
         PuQ7J4GPbEoEvQr1OdZwtivQBM7NFbXsr8tdsaAjR4O+yMt/Bo4XvYCDdZfCt40145uM
         BsVpf/CTMRXTmujGw2BxbSYmG7lVqWhZMiDNJsy0gUdn0TD9mrH9mhP+XligeoKxG2mF
         JKNUh6T+3RXlYgTKhZ1HKrh6owaFKV3Lkt2nd47q9mTGJfEy5yHfx/1+k/Wz82wcXP3h
         HhscFHhaf276qvAYyOb+y9RfnYaMprR+XUUUbzLgUjMSiUGcWAfI1KuqgdBjD7NF08B/
         MjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442654; x=1779047454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FC6iaLaMepNHbep9t8aKdIuhjAiXuoDAQZC7jBmjFtc=;
        b=KBWERxatBMiNt2eZXA7naZrQWip0i3ty69Hs8hsAFdXhNWlJAxXvPdh+iTddEdeq3Y
         hn+Lo9tZBCU1hLQ+BVp2yc2ku5yiNwsNFScvV5Hw9H0lMiGAcnC07IgUlDCxs4xPRuhH
         yB2Ka0MDX9t4BFFT0Sc2bF06p82LWYVowlK+WVgLEbPxwI4b8QQl7zzc0rG+FFwbNda0
         gtUHOOXswchDVqFYEiIOYxmnNLTt2hWjD2tk1HUVNS32HdSuvp7+Rh+1AKfRCps/A5Fo
         SPNkdCwaSY1V0WK1b3L3PblS1ZpmEk4V2ctMHbMd30Ytw83M8EwXxBS+97duywQH92Qy
         7uIA==
X-Forwarded-Encrypted: i=1; AFNElJ/XqMSX2F71PX08wCsoZrzJLiUd+ocMxGGO9ZAhSHkQGf74nsOdAVsIy33D3NflczLumG1LX14roG54@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0jf3ts+10LzjG6Lh0e24zfFlfv7CNNOMfBaqUvQdnt6P+yVs
	BSsfxzDDsc7tVX0E44/S4B1JbJydJ4l3eQxJIPV/dSzsfuLAbF5d09A1
X-Gm-Gg: Acq92OH43/OMUs9ci7w7CWY+Fb7AyW0OW2IlkL+TiupIdmJcAT2OYDHSwr3OkFSNNlC
	B3PYWLk/iWieBKpUVFr1Rrw1/p05vtUhvlOEOxWgiHKIBLyUiMv02z9evH/Ig7eWLZ8U6qPHx9o
	zEq+QuY7+gH6f1j4x5KDN62roH4QB6DFBgTLgMKSl3HdMuvgZKr+hc0SSdsiPoigd3mcZuPjH53
	ItHvL8aHC1vSQbuecnFBy061eV8xigUeAh9RGZXfh4ag9dRNjcvLNHF5D7Xv3rGjfmmdGxjuJOA
	3TLJX9NDHwhZX+y2JMTuePpodr2IfLEmGehGDPRPyjQTFT+JL0A8/Zv3tGQwtj8L1ioG0P9sBMC
	9b0Dnj+EUCKG81J82ku2i0pw3gg3ed7eEn6c7nEH2joYH5MgapWsQD0l0AWiid5sfclDEDyHI9D
	KwAoDUm9QY36aAV0Z6NxY4hGqOby7rBSW3XQtDxsLlyIsAcGy03o/8yGH1hweDd3KH+Ldv/m/xQ
	BEv6qRN06+z4hGN9qh23wJwJRfd9XLuq4wEgev7NwKUEG32w4vmOZw/qVkR
X-Received: by 2002:a17:903:32ca:b0:2ba:1756:aea7 with SMTP id d9443c01a7336-2bc7a990937mr69806415ad.2.1778442653564;
        Sun, 10 May 2026 12:50:53 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:50:52 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Mon, 11 May 2026 01:19:25 +0530
Message-ID: <20260510194947.31997-4-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
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
---
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

