Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE431ED7C
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784941101; cv=none; b=YHK7l+rSlOewRCjj4LFbgR14OOrgGh4mNve5rHCzmxrJSz33pzUfS+QwnMRAZxS6znC1FLyOvbfpxTTN1sI3Zy6AAplG84G40HkZVAnGmxAodlGLHBcV/S+Uiyu8ulDgBNJO6dCrwipyBFTMdi2IizUQGnWP6P91++m2L1WRZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784941101; c=relaxed/simple;
	bh=zcEDujLPvsRN+GgGPxQ6SWQmTBHbV7jX86seTQ7X3C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XOmakLQSfnZnDVYufRsENWSXkjN2AMzdC9qhGx+dMvCbYP2Wg/EycJtvB0lw2WhthK6uRowBucEZnclzd1bDgNHChtYszAppJFr+uWmO061SdaZkzNidSxWJMPPrXHiUuIcWN8Bk5lxynQpwB7nZ7lAzCFGJs4INupOW+09NkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWefsTVI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWefsTVI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ceb096e675so12943645ad.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941098; x=1785545898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=MWefsTVIkDkGQJg6QYMP6CqWIaaPjsLOH4JhJQ7pEx6pLNJaGVvQdKL5nAxpylE7Bk
         j5a+TuxBAgtdyHdKcNkBFEqfJLrUiXMiePk5vVC8nsIPmIvJdsJM7xYOANxsV8jvmITF
         Q5kRda3+31KHyx1kKmf8//G8h8Pps0BmRz/LIRx41yCyq2bAm/Hlx1Mr12Yb1zLpD69A
         /26BTcqVtrHBWdqRHWOG0KJauVsvdrNFvk6prKWZMavaOFQSO2qodSAiciSub8pofs+X
         bVgYdi9gEl/zwJtKI7SFGqtdEUGK3s3zwXLyaf5BGJmB0XG4KB5sKjn5tqf+SUDRBTKK
         ZWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941098; x=1785545898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1gUr4fQRyHAoHpwP1gqFm6NIZTzHOUhteVVgfXrJmeE=;
        b=rDzCxRPmROJn9CWiRlVasm+SDui3+8RbslPrB3fNBOfI5A7b9n4yoEuQfp4CHYWusb
         uTwXGS2yTaQqXhdb9dMNxfOCOskzgnkOV7klFcPojv6Lyb0x4lVHXuwRUJuNyPhAw9tx
         lUn1aqVhi6L64DhP7YZt8CSphh3ZKBfhSHLHHYy+LMtHGE7NJhXTXGDwdzidQzT+SQMg
         AWAESgQI6dgPOucMWYe4Lnlv4KOGow985880X1mK1wEA6nkKDNstmMECCr72cY6jtfEt
         5yy/5Prdjm9BOjyCbeF/TJzPRpCPeLfdJ7Ar2/q4Hbw0mQk/RcQ5rQvSnwokGJSzgNjP
         wl7A==
X-Gm-Message-State: AOJu0YwuzIJEhSuo0O5R9+RvxONViVSCgRMRuNoAgRQB9+9WaD5v0tYa
	8fmhoV0SStnAEWmW8fafmTC0iJepI0P+6Fwq3OB9uPku5xymfTcon4Ph
X-Gm-Gg: AR+sD138SucE771nOExhc2E7lqrKDHgyFF+PNoHwGPNWg7dAvE03CXOuWOs/lOU4rtN
	1M7WpYA/jtpEvgnkogGnpqdnCuLRtKavCJbupDipHMR17RPWWxwNDhxAn/KztR9NxTbt62/CfR+
	UC3wLUEE9wLlsv5MdYplIRq92bTU78TwY8W411ezS3p38synAGP9uywbL2q2/RjS/suFZ9CnPeS
	1Hf6IGJGoCqGj0sJjFk8aUMjuB/HRV2FNCGErQWQgdAqn79y883hIhyQ6viGWLz/1auL+GaTsay
	JB/COl90rwQQnc8IG14dg10x03WN27po2iu+3M1In4MrqrEKSjLM2JWft5MpLUQEaz9HRYq9k+5
	rpbo7YRlllCgA+EH2oFkOK6+gq1PzlQFNPWZfxuZIBAoXhqUVGlAJlLJwGdzihfY6c+ksrUsQ
X-Received: by 2002:a17:902:c402:b0:2cf:a2d2:84c0 with SMTP id d9443c01a7336-2cfde55bb4amr6478145ad.0.1784941098056;
        Fri, 24 Jul 2026 17:58:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc68sm2289265ad.2.2026.07.24.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 17:58:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Fix phy id check for the phy on com260 board
Date: Sat, 25 Jul 2026 08:58:03 +0800
Message-ID: <20260725005804.373698-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725005804.373698-1-inochiama@gmail.com>
References: <20260725005804.373698-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current phy framework can not reinit the phy correctly, as it will
assert the phy reset GPIO so the phy id can not be readed. Setting
the phy id of board com260 manually so the phy id dectection can
be skipped.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index b704b537385c..a26b18aabec1 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -174,7 +174,8 @@ &eth1 {
 
 	mdio {
 		phy1: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-- 
2.55.0

