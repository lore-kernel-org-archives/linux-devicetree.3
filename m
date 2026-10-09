Received: from mail-qk2-f6.google.com (mail-qk2-f6.google.com [74.125.230.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F134F96D5
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570720; cv=none; b=Rec6MT1ewQILBVyJiHSJiBG0gcNHQNrek76/IdClX7FODMKLpuehrYBw/PPzsEbrt5AkOhSGvhq01gn8CsqV31WNtPvU5gVV+LKg5LA23CUUn0yV2BZ2E802DMHrcXjZNKXJvgZ1gSlmlHSqn6ANbK4J4Z8Hdm/zc7g/CRDd1Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570720; c=relaxed/simple;
	bh=zKnuEKqqe7edCKaus1RgpjuKXXy74FsY9bBojL49qiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=erw6KUuJUgAQaClQ/xGJWGW0M3fy/fudgmesSUTv6nqCxXpQNRVNfpeS92yqZmKsfxTYSDWf4skvMaEftvucgyyO7FPRybVB6X1E8Y/UDvZcGZFCbPKQLS/pSJsixndN3YIn4UOWZlTdvVrPyrJQouwF52LbNBQfoWUB4ZmrAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8gWof0G; arc=none smtp.client-ip=74.125.230.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8gWof0G"
Received: by mail-qk2-f6.google.com with SMTP id af79cd13be357-93c56ac78c5so70889985a.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570714; x=1792175514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=R8gWof0GJHFYyCIgaBy1whxEwY4QTgNoKzzc/9stXixQtCybSBanNMorOBxkJiJYh2
         PdiuT5vOXZQUfryyPIA8MLclRWSf+OfY1Z7h33dVphSwgqUFnkkMOw1fWYe3iVfG0xlw
         2JTZvmcd+naHVt4j3mT7E+qSs6r1qzzY0CEMiMYKUMN3AQBz97H4BPKAua4Z93lXuKsa
         gDvtPqqge6F3utnTUh6vW6jmZjRZpTau8yiMXf0fv1/lRQWjNYsdLdL7zevLiQNhJKwT
         kj8OVAi8L1KAu/ep1qAiBwigCl3HYFLH3RRz0C6Eita7oZWI5GSLVN5u3PKqePzEozDF
         d+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570714; x=1792175514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+W1hX4qQ116GBN/dEZOF3zgezRpS4RsRBfyuf5dXS8=;
        b=sH94JrALes8ACE17plS8py4GQL/kICxHIv6emx4Jvzbe/OaFgG+OuwwEyCf9stKeul
         iwb8dsz6bhlFmLTC4QZc+dA1VWPYpQ4pNFclHUqxFfnPAnX5qrYwWQ6TvfpIfndh9lLI
         JgLnvvEsaA5S8HAlltXJm+4FX5609vaChd9z/4ix0KzHNh5U8SuHyzsxDi8bUrTDsTeG
         10f2tnOYYP5TuOEjknLivjOySoeapPzV2kUP1QNbvu99zBxa4y203Mtru6bKdSTghosV
         3qwt6o/aKjsRTtkmk22Ynd7MQ173Ce8Psx2Grrh+wEXVUe0fiyjp90NHxkVbGVoopqUD
         JsOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg8+ESMxO2KvSAILvius88nNckak6/WAdnSocCMIfWBLwAvVW8sqVYSb59HA/gaEPhAKLmx7wMv0RL@vger.kernel.org
X-Gm-Message-State: AFq9FYK+33vTmwR88Ixr5Tk2si9X8VsMWL2VIqV7CkGse15AAknQL7cN
	ZXjW37yzq2ALhsTvqPusgMiKCAKbpiFCkMZJcO7LaUL/ihoU2m7DJxGk
X-Gm-Gg: AYBFou0X/zDnvCzoRi/XyB0SatxR+cdnZ3GnCqeUoaofHw+i82aQCpoG6bi4BnxmGNL
	A6gpUlaNIRcrI1RMg3HTw1Zw74S/+skrXJERUwS/OOeeHQflc7TnUYhuxlv7w4MocVqGpS+Nvp8
	n8VofjdWS7POIgtnQ0YF7AAUtgjVnB6zWYfsDQyomR4TAfBIYVy6g2ucgomGqcjlykjNPu4YIWl
	mr24M/UUZ04VRW9by8kWoMJtqig1irOq+k4cIoR7/rTAQECHD6A+P/Lyyv3uuh2gCyTxGKkMJEm
	zDkJQtbRbm8GeZmFiNoZQsCGRBXg33P6xMtvxB0ljqaJXaWLGqZVq/sJdikMaz/nForo7OiOLCf
	mUT8+LtRdS4N2DzxybWlPbsgYyuMlO/Hr1+b7i4kPcqZpKJgu1NUK9PQ5wHzPC4nsvyRUemfyEb
	Jo83asGMknaacms6xh6kld9O1IT7/pHm8iYTpeGlIIEMGwEhRrw/p7VVwz5+aoIOK7mfhBwczfj
	F0vEDFNgIT7Te7+nYQWeTyQRwxFbCiM9h0Er0j721toPVF0bk6JBFBb0b0bk71uJA==
X-Received: by 2002:a05:620a:6844:b0:93e:7156:f814 with SMTP id af79cd13be357-93ec134f9f3mr293228985a.11.1791570714330;
        Fri, 09 Oct 2026 11:31:54 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 13:31:46 -0500
Subject: [PATCH 1/2] cpufreq: mediatek: Enter system sleep at the suspend
 OPP
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-1-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1447;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=zKnuEKqqe7edCKaus1RgpjuKXXy74FsY9bBojL49qiI=;
 b=TKIssWZbu9V/Rs0l3vFTMGDGJenHiseLmnrhDQeH01mZIX62p3RKiyzvqCiREuXBeGpC/DcER
 7x+myhDBZs8CLEektz10sDGJuS0qBbKpqx4vsozFQjfwzRdJRvxM5Ep
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

