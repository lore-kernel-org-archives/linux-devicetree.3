Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C875A480974
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992858; cv=none; b=d5eUqybO8Be4a3BpKeWaKMVqb1fhKKaGXhjI0MIRRGSe53t08GdeXVWEgYd5GZr42SiVF2YzpVT2gNWKEXkdDWGhmkgk4WbIjGLekgObeZ3rHQoI0eULsw6ekGEgSq4C8jjMquvKAi5iNj/sm/ertkMUQQiDb04QG4EiH0BxaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992858; c=relaxed/simple;
	bh=W1Q97PzM4MjRKWidF01pEeQQIC0Jg95ywafaeF9c8MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGyG6h8Zv4gcr32NXolFj+BfRz4zDlnR9My07Uu/BdxSnimRnfiSd1+Sfmt8FM9ugEYMhIs/opqS2AzxaCHxCdMjPNe6c5P5aU7y0jUuEliPpNd3YWjXStPewaLKrkeCnRQ8vaVmKKtkyg+eDO6zMwgobk/2L7I+KVHiz12jsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9tptfuX; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9tptfuX"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1305908ae11so2362763c88.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777992856; x=1778597656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=b9tptfuXUqir6uhsFCJVdTuhTniZcA9JEieBr/gFdZWgsoDrLdyn3Me9zHLBe1emts
         /M60x+8rPWY6sOjkaCO1EYV4LxY2H5JFsccDUOtYXJReU832rJknzEeHIhrMUrIbqQjf
         qqhuNtQpaZQ6IZI8xEo3LMuXgz+sdZ63Sxt0T8fsM4O5NI7xaO8RnzHxP8+C33GkW+WR
         A/BC+1+uUnsUmuFRyF3fRFjHHJapooitt9XmiZk8+IKa8MXsQVgJ+KMxtwKIXnCr5O0A
         EBFlBgvj88yEAp3Od3SnhkFWtUcDlNbHc6PljlVnFjqKEpRcF0Rli6OMsI7Ivzr+vRTn
         rImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777992856; x=1778597656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saN4HD4h1c5rx002LnGwqjdinW0FYSf0f7F3UZlkMCM=;
        b=DbC24fqShUykGCOfb8M7aByGFnEmZidCCzeDJgizi6jW3p8ZVk0ovdC/1vi96O6CAR
         RGT7CTQUps0KYI5VN19Qm2gepjYRQLUKX+abuY+Cg/iLv91X53hyER8oVvQgYlcdXHJy
         AFNZ30mtCPGqQW3Nj3KjRNfygYQ5W0hN+c5Xe9g3S8ue3JQELdChmfrpzg9p6hfajmlh
         E4d/a9oV7NLij79JltR4t/EZo+ckKdOupfWixEtNzlLPucLbyxSizTZmoLea0CPOGqTb
         +HI8QjEO1cmGw4EHyeHSJAk1UKidoVgK85lKtFt4norPy9tTJ6l7p8uNwHJQ3Nxikgjl
         lnmw==
X-Forwarded-Encrypted: i=1; AFNElJ+NPmVWSWeDg2lGfdtYHhUkNHSfWgYo1jSDJSTiPV8dbKjH6MCX5b6FkLfgZmnwK06wqWIWjyVn6ke3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2PKLiFAyOpJ+UyFu1RRXyeLJs5jBDJWbWMXf6cSib/5xGX9pM
	9370IV6iXNnW5XRaunqI03e4vRIYQCg6mHAJiu2YEO5iRH27BVftz7Uc
X-Gm-Gg: AeBDievpJUIIbSJqvCvODOX5yV7+crqQ/QVhXHdo8dSaJoUWnbPFS/mgICzaSdv3PLh
	wwjCKhHSRyl83qH/g1rGnky6dlD51IbfYEs8bOpZQbCaw0n9u32SmkhPLN4DS+bwd2s5lFCfUv5
	QjKebuFA5xwTMrDC1CVZeUM3Mey7Kh+1qTmd1lEy6uFWYmirQSDbwp+VHDLoUI802WrX/gpZ8XQ
	MZDXmXC8hRX7JkVSLBaMrdEZuTtWPpQrG1vwPSZP/ViVNvckwkkcdHTTYfVBxuBGw71sAMX/bwg
	4OpJgbpz71ajcB3VW/jqW3aiS6bymwFpQnTEblwxLwDBov++AbXlywQvYA8KsT4Y7fHIftDrCBu
	XsD0lNw9EBwBtgcKCynG7OW9sQOjv2jmfXKO2yvhrwEoVX5ih0dEN1v2bs+lz4/229AbsSFTpK1
	W+sRbGWcbasVcoWgw6JIg4WMq0D4j6vUqVBxRH7c4P3g==
X-Received: by 2002:a05:7300:5726:b0:2da:44ac:6d0d with SMTP id 5a478bee46e88-2f4091e6ec3mr1757535eec.20.1777992855767;
        Tue, 05 May 2026 07:54:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a59:55d1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f3bf67cf8dsm5793545eec.6.2026.05.05.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 07:54:15 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v4 3/5] dt-bindings: leds: leds-is31fl32xx: Add powerdown-gpios property
Date: Tue,  5 May 2026 22:53:52 +0800
Message-ID: <20260505145354.1267095-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
References: <20260505145354.1267095-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IS31FL32XX series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown mode
for power saving, while all register contents are preserved
and registers are not reset.

Add powerdown-gpios property to describe the GPIO connected to the
SDB pin of IS31FL32XX series LED controllers.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 .../devicetree/bindings/leds/issl,is31fl32xx.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
index 25ce67940c88..9b129f962d1f 100644
--- a/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
@@ -45,6 +45,15 @@ properties:
       When present, the chip's PWM will operate at ~22kHz as opposed
       to ~3kHz to move the operating frequency out of the audible range.
 
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
+
   "#address-cells":
     const: 1
 
@@ -158,6 +167,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -170,6 +180,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
+            powerdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
+
             led@1 {
                 reg = <1>;
                 color = <LED_COLOR_ID_RED>;
-- 
2.53.0

