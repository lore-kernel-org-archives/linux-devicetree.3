Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA1489FA5
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873540; cv=none; b=bGL32vXMf/VChKQQAH4EM/Z6fS81NkdMwuHvpEpXJTuIXRHd6jA+O/O7MestESbxZ5M6gsSPbQXTqmTIYVb2gfrZUZ+nH9VfdYnLmDkW2AOTenfuU9N3GVQo9qOXA2fpHgBMps2Sf7LUgxJGmIrGhGZ+i0sd4/2wlFmS+OzVvOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873540; c=relaxed/simple;
	bh=YGepmHEEE28SCic71nixtmEJDhkQEownVeSMq//+6dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BK//VRPN1yNoUCq4I7PLTnUFI5fyfZnZuf3FuzSPv5qXtVNYyuDqUR7R5qIlxuaq0uPj6tmUKjo5N4PY5uFBayFrJyJKJV4X95wHuDfL4t84D65jvOZYDg7x3vGBfwAJwUupNP9WqkHw1SfbXurdAmil/FOybZ5dkz2aiZRI9O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzmLlBSY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzmLlBSY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso31493305e9.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 09:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790873529; x=1791478329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=RzmLlBSYbAbRVdIOZlIqBWbf3F7NB1jZEzGvpDlNn5Dto02cD++MorCI6FPBDQW5wN
         uU/1fjq3zsJcXWNfx5ZxrymXWREOcmv+Owud/1cTYsNMAlnYITKpLUjSds/eoN0F94Z6
         FaBPMzFVuPflDIkTNlEZ3xDPvJAAgygcAIrbIYlDDcubag7AsknmrzISX5aAxYtvyFtS
         JF+zGiw4BIaIXUD8sAEzI52tU9+vn9lCmlooVmZ85SA+pY7j2hDc9TyCLUuCYHp5EX+u
         3zHdZ+7H4+fJmrA65a91UiuPluVNQfL+6mZmXH0RcpbM1HlZIQoyYLkGJdRwAGxff/CF
         Ivrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790873529; x=1791478329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Xb6lAl/hZdRjzKQnD3UKmfHUlfFp2Vv7i6DL97ttMs=;
        b=jjen5S4zTw1Q7y4k50eKU9BGnatmqxID0Qh1dZMLK7wM7GMaN7O3lz8VxjOPja9R5w
         gacShkLjJWvlDnCsbaAv6aOKLHzlwbzaoi1F8NJkVfDuWIn1WFJ97iJRnYTDvR7KCzov
         U/f1FRSTHmkOHXKan4IZOPhQGJdHKjC7owmVytGIfqRFQu4qsH6uiCccUAqxxPowu7Pt
         n8+CWoQktsGv8dMh/M0Xt3qoxzytCNTOako4Z5dx/k8WTb0luGTNqQIu9d/z7g2AAcMu
         B0zhtJxZDpVj3/j8JCsxy/UAAmCZO3SlCvzqTn+MXfertwT6VGgnD00wLT5QIG+0T+lL
         4+ig==
X-Forwarded-Encrypted: i=1; AKwUvBzrvm1feKdagKDslQ0dN0gSjvqfrHQD0qPfFqhAIL51WazFrXvH7fsPa+n66qWEfvVDjGe4b642fmkx@vger.kernel.org
X-Gm-Message-State: AFuF++lRsM+ANM48NB6AY00FoXMn10Ff42UykPcWeLNfBJ5Qk6vkw5q4
	g+vz9WlBX0xsaNCfN6a0X7NlRAMdOckcFIPDZYlGU1DiIrnME5Lia8xm
X-Gm-Gg: AYBFou1u6Ktm2O8KtD68uPbZLT2Tht+sDlBPsluExM3j/jG8mR5kuQM/NLa14L0dkmg
	9HsVGjt7e3g4gqJEKd3DEb0ldnZUGOHocd6csLdSnhQ/wmynzzlH90JuXFc9NY67ZYlquObVAcH
	hvv+np0g3Tz8DzsuqFJOy/8R/wFTN57vCxWBPW8oD4ocUeOP8y6zkrLQ+4yb/r+N/VyLlsyJmQU
	Jj2SGITHFdyZsVFhqP4B7w90UMqp4Gh1G4BqTrBkDTDg4pVxILEg8OPuNF3yetwSjyMCxTgg3r4
	yxxbLGVfOJn0rnecfsBHNPaOr8P0RyFbT7+YNrB9wLMJihRnC+JjYFOKwARO4BLwXo1gyPZt0PP
	6jsm0p3aEHKnTvlcaJu6fERTGBeG1038zV2VNTAmGgLVnpXCRX02dfGKOcT64mHZ9l5Nshh24QK
	olu84BbArnuakYn9uRYAaaGwq6pqTA9FJZmD7RYF6JZxD8kQBqC7aySPzu8rhRfzR1yicBorR6F
	9fKo0FVV26N2D1oDxclK+byKavf6OOwUQe00RtvfH1G1JUc5GR3w4Qr8KRJBcqbMNSxXmW3fnmT
	whlrEnsX
X-Received: by 2002:a05:600c:3e07:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a027585dfemr4054005e9.12.1790873529179;
        Thu, 01 Oct 2026 09:52:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027ae146csm480985e9.11.2026.10.01.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:52:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 3/7] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Thu,  1 Oct 2026 17:51:57 +0100
Message-ID: <20261001165201.763882-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001165201.763882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f247e42d54f5..4beaac44d027 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

