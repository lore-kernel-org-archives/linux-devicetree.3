Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7493A9015
	for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786889179; cv=none; b=Rk4Gw5zIu361AlhDXEocxLmzHxm8TIH1adlHx+NXqTGOca7ovzmk3tUdzD8o/+7kxS+JZJKQfsOGPdzn3XEmNOTwDG9Anr6ndc/6tcAtiLSm1iSkRQUDrni5KaLG1Lq1eZ1Jsp8dtM0JjHcVrT9n5YS5oX0wiVFFhUegxovcH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786889179; c=relaxed/simple;
	bh=QjW5FtN3UmQIj/so/SS0WHmGYCiNglIrR2CAelpRBHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2p/QsOUt2dtar9oRZJYDdzAa1+GOa0uPmldsWt1U4QIZ/dy+q8jkwppN9C6QNpa6831Rdxy46StFkcmz8mY8O9eecWg+NpgBdpblCyMOzLCpkK04uk74Q28pdoAs2/1yovBH2MNm2bhf6MIHDI9B1L7DyjcgDljEwOxv5kDFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=O6KFrZkL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="O6KFrZkL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=BgltKba5DUL8ktAPlC2pa1q04TIfIhh7EmL3+FTkAf4=; b=O6KFrZkLlE7jBnqfe8TMorQFKC
	3BwOFaXOFtvQ+uu/8ykRAUksJM/5b10/JStYcFb8FXH5RcAvT/AJcByzhOWfGul8sTCa9tq0zFUtd
	vy8iIKtCzcVQLk4o28kT6+YHg04ScgsstpTKxE0rlatuR+RX+n3L4Wk5EkGQu6DSl5MA6/LcJjoLe
	0xVum/KfQtm+UPIe0FymIKAiODaPy9BnoZ66KNFMGr2MTEH48tagvSe6RudPwPZebMf+djzzFoiOo
	5Fz33k2881HRmsDBwAb6MkQUKFr1+bFkgBggCi+qcq1FJSOl6IqIQDkPuV0mZ1ove3J2CnjEtIcoP
	GVAoUDGg==;
Received: from [179.105.94.163] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvbV5-002tuI-Eb; Sun, 16 Aug 2026 16:06:11 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sun, 16 Aug 2026 11:05:43 -0300
Subject: [PATCH 4/4] ARM: dts: bcm2835: Add the V3D reset line
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260816-vc4-reset-control-v1-4-896444373716@igalia.com>
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QjW5FtN3UmQIj/so/SS0WHmGYCiNglIrR2CAelpRBHY=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBqgcO4ASZcagjs+hTuprttcTy1r7V+HtWoGUMaC
 Ly7M5v7KFeJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaoHDuAAKCRA/8w6Kdoj6
 qmQ+B/wLNmVCbLGXL9JmqNTIEFFxtkm2TnwjaOppIHWi72TV46bzZkiZr/ChdKpjhCn4hmrHesy
 EOUYayq60/CWaBsMmWpmrhoTXAT0Kj2kRXwr/Ln78KapZKmIairNkKrkgOibCrxScqFCmIWSkXh
 etTef9Xp61tYcIiOTGbW0r3jGmwkm4F9YWDC10VqB/EAV5HH4QVDjlBR5gU9cNfM4vEdfV0W6kG
 RxDdKVvY3d7g++xPhaYiAwUu9JSTK6+rbfKsHI4V2D77OV1XfZOB4+lxhrsLImEbXPdIJyd0HJ4
 i+Qsb0Oh2/UqdxDHSCLGHVuIjYejvbG2Gny//QBft5uGm5hW
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA

The PM block exposes a reset line for the V3D block, which the vc4 driver
uses to reset the GPU when recovering from a hang instead of forcing its
power domain down. Wire it up in the shared V3D node, covering BCM2835,
BCM2836 and BCM2837.

BCM2711 already describes the same reset line for its V3D node.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 1e76b290510d..39eea8ce1058 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -139,6 +139,7 @@ v3d: v3d@7ec00000 {
 			compatible = "brcm,bcm2835-v3d";
 			reg = <0x7ec00000 0x1000>;
 			interrupts = <1 10>;
+			resets = <&pm BCM2835_RESET_V3D>;
 		};
 
 	};

-- 
2.55.0

