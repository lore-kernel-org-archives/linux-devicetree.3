Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39E400DF7
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005160; cv=none; b=UlNxPi8EcA1SElgH8MgUNrCfmqRMSPIr+kJixWH+FXrHGOe2EawvreWZR5Fb7MCZTqyOfSpjoBbD+e0sZrnYMw4UwMODLSapx57oYPk7VOMoetfiZIE94aOvh0Nj0eLW8Vh/xgBaQ2+SU4Eu1OkSZgYPmWZlSL3KiG8YelPWrmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005160; c=relaxed/simple;
	bh=ZU2QqApVqvEo5X6AM4WeF7JDMWioZDbuBtbtX/QxkFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PopXUKIFVYXUt9tgPnqYOZePfGIu1upw6Cjvb1rffLvYCfYcWd+swzI86stVNu+8DDfm67hueyKkNEqROnEsjPhA34B2v2nRR5ZP94ND4yPUJ5ArkdScw8P2iyXnX0kmRUtsqzXRPk/ovpFJcUGX2u/B0rA0N4Ji9WAa0vhSaxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kqh4BB8H; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kqh4BB8H"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0bd02d97eso61026385ad.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005158; x=1781609958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW9dUme6TNQwUT8ub5SHPZ5CpB9qrccUxB5qRYGWeaw=;
        b=Kqh4BB8HURyADWPMv71MwCW2L+foiM7MV8zPXw+ilQOI8z9i3LeKb4UVTTQx8XiG4X
         +zDoX1RgO8XpJMg5lDUzZAPyXSJHuO/WI9cKq/DijkCB9Z2SkM4YK3kC+KV4sId8+DTT
         onTyoLk8y8ZS0JqL7rxNx+5ElyasacDfZUkdDrfiZNG+KLYCAlBcgLWq7fF+3JsXd/1W
         MRjLIMw3OH9juWnXLG5UyOBYjF4VNDXDbgn5MdgC1Tx/8NtH2CMfedJQXkaMbX0mtYol
         LI7cclAZYgcBoijLU/uTxC/Q5K/Kr64x8e86KlP0raGZl+61Ih6LwBs3epBi+16uGzXb
         +3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005158; x=1781609958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yW9dUme6TNQwUT8ub5SHPZ5CpB9qrccUxB5qRYGWeaw=;
        b=XJXro5HlMQXg56WwUo0AFvx/2E2nsCr7QfIgI3FzSkP2Fll9ZPETdjblWVvnb4aYS9
         z6kiqj4RFbldyld731H812gspJFyx8HfZg4k9603ms3Cq2GVZUinNYXX5TQyjhQsAL7U
         ZRAWRGZm9Jh7mzpHtqKnauQpgCzYHQMzbDzvfzEi61mP8U9nI01JOLYD4uBS2hqmSBpD
         iYGJIHbH9INd0TPz3VqUC3RgMhwogsxl4PY5E03rZJx/ep7fewZBcpBCHhj9L3Y57oNr
         OO/khTqlgYwjo89gwD5IklrDQMbhE7E+9nn1qXKAlGAJGIH9/5aAVnhcGW2lAZESjZmX
         luWA==
X-Forwarded-Encrypted: i=1; AFNElJ9i+mdFIcla2FiWJ9Bgra8x5jOriQzfrX2ezqL/0bphhvfjsdLDCyIBaO53CIMDp0n5h8Dx7tqdrv2d@vger.kernel.org
X-Gm-Message-State: AOJu0YyUFU48mYuuU4JI+fduKfjO9ArLiK7sxg1ETgF3tAj1uzBk91WF
	uXvd+TqXtqJa5r8Th0d7gBmhI1lwO4n1eWzdElrEWYcWGIggsEFk0wtC
X-Gm-Gg: Acq92OHya08GDGtptivkrk087NNFjUxV07JMAopd7dA8bi8XwEDwnJMZn1eoWipIyfo
	s4gWrN6hPDLMTkceT0FJ5R60YBC8rVg65dMixNn07SawNY0iFuMdjLLWsbFX+WJrkRldRAsnRt/
	tI7ehg0gI29GeoAGx3G/ibk5FfolGyDZAeGqRfN/q4dUfqEIjZK6OWGDXjx9mPOw85s/5DRYg3N
	r449VipXqI0XiAWQi/nRC9wO3WSJDrLobpm/DQ7l4T2gw5wrJghZoxjO37QZjqfofYVDxv7wiSq
	Q5Kgq75GuuwOe4qcKM2hZK1P2Jf2Tbvg6uQHMHYZ1BgVUGrumZPWYIUOtCinClH04fjEpovONxl
	i9b6JdR6iS8TYwWc2ZgSpDhmreWHwwqF4n4POLm+6RblTKFYaHKjyf3/VA3nssRcLUPXIPXaIgj
	x3g8+yMIR57J+xgcm1ZPTeNuJCQXLq+5Ln51mmG4Oy0MzUVXXqEYKl3vu+sg/yo8Ld/DnM
X-Received: by 2002:a17:902:f70f:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c1e80d2996mr249158845ad.1.1781005158114;
        Tue, 09 Jun 2026 04:39:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:17 -0700 (PDT)
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
Subject: [PATCH v6 04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Tue,  9 Jun 2026 18:38:29 +0700
Message-ID: <20260609113836.45079-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 800ac40f9680..0bd0e0c8c5a3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -442,6 +442,16 @@ static int fsi_sample2frame(struct fsi_priv *fsi, int samples)
 	return samples / fsi->chan_num;
 }
 
+static int fsi_stream_is_working(struct fsi_priv *fsi,
+				 struct fsi_stream *io)
+{
+	struct fsi_master *master = fsi_get_master(fsi);
+
+	guard(spinlock_irqsave)(&master->lock);
+
+	return !!(io->substream && io->substream->runtime);
+}
+
 static int fsi_get_current_fifo_samples(struct fsi_priv *fsi,
 					struct fsi_stream *io)
 {
@@ -488,16 +498,6 @@ static inline struct fsi_stream *fsi_stream_get(struct fsi_priv *fsi,
 	return fsi_is_play(substream) ? &fsi->playback : &fsi->capture;
 }
 
-static int fsi_stream_is_working(struct fsi_priv *fsi,
-				 struct fsi_stream *io)
-{
-	struct fsi_master *master = fsi_get_master(fsi);
-
-	guard(spinlock_irqsave)(&master->lock);
-
-	return !!(io->substream && io->substream->runtime);
-}
-
 static struct fsi_priv *fsi_stream_to_priv(struct fsi_stream *io)
 {
 	return io->priv;
-- 
2.43.0

