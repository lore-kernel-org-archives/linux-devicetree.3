Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5A1470E8F;
	Wed,  5 Aug 2026 13:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934991; cv=none; b=Fz/iuE1b2qy7z1ukLSGL5NVa2/TxDaHkcKqyVGrfCZF2p5C/wfv5YxSTAaw123Hw5nlgYZscH06IEMhxQN4bRwKfw3HIpBdamg8o6/OskXdTTR+MfH5XCouynVyr8jm8am7aSSy5D9AqA2r8e6+r+D2EuVU/tF0D3V1a8cxsnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934991; c=relaxed/simple;
	bh=295IKqaeCumSuUEaZhnHHBluCh18/amZPEFle+tiP3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vp1VhVaP7mJMwBRQLzQwiRTdrj5GLq/qzKC5S/IgCk9UKe5GM1WRICzJUN97+webtWv6trPI2G/EB2xG6WxSrnQWwK8dfXzdbNca3flEn0S/fUuzvKvMyjOE4EmoDph+/qXoMwB4miQpo6wRb+sSB13K+DdXuyykebC6C1l9l/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqUtzAz7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqUtzAz7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8E8AC32782;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785934989;
	bh=295IKqaeCumSuUEaZhnHHBluCh18/amZPEFle+tiP3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aqUtzAz7wMWIifL/9j2Sp0mbsil3VkPEhviwvPTfrYov+yKHlq+d/NrOTLgw8S8eF
	 P3ChY3fpGGeLiL3UOAV2rrFKOLomSQmSs5nfTMwMWB6N9EqZLYejL+RpVY4ElPbJC1
	 dDXevHUtaods4lOMHHN7kqMn8aXth7dBqzAN7hHFloAFpX71JDM4jjbRUDxGcJsNrg
	 0+r+dJJSflGUXL8hzvSvpYtO1/0m/Czk1i7BJnAhDO8mVIWh/dDMHvJVglVkK/z8UM
	 3PR2MKjP3rKmb8EjKa8gczHjdLPrXuuUITWP60Qx0ofxhWRTlD8cc3qPauJufxS+PV
	 p+J17SilMJ3lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97801C55ABF;
	Wed,  5 Aug 2026 13:03:09 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Wed, 05 Aug 2026 21:02:40 +0800
Subject: [PATCH v4 12/12] ARM: dts: aspeed: anacapa: Add SPI flash VCC
 supply
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-anacapa-devlop-phase-devicetree-v4-12-5d67e0efa6c5@gmail.com>
References: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
In-Reply-To: <20260805-anacapa-devlop-phase-devicetree-v4-0-5d67e0efa6c5@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785934963; l=941;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=f6LU0FAv4z223NfwbW5+xtWf2s69Q4QEuw+6jPL4YpI=;
 b=GU4HitdnZN9sIeaoEOIxc65OCZhYrjGp2dE2uozcgTcLXfDoR3GiEE+rtDALj7McAzfnsWjol
 g0HDu9Sad81Bonn1sgWxibVjHcRfneq+glygtwO4gZYOXQaVxuvb6zd
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Specify the 3.3 V auxiliary rail as the SPI flash VCC supply to
avoid using the dummy regulator during device initialization.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
index f913fa3f622d..cb4b815f1803 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dts
@@ -27,6 +27,22 @@ / {
 	i2c51 = &i2c10mux0ch0;
 };
 
+&fmc {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+	flash@1 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
+// BIOS Flash
+&spi2 {
+	flash@0 {
+		vcc-supply = <&p3v3_bmc_aux>;
+	};
+};
+
 // MB - PDB
 &i2c8 {
 	i2c-mux@72 {

-- 
2.34.1


