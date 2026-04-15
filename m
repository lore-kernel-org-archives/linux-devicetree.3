Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E03B3CB2EA;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776242052; cv=none; b=LGth7bBTNa6A0Fu2V8hRxV8mr7WxuA2ywH26oZQQcEgoEtMGPqH4xhk0erbkM4uK5yD1MrQZKROyGkRmdoSwKGdfZAfD6H4KuGWpC3qYN4l5FW5VxErhjTqVn8s1tO/CMuvF5ZON0+eVpLMV5qXdGHt/JmmjY7XUgp5QydcvihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776242052; c=relaxed/simple;
	bh=HNl0K0UlF9d+szw90ANkiXfQ6YKI/SjoS/k9HXrb6kU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4POYYvwk1o8P65/KDtydlUiS4v0dCVV9HDd2S2G++e1Hp22FBh290uo/0BdrSoIwhfFTiW4xWbp1gEp0bwFDYEwPW3DIAZ/D6JwrOxMuQNfy3vJymGQhPxAPwEwni1o4tleAmDY9LxJMy0bKX7ayqEw3klZp9x2ChAbDZtSfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezhmRegY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezhmRegY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08AE8C2BCC6;
	Wed, 15 Apr 2026 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242052;
	bh=HNl0K0UlF9d+szw90ANkiXfQ6YKI/SjoS/k9HXrb6kU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ezhmRegYJyy2vf759wHwQt4IzLzPXCa1gg/YZ+eLptCOMUkpgA/uLmIa4SuaGCnZl
	 hTAvwYA7udtjk1SVlHtPjymXimgZCtzfC6JYTODqyScmkJ84J+i4VtOAcRt9vpjeob
	 bCvqRGkfVfzStdbEmPO4w8H2Cu40Y2gb7PBPoBoLrDrm35x0fTsTypneB3NtkL6omb
	 yUvPLDJYnlGQZ6awok8DHkk9wbp7jQ7dYMMyNWK8LOq9qKCmJuRNVXcCQlKTnC4bsj
	 toT9bq5RjsztFsw+SCjmg6/Gl9w78nbFd1IWKvqy2/wpsZVV9+R1Lgz4HtnNqpLENW
	 vsHPPRKwgg8jg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8F7FA0C50;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Wed, 15 Apr 2026 16:33:44 +0800
Subject: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=789;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=RYhHoZhvQkCfRu2Sr48dUeuj2wFszXlz2Xg36uj+pEw=;
 b=oFzE4h7RYeGFS+Vu1Zw6G3+FCukgp3/npaLhYAXhAHEPnNvfj0gFLlZR+pO2GcZ825xHWbiOE
 SJrBh4ex5ydCP18XuAN+GDUqNUxZYRmbn6KzGJUxzR3Q1HflCq31IJd
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the T7 SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed62..cec2ea74850d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -701,6 +701,11 @@ pwm_ao_cd: pwm@60000 {
 				status = "disabled";
 			};
 
+			clock-measurer@48000 {
+				compatible = "amlogic,t7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			sd_emmc_a: mmc@88000 {
 				compatible = "amlogic,t7-mmc", "amlogic,meson-axg-mmc";
 				reg = <0x0 0x88000 0x0 0x800>;

-- 
2.47.1


