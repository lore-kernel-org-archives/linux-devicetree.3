Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794438654F
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 04:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789272326; cv=none; b=H5iAINKg/Bp/gM12zUo65O8Dkh6VF77ooPeJc1hGdKHsuZZ16+WN0QIuNBxbiB7+mH6+YHG3gVLCgXiT+YzQVY6EcDzXwgSUfUsFQNaJ0i+vb+RZxb4LHTZb8qC6H21pydnT4GglYKm7WAOiYsQYXlrdI/t+kAKYDRoiQQuq+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789272326; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OhDhOT+Mmri++o5BCtmbHfiB7OXyohsrytDwXzFrodxUGHPSYON3pvo1wjy8MRDJ++YIxYKvV6cnZkpwCfWvX14Ae+1eik1L6TMc3MYyTilPLEFWvNbpfSsaINiyWGJmF6hB8X8F0hK+k3FZcPPLHvMn3v2PlKxkKbb9L4+OFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmqLCzDO; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmqLCzDO"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so345857fac.1
        for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 21:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272322; x=1789877122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=CmqLCzDOCu2p0HojwwpR1/zb5q/OFzzSc020JhWJBWm/N5wGyFAp5CSQMtGslLQudI
         IxjMYO75GY3DDfTrDDfvTB5+hpGSRiHkUl6LNSJUtPKqB/cD2FgFVt/IJ+E0fp4zJc50
         TFKGScYeKSkkgwutnwDdXONU+2rTC/d6XHssEjc8Ho0DV1VCmHKz57ypJRTkXTsmgruS
         3OLEHQryiZ4RGgtrwPrzoQCLXhzZtN+EtOmsR5YA0Dk0eV1g/9UyedeDRkHurFTFjAKy
         nxI1AoBbqInKwOzzZWVs4Ka4g/q13HfPnTcL7kSvSwTU9d1CnphFIAy4toNbtcN5SiJC
         FCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272322; x=1789877122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=SN2TyZot1hFVu2vsb8oIwGBsIr7Di+O80auhCuygYCeT2qzfdAaZcoHqSmdbfOLo2j
         ohvggucxyZ+NVo5EW8f+Potgq+NZopmkgUAv5iXfHPGjIpTrQIZwxsvnLQHWL60YXhum
         Ni4J05PZfAN2GHQ41mjq2yfxiSn7bapfKk7Un/7Hjh16WBXzbiGdPDPw4NKv1Ex6DH/G
         /PRZjxJQGyZMVkCsAGDRnjx9SASG2lboYE1uk0g7mjIe0VJE9LLUsYA/QHvCNQoTfdXA
         QJxgntjSlL2zsMrbx3RF+8plJIFBR8IXe3iB9Pl0aLP05GeIR8IruhkZZRNVJ7KM47pw
         JUIw==
X-Forwarded-Encrypted: i=1; AKwUvByi3jid1aFkiK8pxQy7rzQJxTGsbupOlFiFLIt0nSMrPZHGrwTzKVst2/VLGZ2BOgyQS+pyIN3XXC/L@vger.kernel.org
X-Gm-Message-State: AFuF++lcp/vx2/jM8KbeO3UkZ8uaZuCoqU3YcxEoOPmA9aHZ7n6tlF8L
	LN/APoB70af04fxpVU0ekHgwE6jZbuMR5o+o4T4wnx9eTwkt21PUseJn
X-Gm-Gg: AYBFou13nlMw9caxsjKPtNvBbwYIWhEnC1jtVQmSTBR2iksra6vAqJ0lfMuHJ86LQyJ
	geaK87M9OIHhEkL4uE7Z1PiG3qtGnAhNoQTnqbds9Qi0hWzTkUrgaLr3VPN8a7GzdVxvEeWf14R
	axS7+VwKoFou3kss/z1BSceDw298SdIba8Fv3DG/vhK3w9bg1oTVVG6o66PgpscTcLHVrOuP5ZY
	0WOjJxlelCDiAVhHQ8wTU2Yy1zgZizvQZlMrFBcwO0HM9wQw5ijuXWX4qS+wBaRYGGq39ASt/uo
	O/DPB+naUvc7hGv+p2blVbFjh7WYge55f3rojp7/bj+5k48A9klrEwdYXdpNCvIplQQ7EUZ1Et2
	HGXV6uM+wup/t7rcMtCLNBrhPSN9T5N46TQB2x6kyjkdNT+rc0rLcZ2sMSaV6a9s39t2OqitnoU
	5VWpMYkg1S7ytBRO742DEHKVXvsAws38ZqE82CO9UFbKgZP49XMKdHcg0+9+63rokzndYB9+VTi
	oLZGzROHP0yrINkiIdxmzF5oeX0EUwFTu3/qQL8BvQxtDO1d/hKyKIsrNgCUxGIwOj1LLBHlhLn
	T5gDdRjktze2988AHnzgX6PA+KDa49dqIQ2NkxSts1wwxl6W+MBode3peFPojDrIUrU+uM2H+gC
	Up7h6lcu2DMbGUSGbdYn+PmDcZ0xgSA==
X-Received: by 2002:a05:6870:82ac:b0:475:e0a7:9f32 with SMTP id 586e51a60fabf-47f59ca2579mr2988460fac.32.1789272322076;
        Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:01 -0600
Subject: [PATCH v4 10/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-10-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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

