Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0C385524;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776759520; cv=none; b=ZVK1xGhKnFl52kJTB6+vQSOxxDBVvpBHRm0HWGYdw4gQObV4Zs9Wq3Tz50BXcGlGrojxHIHwU0XXkY7cHAlxRhkJW/JVRKw0dytMGVU336idjgnr4ZdJuFnYEPTg7mfayEL5Vdw0HZfkGc/IlNBtclMwNdVL5huyEiinqr1UKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776759520; c=relaxed/simple;
	bh=MwSlXos0zX7WUNc4C5WojqCJu0BgRAQ4D0DNVRbbwY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GII6wt93ExgvueyHmC1rHw2sumgz/zKavBkpT5nhbekwQenjMFAyVIKdNQ0sqrfxLQH1IAV6CZVRNDt+12XHAVB+rH1rWx4GZJo6tvv+JnXhyhu34rXGCi3S+P52SBX3CTcsnmav0cu2sq56MxMR8bT6Gz1CGhPcTO7frajSHM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBcK35eb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBcK35eb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3403BC2BCB9;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776759520;
	bh=MwSlXos0zX7WUNc4C5WojqCJu0BgRAQ4D0DNVRbbwY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uBcK35ebZ5IPiNXeCFnat6WGJ4njEHOnUuGkvDj5L4VZAnsi5HDxudPWz9eLbgkvV
	 NH8sFWuitRpAVDBslecEjbuGrWYNrS1XTRUPNJRugv8+chxgbOAu/XqJ6wWXqzTg/Z
	 SECSMu9jxVYkMCGV/i3ZpjF66Shl0h0N+86CkpKMbi9Xm+CKc9FTl9d0Trb7/nDLo6
	 RylygIHL1VNSyT7TIp0qEoGDpF4mQIU9YjvWxyCP5/76v/0GJEqE3dnq4G8vz7LOrW
	 w3gNyCTiCntL3JMRD/XduCekLbgY+6oOUBsCvMzmZlIHC/AQARTm5z37OT12iH+4A/
	 vAJEhOmzYcivw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288EDF327C1;
	Tue, 21 Apr 2026 08:18:40 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Tue, 21 Apr 2026 16:17:43 +0800
Subject: [PATCH v3 3/4] arm64: dts: meson: a1: Add clk measure support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-clkmsr_a1_t7-v3-3-efc00b0f9e6b@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776759517; l=796;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=O86sT98wsFFOKZkjD097kQOtYoxBWLlc/HPpfUJkTMk=;
 b=8iw4mI0MTc1m3WzM4UlLTpcP2P1hOFu1li1dE6jCJdih91bUQAeoRGXl8dOfZhCkiY7Ub3oot
 OqcrvJcAnOBBm15G56BZ2MIHV6eDeptBa7s0m4DNqwU8P0RDVh8C6rD
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the clock measure device to the A1 SoC family.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


