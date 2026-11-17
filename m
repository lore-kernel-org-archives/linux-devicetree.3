Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904169;
	b=srecOKMvXbKZww6rieZ0ifL92H0/4BYzpwo2fjWq2+f5hQ097Y0V6ihZCck87KQSyzef
	 54KEC6ovsuUAHVeWvb1M0YaNADg+RUwNOrPsVZco+R4zT/nODuQPIxxppxqQ/ozE/BF7Z
	 eGoR6yfqbF8huKE6cOw9pCzHH6GJl3aBSSTBeF0hElPkdj6p0p035bXvb9LSSvx77kbXp
	 vJmZT9nwTUB7vtM2/3gPtFWJ4YlJPZlrA3KDhnx+hFYhGnEFLpJdtnIIgQ+Q/hD6HA43j
	 AFye3Zj9yl3VthX5MtPSaJdJ8+aqJ4cfJJFZGIzggE6Nea1PDHFxVep3YjHokbHVMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
	b=wQ1IIPVxTJf+EyFpW3wHp9YDNe4jXDhZiUN+1oj9l8Nw28s2usu0y1kXRlJhrm6aRhap
	 3QDRNeQfeXte9wlQxmmgQdJBLYg6KnHDDrrTa+oI2uRxftq+3VakM9Ttg9ewayAbBUved
	 Mwla3HhIoL9kwNKap9bDT1lLvEO/3qQLPzZTYnrBwbSWVyRcT09gBVjlIuOPsD4mf31DP
	 T6ntEnZaFvBmUJWWZYJiWrXbgqbJ5JAz7AO72OeHL7VgcZXgMCxIDz1xoWY2N+Bep5k5m
	 TvOZdSObEsh9VqWPOslMidCCszm70uwmdcNHI8KfQHY7CCiwE5VwUeJ+ooD1h4CbAkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiAqStaa;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB149606A899
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB149606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qiAqStaa
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b904d10882so1763349b3a.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794904161; x=1795508961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=qiAqStaa6W3hlpe3ZAs6sHR9yMPN6PLsFW6ZzeFt4hda0n5n3P0osrYWl5X/0kzotG
         3AhUgsj6WcpJa/336qEOZmnrk1tjc0SDDNmWLO9GkuF5LjWn/4wGGPsuPkXp7j1I6g5r
         nYivVY1sZdwguqOCAAG82rh/+4U2/l0D7WKTgOL/Vteth3vv33MHDNrdkwN5EKWrJN6V
         EeqdeQewBBaHS+lSytJ5MjCiFFetHqpmjzExNAU+dkUvG/bNSyi55ZvHf+X9Vlw/fczt
         Zxv5+P9rmnx8RRIEQ/jksaZj72uxFqhsjzbVwJWTgrglAUN9yly1I3f3SzYQ9q0KAoED
         UGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904161; x=1795508961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XcB4arin6kXu9NlMnDxTtU/2P/BU+JHWJo9WuFtq8g=;
        b=ADB75MHZS97AnsWL7b9iyX+aSC60yMNXmbJvTFGahN1k25TgH9Ve7LVUO7QE3V25C9
         qfKZ2qJ7F90p/pJEa55OtNdyeZAVEKtDr2MQueOYtYv4Q+vynKT+tjwElu9pAlHNQ4C2
         8K9RHnqvJsLgI3YAyf9YLWsNXQf35naz1AXV7QgiWEDV5lpA5JeA2TFtHNS319CgzmKa
         y+i6YWt3wgwX8cB0DOmr0P6pxopbnz4VSpV23Fz+ivthbJ6+6wl7Wxz3j7xy6EcAP2yE
         jtIsieQqQ89gnCMQItTPuvqqTF6t3k/TcIwtxKuiX8UO9XVu4SHZ+hzK5taL/8cBW0gO
         EcpQ==
X-Forwarded-Encrypted: i=1; AL+hErGhp+K03kSOkz7wVpe+DE0xRub3XglmvudKaGPLKxd/sQkWyYtp586h8wVsuNtqYizOHS6qEjLFI1TF@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Ayhy9TC2t9xUU8TUt0YhLp6WdhkhY6A4SOjDsYCVLbV7cDB8
	36oTYMqVA6acE72OJLJLPId4c0gv2H02HULG+XvC8uBJUV6EdyDTsx9G
X-Gm-Gg: AYBFou1UeLmUnYB9GWB8dcxPw9aPSG0HzkabAGCClmui5GwVVKz6bOjrxb1o5RG52yU
	QlMdTR8QVWRk+Lw/Zf7Q12+sTdlNPpoQqo4BcQgOW92GuH+PrwXZYI1MvVukkgrjI5hgK7JTr8Z
	MuF2t+8vKfjWl/ZwdmrZApk4SKfM8zoIDXPXJGH7k7lWNLryfUYQcmMtwbqTt9UQjUMkr216fJ/
	EVR5S8oy9Qs8yDtB9DNaRHNrKpSaxGGFaq28qs6GQt6iCY7PXpvPwRjwW+PAUDqWEnN0Wx1RwGK
	pkpcgHjJ9gq6CTSiERFw+4cIQvHsDyOTrRMXZapUA3Xc0YmEGtOG/1s3yCeAD3gx5HNxIH8w8Wl
	IXrKVyPjCk/SFz/CBqYDVAwUZsaMAzeJqLdEmyj2f7bpK8DfUbkzFqIAHg9Kd/On8z7Hqoi0+uM
	b/6yrPv7T/XTukOoNRmjNmkILoNUJ33eqIBrOV9BG9GCBQWIRe0qiN3P5hXZhACzvhLV7Aeg/tK
	BCLrBjy0jIuZUGplqNGq/GsKmrmDLenyd2aoAWD3D30LE9+3/9zyYQ3Ob8jtiElTl2bGv2pDCdt
	VYmB4+NTv9m/h7ZviC5AwWwyU7UmApNU0aV/OCiH+WvekWnfrq0eDu+upDHITtYZg23Z48MrT7Z
	eNmGBD4BH3PAHw8o=
X-Received: by 2002:a05:6a20:431f:b0:3fa:f6c0:331a with SMTP id adf61e73a8af0-3faf6cf78b5mr6473329637.61.1794904161230;
        Tue, 17 Nov 2026 00:29:21 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18a2191sm5422907a12.21.2026.11.17.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:29:20 -0800 (PST)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chernyakin.victor.j@outlook.com,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v5 1/3] dt-bindings: iio: adc: Fix channel property validation
Date: Tue, 17 Nov 2026 16:28:30 +0800
Message-Id: <20261117082832.1551574-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261117082832.1551574-1-cwweng.linux@gmail.com>
References: <20261117082832.1551574-1-cwweng.linux@gmail.com>
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The common ADC channel binding currently uses an anyOf constraint
to require the reg property and select between single-channel and
diff-channels.

However, the reg-only branch allows validation to succeed even when
both single-channel and diff-channels are present, bypassing the
intended mutual exclusion.

Replace the anyOf constraint with an explicit reg requirement and
a not constraint that rejects channels specifying both properties.

This preserves support for reg-only, single-ended and differential
channel descriptions while rejecting conflicting configurations.

Fixes: dd471a2b7759 ("dt-bindings: iio: adc: Add single-channel property")
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../devicetree/bindings/iio/adc/adc.yaml        | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
index b673eaa5d072..f2a16b896630 100644
--- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
@@ -114,15 +114,12 @@ properties:
       Burn-out current sources provide current to the channel's input pins for
       open-circuit or short-circuit detection.
 
-anyOf:
-  - oneOf:
-      - required:
-          - reg
-          - diff-channels
-      - required:
-          - reg
-          - single-channel
-  - required:
-      - reg
+required:
+  - reg
+
+not:
+  required:
+    - single-channel
+    - diff-channels
 
 additionalProperties: true
-- 
2.25.1

