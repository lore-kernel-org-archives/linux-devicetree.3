Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742809;
	b=oBhA0vzNSSWYWyF0JP1fBHf/IWxhy+Ou3ihSUVSH8bCCNFb7A38Ime67PS188VLDneDb
	 NOKChDMCCF5Ay/31TxurNZG//tgaP+M2d+dGgrohaI0jhl0hbNa8Bf0IEiV/wBGfWdLzC
	 sQFJGoCb/ANDIFsZRCk6U3pCsXootGuujWasLz2mNcyoucswNBRV1jH3EA9gk2u/51f0e
	 SajFK2GjgduKU3WCgn1D78tQmcmFMvVJjQjC5ZyH3JmB00Wr5P0oXC4e5qt67BTDJtuJ0
	 GLG1egO/znpguOXdxtgRTl2jnN1j7iWzXAJn/XQXR58BiY6ij2AzzVnIiISZ85ujO9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
	b=x6XUNz3pigurujXXrUfJthaA5xEnwTyAZneo4FOujTNhWMJS4sLd++cXm+6p/FrFq+ub
	 50gVc/GmQqZfcpyUkR4zzvArTYUsyHnPhPMQkwG7ePoK6rVzHJtgiqI6HGJIL4gtzK5yn
	 twq48HX5OApf3CSgXl4GAB7KiJNOZz5CRyJza7Ss6EKH9WTOVjI91+txbTJnbnvDQXzv4
	 IuQow6JB1HKPzDhX5q04ikeUS3IuQhHX53MiCCfv3sy3ThmIMYdPqWe+LWxMYMdmHxFn5
	 sH7i6T+olLHw7rAjffl9Np2pN0Bkn1E/+HtImeQUrFocPE4uLC3lbeYjTiDg99xjRQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktp6R8QK;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F9606A321
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 01:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2F9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ktp6R8QK
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b532dfb874so164434a91.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742808; x=1796347608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=ktp6R8QKl/2709eOOrraqJz+yX/kr1J3oxhpSeFZnRitQEwCaDgbxtWoVDkyRnfzMi
         vPg9X7wUo5x/TPg8Y9c91IMP8bovEEefBMVEXwN2EBXFJPGuCB3xSCZFDWe6+/3Tuls0
         hfkRrWmfmk9f79CVyuLF0fxxmyDSwJ6J0J3NJyNYZ+t3dNuGQVzqYnT4bI7CFd1V1+WU
         5NAlqUsT12cGI4cfxBjLNceBSyMLtekLfkOQujudOJzryoUMSVjpzIuGNcpj/dF1IYEN
         jhhycfIHCYcPoN9v9GyW4OM+9+xg9/cY+tBUjmO1CkaYv8OMl2uXvRcqqvHJ6lDusSXe
         ArfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742808; x=1796347608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aG/KagoNLB3jHRjeL3wtY+SAB/EDT6a7qyc/UcmRA5Y=;
        b=f8mYnABzBmsBDQQm/Vn575Hd4EDSf+dwI7gmWiA/u/cW53ileaYkqqWh2xsXQ+c+vH
         J20sgkj8pxnBGsegnyglo/8ZW8hJiwtjcB2PBB5nX/mVE1W6+AslmpA0xEk3jzgbU4Pe
         y3vWAy95ndPbCPmgFBHWI7xfVJj65ZrdYfgfMekT0JkxXMnuUBD+bPkfY955i/YZy0Z6
         lfYedqhkjtCDfcHUzDhkJtiu9FK6b0J/4T8m+p2DiuOfESr46DdAxgJDbkNQYqDvWgp2
         69jxqEKjaaoOAH2sOJJbXHrl//uIKLspiB4wFUEe+PZo3XEQ+VFtQcL7mTsW9Pq4MbjI
         wB/Q==
X-Forwarded-Encrypted: i=1; AL+hErH/3H5FCkR9Qug59hujiIT2ikc1W695K/H/BY6XTiFy20aAPnJfz80fujZmHvIAbZkIxDC3YUG1KoOA@vger.kernel.org
X-Gm-Message-State: APuU4Z/j5wGdwpUKeURkZ0bc2P5uPB80vPayJe2Q2XOA2G/SwuhEfyd3
	jNYYhICDGCs9dixGK19BS9ocUve7jJk9uBco8drzgyKjHJTwOoJKJVsq
X-Gm-Gg: AZFdTZczA61ax7NSZkjaUBLDANc/TS7PXN0vWymxl0x/moet/eJIdOG4Y6aXfyoh1uf
	0YPgm09pQcm+li49DdMcJBJAnTXUttZiD9jCBJ7yoWRe9PdkQy7rbXanvMoKPfD5tMcN3vuTx3X
	J/JfFE5OrMXBVeaaD5hD6hDsJtueLM5uux/0n0PT+jNlWqX4xYXQI/hoEObRVKWct97C1/uoBpj
	Ns9kJAnjIkkA9eKuIVyNDZOvBOn9Bjrq2QJoBV9ePuUkUX4/4Q5FC0MbxINpiqE0Qer9h4NYZcO
	kFaoU1xcdsiS7g2WXJMwhbAgNQ0i4qW7wn0QWMyueI1lVvaDgnpG0Ehq24IKirFQxFBY6KJ7gns
	SbQ6q0OTyXYow9ZG+0Ot4jhue/MtWjAieNUqJGUBTin5FysSHLSFXuCNOdbF4i9eDN9/q9BL3WT
	UyIoK6TRnbGz48ctRliZipqWIi4Dt89f22EIt3FtYId1EYQ8MAz451lFIfOwIgKP3XQjOYrqKA7
	Ikjtn33C9us2ku8YqbGE7T+5J7Pf2nrEz4IJKBb4xkdNYfSi8yQnvD/bJxTqEgRDq/IO6VZMh2J
	Kl6/00hIH7XErvf9GlB/j0YKKxK3mI55MQJVQAxyTH02UevELsE2QGfNvEDf9AtKOvJu/5ZDXq9
	5NbxFMGeQLI6tEKLeGPNggX6AiQpWVrzuIAfgRAu6LeMrow==
X-Received: by 2002:a17:90b:1e4f:b0:3b5:35eb:5ea7 with SMTP id 98e67ed59e1d1-3b535eb6056mr549399a91.33.1795742807761;
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm35042866a91.4.2026.11.26.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:26:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 3/4] dt-bindings: iio: adc: Add the PocketGo S30 analog stick MCU
Date: Fri, 27 Nov 2026 02:26:11 +0100
Message-ID: <20261127012612.1589039-4-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127012612.1589039-1-romain.tisserand@gmail.com>
References: <20261127012612.1589039-1-romain.tisserand@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PocketGo S30 handheld (Allwinner A33) reads its analog stick through
a microcontroller on I2C that samples the two stick potentiometers and
returns the raw 8-bit readings. Describe it as an I2C device with two
IIO channels, for adc-joystick.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
 .../iio/adc/miyoo,pocketgo-s30-stick.yaml     | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
new file mode 100644
index 000000000000..103a11c96fbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/miyoo,pocketgo-s30-stick.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/miyoo,pocketgo-s30-stick.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PocketGo S30 analog stick MCU
+
+maintainers:
+  - Romain TISSERAND <romain.tisserand@gmail.com>
+
+description:
+  The PocketGo S30 handheld reads its analog stick through a microcontroller
+  on I2C that samples the stick potentiometers and returns the raw readings.
+  It provides two channels, one per potentiometer. As the stick is mounted,
+  channel 0 follows the vertical axis and channel 1 the horizontal one.
+
+properties:
+  compatible:
+    const: miyoo,pocketgo-s30-stick
+
+  reg:
+    maxItems: 1
+
+  "#io-channel-cells":
+    const: 1
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - reg
+  - "#io-channel-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@60 {
+            compatible = "miyoo,pocketgo-s30-stick";
+            reg = <0x60>;
+            #io-channel-cells = <1>;
+        };
+    };
-- 
2.43.0

