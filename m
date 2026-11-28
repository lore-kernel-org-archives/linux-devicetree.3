Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795837347;
	b=CEGCWpPx8qTF7t0Qi9R6bwvah1IxDXrGYpHbZEx7TwyF2e5BoBjTF4f4ERP0R9x1TYZ8
	 lKXwFkbDPP6MYO9OLcrQmVwS60STWH+x1eSYm1qsMUI3vgO+5rEKAootrx9byu2gfhHx1
	 2vSUorpxEHyDCx0ReX0H7g8U54GtuFtKC2oGVCqRMpuhFGWk6EmhPGn5U3El4we0SrILL
	 kHPwGvaZB20hPMjglTjIP2XcZlAo0Tsmd/k34kBGplHH0oMqsVNmfCYsyctJNVj1+xm9L
	 DecYTTi7NTHQVlTof/xzgbSMcBzdBAvTEC/Uz2TsmvwIlWDJ1ybTIIywDfxVI2QgzKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837347;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
	b=JhknMKMGOQYiWDz/WCMdjj6t1YAZc02TNCESoc9NHxS027cC3BktixkcD/+7Myyb1s9f
	 vULN0IRQqGPhppvuS07l4gEYHyH+FHYpWDPaucyR6dGqicvhA4MeObUDuB+mrloyfqwCk
	 0CZ9yaeSo5Wv8wxPz4KMlf3H/i/edXz4tCvAdSKse8q1W/cuYtUueAuYzgZyDYmoJgs2I
	 xVh7TvASAxVgipZRCqpeu2EtCD6HSTd8qVlaofSabtxk6cJiocQ1ywgWOAFKInan8H8B4
	 bPK9h6IA34MLGkv0ZYud4us0k8pTOk9wY9HvSwLkqANlw5rqlf1B8fxsa9XBycfjObw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A1A606A31C
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 03:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A1A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJHiKG40
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06e79e152so4202891b3a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 19:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795837346; x=1796442146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=UJHiKG40c2QFQmdXwj/soAVJm2bznwjHvg+7+xNL51lUnjoKJWEGoDD4JgIVxb9g1f
         lf5DXoRPNr9GY8zV3EkTkY4KqWR6iCgpP4GUrlMg9iDrfYVm5wPw+DgBiJj39t9+82OT
         fraC9ZBlwBIx4rbQKkQgEwHFhH3o5ICGzoXbqP9GN7fYJtZ8ZbA3m1zEq9n4JR0fYboA
         ORHjNjNj+erfStXrrmtYWHLZYAuOsFXFJEP3NdJTeQmthKo7XyZ3Pvy4OcehtcpqsQXZ
         2HT7WzHWDXxE+1OQCR5p/ULSHb/KmTbN/fsU/GqimbbaR4hz5eamTuH/SC5ANSvEWrNk
         n8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795837346; x=1796442146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izulAhXaz6dK/9l1wG0GpUrapqlxdbrdUeXDR45NNrQ=;
        b=zaczMPT0CigiY1/BfYmv6dFB9WNuFzQ3jAyRaA8fnYj4xJDJhpD/Z0xGyMhGov3CNA
         sBqeSuDsuCp5rdhMtnQXHTkuC7/Ey49srwPDcMedcF5Nu6Wgz+RJt8m9BE4nL1/LnlsB
         znCSDCsHRY9LFtBToUn5W4JtOiIwCp0gbwCibEOTl4IxFNym/UtNt7gGijxypHbNw/Ek
         5aQbDdVOhFJ8L2qEGF7VazB5EVoCfHAV1zhHWvb3D9MqmdmKvfGHlGP5xk6pQQ45a84q
         SUiRhMgjqiMjaoTNjnFf3Dlay9ixwI6bN4ozpDGtBGIkRclHwYsaU70CCW8cmhVwYMpb
         FwgQ==
X-Forwarded-Encrypted: i=1; AL+hErHr2snjPLKKc2XHduzCTiq0ylCfS/RCc4RSXAl2DKN8FRkuB5mKRsmZuSf9XLaWa4C3kNVFfmvsNHcV@vger.kernel.org
X-Gm-Message-State: APuU4Z/eiIkcG6bN9kCq8be845ZST8aBgAmEESfGy4zZbE2JAHAfiDit
	Gl5HQk4t3zIMIYXRPtCKmG7ekRthW9obCZP7lCPAF6sYQvBGMKpAXoij
X-Gm-Gg: AZFdTZdZgVt+DaFLa1UWsWXes9MSNdYs9+8FlDdClPwlI+Jun76q10iCDTNWfMGCIgI
	avXeEyjLaM9nCKAhzFDHYMethVy8DY29OKav5gLhzKrzNYqFfgMrx6gm+mg5hUlPTkC7lj9xOf2
	hP+WOEy9kg1sNTsuN7xqx2I3mOpGy0OUZQ4wsWlpHdt9LVTKPAnr1xZc7W11QmdVmkm9T8DJlbo
	oRMnhAUMZ4C8AWOFtVRATPeHBczGiyWpKn23zLUaA5fGZMTmfCw/7xhtL2j0HXUPNN7YPcluc9L
	dXyV8RdXu3ZDFcVI2xckwSsgQjZc6IV1nytAlnYeVOLkkE+weJS8n8TpWo3k3G3GJd0aC1j6ELB
	COOlzPNMFsL6FGw9XokiWJJWizAqQuV9UyFj1tZo67yRv0J9tFIfU9papd8/zF+6QqzZqStf+u5
	EngdbCW2bJewDZRGFy/bUjNs38NVr/6gY8me2oV95MEn9YMGHEDwbzvTOJcbQQWZJVuYeSH+50p
	/N8L5p9w/AShOiJKdba0wqknGmoQGhp1IhTilneg5jhGGftvQas+jOOAEOi6raK3Ik/+k/zYMhe
	dCIxtKWjeQGCkK45olz2N/CO6e4=
X-Received: by 2002:a05:6a00:b86:b0:874:705d:f63d with SMTP id d2e1a72fcca58-8c87c38b5ccmr22393784b3a.31.1795837345926;
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm14130965b3a.36.2026.11.27.19.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:42:25 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: everest,es8316: add everest,es8336 compatible
Date: Sat, 28 Nov 2026 11:42:19 +0800
Message-ID: <20261128034219.746038-1-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Document the everest,es8336 compatible string (with everest,es8316 as
fallback) in the Everest ES8316 audio codec binding to match the
existing ESSX8336 support in the es8316 driver.

Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 .../devicetree/bindings/sound/everest,es8316.yaml    | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
index 9060358a90..d0179476e9 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8316.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
@@ -45,10 +45,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - everest,es8311
-      - everest,es8316
-      - everest,es8323
+    oneOf:
+      - enum:
+          - everest,es8311
+          - everest,es8316
+          - everest,es8323
+      - items:
+          - const: everest,es8336
+          - const: everest,es8316
 
   reg:
     maxItems: 1
-- 
2.47.3

