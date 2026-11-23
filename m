Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445651;
	b=3g4Jv7cDCDfb/n/SEsrS+Sy90wsG4kyZOWO4emu1uBLLBlAAUDrhuAr1DKo+jEK/Dy0p
	 NYdzZhPHCHIy4hUdWeY3r/fVjt8CaK8M+0uc2EFEe1ANQO3hEDFJIVxgRuEmXNoSsW4us
	 6TD3ubFRsr7lhouw8G5qOQoMiENG3SsTZXF3pImGTGDNQnIo3D31ES1W9BWlJGp3P0S1v
	 5jNEl/EEi7UerS34EHBuQJF7uk3zm57BFK+UES5z1/X1aXjUvTFvQRIrjYiF5Vb9GV7b6
	 tWU+MCfISq3B4hSIBqS7u/H0389iTkqFY61emTbPeFUxQSJ6gPbTrFZAytMY7Dzo+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
	b=D1OuHY/XywtPQYxwSlJcBcN9C7rlylLISzWCzJHOlXvhZmf/CIgAVC6OTBkXF9ykOGOJ
	 NiukSmLm9x0w1gsrxIqYNCZ9oCnZl6v1Vk8I4UPfAQ+JVKeIdF71bVjJHZS+9tlfEQ9FJ
	 rV/HJvv6bCmT9uGxY5kT8FxElM/Ull/ZDI2LA1rg4yVVNC1IUB30eTXyq0DXgc21DTnzv
	 wBy1YPk+EFNlUY8jpvPcEA2eMRaBOXbrBcvCdnyXYmjIFxKRl0Q0qNkReN2qypQVTtOAG
	 QhO854qwFQs/s1/EzHRsbKnGd+wCgsLftLZ85izk+wpKfFIw7VQOrygzBp6xs5oe1fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AB606D151
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA1AB606D151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HL5uLzsn
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a42b34e930so2985247f8f.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445649; x=1796050449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=HL5uLzsnZ0HLGVR9tCA2U0cJX9QOExXCdawGBp8kA/TdqLrTwxqEKO7J5+0hyIpiqw
         Q6vXaVD9pW6ZsRoOzUdxG5bhK+dKc7P66U0qcMArv6mMI5cWA+2NLbEIGZJ2NXAum7Qg
         0+gjxCFuE1HvC3IhRJQcTZv0UKI6f3HPWtx5/sqmT0wBmaKU9fXvFN7XWSwZjsmv4ho2
         qLFT3lS7Li50VOoU81rpMkvgGicgdiaSXZ1AxdwiDW4DzsB0A2yR2i8HxnHIX6HqEL1L
         DuUXLdGzJCT62dBdQ0bGBy/IqIuhHeHJXgK3g3wp/PsuVAH5Xbbm/tD2KMzCBfEGCPdT
         sh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445649; x=1796050449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEdGm/AcXh2womt9GiV7Pf7HrO6Vbc46kckpe+SSelU=;
        b=wfEHLcbT/TOH7RtsvdQMr+DfVdODy9GCKWT8K8Yxae3Q83hqfZ0zkKI4wIsySOtTx6
         xSD1x57tGv++1k8Vey5irSFxqHUHzJy98l1/krs66rIHFNw6tzcr4GICMCkeACD7MdG8
         56JLLoC2SRe8UMOMZMb2OX1DjF6Ak48vpBH5AC7+cWChHnJjhLgap5OvmdeYdRH+IbJO
         N/tcPzGk8kT8sgdzAdT384riBlJWfa7nrscuBVTre1EE0vrEtUwSuyjyfOkLm1AJ2ruf
         oCBc33J8Og59SLhAk1rSEPhdk+FAhTnNvStYSSorw8nGm6JKTSQSxScJq66O+0Cypv6+
         wrYw==
X-Forwarded-Encrypted: i=1; AL+hErH/EF82z70CHf9JNvGSoLhUpAsxGWMssBGl5J+DlqE8IGtY5b67d+J1DOwlbYHxMHRyYNhiG+xGyVdI@vger.kernel.org
X-Gm-Message-State: APuU4Z+47QFdBxnT6DWtohJU/Jqc72xBBIsy9l1R6PA99bSD9mhPTL7v
	J5sRfCmdh5HnfZHHVyphu4ug1O+jD0sDEodE2VpiKKRnRrX2E1r65291Uti8ePDbrvg=
X-Gm-Gg: AZFdTZf3iNv8CO9REpZxCa/Cnh/0qsFlDXHctz5wwhkPeIuUKJO9oG93yxS9/AKUcDa
	5K5WbPu1hhvjNGrG60B6TXW8y/6RFarcTyrXcdP8nxnQabbZBbfx+6PoIHTTRq34/5O2yLYZ2hd
	uZNladxk7DY9xOfbvQG6Q/waIKnqB9YCvjYDPljtXdkqda90VdGL768b/LohFQurchvVvT13vnR
	8SvHnOJyTfHOfJqRP9ZYrgcvS3rXBJ4kNMor52AerqQHrWnQLTMqyeaFBHM3RZ8JHHgVdg4al+K
	j38+kxrcxGtK7OsT21cIYrDib1iCyIpXZYR/k0C+9ynBgPxPKUfU98T5Nj2frHXvIQBRsoBuAqD
	kQ6yzq7H4SHLX1EIqxsTtg/fzZDdMEcykrGFCSWjkoDxwtLTes6UaRPy9oxVFoJy3EmWMYFaClF
	F2MQ45YXqE0L4jfym08tNGjyxnkn1MKoHDRxMjwIRI3j7Azw7xBaN9dnkapooOqAjyRQDTC16QK
	tmMRwIPDZ1SpaS4fdzOj8z5HaWZbEQ5tkGYfJydPXrCDtRfIazPwN4yBLHhEYk9dRz8pB7fl1oQ
	FWSaeY/UhP3dufp0hka6L2w5idY=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr22790459f8f.53.1795445649226;
        Mon, 23 Nov 2026 06:54:09 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm22701444f8f.41.2026.11.23.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:54:08 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 27/28] ARM: dts: broadcom: Set the DMA flags of the HDMI audio channel on BCM283x
Date: Mon, 23 Nov 2026 15:57:05 +0100
Message-ID: <20261123145728.29082-28-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

The upper bits of the DMA specifier of the BCM2835 DMA controller carry
per-channel flags, which nothing uses in the upstream device trees so
far.

Request wide (128-bit) source reads and skip waiting for the AXI write
responses on the HDMI audio channel of BCM283x, as done for years by the
downstream Raspberry Pi device trees. This reduces the bus traffic
needed to feed the MAI FIFO.

BCM2711 is left alone: the downstream device trees route its HDMI audio
through the 40-bit channels, so there is no established set of flags for
its legacy channels.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm/boot/dts/broadcom/bcm2835-common.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
index 39eea8ce1058..6267f0a67565 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-common.dtsi
@@ -130,7 +130,8 @@ hdmi: hdmi@7e902000 {
 			clocks = <&clocks BCM2835_PLLH_PIX>,
 				 <&clocks BCM2835_CLOCK_HSM>;
 			clock-names = "pixel", "hdmi";
-			dmas = <&dma 17>;
+			/* DREQ 17, no AXI write response wait, wide source reads */
+			dmas = <&dma (17 | (1 << 27) | (1 << 24))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.51.0

