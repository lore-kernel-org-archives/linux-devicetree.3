Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876724BD34B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004695; cv=none; b=JgCipw51jvwSQ983Eevw7IOQSZaTCMV0V67Wz6gLw/NlL9Qk3QZXpTjxYDMr58RgvLfwF29ztvBEG8cheMJGjSNppIzX0/OLkL9V1/+wddRLJSr/35jTJg1BC+kwA+nrN9ftKeOsy/TDftG4ktFsRrUaY1u0F7p0d6GVbsMWhCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004695; c=relaxed/simple;
	bh=8UIbOajv/WeBQjxhRwQ8WC4GpLGZ30N+4iDWN0b6s8o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8bsGYVOrctCxj/VxHEtoLWU0W/DPtyZ5zTq6slvEqvg+P308GiuU9Pv5y2/JebrYnqBYWS3ImVUe/ZBQJTDTwUF09wnYqt3AHdEdYAVjsb1c7HzBX8nHJHfQLeJM+qt8pkT3b/1XYJDUJsAOhnvUW/x4uLkhOh8jDpIC6DncLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUeooN0f; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUeooN0f"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-482f63546c5so2469071f8f.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004691; x=1790609491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=GUeooN0ffnbmXXJdaVioAWR5pLSuti9tuRgT4g2fCmZ1RnBFh1MQXyok3Ad3y8VPZh
         MxCz/O+1v0vczlDdAc78SmE5QwgbogQi3NIHpS2yJxGT450lYh2EfLuw8uiVqsZFYmjq
         J5U3BxmIDFNtMvbRyNUD9L69P9TF03crzvAGXIucNwOytX5y32ia5Awy/CoumjOhLZ+G
         NnknhjFIEX/m6TPb1X/zuNtn9Ld+/9Rdn7qg+UKEH5+MRdHJ+Vx3B2zPuvKdCk6o87L5
         sHAT0FYU7i7sQYxs1iH4P+Mkp8J3wEUC53JytVJG2Bw0q0ks3gNTspo7s3uxrha+Wuuk
         QpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004691; x=1790609491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSFZ2mFA8VKpkq2eozLxDfSa3b2z9uge5jLEZ5PpWWU=;
        b=OQhSIBLbZ97eA5LinLblax79bVKBAuWlyr82YbhMiuB2jeXzvoKkWLcrbe7qIQ7L7Q
         xex6Q9ByMka2LldlTimaBZTtVV51rSIaD0odq9E+ntHOt6f6LCofnCmQkIBCnfIfZgf7
         wQplaIHIexrzzHUSHJLYoStFW6xHecZkClY3IM01oy/YO+8wgDAz0vaqc0wwEiWh0nVP
         BzECGGFPD74DkXDh/us4A3DPjB2U1s/zh4eZHTRofzzjQkROIF3P+GsqvmlXyWVbX9Xa
         LiyPm8IXHIuYnd7hQ40yXGO9nlmkGVWUYnfz2d7UA520EPElTghxIP4QhKRX6vC0w5kC
         uwNQ==
X-Forwarded-Encrypted: i=1; AKwUvByLL5Bb0RlYDJMp0oh0hqnF0GICaJggEjTwsETTzYGDQ2PyILZu2ZcUMA4exMtbdJYSHk94LXddZ7gi@vger.kernel.org
X-Gm-Message-State: AFuF++nmqAizKUuhu2fIXaKKfcvNlGvJ3rxE/EWiaemlW4hFdsjBGVph
	9HLLkKSEdteRAvmvT4W+JoIRJ83i1fOd9Liqvrw0U9Y8w5HLbiua2avl
X-Gm-Gg: AYBFou3eAvpMddSVbINZt/sILsBPTLaicDfVAi35f4ieaIFCXJHx9bBWY9rXXUfd7LO
	KVO7La7sV09nLhcKktyettNncFzbsX+M9RcUU4bx/csLLVANwfwgXYKB/nuDznd8a1oeEyHEflE
	6V8uQ0nD8l39A3Gt1IsNOcjyQW/lPF52oNE4e7IGzhS6C55Zz4IbzUiMe5zthQStOJgsX0zEAwI
	RU8UGDSx/2+6tVMw45t1CHKe+D5ni+eWmt6Vrb4HMcAZOLSop04NHiSv9fFi3/qlQWKErbrJNT7
	0MwvN8JmbthzVnZa25vFfuUVWODg7xez3H0EL8EgcSRM+JNyO/on5YgAuy8ZVjn2UyfIfNPFyRM
	bdiYbwQvesewaZfrzxAvo+8APi2R/mp6V2Iw1s+M8SDoNi5D9h5oTT0bi/m0v+k4ggAi9x9e93w
	dH9y/fzAn9+LBv26sKG1sk9qe6kHBvE+TQ9dcmUe1hBuSRH9AmszZ40hDtWqevZWCOj3A3mqvzt
	5KAjX0jNIf3Qj7niZL9iIFBmPZ4plceYrvNwXgf7DMDDmj5mTdkS8459Q==
X-Received: by 2002:a05:6000:4b13:b0:487:1687:197d with SMTP id ffacd0b85a97d-4871e212458mr14317492f8f.6.1790004691345;
        Mon, 21 Sep 2026 08:31:31 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:29 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:57 +0200
Subject: [PATCH v2 1/5] media: dt-bindings: add rockchip rk3576 vicap
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-1-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3185;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=8UIbOajv/WeBQjxhRwQ8WC4GpLGZ30N+4iDWN0b6s8o=;
 b=lKpSlM1nNUiAbgX0spgPXAk0GpWUq8d3KoePWyxk4ZSDU3HkmiPsECMZUnE7pYP6SmzdfHjUv
 odFPQ1dailNC0o+hdS/dO7TmYRMTNNv9fogQQIDl+DajAdYmtsxsM90
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Add the compatible for the Video Capture (VICAP) unit of the Rockchip
RK3576. This variant features five MIPI CSI-2 ports and a connection
to the image signal processor (ISP). The pixel clock of each MIPI port
enters the VICAP through a dedicated gate in the clock and reset unit,
so the variant takes five interface clocks and five interface resets
in addition to the aclk, hclk and dclk of the other variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
index 080b64503b1b..b7dfaf3b378d 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
@@ -15,6 +15,10 @@ description:
   the data from camera sensors, video decoders, or other companion ICs and
   transfers it into system main memory by AXI bus.
 
+  The Rockchip RK3576 Video Capture (VICAP) is similar to its RK3568
+  counterpart, but features five MIPI CSI-2 ports and an additional
+  connection to the image signal processor (ISP) block.
+
   The Rockchip RK3588 Video Capture (VICAP) is similar to its RK3568
   counterpart, but features six MIPI CSI-2 ports and additional connections
   to the image signal processor (ISP) blocks.
@@ -23,6 +27,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-vicap
+      - rockchip,rk3576-vicap
       - rockchip,rk3588-vicap
 
   reg:
@@ -33,7 +38,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 5
+    maxItems: 8
 
   clock-names:
     items:
@@ -42,6 +47,9 @@ properties:
       - const: dclk
       - const: iclk
       - const: iclk1
+      - const: iclk2
+      - const: iclk3
+      - const: iclk4
     minItems: 4
 
   iommus:
@@ -221,6 +229,40 @@ allOf:
 
             port@11: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-vicap
+    then:
+      properties:
+        clocks:
+          minItems: 8
+
+        clock-names:
+          minItems: 8
+
+        resets:
+          minItems: 8
+          maxItems: 8
+
+        reset-names:
+          items:
+            - const: arst
+            - const: hrst
+            - const: drst
+            - const: irst0
+            - const: irst1
+            - const: irst2
+            - const: irst3
+            - const: irst4
+
+        ports:
+          properties:
+            port@6: false
+
+            port@11: false
+
   - if:
       properties:
         compatible:
@@ -230,9 +272,11 @@ allOf:
       properties:
         clocks:
           minItems: 5
+          maxItems: 5
 
         clock-names:
           minItems: 5
+          maxItems: 5
 
         resets:
           minItems: 9

-- 
2.43.0

