Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722148165A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492391; cv=none; b=t+a93zv3IZZdPqQ9jUBhpG/I0qnM4eHUbcspKzWaZ0tb8qCYOGEiReuR03R1IUiZ9lL1hRdkpflHvBHPIgeO5LwZPIG51YpBzItNH6UhWiCkO7qXzFvWerXfwOxCEa7G4kqeFDJ6vnwapOL5H92y5kCo+V+FHeSvZE1XXObWCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492391; c=relaxed/simple;
	bh=klvLMbcrvp0spbZcM/iGJWrKF6UuDDMh15N2Lb9kHt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ch210hyJ9zt9WnBSWshpOt3qeiHMkcQl7AQZ20tvlmM43+CI29T1jhs2BaHQjgj62IcOeUD7oVP8NRIoh0sHznhdv+SbPcBA8lqZwc5h/0YDFJKx98PrID4HEnhd3jN/iatWh/zSKaC+EzdFpYZMHqq+vkDcgigP6ah1E2sQZWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7Fzxnqa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7Fzxnqa"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490a765d410so41610235e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492385; x=1781097185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=C7FzxnqaPvkHLJ7EDuyrA6ElJUgvgO3UljJojDiVeKVcORVUbz/Pj+sRetKbVVBqCd
         +EHpZXfWEwr45PzVlNHDTF0AbiwngieYNp5Pg2ocuwkiEzfBqs1YpYznmXjvqVaEL60z
         eAAGuoW7fAw/bN+FZPTWA+cQZQrmHn+alN2xt21vPi6FoLcyrInqXsboVKcs99DuwORZ
         BFAzx3+aMQ81J9o5dnn+YkSY9xn2ZlC33y6Kn0Z59ajRTggVa9wM9k99/HCVeEQBGL4H
         DLqRa0FZ9WodMKinvUskTf9Ifp72MyxXyeiAnD24iv9y7iJJRzQz1XHAZjCfLC1D0l4j
         wX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492385; x=1781097185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uIGJv06tp2fYr3qME+4/5ks9JXN0Cpu9SA6dXG0aL4=;
        b=qjv2JUu4ETH8XlHoj6kyOTcp6qI3z4QqKQVDes8sCNRrgxC1FFB68v8tkTpEYTYz/S
         Ig/gRTfe6YmjUpIX+N4KUPjXZM2NAqWPJ1DYbGdoUushhjVSQj5wcD9uSNSM/7N2T6qq
         hVCOpzSLpNvag5AnuAoyGp7unQjSPdxSw5oFBmLj8HLmqO7gxy1hH4fkz1yzYWRWJs7y
         2w06C5B/Fyz3B+ZXv9Ba13AgHTr3CS7PdFaycKTMfhCJPp6dt55BreHVRZHDGhrSSaQu
         zsmBQSBx133PkhvCxGat7HTXzWqnhkiKdsDwppoS2+V7SwdEY6O21MbGqeBmy6f5Oa6l
         mU+w==
X-Forwarded-Encrypted: i=1; AFNElJ+G0vx4VRts1k7g92E0Asj6hbzvaYnxu43hY0jXZVHS1l2cqKbuGY66swsadzJ7IaoPOznuh28Dd+m0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6hanrJlHyvUfkfiKlY9/Xk6mZ5nWCiTaUZqyNX6RkT9q9DeKO
	n7g9heO6kE7/T0aERwZgGEVIdTwyds0SHhTaun5ieqtN388Qjd64SiotDkhLbQ==
X-Gm-Gg: Acq92OFY3Jc++o3ZMM+aEI8Fc/burNb1ltK36LLNCGspqOOBqFKZUupGjwNbeh7TCxx
	KVRjbiaA32TJ6s7robmjm62t1fJl4yi9ERJVYU9f0WYTXz0freY0EyJEnBDo21efLFDTjx0O9jn
	Wmbjoa41FRyZBCRZXV9Oak8tNnmls1nMASZ/XOFHzp82yoNd7RIN2rgHAJcj0iNMz2Ae4tfBAm8
	UmyhWLB8i38MOYaSrsp4s9OA4/lAoPMslfYe8TEZ9zaf5uKdGjg2OMS400cpVDsSOwn3UBjUqKG
	Wsj/1QZ9c+ul8DPhGuBYHMCkRGPzaKNmwBoFh/Ei5653gcvtONChv6RazDorh6wnxQ/XzlrS+X2
	PTPc/O+Z9ftHKkERkfvCiHK4IjkxpF7pbiJ1xCticjeIl3Js8nHUIbiLLOjF9YWLDrAd7tKhCdl
	4LluRJ01ZBUZCSrcCGQY8FttcRWR7pUvfTpQC39XoFiyMUN48WPzSuu8aajiei1Z0VVlgeJwmDz
	SH0dtL1GRhRJ4FqpxfGSBo2C+P8aesJ8RdSfjV+ENB16gCD
X-Received: by 2002:a05:600c:1989:b0:490:b9fe:e64a with SMTP id 5b1f17b1804b1-490b9fee832mr34646215e9.2.1780492384590;
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:04 -0700 (PDT)
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
Subject: [PATCH v2 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 15:12:48 +0200
Message-ID: <aeec2a409aaf8e80d882fde9af76a181dea072bc.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
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
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 98aea97e9438..91d24110a283 100644
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

