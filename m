Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39769329E44
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882411; cv=none; b=DBDcHif9Ptrz1NRxU9whW50Z2atRzQMEKAq11XT+w7eT1+bH+jQ5EXO6dC5bXmNl/c8VvjBjjq9oQ37pTVEsdqqMPcdHLalznyDnsYsJuWRwowekWp4zeIdjr0NEzyjX3/NOuSaazjHxlzbdRSRSurYSNvCI3NwFtYvh2iVPzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882411; c=relaxed/simple;
	bh=eH5K8GEWgvptG2lxlpL4JGS0/Iy1koeuMOcWtEkhJlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijOHpJA8KYrOXjw+2wkmr4QCZI09MDzvQ5D0VVYTPsdBV/+BR9irE1XsZnYqDzsifsBoZfHWkSeWYqBcotYkIbevBTCMsgsrGXqgacKD1YBcyIxcbdTDPw8mYgda46VZ6MbmWxoti8s1eHeS1yqTVqryxmfPyvEBdpG8Z0gElpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMx2l5aR; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMx2l5aR"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35c1d101355so1921254a91.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774882409; x=1775487209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=NMx2l5aRVGF8xo9ycmJpEE0P2ZbgwlbRvoHg9INplTa2QGv5SrGfw0tM/Ajjor/v8f
         XaYZtRt8H/KW7EEx7Maf3Rg+A5KCAWAb2WRYBKXnHXI7lv4GmWrxWHxIq2PNEGLYIFIR
         jwikIGqWp2vY5ItuYKrcaBLEScwHrE5ssl5o5w+nkJad3+b8kE3S1YN7+0mg3FLPxsz2
         J68KmbcQJawNUv1MZvJneKeYXf2eLFKzGZ314mzOmczwD2PPPX/JbZVNGP2afXCjWJyk
         VRDWCUv4djpP8TbhZzXU3QukLq7aR74e5HmXkL8QUK/Nv21KbO7ewLXXhtOPeud4OYwx
         24fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882409; x=1775487209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssYsLAnIx4oMr5cUDaN18URFoLsJRRuDZGGo0ofMqHI=;
        b=kViMTsuTpq7Nx3daA6voQoHwGICxW6DatTx7+N3+TtEANG9VeAChmdGN208pWK6wXT
         gGDrv2hITiBTGgxvLBp7+5heACjZDYW6CyFqab5BmXnDSfp/KsX3POActheuVr+Wx/EY
         mHTNhYxlJGMpn9KmWqK097WkvfCiGAL4NaLGIx4EBL4bgb7JH4aL9qHvW4fE3npG0xRO
         IlazzrMJeZz2mbMEaDg2A1Po3G3nkoy183ipfBHNrf7b+V3eOeEVAkyQbIFhMafGvw5f
         yQigVY4lQV0dQulCfsxH0k1e2JEsMJ9SVKBU10KumJUlhZtsFa+RTKqdS8HZoPDDaNCQ
         Cb0g==
X-Forwarded-Encrypted: i=1; AJvYcCUi/B7oxQCFifBO17kQ2f/IqP6RBgbfUEcribr8qf4RIMn4HIT8lQvDhLxrp/2iONjXPi9Duz5l3Y2l@vger.kernel.org
X-Gm-Message-State: AOJu0YxRgIrvQFmY52GwULkZOy8lMsv7cfbF+nsweCmBNXGfWcsaZ/De
	uI7PtRn+2MW1u15iaW3Y3DJgIhuLCDqBoiJvXiv0xjRRJsvnDYaMJz92
X-Gm-Gg: ATEYQzwBIbKhSAD144tGDnqJCc3Awcqwc0q52ykFJZYeobxSQB9me/kYjyTj4q/n9eP
	m6YsA1NvpRWrZ9xvLgNyWCtpfaSwZqZrBiGHVAtA2ejy9V9IAqAWYddZrv2NE4Wi4AnFzGDOzzh
	ToKr6jvb+EyRO2FlTGshIOBLzaa6ki4SdNuMkBNKJLQLA7I0qn3fqJw7w6bhMekWtuQu66gdq28
	np1zrWCsaqQDPDibtVSaKZpr4Ni9ss4bAhs4q63pIZZxaTEWXdUMcNCUXeYp0ULubMBqrmnYTqO
	Wx+2+vkFychIB6QPTQ8LqII8atSdVovSt0ZSjHCkYWZjgUwN4Vr5pfaN8RmU3KFlPPBSoHnnm+9
	Dwk8hS0L8l8IcrFv4MwuKHdxVVFmefbRBQ4a8J6TCIYdLFK6wynACrj+D1uap7sNiP4g3dfzAK7
	RQ/jDZCw4QTpe2k+M4y1jCNHvKeWDgypB/SQZL9RlAu9XrsH6kUjJ3c0cLQQWJaq3E/tDKbgPKC
	J6QBnu8AE8TRQzcWAs=
X-Received: by 2002:a17:90b:4cc6:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35c3011512cmr10970363a91.28.1774882409439;
        Mon, 30 Mar 2026 07:53:29 -0700 (PDT)
Received: from arch.localdomain (n058152025253.netvigator.com. [58.152.25.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c92dsm13218247a91.9.2026.03.30.07.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:53:28 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH] arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
Date: Mon, 30 Mar 2026 22:51:11 +0800
Message-ID: <20260330145111.115318-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the interrupt number assigned to the Realtek PHY in the p230

following the same logic as commit 3106507e1004 ("ARM64: dts: meson-gxm:
fix q200 interrupt number"),as reported in [PATCH 0/2] Ethernet PHY
interrupt improvements [1].

[1] https://lore.kernel.org/all/20171202214037.17017-1-martin.blumenstingl@googlemail.com/

Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index 7dffeb5931c9..701de57ff0f3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -84,7 +84,8 @@ external_phy: ethernet-phy@0 {
 		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
 
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 		eee-broken-1000t;
 	};
 };
-- 
2.53.0

