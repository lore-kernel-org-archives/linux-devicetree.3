Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4279237756C;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778669066; cv=none; b=hC3WxO52dj90ngxZdqGy2n6QEq+kWAd9X5sFDhn9TL5P8lVNKzLuvsFx1p6jPY2Cw9pV2WxBm7M0DRw68rdWuhtP6NZo30gIKE8cyOhej4krOpjYrNXrD/a1DAN3l835S8O97pLQ4edRbjXHZFuxqWArqz7GM5WNaGgC4jp5vqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778669066; c=relaxed/simple;
	bh=Q/1J667b6JukHamYOF9bAnOtePDVGZhfSHJBpMaACFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnGbz+kY3n8xAzpCQrjAuxdxWowhd6Ab1y4/SOpcWvq4/MmA65tscujuN4eOmP5DsXsnbtcQJo5Y/JGYTCPlfx0FC1c0YeSvYTRj5Wu9aAEye98BgXCaX25gTQAgwpeiH402XkvQED4OtuKg/WVkmlzexuc2MMfZ8b3JX5fZKVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usg5Lj2k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usg5Lj2k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B085C2BCC7;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=Q/1J667b6JukHamYOF9bAnOtePDVGZhfSHJBpMaACFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=usg5Lj2kfs/N/Yj4cByAT0HcRxuVlorJrmluiBvNYI9NxJHVGH9La3rrjlPCiTTqp
	 9l7UYO/5AIm09Ch6fqkSmWNptMcwOC2q1OAUP18Jm9dWjPxlFG+jIZ6hkvX/DI1ciK
	 HiZnEEbYL7tMl4mAWDSBtXW/PKmrjcU42wQha2UrLk6goAnvZUEXsUoXFiRs2CkEWz
	 nfVxe3xzSSzN9H/hcYxyeAuM1rU2h7xKrkVehzOscBS9tdUFXzDw/iOevdrxT8E0Cl
	 2Uac8JO7qKlFCF0kMnR2wbvdUMPKWy2j8xGdJ1KG9Wd27a1HzoFcjgWQyTSbp2Op0y
	 qEMB3+KXK2uMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C808CD4F35;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:53 +0200
Subject: [PATCH v2 1/3] arm64: dts: amlogic: t7: Fix pwm_ao_c pinmux
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-1-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=S8vmDbpcy+8DmhnO1mnKiM+pacEbgZmrZKQgB8iqYaE=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGOv0hgNf+i5bybt/Lf/w65llG6PB+79sFQ1+mYf+H
 +pzidzVUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExE+TXD/7hMxv/3bOuyBGZ1
 61yMOs1/tiVW++Ppm9o8HKJVuTs7mBgZ+mdHJt0QFL5ekjx57g4dlQexbvqpK0/vuFwx5e0k+wZ
 7BgA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The pwm_ao_c pin node was incomplete: it was missing the group name
suffix, conflating two distinct pin groups (pwm_ao_c_d and pwm_ao_c_e)
into a single, ambiguous entry.

Split the node into two separate pinmux entries:
  - pwm_ao_c_d_pins: uses group "pwm_ao_c_d"
  - pwm_ao_c_e_pins: uses group "pwm_ao_c_e"

Both alternate pins are not yet referenced by any peripheral node,
so this has no functional impact on existing boards. No backport needed.

Fixes: ee6e05a49b93 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7fe72c94ed623..62f6b9baad28b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -400,9 +400,17 @@ mux {
 					};
 				};
 
-				pwm_ao_c_pins: pwm-ao-c {
+				pwm_ao_c_d_pins: pwm-ao-c-d {
 					mux {
-						groups = "pwm_ao_c";
+						groups = "pwm_ao_c_d";
+						function = "pwm_ao_c";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_c_e_pins: pwm-ao-c-e {
+					mux {
+						groups = "pwm_ao_c_e";
 						function = "pwm_ao_c";
 						bias-disable;
 					};

-- 
2.49.0


