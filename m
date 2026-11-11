Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384790;
	b=ow6KRsU3LO84GK2XPkSSYujJPVe0HTzspJI0BRyND3S3RzS9uss77M4C7q2EdQpEKH7Z
	 nrNKWyejXLHIvr54BNSY1oRLBd/wm7k9MvedkExo4XwAKnRYiv7SJRcrG0F4qws3IYLUJ
	 XolkQVWLHdRWHsVLV2faplb46B7q3fDeaIUaEtM0ZWYtNmFuRQDiS+EaJfF891VEXY5an
	 Jk/k9a27qjMv8rgudCsIL095z2aHFMCfLCi+V/li9Oy7uC3sCAR7NwnFq2aikZ3aj6E++
	 +p7+nfpTiCs/ZPttuSuLlICkAdoOFN5PK47mDLG2WLZLQvngn9RPAdjtgUNEunCbb0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
	b=WSArbA3v1sZoXlz406ZE7FhlvOwKrJyqDEwSwxJ/UAP1TDi6ZleGHpq03lfu137UIiCA
	 DDTw7APwkuRDkDD5iUuZlPTfZs2QANP9AFuejrw/ImtiYV41LpxtqfhhhbtD34sjXgZM2
	 0mR8pzTPYVTJgggIQfaOWZj5wfUaT8o4ZcnfmIJKtqK0THpT04SRMtyjxcyz6pxT/2HFh
	 LWmb9Z3L9ZgqvUT73Vn4ho9/Vhdb2SsAK45KTMF0YzjFE4482fBc24dbfDPaLMMvdxVXX
	 rEPYxMlU/K2IDnC3uxZUpHE4Zr6RExU/nR+3WOhITLeBqX8GJEfr2k4cyak/Z78W9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bgcSh7za;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C65606A326
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6C65606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bgcSh7za
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so26487215e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 00:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384787; x=1794989587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=bgcSh7zaemWNqvGsnUytQTeqNBNJWJnjKvT5yvOOlcsQPt0cESasUROagaGxfSNfa9
         hDSRRussF5dslkxMQeM8k9y05np2GLO0qn3jYfs4COa7Lq1V8NuXcTIvRCYWNUOFlLrj
         xeEKc+K1J0Zqiq2VkK4v8sk+QobaQasQWySYPjUfR7wgX0agAMPNtQrhsJCXV2MbPo3N
         ur0mV6a0ycLJKCIdclExajsbDV5iODCqFy0hHDXjmlHPRaI0D8l6cs2PkygYfuIpvJwc
         z9qkd/gZL87hDHn8sqAS9AoOnpyCzJLecaAZnfLMznML3wCW/bTBzo2e6GfHfD0ZsDjj
         KYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384787; x=1794989587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2y9kbz82lKQZudwoFQR8NgKli+kQJ6rKGK4CSSNZVM=;
        b=UR7SvsZThvDNpsBQGZAWPUixdFgByuOjYfoBr5pdK4E8uEThqoYMYO45PDHpeA13CN
         6rH+fq/DHjCDUnQAwI8OZQQyr/S9m/7+ZIgSr9wepDFqmjmdYg0W64dBdsVTmkOqu0Vg
         c/WikkFzP9x/q6f5Yp295zig8TFx2var/wx7RSvgsQnVtS8D7R0mY8Yt0wvg8or7K+qw
         PzSuH2K7kiPweD0bDzLiJUnoMJvPxzQMXVvDXGE9e7hFLdk4iw9C+pJqcTV/vaog7K2I
         mvLeZhdPxAOOc6k82wcsMUZrrzhH2EJIhUI/101SHUVRpIj9jI6tNDi/JlLHc2cpCrsF
         L/sQ==
X-Forwarded-Encrypted: i=1; AL+hErGkSQ5cpYNfGsREkWmX2+dgC7UOD3heTGWDPMz+GRkzeYxTfVC49O71ksMlz/qoLsxG1+0zz6rNjhCt@vger.kernel.org
X-Gm-Message-State: APuU4Z+/zVVpBQ8RpdoHh4fC4wUzFbs+7Ynmc7ExBJmATzXvSZsCl3O0
	Vo3pTwTdUiUd3Qvh6T1TMqjo1rT68+o1+jaEPyKuNSuHC0iTFmCv+udhpONX/1d5/vM=
X-Gm-Gg: AYBFou3l6I2bP42DupZa4pw9sfyAzsUUEIDNbXz2+5J+HD91c5rLZ++U2ZPwAPSl2OC
	onOuFU2wEa6OvMFKMaJyWHbplnL8EioW2T11OBCE+2POE9l3wx8NOaur8eYBjv2+MmTEEA/i/Eb
	xqZ9n5AnwDWWDx9AX3Wiws5+VdFOFsArx1Aum3peULNASZpz53AVvbgb1isSFdusRKwvKLTeVer
	nzCcszsTldZc5IPYJJh4m+F4pbCH5sSZqODbPcFlny7DoI9a2u0OQs0abjjSUXJynhkFS0MiJz2
	6URtVgRitPVxo+rVU/zIILOP2tCmxBkDKsMxed0zft+VkukM7SR2I5fT+6RDH8M6EaRAHYehfh3
	d6LbFTkJNKR3tEenLvSAhvlADcRaDCezB1ooTurSgekald5unIukdV1nVL9f+Yse0SwLV6ofySJ
	se3zmRKJtKIZqd+9HgogBCM1rV5JOfdcGT5VKcFEIg6+sCX1B9lSQuBfydrKtevOlWoJneyCEZU
	cSd74HRMGhpmZPA8sjXCn2F3LCfADMUS7+02DC9rtXhaoTl/hWRGo1OMWSuy+n79v8N2nN2FMOg
	tZsQVzZP1cwOpnUgbQRAFiTjm/ThQfsP83CNCfUhRniG2eqeSyoHnbYakxHw5nD6g8WVlRK2Ia4
	65DchhygQqQ==
X-Received: by 2002:a05:600c:4f46:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ba0937bce8mr32273765e9.28.1794384787479;
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:07 -0800 (PST)
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
Subject: [PATCH v2 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech et050fw01-kt
Date: Wed, 11 Nov 2026 09:11:46 +0100
Message-ID: <20261111081150.950272-2-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
compatible string for the Youritech et050fw01-kt panel.

The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
display controller.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..c2e442c20c0c 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,et050fw01-kt
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3

