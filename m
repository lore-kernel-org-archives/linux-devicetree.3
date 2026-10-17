Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAFA3E3166
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792266826; cv=none; b=uS2VbQjS7iuP0vLV56W7AylI0FJzTc2llWo9tLU5xmLz9DDWxqJEWHZilOjgL+hQXEyYc8PPXAQvTeynZGBVGOYt2OSavIiY56J5JJci6v0wdeAgukBMGnei+VyQY5TLNIn1ubJfkO2uWdoKR9VzI4HMPQVBeAIoAt7djDJU0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792266826; c=relaxed/simple;
	bh=A1STkpE9307vxyyhV24//arWM0j0kn3Imh1Mn5JF96w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MkO+ynDXKhuP/iTzVW5k9UrKXV2Y//q/mPVlgFKBcGiRPYikD7gxkT7Wtuq3pA0zstdIvVBMdTcdFGMExAGBz3Ksfqzl0kAhI3YgfzpyDRxAZ9G+FvpWLcUMQca6m0282d5hgnRMYDS7AFFVy0bzBE9YCYwqUNTHoArX4oQWom0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fptsQqMs; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fptsQqMs"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-84751a20d87so112356a34.3
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266823; x=1792871623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=fptsQqMsVGpTvzRU/nGx/EiO78KdyC3zBFw6NZjF4HXED7k2M5ieNetziS/UX1HtbD
         +nQ8qH+8pK3mN/htVIurl6hS2rgjjcXYkSB18oXS2sBqmmfINm+y4154NokkMYm2QHvd
         cU4OVZ//v8ZH6j+xkflY2Sxb5lO2NaB/20U2PactPKjRhlilGC7Np78Q7MNMkqNy8m6U
         xAfc8K02hP3DhbZ9s02JgYyMKpi6u9FEc8D09YhG4cZnVtfaPkWmR9NamLH10FvMhWV9
         gFv6gzSs9rCGDYW9sh9L4KfBR1M/AVisq6uAtsD7Vezd7XguhOz2q6WgGxFBCYxEsE/H
         /XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266823; x=1792871623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=cc4N4ze2/rdEQXctmrow0ZHY8hIGFBaKL7lPIQs/qa1vKFM5MDlfEut0lcYiwf/Zyr
         HobqHpUcipyDMNemJpS3YYvBJtB6eCKFLemEtilFz8dRFz0ilCf4S8MYpPdgAmtdptR4
         WOIFPBMITtDh2KnbNrLEoazo5vjXT2NJD9U4Yr5ouFr+LjGn3jM2tHtrvt8ls5BYOfrg
         tV8tUE1c5acWlwlYiziXZsIwMK7R8nYepdtOFT5UUTqUN8xlui0uEQomdysoJGWsRsoX
         lJ79epEZKJQhCU7cWsPSgQSc14B0BIJ9dTysix7hCdbv1mJW7qdJ2q6twX7XRyLvyFz+
         eFVg==
X-Forwarded-Encrypted: i=1; AKwUvBziIj+Lbtyn6GmgGjLa9dNZCkdqnLdZob8IgdwOtSw1xoayFkfUGEvVRL371BnTu29jpuCqYGklp926@vger.kernel.org
X-Gm-Message-State: AFq9FYIFX9S90zLHeLfXVScCrVMiwBwo+QaFXk57oMghtyAI+kvwg5+O
	bKpIzd7tb/Tfn8OUuIqR2SZW5jfQ+79eTI72yW+j5SOWre0NXCXnlrCn
X-Gm-Gg: AYBFou0yno/ifX8hC807weTRqSZQQJJeConvgmISxWxSQyUhBpaVN/5lV1ZlZaSriSd
	zD8If/mORpl0EG5Q+S8QyPggRVakq9QiuPcA31N4METYcuF57NQT7YOHoBgizslSmSGPx8Gjk60
	Ju7NvPEWKQn2IJFY6ufBEaoTipe0mh3xqgJD22LifEI/KM4cwmr+uitwsssS3cJs1x2ewwELhUu
	cV/2mxeJ/8zf3jdWT0W9GG7gk/ZUxjdaH7cvYGVU5cZKr1jbXunKsePSL75rJl86nWqOe4L1ue+
	yaUKjhDIXyS7QXsiN/V5E5IA/hcAGdlaq2cdeAzvuKyDAEcU5fAV/lJqg6WRVgrP8K/UAh1tInX
	J7dOU5EvlCowmLiqtgGLHtoFrzBTV2i/5h383xUkbh3fHnkqk9P+aSILqCxHTfPxGq3vBWROhG/
	gzliQtnLbYDKG5vDNCMG6ye+UMImZehss9S7bAmu+Ep8se/iRbN+vQRfdJcHI9gba8YRUzka9Ue
	u17k6xU9TacnGBTirizCuIvOBml2Thr3rnYdHjvjqmQDmCZYeSuqLopeYTk29OnRWSMeg6rXL+I
	O5/EJlJ06G/7TLn1SKFl7dynkYxothqLPJy/vJixUtrkLtcOuJ8Bnkj7o2eyxU2eDYpwzp/Gq1x
	ELT/XjC55v0fEcSLa3fqZdYrF33qD+FJsHAyW3JJVaio=
X-Received: by 2002:a05:6830:4389:b0:806:3072:240c with SMTP id 46e09a7af769-84501cf7377mr3819310a34.29.1792266823279;
        Sat, 17 Oct 2026 12:53:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 17/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Date: Sat, 17 Oct 2026 13:53:06 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-17-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15.2
Content-Transfer-Encoding: 8bit

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

