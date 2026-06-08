Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134233CC31A
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913392; cv=none; b=nw0BbWhmEG8rqCd1xz2+18qR++/pk9VG/m7JogOAKed1m3rAy9fFR/f6RYw7kgULgYSsWN0r8bHyofiLyYKpd2cAt5/Ektm3TR+ATyCpnIfJ2B0/c85LMmJfOwsNJxscSqswCSmqU4YxDF45P3A8v6GajwePR4YA/Pn8G80FMrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913392; c=relaxed/simple;
	bh=9BQMrDtO9oBhFvxKCkIkL3CUfDVI9ihp3PrnLxkZbNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Osm9rVnO3iGysDtZOVVk7q8SiedsxKd+MUuItgEP2np9swDk29/K1+UxmBEvKZNLLWRt2ZOev70m6WmSI2tp53dtDL3726hsS3k+Wsikn7TEOp3wTfYfwtzNMP58oGrl0DGyRnNBqNWJBkcuunrL6mhCPzAEGefQYnKTEWJ+BHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5VN5bjh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5VN5bjh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso33269225e9.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913388; x=1781518188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=B5VN5bjh/iroeK4zFJcCGM22RRgRgcxNzquQ0HFGke7WgJxMdKw0TR+a6QX7qxmbIE
         q4sM3SrZShuJJGwYkTuAWeLwhTUtAac/MnjPN3fD3T2oqXWUreBLnFB9U3Zl278EIllc
         8tvSodM7q4jqIvQiADKzwQTVAHUwRZfgmhtk2WHDLL9nwrlqFayxpOsj3uq4cBrTiUO7
         xJq/hKjoc00g6fcuhC2EqvPEDEZFg8y3nUWxJmCb/SobLP7x3eZOmJbDZX8GZY7Lmbp0
         xDUnERSz0A+mPOO1hURbOODZqyxojHgENwXpMAnudy7GosVl1b56hjePpE4unEUfRoPv
         lgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913388; x=1781518188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=KoB+jd2MQ+PEvdXJMMM/xEflxDy/eo1W46NER7SzYKefADPR/RAKdAveSK1HGfJS42
         XIBGZSv/5DrNqlDSsWo+EsxhaMsggf3aKkAnGg3hz95z+n4MwSQF2JMmuQVEKEia3NdJ
         wmP93ceqPFHb8A+nUvF5pneEzNgc/M+LNejg6+Rh/1y9Py5vIniXXiUxTBa0jsXxNwsM
         WdT39kymzgEpMWLbJFXIo2eSu+Dk5g0KGEJbSX2/WD9CoFF6insTTkzjX1DRwT0UZjD8
         JhC+CLDq9+hzzEQdSOox2aTqyDPb7Ko+oQBx7xOKoc2nuBMNOozgw3IWY1UiiDdGHxXW
         TblA==
X-Forwarded-Encrypted: i=1; AFNElJ9ltvx5VnrqCZIxu1JFey4srki3Bsz3zfPSAlDwXaHdKbsiUM/5RryeyP4OkiQhIyXNK14MQTTfgqtw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl/vg1k4VW8eL8DaxM30+jd69pqfPtDnA1RAEEHQ3OLtOffNZt
	DkwyF39CdCfVwPZ+jC/OXH5F3ic+xG5dfBaAuoKP8bZQsfsGzKsu/8rL
X-Gm-Gg: Acq92OFmQ1adHdW/ElEPEX//27Uc4m98ntXC4qvlQ4OAFHK2wtt3IpYQBC6eB4Z5Imd
	HdkvLJJ6l5k+KjGyfcpMihkQWkkF/ESl31Pod1fOYGNDaJoVeHkZ56TPcht5HZrovdewDxgHj2z
	JMSvp8hIGrhWY3wP8b3ARrfJ2Gx7yZPfDAkZFUTVwCxK5xjCLviWzMXYy2npL8Uu6g6+2SEQMpc
	h6l059/NFEA1/ZuKHXMnwsnV7OYiT/pcDHtpk8s+5Xam26qpsAL5+hjfTM9WSGLSwzsFhdX7TWD
	fW6IRw1XOq16yh7TV90+HDIXNV9XmFzq4MxpuppOg/bDG+CqbrW6/X5bk3+FQpXmMFd8i42c2s8
	sBNQsxMEHaGshqfoW+4LfaTRwIbSIZVhv6q34d+e9loK+PPe0HKZHxopHtpXoZGtVUXd+Hh4ZjL
	Nf30ksNiDjGOOYFcxn9f2kWO0HGeQeeFFHLQBIaxs//rNe3Cox9Oi/tgSEDdXPPcQWTIzcsq/3e
	QxdUunVYd2M+31VslMQnbwPUQn/VrW5t74E8CWNbRrQjVyk
X-Received: by 2002:a05:600c:6096:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490c25ba56cmr246682905e9.8.1780913388321;
        Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
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
Subject: [PATCH v4 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 12:09:28 +0200
Message-ID: <46a145f964514cf82e340cb0acc38d4bc310d4d9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index c7073fcb679e..4f1d61c55ffb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

