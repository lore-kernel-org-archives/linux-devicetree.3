Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678A48167F
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909652; cv=none; b=pezzrVYsauwzH7tlzPzEwwTWvZ4E9tzjX5yHsTqhOjn9JdLf7oXlQnQgkfk7aBzjOS8TDXiRaMmBYBE3USB1S+Yk0vr4G1zM3xE0ndwQB4jPkTAdcodY5pSZmhPztmookyUl8zJzSGV0NAc0pwF7mI9y1lp44i7puMMJrhtGjMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909652; c=relaxed/simple;
	bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8BHMgwEDtMtNsA3WmswGeMpAXvderOcZYgniKRk20df+KJZMAfJirrHLxHu1GFcIqwM4PLs0fdU3NzJeWPRZH9ntYIfhu1BZT6LYgK70DK0jRFQv5NXrtQbMkuqXW9JrsvXqU+qvSarkuTWLeiWZpgUl6l6QRamfa30f5x3Hwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jT5JoNCF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jT5JoNCF"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-470174001a0so531539f8f.0
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909649; x=1783514449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=jT5JoNCFxApOHfJOCuGuX49v1vcniQOT5EWxNDvBy1ElzumhMflwr2QIjQvXKSEDor
         T1UStpcFdmcZLJ6aXz/crChfxOtpgiDvG8x5RZL3F8cSL1VdQRbSFPoL4uLI1MK3TqCt
         HXLJ4CghhDc4UUz46/R/ubVk6wVw6xc1tMy7DI8AmRO8Eq+I3xBUEQRp8NXCi2fciYdf
         c33fVPtl8xdqBeYxUBMAaJ8Acp0fyRAKmJdHa6gmsiPwZBpBgeX3yVPD5X2/7rFhRkTX
         0CZUfK+0a9ZuLk46ZIDtzHX29puEb9lRVLLVDN3I7VumTklsFvZtObqiNBD9ulwfY6yY
         6ZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909649; x=1783514449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ga8f0tsQSQ1NxTF8LX5eJkVav6t2RLzk7/oapYCbhN4=;
        b=q1xpRCxJ++apTiZhe7MSEfyB23cXCnZxJZY+bJa9H4KmRsedpG0ad2jroqJtFvucQ5
         IbAQAxzx6yz1sXvy18GRyuWEgsGhTa1Bu5PF5aLikei1FDJvvnRasT2hdiGa7V8jUx8D
         4jMMoJHdeuSUjEeX7EipIjnYLgeZjjDBKZHKVKWJW8Q5w5tQnjj0j69gWKu2BgbHaUue
         ajP9+qm3xgZ6SWXWE490J7qrmI1ptKAPz3XUXddJc7o9odR+GOV9+OJRJ5XEYjpArFJQ
         l8wtbZzq1QfYqXxB3l2ke9cLfp6dbweTXtNeBR9G1QgI/yRSbYn57GyufFNvU0kOdmUE
         ytkw==
X-Forwarded-Encrypted: i=1; AHgh+RrIsuRR2cMJzAMCsHCJ9qTJa4fH60n4XExnD0pAtx+zReP2zgnNWGAqUR6OGqptqteNPs/C6TzHFvLU@vger.kernel.org
X-Gm-Message-State: AOJu0YzyoQkwcZiqJuRyowX0KZr+6CHeNbPIXlzrw1kAfbBPCXR8u3lk
	j8KEmxK3R3NkokdSfVezxs6g2h8i8QY089xPsWEhWOlLEQixaAhFyZ+1bC1H4iADIZQ=
X-Gm-Gg: AfdE7cnJBgybOv/U3jGocW08JjnHItXiYy8G0xuNsL2P6ERxNBKIfKBe0RTE9L+wpYz
	JIU/wot3lIViLxzIVPVXad1Bn/VUTLYxilPeT+zZtGVIVb7UEsboPOCwrlt5JQy7Y9wvsXijIkc
	70vU1zjUA5xMDpMfV/ECFaySDuOM8aohrrpOh5OG1A23TjVPoAUMTJOLc9CZWuMqbuaZIS/ErkF
	h8Lqf3On+W0NOvQWU4M/Y1rgZz4M0/0xCagAXhZlFX9qvxmiuzGaGhgNtHqWUT45SR3rvczqFAg
	8V/K5cm9c2E5MdupUbI842QczvXsk+c9mnSD9ifay5jAMwdzMTtPSyE6K/AEoq5kEyFkZHzPef2
	U9N/PCo4Bnb9y3c3JjcH0QMFyfOul89tjE6W1GzjcZzjdprp5axRQJtMtf+KTbYp2OdEjllmasi
	Z1pyQD1c1ERw==
X-Received: by 2002:a05:6000:40c7:b0:475:7de4:82ee with SMTP id ffacd0b85a97d-477b388947fmr606880f8f.17.1782909649238;
        Wed, 01 Jul 2026 05:40:49 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475641e4659sm17892064f8f.12.2026.07.01.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:48 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:14 +0200
Subject: [PATCH v7 02/11] arm64: dts: ti: k3-am62d2-evm: Fix wkup R5F
 memory region size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-2-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492; i=msp@baylibre.com;
 h=from:subject:message-id; bh=/cdLsE4GymvHLRjtj+WocAzlDHQHGpLi8wiqmhvVCHs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXruZX/Ydn7lAu7Yh7yPip8BKfl8milRuvT1E9EDX7i
 OuumqSWjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZiIiAcjw8w7HeWKXyeKSZv/
 MuRZ/HDOcsFPsp0z2aLtT7paPl58g5+RYdO1pYEr9a37Vfazvv4tt3+9w8m7G8NN91bf7wzjz72
 9hA8A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

The wkup_r5fss0_core0_memory_region was reserved with only
0x0f00000 but the MCU SDK linker for the wkup R5F firmware on
AM62A defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 364 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B5B000

which results in an end at 0x9e600000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e600000 - 0x9c900000 = 0x1d00000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 1544bca2f188 ("arm64: dts: ti: Add support for AM62D2-EVM")
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index f5ceb6a1b5debabf1ead67eea634b48db1540186..463a3f6130b8f2927a032137e87c01df446cffda 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -67,7 +67,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d00000>;
 			no-map;
 			bootph-pre-ram;
 		};

-- 
2.53.0

