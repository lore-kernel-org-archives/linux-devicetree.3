Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816482;
	b=TL3rZ51WaHItPAugTUEVDBa0K9iUTgtRoLuS1v9NZJII77QQN46/WDVxGzWBSE+HbEm7
	 oiezrSPQJOms2Q3dHsKnYebfHX2WoJiWciYSAgDkRqU1fOYIz+DDMdEA15TTs7Pq/2B4i
	 fT1unjEEMfziAUZ9FBfFvDgPa00vJv0/Lyky1H3EjM9nwOD7hcZItxn77TGctImyQ6vUI
	 LtojIKuD8Etv3ONkFuSeHLNHFYKsuXbewhjGQoiA8DuRhulfPGDFl2IQXY5uaLqeBUgVx
	 X2d6tB5iRvrvjwYXrOhD2mxNp6NuVdYUMfOVdORDOTWEKx39jNbVF9iVqJ/+TU6T9uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
	b=clUCmjdzavgJGPpN5jHeWngFf1dgrRdIrQBvz78oArP2hAtTwBQlWDb1l+8erJzphoGf
	 EinIFiWV1rkncl25572qWJJtgVaKEQ72kS0Eqix6v5myhzEn56NYzEWYEWek1uUlyOzBa
	 uRseJpka976fNorz/BD50b+hhnsiAxMuMJKhq7+7zYriG0zWXCO9JhNevUkKxnJhanCrL
	 0ixWMCuLp5t9fNHsN3qxV3dG3Z4LQkynP0IvOB9LN1FLoNmQtCT/hRN0iQ+y/B8za8Jp4
	 0IeW4gFU+naTafA6KqTbPuAxmQYL6ATMdHElezOwGidCRaLn3d8IG2twlkC4Yn+FDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF396083616
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EF396083616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e0d885929so840332f8f.3
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816480; x=1794421280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=RwbPKIq7zMTbMLWlLYHeKDbhMe+TJSa8Op8YyT7vKpp+3wU4OAdCesEoDRWgVqkKXx
         ldR581ZfsIBClZ33PESVj6+InSbkRoRX0J9zRkxulpzh0xdJlkU2bOBt3NSmPaSLwQR5
         2ddmljiCAQ8rwDjfByTOiH5RxRdr8ghOzfIpJ0UqLWH9atfuAxT0InbkCDtbHTtHAO8e
         OfhQCRXS2m0W41ufCJvtIHRCZzBfffSgtsx9O/fgu6iCkSLBaiSGRo1709m9aLaTi5GN
         Ch8TET5QSaoltqkhw2ma1glWmm3uTQpmY5Z6xZNSM5q79TqtGAxAE0bsPdV4xDYJAvRp
         vvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816480; x=1794421280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=cRIvmbPvucw0b9nYfIGTJnsaQRSQMQ56UHhW0a7X4gv9mjSrIty1xFtDjNHNIWU1Ez
         jqRQxa9COmeRaamC5UB57ABbBkq7k1PPy/x0XTas2wMMAermKLt1GO7WQsLR6Q7deMw2
         i++sH3X0Y8sA9WtSsaRGQ4pk2fmGXSQJGbND4kY5ek4vD8kSnjl8SCFc0s/rbMmw1PG+
         DyLhNyRPrrP1FjJu5oJsYU5AFhOi9GnCKx8jSZi7uUrFMf32LCv3wPcKhhrf8OwsJK+j
         2ITPBulsQZ1vKVgafGp0UD5J2DNOL2evlTO/uPU3iVzWv+YfwotSh4lGJbY/KLpTvg7o
         vRpw==
X-Forwarded-Encrypted: i=1; AKwUvBx5gH6OG5XP8KupVuNY+KuRmR5mf7jaTs62U1KZuTzppgwvzZm3g54pMxFerR+4AdunqZgkQXPOghKt@vger.kernel.org
X-Gm-Message-State: APuU4Z/VUuyIFbciSRDFKxlDFgd/GZ8RSY2mAnywbvSLVqzMdyBWDUp6
	FH+1Pjse9AkbmRZ9FuB7aiXrPcyKfKcYsyntuIzk8LtcgUfdQRbhDsXY
X-Gm-Gg: AYBFou0K1c9MOY6/DwSbDTYVUz+55djB6NjYj/bXzR+cX4sJ4/3QlFpw1BsLsyDR6XS
	2hWiOIkzwHzLxSRc/xFJgPFz7N5Bpl3KQL5kUQC8McGDSSNex2vj8LV+jORJEv/S2o6HicgqMy5
	YMxcwvZQwHlG4Pf9ApK/+LVjjBLUtprXWrgw2goWjqQ29jf+Z3X1OHLTGDK9JLNDvOmRr4cQH31
	ulcAfiOuuYDhO6HfbJsog3VDeUrvtmjeVGc2txoP4q+S7pReS5skw/j85laHBxD5NCP2Yc1lgSW
	vmV679JK0XPD3aMvzd+nsC95V67e/Ges5PDvgmYgigUS1+rTxjnJ16qz2ra9zdB6fdTl2olJj9c
	WqcjuL6J07hUkNZcADn2B/DSprFfQxsxatJRO1y1P4vHgapQuaNwqwSBXRKysweRuDiV/RRc5Kr
	JzFK8q3afYRKwAEiohHBc/r6DYEeHu1eBVdqb2Mxjk2cRMmGynH91ZMf6+T0hym/RbBoajQ7X7s
	vdGrJiIMDrdoQrU8LxND7Blcw1uWJa9eKPtrJX5/eK+6R+i+/qMlcm7DcZmTvHK2O3RDqVcwfsl
	f0hsSqpf+5o6MrFT3tuPSoAkJlT6ndUW23MqYnjarQtefHG7C964o1KfljU5t2YxyOXxZtMwj8q
	yIpEXoUYg37+/6C5Y+ApcvkZm57qFGKXdtZlumA==
X-Received: by 2002:a5d:584d:0:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e6e50b5f4mr35431995f8f.45.1793816479972;
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
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
Subject: [PATCH net-next v4 08/14] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Wed,  4 Nov 2026 18:20:56 +0000
Message-ID: <20261104182105.1102555-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 9daa5d8245df..846216f22bc3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1212,6 +1212,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc(dev, sizeof(*a5psw), GFP_KERNEL);
@@ -1245,6 +1246,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.56.0

