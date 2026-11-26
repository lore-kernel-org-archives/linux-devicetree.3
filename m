Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653441;
	b=nRdUiTMlncjuzPBrKOmCKFDSXgskop4qT2Z4P43/HUX4c77i5N1HOLuyAbi5h9XV9hE9
	 kROFJu2r9WIeGNB/IHMX2xcp71wVwFbnXCF1XOHKo7mQNmACdbNJ6xEiIEbdAY0xm0RK8
	 bys73K3TmFwLZU9SK+IsHNdsNALhvFC4wRwnjvQ2GuQaBMmEmrkktGhIACqcprypbRDH1
	 ZZ4xfxdDVsrxBZm897pKyNpXmGAPUke6mkKLw8Acx2nztG2H9VSrmZ+70Qcc9oV+dSv+z
	 l2KE9RwkUODxxNSg0nTq5AMKxvaBV6xFgvKnU1jYuCmptM5ZSgR/SZ6rmKZeGYgpJDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653441;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=uCqQ+e2A1NSqg+Cb3ruSWJSajTRoedCcfCDAuv5jYok=;
	b=jcb5te/C3HClxmlV7tjr3wTfTMY1+OYIpq1QDQNnGGWWu4PJFIk+h7ImOdNibKleGLfh
	 fCVGGmEZ2kkTmhzgxZ6iBr/Dzcr1SxSnaW8Q4lURc6bsU+5yJ6obMoFcNNEKo25eRbi5y
	 DupUn3hWV4HhvtbQEyXIqE54MoGkqf0oaJADABBy519JgTQH5YB0KnzKL9zcGJokE2MvR
	 CVVo5SjzDhQUdYVsT/GBQALSHDOz/KlCSDv28r7T4fAXgaI4wlvt3qG4IQ8IDGZljsnWk
	 KTm72uD2AkmFSx1U/EBa7uYDdpgJGXwXrQzjJQhpBr7T9bdFCzXrkDotEv3rqX3hrnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GO76wfnB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2735606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GO76wfnB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607F51F000D4;
	Thu, 26 Nov 2026 00:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653440;
	bh=uCqQ+e2A1NSqg+Cb3ruSWJSajTRoedCcfCDAuv5jYok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GO76wfnBp4lwY1+jwCImQidvNjsXOE8td0gn6QqOYfL15AcvAT/ywR7VJE/nduV15
	 GpaPqnbLa0G5J0m/9MJ23Kv9Eovg5qJMaYyaEdySObNTc3qzUINEhuA+M6RcI1d5Ek
	 qLG6lvYaG9Ph3nj69HlGPeOYiqO91bqGEqHxkiDNP3rCveEvMtffJf9pGZ+eEnTIM4
	 5408sDnOsnCt+GKnGbOqhRyJ8BVNRD/GkvgJjSULNPNa6Udb84d6wpVJSg4yURYwwC
	 QTQ9NNyIv80Sembonnb0FT7M1hgqzy/CPt2xAI3lZlLJctUO3MN2MlkgOEHiQcG//e
	 xAPLzf8mhcPSA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:09 +0100
Subject: [PATCH 05/20] ARM: dts: ux500: Use the standard battery chemistry
 property
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-5-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

The simple-battery binding uses device-chemistry. Replace the unused
battery-type property so the power supply core can read the chemistry.
Found with CHECK_DTBS=1.

Fixes: be3a60a94390 ("ARM: dts: ux500: Switch battery nodes to standard")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href.dtsi    | 2 +-
 arch/arm/boot/dts/st/ste-snowball.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-href.dtsi b/arch/arm/boot/dts/st/ste-href.dtsi
index a85b2c352c69..459f82134d03 100644
--- a/arch/arm/boot/dts/st/ste-href.dtsi
+++ b/arch/arm/boot/dts/st/ste-href.dtsi
@@ -15,7 +15,7 @@ memory@0 {
 
 	battery: battery {
 		compatible = "simple-battery";
-		battery-type = "lithium-ion-polymer";
+		device-chemistry = "lithium-ion-polymer";
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/st/ste-snowball.dts b/arch/arm/boot/dts/st/ste-snowball.dts
index 3b629dd7f798..2e2f787871ed 100644
--- a/arch/arm/boot/dts/st/ste-snowball.dts
+++ b/arch/arm/boot/dts/st/ste-snowball.dts
@@ -19,7 +19,7 @@ memory@0 {
 
 	battery: battery {
 		compatible = "simple-battery";
-		battery-type = "lithium-ion-polymer";
+		device-chemistry = "lithium-ion-polymer";
 	};
 
 	thermal-zones {

-- 
2.56.1

