Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909240;
	b=yyMQgZDTXp8cYzOH97sbekhfMyThWEWNX5RA0JizX3/PAsNTNhDoWqynHZgmGuWXKiL7
	 ij32SMuDVuaUewRHYyiDdGK0cy1DQ7/gav2Df/R4kAg6LuWq5BO7MUi6QGvElr5YN8Ynu
	 DeqCoKrjS8Mno7IubQnZ0CVzgShijw6a9hwwwoc5/nQfZeItkC86bWt+ktmLtJmvktQe2
	 NRU/1SJO4CY+gnSxoeyCm3UrcHOhrUwQKvZgHn5GnZS6d/qdN0GdL4JUqgu1vaJvorXEc
	 CUBnk65pGfABdS3dFYSWck/emi4n0MtSFgmipk8rWPgmLqDYsRTIHUtIZyxt63qSNiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
	b=NgQXAufUZTjkld+QcY6gXSmiTxhTWrJpLuZFQ22YhLyoScOqhRaG8OO81UkP8gz3ZtTb
	 tK9C9hAAAGFTIvwEAs4ArDNom8eZPo7/JgKpgRQSJsoxM5y5eIol0e9HYTHScaZjGnZz2
	 NfBJ851bYfv3ruALH279+YN4M+Ex8oM/BEbLj2rYnyViyhnhPITsvGuLY6HNj5eXU/74S
	 WcY9EH6Xb2H34X5J+t+1AhVp1eFfisLFxbJTrcZF7cfHzHRWKj+K1zCvL6bx42d4aGzA7
	 uI+w9Ny4XDD6km5pFMVmL+yuSKhVTYsqnQn2Z9loDHBZBuSWZYzPBYyvsPhTnGUky4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NdL4j/Sf";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEAF606A331
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CEAF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdL4j/Sf
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so18808485e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909233; x=1794514033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=NdL4j/Sf2euHzhcOElIVGfgvu2LhDvenH5bjqq2qaHGaLaIrdyqsOm9TpNX6ft8WhM
         8NKw4opLm/USQ/0OAmiYO/NLb42AVD0JtX68uwzpOHYajR8dsA3ekVp/nvz2T+mFA+Q+
         EoQzAuYrldZcrCCfET5NNuGy3OQ2/6TjKivZN5TAdW7jsmy1T1OQnWV1y7wTr59/qosA
         I8syR2ByaOSihh+UAI31e5TJPH58LGuTTt+qckBr1oAntXuGGIGWmYSPzdkGui4QHCFf
         a1G4ifcX9f0eILhcRlA/hA5aE9cn18E/zl3GBXib0bSdw0fw2XZQVPSa3AYLsKr1xHsK
         Yknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909233; x=1794514033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=OZVLu2M0jyj0e0JP4a+FOFsG/EjWSb9Hs9TNpp+xD7N4bHV3EH+laqwQquwepZV1z0
         n7WS1U36PUKO28GSsTnd9jHoMQ2kAx4p7MANkVyaTn6JFUAydAZazmKtDPJpriWGh8Fp
         XbnM/Iky4zZnNJuq1bNEYoUD/nIyGuerJndNnoOi0vr4K27FlB2fiAAyXaFJeWlnpcXA
         41zYHgeJA7OHKjZzr9bFtBJsqEt4epzFIcJAWPcM1AmG0+hJqsls055eod70gKhxegwB
         2SfSf48icejdB4UyYNr7utLrwwb30CX09tYVXGsojrleLY50Hkf9LOFFdBcXdinVRz/7
         1u/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx30heHP7sPpx0QD+1MXLOJ9ZWk0t8lzEtHNaxvw5uxMGFRd7YG0oMZFibqGYhbNyNsiAqsc024IP0U@vger.kernel.org
X-Gm-Message-State: APuU4Z+VLxKEhRIxCcGGCMy+9T9NTAlFH3ufys64NbhhSmaA5nI9GPbu
	DC+fBtqmWP7pVMbc4vSGOXUvVGck7t41GISa3jCr+1uap6J+8E2JjUXW
X-Gm-Gg: AYBFou3gAVhYC+dyMD/1lpDtD+0V6BS4oz/yiaBF/t7CSNWyUtlYalkmxI2znAl0tUY
	0MKu+17evwbPg97GZ1bmxQAB5VOrI+Sx/vFRd7Gd0H+pDKmFCjtu+9SitULO1LZa/sHcDyRaZ7b
	7Qedyq+/TEyzJ5HDsyOzyQdl9/GyAoo/NyhxUZxNBwoNKm7LO8H8zknubQB69kiWintbSakc4eq
	TWzaJfb7cRfLnSL5qu5ZiVq2gelxSDe1tczAFL4vfnR+Q/BwwuKy/zZTh2rKeJN/94O7UtI+UqT
	3QEuNEQziDAwwIqW4YPohnAohHisTsI3gKzIa3ns4w8fa70Y98W+QrMXP4GoBBJJ+29tDnl4XgD
	C2PgJ1GwLmrqcZDaLsWmdPSVXJYO6Tntk8UoSoA/Ow3+f+c24XiUhal0pLgQRVXDeF7fdS9BHi0
	OQInHMjmO4UDcPP/uqreBrTnt6rU6aszrZW8LSKzfrQVOfGGVNHsMGSjUadiOi/rqAeCgltAT1Q
	HGrxrXlFpNbbF2ZxFH2ABF2ZqqFPwuM4fUYxumvl4d/OJHSdi01RbM6IwBo8Zjm5PcC7t+oDJwq
	VcA0R1cQ7n9UZ7lXaXda+xdU3o8oZKjF09yksWjrz8CEVAoVsQS8ouF0yoA=
X-Received: by 2002:a05:600c:1d26:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4b6dff86444mr3062505e9.34.1793909232668;
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 0/3] i2c: omap: add support for DMA
Date: Thu,  5 Nov 2026 21:05:51 +0100
Message-ID: <20261105200556.34240-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.

Kind regards,
Antoni Pokusinski

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 291 +++++++++++++++++-
 3 files changed, 303 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

