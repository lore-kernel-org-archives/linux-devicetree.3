Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795223490;
	b=qbF+EYeCptv91JSBcrG372rMUwglOmrzThzwscFjBcjps/JX75EHtIapPeyDBG4ybKf0
	 Ubos8VTWkYIhfpTQB5BhRKh8CURcHGuue3mfr6f3uDy+w1PNaFEw9NFVBiZ3tYnmRoyqI
	 CON+i18bGZaMArqzid0kOWVEiTH0+4k7TImSVf1jseXa4VTwXK1iT2v2TRb6C4tYS71LL
	 Zh9ORLK0hCq5B7QQeplbouqzFKo6yEb1SLDsxc8TWr8xqXuXexHRNDO0uY8l3I+4R92+v
	 vignn4hCE46xUllz3tiyC2tcOaZhRhKFvKFl++NldWxVqb6Y9jwKzmoEFxm7nEw9Jwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795223490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
	b=ezNy+86tx9qNMPofaaVTGBxiZKFpy4FBemZhdJFLgpvhCmcisuqmW7r+RcSIhqqZfpnM
	 DMKmS+cMUgeiGGRGXSMPxdQ9QTq1Y5ePTxCl7r7try1BNl7atlKfTxTHgtLnXegGL/zJJ
	 vWNCcDD0MDZRFCXRiXAdrenWunGG87b6MFK8bNup4+rsqM94PzV6385IyRaqyAyCfxLcf
	 nu9fcsTU/v8JLxFIGn16wNhueCPsi1Lt7pi/kundkWZjeYAtthN2nDjq8K/Wy/nqd+W8q
	 y5wAzgJqmMNpkf9JmKkbssGcxp29Ww8BFiJdJ3kPyVbpJUnVA4PfNFdu44pImlBAvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="luI/6nAO";
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718EF60A3817
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 01:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 718EF60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=luI/6nAO
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4adf4431ca0so391331fac.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223486; x=1795828286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=luI/6nAOx+GMAFSJv4JqoZ7Yjv5jSrxg/QM00a6dreIqmuDhVfbO2Gi5M5vS0WA7MV
         FVYX1uG+214mgMjRI6RHU0yZWSVmEm0ci7b0S8q/eTyISaNJbt9Tv0H/C/OoJ+sdFXNB
         zew2ac9YFhk3tIvMCEjSi45nO26RaPPGHxrrLhnJmtJrk/HcYr4oTJ3rQmGUO+o17cOG
         Y+zQ7JEJJFO4dsC8GSg1f65CdEMyzbXhtT35tXNV9SgOzyp3jnmuL3O3L8YkDqZ8gE7b
         YvhYs7mlqrb1DoLnG+GO+BCc6nAvMsnzC/g7qQSjXShkeNiKA8SOXaf6SGi2Y8b+yTTU
         fgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223486; x=1795828286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCsma9jNkefw5HpS61LewWc4mQKxmVwW9euoTiUjDLY=;
        b=vqzU9eXyHDVnDXJMmPkPMF3aDpd9GXxlLFNdKTk/mhMDayJoYanmqjoZrQBJmW88VZ
         1fVQ6MiYNjKUSaC2sTo2EWoXobZP8guAoH6pIL7L00lHcYEm909O2iEHMeuW9i82pYnm
         v2QukB77AKP9R2lOAlI0Rqosz+KEh0GB1ifdWEMHW8OQY5yuVwQ4roX6Di7GbAUk4D8+
         BLetAkvmMcFpd2J8W58adsOU3zdc8XxdPxKHzy7v7KOrD6l8bFYpC3aJOfCnmNatZUgq
         JcxLszIbcat4faKIEeYIFAIc6x9v+xBC5leyOxrJIykK876EMBToO3uBJEPb1duxzBQz
         f/qA==
X-Forwarded-Encrypted: i=1; AL+hErHYrZI94WOHavB/n930lOfnwt316DCd8TDSSfWzbvBaKLo0cmyneRsVXy5t9g1/2NhGdcpKX/vGQeXT@vger.kernel.org
X-Gm-Message-State: APuU4Z+nWMROqGcJWjjqgjMHHFav8ZYsjzcxZk2qAA0EZVXMSpA+ynS0
	Z78FqawO86eFOxShu6Uip/+44bkzH+hZcwD0t0nvw4b46QFmBJ/y+Zkr
X-Gm-Gg: AYBFou3QSW2hWSMz5v3cvX+S0KgLNih5b5nzGEhOQNALwfCENxsLHgEwLO0kKutSLy3
	zsNXtXHqelNYrB6uwNpm9oOtEgF2kDI+VJdXS+I0IfIB6VGwEtQLoUmh/OxP+LN7WVwDNUKKD8F
	a9ANDYy0I3dFWY5fyNO573AAhYOi3+o+JU8v14ugeXS2ZYS2ETWe+fCgr0aXvKCxNY02L4UsB6e
	HOSLLaf3CEjIk7wkwoJjp1o1p3rvdUl6oBZeA3TkJkbUAsM2XsgPF9/4ANZqzqdqWz7btZQEn+L
	Gfwwnm+OErR7uSotgiQHV1X25n1YgjBPdYYKWRHUNhXQrrPb4S4TrEfrrcnShkeQwLXgfweL3sf
	GDnZQLqvnyaDxSIrbj+HD8ROgCC4Y2wMk484hysoLX0W+KExPMB12NFOElMA5Et0eTPLRMf2ON5
	PYWPD01Ke+AbDHiqUc46Rk6mZG/kxPSgOXg1oTNDHqk2LTAdIcaJwh/aTZ8c+SluIhPK1mlbEC2
	Kacu23Ls/6DHawhy5PBjlReo4yoPqyBGKNPmmHypPRC/lwwnH2nFv0xnVoqUFVn5exHIXJwqCJ0
	lvZI+LVlMFIbFlStbL8fpk4eDBzOG2PFna255tN+OgncZ/qFZlumzQ9nvXQq9NjDWty4CKyfA7e
	ZmIZcuJMEpXfoEStb7u3TPbtxZx/nK00r6BBtusapcA0UFFzfqYMYGdCtI3Nlpvi3C4c6BT5d5g
	jeMF9SgvNWpVAz9dxR8A6OVkFtRZaq7hXs6FA1kdflTathHidyBRRI
X-Received: by 2002:a05:6808:6410:b0:574:16ef:89c6 with SMTP id 5614622812f47-57a0ab2e12amr5993188b6e.35.1795223486363;
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:45 -0700
Subject: [PATCH v11 22/26] mtd: rawnand: sunxi: scan all chips before
 registering MTD devices
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
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-22-9721b1905ef4@gmail.com>
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

On a controller with several NAND chips, I/O to the first chip can
overlap identification of the next one. The driver registers each MTD
device as soon as it has scanned that chip. Normal I/O holds the
controller mutex, but nand_scan_ident() does not: its RESET and READ ID
operations can change the chip select and timings under the active
transfer. The transfer can also interfere with identification.

Scan all chips before registering the first MTD device. Track which
scanned chips have been registered so that a failure in either phase
cleans up every scanned chip and unregisters only published devices.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 73d6cd89ca19..abea2ab0cc42 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -274,6 +274,7 @@ struct sunxi_nfc_timings {
  * @sels: array of CS lines descriptions
  * @user_data_total: protected user bytes in a programmable layout
  * @user_data_step: maximum bytes assigned to each step, zero for a fixed layout
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -284,6 +285,7 @@ struct sunxi_nand_chip {
 	u32 timing_ctl;
 	u16 user_data_total;
 	u8 user_data_step;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2563,8 +2565,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 					      struct sunxi_nand_chip,
 					      node);
 		chip = &sunxi_nand->nand;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
+		if (sunxi_nand->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(chip);
 		list_del(&sunxi_nand->node);
 	}
@@ -2644,13 +2648,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 	if (ret)
 		return ret;
 
-	ret = mtd_device_register(mtd, NULL, 0);
-	if (ret) {
-		dev_err(dev, "failed to register mtd device: %d\n", ret);
-		nand_cleanup(nand);
-		return ret;
-	}
-
 	list_add_tail(&sunxi_nand->node, &nfc->chips);
 
 	return 0;
@@ -2658,6 +2655,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2669,6 +2667,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 		}
 	}
 
+	/* NAND identification must finish before MTD users can access the NFC. */
+	list_for_each_entry(sunxi_nand, &nfc->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&sunxi_nand->nand), NULL, 0);
+		if (ret) {
+			dev_err(dev, "failed to register mtd device: %d\n", ret);
+			sunxi_nand_chips_cleanup(nfc);
+			return ret;
+		}
+
+		sunxi_nand->registered = true;
+	}
+
 	return 0;
 }
 

-- 
2.53.0

