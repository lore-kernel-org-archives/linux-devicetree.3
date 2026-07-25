Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1A534C83C
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022445; cv=none; b=ID29jilNUxBN6wqQ8pwDF7TtPpVM/B9zKN1pj+862GUcLMLMm4XrMRq4rC7dZHNcQUhre0Zv0dG7AzOjp+nI7o/nm8rguJNiNwLQmLupYb61eUDhHOzspC4u1XHABBN+qKyXf8+xkq+AB9nI62unB4KcQQUWLO3mXsfWkY3WULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022445; c=relaxed/simple;
	bh=lEjLl6qQ1+Iust3EDUG6IS6NZWSGdOBAlgQahlehZjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyB+1CcYyVlRNEjdP/ikI0JvenHsn8UFw2ZcUZB+eTmUzXLahHveWBJkS+Wxf+umNk3VmeRha5wIA62rN2lXutPj39x9fCcF9Oj9XsbRfCuHpG3JNGIg00MZAlk+2VVIxoSRd8K6imQDuSyNtVArhuwyYk1OW2qrTVO+OGLOQ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naGQ5t3s; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naGQ5t3s"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1670164b3a.3
        for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022443; x=1785627243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=naGQ5t3sTVJcvwIjQmgChGqSxd0CvGE7XW94utp5ilhYkyQ2RhNZYmA+t0qWBAB1WV
         SHfYKfAQn3UGAthuWkl20iw6Il+dKNwOStdYLJNZ4ETuN8Y556h6mDQDHPMWkyIt0Jjn
         TJFoVx3TIxEsfQBEJyTwCsjiqy270jlL7BJerCMQDijtjo047nb0JuSr9N+Kb6PO/jEX
         vRGd7FBJw4qLn28WtwlNnl2NEh40zh+zcBehcYXnrS3d58efkDiH534nps6650aSyTOC
         LHQ6k1T+f/atMLsrIIsG/MVDOmhakqZbihsfH7hNj2qPnawrkGr2vhcCsHruJyA5C3tt
         +8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022443; x=1785627243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrP9mQEhRTjv8fkN36wAMdshu9I2D9ppkLqB082ThAM=;
        b=GUOVo36Qbaa++rPMWL125Vk2hkl4MErMUUOnCkuTFA6GPy8vh42MwaOyPhSQZUa2ry
         9rSwd52a32mrpgra0X6V98Ej0wsVWVfzZ1iKbXrVu8uJcltUzuD+LjHnoJUSLpukGNl6
         kte/DsAD4cG75BmRTQJLrLtnC1M12MoDYOWZZ7ahrM7+5mdVPoKp1+pqf7vaO1B0rtAg
         vMKe/4SNiz4rbKO59IlrqYar73tBlcbrZdsaDoWQDP7zjPdsERBnVo8x/O7vNQE69Eoh
         I0S6RKkOQV2Fy0msMEB1nmxCC7rt67bOHy+OWsU8V9nNu5nLt+7PlybtaXG/AJwlH/EO
         U8PA==
X-Gm-Message-State: AOJu0YydE6c4gwGNMATmKITJZoQRUFjBnZajOctksBHksD0bJDP9AUyR
	XrTpciX3E/E1Nr9YDUF46RcfSd2lKy0nFrSK5vknrn8FoZrSMBYATISA
X-Gm-Gg: AR+sD1120o/uod4UGpYTnHw+KgkOrfK3rGLUBwpNKE28DK8WQ0r87SohISNR9/xBN/D
	kUHs1uKyEXZW7kNq1AjOWIcZbwxBKr7dhwDZds6PDu4dAeBOCgqpwd7z6GZnX47abNPUchbqt1A
	GrGCBcVgLFPM+jYeo7yFQFAmT4CAzpnpiPMM5REcYdI2C5N2g6fWqnnwYP7uwsMJ16XFiTepmvc
	suR5WPuEHPV9eRkqtOcopPfdNZnbMMGF4fRFlU2CNTFqD06AqRNU8LcRE2iYpaKrDgySgFkHkw9
	59ECK9huO9wH3nZHzXrRKn253VLjD93xPLAcvbBjHnr1mCh4/xqyMnXmQeH0ovHnE/0Elyu4OZg
	b+PO/E+z8UPfT5Yjj+rl7F+yjfCr4F8hinHk2aiCqHhXYgl4jgArU6QKYPaqTy29b2qZ72RF4uL
	jt
X-Received: by 2002:a05:6a00:9283:b0:848:63fb:fd91 with SMTP id d2e1a72fcca58-84e59546fc9mr2996113b3a.41.1785022443208;
        Sat, 25 Jul 2026 16:34:03 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce57asm1410168b3a.28.2026.07.25.16.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:34:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
Date: Sun, 26 Jul 2026 07:33:49 +0800
Message-ID: <20260725233351.55004-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725233351.55004-1-inochiama@gmail.com>
References: <20260725233351.55004-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current phy framework can not re-initialize the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be read. Setting the
phy id of board pico-itx manually so the phy id detection can be skipped.

Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
Reported-by: E Shattow <e@freeshell.de>
Reported-by: Inochi Amaoto <inochiama@gmail.com>
Closes: https://lore.kernel.org/netdev/20260712045233.800748-1-inochiama@gmail.com
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b2a7d2d0d3a8..d78416f3118e 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,7 @@ &eth0 {
 
 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

