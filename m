Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A69C3EFFDB;
	Fri, 29 May 2026 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068692; cv=none; b=EYcJ0rYQVVYcWWOD3Biu0DopmIeV+gN8GklHsdZ2Czp1iGg73NF6LI9mcgdzWbsdpeAGHpW6NfSAVDj9Cf7PSEd4pARAj4yl7PIS8hqGlPNo/zZmY77Iow4PJ7Cjr60La6FIYqzqAtrGhVIbVbfPcfkkXZdstHonH92LlGiKZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068692; c=relaxed/simple;
	bh=Wc7i4dF9ygiTQTaQ/gCEQkz1kc+L4fUW6J/05ngPp7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hB+UIW1btZ0sstoaE+mT6vTwQTtitbb3D2+4F0h3qY4vaU72XH1DlSNxfY1zVED1g96Ou3BqGaYJT3E33h0po91UujJfex5LktE8ieeZ7B0SlUv8i4zpNWunRyEas+UWRG+kSDSi9b9NySxcSUnm94NOCGcrbOE6Uq0furixzGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boPVeON2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boPVeON2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB91DC2BCB3;
	Fri, 29 May 2026 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780068692;
	bh=Wc7i4dF9ygiTQTaQ/gCEQkz1kc+L4fUW6J/05ngPp7E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=boPVeON2KW3rK93sT25Ly4iFGSKdlqTWm+ENdICl1VZIZECcCNk+w04jdJo+WT2JE
	 VHE4zAcbHxfUUXjBDKj7ldrmAVMGyNT725OjVO/BzhT46kCgyEundpAlcG8R4wg0k2
	 dLznGWGI3SfRoKLfvcUcDeFpzmjs++MgYHkKLCoC8x4dj9hC3ijkE5Lf10LaFi4SAJ
	 PFW5PbqodBas3HGxToHcEeUprZFRevoTYRCAmMqoQc/Vcze7LHPOslW5jAG0GRL6lh
	 G9MyiYK+egdLwWCGt3vVdqa0GZzaTtw6+90GKxCXgPKeIe72KOIx7JpIURgY9VLcnb
	 XitH9p1ATQkAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E182ECD4F54;
	Fri, 29 May 2026 15:31:31 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH v2 0/2] describe PCIe ethernet interfaces and alias
 ethernet0/1 on NanoPC-T6
Date: Fri, 29 May 2026 17:31:23 +0200
Message-Id: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf4X07BpaLBBP/ofhUNpFVkkh20o0h
 H+3YLx7fJPJvFlEQCYM4pwtgnGmQKNPoA6ZsL3xNwRyiYXKVZlrdQJ+FLquwcUAHAfA2IPDYJl
 aTCGYgUwAK9HJumorq3ORpibGjl675tp8OTzbO9q4bW+NnkIc+b3/mOXW+yn1f8pZggRTdtYZX
 RbGVpfJsCNPR49RNOu6fgA3sv5v7AAAAA==
X-Change-ID: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=Wc7i4dF9ygiTQTaQ/gCEQkz1kc+L4fUW6J/05ngPp7E=;
 b=owEBiQF2/pANAwAIATteP+Oex+3pAcsmYgBqGbFSPnLISoKIp2YOdD3mlPG61DJUOBfi9o1sC
 thxlsVlILWJAU8EAAEIADkWIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCahmxUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDMACgkQO14/457H7emM8Af+I/ztaHtuESg8K7PXiX+dQ+qkRAk6nPQ
 btd0McxQmrWGrJ57QoTBbgthgPt7E7fbINDputVTOkME8dq4b+6MsSN+VrtbR3HDjbDe6VC2daD
 w7zGtsEVV5yXRmLZllu6R+mLVvoilpLL534zYGM4N/QEGH2sIShyq+HI8vgS7V3fCx5fz6yFMzF
 aymwSBhN6/t1EV0UfTGisW/WOIbvxSIimh2vlNLvI/F7rXvgzG874uRx25yDtWylzIY3JpQoGpn
 +620KC3UsuZNwQ/HTlUQ+QxRI5Mqb+iM2PBGEN7RSM1M/SF18cPjMuv2fUG/0SRjoi0/J2/DUm0
 EkyPm173ZMA==
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
Reply-To: ricardo@pardini.net

This describes the two on-board Realtek RTL8125BG PCIe Ethernet
controllers on the FriendlyElec NanoPC-T6 (RK3588) board and aliases
them to ethernet0/ethernet1.

Many Rockchip boards have on-board RTL8125 PCIe NICs, wired to
pcie2x1l0 and pcie2x1l2. The controllers were already enabled in the
board DT, but the Ethernet function nodes themselves are not
described, so the kernel (and u-boot) has no DT handle on the NICs.

Adding the function nodes lets us:
- expose stable ethernet0/ethernet1 aliases for the two NICs, the
  same way other rk3588 boards alias their GMAC interfaces; and
- let U-Boot's fdt_fixup_ethernet() patch mac-address properties in
  at boot time from its ethaddr/eth1addr environment - useful on
  boards (like this one) whose on-NIC EEPROM is not pre-programmed
  with a unique MAC. The kernel and U-Boot then agree on the MAC,
  which matters for network-boot setups.

Checkpatch warnings:
-  WARNING: DT compatible string "pci10ec,8125" appears un-documented
-  WARNING: DT compatible string vendor "pci10ec" appears un-documented
Both are expected. "pciVVVV,DDDD" is the Open Firmware PCI Bus
Binding spelling, where VVVV/DDDD are the PCI vendor and device IDs
allocated by the PCI-SIG (10ec = Realtek, 8125 = RTL8125). It is not a
DT vendor prefix.

If this is seen as a good thing, it would apply very similarly to
the Radxa Rock 5 series and others.

While at it, rename regulator vcc3v3_pcie2x1l0 to l1, since that is
what is actually powers; since only cosmetic, I did not include
a Fixes tag.

---
Changes in v2:
- fix: pcie2x1l0, not pcie2x1l1; indirectly caught by Sashiko's review [1]
- while-at-it: rename regulator vcc3v3_pcie2x1l0 to l1
- Link to v1: https://patch.msgid.link/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7@pardini.net

[1] https://sashiko.dev/#/patchset/20260525-rk3588-dts-rtl-eth-describe-dt-alias-v1-1-a6fcda563ac7%40pardini.net

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Ricardo Pardini <ricardo@pardini.net>

---
Ricardo Pardini (2):
      arm64: dts: rockchip: describe PCIe Ethernet controllers on NanoPC-T6
      arm64: dts: rockchip: fix PCIe regulator name on NanoPC-T6

 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260524-rk3588-dts-rtl-eth-describe-dt-alias-c1ed187b7c50

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>


