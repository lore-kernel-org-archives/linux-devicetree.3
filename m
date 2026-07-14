Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B4137BE81;
	Tue, 14 Jul 2026 02:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783996430; cv=none; b=B9YNiDquu9iQmHRpTU+a68jSovpmjAlx7PsswFsJzd53BQ1GdC/PmUvinl6Pe+qLIXcFjn0MzMJ2AE6bpGTmsXxBOxFLVQjSfJDu0izIKg67/F1Vp2AgkZxjxI+rxOLzguU2vol36l3tLWv9xE2Xn4GTEtZ3f1goChOMs6EBFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783996430; c=relaxed/simple;
	bh=w3qxllQ25LE1gS8AdT8JNxDck+B7Ux0PEBYco4iXrZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4UxoWOKlCQ0wp9x36LNERgyRSXoo9oEO9tBruhzvTudVTk6KUEQUgaWI+W9VqiIGpdgqx8t3rrjnjOBv3DfkKTF7PoU/actS6UR2if4wImA2oVswJ5ksuG2x7e3OFeoz9IXpfncgXJF+GflJRB6eKc+tprXg7l3elzlldYRfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPHsGryK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPHsGryK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7335C2BCF7;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783996429;
	bh=w3qxllQ25LE1gS8AdT8JNxDck+B7Ux0PEBYco4iXrZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rPHsGryKpT6MqZQ+qXnd+NmFvK5HVXAlmo+aFGE0C1v9/1K0gP3IzTwqzG2qpgXgE
	 HyXnj2//S+/X2HW1c5aX2JXD0U/AhwwCKFyJc8iutoQbU4fCdixbAp05sP3/FPVFGy
	 H9UtpeKofTKre2LQSiI2JezsD04NUAOl/NTwDoqd2OwXXmp2MhM/rCNQ4Vk2KZm7/Y
	 UylQC8HqjkMYxxzQaK85C9MHs8JIVLGzGq7/ApnVvoU7YQWqAOXcciGlo8BCx2GY7j
	 TNEuTzKtC6lfSZBtQwJ0dPFf5Sj2hdFuiyu0mltau0w1L5a8TaPgjOajMBII4qkPcl
	 Gpb3UedLB+ChA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB350C44507;
	Tue, 14 Jul 2026 02:33:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 14 Jul 2026 02:33:37 +0000
Subject: [PATCH v2 1/3] dt-bindings: reset: amlogic: Add A9 reset
 compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-a9-reset-v2-1-8df09b2f437c@amlogic.com>
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
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783996426; l=1488;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=5WFk+q6Lu4hN8rJdO/6ZEotdvqyA2ABmhWD4G7n6Cis=;
 b=JGlItjGvPd98jmmQ1S2UVsuvwvMqeccsiTmNtrPOrq773X/fpTtjNvIR4/KPVPH4HfyR2v2jm
 pY8F0iFQDOoDOGjFa/n8obfxdU2RySZyFrUcHf01w4tAgFtUWZjPx8Z
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Document the reset controller compatibles used by the Amlogic A9 SoC.
Add support for the A9 AO reset controller and add the A9 reset
compatible with the T7 reset controller as fallback.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
index 150e95c0d9be..e585f71879f2 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
           - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
           - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
+          - amlogic,a9-ao-reset
           - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
           - amlogic,t7-reset
       - items:
@@ -26,6 +27,10 @@ properties:
               - amlogic,a4-reset
               - amlogic,a5-reset
           - const: amlogic,meson-s4-reset
+      - items:
+          - enum:
+              - amlogic,a9-reset
+          - const: amlogic,t7-reset
 
   reg:
     maxItems: 1

-- 
2.52.0


