Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C46C4DC53D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662050; cv=none; b=jWO5b6Vg1Jli1Ra/BRKI3wwlLL8ZV2nBB/c8d0poReQ+E8Ua0hmlV2gn/O6K/MY1BU6ya4O7P7k8eGT5qaZZHd0UWefz4nO3rrQdJhSuyOCkSHTyPEyX25/jzs58DFkBna+o7BcBejaai5JfMtRl+jZshdBg1XBlLNld8iYxue8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662050; c=relaxed/simple;
	bh=lZ7FZtmTEovnVZhym6I+cKVFhm8O/HbQ0QN2bfsjw8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHQoX4an9R9uOMIqGyxXldf5kYMEm2peVHClbnGiKBgrRYf2ltdJPYfUL4OrWf6engV2y6CS86giHlQvSgX7tc9LnkNlJtd3ofCqTqHpam+oPLzzXGo1Rdpe3a5JuU9/q/Mgzpw5o5Za7Z2aj3/At+xdFNBj2lyYUo4/+VCQ6qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaJVAB12; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaJVAB12"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8421f0e9c5bso834024b3a.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662048; x=1781266848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csAKonk0gKIDvDKdblNmpfIrIfjhCZDOh//IaoDPNxo=;
        b=JaJVAB12B6mycSLszIHn4MtmFmIMKfPect3WiBFw3FhyTdVTHdy6m5baAvEXLfbzFL
         pjWywbN1ZkmFZO86dlNZXU5LJgHk0ZFwHecj9MWqt22yAD/HkMDVA5DzL7DX8sCNJLFW
         SX+DbPuMPFmUknAdXysM7aiKer1RQZx2GV+ZK1rJSQ0SHgIhcYNwQBkcIUOTEZ+FFWrC
         Hw7IbHUANbOxh98wr4vgt6A+TMuqqCBk9+UfQvzALFWMDmJBslPfW4QkYEGozX0QEQoW
         MDq903vXIsFz9z/96C5sjWEA22ja9RqgEon4qTi7nmBObRt4v1I7iAJkUtXKi52A2MCm
         mu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662048; x=1781266848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csAKonk0gKIDvDKdblNmpfIrIfjhCZDOh//IaoDPNxo=;
        b=InA9o7R3i66nzpenzj0tHPI+l3q4FYMS0Q+sNtcMftFyWA/8XoDCCdZGgQnltrFqAY
         4c5K9uJ9uzRIxSy7xM2uePRR3IwzkRniuNybqKxP+JQ2GrBouDCPXd4rzId2QdI7/b0X
         aDGUz5QdZye69mpdIq09eeD3loKKdBBvbbjnTtDTHoEHSPadEtvETEn1y/kVz4xEEz/Q
         POr5jU8WPCYZZ9ji+Re3gokOYzoe/UJGAaAPJkOm7SC1zVriwWKymyCHOZc4HSqMBqKy
         5lso9L06QcOd0K8ZRagHRzmuMLHmRJQOGizdI9ZDwG/FWDp0rIrpw/i1a0ujShVZdDZ7
         +uVg==
X-Forwarded-Encrypted: i=1; AFNElJ8tewCGHzKeqauQdv7UaJTnBI2qPeEcvOaNVo8S6RzkYBgI3KGZ7ldJEPNa+4kWwKBjtXb1bsQOHpy1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5OaB4bzT/35co4TcjLDEuBECyxOFBLnRGkdekAsDBSHMB/uGh
	maVvZSEQTqhwTQP7c6iUh7HLGTM3uLV74zmuOMJ4MPPeB+l7cje/DRES
X-Gm-Gg: Acq92OH+awSSDbLfCSVtjn+lDT3DfwSiAx/H7AKJUsPMBct/AgAt30AvPcflRwtqhDI
	TcDswkbGfpsf59pncjgUufV1yHKjuoIAaywIPD1+4cxhDaAvqzWNY4U1N0jzhDjBu0i6OBN6y2Z
	EWs3oJfZ/vGZEz3iRanUBqpMwuD2hMKaBzTqUP00MZ1uUt8XBwqETSnJO283sV/yt38TMEl4X+3
	ZX4nf99tttX0qsE8tZYHdPs+y5XE+1+f/Lym5ew/AS/HubmyD0gD5OkS4yaDGBKO+uNGeVSL4tP
	BgSwFRfArYfRxoezneGU4p/y/qTA2RvreVMvRuRbeeRopesZGzK3wxgztnXV3dV5Es3DPRGj01P
	LQvkabOBff9T2h8kA/kHfG+WJrRziRTJ8qOSb0nzRUeA4OZ4/hpuPwjyhKG4be16n/xH8ZE0wHn
	+qT77I+mxdySafTuR46w+PsrRAqWzBt6ajRpb6IfcnwaTOI6WHClUDBRvpa20OFwUkAUCu
X-Received: by 2002:a05:6a00:b807:b0:842:51af:b3af with SMTP id d2e1a72fcca58-842b0e1c71dmr3279912b3a.3.1780662047867;
        Fri, 05 Jun 2026 05:20:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:47 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 07/10] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Fri,  5 Jun 2026 19:19:51 +0700
Message-ID: <20260605121955.105661-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick and div clocks are optional resources. Use
devm_clk_get_optional() instead of devm_clk_get() when acquiring these
clocks and switch to dev_err_probe() for error reporting.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 43e6772c06d5..a2d7d17dd2bb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -990,15 +990,13 @@ static int fsi_clk_init(struct device *dev,
 
 	clock->own = devm_clk_get(dev, NULL);
 	if (IS_ERR(clock->own))
-		return -EINVAL;
+		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1007,11 +1005,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1020,11 +1016,9 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
-- 
2.43.0

