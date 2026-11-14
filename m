Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699754;
	b=lj10rdG5UQzc86XZgjJcy7istX0VpTWZtvfQFQ4PBYpZ7qa8/cf2jvMKRd1EK02/LYUg
	 YR24hN/vQG1ICWVsYOj/shqQmIv755jr90NJChyglzokGYDu6ehNGlIQuUZa08h3ySlbP
	 Kvi0s0qfpkvVo7D+N9jTiHxaoQ0POhGYiYH/e3mlzW0SjZgCvCHSOqkGm1Y5cpFIaWWR9
	 iwS3CwfF/M2DQ6zAHG8VfBtbbm5VrwlyUTP4wmmzO8xyZfTCEfh6nHVW55+ySl661JlCr
	 YEryQO6TwDRgXYR3di/ZF8PHgkl84YRAqAsQiDR3BmRfoOHob4gAL9qZILDuxNriBfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
	b=OZ/CTkfxsdMF0DTMw6q8n29L4atYPuhatoUs1+sV+cCqVpADQ9HRYktEMFIJgHLYP0FJ
	 ElbeZ1mDMVuzhLFRLUKyqTfNRbsqrVjmADYaA7pagDjnBVh/ig2wE8Mig0nNu3iU5AD15
	 wlv316xSPhxDQCcdzVEkauxbVE+DKQae0FKvBOHiTe4g1Bkm5eL7SgeUC1cLkgbtGjv17
	 kl29BFgQJix6tOz/jKZ7ps6GMEyDCFgNCXy5N/EqAIWPiFE6i+aVw5v1CvvLu/NEBM406
	 OFSc3IomGAqVQpk7Mxld89CBN7AmBDJhFA76zCoxgEgcC9OpTMmhNTzV15FkFdhdE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAC606A32D
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 23:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83CAC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6b22be970so737460b3a.1
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699754; x=1795304554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=PzmXYQR15cCChYYvbHvZmRtbxA+Vazpm1dPjD1puEWhx0NHS5zVYdgFvLCRrTrbMVu
         AbiPDGFXmUGW4rbpcSXBWDfd8I651GINKhQKGtP3z2j/DEVxNHkttCAoOCRIznTya9Ta
         tLj9nHU+bxyuLbuzU9kk8koKm7BgijjngQLYTr+A0yP2mGjXl8d3Cv9wFOWn9lUvS0PR
         iy5QRJ+VhwVrcvMN8wOo6s4y30qiALwZesI2H2UmSDC8wdet4p2Vo3BNUFtXMzhRLocr
         TkwxisJZcvi/ws25jc/IbIhPqlHaciw358MQKaPrD/0kWpl3RijFo0B0IMpRItR3rcSw
         kazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699754; x=1795304554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=ooiN0sxXN9m72jwdiu3KXS83YaKhXHHkJxXT0n34ADuz4OWI7DHN6rFdfa+2MG73Av
         HUuopRxikOVfjPTVc54NsQRDGk98jQa/dWJ70Frms7sT6WPMAqpy1q2Pwk96bcv8hquu
         hJK0NqjjAmbaAa8KcPn2f1YUr3evaRAfoODWNl3emN8khH95PUQDh4RgxGu4DSHF3s+2
         kNhXbI1txojAm/yYIUFlfYMtbU2rCCMhLxHGNFCOx/3HYnKBh9HVWrGgYku7dEulyxUE
         kR/IipRkMfnY7asf0VKnWw25EzC0JY0B8MV9zfjbzYyH35zff1Scn+Nfp67KZQkVQbmG
         Qo1Q==
X-Forwarded-Encrypted: i=1; AL+hErHHW0dkRBigRevR8Ogu9R7a2K7yDDPR0u1JyNpcgHrDaDw9atBWaEo/ViEUqp0rhTOa4hT8A8X0ZQy5@vger.kernel.org
X-Gm-Message-State: APuU4Z/J7H9QvGJKgSwhfzVZvWUebPDmxQVmMS3LBIskCoXo9sT/BkVt
	F72cDzsu7B2OYKehs5YkRr8JEO6tKZiEzectVyXUre1QbE681pmWNEk4
X-Gm-Gg: AYBFou1EEHYtSOEEbVkeEi5Rohv5ec/UCa8JHibav7k3ZOshis9n9FBJmGddGLl8cql
	mrrUM0DQjnkfHJMpuTPAXWMlQxZc3+7TZTymGguEfSVQSM0ioGNVdCXPcF/9t6BXPyaVQ56yETZ
	mhuKnhhJh5ng4B/iGClP3nerAe1pnlNCqwGz2kYOCEJQQjDAG5YvD0dz8BC+v3ySms6YDLDvFqz
	1XRaF2aY14XeJwuK8uFEz+yT4g1q8ACi2lToatmG3RS3wWFxd1G4aUSdIL9XnuEdTzCJB0FS0Yb
	1qWXhWWEcvJzAaNKuX5F5jh2/AXEnPu3/8wHqu2d6lfhlMr8xm0EB5RRtbBiLO3Xl5yZfI07TT5
	XKxsLWI7WYLDhu2ORyddWDG7abLjnuVuy/sGPFCrzFs5gGtEeaBHOJa/M4U13ikAu6SmJNikX61
	yQ5aRp7AoR5m9z++WEBO0Lj8f28kak+W5q2VU+slREXetE6RIiw0zR/m4QgvAb5bX+UDUlMKJX6
	QzDmbxOU3B4uf136qwR516vYuBaMLT2XTiDY4s3mypJRZDamOx11/y/sr6IPECq4LSL9V54HbI0
	u5Y2rOA5HtGWlitPVlTtnl6SIGNI4aFvnjjQkogPOBdsQSRuFxd2gxp7XfkeuIVFKLv8LI21bSZ
	JNxzpV02j4uRoASo8vzUIp8LNKcF7V/stiqMC7zshaFbPN6VlCx0qqQiebovL7HKvbrHcQN1scn
	i0kQ==
X-Received: by 2002:a17:90b:3c4e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b1b0b67c8amr6550886a91.46.1794699753758;
        Sat, 14 Nov 2026 15:42:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:32 -0800 (PST)
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
Subject: [PATCH v4 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Sat, 14 Nov 2026 15:42:16 -0800
Message-ID: <20261114234222.88337-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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
-- 
2.56.1

