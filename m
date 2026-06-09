Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B127400DFF
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005164; cv=none; b=F8/ROpxGwPBBevQWVH4pEcuzipk7YK49yey/K1VxnzOR1D4VFGAxqiyFJoAAw2pfZM91sdtqS9yhKIPiD2kv/53cryfZH3tUVpuA/i49jN3U9G9NXfFQIdINW0yUFmDk39/nnn9bqYJ8CaHfDUn+414Xt4XGnrSN+DVm7sTVU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005164; c=relaxed/simple;
	bh=KLBeFBd8zRYhdnRHp7jNIs9piYCuaRzWB6QekH1GJ9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5M4Gnu4PuJm9SjtYVO5ZOBv/9p3bXq/jV7D154PM/gblkWtRq4+FwB4KPVBd3naaiC7Vzz0EM6T+3gvNvUqpEaDNvZhgRWhkS/G2DgnKNEqQYu/+1mVBD6EYWe6DWqMjUe0s5tpLdwkl+BdRg65nogWg6xsBuoqr7Vxn/7qziE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osmFXvay; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osmFXvay"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf237e1433so60493475ad.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005163; x=1781609963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=osmFXvayH0xWIaeQOzBVnU1TOqhOYUrrizKNqnaaSdJ1MtgVdkPg1wnq7X3OAn+sWM
         EuKw/WR87sbLH7miyucJMBuHRT45EWO5WJWiuKC2zQNCB42thvU+JM8n0LDyMlAtE9hV
         WMTeqURnlTw9yvHhVSUOUmh6A7gBQPSWjhogEJc5kxVkVWEt14tosEYbZZMCRSMwhuQW
         ZkZG7ynYnOEUUT6wHjkmFSJAIp0T/oIOx9yvln/tSaCn1lqmYjk5ITa2ja2nJyOTi7FO
         bmiey9INihUfnAQzVdqEkqsFbAOF90mM9vyfBcm6LtIT15mqnAoq8eTMZR69DZ8oJdZP
         eA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005163; x=1781609963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E47jwlvDyMcrvrKHDjZ9gREZbPczY+LcNlcn/JdbBhI=;
        b=M+Cpder0aGX+GFpAd41okWql6NgngoeflNEWYgVaLU2x1feLZj4+JWkBZuUkaOonHa
         YEwgbZ3OSWd4bLlM9H5gWFCAkYVWZ2g6D1cH4t7Mcj984UKX3RkvwGFRBeqZBhvhVHV/
         i2UDJsph2oAyTsI0Gw0zVQpbvWYCXRHYPij3gViXydTBVYU45s5rQY0I2ftP4oGjbZbj
         pWuAlJMJQQcb14nVsTmF9zWIOYQKrgZZSnLTezl1XYP/x9U3OIxjPB/qVvnt5JMeuSvW
         Rih39c7VJE17+1d4woK+bFIEcoIyDNY2OPAZTfx3OkuV0G75MMduSJXORu9xdOI0Tgjp
         3hcA==
X-Forwarded-Encrypted: i=1; AFNElJ811GReBoPdQchPDdCalP61/Znuc7MMD/oqaO4i7/y+hGlpNgtNX7jBUE7AQBfhq4RkjaCC6JYa4Z76@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SKJ6o5rYDZ2RrCJHynTDU2n/htALbQGTx24hoQc19aQw930j
	QITSOvXLMBM0akg3rAsQoRvT649cXwtAHbDd7OsB09ycZFWkt9SUS0pV
X-Gm-Gg: Acq92OF7gx+xVZtEN+XNvNapW1oxwZdMVEPzPVj0nP5+xFj/KM4b4ynWN9rekU06y2o
	s0lUzpfeHtZPzIq2Q/5EprlyxcGDdJ5MpL2GNgILe9tcpGWbdB89EqBdfkeBsGlVSGnSRqhuP0i
	HNeand38lJULS3z9/uJsVbTjRpRIl9aXAAanliUUFNUpMpoTi7Qt3aauAjk3SjM1FWjv8sWlnbG
	/cDnaZkZMD/oGgVmhEV3A7MJ5dNucChaNAImGlsen120Xs1IJkTP1mkqho+0Z1BHl7lKojPMJaX
	Mwn4W6zvP23eICpUOR2JNerYK0sagvH60rkjZBL6beOl89t6E9uUJ4/agnfPL/OJ+malg0Tb7Oh
	RCMQpFI9pICVxz82O0shl9Cb9LeA8E1XaXfMuCB/CMD0FRgOkjsfBXDi1n9e39jT0TVEqCzR0MK
	zS2oYlLjmohZVsyymfbsO0P0sLzHX73Qa2JVH27KZmn+5/gVTByDHlkO4U2wzKMvHlLoT/
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr241805645ad.31.1781005162565;
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:22 -0700 (PDT)
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
Subject: [PATCH v6 05/11] ASoC: renesas: fsi: Fix register access from in-flight IRQ after shutdown
Date: Tue,  9 Jun 2026 18:38:30 +0700
Message-ID: <20260609113836.45079-6-phucduc.bui@gmail.com>
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

In-flight IRQs may still be running when the SPU clock is disabled,
leading to register access after shutdown and causing system hangs.

Fix this to use fsi_stream_is_working() when handling in-flight IRQ
handlers. If no streams are active, the handler now returns immediately
to prevent hardware access.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
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

