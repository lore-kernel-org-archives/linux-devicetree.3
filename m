Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2840F744
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375610; cv=none; b=Y2eNiRqmzvCBGCRZxDT0kLKrHM/I+4LpymODGumKzn8eVRB44uP03uRQl71L063y60+pJVZqmipHcq8vT0J0H6N/9L0UrK4/apML4ymg8LYpJorUeAp3FBenPqGkeGpcg/ssS3XkS6+X6YjDjOwVnZaEyPa/XCcYLCRyW4d5z7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375610; c=relaxed/simple;
	bh=AHmaNY7nawOxPlTyMrh+owRJ7CVGAzGmrCiWsozDwmg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd0E8Bym3YL7rJHDt/sut3d86pskK5mPf7LPt4FA433OSUiAG54FoGfWGmbecC6RILwwuARBP7Z6lIz0kVGGLYeyxZVrw/vuUUuMYFnADeg0xBxrNlpnj0f1xgIZZHVeff54rA3G4frE/7sAbhiJmy1YqYrCTs/ELg76ZPEGyAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lOK4MEZl; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lOK4MEZl"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1631036f8f.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375607; x=1786980407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CmMtw0/76OA+jV/NNsKwfa9KgyRSKCj+2VWv5bnUCFY=;
        b=lOK4MEZlp/u58X7ZJ8qx4yjbnnHwRrcOLfSkhkg37QHO3qjO8PkbARY3tx+p0Cdpp7
         lN65qU5Bbw7ExKrB2qF7Qs1cW9BGZxXVXUZo3jtHWl/gE88FxsJjUitXgMySK4Kv7HZv
         5Zm3shqWf1/f+aF58VZbl4JKF4/CoycJzFWcEfRuJpGqfMuHNpfywcqOSkodLuOvolBN
         ZLZWlC1FCkLeOAF6NzVCtp1e25rpzpnti73JAVm3AWx6whtCIi+mZpx2pMjlM88MLVUP
         UAffpADKzV5xnMhCoUCU0yBXsO7PruwUdcLfdlaeKt4zNNwRjTZq33m6YqYJwA+wVm94
         DKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375607; x=1786980407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CmMtw0/76OA+jV/NNsKwfa9KgyRSKCj+2VWv5bnUCFY=;
        b=dlmbXJSL3dmTiOTMpDpuPWX+a2xtiyzoA4SskfN7SrDWf1KE6us3eAOPiQv7tSTZZB
         oU+mSSX9YQ35PkRRczF//j19iL2pK/4TrbIye7+eHROMLFWeAKVnumtVNU/AZp+5ZEoo
         0HbnBwR8RHJ+B7LpFeDRvNof4XxyhtcmdX8E9ZNO9kqbznxFnw95FoGcna/mIqq4CD1d
         21JVmFDxXlGCmpyFlajXtkuTjn3DTq79ercLeu7TNqNtC2HWJeLJhN590ouFSAdbPalZ
         UrqOnY8mMD7hotxL26ppdbGY6Sud1odSL8DJnUyJ3o/f0On7dlQuH/Hto/IH4O4O2YG5
         DRwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrkq3sD79/0KBBC3uSFxepcJBY7a9cELH6JL5rKmYYEQReTcDSOUq3ELNIXIWpcubVWKD4YPjwsBom4@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHrBjpw+ikJCz/DGpzBvNigNNS9chkB05V3JntIMPIQIsmJLr
	DRKDCJQrRDPvGpVJU/Dt5KzimAkMLm3anVVg8/DVM4J3Z5y0+lJGKqRX
X-Gm-Gg: AR+sD13yxo1uaBrdqhNNrgaxuUQFYb5fwd98u/0aRT3UNr91C5uQtERtUmedoqSH3j0
	sXWxKJf5LeYOzEceCtou3ajdzdK9iVyiE+IA32hR2ZmswZK2SMGKqyRgznVYnMCwYDjU5LXNJH/
	SYOU/RUlo1G1qrxZp+xsUTg90FBHuaWnPXABDxRZUXF7do7DD6OKPpXS9qR4/hn17l3S+Nfo5Zv
	H+J52sHEl4+TWa40iDoT/lxQM0rlrCC7Cq8aGOE4Zr45pT9vdwuoXWF19OaEXLx1mxATSVFZoJj
	3WLL7fTRJMl6gE801ahlUzu6FHuN3NyVRgGqGKqMx1imyhu77v3pgNBffezUrzhh1wDh4EOdtp/
	IX5sS3hpV+Pm4JU0SuXN1f2jy6A57QMPxjhJaDsb0IASy6hfdD0Llot/NtQExc4MgLcuhZPsNqd
	TS6os3Zy6Gvty9cG2nP53sSv+ai9ri5mRj0EwhE88sQiuyF5amshiXNVZN9TY/Q/wM5Wq0W/yDt
	YNG0lDxQl6dAlIEqqIGE8zD1YHGBi4HzbHvXS84Lp4L636q
X-Received: by 2002:a05:6000:290a:b0:47f:9283:1fbe with SMTP id ffacd0b85a97d-47fec475828mr65854797f8f.0.1786375607021;
        Mon, 10 Aug 2026 08:26:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-480021e8cd0sm34952469f8f.17.2026.08.10.08.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:26:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Jacques Nilo <jnilo@free.fr>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Gerhard Engleder <eg@keba.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 2/3] dt-bindings: serial: 8250: Add Airoha compatibles
Date: Mon, 10 Aug 2026 17:26:34 +0200
Message-ID: <20260810152636.658955-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810152636.658955-1-ansuelsmth@gmail.com>
References: <20260810152636.658955-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Larsson <benjamin.larsson@genexis.eu>

The Airoha SoC family have a mostly 16550-compatible UART
and High-Speed UART hardware with the exception of custom
baud rate settings register.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 039bd392f876..9a3f596f8a0e 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -105,6 +105,8 @@ properties:
           - ns16550
           - ns16550a
           - ns16850
+          - airoha,an7581-hsuart
+          - airoha,en7523-uart
           - aspeed,ast2400-vuart
           - aspeed,ast2500-vuart
           - intel,xscale-uart
@@ -113,6 +115,9 @@ properties:
           - nuvoton,wpcm450-uart
           - nvidia,tegra20-uart
           - nxp,lpc3220-uart
+      - items:
+          - const: airoha,an7581-uart
+          - const: airoha,en7523-uart
       - items:
           - enum:
               - exar,xr16l2552
-- 
2.53.0

