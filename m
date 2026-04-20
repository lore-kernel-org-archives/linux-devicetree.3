Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E623CFF64
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691085; cv=none; b=faFL28qbZSUNlsujiDATbd/gtz6Niy82qSMPlAHpxnaAuIlrsQ/LNzCjuxH0whDMKuZ3ff75oIClJONiuUG5bqcUuaGjP5G+1g1J/C8BxVaQZxQxNEQD6T5HI5uRGlaTsIUlHIArxOeBfK8a/mxYNl1R9vI4dArXx/njClIWiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691085; c=relaxed/simple;
	bh=9FkvdrCJWU69BHjBnRUIifEHX2aPcYqJgDqD5nPc410=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MAjzdRYK0Rd6U1++Xr9bQDh8i/LIJNDZ7B4svQXLUDOxPstMxsXj+sBtLW3WWYk3/zWO/GHxrhtCAFSlZ9eza20WyMKvu+r9sW0V8/xXzqyPVPPKAcK0rEK5WlzsXzyIPi6/bx/aSCHdPx/2WTdSXQxNkpvtGoC0fTxhW6ItHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kf3pTJz0; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kf3pTJz0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8E3E64E42A74;
	Mon, 20 Apr 2026 13:18:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 625245FFA5;
	Mon, 20 Apr 2026 13:18:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B7E1104608BD;
	Mon, 20 Apr 2026 15:17:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776691079; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=g9j6tP3Etxqo20VEpvRVw0E7sixMpncDmd0IlGjpXiw=;
	b=kf3pTJz0oJlkKKMIO7TrPhrZohq6pH43EGiLiA7ikenpiiMCzq4izeYWyPoSe9rng5vyWc
	PMBVlEs97WeOGSj8mnHo9SiWnDactZVpSh8g1Mfj6iLB0de17zK+91JbLi5CMOqZ757KeL
	HaA0sTVgfGoM8pE54CoFNBVDDkfZMoUYGUxP1Otr2uKS0pcmAaZ6iVaJhJ81NMsdzIDRNq
	tvuikcigXv7ZvZw023NezItWqB+gZXphlT6zW2x/YMbM/mwBH8kQPQlU5eXIabecYvyWO3
	3tWUsV8I4ppcIP752X50pMi7f1wh9QN4LxPCtz7F7V00uPVnXsCW+vyYsrW+pw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH] arm64: dts: ti: k3-j722s: use ti,j7200-padconf compatible
Date: Mon, 20 Apr 2026 15:17:35 +0200
Message-ID: <20260420131735.3833993-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Abhash Kumar Jha <a-kumar2@ti.com>

The pinctrl contexts for j722s should be saved and restored during
suspend-to-ram, just like it is done for j7200 and j784s4 SoCs.

Use ti,j7200-padconf compatible to save and restore pinctrl contexts during
suspend-to-ram.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..757eb6abcd72 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -242,6 +242,7 @@ &phy_gmii_sel {
 };
 
 &main_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
 
 	main_mcan0_pins_default: main-mcan0-default-pins {
 		pinctrl-single,pins = <
@@ -418,6 +419,7 @@ &main_uart5 {
 };
 
 &mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
 
 	mcu_i2c0_pins_default: mcu-i2c0-default-pins {
 		pinctrl-single,pins = <
-- 
2.47.3

