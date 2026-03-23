Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB00456472
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269823; cv=none; b=Yj24QKtk8mmvbBiT13jzfHi4G1GdSgeZR5mI2XwQTDvdm+oupaoGAz4F84MajIEXy9lC75FI6BYxKjPbUv1Oy2kEbZfMSxBSEHONpa4nHdCJ5iuYk9OumNnt0e9NHZkwJP+nKul7qzp76dZJPgJtfLjFWgWl/R6JOBSUFTaS19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269823; c=relaxed/simple;
	bh=505A4j1K+3BVyfKFAUJFkb0POt+oWwmpy0RpscQYCVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STDoMWmqOMmFMmUHCy/gXUYgAXyX4+WuPA4jIve6C9/0INPL52QV4E9EMCB1g9kpEYpd4ov9aZDP5CWnhpotuyTeBChoNhRpUF+JMDk4MYpvKdiGyUsVkaIxfBFV7boG9+RkuM088FeMn4sv/fiIR9MVDuygZskpgoWCiqktjSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL5CHaqF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL5CHaqF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35b98def50bso2976279a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774269821; x=1774874621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=jL5CHaqF9jr3KEcKhizi3aJLMVOYPO7+nlTgPFDHA23wI9XpJaTCw/5zIuQ5bGiUnb
         +JsWkg0e3fvlpWTXQwQeUhtZmrIKiiAogFmAeFIP9HbGauvb635OXKlMfnN1uQ4gxj/s
         sHXATQkdiT2s3yqm48OMxKbdCNdDBwD1qFwtIia7tTk1bzUTsyiiqjRofE84+ydrDb+r
         fmxnSs8x6ksC3vXt6eROxFQtFH9WHAqzxobprMqBBBoii9CSnil4Jkudvhw1AgtYRQyV
         TCyXYtkULy7C5CeJ5WJGN0lxlmZs/6Je2xbvREjaFmoFvw4pqaDbRBopwp9b0ogBUDt4
         Fltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269821; x=1774874621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=HkVjAG6xDEi5mlT0A2zM69Csr4cQMLThTIk7q/d4mKwnWFjVSirf9Y+YO6E/lrexdZ
         I2HfZSqv6+vDMSVs+HGQgMtsgRbHLCydg9YV0y2dXVjz++LAZO28mBjH9VmqAvCBZh+b
         mn+MaYBeNVnvlJiWkDFowUyZu0JMXlxi2yCq0meK2PhGsfZPsQzlA8y9LXEqe2xSbNFC
         fFS3qSIvAhAdib0NG6N2ZTFGPXkKZpoMx0/3EQmZs9NwSpOQvreq+09Pqrk0+t/STuwZ
         AVyhRRzxP5OaExPOX6qMquLDCIW9BGLuRJulpuhNBr9EVgHGWAWueF23Bnjwg2Bmvl7p
         2UUg==
X-Gm-Message-State: AOJu0Yx7AzvbF4R69ymqUYf7NqBZdWiYmFtU34wKvq9WhRmM1eGTRFkk
	xqu0PRH0kiKxJYWdW5Dn3m+wZAhAoKlFMKVG+WWBf1jxPKSr1alSKTOd
X-Gm-Gg: ATEYQzzOJWEsp0IYFq9u9md3P7zBhqQLkh8AOi6wxsWvyk8aUru88ABZNDQy3mbFvDM
	kLXhqSWnFNBRBvD+x70RcaEcbkJg1FwMzMiwNyppOoJ8QKV3z/1rhTFD+tafNgCDhAl+bDR6g1+
	12+/lePrLseusJ8jC9jOjc49TBSv2kMncTCUBqVU9pvOXXMAjonpI4eEEFGwd9gh0aSTeJOZS6g
	rqVs7YajaTT0SCrhhVycUsb3EXcqSuDexAwWzi9RM75PhQMvYjjKnVKzjUjTKLtL4w2X3s/GcIs
	YH5ieYgFf6R+00tk1pSVKQ3ABb5KJvPYrdm0gAjVJxWfT/XHz1AZ/JQk4X5NpVgiZcCSy35YM1p
	xywt3LKONdbTUKi5ue4IuJCTYZiC4+lZ2UAQYK94boDnWVr3SW6P1zuTQW9ZWf2UEZsYzceUb6M
	HuDcJKielM3fl5vC3Y6Rc+OJkSvCm3wclYH+Be8u+rKbX8Ub/j5+yABlXYorOMel+EY6sRIyUZP
	B0=
X-Received: by 2002:a17:903:244f:b0:2b0:5453:1932 with SMTP id d9443c01a7336-2b0826f785cmr120175515ad.15.1774269821033;
        Mon, 23 Mar 2026 05:43:41 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm103668865ad.13.2026.03.23.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:43:40 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 23 Mar 2026 20:41:05 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-sanmiguel_init_dts-v4-1-caaa48a7f7be@gmail.com>
References: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
In-Reply-To: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774269813; l=894;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=505A4j1K+3BVyfKFAUJFkb0POt+oWwmpy0RpscQYCVE=;
 b=/AEWcZkBMzMiJuEserz1UgyQ19R7bFmaQav+QptLCQ+XjFP3LFQsldiRbTTS6VLyoBuW+nhVk
 S2JcNJpv5lMA2+UH9ffIMhFTXP8McxfWZVo3RztSa03TuXxovztBu58
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=

Add Meta (Facebook) SanMiguel BMC board compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1

