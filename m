Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741A3D6690
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 04:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297823; cv=none; b=iChCvTGJKgslgyt0yxNaxGpUGK4rIRoq99j/1Z7G2jgu5dw0VEPU88z0q9OGNBLZI26hKYxw5c/kDCqPrdSh2S61cXuT/4kdwpOQUchD15b7M2dUGKZRf1sa36BB/g7c2i1291MvRErESPvebP5wTF6uoa5MBqVrkRrYlqwcjTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297823; c=relaxed/simple;
	bh=f32Hhiuii8crj3wkcrN0uj33W/95RNcmO/iEDVyPKrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuq/KFltHiAHcIzK46nM1ick0MGYPssLt1kLks1puTdlzmEj0HKSZ5fESZU4T6p7MvFppzJAL0EfVb+OFk+Elngjxi+i5kQEZ3egD1ZLsBJN/SxsZNdYHv6bkxEODsP85eRLYDOtwb9nZ2JlhneG+ZjcL3znskJMnlGAAIkUW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHTkwiFD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHTkwiFD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a706146559so893253a91.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297821; x=1792902621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFr33fa9IIxS8M76ReU+A/YWrKsr2vhDOnZ4Db/Fk5U=;
        b=kHTkwiFDFamsYyDMxF4mKjPRz7QdzWGlIlEukNwl0WpwqG1zL4U2WYyVNJzKO7b8oH
         V1LnrMbJ3Sog4M6NgvXhlTH3nSvl/rV7QM9iRgxbKJMQcwY41Z/9NabIoK1WpaqnnpVz
         o4qvdEofzZZpXI1uoiAhOFVltBZmZ2rKNWj+QqJKDLjbTsmJdpnqHO3vM0Lg4IQHLZ6g
         7wCU6KmWfnH9Rf6EVbdG9iCvkE6WGFC+Djw5z6lRlRdPSF29sMtdgu5UgKW9tuhh7gST
         IdsmErWsuD18oUm6jfQJmtiBQuE8XizGqAvMdGn2OdVOhUaH5RQc7xn42z53HGZfJ87g
         xA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297821; x=1792902621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFr33fa9IIxS8M76ReU+A/YWrKsr2vhDOnZ4Db/Fk5U=;
        b=MqdEw5floI21VaWZL3C5lnEajpFTp2VTArvwRVDxX+3UMSFWR0MZMEkdNS/1Au6B9q
         FIGBrwWTvpcdMVPRaU95kOaKv68RgsQGiDi8/QslKAoAtD9HbRTlkOUilT9KE/TnhgXv
         J1RKemYd9nP8l4uKMjnfUbqZDPCzIOI5jkbLLpBsU7qsJskY3KV0usI2KKhlYzi7O0S9
         +KjPYZw2EvqmEk7ABaGaZGyMOjb1hOXfHp8AmQ5XBSHAZXD02SERn6rQMHUQ+J75REo0
         rcijjR9lWW6fd+umPL7+hjtAjLNm+6SolZN+SgvBgMtHGZEFPAi4cT7IwfRUQbaCxcIW
         qW0w==
X-Forwarded-Encrypted: i=1; AKwUvByVcJmkFg49aOk5dgsq0D1VFbbjMyie43C/6pLkLocaLYqpJCXgrqlqqZIjaa5006JtzbXGg/wKoZGC@vger.kernel.org
X-Gm-Message-State: AFq9FYKHSqq+OIlPp7/l+sgre1DclU65CotYTaLiNVQnLVkQ34GYJAYk
	Z5RjZn0FxUt7QUEsiBDtzYFU4UwrYTXR+bTx20WcoVUfzWSHSsM5kj5R
X-Gm-Gg: AYBFou0O8KWnNQuW67b9eLLKSJN/mrGqN2I/3f6ZOsc5t18aXyf7nf7GIC7oUV4A9YJ
	R8t+s4i4OwU0uWza1/LteiJdtS3M1nLbhYujENgPC6TeTXscHcZdPElqG6QNp8B11NYr4UuRjsX
	73fNRaDx9j/Vc12vDaknzfx/H1zZn+6bjnH4Mn9B4nbBPmnWNnHByfEnt7QXvQUV4v+FQeolhO3
	J6XXeqw2nfUBGDFKQKLUQSQ9JtsW7SsEro2g6FMW0ifV7/LkO8Wr3OTuYIFo4TQYD77GprOWh1d
	5cD1BuVkp2CXxhgggdYQcnveAVjWVthwIR5qddKpoe30dZ3FGXY8GKu9B9ydRYAx8JJ9KCuWm64
	HOq1tDYIBYFy7hIs/7X1aFPGG/1oHvOGM6wVQMK97lajPRjS8GMohCSGR8PYj+l2UE1yU3SHUQi
	z7i1cPufoxaFPyHvm2sR+H1uYj5U37Qi+dn6miU7Gi/yJHbi8vqiHq2IspflWUnF8=
X-Received: by 2002:a17:90b:2646:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3acef29e804mr3158765a91.31.1792297820655;
        Sat, 17 Oct 2026 21:30:20 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:18 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:22 +0000
Subject: [PATCH v2 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-2-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.55.0

