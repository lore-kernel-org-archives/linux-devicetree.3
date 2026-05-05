Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286354BC02A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005662; cv=none; b=Tuj8x8bO2c0uuM5rf8P9aBCTU2vq4U+P/PrQx8kDDQ7ruVz3A2IAjUimlkzGdtTRdLcns4Ubh4eCWf4M74fW/cN17Ma+R825PVU8+o0jGbgHKyWz46T7CWX2HWAsjMhSbzGfKjRNmAZ0+999fsCUP1wwIiyQskuid1q8bRhMJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005662; c=relaxed/simple;
	bh=9SRiToZStmepK6Eod4FcGlMmOh1qu0e+H6ejyB6vaS0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kR82O1AwWcGbbPK8Xj0NbiTJZEppFdl0EHosRDAp29XMwddQWsEOjeCyeg3m2wqkCUir+ImlLazI5gtvp/TG6s5MKcfPp9zt4XjJ7Hyiv7aYE2uCAjnYndGuJ85FPgO8OoYgtJKKO0CUJ8cqvDifUEKvjOXOh8MZ8QHgJMgzrq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3t1M5IN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3t1M5IN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so66099605e9.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005657; x=1778610457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=i3t1M5INF6rsFDZpZmHbZWRsrsSsDL4i+F5bpVMyYVvMCDsiOJCdq0smOEtFJ6LakL
         rAqhK2i6JrCsTBeaRdCMOt2vU1Vcrmu42jaYlDGtetlFFkzKlwJdW1tHF2Nztu1BYh2u
         2h43hXY7+n3GD/hzP4ZT6nVT5jll3wMtv+CoI91LdGdu051vV2niAtdlnDOCrLgM2TKo
         CQMxLPv/iYTMzih6m/DX5/cMeNbt2+6apBjQxh4XX8H1AjPdWS2WGWz9x0z3qeSJYcmP
         Z5vwsBvkpU46wcMx1z6unyZ5oEFlzwREQdn+qrzbX+Oq/YS0CFlTfZ47A69ZnUtufh0x
         lXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005657; x=1778610457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=j4WQJiUGvj6NwnqGSjiITCnueuuRLTjs7TJcf4/eBEq4bnWDlbh/PE2tTnH319lroF
         IYR93urC94Hsj0UQ8+q9gj/WIH4VR+eYpJVgU2bbWBnejjUcxzErtFYm6tk0l/vHrq2H
         t/bRFdXuWlPj6s/awmiLx7eS/GKYw6nqkBOlhQSAiwkG7IjCVvCc6ddAcz9zmBMBsiad
         1CXZG5d489c/fZsq3Q48pW8gYMYPqwpihZ0JlVZqlGSgx3sPMQYfrCBK3Ys2aFQj/BJM
         P1vVwMyrnRrqA3Q21oPhhMRunBoFlb0L8fn2xj2KKh6j/KzifikYBvtjjLINg3QO2Lzz
         YytA==
X-Forwarded-Encrypted: i=1; AFNElJ/yY1kuSeNNfrNfx1FHm6+uA/D4W0RrtoPH2T7Br8+eyykxfP1ZTFH545tbjVtowK6G9afpdXAAnjii@vger.kernel.org
X-Gm-Message-State: AOJu0YyHQHtgi2i52RyLwPj4fFyaABzXYt9hhRM+BMFFxD1rj1667Pki
	HW6PsDknFyL8VxwkZNqXNGyJehca1+3chQOM8b8xpelOsofkFeb17UVV
X-Gm-Gg: AeBDies/FE0xa4EZqL/na3FBrVwna0ACU5AtMShpc3J11PX8a+8ttNpmb8F8Gn0nhkb
	v7wBYFmorOh/ZjNh8WRvOSQNeqtNWAYk6yArLJGGNljh3culnWEoF8AEP7crcySJroQ2P1pjyY4
	590aaFQ4yCrKutrifTpOCcy+7esmX/VlipY2Szk1UmTd6clmp0o8Wr8zQAKimtBcamHqfn8+8Fx
	3j93thmlN4HHOTEkugP82QB36a5uoThxf1gxUNIcemtjHymJ7gKoHJPJVc2YpVGNxWIsus2wHy2
	8K89fOiPNf179X/tFpqBxUH9kslLbObM/A6axgxhx3sov7EFpWe7Sv/Vee0aX/Lv4oPRH2jtdQg
	yxwB6DDTjyJZOOxCll1HkSwA/cuNyFem09Q/g+a+dddRdGylZ4snm9pM02pV5vSNwCLK+gWe/i4
	D3HF+mmHJsdr3427dP+EKpViPYD8+gdrWpH20RZwnqMOoIcDLknoc9MegmDID3vGVw4LsSEhvJh
	ORGBDI=
X-Received: by 2002:a05:600c:17d0:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e526e115bmr262175e9.12.1778005657086;
        Tue, 05 May 2026 11:27:37 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 06/10] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Tue,  5 May 2026 20:27:07 +0200
Message-ID: <20260505182713.27644-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
can be defined for an ethrnet-controller node to support various PHY
interface mode type.

It's very common for SoCs to have a 2 or more dedicated PCS for Base-X
(for example SGMII, 1000base-x, 2500base-x, ...) and Base-R (for example
USXGMII,10base-r, ...) with the MAC selecting one of the other based on
the attached PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..51a8a418955d 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -85,8 +85,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.53.0

