Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795195484;
	b=fE7UDmJNYPWn6QSs8DeyPqfOeo+YCo+tz+1RMMPLvJu9jB6EOBRO3uiyNhclySZIqRHm
	 YVY4ciyoZXTlVrlVEr6AMGCeVL6jwYRIMZgnMrViWGgkVwP9u8sOSc31X8tt1K8HDTdS8
	 kxXwYUMRQOI44VhPb5vt/GJVnAANv+HYakNyE0BQz/nbkOSYa5F2hjUX7TouB1m1F9EKQ
	 M9xmA7hSG0yIiE6hCEP4QBSwqhkyn9SRARlALfDCCSJiE/fwq21Z07zJCfhPnLSYroSEA
	 y6Ak6tSz5xJMxFYx9gY0EhdapMrYXrMbJRFZM503T/+4LRVOEsLlP6Tzo7/dSjqxrDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195484;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QXYJdA152pHgZMlRQU/299usnGolOL8AepHjOYJb/+s=;
	b=QVhW2nXl3JAHsmHULJLZqvjjN/U9SSjTngpeSztL9KLIR5B/pI84QGcOQdJoI14v4nQw
	 D6VX++Rt04nWOTblB8e4JaI+xnUWTP/bV8way5n4HzjRQcceah/AJoHfWqf78108b00em
	 vZtFB5IgHOuux4h+JorEHM3JkvabMD+BxEqrksEibL2+LEb86roq+J2+Da4cPgtlac70P
	 xlUE5X8GG9xkLcW7npvE9r67nDFtxkrtlErMzkU6AIQkbteQEtTiyEPuk2xVA1zjt7VB3
	 jyTRTSLjp6viH1A5XXzsZtDmzcIHuxFkTcH3G2jecmx8Zvp9n4o7GLXuqojX/Ek+5mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N6/48EPX";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2BD60A2613;
	Fri, 20 Nov 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6/48EPX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195483;
	b=aqHfR0PjzVa2l1+LpNUZAWRAsLOUYrFjQ9QUpHbBhwUUTOUs4HSsJc/G78xoey7twSoz
	 aAYT/Wd3bqKK5m+Obp1dmM+4T+krURIhAqVUg2xGNmCXy1f8eWdfDUsoLdOb+dC4LK1z5
	 myL7npuqyCDDiW+uaiOd1794urK0UsycQ5gmWKsqppn+VQSW2pnHJcdnh3fimSXNYnmDL
	 SeAEgr1+Bw2z6bJ6tF7d3n5ro3Bfli38D1PyP+0cjBED7Bj02gSm/CzVLpoQHpVl5Zk9a
	 yhdyn7UHKb/XkWqX4qA2xNPSHXXnlSbVyKC6bVpipvFBsuFCJnfKBJhpuWF34xCADSw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195483;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=QXYJdA152pHgZMlRQU/299usnGolOL8AepHjOYJb/+s=;
	b=TidDBRy0Dr35by3no63ubARaX9Ri/D4pmCRMFoPsNajTnOkGGQ1nhUaTXn22eEEQqbsZ
	 FwxXq/2gF0qIjSqMy6gtJGn0ADZcln97d66FDD/P51L5nF/PqahJsAwEcSX5BTpKHGeo+
	 SFT1sUTq04QGZsX0CHrSgR6n1xTnh4cJDpzHYG4QTjGIhdaZ+6TYj6Sx1yFSu7P+ScQ1I
	 h5hOpgBIpxwaSCmR479Qz0FcP/3E9Kb5eNK4ZqDMPsN6qBf1F6ME7VQjQGZEvlGEI/luR
	 piMEOPjLxy5yNIJ+FLU8N3NOP2WLgYwvq9Yz1PsKZ0aEzlI1F883oXwXJ+g+YBXQ2Qw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4E3361F000D4;
	Fri, 20 Nov 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195483;
	bh=QXYJdA152pHgZMlRQU/299usnGolOL8AepHjOYJb/+s=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=N6/48EPXekRudRsrdgM4gtdN//nzT1QP21ltlXEE8OZp04Vbn2KW0lQxFOKttvwBe
	 Tl3mi2sEBLQxgC5ub8CXLRoGwVZvaWIhoQsQLj8oKqZlTXLcKO4Lcwm3PeKZcDUs2h
	 s9wHvdrqV/Xc1CgBoOZXJnZDLA/XziHX0uy6yxRFjXVM5z2Trhvtf89gmbc3WqBClV
	 epf9qevrFywfxrpoKJr0qLDmrB111Z9yGiq0eowQSX9v/FsObJbA9f4So7G+aZb7N1
	 cYKXiqM6/Ip0STNCuB+KsHCqpx4wWQvt1N2zOxB1GfLHzme3YSO2vAocsMFCtGrwuZ
	 7y+Ypz1UtILyw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C0B734B889;
	Fri, 20 Nov 2026 17:24:31 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
Date: Fri, 20 Nov 2026 20:24:13 +0300
Message-Id: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6DIBAFf8XsuTSAIKan/kfjAXHVbao2YA2N8
 d8reupxknnzVgjoCQPcshU8LhRoGnfQlwxcb8cOGTU7g+SyEFxo5oLRMTIaZ8dqJWXJhTNWN7A
 v3h5bikftUZ0cPvUT3ZwSyegpzJP/HneLSt5ZFsL8lRfFOOO2MGWba9Rtfu8GS6+rmwaotm37A
 fSrCmC4AAAA
X-Change-ID: 20261015-cs75xx-intc-b422801c7a5d
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195470; l=3764;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6s5F6PHiymxzxW+rL7fIwtxuLDz4meWHzapd9aAnc3s=;
 b=4nwTsAVdteY3xf5e8Jv3WzoYawRZBobIBYn8+NIlklxjg6rZKw7RKqbOStG0FZghqQ6QslMnr
 t0x08OMg+XMC45c9hthz/PoYrg2027bpnIyEHdVaL0aHiJObC1CzJ3L
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
subsystem. The driver depends on OF and HAS_IOMEM, with no dependency on
the platform series [1], which is under review separately. The device
tree nodes will follow with the other CS75xx dts changes once the
platform is merged.

There is no public documentation; the register layout comes from the GPL
vendor kernels and was checked on a Securifi Almond+ (CS7542), where the
GPIO and I2C interrupts of the board are delivered through this
controller. The v5 IRQ flags and normal initialization path were checked
in RAM with PROVE_LOCKING; MMIO cleanup on initialization failure was
reviewed but not fault-injected on the board.

[1] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/

---
Changes in v5:
- replace the ARCH_CORTINA_ACCESS || COMPILE_TEST dependency and
  architecture default with OF, retaining HAS_IOMEM, so the driver can
  be merged without the platform series
- build built-in on ARM and x86-64 with COMPILE_TEST=n and without the
  platform series; check that OF and MMIO dependencies gate the option
- require HAS_IOMEM for COMPILE_TEST builds
- mark child interrupts as level-triggered and keep them non-probeable
- release the reserved MMIO region on initialization failure
- Link to v4: https://patch.msgid.link/20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com

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

 .../interrupt-controller/cortina,cs7542-intc.yaml  |  57 +++++++++++
 drivers/irqchip/Kconfig                            |  12 +++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-cs75xx.c                       | 107 +++++++++++++++++++++
 4 files changed, 177 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-cs75xx-intc-b422801c7a5d

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


