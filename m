Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416F46982C
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982167; cv=none; b=JnAPQNFkoZtdE3mz9Qd2C1QY+I8JrKkKvROp9Gv0Ry9meccvoWTb7gKtRuPBV+p47tiS1PqiiNY7TAspd8P2sykGb1Hg2Rk0RmTwIAQCy1hZ8Re5ozwMa+hXzjuCptkvSORGcP2876hMR7aGDjPV+WjS7Wf+24woQUBbeJtnWbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982167; c=relaxed/simple;
	bh=xa7Yis5Up2e8xi1vm7V79D64np0EvzunA36dVGF9ZEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KqOuF/4BbiPa/dQPSuTrJxSgGj/0PHMIK71v+pa2ceC6k/IcqWa5mKv/eIfKJPboPdISuaVTOz467ntEM/QNSRuvJ5I2uRuBWN05bRNoXpI7Aoc/49asZ1ij82AU6R8fmjLxarjRHwk5KdadKJUKmAn/VhGlS/K7VCarkw0pCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgvBc4bw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgvBc4bw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D661F00898;
	Mon, 21 Sep 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982166;
	bh=WSflIroXyh5Pm6pEOmb1QWvsLzdfSZ2/pWHmGNt78eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RgvBc4bwHgPgrHJMR19YXtYUTv9EFYWjFYSBcJ9LU1XqFWCg2gNm7Paydlr8ycc14
	 GFKy1g472PxgyvdM6aKof+kmKlPG97eb7/tgotXbNpRcURzfi0m+oW5ZsTpcKypScz
	 ZzuCkn63ryeYeASUdoVshp/mGFz0jlUqXyTSedRRMdwiB7h3EGn7IB1lk8cWD7Z0l7
	 ADLMKtzTD6fey6a4UuOAGKTRE0PUiKzQlXXiGNW/N70jQImY93NjRhJAuG8yjhflqp
	 BSSi/yXHClvLAW0GCiUZf3ajjOOx0Hdux0VgZUN40ObcRcJSbB6QLO7OXuGtJls6DV
	 RXjnD+Te4+wlw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 11:15:55 +0200
Subject: [PATCH 2/2] ARM: dts: gemini: Use a level-high interrupt for
 TVE200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-gemini-tve200-fix-v1-2-8be03ac2a8f7@kernel.org>
References: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
In-Reply-To: <20260921-gemini-tve200-fix-v1-0-8be03ac2a8f7@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

TVE200's interrupt is configured as rising-edge. On the D-Link DIR-685,
this can stop interrupt delivery after the first vertical interrupt,
causing vblank and page-flip timeouts and delaying framebuffer console
startup.

The vertical interrupt can remain pending after acknowledgment. Use
level-high triggering so the pending condition is delivered again
without requiring another edge.

Fixes: d2b85241a9f5 ("ARM: dts: Add TVE200 to the Gemini SoC DTSI")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index 23e68e17ffbb..d8f64fea0a79 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -445,7 +445,7 @@ dma-controller@67000000 {
 		display-controller@6a000000 {
 			compatible = "cortina,gemini-tvc", "faraday,tve200";
 			reg = <0x6a000000 0x1000>;
-			interrupts = <13 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon GEMINI_RESET_TVC>;
 			clocks = <&syscon GEMINI_CLK_GATE_TVC>,
 				 <&syscon GEMINI_CLK_TVC>;

-- 
2.55.0

