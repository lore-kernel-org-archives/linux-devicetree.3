Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793456389;
	b=SKHLbOyhMzVKH6DJ3uI3qJPdNcFtSP9EjcgJWi95BaMJZDbIdRMTmVQrJybDb2/zaACZ
	 x4J+XI18BT1ivKe7ISAA9jrBjj0JHesEWCK5tFVjCw92BSakzAx9oDDQm8V7EmcrslSH4
	 O1B1SdarMHgoATpbLG/oUrB61qI8qTyJKyDL83JADggaowthNn/4Aw7GESLyR3GFQ+BP2
	 bBNBhwHZX5zkwKWqv4kQ8fNoaBtFN3zCKdStGIE3GzaWnnkKivTsxP8l8ue+ImtAqbilZ
	 p+WtL6DvEnjrkvIM6de7VBCMsPMvmULT9wBxdrkrThbAJfp4hYh3TWDCTRXxf2VF5vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793456389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
	b=sY6jJI2ZT1EZ8e8YrcUycHQgi58QjQ6wcJfIFRZfrrRpRNgdN3kG2xyCK/fknyD3bppS
	 0twj4lOlEUmJ9QcdWVHKwOkLR1px2iTVGDME1w7PSVmWyVsahOEVODwFCjx34SHFd9s0/
	 wr4zv3Xv73inxrkiq7ooD7rNY9emE+7PLVRLF98iPkFk+t/3GxBeHBjp4u3Fh4DFCYEvx
	 C43lKqFZTFtdy+us4NxUx6fsw+S763VmfnLEPBzgDgttJ16CdDBxRUY1IbhKJ2HyI0gPb
	 x9gNEI6SpIKqrd/OWDfS3TTzp+0YyfFVL9SE9HTbVw6h2QPpwPmzjdISSFw1hD/wz3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhioXdfr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19138606A323
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 14:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19138606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DhioXdfr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso14264075e9.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 07:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793456387; x=1794061187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
        b=DhioXdfrgaJlZ22HTvGQPCeRUttiMsmL61Z+mzkS0AjXsZuhKzl0srNgL1jdlya6nD
         WwZOhxgk9Zl2+/au5urjac0KC+ppFbkcoSWXVgE3ToaxC2p2HLqtRLU3vREt9TI1BpFX
         fx4wGQimT6AOUgZkSD5XZsk2mtH+Fik5m+pe0C6e0htIBGnSgyQQxVjppnUyDVnARocG
         VUVgo0sE5dIFZxuIFTa4okxZMMeDfDl7pYVnIHtMaX4vnLo2ZdgDfM7olreZfn9yCX4R
         +fUm5JG/Yu3Ky9mrZBBJZtbf+b/ZZ9taexlyfhvq8+9SIBwfkNYHuL/RuiRCNGS/vD9o
         cYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793456387; x=1794061187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DumkLdRaEi2aL/d8oCdFXZcLeE1nyTM9K2F0kvbSfy4=;
        b=KfrhuwQvkE6+owq+eJ6l+yMfdRoSovI3mzDq01Bkpcv7g9j2Cf0wh7NQ7W3CFwFuzd
         0+a5yWPRSf5+LTX/T2aNRdvylcAVIuqiNsXmmYhtfa0nk8NRkwu71qu1G+DaXthxvECL
         QvXc1IKUnAl/7dwevR7mPLRL8Cy1zysVNP/lmLX3iJD00emkwZiHbRlRJhteYfogPNPZ
         i2xrmVFMeJRn9udvFsgG6R15sv/kaAMU9So+IJFAhCaEkgrSA4q7VlXoezG3aoiq+lBD
         6ItvcG4LWMrfy8ohJ2kZFCV8Mn9W1+sgOHXFR3xcgvPwdXkKoqLJhSwBokbyWPc9hmI8
         n24Q==
X-Forwarded-Encrypted: i=1; AKwUvBzAWz9wMw0omFGPMG2aMuXuvbj8wDuN/NITOjifbolmcu4cPZpllg0jmwjtOo22xQAH7n01l/Z8ajXQ@vger.kernel.org
X-Gm-Message-State: AFq9FYInyl9WmCl9F9R1vhfw4lDRmqb0eJbk508yIVgt66JyeypiVxrS
	hXiYtU0Zl4pgGps6iSV8QzdxBgqGplfM0l6UToGRhb5JHCtU0qWexcU=
X-Gm-Gg: AYBFou2IMPa3UcbMLognzEpTkTvYjeccgaLqAaHtkPxZXBT7GdzlniXwzQPNrqpqeNy
	9ssSkhljsvxHkgcXjRQMxqp5KlOkrDv6mP5XZNYeseywZpDm94svyp4GoaHp7EarGhyjHFtYmvC
	P+2KcFzpuiEa1SrETHK0K4M9qaL9MiTJuwFyVqrB/4h2XnpwRMFxIc5xPJmUjOVtdOkVhXqU9i3
	Mopy/4QawFMVGWq/KfliXrKSiHdcT+aEUbfdL1w8mkQsANH/RVNVZqgy+BR6Gvh5h+g+KKdiViO
	FrKyGo+nbOcx0bxE9zjlHU5tcqzOvyWb0oUqGi6xz1ANykD6cCQbhjkX4DRhvfs8wMJwb1rq2eY
	JjxQnsyY1Su8OqJ4/vBilk8KDJdAcj6dPFoVJvedORZaFBP35N2i9K0j8shRakZRawPITpzCzZD
	qhZDlN+RR5rQB1ry4Gzav3iJWAleHRv3aqJn+u9xL5HRG2DxsIOz0XepESUlesibUeh8Jd1IXKM
	TBFwtBT8vd/1HwrG2rEwVHXQG0jPFnEUaU2D9roWq5sZDK7YSgkqyuRgQ+DWEGIGzwrLZWEspOK
	jyMfSM9pzg2OxJBw7lk=
X-Received: by 2002:a05:600c:e54a:20b0:4a2:b89:b02 with SMTP id 5b1f17b1804b1-4ac1c361ademr77200685e9.10.1793456387439;
        Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm209871275e9.4.2026.10.31.07.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 07:19:47 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: daniel.lezcano@kernel.org
Cc: rafael@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH 1/2] dt-bindings: thermal: airoha: Allow sensor indices for EN7581
Date: Sat, 31 Oct 2026 16:19:11 +0200
Message-ID: <20261031141912.1664575-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
References: <20261031141912.1664575-1-sochnev.v.74@gmail.com>
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

Allow either the existing zero-cell form or a sensor index that
selects the main or CPU ADC.

Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 .../devicetree/bindings/thermal/airoha,en7581-thermal.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml b/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
index ca0242ef03788..e7be20d1bd1ce 100644
--- a/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/airoha,en7581-thermal.yaml
@@ -24,7 +24,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
 
   '#thermal-sensor-cells':
-    const: 0
+    description: >
+      With one cell, the phandle argument selects ADC 0 (main) or 1 (CPU).
+      Zero cells remain valid for existing device trees. Only the main ADC
+      has a hardware trip interrupt; CPU ADC zones with trips need polling.
+    enum: [0, 1]
 
 required:
   - compatible
-- 
2.55.0

