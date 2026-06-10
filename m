Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9F40680C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089919; cv=none; b=rufL7u4OY/SpAr18iMYgiy+iIwJ0Kpws7Gso4GsMyUtaTJ6W04e9AnJtV4i5G/e+QZh3L1tqF89Fi+aHwn80edDrPFp8OZ9pWUqtZVWXz4YjORvxZRdLMloOxcRglXGjJEjb4+vrZo2hr44aIg7RGjzVW3vSK8ing60uRDYf8IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089919; c=relaxed/simple;
	bh=st8y4T5YN6SqtZtFwtiBYLCoyPi/Wo5ON08Qei/HluI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WlnLF0rbymsGqb8bHSkILi2awgs/PNyQ5XtEc0QkbhPDsoq5Uu/bQgxE6X+bwpV5ZVcikvn4QmTIbM+wUW6Sm0a6Bxy27DP9SUwaSgmGNUHCHlTXzOxN73LFLd1V9vWcL3NwWjV+yqQr3pQAtd6xSKAEiI8Ix8il+Yoxedjkpnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgyMLsET; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgyMLsET"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c274f362so15575215ad.0
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 04:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089913; x=1781694713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=LgyMLsETAjVxibBzxMFZUSYyoWS02VjoMoM5udBjisjqj7X6/qLA95Zd9EU2kDoKrf
         6y+Rs4+tZAs4Fqbynq5QUL9OmORg6q7/XzvSguOjk0t2ZLS9wTMWCzkPv5xr58qb5G3y
         //dLTKu31vyC/QjqyjRyXeQFaggG0RJnv0dQLnQyS1Oka8lPOUn0YWiUtWOP0ODHhMja
         iYtHAmIyoB0LJ5xFqZ3XqH8vi6FPnKahezXz8DREjiDJaHHfHIq6h7QjiqN2KD+8EvWP
         Q0mocuRb3Tp2iWU4yj4p4N6PAUfOTP6jyfuz7RRbbwIXauOIbP6/mvxjZSKE3bGS+NPU
         cjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089913; x=1781694713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvjNxqwnoH3kM1IlyzkqqQUMkDcovkXPiLWFB1jUKmE=;
        b=ip9wU07l82AG61elIb2KRnqrsKBSnf8p7a7mKtbnrQ57/+Mayw7I3jcs1OyeD+WjLH
         zFjEKItCQPLv3MjfZpUpBh8X+4tsnsBuxQB5WnHuEumdywG3yV+IGRiY8nLJQ6OdOG1i
         tbz2VqvuTz/vZXPceK9osY8i2YTskhDDCmaQupS1nuvT3fCaKC8173DBsltTvcRsiVGZ
         uQle1Dx35KxypUj2LaQpXD8zEq8WP1JkD4mU81WKiPsD3TRGg/uLy4dXUOmN7J6ni9C8
         5/Zbtugfxwc0FofiVKLq31mLr9vnMiNlJMZda2vFuougp72XJWtNPuNizqNKyuQIseiY
         69Mg==
X-Forwarded-Encrypted: i=1; AFNElJ/NTUvvx6cv3OWBXJ+YrkXiKVi5veZfsYwF2HYc9S5nTxE8xm+8tjBfTz72WCacT1PISCXwZ1cbKux0@vger.kernel.org
X-Gm-Message-State: AOJu0YyWKAL9BL673BVGhBKZ+EH3OD1ni2iOZXud2xHe/RfbKd6vWdgD
	MvuT+iOimX/F0Xo6pHtc5TU4A7NQJsyGKStQXJtZIwqbz5O/yCk94ewY
X-Gm-Gg: Acq92OGqAvtIlvogdWrLRA11jG6neNLK8JuLB8fQTuzbR4zkpQ0sN623pWFFXRKz/Ju
	quL5g9T8ldW7ltL/bumn1Ycz1vvo0Ly6fY/ud0XYcRwBsqqYgTxhqhCVPTTnXZSz0+C3fhZwdKj
	ELzTSKGg9lKnui4ZBNkew5GFcypxaRBOMom1h0eJ4pbMyphlKR0mEn8MwgTvOGL0uqWjFEqnBcu
	rAKP3lt9ir/0WSz7cH1CHZVsz0TKqVGcuXQZnelryGwMmEBgmMaQBm2n2l3g6oXr1DAMkeXWA1e
	MnxBQygXT8yuRG0Gf75rB+FqSHTtTgLTklFVf7baoaHt/cf0Bfwa9uuGPacjy0HLUbx1PexXsXK
	Ephj6wH6TkVQUbEUaBZtseBWKFsCO8pcP4D91SQxarvViPBhZZeZU2nmKWaVGtfy2RJZs+s6b87
	1UALlCfWGO+MoGLS/Eas3bASFw15mqyNlrNeh7
X-Received: by 2002:a17:903:4b30:b0:2c0:b35d:ed44 with SMTP id d9443c01a7336-2c1e833b90fmr131974905ad.3.1781089913391;
        Wed, 10 Jun 2026 04:11:53 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251328535ad.53.2026.06.10.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:11:52 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] dt-bindings: soc: sophgo: add Milk-V Duo 256M board
Date: Wed, 10 Jun 2026 19:11:20 +0800
Message-ID: <20260610111136.1514155-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add compatible string for the Milk-V Duo 256M board.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51..fcb1d905da7d 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo256m
+          - const: sophgo,sg2002
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.43.0

