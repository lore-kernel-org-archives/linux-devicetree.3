Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984863D811C;
	Tue, 14 Apr 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162842; cv=none; b=UiHXu3tLFz5jHNUmNCZYUIUB+NVJtl0aJBad/lbgZhIHPf/TYBpw/NTIzBB1kMUsbNXHFu4dX37mRzbFqUjBgd1UFJzeROKngkgC1pBcQX6N9wUVhVukvW29ldHqoMaR355J2IcyvZDzFfB+ckKcZKzirhZBSwcu0UtSYgQMGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162842; c=relaxed/simple;
	bh=CAqKslDgGQDwmsCSssQ8gblfhCs2M1I9GlCASlmmWMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nv6AQK0BeVWIJTV+kudSXK9RTp/5eNwSq1qUtCuzydwYkcqo2gsmxx9V7axNrrbMFnG3KwD8Q4OHqG2JdbR2adQT/o8bTm+Jv7T8Wnz2HlEFjVhRSoJx8oeDpm4PKIo0ODwUHg5x0J7x/N4gUsRYf8Zpaa/nPPlUNR/dt2G4aiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=akO65Pxo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="akO65Pxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162826;
	bh=CAqKslDgGQDwmsCSssQ8gblfhCs2M1I9GlCASlmmWMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=akO65PxoL3q6PT4lIksNUy3k/SSlt08kGpGR+2+IDM9YokDklRgowkyCKthMo2SBS
	 pxhHVGWVyNqbK69IGirjoYoyyoIrMizQqhz/4tc6KHsHOfiLvCi1sd4igIvUs/NwOE
	 +hhJ2dlABLabyv/ncDdEIiy0sLrYL2RsUdooDt8FJEQsEqUnL+LCv70s9LDp3eVrMc
	 tKNFeTvvqoe8K/grIcty03FEPFEhCdGCAEUIQYySH0rfLFfYQE70Q5MFPFqG5YYEyB
	 Uh3vkYVUciifoFjD5mUjGLK11hkqU3q0ziJZPTVJ1S/q3z5YU5KvYm+ArWyO8jlr6G
	 mZZ/id9quznFQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09D8617E0ED3;
	Tue, 14 Apr 2026 12:33:45 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:31 +0200
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8390-genio-common: add MT6319
 PMIC support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-1-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=2053;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CAqKslDgGQDwmsCSssQ8gblfhCs2M1I9GlCASlmmWMI=;
 b=IcS0geLyZmB8n7o7xyEhFAwKS/pmr5gwNUvxjZvCd9dEoaiD/Y/RegGvDdI/d9UH2dZK/Y9G9
 UZuv5P0O+drD7pOqalaa1N7MxsGZxRlSxhSDhpxLKq3sbgqdPNxw3OP
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

Mediatek Genio 510 and 700-EVK boards integrate a MT6319 PMIC, powered
by the board system power rail (VSYS) and connected to the SPMI
interface. It provides buck regulators for CPU core power supplies in
particular.

Add the needed nodes in the board common dtsi to enable its support.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..aab474d6c5f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1364,6 +1364,50 @@ &spi2 {
 	status = "okay";
 };
 
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	pmic@6 {
+		compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		pvdd1-supply = <&reg_vsys>;
+		pvdd2-supply = <&reg_vsys>;
+		pvdd3-supply = <&reg_vsys>;
+		pvdd4-supply = <&reg_vsys>;
+
+		regulators {
+			mt6319_vbuck1: vbuck1 {
+				regulator-name = "dvdd_proc_b";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+
+			vbuck3 {
+				regulator-name = "avdd2_emi";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+
+			vbuck4 {
+				regulator-name = "avddq_emi";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.53.0

