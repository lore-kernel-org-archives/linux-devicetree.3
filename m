Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A7F367B90
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662035; cv=none; b=cdG8eaD1Cvggb0DuTYlZoxQND+L0cpHSW/dOOwRT2ZWrL6tqqVis+Z+LzNdRsmgS3zWSdaiF0wOvjQrJ5t4I7vb1v+4HtxJMWnudX0twaHD0yuYKDE3nNBjlOt7kGDCCtn1XCeWIKvuH7ucSf8r6lPAoEyGkQgO02F2GEnoalvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662035; c=relaxed/simple;
	bh=TMiHEe92SuAh6fgG6WujL79mYk0H4L6Yn425oPvB8uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwGe4OHIUC8etQmCDB4GUndredKhFqSXO3s+ZXGlvddXx3ikMHAw76Tr/or6Y7iRCJCSKJMkS4Nm88vyoRhS5kXj7OLmvHvZhmLORSPGdjLckuXFW6Nnnc3PzVbHklPvGQ9w1KxXeKxXiRVA1okOGRFdH6pRrQ+7ouv/r+RWVHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a01nWBZf; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a01nWBZf"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8584bbbf2cso1151394a12.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662034; x=1781266834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=a01nWBZf9sF1KHEwdo7dfm/S8kiyMa/XTflm+byQ84TeWOK6N0cgwr1tx1521QuTPI
         icP1n8pRwfmaFMMZu7I3tdjKay01nMHQyOvkxjSOrUTALW2GYv64PyukucF8NK7E2LDN
         gy+FGcTbxCScV5HMvz+8cQ556v7JS4iukL1AwRjN/sB6pHD/W3zSFOMfjt5mrf7nT33Y
         Ic49vG9yBMiRdHDOR1hM/L7Zn4LKEMmHfkhDi/V3HNFDAzrghFpUr7RfGDf5v+rLllLa
         gvi05EpOx6YkTpdle16eb5WxqscvSxsnEN0W9kXMSO6/t81ZAUiiO5/Hf+IF8Pd0cuQd
         AkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662034; x=1781266834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KsRhVTKGsiM8JmWvqFHRoyOy+2lKAlrjAXLVyytCHCs=;
        b=OuEHl9ygPUjIMBpt76M45IiqAod07GbQrV3Pu/cwbvLqUHv/9EuXiTm6n7iQHZ2RnG
         67s14622g+e+NCGXduFLlxTI5c/zAfQcC5U9vjKzoON4rivYh6+1rOEi2vvKpMdqUvGR
         Z0qCpPHW4usR0j34za9tmjgZzTFAr4JP202pmFNgVyxPR+C7iVIlGtlzLlvg4bBzxmpY
         QEHpwWjdCnAZZsAc394Ew3wXsTwMTYcn7QDz9T2+FbTyplEXWoNT76Xv9ERNaFIF1/qf
         NN5RjDTFon3AsF8pNsy05fKCMqZah3PYUoVcMgzxjsq20hc3HG//TeeKiSCSbmfAGn5m
         W+SA==
X-Forwarded-Encrypted: i=1; AFNElJ9uPw2mRSeaT4xe+TQg5C5aUY6K+CVtNRubV1jnETOf/oSsyA3l8QTpuTfbXVs7CQDlKXTsO44u4Xa3@vger.kernel.org
X-Gm-Message-State: AOJu0YwcNk3pSJpFnJxWUb3LGy9hAUbC36Sc4y8h6M9zBFZgvAu8QDD5
	ZbTL7OVofJGKSB1AvW7nMAa/4lwf1NVkP9REP9IDJvatnDIWxhcMQGQY
X-Gm-Gg: Acq92OHYLmdyetq4uSXTJI9bdERiCj2LVh/yrdouV0Guvc0zIKvsxGj0rnR7tEHQLSC
	kgPS+vKxKPS0E5uJp+Q37NiJfWSlBnGzGB9IzE/hj+GSQSRs0q7KzN3Ct438VRMUuOHU8nUS5qk
	OgoNBnOH2VbHkMTbNkBnAs9e5tt2yfdVkKXYw0QF+x9RUEhtRFRsM3MCqwNaXeQV1JSYczzsuC2
	kdBHwz1Sx9WhFOsBZgzcgw3WyJ0BSYERFyMnDfSzFVdjp9IBuo4+vZKoCG8y29f/oXx82a/ypgs
	ui4MWOpawoMHo6MkqteeSpOjxjIIyOaBKqxuMpszlkOcffBiWeoV6b1g7QGP/ug0uBOnrvTu1fF
	PRe5AmTNlkVy1F5QShfc3WwL2Ai42PfjdE3lXQZlR7fj18kbixp3vlc1HKEvuUgwsORF7Xwg4Ob
	PM0dKjR+bR6aXLCCQ0MwBJtyAre39CRuWI9G1Kcnf8XROph9msRgFiLTynCRItvgutoxad
X-Received: by 2002:a05:6a00:ab83:b0:842:2280:538f with SMTP id d2e1a72fcca58-842b0e74b30mr3311643b3a.16.1780662033809;
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:33 -0700 (PDT)
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
Subject: [PATCH v4 04/10] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Fri,  5 Jun 2026 19:19:48 +0700
Message-ID: <20260605121955.105661-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 94ab2e490810..429c3c9b6ede 100644
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

