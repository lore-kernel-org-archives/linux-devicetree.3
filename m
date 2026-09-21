Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E7145D904
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981667; cv=none; b=BN+7IYqPrMd7qKx0kcY8ssA9377xaygnSvdWvwag3a0rNaGZyKvzYui3StmRnyjT+gpjMmeDVmAstl4nXvzqQbUku+DNejzK7yoamC+MAoXg+O7WXGcHekdE2q2I84HB0He1tgH+wGSgP+tGH9VcU1VeNuyK57KtGONmJpMhOe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981667; c=relaxed/simple;
	bh=618lZEj4J6PxaEmGpFoPKRIGN5uod/rBxdxIH2fNG/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nk0NkgWVEfILyMrKSukOmEAT7icRqpF2vPH+vnxKn1IzVVpmTcX2Q05YR9lDmyQoBTwTM14+ZF4Fm9GhTv8HsuIjVWyMPTIxYUuq/OVEFAK+VmYX5PGwVJmR4MP2u0q9GfXb4yLuVKguqjVbBPeZC1ZZq3weS1fVecRliRvMd/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=iDAZQHL2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="iDAZQHL2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso15024315e9.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 02:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789981663; x=1790586463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=iDAZQHL2WjJzLVlUTMLi6wbmHzCS23LUNmUj6njwOjNclDAzTtQRugecRJFqOfKTxs
         pr0jVQPIJOK7BjK+dWtL+RjCyjECTH41a3JWGTfoWiqncAwWNq7GFsoAjbpV0oE3/TrF
         bcatfI8+SeHlgowowc8VfkOQ0HC17+S3DdsI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981663; x=1790586463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6Xglxzig/oF1VgPKgOC631Csxaxo7kJhuv3JvcuV7I=;
        b=LNtfVu/bC9sI9qjC5YVjCTz2NM8cuL3AXW6ynlJOaGR7RKah9co6mT4FzVWzGuSZOu
         BgVo0L3kAqtWAcw9o6/kGEzq3bEUW4JbC4Npv/JSSCfvoGA7rvHSNSMX8C9Ghk+663wk
         qSnfYdfvMcUXzWpuyEIx1RsDSX+KuZOoGH7iTUMmacQ4TDq0D7Oqb7K2GW4088LN358g
         8yjMe26TRih+srM2su1IjMo6ZUbfYImJpE3s4sp34j2IA3LF1nJQy3y+xQijTgnU3W8K
         yW94QZNJQCRPPmAuOoBULUmwMQAuuWBaySL0YfqQrAhvTcLKnRx37hONA9rXbpkRjK4v
         rCng==
X-Gm-Message-State: AFuF++mta5uzCrMP2CnTM99nv6RNaqnth8Jn5q9tU/of4VqZR9JBGtcG
	WZjOg1/lXTA//3Afbrj4FtKbhU/lxfhHAFE7VW93Ef2ctVP8HkBm17jdUV5HjysTUIc=
X-Gm-Gg: AYBFou2retWbJ4dlTKloXkP0E8Poug12HYyq8x9S+Kg8bUkVtM+lZqMte5PO1j7gMsY
	3TBX4eKHd2fXvpgi2ntpm1p0MKXIqUcViX4vupFvbWHub1OGFvShlsLTkjGlluZgPo8bAxPW672
	batrEhJdCMc1c/aWQcwgqfzx0sFx8Tz1O8E/dilcTDhXNoAa6uU3XCEav63uMU52FtlYHbeA7sX
	Cf5fBpHSwvfHjBLapZv8E49uLA5UD6I8dmhcZMGYrFuI1A0JHiBP65PdrEjAcXOliEJimpP9qH3
	5qH9NDfFfRPSrI9AKpYF/uTgzWyaA5+9ONjBgKT/eTTBYe/ctOpUIaRdu6noChXasXjCxvP6mGf
	uAKKX99NRYKDL22XkSAE+646YUZsLhrrTtPid+0kmeq+J2c8ca+K/EZ1YuqOLMZe8gZA+ZRvwQO
	cH3ltyklB5RRPAsOukdF5zBBjOngRuAef2ChQs1E1n3eO078NOnrVxDD10NgvmNp+63+Gm1TylT
	4/3lJVlMI1G7q0MiFSunsMiR7dT
X-Received: by 2002:a05:600c:3547:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49fc574121dmr116761795e9.18.1789981663620;
        Mon, 21 Sep 2026 02:07:43 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm587218725e9.4.2026.09.21.02.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:07:43 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Date: Mon, 21 Sep 2026 12:07:31 +0300
Message-ID: <20260921090735.3174292-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921090735.3174292-1-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
Link: https://www.draeger.com/de_de/Home

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..276d62b848d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -467,6 +467,8 @@ patternProperties:
     description: DPTechnics
   "^dptel,.*":
     description: Guangdong Dapu Telecom Co., Ltd.
+  "^draeger,.*":
+    description: Draegerwerk AG & Co. KGaA
   "^dragino,.*":
     description: Dragino Technology Co., Limited
   "^dream,.*":
-- 
2.47.3

