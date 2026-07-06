Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D2543846E
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360322; cv=none; b=D4xNQiLmHPaR3xQzVOBNuYZPjF/jODmhwFXda0wRv9G9D6j6Et6ayWqYj6ZSvkRsMDwyH8DpmiA6GRxhZzXZcLmTFyx2YaCfC+2+ZtDNsHxFWu2Qu7q4xma6M1oeLCq26ESMJD1fDm67BeWI0wngAE+Ov10qsezLFea+PQOzQis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360322; c=relaxed/simple;
	bh=xfryxhlFXv/pRGHJApGFT7aCI/6RDj6FSvgBXPrMglE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g6f/VuC8S9L4xCCae04Bo1OLQY/z3pYfEJ752udnzDwZJp0prtVuPHkG1QxLGNujLWpcfwl3HTTgtQLLQQl7mzQt+RmeLTm3l5aYqb60A/rL4NKR/nVcV38U+pQCP8bVG0Vw3gI7T4QwRC5t18kJLw7fUInuc9JvH6bmxBoEiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViBF7r1V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViBF7r1V"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c59f740cso23230745e9.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360319; x=1783965119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=ViBF7r1VlZquGSr2H22iKYAf5mk4q1yiS+3/QjHDsf4asxbenhz1VBtIUKA/V4eou0
         dHeE9Aow/tz7JJrmXDVplmT+zxPgxyI6k978swN5pzK6sDoWBFTPQjpWqn3L1E3YD1Cg
         YxpGo524pnWpMJHJrkizeQCgI1eBPRgWO1knuoIU7z8SvPPCy1JDvjhr42GMJflWIwk5
         6gj5iB6yIZ4JqXGtD8A/hSqKPVUiuJfJnqTiOSUHHTNKdAsFvYV9c+cUGH2K/H8+Oey+
         YSIq4ejlOpo96zSxOc8YXRPrjbXemjwNxKgtvSmHRzNP5Z3DW4h1algMCSOZ3UtzduJe
         F9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360319; x=1783965119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eRTqLkz1DU8NgdnLx5nD3F/oKn3hiU7y0a27XqluRQ0=;
        b=RInldog3VG/hL2vH1I4XB4XN8d7V2c7qxQx8rIF/G2paaEemLME/b/nGRGgVVrBkFG
         ANrKqs9CNXCabPSvYhpDDHJoh+2ZLpYrwC2ZYoK2gD4PnWtk+PycTPG1tAQP8dtapz46
         2vLG7DTtPWIyq9USZgt6d+Xlqr3xxNZICYfCCO1xiUY92bWuR/iG1yayQpF/JTZC9npJ
         zqy0EMm0K8Br9ykO8NQwSnIWqXhxsy7XmKW/qnOBqWRxhSL/iYJn1y80fZPEnHcrrZUK
         HjREd/7m+hKBKJc5NiZaE0hO5qOpjiryqIty+IIZE1UtZS2bACGRRbXgOFC2afaYf8Lm
         AvbA==
X-Forwarded-Encrypted: i=1; AHgh+RpTHuUDI9GBpq4XiuFJyn2WVgvRX7cnR7JKaq7TD3hfo5/GEemRqFB0WYLZk2OwFJ/u00KtWZtPGfUa@vger.kernel.org
X-Gm-Message-State: AOJu0YyvihoVG+qqvxWW0LAF4Wi7IAWEwL1izsBStw9a+Am0ESHUzcNL
	us5faGoQSbXsYxaz5XVWantCraWvm9nWE6+vk0tHHvmd/ftxktp/1GLY
X-Gm-Gg: AfdE7cmiqjyqKJQ1+dJXz7JLQ9AEKim3sG2pjPnSyPQTR9IuDhyk1cnfzh/yLsO2v2W
	KNSA8tkrHsaWIK21+q4b9OeGXTPEC05LqS5zGqKbghfwDUwTY7XEYe5nymsfz8bY7NTRvZb3ka1
	UhDkuZ2TnNHerQ2L9WHtb1jmdycp7DlZP36MvipU/4sf2d6048yAlH/4S3pNqJNLKsrjN1GqQXL
	Rev7yCXPKbBpE3Z16LmOQhbbFNPUZFSRE5U7RGkI768aGHKZlSQVXC7bl9rt9f3lqi0o0DC9B2U
	zUS51MOZ/pbTGkBmN9kf9sIslObNmfSTOu2zSeBfyvKVq2KVmwKlG0qgz+1v2WgHU4vgIHL4PQR
	YY7KsLT0wOtNTcmvwkoX+yXN3DA3pwjNxLqOOQcdqJsKtkj1aZeFGrSfGbA5hqZ/hIhcRyEs/YH
	CUcZrJcjaUfqHqQ/4F7JPwgEeKAFsqdN5Odq8SyGWrksnv2bZTsscg79yuDfRsHx8cOwcmuFEPT
	JG2FLLADNAuu8Y6fQCIoEKF5OU=
X-Received: by 2002:a05:600c:3143:b0:493:d800:204f with SMTP id 5b1f17b1804b1-493df0a7521mr19475945e9.21.1783360318961;
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8e02:886d:c345:c5e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d49sm1263145e9.0.2026.07.06.10.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:51:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon,  6 Jul 2026 18:51:38 +0100
Message-ID: <20260706175138.12587-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260706175138.12587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the RTC block found on the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs by matching the new
"renesas,r9a09g077-rtc" compatible string.

These SoCs integrate a closely related variant of the RZ/N1 RTC IP.
Unlike the RZ/N1 implementation, the RZ/T2H and RZ/N2H variants lack
the RTCA0SUBU register. However, this register is not accessed when
operating in SCMP mode using the existing rzn1_rtc_ops_scmp
configuration, allowing the current driver infrastructure to be reused
without modification.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- No changes.

v1->v2:
- Updated commit message to drop reference about RTCA0TCR register.
- Added Reviewed-by tag.
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 2c3c82f8c693..2a6ac98a206c 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -507,6 +507,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0

