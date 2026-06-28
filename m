Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4B378832
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782680586; cv=none; b=K7aQACjOo7hLYTO6z7ZdlNP5FTHz9JqmvirJcmbrF1DRDVpHTQs4SwdfIczmmUVf1X9cwrN8IsjzD+qoraVAF/EwiUJ0tj2bgdhaky7Py5TdQccDgGWWkaDaZm5qa4wpg/eYlQhTVC7tyis79zGGULLZn+2fnnQYPQfEjWTJDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782680586; c=relaxed/simple;
	bh=espG1giy09QMAmnoJM4JhpCcS2lwzv+JRCSXuD5yl58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1SmY39UeaY+ufOP65Eb+4c9+C37apnAW7L2f+BZzlFkPqiRF7IN1txV2YqsfbGbiK2649zmM/7QDT8wuZjlv740yokqYatCoqSBMGrrogu1PMFbjIt8DdxkNZ089Ai4ip12+Pbv/9JM+Efc7Z9NZeE2v27p30XDI0ZdntnkLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPTKqht8; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPTKqht8"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69857dc1d5eso1229966a12.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782680577; x=1783285377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqlk8DHxm4SFQTQHY9V2Fn+LxNR3BBgzQZu7nC7+rPo=;
        b=pPTKqht86R/4/Y6d3DV/btvo+DDGT0JKcFbW/HF+nvSycsI5Zhgs0EVVif3u2XqS9u
         swg4Kh1IvG9xnlkCs0WlwBACSuZqdKHCNFpdRWvI3Mh4dOJcfpRwi39NpzTaYU4PbHJe
         eitkxOXSFifzBtKJ6ogN3E9ocgCnVMcCKzd3KnUAyjHOEskyGlkRUxkQojv8D4c7lWEb
         5TSH5jdmawl3dwXwhItw6PU6j5lObM2AjiXExmnZaHmxdqWAuKyuuXTswq/FScpXLuQ7
         Y5LmOxsPciq0117xIbhvfv7ss6YBmnkNB+X+2E2aDns1K90DTxzap24YJR1Lv3hBXX1a
         JJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782680577; x=1783285377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqlk8DHxm4SFQTQHY9V2Fn+LxNR3BBgzQZu7nC7+rPo=;
        b=C4jx85pNEAgy/c10eICea09ppWmS811Nh9LhHFNkPL3uYHF6NA8z/3MxQFJ7Rk+nVV
         xXy7TaOiTg+0Gk0u9I3j5/BzboHvbplHxStP6qbQMgFcZWfsc04SLYQRTQ2Cp4Y1CaTk
         L7FgASJxULO8bz/TrBa+A7TxWo2+Pc1U/SmHnojv9uI/95Z0eO3jIwzgJTA/U9qdqZoM
         xA1vxJTpX/5rSqMtNU+96D5c3rc6FKq2Dem4v9sjJj35A5B+u24gMFMe7EyRJuBJIIi4
         tELmnYbGeNJ25g/XV/ryD8uQ1sf+DPtA7mzvN433XUUowj1mHP7TVHgAT+oTyuY2GbP7
         69oA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+CuaS5ZlrEEsaT3l+/CLippSFNXHTgRhBKcmWnGv4vv4/iqQ+4N2sHevsz8z741lpB2MoeeFrYVxk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7Fi+HRkVA04K/MXHFoRwAWNW1iN5IXt9Cdu3O2Sdvulny49u
	ouZA37LPi872QhdUalOrc+Ov+QxTGnTNb1ZqCeknhnw7mlUMAB0b31ov
X-Gm-Gg: AfdE7cmdb1Si+BhEbMSAJFwqcwPMI4zVo8tTF9p1kzqhUcnqZKJ+sLCDP/BkhcCu8Ck
	lfx+XtL+wQBOuCrjeL+0MjB+OKmXLkbjxuCpPKPdjJ6blvsy4kHviiT+R3h9sZlrgExhimKTVW5
	FPySWO9ctzbtDpSack3kPdRP3vkRmbYuD6+MzezcET+7+D6t1mVDe9+DVx8IYh0RKOdvdzxfy2d
	Te3iUPCCrcIJMYYGxUP5F9cIR2c0ZUUu2SUBcy3yegEyewgTZLVTPs/JLFsBYhOJPrIz9p0gnHo
	Fvf3TvP/porXP/WimvKoit1GbVafUDchDgs+jv4wU7s76h8JWwmi85YY1nDsfj3h8qcMUhy5aoX
	NUvTBThaDnHAi98AnqJYybbDqSelfGHAwOnVIvQK9mbDUaGpGJDP87v8wIPz0YaDvZax6WQ==
X-Received: by 2002:a05:6402:3591:b0:698:4831:f9aa with SMTP id 4fb4d7f45d1cf-6984831fc61mr1956097a12.12.1782680576881;
        Sun, 28 Jun 2026 14:02:56 -0700 (PDT)
Received: from sefo-laptop ([2a02:8071:50c5:5c0::361b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69848e5ebc0sm2205656a12.3.2026.06.28.14.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:02:56 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
To: wbg@kernel.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	o.rempel@pengutronix.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wadim Mueller <wafgo01@gmail.com>,
	kernel@pengutronix.de
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for GPIO counter driver
Date: Sun, 28 Jun 2026 23:02:41 +0200
Message-ID: <20260628210241.119825-4-wafgo01@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260628210241.119825-1-wafgo01@gmail.com>
References: <20260628210241.119825-1-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cover the gpio-counter driver and its device-tree binding.

Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06a8c7457..14f1a4e9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10984,6 +10984,13 @@ S:	Supported
 F:	Documentation/admin-guide/gpio/gpio-aggregator.rst
 F:	drivers/gpio/gpio-aggregator.c
 
+GPIO COUNTER DRIVER
+M:	Wadim Mueller <wafgo01@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/counter/gpio-counter.yaml
+F:	drivers/counter/gpio-counter.c
+
 GPIO IR Transmitter
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.52.0

