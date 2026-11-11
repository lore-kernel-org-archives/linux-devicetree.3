Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384793;
	b=lecZRD9WQhLDmd0dLht1yxTisrFndso/ziu3WK1Jd5pL9HGqi2SPuEO9uxII7fpHWQU3
	 LTXbt4Mf8e92tGCjXrfonh9VHmvzOHc7KCTaSiVQUe1NelXWXFtilJIiR5N1EgxFohltQ
	 tscVxLD/6c/ValKqIuEgKdUfR/k9vhkR/0YaVpVADQvH7F7dvHkadge3ZE2y46OJBXzpF
	 a01gbnYa8uGxYiUgvAA8IjrVBtcZlfRWkeI8dPfAqSjJV0xTVfqZRtLXWuYIwOpgFYIZq
	 cg1FKOzMtIlhoEjhbzrBdwdmkUI9AMAl6jdeICDkIn44Sq0zqZcrMmwiakaT8q6wRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
	b=wQzOIj3GMLPfuNYLVhk+uCsZ9RlxNWng84JlmJkwiDRsC/CQRgmlVKZ6QCLE4snfyJss
	 cIcupAROkcLygCFOxhyUgvreTiD++ubULUavPnA8k9sUe84Xai4WQP32l9R9xve2iOgKj
	 5ddGsugQPqBbTEUgtpmWmDhpoLv51UHHNICGEBIa4kGDWvFxeJqGZGJjrtPQ20YnN/t03
	 jbhF6ZI1NX0qQeTn8Qe9/AmW1QF4Y6ch9KnuVliNEC638MTwj3QsdzCL+sTtxVGNaYNV6
	 a8ROM51PQaJ++ZOWf/LfbZ1QIZMNldcjGY0lkvAkqZDLPf95uVkcDBCSshQiq+hsFyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LTdeXjtq;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575EF60A262D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575EF60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LTdeXjtq
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so36921945e9.3
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 00:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384792; x=1794989592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=LTdeXjtqjB4WD47nf3Vukz4UpHLDqRlC2DayEHNk6Afl/UxV6CjILM3ZT8iyvey3qH
         c8AZ5safzisXkd/wXdt/zxXYITkoQ7Rs2xn1Q5Pwr6Yo8pRJgytdwxYpJziWhilTECIc
         0exvI1Lv00IN9+oYEKXz8p343LK1LD5CcmMVnySCO90Vq5rXPyXlvhmB+3I7lpEGlh3Q
         pzz0azTg2l1qMhilLO+HhXKXOQaUjvZkzb7OkkCsBK0aUfVDDChaCFdi/g0bWK0gXtzX
         Fo9mo4WALeyzwks7SKdOaq+mu+FPyj+KzTEriBGwSKpVcEetBXEMUFtoGHqxtIjg2vGz
         HDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384792; x=1794989592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=QYh6Kbo11quYfw5FGzy98DaZRmJEGfUQUjy9wI7tiep2AUGdTZ59ySnfUBvoGJ0b7M
         AffIBbL3MOZ0P+o6l706+XNBPfVpMStPP5cwgcm/JvU1r7nijU13DGhofeVckdgCC9rK
         lPnciAvMbpJBTgoiXvuCF3m3Ebcd9q1+GFPqUbwFQKVHa662qv0hySNVVktf9YHMY3Gx
         U5bxjkQbS4DSqA6azshySq5GnSRPEGK6RMHG7KQ9y2rWO7uC5htoJ2FyDaf19TWlc5FE
         jCJN0gVkecOUS5mHLtmpKwqr2OtGTbEI/stKcpjsD5PWu5GdGox0EBDvYr+d3uOnTxC0
         1bYQ==
X-Forwarded-Encrypted: i=1; AL+hErGvsdJetMDm2pPXAbuQq4TucNW/sqG2BSpr6YmVpaO2WRuLJuYYryU1/qHeubot7kpAToQ05/8YE3+q@vger.kernel.org
X-Gm-Message-State: APuU4Z+RNjLR+790oS/kYtkhOC1u0HWs4Zdptb+GlgnqftNAowUyWozS
	E2DD0TsBLxkrEZtHJp9bh7LHuLX1XFq1j0nuiC04gO+AUf/QWtqg1Ou/DNiQyvQnuCs=
X-Gm-Gg: AYBFou0qoYQnUoaV82QxOfKHm16Kmze9aIonLobWsVw4VP/rDKHegESwJfdf6Nnirj8
	U6GJLgkjm/qVBoU0zRu13DLkDTjnE5l3FzUU+3c8m71Acq5/4zmK5szd6buX1SMjiDYcoqZgGw8
	4+4oqytPFRHFr/PoWm/DsMkUI56YcnyoWZp9hnWb4/JHE1OlL7NZoGj8r68SH/27cw0j75wz/u6
	PmWjFemY4B4WW1Nt56nSLLSaNJQTU1hJbFKzZtyYtmDgnPiKQv7KnKJ7xfeY5vq6p418ogxPjZS
	jWondjSnW1gSzZpu8LdZsGWszsfipC5/zQQfjypUhi7HXfDQ6RZ+gVxoWqlAanWTW4bPvts4ccU
	4v9GTNIjY77afM+4jNIFHEL6Q5Cuo7arRLJ4xQSBp8/px6fooVEneSY+JFfoMOd4lYp09WAjK0Y
	NFpVufUnwKdG0DUaPPsRzSA+iKvXzJ5P9hhjlrEfAgE3DJz6U3X+J3or2MX0FMVAJ8lT8BKJzH5
	DLkHuJtEAhgMZ/WQ7F463sHFHtPhNRXHxj/Z4LUWOSB/sOpOToLiBo06wAuak3OqhInfCdqvVzd
	1eojbmZCgvAniX+GJK0i4eRUDD5An54vGK7Wq7usbSaFYRnZm1JFjizW0cR8ESFxa+b08oOYI6c
	ZIKVRK1M2Wg==
X-Received: by 2002:a05:600c:8b24:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba0938a10dmr25548105e9.19.1794384791851;
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 09:11:49 +0100
Message-ID: <20261111081150.950272-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

