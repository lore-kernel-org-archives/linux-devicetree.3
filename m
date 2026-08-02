Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C891A0BF3
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 02:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785638309; cv=none; b=U/XWiowbJbxq6GsKRsorvH2hGWWmudpTcw9AbKX0LaW6e1ALweyNXWLbqqMLTI463aLuPHvixtk7hZ9DqfOcQbtiNY/8AMW0P/Zb0U6I8yJzseAAxQUepASZxt4v4GD1DGcCRzQzh281LzEXXjUDX/QJIk9NjdLVw6oRAWvMgEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785638309; c=relaxed/simple;
	bh=tLgvoo761nGkRbnfBNv03h0op3SxaSojdDA3HCtP4qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNpE4h6OCGmtUqyYPU+dsg6NWK6/GdGK28snuW6bADsyvoERargfeE9i0sB65HvdxO3zUS/bMmaDg6XLMJHUpR1SQFYo4myABWlUosaj9RGEnyOshh6+4XNMtFlZBgwnV0KD8FW+VSouyZpMGc0qvto9AVX/RsMpjbiIHL5i45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHvHeuDo; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHvHeuDo"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92ed19f4d60so119461585a.0
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 19:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785638307; x=1786243107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvEB2bDegHBMEcT13eWZQWB2y3G1J1ZGbL4bUzfuXyw=;
        b=qHvHeuDo5sWxc8oASpeqkp9qwppoMtn7RZ65vMqXtaAc2pwQ4TthQWrNDQjdAR9jGE
         OYsXEpra+3R7hww0Q8QGzuKV1b820uGd8iw7OfV3LQFTtS4LFQ7NjbkrjjFwh2WtrNk2
         Ub5OpF4kxnbdWeNrSVNdQvJI8FTVjh8gBXs0RDLRIg0JXeHoFpucYJfnyIGGaCwUVgUH
         w3KCrC1FUpPfTCLUIUtII+5G4zK+zcNpdpcLSXE7bTGIxbe+VzLCHH7hmZEaLdXNg4vP
         UyQ31VZcdZmuBCk/YpdHLIzeRMpW+9+JmDCMz7oOwlrra6IgRbmpoXUfNEEQgogcqbI6
         8+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785638307; x=1786243107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvEB2bDegHBMEcT13eWZQWB2y3G1J1ZGbL4bUzfuXyw=;
        b=Em5q4PBdmZ5oJ55W7n05GvAFQdmjoc2jgh934483nugk6JFWLkp9jhgDIFXYxVwFPs
         IQg9VcAL/Us8dak7cugwcM4w3WRe2huqR9CGfCQ+4KLJIc6MVtnKBc8UeMFPMWdsp0TF
         xoVXVw09WxdEu62FctmnJlwjezNgAFz41R0G/3XMyRfGx/FGLliDi+PPBLlIwcuxTj0m
         1TUZwA8w4TZAOCK6bRjc2sOu6PTW2gm5AE4CLuwBOjCUJoutNsH15N8TFdOgfyzpIi9t
         Oc+VHSGDlku/MF8dbPuRwgfj5ULOjXr6XoKpETbQVv6VhB1T/4WBfdvs5apHPg96G2Y4
         O25A==
X-Gm-Message-State: AOJu0YzD2OMxt8SlFEYXnFy9NwpUI390gYaaisGdTN/NFtoOMTPmzhMg
	CP2sB+rqYY6Wy8XdRqi28L4EcihCpaQwdXMPpC+UdOW8Cg4/fbvGt9np6di5TaDWRAg=
X-Gm-Gg: AR+sD12U8ksl1TAO5OO8nJFR9Nrx6QXHS2JXcRkG0lgyKJiF5Z0m3VpsjsdqrOTAhxz
	19IzJaEAQi84CGzxOaBTrZHrMEG3TU3aPUOa7XJ1gJBwjdNYVeEPP8PxvelKDCKvNmXTJJmybzE
	fFuLs5Kc5okl2GYCiEZrMWKBKJRuuCN+580EIG7Lx19a0SRTtSHesDDJTF7VN6Jl9XIZnjHhx5F
	jUyLtcmT5Gq6myUCKsPDPg4TnpVTNC8gBjiZqwGtOXk6kwL/8yMwPecroRPYKXkp8xxnWMCdoM9
	T3Rcju2w8MendfFZqdw+edSorHiwaF2XEimf2p3jtSxRP8pBCIqYX3CpFa4QVffzms2x+NH2OJd
	4mKBC/nfNA7lFUuc748QwmG3ovzOnrGjBud9oPh0QKufPaU8YgIb3Ym2Gma+mODkhVygzAae774
	DeqlrCzegKKyOofMCPKOMbIwrAPu9WfwX6bkNFydXH30kyafaizA1C5/fS8AK52ql6tAzZPtU6S
	UtzXCFzIkX3FWTPme3EYcahAXMVbTtVogisU9GkpFoEGaka6wLVlCcGvTzLHOI=
X-Received: by 2002:a05:620a:4556:b0:8cd:d688:7aef with SMTP id af79cd13be357-934a1110c8emr1019405985a.19.1785638307016;
        Sat, 01 Aug 2026 19:38:27 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc24ffesm384090985a.10.2026.08.01.19.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:38:26 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] of: Put coreboot node after compatibility check
Date: Sat,  1 Aug 2026 22:38:21 -0400
Message-ID: <20260802023821.494178-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a referenced device node, but
EXCLUDED_DEFAULT_CELLS_PLATFORMS used the result only as a boolean and
discarded the reference. This leaked a reference each time the
address-cells or size-cells warning condition was evaluated on a
coreboot system.

Use a helper that drops the node reference after checking whether the
coreboot node exists.

Fixes: 8600058ba28a7 ("of: Add coreboot firmware to excluded default cells list")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/of/base.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6e7a42dedad3..8d04eaed9805 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -95,9 +95,21 @@ static bool __of_node_is_type(const struct device_node *np, const char *type)
 	return !strcmp(match, type);
 }
 
+static bool of_coreboot_present(void)
+{
+	struct device_node *np;
+	bool found;
+
+	np = of_find_compatible_node(NULL, NULL, "coreboot");
+	found = np != NULL;
+	of_node_put(np);
+
+	return found;
+}
+
 #define EXCLUDED_DEFAULT_CELLS_PLATFORMS ( \
 	IS_ENABLED(CONFIG_SPARC) || \
-	of_find_compatible_node(NULL, NULL, "coreboot") \
+	of_coreboot_present() \
 )
 
 int of_bus_n_addr_cells(struct device_node *np)
-- 
2.43.0

