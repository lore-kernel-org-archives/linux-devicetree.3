Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60738A73A
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778317291; cv=none; b=RKpl34WpeBJ/UuwIKB3R0gUkNNJNkKil3oZdABakEBl6H+EUvqa35Vheb9jv5wTXwIFZW488RvvLppp7uEvlmPx/elzyBpV0Z+Zv3NGaFtkJdR0YeIDZlA0H9o6k7Xz75vySI6/rBSWUgLPB0OGzBaKr+adG0fGyNTjjLNaZfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778317291; c=relaxed/simple;
	bh=Pd+PixTClmq9iDjE0tJeEHz/5/XszPl+RTnZIH5Zz3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DwXTWYw9U58JhWZ9D+kcRMw3BoRtUjwzTeq3loBilrv3AB3dQHP7b0rTXsH1/gqu1EIEMb2Y4RDPD511YitDbWmuaZhnEn2ktLC6duriQhwJH9gA6ozLbMLIPZcbYzi5YB6iMiijnPO1wjeg+g8ocKFMRzpgdU2Gi5ZMJ9y3gCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=exiQ1VmW; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="exiQ1VmW"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-366375c4076so1126580a91.3
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778317290; x=1778922090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5vfP1p0UyOrzp9I9vPGFNM8zPArC9vYWCv2720j8ng=;
        b=exiQ1VmWoM4WA01mYva7D42yO/ANN589Labolo7NOGXNIgRgQv6+xM8tV+YG1s2cAd
         o7CmFvq+rNmaw7Y11uyTV5EmP6das2QWFWukc97GlJcQp9tM3XHUlXWuwus+lmsioM76
         F9Zb56BRXSA/FgpFrm6HwXHmdQb1RbkB3pk8IyelHaBv2knOTLo7LjmSoTMRO/SYJe/b
         ij/WoNPQ8L+0DVXxDBReQnhUWcCV5fWya0VtQWVSGT3hQhtKFhh5TyOlW606aRBBIYOS
         dQwkNZULMhfTOwcHvINHKkuhdaAmDuaysBuZ8fe8Wf476czTSK8TIp3Pit9FPMKF03qe
         +h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778317290; x=1778922090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5vfP1p0UyOrzp9I9vPGFNM8zPArC9vYWCv2720j8ng=;
        b=SjAI4tlIErouAGqqtI2G1cgq9OP9oclZr+9ppoX3FHmlCwpVJTQgXFbzuOtWet0u0Q
         gNqJl81fWjNFd1ERTrDwnIyvIjGo+BTxYOMWGsV0DBgSdZxW3Vi7beWbRrXuGiEXjyRV
         Vp5jXK96ec8VE80cpgSi0Iv3Mr3zfAKxmXrQqevEgfq9qilViJODbTn3p0ZhdzurpfPK
         Ygl0b1cLaI3+7QaMhvx+myGdhe3e6v4vWQLI++BUxJzezMHLFa9v32j2/sWWCPkNox0A
         TrSo3J16vlXqCjumvDZsbtWkT45rPFT5jeh13eV9LR6nka8q5hH6Vo2cF4vSPGdE+gTW
         9jhg==
X-Forwarded-Encrypted: i=1; AFNElJ+TxmP+fQMQqnhBB8LVezkR8CaHGL/Hxzyxk0l5Q7RZLfUuPClFndLV7DmSKUdtbQwoNON7ySWeuHL3@vger.kernel.org
X-Gm-Message-State: AOJu0YzeEGGHAOzWucf85GqMs+J9adTlAtTeK0qooGoCT+AMB9RpzVpv
	bHXicEv3MLl4wcEzngAoMDvsmkHoHYWHrHadnGztj1EiNbm53tQodQnu
X-Gm-Gg: Acq92OE+MPUO6SJ+xCc4uOokfMWLVkGyDXE/ELF8M9nJozdyL1u5Q7BPsoFhQl9dET4
	XbofqK0ifoPFKXVtWjUaOsc1cvqTEuvDzJm0hXl2hRo4ENnQKSM9xI6pZ3gCgi2pYlZKF5WBEZq
	Wcpp/lmXCZxrCpVEVX1CK+Y9Fo9FCYlW8drk5zkgcnLoEsxTmr2KoJgLfpm9yjYzOgv/gUGhXYe
	k+P5dwYASUiWtv/wLyENOIICYkXJuKOHquQtMPOlKCJ2ZoTxWwSIs6aqlJd21y6gq3JJZKL4muJ
	SB+To0k6SpeDP69Y0ggv2MFosdXNtnr8uTLFwNQjnoeYNkOJsycLKy5iCx6CK7RRiwq75JP1VT8
	wshxpTLT2a/azTECHAYIhh4WWZ2QypGcjxV50Fzdc3oPpisk6rAOx97PMr+kGJpXtMsvVtBkrME
	VsbV3FLvGZ3DIPSkoJ7jBNIOYiUGAHV2xnaoPQlGtTwUU2Cs0y
X-Received: by 2002:a17:90b:2ccd:b0:366:4782:1376 with SMTP id 98e67ed59e1d1-367d49bd409mr2028354a91.21.1778317289891;
        Sat, 09 May 2026 02:01:29 -0700 (PDT)
Received: from ultimate.. ([58.84.61.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625ef70sm1577080a91.1.2026.05.09.02.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 02:01:29 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>
Subject: [PATCH v2] dt-bindings: rtc: epson,rx6110: Convert to DT Schema
Date: Sat,  9 May 2026 14:30:51 +0530
Message-ID: <20260509090051.77603-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Epson RX6110 Real Time Clock devicetree binding
from the legacy text format to DT schema.

Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
Changelog:
Changes since v1:
- Reuse common SPI peripheral properties
- Drop redundant SPI-specific comment
- Remove unused labels from examples

Link to v1:https://lore.kernel.org/all/20260504183728.27412-1-challauday369@gmail.com/
---
 .../devicetree/bindings/rtc/epson,rx6110.yaml | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
index 32d15a014f91..b51d39ef75e4 100644
--- a/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
+++ b/Documentation/devicetree/bindings/rtc/epson,rx6110.yaml
@@ -14,6 +14,9 @@ description: |
 maintainers:
   - Alexandre Belloni <alexandre.belloni@bootlin.com>
 
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
 properties:
   compatible:
     const: epson,rx6110
@@ -21,24 +24,14 @@ properties:
   reg:
     maxItems: 1
 
-  # SPI-specific properties
-  spi-cs-high:
-    type: boolean
-    description: RX6110 needs chipselect high
-
-  spi-cpha:
-    type: boolean
-    description: RX6110 works with SPI shifted clock phase
-
-  spi-cpol:
-    type: boolean
-    description: RX6110 works with SPI inverse clock polarity
+  spi-cpha: true
+  spi-cpol: true
 
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   # I2C mode
@@ -47,7 +40,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      rtc1: rtc@32 {
+      rtc@32 {
         compatible = "epson,rx6110";
         reg = <0x32>;
       };
@@ -59,7 +52,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      rtc2: rtc@3 {
+      rtc@3 {
         compatible = "epson,rx6110";
         reg = <3>;
         spi-cs-high;
-- 
2.43.0

