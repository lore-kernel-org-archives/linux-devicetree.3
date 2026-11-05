Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904969;
	b=zQ2KSKwJvroKqeWcUhmHLw6tcPDQIvj8dVKc3/HaqCTHqmx8Lo95i0vrzdzXjTlkm2fi
	 fRv/NcE62bTQgHcw/ehQvpLPSNEUMbJwpZNgZI06mArZ1eDmYntDpNSebb+EXV7TH+SZd
	 YdzfjECmW+yFPLtWuxAQQRnbA+nXcaphWfxgGcDZT5KhpT/BNmgyDCNm2u8l7ykktpCrV
	 CScJwcipqgA4C2KxhZ+9248z6oJ4tNa+T90qjsH5NjYpcgIF62mygdQ5M3lemY7Jt/1I4
	 fz73OoKjiSJBGiR4+THVtaapXm+eFemnBn70y0ophfGumGLFgiHrz43xKFNpAJpbw4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
	b=oZdXzuSNrT+8p0t8MnmZOGJIykc93djKvmgl520iCUzJIfCuW5NdVeKkTC35cqx61lQs
	 t80aDsAKiFUdThriYKTIZT3U0eTUU6MIZb1KO3zv/PVP+xDBuRAA0Ur2hmceVs9laD5K9
	 iaKmRx+dtUnHxMKvFz8v8pSAlzlC1rBfzgQhlPv41dQtgQNuMF4pgxunUklkFMiBU00El
	 647U3pL99KJLq+UKVnafaVWsUccoZYpGFaQFjuVZsTO3EcbUGqdkWv4mmErScVmkW3ZF9
	 Sfyq/eqZd5oPR/57X3mTfvG3dgWMgGWit4nj8GisRaLSuzy4syZd+XTvDOygc6Ys2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2yobEQp;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886760A2620
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7886760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2yobEQp
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6dde81a6820so1436778eaf.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=w2yobEQpUUYT1JGrWeKUrm3UIKxglKcA7pxc9LLevXSH19Znb0nLH61/0LA1itb1es
         VlDDD7cTQe4qGqLdrt2jKW98dkJBLBSvrxMyuoHS/uQRsg0dPz1DxZlNN6Hb2Pzs4G83
         9J+5If1IYcxrSyhXDXTEcEXdoVklOzPGPH3SE03RDAKBMTAjGueckVzs6delqS4Y3Qio
         PGqQU00btj4OJsQAzkIT74/iZ0iRZGOA7JQCTyyFQDTuUfgRtM9CvKw4PR38jAhSOG1H
         /36C8qwy6n73QdqPkTwYprAvRG7I6xVWjMaNjNrYgugrRq+AFSjSQzZo2w6XSNHe/gay
         YNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=sa6bJcVkGv0NfjUwzYVuI6ewsA71Cgncwz7ltzy2aGuyAwL3xNe1ECy71FpqOOi64G
         lYoXqivaisPbj5gHF5vVGhbLoN4/aGK2HBA2aCZmk0EYFRf7LJ6hz+9Dhc9J7IHJhf0o
         mHQLFJ6/gSPbewES9XAwVNfMF+2z+DoH9naNJddqTyR5rHcVHwQJvslaHqYGtbmiT3nW
         A2FRmGpH/7yGRmhKxVCvmdJ22d7kPHGVosxYfSmNdJJ8daHB+oSG68J1sTQ8KCyzeolW
         4HZje7w6QzBqPs87rHZCcw5NeB3o4KNftq0NjJ3LdnewHlzCrb68j3BEp4kNGBkH0vm3
         aKxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT4oxIVk6h56LIVUsdtXvORT0wN119S+pmiUZOr4cGnz+urI/YoTyqnJaPBwyOLiXbnAsAyeUyFuqD@vger.kernel.org
X-Gm-Message-State: APuU4Z//ItrUO8n5ppAjLrPUEb7m1f7J0pOCoxRmEGz37gz/FPyWlsiN
	YusaULnQq399IAwLD/tQboa+JYuRFtmi6qVP5p7vBFkfdHjRCfC2LYK/izx5Qo+7
X-Gm-Gg: AYBFou3g+2GmslqbBHTg1ZjH5hH44WajQXESio1ZNZbEk00clT9xA9bOnjT/vh9wmGf
	v+PAVaLGQ8PFdKPVNVtOqRbRREAp7S9a0IwBOr1/xykjrYG4WLYHMZRH+C97en0rhwdwU98YdPe
	jVKcHZiVXG8uMAH3AVN1cve8zkpimii8Gc6eCr9T2oT5zrC+8RKYY5KZusRdBgD0YyOQpW1P9Hh
	CX74Klsrb78vMbW6OKYD1VjbXJi0oiIfqEHtJXA6eJeYPn8ky9xNOGTTfS3+UeFN06aDipASv0k
	afg4zXfN6Z4yav2p4xfVcTzbAdNzz0LP0J4Qj0vk1pYumBMZnzKAJVyo/l/M20O6TlyHOr5CvmW
	X8Gin4F3nmHx+QddMSx23P1o2znifBd/g/Yws6CD+lOWJAtDG6wnIbpsmXug9oKL4LeFSKrP0yK
	lyDTZFKpIQM/wzrq1ftseB7FMc2HqvDXaJnAVs0bsWx2rdjg2N+oZa+yza2T9pacOBAdT7zjTqQ
	pZts0h97vuLfTkZmzeOcnUcsyOzJ7NK78oMgzMfg8js/J06n0OW61W2E6MA0VBK24K/iUGgtqT8
	tqAKXiSdaof9WJUu75osycFptTBKjQ2hPTvTeA9QFAwiS6YyHi3UgK1MsvvJHnKU6tDDuNACFCH
	FCD4VrHJBeQeOdCjTqiXJPAFnY2gAfXHlp6ADbd3CvF6mtwg88Mp7GxhS1ILGUDSEHdEn27Mld4
	L+0V9wow9mL8DVnTjrReXa5xcY9rXgTAMUpshnKftiI0C+tIfG6xC4
X-Received: by 2002:a05:6820:16a9:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-716e73de6d9mr410801eaf.11.1793904968458;
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:41 -0700
Subject: [PATCH v10 25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-25-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index ccf616fabc91..4ed99054a8ab 100644
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

