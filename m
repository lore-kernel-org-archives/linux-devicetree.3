Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795042867;
	b=boankik/6hj22fJvTmYzfHUu5zM5iK0rJDuSPFLoVXiPRiJR/kELVYJhy3mjqXBgSAcY
	 4komuXSeBh0wyVgMiIB7T3uUA1bQhqjCndOG5Mr68LQr8TUIq3bY7iaPowKQJDVK3vDbI
	 J64+GjBr7t7Mr9VeXS9mKSUnY8F77yErU/o8SvukWFLNTnQdTn/D36mtkxN1Ood+yHX13
	 Taaf/3b4MAEaKzLSBMLNvg0KBPQKziC/ILlRUIUN5nyVo8+qpuO+fmttB48Pt/M0kfUvk
	 MjWUBdV9G8DzIv4I+dKCItlvo8nqFddObhrWZxfbJOzqO26N3qDPPBDeO9Sig6E05ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042867;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=;
	b=ZbcWmxK+RtN5p6Gt+HbP+daYI/XSOEMnYSYd93D9xqqPACbS8v+s/CoYaurmbB1h9xeF
	 2SLRFeY6ylp+CS93MmZAxpsf4sdZpf2gOzs7JdXOh9Zlp2MwLR3tQLC9t8GYTeXe/kuH0
	 FMgyFXeWJxJcv1MxJtrsttRz60AgtBk5pDx07PWYp91CropYZZ5Gg/0jEfvhJ6XqjyTk0
	 Nde+I3Gv8SwJfBGI4Lw94BOh2/NVYDGs7qWWmKUCjxfBWbItKENTMUO+HMtryEg1cUYrp
	 CFr5uwjFQjsYTqu9tgrV66eJMLWgEb2H489TfPjBDlviE5n6gWNaw897dDdcd7+dD9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0LLTpoJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0055606A320;
	Wed, 18 Nov 2026 23:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z0LLTpoJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795042867;
	b=TxYAPgWRxVrwph/TaeniTXqu/olZCwwVBmxvIh/nqtlUxXcGT2aicZcTmX658JYVrkP8
	 wstKSMONoSupMupE5NVWtHGYtUP1jeQlTxjfi11x7cxCxpe8/MWv8M00LQOUZNhKXN/Cv
	 Hom8x2cmIT+JAzuQLZlqsAAgi7ftyxDQEr+JAjLoI2iNVXJXk+lWoUcNtbIqdqFDRzwv1
	 pjtSUrUnD8SctjIj8YbjSGItP6Ye6fMqpQIoc8uHtiC3rJOniBm/QZn4635+bzATVGn9u
	 Bub1uhA4YKeMbY72PexlDZY9YaWdv5jW4DVM3SKePhImwimHy+/skgxqRubum7xnodA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795042867;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=;
	b=Adc0Q67+ieOTNHrlfdVivrvSerypK+g0DVwXjfJXlMoNJVHmwdB39TO0RdyyACpGxiD3
	 7N4OWoNIa+6B1UMRtZk5RW9KPvc9dAik8dWnauwJoZDA5LcwA5HuiUXPo7mQegQahaOle
	 Ybc5ISrrpmQqVBQlADka4j22YndvfIT1IVZ0B4Dci3Q6RKUtNIBm8xngB6/7worQoHYBr
	 bcb5TGL6OtjNgfvbvRrXS+IPZwWqdEn37uwuNlgSZ042XqQZ+Mr/yLsBPsdjQT4b4/ETH
	 tVsDGDNTuDA9TA9jzSW1fix2M7dkJtkJK/SCXacfb0aZ6/bTN373il5gK5Jhs+lpGFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F03A21F000C5;
	Wed, 18 Nov 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795042867;
	bh=XKF4reDlniKlCY8ZnfoFYrLEAXRDzaCbY1fijRI1jvg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Z0LLTpoJmE4wiRNTudtV6TVfccSt2qKZaKXlajJEgK/za7yAp9/NWEmCclEmfLfhJ
	 F1Slxcn16vnqOR6UwJ19q39/UKl5VWWzI/uJyrLim9ortnUNKPxpIN12Dz6x+v8JAY
	 99FSGEutW7UQPw+39fgXVLHHy9dMU5yA/MRvXaBan8+1zfZSonOymTIMSNKpIJ96ru
	 Ow35KXUsyRRlbzyn+BIQcSDCRUYus0LDuFam2LVnN9iAKVCXjE1ofljkAljQYGr+la
	 dsBv4cG1WWwlP/SiX4ROLAmC9oeSPqpWr4s9rYaR/SPZw61k26zg1WwHb7Frg47QnQ
	 HzzNzO1xsUmCA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7D9374B004;
	Wed, 18 Nov 2026 23:01:06 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 18 Nov 2026 23:01:05 +0000
Subject: [PATCH] arm64: dts: rockchip: Keep the PCIe power of Kobol
 Helios64 on
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
Message-Id: <20261118-helios64-pcie-always-on-v1-1-b77dcf4f01b4@iav.lv>
X-B4-Tracking: v=1; b=H4sIADAu/moC/x3MywqEMAxA0V+RrA00ZaiPXxEXHSeOAWmlAR8U/
 93i8izuzaCchBX6KkPiXVRiKKC6gmnx4c8ov2KwxjoianHhVaK6D26TMPr18JdiDOiNpe/cGNe
 1DZR6SzzL+Z6H8b4f+VBGr2kAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1592; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=csC4RQd6YR8LhC4D4T+ae3/8hKPMoykDjDiK28IYahI=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGr+LjGjXuGgGi0NcgRJibYyX3z3oA2z4fntgBZHDpxaGAz22
 Yh1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmr+LjEACgkQMpeVi+pfeQOdGQEAixzq
 JcOSwoAS3wZZDLkOiE1x//+RWLpYCBczjYcLrKcBAJYJLXShTf5deewKTgzhNeB8iCyJzBXRINC
 Jv3xurRoD
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The JMB585 SATA controller needs PERST# high for about 60 ms after its
supply comes up. If PERST# is low at power-on, the chip stays dead
until the next power cycle.

At boot pcie_power is already on and PERST# is pulled high, so the
driver only pulses PERST# on a running chip. On unbind the driver
switches pcie_power off; on bind it asserts PERST# before it switches
the supply back on, and the link never trains (LTSSM in Detect.Active).

Keep pcie_power on, so that a rebind resets the chip the way boot does.

Tested with unbind/bind of the controller on v7.4-rc2 (plus the pending
rockchip-host link retry patch, which did not trigger): 0 of 4 attempts
without this change, 8 of 8 with it.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 76beac38699f..aba8a0c87edb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -230,6 +230,7 @@ pcie_power: regulator-pcie-power {
 		gpio = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&pcie_pwr>;
 		pinctrl-names = "default";
+		regulator-always-on;
 		regulator-boot-on;
 		regulator-name = "pcie_power";
 		startup-delay-us = <10000>;

---
base-commit: a9d78db32fe78bdbe7c66ba77cb7dbb729b885de
change-id: 20261118-helios64-pcie-always-on-a021bf706987

Best regards,
-- 
Igor Velkov <iav@iav.lv>


