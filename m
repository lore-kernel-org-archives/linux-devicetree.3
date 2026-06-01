Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B71933DEFC;
	Mon,  1 Jun 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323361; cv=none; b=p9DSZFZOtSCIjVpSJCoGrgEdNh68xMcjQAjsQXmf6T8HlbHgWvVsixYxCec8vSiEHbLrSGzccRHA00cCP1tl0lz72TFD3KpjTCLYfuYhjWij174fD6DCtPOsrV6JbNPjaDJlXJhOEVUN+OFDc1VbaAFhtoSDlOqF9yP5SHNO4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323361; c=relaxed/simple;
	bh=DkikAVnGKjgORZv1zSE8GU2JMUsgiMIzW92OS9cpAWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUIgdTgqNW5zQWCGdf7ZlvF6YR/HW/1T0NlivGrI6Ylo4yZaUOvJv/cdz0xFDv6DcENJPMZW392Z9M6GuMqzY7KLFXN4+NuNYKO58gnBoiVHulJuhhVp4/DhGJQEVCPQvMtGN+MDFwULkdsYMk0goUxnz7g2ZIUmbjhNwg6K3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cwOFAqKT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cwOFAqKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323358;
	bh=DkikAVnGKjgORZv1zSE8GU2JMUsgiMIzW92OS9cpAWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cwOFAqKTxBtdxPm+OE3h+fY2K8ab3TygTZagINNtjnQQX4Nmvev2uzqJhqQ4M+vh+
	 7Kz1lQYCl2A79zYCI75Wafx0CHEEQ1fb1FeOPYtxmDZdjDQovq/T8NS5s+28S/6lCf
	 3aUZL+N7uOdoBZSzDFb4FPADJQvccTYUhEZifDNu3IZ4HiYxEP9fDH8oP3zro7HZOt
	 2ws/TA5vwnkMF4WYtdvZ2Q9+pl6pX2afBZiBMKYmmjvqnjPNmwr4o2EiyTAlUxXXyV
	 UTcS2zDDJNhQvRFI2l7h8axXX+4LFHc+b2zClBgdodEIiiCctbHQvhim30N0TiOeJm
	 s8PzI5MEVIt7w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C38A417E0DD3;
	Mon,  1 Jun 2026 16:15:57 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:46 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-common: Add MT6365
 PMIC supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-2-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1563;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=DkikAVnGKjgORZv1zSE8GU2JMUsgiMIzW92OS9cpAWg=;
 b=br6iI46Ej/vA1ql7cMF+1KrsEEYXK6UJ3bxDFT63ouElWb/vPrikd5zpUo9AUVhVpyY4pjI5S
 xaDacGAwGgjDgCB33lcsNB4r1MaJe/zc356HcaunarcoYjcZGGVzdXi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Mediatek Genio 1200 EVK board integrates a MT6365 PMIC, that has a
number of power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board common
definition include file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..7ea45b6bc663 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -1170,6 +1170,23 @@ pins {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&reg_vsys>;
+	vsys-vcore-supply = <&reg_vsys>;
+	vsys-vgpu11-supply = <&reg_vsys>;
+	vsys-vgpu12-supply = <&reg_vsys>;
+	vsys-vpa-supply = <&reg_vsys>;
+	vsys-vproc1-supply = <&reg_vsys>;
+	vsys-vproc2-supply = <&reg_vsys>;
+	vsys-vpu-supply = <&reg_vsys>;
+	vsys-vs1-supply = <&reg_vsys>;
+	vsys-vs2-supply = <&reg_vsys>;
+	vsys-vmodem-supply = <&reg_vsys>;
+	vsys-ldo1-supply = <&reg_vsys_buck>;
+	vsys-ldo2-supply = <&reg_vsys_buck>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0

