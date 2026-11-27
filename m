Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780922;
	b=EIN7X+ebiw2mgCQqNQcUFg4jbTvJxDGwalhSRiCIqlY/+1d4phvyq6LXoM+mhKY0U/Z1
	 SAN8P7MC3wUXkpQKfSt4h84p/DurIMiCvXWrk+166nqE6xiENY/u2gfObjZce2STJeVP1
	 t3pb5e99C/9JJUh5qsU/mqMEhZkY0/JZDYWKihdXx8VuhSOvYedxjVUesWY9cPxDh7zUp
	 lzeTBh+pTjCgrUgrOs9LsjAziox39wQQfxK8ApzY4u0Rc6aV8sbSb56bjVbFtY8tVZCKv
	 Mcf6u53eVNRCzq0KAOy2Pv+WURYh9cnrPOpfKW6qzxYMieOrbdoBULVHk5ZWtW9ImeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
	b=NbgiaCOFHAFNX6tlHi9vza/PXHNwNV1e6mdj+ih3FOzH+P0RJ2A/NqPAq4e5qkCkOe2x
	 7qZVvymJ2ORUqNMl9vNZR17ZmIAQDwGLX2JfCcUwaGMsZ5H76QAnWKa6FTRhwQoARYjLv
	 gXzTaLYr0YK5G28STitbsBuYjjfN0vKeAtV9Ty7jz2mZRDgf+rDcNg1TkKI58f7hwns0E
	 AMrHXVKOzaPA+GmKzBzy2ECTUar0oaqKZmZqTsFtPqJ3lFtr66C43aEEY94F4eHYs0JRg
	 b+o40sto3Azh/c2jQso77VCjvg3rLlfmaNsYHEjF10kdkzycgB3gY7utKoEraFVa/GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UP7PWYTd;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC97C606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC97C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UP7PWYTd
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bba60271d7so24930695e9.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780920; x=1796385720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=UP7PWYTdyDVH3EWvLXWmk/5KPymDwhNBPpR5EXBt3oVsXELcDAT/BLBvfpxe6VUBv4
         celZbiGd08er/Sti6TTtGY1XSoM6QoNvT6XVMRWDIa792YJ/FwtPID5/k0qCTAZG7wQj
         bsrNb+KNwTNkV7NuJibCOslIO2u6/Y4EeyEXkrEb81/tOio4T+D2T+HC+7WEwAEi57+1
         Ae2xX4bUNb7oam2SlC7jBnMQySMpN7xOirIs3z1ffYWPgrQHJHGg1/FoC3WenFYd8hOI
         M8bGZB/JNWvQxFnzAfsnrqsZptiiZSmx3PjaMupaHpDPk5ZjZY/rVDN4b1h2XVPXKS6g
         FiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780920; x=1796385720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TyMpVGhTjV/u04TckFiyynsoMuEnZrBpJU3DYNeD5YM=;
        b=rl5WND8c1ndBIPXrmG2dw0Es5Ed9dKnGw/dkI+dYc9suAINvw1v4B2DnZ125VnWR0V
         0GTN5XJ9SBFp3d0M9pIb9KyR8/6KFLDU262KbvGt1JOJ/T8oZ21E/vyp4ILM3hUAxjRQ
         2ntzhxyQzlamrRxb42r2ZifFfPGOOf8FHAFyfxfjH/eNPJ7x+JZKPjtS2nKlfq5eXjju
         OKVacaZU7M7jJttj12vd4d6XSi+l9js7bkxZ12svN49APyD5izeZHQEXCy4dTktBWBLa
         tTKcex512P92jRrBSENXV69Wzjy5xOLcED7PSFJyD+91BXiS0MEa4+06gZyWfJ7gwMkv
         iMpg==
X-Forwarded-Encrypted: i=1; AL+hErH1Ntg1ckGuS+wLpTjmy3XjCJnbDT9WYOVJZNNbNYFSYpFLyX9O0FedrXRUZLI0FQXqIzcn+0smQ7v/@vger.kernel.org
X-Gm-Message-State: APuU4Z+zjwcD4e0aMCsBegBvu/K0+jdjtK+q4qtkgqC900Ae1Ct+dqU3
	j+yr6FEkl0IaS2JHYj1uv+Q8mBqRihFBV8i/1dWLWFK3b+TVLFu5LH1/
X-Gm-Gg: AZFdTZcV3Jsbg4Wu2axvthxdOGMXbSPBvW8k1R91PCK/C55bzgZYKeLl3Qmhh2Qvv8k
	DNtUU2573AyEw/MKO3rb4PaMfoIc+gUzJyc0FE7M2SG6ryBLMQQvcQ9Fnz4O5u7zKaFlZNnX+PV
	BZukbxPu6J1ueGATw7Ss0N9OGZk07aOI3455BBTvE7jg9AimnEU4ffTda1j7kzTeo8b4QrJowVX
	HDPMurs0LL1t6n9jat7RdiHSyBFrt4A2otnc7aANvR5d0SNLBNJ6b7aF1QyFz4TuCMFjkybBxKm
	gshsmj5sa5t0E1pA9OJwPD5vMqiOS6wBzICpf5CqY9TrrMAt1XUVZAYM9azHE2xG7IiShe7FvGy
	YzgG8pBDNU5lOfDAeEJtBtfVEaSEnXYC9x+WM+Ka9Y4bZz+Jn4EKgjggxspv4zhmpXW8Y+/MDPt
	134y3erbAZlH4gVPFAIsnMqIIg2bs+dm4jOdCr/hBpdfus79F7HcDCnDgp4jSXHi9BJuCQiGewj
	bJ9Ai8PHQ/qRFdO/fEHA9SNnhoNo9qQu1AubkDpQiVZZacmuNpEqPSwgIauGcIBsn2hbJjjBWA1
	uIJhZscMg0wPzwN7qrZoNOztlY/QDOW2io4Ral3koGmbd2E=
X-Received: by 2002:a05:600c:a4b:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4bb88806292mr505147675e9.15.1795780918009;
        Fri, 27 Nov 2026 04:01:58 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:01:57 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 21/30] arm64: dts: amlogic: gxl: correct crypto node definition
Date: Fri, 27 Nov 2026 13:00:54 +0100
Message-ID: <20261127120103.1532882-22-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
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

From: Alexey Romanov <romanov.alexey2000@gmail.com>

GXL and newer SoC's uses the DMA engine (not blkmv) for crypto HW.
Crypto HW doesn't actually use the blkmv clk. At RTL level, crypto
engine is hard weired to clk81 (CLKID_CLK81). And remove clock-names
field: according to the new dt-binding, it is no longer required.

Also, GXL crypto IP isn't to seconnd interrput line. So we must
remove it from dt-bindings.

Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..5d0bffda8f19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -68,10 +68,8 @@ acodec: audio-controller@c8832000 {
 		crypto: crypto@c883e000 {
 			compatible = "amlogic,gxl-crypto";
 			reg = <0x0 0xc883e000 0x0 0x36>;
-			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
-				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
-			clocks = <&clkc CLKID_BLKMV>;
-			clock-names = "blkmv";
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_CLK81>;
 			status = "okay";
 		};
 	};
-- 
2.47.3

