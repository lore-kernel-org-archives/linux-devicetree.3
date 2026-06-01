Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816B1A683E;
	Mon,  1 Jun 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780323360; cv=none; b=cVVEQDF+pC7qcIv4tpKGfMIhzhrum3rbVMGAqqmRapd1TiX6LkwAgVvTQodbbc4aVSPK4nPS86pWH2BpiPRZIbj49lz5RQa/ELP7nvArKk6XXQFU/8zhlx2qYpFYEAC6f0fKVpHkxU7dLIvie89krXoa2KOiRUynRHWPe7RvQ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780323360; c=relaxed/simple;
	bh=yN2Kv1UwlljiT1zJCR+lRKh6mTllX7hmGBUK3EGGdr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeRpb6K3WRHW2KQWk8bifb8rtqlMBcvBl2oBlYZfU54yIpG/wTu6cvzoANqiDysrFA6N2KVq/z95kK13rsWketOVLCmEDMQnwqODebuSoE2g69kwKjL8FSTTyKEpFFQUehqAniUO84/ivgAuPdcGqPJUmsnRQDMRHctD+VHmGyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cO4STWIt; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cO4STWIt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323357;
	bh=yN2Kv1UwlljiT1zJCR+lRKh6mTllX7hmGBUK3EGGdr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cO4STWItf6Ri1oD8L59OFsX4YDhHn5bDjWfCKvbrDAHrXx+5Yk18DWgiEegsh42d+
	 m/VInw8oPbmAMk9bM7C1KJkFDjv521CZaN3S03+6Ry2qO9TMkN7v5eeuPXabLE2E5R
	 aDQiSlyK+kyVxo3ltE09qqeKUJTbpfnQo8OFKM8+/Ps0QuKlEmqqw0TxeEuXQ1Re73
	 nqGsBFK6AumYJ2YlRyDmAjLrZigbIlz1e7o4gPWDYv/j4O5OGCPSvTafTlBE4s9rkS
	 vKFjctAJBIFCinzAuU8e2tjlHB8tKnELkBu0YC9VFwsrSBQ/5Z0xVmnLJQThLAnMhJ
	 XQfJiSPLI2gKg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDBE317E0D87;
	Mon,  1 Jun 2026 16:15:56 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:45 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8390-genio-common: Add MT6365
 PMIC supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-1-05750080ba59@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1598;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=yN2Kv1UwlljiT1zJCR+lRKh6mTllX7hmGBUK3EGGdr4=;
 b=L/EBfFNc8pLBvOhNfPNbpebh5fmz+kXrIZvQAP6jJt6kSj2FR7vvDsB9txW9KPfr5yQvcI168
 9V5F3LXPU1LBn+x9t6mOTjq5uS9Q1HJJxjduG6o7rk8VEVr2t9UPIMA
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Mediatek Genio 510 and 700 EVK boards integrate a MT6365 PMIC, that has
a number of power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board common
definition include file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..442205cf0bc1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1304,6 +1304,23 @@ ethernet_phy0: ethernet-phy@1 {
 &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
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
+	vsys-ldo1-supply = <&reg_vsys>;
+	vsys-ldo2-supply = <&reg_vsys>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0

