Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E93403144
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 11:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005177; cv=none; b=XHpH4W7708+LYeRkwDG5ri8dIK+2P6IzH9A5U+f0V60C+NdVndwREFS5NBGI3brkNrx0XWUL/zHLNqcx8GzfPuZ0kZA5um4zlseZfqRTh7rXcBqlXuG5u+73MWGOfFkphB+Qq2tlwbnrc1FzTWxdWvi/zjKCXjD9Zgm4j6YIIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005177; c=relaxed/simple;
	bh=SsUMo+hqcHS6PAZWbeNXNV6E2THXUTZEf8/ZmCsujio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psGrWMsz9jY7hK9uGZMHqT5WAq62sKflrbKVvVQCcbGFK/EXSW7Nyye+xDYz55JJI5KRGsp6UxANwPxrI8nOFWLxo0UojUoOnzloS7NacTK1/biXB+XfDjbAmil2iBzV8bL5jTV6zQhvdeMpUUA7OpPQtdCurbm4SDhbu3vDSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEBnvUDk; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEBnvUDk"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf20f6be6bso41686765ad.3
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005172; x=1781609972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=pEBnvUDkmkrx6ZB/na9wJt+Bnjmf79cW7CU1DyRbbBv0v/Ha5Yt+ZNmp0AZHJiV/o2
         jlAJswIw33N+/rV+0LEotDJMG2nITK6ByFU2aJnA8LMoS0ZYjLGo1rg4KbRZwCVdzuHU
         RS8Oe4EpKb7lK/pxcTNH2F14+4QGtbMv0uu/T7pa62a8q2GTG3bTglCOUWJ93QLG2Rk9
         YAXxIHEIfpKTPJeLtl3ZrRXpc82uJsC/+uX4URZOkQ5U5xtaFqHcnIyfe4eI1RZ9s85e
         Ayjv8qZMshoPEoGmlyVFPdhQkOKLFcRVVCV/MLaZOkWVvq27A7cfnjDjg50lwtZwZzsy
         t+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005172; x=1781609972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=btle9qlFdNHhg/yZTU5eyJZhUVYtJLKRE/IEtXriIZs=;
        b=VxYDbI9Kz6L7bdQwPVZz0vbLfnaOZxtuhhq/NmPIQdwkGCfdIPzLVQbi542934h9fl
         o6y7DujRcZnI/tMOrSx1lseupuiTWchlVSnmNHCy4i5QobSLcPxGwtpAvwKDlplsBCRz
         4oQxVip/+R5MbvHUsbDvQ9wK7P7OQ2XmqLszhivh25yX1E+MnYXZ2zmPzKo7k0/1BoYM
         Uj7gv8FtNfzv19wQhi+17bOyO+IQDxXoE4F6jnxSV97Nt4vjD7frZUz1fumSwOZ4DqM9
         UAFc1GAVKQTgr0FKrHtQWJixmyPnlB69kPEVMDupdMqdg9/Hq6E/WTtm28rJOG2UG354
         lDDw==
X-Forwarded-Encrypted: i=1; AFNElJ/LcLAp+CBQobRC7mzJjftT8FuPhQKK2xZcrJZibhCAcCgeDIMJBbKpLKoHEJWT9sckcC/6oUQ9Kywf@vger.kernel.org
X-Gm-Message-State: AOJu0YxteBlcVMTTUZtCQTqQvqx+/+BnV9rVdb+uCgfOQ/yFFSoXRUVr
	vF1nRK7yPu8bWhDpxrbLcS8TGHA0mkkFaimDxk3Ebjx+gxmHI+vp8YdY
X-Gm-Gg: Acq92OEMOBW7jm6DbxOvUDeXMHF+gRqUJTzxY921leyxM7XaYittYHIwdPNUOWkT9GK
	mkon78FLA58Y5vWkUMWNX+wYlvqqSPicsVrS34DyDhfYcA2T1osXR780v64Dbw2ZpBGrjC1Tf2+
	lyMBTxXlZEgvl/OirKxevBC0QxXdoz3k9NzrQ3riO8GvTDZTaQjCntlS13G3JCSjtdHnIw98Dlm
	frf8cTJjeNPLU4RO9M8Qu5s9He1OVE7RJH6t5xwGFIln4K3aE3UDT1hjkI9pQ1UETQpUeqQmSjc
	VOuLQRzBcXdPFjBfj6+uHSl0NhddHKyO+gcxB29n5d9qLtIQxmX6rdq3gNug1rQ9id8d/oNp/OH
	JUNcalpODiQElgWTIabBvT99uK5zAcVkpHfHyDXElCWJj7xYH4bcGsuYZgKEGVGG/kqFMJtvIlI
	EjrFMSozO0/vb4fSd99KfQeGQNGFMHxt/9zjmV4tzo7kN3osrl9kxkbMcn5tgssttwxE8u
X-Received: by 2002:a17:902:f64e:b0:2c1:4310:d80 with SMTP id d9443c01a7336-2c1e79e22bamr237302725ad.8.1781005171824;
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:31 -0700 (PDT)
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
Subject: [PATCH v6 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 18:38:32 +0700
Message-ID: <20260609113836.45079-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The xck, ick, and div clocks are optional. Switch from devm_clk_get()
to devm_clk_get_optional() to correctly handle cases where these clocks
are missing.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.

 sound/soc/renesas/fsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1df7dc014363..e29be2bcf952 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -994,7 +994,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* external clock */
 	if (xck) {
-		clock->xck = devm_clk_get(dev, is_porta ? "xcka" : "xckb");
+		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
 		if (IS_ERR(clock->xck)) {
 			dev_err(dev, "can't get xck clock\n");
 			return -EINVAL;
@@ -1007,7 +1007,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
-		clock->ick = devm_clk_get(dev,  is_porta ? "icka" : "ickb");
+		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
 		if (IS_ERR(clock->ick)) {
 			dev_err(dev, "can't get ick clock\n");
 			return -EINVAL;
@@ -1020,7 +1020,7 @@ static int fsi_clk_init(struct device *dev,
 
 	/* FSI-DIV */
 	if (div) {
-		clock->div = devm_clk_get(dev,  is_porta ? "diva" : "divb");
+		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
 		if (IS_ERR(clock->div)) {
 			dev_err(dev, "can't get div clock\n");
 			return -EINVAL;
-- 
2.43.0

