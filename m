Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10145423A9B
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475114; cv=none; b=cGkKFTVOxW/DVb93a8wv+WJh2ae0xpVn53JC3xX3TLW7O0wBExb0EU705Vm9Io0XAEcuz5H9NhMdwF+TOq0lEfM7g9V9LvPgKHOn13DbrzL9iDDBKJ94hpR8MG1hrHV7hl4U4y3PxDWheD2sZ8fGgSV0oeHnpyQrGvSe87JAQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475114; c=relaxed/simple;
	bh=wCTv9t/eAHxgUJDdwGWsiCEJeGB6I/2bR3Uvigxlc7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gk701oe9ZK0mkpca8cz6NxQeVEG55c/TCW/RHqAhke9ac/RoP0ewIrVv9hdsyrjFgwEQ8xLgwpLEc9Vq9hb63TeSaESCHkzZI+znK5Nzz6plw+XCWGEsfa6IrcC8EMVYiV/AjavBkbPb7ktlEIE3jpZ2IxhYzLATaHNdvGdDDNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMoM4KoP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMoM4KoP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso119351765e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=bMoM4KoPH0aqKgSTFGnMbFjxSZ82oiEQ8IZ3HbhAtc1buHp4xZ7tz/fKckAgDLwjNv
         0qouxCBujpfd/PSMb4TnpRuCipilWMKyZuQ8pnHMnJ39xgb2uzqYb7hCbL9CUcnJ7nHk
         VuwmClcZliOoLFh+AYegoRFc0+QxAYi3zNluRVaH3qIkpUH3osjq+eLr6uPnwovShNWI
         x6JMPbmtAOR3xV6nu8lA5bfwM/4O30fbCRtRzJe/4zTJSZmweuUzBXotXXfRlHkPY59m
         /tf0Y1Xs3Fu3Wo78nizynr1M+5nD76VZCxTr+xXB1c0YlOV6+i3f+kkVj3fJS7pFvAI5
         3pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=RqyiuCM0CYHMgulS6VbC/6qWO+syslcw/9EZ2+TyN8qdnQ5DVW2UFGrXflEj/UpMbG
         R3UFXVbDIpQyaMPE6Yztfpmn+RNrdpEZutUUsdUhJjHpzroZqQXAkgzWgzysmYKSd9M9
         Fcr1K7nyJGYrDlWAHvhfPoYc/QuPSRxguMjGbmnAdpP8++lslcXuQ1RRwMmi0B0pfS6S
         A6FmbdW8ckzGEncyscNETQgA1W2Q+k58h1VYlCGKkltRvmEr4VWm0tnfrfDVTKilQLd8
         rB8zCguP0WlB/L4/lutmzecLP4UaY6lg+EOwvq/fTphBQQSAjkXdAMfddILtyCZH3mc/
         3OKg==
X-Forwarded-Encrypted: i=1; AFNElJ+I95JELpxbc67d8TlqaMedJXl8mvk3ZBRW2sN1IYRwuHLjIdf7TMT0DD1Ogz/td3Rtywhjju61jH6r@vger.kernel.org
X-Gm-Message-State: AOJu0YwrAhCUEYInt/zPGNZzapQOidj6z2nPKm2/hN+AKFROmhAnPXa0
	JlwrGpuB+1GqJz5iyfXWAQpEoqRBYu0eSyk2ypDVRJULHiZCJnQcXfan
X-Gm-Gg: Acq92OHWTIvQN6ELt+RgXDsqVYKpMgZFdGgVMZdCifIHMQgsn0oNBmODplRX2lOtJv7
	wFswwobsppMTUYWAe14N1wnTgE72wd3yg5A+2jQRr6T7tF/anfe2Cgy9FdJ/l2sxlkUR3sq55DM
	HMo1u2pToPVG0OFDwp4LlTQT39PyoJCrKP3f1OdCOG+x1cyg8/wZC+k1o913+M0zdsfYFzDsK5h
	Zj7HDnU6hCm+fBo0xf8skYhcxQ1b7atJbS0C/4diMpc4mUG8ybXw5rHzXaP6evCXrzAW7yoQ5Lt
	Bov5pr/QmTvbBuU63cod2wLsac2Q5o6+wBG3ScKmK9ZlWDs7rnYUYs1LvolFrcQCP4L5dyFJPvP
	ZavwKzRGGB9/1zs1ZwwTdD1UaHMdOQDp96mcoadyaQbeobo6ZyU78szk3ykzss99Qpf7ipZUJOU
	5V90M9B8tbjHvadiuh7onS7eqcHYeg/8x9dTj7bdcs/dew0hXA2PFe1a8FSgRbp/fD1j0VTop78
	qe+cPylZGnXZ/KK4WFLGlWeNaK2GHTVuqi5oz5B5M5qd0vL
X-Received: by 2002:a05:600c:8184:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490b5eb64c9mr31845095e9.7.1780475111459;
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: imx93-var-som-symphony: enable ADC
Date: Wed,  3 Jun 2026 10:25:04 +0200
Message-ID: <fe924e4d6f7371d21eb9c2414daa7448396803cc.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable ADC1 on the Symphony carrier board and describe its 1.8 V
reference supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add ADC1 support

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 56f8744c861a..409c7e74ffe3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -159,6 +159,11 @@ led-0 {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
 /* Use external instead of internal RTC*/
 &bbnsm_rtc {
 	status = "disabled";
-- 
2.47.3

