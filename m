Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403907;
	b=Nt+rNeHIRD5+MAqhke/06OQlz3KfEFj+yLAMk/RqgoEbcy5UmDcbn/4s906fZO77Q2gf
	 2+W+LyRNdUZUVgi/OUUyGYt1wHJEUQ0icNkCnMIdgM0qGvcmMAQu6j+4qTN9G9ac7AFgy
	 LP6e7rVZKArnyjpKURL3jNCJza9+siz5hwhRDc+bVGGcwRIvPLwqsA5Pjv2jDSR4H0Ssd
	 gHBLHvOb0oLcB1j8hdObRFgi0NWVccAJiilWymE8jpxCuhGlV98YHiF1ne+OiAGh16Ck0
	 7iz477wlBwjV7PQVwpXRUEnHGJOkl424Pp5ATzWj96tIDGtn4DRm3nSOt0KaB7CywXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
	b=xggV/W/zT9fkL8YjCVQgO52dHp/oHa80yjHarI7R9jan58dHNow+4okiPajUAza0Xcll
	 STVAjVlr98v/hqjVSCCX67y0CX/F5Mv5Bi5tJ2IpFdt7Ynpv0K17ocnEaSfrnnYh2EWOV
	 UI5zTXJnMx9IQJEfTFOrQUyJ0+W0jyX74ehMGU0mqmHKgYQ9Cc4rZhTFq2EglCBn4cTwt
	 pUDPj1ZHedSrco3SLE6W4YYj1BVeJGYPqcfV3ki/JyKfLR8trTydTKuaRy/nMFe2VEz0B
	 RBJTs7OZ/l+LeGGZoHQUlPRs0ZAmgMj0PV/sqWi21IjA1Sy2MPHxXIGYrDiNmasHD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iUcyu9Sc;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E8C606A8B6
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E8C606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iUcyu9Sc
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso2308659f8f.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403906; x=1795008706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=iUcyu9Sck45Kxmq/0s8TOCF6HLyN6AnOmFf45/RJxUDqf7Rl3sRYUl2duyVuZbJ15H
         w4AtaKkfo7IJfun7IYoOL9NadnZYVoTgLLqZK950a6ReRIiNugWsUJhf5c6pUciZni8x
         prqt34UB475UCSb8O3Ulbif1JD/93qWxbRf/bo2yrFX5yHPpILV+V6zwxRE+6LQgDJcC
         09dpq7oCPrPbS8F4LVeEl0yoTp/yEKT7bKDqe24kPURKYs+52jA9K5DqFNfSOtVBtnMG
         a5egcQIUSBciYkqtg4mnYkmqnMeNMy4rMht2cOBfiAED8hRrJvbNmuPHrAXp22QV8jkj
         /Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403906; x=1795008706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gDkCPzQ/fTCTlPmLlCXyz89P1VioVc68pLa4Q0ahyVc=;
        b=i+Q7cygFVQcZ5KdCZ1qludtNcHuRVTWN3w8v8NfbXe731fqlUOdYC/WeaEIVEr1un/
         qV1TWgFPDVPr9iXgrsJQtbpxMuxeT8To7xi5qSPEQL+I9lYiVvoXEVknzop2Lzk7x0mW
         Tg+1UTihOExrhB6y1O5FfWg1x5O/0QKGKJaIE/vAI32ancTun/01DmkkozVay6Zn/kkB
         1wvVbP4y2PUb4Uu5eEIF4rUuNDUElVybEeN+C5IcOVZ5we1yWw6IXCly5sRG1x/7dKP5
         bY9UMRRoMN+i1BsAm1g7wHWKo7tz221px24gaIIpfP7GptND8qVsk0wKIO1KQpK04y2h
         CNGA==
X-Forwarded-Encrypted: i=1; AL+hErFPRZC2qqglf2GVZuKZGdesOsMksndQdjB/7Yh1qL8vmbu0HOUnZ4ANAXMZl8hIQRn7akOrTCqg+QVX@vger.kernel.org
X-Gm-Message-State: APuU4Z/RPo9JM5pAYk00rAT1nGt2O4LpFcdxHh8xpglKpXb3W7t5AS3g
	DEXHNf0t4yxO3OZr53xCHd7w7sjnprpiIE5iOaVR3xt7dd6buItjDmbiAlGG+JHAebk=
X-Gm-Gg: AYBFou2xcLDLxNoRoYhxg5f086wruY9d0s+lIdEpiITtgxtBL61UuDPJyX37U2YFQVE
	LpOUjSaTvGaNYTp4gvr5Js1WWa4lJGrxm3x2xofJ9NBURXs0DGN0XhDvFV3vKglemWL4NB03g/H
	kI55AtUfVQ/qUlDOr+hWA9PHel+yqoAZhgEW06adxrGddSBeXozm0feGUlomWlxYksAgLgYzIUI
	72xKmzIbsJjrZJqv+KM8SxvVrYl7FUFR3ub2miVqZ2RpKWIEgLrrPyOUtniWD0EjbAZwYP4PAw3
	VMfURnVZFNXBKEXFy5QJrI69XU96w5eWdBh43KWV0hIutpqJVs3gTUrmsSi+pIZpPu5l8oLL/MB
	muimF7kd/rTchOYdKeZbszQSFwGUkV623/GF3AGgSDMf3AFc1p9zbcL77BkWeRG+Tm+Gh4WSTsb
	iv7JhTdEs+ss5OLV6MyYFyW3e741VSeeFC4pgeGsuE0GhRcD5egFQEGgN8Bt2QIOF+5kXiHE0HW
	MA8FI+oqNewd5PZZ3ObM9UO6swRggwSX5iZDIKwFIQ2qYPL8tKYlXFT4H+4wlK4X7qX4HzqonQy
	iZHTnonMZWf25dZp7kCE7XQX5f7y5tT7srQUJvTBe/7NVyAyX2AKf2ZJhn25ZDlufDKoPh+R2aC
	fZn4LrQkFCg==
X-Received: by 2002:a05:6000:4688:b0:493:8704:ad42 with SMTP id ffacd0b85a97d-49a90b3a0d6mr1095762f8f.7.1794403905804;
        Wed, 11 Nov 2026 05:31:45 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 14:31:18 +0100
Message-ID: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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

