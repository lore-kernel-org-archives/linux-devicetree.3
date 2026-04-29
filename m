Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D472D876A
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441567; cv=none; b=GRBs35NaB6nfExN+QPAr+KAVinH4PkwT1Jf7GszggyP40Wjm/H8RLsUHtnVIu/Ocf4VZMLpTsC2fGBkkCnuLbuFFsPFIHnL6+A0VxyI+sx/qhSdQqUD7G0HhlLzLyvdhBACwNFpvgv3KIreRMH/WqycslNaNpCzdgYCqeN6JgsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441567; c=relaxed/simple;
	bh=LVx7QBmq5oHLQS8ou5iLZO5dvWTi5L4BQ0pp1NtWuNg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dychPgL85Owqfi2b/Qt9ZYNF0LRc0V9AMIbnGWr4ew74WbYZo/X1c5cTl5qTkpjkzV+9phdA/HE6JVWtawrpyCPlMwm2pZGe3XFgSVJj4ARFMquzJVMFnUbbiS/laVEkFXH1jgYjjcw8drDyTckXOeas0e4v8kgonLYv0yWxjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2pyWpqA; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2pyWpqA"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so4255458a12.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441565; x=1778046365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMy0u/g2cL7yrYXQqhYNhi1XV/1EanELOFp/N7XhvWc=;
        b=G2pyWpqAZc/6hclJWHE2ZCbfLpBAqe0Z1p0fZC7AG/LqZXenPC0s4Dih8+QC11/JuT
         AI4WNTDVFD/DwaljK4qZbVTT3RK3p0Wgfr2YIDCVachmMJ3nFBPOELnGHEAOloGBDBIK
         osgBQR3Fqf65WYHJ1+p+TVFcLeVNoxBc9LzbgzEv2mzJ7qMywIIz+hX/BcCuJwPoW0wy
         M5PWIaLqRUOZiKvBkyuV//YTW6L54xp4MDKlh9BcUb3Ti7LPJGLGTM62KSl9BEtDIVId
         I5Rs28XRJt2Tap704CdwKQzPqJrBYW34wKtQ159WjMZxVgLLEk0Ir9jfiSeFntAP6Xbv
         cOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441565; x=1778046365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cMy0u/g2cL7yrYXQqhYNhi1XV/1EanELOFp/N7XhvWc=;
        b=eI4nGs/EOHk0/UsVNv+r0wjL4sfRRm5BOow6KR1d5wPd7BwMXWSEiBuNPyc2KvKSWB
         T/FjBwPFHhHfP6R8JT3ufPmAGqBELz41X9i7cVYKLo/ErIQ7T2RL4f32K5B0Yl4f+Rku
         2yxZ0mWpp55CJD9Dckwctx1eHYD157nBWney6T6n1kHHbKLtHxErufyzL35LcAPa8BaI
         kDywrY8bzLPD1MLn7bXA8ZUPeC+uoPEmDESb1i3jTCovmIjMye/8F7X4Tkt3CEI1e955
         TtGeEXfy90APFoLYdf/fHRAmAqdAHyq/ilAtk9K7s8NKRNycXisXK6NEuX3Ym2/CWT+C
         13Uw==
X-Forwarded-Encrypted: i=1; AFNElJ8DYnt7aNBuy1DWqL9Bmr+TAlyL8O74akV/i5THa4e5Z+GPMIF1S4AZ4DuaxvVzJSWaqxNKBENDe95U@vger.kernel.org
X-Gm-Message-State: AOJu0YyJwv62882lOPhsx6ZGBZAYbmzRj1Q2Yc463fZKfV4LK60SXKpI
	8I0uWe20g65fC5+O9WJA1pCWSYmSTrA27SNUZvmIogn1RCQ27NtYQjRF
X-Gm-Gg: AeBDievoxcLwHP2nagUIZKr4nnMNEWmKisz/7oksWbFhyd86gIPH84T1KR+hWhoRCC5
	xp+X+SO6Bp/j9BtN6kvJdo8UUtDXIMo61kxR69oZOiwhhv/XKRhFs2m+NKs6buUsl4sb1mhhyza
	sRFOjhQM9ol104vjY9P3qu67ne+UvVul5JzrXMJwFvRAVdZUNVC+M7KU/shJHgQ/nCKJYsxqh0y
	tRZBqvYcBwqX9PkHdskIVHSMGkWWI5t2JoI0ukT/lkc6CyMPMMHT1uOi86sE15pY+y1OKqBL9hG
	JP/NQmIJ97I/9Dxf06knu4nYA/hJOdkYH+dEXqYJcgSrnJhDNNmdGsFGjw+F1dkvf1IHJdP979u
	2Q3eR360EHi7gffqkII/oQ1A4Yg+d6IthKCJUuqgUvqWhud1wopPlZxw0bjDvQzqory7aLbiRF9
	MsHn+W+ogSEZkq6FJWZWkjiz68MXLMR9F78Zbi183PGhJvcTX60QwmYW5tw12zbloUFHKH50Scz
	a/YHKvpxQJvlaHiC7frB/zj9Wrd5hDLXiQ/HBKlTkbwxWPi4g==
X-Received: by 2002:a17:903:984:b0:2b2:ec31:25b0 with SMTP id d9443c01a7336-2b98741da0dmr22832185ad.29.1777441565346;
        Tue, 28 Apr 2026 22:46:05 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:04 -0700 (PDT)
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
Subject: [PATCH v5 03/11] dt-bindings: iio: adc: hx711: add RATE GPIO property
Date: Wed, 29 Apr 2026 11:15:36 +0530
Message-ID: <20260429054544.123862-4-piyushpatle228@gmail.com>
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

Document the optional RATE pin GPIO used to select the HX711 output
data rate.

Update the example to show the property in use.

No functional change for existing users.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- New patch split out of the old combined binding update during review.
- Document the existing HX711-only RATE GPIO separately and move the
  example update here.
Changes in v4:
- This property and example update were part of the old combined
  binding patch.
Changes in v2:
- Add the optional RATE GPIO property for the HX711 RATE pin.
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
