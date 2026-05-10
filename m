Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128A36AB47
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402671; cv=none; b=goryQ5HnTTZHbrv/ZweQHbwVJ/tSBrBRX9KuCXGD0O28LpwAbee/Qqrwi+le27UeL5mWPAn50G+cDyzYfRdElVHilDc9UlHPkkeGcLjT2aI3NOXSjgIKG+l2BTIE01AY2/E2K7l8O7/nlI1a8ZYqvAs6aIT0z2VpkdztvDrf7qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402671; c=relaxed/simple;
	bh=hWWNXcujvCRjXLBYmvogX9Tx7LSARP+jOFk6z3oIOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tM8R9Q+B41mndGua2KBqgT5QAXRoamGpucuugaAMXBOBZuGC8yirs6gS1HEffZQSg/oDk8A1tEbd4W9NF6k3QKPEahEUY75w5UN+XmHNiPHS/2EYExd7Cx2h+Vr7aSF4YKYaYAGNguRL6FTHdmtTUY6XecFaj8T12AnplZMdZfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3OIGi9i; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3OIGi9i"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1866847a91.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402669; x=1779007469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=U3OIGi9iF2g714qjCK+4M4635sGX0DgtTBpM0EEJUpyI9Mcso0o7aULhDlLrZjyCg0
         ieF9qbMHb4yRkpxpEG5DtvlGFbNwt6Ap8Vts5W9Tf7okMzgVkhCE0Kl2h3xPuF+1rJ1p
         TWqy1OGQ77NCxQX7tJnevZkA4Z0eHW0glaC9UDHbceCjiDIii9hMpsvakzrtD+GlI8nc
         KhUXQ+CAkUXscCzAA0fCqzhChZA9qp7z6uN9WbePxEZYu+6qh48VeAHsvBtg81DZk5SN
         zonkxqaq6/wBT+cMZxttBtjiegk+oRT6GtsJacYCtbqoschJY94UPlJIr9JepN9y6Loi
         4/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402669; x=1779007469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjT6LUaCKBBOaTLM4HecbTdAzAOftGZyuLAMAnfg8dY=;
        b=Y0PdRYHo8Ck/GAh+6lrp90XL0Col0Rd+zDh9jaM+GcflqOVpr5cWbXYxRJkcntj4DO
         0RNro+oAF5YgfOckCEJgx2Az+27GDiwmHhXwCAAyenU1gctw0im4M0JmXrcIDfLcdpKv
         5ioSCimpahbodUOeL0pcV7x/EIR9xEKI2fgtaloP8BRN8pSLd2jYdDNCedVygayQUUFe
         PR2YOfPu6De0BjhNvQtxZGH1egzOJdlrIr/hnzAwE40tCSAdFNF5ew872JzkkvUUV6Q2
         GvKWJ44dYhefkk1/MZRC2pMLCfZtHExQjQ6zHFoep9qmWm3B+DkL12B2/CiWXwvil4Lh
         m54Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JKQWwGALeF4yMazOxoZCqrCmg2lBYFC2jdpTSXK31Og35zN3/aAkKmvOAr1zF7Zq5Q2hN48kS44lR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Ykmx+fmEcy5EAbFsUEdusKVfFt5k0HjHy0+773Xvhnqy16Nk
	tN5NQcfYHuwpacaTEg1hqeCe/cVNNyWeqU9inyIsfg5eghHAJLcmHXHD
X-Gm-Gg: Acq92OGj6cOgV0p4516erEJlbNP4FV6vS6hrbR93jtOZ2seNSVh5qDAgkwuuNO4nAI1
	w3RS/HB2V+YYIkA7oauHysJ27t/Fqqq9xRPsyfU5L5AYa766rtRgqvYImTEKEod/TB4sqL709Oo
	/XHxh7en27xhIjNGS3aLUxMPZL02O8I64I05ZxRUReM9/xRpVUlxYZhllVslwhPJLn+O4JAwZzG
	610fnG4Yc/aYQWJ6Zh4JwL8WCTato1/bxbza0latdxVBLBjxDmMW3IVfWM0M/pzgpvl7du12kr2
	44p/bSlC++PVZbzigHiN/JbmHP8glSpB+ac2QqhrtdcGyVKt+6k0zLAUGHan9Aw9ZDFkj8bdfKO
	krirWcWaY25drwD3I1iNzezjRwpGByE1EQDsUpYnvbJmtVISGnRCe5BhkW+c5xjjjidk4XIARDr
	URXh6+tvi1nE45prtWnr5VEwySK5vYOIQ1qSMCsDYsUx4g1A3uETAwzoESjg==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4ffc:a7c4 with SMTP id d9443c01a7336-2ba798c0a22mr174893865ad.24.1778402669575;
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/10] ASoC: renesas: fsi: Add SPU clock control in hw_startup/shutdown
Date: Sun, 10 May 2026 15:43:03 +0700
Message-ID: <20260510084303.122426-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable and disable the SPU clock in fsi_hw_startup() and
fsi_hw_shutdown() to ensure the clock is active while the
driver accesses hardware registers.

Previously, the SPU clock was enabled by the bootloader and
remained active during operation. However, after adding the
SPU clock to the device tree, it is disabled automatically
once the system initialization completes.

As a result, register accesses may occur while the clock is
disabled, which can lead to system hangs. Manage the SPU
clock explicitly in the driver to ensure correct behavior.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index c3ac8b30f342..5307085c0615 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1579,6 +1579,19 @@ static int fsi_hw_startup(struct fsi_priv *fsi,
 			  struct device *dev)
 {
 	u32 data = 0;
+	int ret;
+
+	/* enable spu clock */
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (fsi->master->spu_count == 0) {
+				ret = clk_enable(fsi->master->clk_spu);
+				if (ret < 0)
+					return ret;
+			}
+				fsi->master->spu_count++;
+		}
+	}
 
 	/* clock setting */
 	if (fsi_is_clk_master(fsi))
@@ -1636,6 +1649,12 @@ static int fsi_hw_shutdown(struct fsi_priv *fsi,
 	/* stop master clock */
 	if (fsi_is_clk_master(fsi))
 		return fsi_clk_disable(dev, fsi);
+	if (fsi->master->clk_spu) {
+		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
+			if (--fsi->master->spu_count == 0)
+				clk_disable(fsi->master->clk_spu);
+		}
+	}
 
 	return 0;
 }
-- 
2.43.0

