Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081138AC7E
	for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786830622; cv=none; b=F56PvbK2mPssikEJnhgQrnd1aJRsw8H/yT+EZ+btD4Ren5j+UHsZjGrwlHSM2OpbjTHJoEsvj4tL8Iu2/PD6YGmpZO8W/zsa6qF6XFKkYxCW/0crqatyWFyNyGjzcmPNAWAKgWLwg6hZ8koXaNeMq9YwY1q6S2Vp4EyVbdcLT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786830622; c=relaxed/simple;
	bh=XFoqZ+z5QG7ECO6zr8uQu6XY/OuKqIE2k3KDt9TGDaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlU3k+THegLOSJ2zqldYO3U113O5KIae7niDuv9yUnfjOxXHFfLSL9t9dPx1x7p/GsQC/xIrz8uYLM6Yf+cXP2JNQo9OBrY92NmoIo5rShnTha3wJBuODhbEF62AsBCGfMFrZUJF9eEiwQTTPvtkFK32b4Nk3b+Mgj+uSWvkbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPKkm6rd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPKkm6rd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d30c22b1eeso4444975ad.0
        for <devicetree@vger.kernel.org>; Sat, 15 Aug 2026 14:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786830619; x=1787435419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq/fIWFrC8Wf8aflDG3c+bHNDMcwMOJsMYCo8Rnm+2U=;
        b=SPKkm6rdy1iNBOefB9iN/4yGktF2WQEkkDPl520L/B5KVw0CsO8EYMlIFokk0o64NN
         EsZqVGLCxBMncV82ZE4pwWuA9aDgABVB4lQ1SdwpzihB8ZBsucjOAAdq8WQtbDguJaNR
         dT1E70dtO10r0uV78RRs5q0DYPUmZSSxO0wjRbxvPA5+yg6LBbfCTa5yCYvq5pnPvS3y
         xjIiJEIL5Abw4gFOR0v0HP/GnZKg8QyXpPQ+OHkr2EPfoov7pMbXYTXLZHMKCeN5CkVA
         s5ELrnMwkjvv+YPJ258DGTBN8/BBV7Hf9dJ42uagKo9NoWGiyezM+DyzTWww+/o6fNew
         bVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786830619; x=1787435419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq/fIWFrC8Wf8aflDG3c+bHNDMcwMOJsMYCo8Rnm+2U=;
        b=mStHtLvd9+asjxvW+t2Ae3pom7D8VGr47OPBb6g2n8JtEx1mSr1ojuA715NhVUbig3
         YBiIBlhSx7gyKwoXVz49siZuuw7u9CRUHbWubE4P47qn70DjF3vpwL4Z77uE/hLWU2od
         iukPNlkRn/5k1eN+0wigJifN3W1lnewtXEZsPOHKCSCVa5dAhfb82uxYHMiwuQk2NfJf
         sA7/e+ettaoYdpLGxDxpqwNL7kRTkkQshCWzqNXt4/5t82IASjdBciOGnaXeP5zNy6Ty
         oYY/u33BhhA0uX9YoFb3/mP8UyO7XTilSQlX1jQapKnRznVBMdEsPSxyUXHi52CGUe3y
         NO7w==
X-Forwarded-Encrypted: i=1; AHgh+Rql9AdhFLyW4if5xPTJFdhJqLbJ61yyTMACPcRjp/j2rrsOJa2a89B2NaFYJsFbk0tfWVLUNRhorzqN@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtw24MiwZLRn4BRuTi1RVfRW+Q5etJxhHyJKeEogUS8fm02db
	6K9ecZMCpKKCLu6WIILKVIkQgUT9mQd/aaC81ibTyB0n7KENiPoZHkRr
X-Gm-Gg: AR+sD11gJsIX2hxJEY3D+S6SEZDLxd28mG6v5ComTqz0PIgCOvQfZynFB/U9Rt9C9YD
	5lXQfRTiSeqtO+/qD8Sflf5jXO5gPCHTDyXc056U/y/dubexECVsRhS0N4WdoeQQjRt1tyt/L1/
	jszr6nzKj2eG+iQzI8aSvBKeRfMp+g0KD2SHFpQ2aMfxQlWXxkUUf5EEb8O32uv+5/ulr5L/5R7
	KrQccBO8gsgz6R5KHh7yuVLpe49JfR5pKiekv4W2YiRV/YIM1nU7/6KczzaxhLkluCt7RH4ME7M
	6EsIsbKy3CtvXw0IP8i5fwa/vR+zW8GfPvhF3XO24QA+Udxchqly0XcQIH6G7i0NHghr9gBIZJc
	lViLXxJAcWdQ0CJZJt2K/x+owbiL8fF55VKPb99p7cntDKwRUM/90dBJGOswds/uF337Gdxnlek
	hw2h2rZmbFZ6CFkEn7jkJKoIffbkjaGn90LVqjY53IJ3abrIVsjlvG8hDMYg5Mvr/xrhABFQCkc
	S0GPDFUHfI=
X-Received: by 2002:a17:90b:4c47:b0:381:28e0:6248 with SMTP id 98e67ed59e1d1-3933b6fa584mr12370734a91.1.1786830618690;
        Sat, 15 Aug 2026 14:50:18 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141388b2554sm33541829c88.14.2026.08.15.14.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 14:50:17 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 03:19:31 +0530
Subject: [PATCH 1/2] ARM: dts: ti: keystone-k2l: Remove obsolete
 ti,davinci-spi-num-cs property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-davinci-spi-v1-1-a7f57dfd5262@gmail.com>
References: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786830590; l=1015;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=XFoqZ+z5QG7ECO6zr8uQu6XY/OuKqIE2k3KDt9TGDaI=;
 b=g8WO4io71QaI4Ew5Y7WTJ0khQq7KbCNYzY4E/lg3TJEguYq3S70aKQ0/uzAD/IV01GCnAsVeT
 Dj/b6W3jGGfB1M0hOTZXP0IfuLKzaK1jBQx4zq21KJVcczYoUC4qh0e
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Remove the property `ti,davinci-spi-num-cs` that is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard `num-cs`
property instead.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..65fdb45e8368 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -400,16 +400,7 @@ mdio: mdio@26200f00 {
 		/include/ "keystone-k2l-netcp.dtsi"
 };
 
-&spi0 {
-       ti,davinci-spi-num-cs = <5>;
-};
-
-&spi1 {
-       ti,davinci-spi-num-cs = <3>;
-};
-
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0

