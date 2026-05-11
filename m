Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AC4CA268
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525474; cv=none; b=b43R36z9QKU2K/uN1uI6rYAghO6pp/qeNImMU6ULeJeilC+got/OPXDeFEjNTjKNN/3RwgHLAKwII/xkeZQVdrLug7INd4M1wmrKcizyCZ62FFD5ZGh8T5cJWSTNzcpsXKue5VcAg3oyX0CEIHcCPcMowCv3fFmycOYloo13WZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525474; c=relaxed/simple;
	bh=nDJAbJCFuUB7OnJXjKjnKvBkXflAc5qn8SUxoJPyYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lTRoKYoxjd0AM1A6VcADVdrJCbr/jTLI5/1CD8UKbpj/8y3G4Sck73qHbijIUMeFxaLOXPKwG7XjYOvjXXFMaVBCiQgFh3A0tsKAMjb9rCeAx04uisPONTQ47kTBPToe9QkVzM9hB+cy14rjszg9x7Ygr2SUpxAiQx9Fxv/yhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZ2Zzveo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZ2Zzveo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0046078so39268665e9.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525470; x=1779130270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=jZ2ZzveoTEvVY1IJ2YGdes/ZtrfZ+Oi9pw5DbzFjU9kA6j+d1PsEiJn6u6aqvs+KzM
         7R19IjFUsajdZNxYHYEhleJP3YRFIJ7x8OHCHGlEuDEQk9nLYDsPa5TTJ05QO5DlD0JP
         /p0MDO/7JtDv5UFR0yTJJmkojv21NbEnIQJ6lOSa27bJF50RMuFZfWinUhNYGoPc8n4b
         uo+CpSj2tgwXHNL9qNQZsgve0P1EqfraqODUUHoMo/OESO/DQ+lL0zlaEalVPzsAZPPg
         /aXgqEG4XTpNYQSlyoA7SfJWSrc9/MSnzdm01DR1gvDFqJUTaOprc7i1Msy2Cwd9fvZb
         g/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525470; x=1779130270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Av9KMOeHNoLZjJvkQ1HtWMUmgg+DhH4RllPkn9qKDs=;
        b=MY7RsWzfZ1b2UOjoTwRg2fEL3odngPbdjsNNx6XxFx8XNSJyuDK8/L2DFK1abXwSal
         J2f/sLjXFNSEh6lC5hAMufNVzWatrcma0cqtaJQs2sjPjo0TQUC+lCdfAzLhsM2UHXaW
         jQJrwY6tEtc4bNRDgaSG/quk3fu+NVgk6rPgLnYgR9Sht6neD8M/O6G+5CDO4Jc/8MND
         8GoyNDBDuvXVnDo0HpSBAUjczZlCMQyHzqgFibXzv5G07cDRav+sW3WBIsxYg7HEM5zx
         2Zkz5uOr024Oknl4dNGc6l5s/VW4oeOOKiX2rxIvC2EqZ2fnbrvMlzNNLfjAqbEza0U5
         nqAA==
X-Forwarded-Encrypted: i=1; AFNElJ+5YJyjxrEv7S8wo9KmeqmwsCwvQVupWCDtYuupLfYyTI9gyoQ+G8N7lHezJOiLsMBfJyVRXDjg6wYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GqyzTLml3Ci5rJKidTbId1Jg3wL5B3pUzwv27HaOC1lMbvcL
	lK4aU/xrTnAzgyow5ZMs5y4aTaw15p8AEX1HJlZTlbFBm3/tkNw7ZOtr
X-Gm-Gg: Acq92OHQT/g2vKk7zpSXGiSdN3Ng91d5TLcMnKxUlERTx44Y5aun5q1Hgv9x5FML28r
	0lk4XN+XYLdYtKBh0SWDn6yUe1RMyDG9jAiLqe+r8imZnYOESIaDUd/AnnBzKBCb8BEfoKXNbt0
	Nn7ATG4pFfKXEFmMA+88eUMnYkOhJd0ipkQyr4PzAaHsCIehE7Cb3tDYUfofdTsq7izxKHpHtRD
	ag/uKNE2qKFXROqj6obX4cdwwvyYSFWvPUhxV0iA5ApyehgFkNWWC3PvzCl2Mz34bdxPjUFnrJ9
	VD2kG9Yd0BarpeBaZ+SomhAtXSo3wky6ScdXfOhhmrY6PrQcI2p3UCtmaTUSJxWhELjMpSV3Z3z
	jASDBK4ZXGYfIjkOJphce8iyiXlYNeo2/ww/DLMYAYPYksw/yJ//Ru0dngko68ChFTJSNRXrNLx
	CfO7/A1hvoKrqEQ2v5cVMliBjRZm3wB/uCdZPy/sWaCfOv7Jq/u5Cer6ROoj2rS/FrzSu3S/k7L
	b2/qcIHkry0A7blPyceZIps+392TJfoiwzxw+PCjFCEW7O+
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e706e0168mr119438945e9.26.1778525470462;
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Mon, 11 May 2026 19:50:55 +0100
Message-ID: <20260511185058.1926869-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0

