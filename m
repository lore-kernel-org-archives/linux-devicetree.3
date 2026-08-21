Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C682415F23
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 21:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787346710; cv=none; b=aKSpot+exK8th6+pITba9eGYhFVLnk3HjrnpsFrU5OkX9ukR0ygn/gnbwwQxwXAXi9dSohcTwTMQyjTVqNWjYg3tDuLWFmnxrR4e7ohB1XM14NlquzqHr9Zvpx4nymeDhT7XfdSGhiUQi+7Zv99Tx0zR7fDyocQcbEHGQLvMdv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787346710; c=relaxed/simple;
	bh=5VW0bECDsMauSvaKs56MCVCbEPQcV05TjHG5C7nHTk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubHoWkeySbu4694OV8OtW5/F2Jm9eSoBgNJXhimEgQKJiQcen9wjlSJtUy7SstsqvmIuqqhpo7x5YS+olwDsbPerol7ZtecC1BwK0fUFOhR0odMuKSEaDQAYIPJZo1aqJbD3Yl5evuAqUoyUG9drZaLzCixzuclH5tSGCMljjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koQvz4wY; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koQvz4wY"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1144092a12.2
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 14:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787346708; x=1787951508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/9L56pVAtDYTQEB8I2wsSse1txCSpY+BJszOWMEp7w=;
        b=koQvz4wYI6FmDM0fvgvnH9OtC2PSIU/zi9xPdTT4FEfKN3bIeg01iDRIRFLC/Wsd8i
         EMp3DsZ/Xpm9WLt1CAKlP+666CC6HdDqeSQScP+j++xvqUGAF1zL0NtlIkcsj9raoCpe
         4AHmz9ATUpMas3QfPQ88MneuPBfO2tEy0yNt6HGFfLVdMRJ2udkQwZbVrTJQa/NbQW5c
         a5JsV5cf/a414DvqKROmWzSvGbdRTTIPDhd0ymAWxFX8NuN1hpdDblsvMX4uvO8DfZVD
         tm52yaEULW3EmlZ9T8z/b4lnMpGhxktPnUY+32cNPZXwONPe9NFETjxaU16K8u9i33Mp
         /WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787346708; x=1787951508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/9L56pVAtDYTQEB8I2wsSse1txCSpY+BJszOWMEp7w=;
        b=DvONcKLJp5lQBFyOnoK9i8/t6bTh9aQvGtyg/6A1xiMnUrQUoyZLDCY7w9pTufb8c7
         JpwM5FJrg69et54KzfvYGtQwPZ9mWhX5iWzv7I70wK1cTpk9tU+F8F4sMr0B5H6+cdM5
         rymhsG8wR+cBvAi3XUIfHk8yjixI2z/vlnG6x1iFiFHZbK5PVFiGUo6yXRS02Kdtciev
         Q1oKXJFpuykqFaIm92hwqzZ3JYVsla7ZfUo7D43PsFe69diXpJ84utvECn8KgbeQGKHg
         EM8fxq4ICr/kgi0RgGdKUf9tKrITpGZX+TGZotPFDOLIZkfdu0gAYVWopW6tgoa2icDj
         /PUg==
X-Forwarded-Encrypted: i=1; AHgh+Rom8+CLWMOaljhOg0hwxcix0sbiJh6i6BzzQOF5XO9zW7jkqoXWVGCeLkBrcrjx7QMxMavJIs0/vPOz@vger.kernel.org
X-Gm-Message-State: AFuF++mtA6mDhe/4MnQAq1LF+AEmsqX/n+Mcg6Oi560KLNTtsmeo8zuG
	6gUrMocUVsUlzGkt36ALqlm5OBVdLsbnYFtjXiFxohJkXbKAXIOd58+q
X-Gm-Gg: AR+sD12l61dbQIRjYQ2KrqpKU2WA/RlyQfUYmegI3Y4y6OiF/f6GjGEQxBvq6FQ/Nsz
	kXfw7h5tvgW+k2tBbYi/VLA1xR57k9NHqX+RLmXH+p25WrYBmpIKT1yOIIJpP9AF4sLQNv2EU+a
	Daldgtdo8MEN4Pn99kAsTQQk8DHSFzR/LC2UynlPR5vbKlMCaTdVn2ORIGv7IjmedfXjgMrup6b
	FbE/bBzoWGWsFGwIhuX85heR/9CUhNt94Wv1pyXlKriPRxX7vPbxXjjC7roqmrAF7+gGVaIq/VE
	76xX+K5f3e+ex1XJuvsxHUIWO2t0B8R2JUkvG9GLmvep6NTtSMr0H6Ci3bWrBIzY4uxtjh+uz4L
	vhjlHJeeRx3WcfL6GuArPBqvAuzWlu/3mbBTbWLzLd5z25ksb8GjvLNRlzeUApQ9W6QuMolAtZS
	kJsEpK1cZeWLzC1QuzXQOk4Rmyn57FUjXoAsAKQZvfTBRy6Vs4y6RRTqa8hIwyonijM+pyQ3fEE
	hWrZEPpn5NcWC/JhSZExafCYQOqKo43i8G/B3sbONy66K+U3Rrn3uR4B9E+2E03jnwRICnr
X-Received: by 2002:a05:6a20:1eb0:b0:3c3:8c91:5da0 with SMTP id adf61e73a8af0-3cd4bbef78bmr2989189637.15.1787346708460;
        Fri, 21 Aug 2026 14:11:48 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:194c:dba4:ea1e:d7d1:affe])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm49755257eec.26.2026.08.21.14.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:11:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: [PATCH v6 09/17] rtc: rzn1: Use pm_runtime_put_sync()
Date: Fri, 21 Aug 2026 22:10:24 +0100
Message-ID: <20260821211032.13554-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821211032.13554-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v5->v6:
- Added Reviewed-by and Tested-by tags from Wolfram

v4->v5:
- Updated commit message
- Moved the patch prior to the patch that replaces the .remove() callback
  with devm_add_action_or_reset() 

v3->v4:
- New patch
---
 drivers/rtc/rtc-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 12c52003a7dc..84ec8dc397e5 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -493,7 +493,7 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	return 0;
 
 dis_runtime_pm:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return ret;
 }
@@ -505,7 +505,7 @@ static void rzn1_rtc_remove(struct platform_device *pdev)
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 }
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
-- 
2.43.0

