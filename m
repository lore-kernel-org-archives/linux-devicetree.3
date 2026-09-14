Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4583403E1
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354918; cv=none; b=ujjd2Obt4bo2FR1PI71FUr0cqEj8vWxwnYbZ8cda6vj2SQ8N3MXM459oVwM+74UFN9C6FYSUH4z7IgCIG3sl9nWK1C96Hv1s/ud5eY/yeibTREbpGP7NAKjFTNsMVJkTvJZq9O8u11Wtt6XLww+OcjCcPD9NjjZ2tTUKSgE3TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354918; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W5G1KOf1LeUnQTK6D10+nzI4MpFu4pgQoY2/d3nCkDOcB05V0wRPn9Y5hjCbs2rwGZc3ezK89x6NAW23RHuXG55H1OShjPrbQXCG8PgD+OilUZwDEtLMvwXVoZij414KqPDSK+kf8jA7NOAB9ag+cxF8xqrMwTDCWPNGOf3Zm5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X25CkXnr; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X25CkXnr"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0dd5507so459961a34.3
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354916; x=1789959716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=X25CkXnr2G9ChMCHY56iFoSQrjUdOEfiWomCRHt7H4VdZfp8L/rSsZYD0sedFScZpB
         MxTzm3Lxt+QHqYDnLsP13PRLVbdVPRT6rSa+jrv+7jmDmZQSo/O9JlHYbbfA+FubZn5D
         eaJyfelpF7qw00kFTyh9RJSh1qxY8QW3DKIWYCLSPzAkYoUFXe5h6txZKj7Z34++NgYP
         zDdcc61HAwcy9MrclO+odKkhMsTbEMDn5HAbQM7UGfJ32N0xaeAdr/XG+T9QmZcAnV5M
         yvaieOmLVAs0iIjW9vxdSIUzFLL4ko9X83g7QGrrw6/SG8RWoNg7rW4c/71MAgDnHX36
         cy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354916; x=1789959716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=Lkik1niC2MRzLannhd+k+NEXNPlfARU3dqKS3w86+ubkSEpwHesN3vk5NT9KpqjTP7
         WDSSrxmcTxVsA++m/C8tVgyhnKrE9I4TIwU0FUcjr8zubZryWIObv1C9FhjOgrNKjEgk
         UmFlQF5NcV2H8qdDSBJf2sPZaORKNp3NgsJgrCP/xeo2NkGuW2fAzXkXIdCuxzGSMBCX
         anPwKk3hiDAMim5tRrwyLNOLySktMRTsZ9cs8o/6/9dveEkJ08/9QWMEO7ioPhhyZTn+
         QBDB7tUQccrOAZYDVF9nfwcs/5gga2e8V53qdccIpD+y3JDxMj2tq9ny9xiTufmJTItI
         HdvA==
X-Forwarded-Encrypted: i=1; AKwUvByCyKsN6mKp9ZeCNtIQsisK0IaYe5kJQNTiN2HENuTfJtom8wniohGxzYX1tf7ysxcJFk4HGwPtM731@vger.kernel.org
X-Gm-Message-State: AFuF++kghSb7cxDXTY5YQjMaYWkwoWmxvj/pO54RYIgmNR0+RLo83GVq
	6Q9jGbdNMOh5/p96eJ9XhSGl3UBQ3BSLfN2JDVzr1slns9A7UDNHNYxI
X-Gm-Gg: AYBFou1NrRlwr7IoVAVEA3rk5D34l9P5UTXW34zGQmQHF5m1/K7qMGbnHmNHCcSpkhg
	dHqKoxrwCUlFtZ2z2UzuGABsZDIX8/yJxKzWAJzHBpJxY+jH3pk6YVikpzALg7zJ2QzyWpjLZBL
	Ao4NNU4bf4B2C7NYxegRPdJABvkcYTtf+Xng3TLp5DCyTGJoTNdZU6WxNmpo4AXW9ATbBFlx5lZ
	0/XqeJxVmIK/g46sgQqqBJ+j0pag2o1KLRcVTFfzp96lPUveZqftUPKogTY1xH++mFAWhhUOIY8
	TY3t0NClv4Pb8EvSNDKXJmgC6dGuT+rPyQf1K9VLbaYliyDslsk5jOaHks98gX/OPZCaMolQ34Q
	nFp8NKlfS54FcbzkwWiaGBvv5YfNC27VPlcnvtG8yLR1vhwwWMcJKCnoV3xZ/PkV3qAW2xlsy1c
	gTqLP9O8mso++HepX3oXhYtU+KB5ZEGkxRAsPqQJIMOx31JCzXj6LsJ87K1HNAyiFx+TJNOrKCw
	EmY8iLUC730aDfMU7Vf9a5zQoFO0x4d9JBeWGMBDCSOhkOUKPoCQbHgA4BELJp7iXcULwf4VaM8
	soplNpis0D1knvtjULQtUQQ+ZCEIKeE2P1Bw3NjhR5TAhDocZaS75V3/F2aWw2tER+xgHo/92Sq
	h2rwTQ9dWU5iAJcbZX7azzTOeu9SAoLqlu0ciKMZu
X-Received: by 2002:a05:6830:230f:b0:7fa:ab72:9dfe with SMTP id 46e09a7af769-80899b4c24bmr292105a34.22.1789354915667;
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:18 -0600
Subject: [PATCH v5 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-12-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

