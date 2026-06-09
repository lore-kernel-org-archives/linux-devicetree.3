Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF59333D6D5
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968708; cv=none; b=brOLCOI0qr0JZuyJvU3UE4yp3qcEZdnuetdZqBIEiO/Ybl9aJe1+7SgAuo93h3NOWCh5ViQLrGRojqOowI9U1GEPrcHOFJbW1rfuO4wrkiR720k8mhV5zR53j7h8AMrfknv2y/XW6GBrvZks6nOBLySkOpAeMZnXdXmJPZVNma0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968708; c=relaxed/simple;
	bh=oC1QnOKW0S6EDRIYnPdhZj48Z/Xdn4sI0vTlEt02IuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KF4yStnktiKWBuqIbY2BB3IgZjTqLZqeKtleVL+SxX4OngP2S5X8sjcFsFNxegNSpdLNlisLe9iNKOEvr5VK/7QgrvAOwqExKXSNARdKnGprENBwzSQSn1ijSkJHnbdOdZO1dF42N/vpEnTbLOwHuGsm9FQikXjN7TaDr3KAUiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtzDV/aL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtzDV/aL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf18c30bb2so34626895ad.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968705; x=1781573505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UciuXuF9SkzGOJuh2s5ETTsCy+oZl/O5D36E7r4WTE=;
        b=UtzDV/aL38plP6UGt/h5evMelh4zlTBLdErl9NxT+E/4BqmRP8IjGldQ2fiwWnsc+X
         FRIa4OXEdUhTB8VmYCpW4WIw4VzoHoCLX3SwXQ0O7lbgymFCnKeNVxQdbvrQeAl+0vpM
         0p+EhYctSNBkNprY5vjWJPMWZhujKpnEanI6Vi8H5Sn4HZ1xU3sa2u85corWrVFau7xL
         +lwUChiE3r30At/mAFK37NOxL/slXWX3wor4fKkJqhsJFOMDzY5kQ5ztLX7z+zDcIuEQ
         1SN+toqaqB+9QUzF4S8KAWekcF7IfumZAKP6O5lcystgdQFVl/XqJ+3awWTsyC9qF9Il
         6RiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968705; x=1781573505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+UciuXuF9SkzGOJuh2s5ETTsCy+oZl/O5D36E7r4WTE=;
        b=qzX1owJIKNfoydebfmqqdt1AFSoSgUWW79y4BzbEvR0tIDreJV0DBZtDoupr0/IGUJ
         JTRCwKAfFiSLmt7mF2/bOrlMqkV/AJ9Ww+qOcCl7soiq1YosyZ86S/YIuWe6MHBxY1AV
         d/aYWSDRZbCKfAPWFpczhxnBASAPID2WsZDh83A4qeH7gJWf0wAMJbULCw4fyiH+hwV9
         +qLIhuRBxRaHM6w2lgl6mYvJShwo1ZG4V+iVDlm54T0w4SemGYtyZN32uLFsCMIEXDKA
         Cx78RY2pwH4JVq7raENv/AGmrVhIOa4//M/SrQ5BFbGgCIdp5IHSNGrNcsp2JjgxYPFh
         pXdA==
X-Forwarded-Encrypted: i=1; AFNElJ+tK/2QG/gwKX0uh6/yecOAON594R9qI1+veBBdybFl9DWdhXLpukeyPUk9SOUA2UW9lWPDWJy3LAU+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2L07Ubk87MqiHMxKTR/9JJX9yDCZugIl+0iJW/DL+EUQ2JJeW
	kvwx+2CdvB8s7fR5dKKSDTLDkv7UYmqywgjiCpgc9PdKfkisF+B4t21C
X-Gm-Gg: Acq92OFOpIBgUhnQjrvKWaMBxv0j9ICmWGM4qtmgzakYGFgwaueGGsBFjZTL8cDOXon
	7VLBT7Neyuv0vzK2jLfJEk5YMMvfdb0M38XuprXv+id3JBa2WPR3+IyoRqObzg9Et41IiA4HMGJ
	u9XCO/nB3umKDzMIV3lruVneQsM3lL+oMdtNlSpkbxdYa7AjY0pe3jQSRH6TSPbp+n6H3LcjKqz
	qNIbxBVUc+Lq/nIOMlXMLj0aGAYp3TU6YPN5gIVLooVJd7K0H1h2Mbsy+P7TJuNHW7JvQxMlaV8
	P757MnpDLFGY+1AiS1g24CiSUAugunrO6SWNwjwIKgo1emH2B5SmGTmUVnk29AX4VFJvXN20TxA
	EbKIf4c12F1PupaRFAbUgDgunN8a5jGxIrfyQj+/9orHiBfPgt4Nk3/7hIeiBhdY0DACqNI4z0a
	Ao5KDQB1Z14rMcKsldpzYXDJ55FjAad8EHFwlaVz7cfn5vkxmSxf3BnMojp31bffTJc6g6cFvpf
	rDZUnk=
X-Received: by 2002:a17:903:2ac3:b0:2c0:b932:866e with SMTP id d9443c01a7336-2c1e8934f70mr199651325ad.27.1780968704926;
        Mon, 08 Jun 2026 18:31:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:44 -0700 (PDT)
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
Subject: [PATCH v5 04/11] ASoC: renesas: fsi: Move fsi_stream_is_working()
Date: Tue,  9 Jun 2026 08:31:00 +0700
Message-ID: <20260609013107.5995-5-phucduc.bui@gmail.com>
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

Move fsi_stream_is_working() before fsi_count_fifo_err().
This prepares for a subsequent patch that needs to check stream status
when handling in-flight IRQ handlers. No functional changwqes intended.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

