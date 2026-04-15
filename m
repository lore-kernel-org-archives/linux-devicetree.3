Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A066393DDC;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242052; cv=none; b=eFFOlLvScQtBbwqpUtMRTey7s5k9382Z2gYK2EF3da2SPj52RTBl7WVsCe8zKKKjTMahbg074YZj4d99sWm+jc1G4sUszZuS6VjUfv1U6e2ubAWF8zvzTu4dnm7eiSOa+2NGEzwHawUcvMJNgvZ7YDIWM17EQn8jzpy1ZTs/x0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242052; c=relaxed/simple;
	bh=FfXjRFmg7qIWDzIcMzkkgcBil928LcG9XVE51++/LHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgkR8fBZUHYLvK3Cfh+glU+yGjYaS3xc5Rg76od6d+HSlE7ffuKxWE/4HFadAd+7BMmfcj4gkd7Q9Hxmv9bL38Nu65XUNXRYH1UZvUJxQidoJfA1jGJYyhKOTvHTncITj3Z1vkFv7SW8jl6aGheTNnxGXSQwDQZiZzglHUA4Iis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqqobZoQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqqobZoQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9D6DC2BCB7;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242052;
	bh=FfXjRFmg7qIWDzIcMzkkgcBil928LcG9XVE51++/LHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TqqobZoQWkl5dARinKIGTjyWtV9xL9giB7g8TENIQvAJ6UH/4yj0HGvQ5hPnEIEZc
	 3JaGasO2EFf2ag9UlV9TI3w0FaRTfjIG5DPuZb6Wv2UGdoSng3xFS6RD2oWRc7+iqy
	 Oid+M4E/5iVijnXFZbkTsO3yhbJzYM31b4aSlJbqoD7X90EuxpodnoynpH7oBnb9lN
	 e6bPTR6alrRZkn7N1huiHWpLNWO4Cum+Uf5U9LRLC1bxYD/niDMqh22NP99x89oaox
	 aV9BazmTV0wzXsihbcWIDCdxcYEani3yg2oK/5mRk4cWaarWyzpHqBJn8xGeUIMgSq
	 tjCGKpvnH5kHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE290FA0C4B;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:43 +0800
Subject: [PATCH v2 3/4] arm64: dts: meson: a1: Add clk measure support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-3-02b6314427e6@amlogic.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
In-Reply-To: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=739;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=dY5flplQX4DkVTZxyXyrnyiX8aeclNtTfDgXIhbj2+E=;
 b=kZKAk3CaLVxGsvBI6801SS/Zq8bVLAttiPeNXu9Dp0er+VPBcZ6OoefdFluiAN81gL5xM3ydS
 YIdNIdZMhRiBSh4ytmBC17LHkGoqg2iNjMV47w9JAlTor7dgh7MN29j
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the A1 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 348411411f3d..6f6a6145cba1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -576,6 +576,11 @@ saradc: adc@2c00 {
 				status = "disabled";
 			};
 
+			clock-measurer@3400 {
+				compatible = "amlogic,a1-clk-measure";
+				reg = <0x0 0x3400 0x0 0x1c>;
+			};
+
 			i2c1: i2c@5c00 {
 				compatible = "amlogic,meson-axg-i2c";
 				status = "disabled";

-- 
2.47.1


