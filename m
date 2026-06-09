Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9585F33F5BA
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968712; cv=none; b=f189BRmfobullJJbQQ9p7bZasnOodIuwZ67jaCdCAGeSaxWlwJ4EcVeHFoUepAJUzF4EFcKWN2El4TtLy5wdxtaTniEy2ZuKAproayOZH+/i16btc3XTjyFEiQsty7md5oMrA8q3iv+vXS2FZEJqrxOWE8j9CtlSD2+MVKWAVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968712; c=relaxed/simple;
	bh=hoCOcrMSjaAWKeNIF/wdCoUBsEe6mU/OTO9zKbkRgdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1uUNkucy9vpsvcPnscrCTmpC0ZRZfL7ObYnBvJgKE9sg7y2eU+tA2HTbLE1VjHbtM+jAwXJCc8933S46MfRN/vgPKlnzlWZDsGeB2sqsZlXmWyvl6HV21o1nDa0h27Mut3At35sxRJvZNMViQNiwOFQMPmBqxrDo1L44G52ylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Esy6C02X; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Esy6C02X"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0aa420401so38201175ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968710; x=1781573510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=Esy6C02XDUQLLJRx8HU8tSLCGxfpuBZJywUQZsiNuoVVO1bbUU3+TjVJ4TqALXaMGz
         gCcSkzYoTLrir4aB17p9VwwwY3FgBn/7FRNeY9celMTKFVyxXyoXRfrkq97jx6cTcog7
         BzVbf1ukq5XlJMfZ+h+IcINY75Sjg3E4Mk4Kby/ChRaViySIIrKR+8E9fIKvTYsRa02X
         SQW/tQH+FGAbvqMmVBJKNNeqjC9CTBk/28jkDvTp1aQ79POIgsOFMCeSARmHzHVUn3iK
         WL7SrfJRMEXiaa/j98D+3PRK/p/DyKaDRgiRg0BpxMIml6TB1DwkDVQuuatj+iBxOE3t
         ECnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968710; x=1781573510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++sjJT39ps4CzpziCYW8Pzk1hFHYus8aC6jLUnr2CbM=;
        b=soqZA65Gwbq0JjBPqBVReVknTSyxMQin10vIJExPZ+3SiIS8/xAEm58+OTTCXzbaEe
         SEDZC8uAtO3kyBvBhL1D0K/ZGDtTYhJj4PKzvcZJwZ4uaK0WTABRwufMWWC4O54JK95X
         mJ/1ZUiWtxeWjlNcl7f9m+jxrAMYRrqBVsB7NngyKVbXTeNmPUqoFMN3ow6CD0TfhZJD
         /REB59Hsu66DHXQtBXIRccmy1eUrhHbEw1oPDOUmLjrR19SfimF5LfkU6v6c2RXq6iY5
         vylVfsBE8apl/3jiPNbJsa0Tn1W5gUKhPg6GHr3T7FRb4x5lLyOIeHpu20wGFVVdL97s
         2RKA==
X-Forwarded-Encrypted: i=1; AFNElJ/op1DiPN7gjC/Kqk3+RXfiMSQK1NXxids+D7Bl38YRueEGDNz3CPrMTUNP7kCH880uwPNUVI7aHoRQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4kl8T1OdSIwe/y0m+PgeFS0YksJZk5piGBYHLqXAenarweM2D
	n93guAcYmITcShg9+RKT1AjjD/md36Wbw+0GGFCHcCpGSSnxx/0rydcQ
X-Gm-Gg: Acq92OGnNqWsDu4CvaHmpWiJEUw4GLX4VOu9GXSX0GhI9bYYDUMpOzNeqcWtfUyNcgK
	Esv2Awj5aCvzu41awkRBaRQgk8hqpoV4BlG27f7smGMCOQkpAPXbzgVPnIr5poWIdpfaJJoVPWw
	TtlTK1AcPgDFUXhlpBuSQBaMXZoSCrqnVBZxYrcI1fYOgu8KFBGWcm/YZXIQlGzfbS3+ZJ7jEww
	PPMbqyha45mv1cp7whOL+V18Xk0xpiSjsnwfAZUDwSiRA2r3UmiHHjjJaZck6FwUJxB7aPvTj/r
	ASuLYu8+qN7U+iNwLn5nvUCH26SMEiLcf6B9a8MJL3rP1Exzs8f3I3pmznhVqoXCvObqQvSE+Ls
	f9PccMCVIN4FIqp1y2/DpCl/2MqdGaHMDZ3W8zCSDEWkwSuHnT7qzL7y6V9Zy29uQHMDMGW2/QH
	4S+xmN+CcUK571Fze8uWNUfV+dYcTQyEI7ozSJb6pjq9A38ScGtdwP3SQj+Rp28OkfuPON
X-Received: by 2002:a17:903:1aed:b0:2c1:69cb:4423 with SMTP id d9443c01a7336-2c1e7e527bdmr204388505ad.14.1780968709665;
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 08:31:01 +0700
Message-ID: <20260609013107.5995-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - use fsi_stream_is_working instead of running_streams.

 sound/soc/renesas/fsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 0bd0e0c8c5a3..3e3c6fd7c56b 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -470,6 +470,10 @@ static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 
 static void fsi_count_fifo_err(struct fsi_priv *fsi)
 {
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	u32 ostatus = fsi_reg_read(fsi, DOFF_ST);
 	u32 istatus = fsi_reg_read(fsi, DIFF_ST);
 
@@ -681,6 +685,10 @@ static void fsi_irq_clear_status(struct fsi_priv *fsi)
 	u32 data = 0;
 	struct fsi_master *master = fsi_get_master(fsi);
 
+	if (!fsi_stream_is_working(fsi, &fsi->playback) &&
+	    !fsi_stream_is_working(fsi, &fsi->capture))
+		return;
+
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->playback));
 	data |= AB_IO(1, fsi_get_port_shift(fsi, &fsi->capture));
 
-- 
2.43.0

