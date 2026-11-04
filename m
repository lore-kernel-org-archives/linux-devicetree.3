Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808974;
	b=LiEZsIzpK81EUmzgQ0XvAps3+JG83CIO3qopgphop54dZ2uKIautcwmCHf573LE23i9P
	 EBSLIKpPtu5d8hE2/NazhtvRpMuWg1BgzdraumS7+ROAow1/5o3ONUdsCy9b4fvjoxfBe
	 FN9CBp81IB4vQLVm9l6OoGcL7/hnZJ1yH/uwB7hO4cur4AfF+5OlxqbGrGu2CeBy6onrJ
	 D9eLkfp+2nW2zyKMqEv0XZEhYLl1d9PtjxUjzVo8ONLZVSTzirEmKdXzup0jsKbSdlUPT
	 RUIIkiF6WyAD8TBmaXC2a7pRBEcKrqBxOjc9DyXyCfEPMRGiT/nC6CIUUUeDofn/NVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=;
	b=C767KFW5brtcE3CpVxXGUUelMTs15wYubPcbl9AA/TQvb9IPzF8akwaW3cR/LZxJAmHn
	 w+8xvTwTyBGtwwaInUOa/VuQzHx0VddKbGJJSf2XMNSXr1G8hiL58T+78T/hQ4hSGInEs
	 5OzBKUwZQIyWsaSz0HYiIBF+BkU302wCzafclEXX2NUm+3W1hLW/56Hk567QlDucJGGkn
	 5Qv2YAxP5g+TMgsbv/Wk/rg4fx5ELFUFx/uySK5SX5tgP/3hmu1HvaI3OLbYEn+cIAsuu
	 gtOwMVAK2GrUquVKrDLOYLPkpR+vjc0EU09uRIbAL70TBqgIs+yt2SiNFWwe4h81EEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bWYCGMD0;
	arc=none smtp.remote-ip=185.67.36.65
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C34606D836
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C34606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=bWYCGMD0
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id AC3F5240029
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 17:16:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1793808972;
	bh=HJM7/PuFDUDOwqvZxCE1CMPyZQc4Y2DCZuVTcSLNH0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=bWYCGMD0qJP+YwmDPWOA+XFnLEjJLabifZ/qVezj8x28+07HdAXuPlPE38aNz0+Es
	 njakRp7uW8MqLGLcvdXB8uIThbmyIkcX5Df9ndhLj5vTVPwr9X2Lz3HEzXURpdcP/T
	 lK2k7L1yud5POYULLH4HMcXeHF/1ARE07+i9veXB1QLLCOmKQKFiuzlWtSoCV2/I+v
	 ZmbpobO6RvHSXp+6E4qX+VEfcU6Gd93blhbP7LqznnUnTNXHaTcoY89s3RtZJwvt9j
	 85C1jM3CpNGEZgjREDgOv/O7tL7oPPrpIpYiN841dMwOR2sdHCy266bwcozhMtMx7t
	 FrjRqsA2QY2qA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jKVtG5m16z6tyK;
	Wed,  4 Nov 2026 17:16:06 +0100 (CET)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	Julius Werner <jwerner@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Marek Vasut <marex@nabladev.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 3/3] arm64: dts: st: list both watchdog SMC ids on stm32mp23 and stm32mp25
Date: Wed, 04 Nov 2026 16:16:08 +0000
Message-ID: <20261104161553.30115-4-mateusz.nowicki@posteo.net>
In-Reply-To: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
References: <20261104161553.30115-1-mateusz.nowicki@posteo.net>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog
on stm32mp2") changed the watchdog SMC id from 0xb200005a to
0xbc000000, the OP-TEE default for the platform. That fixed the watchdog
with such firmware but broke it on boards whose firmware still uses
0xb200005a. List both ids, the driver takes the first one the firmware
accepts. Kernels that read a single id keep using 0xbc000000.

Fixes: ae4d08bbe3f4 ("arm64: dts: st: fix arm,smc-id of the SMC watchdog on stm32mp2")
Reported-by: Marek Vasut <marex@nabladev.com>
Closes: https://lore.kernel.org/all/1b14e1e4-962f-4391-91fd-b09143641643@nabladev.com/
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..7526e86f5a1d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -35,7 +35,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..143d83216530 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -36,7 +36,7 @@ arm-pmu {
 
 	arm_wdt: watchdog {
 		compatible = "arm,smc-wdt";
-		arm,smc-id = <0xbc000000>;
+		arm,smc-id = <0xbc000000 0xb200005a>;
 		status = "disabled";
 	};
 
-- 
2.56.0

