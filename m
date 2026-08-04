Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47FD455170;
	Tue,  4 Aug 2026 13:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849249; cv=none; b=EDpze14EcILLtALVlHBL942dE4CtiKpwmaBQHbqfmdxBONxgmnH8/XVFzv9dOxi0F2MaTeYZ5/d4UrqMnL4mR0COI8OxmRoXl09T84YMtAIpTwMpB01nXAr7a93IwN2fifmnvN3ouyuJ5rKZ8+4EEAgLndrYp0Roq8Pkey296KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849249; c=relaxed/simple;
	bh=7f3naYgkeff804R+bmXoqHjRNXOpcMBIka3iPoDNmBw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdW6eYtmf5jR++2nAmDXxsdSytU+pS3fcO2RmPqKOgxGt8arS1Oex034gCAKRWTake9ga+hsxwYuMSh+pYh31SljJi3tRmoBR/4qLE6xGk61C/4SCj1wG55YEGT5A83tHffrhoeG5Mgpmg4vuZnAi0jvF2riZ+XZIa5XMENvle8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dslGIiMm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MY63SY/D; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dslGIiMm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MY63SY/D"
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ottxVU9lmATMxS27KNTpJhhVUCPJJDW3skRaFvjRvaA=;
	b=dslGIiMmsdfaYY/VUGwD3MRk/iW8udv2QGLgMvruBLcBJG0mRoXo91ofHK1kS1py3dpoFB
	bm9uLWQkDO+8BhwD4+LrU2WLwkAtYhFpgKMQ/CXXuatSCToJdSjZFxnnaKujcI3owLm5mU
	bvgGBV4/PaiJw2aPshuulU5prxs+WwHdOhlZMEgublIyExUAPgCYVcWUoiJ9WA84dhAqzH
	xbKW/D5n3R5n1ADK7O0rrkXCNB0/90YMMcET5iZ3OCPVrV3pLaixZLM0Ms3PY2oLrL2TD6
	n7zyzaZjybXiM0nBBp3OXDae5+J/wo0jIuZu2w4OrpbPlYt5EtHfE/0CE7xgEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785849243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ottxVU9lmATMxS27KNTpJhhVUCPJJDW3skRaFvjRvaA=;
	b=MY63SY/DTgdWZBZzaLcxkPLKgpV8dXQrz8/qVv5rQh73aWAOnoprO3ckwun4zG5BKCibQp
	nn0EWguVpKOdzsBA==
Date: Tue, 04 Aug 2026 15:13:49 +0200
Subject: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
In-Reply-To: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785849242; l=1217;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7f3naYgkeff804R+bmXoqHjRNXOpcMBIka3iPoDNmBw=;
 b=LpPlPJ89DacDPZsSss/PxhldgmbBomzwoht73l6wVCl0QOyams0w7Dto610nx7yzeDdUZxeDu
 f2s70ifMPwkD31WOR2gUkltfNaFDUEGdjKvbpDMRnwT7xhWfamg+5zX
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=

The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
and in a c Stepping. There are two separate dts files. The
bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
the d Stepping. The d stepping does not set its own compatible/model
string but uses "raspberrypi,5-model-b".

These two steppings are not compatible. Booting with the wrong dtb file
causes a crash at boot.

Add a compatibles string "raspberrypi,5-model-b-d0" to allow us to
distinguish between those two steppings.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index 127be0fc27c22..5a86ad69645c3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -3,6 +3,11 @@
 
 #include "bcm2712-rpi-5-b.dts"
 
+/ {
+	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712";
+	model = "Raspberry Pi 5 d0 Stepping";
+};
+
 &gio_aon {
 	brcm,gpio-bank-widths = <15 6>;
 

-- 
2.47.3

