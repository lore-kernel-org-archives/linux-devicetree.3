Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797097;
	b=Zv1wArUFQQvJ4Ugvz0caGoChAbHLZWWjuREsO/Toos3y7OlPRyVx0tl8rZwrt9l/NJBZ
	 1LInfl2u0v9ZJMgM1DgEmo8HJf4k+UfpoPOBASlt+h/XY9vk5Afx/kMMrs9AA43uxwhrl
	 T81ikhWsSUts2qSU1imN+vwaeZmdr3ild3y2r4V309uh5qFFcJY9AJK6JKJIiTxkKqO0d
	 /fxo/ILvPjDeuZ+947sf4kqXAk0XhiwsJWajPNhJwuv8f7g2ente6wsYuyLSLCzPiy9OA
	 JVOdQ4FqE0a8i1UTNH0Hll29AYbv0O84QYmofeeubeksOaFjVzlSojSxo/9ogIzDIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797097;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Subject:
	 Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version;
	bh=06M8OqC+3vZou9FRKaJXlEK5ftpTbthLPodwzAfAWwk=;
	b=jXXBQfdiexmn67fYbEwJtLY/US22tOAQcaAbui3OxqK0KUzz4GdJilSP+0MwC+XINvhI
	 pifoLoUZCtoY3iZpuyLh7lOwwIkDOYhJr+q2/3A6f8OXLwykkn2y0qfTT8GnUW8WxIacu
	 rD3TR4gxsCMot5rDeUvBgNFcOQoLDYFet2lS1i3MgvakvJif+2wMubkXNXET8rFmEDyXY
	 LypcMVTjqVPrql3T8YsLFpFMFCXaMMhPH+b78uZCehL3dn5oandlr2fMRGgOP5lfCl3At
	 K/8uzPTQ1mETgBa92NDwk4Ts6/t7YyTdDxA2w/1Oy6YaVzNSoyWW/3zqnykf9KHs0QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v27gT64T;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0779B606A330
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0779B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v27gT64T
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83EDC1A09F3
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 12:58:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47F0060778;
	Wed,  4 Nov 2026 12:58:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4172C10329258;
	Wed,  4 Nov 2026 13:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793797093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=06M8OqC+3vZou9FRKaJXlEK5ftpTbthLPodwzAfAWwk=;
	b=v27gT64TQ4nLQSrJIi65fpGFmgqDc+QHu+ruZeGNfkGxoK/w3N8z6J25a3dCB/Lbqgwhl9
	lKS1n/ivyTDsavGSep17boTQB7dQ/wWN5jCM+lqnagMgCyn8P+kmHcsQ6mrUfkwRdLr+sr
	DsOAqmFd/BghAVqvWP1UrQQqebNP6nIv9VLqA+HoRAj/yGk6jqGG2sbKy6NVALpzVYSjmX
	iyhPTytf6dhzhr/Dee36XYbaqKs2lDPXcIGMPnDX4cqp314oygb92eku2k0EC30SHHfdK/
	3Wy+3yvo2HI2HpgAQ69jH6hsG3YPBtlC/DKbHWwDtz5bLCcbQHhbRNrCJ2BAgA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v3 0/4] irqchip: add EyeQ5 PCIe MSI controller
Date: Wed, 04 Nov 2026 13:58:00 +0100
Message-Id: <20261104-eyeq5_msi-v3-0-2866f732cd38@bootlin.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBQFr9KwFgMUEF15D2MMpb8WY4tCJTZN7
 y7UhZq4nOTNvAkF8BYC2hUT8hBtsK5PUK4KZFrdnwHbOjFihElKmMIwwl2cumCxklrTWmyJVBy
 l/c1DY59L63B8c3hUFzBDDuRFa8Pg/LicRZp3/7qRYoINl3wjWFMJ0ewr54ar7dfGdSiXI/u4S
 f52WXK51mVdSqKI5L/uPM8vA5zo9vIAAAA=
X-Change-ID: 20261028-eyeq5_msi-86aa1d590684
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Hello,

This series adds support for the MSI controller present in the
Mobileye EyeQ5 PCIe ports.

Although the driver uses the standard MSI library, the EyeQ5 hardware
has several specific features. First, each PCIe port has its own MSI
controller, which snoops the MSI write TLPs that the port receives. A
port supports a maximum of 4 MSI vectors, and the memory-region
property gives the base address of the doorbell window. In addition,
the GCSR mode selects the role: in root complex mode the driver
registers a PCI MSI parent, while in endpoint mode it registers a
platform MSI parent. The last specific point is that the driver uses
the snooper domain as a chained controller on one GIC interrupt.

The series adds the binding document, the irqchip driver, the EyeQ5
DTS changes, and the MAINTAINERS entry. In particular, the DTS changes
add the two MSI controllers to the EyeQ5 SoC.

I tested the series on two EyeQ5 SoCs that have a PCIe link. One SoC
acted as the host and the other SoC acted as the endpoint. The
pci_endpoint_test kselftest passed the MSI-X and DOORBELL_TEST cases.
The MSI test uses one vector because the controller does not support
standard Multi-MSI. An additional test made sure that each MSI-X vector
uses its target CPU (using affinity).

This third version is sent shortly after the previous one because all of
sashiko's review comments made sense. I hope this driver is now in better
shape and that no issues remain.

As a side note, I am a little annoyed by having to add an empty function
as an irq_ack callback. I saw that a few other drivers do the same. Could
we do better?
First, I was thinking of adding a flag so that in handle_edge_irq() we
would not try to use the callback if the flag is set. The drawback is
adding an extra test; I do not know if it is really sensible here.
At least we could provide this empty function in kernel/irq/chip.c, so
each driver could use it instead of declaring its own empty function.
These are just suggestions and they do not affect the current series.

Grégory

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Changes in v3:
- Address review comments from sashiko.
- dt-bindings: drop the interrupt-controller, #interrupt-cells and label
  properties.
- irqchip: use handle_edge_irq() with an ack callback instead of
  handle_simple_irq(), so a vector is masked while disabled and a second
  MSI is not lost while the first is in progress. For this one, I ran
  some tests to confirm that the issue was real (it was) and that the fix
  resolves it.
- irqchip: convert to a platform driver because the node is no longer an
  interrupt controller and is no longer probed by of_irq_init().
- irqchip: stop parsing the label property and use the node full name in
  the boot message.
- MIPS: dts: update the MSI nodes according to the binding changes.
- Link to v2: https://patch.msgid.link/20261102-eyeq5_msi-v2-0-4aa3d3608064@bootlin.com

Changes in v2:
- Address review comments from Krzysztof Kozlowski, Thomas Gleixner and
  sashiko.
- dt-bindings: drop the num-vectors property (all ports have four
  vectors) and simplify the example.
- irqchip: use the fixed four-vector count, add lockdep assertions, and
  dispatch through generic_handle_demux_domain_irq() with a redirect-based
  irq_set_affinity() callback.
- irqchip: drop MSI_FLAG_MULTI_PCI_MSI (standard Multi-MSI cannot work
  with the address-based vector decoding) and MSI_FLAG_NO_AFFINITY; add
  MSI_FLAG_PCI_MSI_MASK_PARENT.
- irqchip: keep vectors masked during allocation, mask all vectors and
  clear pending status before installing the chained handler, and reject
  of_irq_get() returning 0.
- MIPS: dts: drop the num-vectors property from both MSI nodes.
- Reformat the driver for the 100-column limit.
- Link to v1: https://patch.msgid.link/20261028-eyeq5_msi-v1-0-c464752fb55f@bootlin.com

To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Benoît Monin <benoit.monin@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Gregory CLEMENT (4):
      dt-bindings: interrupt-controller: add Mobileye EyeQ5 PCIe MSI controller
      irqchip: irq-eyeq5-msi: add EyeQ5 PCIe MSI controller driver
      MIPS: dts: eyeq5: add MSI controllers
      MAINTAINERS: add EyeQ5 MSI controller entry

 .../interrupt-controller/mobileye,eyeq5-msi.yaml   |  76 ++++
 MAINTAINERS                                        |   2 +
 arch/mips/Kconfig                                  |   1 +
 arch/mips/boot/dts/mobileye/eyeq5.dtsi             |  22 +
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-eyeq5-msi.c                    | 453 +++++++++++++++++++++
 7 files changed, 560 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261028-eyeq5_msi-86aa1d590684

Best regards,
--  
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

