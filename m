Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785D358D00;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225818; cv=none; b=FQ6pQvGMteLbgiQUnAmjixjXcbWpwGjLHgO/XNmL/rbwLRKU8ShLSJ+VBMDpWhFcdfe/k0hhehhau3vGv9R5fcPdNzUy2BOfwbaaTcSMLOg0KIc7k1UwkeujOSsnqMMZWIU8dvjCFk7MGVRC1FxQBuposZ59NgzKbjynvA5Ua20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225818; c=relaxed/simple;
	bh=5P3oB3t/H+M/VWPcldvUPMKT0Ow+fk7RIqkl6O2cI+0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ukcjdOgIr6vx+FJhqOH/E/VQHQlKzyFQYMeVTxKyYFBoKbzdSvDuPrGNoGm2pj7dX21MaEYoc3bNmcgZyx9MSkhO0ufN782upY2+LOIrqZOwpV+jLRDKJG5Fmq8MguOLX2EZJz0pCU8TuNHOfESLHyjExsbRh4f9b9V6LzJ2Qng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XACC5UYV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XACC5UYV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3DE5C2BCB4;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=5P3oB3t/H+M/VWPcldvUPMKT0Ow+fk7RIqkl6O2cI+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XACC5UYVvyKFUulCycU3Xkxd9WIMzOW58lMm1E+C/YcMTgBi7IcvSQ3K45jL/6KuB
	 ihT9Nz8+sMLW0HxY9pC1bfSMu1YtSNh8iFCMAvrELKbN4jr8Ft+tHh2rF5FPXp5zQu
	 OeRH97st8/PLPZcd2nHO9JN8etQiVCcFKjZNsFKd/qPXvWgbQsuoUDT5qee2WPG7IR
	 HcXbKZhQTSYC37BBQ9buX22G8WRQUgiFKCFgPWSEL3BE+h5ox0VnGw1wunLpAJS0b3
	 t/90ZISWWr1y3Bjlp6QyG0hyc/wHaEyA8rXTRwhhbhp1t30S2W4F+JWAUQJpqNV90L
	 NyY4PG2h9Vxzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4515CD3436;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 May 2026 07:36:54 +0000
Subject: [PATCH 1/3] irqchip/meson-gpio: fix incorrect register address
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-a9-gpio-irqchip-v1-1-9dc5f3e022e0@amlogic.com>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
In-Reply-To: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=1007;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=M9zM13CLYOdG+lkNB/tDdOWTKQ5cZ8tHYqZIsNYUo+4=;
 b=qZctPN2tSMJSPBgkkvRhlV2W+Ntn38soTuIOLXMPw7l1tQGc2KIYT5X8SsQjTaTjoAzgCj9i+
 3tfomMZgj8gASyXaPOMb3Rs1X/ws7vR2ku7AfIfYNw9mKkB/EB2f9SQ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

When set gpio irq type(level and single-edge) for S4, register address is
REG_EDGE_POL, not both-edge trigger register. This patch fix it.

Fixes: bbd6fcc76b39 ("irqchip: Add support for Amlogic A4 and A5 SoCs")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/irqchip/irq-meson-gpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index f722e9c57e2e..74a376ef452e 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -415,8 +415,7 @@ static int meson_s4_gpio_irq_set_type(struct meson_gpio_irq_controller *ctl,
 	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
 		val |= BIT(ctl->params->edge_single_offset + idx);
 
-	meson_gpio_irq_update_bits(ctl, params->edge_pol_reg,
-				   BIT(idx) | BIT(12 + idx), val);
+	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL, BIT(idx) | BIT(12 + idx), val);
 	return 0;
 };
 

-- 
2.52.0


