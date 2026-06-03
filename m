Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170247AF61
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488014; cv=none; b=D0f32aDVoL3uKR/gYjd6jtjSZq2F0KTcH4gyXgeYLXEkjJJO2e+5IiYavPemHAMDJ5K18BarmqrLvm2zXzuW6vbnlMHYZBGZS2lSs7Wuy67aVLpnq1TXcwse8V0nqVuEhH0LrHL1mzS0PWH9GsScV30s++D7bphxJIqePZK2Pbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488014; c=relaxed/simple;
	bh=djxdJcvP+/gC7ugPG5aJz7mdTmGLHMqvFmMSqp0LYi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fObYjco554NiMVpzkTbVHUPHDuBOetN0MAKNJm9bu4nqOxBQae18u8D7zxIUICqHjoZUZA6yDV4m9E/xQ4fe6DuAtpb5yETqDT5IgtADa9dcha2vwb7YBwvoKe0nwzohxjjEFQXOxSd3/U9KlUxx8kdoz0WyBnZcwQyqGxCQitA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za1mQ/Rw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za1mQ/Rw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so115567935e9.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488011; x=1781092811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=Za1mQ/RwrfnNYX5PyPBAm8Ydt5K8k4tV2ii1c6lSVqxkfeQRDyy8GjNYd11LMQf4dy
         0qRGw4K9XHmTbtJkSp+swG/2fyjPwEasDFSzwwVAlAC5aY2/dVHUbrIZArMkh/tAuuMP
         L29MUccynbZLBwAAkP9b6/iVayAZSkaRzd04w5pJ7+hHv9CAiILBYgzbMua2XVeS5G8S
         84yK33RK93iShqzEskgvdk7Yv0C8V1H6MTkdoO1lMrWuhAJhT3Ms+79IgcoNjtOZbImg
         Z2DhoYuWx2yKi8nL18qM53cWW4AiVxftoXayatORRwyMd46lkDK7se8qDhu8n7/SQJn2
         /QPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488011; x=1781092811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=G+jQW5LV1Xlfn81qGz5++gREXM5GL21j+R6YGxhgx8s5m8rRyibCsrebF+KDcjlxUS
         u9+ybyec0ooI9F6AGrb7104rsb6tWVCpLE7eh8gEICsqo+qyHj4Td4v19mFcEmwobdLY
         X4G7rxJGfORsH+UYGYOpnetiUc85GwKnoyLDmLHgw+ZOCO5OrDCQJWR3oBgZ44UKl97q
         IBVWvFhCIBbd40C4hvkSYKWVvBOCpivaJZVCtzZHZlkUgDPZkMgplzyBdNxIW1vVGSnJ
         JZD/c2DlyfzAYMYc/QafQuXNc9ZyBH4s14YCr/+FMunB3J6LuO/0ILwxF8YijHombqG1
         YE2g==
X-Forwarded-Encrypted: i=1; AFNElJ/hTcPGYmFWEAnOPWG8mx6uo/nw5RBPXX0VycwzeSmYK6t1wUNVfY8Fy0UcXw8MV87poLC0TljRcLd4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/BNck+XpzO5iK2nWfgrT5CbPWSsSOGLDXufYyYRZdzD5ceU5
	lz8nsap3QY2qzvh5y2nqhcjQbem0Q/PcpuQKCAQdXXvLI99CnN3JVAIF
X-Gm-Gg: Acq92OFLnwlqIK9HbZtoyiJpc2JlecHBo5q0Q72zS741D7SSSk0Ac2Jyc9SE7agAO/I
	Lx5BGxdjErxaOYbXnXmzO0txAQWgSGhmO0zlFdyhsN6yyvugvLm6pCKgLRMxGzrpzUwl71982ZD
	RIUXT1wa7Y7fNEw59efgKdcM6Ru+LGsRnIs46N1uB/kDAjibyEqKP5wD42B+hRdsX5SrwnfYma6
	eGquDfzj7FjuiC6EjSjgzD3umdSA1gAArj4gaTDDrhwlmvRp02JWhYPSv/38sZbTvykwP4jLGvD
	HETOReWClvOduZi7jtdcutkuIZrHBNHunp+DP3iEl7nYg0LDYXWBOMuipvFXmx3P/bt+CqQzFUF
	e7PnJ21PU4eXO2VgQNy9n/1EV8FtV8g1mOMQIPv4G+DIw2WVZdH+nw7bcpzKx/96fG6hW9TZwM4
	pvcQG3YTyeFWHP0Ax80stj1U8N6tyRnQJ+1Qccogw27jPxnsIpIFNwHA0jltryBtPHf4N0xq+iY
	l3FyTtTNEZRK5ipl0oE1cVQwGuyBz3Ih1vu3WakYktl
X-Received: by 2002:a05:600c:4fcb:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490b60ff366mr49248825e9.31.1780488010942;
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 13:55:48 +0200
Message-ID: <642c165fa5ce0951352d7d164ae7d871120e8631.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index df4409af26a2..d796c32f50cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -191,6 +191,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

