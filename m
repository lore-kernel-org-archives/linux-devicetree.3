Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B63DE457;
	Tue, 24 Mar 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345036; cv=none; b=KZnKFIaHlAYMkTwHGrJV+6p2p0ziDONTHG9X4SulVc/EyEypeywZz9cLDD7+wAY60gjqXZJxxEwIHk7EVGexaVx5imLUoa+epHA+dGnLm43bY9d19q7WpXVpZji1HY8CTKh8jbGuT2YenLC4gtyhP8KSwhlla999U/D9Mhfn23k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345036; c=relaxed/simple;
	bh=nDBp8jeEjvdxNkPnQrCUmyAOOiIlzYgnU6I61uSHsE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryFoRvcv/sq8vMyUuNE7Zk4hdyDCntzYZrGRs066uewIBW7rYAwmJUXltw5TQ5w/mk5ehcGLpbc/F4SOYRDN2qoiO5eQXyXi9l2/naeS07Kn3p1eFgrQ66bZiOUJNv8b/2iInSZ3Y1M6b4w4NT1XvvgdPtwkeSJSwizCwIIATlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=d7zUGY7S; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="d7zUGY7S"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 6E763275C2;
	Tue, 24 Mar 2026 10:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345033;
	bh=jZNbwPwadK6eSTN74+FL8+k6mnPnpO9N/0QmszQIkW0=; h=From:To:Subject;
	b=d7zUGY7STC+8wvXJvNrTv8D9IPNhjI92/McEqX6GJI0NuuG/+0d7K1uf+NWM7sb5M
	 TjdGWugioUNPQsDmFXP7sEv8IpATlpIBzVlf0n5YkHDyMvBXDPtPlLFgeXqQeQ6rrw
	 q4IQAqNj4bBFtvuk8p8bSrb/mjwWghqlqHI0Gvo5JVZekIlHRhmN8ZP2YnY6xw54Zz
	 ghWmSF8jwPu9XcJjUsmMNo7dSUDdQfmYp2MoZ7PyXrD78moszpNEysAMNM7ETHKMeC
	 JqgIwoJR+waGKxR7CrZiE3USC9OzFCUPWj5iDeHSC2pzAyh6EHwapaihkcs7qYUjoa
	 2OAZKFhKhJrgA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
Date: Tue, 24 Mar 2026 10:37:01 +0100
Message-ID: <20260324093705.26730-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a pinctrl to use SPI_1 CS as GPIO.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 1c4c951e5e94..7ee894d59113 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -247,6 +247,13 @@ AM62PX_IOPAD(0x0018, PIN_INPUT, 7) /* (M24) OSPI0_D3.GPIO0_6 */ /* SODIMM 62 */
 		>;
 	};
 
+	/* Verdin SPI_1_CS as GPIO */
+	pinctrl_spi1_cs_gpio: main-gpio0-7-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x001c, PIN_OUTPUT, 7) /* (N21) OSPI0_D4.GPIO0_7 */ /* SODIMM 202 */
+		>;
+	};
+
 	/* Verdin QSPI_1_CS# as GPIO (conflict with Verdin QSPI_1 interface) */
 	pinctrl_qspi1_cs_gpio: main-gpio0-11-default-pins {
 		pinctrl-single,pins = <
-- 
2.47.3

