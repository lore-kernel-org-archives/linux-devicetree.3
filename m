Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434261;
	b=sRSH5eLEnusdniOGU6Rid/FwWUeJy7j2V2lEmzfTC9aUj0dopjnpKlC55GnCBjUG8xdf
	 jrHAQGDSYeRz6Q9axbJYpQsxNIpzupc85M6JDb8dVHWwQJkyEA+W+FYcsuCq0t1OLBAr7
	 U6BfJKXC5cnGZHvOIjkeNx0BMNRuoLRBz6WVdnxuyBoUFvVD72/X71vYtzavoHgjT/7b3
	 y5Fze22Ur9mE/gpqbQo+J75BCBb3529c8W9MtU7JdRqFrz1xp3gDK+2Rsq3ElAgffzEZv
	 5V45+L0Pl7XoBVPLqJwMZgUbW6fH9EeGcEouUvaZkKDy1eKzyyn0qqJ+ev1qcduwoxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
	b=AACY6vEJ0Ic0qZ2eztAhE/v+vkhDGc+5eOxSAnsWDiRPsyUh2PsB3QlTeFIduI8LwJrR
	 TTtndZQZCP94d+TQ9AXHAq4Q5OPZJftsBViCjnOawtQtbTBbfQ/pxYWjsdW+uPb/oOsfO
	 lKHiFNDh/5+orfOs/E5k7dLbxhgFRX66ZnVBeKldygFZZYG8Tqj7kBVOwA5edQUcOFW2I
	 bzedUA0ltu8KNPlHEYsBdzzk+RxHA2d7iak/NdpJsU9G8q0nf/TBWX/8IDCcQyexokCG0
	 FCT9gxeowvhBA9SGElAD0YVLvIAYj2yF7vXecm9rE+5+UIV8jLgU9aUe8uCY7SrtdDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EC606A8A2
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944EC606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXHAYuoH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2713970a91.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794434259; x=1795039059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=VXHAYuoHU92lfwUVxtqfkVZGdQiNbVjxf1xXEV1GYQnL17GdS6R95T+ObDNlDmzinz
         pICwPj37iXBxXLTWt2tjwwJqcSbeFg1StgFcyp3IrKaYoS4aFivkgZybTOBkz6WP1lbb
         Habps8kmQ+GE5KgDT6Ipvpy7G24hHm+/MXrnc2MSxkSeqnVZTeQdzt3ISK2qWifjuBct
         Z4sfhZv3Tkxr6CappcuNZ9a7MIXtFIp6Q3ahlQLCDQQ3H22wG8XKA0JhNnKXanEwjorS
         FNrNT+UtuRJLME5T9ug0pLoQvFnr8E4aBOkTj228wOdNiq8m+3ZOziiE3Wa818rBzLkM
         Ll4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434259; x=1795039059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Id6YLrXdo/sbhtyWZLRtT4JHuBONTss7g5b/bmKuAI=;
        b=2MWPYNH35oelOVE+InC/Qep0wqoK7Y2RSHvIoM1bi7BhjQrKMTv50kUszcgAbhrHfm
         uBWlR0NuhIod278DG4eF2XJm+phby3DfLfBYy4nBpy/ZJl7bKbaHGHW3XIJWEwwwswzG
         ecXkVrqGE+WcjFcUsDf5qM+yCDjmbLJtQCTrayHnHwLcbTGY57e9z96esE/QS0rupbcG
         IUd0KzyMSj8V5QF+HGu3YQpwHE8INZaBZsKCuVzd4bxTyfMNe6+l7RYI5w9gHRHVzR8q
         DfKBPoekpmy2X+chhunveIBesreC4pUQCsEq4RHslD2qrmcp6r17vCYAcmjcVUrPJA+D
         Fh4Q==
X-Forwarded-Encrypted: i=1; AL+hErGyGB7bqKXYwYuVbzjSS+UnqX28YSxZOE2DlyPlib/c/nmSkV8PUZeoRQSdQypPcFaP5xA0YWVG2ddo@vger.kernel.org
X-Gm-Message-State: APuU4Z+r9tuftylVUiJYHDqYoT9fMaS2xk0v3xNHKR2ZN2Zy3TPOnDTs
	Zha0k7acNqW+aoDSNlZsp5V6e+M/3xtwDCqfTc+Ke4+9Av4V9NbXTjO6
X-Gm-Gg: AYBFou0KGe/ePZBO0wyZWMT3rA94bTCq3+e1eIxQZVKoyF2SqBowESj4ND5UtBosvYG
	1g4Q1obcJ0O2qXJbvi0rjLVvHB3qdd+EARZSxiHiYR2bBd5j4pYcQ6AqxWiCZ7MNx4rgjlr0lku
	MPT3BBOJHilC0sc1l1MMO2dL6/bYJoK9YCnFBQUbHe+hvzPJIjE9lD4WWiDAqA6HsXqOLGejT5y
	q2scP1bTk5Ab81xJod9qJ5g0D11ZIoA8/4nzj9EfpnuZprAhdJ9RRY2c/dQUArRmL132ZQoIgaV
	69Lxj99jL0RbGw50HcOVw0tyu+EVhZqeBazYIGVa3hZU0M43WZEziCYJi93of5m/XrrJH2sSK9e
	nHH+ZBs3pDcSJszVh/5zehzWynligcol3WwMuHIMyi3zPOsMSmQBpOosHqZcYDcszDVxJNC46HZ
	AkY8eU9rL+Egwu9Bx/uKMTuRWH0GkoQp8Q0p0IDLPFoUWA76SBeZ5xLlnsNWblhmCmfZ1mAO9Kf
	3wL6k3D403IOskWgE6l4xZGNtlzkh5LjQN5+nL77IXDBCxhCqgSgrnwWIJDlDwlOJYGT/7wHsNz
	Iz/iF3GXP/HC07zxPQq1+A+vtMHsZTRWurOTEgYGZC5x52+GLELOB7tvz5mTrKPJJGn9zPkpPUP
	tYTbQ3pxYSVmjDG4XPb/yaPqD4W6KeWrKf/gpUj7Hi88rSnxdwHmdXeiF1HcfhQhUMYrjPSM4eS
	Skgw==
X-Received: by 2002:a17:90b:134e:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3b182ed7a6dmr3796484a91.24.1794434259067;
        Wed, 11 Nov 2026 13:57:39 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce556dsm965429a91.6.2026.11.11.13.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:57:38 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Wed, 11 Nov 2026 13:57:23 -0800
Message-ID: <20261111215729.10683-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111215729.10683-1-rosenp@gmail.com>
References: <20261111215729.10683-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.56.0

