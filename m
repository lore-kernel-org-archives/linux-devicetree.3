Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB52C569F3A
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000481; cv=none; b=DXFUXNX7I+YKcYZeSbF7dsFn7hLqu4N4nE1mfaOsmtQKVidvT2kNjK3LoEucQ6vvqAi6I3c/BxVMGnynWcNrR0zh/i5ibXQ7Spn/VO1+QZcq5oXFbI3VngVvcPlavi4s/07VW2v+RbV5Neg20zruKdLq98rSKlgHQ08fR7a4Qtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000481; c=relaxed/simple;
	bh=BaIz/EHiRPouZhcJJAmfGVCWwp024Upe+xsltSwGH9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC9M9A5UY3Ld/X+9NXbhVoDQXGVX/tfl77s9mLcM2+jFKdp8WKfZBD8BTuH2HbQHw2uDSw1XJBDkLihkm1o6o6WddFb0ZNfzAEt/w25ulPzx872e+O32uCJ6ky+CwEneyigAym34+iVh8y0Suagieno/c/rK9e9vtgfZxXLAv6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VMBFOeX8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VMBFOeX8"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so35793285e9.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000478; x=1792605278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=VMBFOeX8yuU/ETztSxTHXFamC15WXQsZDJu5ya7L7fb9PKMLCxoj3i4Ysc3R1Nyo2I
         3LTSchDYVf3Yz0i9GF5Kk3XWFe9wT9ibX+l0zLgc6bfPLtbUGiQrf7oGBL9p01HoFlci
         3UBec3j31X2ILHZBigLALiaqoc58liPOoQqCkxb9m8hfKsPQBwuuy21N0prVcG7goUHW
         z4d2ocbCB2YA/JL7NKcDxJagaKkFERuoH4Dg5uTN+RDv08lRlbx0iYV5qYdMOzQSWTTw
         RV1s0N9o8YpGVCHRTmKy9G0d91zQtwfdYsjwz45bBWR3KAsUehDJ7oM2SSZSmTzP8Kqr
         tD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000478; x=1792605278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUWph0tUtI5hruFB4Ktgpc38tr7LXmV3yDg/rZR+XQ0=;
        b=mUJxEbAivcHGkNMrJU53roK49F+pRJ89IEDPbBYV8Kk3KjnS4Yn/9PfiqkOmziODrV
         9YYXEEV5njQ2HRq7EzVOAibOA+xLWtCdrrqAtcbkZ0Pal3bhmDvsAOFqHegYvyr0svm1
         BsK220bU672NOunTYQYgyJ1jIyh9OLsX1Vufw2l2yYtsR6t4dAgUBbW90Q7Zzp3Y5Arf
         aEhSz1gJzzTd0Y6pb6FwgTDBVTUjy70RBF07ZRayvAQUH9MLH0tVNnlptTeeBMdvxdlF
         DMiuL7RNxCKL5DbpgDue/grDiEWxMlZ/teWKoyPY7aY7c+J1Um+JUIVTlzwU+Od9rcE5
         zU0w==
X-Forwarded-Encrypted: i=1; AKwUvBxtC9lI8S1E25O2csN/sDV3peNkfNSNDLsn6ZYay/6rihZRz0LHM7mvd7fMZtS3i0teXOQdmBpC2X4X@vger.kernel.org
X-Gm-Message-State: AFq9FYLCXAAqvEykzNoXGhS71tu37jujJdTuyMEtTyL7EKEgckO89C4V
	IjO5Lkj1L/b4tTzvlcLJCqupYqfX+1jPvwT38zgo2hpD22Zawg6oKi8vRaJUEmxFSmE=
X-Gm-Gg: AYBFou39tEIXj3qYPVqSllnWbFlE7GHqdQmEfbUDgQNLTO3ZgKyTZJ++C4d541+SbFo
	L5xgFpUahMUtrlUORQH92Yer65EIMaC6Px9G88mAHceGnf9uYJjgf66Ra2ksD8Zi6LvpPwOSZRV
	PGSgVaJKWgfK4Pd2qOT2Yjkj7XSeZ7tYgObf46md9YHM9myny+I7qPR2up1i1nxYikt1tc0VfHX
	l0z6SVF9ADwKi7kE1Zii7djBH3QzqGsBbDBUfBPplyl9kCT7VtSK8DxqGLkBcB/qhyuiTihODzd
	LLoprmxQ+kNg33OcBC7ivhVgpsAcrrXIkPrX+MAd4M5IRqpozVQo7sYFlRRLBE5YEkJepwr/Sdt
	B+9cQJURkiT0kt+HueJjdX8TqOQGNZPzGXgGtUl9m6kpry76+T/tB65Iftywfwk9h+Xk31yG42B
	u3+E8vJ1km85lPEpKEGWtgLkCENbJE9ThiSHy67UHlRMfMmUPnlDUuuTgh4KB1kNBVU+60Qkamm
	yvUC5sfX+KtHJCh45azWVAUPrlQHuxUbKSl2UVDfglpuJNpJw==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr349037365e9.16.1792000477357;
        Wed, 14 Oct 2026 10:54:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:29 +0100
Subject: [PATCH v3 08/14] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-8-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

There are multiple members of the Sony Starvis 2 image sensor family
that have the same hardware requirements as imx678.
Add them as options to the imx678 binding, rather than duplicating it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../devicetree/bindings/media/i2c/sony,imx678.yaml | 38 ++++++++++++++++++----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
index 098f72544216..027872a134f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
@@ -5,7 +5,7 @@
 $id: http://devicetree.org/schemas/media/i2c/sony,imx678.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sony IMX678 Sensor
+title: Sony IMX678 and Starvis 2 Sensors
 
 maintainers:
   - Jai Luthra <jai.luthra@ideasonboard.com>
@@ -13,21 +13,47 @@ maintainers:
 description:
   Sony IMX678 diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type solid-state
   image sensor with a square pixel array and 8.40M (3856x2180) effective pixels.
+  It is part of the Starvis 2 family of sensors.
+  Other members of the Starvis 2 have the same hardware requirements, and
+  therefore share this binding.
 
 allOf:
   - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sony,imx678-aamr
-          - sony,imx678-aaqr
-      - const: sony,imx678
+    oneOf:
+      - items:
+          - enum:
+              - sony,imx585-aamj
+              - sony,imx585-aaqj
+          - const: sony,imx585
+      - items:
+          - enum:
+              - sony,imx662-aamr
+              - sony,imx662-aaqr
+          - const: sony,imx662
+      - items:
+          - enum:
+              - sony,imx675-aamr
+              - sony,imx675-aaqr
+          - const: sony,imx675
+      - items:
+          - enum:
+              - sony,imx678-aamr
+              - sony,imx678-aaqr
+          - const: sony,imx678
+      - items:
+          - enum:
+              - sony,imx832-amr
+              - sony,imx832-aqr
+          - const: sony,imx832
+
     description:
       The IMX678 sensor exists in a colour variant (IMX678-AAQR) and a mono
       variant (IMX678-AAMR). The variant-specific compatible describes the
       exact sensor variant, with the generic IMX678 compatible as a fallback.
+      The same applies for the other sensors in the family.
 
   reg:
     maxItems: 1

-- 
2.34.1

