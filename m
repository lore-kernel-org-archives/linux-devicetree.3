Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB9D3F825F
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533561; cv=none; b=oNj5/I878Nu7KZDLMSkYP1/8TBjOrkNiEn4yncGZgatCcPoYV3dPkns571AZ9MGUkYVyQGI+DHLvZVGVL13Uv/X7xIhXFRJEWX+VuC+AOBzvdCbvkAazdaKy5TsS6A+EV4JWdpao4tvftwVgpOzzJe3HHy0QaBJroQu8MgoI8p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533561; c=relaxed/simple;
	bh=4URic/YHvxH5xLegmZ4O43fEyunuuhWo/oprktg+16Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=maPP0WFgPE51NivqfNj549Cntb1N84fhAWj46FevJ6O1jmiJ28P87a/qz0EysKXYK6s8BGscHOlmpMPdiLqpr//I1x18d3ac07/lHsh4uUFMHb7+z9vg5u8iB1qKtd6YCjGcblkopl9G3a1f4whGeI0gDNPzmmGjhoFB+ODLs2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c74mXNS5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c74mXNS5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso25509675e9.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533556; x=1782138356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=c74mXNS5i6PmVsrVkLslhdjKGBdTHCTr1IACsudqpXUsMd0jPR/zxVGgf/ae7CwSFN
         XBM+Gk4O4FNKde8EfMoZYP58bcjkeS5dFpaJifu471n4fUD3uzhTZsW7nOtW9KWosZPn
         AqEy+vnLniwG9Sx5uCvaKB0vkBCEAKMWWi+rSW0a0go4Pn0KVfdpjFMLIgZG3w8P6RoO
         NQnN275cZ8cS3xxh1nWf8wanyX3Gg9GaskZporfvL25Pgyg2tygUE/kGqaaVqE9f9mtV
         jQsxNAD3YaWLH4FWWm9LBqPpX7afgx2H4zPKA0ZoEqNSM4ar4C2lrh2igldklAd2zi20
         MfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533556; x=1782138356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NIxcJIu7VDuVVex0+dWXJoND3UMHyaLtOOKZ21zptM=;
        b=OwxJb7W3ZSHkr63Bg5t0uZz8hGm7FtfCRc/uxtM5RlIEjqHbE1TiyBqTgtXHvTqkrK
         3pcqxzYrKr0nJwGksjYtenr1n+0kbTJl6ICReMb1KhTQ24RVDYYGyYQ36ZaydNUG/KvG
         xBO5+WjVBbhmmMEpWLeVzHd2oFET9IF/MXk6IfdVHGBh6aDSjLtOZxHC6Q8YHERCO9SS
         83OfH7IDdQsfJwyWBCA7IH55RlyvAeD/GCci2GwQr5tRHlVMn0/1pfBeaEOkEP94RC1e
         nMAX6zQFQHJ+QC69oKzzwxaqMudfrflpUxgAQ7qJ47SE46BI2VKlTa7k4sUtJCVMSqy7
         ziOg==
X-Forwarded-Encrypted: i=1; AFNElJ9a9ICaAx6eWEhXuBibyTVO4F1/wBtSRGd7g+WwQI97D66iXjUQKfv5UClkydOy6KnURZFxqc7ECwsU@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCVjaL2jTp7gSpvufxMStuBCA36yoPMRUbkRg+bOrmBI2zdtm
	b2sSMObN/9FuDeint4Q/06PwpD/0hQGMhe8H+zIn3ckcKTCGQGcCGuPBpWPXjQ==
X-Gm-Gg: Acq92OEOocSH/3IRnvm66MusGDXb94fgww2ScWMbalZNbo+RneH83rjosjQp2uOn/v8
	k0Gd/mJOaOT+je4az3k3NljPJ9l45ELQaeMJ7uXengsgHYPm5IfJxBOVFpmR1LVRn0yi783qZBL
	0SPYx+RVoOh7aCVRxBHOClGFlz5EXs7lLLKxJSoFJQEp/9r2QZO3vBe8vFte8Xf7X4kM7t4XgJT
	d8WmvAU+L4BUIomrmygVCkd5SIGe/J1o/9e/tNTzEmhZ/vCBVs2ZgzkScnCiE5sLjpqf9JS/A6j
	ybnKxLBW3Nnhx8Vpb+BZStbeDAfHxMIOHBlE/4+kBWn9S45FCfdjUk1oLd+CBNJnsrPm3U1OpRE
	K2296ScpZb8O1diWeTNXMuqTH4Xd1FKcUgcrwEDOCOwG0s5IcHq84cnG8gj9gVXqsMOQ67TWdsy
	Tmle3MHWy9z+7FhfUGDTkobCjges475QC8jw==
X-Received: by 2002:a05:600c:314a:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-490ec502f82mr160252005e9.29.1781533556289;
        Mon, 15 Jun 2026 07:25:56 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm273333205e9.2.2026.06.15.07.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:55 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v5 1/4] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Mon, 15 Jun 2026 17:25:45 +0300
Message-Id: <20260615142548.1373799-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615142548.1373799-1-tmaimon77@gmail.com>
References: <20260615142548.1373799-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NPCM845 timer0 node references a single clock, but its
clock-names property is not described by the timer binding. Drop the
undocumented name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index c781190b42c5..9e4fa2669f4d 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@ timer0: timer@8000 {
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

