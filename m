Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764EC328B5E
	for <devicetree@vger.kernel.org>; Wed, 15 Apr 2026 10:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776249125; cv=none; b=RH/xV8m4GDRgBg5VXf3BFOfTikM/kj+dnY8J7QKrrFZXmWkBdWjl22VsNrKmkD+3BjW+okArnRoj9Mcmryed86vdqv9slobRNBGBeIE1EcsYPAPxG3QTF8xoExp9BYJHyxwm37yzkKZovTt1SDUMJvCk+9Wq+dZd/te0sWDqAm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776249125; c=relaxed/simple;
	bh=HIKPLEyWCCsA3zb5wxtyTAgfOX1+xiCwivVroOYHU3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sRzm8cFox/Hq0maud/Lk1MhxwosvkgEIU6/vnQcN0kl6wFHf4ToRFHtlG9rMa904UfeSKKFmAZtFARmwZobPkhaCi9TtAmJh8yGbDNc/Mh9Ki10KBVJVJuDZcFe40ReDOPZH8D0ya4BZtgRFtGPKugK9iFzxTGlS2SIjXrvqlwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsWcfKmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsWcfKmG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C12C2BCB6;
	Wed, 15 Apr 2026 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776249125;
	bh=HIKPLEyWCCsA3zb5wxtyTAgfOX1+xiCwivVroOYHU3I=;
	h=From:Date:Subject:To:Cc:From;
	b=IsWcfKmGsYtWiRh/FZMbE4wbuP6wYxpAnlj2rdBMw9jy0FIshvnLhRncIFBGx55DU
	 yWEDTdxCQmP+AmN2EykEHsTXI9y9W2IILpWODjg9oKPSy8qeZUAUIvQTvYrQHlNG4k
	 Vl8esEtpWkq/n7NX1kLIVB71KEFYhSPp3uUHCeTWfx7UcmpIboef/Yh4gDB1fA/uKP
	 IArjFXNgkgQp621EAHevpxOUICTzfsFCt0XsmgbHf+KfhyfSOnwjzvuR6+6ZN4chNd
	 2i4k0TM8+7Obc9EMJgzVudsLnapoQdfbeCPwj9RO6QTPn/JCMARqhdDQ1xKh0Svqud
	 7Ht4qE9fBE31A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Apr 2026 12:31:49 +0200
Subject: [PATCH v3] arm64: dts: airoha: en7581: Enable spi nand controller
 for EN7581 EVB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-airoha-7581-spi-enable-v3-1-07e0f27cce13@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBswzYquEi1MpxoIFYUIorsnL
 d/i/wcKZaYCk3gg08WFY6jQjQB32LATsq8GJVUvu9ag5RwPi4MZWyyJkYJdT0KpOydp08qvPdQ
 4Zdr4/sfz8r4fC51muWgAAAA=
X-Change-ID: 20260415-airoha-7581-spi-enable-034c0ef32db6
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Rebase and resend
- Link to v2: https://lore.kernel.org/linux-mediatek/20250225-en7581-snfi-probe-fix-v2-1-92e35add701b@kernel.org/

Changes in v2:
- Clarify the commit title
- Link to v1: https://lore.kernel.org/r/20250225-en7581-snfi-probe-fix-v1-1-77e4769574e4@kernel.org
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..0964cd783013 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;

---
base-commit: e6490a169f6d5f5bdea7a2e8a673890d43afadc0
change-id: 20260415-airoha-7581-spi-enable-034c0ef32db6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>

