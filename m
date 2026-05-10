Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86636B048
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402639; cv=none; b=de/bh9yT9Kqi2AlrQg26rUKR/5vWgC5Wu3q/gWLzCX2ZOeU6I1hHGTLlEAw0aKoRYlMz0oq0p1PlQCLSfjmm97mfN1awsikiLWPuE0ct6qS7P02PhuzQMt1G6Y10aa2xFPDp3qYE6mGhGUx8sfq9Au7wfU7+gOAsvyh+3tVoEO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402639; c=relaxed/simple;
	bh=fM4gHt0e//5BUtCsC2xSRMm5hE/9shv/vWhIrjQ3IWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh1GT0sfmYWTUmOWJfye4RpeWCI6cPe2VJzUygQfItC2eDYKKzCBJX/e5d54pRc3uMgpg1TlLT0vqQfjxLCq2l1jDrS/S0sPQSOkRrRwi6CpLVHt9/DGKBO65+dQOoT+rMMuxQYsCL4BdtNqMw8PwizWuwdNgYJAzcJVjBQr7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFwAYRoe; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFwAYRoe"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so1203220a91.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402637; x=1779007437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvQv6doqVvGzDq3D82vRr7BaPX4RYdGSl0w44lqU1ck=;
        b=ZFwAYRoeLj7qabzGcUau0T2T8W69A13/ziG/DyygxFzo/ZzomyEU1kc3vHHmqv07Xj
         XRifRfchk2TMzSoP9g4ZwT47lpoZD5dpkexXxKXeJodklN9zn47KAlPd/BKvsCkAR/qN
         a40jk76ckwYc3vzDyKytNOFOAZ44/WNTn/b2IAE5H1gKrzX1gEBYwGM1ieqyNJcEPMH3
         YO1CnGx6LLqS6JzXV8kgFSndSqWZ/NnAj2m6SoNT1ZFOMcIENyscaZV2kz52jvttyplp
         46hvOh4FPzKJG8Gznb++32MUiGL2GY2ExAeS0xk2sAfxdgqf4zHnbFB27Oxk9iq9W//C
         OQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402637; x=1779007437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvQv6doqVvGzDq3D82vRr7BaPX4RYdGSl0w44lqU1ck=;
        b=BanR6FpeRFt7FFgpKXVE3kU52RpCt6oaxarMs14/7sea3xYqhvZfA5qKHxW4e1tLye
         XdVHpq2cbxZsZJHdYObKgzgVs9gx6ABmYpD3T14beycvmu2x7F1hhLCiZT4Ue5CbZV8V
         88LNco4pWBFeJuLdOaD+iAfQW8/n8q20XDndbX8ZFcE4b4Ptc4JfBmUxTM1JdvmUChH0
         I5SVv9QLIbXYS+daUDxSfNTTtM3bgC5dswPsuPwSYJqM+EN5D83MDk2F0vVvKT1xbOSv
         gUHorrt27sX4QikoFwUoj+yYBw/YePQSMaxm/bdLpCqMsKhEDiCdgwFcwsGE1ot0YnWR
         W+mA==
X-Forwarded-Encrypted: i=1; AFNElJ8MsUBkooGaUnubdf6FvyWGMmBbMB3rqNyNWK6FGf2XXLIVX6seATaj/jb95Xz/XaxHPJFYQX/dtl+E@vger.kernel.org
X-Gm-Message-State: AOJu0Yw50yuDr3BG56cCm7Bpuq5DgApKWE79TD7Fuf9qxob1WOgqfxQJ
	NFfV/GMPXgfEmukac4EYZbsM2erxuZRF6jyFOJn0tsiX0YMPMj9En6CP
X-Gm-Gg: Acq92OGmG2q9dtuN1Oy1HN1B6YcroeVzgsh6JE9r3eTeVzmj2Cv/nXLgsqzdiw//fMV
	B9uT6pmrrmVKX6yAgv3XXmufaa14JA+VIiFslVuB6uqdEPUzxPRTyRs9jdvnF6qygfxRuaJj5ac
	mj0kTLr+qNGUE1Lwh9AYqpIxfmyFc1hSRHeQzONz9PRehR5VFtq2zHawRBReKTd4Qq9KAcWGt76
	XlpXQYin9lTZ1OUUMpslcHvbnLXMx4CP9PmgjQibQa0nuth7PEmBg6d0zDTOREWebFiz5VFHlvZ
	uRWa2Y06nRLCOBlVVBhmRXnhAqhenP79lNpxhIozCkKE7v1CcIPq+veg026jRb4SmA+8jOHX58c
	cr7YSZgojZL2n/tpP2NCYgvx6dOkxKj5s2I9wMrNe37AO6BjvZTtPilJLxWnclSuF7GXfOYbDvJ
	0CkijrmZDpJgBh70gIGNCuUscLb1YEIEzsFZbdBQkMf/WvHKjhucIqTvRjHg==
X-Received: by 2002:a17:90a:1c88:b0:365:d9e2:7511 with SMTP id 98e67ed59e1d1-365d9e27b9emr11473695a91.25.1778402637211;
        Sun, 10 May 2026 01:43:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:43:57 -0700 (PDT)
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
Subject: [PATCH v3 03/10] ASoC: renesas: fsi: Fix trigger stop ordering
Date: Sun, 10 May 2026 15:42:56 +0700
Message-ID: <20260510084303.122426-4-phucduc.bui@gmail.com>
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

Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
This ensures that all register accesses are completed before the clock is
disabled, preventing the system hang observed on r8a7740.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8cbd7acc26f4..94ab2e490810 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1586,9 +1586,9 @@ static int fsi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			ret = fsi_stream_transfer(io);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
+		fsi_stream_stop(fsi, io);
 		if (!ret)
 			ret = fsi_hw_shutdown(fsi, dai->dev);
-		fsi_stream_stop(fsi, io);
 		fsi_stream_quit(fsi, io);
 		break;
 	}
-- 
2.43.0

