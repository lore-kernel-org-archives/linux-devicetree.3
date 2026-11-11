Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408271;
	b=Ce2f9hRs3Ev6UkzMwav8UT5G6c7KhrS9wChtkE1Wup91vzrJbBWVVjhVvOUCXrHD+6YQ
	 1iM3P8aqs6a8BZE7wZ6JSdmPYOlmrMXhKJoo3piDvEdr4rte0quB23wGIHc4MI1lypLLT
	 mN3m0iqcVKXSCeqp0+SjwQASXNivb/Mw0iJlH0S1hd4z+KQtei0C4de1RXR8tY5xv+ipK
	 8QswaoTec8NvL0R9XZa7eMvk3RRhuvkbUbQZblZGdO+sU+vIIMNDrNQJbCOEPA4J1e1vO
	 ulIjtg2ORJSmgNs4erp1Q8yxQXfEOByt2k39cs7Y5AuAI/s2ilOk3LVF4qLUKtbSB/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=;
	b=ZrQP45ib8cxs+xZqMfS+DR10L9s8tnNDFk44UlS70vBnj6s8zT5r2PPzA1VfmcUdkWyd
	 zlrij5DgdG+Y/ONHe3mG4uLYlzhXDzNxXGrjTaECfbswRWAKTmv2cF5yswU0PwE+l9Mhz
	 pOSHakAH1l8ZB0N6a1/VlLFwGkt/ComyF564T//HkEZGb5r5ixExuash2m2G9kloOIXqC
	 T/DtYW/C6KKuAmhAMlYV8JbsBE22xurHSnbXVT9n+XJJGqcD+WHy8mWgKE8jQGjAHj8zl
	 /NafU1TdjlL4GKlLoYXzJMbu9m48954aIJGXm3BqZNYGqH3P593ldpsXbYRVHzu4EQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VcsgH8HM;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0570B606A32E
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 14:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0570B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VcsgH8HM
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19782455e9.2
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 06:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408269; x=1795013069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=;
        b=VcsgH8HMjHh6IbbGvxMNETPS9g8apuKNu5eJ5iW0JHzhfFRLyj3NgajkhFNAEktPCH
         Tcxkxens/u5o9tOI+SgiHKSYztMgHT+ABtnAa/EAIdKklMdVcpK/v+qBjQ3JgYAoAv0G
         A9u/9sqv+BXhyVzbudCWvmcPV77gPHc2wZ0H38yV0/1VK7iOn3oNH2rTeh57ASrPNQvt
         GpJtOGRaKmmxu3k94Y0w8XyI6IjWqm4UuXTIwEOYbo1fe/1UaHehatmslLRrbI803Tr9
         3b6AW5APnF0RV//L+nunU1R1VTFuVOtQUv0FnhGENHp8O7W6phoFeNWzKEF2RVFBnyIG
         ZUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408269; x=1795013069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dr/c6inyZfcsokKdZljfnN0MuHP4f675XnQJYTzje7k=;
        b=Wtqo2ePGgr+3Xc2ATau6c50ku+SsyeUqfM+mkdvco5oGC8GK/zSlmEriwQJrAVjoKd
         5wkvjc1FtISSN7z9zG/3/hpZoF1CDj9ul2LsMgndgCQmTI0tlrie+mvCrhT4D4OEii/p
         ogVA/vPthtcbvRgSgk3p6RHd0gjjxerQB/i/1YHOsVrL3dsdGNL3MLWtJ0Lfpe7a0Zqg
         ge/T6s+KH0O+Mk4j6hePgGPNJwQG+LYA7QZOjsu8e3Q8gkitJ+jYshxDk46DVYJ7WtVy
         REi4rCIh0DQh56KN3jSmBUcPcx5tx14LikdGB3IOIN3qdJo9Ggl9lqRSnYDlVzWHkIsJ
         Er9w==
X-Forwarded-Encrypted: i=1; AL+hErH3Fpo0LBYns5mLO0EQgw1ouWgUMBeDo7XQulju3225tx8v1kT850jjFvJwRrpR5nDs0XvEwRzAmY67@vger.kernel.org
X-Gm-Message-State: APuU4Z83bZtEhiQnW5UXddRC3VU77uqbgUYha4n+A/yc9NuLuD9vskoq
	LDXvZUsmYAxw0YGzek5UYYEcJdwyhuogEsbLo8L8oZ8IshNVF87KB8s3
X-Gm-Gg: AYBFou3E9D78s2AIg1MKVjm4FdTRy8rdhljeC3e0i5+C/xQVN+H0QVaTZnGDaSGgGAV
	tA9ebo8xuB8HWD0OwonDr1Tr8ftTf3pGNmPY2aaa96JdRCWjevudgw+t5tF1Pe9GPYfdgXk9wnB
	jhiPDHSnUew0xCfg8EOUiR/KbMbro7z76fPqftf4cggX0sB587WQ+9DvsB9qKJ/0C0hTDIAkR0v
	JPXHRxrQLCYz+IU7LDcrwr1i+0P/Z4+8zXoQxYhs8JbKjFwm5resj6PZ43KepBEuPM6auzOKI0k
	fMhn/EAzhrp3R6rlSnSAzkOMTkjmfcrU/TghVdmX7cA+FynRELGo0nGhoLEZlBFevv8zPY4yyw2
	3UflCOkd4l3Rh5go1lL/5yv3xH7BMTQG9dQAKvlvbE34n0S9DSvnF8bjO8qhE+x/qjbCW8Ly5IX
	wUrdM7gt5LCqI1Cy+PRHAA725EsrFl7FJSaW9Are+Swv9CUtkXcuCgvvv1kj+W3HdohYrP3PIgl
	xSF1fI+xI3Os6HrpQX7TDk6wJ4JCH1KJqB7qd2zrFt5dNfxNlcMJo841yBX7qDM/+ObM8gcfdsL
	12r0Z0KO4jQXiaUwJsbq0i4ALzJWWdCUGz0=
X-Received: by 2002:a05:600c:3b01:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4ba09344326mr47001535e9.3.1794408269178;
        Wed, 11 Nov 2026 06:44:29 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:28 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 0/5] net: ethernet: zte: zx279128s: offload flows to and from WLAN interfaces
Date: Wed, 11 Nov 2026 15:44:21 +0100
Message-Id: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Hi,

This series lets the ZX279128S switch driver offload flows whose ingress
or egress is a mac80211 AP interface, so that WiFi <-> WAN NAT traffic
no longer goes through the CPU's forwarding path.  It is based on Navid
Ghahremani's v2 platform series, which adds the SoC and the driver:

  https://lore.kernel.org/r/20261014072109.1759502-1-ghahramani.navid@gmail.com

The switch fabric has a second DMA engine (a ring pair the vendor
firmware uses for exactly this) and 16 "WLAN logical ports" that a
classifier entry can name as ingress or egress.  Patch 3 adds the ring
and the ports; patch 4 binds a mac80211 interface to a port on first
use and accepts flows from the flowtable in both directions; patch 5
adds debugfs testing aids.  Patches 1 and 2 describe the engine's
interrupt.  The WLAN drivers are not touched: the frames the fabric
forwards are handed to the interface's normal transmit path, and the
frames of offloaded flows are picked up on the interface's ingress hook
and injected into the ring.  Any mac80211 driver works.

This is not a WED-like path: the SoC has no block that chains the two
DMA engines, so the CPU still runs the WLAN driver's own transmit and
receive paths for these frames and moves the buffers between the rings
(no copies on the forwarded path).  What it no longer does is the
bridge, routing, conntrack and NAT work, which is where the CPU time
went: CPU0 drops from 54 % to 13-25 % at the rates below.  This is also
how the vendor firmware uses the engine.

Sent as RFC because:

- the base series is not merged yet, so this cannot be applied as is;
- a mac80211 AP interface cannot be put in an offload-enabled flowtable
  today, since mac80211 answers -EOPNOTSUPP to TC_SETUP_FT and
  nf_tables rejects the device.  This series was tested with Felix
  Fietkau's OpenWrt patch that ignores -EOPNOTSUPP there
  (target/linux/generic/pending-6.18/
  701-netfilter-nf_tables-ignore-EOPNOTSUPP-on-flowtable-d.patch).
  Felix, do you plan to send that upstream?  Without it, or something
  like it, this feature cannot be enabled on mainline;
- design: binding a WLAN interface to a switch port from the ethernet
  driver, through the interface's regular paths, keeps the WLAN drivers
  out of it.  I would like to know whether that is acceptable or
  whether this should go through something closer to the mediatek WED
  model.

The SoC has an unrelated problem under WiFi traffic: a PCIe read on one
CPU deadlocks against L2C-310 maintenance on the other, discussed in

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

This series was tested with both workarounds under discussion (a lock
around the PCIe reads, and the L2 cache off through the device tree)
with the same results.

Results on a ZTE ZXHN H3600 (MT7915 as AP, a phone as client, flowtable
with lan, wan and the AP interface, NAT on wan):

  WAN -> WiFi download     393 Mbps offloaded, 109 Mbps on the CPU path
  WiFi -> WAN upload       186 Mbps (capped by the upload server), 60
  30 min soak              111 transfers, none failed, ring counters
                           consistent, kernel log clean
  cold / warm boot gate    17/17 and 5/5 boots, offloaded traffic on
                           each, no hang

IPv6 flows are not offloaded, as in the base driver.  The register
sequence and descriptor layout were reverse engineered from the
vendor's GPL kernel.  Builds without warnings with W=1 (board config
and multi_v7_defconfig); checkpatch --strict, dt_binding_check and
dtbs_check are clean.

Agustin Santiago Isasmendi (5):
  dt-bindings: net: zte,zx279128s-gmac: add the WLAN DMA interrupt
  ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
  net: ethernet: zte: zx279128s: WLAN DMA ring and logical ports
  net: ethernet: zte: zx279128s: offload flows to and from WLAN ports
  net: ethernet: zte: zx279128s: debugfs knobs for the WLAN ring

 .../bindings/net/zte,zx279128s-gmac.yaml      |  20 +-
 arch/arm/boot/dts/zte/zx279128s.dtsi          |   4 +-
 drivers/net/ethernet/zte/Kconfig              |   5 +-
 drivers/net/ethernet/zte/Makefile             |   3 +-
 drivers/net/ethernet/zte/zx279128s-eth.h      | 124 ++-
 drivers/net/ethernet/zte/zx279128s-main.c     |  18 +-
 drivers/net/ethernet/zte/zx279128s-ppe.c      |  92 +-
 drivers/net/ethernet/zte/zx279128s-wlan.c     | 874 ++++++++++++++++++
 8 files changed, 1114 insertions(+), 26 deletions(-)
 create mode 100644 drivers/net/ethernet/zte/zx279128s-wlan.c


base-commit: 96b4b72978e9fcfdd74f809c159f26813995631b
-- 
2.30.2

