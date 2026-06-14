Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1971E9B37
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781409661; cv=none; b=Gt62DXknGtUiVDCmj0X8Z9SuHDd4+zFi1bM/f/hkEtzEMiHcBs5BEjsnuVygShGewxmzBl6Kh/1c/JnDrBaDl5KHxEBL0qr33iszoun5zheDVhJ7NM3k0NsVPMpl/zYXBw6cVouhH5RVKYSTeSkmVhLTNPa85maaCWl6PnWQMaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781409661; c=relaxed/simple;
	bh=APT6um1Gw37K7BhotudONjWhazcoIfn8CWJ3A7ulKkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYOJOochVhOa3nVeXz8lV+zfeO09f5xrFXvGKspbdu3emiUnwk1dKmFZroPuOfCFSL6+bSqRwk2Pd2msPC0Mand9z03yLfBj5AY0+tR5ODzamf+XM2bgDe4PbpQ/+GDt9wbeMjq3YXs/zmjSKL9pLiNWKV98K2MId9wrG66o9v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0hszA9L; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0hszA9L"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso1895384a91.1
        for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409659; x=1782014459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=M0hszA9LAPM0u+mvtQg7CQzun9jKcuyzpYDaK73aq5lwzzafOlaDB3i+1bQQg9veKW
         g87VwVisJjGdbsFNoa4fl7ysx69bG4hCJ/1zEvfA0mXeptOusOF42klvXvr/KgMKw/x6
         BzYhQCtMQ4HHUUOxFWaHARWwg4NdXpEi6oYx8n4k95RaB40DSMmywPTsjfc2uFWPQ/jY
         nNzmIzckQnFViZraI7GlVlvwFt4+mIX+ft/uEbGtTMpWgDA/Qs1swiEBy336w6hK0tOn
         GNWiuC5R6DYHEW5ixQAIjwNmRN9SChMX3faBWik5Je7OOof+UeZ196gtyAZr31qQOmxn
         7x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409659; x=1782014459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=c5L+N5X1DhSDervEKZg+38bJ9D2fMAVIq+3E2ygB2iatkgKCsNKZsQWuZlCrhbcA8K
         xdJ6N7ALH1tasTMfjD2p2aaU5ZpjdHIYlpCwlpETbXAHiLvCY5NC3NpMDTAmH2IJhWKA
         k00JKWhXz2pMLjuK70LdJhtJ4n0zAnWnsuSLlRQlo/W2ioSvcDBwyuWwPYrmg/kBzqj1
         qB8GHzBpL0eqNXaa3gNiUuOl+8PCta8o41M5SYCMbGzcqHXBIdf2XJ3NQyHsxMWmXyOR
         cMrhOy/BqNCB4EfWQ1/G/MuDMwLm4jdU37YCTDBX/9w63LAX+8dH87AXJkaXPK9PVYGJ
         0PAg==
X-Forwarded-Encrypted: i=1; AFNElJ/Co6m7t97Tvz/IkM/eAreSMEZx2IJLAJubBV4adwNKbh+/1UEE7F4qfjFuqZxVZBMSHBK6mEZNCoKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPkXGJDUmPmoiZ26brqR0ehXWMpIJrZifhi9AAchrhs7YCDOCY
	gk496BAn6AUZt0wWDuXaGqufei4uixqOYBytPo007Lf3nqq/q79SC8hR
X-Gm-Gg: Acq92OFJc4LLNKFdiLhIINMLLZrnpUhX5/QJLgf6QHs5iqLVRIggeTuvWh7gVjmwKqG
	eZIBPIep3ah/LedHmEIH5ifIIpd2gKaBCItmaOo6qHxcflg5P2iqZzfhgt6cd1uxIwtw4E89vzc
	Sz5o52HN37eN0gwtsu0AFFtzYCgEx3x4cvpSq8iC8mOoG4uSRVPXLhx0ZOX3iFn2yDTwvtgCHU9
	plVjOoA2Rv+M3Y5arMSnWEyqQcmOI3jADT/ED4oPCz45Brbn8Ye+kdL4D5ra7aZ68U3hkeZrANe
	imRGIFHzwV/7U097oowaZONH6zPUPG+rxbtSFBr15kY0ceKftMPDPY5PadRSrkp/poiyAk74ME6
	nLiaKaeUNvXYrhPFILK3DhQD4BErHijvjwkXXcxbGy7bAv4uTEY3K2wT0M8pOzLO8dJNdRt7FHb
	WfvmFDE9KTOSWJ9LjT6XRTsCEMTZyh3A==
X-Received: by 2002:a17:90b:5588:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-37c2bd79bc6mr5257855a91.25.1781409658385;
        Sat, 13 Jun 2026 21:00:58 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:00:57 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 0/7] net: airoha: add EN7581 SOE ESP packet offload
Date: Sun, 14 Jun 2026 13:00:25 +0900
Message-ID: <20260614040032.1567994-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Secure Offload Engine (SOE) support for the Airoha EN7581 Ethernet
driver. SOE provides inline ESP packet offload for native ESP and NAT-T
traffic, with the Ethernet/QDMA path used to submit packets to the SOE
block and the PPE path used to bind eligible ESP flows. NETIF_F_GSO_ESP
and NETIF_F_HW_ESP_TX_CSUM are intentionally left out for now and will be
revisited separately for feasibility.

This is posted as RFC because the code was originally developed and tested
against an OpenWrt 6.18 Airoha tree, not against the current upstream
net-next driver. The original OpenWrt commit used as the source for this
RFC is available at:
https://github.com/hurryman2212/OpenW1700k-test/commit/7c1b5e662f7790b3d23ed143beadc1dcbf6d15f7

The SOE part is intentionally linked into the airoha Ethernet module
instead of being exposed as an independent crypto or platform driver. The
user-visible ESP offload control is a netdev capability: xfrmdev_ops and
NETIF_F_HW_ESP live on the target netdev, and the feature can be controlled
through the usual netdev feature path. SOE also shares the FE/QDMA/PPE
datapath, private queues, DSA conduit handling and netdev lifetime owned by
airoha_eth.

Patch 1 adds xdo_dev_packet_xmit() because the existing XFRM packet
offload transmit path does not provide a hook for hardware whose ESP engine
is reached through device-specific packet forwarding. SOE needs to consume
the skb, add a hardware hop descriptor, steer it to a private QDMA path and
return the final transmit status. Drivers that do not implement the
optional callback keep the existing XFRM output behavior.

Jihong Min (7):
  xfrm: allow packet offload drivers to own transmit
  dt-bindings: net: airoha: add EN7581 SOE
  arm64: dts: airoha: add EN7581 SOE node
  net: airoha: add SOE registers and driver state
  net: airoha: add QDMA support for SOE packets
  net: airoha: add PPE support for SOE flows
  net: airoha: add SOE XFRM packet offload support

 .../bindings/net/airoha,en7581-soe.yaml       |   48 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/airoha/en7581.dtsi        |    6 +
 drivers/net/ethernet/airoha/Kconfig           |   13 +
 drivers/net/ethernet/airoha/Makefile          |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  668 +++++-
 drivers/net/ethernet/airoha/airoha_eth.h      |   40 +
 drivers/net/ethernet/airoha/airoha_ppe.c      |  606 +++++-
 drivers/net/ethernet/airoha/airoha_regs.h     |   16 +
 drivers/net/ethernet/airoha/airoha_soe.c      | 1896 +++++++++++++++++
 drivers/net/ethernet/airoha/airoha_soe.h      |  126 ++
 include/linux/netdevice.h                     |    8 +
 include/linux/soc/airoha/airoha_offload.h     |    5 +
 net/xfrm/xfrm_output.c                        |   11 +
 14 files changed, 3342 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.c
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.h

-- 
2.53.0
