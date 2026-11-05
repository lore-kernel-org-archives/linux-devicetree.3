Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904963;
	b=JgTgGhQboTfDK7WPGsDXv4c5zC8nQS0OAsLr7M2NRUJBH4+LQMdfmMyD/9UYmTITVVzq
	 Fnehxmc0QjdO4VTJ92oRDqCD8/nG+Dtb/dEB3HG2d17Hctpz+rT3qI4l9fQTrTA6ZEZlL
	 LbBdSc9alXE9ncEz3swU3OwaU9CBlvb1I76F6vOryjq1UaigGvpbf1tBTLPeRpUAQ4Swf
	 +WU/gm99aoo0lm5PxHxbClz3FSQ1KdvPD3efAQl3on6dKX2M3D5nVfMSegRuEDetOVLfn
	 y2F8Hv0bgQv1PuI8GKq72+8XeRitEsrXOkndcrmMnuxmUhPbUmwFBH658POSewmA+Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
	b=fuPTDyG/4Nboiw3fxsR2PDu2saIdZFXt46ThLL5jYCuMeCYtnBspu6rjk67wIXa+rhYF
	 O8NIDwgwKsSe0Fa8W/UgdnbXO7yYNVvowBISTc+CP7BMPdAZJ5S9kj5dY/417BaTg2jLb
	 HQxVmXO8x/aNjVWMLFeqkvi/uQoAgpquEUYWsFWXfxHuF0i1zUe4G5AnoFBEDevrUS1ME
	 3SaKAUiSu0Qng7UT3Mb4xuB467o6uZYKmcoKxA3/2J3Ma2ZkY/qvdiS7mLR8wfJa6Tkcj
	 ZnCzjOx34VGvW7uz11aS+n3Z/IuMGCitOshoVgzruNNoyeIra8dEu6X2Maqws1fbEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzE9vvoW;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48C606D80E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F48C606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tzE9vvoW
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-716ea2598eeso24348eaf.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904962; x=1794509762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=tzE9vvoWdwUEP8232GMXy5iPK/RwgbnZdEPSEeYdEQ3dG/wXcDgCtl4UtWr3Ny9KmT
         I6I72gq7gx0bkb/QHwVRnzAV37IYydpoOcVLmTyDHlKucSTTNAuKloUFoTAujYWSxFKb
         p2T6KvpOOAnXCh8J76LkH5LOx2BfFjoz89f30Q6gjrvOyaWV2vWZFV2j/9GwKi/6rWRH
         ayfhPr6aEDNyFWGKkzjyA0hR9NTmIiDCWLFlvrkyUejKAowvdtJ2ZZOISXSO/XyMISPn
         E+Ca6uAJ4rd27bE/0Bt1YUeTGI244/qRqAFBzaSi9I+LR+W/d9mm6wgp2EXQ5wTqgKpr
         f3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904962; x=1794509762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=eqyOSalG5eukBe+/gFYOwDbJ2PY6i3OZxt2SpQrMcv4CR2FH73oK0g98EBvHm9GtUq
         Im8JFz+zYGEtAdUNouqWZ0Zq5I2LA2+VIC1VKvg9EJUiWVYbRLDDsX+Qoveb3ujAXw2y
         zLCQR7KQRCJLQ0Ogqgbua+Wh24EpM+YSJ/MckmaoQ8/jroe3Asbt3nkDSJ+gzo09eUH/
         llfZIwUbrg8qBnCzlRxHbF5nATDJdB+6Kc2uC6ZrDDg1/4dHYdIeUNRJMf/5YnoVzH13
         MNnSrFK0wYoIKyzzu+sKVIsYOAdpyPHDT4X4g5vd4lcddWEP7Y3F9tI+TOYSs4b2UZlr
         FOTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbFtrinEOL71XvhImF2ZdXDZD8GcqQnjLpPNbhHdBdgIgklX37I828Gfwbc3dWrqRwrGNIXuv6Ab3D@vger.kernel.org
X-Gm-Message-State: APuU4Z8gVAeTtoGVHPdWeA8r+QcaIop9ssO7ymYavZbppppVWdyv8XYE
	6LMUJ4lySk83bVOFVGYg6BFmFeMoV3I5hHcOFo+kAMIXQWn0f5zkhtgb
X-Gm-Gg: AYBFou0/oYTwU5rb/OH30BuDplf/TPDFaOXJG28uEgNuCZrZvRgr1Zv512nSN5e0/97
	3ywKw5jcZvCkBzjRQ4gJ8I9GUJVSFzQM8zXlZmwmxqTddrnGJAXZ3Bgr+5fQ+1QQBS41jKuZfeG
	4XgLGeBXiM3qIPvPEAN/iEe8f/Ms9HZqJP6diVJuORb3xHrrRCn0Ou0BPeNL2wsbTIsHX3vZCdm
	Z/WUAiuwnWdAUB49443SnfgiqtV1kbuNu+ehqe21IcMY++msMGNSp7rlmr1q6ez3gmiaF9/qApB
	uZMhbh80mHJqfneMOPIi/49UkOZ45kcwufsqkzzr/xxs+d+1+K0qgzoaMqEL+ZnzAzBS7RZIO+V
	NN6I1Nm+DU9AKYBAREgKJPZbELoTlmMYylRMz2U9bTr6A1OxQl7aQmfU71YjVJhLADhpq5GOK3l
	Pu/wdplrsJ4qPGUpc03vzj26tkxgSESMMYB7tGLf6DV5D9LNnBmfIkx4O7eOjatJPsOk2t2ddBX
	+fc7nuTIOsm9gKxcdNTQS9XCDMKQRPBwgbfirnU64Fn9AgJqW5YjHy3r7lRxrCW8qoITmf65qSP
	bYrxEQWkt6azdmkOxZlU5C0wtL3v/bz3+Wpa4cDTSK2rkbaM9BmdpTgBHY9XQ4csaBQEvSb+7Qm
	gyPm6YDtWbJgxIF2MJTSGQCN+VMRby2/1nn1PXvg6rz5leJPl3L8Q6+pBFo+lJcGgiyTK9fV/+y
	eCiQRZSX1LtvkCQN7x1KSRg2TVbhA2iLEIlPg+e2hy9gzYGObbXlAx
X-Received: by 2002:a05:6820:c91:b0:706:50ad:fd7f with SMTP id 006d021491bc7-716e7b33226mr291273eaf.87.1793904962431;
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:36 -0700
Subject: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
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

The H616 NAND controller needs its AHB reset to stop internal DMA and
restore data ordering after an aborted transfer. The controller's soft
reset alone can leave the next read displaced.

Require resets and reset-names for the H616 compatible so the binding
describes the reset needed for recovery. The existing H616 SoC description
already provides the named AHB reset.

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

