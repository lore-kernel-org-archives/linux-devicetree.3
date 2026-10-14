Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AB3513564
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983960; cv=none; b=rGxb8vYI7KgAnhjHBv5kwWMMTuFxG83uVMCUXm7pXMxQwWNUnIPm4itJzeD81TzSiuMGFll7f9Fxd9KK7hAtNaiFeTHAOldXRm6YfQqIyDKRX7yxDrl0VexT6lB+pG9n9vwTefe+3+TGQlCEG/W71tym7iyaE8LVGoXQmqs27LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983960; c=relaxed/simple;
	bh=qMGXNSAKzsDgcf8fE1COVZGgvHt5noxybOaamqSTc08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLplhFApgqyHMF7EkbdS/H+oE7BR6KT8JX+slsDGaYVh2gj7fRkIbt+EqcGMGx+p5FAFDcI6kjv1wSVONae/6jBNHecXApWDAmhLdwDG6PQVPTaoExf8CulB55eYKPwCspP0CmCsWMyH0NJ3sAuA1p/S+BGjWGjFyLTFGEtLYwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MA86jbrz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MA86jbrz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so34873585e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983955; x=1792588755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6U762p0PfygqEH/sFLQgmyGptbsm+KJw4MU76sSNXBA=;
        b=MA86jbrzaZpYtwW7ipLMGTMjAj1GnLQVAJ+bCC5G/3G2QKopLaZzxxKpKXvIQ897v2
         nG+weidOCZvZuR9VdCkROPCNLoRbqPmoptTQzb+kFJLBJ3X5Yopw1+rsMdr63ioLNJlB
         jPZtnH5xGDlPIMTrxMhc8W0hTdpracsZxU2+XMTLgDu5m1BGBwBc/qCL0RnkclSf0W7x
         ywAhfq96z3+Clq4pc7FKOaD1fcjnMAUOMS4KL2mzL/1gZv6fFwTEOn2S61zpyi98v1F5
         AjMePt2tcc9rNcXQEt+Xdj7PQVmqhYwEDrVKz6PMZngSUfIEuJp9V7k6uXl20rrS0OYd
         jeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983955; x=1792588755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6U762p0PfygqEH/sFLQgmyGptbsm+KJw4MU76sSNXBA=;
        b=n82U9I0f3erbf2R7wOSHw/LUcju6Z3oSYIJkmeG5wEBIoaH8NXXgX3cjmWfjFWbFeW
         xfJd6ASa29E1wkw/bWllLYtFCFaInKO5Tgm5yb21x84eDT8xLtQjiVvUpbJSDwGCzZhH
         IR9hDsXDPvnoSO9R8trJqLlht+yN7DJBZLx4AzVecVBaDoNKold4M+c3YtR0jyZKnY1I
         UzarUuXCwCo5K5Bq3U6CWXe5gGGCN5J7QQrvAKD7ByjMLmlIxmy3/O74HU2xyVYVJgVk
         UHy9DiQnF8ldI++q16bgIbiSLvKeZloe4WR45p8cFXYuMH3TUboA+0T2g/yUGup4DZQs
         jKqA==
X-Forwarded-Encrypted: i=1; AKwUvBxlv3HAkdt8cAS8bofkZ9ju/V0dj5vjrotlOU/88iOG4odUTUBrrLAy4OJve791Tl0bcnCj4J/Ue8Ey@vger.kernel.org
X-Gm-Message-State: AFq9FYLUQhMlmw9J52hWfH8sWkm09Oo3rr1g1qSN2X51Dc65YawrN4uI
	uZ5/3uwm4pqqB7Ms8Kh6B+Vubx2Tnjd/bExrp9NqTJkEPA6Fr1X07M7P
X-Gm-Gg: AYBFou1wmMg/hmB8fk6IaKpi9tP3u53DdS3JYlKakrXaUyMmI7DST1F2e+E9yQrCkj5
	76G5NTz75czEv2gBFV+9XBqhMs/LwVYAJgES25KZDLoSVidwrnh6xnrbd6sCm+2rTCKP98M1xqj
	I60RtBuPAYHqKpZvKGtuKoQkC7AuRPGPm0tDWPQRmaYj0hvVwUsBypnjDThrGcPY3BrVW8oYRQh
	Emo7cCM38NnYmu9GCTIBbAC8nlBZ103/tRgXo2w6KHBm2iTwEaAXIDv8JCKHcaEMKUyrX7bM7qT
	mbdqrwnA08LTMazKndzpxq4zR9yJPH3AlnujlIsEQ6Nzcwkre0B+OQIbJILh+gNpPp0gnwuarNE
	LZNvdDUJwU91b3FuTN9Y6tGFb7kB8MjbAdv0UAA2aI4B/PTCjtnrbROza0I+nspbyLbGrij0+zo
	iwiOk2hRIsJpKXCaYmB6YWPtOApdf+BstymAuD15fzWQZej3nid55jNi85zBXgT4ALaet0LJ1m2
	bCWuUljZtrPIOUzecc8wdcQYgua3hU9Q2YvDBy0CGUrXd3g64zvFsTqDAYz4PXpM5BGLSXg/f1U
	X7b0I3OL+pu7E99i4g==
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr328506535e9.16.1791983954535;
        Wed, 14 Oct 2026 06:19:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:14 -0700 (PDT)
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
Subject: [PATCH net-next v3 03/13] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Wed, 14 Oct 2026 14:18:51 +0100
Message-ID: <20261014131906.990077-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- Updated description for Kconfig entry to cover RZ/T2H and RZ/N2H ETHSW
---
 net/dsa/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 4f44bf3ede23..88e181ad4cc3 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -188,11 +188,12 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW"
 	help
-	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Say Y or M if you want to enable frame tagging support for embedded
+	  switches found on Renesas RZ/N1 (A5PSW) and RZ/T2H, RZ/N2H (ETHSW)
+	  SoCs. These switches use an 8-byte tag located after the destination
+	  MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.55.0

