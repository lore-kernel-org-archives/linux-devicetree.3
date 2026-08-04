Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF44485CFC
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 17:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785863189; cv=none; b=NEwyD20cMTF4LXQA/ZmpHpgKEV2HZS24ruXWLzKpPoHAtlGJlT0gejOu12qh+TeA7S5jvqJQ1hPvO040MgeWiC9uCi76pAsV4OnwHWe1qmeVvwRz+bML7UYwEDZHoYjG9ydMK09EWgEwk5Tj5GTKvwVZm6fAXkzagF4HiObNiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785863189; c=relaxed/simple;
	bh=rlYXKYm7bxRlc5nv82AOtjM/efwnX96ZRyu8nzXNm1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDHdxwK6IFJvxq/xFwpky+xtc3dTQdB5rixPN6maGvb2clGu6YEfzhvTuqI6ZBcf4eIls8QHnMcBKP6PA4CdOae5Wlz4Oo7DykgAz0c3FjGv9xuQ3j0gwEp/azTaSNkngm60QentLYA6bPF5j32rWWQe3+jL63Z79gX9EmYGOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKMxun8Y; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKMxun8Y"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384caf7b168so7902a91.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785863178; x=1786467978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCa01TPtHivagUzVUSgUMDIazwCfZxCbMPkVHrUWfAA=;
        b=SKMxun8YCSIwBYepjKfc73k5bQ4TGAGk0+rL/0I2W3mRgR6jEoNciW49c3r/ARL3HZ
         xqCQRH+Ia5s1YFxRYHiDVfnl69O09mYehEUCflSmePeJkSA+n23O6ECn6sEaVKsrEdlZ
         FBRQgrmnre4crpxeMKtdAY5uznFk/vvGbuA/rDtXJXDjl9BSRmDZGHFHRNzYhnU5v2nQ
         JaxwQhYYGcEkyVc3OfpWUIILG8K9Bcyxrf3PskcGXbEBd6EednN8t8MD4Yvw0vkCyhC3
         KehR+2O7YmpvYiqZKaW4ZrFHGO4doHchbl32RPVHdCWxbiAxRevs3+lcTx1JoWJS3RTj
         BaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785863178; x=1786467978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCa01TPtHivagUzVUSgUMDIazwCfZxCbMPkVHrUWfAA=;
        b=Jslt+jdf1MoIjHS0j6yFA+/F8ZuZdI+sxwJsTg5K7ht0hm5MGPYGT2+FotZv8ZPWG+
         4kvMiXgaXiojt7KUy5gbcpQCuFU6hm1lBYKo+YBvdjYgQ2X4G1Z0ukx56CyEFjNCJwAV
         1k56wkwkQGtJ5mtRQhPrO6OCzXQntckJ4jPJ8Sjlm8kr9uVaPCiKZaIoC6FyoNo24vDd
         gAOVXp2hEk6h9oU2nkJXruPIwuslCdX/KSYCTgiwWPU1BDdfKYZ4eZmESTb4/J3SL4Tu
         6lfAlx6mray3VaBliDf9dspekuShH2gw9MdHg5S3pecEL3t/6TcFW11sxseH07eWLrJa
         KKnw==
X-Forwarded-Encrypted: i=1; AHgh+RodlRupE1vNRaU+jauR69mnecEuie39ruw2IfkxhPI64susHjZOAYIdJh7jXBQbJLWgvd08QjKLb2pe@vger.kernel.org
X-Gm-Message-State: AOJu0YxbGEjGDHEyLb+zAuBW2BlEaGBEH56EOiHnfspwYiiwZBle40d5
	AsCnYq34hx07pPO0LegwdlxjnjkWCr281jNocIccYJk24JaPOHR/B0rW
X-Gm-Gg: AR+sD10mGoDyl6ktu4tggPBJJeFQRA1KaR2PcrnmlGrwQAJ8tWN1bdRcK3Upj8ULjAy
	5BJqe/+ftfO5w4dBGDGH+Oa6GAQeD3aAPT7UGQJkmFhbtqvXfVoz5DeTm59fZa2O0NTCjt3qqdJ
	jcLpdaiJa+QUF7G9c3DET+/vitbzjtrBgaCjnfTwEWyO1kUsZNWrcNhoUHBEybgks80ErU/a3+F
	wUUsqlY+/kQvwyAgCNjzuhrL4P2PQOv1tKesp2r0UY+YjDHnjPBN2rdd30FIgt34CYrnOEvvywh
	uQHc/ipNznjDvtSGbynr5CVeoGfCfAGtoHcecWMweWZpWAI/84HhfjDJiGHvBVOuWaWFhZVuO9+
	h4otmbGRTepYJ55fsvyvoUx7B2L4NidgdkeBz0+W9bOC5N/qC3mr6akslJgwMsLuiE8nh1QklfV
	t14H2FZsMrTG8bJi/MfHYCUaz5PgeDxzEJGryTPhTaXW0CcJVVdsZgvlkz5H0JWNHsomn7xM0=
X-Received: by 2002:a17:90b:264c:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-3903c6d434dmr472337a91.2.1785863177983;
        Tue, 04 Aug 2026 10:06:17 -0700 (PDT)
Received: from [10.15.72.252] ([2409:40c2:5423:e712:2aaf:ae79:67c5:476d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca52d329sm5147124c88.4.2026.08.04.10.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:06:17 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 04 Aug 2026 22:35:07 +0530
Subject: [PATCH v3 3/4] ARM: dts: omap: dra7: add da830 fallback to am3352
 rtc compatible string
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-ti-omap-rtc-v3-3-ba3bbd8af570@gmail.com>
References: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
In-Reply-To: <20260804-ti-omap-rtc-v3-0-ba3bbd8af570@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Keerthy <j-keerthy@ti.com>, Afzal Mohammed <afzal@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785863118; l=939;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rlYXKYm7bxRlc5nv82AOtjM/efwnX96ZRyu8nzXNm1w=;
 b=jRaD22MIYUlWYtJnE09LRZECtM9x23ueO9p7GAh/xAN4sHi7zwJ8+VFGp8hdOvWk7/EHjCRK9
 1vYWS0vz4qBACdUS0ueiRmyY0HGdOW06i1cXXM0Jz34WVwuJjLnUEV9
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

The AM3352 RTC is compatible with the DA830 RTC. Update the compatible
string to include the ti,da830-rtc fallback to align with the device
tree bindings and other board files.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index c8d325b0f57b..9e9609cf3188 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -3556,7 +3556,7 @@ rtctarget: target-module@38000 {			/* 0x48838000, ap 29 12.0 */
 			ranges = <0x0 0x38000 0x1000>;
 
 			rtc: rtc@0 {
-				compatible = "ti,am3352-rtc";
+				compatible = "ti,am3352-rtc", "ti,da830-rtc";
 				reg = <0x0 0x100>;
 				interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 217 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.55.0

