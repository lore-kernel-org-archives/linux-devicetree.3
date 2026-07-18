Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A7437CD39
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784357954; cv=none; b=sV95sA3TRmusDs6ELktYUJn5r1PmvX7IkjDCJMTWUmsDH4FHUqdeyS9NtCK3Dq5HaD89qW33AkYylGoKlu1xF4wWuN44z5tqwRoKVqUEq/SR7aac5MxYFn3wthXa49modfzsIpBFgHP5Q3ZJkOp+879FC0yn6D9DmvIb4O4EJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784357954; c=relaxed/simple;
	bh=0aEnkMJF34zHcSad9mJgGTJERjlHufLEtpJoRgmqTEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A+V532LZnHk8gEEqhePHZoMILgkh1pFuJc9mYaGGRKv9hamJHmqzt63ny4noLhjdKq8f044QwaZo6N50e44kTXnG8/A5DpM6NsoyUKjb6bGcEXpMOlL6ZEDPIdONMX/oTvgEJaovvRSEuaq4ymiaO4fxZfuTd1v2WxUuCg6yRu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJa5DInU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJa5DInU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caf228a910so67362765ad.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784357952; x=1784962752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=rJa5DInU5QeblOeh2bBMT5cxMuVXDkRdSFhA5Rc6+tSHOCVMwCJEwY9T/FAz+HBnyw
         3f5xFODH/eZzD5aq0zdSfQ3wO8jrVJg1e0ZhQlZa/NE7o1XaJESZ8jYb3KPrTjzUuFfD
         iKkiJS6pEKBAOKifAXw4YoK+KCQtlgyHzyZ5oJPgaClSvORsCUeLhM9wsXiPUbYpkhiB
         NPU43HqZNr8/HRl7G+8PWKh7RprOdpgL+FfRQsxj6vu4Yc1QloggVE5rDUcEjpYKlNb8
         TXf+aBAVQaYiV6xlJNufRyrBD19wLMBLizJyDjPOr+atnohZ3EIGrqPyZAxVGLgNXNHn
         B40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784357952; x=1784962752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSYaq4nat1jPpXSI23xdg6ZNt7J9ZT6NEZnDaQEBhfg=;
        b=Ko2A+FqfaGVXOwMY3hbfi350X6WtQkB5tZcVRn5gI6eJbyU/NW8w2LiaRoUTIJcNMj
         g+F05iH/aj3wwIxgyy/Q9UvObIawIPjj7VMe5FVWEkuXFhi5MTauOjpmO4z4Lh87ynTR
         V6gm7p9BU9QXcfydKheDgCANIxGK0XWIQJ58T0Wxl2Zce1xbdaw2LbpJ1iuDV2RouevT
         wdkH9W2r/3MoPD6cAzA/67yxf0RdvqGK37aM6hAU1TBQwOGCri6xgqRP/w27pBLh0Uhw
         8fcPEvyF812rbSdJo4bct4BjmAXg7xfcowkTGs0NGYo2hOtcSXBEJ+6MXRNECwslk7ym
         q83g==
X-Gm-Message-State: AOJu0Yy+kKSGGbZR6wASlvNzt7NimS6+ZFuwubqACPcxfdJYrrH5p3QX
	Bbi1SpF1F9enM241K/Kn9cLQ374lFfmuBqkRhsLFA6LVwsypF6uirpxu
X-Gm-Gg: AfdE7cndU3i8uGiVv0CyfBrrofgcZwOsm0kTqlPA/cx8JVaM0vhLjwL/K+8QKCMrDR/
	YeK0vwTpTqzNs83E8oFWbDaNFTCSzx9A4Yd4BfDuGT/43K69KKP9JmF4yNa75PPd0MsZZ/tRPRg
	Uxe2f0E9QNGST92/BHJWgH32moio/C5ICEYX7tiHZ+4BZpiAz9++9tClloHMLwyeeuMp4Pp2zW3
	MyzTZ6/CcAG7jGzLcF3dPk5iqlpt4oOCljFuF6w6VTJdtiz+2jfasDQXD9MHZikSMzqP/XWAdaN
	K78H08auM7qtHjAQskmp2SFjw6xEjiEagvXX1Kb8oaY0p+KqPEaoylhqWWJBXx4d5O8e7A6K34E
	968vdCoFpd5/x3iv/U4a5xweROmXAWHFE1ltOxJWBDtYcqH7PzsM7P5nKoOtFl0XNoKIyVTrKMb
	kaaV4WGlACNA==
X-Received: by 2002:a05:6a20:9183:b0:3c0:9c19:65c0 with SMTP id adf61e73a8af0-3c3adaf501cmr6434455637.72.1784357952083;
        Fri, 17 Jul 2026 23:59:12 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9bb62sm13426133eec.2.2026.07.17.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 23:59:11 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: heiko@sntech.de
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Vicharak Vaaman board
Date: Sat, 18 Jul 2026 12:28:59 +0530
Message-ID: <20260718065900.755631-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718065900.755631-1-hrushirajg23@gmail.com>
References: <20260718065900.755631-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible string for the Vicharak Vaaman, an RK3399-based
single-board computer.

Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..7cfd3687768c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Vaaman
+        items:
+          - const: vicharak,vaaman
+          - const: rockchip,rk3399
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

