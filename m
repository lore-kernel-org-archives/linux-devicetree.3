Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCB415F2E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341189; cv=none; b=anpfxiym/yOfmxFYK4DwjA5Mk1FjyXe5dDiswg9TB4hFYinjPe+EJcB+rRRZsBf+99flY7GQg7z18FwNHZSisXWfeySTAGdt55+Sv+yWVDzha6j9aml3rZ0ndMuqD4gQMd0xWfnu7enM81n2QzoQwDlpQ98GjanJPLr+jeq/r0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341189; c=relaxed/simple;
	bh=4+rXxErrr0q0oe/pIJrzNoKRXGu3yCbSPfSqNwHQ1io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sw/Csffk8n8JpnLHm274lBtYrIoTC1k40LbU8tEPF/VTDziUqsAj2u5aIujrqhEmUceiI5QKiI7b/831o8m6I72LfdLfvtOL+uE7eBolWPsWY3kuGBE91dTPyXRtbSbS3D+0BLMvGzmvimqam92voSijaBaA58KCJl4vej355C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yw/LOsYU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yw/LOsYU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACD81F000E9;
	Wed,  2 Sep 2026 09:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788341187;
	bh=2fE/5+0c71TBob6KlVBiw58kL01Kk7SpNGs96Hif5sE=;
	h=From:To:Cc:Subject:Date;
	b=Yw/LOsYU9rZRq3c3QuAhZJwZ9R26LI7cFbyMDC1Gu06Yc/eWYc87MFcuGUrANq2oS
	 QKG84pgrjPBjLuvLrzCIiOkWWtuPGAxRZI5KBzJNnaNI+BmSbiXrQxYj8iwYdkB8Yp
	 McMKNTSqNOQkqBbd5vNT419/nN8V//WtDJ71dtpWtMDA2rEaTB1WeOtU99z0uifH/o
	 CJBDRCH8uw2BZuoZVB2fWki7eN1r6U0BGzC4DR/C7KDBHIAwHxjtS47LAmAVKYfDRh
	 xIxdkAr3KBL6IweAvrq4DwmGyCudPUnKSWwQc6StLOqlUdY+7cz556GyCNWSMuvVj9
	 I/VsdGudWY8bQ==
From: Dinh Nguyen <dinguyen@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	rounakdas2025@gmail.com
Subject: [RFC 0/2] arm64: dts: socfpga: clarify MMIO vs non-MMIO nodes
Date: Wed,  2 Sep 2026 04:25:49 -0500
Message-ID: <20260902092551.488203-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi DTS maintainers,

This letter will try to explain this comment[1] regarding the eccmgr node
not having an addressable range, but it's children does.

I am only including the bindings and DTS patches for this RFC to
hopefully not confuse things more.

The eccmgr node is an interrupt aggregator / irqchip, not a standalone
register block. Its INTMASK and INTSTAT registers live inside the
System Manager. The driver reaches them through the altr,sysmgr-syscon
phandle (syscon/regmap), so the manager itself has no reg property and
no unit address. In DT terms it is not an MMIO device.

The children (ocram-ecc, usb-ecc, emac-*-ecc, sdmmc-ecc, l2-ecc,
dma-ecc, ...) are MMIO devices. Each peripheral has its own ECC
controller block at a unique SoC address. The driver maps that block
with of_address_to_resource() / ioremap, so those nodes have a reg
property and a unit address (for example ocram-ecc@ff8cc000).

The parent still has #address-cells, #size-cells, and ranges so those
child addresses can be translated to CPU physical addresses (identity
map). ranges describes the children's address space. It does not give
the parent its own MMIO window.

sdramedac is the exception among the children: SDRAM ECC registers
live in the SDR controller, accessed via altr,sdr-syscon, so that
child also has no reg.

The children stay under eccmgr because they are interrupt clients of
the manager's irqchip, and the A10/S10/Agilex driver walks the
manager's child nodes from probe. One shared IRQ domain, many
per-RAM ECC blocks.

I hope that explains the layout of the EDAC controller on SoCFPGA
platforms. I welcome any feedback.

Thanks,
Dinh

[1] https://lore.kernel.org/all/20260724-fragrant-baboon-of-temperance-c5cdc0@quoll/

Dinh Nguyen (2):
  dt-bindings: edac: altera: agilex5: document new edac support
  arm64: dts: socfpga: agilex5: add support for the ECC manager

 .../edac/altr,socfpga-ecc-manager.yaml        | 85 +++++++++++++------
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 69 +++++++++++++++
 2 files changed, 130 insertions(+), 24 deletions(-)

-- 
2.42.0.411.g813d9a9188

