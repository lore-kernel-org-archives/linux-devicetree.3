Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08EC34CFB9
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782916216; cv=none; b=vCp6ads6T1nuk6HAXEwavab38KOM4XItebqb/TFW9pVUTl3nbKBqiOyYHZdMXZai1POTFgzTqnzcSzlW0AMr+2xL/6NGX6S5Ncm0s008tF7WNoZGoCudHf865SYK7rGtwhwX1CYg2id9fGfApH1JB2xfu6YIyMLH+PmSUExuUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782916216; c=relaxed/simple;
	bh=OZkCdMx+rjplXJXoJyNaMuNBYl1kd2GTMziWSPNPsHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AORfpxYIJb23ufTC0x9fDrxHVerkinZOUZW8PqhvE9egSspKRm3KBG7RbxE9qMxH/znjEoZXolZR21xT0elIDsCzdssxKEs2zPPL2tab822GqKVKyFAwBzB/+GVGIIl8hXBXUOw9IRCwm5olfFumQn2+XrmrGhSSCNyfp5zK4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho6L+XgT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho6L+XgT"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-473ba028d46so718665f8f.1
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782916213; x=1783521013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l3tUihLneFPrnWysYsFL0qPvzOr5P9+eaScNelAyF4=;
        b=ho6L+XgTZSpIVFZhRy6DeeDBiABpJVylcyEFeemLet60dqYTJ8w6szCEgu4mXPvYDI
         TbmZMPiNdItz7qLuCUFhe05IxAseSk3JDFPtgtsJNfrKi6Vf0szSjRojxOPknDQWm5gn
         VX2w1g44eMAPElRIx9YJXzQByEDwHPZRvbxXYdaH1/66OOcR/3omPPb3jQ8RLcrIYbCV
         2/QRaGij7uq4qeqJJURFshdL/WN8ISgjB/Lo+JWk7sMvYv/YpCi3NiTsatJ37vpEth5M
         3SBJ7rdX/evGQ5jfwwTCOz51LjUFaHgzkcI7XT+97L/GA6TD6svLkNxJSlXtEt9OuBSW
         IVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782916213; x=1783521013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0l3tUihLneFPrnWysYsFL0qPvzOr5P9+eaScNelAyF4=;
        b=HbWI9P1usmguVogCFmhwqVTTShzj67d/dBXXdKXg2LDlx8nrCHvdS1HTgdjNTq5cmA
         T6XnnLFvmm0hwHLR3XfqAnL40Zc37Q9XmDZZBUUguVajl+4S4yY5trAUORL52wDu2jI8
         tM4a2H9Ppu4Tk0mLM9g2nQ3xjL/qteRB66IqA58PeMB8aT7oZYT1wts6f5WZ5aSpglw+
         nf2PCVZepklf9uaYnzNiFdDciQBYFCP+IcFtIocZ0IhN3G2oIAcGIrUiEm83DDpQdOHH
         xl1Mc4Kwe95ccYbQpChicMXBmVV6kqqRnlnc/loXPOGkfzzCUKQ2b0l7wyKYaF65NAIl
         akKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTSHGF8Ld8J2Lmi3dcjqOQOYYIoPDrBrwBxXMWZ26WCSE40/g4YxLpRbeds5wIXxByAFKm+Uehvn9m@vger.kernel.org
X-Gm-Message-State: AOJu0YwDq+PJR/vvmur83L4A9I0PfyNeAOqEZC2u+K22uv/kiUWsOF9f
	U0cDexXSxGoDxyq10Vuf4ALE4Da4i/mH+pbCMkybYw6melX5SN1szfe7
X-Gm-Gg: AfdE7cn80UhHv8ShfvZODX1qTL9ZlpFoq5G68yROczg0cxUZioJ8+N2r2u0qbEvguGG
	PGiG7kY4gNokIvnpLQsF0yVHzWl677r75FyTnn4dTDUmIH2ZV5sxYv86RuO2ph+RkCoasLzNmWB
	6XV/LG+IrK5/hnayVi8KqKPa+YRAj2AyfMMNb3ImlMCq9kFKL39s452USB8X+DzPLQtAdpCcoAk
	XSutCnMc3skX8Vqx9j1kCIIhuh9zSK/PegO+DPNwQUfXce/K4PyuiTjtLddAruJ3uGnv0JSjqns
	qR+rxhs2n/kIstgNsb0A5DlStHTacc2rExopoomkvcpAW7jidLzcS8C+gXGa4kEf6ACMzwb9vnM
	PxTW06HfX3zpRXNkaDwFBLNMw1VlYikK05U90hc6DjoPHjEForQRZqVFhLEDcPiIuYN6LVvduE4
	ngHCtiVSukIm57z+7h2XPFc81mpBb9hZP7Om2LQF5nwT31b0VItunQQcuq3xVkXz6yPQJN1E+qm
	IOMyKvzmD+IpjlcEg/XZqNhd1Ahg3wxmh0RGw==
X-Received: by 2002:adf:e195:0:b0:460:64e8:2553 with SMTP id ffacd0b85a97d-47757e57472mr3171049f8f.4.1782916212964;
        Wed, 01 Jul 2026 07:30:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5353:5ce3:a6a2:3b98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94c829sm184902f8f.24.2026.07.01.07.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:30:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 08/10] rtc: rzn1: Consistently use dev_err_probe()
Date: Wed,  1 Jul 2026 15:29:51 +0100
Message-ID: <20260701142953.2014895-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260701142953.2014895-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use dev_err_probe() in the IRQ request error path to make error handling
consistent with the rest of rzn1_rtc_probe().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 4540d764edfb..f236b08e3ca9 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -470,7 +470,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, rzn1_rtc_alarm_irq, 0, "RZN1 RTC Alarm", rtc);
 	if (ret) {
-		dev_err(dev, "RTC alarm interrupt not available\n");
+		dev_err_probe(dev, ret, "RTC alarm interrupt not available\n");
 		goto dis_runtime_pm;
 	}
 
-- 
2.54.0

