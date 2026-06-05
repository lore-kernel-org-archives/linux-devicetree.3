Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47654D8D9D
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659487; cv=none; b=owJkLi2kIX07QN2KYCn26omSGcCxOrBCvhLxfrKtcXe6EXUmOaEu7xjhvjC7DhscyRynHtx97021HSfzFU5aOJxoR9gAwxS6buIbWH8yilub++shZWUTt40IQ6Zh4LdiBnUBwdFyM2152vS2QD+3rPOCJsmWJJqhCP14FH/S9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659487; c=relaxed/simple;
	bh=7+PuTcFr4lv1Emq9smWBnZ+5CR1n6JckIWsQMdS8GdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1BMBWr1ZapiTl4ShTRIZ9qCtTrGfBWNivToaI28ShoYfkGaM/kU3xAvjgSncfje8ANigPe/aPt97DT9q4jLE8rOTfbrM/bdES4vhDkZoUlBTAlXRxMsPRIQpJJA/U8ZVfA028P5pvU7+uD1lxq4lLTnY+HOW5MjZCJiz4X+0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGq55n9y; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGq55n9y"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef4223be7so1015835f8f.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659484; x=1781264284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=kGq55n9yVRkwibr8hIjUU2uX+jY+pyOnmFoO8e12Kg1O1K2A4hp+aRKt9oze21sDuk
         ZValtRPHAczPNrSpAVQCS2HE9ci72S5PMzHh6QMX3MCUsEv6Q/qASsZBSfAQ4desi+4D
         p1JY/f3pNoFQF6cXDiEVxSEyav4fpKjs1PwF0T7x5FnquATv/Gv4WA1dlCBC0WpsRVXg
         6W3tYKA2Tw+sWYnWf/P7Qt0mLNo7ue9eRf4kkvq8Tw4pBpeejGAep43ljUETN0SZid8A
         gXvdxa5Gld/+psb0YAZoOpe/8jlg2ldUKdeJxBPgILOUbii5BW7nOSqqpDMC5na7cCG1
         3c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659484; x=1781264284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CFbJYflDDV02dtarv4YB5PHu3EiVcrVU9/w1VgU1PjM=;
        b=V3zELTfH3jwj33g1aCKGkvL2L/46Bts7CLqFE4/WLuhdUMmb0MP2xMHsTGxah2FBz/
         77GGqOfTrOqUUg+dXTFAKTgxXAS6IayFtWAlCfS1nCNLUzcPDp5xZMDYO5jTPeWkYQk7
         4uOMyZQqtpQM/2Wv/Xr/Sm0Gv3xghW0BCfv4/N7QQPvRc9EH8/rwXtglT8Rn4VUzPf+d
         Kmj31QU4YIDBlJijhwqgm1L11SXv5pGB8SxMMpQYT1LHdZsyDG4QGvdPfF0IzKKscxod
         AOqSCajvo/hdhZUxbL+rFOOJI55CmhnKuTdCX6pfgLt5O1OeLb5lPVJ64rEJuUpXYZGl
         0sEw==
X-Forwarded-Encrypted: i=1; AFNElJ+qUsbQJK9AmWBBuIRY0xFaYLe9f4mSJMaN/Q5lo5mzwn0BzsGRJdO0CTR8DU4WQxtPnx1i2qU4Fu1Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxmBOBaKdYdmfdTTRcj2ZdFUwy66BbeXgr/+WXcDZXG2qbElaBH
	eJ2eYTUxcfEFGWSu7pDRvKVK5unCzSqg9FVCYKc7e5xVDf3m+lCSKVyR
X-Gm-Gg: Acq92OFxvgeYTgE1xFzozVhcGaUEo8B+zUbaKPTxDeVAbiMrw9wSjZ2kyHaYRgC0lvc
	LjM1sUgjrlxd0I2DYxyGQnlLsJbfnvpGyykZmdY7kdA90bLZ/GV4RChjJwcFY8yddFpFaYV44UM
	ACIYb+rGo+1X35AI72OK+AgnuhxBRiS28ukYAUCfvtqlzODUootskQFCCmSCvaJSv4Tt2PQ066P
	b4lVBrh3ytl6F5s++lYR920Zlkrhc0s2k5bd3gnSD7yFezCmOuscf+fcudJ8b7IqsJJrzMMadJy
	twWrzbMQHlA0hrDdOF8NrpjIpwJiVbtWm6PjThoaXTajALaeS++t+kuSTCzvL3RnL/0mo/a6npJ
	PPs29/mI2Mz6xRMJn6Yd1/29mVYGKu0B/hytvK2Ic6d4vqopIVVTPY0tUL1pwFVw9xVRBXYPJyP
	oGMgZ+fA7z8uVvJVuT+qP4tA8Nq5wSx3fLChgs8PknJ0+FiaSu0KtMf34MDieQ
X-Received: by 2002:a05:6000:a91:b0:460:1755:160e with SMTP id ffacd0b85a97d-46030757dd4mr3877576f8f.33.1780659484157;
        Fri, 05 Jun 2026 04:38:04 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: freescale: imx95-15x15-frdm: remove some rmem regions
Date: Fri,  5 Jun 2026 04:36:20 -0700
Message-ID: <20260605113621.1479-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove some of the remoteproc reserved memory regions, which are currently
not being used for anything. These will be added in the DT overlay
enabling remoteproc support for this board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0

