Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794947365;
	b=BQ8+rgzT33fn9DSuMOYWLYKfRiIhYCZ8qhOLhOtwb+Y8IG76FqJstJNktt3JcN+sK/Df
	 vTBKlAaCz/1utwcetXzLiDMUdgvLlGu4Q0hEdWALwdnZeUZ8GzmYy1dZES8hsEKMb87Yb
	 smJgXmfvCkBPw+KPXEwYd9iQySUphJXICqYnVDGUELuxL4D2oMeK6CsiEbKdDDlNs3Jnv
	 Pg5JZ93WETTrtq59Pb4dllrhU3CO0ZNLJivvmMzbjcQgliyzr6zadG4B4I3ArMiQUdU1n
	 TA7j0uxCKw6y0m/YG5eHaYdqjnKTwDxxmtWsGM6DF1bGqtU7xzhLNanvi0CnWBTaslg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947365;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=kuT1jUSZgDhtr2WmlJqs1PrK1kvVfFzXW3J7lrTXQk4=;
	b=s1uIVpAqIf5Vzzs+6NAAtzmHlTTNQUWlBaS0BDtxcucp0V4bklHoFF9/9RwEQknH8TjR
	 f5oSHm1TcYNwak9dk36erEUk9j8FhAsaQV6Og+pwJraweRBkZES48s2MZ/X3S19xft8L3
	 D7p7RzB15o+VhGVsymQqRjBEu/dy93TvcXkIBGrsHNf5lzB1c668oGQC7G3EvdG9yaVkB
	 7GpOWj7iBhwCWKrkTMq0fnV6D0F4cWWU5HenfFv7bZ7xtaF/ouEtksVEN1+HAE50H6bF/
	 TLKQxJQWEc1o/54raB2pt3VNgykazVILaU4tWQv9vQQzJa8or1/jqrUhDSf/0c07QZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+3NM26x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F75A606A31C;
	Tue, 17 Nov 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k+3NM26x
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794947365;
	b=xxgGGMVpHRXoTMUFsHcD06rGN4g7f2njc1E5PUpsk9T3YJk7k2OU+Cb1ZwH9jwE3VIfS
	 SxJZ+kvc6Vcv/yuuj8wezkwhQNJA72V7w3OHGOXeBJGL4EwOoCPD4Rb2hH5ds5Qn/a9R6
	 WuuUMbTcNosuznXDaP7R/QGdxO++4m732COPhR6HPdn/FDG/c85EgGGnznYln8py+TrZs
	 CyPQKTDk9zl7i8Ca+c+SG8I5TI4crCo1O190MawDUxzLp6tLAkFgjNn0SWu1yijfiLoE2
	 TBEEO/hTvct+DFPcmeos3LZJf0ayyAHI7TeQdVZoAcecpUrFnP6uba42Ut8cy+U+4rw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794947365;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=kuT1jUSZgDhtr2WmlJqs1PrK1kvVfFzXW3J7lrTXQk4=;
	b=qS9dhBQIfYAYhlwDirpe9CUxfvrBqfLI0DQgF1VJ+k8TWrSbIx8kHOnWje1npNH08G3c
	 yfaVBkMSJkxIP5E5K6Y2PdoTi6NtgVpXUio6/wzkjcgitvQDfjJ74Cd8zPMdptsbc9hjk
	 zARRyrC09bwfxNlwKPoriwtTNoIyD3vHb5Ad5R7d3nYo6LaAjtiOpCdsBXsi/jOMKIVkZ
	 O+dw6tCxg8JgqzdLxGkjnMw3ycCEikR+lfeN52Bxxdk+/oRLhpTFTbltCUCoCNX09GpY5
	 dSKK84mzwPUmsNXtLkMRUo44K78KRwpJHYHTsi4/cyrfJgybifMnmrhOj8AxETrv1TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E4241F000C4;
	Tue, 17 Nov 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794947365;
	bh=kuT1jUSZgDhtr2WmlJqs1PrK1kvVfFzXW3J7lrTXQk4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=k+3NM26x70DG4atohje34L23qqr8QbIq8O9E2G9I9XCRsHb0i9hl5y4J54VqAxUyu
	 EWSlZmp3mBmZltUU+ym7j+InIhrPEXiXwGS6DMivgqhl4GlyjZRjVfRqs3gr8c45di
	 C2C0iro5/sfcG5vh6/FM6iv2pTcTB2hQuYSB0cAhbPcoTU3+g5swgFtEXOpSA3k4wq
	 eyxF4tf87iELunFsi6Rrta9s28ND/ZrkvlNk8JIRx8jwZJ1TJHp8FaaXtOtSFaQHzQ
	 7wSfbOr0QIMxmiwZDpvldFB0nNdZIvKJaBUXPQWpetYpnlYK/QzK0QHCUmmZWNPix2
	 R3B6bpsKqxLEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A70C64AACC;
	Tue, 17 Nov 2026 20:29:23 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v4 0/2] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
Date: Tue, 17 Nov 2026 23:29:22 +0300
Message-Id: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3eRic9OKCt3MvJJk3SQTIyMLA8Nk80TTFCWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgBuAcj5bwAAAA==
X-Change-ID: 20261015-cs75xx-intc-b422801c7a5d
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794947362; l=2974;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=5DGTPtGJ0bLQY9cW8J/jjjVRm6Qqf1C6PZXEDXQnRY0=;
 b=/UM+q7j2DjvHEsRNIF8LsNzVArfwJGlJpE5rTIrLtJu+j+3/s2/IrzfYqSZg2mk24EJ5VmfIS
 Yl6rtC/M0HtBZ47Ms8C8TdinK/Jf2P3sLt5N5xrW9abRkWHRpm7AbUO
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

The timers, GPIO banks, I2C, MDIO, SPI and a few other low speed
peripherals of the Cortina Systems CS75xx ("Goldengate G2") SoCs share
one GIC interrupt. This series adds the binding and a chained driver for
the small controller in the peripheral register block that reports the
level of these 15 sources and masks them; each source is acknowledged in
its peripheral.

There is a second status/enable pair right behind it whose purpose I do
not know; it is not described.

The driver used to be part of a series with the GPIO, I2C and watchdog
drivers and the device tree changes. That series is now split per
subsystem: the driver builds with COMPILE_TEST and does not depend on
the platform series [1], which is under review separately. The device
tree nodes will follow with the other CS75xx dts changes once the
platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels and was checked on a Securifi Almond+ (CS7542), where the
GPIO and I2C interrupts of the board are delivered through this
controller.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
Changes in v4:
- rebase on v7.4-rc1; update the platform reference to v7
- split out of "Cortina Systems CS75xx: interrupt controller, GPIO, I2C
  and TWD watchdog" so that each driver can go through its own tree; no
  longer based on the platform series
- declare the variables of the chained handler from the longest to the
  shortest line
- do not wrap lines that fit in 100 columns (Thomas)
- collect Reviewed-by tags
- Link to v3: https://patch.msgid.link/20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com

Changes in v3:
- rebase on v6 of the platform series
- Link to v2: https://patch.msgid.link/20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com

Changes in v2:
- rebase on v5 of the platform series
- Link to v1: https://patch.msgid.link/20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com

To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Fil Dunsky (2):
      dt-bindings: interrupt-controller: Add Cortina Systems CS7542 peripheral interrupt controller
      irqchip: Add Cortina Systems CS75xx peripheral interrupt controller

 .../interrupt-controller/cortina,cs7542-intc.yaml  |  57 ++++++++++++
 drivers/irqchip/Kconfig                            |  12 +++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-cs75xx.c                       | 100 +++++++++++++++++++++
 4 files changed, 170 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-intc-b422801c7a5d

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


