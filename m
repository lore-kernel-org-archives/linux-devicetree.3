Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795837996;
	b=V3WhR4TCkKjKKAo7QYswBqUmKLpNqmEFEp4OvLiZWuqlXBinPZjNvXtmyTYHITfsYRji
	 wFQmzDbiQGiv1oOpj4Mcg+tMVyeaCc3VoRfvPGrSiZ5wYMZ9YP8XAkCJsOWYPy5rxxESt
	 0B4eGX3vWZU2OR0CPjuQc8O5q43Apx9npwTFQnULxfar4Lcl1j/ZMWeMNx5/Kt3yMsron
	 pEv7QMKBUIMJzn/yFXVwwVtOE2Y/WSY+vmrECTII+3rk3btKSDz/blKzJs38XrdihuuK3
	 E4goj3sq3Jtl6Qtty+I5cYOF98TeF2Q2gg4+duLkrJviHwA4tr3XV51sCynIVSVECiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795837996;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=O9nuYP3K5I/vAib7SOIFU78CMl9MUB8QS3+4jVDN6gM=;
	b=zzlIPymbOyMoE/VhA+yla7nRPAmCtcfsJSAZZXwQ6JeDUZO4eg7rtyJ9UMhVJHRnzKnq
	 IHBScMlc/rZ1iG4zijq6fezT0Jj7k1GQ2rfHiYsiYFuEx6STzpIb6aGXzEwHaXwLqojm/
	 96XF2GwkE8mgkSxfWyIDkHReZDzedQmoDrRLg7Sj18G0kJO1oPRVeafuAW2UXHo9amp9q
	 VLedxMfFXthSDD50KgywOT5uLfP8S+rcPB7IuB88jQwotCFbjj6Da8bmG2qxuP3OSNZjX
	 7OVfI3kcjBnpOA1Z3IGDwDTl28sfXiVVqg0bUng1h7QdvdrwUEY4TG85uEuTdAg/fIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2KAuzoL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109D6606A31E;
	Sat, 28 Nov 2026 03:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V2KAuzoL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795837995;
	b=o56YkhpLOOazoA2PUpLzand9LkZAg1iXiAmmpweTM159TMAE6Ha6XPvuUoPoDKYXd499
	 uK/ctbcyL0JkeCvipH66lUOEjgGU8xOfIZlUGR/CN6c9jQwk8jyP+pfHXADtei+0tPiZW
	 TlGudA9vN3Y53DWR6p8kiGCD+5oVvN0MWQmlK2C1xgBAe0L4Y2DEe8u8SDXyqWlpIBNWh
	 Liyc21AmbhA56ryZzgovri8EEyvilFFC7Jgq4g/j/8ypK0+V+l4CVa1gyLUp0Cngx82F+
	 jDtFFX64OydId/ETf06pstkW0svIN8BXiM0NWBgJF3BtbVZs9bhUfZgBCxzZwyyRkMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795837995;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=O9nuYP3K5I/vAib7SOIFU78CMl9MUB8QS3+4jVDN6gM=;
	b=krlX0weacqSqYbwl8Ai68KiqXly9Bw7L8uMqGxmh/9Yrdgkv7Cy5do0xB3LT58WQDNO0
	 XXargP2KjUbHEx2Z7DcThexRrraazmd4pVwOUAHqZJ1xY5wOYg/NTVU1bIIFkDBg681I4
	 zojHTJmZ1x2yd3vBPt87c+eIFpnYJqKl5p4haPKtn8fAPHZJc7Dr+L0qDY26oVzorYYQY
	 FXdSjMh69w/oSVGA+Qu47N/DYT5QEMAm6KyNUXDcqEib+hyEojlsHLj8MiXKOP2YcyAzQ
	 HFaw7AtZJWiL9bLzM9QaCsM08P69ZZkQChpY7tqQf8/GL+/8OObK+QDKIWzHguVcUVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEAC21F00897;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795837995;
	bh=O9nuYP3K5I/vAib7SOIFU78CMl9MUB8QS3+4jVDN6gM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=V2KAuzoLG94GKFVFNCcsTQEj1aOXE9o/Elb8fcigfHGWc5yEcaTN6gwRXD2ayx5pr
	 62XUNfU6oxIY3tLYEc/n66GfyluFYsZwXYSMasCnwpTtwFxTZyBbwiaOFGFEGrVSZL
	 b2O8UtUNBg3Z3d/k1nTPLSLreoTplc0Kafu1mtPPEhvztoU75/2FjX9xLF/+ZwmNMv
	 l+mKHt9hEj6GtjtQdihBUs0NqBlGKnwAVfniU7eQ7ca+VvKyIXt5sHhAVQnoH2Ys33
	 8q9tp2QRbzqHg2eDbMByIYj2SarJ3TDrXgmHhomdubZtE0IqhIV72ZsXxPchto7aXG
	 +KMjg0k2MMgMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BA484DF84;
	Sat, 28 Nov 2026 03:53:10 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] ARM: dts: cortina: Enable CS7542 Almond+
 peripherals
Date: Sat, 28 Nov 2026 06:53:08 +0300
Message-Id: <20261128-b4-cs7542-peripherals-dts-v2-0-ccab93aac77f@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41V7W4cNwx8FeN+dwuKlCjJCIq+R5EfFEnZ29g+5
 +7iOAj87uX5o6gXTZsFbg9aaEYkZ0h93x39sPpxd3nxfXfwh/W47u9igb9c7PRa7q58WS3WOwT
 klJCWkRc91pJxuQ/k/bUf5Oa42Cl+UxCkaM1t7gJ/f/C5Pj5z//HxZX38Mv50PZ0JX3cc/POXO
 PT0sm035OiL7m9v19PlxWDpUyir59SqDu5GWlqTPMacSkm92Hg57NaPR3mO9vLiw2uw+Bbs4+P
 y0BdY0tQ0OgyDXn+/upX15tc467cf4eENvN6ddHkowTBxeC1avFf9f4bU3xiu7tf98sDBQFXcB
 CTe9hMx/J3AihFCCwKDBjA619b4JwjSIofb5fTVlq92OpchLS2lZpCbTvOfCuGNQW/2+mm525/
 WufpheUhBxtiJSgVx3Nb0Xk56/UwlSUZ3FULBKgUps3Eiy8E/U0FPA4WpvUdxiQ1jkIpIK6m5F
 04zvtJkIDGnznPO/h5VimmeyXuo3Qpl0JwRMzXEMgtMm0xc+wZVpbVKaM16VMUm8oCKHc8VTIa
 zZo0n1Q1qDu8ZCnLxSZZcGaO6ORXJrACcZFrVTV5QvUGB858VB00G7AXC7NMjsNmjNpF22eRFk
 ChaoI8yKwsXCBvGIWkwjZmAKfuZYYPyxtMFOrbahSNYrxN6s8FqIYNoSaXRJq/cXXLtzm2ozWi
 32tFrlIJgIOroqmhUN3n5sNZrxRBSzZwrQp69lc7htUIYBZ1tcn6PIgYMfRMTuJOHNTsBKpIOK
 d1yI5duLb1HpZqoRhotGaUMFntaxNUghoNoF0GUCBA2EUpoNHS0nrlZBbBQvXCnGSJmBmMrgi9
 6/XsrxET5rNI+RT/sl/Ht5Mt1kEYzrHfr6aUjlHMGLDGupvywIyIj1157dERSkqw5mRjn6CLib
 NRDuIZJN1mPmLDEjAgEbaTGOSSJWTJRCkUNE6QZdt/4TUpoB2XgGC3nGKAetROMpqwxXUW6Wji
 W36MGNAIuLY0ZHXWuTMk0IESqJUF84hoilY1LzWco6Mwd1Du3sGktIxzEOcqeqI0+Y/Bs/BZ2P
 rdmpxhJySnaL1nNo2BxnREwelEodbxHNbM60bh0iH0lLKkwlHmU8FKKAZcpiC3tzrfP9Xo87Q/
 fni+6h/R82byKWv/jTgtBYanqmKNyOOgfgu4+Pj09/QUMQ4GhQAcAAA==
X-Change-ID: 20261123-b4-cs7542-peripherals-dts-dfa20a5c748f
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795837989; l=6678;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=sGmRqkUabfucSKZeZIFtVAexh5HDQvkOlLGp+xzNaQc=;
 b=VHHAKQamXF34ZKddck3t3TdGvToaKTq9jw3gYpcVzP/D7CIrNwjtuqGQevQ3LRlUytSYHN7m0
 aUZNKsEfjK5BhahQquwwGivIY8k6P4QfXq0mWeVOVTj4FNsL+jjtITj
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Describe the CS7542 controllers in cs7542.dtsi and the Almond+ wiring in
cs7542-securifi-almondplus.dts. Enable the peripheral drivers in
multi_v7_defconfig. Platform v9 supplies the minimal bootable SoC and board
descriptions; this series completes them using the subsystem bindings.

Use the global syscon for clocks and seven independent network-engine
resets. Describe all three PCIe Root Ports, with one owner for GPIO92
shared by the Wi-Fi endpoints. Put endpoint addresses and factory NVMEM
cells on the actual PCI children. Both QCA8337 CPU links use rgmii-id,
matching the tested board wiring. The MDIO input is the APB clock, as
confirmed by a differentiating clock-domain measurement on Almond+.

The NAND node describes the AXI clock, interrupt, data aperture and
separate flash reset from the vendor resources and posted NAND v5 binding.
The NAND driver has passed the recorded Almond+ checks; that is driver
evidence, not execution of this publication commit. The board properties
follow the tested OpenWrt integration.

Validation: the final sources pass unsuppressed preprocessing/dtc and
complete board schema validation. Reset/clock specifiers, PCIe addresses,
shared PERST ownership and NVMEM cells were checked explicitly. The final
dependency stack is checked with b4 against the base commit below.
Earlier combined revisions passed full native ARM builds and RAM tests;
no new hardware result is claimed for these DT-only changes.

Clock/reset/pinctrl v5, MDIO v4, Ethernet v4, NAND v5 and PCIe v3 are now
posted. Prerequisites select their published code and binding patches;
independent MAINTAINERS-only additions are not needed by this DTS stack.
The bindings and drivers can proceed through their subsystem trees, with
this board series following once those dependencies are available.
No offload-specific overrides or personal LCD package are included.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Changes in v2:
- Remove the board APB-rate override in the same patch that replaces the
  fixed APB provider, keeping the DTB buildable after every commit
  (sashiko-bot).
- Clarify that the existing watchdog node changes its clock provider; it
  is not newly introduced (sashiko-bot).
- Validate the Almond+ DTB after each of the three patches; final tree
  contents are unchanged from v1.
- Link to v1: https://patch.msgid.link/20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com

To: Fil Dunsky <filipp.dunsky@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Kees Cook <kees@kernel.org>
To: Tony Luck <tony.luck@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Fil Dunsky (3):
      ARM: dts: cortina: Describe CS7542 peripheral controllers
      ARM: dts: cortina: Enable Almond+ board peripherals
      ARM: multi_v7_defconfig: Enable CS7542 board peripherals

 .../dts/cortina/cs7542-securifi-almondplus.dts     | 342 ++++++++++++++++++++-
 arch/arm/boot/dts/cortina/cs7542.dtsi              | 321 ++++++++++++++++++-
 arch/arm/configs/multi_v7_defconfig                |  16 +
 3 files changed, 666 insertions(+), 13 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-peripherals-dts-dfa20a5c748f
prerequisite-message-id: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
prerequisite-patch-id: 104c6fb668f30ac8c2c5b3b6c524c18caa8808c4
prerequisite-patch-id: e7d503348cbec7558cd084162133f8e34df1c1bc
prerequisite-patch-id: 1d5770db02b983d012f6c58806fbf3f5291a06c9
prerequisite-patch-id: 8515988ae3509d4289a8d845803353f5ed412982
prerequisite-patch-id: 6c0137d52f201d8ec085ee6cc7b2d49af15583d8
prerequisite-patch-id: f591d13e0d394441e3cd28149633c1133bfb79ee
prerequisite-patch-id: b3dad3ee0f7e08ea9e942fd83f3d2a06ff8fb164
prerequisite-patch-id: 4fdf33aaedc9ca7f4d7a59b48e4ae55c497462e4
prerequisite-patch-id: 9b4a468b7b74861017ef533ba0a5574bc14b212e
prerequisite-patch-id: 1f232c94dd3fc0d862203b7c0c1449e6ba9a6859
prerequisite-message-id: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
prerequisite-patch-id: d1aa6857057b1e76a68ba14d4ea17352ffa90c7e
prerequisite-patch-id: 1fd32c18f2d4a7700528bf45da72b30b62744171
prerequisite-message-id: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
prerequisite-patch-id: 7189d6a033e0e18b87b72f3f9b49a1c71a97a2b8
prerequisite-patch-id: a70999df9edd8fbb4ea81ca7e782aa89f52b4a06
prerequisite-message-id: <20261124-cs75xx-i2c-v8-0-d0800b967886@gmail.com>
prerequisite-patch-id: 1ccad6a46a6b3391a0244edbdbc4949b6614e271
prerequisite-patch-id: ac9ec16b2e96d5580a256823ab1330098380ae32
prerequisite-message-id: <20261121-arm-twd-wdt-v9-1-8118d048cfde@gmail.com>
prerequisite-patch-id: e8d416021a43d45b01ac95877bb1c42a46d30153
prerequisite-message-id: <20261124-arm-twd-clock-notifier-v1-1-62933570ae27@gmail.com>
prerequisite-patch-id: 66eb0299dcb45847726974805c675a856fea149d
prerequisite-patch-id: a1ab9eca32a27a52346d613d4611f152e1b2a638
prerequisite-patch-id: 65d46bb3caaa8518ee561f65d3f603ade396fff9
prerequisite-patch-id: 55dc4f1e91fc85340c4422438225f50fdf636799
prerequisite-patch-id: 7a88732d8d9fdedf26b0729211211d2f74cccc17
prerequisite-patch-id: 7fbe9405265ef3d1ec62811415a46c0061afd7c8
prerequisite-patch-id: 07e805007e8d5e0c1d06e50a9ffe799f9d61bb35
prerequisite-patch-id: 5301369d9b5f76a650c5e6c01b63bf10634e9ffe
prerequisite-patch-id: 5e86fea092879a6940e7f098db6cd346ac515837
prerequisite-patch-id: 49ea479e68bcdf4bb792e712130b22cb9cc2d378
prerequisite-patch-id: ebd89772638cdde67204f9859648c532072f8f64
prerequisite-patch-id: 3602aa81630ee3e18d9302c23cba59d483ea9d81
prerequisite-patch-id: 1713798d81d3140dea98cb980a4bac9aa22a3780
prerequisite-patch-id: ead1ebcb89468d700d8875693f405460d6d5a2c8
prerequisite-message-id: <20261124-b4-qca8k-two-byte-header-init-v1-1-c644025b69fa@gmail.com>
prerequisite-patch-id: 48d4c38319b803b22db91864e3321abdb6ab32b0
prerequisite-patch-id: 9d8ec97932a1c3a4c41dad64e27364d395e8821c
prerequisite-patch-id: 1b20a366220308b1864130aaef2a53816101f442
prerequisite-patch-id: 0a571205b2bb84488ae379a21ab734caa9cd15a6
prerequisite-patch-id: b08306581bf5dcd6d5543b00ee75105dc67c2355
prerequisite-patch-id: def18de6690ce96865075b4bb64cb8138b9f8cf7
prerequisite-patch-id: 6a6f50f93cfd1e3df21d74b525ecf4882e5c057b
prerequisite-patch-id: 8dd7f2d65905ec5c2dc0bc66b56301048436a6d1

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


