Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134357;
	b=GNBFh+SFKqZNulql5GqXjnnnZocCGfjZLFD6vW01Q0hYoGdW3VnJ5gHAyp99bfg6Pl/z
	 8tOJZXqh4YLISsIiyWZYurU7XT4RzS5C/aIvkuGUC3hpYAcclZuSpn2E9xZV1cNrxOQDB
	 DFPVcpMp221jVqQeiUj938bFUNDXebgOu9WHJpjzxLPfphI/xaLaRhl1CRUHZBz7cP+LX
	 ei5aNSGpXZyKs+uemq2ExqtVs4is6DkxLEnKtvThxlz81Y12RI8U8auVR4oc/ILKcKDJb
	 wb/IrrjYM+9G3+6vXow6T5YD1MNTMHP3VNSQ8oBp8rwo4BI1z6ap5S7irWLHb/QRa8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eLfTQ6Mg1TFdfNQYVBbUMUoZme7jwnHY9yObwURtVuw=;
	b=Hp3xZBsCaPFk+RBQshEk1tpxV0tipbwoI7/4oR7GdfQ5+nB+naNbnT+IDA0H0yKj8VmK
	 ncn0HhlIekw4tZfOkfd6+YvW8bMJou6e3zX3ecSYtu00ca5niQ2B4eASreToyoeHIP1oj
	 waPpdldpicfjk3FqxCv5wrHhswzyRA3gZeVcX6kDzWvf4ypWYlVGQQDjfaeF7qI/cDydb
	 2aWRGdPqQmz631gdmX/TWkx0BZlo0uNKqD2aHh6+mT7DvAdoxEAHypCzCw/Ka9k/7RUz5
	 /n4aiTLdQwMqeEjPWW2uvBWuq66R3XeL6noYv0wxoEp6BoPysrHxzaOgK4WIcO8Mv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm4FEPoz;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BCA606A331
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1BCA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vm4FEPoz
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3edaso174661f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134355; x=1795739155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eLfTQ6Mg1TFdfNQYVBbUMUoZme7jwnHY9yObwURtVuw=;
        b=Vm4FEPozWjwDqhEEzPIB9H1n/JTP1ieV7OcjpL9uFpSpM5D9A2OK8riVGF2pSemvao
         AyKTbyn/x/fGEBllxw57cV2dPpLGfQDoOqJzKyBjIsbiJu3LC8O0g/Qrvq2lKsBnp/bR
         rNiGKQwF4qqfU9dydWIrm5h7W6xLlDWHb1qUHmw5MXPJugVBHpKVeT3qhqucbmTNWCgg
         zZNhSw6/c5B6NwYr3+7BJ11Zxow2CSBCnkzOw1WktlA8phadrkeLZoriJU5cbHOwv3Hd
         LbUK+3o9CfcZ/B9p6bbhpsgiYiLYhfN07+JMRN8GFCm8A8ykFm/hLg8ozgmcXZ5hP4eY
         3Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134355; x=1795739155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLfTQ6Mg1TFdfNQYVBbUMUoZme7jwnHY9yObwURtVuw=;
        b=JXPRbCQjFw2lOPKllQEfW0Kc8oeQHW6XhUNASXqbb2jpHBnJhfhmykOWjViD5NYvCf
         +O7zp1yGGSpm+oq3SrPSCXF5/lTFga+if4QVi88ph8s+GfR/jUaX+4YhaZw96ghlmOw/
         P8Cztn7G/v9mAm6nE3YzVrmKpAuISboel1oU3llc2jL83kz3zBtACAwNHbPGsdIcAylD
         bdvcN+0HUgddsJhsRS2UVchryD7D8u1qEIM8qTtOWerDMCtWivjAzexSmCqL62kx3dzL
         f7XIH0/FQYpDBhgsERCeuG0BUZrwGe/5WzOvI68jPfZqQRN6BOa7ysdKd5nU9t689BkF
         sUSg==
X-Forwarded-Encrypted: i=1; AL+hErFfZMdfJVgDZoxPY1GdLwA2u6Xu7oaB8zc+dF5/QLEZS4gNrazV3bu9KVbXH9wtLTAYTUkDdEBXuClG@vger.kernel.org
X-Gm-Message-State: APuU4Z8hwIwOmet6SdBnOCvROTk14Av+mACPg0wTwLF+VG7Vi+cL2P91
	R6GN5DhIDXwaC3odoSJ6KkwmnxskZH2EFB4goZWWxnxHxidTZkeHO840
X-Gm-Gg: AZFdTZcFV3sYyNQDq9Ahz6BdeUQuNW68UVb2HAxXZHpQmyCICzRS4aSDpncVOlCzj5H
	dQ0AKYMss9v46lOeg0XSxsAZCExIbYiNm1Chxd7jAPQPlvMME2ni28w8yMHtmkouAVHA8yd4CcO
	CPTARtm+wYGMErxnvmX0eJaYakJoSCWBuMLbmzzfpiuEuDB0KGwwTJ7BK6vusswlR8+d+ht7QP7
	GXZ27HdbMjPq4dVHC26OA/oDJCGnG0nFhfIfFL9F0hYXskQoQcyhpFAlwozKGe8u2bbqD08i881
	pTxBYK2XJDUM/6/MpvIbxli3irodUHprJCizA3Tq6X0F02QsioKbXUoA75FN+D5AJ0JpEsyPlD8
	tLrXiL4DKufib7ZTW8Uexxwc0eAYPck9FnIKF5Fa7BVac1I/HLwCUDDB5XHy/DqS4I3tI52UDEa
	VKeRZGgUf91WuZTSJdX471U8oqkstsHxKEMIRLxY/OYAsyAiD5g2Lv06BGp+3tu8a/QDgpCZsyz
	znCy7l8NqaAhJOsezWslsDhy7ssybzNv87p1RaCDCsXAvXVHGSO4Dfk4/OvlsmUT1jGfei64lEx
	4CEy4YcfzgnM/ay5pWoX46NSjUw/d3tUC1j1e0SCdA+lCZhk8MWlNxF4J9JmO6Eof/ap2Qltz9R
	svMdznsRsUvfzBFqUKoMs0uftPILpOXRlJPZRzI3YrujkEwQdiRTwCPT9vA0/+o4lKdbh3HiW
X-Received: by 2002:a05:6000:2282:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4aa4e01e1a6mr6835361f8f.1.1795134354882;
        Thu, 19 Nov 2026 16:25:54 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:54 -0800 (PST)
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
Subject: [PATCH net-next v5 00/24] Add ETHSW support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Fri, 20 Nov 2026 00:25:10 +0000
Message-ID: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

v4->v5:
- Rebased on next so DSA_TAG_PROTO_RZT2H_ETHSW_VALUE is updated
- patch #4. #8, #9, #10, #11, #18, #19, #20, #21 and #22 are new
- Added RB tag from Rob for patch #5
- Updated patch #6
  - Replaced the patternProperties expression
  - Added maximum constraint for reg values
  - Updated commit subject and description
- Updated patch #7
  - Rebased the patch due to previous changes in the binding
  - Replaced the patternProperties expression for ethernet-ports
  - Set the maximum constraint for reg values on ethernet-ports
  - Restored the RB tag from Rob
- Updated rzt2h_of_data to match the RZ/T2H hardware configuration


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

v4: https://lore.kernel.org/all/20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v3: https://lore.kernel.org/all/20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v2: https://lore.kernel.org/all/20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://lore.kernel.org/all/20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (24):
  net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
  net: dsa: tag_rzn1_a5psw: Add RZ/T2H ETHSW tag protocol support
  net: dsa: Kconfig: Expand config description to cover RZ/T2H and
    RZ/N2H ETHSW
  net: pcs: rzn1-miic: Select ETHSW port speed through SWCTRL
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Limit port reg values
  dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW
    support
  net: dsa: rzn1-a5psw: Fix LK_LEARNCOUNT write mode encoding
  net: dsa: rzn1-a5psw: Fix VLANTransmitted counter offset
  net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation
  net: dsa: rzn1-a5psw: Set driver data in probe
  net: dsa: rzn1-a5psw: Add support for optional reset control
  net: dsa: rzn1-a5psw: Add support for optional timestamp clock
  net: dsa: rzn1-a5psw: Make use dev_err_probe()
  net: dsa: rzn1-a5psw: Get switch info via OF data
  net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible
    string
  net: dsa: rzn1-a5psw: Add fixed frame length workaround for management
    port
  net: dsa: rzn1-a5psw: Get pattern matcher register offsets from OF
    data
  net: dsa: rzn1-a5psw: Get VLAN_RES field layout from OF data
  net: dsa: rzn1-a5psw: Get lookup table size from OF data
  net: dsa: rzn1-a5psw: Update CPU port comment for RZ/T2H
  net: dsa: rzn1-a5psw: Keep MAC TX enabled on RZ/T2H
  net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
  net: dsa: Kconfig: Enable support for RZ/T2H and RZ/N2H SoCs

 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 165 +++++++++++--
 drivers/net/dsa/Kconfig                       |   9 +-
 drivers/net/dsa/rzn1_a5psw.c                  | 221 ++++++++++++++----
 drivers/net/dsa/rzn1_a5psw.h                  |  53 ++++-
 drivers/net/pcs/pcs-rzn1-miic.c               |  39 ++++
 include/net/dsa.h                             |   2 +
 include/uapi/linux/if_ether.h                 |   2 +-
 net/dsa/Kconfig                               |   9 +-
 net/dsa/tag_rzn1_a5psw.c                      |  22 +-
 9 files changed, 436 insertions(+), 86 deletions(-)

-- 
2.56.1

