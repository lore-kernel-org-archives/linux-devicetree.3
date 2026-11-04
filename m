Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816473;
	b=b79eNNHi412Or/r7xjNaCghA7Ru7RjspUhYRgd4YeaJ1y3JKy+2cei8395yJDmmZWPFE
	 P7WmJSXf6PwYJoeV+QUEmc3T2sibao7/xVXkCAXqoSy16DC5jAb+98rT3pM3FwWewui9w
	 T8/qoKNB53oGo1v/zDwzq2M86djKdQyzYoLFswD19wpt78nIeCYbpnxgjqghFhrY8M9fJ
	 0/4cIAOSTCbPTVMDt5dXfKNaTiCF1CVtOckqZ910RQ6W8vVFlmZwMkoTP42+cu3p03BV4
	 xKFIS2/7H+fbA0qhyCM+cAlJN1GHKNDZlTW2MjLl2ksbYb6arM7HqDhHsOmgF5uvluw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cFj2Vg73sWN64Aw19X/jflqAwIWYnVVn9Sm4ZEKSS6U=;
	b=myyP/3v8gUdcn4DvS6m8izzVKqBLKXxEFeQibIyXjNZtNWiauEreGUnaWjGCzLEZQWGa
	 I74B6e0TnCUGjp0e7l7kzYN0xjeK4sRt/p5fImb8GBNcuia6v4SAd1VE2ITjatyXLUD3d
	 y53i2RXdn5j8qzD/JcKOSD5RfRkrg2+f8BGZ5sCbbFfuC2Vln+fAAIziIDt3vjnN+B6tr
	 ju6zizCdf0z9i5yTmVt5O2NqazImmsxwX7zVIc/Jqg4avtYPxxcfb3hphQHGSXu4USVvs
	 Y/QDo8pGyoKrBk6vwv0Bv0yQJhfQ8EDSp1LubwN7tYEjMFwkM0IXmwlnAjneC4hU98A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evK3EuzW;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A60606D83F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:21:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29A60606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=evK3EuzW
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e47347279so630033f8f.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 10:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816471; x=1794421271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFj2Vg73sWN64Aw19X/jflqAwIWYnVVn9Sm4ZEKSS6U=;
        b=evK3EuzWrZco9A3pe+vzfj7Nnh5aKYLSVJSb6SVHGnDJqWvHFZUSvI/sN11GN7hWCq
         whUHw70sm2cNf1MyAnBJ7+rN7Wntz6rHthAXkKroJZ4KWYV4cWNW6mkN123FFox4WjDj
         o6UdUpa2z+Qiii5IJJebalnJjh7BUuOHtLzvz22dY6zXfvP+yLkaCW1BuKKHkomkjVY7
         LS+GIljoPQnDnw6puczRo1iULWB1IMW2336IZqDKV0UwmodqBkcJ4UhhZ0k7NH8xwtJF
         ag/OugW8XD1yeDdRKcWEqqt7i5d/DoLKLR2tbqwIu6n+pupugkIAdt6GkuVuUbLVOQsJ
         LQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816471; x=1794421271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFj2Vg73sWN64Aw19X/jflqAwIWYnVVn9Sm4ZEKSS6U=;
        b=ZU6E86KcPTrw4m0m2bEsowC0DuSG4IyzDFpJPt8rZk68maF65y/rfcUitCl4ScIUQq
         mNgBx1DDDpfAepCN+frqjymbqX+N8yFVmDK6HooufcYaTxGyMqtAPAY3QcdnR1SGiFOv
         k/Hp6RpoljuC08FwzU+FRJgj4+7yhEW94zcMfBiUNrGAie2+vJtnXijdU2iboQZo7ffl
         UjJxU62qb2SRC5UW+TLrutDTGT/a5eEF4RuYK9kVug5RJtVa4cSpmauSO7EVj5/oYKwh
         oPviy4LIOr+q0G5/jah6MtNotaNacrzwKxH57lfjjPNchQi04GDYsvr8MAIjeo1eQU03
         GEvw==
X-Forwarded-Encrypted: i=1; AKwUvBwOG0e40KKbl08vWctFrHokwGlGC9z15EOvlkBg33ftnRZTdeJPNdw3m2cjhD/gtr6XlxLX1+dCKexy@vger.kernel.org
X-Gm-Message-State: APuU4Z8WoYA6C2+J1Jv2eC92stQK0BMwFmOKFzrXLm2j0uqXkh9ga3zD
	T1EwCtLpa27AgkcGjxOVGVxdNilfo42jtlmsjb1Z7Ko1v3ir2gJPtSPg
X-Gm-Gg: AYBFou1hPhl2ZXKojq2lpW7EyosVKbV0Ch6GQQJ8kLix1FQAxu6f0cES14+gCmjba9o
	wrVpA7LNOfQsRZVHkfJpPplpysi07+J1b2SGocSEqGIpobuL37PSe6UD56B/unQs033U48WRlGp
	ys4cONgHySy7350mHCtZHRi0b7vcnvWWu0j5FD97FWi4GMRRcY8rVvFiJH6bNIqTZhlnsK2+tlw
	UwPZpPvkv5FPHcPJJaXccNBntCXjanO9N327LA1wBWmeik6giVa68Urp/lx3nilqXjIZ25LYbPg
	xUGigrWydo/53nAAjAxJ1/lj7EpSEZlx/el8CBmPd17iZoJZmy0leaI8MVJXDlqP8UffgysC9K8
	7h/nYR10tfZE8E10lE9J1kv2Ypx/oovU6pUknYAu7Msh9qu4VFGQqTCctTepB5qSn1ynq0IFHlG
	5gsHd4tWQDLNl6XTlmeW0ljfSK/Qd/7rNCxXws2i8UToitVyJ0hgERJTMk/Zbf8KApV7dzsViz/
	vI1Zm7EjqFe3c+AP6AV1Y0nfuM+tuEsC4J/aVLVH1uwgWPxzUT0IpDupMI93MPzu2jUJFNhe9xJ
	lRXgyQ1zGnKW1Hom2SX8qKJ+AbouqTUnnt+vRz/B9jPNGaTqyxhU5KpR1+ybmgOogJ3E4mBGAQq
	+aayZDpF6XqWAy86cowjDwVAUN+X8aB2GaOmz9A==
X-Received: by 2002:a05:6000:2404:b0:48c:7386:af18 with SMTP id ffacd0b85a97d-48e6e2c1e2amr36364110f8f.8.1793816471273;
        Wed, 04 Nov 2026 10:21:11 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:10 -0800 (PST)
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
Subject: [PATCH net-next v4 00/14] Add ETHSW support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Wed,  4 Nov 2026 18:20:48 +0000
Message-ID: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

Hi all,

The RZ/T2H and RZ/N2H SoCs integrate an Ethernet switch derived from the
RZ/N1 A5PSW, but with a different port topology, additional clock and
reset resources, and different tag control-data semantics.

This series extends the existing A5PSW DSA driver to support the ETHSW
variant while preserving RZ/N1 behavior. It adds a distinct DSA tag
protocol for ETHSW, selects switch topology and tag protocol through
SoC match data, handles the ETHSW clock and reset resources, and applies
a management-port frame-length workaround for an ETHSW hardware issue.
The binding and Kconfig entries are updated to describe and enable the
new variants.

v3->v4:
- Added new patch to DT binding to restrict to use only ethernet ports
- Added restriction to validate the reg property in ethernet ports
- Restricted the reg property for ethernet-ports to maximum 3 for RZ/T2H
- Added RB tag from Rob for the DT binding changes
- Added return value check for of_device_get_match_data()

v2->v3:
- Added new patch to restrict ports beyond port@4
- Added a restriction to disallow port@4 on T2H SoC
- Updated commit message for patch #5
- Fixed typo in commit message: swicth -> switch
- Marked of_data as const pointer to avoid build warning

v1->v2:
- Added RB tag
- Fixed review comments from Vladimir.
- Added info about the IP issue and the workaround

v3: https://lore.kernel.org/all/20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v2: https://lore.kernel.org/all/20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (14):
  net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
  net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
  net: dsa: Kconfig: Expand config description to cover RZ/T2H and
    RZ/N2H ETHSW
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond
    port@4
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW
    support
  net: dsa: rzn1-a5psw: Add support for optional reset control
  net: dsa: rzn1-a5psw: Add support for optional timestamp clock
  net: dsa: rzn1-a5psw: Make use dev_err_probe()
  net: dsa: rzn1-a5psw: Get switch info via OF data
  net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible
    string
  net: dsa: rzn1-a5psw: Add fixed frame length workaround for management
    port
  net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
  net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs

 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 175 +++++++++++++++---
 drivers/net/dsa/Kconfig                       |   9 +-
 drivers/net/dsa/rzn1_a5psw.c                  |  83 +++++++--
 drivers/net/dsa/rzn1_a5psw.h                  |  25 ++-
 include/net/dsa.h                             |   2 +
 include/uapi/linux/if_ether.h                 |   2 +-
 net/dsa/Kconfig                               |   9 +-
 net/dsa/tag_rzn1_a5psw.c                      |  22 ++-
 8 files changed, 275 insertions(+), 52 deletions(-)

-- 
2.56.0

