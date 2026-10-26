Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036919;
	b=vOyMkquYGXyGBZxQr2Homw9CDAlbLhDoIUB2ERR9UItXfbogKjTaMwdiD39dy3N+iRjb
	 0SXiB5tkYTa+BePMtUSnQcKDLGEdeYpIiq/QQmiVAKW+/8j1dVzLAiFZkNEXzy4B9x3bG
	 txLjMZwp2bZbtNLW5NHdLZULFdQELeNwMjipqyf0Doqlw8vGNBSiZOiucOSjNrsWYY4wI
	 ujpeGHAc4HTRZ77Iq9UvZzs65OUiCUrpVZL9DtKm7KqMqeUmMI1C+E8VFgUhaFUovBsiJ
	 m5zNNzqwjy5eQzJu0lhiY15DzJnYBjNd44IZ0MMJsb8UzyLO92U5DzXfmFi3cS5r6KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=no08TYy9z5N15Gfih7t9dZs8POOT+RS2X8Q3gds+d0o=;
	b=nY2O05CzD3J1LeLejBO1SaNLvmbcHlD4iimhSay3P28r1jFm0T3Q0N6xGMhg2jA6Zd/2
	 sjXjd6npJJKb+K+16LRcw3N1ZnhNO+CQTKFSq7aSO5pKXa3H+inKgeOS5EOb94uz711mh
	 kUdiOWWnWIOWGtD/Mer+yvH1gCCXeCIWiKW3S3CXWsltL+Pz+hnFn8cmRX38iYdrVBRG8
	 vtuap+pL3C20jfKvrqbJ/bCAs+gjkXKlctEtsVzi2/xxd44VXsH6TqsmHXYYqkNjKgA1j
	 nNyG5rmzrSB66EP7em4CyEW+6o+lRwU40/4+OX0PKKxX1rAkgCxXqu/4tKuV2OJYoOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EGQsjoS3;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B43606A324
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 17:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B43606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EGQsjoS3
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a6bb779d13so1693376fac.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793036918; x=1793641718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=no08TYy9z5N15Gfih7t9dZs8POOT+RS2X8Q3gds+d0o=;
        b=EGQsjoS3aD3rh/Ke6LU9Rb4lq++MQ31utgMNkRLoHARkb6UCVLuPvuodq+K1V8bWfK
         eMSQaKkCK38U0otloxxvu6scUuClerf40HlK1td9g3bqfwaUyUxrVUr26AMwmGzkBwKv
         fXr77sH/zCAJbrpWbKRoXtyHMcoBbylWT/EXTZNJpYcxquxQUbQU3JW6K0QH9O+qu/lP
         +6TaJ0V3lQpOG/wZWhOfVI3rZmroaEdmjdKxXDGDZePBFu3lPjtzCh3eCCSPJFnCeYIU
         S/UvHSLV2owQOgSg9yxkOjT0BwInM54Y1fMUgjpb1hIVxXuLVPXfv9pzWoU7BlCNxy/r
         5jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793036918; x=1793641718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=no08TYy9z5N15Gfih7t9dZs8POOT+RS2X8Q3gds+d0o=;
        b=Bmgg4KiCzLELVlOfaxFQWdkN6vSDh6CzrpnOCoSU7uL+/gN7xjzIGe7n8+TsvKPto/
         crfq/5rjwCKrTQdAOGl+OPc46JQ7UqBxvaeQPX3RsyhTapoJU8Opk5LiGG+FCyetbsbQ
         +W1ZmfplhRg4ZtnPKkjSqLRgj5X/6XV5m4sMQ+jOC8gkzTM3J6/5vg6zIVrg+elxDwE6
         UpQMUZyFNfhE/wwxpU1cpXnnYf9tv60WClSagnCEam2FAXueg6LvlyQ0KFiWHvTYOnys
         emLq9MO3CGb7VqqJoW9tjBfrkN1yftMvtjw/AtpZE34azExlWS8r5PY9m+zEWpTzzIHm
         ImoA==
X-Forwarded-Encrypted: i=1; AKwUvBwquckOaDfqUX2MrX+twn45qfws83QSKvyXn4I0tcgwfD2lrts8ZJgBcpXz2H1G2HXQYRkmosSyVuJu@vger.kernel.org
X-Gm-Message-State: AFq9FYLTUp9qNuuHAWUc8BKHgKhyd8zxOe/vwma4/jA+8mjxhWurMgZT
	sObqaMsPSrAvbA2bnNFCGD6VKqgknwlMxgSeE+vvFLuD+TIUrbs3N1Up
X-Gm-Gg: AYBFou0e1zP+xcICgdpZUADz8y4BKkPrXQB70mxxkl3GiiyiRAAI3u7cf33niVO+4pa
	3As9l3WaZsEI50Z8s9aqEvMUdNWVMfzOko5FxH8xGOlP5q+/L5GuRfsd7lL3V5vb5BKEiOIXfi5
	vD7fUtXdA/VYtu9MMYoeKaxkdhEqIv7k2IBqY12r4+WW0udxJhuDLiqPEtt93pqDJolO50VNbnd
	+Pz5N0hP/VkcigaNdVnJ7zCYAe7a21i0FlCvfIn7DXizvnqMf1raqEKFLeTYk3b9lfKxnLpT1k9
	BQWKeY1SrZFXR41P4yv8t0ajtziW8Qkqn5vyT84jRStbOGXqBSBguH6e8ow16KzQ5rBwOHNggCo
	nC1PaQ829ufn2blcZwW5oPTm2ZoPmcmm5n/t7gIxe92IcJaAqg7B/N7WlA89XxVoBY7uRUzCB7j
	E/X7ULH9VkSLKQYEhYGPyrvcFfTqa2KEDYDHQvXr0K1zb+xA3Gr7N3hsrHhnjNjDm7q3D2SNsIy
	QuMHKplrn0b1GsXEc4c9xOQV5XkT6rrvwkD/r3B++GQaHZtHW06upOZldEOLhXKEbzQqiBdJz64
	iYPUuEqaaXZV/qdMEPp0y5vdtkkKuA==
X-Received: by 2002:a05:6870:2c49:b0:48f:e107:317e with SMTP id 586e51a60fabf-4a83f5d590dmr4738136fac.49.1793036918122;
        Mon, 26 Oct 2026 10:48:38 -0700 (PDT)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89e33sm5034753fac.1.2026.10.26.10.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:48:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-pm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	maccraft123mc@gmail.com,
	zhangqing@rock-chips.com,
	zyw@rock-chips.com,
	sre@kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	lee@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Jacob Cook <jacobmcook1984@gmail.com>
Subject: [PATCH 1/5] power: supply: rk817-charger: Fix NVRAM SoC Value
Date: Mon, 26 Oct 2026 12:48:30 -0500
Message-ID: <20261026174834.1652309-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026174834.1652309-1-macroalpha82@gmail.com>
References: <20261026174834.1652309-1-macroalpha82@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The NVRAM value is stored as a value between 0 (0%) and 100000 (100%),
but the bounds checking checks and truncates with a max of 10000,
causing a value of 100% to get read as 10%.

Fixes: 11cb8da0189b ("power: supply: Add charger driver for Rockchip RK817")
Suggested-by: Jacob Cook <jacobmcook1984@gmail.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/power/supply/rk817_charger.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/rk817_charger.c b/drivers/power/supply/rk817_charger.c
index 5558b182a1a6..86da0462fb59 100644
--- a/drivers/power/supply/rk817_charger.c
+++ b/drivers/power/supply/rk817_charger.c
@@ -728,7 +728,7 @@ static int rk817_read_battery_nvram_values(struct rk817_charger *charger)
 
 	/*
 	 * Read the nvram for state of charge. Sanity check for values greater
-	 * than 100 (10000) or less than 0, because other things (BSP kernels,
+	 * than 100 (100000) or less than 0, because other things (BSP kernels,
 	 * U-Boot, or even i2cset) can write to this register. If the value is
 	 * off it should get corrected automatically when the voltage drops to
 	 * the min (soc is 0) or when the battery is full (soc is 100).
@@ -738,8 +738,8 @@ static int rk817_read_battery_nvram_values(struct rk817_charger *charger)
 	if (ret < 0)
 		return ret;
 	charger->soc = get_unaligned_le24(bulk_reg);
-	if (charger->soc > 10000)
-		charger->soc = 10000;
+	if (charger->soc > 100000)
+		charger->soc = 100000;
 	if (charger->soc < 0)
 		charger->soc = 0;
 
-- 
2.53.0

