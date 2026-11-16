Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841384;
	b=mePRRSeQmj6RWxHPOCx5NMDEwYEvxbfVWop4n2emx11oc2YGqEQUFUL4bns9fWixCOZy
	 kOwCZa3+bBTTDL3sfeFlI5+G1Q5n6cBY9qjKWK2LL/dyg+pMN8UcPFcg/jywsiogrYGzt
	 nLKCumpIVtVFrGDH/4C73iVmtpYyTP+lpjU7sxXpG4J6RwsSewXWhPpGhCqmVo7rbqmhn
	 CfC4HbAdjtoO/teaFOM+LEiDTxqxjDmfR/l8ts2NJzOGHczQg+s2sqRMEqr6Z0G7UIU0a
	 R+ssJLFzhdHtI5cWOEYSAF4jMml5+/eJVD3uwVgjPYCI/asRZb4ypb9YHb1wKkuXQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
	b=diBe8u1usKHAe3vf8Y3VzKHkbVXDpGns0Z7vVGKXRvEpMjSQODVw/Z41jFfNhha/1J2g
	 rvi69bR3rNR3Ulx5b+zpmgm/fEbJ20memTorZ7xfRDMALY2PSTlDl7waY1q6qbtehHEkw
	 sOQrXrcAVs/DjZ4j0Bf9mmhLGf95E5opHEhb5XQh9m+e+wS5WjbM1wMMsjw5YL51CjC8J
	 lBZoDCgE9098eR64HZsom2TBx4YbRc0QGiGSKT+YpXLWCwI++fe9WEtGJfWYCp+AJC5nX
	 O8egajYO1zmKkRZ+EWc7gagOepYg8vOQWTlWnvSF9HOuydPCdZtY9nZ0Q8B1P1Bxq9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD7606A8A1
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FBD7606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso642490066b.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841383; x=1795446183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=YEj0XDIxnVpNPh1DI2ma2SbX2pA5ZgtjEweikP1Agh+FH9GBYjgKpmyp+ruqzqi5Te
         mEW+DXBtzmB6vAV+BVH1GD+eQAe+yNKdaNHAph/os0MGvxmO/T3cdsH3At+3krs8SAEM
         Aht2+glUmrVQCK1y5xumU0DFyXOYOm1lnAZngFvntBfbT3c31FhLv+pOytir08+XLow3
         CePrFiu12Pf6mqYIzOGPhrq8xJkwceSvVsC1o8ARLU/w1EsHBsOthRsULTp8d2287XO3
         yLVX6XYXNQ/QvPKZnvCsuXN0Z9mWqyNvtDmv8QUTeo/P/1mMKe/uEczz7wOUlykcc/K8
         id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841383; x=1795446183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=TSQC5kG49kABirMJUyQE0IBB9IP6g9LL0mOCPmzV/2/GJ2K24uRAbKhAAwZD27fYPO
         0/l/+mKfzSp/Xwa4cddkwNOO77CbdrxHUf3lDmOvUPMLra8FGPmVYAAyfMfuGRhXYBS7
         6WN5EFDz4Y1OIafYIKpIEI1C2TCf7ZqggX2m7SA1K9PCuW1p1r5OUqRv+T0I2mPuAbEj
         UD0dOLewuQWMK4x9HsCn9vmRUyZhzNNujME96I2DEN4nuGNqU5b+GxA/3Yp/2KDP+hnO
         Cwbh1CCS6QoekBcMf1cDEKv8cpUyVBIBYvzq1tLrYMB8n/rELSeE66+DhPKyovWaUf3E
         T+qg==
X-Forwarded-Encrypted: i=1; AL+hErFy4850LZo0/t6Xk7pfzRf06LcF1WaZUCVTmOuJ5v8oyhVBvXb/99bsrN/kE4Bd8CEyT9u+QlDSXAzx@vger.kernel.org
X-Gm-Message-State: APuU4Z9RrAQDpMXYAjfstbC4bcayUIPrqR6j2rDBaxx6hiMJ+roU28cO
	JYtRqQ7r+I1n8IZtfJU73M8z17o9e+0NvWGQishQ8Y3SyaS6uST8sfrw
X-Gm-Gg: AYBFou1eIaFRN3gMKJiT4GZCjM7xxVd36ow+deuLTyf3Va4lL3XiuPEob1V3LJ0Yhci
	WtDY9mcZaHWFGpd50VZxIxNdGIXh/7qeeKpWyIkeQC7KpDuay9r7UnPLPSkqPVCFqqa2Og/fWos
	Fk8IPXLn5exkX59wXeKua02bpK7TvGYq3/tAQc9G6mZKZJVP20RDTZ3dkgBnyyuCVcIMfPJXsdr
	3Gd9dW3dxyiCZH6xt3PGkR6pLgKDeNoDT3UdLUfdBw6GOzXqs1UvoljJDIV3myrn91saAoEUn5y
	edEAv3EH62KON33UB6wTyM3WS7mbjFTZugGIRQz008XI4ca5JTgZvVb4CrTiIBXkbmKUwlBbIb6
	eWkXdT8BbX8H5RLB8qjjrz6YThTupWYFX1DMO62nJ/Q0CaBuB/ACko+Tr1vFlPh1OnHolV5AzS0
	KGt3o0HFRvD+eKswXvmn0WX44KaLy5+PuDgs/sn4p4YsazN4U++mIIlueWFHMzPDfE8q0ZJLTDP
	R+NfFXR/MlZ86HNg2O1/kypGoyrXujLWikoD5tOxgtVrYBT8ho6KwYm6yaU5iCkBSMao5yNOHjF
	5gEk2KxggxyaidlD9xtH3eFJV2z2Ukfzl8dNNKCh9cIRM3QnQid3xodclyEFJKW4l8X0qiX9qHS
	tiP/iZoFqBvcadfiLfxVMRvhODA0T0Us=
X-Received: by 2002:a17:907:a785:b0:c46:a607:6922 with SMTP id a640c23a62f3a-c50963d90b8mr891096666b.25.1794841382509;
        Mon, 16 Nov 2026 07:03:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:01 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:38 +0200
Message-ID: <20261116150239.264139-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..53899f2b1772c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

