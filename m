Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795028836;
	b=3CIWf+bKvNrmHpndLOgkM/mLF5akb3JENQmkZqAawFAQIg2HXq5uXvShXzBXYMoKZI+b
	 KZnWbBCNCtrZ7slfPGhT04L8jWI/C41Nw0O1TcdhFuYzJhY6EvNQws+JOz6VjvMJ0Mbdq
	 GynB5uPPpLBlzjTL+kxTMF3l6CKGqjWbpgxyXtsvgxmpIK6CB1dS+Ux1uE6wM2ChPB4tU
	 VwKL646BWz5D2w+L/BNuybnO7Nr+KO0Abf+PzLvzEUOoUXZDrvlgne4CSoNOh9kZQUUKm
	 Q2z4IPvyn66xLh4vX29Yzv0Hd+0a176sUAum03pCrba4kWFtnBoboX0JWuzmdTy4fbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028836;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=c4pkC/iKBL+KsMpHjcNP+1OrVHwHJxNui28bsCHW2LcheclE8WYCcEhBEIqPO+kDbZgI
	 ry48x0rcB5hii7S1enNnR3efjDsAgH/qo3Vr/gqyeCiFBGijIL1VwKc7fOpyCd6SxHdcT
	 7v72KvlL1VYQathDp8bhp7jHAOg5vdnraN5O51cPgBXSub17BW+y9fuQQXiz/T+AeTd7N
	 ZFEDNUW9MKdwSKPkYeDPun2FOMiXPHsue5lcstN+vQ48i8evDGyutIjyMaau6Ol7O5sTe
	 Ocg37al91PkiFtviCbmsfW0utdew5wU3US3XZX8ji9UHcEW0W2FclG1W5hgFLwoUyvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlMdNTNu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CD960A2606;
	Wed, 18 Nov 2026 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TlMdNTNu
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795028835;
	b=cMqwmDWDY5TDZh+wIwZHQyRRIrOYRNP2bHf0RsDG3GKh1i/R23qc9ONRAqcI6oV7zDrE
	 n5GoF5rd2XAIW3KXbCuFfO74FUKZCHmTuKsMf8ZH46BJDt10Mlg/JZF+wiZXyg8QxU9/5
	 DO/TFzLNM1405JNS0B0/+mNw4aVP1J0bWyYRFnQuEh0Y0ctvFn4/SXcvemGkFC9FR6r/b
	 6AjxCm1NevEAMws67NKLUFmZS9vh2MtLyguac5oNmEDCsvOAqQQ1i5Rq/PtPCHmwTjh4N
	 obqFtOYRHnvkSrr1tPJh60DC/Wq3Ahf6g5oO/M1tOcdNoB2w5h89bviFsSmKZsGcarA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795028835;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=oUZ+9QkDrK4Hh3IN7HDymtbWUUEqZoSGiUmWsVwNXOnAvXEcblsdBBCqH8TL1EBOrsEn
	 I3e5S45Sl8yfC7nG4nqWRgfDDa746C588hEzICaN/F2bZf37yp2Fxums/h6lkPBMLA2sr
	 eejskUY5tWYPJ3f1ENc07k+GoQ7lZWwJrjL2nFmQi7PH3GRnRSmioAfvVr8O/0YV7BI2c
	 hDy1zRHICGt2gQOUSArqRNiNwPzvepNvfB/KgW6c82Ph4Ef20UaXNXF0+Mqxbk75U8cp6
	 i44fecHynhsxuzZfNT5KIy4yOI0hLOsVeNWj/D4f8v7m9DH54+xpEkVXlDiFad/F1og==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EE8D1F000C6;
	Wed, 18 Nov 2026 19:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028835;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TlMdNTNuqm4Bax8mGtgSPtQsF4fJHKYNky/NknjWX64UuksZie34RO+UcGVOWLscZ
	 rpQc5cyoivk6M87AiYMF7+Qu6lXHflJcOIQ2sXjzUY2rzK29gsaQjQrjbO8xbFvFqW
	 wXdleYigMG9kWqo+m3JDOiBz1ArM3UhxUj4jKlse9krX3f7WhiVUM4PRRCBWTdVyHv
	 67Wceizklb9yQJvVH/dHCTgNjxEgnryEEqgTltCimq/DUXhftFa4hwJv9wSXuUqThM
	 eQBsBquHxXZZEoGF49yF5/C4pnvNR1kb+PAgvvDtyLFxWVZBRc6Ahmw4g7vf7bhRys
	 0XCBB5ijaj7jQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF1774AF2E;
	Wed, 18 Nov 2026 19:07:14 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 20:07:13 +0100
Subject: [PATCH 1/3] arm64: dts: socfpga: agilex5: add the service layer
 interrupt
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
Message-Id: <20261118-de25-nano-v1-1-473d16131f7a@gmail.com>
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
In-Reply-To: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795028833; l=1261;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=481VP81WZKi/ygpfq41EOdbsewe8WlT8xUBo1hTQ0dA=;
 b=VA25FgGLIXjC3WvEziZDi4ZpKCwgpHfs9xJ7Wq5dLe0HaxyXjHjcSn3f98n6+93GhmrRyNLDB
 FNeHe6JWH5YA1tr7qZlpiEvVdV9FHu3L8OYTluGlB2sDRoFTPzmjXyi
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Reply-To: alex.cramt@gmail.com
Content-Transfer-Encoding: 8bit

From: Alexandra Østermark <alex.cramt@gmail.com>

The SDM signals completion of asynchronous service layer requests on
GIC SPI 0, which the Stratix 10 and Agilex 7 device trees already wire
up, as does Altera's vendor tree for Agilex 5. Upstream's Agilex 5 svc
node lacks it, so stratix10-svc logs "Failed to get IRQ, falling back
to polling mode" and polls for every async reply.

Add the interrupt as the other SoCs do. Tested on a Terasic DE25-Nano:
the driver registers it for sip async operations, it fires
(/proc/interrupts counts it), and FPGA configuration through the FPGA
manager still works.

Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
index 161f3d4bb..d272cc4fd 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
@@ -84,6 +84,8 @@ svc {
 			compatible = "intel,agilex5-svc";
 			method = "smc";
 			memory-region = <&service_reserved>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&intc>;
 			iommus = <&smmu 10>;
 
 			fpga_mgr: fpga-mgr {

-- 
2.56.0


