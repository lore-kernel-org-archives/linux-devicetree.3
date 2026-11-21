Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223491;
	b=b6ZaOdN+mS4I1gZlPYI3aHOCDyuED3kP9d1VI+0L0eRhu1oWP/of9ZlgrM07h4VwOjrr
	 6gu2cZgvePwud0NI3ndxq1sBWec0bJ9V/LhU+4xO7Bk/BOP4mTUb9PbuHT1f764wOee0d
	 J6EZcSfdyoDt81ZRyWzJ68yspkR+r5EI9fFUkEXErgtrJHo/ANWsPy32N11YViZaHUZci
	 Xyo3gBPPn4lpcjtaQG7sEWtnLTOJxhXhikd4gTCsXHaLri3wEGZvcwACeQibf3fP4cGh9
	 xbmBjdjGpyWer7fw+egqA+1i8Zbs1jO/zDnnQzgv2HKp8vaOjspZSfkH02J/Dhr5tOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
	b=F648Xy71RZRuWQ5DNzf2i1mcMTwONB+OHx5mRLS7pP7X1Mp/cdqJPOHVO8UZb/TxVsg8
	 2zHDochaP0YcB6jBy2Qe1WEId3IQ5E7Wl4B4U174HDXh1VIiwEv69NA82Wl8UNEGIeyln
	 ViEwpfOfXHSSD1UPPehcWCRhFbdOxY5eGc6Eml7mVBJpqW/CaoNnszc11HKMUSdZWVS94
	 mLoEwB8aMxoP8l6dob2iF9Saqwdt2Ot28/KPJ6XEhW/T01i4HZ2XtDzLxaeoS1yepbJve
	 7KN30LEHzNsF+EYMBKJd/lh/6JplZPev6S28pusNbEZg1/BaXXKu3AljJbN1i8QJPfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFEqmXol;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E1606AA03
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9E1606AA03
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HFEqmXol
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8253bc5a613so1015507a34.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223488; x=1795828288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=HFEqmXol7+asPcoNseI+jxKp0GwSh3YBIw/yac5Dna0WcUaUQIp5/WOl/eXE/xjiq6
         KD96QHmz++ooZHw+Dn7GJzVuW4il8Zu8n+JPLbpfXUjAS/pGF1jtK/GrBgyPT9LAjOAm
         dtUcBRNt9wn+FQpxg31xHyEyK8w234DrCxC0PdmRxgJiFFWst6HxgxaO8OkH7b+CbqC6
         IzzieWsup2RsKr1gcVaFfQkRbyq/Rt3kdj7yR/KkwQ5VvyNe+6D3D7v2koavYEJBZ20q
         thlfDb4OHeSivMVkr6PYIryZfTMmEMH/3YLgnbm17pkNbFaN8UUlHvFqUxjcILJ3NNSF
         aA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223488; x=1795828288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=iR6WMNySOv4OOx8fqbFnlPSpn+dablM6frDL/3K1ynSmrW8AbA3ZdaQUdA0Zr6EivN
         FaFvx/odDrNXGmMZ3itTVSMIj0lwC+4yfTFBlIXeM/Eg6eehTAdbgYVc2C15lCh7l8mD
         4up24O+SI2MqS5FIj2eoGThrPAVEvHodfZAUD8wPPO8a8VF4mrl6B27CVP4rQzFTY9Zy
         LHORNCGlp0HRFqzt6Zj4wkZs2VjYfebeOb68f3xfKpQGC4tj8PE/2mWpYuuVauhkSRMb
         CoS++fywCBUXbzw7O7ekisNyyI5DghpH4R13miQt8+oQC9iQnTyiX/9YynK9DsrTA1VX
         i+mQ==
X-Forwarded-Encrypted: i=1; AL+hErGswBDKCS1tLC7RmDfR0CRVSDbWe4aNuAzmaTQX31gBuB+5u7XWvELBvOGvXPJ7wxuFzVKE1/JCp6TN@vger.kernel.org
X-Gm-Message-State: APuU4Z+7IS/eF+Pzwt3QmXGQAiViL/M2+hej2WSR+FDFn23eRiz4WQrT
	s2238Yo1wut+kgw6XaJa3hbTIZxxgxEatcdWoCs23lCuZIgNEfi5k11J
X-Gm-Gg: AYBFou3M+xXzrxIb3BrC5fITr88Hjj85XLEeGdqbrrvR3/A39bHrwzkUYXUqHxuK811
	5GypLuMlPZiKxFq5OD4VvK65PUasdIBT0P4zPWEJt02ole9z1UF5L3DuBbw4ipyOTryXozgr4x7
	mRki9hv8EEAfZw37YljFXwSyT+F8wLs/E5UA0fZjg2XeIfIcjuymiMay8hadKO51xdYcuDaEh67
	zfuHsFX3HONIv+hrkOI4yw+zi861jCO3GZRVj9BvD/SClOHx1X1qU0UViJG//ZbRkiyAgFR8N1P
	RTgZ6DqttHef5wa5Cy/LPedqjcUP/3fdd5TkLktC0gyYZD305LyY4mQ72sOPrqnF0eZoygZThxB
	GG+c1ILIHeadkWU9d5I9bXcHoh0F5mTLkBVnp95z/2MXdYqrNuL0K99KHdDpghh8KyXLjit6a/H
	mLjRhxd+d9zfsS4jsdBuUa5sqF9LwdR36QtfzcQtCFrkBMkn+RqA7B+2Zim6nA8zYUh/TDnux4r
	QHI/oXR7TwTuO2h6tpZU/z98CuXIJhvD65juV77tst72og4iIa2cNmCIuewV7cOlMuShDrdxcQX
	1qqfJHYJC149nYBsG4ixFx3sFpGi+ekDtoddzxYu+zfqauvKg/uyKrz8kBh02I8TGnI2yBElN4G
	b3L6JLRj+QSnIWAbrokC9ts+TBPlWsjYVupTxaheHOGaxKFV6iu9emASsNPrgfmnEQROzBT5XY0
	rGCvY8sil8sbXO+drjhUDLN52wPq4UpHeVEadG8sumGby7gSk7t5y7
X-Received: by 2002:a05:6808:2220:b0:572:e8eb:36a6 with SMTP id 5614622812f47-57a0bc9d273mr5655190b6e.56.1795223487680;
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:46 -0700
Subject: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev

Normal NAND reads and writes worked on H616. Fault injection exposed a
failure when recovering from an aborted internal DMA transfer: the
controller's soft reset could leave the first subsequent read displaced,
sometimes without an ECC error. This was not observed during ordinary
I/O.

The controller needs its AHB reset to stop internal DMA and restore data
ordering after an aborted transfer. Require resets and reset-names for
the H616 compatible so the binding describes the reset needed for
recovery. The in-tree H616 SoC description already supplies the named
reset. Older descriptions that omit it were valid under the previous
binding and do not describe the reset needed after a DMA abort.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0

