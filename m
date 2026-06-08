Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A8385D9C
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899020; cv=none; b=kMS4XhI7W893N9EoOAfP0Yf1GECdj72Y2xKb8OWFi+jJ+GssVlNxsyTcp4p2Mf60bo+CM9HSuoFLTXEwrj4iz/sUWcz4beQfdxKCqv9DmhqOD4/oxVO4ptEOPTVDg+4fOK3AIdBzhBjz3WYDDkulWSVevBF/wYhm7rZ59Ok32FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899020; c=relaxed/simple;
	bh=ucxiE01hSKZsuQq0IwQ+Bm9/3gvFxV+2j4LRrSjRiAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5rshJWcveC0MDf6HNTRwZHOn9BRoFVIM7Wfo75WKxwaBd9oupU8eanISXz2EqNswPpsP349EA7EEJ9ZKIOfEV93jjWSsrnOavgavsYWv73/Kjjm97fN7VDoaDn6Rl3oSs1EXbVXXZHCt+sAZdxp+MkzTE4e7/ETJSrmp045tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLEjE/I+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLEjE/I+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so2192609a91.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 23:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780899018; x=1781503818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=hLEjE/I+Bk+AIPUDTEfVU0+yqBuHj5vsqwUCRy0V/ylAXYXRQjLtvxbTBucPUa8fDX
         w+rKjmPbX3psqCyb1jaRz3/lxpWxHspqF832eS29nk6gpG3GL6ibvOX5/mogU+EnbfC7
         VfU+4L3dYdZD/29xBneOYkSGgmGg0seH0g72TgGTJlY6mwu0hl+Er19153ymafte8J7j
         L6lb3k89AiNIeY6Ya2oS3NBUHUm0hGBQEO/WSFKS9ZaI0zgv2JklA7KaYLi6389Ce7Oc
         aYZjQ5NY8VvoaWQ4+SCxkhA4TecJ0t4IjZ3dxfT8PKWAjEehbtIlj+jfaSYRaJAoBk4y
         hd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899018; x=1781503818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LDpSrlAQ9FmGRYSN7+/NziOaZpQDg6U0Jmn6QAw/EK4=;
        b=airtbpvm0vt/hrW3oEzEYVm0t8NYW3CyetQog8hySkQpHj8ezrz+Kbp8xZhTG9p03h
         IdyG8OFE5ETbz3m7iab4+jkb8ZjjeGQrcsYAzAVDorHWhUTQiL46LpjdngXvehmhTwT2
         DdelifxKovajTM/1/WdlMaOEBO41tHYtmYy9kK1AH7PYgnH0HR5zwlxw/39HXS5LXSBH
         5WEe1z4pAh5nhjK5uKFmcs/qwOUeTaUsaOR67jdFi6J9gUB1Pxr0Eo5EURuIJWSSQLq1
         VPVT7WI9jAR5mZbevpRkP+HnSvjYaf+0kExyJlD6R4OaJ0b3GsGG2T19mBjqrcrRs5RL
         H1DQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PL6+zMI0j0F0zI16KvCjcchPUqpUawyqVQcWH7byU+GnXbzDhj/yVqueVRwChq36fNWJhyZVyrFsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9di0af/69hJs93FIGLmTZw5lvga1ELOKInUqtFQvATy/99KCZ
	cPytsaxIedgXanPOPTv0d81hP2gDs/NmjxgP4P1m1ZlhRLV4NQL9wZb1
X-Gm-Gg: Acq92OG+6QkEqQgTri3H1a2bQGuND1G3AVda7G5XmY6wjt8shjaxa2agaDPRPOzyo/c
	31tZXCEGvWxDWLyGyUXLOF9mkXDVUEqGTC5R56JF+vq7KvsxULRNvqersJ6w8zzlMSo62qqMScg
	D9im5uJfYhX5DNXNUhBiX57A3XSkr5bTuauX14Lpvgkbsc9rprKfaOJ7rk2IsIhLSfL4q3G2JTB
	IOjCxGoGU0YG44s00az18U0XuK+SMlC4xvrIlYSw4JPixmOhX7vEmjmyjXwO3zOX/r7E0uGtx/j
	E6/7J0YL9zpgYxEk7EJN0+UG0wn/j23DOAPMVLiHFkq8IVdY4Hm5S9hCAByrRTSlazILySRlLwz
	nnQB6BXcQYsBvHwXWmcj6BX+y5qema0cpvdI6Ga9+bMWYQV+vIX2yYR80wkajhn3Kz5rj+BleQM
	RElQfRVONKFjIUMjnJ7Fwej/1mNf4XNplV4XuYrR7imrYFcnpL23I=
X-Received: by 2002:a17:90b:5583:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-370ef0eae62mr16087415a91.8.1780899018315;
        Sun, 07 Jun 2026 23:10:18 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c668e98sm15065026a91.5.2026.06.07.23.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:10:17 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/2] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  8 Jun 2026 11:39:39 +0530
Message-ID: <20260608060940.52549-2-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608060940.52549-1-hrushirajg23@gmail.com>
References: <20260608060940.52549-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..b023d4cc9842 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1306,6 +1306,11 @@ properties:
           - const: turing,rk1
           - const: rockchip,rk3588
 
+      - description: Vicharak Axon
+        items:
+          - const: vicharak,axon
+          - const: rockchip,rk3588
+
       - description: WolfVision PF5 mainboard
         items:
           - const: wolfvision,rk3568-pf5
-- 
2.47.3

