Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5BC33AD82
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968706; cv=none; b=rHYQiG1L50tgQcKgN9bh8b91nBW40/qyGcCQ0PetiJMA3ykcuRyJsdauBCnP17PdoDoEz45jw3rrh5xJNbC9Y1amkhMd6ikBi2J+EdtEQ9a800jKRRUhSfMnEf2rnThkuoxtnzi3ZOyIrMOnyiiNEZQ+wg8hRzKwwU4Zf/BpQJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968706; c=relaxed/simple;
	bh=HR2XMi4IgvvxzIRMtqagLrtw+MsRURUfdGIgwEAiD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fa3+zSV2Xs5WppxTwzrv8eho0zXX1moFNtFJd5EupKIPecCVTiHcxFI7tbjvVSLlQCsC+3lX47BS8LO06k5aU1mkwTgmTROwvT1JMRexlNzb2kyWmi2UutqXYQ5kyakjjQYTRZtdkx0skn+PQeyhW+k2fw78Jhe1oURgsqN0VZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyexNb1e; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyexNb1e"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c132ac5ec2so48589565ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968700; x=1781573500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=HyexNb1eOFLLdh0as21+T+4U69QcWURlFFY/wlb+ydzS0TOklHujAh6dGa+h47cevQ
         ajdblSXIx1w8Xt70jvwFHvRdU6pPl+pzWkNiye/aO78yr+r4vxOZZmqTh0KbgalKUZss
         50QfCqBZDZ8uAX7M6G+9KdsEGw7mKKuLXEI02zBpwFJlddL08YgkVaXZPA9KRYB0xlC/
         x5wodow4Hy/+gY79N2vrFcvvWJeakRhwQe/e4inm2h8MO6yTcanxpg4GQRwNMSvF72CF
         C4G7mJo9IEBqeY30FhsZtqRUAnI2gEeCd0V2YpEae87iT6lCkIFSEO3poXhYIesBARkE
         4usQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968700; x=1781573500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fMCzgBaJYvdtNejaaNJmpNBT14tIkvDZ23jeMItsrVQ=;
        b=fEv/vc8Ai3XGhwFOrQc+CKbMdnP+JEq+RbSiUrxtJ0h+SMdJbni+NSW6oIrXNnmmHY
         yaddzetLSyr+rNve4HEpZS2Punpr/NdDrsJ51xPlWejZdA/S5VUuSXg7LeTjfK1uRDMZ
         rV2VMnGW/HDsXaSt4jooD/DwIj3eaKH6DtJdaayB6FmKVHtLMgWbIMP68b6x35kDDDfI
         R+IOTZ3A0pWwO3oVHxh53ZtOWtIqjBBMt8mL2vYc3IlyF7wDRLctfXABEZNJFEvvdn+4
         XvyTPNfxaWT6rdAXa/X0u4WXTmF3T6RUkaC/KmhmV6cdbIDUTyH4YlHXHjBW8fcnc7vE
         vcNA==
X-Forwarded-Encrypted: i=1; AFNElJ9Hbo9Di1FQ9xqRSQat7pPaXXVeLcSGaL/eZVeUev99Lxq3fnU6f1V1Lu1kqEodutqPbbJM5Ob9B6aF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+54RTfXMqLVVtjabAkYVs0JUKXxAG6mH27X7VdsxjGqOpT4Ad
	08IHivywJYYtLlXtZGvTmv9/RGV+D55NoyE6mdQp2V5c7N64QznZb8TAvVp9uA==
X-Gm-Gg: Acq92OHMNjzS8Ajn07F/sR78tElejjMtxyCJsEl08ft1H7SG1SO7RswfTyuO5fK3vWt
	6/0LsbptM+JbFO+0DZ1ou692kQeDqhvlO0pdvIRu23XQKiOJJG0cFSnmVX63vPjr+tmCl6txNfG
	fVBMoI/dGAL9QFq8LQUGo7yE+EzEuDMGEtKLzEOo3WhugHN4IPBnXDcYs7PWKJ0k8igzuFwaFcu
	MNR+Sx0g57FkQrf3fc2bAedDHqwBAU+3yOlAy/KXs9opDzjwYPQVtjDnBJaDfy/8SfMNU0DuHFE
	zUPYlnJIPlNmkDE/wBw2sNhUti1PY/L0+rIxZqLXDRWUfvIyFJdA3cPsSyEh312bTfyKIgR0VT/
	OXtCFXMCuvNYSfgnchiXfC1GH9FiNvttW3kNmPmB+Av3oGOaRx9KnNK6abiqTkeOs7Oy1k+sfZV
	5ZdAFjE+ix0foRR9xX7paX5trCtcvZEbfKp8ApUZcskJv6h1plyhrxRpd6dXpSaczqKRuR/9lYr
	LguIHQ=
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr143994245ad.16.1780968700102;
        Mon, 08 Jun 2026 18:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:39 -0700 (PDT)
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
Subject: [PATCH v5 03/11] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Tue,  9 Jun 2026 08:30:59 +0700
Message-ID: <20260609013107.5995-4-phucduc.bui@gmail.com>
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

Call fsi_stream_stop() before fsi_hw_shutdown(). This matches the existing
order in the suspend path.
This change ensures all register accesses during stream shutdown are fully
completed before disabling the clocks.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v5:
 - Move fsi_hw_shutdown() after fsi_stream_quit() to prepare for
   subsequent patches that use fsi_stream_is_working() to handle
   in-flight IRQ handlers.
Changes in v4:
 - update commit messages 

 sound/soc/renesas/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..800ac40f9680 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,10 +1586,10 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (!ret)
-			ret = fsi_hw_shutdown(fsi, dai->dev);
 		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
+		if (!ret)
+			ret = fsi_hw_shutdown(fsi, dai->dev);
 		break;
 	}
 
-- 
2.43.0

