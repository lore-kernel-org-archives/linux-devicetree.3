Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC78C3CC9E8
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 21:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788557020; cv=none; b=NM+UPMBTf9hs7jJ/oQ8/H76cBYEtvDzhGAB3lGuhcEAQl5LzmpPMiOfDNNcgkdiK5e5dQqxexqvGXNf2Kymh1vftSHSNMPnNLFaW8is+Nqhp0UNblHPO5y29Oh5krcQG63IPEgTRA7Y7KZfK3frwnEa3+AwiNIWxoLydanPzmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788557020; c=relaxed/simple;
	bh=TnmhAN7UAS2ynuFEOPQLlzD2wvbIo/yeVWwhOMqNS58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKWEzntd1miUn8ZRvhwEqDwpULsYmxM7VahP5mq0zQYxFBYnJjsQczgBlFiKtSHHxyN2KzojzsON2qQBc6KSEF86pNN/fq03jF/j4om6aCLehOj1QhmHFfhRClJ4q6WiugJ8K1KgeKdbuUYVM1hMtASSlVSB9l1EFy/M/xVgAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hShBIqEX; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hShBIqEX"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b1ba286f6bso1951014b6e.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557016; x=1789161816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=hShBIqEXlXU7ExGsDiGFf8YXaBrcUIXtvbFGZKB4PJCT0QLq5zQhefmyoxPKo1+Pcq
         y16NU7Tc83rgkutIiroHqFe05pzYJfnkyyaenOQruzD3lMrjSfXSgcvKA0RSsDjJxtRU
         jPDAaSeHRgEs6HnTnAHlocL1LJLyQClVIHHlVE9xKN4L5Tdkniu+qPIKYY2eWOb7+OzK
         00GouZZRRHBTOC5b1OPg0LuC4K5q+vihoqfqZIBRLgFrRZ1Pd5+x4kf6aTFun1PB2+ma
         E3Yyj/SiO53WvbLDGaBRCpin/0xp5T4spiqHU1JsI0+B6YaXIZSeQfVLxAno1dxmBPxj
         amUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557016; x=1789161816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=nAuEShCg0ejE19hhTIZwwnx5FVrOQIMteKrZLagD6gDzk1d87SEIjEWbD8l5TaUfPb
         fQUDAXMUkiYiNKpdGRz02WNJ7jBfve2yOMBOjAWfJ2fnfCjgocR0UxsDGFYvrrCdLTpH
         iZRbNyKrDD7brN2HygueJ9x3Rgy/9nwfOUl3/BpYRT79CQ7sVW/pMJYYP6+YjpNoL+15
         le8DBJBcnu22WaE46Xq2I0oINzPP8bk0dGoAFRFTk1lt1wXZ4cx+rWRJpQ5ZXr+Vie2r
         oa1R/X+0SUtmPlvA+shweyyHrlRf9fFGI1dGJ2uvkms/pZe2ZB3K9DxQcpLXS9hgNGGz
         m1hA==
X-Forwarded-Encrypted: i=1; AKwUvBzlAPnLam2UZ4DxneIRJO8Hedn/BOkUACxmjY/wUg8DO0wSY58Cf4lXsgpugRLXIYTQT2/CBwx9vraa@vger.kernel.org
X-Gm-Message-State: AFuF++meN5SUSIBOeLWTWvfuFy/VzlO03ePaDfNS9MheKQqij5rB2P/A
	6AkGnFST2jp5bOiuVveID7BLq7kd2N5TiiCgiQnuuK2f+R9t7/dtX00e
X-Gm-Gg: AYBFou3znREGGI+eykbmx7VDMkq14vlkyCLKK/OCBwb/pXC6bJMYJR0xp4u4a3LSse2
	OFqFGWd4lLCpz/ogPkapUs8cpVYAK9jnPD6A/Ec7vuBDBpCX3ZJpTZPtEmT8z9HCnFFKR8+kxCN
	5VV3k/XczrJ6hJPuPrBYWuosOwTkIDOm0JHtTvazAaX1C/JP83S//MPztjv403cUJ9TnvHwUdbL
	gczA/8itUJrUoK7zvEWSfOWEaAderOFp4fd9wqcuy8W5cngmJm9f74a0ir9fYPtg07hQgP3Rfyq
	flE1FcJxdhBfyLpizIqQpHlhcRuFtzTJDG0M9l0ogFfX3NvF6lcXly8fLpsvrrdNU+1K6P8mQex
	MvqVrQCE8k/EYqURLb02gBAB825twRyr7BINXSRBm2XtR3jUpxdiN/wsMWrD8xO1WnRW50Wrmwv
	saeoUuQIJVDZmQQCS7yfzKq/rgWuNB6ubXuTyGdXbb2bYrB0WZquuBK7tOtkZLm2nQJIDNkn0Fu
	I/NK1nEZ/FlJZ4L3O2FxZ23z6luV4V01jX5y4L4gZeFwbjG7A9LkFoQUcWUc/hbpsDcTFKeCj1s
	T3R1JcLV2829eyANXQz0C2Xy/Nc4cfE9B74z8ajnLjL0PHQpjZuw6kc7UuXuGX9khkLJ1wYmhSz
	/H2eIEm8Kf28iYrMvuuM=
X-Received: by 2002:a05:6820:1521:b0:6b5:ec3f:4983 with SMTP id 006d021491bc7-6b71ff594bfmr2962915eaf.30.1788557016267;
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:11 -0600
Subject: [PATCH v2 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-1-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
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

