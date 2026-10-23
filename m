Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756622;
	b=XUb5MzRy1J088y2nh9veoKATlM1AKD3gjg3KEvvJXV6ZQJP52AGx6SUQQuXwb1BHmBjw
	 2Ce1x5FNZ5Il8ozXlnBTVhoVqaUp9wMZt5Q9/BR6mSAmjuAYJY7kVGucteNrwFpzRYaJC
	 DrqERNFr3oj5oPIjIcZWb3cuUGRoKlECj7hSE/h3/2RY32qtBb8bzKbyZ3ebl6AuOB6Vu
	 ukp7AF6C3PVvYuIEHQy1YBPbuKmY/B2BPWihvvu3+Erdg6iUa4QgxHUKyeJgfmRqCxIMj
	 tsPWeXP6Nt5PC6zeL9VBGjPW/PBq1PKghPCm0Kl15Eo9z/HmuXtl7+rJuMDv8PQ2JGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
	b=erTTQqJb48dz8jP+U/rs2ntKKTkrnQ+7HzBb0vMFVeczDvaMPgdE496ZiNcv0bTyOctG
	 hOCe0g0rQuTReNZmjUfGnQULILEInAZnZsaf92lw6lBEx2mlYRfFLAaXY494kL8iuqUpS
	 vAgADa738RGxVybR+yV8jLgUuK7znjQ7/pvwLDamHcAPAniLZJYn98wb+AGr4JUSyLfIU
	 pCEIhQ12lpskqQBUZUk8qOeyKA7ZWbZX5nyP9Qivd2rG+LBOTqAV+alB2dmbIiIC5QmAx
	 aypX9m8Cw3qnQ0l3gZSEr04roT2r++EOYFqP1UtMudcO3wLCca3VlLwhw+s2iiLHdgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE764606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE764606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso490579f8f.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756620; x=1793361420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=RHLt852c7cE2Fin96m5wr4aGMaiMXg9OKRJFP1JXPyByb8y/cnhAazYnpy73aWE6wl
         60QX8giD+dAmg/j0mdI8IzmhaIfoUH2DLP4qcijW4GMLlvvMDIR+R8aKd7rG4j9Yae7Y
         t9kJ2lh7ZwG4ln43zbo074uum0MNPnMHro0q9rPPXYcSauTpBhZh1bP3EcVgxtTe6l3p
         45+ZgytZyVoYqzcoq+O5/VU15CTlYNwkE+FG1fPcVdNP0GmRMfNl1XhkcM6FsWHBfj/b
         fuJyCL2Wk1ag7zZ+lrweQlkFxbdE/vxgE7rLvxYYEMIbU8743sOk15k+4SOAQwq/HfRZ
         t3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756620; x=1793361420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=KrnKOmTleBFTZcNvO+F8GjfD3LB5iTXSteddOsGnj7Z64gAWiw1Fl2CR9sGhApOprp
         jPcFXI2LzTlAB8pKgGjgUBTvHueUKvBRS+2efhDzyIV3TOrmDRWHhYxm+U0RA2VTWEZ9
         L5upZx6kwKE7FMWKlwFcuXyHmhGDqL1sjM9ApQxsqVr7xj6pmXahkY2/+fVFyJg+cOZx
         RjZXoYqXxOr3nTBncNNpKap6MrX1jnji4aWVimgAz5LtsmqpZyJ3HwhEZeGWe6ldEc4p
         JLZRaIEeWZ3vxrd+yB1JehNbMgNmP8SJxbs0ZwlDrWfkQ635zBuytu5cjP+mFzPjFp0X
         qlqA==
X-Forwarded-Encrypted: i=1; AKwUvByVoF65cXvUbz0ymGbIK8rkf2cjxyMz++eJk5BXx+2Kje4geVmVEr+nQ/ZMUIQecLbxukBeD8LVABMc@vger.kernel.org
X-Gm-Message-State: AFq9FYIGblPNqYsE35q5+Xc5ACHFe9NLNL98tioC06kg1ZZe0SCi3A6m
	tpqBLoM9vckN1DKqYndJv9BcIIpz1U/mOOGtLCgcQAMaY2rwSKgju1Lr
X-Gm-Gg: AYBFou2uN9ce4NHP6ct7g+xv5ycRjWLqZPaMuTd1SH/Nn0nqiaxYjzxYLkLQRZSadO9
	Y3waNyDCviZF+K4r/EW5fba/KH2vhbpu+qx9lgbfkx1OPEHpl8DJmHj2QskV5RGIJWByyaS8hEV
	mKtBGXlq6U/ilkstpBmsLgCl8WFHklzzC9n4wRebPdW1k1qWa/fqAh6X4mcJBtOuYCa3bgn1dDv
	c+XBKMdSM6cL536pJx9ME4QLExpibkEXd+yaee0ex3raaGM/iOabIvVd5cmRxHNqwv+LzGhK1JK
	qfkgoxGnujAYOkTB4wgW/By4BFR5HNYzd2DRmviK2tfup2Lexty0sY1xaK/lSFlnxuiF0Hyyexb
	uHbmYA0/juKAmDTZas2SiC8/8RdWP++swG8V+wsf3K5TMnaFkGvbzZBp57D34AIusW9cE9kIsFA
	xrxYPln4mVaXFP+GdzHxeK79KGaeI43SetlTj6f93fddzbPHgwKqU/D9CQ81Dlk1egR1V0gdwTt
	arkmyR83wBrcb8tmE86ECd5uIJUkmMZ+D+lCLOIoy5W0XsjKgNwhrvlv6jMz4Rds+mzcQ3QzEu9
	obDgd4bZc5oZKWfYdxl+eLMCXHDbfB3v/GPJjovuG7KgapF/4LTWxdoBDecf
X-Received: by 2002:a5d:5d86:0:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48e385ab429mr3050979f8f.24.1792756619921;
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Fri, 23 Oct 2026 13:56:48 +0200
Message-ID: <20261023115652.700765-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Document support for nxp,74lv164 as a variant of the currently supported
8-bit shift register with the only difference of not having an Output
Enable pin and a simulated Chip Select pin.

These basic 8-bit shift register chips directly change the outputs as bits
are shifted in. Particularly used to handle multiple LED for basic state
feedback.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/gpio/fairchild,74hc595.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 451538df63f7..0d5596af0ced 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -7,9 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Generic 8-bit shift register
 
 description: |
-  NOTE: These chips nominally don't have a chip select pin. They do however
-  have a rising-edge triggered latch clock (or storage register clock) pin,
-  which behaves like an active-low chip select.
+  NOTE: These chips nominally don't have a chip select pin. 59x chip family
+  do however have a rising-edge triggered latch clock (or storage register
+  clock) pin, which behaves like an active-low chip select.
 
   After the bits are shifted into the shift register, CS# is driven high, which
   the 74HC595 sees as a rising edge on the latch clock that results in a
@@ -22,6 +22,9 @@ description: |
                  ___                     ________
   chip select#      |___________________|
 
+  Other chip family (namely 164) directly change the outputs as bits are shifted
+  in.
+
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
@@ -29,6 +32,7 @@ properties:
   compatible:
     enum:
       - fairchild,74hc595
+      - nxp,74lv164
       - nxp,74lvc594
 
   reg:
@@ -76,6 +80,14 @@ required:
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,74lv164
+    then:
+      properties:
+        enable-gpios: false
 
 unevaluatedProperties: false
 
-- 
2.55.0

