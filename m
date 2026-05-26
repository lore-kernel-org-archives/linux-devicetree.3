Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA673D8907
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789470; cv=none; b=A2j4Aj5RFI31oIIhIMiS9tDHbMr2kR/4Aah9QBqWFnqX4MKONQoU9CZvXnqDByHsD9nDqMUEP6tCM73MXHsWsYYZoVUq8oFnmIKp5FUwlACtEpw2KAx6z7oNky/cdeUtmVq4yJGdfIX8tvYfN8oJNZsGUaS37enXkSnYZxToD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789470; c=relaxed/simple;
	bh=xjDcQrcGN4gLcGwZrUgVzOpV//jSntMqaSVLUFyRwzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dBFEncvYC91H/PZ4p7+h6M43jFNMaJs6Pb+ZRjk3DxuUMPyipfXjmKhJJUOacYP3PaEghly/PtaHsEkDWFs/L0FXvLZLcXK6Rx9XAOPR1zZsIZeLueF+AQ+rTOryOV6Vb+Y3IV6vMS+FtUE/BGi/tI+UO3NrssuAGB+3CCzDdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j95D4xUA; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j95D4xUA"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-367c26471f5so6630252a91.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 02:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779789468; x=1780394268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62ASa2L/nhpOgPRME3/DR39dM2q2Ujo48JV3eKd2yRs=;
        b=j95D4xUA+u8iAIPa5eqfgGH5ohDWwE6Dr4vsjpDGNu5PZeL3ZUpy68QOpUVUYJxsx4
         aJ8eSqosSDbAKY6CgNaAkm82OhXIQFICJvTI2Ng3Ag3F2ai3ked0P/l2lieRlenqR6ID
         STH5tFqiyzPiRbqhcBFP4QIOj+kKz9DC8KNnzauVc16+WYrayXSQIxvVM3rLKQXcFKNI
         JsDXIfH0oA9k6az9KK1eSkaXaoRavgpr9a2PIDX8+5/AKK7EUP8BU2BbYZz91cpjyRh+
         5uJWMsWT1AhlrlBJZW48pjLVRK2xY/vWQ7r8QAXqOjy/V7YmAmlNbQpq47jETsCwQ0gn
         Laqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789468; x=1780394268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62ASa2L/nhpOgPRME3/DR39dM2q2Ujo48JV3eKd2yRs=;
        b=WpHa6pE0e1sRlKD0nUNx+pIW1vN7hB/nPeF7QyZVWbSi3iniEmzYIMeoCVPK/cmFPn
         FVrjZ4c+bnlZnZFHGKXr/pVBDNS3feD5MYrurvvbxD7200oXeCQ9f/0hHy173dPqG5e6
         qD2T88/k6qr9eQNj+G5SEJx7yXZ0HvC/+jui+YEFFGdx31H8yNvXTauckWv0Ee128gye
         mxccvA4sCCjMa90epPAMduQzMBF2W5ZLmbZaaedX5vhsdQoSoYkL0PElvUGRylzvcE45
         Mbc0Vyq5N22Y3mPQPID7m4w9CmhPW/mDCpSs1b9sk2R+axlYnWxFU8CERBxZLLVwN6IR
         gScw==
X-Forwarded-Encrypted: i=1; AFNElJ+D7gd4Y1LevFB1HCuaNzkZKhOxtFjalGEP19/mnv0NKOFyGoSi02asOZgWxfY83H5utq4xLUPKbINE@vger.kernel.org
X-Gm-Message-State: AOJu0YzeW9vBLqzN2u2gjkIethVWa9qMveccWAvTcVd49uXSvL9br+LO
	PZNEu+apIency++1TlxVzxVjT814/a6umyVT9Ie6Ty8WbWKngTdOzsgh
X-Gm-Gg: Acq92OGHy6qJfwkaX0UJ1uUBMYtl/4KEL112kgzYKPb+M9f0OWbobnpQjiHjYi/2dLQ
	m/zl4G3xQ7ZdvB6tXdVLZY9rbabU4o8CLaoVerksyKwuwT/MXaP1uiRmlN8r1v+GlxEVphhMMtV
	i7V2aIJZ231aOMzun01zvMWRCJvokYCxlBiYz8CFbNPcyaYQj9QKPxJYtT+cqqIWro9cXiFJHLf
	J8FChpcwzMwJ44OhrqwX1jMNO7P4jUX0uy1Ku9cxY8/35pKLpc5u7s5PONCJ3/BPGZihb8mOVmG
	mLwS/1YnIby26O32Aey7n8Te+AyE1eULsKg0+MLjKp9tCuwNN2vrztKn8qpbiKlr9UCPOTIxGT4
	qZbh2EGAsvYVT0hSMwjqE8R28Ph+RabiD91KU3NIp/ujpz7+0JHMOSBqCxeFIf/SKYVKHuHFXQy
	aNgR/RQa9O21ju6W+rVtOFNc4K2DGPcLzfmkLTWYo9s2fY9zE8o7Ur/qcudIY711djJJcjZVJpY
	lXGYbde12N5ZDCDqf/yBw==
X-Received: by 2002:a17:902:ea0e:b0:2bc:dc18:35a2 with SMTP id d9443c01a7336-2beb05e48b8mr214421815ad.26.1779789467793;
        Tue, 26 May 2026 02:57:47 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2d47sm147055165ad.45.2026.05.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:57:47 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 26 May 2026 17:57:16 +0800
Subject: [PATCH v2 1/2] dt-bindings: display: mayqueen,pixpaper: add
 pixpaper-426m
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-bar-v2-1-c66df9a840c4@gmail.com>
References: <20260526-bar-v2-0-c66df9a840c4@gmail.com>
In-Reply-To: <20260526-bar-v2-0-c66df9a840c4@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wig Cheng <onlywig@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779789463; l=2062;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=xjDcQrcGN4gLcGwZrUgVzOpV//jSntMqaSVLUFyRwzc=;
 b=9OxnFEpX/rDY/kyYQ+ru5PXaNK8aV3Goml65+mirmTqPlGZrjRZb0dmKJBVU1DXEiIU5m0VWM
 eCUPwCLOT93Dptjfco11526Hz7ScEQkQH/ge6MapV0GMtS9Zk7IsgFO
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=

Add the compatible string for the PIXPAPER 4.26 monochrome
e-ink panel to the Mayqueen Pixpaper binding.

The new panel uses the same SPI and GPIO properties as the
existing Pixpaper panel, but it is not software-compatible with
it. The 4.26-inch panel requires different panel-specific
initialization and update command sequences, so use a distinct
compatible string.

Document the new compatible string and update the binding
description accordingly.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../devicetree/bindings/display/mayqueen,pixpaper.yaml      | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
index cd27f8ba5ae1d94660818525b5fa71db98c8acb7..68a6157114604a8308259191e55d1e2d15d76c11 100644
--- a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -4,22 +4,25 @@
 $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mayqueen Pixpaper e-ink display panel
+title: Mayqueen Pixpaper e-ink display panels
 
 maintainers:
   - LiangCheng Wang <zaq14760@gmail.com>
 
 description:
-  The Pixpaper is an e-ink display panel controlled via an SPI interface.
-  The panel has a resolution of 122x250 pixels and requires GPIO pins for
-  reset, busy, and data/command control.
+  Mayqueen Pixpaper e-ink display panels are controlled via an SPI interface
+  and require GPIO pins for reset, busy, and data/command control. Different
+  panel models use model-specific command sequences selected via their
+  compatible strings.
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:
-    const: mayqueen,pixpaper
+    enum:
+      - mayqueen,pixpaper
+      - mayqueen,pixpaper-426m
 
   reg:
     maxItems: 1

-- 
2.34.1

