Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909239;
	b=hJTBv+iw8eN2TmiC+GjU8z21dJ7SnIBmdzLubRs8O0yDYeK8GNtG6+sqAw6+PMTGqP+Z
	 48RVz0CLkTwflJ0IpMw+FMAe9Dh3s+BLvqDm0rp7USFmvkeWRgZr9wNxZWycDfS7UIqPR
	 055cHJTzycGr037PjEjGbVAfPuRr287QlnBUSeQSvNyLCH5PsW8N8vmxe81rNv4zVzjxC
	 UaPjE8ZdqzbLrwS/rLONPHzFOW1IfsRr2YNr5E57947k9nJpC6P2U18Un75owWlcWjZAi
	 Igw5k4nB3fH+E9SdSkrmH3KHeZ6sa+xInRQZB2SpjMCbDG/Q+QICZmd8KI41N5W5b9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
	b=hCRvJuSPrCKLaHdcXicSxbUsvRidWdrZdlx2PORiUCiNxne0F70syX4fzMQxD49qwkow
	 sa9n1D6LN7+Y4HUFrtJxNh0OwoWnXcC3G466gqny8AuBAKvwM+LB3rb7w2WUb2ni+jrHM
	 j0lVImW/lS5NTJ+DlgjiH/UA/F8j/kYqlQpZ2PpgqCRx4Ke6sbduOZFtmRFP3u2zD1Nlh
	 PG+G8zQXEzWkKLKqzT5Xkdxi3w/S9UrUIzkWysvAPdmfDS/VVHAaUcGC6pDE1Wax2GE1q
	 DBt8t/VoUr0zldKVSL38U95gc7yK3C84JfytUrhiS5ECW+2xul5jHSqKgN8lTU6vMQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90314606EEB0
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 20:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90314606EEB0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ub1ox8GP
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so16925485e9.0
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 12:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909238; x=1794514038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=ub1ox8GPhezjPHlk9Iw0X1EMDdUJXux+i9QRQ7wB/kyUmsRoRwEtaWe2krP5upbaz9
         Hbxlh9pZL+ZsPFL1WzxOGEXjUs7coUW8OlvXL/CyZ9P4jRSNwCsp8+ITtJchShWjobLS
         VS4jqDWatzVBi5x0J9R2aYUGhWARactIEuNQA5hGwCRJBxPeMt4cUf5AgcQmaiCJzbcE
         63VPl+CKEaQ+Y51TybM7udRIgteXEsgBMhrcdhsAeifodq8QUhC+P41aIfqQ03+J4xUm
         9UnEw483xSJmburH9EKf2VI2ZG7cPzJRZ3VYnFtGGDiHD71LbauDl98eFNnRHS/dEAv2
         rAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909238; x=1794514038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M8yk4UoM0PWyZhp628ipm0Nb1+FaTd9tnw6+7GjamRk=;
        b=KKMUV7kxwFNIWftLvmQAhmEzbO+ZRPCqGZVovC7TLrAxtHNOQIk0yDwDyNhdM46XSW
         +PkFUxA4iXSsWt1+CAK0Q+AGKGuLjkORXo93B1zMpxTh5xNv1wnAvWUt2+LwQF5xxz1e
         yzx0NzT10Fg2WkdO3IFoXo4JCvrga6WvIfEvuVkOdYTpqaOB0ifn2Za1JldQSC5sTZpv
         456E/ruddVEJA6ZLtQC6hOt4vlIwUR2KYmUpcd0/J9Uy0b6rK2JDJsGHDbTYQmkF8Y3m
         eZ5rs5Mchl5CE+uRZpLndsYheG74lscEMBxVUOkQKVaMiPJ2sCoC/dnmXl45+7IkkPQO
         bKPA==
X-Forwarded-Encrypted: i=1; AKwUvBzAfUAbFR4Gl/gFUfdk6sR/1dqt2l8jX3UZEfJGCupww3d0VC6dpaIzEzCtE+uh3RAiKUj3JSTTpUtl@vger.kernel.org
X-Gm-Message-State: APuU4Z8sgsVk6fVP7LowGJtBpKur9sq36mZIfHVF/wdR7e0Rv6oGdGpc
	onnqA0L5wMLU2iAuJ+JTbar4tEYkcLCvQjKiNeq914gu0XDmmEe9Y1rM
X-Gm-Gg: AYBFou0vmVxfxRrM9ajZt7ykoc3Gwe1iZh/55ZeYuA7tmDCKOvyyyUXfw/9SZEiEdBH
	j0rRkvfyEKg8zT8PMK6RAupL2gtkdqsChjjq1ItvnlIFjLw6iT2hR9toukhy9AqS1Qn+fbAR71G
	mcqtkRLWBgCtfm9LBKC7fzqN7nUXNbc+vM7xtyybzACMfL8oSQngM5zdyHvP0Grffdmus4M9lWu
	pukeR3HX+Uns3LSyKex7Vw3ZjmO9j92DlIj4UwKMaMtCOEcbtuKsDenoVQJdxbyVW6FrUfPD+LL
	tKLoQ1PR93OwdfU5ALkiiTQ5f6xtXEQ2eQm3XnMI5riwWZ0hO0OhuBIVJI/lHW7pJfQ6WrjJZY0
	fIEGAyTHStxUBY5MiLS/+CqWj0Vv+xrY7EdySCOqfqqnLl1O/p+ZLu4NbLbUung1WSfuZ7Oc0Y+
	wZA09PV0rKWgL7kO851cibZh2/okWZbMTGDaK1+wEmS/w6Om+Mq0HYZTfrW3btom53FLSQEVOlI
	hSBxutt0JN6GO9ipc5SYyV6osObSRYBIFL7bG2pHA4EoiVu0KgmUTfOIa3K2BRVidXvvKyvukCI
	0eHx6sOyGwHwFP5ROhRPFIZjDS1lrkVRZnmP8fja+L63gmiZ9fm5bLdKBOk=
X-Received: by 2002:a05:600c:138c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4b6df6df5d9mr3339265e9.32.1793909237922;
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:17 -0800 (PST)
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
Subject: [PATCH 2/3] ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
Date: Thu,  5 Nov 2026 21:05:53 +0100
Message-ID: <20261105200556.34240-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105200556.34240-2-apokusinski01@gmail.com>
References: <20261105200556.34240-2-apokusinski01@gmail.com>
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

The i2c0 and i2c1 controllers on AM33xx support TX and RX DMA
requests. Add the EDMA request mappings and DMA names for
both controllers.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 57a45609f9f5..89fb1d1eb049 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -239,6 +239,8 @@ i2c0: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <70>;
 				status = "disabled";
+				dmas = <&edma 58 0>, <&edma 59 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
@@ -1189,6 +1191,8 @@ i2c1: i2c@0 {
 				reg = <0x0 0x1000>;
 				interrupts = <71>;
 				status = "disabled";
+				dmas = <&edma 60 0>, <&edma 61 0>;
+				dma-names = "tx", "rx";
 			};
 		};
 
-- 
2.56.0

