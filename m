Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686471;
	b=VoSIjpE1SGEX70Dp94Yb49wF/2YjlT3yOEIHcG38vh5Vs4CqGz02SjtHrKx+sAlziXqA
	 /DcG0h4pPtrlTV10zmHL4YgbVrQbpQKtNdAkj6+nJKsfxQ/VMFgcpPc+pIlsU2c5NAmTi
	 3YI5pvuOmDOg7n94UW1brFHj8VwHS4hRcp2CQb1FgWLFWGHljoX97KonSYnaBYkpOW8t9
	 /MVn4B7NpkI8KjSmc4a+85pn7Peub5qTaBl7qPlKPuzdLOBW6vHkA5rQZRwuJV+OpMfj7
	 r8u5PngyP0VG3nGi2EALVOu7pzf3s59mwqr+MHSL+t59u4WkNuM5vUUV1NVl8XSaaYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686471;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=qEPjAwBmVmF4gTUW0dYtxO6t6BHYbR+dTRgY27TYGHI=;
	b=cFSEZRZWPCGlhMzf9xyCRyKw8c77F58xGcQnayi1oMK0tI6xLaByaiaRa0hLtVsdd1S5
	 2tHQfjDgtBGgCKZk1VVNMee+bcuY2jIIScLtU1ojAigyAAVBmkF0K7+KIXvrixn8isL2q
	 Li7WWj7ZgI75jGzobADZukbzbZ33UUGAJoIohsGwOL1t/RFlip6KPv2X5y5DD7iD8rHK1
	 BEoGXqgRNybC2QhSAAQw1peY9Y8Fo3m3EyW8w/bqil6dOG6t7QJZ+qCCjSzZMJCyh+wb2
	 y00M8l01ua6ZrGMHz0jEzjoUtglO+lNwzVrtK2D66ZKwAkeq0Z6FElyPnNDSMjI5qpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjMou0C2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46707606A323;
	Thu, 26 Nov 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjMou0C2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686470;
	b=JvRPfkn01cv1o1VgEIIDYee4ritS86qz1XKgPy85ZwgqIDsbVC7kt8Lb3xMpbDM3rTen
	 sTxWTqJiuurguyvIgKUyds6dpASWTtB49EneKZJDSif6gdjlpBngV6Alp6GFI3swi1YVf
	 wBZHVzdwnPOPEe8mQWhp9pWbKWXAz+kqN+mtNQ/PdAvJA3WgVjxvnVRdZ1tNYTkxis84R
	 czgv0oyfDYJ32F1Ik/+uo04K9DGI47rTG8KsrT7FXAffKKyVgeydI7dfsBJAyUUoDCytV
	 s6+vIFn/umgQHicIwPn9qKRihZ4Heg/n6B0klXp/P4sDCeEdTm6gTyW/OCJLTSDEGXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686470;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=qEPjAwBmVmF4gTUW0dYtxO6t6BHYbR+dTRgY27TYGHI=;
	b=AespWEyU0qk/wAVsBnZzwaO41OvRsZFoR1GN8Niv7T0gpQKp9Qoy9IYlGmIlkaSw3m11
	 nuk1TXf+08Wx+w4jtnlmi7xgHuKzchvZr4xdmQ49SIThnXxqzQHZ9p/lvNptdnbsIUKGa
	 hDnBhkcEUlDubI5lD0aAyfD4026ZP9lpvjZqM5O3UTzT2LJALkhuzBcaidGSKSekbPBU0
	 YXh7TcWf0f7xwK03jK6ArrRbr7EJYpLoQ99EBQPPjyzba4eE0nIZrfPuXJu7YZPYEYJb7
	 swURjSEBZsZrpJgvIQpsvY4wyWnpW/Prz3GFW+rdqUbckzYh6UIgZ2GOF8zZd1uMSIQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB4811F01565;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686470;
	bh=qEPjAwBmVmF4gTUW0dYtxO6t6BHYbR+dTRgY27TYGHI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=PjMou0C2ehM+oU81YtZ3vrA0W4m2W9dZODoJ3UdxEvBuDx6X3OlXE4sKOTWrCIGwq
	 xmkogQJDWRllVAtwzekzbQWUjp17ZsRTwQdEbxPxOd/qs9ctbX+u2pPY8m5MmVSyAI
	 ASVGoYH0lKET4mwXhRbdjOpkXxHP4JjCcog4VIjTwntJuQ8HQ9UPjgXV/85dmqGFlr
	 Av/kNssPKwgHOhQT1pv6Icd6vfUaCSe2GPF9znNZUITkYnUzTx0q/MEst0tRGmQA/W
	 3kSRktssYU8fRXQXj+drHx3GcT3Ay4726JXPJGtFpLblif2yqSlTN3QQcQeKCAdTX0
	 x8VhiqsmZmfTw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1BC6F4D3AC;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: socfpga: agilex5: add support for
 Terasic DE25-Nano
Date: Thu, 26 Nov 2026 10:47:34 +0100
Message-Id: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBAAf4Xs2Zpuy0M9+R+GQ4EF1khrWiQa0
 n+34NXjJJOZFQJ5pgCXbAVPCwd2NoE6ZNCOxg4kuEsMSqoSEU+iI1UIa6wTMu/NWTdFSSgh+U9
 PPb/31q3+cXg1d2rnLbAZI4fZ+c8+W3Dz/nUXFFLkle6wRI19Za7DZPhxbN0EdYzxC/+66i60A
 AAA
X-Change-ID: 20261118-de25-nano-04fa93b56e10
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=1919;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=hT7xxaLvHFgWA0nTSeZrZRfSJUG//t51lZyFRrNe5Uk=;
 b=JtlkjNR9BUxMu2igXHNkvR55WbhFelaxhJMezHh1DuH2w1atuYcvwhJLsifX9/ATEg+FRTJI6
 cF6o15JEVuYBqDZBzLp/BSK2QnGkff1kwJ5qHPKie9VFfRCpVEYVNgF
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com

The Terasic DE25-Nano is an Agilex 5 SoC FPGA board. This adds its
binding and device tree, plus the service layer interrupt that the
Agilex 5 dtsi is missing (Stratix 10 and Agilex 7 already have it).

Altera's vendor tree (altera-fpga/linux-socfpga) carries a DE25-Nano
device tree too; this one is written against upstream's dtsi, so it uses
the SD6HC sdmmc node, and it only enables what has been tested on the
board.

Tested on the board on v7.4-rc3 carrying the same device tree (its
decompiled DTB matches this series' build on next-20261117 apart from
nodes added to the dtsi since): boot from the microSD slot, gigabit
Ethernet, USB, the HPS LED, I2C1 with the onboard accelerometer, and FPGA
configuration through the stratix10-soc FPGA manager. dt_binding_check, dtbs_check and
dt-check-style --mode=strict are clean.

---
Changes in v2:
- dts: the HPS LED is active high; v1 copied the vendor trees' active low,
  which inverted it (James Clark)
- dts: enable I2C1, which reaches the onboard LIS2DW12 accelerometer on
  the HPS's own pins (James Clark)
- Collected Conor's Acked-by on the binding
- Link to v1: https://patch.msgid.link/20261118-de25-nano-v1-0-473d16131f7a@gmail.com

---
Alexandra Østermark (3):
      arm64: dts: socfpga: agilex5: add the service layer interrupt
      dt-bindings: arm: altera: add Terasic DE25-Nano
      arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano

 Documentation/devicetree/bindings/arm/altera.yaml  |  1 +
 arch/arm64/boot/dts/altera/Makefile                |  1 +
 arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi    |  2 +
 .../boot/dts/altera/socfpga_agilex5_de25_nano.dts  | 95 ++++++++++++++++++++++
 4 files changed, 99 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-de25-nano-04fa93b56e10

Best regards,
--  
Alexandra Østermark <alex.cramt@gmail.com>


