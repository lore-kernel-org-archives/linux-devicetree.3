Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340070;
	b=gKJDl040gs4lOCp1eiiV6hEaotoTVvzYHH2tLIMsAIADxBWehQQoPtOAtmkYAKW9Glgt
	 bX/LRRfhrJpimncrsiKbDIvKYXsg7aF8hPceo1oifEBwgp0DpTdUY7jYFkj9rVMKph+Kw
	 25IoD7VwOxNa2zEwTjig3F0DYehJXgEfy2QpL5G89J5VNjlEZquP4ry+76KaUvJ7lV/VZ
	 tGNYUUQyLuM9XQ28gz+2lafAP/4lGj3zHy425E7THEO8ojQ0Ti2cvewcEEa7ixs1hw/7z
	 Be1amMv64u4NOrDdhM4m7nBQj4ZHYPscK9ymj0Y59y84g1CZWy4+2FtqT3koNr8j/+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y+M8KBpgpfD4+bhslMdu9R1fB0Prfsa9U9mKWKKMZPo=;
	b=cMStv3g1zMEL+DjYHDltktMtDJPy+2f6/aHAoMAc2NQRISh19d4gf1k4aWflnEFybTjy
	 adkmnB+WCxsEgOHwDzt/8IftFLuCEjocZs7nwleqq6hOSnJf4NVH89+lPPEDGOsXJf43c
	 ClO7Ac3KgqKUVrS6ak8KMuMpHnLsTSFKYtDB0Lg8Xu82MtC5BHPSMKmEZ3msmzjpQtTjg
	 H4RaoTneAeRynRQHDP6BeP0TW77jNe7cWJc+t7G9OtQW+jVge59mkMWiRFLE9em96IFZv
	 u6MF7ogtR9UWZ4kCpiEyDldGhhHbS3+iBDe9GnlAuwRvDKEKo5JfGETwS0oqZa3D5Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=etySg3K9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9B606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB9B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=etySg3K9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20504405e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 01:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795340069; x=1795944869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y+M8KBpgpfD4+bhslMdu9R1fB0Prfsa9U9mKWKKMZPo=;
        b=etySg3K9HGpYKcY0pNzpLGPEx3/yrbduV7TJaWiblm0vFScntodcim3o6ioRH1lVIh
         XKsZ8mXbRWaPNUqS927oV+X70x3x8zC1S50xdWHvPtonHYh3bMXuSBf7GFA5irk/u5JL
         gOz86l4cZjLUkQokw0eC5jlMbTVIQNZO/vKSiKX6DB2RLD/d6DZJ4+ufx+mA2W1s7qQh
         fSDx+8p3pLMkuJ/0vCdYJDx93UXmplNRYZrNqpPrqmk+W6bQD4qz2jb/4qIWumwxRsjb
         /EvQUHtJajEy6sVOJvAtZEDBwA7xfJQOEl1wYzKX2i5e7Qnm+YDiS9/T/+RdeZ40qXY0
         oUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340069; x=1795944869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y+M8KBpgpfD4+bhslMdu9R1fB0Prfsa9U9mKWKKMZPo=;
        b=zhs0rrG0f44Q3m+DxHZrYHY5UjXC9j8UDDxv/6jf6HYfWM4lRzL/lys9EVPcd6kEdh
         e8L8Cd+LjjRHH/Gb6Ox18gw2Adam3goT4/skO/LN83pqB7QP3qD4VL5c6DUKb9+HLIA+
         hDUmGepZxUJln5M4uwtTeA03Htvy6sT45YDSgdfqFPYW0wcD7Hnpuu0V/3H1wvQwz2ZU
         as+waiVWE1tv0rsYHqdI3Zns90xQ7CiXSBixFw97GbkxMCxEVVUAPImsZjE/g8L6xD+9
         eKozDRq6LVWSvlPG31ZriiOfz2bcIfcT9KNNlXWhsSLuxDLwa/X1ij5wjaKnTeVho0FV
         zlvw==
X-Forwarded-Encrypted: i=1; AL+hErGJcfjnAeUsHjxB+Tp/EvXvGS6keG4Z9+qtANr6+lTrhQRUoRNHak0NHBBk8+GeYNx7NTWbG+CwE/CK@vger.kernel.org
X-Gm-Message-State: APuU4Z/go6oct9V40hrMrqgraHmBROmCLO1pa0cKiV3CUOR2uOuz0Hil
	LLnao+Fs5TZuUWrnK3Tkquyx2yZtShT0D+qrFD63QU0qXEg0W2SWk985mfx6Zip8aDo=
X-Gm-Gg: AZFdTZdl4/YdasSVOMVZvAhvf5YPqo856AZgwEOUBexF42DHYIgZgqVEKhYQvZc+Ely
	EnftzAPalOoOrEZJbFYzksTxMFEGcXOGv5cbmS+72NBS90TKwBUaWInx9adhMS9xoGpqib63MJ/
	ZpclLcdh6jJnxyorqmJ4c2ugCe1Mla2cKH5uqpLHgYIKRa4AZljFDrJKPY3pVcke+BL0ahq1LTC
	pWB8o5MH+WGvV/XaPjuIXcO+k3FOp0oI4gazjLRTemzKQhyWfEgqUpDlhlQ4V6pIYon5CkJ4uQe
	wO5URqx3R9f+kZtMUMhn5A6Ce/OgVW8bEdc0PTn35ULytOGZJIJwCMHXfXJnFkyV30jh2ZKsY+L
	nnjmFTrHC8rNUnq/2ldM77MOWBKFGOgoEILkJX9/ywrRRXaVEPlox0k7uWWlPEj9iuP9V42bxZD
	rcznrI6sWJaOuPWCj87tkYomPS3I92iDHV/uGPIXVz7YTeOj6eRJy5bcMfoJTZdTN9xWtTfRXS4
	nsHMYEvTBhrS2pCbsQjraTrp8qGxtximw9qEpGPAPMTnUANYJc+WkJtvaxjyAD/FhLgifQu15q0
	572FJ7peRrDCSAyvVZ9MPm0xLBRL9/q4KN+CC0eaaOPQl/CmKafm5n20xr1f9JOPBFU8lp0l//F
	VDxJ7UTh9fDA=
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr187579805e9.6.1795340068842;
        Sun, 22 Nov 2026 01:34:28 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm16355673f8f.31.2026.11.22.01.34.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 01:34:28 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: sharp,ls010b7dh04: Add LS013B7DH01
Date: Sun, 22 Nov 2026 10:34:26 +0100
Message-ID: <20261122093426.72677-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
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

The LS013B7DH01 is the 144x168 Sharp Memory LCD of which the LS013B7DH05
is a thinner revision. It is obsolete, but still used in products.

Both are electrically the same, taking the same SPI commands and VCOM
signal at the same resolution, so the LS013B7DH05 compatible can serve
as a fallback and the sharp-memory driver drives it unchanged.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---

Notes:
    Checked with dtschema 2026.9: the steps of dt_binding_check run by hand (host make too old), yamllint and dt-check-style --mode=strict.

 .../bindings/display/sharp,ls010b7dh04.yaml   | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
index 8097f091c2a5..e6ebfea50ad1 100644
--- a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
+++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
@@ -17,17 +17,21 @@ description:
 
 properties:
   compatible:
-    enum:
-      - sharp,ls010b7dh04
-      - sharp,ls011b7dh03
-      - sharp,ls012b7dd01
-      - sharp,ls013b7dh03
-      - sharp,ls013b7dh05
-      - sharp,ls018b7dh02
-      - sharp,ls027b7dh01
-      - sharp,ls027b7dh01a
-      - sharp,ls032b7dd02
-      - sharp,ls044q7dh01
+    oneOf:
+      - enum:
+          - sharp,ls010b7dh04
+          - sharp,ls011b7dh03
+          - sharp,ls012b7dd01
+          - sharp,ls013b7dh03
+          - sharp,ls013b7dh05
+          - sharp,ls018b7dh02
+          - sharp,ls027b7dh01
+          - sharp,ls027b7dh01a
+          - sharp,ls032b7dd02
+          - sharp,ls044q7dh01
+      - items:
+          - const: sharp,ls013b7dh01
+          - const: sharp,ls013b7dh05
 
   reg:
     maxItems: 1

base-commit: c44104f3642da720164042623e4832836aefdd8e
-- 
2.45.2

