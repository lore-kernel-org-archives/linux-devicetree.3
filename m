Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134368;
	b=HrUHxzsVatSEWrUY3kciJo0ANvZPCmsnmzoASNF66xcSQ6DAZsDE1gQgKnChEC10DCLO
	 taU+dR89ArPkOV04uD1IlpMCk87Je167EGpiMjYO6NtxvYqIxddEUB9hiL8ieNd1VSk3I
	 tq9OxzJxkjo7zPGws4b55x100nF3b/Sqa5k2W9JQeL7EENed1nqHPtkOjA4C4lrQffkKt
	 /5etQd0b14JC6FgN5jym+cLEmqUVirve6DFDtRWmxIX0hp2NDCbEFNYeMf+27ZVzgl+sP
	 INc8QO5V9PN0aXqocEjDIn5MiSW5gsjrLXG2sVNry8USAp2Bcx2g6MTrDLrMKsOJSFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
	b=ZefpD1crvMHpJTDXIj7i/xYCWudDwcf6YX+/LHsuYA34p2+sbV5rTGM4GHdRxC+54nlw
	 Keawbd0Dh0/uD7NNkgkVyAQZPCfnMJ/SeToLMqoeWlVI1MhEQRYgAfn8tr8aa+r9mj+Ga
	 YWNkZKOj18yKxtmycz9oY+UNgbLnBP+wzDdKt2fYL4FTGyKdtVj4JTFgK1W8/hhzLVeSz
	 0SDBjS8XHOYi5LP1hBvDP2f+mRy0sURaRpmW/o37jYqqwcOvahyP02FFbB2ejHhttaYlS
	 tDcbK+pOFeS4ChrjsEkfrFm+y9hdMm4em289NkWzllVL0S4S1WAMSqL4OgZWUnWsmpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257360A5BE8
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9257360A5BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vd40TbB0
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so152739f8f.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134367; x=1795739167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=vd40TbB0uflLt4DjFBLgec/FN7GfDut6M9wIu3JPk00vzIUT7wcRxsTKWDKxdLGc0y
         HCINz0GLSWh9Qgr4NRDOm44RoGPqiKrcuSznKHLmOerYFu98tZg8xIrI+ZEXv7T70R7n
         jZWPJrK3tY8nC8ckV722EkkxFanqNijXd7b1G42npeNo45yVrt0YOG05hNLGs0wjSkIT
         KauT9/+Zn4KeWuSrg3ViG3dydVYhN7M6Z/pZvi78TT/IQY3zNcCHilJ0CguDiG/0PWnW
         vruV6ij7ueVP494XtV8jXdXdBH5ivVsLIi3qtGpm9Vu3vwpZIBSP/L+7TELCjiTeroDl
         8WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134367; x=1795739167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJhGb+Z3gAKzt+6oLGYtucZ6H27Rrxpj96GmwUtqKvQ=;
        b=eY/LDQ5tCVLcshekhyQVvDonuV6voOmq3jxVsVSz3PFdrwNnlSybgoP9iQBcL9+c57
         q0GyhzQ86MbP0xpMqec89TgWYrdDPROXKU+jaI0Vcl8JgpwXLt5bLyKXE+dHGj/7Fr1d
         8+Uk9XvpjFJ5r2Zh+m5uJF3CvrLXxqN6wYsXuKBJk6pVMiLlXXRdaXcKSIvHyaQclB/q
         JMAk11nuqFqQmcbEf7LRNB4l07ceDRRReqLfRkTgCsBJaAY6nO6zEIH7QSwQiMZ9zYta
         KExM5mT7E8yiq07b3QzkXV30z7EynCKQ8d9kxvJ1g8GUZuziCh+y92F1VRRLLTAmqddj
         fEhQ==
X-Forwarded-Encrypted: i=1; AL+hErHUFOTf7B0zbrY42DrdHVfqcZ3ivPTPBjvxwv7pnwd0tYJ++PU0ICSjDUf3owz345oNj/V+w2AkBUq2@vger.kernel.org
X-Gm-Message-State: APuU4Z8yL4K05XFpaSjzHVsFxLlm3RSupdrjqzSkM5062vWM5nElzkaQ
	iFAmU6jEliYm350D9gzntzLpi6N9TyygKH3HXJq05A0/LLW2WWKTTbLS
X-Gm-Gg: AZFdTZcn/X9w5ei7uA7NxRJrJG78HSAC5CrWrGE6z9U9ZGXl9qJ+xosfsz4+rY+V8y7
	7lO305HcOGv8R+pbhtUb5T9kw6PHGOy8EqAsXy3yJct3F6xljo9sQ8Ph0anyZDe9wzQIgApcgrd
	uCxCncdIWiE40OKJFwz1HIoRvCzjOCQGMNnwUG7zzCJmE3+tPwjNHJLvN3QtGFMT1uYWL6HJv3p
	IVS3na+PsALtR12mXQTZhe5WtAcw2NPfmzyKphVC+Zs3G9J0pZNDjEGt1UtpNGh+G86iifMRFJs
	NYqu5mYSxov4fHqrmOc5vBwQYEzS7jBdQ7kzJkc2bmeavQNN9NLi+H20quCZ37sK29S0sHoQ//W
	/tzmvsZsaOQIxJW1lymJ/K4XasaVA6DIB8Aq7EH+k4O6wmY0HMK9o415N/8hhKFTjdTfXxD4R/q
	y5Gxf2Icz8g/TnYhU8bkO90LbqCXqTsrKU/247KDtcQ+Jqdb3ga/9iAmbr+J5B/pFreeYaqzSle
	41scfeFQF43dgvnNR2ouGPnGOaIaE7hbkVAW+HyvJLsRkvay+PaZt3B8cttEq4HNQsAQ9Cqvtat
	fy/LofG6yt/fgpSWY37eYGJ7CRmi3oxtVvvCxk1DFLtS/kyNyoM3XTx9AEj1EEzewV/ZHtqcXxi
	zcjBCWpL01m26CYiZzrXXi2QY9pgPYRXJcByn65WwDAiwZHE0NM/oz3iE/OeliQizB1FClmqtX/
	wHsYiwybOPbx84tRjN0Q==
X-Received: by 2002:a05:6000:4704:b0:4a9:760f:183a with SMTP id ffacd0b85a97d-4abb400aef0mr2164738f8f.32.1795134366927;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 14/24] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Fri, 20 Nov 2026 00:25:24 +0000
Message-ID: <20261120002549.1908299-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v4->v5:
- No change

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
index 4b31a1d331e1..bccfadc1d5e6 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1240,15 +1240,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
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
2.56.1

