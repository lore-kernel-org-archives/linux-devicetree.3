Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43009499F01
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160076; cv=none; b=t2GKpnz86RoBF4h6rohrLJd0b3X37+rF6yg32c+r/kA4xU+IZjDq/LJTO0QP78BnEFk3VdUE/gcandleyQZEb39oXAGOHAohUqfq7LP3cMucR10ofKhKjlFrc18IbPkvfmPvtZW9DFtMGIEA12t7D32g1SFysJbXCwLUDulLJm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160076; c=relaxed/simple;
	bh=zrebjrYHLxlkcLbOWhLADCVn448m5K5z0EZUcGG0+0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHOIuIMPA0oHpqGssNG2tJzB3suD8UgECZ33Sr9Vqm4E0x5DV4Me1DC+dUT0Re0KoB2mmH9BOaxWhMeerC6THcdRwO91BU0/tl3M3yDE+EWw1WnYY2QnoBHuZN9aQ/LQWAoVhKEb5KhAaL3j8DagHwLUzF82GQ3IoiaVQvZxpys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj9mLHOT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj9mLHOT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so4408365e9.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160061; x=1790764861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ix3tO+d9OZKaRLRpGMWc7HAXEvurMPfFvhpnn2QHvZs=;
        b=Bj9mLHOTsWcq1mlqYhEDwsulSgdRbgCRu8/8iaA1wliFOoVt2mziwustNaO0W9CNdc
         UyjvOofDNHi2b31xFLrYTe5wraaZnpUayJRwdGFZeuDt1b6hSYlr+vNkBTPoHXbMqZsh
         8HR4s9eLKSsnELfJvPz2/AzX7vEv8o0/IyKHI/p5xqaUzKYNb/RE5Gkv29cnMafZBhf7
         S2jAZZPFa5JKEmo8d0VAq9WkgvkBJncpMCZD0oJfcpKvuW3MuoHkGLUACTc4GSS4y+BA
         ylzynqK36LXH5o61vadQtu3LVhfpKdqDCXY20WQU7JckqAxIijZCEVdnhEpZpekSOpzm
         fc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160061; x=1790764861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ix3tO+d9OZKaRLRpGMWc7HAXEvurMPfFvhpnn2QHvZs=;
        b=C/fGgUAj+E+dCj6VTYo11RtdyXa9aEX84le132hYxxdR7Kn7wuVdv4n7DQQHz6sEyB
         ulIXttrxvlOLfAzLVxOm4yWEFUm3VxZbcqaAM1eYITH6jCRn48UrnGFey4SUIgSUuFiQ
         dcUixx6pSXYU44QR6ol2Sy+nQC7lXpaPVvKaOGOmgEqfYPw6WMDG3I/kJg+BKrcebB5c
         eSMqEOrO13NzCUiOINNjowqi1Pz9w3vX7QItTvFFT1jl9X34wNVjqJw7KUyDaXQhU5kU
         ciwdLT4NHpLvx0VHvL3U9BXwt/FWhwI3GbjMN33DhFsfAX15dvkwWy9LHPMS6qyfJtGH
         Cfqg==
X-Forwarded-Encrypted: i=1; AKwUvBwDdzwpe5oGO4MFMdVbRHkyC218+GgQTwp9EZ9+D2fSBK9tshyHcT9unC717GW0/chnmwofGk/S5gDd@vger.kernel.org
X-Gm-Message-State: AFuF++l/Z2lOowIHhi/G7Qfx5WHZSISaCTVn6DKJFujonM65PHKmEkc1
	A3oQZPSqIWPvvmyiu2gAxShlaREBzEpooPSoeAUb4MTJzgkJNgOWxLvs
X-Gm-Gg: AYBFou2cd7arYhvE1KDiAG0NsMY7XBKNQjt2QEwNrRbScGDeqDu+3Dj+tAvmP4vmknO
	ocBzf3RkXbFdCUxqeebdtDf7itohwwqMMqKcOIv7oMyU2DZRJJsGKDvG2LF1DC/xm6LuL2p2Oel
	A/U2XElusLxtYRWbSOAyqSRKZSZhZ36ROccocFzRIJqtY4VH1pZyCzKDsd5I6/rMtEJKKrfCfdZ
	YZ2LXio/Z7C1K0LikPDsjWkvaGxE3EyCUUW/aiO+z6WamLhqR/OPCDXsskgR9RKxizPYRp2eVBn
	ReGJjEFLsyf3WoIzg/NBlS+/oz3W/eBMmW/7YU3GQy5Y9/LTY8ES6Atx/rLet9yd/Ch/1Jo4L0b
	L61V0I7YFzvQK4zxknuAjCI6lQ3WeDfgR+UhSQ3+LScC+s+MEKq2Wz0eJmEkcNxI4Qfpw+fsM91
	MpgoA3Z+hfwz0jMEJa2gLG0XHF3005iZeaPW9olkelYPv7eVWVd3/QqNEKJRZbJ9Vu3vjLY/Q7z
	pchaeMVH9olXMcZImAKtA7tVgipDWPZbhnIOeSrRi4965PbNTld981dDRWCZdNKUsn+aM/X/N+F
	BzTlyyUb
X-Received: by 2002:a05:600c:1396:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49fdf135413mr28275625e9.20.1790160060973;
        Wed, 23 Sep 2026 03:41:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 2/8] watchdog: rzv2h: Drop enabling clocks in the restart handler
Date: Wed, 23 Sep 2026 11:40:48 +0100
Message-ID: <20260923104054.3324830-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The watchdog restart handler runs from do_kernel_restart() with
interrupts disabled and after smp_send_stop() has halted the other CPUs.
Calling clk_enable() from the !watchdog_active() path takes the clock
framework's global enable_lock. If a stopped CPU held this lock, the
CPU executing the restart handler can spin indefinitely and prevent the
watchdog from resetting the system.

Keep pclk and oscclk enabled for the lifetime of the watchdog device by
using devm_clk_get_enabled() and devm_clk_get_optional_enabled().
Remove the conditional clock enable/disable operations from the restart
handler so it does not acquire any clock framework locks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 057b890de0b0..ee1649e0edae 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -191,22 +191,9 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	int ret;
 
 	if (!watchdog_active(wdev)) {
-		ret = clk_enable(priv->pclk);
-		if (ret)
-			return ret;
-
-		ret = clk_enable(priv->oscclk);
-		if (ret) {
-			clk_disable(priv->pclk);
-			return ret;
-		}
-
 		ret = reset_control_deassert(priv->rstc);
-		if (ret) {
-			clk_disable(priv->oscclk);
-			clk_disable(priv->pclk);
+		if (ret)
 			return ret;
-		}
 	} else {
 		/*
 		 * Writing to the WDT Control Register (WDTCR) or WDT Reset
@@ -291,11 +278,11 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-	priv->pclk = devm_clk_get_prepared(dev, "pclk");
+	priv->pclk = devm_clk_get_enabled(dev, "pclk");
 	if (IS_ERR(priv->pclk))
 		return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to get pclk\n");
 
-	priv->oscclk = devm_clk_get_optional_prepared(dev, "oscclk");
+	priv->oscclk = devm_clk_get_optional_enabled(dev, "oscclk");
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "Failed to get oscclk\n");
 
-- 
2.55.0

