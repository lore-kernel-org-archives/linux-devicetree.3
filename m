Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E01636BCE8
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402667; cv=none; b=auKYBH/R4c60dIisYVA7z0jwy3RQnYp0rHcbKWs3xPQjs4P9YIChRNLC2H9BfxpJgCLGoLc+gKmlYw4N+sUV4EHYNT07jMHh5ZKIDFZWQfCCeNU8ZUmb8/O/TNLsW2ynNXmJADDtIS7Iqe+IQNdMPkwmnZlAHG9WZfMnoswDyns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402667; c=relaxed/simple;
	bh=QvovCQmJ+gNwOKXmFubp1pSBgHFF8PAaDYbodfMiqpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MBdDdsQ0lTXT6E26kxf1QlUwCWr/eIvHJK5fNoKDGKTyyEcyD3rAsizIMRB3FKgId3CuVDGoGvTAqLpAOUQZ3pFnx2XgwEKq7eWk3SMQ18y5g43ybK8umWQ66qd5MfH/+15kLyqpARkdsKNOeDwPKnel/NLFxHuSzLZ2TaJMOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZLJjTuF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZLJjTuF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba21d32776so22522465ad.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402665; x=1779007465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZTpCoLEIdwznMLuQjUiCorab+JEwmfq0roatC9e14g=;
        b=CZLJjTuFWFe0/9JkJ77ScGRPDSqFksBX6HeLmJ3JFiJ3owlDrgBZW3rvEN+4M3k1cN
         6MVZM9CFNBiDhx6fKhgPPvS+4U7Y+Bsvy084fmWV0j/64zG7xdQs69vzsLeEa1JXZtNd
         zakQvtf11NsFX/wcGNzSNPZUYYcDv8BtgDN9MtG7ZXFms8100BfHiTrMw01qlY47MIsF
         XhMWeB6evIgRk3KzSF9+tK1nliL2jIyJfeTm5NcTnnxDPWhz2CiMdUSjMHf7A/dMn2Zb
         TEpnNaFxic3CAjmKkCJTzM7oB0i1/SGVsLJcwsWJfBQyL7S+HnwUTMUSwGDZzNzkRPd3
         qUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402665; x=1779007465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CZTpCoLEIdwznMLuQjUiCorab+JEwmfq0roatC9e14g=;
        b=nfKH0ppnn+iQcLUZMh+WDnHOtwt5v4l79Tc/9YKzgYKjS/ZXC2CC6lN4ryaBcsHzV+
         qIOrkoKJXBFoIhR5QHpIukpwhCsMlcILDQYkMzdRtbAVa86GYSH6xKc69XE6OUEw20ES
         oY63R9eFAIDtdvzr2E1h1ImzSmwjVqqgf8/DPhJysbFp9hBfLXk3ETFvzplVQVSw7XPw
         6wXqcl4vCW6LLXEbsjYkTR2vNOVHanFaF0t08A7fIQrj2Hh78g0nGtHRRJXsN+OtF3Qu
         k4DFdzBUGitI5yaBBO3+j9DwTUVnCm4R3bWLPpQ/IiONm1qCavjTzYzcxrgMTrYPsK2P
         mXYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BuTc6fac9OmE7BT/q6cJuq3+cNjq2FhDyiW4F9dIjjnZFetWb9jD0MJRygw4aXU0kAe1Mr/cVrW/O@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzocn9YvlK9vg8R0Rb70LB14yfUAe0JJG1+UHnrn8vtlgjsvcp
	rg3Mpxduco95jRBWthMyppjFuI5+p9TDvsifltpTgdHjRNG+QqVwIRHt
X-Gm-Gg: Acq92OFqDsH4i1dm7q2Fomoq6smYXzkKALqAdsQ6wzlEPc3jFXIg8D8QUD8xH67BUlI
	kOpOZAAA3EAJuEXqWEyfIklWoS1G2dbhAYmsMwZRb8o4mTvsrxPO04B0vf1r+55DqyFRbVIR9Zg
	iEVh/HUvMZkhaGAD0Vf+7goRVtw5nLusl1LIIyA9aUbFkgCn10KS4NGtCQZmPAk+cNcMXpC/191
	pCMRenfbchPu1VPjUzWFUirH775BHyyoTYW8iM+wo5EZX/RLSqR7cTy6Y1JHjuaqJ+A/Md5Na8t
	KrYH4zmbfSXjValnb8SD1xyAyzU/O9KFXyvukIGJRXewBIAiWw2FvHDPGmsn8H31it3i0u0VLas
	Vc97m3otlQJtlsxhqqTFMh2f6gqUg+BRCfcQX6wzz4Z9Qk8TEQ4HCaB10Nv7smifUbWD/JU4j0w
	e0c3hi4WNAF42tXCsthCKpAxpar6lrqpbhOqfC/nFEYmqgufUg/mmShCcYAg==
X-Received: by 2002:a17:902:ea0e:b0:2b4:5743:2395 with SMTP id d9443c01a7336-2ba79287ac5mr216845705ad.19.1778402665317;
        Sun, 10 May 2026 01:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:25 -0700 (PDT)
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
Subject: [PATCH v3 09/10] ASoC: renesas: fsi: Use clock prepare handling in startup/shutdown
Date: Sun, 10 May 2026 15:43:02 +0700
Message-ID: <20260510084303.122426-10-phucduc.bui@gmail.com>
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

Use fsi_clk_prepare() and fsi_clk_unprepare() in dai_startup()
and dai_shutdown().

Prepare clocks only during active audio streams to reduce
unnecessary power usage, and ensure clk_prepare() and
related operations run in non-atomic contexts.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index b93809b5da15..c3ac8b30f342 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1644,9 +1644,16 @@ static int fsi_dai_startup(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
+	int ret;
 
 	fsi_clk_invalid(fsi);
 
+	if (fsi->clock.count == 0) {
+		ret = fsi_clk_prepare(fsi);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -1655,6 +1662,8 @@ static void fsi_dai_shutdown(struct snd_pcm_substream *substream,
 {
 	struct fsi_priv *fsi = fsi_get_priv(substream);
 
+	if (fsi->clock.count == 0)
+		fsi_clk_unprepare(fsi);
 	fsi_clk_invalid(fsi);
 }
 
-- 
2.43.0

