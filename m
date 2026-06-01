Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EDA3DB641
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327122; cv=none; b=DJ/i1QVjji3u7yW5I76TJnCpV6dXUaYq7KAewKaB/mbGkuyAdzKNEEkgduHO2qlg4fyqaO2ZDvgCksbH/xDWhP/MyA2edcMLLNa97LZ4t3IoioBGgHEspAqzv2ahNFyHC9alO/LtJROQcE8CKas/c4pbCBKhQhnxHAqLocZG7Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327122; c=relaxed/simple;
	bh=PPWvaKyXHBKw3dRbdQICjaYQ5ch3ydY/WU7J8dzT2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tiDZD8pzm7SpdNsdeTXFLcL4/qpgpWPwRpikfPTjkXwGQtxwDDhz+zqAFbaiKRV1aX+RU9w0LPcQtUSprPZQF68nicaXqMD1nUtWEYY/ra3ITYpNp6TR+qu1zgtPQHTfJb/UlmlcHVgvOLv9+lNSjAV4nDR8DTwu9m15gW0G2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmOwwNXn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmOwwNXn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2be1dd4af34so149283745ad.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327118; x=1780931918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=hmOwwNXnJTwosyxLbXc4dqu3JTVMoxhk3SFs9KaPgNvM/cm2FMZf5rpp3hxSqVEv8P
         2j6f7rwb+9uLqbGeTW4qeHV+pWkCYqf0F2HnDI3/wlsZDA9NKxX1ybOvA+3rilIkqVKc
         KqBtxe9S2R+zifsrb8NFgaAApggR/Q2u3QTtkIB9jEu8iQPSHpx5s9PbXHxvCBPP+eJR
         z5in8iO7TotE4QW/5dsCvMp4SwvpWJwt+q3vJA7//FjQps6HsKvhQ4DrWA4PAVHIYRL6
         n3Np0CrmaCkxkKEpMCZ6fYxkC7CoIox/9SkxVGgG9oJK9XWJnCGUwG/yM4xiGhRu1Kts
         Sm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327118; x=1780931918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YU2lR4C6HulA/xumBMwgTiZI291rJPzss3O8OSIe4FI=;
        b=Ke73OBJ3jkW564nwdc+SRUrh1hAfmHnDVoC3oW0+n5LYZYrtmVrs7ZiigmU/hK+qQg
         kgcRmgWj/JEiFiPpsn/h97iBx1WO4g/oXvvlZuquXaKAcmTqu1o4tQ3Ya8UMO7n1Lxub
         InqU0H5nczLCjgV+cgpNXfV0e3SVdwQWukj598Ee8pBMYhXt1sR5/3R6s7XA4webXwQH
         s5dE57fckkN2uRIu5ZgCqTzVTnG5BVOY/4f3pP5RgfZ0WnwcIBKle6X7nalEv9MQ67s+
         RPUnexQCsnrPnRqf3nVGIDORK4CVszVT9dW01Ci9A1ovWzVZwvqq7u8jn3O9Qk+iGsgV
         R0Pg==
X-Forwarded-Encrypted: i=1; AFNElJ9CjP2u9D9cvtSej80fyrB5izfFQGO5ekClaGzggjTJv5DTvn8c432sQKT/HcOhyYTwzT2liXz/67+w@vger.kernel.org
X-Gm-Message-State: AOJu0YxARZuqSzr31GAXjkyFgBpL/OO9F6O6NsQqhaSwyEEOTqJd1EZt
	KGJnLmeEJRYuSodhXeRwT2rDxW4Z5c7GONu4syE9Bb+b13icjTzDutmh6YeAFzce+WU=
X-Gm-Gg: Acq92OE5+4XuQiIqPhn7nP2Qzq5586d+FBfAm9DlsIIkEZDJue4E2GXUIZpUFasXByb
	iSy3UgjAd3WSFC6+eMkS+fRXdxHQZd3zU745l9SBQSKECzk+4VUrmGdDtu5j/fU/GhudQjx5V+E
	ofxK9gX7kBt4mQMmvJ1nC5HwOeaZra4MdpPNeZStrA0Ac4qJbx4n3Aa9SvEgQIV8X21ZVxVqax6
	OpYlLHSLa5jisxqoW9hmqMnrSSyU3R5jGdo/YXqKEzNBVu05bwiicrvT2/x6Dba6CfZNpJ29s7C
	RdzI69rkTwxi+joTWUuM0cSEIYp3euFBMgEvEn+J5Hb6n1r+71sVxszJm+No8R5uIAeyD9v6xjU
	cSYy585UBJezNOlGQ+tQ9HoBgQ4tKikwWeclTM3d8b1k97D89L+BYsiY2Fd02a1vMkCQ0QBIK5Y
	gRuGfy+Bd4Mu//633TdPQy0Ha/ISDTmJrYZ5oKT3kn2rmehTOu6pY=
X-Received: by 2002:a17:903:fa6:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2bf36885897mr130565255ad.40.1780327118190;
        Mon, 01 Jun 2026 08:18:38 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c0d727sm106633925ad.59.2026.06.01.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:18:37 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v4 2/3] dt-bindings: arm: rockchip: add Vicharak Axon board
Date: Mon,  1 Jun 2026 20:48:09 +0530
Message-ID: <20260601151810.162173-3-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601151810.162173-1-hrushirajg23@gmail.com>
References: <20260601151810.162173-1-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree binding for the Vicharak Axon single-board
computer based on the Rockchip RK3588 SoC.

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

