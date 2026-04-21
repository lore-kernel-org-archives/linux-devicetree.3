Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA323876C7;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759520; cv=none; b=oP/M0AS8M5f9ZmQu5xXQVi6HOp7ekl7L4letmSH96bcsZJurfG52v7W27mIBCiM//WTCxqllzdcCNBTQ5y+i5yWQWQYdOpTOmxqOsEsXbG2U8WthVyOj6GOW9GFa9lTXnf9GQbC2kIG9Utfg3K29c7ZYQVbHg7uz4DVth7DBXOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759520; c=relaxed/simple;
	bh=2p8v9HyeQUHeTxqkCA4n8zBB/soPTy6Aus9gXPPPwGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKGr6Ktf7hg5Lp4MN4A9nBs/q0wKgGYsu30W6f6/6AZF+8OtA+3srkk+I+5nhKP5045TrbB0zMWtb5e9yo+A/LS8cKM/igUWIrNwDjt9mdrmoMkEr14P5wIzhv7pbZKFt861W0bXZYb3zp1OvrvOrDraDKWSx1HRdm85/LKS2pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWNwid6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWNwid6E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41E06C2BCC7;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=2p8v9HyeQUHeTxqkCA4n8zBB/soPTy6Aus9gXPPPwGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tWNwid6E0yG/8aEyA1YUGJdg0+C/1iJVHZi3V97XpfItsBATpK/jyq71lHsyiBBat
	 AXaGp//55kdGtivMGiZ8QUZoFJAHxWeZO+VmM8rox6K6dBs4uQtqkUgUHVednw5xV/
	 BBBYlaNr/medUh7xrZGUxwUigeePwLvCfDJft5GXiOoUJZg1WpwF+8HIrdds7jcLsk
	 1LcVBw6OzA30rymGDwRiUifewEYmVtMTQkfQmPPJWBADgYwSxVTtsBJvrYnYLkYsB6
	 u6wNZV6XIIgrD74TQuklsYIrXHp1/5cbQYjQzW76FQzwK4U6ryBH1PPUMnw+CRNHlO
	 sfynWprBr5aJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397BFF327C0;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 21 Apr 2026 16:17:44 +0800
Subject: [PATCH v3 4/4] arm64: dts: amlogic: t7: Add clk measure support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-clkmsr_a1_t7-v3-4-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=784;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=Tf9KdJZta3E1sMtIMvQjV5B/7GkVZhyINNxFHHV1vnk=;
 b=GnLEY5O/Xdp4hnbpdZG0KW+p8rK4KZ1+9cExF186TaDe3Wpe4908C3cEvwxyGYBIVLofJgCuH
 +SEoPlNDIAyB1kdcHvnyECvYKxH56fF0M0x1Gdv12GVR4kW9wDaBHX6
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
index 7fe72c94ed62..6a22b48a42b7 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -656,6 +656,11 @@ pwm_ao_gh: pwm@32000 {
 				status = "disabled";
 			};
 
+			clock-measurer@48000 {
+				compatible = "amlogic,t7-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
+
 			pwm_ab: pwm@58000 {
 				compatible = "amlogic,t7-pwm", "amlogic,meson-s4-pwm";
 				reg = <0x0 0x58000 0x0 0x24>;

-- 
2.47.1


