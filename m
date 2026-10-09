Received: from mail-qk2-f4.google.com (mail-qk2-f4.google.com [74.125.230.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB34F93B7
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791575098; cv=none; b=JJNJrlYVqmEtVuyfjkzPXJP9or4lNszUtz02dh+r2mFlj2oMvS1zL/fo0pQrAT4ZOyF84YiOQAy1+xm8q6FieccGFZw51wnQnMI0o9IgWew2AsKSFKOlEbp8MUo9nzIZix+jrEmKR9BKD8JZvaSEenWVjktipnuo26WjMokzisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791575098; c=relaxed/simple;
	bh=fXj+/b1tWQ4CVun24kWnp5+6QFowX8kLlyxSUkAjW7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuuEHgy+PPpLZ1aiF01YGROZHOUYADpOXCWX2T8ZTA/OQIUYCPdwr50QI3Fy83HtJV+6RQF6QxwH7rVtFAb+arpili74CPb5s9ePYTcPPzCQ/FJAe1OLZLSiOZtP9XA+qCdVFUz/wHMnoj0bRFe6A8/g/RxX+IkMrZlujgaW1hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFlDRByp; arc=none smtp.client-ip=74.125.230.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFlDRByp"
Received: by mail-qk2-f4.google.com with SMTP id af79cd13be357-93cbbaba944so2506285a.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575088; x=1792179888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=mFlDRBypGeVG7OJrcmkI05ab09gAUbZuWnXxWIA00fsShdt2a2jbcfo5pjD6uJ2g9V
         JT1dvEL+bsypCd9IPjmJHGatXIPOnTg5GEaS5Mjl3YwJxFdKdqdkxZRCzWHMXPqJ0AX5
         JMWRvmBqxbuftnKETdI3Mud+wtYh3pFezoczxCtwlC9quXyUnRHo3iWJx9Yc7Igyzkh9
         BbfoefKrubV+QPEuvUBoqfWAXumAK0hZLPl7/jEDzMJi7dVApU0eprsVWQDx4jdyS062
         kqstlh7hTosKKL6EJAy9Vt5Gt4tTYh4hk/So9riMJv6yaQBt6k9H0NbQj02A85K20Fhb
         iWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575088; x=1792179888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIRhhPwVEVzpUkFOiFr72TjAQ//RWYZjBPnhQP/2UH4=;
        b=uD/8G2aSCKJQLqAhSwGcTVy7PQjUP5aKehmSwNN8V6q8tRntb1dJPDvGSeqgb4KF3c
         Q67xUq52LWjKhjRipY4oSNorqsj2zYx0dkz9coeF+uvDJEKyWCPYUTGPVakKYvu0MabB
         mYbYiWyZFT5IjvX3DIn1Bg+p/LKXqL++oy6Nr1J6VGHDc6ugQGa170a32HmN8PbAp9EW
         gt+8IFByEpKg33h0kzEjiNojtClmt0CpXU3Tyga2gQd36npnyVR7GSKkVOvLwlG8OXEX
         naOHCDz3T1oOpFD4mKSwVADDUW9vx7T0pyDAx4lutdMNRpmROhFZg5ODot5EUnl5n4Sq
         UHPw==
X-Forwarded-Encrypted: i=1; AKwUvBylhn94OKKYuWYZw5bcVFtyymPG8otWvZ1fvoJOmAUnXbrPtAMZtftRDNO+dLi6xdzccy3mzkzvI60S@vger.kernel.org
X-Gm-Message-State: AFuF++ljfiSbNU9O4YUAqM9KhEQel5Rc6Hy38j0fCVqBfvB2H+Mm/NNk
	kzy3jkvotkO/bDk/rB/m0m3Cmq4skH5fCdab1zmxRkMyneVnAp3WQCEJ
X-Gm-Gg: AYBFou1aYAriG81LabVUuK7eU4bzhyV8swYy6SdxMRCs6IBQyz4bLZozijjwO6i0m7V
	tnmpqjsyTEj+gJI+tDunRmkhluA47rnEbIKcXXjjWlaPnvdWI922e4HjCnznCgSNlc4v3uvaaef
	Qxj5WdvKDCgSKpjNPJt2x2W9ig3VxI0EKMDYa2hyrgxJ5axbjBLA/8lGijXC2D62jqZHwA21VnI
	9NHUTX9FUw6adKDFHRHL0O+stKEIkvEaJUWgAqVUBLlGq7RIm/40aGYas4ds9HzV32UXA9Lehzk
	MrwGOSLKkMjlOFqJT9rD/JtYxluklyW+nSnKBq9wqDU3R6UkzlYI5T/K4+nH2CsYQPc0kRSl9cW
	5D3ZEKxTY7aUdTXNZG6SzMWLaCztiiaT87wsXpPCYyhssRDfAaOThmykjG86Tj7IZaZIE3kimU4
	w5OFxLRaAYCIcJ0dqieZ4fczc6vQi9ivwATCVFjXS7NxHWoHD/bfTIwH7HBeoTmJf9iL3J/IG3F
	EwnRX+pQxcYicHMMjxuiKGyEezVt87qIhpjU6nTyFpv2r8IZVQkkFkyoKFkV5KARA==
X-Received: by 2002:a05:620a:4081:b0:939:f27c:7433 with SMTP id af79cd13be357-93ebd2838aamr439833785a.50.1791575088641;
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 14:44:43 -0500
Subject: [PATCH v2 1/2] cpufreq: mediatek: Enter system sleep at the
 suspend OPP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-1-ba13f826eae1@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=1498;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=fXj+/b1tWQ4CVun24kWnp5+6QFowX8kLlyxSUkAjW7I=;
 b=CqC9lqTPvdYR4kD85dq/pvqLzd1/IPalGGl65+mjFDLrpnZOKrs5SCOfPH+nkdDqRTmBh7PVZ
 jArMCG90vxuBdEJ2vJ9iJkvSIaILZcIp/Ir9MeZm/bqwB7pplwroPxV
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

cpufreq_suspend() stops the governors at the start of system suspend, and
this driver has no .suspend callback, so each cluster sleeps at whatever
OPP it was last left at. On an MT8173 tablet (Amazon Fire HD 10, 2017),
entering suspend-to-RAM with both clusters at their highest OPP measured
63.5 mA. With this change and the lowest OPP marked, the same entry
measured 52.0 mA.

Use the generic suspend-frequency support, as cpufreq-dt does. Tables
without an opp-suspend entry leave suspend_freq at 0, which makes
cpufreq_generic_suspend() a no-op, so they are unaffected.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 052ca7cd2f4f..f9b1eca176eb 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -603,6 +603,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table;
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
+	policy->suspend_freq = dev_pm_opp_get_suspend_opp_freq(info->cpu_dev) / 1000;
 
 	return 0;
 }
@@ -624,6 +625,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
+	.suspend = cpufreq_generic_suspend,
 	.name = "mtk-cpufreq",
 };
 

-- 
2.55.0

