Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904962;
	b=n4XPSfABSTyy1pwuetl5hchzFyHWQW+CsMKhH4HmkePT9MtuT3ZdSAYChUuFrz6XAwYQ
	 2XT07QI4ur3TbYFy+YYkwPZAG9DBTVqDsRNJMLtQJk7rXSW+98IA/4Ov5m4V9qCZrCRQP
	 FMBhOQ8Xo6YkF7apc4WYXUpS8o3I+y5ixaEQJNX4RpBI5v9dXcOieCLrcTXZWMpMPKXWa
	 HAcNcyHmKdf+xb71pVsVSC81t3q3nr3hKvStFCPiMSBcjRcyaRufeSHM7kJsS1mHFzz5e
	 0fMqeUAV7PdoMWduoto/17LDPT6RjtymVAv0DU+VgrhA33XxvF+RKZQkoMdfNngNO7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
	b=UChG2ViSMgdxCMIXViyoiCJtSeDKmVmDcyEjYUaFCerJguvs5hSe5xDuXcAwfZZdff0C
	 +xsOHL+0t5VmCzA8WHLr78jmdk5mbMIlBkQoZQAIo0JdQLrOLmbiQhHsRh6yfbRy7RM3F
	 oid/qkUWviEXkWpPPc05Ueqt7QtxZ+nt0m4C/zAJO8W1fZ0oNqacPxnrPvhzBIX+BVeWy
	 BHRaCgrYVKSdj9JUvRry+ZtH9vC1UvQirfRykQDiDP0hffjoXg1LEKJBjk6XU14bos2oJ
	 1WjIyeMEEKxxmkgl/5MEBKZdov4m6cMcu9415r3yqF6IYSHli/yEi1V9QZ2cWmkEdQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCRNsc1h;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1F606EE8C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB1F606EE8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xCRNsc1h
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017665eaf.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904961; x=1794509761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=xCRNsc1hSh34m0V7Tj2Sc5YaZYirBL4qHwjjdWic9uEtYq9BBcF8LNtxPYwbQYfjq5
         e/D7h9vwzw+H2yDB5SMJOKzCR0AIz+VdDkgYK5/6HHArGnmqGa3y4aCAnDfGlI1m0Ubh
         gYyLdyRawEwCghTLmXyTxTc7ltiO1cUVb7JadlvyddkkRB8DKiY8yNHs/6XO+Aq28XIU
         MFTd62hbQ2z/F0un6nwU2HZ6av8ljo48WXabCYA3run0iXFQyXYN7UVSxCG/KQTOqN9d
         656yVR+Lg0IG+zWT4KWADFFPMBPzYrGYMAnunfiUNEFFo3CN3V9TUIcSKgplALh8zx/L
         3jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904961; x=1794509761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0o9Q25n23ckZBCXpljiM9GoL2XJxqzEiWbXDgW42slQ=;
        b=rwRMj4FePtshMa+RRemQc4Tt2WDOwfWDWJD/0vklHQNzI9qR6eTI6GHdgCLraXhEs/
         Wkptclj8jQRXCPb7LetaIBZZsB606Y8UWUSP+7QZL3zzuxwyAnGTky82cdbVWVVdgb40
         1zOcycsN+antwbYXdBtsYUV092Ni541PiEjHCMfL64XvcXW0Fzh6V3cI8+oCcDDmVRxM
         4ldphd3Ebx7814KXjMvILHhCQecwtPhm2Kzfe5wnrXBgev95kSOpz3sSEbcZl3gqDbD2
         vWauX6s+TsZuIVMc70tWKNpxZyOhL8kx3JEvDLzuhEHzxOW5S2DzeWGf5cVAzMgyS7Jw
         1NWw==
X-Forwarded-Encrypted: i=1; AKwUvBzMM1GFyhKjNqcGtUviTqWulHj5XtskaTxzyTJMLNu2FWGpv5cFmVIdHzIm9KJosJB361+Cljb40YHR@vger.kernel.org
X-Gm-Message-State: APuU4Z814Nju/rFzYqU/gBkXRsr4ksqgvesTM5JXiKxmLHxJG10O0hH8
	eyYSWSdZuC2GFN6NXQwKiXF2vXjJGJDoVcxHYMvRv70riyz6f5kldsXpAFYWJJze
X-Gm-Gg: AYBFou0OeEpCim39H4JtlBBJGwoXkuAojtvEUeUkgkSmno7s8h6cf9/n4AFEMDcDnhj
	x9AVEFUoBTa4Csp1UN3vgQFS++Y9mjNo1msqyhtVmmTjlH+LbOG30ETKFYjE5mWfyTCDwZFw7cv
	E01GQ/nfibot90bizSq0jG4uvgDilqfLgTV8WQMaFs5aGDiURb6ggooSf0W3RzPATYtZ4wjMbEy
	TH7Hk7dmfkkN3YTweOsTVkAJpnNcCY8KbkvRet+2M03o6deGDumcTdlIpzsHcmbNqZzRspwapE4
	A+RqFT5XTTTkuMo6t1eJyU+69zz2bS3+guJreM1l9OyFzxVcFUgACeWEysvPFwkap9DvHQqNVwA
	0lWPJoXSZuw+4wwoEfhAIcoIfy2RcFiSTyLIYz7GK0zm4eJPLK8UgnEr3YvKhdGRDL++uQD0/Qt
	QPX9lJxGk25/p4OdUg+jkjcTj5sVMowz6NBkYyOdeE77VFCmEbtfibNuZrB14oh4ijYACfAMJIz
	h6i1I7XhbWQYaST6cE7Garfvi8OeEOyhwsEvjYvUBs/X8Ffay9ZiucreeUKG7wTUMXJe0g3Fyz5
	OZBUwBodyRu2u3tSMwnTR0x6ti8269ZgUUDjskws8WubTKSp4ERZCHdVvbYqX+HHHnzInFsYpOu
	vPryVru9uLyyntZOCbFvvPb3ZtIyBOcP+G/4hUwMjEppIAt53Rgd/AOYHhZwnI73+8WeMdzmpRK
	9mupAm/gxsayWaqYysj1NEb2pcgDkts+IsfkvG46ea2oA/QdahKafK
X-Received: by 2002:a05:6820:4812:b0:713:da3b:901e with SMTP id 006d021491bc7-716e794cfa5mr279031eaf.48.1793904961203;
        Thu, 05 Nov 2026 10:56:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:35 -0700
Subject: [PATCH v10 19/26] mtd: rawnand: sunxi: scan all chips before
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-19-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

sunxi_nand_chips_init() scans and registers each NAND child before
starting the next one. Registering the first MTD device allows users to
access it while the next child is being identified on the same NFC.

Normal NAND I/O holds the controller mutex, but nand_scan_ident() does
not take it. Its RESET and READ ID operations can therefore change the
shared chip select and timing while an operation on an already
registered chip is in progress. The normal I/O can likewise interfere
with identification.

Scan all chips before registering any MTD devices. Add each successfully
scanned chip to the controller's list and track whether its MTD has been
registered, so a scan or registration failure cleans up every scanned
chip and unregisters only the devices that were successfully registered.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3de9ed6795fe..e1306d14ab3a 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -298,6 +298,7 @@ struct sunxi_nfc_oob_ops {
  * @nsels: number of CS lines required by the NAND chip
  * @sels: array of CS lines descriptions
  * @user_data_bytes: array of user data lengths for all ECC steps
+ * @registered: whether the MTD device has been registered
  */
 struct sunxi_nand_chip {
 	struct list_head node;
@@ -308,6 +309,7 @@ struct sunxi_nand_chip {
 	u32 timing_cfg;
 	u32 timing_ctl;
 	u8 *user_data_bytes;
+	bool registered;
 	int nsels;
 	struct sunxi_nand_chip_sel sels[] __counted_by(nsels);
 };
@@ -2672,8 +2674,10 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
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
@@ -2754,13 +2758,6 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
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
@@ -2768,6 +2765,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 
 static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 {
+	struct sunxi_nand_chip *sunxi_nand;
 	struct device_node *np = dev->of_node;
 	int ret;
 
@@ -2779,6 +2777,18 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
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

