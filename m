Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD49519DF1
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983965; cv=none; b=b5nlD8lw6G5MxhqDi3tpFuO/iy6HIPENSrVivgeuKfWuIZZTtIsVUy0A3WKP3PFyPSeocboMyU24bTFytpcyhK+DdsCDgErzd6exr/GBnUhADw4x6alEwMhHUK638HP6CpOo3YWoe/FlZdrJ0U4Ta/c9O0ExiEddrIupz8L+mvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983965; c=relaxed/simple;
	bh=3XiTnHjtKyGmYkxo+YoIHM8WRSb4sHGlwJsHPkB7tD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3GlUxHp1ym4EYqHuLNWInneneZg4/weGI2X1aid1rAy3V3fe2m158GChgdRM7nR+/cEyEhs+RlFoKiuv6lgqRGnqDfCC7hOBZZJHjOvPKSZrdXOAStcoktG+SdKEdw/vpkPNnfa3LOii9WfTJwxX9qHg0liXZ8Ytu8fztHWTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2BGSwzz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2BGSwzz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so36205485e9.0
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983960; x=1792588760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrQd1TYxVsLLCzKNoYMSTtNryDC1lxFWl13clDFwphI=;
        b=H2BGSwzzIrGTKjQztNDil20hhrNA319Ey/VQW6jRXln4Yc3qs+ldJGIEetsh+XXr57
         A9k99W183bn5vQRWW+C1JbdMrOxwzyLy2hkx177WWrH53tLg2GeDGjbnbZXOkJKEz6Pg
         XC2X0jWoqColjXdn7OpK4ru+bJmWzhvcHrWqmor8jq1X1e1KR/HPKyrSoNqvUxIhaNgO
         2KBVVgi/frhrf2JfOFrewkGkSAhX+WlFkkiXFhFE+a/tV2mWn0/6CVIlx1kUMI0qJ/ph
         xP8CcqKp/7MVhby9tmDoqlySUsj99JlSnqlngU0DrkDMQV89CSRTO67S+IUHJqXKv+v2
         E7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983960; x=1792588760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrQd1TYxVsLLCzKNoYMSTtNryDC1lxFWl13clDFwphI=;
        b=iBmDUzrqXn7r05rxgXj2PLbTHCl4whqPhJxUOqTBhNZqnvL1AyxjFXAedqo2edGeb9
         wrLGzXPaDfvIf/oKVmE57M8A7BZjxEWl5lRmePDT7ccUph9nkhlFrEjZ7wgQhOMAA2fs
         fs/jyfQcRl32Fzlf8S1mvG7TBnX4MTOCywXhi+Ou+0MP/rERvXBeAMvzDU3Cr7tdLLeJ
         GJGm2iw2KPblEPhwcHtjKSBz8T439k2LZR2sWAjU+h6Qyf/BBtRduv/knn8BtWSvUyYr
         1H4aRjwn13xMmqMgmHmt3lJAJrMUBca/rPpxJKdC63qFn3XB8zLE2W1WK1ZCFRG9VbiX
         r6VA==
X-Forwarded-Encrypted: i=1; AKwUvBx7t7hc/+CPqVig54z2MNJC9WOFM/JD9lOxzGVUdtc5/WTZojOIcOWOFTRRPTbVqSH3wv2Il4Gj7H/F@vger.kernel.org
X-Gm-Message-State: AFq9FYIiRYNEs4BwA4g42OS250EKZxO5X5lkXjhWp1dSbDZzQGrdwJIy
	PFupWIlQyGEMwSs4k1TlJuOQG9hH1DFFyqu6vOq6gU3TSJoJtmkLlBV7
X-Gm-Gg: AYBFou14W5AGUgTv6kVIdwWV+RcRO56e8/NqyFeiklOPNeqFdxZ9Ngo3zuX8YS50YS2
	vYSwxdSVON6IhSV/RVXmID73BVDpXdFNN0NoV97gkcflupEnR2tOa8QKbfVC1qSR/eNxcspQmdq
	NUFlR6xMiwCnUGmTUj8s7KAun1SkG9TJHeBcIDMA2tPrc/RNFvcbcwlNVI2VnIQN7gIdDGTMx13
	FG7XP9glH0TEa2jd3L6kO9nPocm8H7wRBEcTcAyznt66rW7q4LE5ksdh1VdDbgkNSjaIgG2ON3E
	NieK4VTUn5wbf2CnpTxJQuu2zFTUULqIinAEFkCJWDdefDj/FX7uH9gJYIBJZ9+HcUCjhwNgW1E
	aQVFmIOvsCQ/wrTswuPx6w1f8w2+VqpGN02nrY4C+lEhM4ygylwc1L4Pwli2wPD9FGa938kZ27l
	UeBMtK44la67SlyBeqEsjlu126/frKDoDwbCn8cn2AS4ZCWTtuaI0PA3KMa6JynpfOAQRdUbNRy
	FCQ6Ht4M4gVTdQDCAGg7Jsbj8KAwsirsqh9gKDWwYIGHf2WQymUQJ3LvBdiIZMPHTQDRyKkB8uT
	ZU+7INpwcWyXTzC7gxE=
X-Received: by 2002:a05:600c:630f:b0:4a1:9f59:ee7 with SMTP id 5b1f17b1804b1-4a19f5911f4mr186961775e9.0.1791983959697;
        Wed, 14 Oct 2026 06:19:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 08/13] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Wed, 14 Oct 2026 14:18:56 +0100
Message-ID: <20261014131906.990077-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 846216f22bc3..bdfa84745eda 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1234,15 +1234,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.55.0

