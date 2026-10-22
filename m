Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644108;
	b=kIKQfVObcfNxY6uAwzifyU7ZwXo6LwqOZSvgAw3TCcWZReil4Y7DQYS5uzyhhqlhTjB7
	 Ur+vYx+mShsiaHOydPMEA+4sAVcgwXkeUvYAO3DNhO5RIlUEC/JYbeX5VDCoiVCK3I3wP
	 +BJ1yndhHJV3PGNJ9vu9P82/vbXyxJwmK1lXnSM1d/jaKQq5gCjf6FAoHnMaMCWpoQqSW
	 g6yOVS7Y29Dj+WLeXaDxBpp9kL6d86ANqZDjlAXzLflj8hAG+Z1YtG3JmAibEc7r8hPvz
	 nOazy3Ii8vmUc3f1MO0QjVMC0Bp/L2VAPQJ90ua1P3Km3ETuzVy4D8KZKxMkoYRzIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
	b=z5d/98wihwxbO5sdQ4KIo84ZiwIpbBuYEOWmNfSy9UIZkGk825LsRA31kQGqKzL6+cTy
	 0Rf8DL4Vojd7zy0UhkpypeQT8tLaRyL9U0hb1FaHct/+4SeXvmbU0heZNVdYo4UTRT2x3
	 V92ZXza0OvKdUVX4mUJNrIP1U97ET5wjJ3nGvngPWUIYXmf0AFyRgNEgVjEJ7a46MuCoo
	 1xod19AgEZU9Fd/ADjUB4E8PYVkuOIIy48Z7DP+8Zz4dPHpgsJG7ZZHU5iR1D0aKRjThe
	 tgCVfPHWveo25XxQz724bGn7hD8Sr49H4j7c2fMCk2NNAuET7xmrhPysic2wokIc4WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97354606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97354606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so808864a91.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792644107; x=1793248907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=E1TyOzD5bPpwzVqP5br99+6oh3FeSycO8lcfeW74GAhw2rlpgT/M/FF22LIEXTZPws
         kMjM5K0pNbdnWtqZMaR7KrlD+xif3ghDb1IEKVr0vXuA7NcjjUPPySQvRRAihPHtRf9c
         D5lWNU++NIx4AZi2w43o+3IgjeuvoBoiTLIfCZqRY8RSoxHhTSgrE8kg+T+HEgrz+9Zc
         wozz2wgsYHkBzBPSyJvixXoUj7D4FqX+jXIsUehMu6KS3+B4SzcKoa+FxYjIHOaGtu6P
         aGAdzRCj/zFPL8h4c06TnKJ/sSQT3uTHAiPmrcaXJbQ2t1q73Xmdb5XMksw5GJRxrnAC
         14fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644107; x=1793248907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=h50jU0Zm+TKKN+FljoJ3FdP7/YpoIjeYdloDs4TE9SYPc68ZsrwYMIWbte2a2a7rrC
         hKz+/n3fvzY3XCFyTcTdu+Z3vconA5K8sJXg3mSMJ3RoQc+EG5s1M2pgBGcNeLhpNDdu
         HpTD4jsYWhicC2pv7XVqorYKJ/xR3iGfyK3I3s09+Itpz3EWyU/uTDmqMys6dTtgDNeu
         cjmUD1yTJEXJg577uwIv+QSDV1HAtxwgwPtu4D75tQbKEEj2YMrxWLoLDXpqtA7uxCw6
         9bIOxj2jUb6mesJqfyOyO3CyO3hVC+8Hfckvla+pCPVzQWNfY4HYHLDv0vFpBawQRMu5
         eeNg==
X-Forwarded-Encrypted: i=1; AKwUvBzpv5LB695pC90o0Mrifh6jS15B9IZKnirt0mzITYgl2VD7UljSlicRHRJXasbcQq6hwbQnB0sutM9j@vger.kernel.org
X-Gm-Message-State: AFq9FYKFdX2BD6rFrOBTkbngKCGRonqfpNAQy4kUyriObT000IRgxigi
	ItVR71RCKdSO26th2UmsPYZuePFZi2fZe4Q6u3fdPStbP2a2pLU1IQ6w
X-Gm-Gg: AYBFou315EHDNUXjiTp9cb9+Yy8+lRSYvPvoxia8UHXhupHQz3/anlveSLmXpiRm+PW
	dlC8w4YZw+gAb/znMC+bDH18GXYB8yauU3uavDw8oAftfN6x6w6xgxj8gsJnQ4LGlzqGe4yREdb
	ar8Z26NcSdQpYdhXxwaQ95DrXYfvPmF/FqsScQaxhgpdt7ODGO60W7eHdzvcj7mJ6/2fC8aaaKz
	do+CpI9BHoVfzzZnWEpXat9nDwPVkbd7V3SjjRTWbcjGmDeN4w4M4e+ql0wZC9w4WUw7+RnCON3
	eDmYHSfGkpSM0VbhKYzEkXbnRk7rJ1kECrqt6ac1cSmNFoCSbqTYxtk4ZavFe5EUGSpbDEeNKFz
	etBkcrO3WG0OL2Wc7A6yvPf6DFaIeqDfBSmEJnE4X3WieXafVrTblp5zJkBivUM7/zgFxOD5waV
	doeIybZNCDH/BbAev8OtTyWbQqa7eVYTPo2D5TXroWhE7g3GHTj9RfFgsq7TleoMuL6hYhuY6YF
	lfGXZwGHU9VIVcN2zlF3X8G2aC9Zpy3DYhh6ZT5z8OkHQPHYtQdfj1oVBi/1gWWCMPchCiuGWTw
	72kYTIUGUuPoMA==
X-Received: by 2002:a17:90a:d443:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ad86d07086mr2617064a91.28.1792644106885;
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f42d40sm3351291a91.2.2026.10.21.21.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Wed, 21 Oct 2026 22:41:35 -0600
Message-ID: <20261022044135.275485-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
Changes in v2:
- Rename the compatible string to renesas,tmu-sh7305.
- Sort the compatible string alphabetically.
- Exempt SH7305 from the mandatory resets property.

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..ed30e0c861c5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305  # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

