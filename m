Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41773B8D75
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 03:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700503; cv=none; b=nHyorQTZyN9l9/XuucesTPOIrQ6Y4brgU2BAyIKjY9VUV+OpbYezfyeszOnp6FHy6DMTZ4bMinjmGRsm3GGTu+Zk1/WPiJM3tnDDA1P/5tTzJI0Aqyfti7iQgmxXhOXf0dEAVyukTYQMCJSyzIdqMpBuS7jT70jAdyyclEQcCYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700503; c=relaxed/simple;
	bh=mFz63k23aaQYRmdN+ViRxXvGx6v8cMKKcpGHaF7j7H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBom2Z/lHp4J0kETP80+CjL1vWWpSzQ3XGvzVkNg99Yp3yGDgrPk07Er7R0dgL1VhPD1l1xgeoIPVFLrSvVUI3xPVp7Jl53lCadBNxHjeUsccNJ+sRqbiDfK/YAtSpEscyne1Ix4uEHYumum+uqFGWOyXmO7YFCwSLdBW1SXVWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OeIpFAc1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeIpFAc1"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so119264a12.3
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 20:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700498; x=1790305298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNwi0hswB7nBQJuSOnrDkFTvC7EtUxGnPwE8AGU2RxA=;
        b=OeIpFAc1U/ra27Exf6LWJ5N67oECYjJdiKpQKitxlSM++mufXAQJ0MkwwCaWPqdJTj
         Xclg8BL4QrziW3pKGCy8z4EzFNEOPI8LiSOtXiVfLbUlB+nNX8w9jNH3k0k2gwr14oiK
         8XvZsO0REwvOmT5UgjCdhmemZpY6P9FxzO7eZM9NLCVWAw5aHrn9ofKPuLqCGuBlYa5P
         fylTF45xVzYv3i+hz+V2IB6lQNVfg03XM0s7Vmps3To73XR5tHEtmNHfXZNu5p6WQMSL
         D4iBxCZr6NGjtdrgAdZZZKx3oYKPPVLdO/c9TXGUaqxc4JluBBSTEZfUdv9tdyoHfMuz
         HB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700498; x=1790305298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNwi0hswB7nBQJuSOnrDkFTvC7EtUxGnPwE8AGU2RxA=;
        b=xYo7yKAmgtcFVXcNYFoFnzbkJtJwEM5pD2DLanZ07btCUEhreMC/n7xSyc6vLArsUO
         9LBlBEE7geCd4LkDftyBwWzZd/q74ZT7St1RFlnct9IxeJK6vjwDNhy2TcjuQSBhTEPv
         nRZftsUYBit2e6AknO0LVaa0duBhp340y5foeBrXgOIhtSKH/wMbZhAOBMgjKObFUnwL
         VyrZcutmxs5m9zVrI9oB05jUhsgkvK/AIby4xt7oJcyutIOcdlYj98qJ2yhsILqwxP/U
         2WYd8/2TCstBSGQWFakmHcRnie0DXVvLndgIi+fJfXkpNgr8TohEAeRRiSLwypiwGNy5
         z0vQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4ZPFnsVfm9uwpz1EjvDMXIsQL0wt9HDfexVxFm4ptO7OMAreY3Ly5FOLLUnXXEgtog0Qx0iekPw+Q@vger.kernel.org
X-Gm-Message-State: AFuF++mrQpAKA7WfnrWPPJ9QZ34fakS2n1FxVlsjsKUu25QAozFfuybp
	6NQOYCD3rJsM5HjCCkUBHQ27x52li5iYZ/qQZ/tuCI2XtvrjpKQ1NcAd
X-Gm-Gg: AYBFou2055jRIGOUECIlOM6ILL9zB0YZdWL9eilK+pnv2hAebKVya1ZrlQKlhiatTbe
	ogPsw5fTKVXv0mLTkYWfmqAJ5v/yuGgU0HDXH0DthecKwUQx/oR1ukacm8NNaysU7+F8Dt4W/p9
	pbhEC1B77A0Lcr72ibZHgVFOWz2F9GDUyGbHbG2+P4pq4jUyVzsIZKI3YB+UmRr9vg28uwmf3sf
	ieuLovrhhULUNENwy16FAUGO9/0syuLCgbXZ+39u+xrVsINYrUkYSV0zXqEulPD6EU2JXXREIDK
	xG2Rn8PkO2W5NvG0qzcsruom+lNoHCodBe+W7fS6FlUx2aXGuRep9HKRnwLQZDY1UfGFgYGr1Fo
	6KY9RAQhqZlYagEY7/CUvCBlPtiyMRfzyeNbv/H1cciMvlDjE7lchUeBxVAT7W0+N1UrBHs1HAT
	NfuE8xCCwuU2970+1lB89G/lTMvswk71XzQAE9n6tquadj/4+3ucAKtXu9axEFb4BL4CLSoWXJU
	k8/EdWLVmY1EE5HYDgrmW+YdRr47BglqdwSebIYS1ySijpcTNf55ji5FxRc3XM=
X-Received: by 2002:a17:90a:38c4:b0:39e:5c75:acbb with SMTP id 98e67ed59e1d1-39e5c75c196mr202652a91.11.1789700497914;
        Thu, 17 Sep 2026 20:01:37 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:37 -0700 (PDT)
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
	Joey Lu <a0987203069@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/7] dt-bindings: display: verisilicon,dc: add support for nuvoton,ma35d1-dcu
Date: Fri, 18 Sep 2026 11:01:19 +0800
Message-ID: <20260918030125.315978-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
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

Restrict the same nuvoton,ma35d1-dcu if block to a single port@0,
since the DCUltraLite only has one output port.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/verisilicon,dc.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 919a900122012..e1e6a3a953646 100644
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
@@ -79,6 +84,52 @@ required:
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
+        ports:
+          properties:
+            port@1: false
+
+          required:
+            - port@0
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

