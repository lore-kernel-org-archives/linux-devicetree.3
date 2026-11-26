Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686831;
	b=DG7yR23Ae3Fc/vBeYQACnySySUM64EsDN56eDCJPxXYF4WtLDp/APHzFYy62vyNxuEbr
	 gxSHKVzksbNAYARA8o29lJOZC/njw4DBozOpJjmDtJSK81fVaFmYznGnOgT8V2aaVFGWO
	 c41GWUkS9Pec42Ju9wsYhoFjYPdZqjGipHoFmu4FJU3/8el5/m3NsxBsFiVOr4Ai4/0A7
	 Z76r9QU1Vr9xDH0kmJCO52WdnMQ6G3QKsoh1NB56PrRLidurMcyK/EDhPAW8NLrNRW6EM
	 Q5rfAhYwmxqsHhDRwGBI58zeQhTHU+ScqvIw0I5VPapnJjwNSXFN3dJMYOgQa9O1R0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686831;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=;
	b=lb2wmq4DkpRHdy8aa2+ddiH39A/lHIwUefmtgx23tmVA7qbGW+L3huXOAkwfeCGGK1YH
	 5joSHn0zbSonf2StOLFfhrSVrtuuNkhy7J4hOG/E/qcLYj9LEmZN8OZFOeFOzjM4Fm3Dq
	 dMFCBk8TAZGGPnmFvUpOI+UfiTUA60vS/jI++3k6CF7d6YizHDYa7aC89nPwGrAxmM/kB
	 M3NclD1W8YtCh4XqBDp01DJ37VXrKzQkV3x6azVueGrE8cMeFyWksL5Xe4JCsiBeD2ytI
	 5Da9Qkz/A1heoHrNgVR8oMsb7Vn2cqWFUgHQdkHH/lfEkhOSJ8oiFkvK05xpgZ5qpNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QkxKWwtk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF55606A69B;
	Thu, 26 Nov 2026 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QkxKWwtk
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686831;
	b=0IfKGXjz15YBjyNMeGMO7hXeI7STB4GBojugFtfpF4a04MHkfJPAciWZxc3yo73i62Fq
	 KHcrVHUdXu04U8uJu8wq1f6SHRv65VatzJc1TGnEFEt9UUOVMmz4cdKfAXHAXrhJ1IZie
	 uyZQo64TtVduTib7pTsvyiTW5MMKtO5r0MSVIzVzT6WIVJNoMj449q4VGWrtTNPxQIS7R
	 Oz7OdIVrA6Y0u0OwmeGxoPtFcB3Q6Fz8lPEGwkCgkQl6n1JLiJ3UFmbPTmc2wJMtpfsGc
	 1IFWuR5FnAmKngdBnnLgSWsT3+jcPyqn7XiYz58l9lYxBMoiyWtgv/Laa9z0eGBiDJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686831;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=;
	b=qlN42smftSJjJnUKER/yIH825YxOu8jPWkV1rROAY5hc5H5qfVY9XAxJ17i+6XMKXhl8
	 I/5o9EHfqxQCZsoyGsGCIlbDNr5/SDGqh1iTzgfQVQLzJYtK1cvwxSQVDEGlj+XWRAq4S
	 0044TCRhIkdDE+HLC5cohAimVFhIeLuq9/vSZ/xWD/kUxDkI2f5paqaEV6u/injcNNUvs
	 8yhuFeceVpyZ+5WqmBj8COhJfRYLbNaeZOkTro7Sw3fwBrfk1YV50ZiEv/CwmrupehjGD
	 21MrqTuUA8mJcX4oDYi1ZJfocyrhnOaK7V51ZFZKVsPAMfhGzFpXVK3vEQ6qwQt2Rrg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 576B91F000E1;
	Thu, 26 Nov 2026 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686831;
	bh=ncZEOFwP6rVHKLPZIgaSh4joPCImz4xzJxYzeEGBoGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QkxKWwtkX/nVhcHv1Y+WkL5e7li+hZeXB7ko/ox22pjS36GsgE/T3cfPAsl129467
	 9+ld0JoB1Z1EGXMsnItsad5NlXKWlYNa6rq92KRUuPjq9HBYMOiZ+AEKMZZD3X9mAD
	 zHGNLOP+NfS7Ex2H029bEOzfEqVhz7cqyh7xiA9UES6AccEABe0YqMxMW4QVVk9iuR
	 cIVnJexExWesJzvIlCs0YPND62uo+okOb7I73skhLRIFW1d6ThCfsKOIN5LDpk0AQY
	 rZoIkgeH5I26APVmmQxkiaQqt9da6uiLwX3T4kNNZXly6qRKYqT8tuUY2K6P62S1wJ
	 8cpbbwFgVoysw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C73864D3C6;
	Thu, 26 Nov 2026 09:53:40 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Thu, 26 Nov 2026 09:53:38 +0000
Subject: [PATCH v3 1/3] dt-bindings: reset: amlogic: Add A9 reset
 compatibles
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-a9-reset-v3-1-fb9bb01f33d1@amlogic.com>
References: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
In-Reply-To: <20261126-a9-reset-v3-0-fb9bb01f33d1@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686819; l=1488;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=5WFk+q6Lu4hN8rJdO/6ZEotdvqyA2ABmhWD4G7n6Cis=;
 b=dF+zC/R2hKdYjOk4FgQd/q+Qc5H0I9rypOWA/RdenL6HJf8CfhzudBCo6SHCCW8vGDSmT1FaC
 CKiEAc1L0ItAEFTjMNPdKPtipcsVj0bPQgJRqN+lBIC5/muiTPnlptU
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com
Content-Transfer-Encoding: 7bit

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


