Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD0E3438B7
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229996; cv=none; b=MBUBK0mGh0rxo5u7KMgJw7rmRTPh5paUvE2bS3KoBTGtxsq5bvu98zbkWXQOMnzQjKR5I4y9LdO8h7D/NULeFuCrD1HDbOCzPlI9aR45BjQsjEErsacW5ouwKM4l8zxzsCwHF3iEksavc7ucls6E6gv/ysIP3hYCCuydJokVlFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229996; c=relaxed/simple;
	bh=pT5fXYUM/Vg8EfvGNeN1D8rz2V2b+bxX2V18x1wlzJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NJBXiMWwvGFTYsoEKONCovh8UIFm0FSJSowJ1q+XtdaC147dlM+pDVNPECLwscYzBgE5n2u6NTjo2GmIMQYrD9njLP9znvdTj0HY92mU4jpLUdSiwHvmk5i/yaA/cqyxClIU/mxUsKObhJYN0jIu21lsDXeapFVTPC7xpEeXyMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzBx9D4B; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzBx9D4B"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso55340735e9.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229990; x=1779834790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=lzBx9D4B1VPuchGF6gpWopplbAdE76pui76OdaNBec5+8KT2lj1jZunmqZ7PlgEmWn
         sPWUTjPaqwF6nc0/3/FEpPeb+UN1pldn1SQ/5JKxD9kBpf6PFl+sGp88qorNyMeAZVKY
         nvMTCJXtlhwa5LEjhzrTNUHBZTcMAo+XYZMUgnrm0wOEzzH9177hiRbzTHyynDhsmwAK
         BeT3h3slV050bk/3rpGYvywHvtbHWzG4sM9NOLJAJQO9EoCbuBMjvOsHmHJGmaS7L7sY
         7s6Ddqx0o3h1TAuXY5ygrCoUcOsOgMQYpzigqOXrjSqJBCBI2IDd2URJqO1JBE01EI+A
         ltHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229990; x=1779834790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=epLNn7C+IcqRsLdUrNtu1ZSa3m+VF8n4BYIGGdsC+75I8AYsNFyNCczDwgMmDGuEV4
         IYH8XRukVyFDxNegEjdR4h6caeiBgpC+ycjbhoBXMU1mcTu4nBH0ais3MTleXbH0EnYk
         8T2q2muaWJztarwvrnk9uqjwLV8ND7hNdh6ZFZ7Mc2fZm5Tce3GXEyh3qqREFnBw1dJa
         cAH8BL5S1xstcrrhtdb79ab2nQv9lIrZwygJ9CYOdLbVrpTIUVFSBsTROIeJWav1nZSb
         XDE+edQ67YCbVpDHEqc+we/b1FUAzyRDyJ6SyWmDj1d2TfCUOJBg81Yip5D77i3d5ZjC
         mguw==
X-Forwarded-Encrypted: i=1; AFNElJ9Xj1ssWnIinw3XZ+py7gCYOdSqNH+tg2+mgLYkQMbguhXTKUKUFaHixAxFeNu9kiQFLNOHz5HrF/fF@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+hxMc53QZ+FnLqmdIixDdgHO24j3BC+Z5BpVslPktm2O9Ws/
	EPCr3obs6ZkuVGfQK5fy7f1veoIlul3wb51r/zDooZ+iahD/7oKgQr9F
X-Gm-Gg: Acq92OHfQ8UzA1lK1fjmREXAPIn4CsRHzM8ssZfQkvvhxrtqF/p/U6vgGcx4yJ1d7Af
	XqUuwn5BTLT3YhC8mVKJiyPNFJ3aue1AjzeBh5GGH3hTAoMsbl4D2pxe4P2GLjxF9Gf4qM9DJC5
	NoKjU4774z3Lp99nqlfXUtDyOddFqfe/vP+0XVaF/Y3M0ciPPnKRng+AsM5eKEQvlVMEcuxtVe2
	8ojEMUtlrrFPeMp31I866VYTlQX+qfBnl+vx8fQVEziv/BooFjruM71buUUONTQcPjXH3F7b/mV
	bxexQfWjp5P0PrR5ClXRmSfcZ2hF4gNxrPj6L6d4fPpXRYLfAt1L87WWKfAtLmp1lexAMwMF7eM
	YBjfXrZQ8siyHQeKe55g60oEArmPu95+3PqtsxlcGaXE31NjtuhBthACnyvnC4+NtAxu/+7zw0O
	tK61+fJMO1Tc7f7tvL/clxWdgMCRWux2JWpB0MAX1sHemWu2DzklPBnckkMiPdF0kLFvHWT+bLe
	M6BjKW6yg==
X-Received: by 2002:a05:600c:82c3:b0:490:778:4fe4 with SMTP id 5b1f17b1804b1-49007785080mr183034005e9.26.1779229990354;
        Tue, 19 May 2026 15:33:10 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Wed, 20 May 2026 00:32:44 +0200
Message-ID: <20260519223253.1093-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On resetting the i2c bus, clear any pending interrupt to have a more
consistent state on the next operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 700beb9e7b1a..d8fa29e7e0fa 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
 		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
+	/* Clear any pending interrupt */
+	iowrite32(1, i2c->base + REG_PINTEN_REG);
 }
 
 static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
-- 
2.53.0

