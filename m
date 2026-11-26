Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686478;
	b=d+pre3tYEyswQm1FV944iDcK+vGg/94iEiND6SnOqZLWP5V7Ty7K2Z2qS3L4KyFZeRbU
	 PWjfYT8jSiSHI9fzRpNEVXbJP3asLAdVCP8q82iqSVvDRoLj6PbWDKYuzns4q2CQH2+XA
	 7yFFFCzntxKcLViCABJrUjcQkUuRDdOz3p+nWWcwDbiYI9hPjft/F1ewTnFNggsTnKfSA
	 HKi4xAII8GZh2M4N6wVe+KGz0Al3uScEy5ZbyWywtKpaW857rMQTPT0YTVdIgtXCk/6iO
	 P9YUekjSrOtKwAP/Jv/1Hz2XAZuyizaEa43DRoUQUS3vxzQ8q3TWt67mUVNMN/zTouA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686478;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=KXdiQ2bomx1F7LkLcQF4/nxPOonQa6X8qEViMqkk1yvlHV2FOdoZFjGt2HAS32ND3IFy
	 7RgfAsIXbDD78joVsf1GdHlLJuFJ0VI3P7ptKLyTWfDkapwiVR1OjiTph8NDj87bhxnrg
	 4YiEJ/K0OFefB5ulDq9YKFanaZClofaDhXf+6EqmZ44La9Ke6L51c8zFa2d3gd51Qe0hl
	 3sfig/FUI9LXTjdjX29VFMTM/EUes7sq363PZab9u+GJhaHnf1oE1cBgSA8neHW3dkkSu
	 L0Mkf+cstfBt6qHl1uO5LlrSAFg65gAmfnJmWv7zsK0y7MmG+x6ccxkwUAwSiYfxRTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG3r7kTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDA2606A323;
	Thu, 26 Nov 2026 09:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JG3r7kTa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686478;
	b=SpskddrOHa7gyyhKzVBfUhXcFi+kDALrfOiFA6L0d3YGQg/1xNta0uL5OCy4MA7yFG4v
	 0CGKJDVVg16GPQQCB0eExR2xi1rjzLJ3NPCA84TZyLfF+M2waLNd1LzPtTN/wA+UMHhxr
	 MV1KVYF5NCwV7HBNT2kmYraR5+AjJDBquz6d1z7VBeNesHHgTFdzYJtLOAYFT3YOC535I
	 w+Ump97DG8FYaLWYMihONEnWShTme/ya2hZi2T8OEr9ufVmND46aPgtRMekGd1xNyv3h8
	 BDyhrZr5k5KSlrEw2hAiXDU2fxHmapxsTiLpfDyuIKrqjRaE14nDt3bV4+O0oQufv2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	b=lxM9mwk240M94FAHx3tXNwvI7o/mrLhfOuJLXhBqEyv1tJtvdwovbJUi1iMjrhrMoDKX
	 m0qSU/BEqwYx0FA2fRYzmTrbjkLjeRqDd9tnxBXkvE8AXiIQZyng/ayBM8hE/MH650n7T
	 9zckg2MiC1UAyHPK6AqXvhM0VLgX7pmHbpAW5RASOhwVGSzDfNIWGZaXc1WsUFchcJAt5
	 Sq1Kj0Jucf+zaor2MXqOkpJYO3D7cIe3gRUyxXrQMlbZymna5xFPoH1GJquGOk3/1SBl7
	 SAFJ7t7gOSPJCVGoaM1RnlQoJZMcJPrR/PEj7kZNgMcDraTm6rcC8H0+DUGOFTaIeIw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB4691F00AD3;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686478;
	bh=GUDae9cdn+7jukw5FaNzRwyibyvz8i01iDH/hVud3Ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JG3r7kTantY+00tQEj5dBxq+RBw9Ydd9jSTs8cVbGP0ZsJ4aj7DX1TfTN58F27in2
	 fHgTIoI4oS26tBwP4aPfBwoIHRu5Q7RZKwizjRPUOxnfASM6YAfWpumie1qBxj8VsO
	 3gDVw32xKoXXmVFtmlBOei5J2/BAdJTdPcHVToRRKZ+7QHc9aqxA56I9EwyVcxHV/M
	 PK0yQQmA/8KJe4f4OZ69hO5N7Cq6T9Ns7RIE+J3QGlDn8f95aCupqK21/Bpw0Vvnsr
	 HKD98kufCydoy+rS0trG98z/gaJaTzwGwkXRantLig/gCgEWWOYcSK+uRub2cVsj95
	 vH9wanO0jZg1A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E7C84D3B8;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:35 +0100
Subject: [PATCH v2 1/3] arm64: dts: socfpga: agilex5: add the service layer
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
Message-Id: <20261126-de25-nano-v2-1-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=1261;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=481VP81WZKi/ygpfq41EOdbsewe8WlT8xUBo1hTQ0dA=;
 b=siF8qeeDcuYhyByZQU49qFw+m5FjuhcwK4321DzEy9c7Idk4Xy7SSN++kWqW45d1n9g80W3ue
 A0CddYjUDZjDRVFqhqGDaBb98NYc+WEZzquCDtgdmYRCWhBAm8BWKJM
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


