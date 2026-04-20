Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE6F39E6FE;
	Mon, 20 Apr 2026 11:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776686314; cv=none; b=GOYV2u5PKSUv82T1260HnTP6+8zOswZQO/p0LSZTPI5j1csIis7qMYZqbpMGLkjr/EPWTgzJF0qFIKeVdZihHhtTjO2fBkmbhuN5k1U4vV7ahWKAJomhZxTUkyAmRZPUve0BOdWh4QBpDRekHPIovgjlH9Vzu4HAP4Wvhmf5PZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776686314; c=relaxed/simple;
	bh=uZbSyEl+Sxr6uO9AnkOGD8y2uFq03R2x1l1DSja6uPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OKRghMgRumTYCI1nLG1zNJXPxpV4FP9ZjuT/4i6x3RB+Dy/CUT25Fvzs/xpU+NZGTHltEKrmeW/9M3oaTfIUHQD6mUtS11nnAKwwQfKjUmSOGsKt1LZ82XJH069DuF2EnPVLkS1u+VeI/ZHVwQoQ6tFWAXc/aljVFCeS9NMEvhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=Le5bi12E; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="Le5bi12E"
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776686309;
	bh=uZbSyEl+Sxr6uO9AnkOGD8y2uFq03R2x1l1DSja6uPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Le5bi12ElraZDjURgaBVgQApD0W2FCoh1e9blkC4h5vZbQ8/whgCLo6psfwSGfXUX
	 +qzaZ8M6VORlXLv5c+t9CJyMJrSRd+UVYGDRsWoXtsVuQsveVNEKVoxZrGyPNlfSSc
	 yEQWU/3sRYROHYrYdIkPYyMsMkYWO1mh1L3sQ+Kk=
Date: Mon, 20 Apr 2026 13:58:11 +0200
Subject: [PATCH v3 3/4] arm64: dts: amlogic: t7: khadas-vim4: Remove
 redundant clocks from UART A
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-add-bluetooth-t7-vim4-v3-3-669cd2530ae5@aliel.fr>
References: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
In-Reply-To: <20260420-add-bluetooth-t7-vim4-v3-0-669cd2530ae5@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776686306; l=734;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=uZbSyEl+Sxr6uO9AnkOGD8y2uFq03R2x1l1DSja6uPs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJwMV+8nGkap0JrBgXbWYcIRbe+A0IZ2iLOLsn8GXAF69pzTbCJmK3rcTkc2Ls+/bXTUpwwh/aB
 gtKa6RfxzaAg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs

Remove clocks and clock-names for UART A, as they are defined in DTSI.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..3227ab27de107 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -250,6 +250,4 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
-	clock-names = "xtal", "pclk", "baud";
 };

-- 
2.49.0

