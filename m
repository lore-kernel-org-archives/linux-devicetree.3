Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B39E411660
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034459; cv=none; b=quoTBXuSwXwOGEG9A9QIlMQoDywnDYqwBmi2bCvdePjn/tDIVma9TrgA6fCKv77bsDkbyoplFdua248rhUv/IeB+Jzht7ZKYB0x2mnCIHVOx6seOGDjBYfOsQxcva80y2gJpDMBXWpb9U0u8V1VQdgFXJYsMddTrfy50DwREKLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034459; c=relaxed/simple;
	bh=H/kR+2HYwlqkml7voLWdHY49vUjyuP/Tsib1MnxQLD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oufA2/gJiZ3y/eF6ubR+0sGBiZq+N2hKD1CS9FjAHfbyfOt4XyLokQxkdQNvilVzW+fxKVVvjvEm1B5XKx+aeJmVjNCZNahHQeLFcryBrNEJpJLDwE4uONQM4SHN/DZZNb0KCkiWppE2Dfhh6q5TCmlTnYSh2K5X4zUXbcDwaJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxcxRmUY; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxcxRmUY"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba3ea5c46so3574460a91.1
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781034452; x=1781639252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=VxcxRmUYcFUQ0tfMrxn479ooKQ2xqqs6/jfKkhP4eRIL2kNN/BrzarcsUJHXI9Vpdm
         I8Q6UnZu/RVa2vUHlHOhktKp3ueTInwbUWI6VHUBKe9ceOrkBqTjE8dggz9wZjvfxByG
         rrKCwWg5VTeOW9LbMs2N7Q49bdIhfUoKUBbk1fdyCth57IogSzObn4Nn1tMtkZmVgO1O
         QcazRUQo8DETHtWA/NGGo6KcPcfVqImZJT1p8Tbgi49oKnWNbCLlw5V8ut8EfaYxvYEI
         Q2Qj2DUTGJs5zvU6Z1It0XKmTYeCkziVgPAgT5YF8dmk1DYF3yNQvcD09Kr2WgugdcvA
         aikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781034452; x=1781639252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MpR6igjuZL+55NUetVLOlJ7WyoEDc1JskAO0eU1M5r0=;
        b=Mv/SkD+fkVVTWAz9UTpeRPto73gTpJZqvBhKn20cnRV1RyQ5IuwWJGSTj15/MdlJRG
         /NAGxDOVegIIpGSLRECgmuXJCvA4xEdBMT8zv2diJ0UI3xS7JCXOwDmECeIiVqH/YqiJ
         fiEsORJurct91sG79xq9JB6e9U4iB3Ix68tn3DYmwabHzzjfn/NCgNZkNO4sZXH4hy6c
         K5UXcka9NJToUYpcqBeNDc8MlmhCdI0DywKQUade2rUgm6i0A/u6r3eFYx8HG5dEVh8w
         8wi+TAM6cAiuXNTIU+OQN3WacSQtgVKrDwZOJ3u0Q4BLQlfF4BX+n6p3+4HNz77Hgl0t
         UCkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jzHQ2zGyJehtktE3Hd7vOYvzy3EaohU0NuL6NcbbDs1GiE6ElKIsoaL/FbChtk2jbtLNUV1H6BdGr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy99S4Qr618L+pbmMR7aXbJ5CdjpZOKVu8jhhOFWXWyRZmaB1sQ
	M+UNlIsEOG3Jcq7YGl61v/jieaHJXD/ay0+2hL39cDnPLhtIvuLzDcMe
X-Gm-Gg: Acq92OGtVby2/zJQWrRe4l0WiK8VZRhK0UjD/J3wMtQsOe4Qs2D2Wzh7tIUUJSz5DoG
	SoOc+Xxqq/MkVnju5bY1LdTjmg2a5NRcGzWuflbFY2yjqzKr/8ERZdeDB9RtbY/KP/zGBqeivPX
	IRF7EYCOQtQyOCh98cr1sj0KBLFXncXyz/vtN3WMiWNPLJi4xhAWOSSf4xvamIeb+Rxy9i6zZhW
	4jEeqv3/EMu+peZJ/qnOm97RA3mA9kkXRMclnDfXR3bPvMK26S+TjX6S/5ExSgQeJiGZcR6FhAb
	mWHkY3LgMLIMvbmosfosGBjMWyb775wEWFHzonWAjRnOFFkcKJ4UFEt+pn7BS0AZXFEZOOFjICR
	+MBH5LAXEm39ocTmm9pMcyluv+5yBjtiJKX32VZSWcKykA4qtsR8CRtTQzo9DDDx2TkNfAOdjGg
	yJOvDU5l2K
X-Received: by 2002:a05:6300:2213:b0:3b4:6026:6c78 with SMTP id adf61e73a8af0-3b4ccd45617mr26253003637.11.1781034452412;
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::3060])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19517121a12.14.2026.06.09.12.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:47:32 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Tue, 09 Jun 2026 15:46:39 -0400
Subject: [PATCH v2 2/2] riscv: dts: spacemit: Use symbolic PDMA request
 numbers on K1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-k1-pdma-req-macros-v2-2-5d5d7b997b54@gmail.com>
References: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
In-Reply-To: <20260609-b4-k1-pdma-req-macros-v2-0-5d5d7b997b54@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=H/kR+2HYwlqkml7voLWdHY49vUjyuP/Tsib1MnxQLD4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiyN3GM9QkaZAY4pz7LmFC1dU6c9iz/tlMZKQ7fXVvMvK
 4nY+yd0lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwER+HmdkOHPhNCfP+fsPPTcn
 1nqfuZncluzK03QtbIry7o75tWsLqxgZztYqCf0tjHyftnB9yeSb33LSxM8wrTAwv3V5m/txgWc
 5/AA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The K1 SPI3 node's "dmas" property hard-codes its PDMA request numbers.
Include <dt-bindings/dma/spacemit,k1-pdma.h> and use the K1_PDMA_SPI3_RX/TX
macros instead, for better code readability and easy for future
maintenance.

No functional change.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
V2: No change.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011fe..c413a64d5560c 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/dma/spacemit,k1-pdma.h>
 #include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
@@ -1094,7 +1095,7 @@ spi3: spi@d401c000 {
 				clock-names = "core", "bus";
 				resets = <&syscon_apbc RESET_SSP3>;
 				interrupts = <55>;
-				dmas = <&pdma 20>, <&pdma 19>;
+				dmas = <&pdma K1_PDMA_SPI3_RX>, <&pdma K1_PDMA_SPI3_TX>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.43.0

