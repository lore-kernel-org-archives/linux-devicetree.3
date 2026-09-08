Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5A51121C
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860941; cv=none; b=Maxz9vWIK99oC2IhdFPL8xM2dYoJPZgwhgO+MX1Q+FyEnDUEiihKa4CAxPuXvx34YBmSNV+uwL1DstC5J2ge2bgrCNTOFwsWpiWq5NC/eZn4K2aTev5T473PdG6VRQa30XPeSywpyI8PwViOurEWAIBU5e6WNcn/n1vsHCRTI8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860941; c=relaxed/simple;
	bh=Di+zPYQrmx8YPR59j7x1NjBpZu1CpEk8kjenbyRJxG8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B0VrL6PwDs+1rghKDtHvbvXaYiNXeKpUEVScuAYu1RiHrkoamZVq50HccsLKJexQiMjhh7Sig6aCSUkvSH62GJAFh6kMEozR9n+DHUggq2BgtGYqdJUitv5MO5tnWVErNWc6MtLY9ejakp8VfTKxq8WerA3u31TfRvolEY0s8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=wcOQjHty; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="wcOQjHty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860928;
	bh=ThDT4tVj+YPojmgqj2lbcYBtKEEAUeWWPDjR4MEplgU=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=wcOQjHty++n6m2Qu0sGL1yibSofFhyllchD85jhJZpsrbhdNHHN9GOexrBo+EOKg7
	 uA5lzYPoggGiuLRDyHx7wVPU0TCK1WpyWOI/dNWtFC8ShH8e3SQ9RiyDq5oM8r8C72
	 eMficOnTuDzIBx6T8cgdhQTu6feoyit6fMga5Lkw=
X-QQ-mid: zesmtpgz5t1788860923t90e5fe56
X-QQ-Originating-IP: qSRbQhLZ1bovcmOa+a9gCuzdjVIHFFNrdZXd0PpfhGM=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15635221017366424496
EX-QQ-RecipientCnt: 23
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: [PATCH v2 0/9] Add SpacemiT K1 USB2.0 controllers support
Date: Tue, 08 Sep 2026 17:48:37 +0800
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXZn2oC/32NwQ6CMBBEf4Xs2SV0FS2e/A/DAcpWNkohLRAM4
 d+tJF49vsnMmxUCe+EA12QFz7ME6V0EOiRg2so9GKWJDJTROdOKsD5hGCrDnYz4VDiFmrC4VI0
 1pI9NriEuB89Wlt16LyO3Esbev/eTWX3T/75ZYYaWtLFUcE5U317ipiX9FVPTd1Bu2/YBjlrKX
 r8AAAA=
X-Change-ID: 20260812-b4-spacemit-k1-usb2-97adfc283d58
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Peter Chen <peter.chen@kernel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=2304;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=Di+zPYQrmx8YPR59j7x1NjBpZu1CpEk8kjenbyRJxG8=;
 b=RD4yw5F0Pyp1Qj+JzsXRr6wgCoagoFelv/EpLdhpqhHNSdFXA+Jv68ADUaBHx4ZzsgTC79/HS
 JEBrKktHRY5AfsGXmUjUNADFx4eM8m5Ku1M02trwG6K2UywQ8ukhPc8
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: N+fE1vV13phx1UCwICzT0xFAyB1uNrchKLTGJwuehR3JooEdHvEsGOLH
	si3JuzRAxEwp64gW4j/X7i61kA+jzAbq0qWiYC9xtJsR7NUdRtqXhmm1LQ4SC1x79JPI7SV
	ZaJr1DqTLL8mMjQ41zfl3tRqzzTU33nDsZPPqQ8uR9zL9Xvom+dnxr0QBFABvN00qVvrH5a
	Je2Buq5DbRPpi1icI/Wun/AZjetWe47UcUEMAXSHbzrkz29G2l8pORcsHinOi3QhXuTkwcc
	bpr059KnR63hc+Ki8ac3AwofJJXvLDDuhV4sB1fZHZ3vVFs2EQfHCSHHmqN/XIqJvy+ksez
	hkz6LHNeLFg4+fwCdrDL1hosmNU562Y7BdVkKTd4vHAtUdDX6HYG+NAQhaBb+5JrylyAltd
	b/t9iKa/c2xamAwJvBgQWV2qGsGxqKGhjdjX6Qs5scv2OItofid3/2b0nPTsMm7aRhyQAy9
	+Vew8CQ1pOzPkMumwRFfD/SkGLWukPgXprv0PrOAfp1AqevstUsJnwxrJ3ReDyxGxJM6rxv
	QpPo9w6hs6JWQN/fMDdyaZLY5EYoX20yVy2wD51kX4OfW2wkMa5+FKixUTcpMX4qsjZ5hel
	ox+HNr5SdZryLx+cp4pp/6qwtR85rW3rxOtLFNuPeEiCYVNQJ0TusQno1QLz3j6g3p5XpQf
	OhrG0+u6A2AmNOUw2NkLpIXsi+13lRcUdjEoAssOdm3PRaJHO1TSgGa7U+SiyrASrYEztrj
	LiqfDVPpBfL3aMQ925wVmKby7trr/Avay0Nf3PExjkdGjJ0Od+QwGzuTXM/ih8vlk4t1sG4
	a/7+gGQHvcKjGvHvhxxrSA/X2H0H8xEEqjGT1qTkQ26Q2ZIUs0Qidn6if6zhMFhRLhBvKr9
	ty5W2B2xyW8fb+/eoWJZyxYzUjBnfBKnKUiyVDXzBfQBgFmpG/BtXJ7OWAijK46GqtdvQ5b
	PkKaUvgT8jEDiMEno/FkuD8rrXoDqyxy/bPBK7PO6wXinV2YBNMFEBJCLt6JW6JKKS2ZZOn
	oe6BEYJXDakAFQx3lcKU4jGo+DlfIb3puw50nNl/4nqjlMRQZwrqIfFOnGh1DfUYRXkzUQq
	b0QLBX2v3IqZPjGDwNXqn1DoG0cLNQkJ2K4CeKvs44jhlJiu5NIPoTiuXCwqPcTNdkT1W73
	OZTg0nskq8tzHTiD9wN5sRkOV4SP84nhK5zPDoYTRtYPR/d6rrvuiWWTNbmIj22XDS+x8I6
	MGqQjWUs=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
support, but the hardware has no internal OTG registers, the other is
Host only. These controllers are compatible with Chipidea USB2 driver
with some flags set and reset control support.

This series is based on 7.3-rc1 and has been tested on Banana Pi F3
development board.

A self-powered USB device/hub is needed to test the host function of the
dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
cellular module e.g.) is needed to test the host only controller.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
Changes in v2:
- rebase on 7.3-rc1 and collect tags
- reorder the usbphy and usb nodes in k1-bananapi-f3
- add constraint for spacemit,k1-usb2 in dt-binding
- add OrangePi RV2 device-tree change
- use devm_clk_get_optional_enabled() for driver according to sashiko's advice
- Link to v1: https://lore.kernel.org/r/20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com

---
Junzhong Pan (9):
      dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
      dt-bindings: usb: ci-hdrc-usb2: require clocks and resets for spacemit,k1-usb2
      usb: chipidea: usb2: use devm_clk_get_optional_enabled()
      usb: chipidea: usb2: add optional reset support
      usb: chipidea: usb2: add SpacemiT K1 support
      riscv: dts: spacemit: add USB2.0 controller nodes for K1
      riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
      riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
      riscv: defconfig: enable ChipIdea USB controller support

 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
 arch/riscv/configs/defconfig                       |  4 +++
 drivers/usb/chipidea/ci_hdrc_usb2.c                | 30 +++++++++-------
 6 files changed, 121 insertions(+), 12 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58

Best regards,
-- 
Junzhong Pan <panjunzhong@linux.spacemit.com>

