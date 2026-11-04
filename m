Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816483;
	b=CUpPjGhNX2DxwjazvJ25+M593OBFfOh5Szgr5wAe0RgtLeAvupd5nkO5y6K1Ef1nN8xd
	 T81i9j1wv8rWb9M5qz9HIbj4aGhw2h6+Cci+17rv6OIoLV+taj4MpRLNkMm37bt0sTkTD
	 Ht9GpL+t5W3/U8wLF75KO4HBDMp5zl8sq0XjVt3We4ngecqtEnkmjjBHkjSXPvUz3lDFI
	 wPpbuISjXFibTzqdyEzo5PaHhybFTkHPz1XZYEOw0lE2ZZL7pnCY3AS2upbJ3I8DX3L1e
	 8oHw2B1TTp4e0oE134t9UNQFgLY9PKUmPmJGSR2ATMYl/wdMWZoxcabej+wn6zCVhnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
	b=uIxOeujT1MV7TrOSandakdR/DXs96RYhLXEQc6MUTXg5fxI4d/6D8cNHV0QHiZPdtzoj
	 V17HGtT98D7dYzSU6ilPPmuGuTKIN7A90UaM22NfUuybGuNemrJe5bSR1KRL5CLAAfQNf
	 2glyRjRt7KFT1Pk3Vh0WaZ5aYgxkPFH2od/m6rCVwCPegeN8HmFzdqgBgcWE1L5PENgeL
	 qPwyWXCOZxJHvpYHAeEPtOMoMS8FveC1UEXDkLfoZP2eNeFmxIUQUwt0RuPIyrasG9rmx
	 DrKqyYE8rvycrQfmYhcQSGDgnFpKPlnVW6i6VY6j1n9kkAvbEBF9AwR4DFlYjbswzvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5corqjg;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7264A608362C
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7264A608362C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B5corqjg
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so7861995e9.2
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816481; x=1794421281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=B5corqjge8lxXP8hH2NNrMFHeSd6tqG7U2fOuevHtZCjzKMBlC7wko1wz1Zc+QvhOW
         GguDbv+6DYxVrQ2PS/Jm7KIIO3enikMFBRIGGeQGI+VXDYF/+22Et2ITlZVCVop7/Nxi
         6AbajOlVqPIfVFAQKhBq9aQ5oTCoRFpSN/tJmAvj7/jbDsjVZlt8h/xdSpCHTYI/xjEl
         +tLpuLQC6Ww2S/IoslY7P53atZ7Ddl5Wn3gpNf2ERsj3Bm3+7TTCvvI5gfYqMCWp4yQr
         LVWmEdX15TNTKJtr9WGw4n7yrWCe7jEDT2r68j7+9XKc2GoRD0NpHfddYBrUBfRig+9k
         wjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816481; x=1794421281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoA0b0WqoQVyQ4s8ggfEko6YCn52CN5Lygx0rJr7TsU=;
        b=JbUDQ+SuyINddlNJMO/n/0w4Kv0toKdBkEqEFmOGHFIopWs/n8wtJ3o92hNSFlMhY5
         dNAcwwz+88nJoR2Y8+oBltIpIUy/rV8kNyIzo1fOCAl4HK4isWmUm2WSiXbgcPxWqg3i
         q7qw87OiHYwfdoKwyYqMirAIsU1w2N+9jl7uNf+/7qPbNXE1mdACPBNlvSKdtl1t/7kK
         ISvxZNaWxf1Oj8TQiEvrQmCngTBinucdyQ9/YLZWAJ15Aq3rNsgA/9MLolsLh1wVZcDI
         0ilbhY8pO4fVf4pwTGQOWqgIMFDx3e/QMPWWle8b9bga0COYaNq9O/ptTJMXV+nLDzUZ
         bwBg==
X-Forwarded-Encrypted: i=1; AKwUvBwaUGzZbuRFwyw0GSMRaHfngusAM2n1tPepl2s7W8JH1yzvLOcIkWiGOy9k2xp3o9A7kbAx1QlFQKGl@vger.kernel.org
X-Gm-Message-State: APuU4Z9sbPhAddmJyYh9Lj75HdiHdP54l0QMLF8AYmxYnV/t8sWRsnDg
	2m8+6NLTy4dHFh1y8E82phOmVcIpdEjtxwSL/0uBkP1we+my2VpkWXzj
X-Gm-Gg: AYBFou3shuyeAwwi4wsy5NQnFa7yA3QWuGsWhU4035uj/Nmb4+r+ZZVn7wAz4Z+FAvj
	n1g05+rrR85PVL6+Mo9pb0/3oqfwfCVYr1lSCVRnDjyG0Hszw3ciA3HVx8Ydd0hBa5LA2FsWeAP
	O8pJC2uS8SeBfWOrg48/LYrGMcARpI2UtaMeqRWSj7ttYO9Y7VCE47NerKDaqIFTbJrLc6IrGwQ
	7IDSQi6UCcflO4JhA+bImURdZksEMTOZIpm+YOv+fYIW2X7i4z0lxgGXE4wGjgitKPNDIc1sOc1
	BTxeF1xDHsZLuDuC2JY/AdWBOtzoBTWOaQRz2na6ML3VJCFHWoIJZt25saMBShHB6ZH5+OUt6Im
	bqwaXU4/2sBQF8BGxki7JU9pKjKm4U7J8TMvQTZFzN2W29fVtvin3G7oj2dofki2D3uiol+YqFv
	qkXBT0DYxnN27H9XoDBiPm7aJt/bbHzKJ+28gZZLwmPWJJdp05qu9CUeEXz5MkgoRQevcILfbHH
	IubUmPyUg3crwDnfc450rRELus5rvS73m/JwRyY0/Osht3MAJUR8Y/nVYODd08s5tgXKW/6mJ+o
	u/rVBpumoRw3zxH5b86041Oq5FCQOp1Oggs7qjj0L0QSpffcXmw/Px775wFRh5Mvg/FHagZAEqs
	3ehfYgTopCcmCXKR1G19VEqqk8Q/RA0jQ/PSaX3JfXPerqzyPe3dvFa1DG5Pg
X-Received: by 2002:a05:600c:198e:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4ac1932a23fmr387484835e9.32.1793816480738;
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH net-next v4 09/14] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Wed,  4 Nov 2026 18:20:57 +0000
Message-ID: <20261104182105.1102555-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
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
v3->v4:
- No change

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
2.56.0

