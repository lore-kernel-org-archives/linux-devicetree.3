Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25151477D
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859734; cv=none; b=rUwktjEmY9LM0U1v5qFQn54hhhHmv4zejgydWOqoeZSKZFT+iuOnUFtParRsB3qimg6uGCENn+eiDd8DIdotarxPcmLo0kluUwbJhnQG6SELIyqJBMQ9Cip/DbG4gzdXpFi/U/B6S4EfxsLLJZ44kgjQtkoeE68TQvP8MgH9z1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859734; c=relaxed/simple;
	bh=Qtu69igHTHFeUpqJnL+cNF9pCnQyvj2ES5i9e2nUAdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9p1yCDkRn6mQ3udwA2G2B+c9EbAuPLc+p77imSR9aMVB62WxlYRoi+HJuuS94SajcbGT05zPEUtYYtzcaIz1RnVM3I67/b84rWvDaBCMzWFj1vO9Fn9Q47IOdIQmkR1Yr8ngeu1/1zbiR/0AJgqG9KX+0b3DkrChtdBZ7ngB6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7C6J/e0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7C6J/e0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d5cad1a6baso38191635ad.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859732; x=1789464532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EcwJ6FJdDLZqAgx4ZJcfrdseGR1/I5SVESCmgXprts=;
        b=Y7C6J/e0ct2QBI9ua/KC9QZqNv4KyRGLUyKE7lgB2L4NQNynrBrzvywjnNS8fXh/wh
         w0ni5BQCJ3gVGW7e55rCgzDDPkwEK1aZA3wMc4vSREC4vyVxHEdNeUEjaVusYt2qIeU5
         hxk0LJ552zEo/QA6gV+Lg1mhVxYSjktBAtazPJjBmCg3q8uyPGv22SdBAX46DnXbGSit
         KdL02thk19/NoRwIjMRrcqWLFwXe5TiJNWChG1w8XL6D4Qhb6i0PyvxpVWepNjXFmMoP
         02TJvy11ejhYHWTF5sBT5HVDPx4w51jfxeIgFRnRl+xzK9N9UBn8OOOofLV+8da1Ht45
         O/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859732; x=1789464532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EcwJ6FJdDLZqAgx4ZJcfrdseGR1/I5SVESCmgXprts=;
        b=fL8NIDShE4P1loovHTRGNj8fCRmgRDhnrWNJHt/9aIZRSP9Y49EJn8pirvGD1+52rt
         y9ch63wTxUyijNZfTMeIzJzgvAWY9yYG04gTOWzpmmKIf719I++3GdvhYS6iY6MfZEuh
         6ZF1vLU/6C+qJoCHeWbd14ij+3UiDf/XPaRA93bfpaRwsTYZIT+j/1JIMkqYpWZYMQYN
         ETeKtZA+OQRjkdnsdhNJ4sanyavGm+RlZng4VMpeUVdPMkUJn479jBg1TLU7z/ZeVyEc
         vmbGhtXgsMePsNa6sQTci63bv1lERGyR60IgWV8xc+dTkhoYno5ExNGRJoP22QnkwQRw
         ce6A==
X-Forwarded-Encrypted: i=1; AKwUvBwXQkr3GnWIaGNlM6mTOy4HNJI6OvMhJ96g0QmQHVva4OiSCNI5SQZpeIPuUW830x7gdoRG2GjYUgSW@vger.kernel.org
X-Gm-Message-State: AFuF++nWKBF+8VbZeBfTOz05EkQUL8JWsrvsChIr7ktqYyZuEcp5c73q
	92g31iwZQbzqjzxTdLKFhoji+Rzy5iRzdgH7Co7EHD4zgncu09w9ZCY6iIpegg==
X-Gm-Gg: AYBFou3u4UuL4fH2qhBi/BdE2zbBDxUoNBSVhYzCrmbcWjFN88SxxpSf0Nv7XLl/Zmg
	y3kSCoJ0UOJ982jnxiNoJ36LhUCx7OV7rYXGI8nablNry3w8gW8lHQ4M9QUDWYNmwkoIg4POiCx
	AYq3aiWpOwmgXQhLrvP69aj77U/lVDk4lnGjj0yywgbGgq53e1K1jvezfrUTWmQI6AYvOevItP2
	EUe7Q/xfcNXjNOdCxVNTrKTidoV4wmqVMXojuXgB/CS5qVAE5O/rpqXstHBzFIaZ9YZItUbKfIi
	kJBtByYUMnhh2ZeQD3mCrG5mQYoj1AwaXw5NCbST9ycZna0/GA9WHE+k4jJiA90rymGI2ixn/As
	Vt/HBRJT4VlqEWewRItJLnYRmGyUnnPjfZbMyltW5sBaby/qxQnZdWBbm/N6qo5uf+R6aTb3vop
	lIhAi/K+SjfWqjHbbrV8rBaJ4o57TWbhHK8/4zXypAGyTnG5Cjia/fHRynh7LzQyGa6oWVcwPY/
	asktxBL3V7nr5oBz6PEd8ad8SvH6voX/BWD4DhCMoWXP1izJeDj
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr44896355a91.18.1788859731444;
        Tue, 08 Sep 2026 02:28:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:28:51 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 1/6] dt-bindings: display: verisilicon,dc: add support for nuvoton,ma35d1-dcu
Date: Tue,  8 Sep 2026 17:28:35 +0800
Message-ID: <20260908092840.225220-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Nuvoton MA35D1 DCUltraLite (nuvoton,ma35d1-dcu) to the binding.
The DCUltraLite uses only four clocks (core, axi, ahb, pix0) and one
reset (core), with a single output port.

The MA35D1 clock controller gates the core, AXI and AHB clocks with a
single bit, but each remains a distinct clock line feeding the IP with
its own rate constraints, so all four must still be listed individually
in the devicetree; core, axi and ahb happen to share the same clock
phandle.

Move the clocks/clock-names minItems to 4 and resets/reset-names
minItems to 1 at the top level, since that is the lowest count any
supported variant needs.  Add an allOf/if block that tightens the
constraint back up to the fixed 5-clock/3-reset topology required by
the existing thead,th1520-dc8200 compatible, and another one that caps
the new nuvoton,ma35d1-dcu compatible at the 4-clock/1-reset count it
actually wires up.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a900122012..773966677d0f4 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - thead,th1520-dc8200
+          - nuvoton,ma35d1-dcu
       - const: verisilicon,dc # DC IPs have discoverable ID/revision registers
 
   reg:
@@ -26,6 +27,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 4
     items:
       - description: DC Core clock
       - description: DMA AXI bus clock
@@ -34,6 +36,7 @@ properties:
       - description: Pixel clock of output 1
 
   clock-names:
+    minItems: 4
     items:
       - const: core
       - const: axi
@@ -42,12 +45,14 @@ properties:
       - const: pix1
 
   resets:
+    minItems: 1
     items:
       - description: DC Core reset
       - description: DMA AXI bus reset
       - description: Configuration AHB bus reset
 
   reset-names:
+    minItems: 1
     items:
       - const: core
       - const: axi
@@ -79,6 +84,45 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-dc8200
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
+
+        resets:
+          minItems: 3
+
+        reset-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nuvoton,ma35d1-dcu
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+
+        clock-names:
+          maxItems: 4
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

