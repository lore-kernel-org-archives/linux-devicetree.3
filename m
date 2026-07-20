Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D24732470E;
	Mon, 20 Jul 2026 21:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584520; cv=none; b=FhraZYhhQnacPBQf2XWNO9qFt9HtbUIaB+72ZQyI45ZyJL64hPMvC7jSCplCJz2nwm3Vrvz1vkS0uSbvNseX6MItUZIKQuKEXTyS3l3T/T1OYV3UjuJe9t5uGknB68k9SBlfS2whbUepU/b5JGXm9d43KNSD1IqAskWK1hlB4yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584520; c=relaxed/simple;
	bh=J0vkAr4/Tu7YiyTBXngYksEOi+A0F6Kza5yefrxWGr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPeO4UbkaLygGOoFs7yMHeXEl3DPuKDbPmz+Xv2R8OJMQAVNfRJIEuJbBJacj4yFeTO3eyRUk0jN0t7VWxBZU0V3mmj0vmZhJLRq9bYFFbxWqbx9qXDK3q8Zo4JpOk0D9HG1YyJQ14Pxzl9ZfCYkW9mgGO3jhLG+2+Q4hmXFgCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UufmdQV7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UufmdQV7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 743DD143D;
	Mon, 20 Jul 2026 14:55:13 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0703F66F;
	Mon, 20 Jul 2026 14:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784584517; bh=J0vkAr4/Tu7YiyTBXngYksEOi+A0F6Kza5yefrxWGr4=;
	h=From:To:Cc:Subject:Date:From;
	b=UufmdQV7TIrXz0Fczo5N/Zzbo0dd87gqsbUToclSVqMp6IBu35tQZO5MGTd/YcFmB
	 bkj9QM4mE+Eltt6VJ1IH3BeejA3Da3VrUQ3LFt1LAeRSkfDLtX9x6+XFO+wxOKqZ84
	 O4tVF+Ua25hTrF1ysEGlGL65xsPIvgfTHcBFCXg0=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: allwinner: a10: Fix PMU interrupt
Date: Mon, 20 Jul 2026 23:51:28 +0200
Message-ID: <20260720215128.5761-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Performance Monitoring Unit of the Cortex-A8 cores in the Allwinner
A10 SoC is connected to interrupt line 66, not 3. This is shown in the
manual (where interrupt 3 is assigned to UART2, also in our .dtsi), but
has also been confirmed by triggering an PMU overflow interrupt and
inspecting the IRQ controller status registers (from U-Boot).
Please note that "perf stat" does not use interrupts, this might explain
why this evaded the initial testing.

Fixes: 7e345d25c796 ("ARM: dts: sun4i-a10: Add PMU node")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun4i-a10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
index 51a6464aab9a3..cabf619c2e217 100644
--- a/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun4i-a10.dtsi
@@ -185,7 +185,7 @@ de: display-engine {
 
 	pmu {
 		compatible = "arm,cortex-a8-pmu";
-		interrupts = <3>;
+		interrupts = <66>;
 	};
 
 	reserved-memory {
-- 
2.46.4

