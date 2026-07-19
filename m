Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7431352D
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 21:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495632; cv=none; b=UMcFmrwSV872g8WlzEW1mogKVpHPFAB0A5d+QX1kPFwY/cO66jq7fNXiFpUm2IxuC5uvIAVf2GMI3W0t98Om7gmHHdqc2XKziUo6c28GAoUW7jcCoR25AugfRhLhztBCnX/xQsBa3BoIjvaqwd7XXwI/MbepI7gJwFbJ1pnj+8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495632; c=relaxed/simple;
	bh=DDsOXp+Z72kK9qdiLJoanRdwCGRm/6FA5U02/PGt8IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aham9LjW8AeADIlNOgTyC/aCV6pFBrYpHoYXEa/wOOoomeINwfph1v8qAFpkufLjaiBRHsfDUTMsWG+vYMoGqgS3MPD3G5udpAw3eg/JLkIw0/j2X+ZZWybkNWEwnOhYDRAPjZ3sT6AGBQjaZGiBw3ZInFWGiRDpAxbI1ogp8iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIa9gVkV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIa9gVkV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso11178635e9.3
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495629; x=1785100429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=oIa9gVkVF2xKl89QwfpcQQrPKVawR0oHZ07CaJK2gaWCEznKeLVAxMfVmun+MUZ+aO
         OLytHQfWCdqHRQTCTs9GnUS05Bly0MoZy8hhBq7pS5lnU3hU1raqAulP0Ix1Z9GGZIG5
         uKBjeJiO/P2RuzR9vbsjBJgexO932ZKEqigZBv4dfXdJEH+ubjFnkotU9SfwzF7n+hbp
         /qN6+bkpWlcRXq+pbfzrYUiny6MOC/5KWujDE8kkT/zY5qmcRTlJVKuLH5i2iYxuXHgg
         zZfQ7PSVzGkGbUk2h58o3KUXctWZvpJ7hq+0GR7ycNH8bNnk/PTY3H10d60TdYvyCwdb
         WQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495629; x=1785100429;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxznu+hS8HH5ynomOmnxMZ5VSR6lMdMjMbTUGrneUgI=;
        b=N63+tzOMN0lx7l3t1FMm6E1XIQqMPX4G8hb2ppG838yYlukCLS/y1Z8pfVKSDwgB6Z
         TxfQX1css31gMysBWPEWs/Q+C4azhFFrlUy2J1mLw87YFxf2zZwflbe78EsS25cHi7I7
         +T3cf78V2yeflm8xwfpAVTaLE6bhBUcScTux1vZD9kn52DC3H8ymvDY2Uj0rAm9ufdJG
         wZYGOv3DJubepmQ2zUq20SvJ1lfbVpA45KywEr/3rRsokZ3U4TP5pgxLSFc679URXY+4
         nE9+aWjolTxa6NVIo326rULt9H5uALz02aLrTh9l7JrwQkx8ykbFHCUZLG88c15unYwS
         ASYw==
X-Forwarded-Encrypted: i=1; AHgh+RoeSxwgPwKiqrNfe6RNWSBzgg8AEnWc62o/IyInKYSvuVoTPMaRIKPwl2Esft1yiKLuZ3aUDK4keB4H@vger.kernel.org
X-Gm-Message-State: AOJu0YzHK7Ln4770rfXvLYgbH0VEI1uE/aggtZowYhWHWBP5YM1a1PCu
	ATAwvLoJKEyc4mTkSD2EZT/4aXt7NmE2YInCycYAfQpa/9+OfrImsjVs
X-Gm-Gg: AfdE7cnU8rFOwrZL52l9dmFwuaIOXQllDZJcEsjtdlFvl2RUA5Ec1BoDOYJzzChCEnR
	dxGHi/KPZnWANUeu/h7DNR+YJehnoe4R3mCOf/ttwiXwcjSnmS3oHc23EEpJvsSYbTXI6DkLfII
	LVTwzygqRh3uwiJMykbMV7oEixdPKrQIKoIB4GdaFaeDRTfU/e6nSfYMu/MW/ybta1MhbqLSQ58
	lfXkaBnqFNYWhD0HvpKchZhOhk6xDRPjTgWu2WsoYzinBj5rikDd0jLIOUFyD/bDm2WeaAOVW4S
	1pozPcM6Yt1m0TXgD5wKK0JKIUKzf+S7YhuA81G/E2hMEHqE0Wm3xDTj8+N1NdOWX56jBruZz9E
	AyXLOnOpEEEQ/7+WZ+Bbjo8lFV0ionNhJ1X81Gbu/EQkQZE8KBYoUfOLC5Z5SMdpPJq/DpnhrO5
	4UdPqRRCC/CwvA/XfjwUqDqjYmTigAPz1IOnq+
X-Received: by 2002:a05:600c:4703:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4954e893f8cmr104567935e9.15.1784495629064;
        Sun, 19 Jul 2026 14:13:49 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:48 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 3/4] clk: sunxi-ng: sun55i-a523: reparent GPU while pll-gpu changes rate
Date: Sun, 19 Jul 2026 23:13:18 +0200
Message-ID: <20260719211319.982285-4-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Register the existing sunxi-ng mux notifier on pll-gpu so the GPU mod
clock is parked on the fixed pll-periph0-600M output while the PLL is
being reprogrammed, and switched back once it has locked, following the
cpux precedent of other sunxi SoCs.  The mux switch is glitch-free per
the T527 manual (GPU_CLK_REG, "The clock selection supports glitch-free
switch").

Nothing retunes pll-gpu at runtime today (the mux does not propagate
rate requests and all standard OPPs resolve to pll-periph0 outputs),
but the higher speed-bin operating points (648-792 MHz) will need
pll-gpu as a live parent, and any direct clk_set_rate() on the PLL is
now safe.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
index 979e53e63..4341eb66c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
@@ -1667,6 +1667,17 @@ static const u32 pll_regs[] = {
 	SUN55I_A523_PLL_NPU_REG,
 };
 
+/*
+ * Park the GPU on the fixed pll-periph0-600M output while pll-gpu
+ * changes rate; the mux switch is glitch-free (T527 manual, GPU_CLK_REG).
+ */
+static struct ccu_mux_nb sun55i_a523_gpu_nb = {
+	.common		= &gpu_clk.common,
+	.cm		= &gpu_clk.mux,
+	.delay_us	= 1,
+	.bypass_index	= 1, /* pll-periph0-600M */
+};
+
 static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
@@ -1698,6 +1709,10 @@ static int sun55i_a523_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Reparent the GPU during pll-gpu rate changes */
+	ccu_mux_notifier_register(pll_gpu_clk.common.hw.clk,
+				  &sun55i_a523_gpu_nb);
+
 	return 0;
 }
 
-- 
2.47.3

