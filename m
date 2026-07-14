Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9FC3033E6;
	Tue, 14 Jul 2026 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996430; cv=none; b=sq5H1hnkEIdT8spQHr4mf/Ru3v/RxLo9DboP2YkXaj271nuc164amv4k036c5W60dBI1yB8a8i9+OQOpSmWfbPVmJKFtFsYfFqWG/x0XvIuJd0H+eYH1zioSiQPYAwJa5IvkCq8prLyydLhqmlANkS4gIj7NfYusw8GmnuNlRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996430; c=relaxed/simple;
	bh=Cc2E8akdH+G5Ofl/remAcjKjYApuWhW2x/f3uTajPuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eshEIWtHqRMQP1BKo05T8QCAaA6BS2hw1orRtxxO0wm2TTCWhRvbVYhFTLdYGl94CbGzE+e6B38z+c0kFiKS2y+FpO4YfstqpbF4BjxhAPZ/KxgNVrnY1Lye3LDBBisyeAavqcsdWEgMVHYd9jFpZ7IXOYjPqCJF4dSBbF/dl6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H59li8ok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H59li8ok"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFCFAC2BCFA;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783996429;
	bh=Cc2E8akdH+G5Ofl/remAcjKjYApuWhW2x/f3uTajPuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H59li8ok4tiFunnxa4tG9snaRifC+sEGMzcMkH2/4i3gTE7zNXMLNNviQv0PclRJZ
	 /oo+Ssq090YehgYuAH/VvXebRuoJOjXj4WUAS2h7pp28ISMZNw28Mm0xkqpuL6D+M8
	 tartUMHAVBbS6GhfMpkOVL9i67PTSm78L4o8qe6ilgDKyVLeFFFFDp2nNFf78Fnr74
	 IrsJkYFw7Rt+G1uFUpsFRdyvRctHTqLCOdrktMeyuqQb7JFu63NbCiOXjKZ/5/uwI0
	 EuT35MQZBnKD0qWjcbYkSUybKBmpGkg8qztuYkLrW+NZhhLK6d1gV2S+a9TXaxeEj3
	 htrbXlz+745vA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E1C44508;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 14 Jul 2026 02:33:38 +0000
Subject: [PATCH v2 2/3] reset: amlogic: Add A9 AO reset controller support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-a9-reset-v2-2-8df09b2f437c@amlogic.com>
References: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
In-Reply-To: <20260714-a9-reset-v2-0-8df09b2f437c@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783996426; l=1414;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=patSBH/uW6tkb/H97P+dDOJPShFdk5yhMtjXp5whRlQ=;
 b=NzNlMu/pu5V818kQROdNXv7hNpXwIZw76LRmleTeG468QP215WMLszurs+aWDFjqgc4t7Ef0M
 vv9DVuRDPXFAarjD2qF+FRwqFZoG7ShwDMjPQZA90HpOA440gSfPNBr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 drivers/reset/amlogic/reset-meson.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index c303e8590dd6..5e8afbceaf23 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -49,6 +49,14 @@ static const struct meson_reset_param t7_param = {
 	.level_low_reset = true,
 };
 
+static const struct meson_reset_param a9_ao_param = {
+	.reset_ops	= &meson_reset_ops,
+	.reset_num      = 32,
+	.reset_offset	= 0x0,
+	.level_offset   = 0x4,
+	.level_low_reset = true,
+};
+
 static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
 	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
@@ -57,6 +65,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
 	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
+	 { .compatible = "amlogic,a9-ao-reset",      .data = &a9_ao_param},
 	 { /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);

-- 
2.52.0


