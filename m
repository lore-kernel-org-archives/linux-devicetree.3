Received: from mail-wr2-f37.google.com (mail-wr2-f37.google.com [74.125.225.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AD5218A3
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869418; cv=none; b=KIk+AuShCwD7Sfd7YUz2/oCMApL0B0vNt1xnCnXNxUzMquzCGIWLqTffDl7kbmY7ENyoGfTgGRqY7RUmq2ZB5cAbFsamb9yXiGAeQ3ntX6oFDNrijIOqMorSIt00nF6leX0CIO/orwrE8aJjZs/3Te7sA7U7ESW+Ijr6J3vFioA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869418; c=relaxed/simple;
	bh=OQJZv9acOTk42vjwuLnraI5dhRhpupiz0zjKA4s/M3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2Jz4Wwvy50H5+OtZI01GSzity2yGgLMr3CqXEPGWQem30kmWMugEWxNTwUNgaJsgWZlDhFvLH8dUjGS0J9j10Ct5mvzUcDkOF7wVJmYeDztvKCrnXM2E60vnn5PDksytXY5En5QeAJ1Ygh30XeVoi8U92JtYbn3HZ3s+g/AUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhMGZUTL; arc=none smtp.client-ip=74.125.225.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhMGZUTL"
Received: by mail-wr2-f37.google.com with SMTP id ffacd0b85a97d-4887840c529so2323193f8f.1
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869414; x=1791474214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSWSFoiqnHbSZUG5Pf7Vf3OD9TAVESMC/aG0LA9oLno=;
        b=bhMGZUTLxJm9W3h9q+gFQe8whvaARZ7e0ZqmudarlrWHOok7vfQE1SzFYKCANCSry+
         GyTzIY6jhuYjjlL8KkoTQfgIpjd1+tp5r85XYpdU3rvavhWIDj8Ym5W1l2pBk5vJnEBr
         XcrPsMFF7DLcw2O+O1oCSYP6dBNowfHEMzLB06XvoBM0L7ZSABEtwzvbgwXG2irhbYEs
         Jv4h9BZlkQa6vmkE25fGug218r6qZqULHdfHiKlqo0iZZQmxQDYkF6L1Tej3y1IKoCI4
         lQpHyETrJxqXVM86iiNGUn0TuQcr81JkaL20BvA1dEOgJi0Sz+Q4D1HM581g/eXn/twX
         epnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869414; x=1791474214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSWSFoiqnHbSZUG5Pf7Vf3OD9TAVESMC/aG0LA9oLno=;
        b=WZjZMjhGBuYUI04JK7diDBhmgomr3zp1gLukxKq8hZ51R30wbclIk6U2g7/MqSME0t
         nQFiBXTMBRewwh76x6o9LFybl/cEM96H0/R/CYi0lscns0kFgtgbzlBewHb94iy9z4Fz
         3+PNSEDrNJtD/AIxK2Md3Y4y2HXPM/NIChaw5cR03Ewep+wjHrdSsfQqiyREVYNAZChZ
         RjlHjnD6vZrMX7HsAIOE33icS5nM5/n2viCur+ukj/LmIvKU/qaBlceNM5rhB8JyhaSk
         YUaPWBGz+vSutCRYVXR46whONX1lOUZ+kEL32fOvWwW0y9P8fDWo2YhfgZYzMi5lc8Pc
         0deA==
X-Forwarded-Encrypted: i=1; AKwUvBxW7Q68wh0Mv0Z57kz1MBPiVzQbtPaH7hLs4ZssgRM4Wkx9bLTvwBU2y4lYVT9E934sp1IUqGirGqzh@vger.kernel.org
X-Gm-Message-State: AFuF++k+rEp8R1WToQqXrqTFVGseqV9lA+c1xkK5q0cx43zIor1I/XOc
	2DQqqVQYplgDulOWG5EqKLHwGdXPrwbzAbZkGQd0qMLbLie2Xul694b8
X-Gm-Gg: AYBFou1OsMWLV73MjeVcpyq1hgOZ/VAAuU4Z8Uzmsj6j2OXHmeIOEQD5wTobWKUATzF
	E9X2dJvnLGJwN4IfiAOlP11+QVQGFNqt9B8w2NE/QEv1Clezb12d5tyfnKE1Cpi8DC+YMKdVL2E
	3yFp4gNey2qeSpEgrBSVefZdHU+3xAjWwjBoIBqCMaU427t5tdQ6b3uMJb9jsJ+MRiMabN6XqLG
	7WSmi4HgTy4bDNx+ElGz2qALpuMyFlQ5RLIAjoLjyuhyOwbJ66SU/q4Kea3l1JHjvOJolg1EY9h
	8fI4BY+qVV3sK5AA+qkeHUyKtUoATvcflRK2f3/NAKwz5udTOpqkK9lclgeU6kX2TZexb1pfRdn
	SwO1ofdH5ybUsm/ZYk5BJprIdm8wUL4LrVxUzCBnX5/OzpYvgeRZzeDkghL1kECNu+FrXym2WsT
	+Rk5iYfQhhxcCN/6hqKqwwq4L+dP3Nu0enzIaSTNpMjz62lHr5WEEvFGpWBE2dVb3MUQr9By3a0
	2jDFyT4aJ6pjY2ApfjArSvBu2E208n2+1nSzbyn9J33O8pUClcYHd+Cf3EEHuWwBCWMqzdZmkCF
	vS84t/rprkmCRdIraL1zPft5N4DbNA==
X-Received: by 2002:a05:600c:1e24:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a0275507d7mr448335e9.11.1790869414072;
        Thu, 01 Oct 2026 08:43:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH net-next v2 01/12] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Thu,  1 Oct 2026 16:43:14 +0100
Message-ID: <20261001154326.754314-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- Added RB tag
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 734910156dc3..aab0ec143c77 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.55.0

