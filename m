Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6571038F949
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994267; cv=none; b=J+TRy3HDP9QuvOjLpR2IXqCJ9yQdVCQM3FYOlJJLsTQyee7vxyIZLG9MELLM9h2nkCpGMtUtFWtMvj3l+K6rdnoXcmtSbUKYEW3FxVRaActT1iJlTlt/7mWC/cqpVu07R3nd20ffVS38doFCDZDxdU1vQ1UB7SHR7QFdF7qjKpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994267; c=relaxed/simple;
	bh=dpzAblYBVoWsTKpey15gJaeyx9yhGLR8Pej4PQeL77c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJ9SmRtIoEcfYJCCl0wzWb2K2F4ZYj5JPyL3X7rJHtYXCWdQlJyQw3Cis21Pl5gSnhbWLaLNCgUmCgc4Yol73ub3vJuAw1OcdVnXtDHLQUivYMpErTSXzCetVDdw4McTGVOqiG8bacMMMWMJfVWd8qHEFkAglZ80soAMovZYnFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=Waadjy0j; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="Waadjy0j"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82c2239140aso2511099b3a.0
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 14:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1774994265; x=1775599065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wX8tlYakugQaGGpabWy4msh+/XyLM+6wGnijR+pdvP8=;
        b=Waadjy0jUh60wEIYzxCuKdnjs20IH9HNWytPA+X8Ay/6gyWKrP02MgsKY/C2Yj3mQG
         jecN63fTFOeRbGJLJKwsiUNx0x25K2FhUWI1mpbIr9N+FYoHPqBCpi9UY2Wh53VSiNpT
         w/rUVRqettjuuB1DUuMJYF7u1uHgfUXv3nsOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994265; x=1775599065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX8tlYakugQaGGpabWy4msh+/XyLM+6wGnijR+pdvP8=;
        b=ZZr7nrOxfWnTtip8JAkaud0wPlIStPscAgZ2yv6PwuqKN9LganbY4Tr9YlNqEdkh0H
         x19MX/ttpf4ceglsA/wOmbGu/dVPAasPHgiqFw4bl/w+Avs1DI5thTQF8OqGUKJCp+Dd
         Q3NkAfCCL0ANjBGTxR3Wv4V3GCxHEgjlCsWtibEINhEmYP7s648xBK8/fzQVPRcI+1fP
         3xc3XqcCv3A9MkQ6mZSqweFUhvPklpBkO8zMaD0ZP0VbRpZGAkqSlQmLKNR7nQFOcFiv
         g2GgJO0u/gCobxjjKrhsnknzzj4NybiMTq+6xVknWZMuvUYyZB8szaSxsl2Yi4u4Yctj
         MRRw==
X-Gm-Message-State: AOJu0Yyc0k+iLMmp7POVN+2i9nnFVUEXnfBzsaYK7zZWyjZCwciCmSUZ
	Vhn7VnpT3JzLsbNLa11KdDu3v0UhVCN9n5Axg08tuONE2LDiIjwWnzE2WyQa9V4ME6CSA882dSe
	L1Uw8
X-Gm-Gg: ATEYQzw1Bk/NJll6SMcPLaQhuwX508dvZKpIMCEH2LMBX7Mcfu++iodgr+0In4sLj13
	0U2pFS2vMcKbMvRZF6gFgk+dqiyFtop5TALnm5BUUeARn3rIOeadlpYqdXHrnh4us63fIYbRa/G
	IWXynebY0vST8aa1BVi2HQgI05J1S5ZAE785Sj9oxLWW4XjPiXu4Econ0aWbwPnC0a8gdzn+wZK
	XP5eiwI5xTUUZ2PeRA1VCweeLbzNlf9WFVAyv5qVYRQBxnjmF/zPP5ChwhCKNHc7iljQ1/14aV+
	B5JVFHHNuijF0pHRd1m1DBTbRrt38DckBqMKLws+x61/9MsPMomtb6jog6lRMCToP0u7d41LdtT
	k57q8wmL+wPesEZgR8V2ZE0PD8+QvDkNanSGvr6g9xbNbu8RwlzxVdD5vrlwlGvIxEs69Q8cK7i
	lkEJth8YVdmJrqsA==
X-Received: by 2002:a05:6a00:1ad4:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82ce898259bmr1093796b3a.25.1774994264651;
        Tue, 31 Mar 2026 14:57:44 -0700 (PDT)
Received: from kinako ([2400:2200:697:aac6:f82c:1cb4:499f:eef9])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82cc025659dsm6734014b3a.51.2026.03.31.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:57:42 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] of/platform: Don't include reserved memory compatibles that aren't needed
Date: Wed,  1 Apr 2026 06:57:35 +0900
Message-ID: <20260331215735.2783770-1-daniel@thingy.jp>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a number of very platform specific compatibles for reserved
memory that the vast majority of people don't need and they waste
196/200 bytes each.

Wrap the platform specific compatibles so that they are only included
if needed.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 drivers/of/platform.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index ba591fbceb56..0e6c2844e542 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -489,12 +489,22 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
 
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "phram" },
+#if IS_ENABLED(CONFIG_QCOM_RMTFS_MEM)
 	{ .compatible = "qcom,rmtfs-mem" },
+#endif
+#if IS_ENABLED(CONFIG_QCOM_COMMAND_DB)
 	{ .compatible = "qcom,cmd-db" },
+#endif
+#if IS_ENABLED(CONFIG_QCOM_SMEM)
 	{ .compatible = "qcom,smem" },
+#endif
 	{ .compatible = "ramoops" },
+#if IS_ENABLED(CONFIG_NVMEM_RMEM)
 	{ .compatible = "nvmem-rmem" },
+#endif
+#if IS_ENABLED(CONFIG_OPEN_DICE)
 	{ .compatible = "google,open-dice" },
+#endif
 	{}
 };
 
-- 
2.51.0

