Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEE83D6462
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395425; cv=none; b=h/edrDiAPqJj53i5inqTnFRdSo7Bksezqw/KOP8XUipJpsSr/oIXbMRwDNi3sShAujWGaPcOB5w0xPcoUPtHVVZxwzJh9itbTNc9DqmaR8yJt0QqlcU8kGJlyxbA+T6eeBjKMMlua6WmtXNqyJvL94zx7xnv/Y9sfOCZrdYXe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395425; c=relaxed/simple;
	bh=FTgoAa+xu/joTesi8Jf6xXuDhGFQReh7G4WALnJ4OLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJybxf4T66fPpnxMLHLTF2VnTkSWeuVFbEY6RiXJqqw8zpvwgz8qv3YrqeozcuNtncRTX+PxU1JgVeDNNp9z38uJqLWaAw21WCb9R8smtDwnIUuVBJYSaBvUAxZUjDQUBZxmQ1Pr7ZXB4NGJhYzDO7GBanJzZihN3wtM41kbe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4w3B3nd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4w3B3nd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0a5354da1so20894485ad.0
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395424; x=1781000224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=s4w3B3ndAsTBMJgGpJqRtyTgA8iCBV6fHNIWsezzuCsvkeh/o6FsfvDPaBdT4g1f/s
         VOoFrenophzfqWGpU2BJXOSoEolOutg7nhwGOLtmWbfeUol+u7vkTOL/ArZBJhJ0pz5V
         AMOFuFuzjh8sDHnlKti8xEKAKUl3XH1Mxh/m/Lvn31SoLsZtaVoPIu1gi6znlYwUe102
         rsFKtT70FVJb/2h3pjrNm4Dm6oUdJOtBnyu6KB/CHXBxfmr6nFXLHvIr53kRTLYLWVUG
         2EswZi0H0p4hImdROVcCX7psy5CgqKNkOS1MFvG7J4eS/YHhW5d8h156LQkYRUDAEw8h
         6pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395424; x=1781000224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=MrSTIbyF2VtfjXH0W8z9h70WZu8Ar2+O650KHnj+Ip7DC4pk6hhQVIzWPq3gGo/ICG
         ChpMghJIILNXoKd3WhOq4umu/B5foe0UmxW2BVzKcyETyjd65ECxS/F92hR+yuARyLys
         U2whWDt4o26AEAnUUtkXJNo+U8POZDUy+1go+MsO6QcNPre5wqtr1r8P65VvdpBtJxev
         NHzvwO6LDfY7UOi+Ua0cdG1BgdTMMp+RXDju9XbJ/0e0mrgTxVHSUm4KR3C0fiNchcK/
         CET6bzsgfnDS/WlSJIs8/27eGsAdekjt+JOD0CH7nDU259WiDjOpVRcQDspo6rYkagWq
         iOfw==
X-Forwarded-Encrypted: i=1; AFNElJ+mMZ1YM23IousQlJm5qrB0tE6Wum1W7XMTIhREas6DYLE4vqRiEodxpxdB76WKoMLaQU3RB/wrExnI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HvTV3pOWi+GFDB6hyMrBwlaokT9diHAt59GoSZDCZ0uSJsz0
	0FQXrTd+iueUyABOsLCOWszq/f2GTnI8o2ykFfvsjRnSt4loxzQ6Enho
X-Gm-Gg: Acq92OFVYYie3qVYMMH0G1bErOdLCnIQr9FOg00VYyjpsenRwdlW2ZqyIsdt8NDa0F2
	hzKs4VkWqco03x5fS0lSniTh7hDaPSXkhAEYou61jd9RW05U7ajWhLuhTHY62C6EkSyICgZw+Xh
	J19H9HnqLOQBB26Un0Ba7UwMAntPF4emgx664qqgWHKV5g1biGJDO3XLUTtX1bmiG6w3tMljTJF
	DO4PQ3tZygmd8ASiqCVt0+fItN5mU+tSWYw6G7WsxZxDPLOU9/EaLjfsun8st+akhhpwzx+M1BA
	33WCKTMlKDlwMIN7uqsFyyrlxXvUclS7TVTg2I+1ZX0hNVAARecaEYKSJ05ADNzHOG7lhLoOyiP
	xK1Td1Oi/yomobLO+CSMh0edicMygzdepDytSWTv1CwAEhqTSbU0P7n+g+musVbMdlXQ/P+ahaV
	MlHkIi1KgdUnTLG44Z0ph7mA9yR/wT78NJ+FHGV6v13pLjrpUfkCkPRbHHA8nW0aeGqyVG
X-Received: by 2002:a17:903:3848:b0:2c0:a4c3:d7a with SMTP id d9443c01a7336-2c10ccfb095mr31503255ad.26.1780395423749;
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v2 5/5] ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
Date: Tue,  2 Jun 2026 17:16:08 +0700
Message-ID: <20260602101608.45137-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_pdm_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260522110302.349421F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.

 sound/soc/rockchip/rockchip_pdm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 8f78f7bc1806..115e90d3bbfe 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -321,6 +321,7 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct rk_pdm_dev *pdm = to_info(cpu_dai);
 	unsigned int mask = 0, val = 0;
+	int ret;
 
 	mask = PDM_CKP_MSK;
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -334,7 +335,10 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, mask, val);
 	pm_runtime_put(cpu_dai->dev);
 
-- 
2.43.0

