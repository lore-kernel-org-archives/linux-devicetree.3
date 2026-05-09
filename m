Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31B93CAE9E
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 19:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778353240; cv=none; b=F/CgQbIt3fOB8OjHUAmDBYDpsQfetTpGZWgvnU+6IxAD1v9XcEB80To2DUbOvfJ09k5rkcWqL2ZayPkTNrB9iI3twZ/6RnHfYXrH7ZN3T3avuVg3UIh6W1t8FLQRv8FvEnT3+gfT1o+pT9KhAH1n+9ca5mHgLg9tOw2Szk+Dg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778353240; c=relaxed/simple;
	bh=IOxmh5MhxMGcoJj1bYSLoRwfOsdl2l4K10+pW425y+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTnrE9ZGe6OeYGLSOuJvFmG/OY9khzwSl3TxVTiFts8gew6co9nW+sZ42Zp3Za7mFYix+lErt9ebNU8b4w5LpYRlzFEd9qfx9r+rADrIKu2wa623vZ46t6NHGFHZ2jFx1L9FzY/TN32OHYcedkbs7SBej8+Dt7sk9eTTaiexp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPG5F7LE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPG5F7LE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso21166265e9.1
        for <devicetree@vger.kernel.org>; Sat, 09 May 2026 12:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353230; x=1778958030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=UPG5F7LEbJ8V3oJp0yCFtKSDYymeHs2TzGhx596rLKEdKNFdOOOyI5km6OrZk5sRPh
         A7ZKyjU3Z9+63/AqI9Kfnl8mVbVwpN/oC1KGOII3Kl95cgkKZNeBa19CiDMpHp2jEVMB
         YIFKjlOT84VpVwhmiqOTlIXAa8dQbVSgyTjd1JGYMdNYTO2Gb6R50FKOBtB7JnP8+Atu
         5tA3glJyFiLQr5gUisT1eYFKjguQM+TQ72coMJiR6MvTndHHxjYBqwdSqyfYMcyF1f3o
         T4+6MvTWLCcjhtOe1CaijpWdurvudA1OKr6YnU21dcEOTpCfp2Q0Qz628aPwMaSVq8sl
         OFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353230; x=1778958030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPkvMBVXyvicDPmrKpPPSuducOnxVL8vyxeJt4rQ8ag=;
        b=KH0DIqX2lpWLssvUipvP3Q0sNtsl0MQzGRY7n/2CiUIVOT6vU7lCG+UaYzuFDsk9LL
         9FKD0SLi0c6FHKUXJ+qOPNkVsCsMIpGh6Zy9/H1tpkbxI4XFQodurTK+BvwHUXFB5nF/
         Yy9r4cZ7O2KmvfeRAIe8dEQieGLx9p1VLXYWkoKDs8E/c9ultN9J2kyfaXM057G0WuDd
         D5ySyMGIOPBWGFeGlTCEoHHz3vwo9XfTnh1vLmzJOXKLqxPWyoHdoQDCpMHkKrUviFEm
         uYEghTPpOBfKjN1NLCu0UsZalVaI0IZmU1ewaRegobtdQ8cGEl0ei7AzMUirfM03/luz
         ymcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/utXrHdNtUE3KFs0SeouiyqK+/VpmPhCW+7N5z5ed6YvIHx/PnxzHxvtRljnJe7822wp8tKYUpTO3V@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjbxCI/hilt75YTq2HpzrrdaEOoq2AnPlsVJNwRaT0ZZ+RpC+
	MYkkvCVJMlekoaws42viH3j9I3NMKJbnRcDswYnnLIo2Fq+ic0ww2vuA
X-Gm-Gg: Acq92OFuCS1hsUea99gsZ+p2HFUkV6UlCJZmKBTx4S46/p8eHD6JGcoIUICOlCplTWn
	ZCiDEmDlYYnDtpk0e8e3TDvhhYMm+td40omOwikTqXqd7q9eajNrQD+R7Py3Jk7xYpjVlUZIY5T
	KgKVEfxiL1YOSYgQFUypbcOzSpVvTXqH1qlnu2HCn9z5Qjiw/Ha1VMBiQ2pyoWB4sr/Xp3OPgy3
	sIig1F4/k/uyLDx2gPSfxBWirbj5gUdJ4GMUoN6kFpIxFK5vm9blTp9EGF75agPHv9a6S82jVid
	tUqBoNwkhrc0wKNY/x2HeshO86u42iECcqVZ0QF079VGEiHYXAtANU6BQwQmFIx2FCbKicEST44
	MZWqVnu8v9VaFuS7NNLrCGKsVdDXTp3v31BDeU7IAFPsWIld8wHHVnj7qIuZq1UZW4MCxxM2bWm
	ApTuHFe1+X+ntwDseK3oyToKMIhv7tQAw9Vqdfv0Asi5LuVrmIDBuBp/b84BdsvxXbhyI=
X-Received: by 2002:a05:600d:8:b0:48a:58ae:993b with SMTP id 5b1f17b1804b1-48e676a4e03mr117153245e9.16.1778353230046;
        Sat, 09 May 2026 12:00:30 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:29 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	jernej.skrabec@gmail.com
Subject: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sat,  9 May 2026 21:00:14 +0200
Message-ID: <20260509190015.79086-8-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260509190015.79086-1-jernej.skrabec@siol.net>
References: <20260509190015.79086-1-jernej.skrabec@siol.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

There is no user of this binding yet, so changes can be made safely,
without breaking any backward compatibility.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
Changes in v1:
- update commit subject
- reword commit message

 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.54.0

