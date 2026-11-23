Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459461;
	b=vD2z6EyON8L5Vl5jKoZsOcUjbQHTJEIjgtwWvvGTG1aJeZi0yQW4ebSZvR7LDyydR8rI
	 qJbDfB2StL90V/RH9li5Bw9X0XvemlOQgKq8Ln1MU1/RknHuG197hgu42tuXxjmL4/iMQ
	 z/UWQn3W3T6KO4JVg2URr/98msaX/r6X0scHG0JgZWVK9rRQwqUY4cho/n3oGJNygh0kr
	 Gaz9gTgob57itZmFwqhPreVQqJJroj3FaYkw/NVtZHVpolHua//6b3FEz3K6FFxrwzQTy
	 ap5mL5PcmxajYgM3HWuilehDxOYsL/RJhbtN2IjlcwAD45gOIED7iuijvtkTXDpYvJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459461;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hlFje3mu64D8tZjZSmjSeWykRYlygG1YqFQ9P/8ISqY=;
	b=h7IYqT5+d5n2nc3R7oCp6zLwgoriZH322/VwnHsKnbrxpkXMtj5X7j47i6QfHeRX9yD8
	 pOYciipEASBksWO5R6prfFNIbYezCnqgVohUdt5zbtLl5M//2BDaSyiPTV+GqqWQQ0zBZ
	 K1OaQcK9gjCwU7VXwK2p4LT6AmMxJZIQKBr0lHQKYy0fc4AIsVwHAlcCfbT6hmWGrT+O/
	 bGCGiNubuXg+h5rPNgnPL6bvFAS7l6cbBc+GLtc88M1GiaacRUcY+s/KQBca+5BG1v4ix
	 NZ4zi7uamf27t+mRyrPR6Fy2WXsMBsyX5q0295lkCgJ5ql56Xa00pJiw2ic+Z6TUn5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYHv7ajB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CF0606A321;
	Mon, 23 Nov 2026 18:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fYHv7ajB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459460;
	b=VBBgQ6Kgiu9hrl8cjnsxnBXtU9DZdGF81ZN3y+conxf1Wq1mY5mOKRvWLm1UljS1TGWI
	 WJG4CxgdgpaDNhF0r5GlAiOeGT+WFTlZSICIoR4mrWRjhxv8nYmMXlb6Xuxbrx3W+X7Et
	 r1mq4qOK6BJfC5/Dm8rUIw4lLrDVgG7InRF9f5Bk4V/7VTyYxoqPW7i5j3rp7yrnTBSpb
	 tupnUowanM6+eLUkiTeUzBdUO09OOTMBQvFdvhEUIfahgx7pKQrUvynNkDS1XhSPJSMu0
	 ZAwFA650n9OVHlkeKOLy43t6fSVhM48/MS6iQs1HvlegkCjfyrIW9HJf8dRxthgpQVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459460;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hlFje3mu64D8tZjZSmjSeWykRYlygG1YqFQ9P/8ISqY=;
	b=dsuiIk+W5pPtniUFAsPRckWt+YSCF7TcrDwNxEzNibCZhNoZ8FPhylwSpfxtWG7fqeay
	 HiCY3wg3q2sdWtWVjUffuU8BTYkIRe+qQdE30ZPCYW995VDeDnLwqb60RCY59Jw7i7v/W
	 nvhwB/2kuHRGMiC39OD1OO+pr8dIl81N3DcRZn9V+YJwbFAJseDHEO4ecqM+YWIs0+Xe0
	 o0wEWh9tFa9an10F1F9gqolP1xNHynjg3eO6jm0qOwP4TeYBc0kFvhG5Aa4f4c57uZ54H
	 pyvXHQ1AaZVnLrJE9VfTfEL2ueGNuV+zsEvlaJQYLrdd25oTO6bHjc3+UCwidJgjDcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 89B1B1F0093C;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459460;
	bh=hlFje3mu64D8tZjZSmjSeWykRYlygG1YqFQ9P/8ISqY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=fYHv7ajB1a42uH9qbeYYI2RqbeJkjgM06y1KTnOJ7/6+AYulhTpA1qxEAnQtxSpp+
	 ZqOnCNfG3kf2dhKoNsGH4DF2nPLRfA7vkR3my8Z+yaA9xT5OxZqCd6+5owcYpS1TJO
	 2xueHUuWQrNeBM/DvHDyaaCfcKC+pqzFhxxK7mpfTF/QsYtNdy5v5xZPcZwmxGE0lI
	 oFqdKQuYOxEwxY0XHNNVc0VjkhNxBGtW6QHrd2B2Bhfp4Ch1Siiv9dSRzUn3Oqy0sA
	 bTN4T7U4jOmI0EdeF79xBKE3WC5r7IKpzZ1oA/oQ4gfdGQ9/Omi1cI4b3THfc6/OOX
	 F62cCFW3jkJ4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 190554C5BB;
	Mon, 23 Nov 2026 18:44:13 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH net-next 0/5] net: cortina: Add CS7542 network engine
 support
Date: Mon, 23 Nov 2026 21:44:09 +0300
Message-Id: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2OTW7DIBCFr2LNulTBgA1e9R5VFjAeEqoatwyJU
 kW5e3Fqdfn0fr53B6aSiGHq7lDomjituQn50gGefT6RSHPT0B/6QcpeiaAF8mh0L6ieqWSqwji
 UZg440kjQil+FYro9R99hC2S6VTj+OXwJH4R129yzhb4vjVv3QvBMAtdlSXXqwuBd9EojaWlHD
 IObFRprvQ4hRlQSqZFt3KYWYvbPw1P3f3f/yj+MaxZXKQ5CO2ssDUpq7d5Oi0+frw0Hx8fjF1X
 dTlkOAQAA
X-Change-ID: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459449; l=4440;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=LeaWLqxAis70C57qJ2TkPR2rGUR35IIvdrZPO5ZWMxo=;
 b=VpNX0QkmzL8UhlH1vyDAY2gb2UkTdTsvcZieISVbZwONR0kkncKFDMB2NxwMFsp2qbe82X3BF
 2D1gOAJgTwOCeNEqRepguPnzuN9sLOLjbzMohlnT5fZ5KjmQFKQhipy
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Add a CPU datapath for the Cortina Systems CS7542 network engine and
an exclusive reset provider for its NI/FE/TM/QM/scheduler/XRAM and
DMA-LSO/SSP domain. The three GMACs use phylink; Almond+ connects two
of them to the CPU ports of a QCA8337 switch handled by DSA.

The driver uses NAPI receive queues and a shared coherent TX ring,
with scatter-gather TX and multi-buffer RX. Hardware-returned RX
addresses are checked against tracked mappings and their ownership.
Indirect initialization waits are bounded and errors prevent activation.
Unregister/remove drains ports and software work, then confirms the
complete reset domain before releasing DMA allocations. If reset fails
after activation, those allocations remain pinned until reboot.

The whole DMA-LSO/SSP block is exclusively owned. Another SSP DMA user
cannot run concurrently; the separately prepared CS7542 NAND driver
uses PIO. Initial QM support requires a no-map reservation of the upper
64 MiB of the verified 512 MiB DDR layout. Hardware offload, unverified
coalescing clock assumptions and power management are not advertised.

This series depends on the CS7542 global clock/pinctrl v1 series:
https://lore.kernel.org/all/20261123-cs7542-syscon-v1-0-49858e631449@gmail.com/
Both series are based on Linux v7.4-rc4. Board DTS enablement is
kept in the integration branch and OpenWrt target, outside these five
patches. The reset provider and Ethernet driver do not depend on the
Cortina platform Kconfig symbol or COMPILE_TEST.

Validation on Securifi Almond+:
- Full independent ARM vmlinux and module builds, =y and =m, with
  COMPILE_TEST=n and no platform series; DT schemas and examples.
- Actual helper fault-path tests under ASan/UBSan, including RX ownership,
  TX mapping rollback, probe failures, table timeouts and reset failures.
- RAM module lifecycle: 132 checks / 0 failures, ten load/unload cycles,
  active-port teardown, reset readback and reset-failure DMA retention.
- External LAN1: 600/600 UDP echoes with byte comparison and 20/20 ICMPv6
  packets with 1400-byte payloads; no GMAC RX/TX errors.
- QCA CPU6-to-CPU0: 448/448 nonlinear packets, including RX buffer
  boundaries and 8192-byte payloads, with TX descriptor-ring wrap.
- Combined RAM test with PCIe and read-only NAND: all six PCIe devices,
  protected NAND hashes while the NE reset is held, and Ethernet reload.
- The original 14 protected flash/configuration hashes remained unchanged
  after returning to the installed OpenWrt.

Only LAN1 has been externally cable-tested in these runs. No throughput
or entropy claim follows from these functional checks.

---
Fil Dunsky (5):
      dt-bindings: reset: Add Cortina CS7542 network engine reset domain
      reset: Add Cortina CS7542 network engine domain control
      dt-bindings: net: Add Cortina CS7542 network engine
      net: cortina: Add CS7542 CPU network datapath
      MAINTAINERS: Add CS7542 network engine support

 .../bindings/net/cortina,cs7542-ethernet.yaml      |  139 ++
 .../bindings/reset/cortina,cs7542-ne-reset.yaml    |   42 +
 .../soc/cortina/cortina,cs7542-syscon.yaml         |    4 +
 MAINTAINERS                                        |    9 +
 drivers/net/ethernet/cortina/Kconfig               |   14 +
 drivers/net/ethernet/cortina/Makefile              |    3 +
 drivers/net/ethernet/cortina/cs752x_fe.c           |  477 ++++++
 drivers/net/ethernet/cortina/cs752x_ne.c           | 1783 ++++++++++++++++++++
 drivers/net/ethernet/cortina/cs752x_ne.h           |   13 +
 drivers/net/ethernet/cortina/cs752x_sch_tm.c       |  679 ++++++++
 drivers/reset/Kconfig                              |   10 +
 drivers/reset/Makefile                             |    2 +
 drivers/reset/reset-cs7542-ne.c                    |  114 ++
 13 files changed, 3289 insertions(+)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-ethernet-59c15dbc7e7e
prerequisite-message-id: 20261123-cs7542-syscon-v1-0-49858e631449@gmail.com
prerequisite-patch-id: 4b568d742095f1a61312c911d2b6e81c8e754312
prerequisite-patch-id: a4bba26a3aac57e4e4229a727fdf94677373493a
prerequisite-patch-id: f8a2ba71717f71ca2bedda986f8b861995cdc586
prerequisite-patch-id: 7a2275c69dcde437fc8badf2bba06d451943a66f
prerequisite-patch-id: 25220835f5d2506a01ba652d86f9b9ac3ad5121a

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


