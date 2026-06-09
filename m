Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEAE344030
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 01:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968724; cv=none; b=cGq2J1GYoOiT/hOqf4lPIeLeyEYUY2bMLXplvWYjNwi/Ladj4OaSprsNZ07u6VpP6VxbZLEW+VQEUh7vhipJD4pDtLXEY7rUi0lw+KHIRe9mWN/Me8DcseYTS4PbRkElEOYfRpz/w3W3Pp0TE4IFYS0K41XlZH7PT7AVeLfIbwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968724; c=relaxed/simple;
	bh=YpcDZMX363iIvbH5/NBtR85ZcvXyI4n+RHVGoibhH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuJ+W5TzkL3MnTV/Z8Tt3bLfSPdFq6E0bUuRwCohVcOUkOZPeQUa4jaeRLncKZl2MK+RLiIoitND7CIFRnnuTvONP7+2ldK50NFSP/pyVUEucp0m7mD9g+Oe076uoWCp0LKpbM27v9tlTH5eLrlXI9X4wXA5N/Q8UPgKLfaORsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdI45W77; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdI45W77"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c132ac5ec2so48591345ad.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 18:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968719; x=1781573519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=VdI45W77g1mNYc2sa/WMOZFI/Ut7kw1XmCDaITyuhyIYmTzlDJr1VDxpwYO414cpaY
         3cHXrY1ktqBrkoa+tBj/u1yjCrc++cCkpYqxUQ+/HMnZu7V57Ebfs2tCFTfo/9twN9ar
         e4p7H4Z5LkJJtS54YV9Cg/axxbXbgHlfdhUmAi/eXknBC4iNUXEImSddeApUR6SpMKum
         O/KpxZKWrygZhMUgXed4cVsrtH0QhB3W1slwYSk0mAVT2s3qwFLtNJR28UdaMr9f8X7H
         Nj4c4r+mY7V93/ZozKl9o/1m01xE1vNrylu8SJ68VRgUAFNJ7ZIMamCCTQYDhgPCIglr
         CA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968719; x=1781573519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+bbQbftJjjFu55E1JFO4f7u5X8QUCbi+q5hkfYSnqE=;
        b=dKqyvxG1ixmn6QmMIWsuT/W7wUk8jMHW41ZDVQdnmwRK6GWOhePL90axGRjH1sjd8Q
         4nQvj4GpNn7sh4S4YbmgDny2FYCSHcIkhnJfl/8Qp6PTipPem6knRDX0FY69EL+4CyzF
         D7SuxHJb81wdfjNo8p+4SKIC0epleL5pxD/91uaSjDv9auX2qEaboW/uOhuSrVjz7+j2
         ZrXBKZpql0AySZC3sIBvUdlDdML0zms8st+ZgGtGhXSjQXqT3rNoaSPRXJ67+DZp8Qpe
         odCO3gPzr7ctAQBCYGIUamA7rMqYJJ7ddTl0Qig+KtkREM1+cLmRawsOMC3p6OFf2Me0
         RKIg==
X-Forwarded-Encrypted: i=1; AFNElJ8SlRb5zR8gz2uq3xJxcWL2abxz3CxmhPRc/Zvx5ZHNA+uLXx0iigg2urWquQHRu0YUHlTmpU7i79KK@vger.kernel.org
X-Gm-Message-State: AOJu0YztxyB7cuPKIOjfonh/5A7SnmwMiq8D7SNneo+AlrQulYbx7dDg
	TCPsh5ZDTfu9qL/7owgu9vKpbWnyj031Rr0F7ljwaMdpgNGMzRtKXCGN
X-Gm-Gg: Acq92OGlFSDqPttpVEj4dY2nLqniSZCuz1LVd84ZDYSLTkffBNixoNgaBd3O9k78mpb
	1cNBem63Tag0044TRanpl0FmRvKTvjZGKXnUxfPLJN+Wj8Tuj9opuDsEI4Ac2duOdypmuEjR9YY
	u6m5abRIQq4Jfa5TZLD0dBlJQDe48BPRx0VsdX8b42NMqm1tWIwEihlgD2igKrcwdEyQWhjsCjn
	v8UO0GOg952B2t0bEu2vAiURhoB9k0QESJlir5gyZY0Le7JTbvoaeNWWgqxRXLkIF0be3W3sVOv
	VJmmOSizR2DweCubOb9eF2+GAuHNSgpLrOpS5bGgrmN01hF+v/J+1n7DeQCpBrH4AnDtpy9a7aG
	cfstfSGhwaLpynwVnCFo8zlAsc5qDuHISTft/s4rekYxSyyBhDvqtRMVhsBDhoVzYcwNpnJ3u0H
	J66d2bDKEkUBLl2s3UBKKAJAFBrhIzn4NPVkYsE+51SQiW2YNE+b0XRPgQuWP+MimvYDhpWqlvh
	LnOVh8=
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr200993215ad.0.1780968719494;
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:59 -0700 (PDT)
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
Subject: [PATCH v5 07/11] ASoC: renesas: fsi: Use devm_clk_get_optional() for optional clocks
Date: Tue,  9 Jun 2026 08:31:03 +0700
Message-ID: <20260609013107.5995-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

