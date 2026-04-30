Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C8940B6E2
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 12:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553636; cv=none; b=hb6BdMbWfcPZHNnT7+3s6x7nyA4deKnl8tmXpTDd00aOaPoDx2Vo2qQZut+HG5MyRcs6Jjx0YW1CcUV8S5k4lRMyY5sAlgkD1JqqIXVI/WhfcqPJRBLbSjzaY2weKzJ2vqS08NKSAfqzu9Ja2PLMdP6WUArmzJlFoJvIu4ybhgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553636; c=relaxed/simple;
	bh=o+YKbv5RhiQDWHOpnX9lX6EIOyiqh7i1d9JeWFNCuUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uMq8TI7xE4OHFXZyasHtlL9x7LGkBv9J78G0t8TD66Qb1dkZFV/27tkphgf0p1Pg8exP6/ZyKiwEOToKyuK01ISQYmPOykWXwzPLFkV3RTyRO4+IbRRFCi+7NQKUs9xlzohMGfAaGD8vJPIB93vJeghx4AHua3W4f6pv16EFQHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JihXw1P4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JihXw1P4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so9006735e9.2
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553631; x=1778158431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toWudKeUla0DPrgjgDmSCDuuPcRrG9lCXZCKgvy84i4=;
        b=JihXw1P4l8himiktCAcWfxU6YzZD0zLX/ZHyZUjK2YJVqdBhMN/+uIDg/FUbjpcOn4
         lx6eG0wOVr7lFQP1mBl3cA6uYRHGYxV3Q/lxqQfA8R+/hnUe3if4iopi2ZzVswO9r3IG
         oxI9W8U6BmV3XZzmK41ntTK+DK2EsgUOlS9gPsCXFNhd8gQB1GJyH+gwVp5tVpxA+vmc
         Rrq2mgk6F1NwILCOMgamHFDoshfeQ2LxY1c2mRWsRVSlmgniaP+mCQxJJjVr+MkZf4pN
         aGYF3kVRZvI1y4f9+PlU7kq4lqhqm94hLR2tpZJRiHWDUGhFGIkprbxcXH/NGKjyg1Zy
         Z+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553631; x=1778158431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=toWudKeUla0DPrgjgDmSCDuuPcRrG9lCXZCKgvy84i4=;
        b=AP16q1td1Ki6mP0te9RyooQ6I9JnV6e5T+iNm0FIfUWeIbEDbvzRLKhNNfsMtsxFOE
         go0nL4VIO4pbMnsHjQ5RwhpCvi2GolkBuWn7uLINXbvw9cUo0OAxAmX98lK2v1oAtevZ
         +iUuhzDOjQf9i8K7hE1F9EAEAV2pfYm96yfWgwjGUtljKFx8f2Axn8kiImjnntspR3qs
         fSyT7gBBP1YrxISJ31k3pWlU5O0mnWl1NPGcKYHg/a6QddadHZeAQlVqI1k9QADQ2eFL
         KxqS7VSaHJIjKNnbYeVvAdKp9LcHhyAkSeFptdSYRuU+/zs57a486OTykFegD95qvDHQ
         Mu3A==
X-Forwarded-Encrypted: i=1; AFNElJ9vxOVtwra/bTJ9QOyKHgLZomNQmF/51CvY+JxKnOuUh2MWEu5Kcu8rt4wQmZqSUPU2CXj6OZBD5HT3@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmIeE5gaM8wXaLRY0YKPQOYUpdYvYBzrzo1lJfYq4rrxcfE+t
	eXDs/tT+qCGqHZJ9cn3mUD9DWIpSDWa6NguLn+TLbYc+3m8IAyFsoz+m
X-Gm-Gg: AeBDietqk7ddPgLjychrgY+4Z2BgjEyQubN+6nSOxNcutQOnr6Dybocn/SJm2+4HSQG
	N5Hugfpj+RoBb9kF0VvfzEOAPqP5gJJe8tNjT8XGcVvxKY+PtOACeeb8nBAz/1eIZctG/zgRt1Z
	0fsdEJHnVgSu18g5f0vvJ3bEwaXNyLu8/TTZT2DhiA++fRgRQdndcP73wI9YCaePHTEIh8eQEtH
	HtjhUgZIoMJ8+Enq60f66YewQ4UT/SHzZc21U6o7pW3rZVaHg9ofKoqFBFWVyJk0fcQjRJlkz2P
	9VAazlPnBdDVjd1apDjcn3fWGTSxBlc61x38Pqi0F/f0wMpqu/uzOuQm/7XkrjXEuDDJdt666f9
	dnYq0+2h/zHNplMB9xI6et8MvbwTZ9ZrHyMGGXBN4xgS2Bd+sghcD6crejxTlkOzgcGg32FhBSD
	nANc3KL291fNO75OT36rco6GzANp7/Owj52k+aSP0=
X-Received: by 2002:a05:600c:3e87:b0:489:1ff1:74d3 with SMTP id 5b1f17b1804b1-48a844707fcmr50058475e9.20.1777553631360;
        Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 4/6] arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
Date: Thu, 30 Apr 2026 13:53:08 +0100
Message-ID: <20260430125342.439755-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device node for SCIF0 pincontrol.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Renamed SCIF_{RXD,TXD} -> SCIF0_{RXD,TXD} pins.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 86db86335d5e..acead2b1c842 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -35,3 +35,15 @@ &keys {
 	/delete-node/ key-2;
 	/delete-node/ key-3;
 };
+
+&pinctrl {
+	scif0_pins: scif0 {
+		pins = "SCIF0_TXD", "SCIF0_RXD";
+		power-source = <1800>;
+	};
+};
+
+&scif0 {
+	pinctrl-0 = <&scif0_pins>;
+	pinctrl-names = "default";
+};
-- 
2.43.0

