Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A036C9C0
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402663; cv=none; b=Lw0OpBguzcq5RYBH6yhqT53mFIhbt+ML+bTGl6Kn4ST12QAhXYUcbTV8HG4pEtOdBGE4Vplh/Ul3QDRwcbLe1KiXT8Vku2eEBKPugd3mM01wKOb9k5JnnIEq1uTu1TLdLheVWwTDnIizlIQRn4K8RF4RN0EACSevQKdMZVuXqMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402663; c=relaxed/simple;
	bh=hAz9cVk/REbCqtvF14qK2qb5B2E/7eVaibiWkjmIo8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZQVhvx9TcWeH5mVBWLKkoAi5iUjEl/dl9xy8G7AJC0hy61hy/0hNxzmQnt6XxnZC1odRg3hUMKVk/JxYRxgrAutXNWkFlVcC/SpMmAriMmwPScVtIgaadYHUoIT5sjWF07hic3bLIrEEDF6AhkPDPkp4onZLArUIG+/ns1CEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuqfS2kt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuqfS2kt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba4efedbeaso24113045ad.1
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402661; x=1779007461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=ZuqfS2ktak3H8/wpGlvN/oR9G6PeJSWihXJxKqWvWGVMWTFmxHF7+GItfSk3Uvh9oj
         Xbtphv/I0JYqohufOtIvjd6KXQLIlYkbqWWZgiCZkAnkKnI58uFSlAWXjhkpPjkIDunB
         mHHj13HFY68B1GdNDkvhzA/S7K+gy+iBmQgsMP6MwyYdqpLzpyNP4ycmiCP5L9517Imb
         BJe7TWabFuErDbIW5AhupqjotMmwpTMgSB72yyPOLxET2iBUUigpKSA/pO1ASgCfYCZu
         jUyxSezrjOliE8onjutuay6Bmjy2fuPts7IFRHwxStJWVMI10hJPRDGhYVw+vAcpQIQl
         GrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402661; x=1779007461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2/zYcrseTTot6/6qcImxSuA8kM1CWD/r6OyNv/RP/c=;
        b=rYo4LQRdS7F8+ePHtrLekCON9g8shwcsDNobQI+4LZUos8X937k3dxVbFEfHfRlhUT
         R1K9bnC6q1h8xw8rAWwXJ4mIkkP/SGGEW2ab6Cy9rkXGyjcN9D8TJAswug3fC6/3RRSX
         KyFDqqEItrE+rN5GPu4XzNWGT36G1suzB1j0Lb07T3RWjinWJ8vfaTTuhA2bLlYZLWLh
         wGnbN/DsIxPpNqCvwwCS8Q0ajh2K1qDaY/O5dnxAkB/sAMR8VbVvqbjIYvEMKHZR2sx1
         8yqi2pJJi9H7X4tPv8ie9PzNbeQQbhhIou+bGMcvyfKzgd8dZsVAbxA99a3Mm19izLQw
         Cwlg==
X-Forwarded-Encrypted: i=1; AFNElJ90iPbeSkCGBt8etjWk8GAxxjpcMrEvpp9X730v5kGD0q0xeU0Yg5szhw+hJzMG42aQ2iPnBsgyx1tn@vger.kernel.org
X-Gm-Message-State: AOJu0YwEzMEUu0T6mGv8i9uU+gru25Y0wcpHYj5CwYbwihD3CIdHtt0n
	aLNpUMCdoNDBW3aHvxSrLiQm3JbHOXc4mjiExggnANbhb68RiWC86Dk1
X-Gm-Gg: Acq92OEoSkUysWY0vMh1mAoGm+/rF0gtrIFN+rWXm54Nuc5kFKDeiwOwFqUq1fNsNvZ
	s/1e7n2OGyA1ayQouINVS5o4a2NrdAMMq1NEaceV+b0wbLB0OQsusIpyBCaFOBg/7i6JlRyzz1P
	DLvS5fFAw2Jb4/woorqiO1HX0MRqtZEt6NvgCCKhqK3JWnqfmuc+Jh+Hkq7G6fx/LyI3irdUAHS
	GhB7PXccTjVyG71l2ds7AusSUj6OO6Y5/WR17pGNDcHx5L6HIEVd1zC3sPkVqh9TW3rUurnBsz+
	uxvSg1fWi9EYlaVjqYFeW+8cK0C9ixi8lPtYoB9emtAS8wRgDsDmDSKeoQPk8Z2qb4lq20lgNh6
	ZLZkyZ0turyhaJtKAQuNDz+TbKkhsDfd8YwA4ZNC8mj/73EpWaGNXRgmytOm2jkCJ9B+JfUO4hV
	apLTjBaFr9c8YwGykxaUvB0kmRdLmtYr1zKUp6m41g1UXaJ3BfdkePzpPf+g==
X-Received: by 2002:a17:902:fb0f:b0:2ba:6ca2:bca with SMTP id d9443c01a7336-2ba79c20dd6mr140989945ad.26.1778402660935;
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:20 -0700 (PDT)
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
Subject: [PATCH v3 08/10] ASoC: renesas: fsi: add fsi_clk_prepare/unprepare()
Date: Sun, 10 May 2026 15:43:01 +0700
Message-ID: <20260510084303.122426-9-phucduc.bui@gmail.com>
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

Add helper functions for preparing and unpreparing FSI clocks.

These helpers centralize clock prepare/unprepare handling and
will be used by subsequent patches to move clock management
into sleepable contexts.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 66 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 8c46d6806958..b93809b5da15 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -732,6 +732,72 @@ static int fsi_clk_is_valid(struct fsi_priv *fsi)
 		fsi->clock.rate;
 }
 
+static int fsi_clk_prepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+	int ret;
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0) {
+		ret = clk_prepare(spu);
+		if (ret)
+			return ret;
+	}
+
+	if (!IS_ERR_OR_NULL(xck)) {
+		ret = clk_prepare(xck);
+		if (ret)
+			goto err_spu;
+	}
+
+	if (!IS_ERR_OR_NULL(ick)) {
+		ret = clk_prepare(ick);
+		if (ret)
+			goto err_xck;
+	}
+
+	if (!IS_ERR_OR_NULL(div)) {
+		ret = clk_prepare(div);
+		if (ret)
+			goto err_ick;
+	}
+
+	return 0;
+
+err_ick:
+	clk_unprepare(ick);
+err_xck:
+	clk_unprepare(xck);
+err_spu:
+	clk_unprepare(spu);
+
+	return ret;
+}
+
+static void fsi_clk_unprepare(struct fsi_priv *fsi)
+{
+	struct fsi_clk *clock = &fsi->clock;
+	struct clk *spu = fsi->master->clk_spu;
+	struct clk *xck = clock->xck;
+	struct clk *ick = clock->ick;
+	struct clk *div = clock->div;
+
+	if (!IS_ERR_OR_NULL(div))
+		clk_unprepare(div);
+
+	if (!IS_ERR_OR_NULL(ick))
+		clk_unprepare(ick);
+
+	if (!IS_ERR_OR_NULL(xck))
+		clk_unprepare(xck);
+
+	if (!IS_ERR_OR_NULL(spu) && fsi->master->spu_count == 0)
+		clk_unprepare(spu);
+}
+
 static int fsi_clk_enable(struct device *dev,
 			  struct fsi_priv *fsi)
 {
-- 
2.43.0

