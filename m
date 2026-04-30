Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983B3AE1B8
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 10:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777543787; cv=none; b=dSitNYkJI8YJS6ksGqReKQKZEAmcwIBHbY+fpokDx5lDwaUaxVht5Z5ww4LlPusFOOz+R6oSS9DQdsD4NHiugE+aRpwXAstELDM1A6TAmbMw0QbeWlT4bX+ZJ60RWaqBId4crOa6a3qw0DWW+JixI5eV6LUnqnmWAnK2g+SVtpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777543787; c=relaxed/simple;
	bh=45NjOP9lbhIT48U21LYjyn3MRrMi+zN2K6qSPm0a5Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdcSZYTXBWT6e8OqJxD7p5D34Cn6ht0CIt3pHmInySkOTRT6dWnQAKVaUII6ls5tbEE/TWpODVFFrGiUKyKYZEGkTsYO+8WTKL/+BXRx6JrVGuWVQmYDUeAGYNmwvf4doJUCrmBW+O8T4OMN4sB/b/vvw3FlOoVOOgldbh0BU/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAsu2pLw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAsu2pLw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso8912815e9.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777543784; x=1778148584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cpesm6KYDfDAostBorsWgOYDBeIMoVo6DFxuLE013MU=;
        b=PAsu2pLwUNcu17+6zj9tT5cwHkOldUVp5JRVk3VdA/8n1y5G5gnut9m5E8jcZcTxoy
         UjmYYhKqpojAMqeyQyPeMuwuWXbbOe8kfxSF6sj5rmbw9Lj33BjqYv7Y0KOT1Gr+n6ya
         Yu3O/KXpjpzkJcXvUt8NwSNUNKJ31VA33RpRTzOjUemqR7+m1QQh/M3iNc9FCmX8kwhb
         0qrAYrRc34gkXEXk61uQ1dfotmn2rD8zFqGL/KRHow2MCieNmbBti0HHTC1vaRHl58UY
         AFtm/+P2AzMo/YzmfGS6dp59gFRUS9SQac/k86fr8zfLHBqSFV7DWxgf21zyyD6k70MM
         yVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543784; x=1778148584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cpesm6KYDfDAostBorsWgOYDBeIMoVo6DFxuLE013MU=;
        b=cgN5urvq28E5USiUxUlNbqzxBq24fDPowGteE6vetaFlaEQ+qu4iLJxmbvPz5JCLU3
         kOwSyrggGmJnqZJOo/mny/dNO8C6ZEAgm3k+VvPyHaz247OxlN4nCeosdn1al2SN0m3U
         HAQVNEhIymGY91vb//z4TAmmU7WEDEh9x2ADs79Ke3H0QXQGN2qUG1aVwtfoAXW5PwKM
         RISf2zoqJ5efgJ99aKiixNtn82HeMnTSXpxqwV6Pi4Au/uR0Wm5Zc/w8BIYl0AoigUp3
         y4oXqBQHgqrF46v0yAiyTTUjH+M/3fBwYbGYwKafFRO5EAoW84Rl3mYvJDjpWva8rzIP
         9nPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+JtG+ls4jHgRpop4GVydQgfp+iu1+UWbnAhRZZHplgsDkZD9IsvJ9zglZSyJX7wyRO6Q7aRCJtjd0@vger.kernel.org
X-Gm-Message-State: AOJu0YxSBC2j6u/GoqjDSdPT1WZS1BPbL/j1ZazKsdsIO1IgLbHlYoS9
	LvT6UUu+hj/VpTRr1tdGAeT4iIqs1oucoK5Npgng5DbsU+Vso0Fqu0hx
X-Gm-Gg: AeBDieso6M4yL9QJqgbC9uXvrGf0Z5pn79WAES98J+qUkfqYEe7QcyzKRuA3/D7FcrA
	Z34lhtoORljB+mMot0HA7fjuoxwh8VPo4tP3iG28oB++2VnxA+EzPAgvXAtxo8Ht+1ROVlSXomy
	/T6eAvDRTAsMU0iOZR6x+emeEfuF07Iu0aWMgs3++df+pyDmuZiTAl+F1e/WwpIZce8rLBHWl8k
	G6k8bIrgIu0r100rHQNiBAWXGGFRKXMJyRWQIcWxQ6rFSLVfywTilwJrPwH14cE9Wwm+3QE8WOu
	rU14+b482ECZS8wk4w0W6ygHfUZ9tbhLffkRRdLog2k8JwY5d6KyatFItwgwt2TXSMeVkeDRe6g
	zlvYQnhQIHltsaSKTuwZX/KkurIkoMWoQlHD+KUEBHF4nqK+3Ob6qWXKeCFeAUSPfXWwNoQ1l1c
	8k6Esv/7Aa/2pOL3Nz0Q1dHbPadBbOHzldMz+dqBO9r7Iv63E8/Rnrars5kX3RNjGqZfkvpdJ05
	AScifth1fLgbZwAK+iUW6sIDtVHcksElWdrFBu1XmLMlroKUiokx5+/kA==
X-Received: by 2002:a05:600c:c0db:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48a83f6b306mr27187235e9.12.1777543783833;
        Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:182e:1592:d4cf:18a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b9313c9sm40252315e9.11.2026.04.30.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 03:09:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] media: renesas: vsp1: Make reset control optional to support platforms without a reset line
Date: Thu, 30 Apr 2026 11:09:29 +0100
Message-ID: <20260430100929.1088281-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260430100929.1088281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch the VSP1 driver to use devm_reset_control_get_optional_shared()
when requesting its reset control. Some newer Renesas SoCs integrating
VSP1 such as RZ/T2H do not provide a reset line for the VSP IP block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 627b5046fa80..605fac57bd93 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -947,7 +947,7 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	vsp1->rstc = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (IS_ERR(vsp1->rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
 				     "failed to get reset control\n");
-- 
2.54.0

