Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55753FCB3A
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756085; cv=none; b=Ald5s1ptfmVLQjZld7wkH4HWx5pwNKAPedPrqYRDKLldo/QFbbZnAehif6VMGv1nIaxXYRGxCOlrcB/rg0bdLrivGrmyD4tju4YHyPpQmIjZDdm8M0DXr3blPpZvVn1bGPZRIEk50IV3kvSue76UW2HSGmv8Wzxh9zvW0c+/0RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756085; c=relaxed/simple;
	bh=S31RcA/iT73E2rlScRcBB8K94r3tzTju+wWFc1ueh9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kK25IqRDXvgFbEY3mwEqAc/RiEK39qXDZrRN4P0mH1IigycW2moxVwoca/+0gnONGOlAK0NndUBA0iuZj5wL5d3xg7Eiq3TH33UjXUhf0M3N9nAWe6cbVyJdrfgyfA8pVYpXw1qh4BBad9YKhRyiZACx2gJm9oEA4WSBVE6bic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFusmT5p; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFusmT5p"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f6609c657so1642657f8f.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 04:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756082; x=1786360882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=XFusmT5pgzCqsK7ikvbAJSFJgO3Qx1w1rgPg+zccMbQe3JsrXXDkqc/bLEE9jRPrke
         Csa+x3sq98c6Fi/+Rf/YHWt74fsW+w/r3Hai/pOT4KQQDiPL0xqzBRTmunx2gCsSvaKB
         /QLlsbiGBq9jU9tGKwnQfTCjPDUhb1j5tYgeLsjiePyQaGHHBTikXuthWiQQtepO2yyZ
         z7M56E0jBOMZpZKdqjuIWKiKsaJZh5r7ifT7PicBfLxI3OVn2wSa5SiXgcLJssaCK7px
         ow1bGg2BhREEzIgWDHAeOAQp77Fpn+3N/UDcom0rw7F9l/JCZBxWo9dbgyArWfbBFebn
         V6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756082; x=1786360882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9A30rq3ztTZA8NjaSTuX8appAKxji9QAPEQZArsTJ4=;
        b=hKsBFzOEoZHWuci2XbkC3E12cc10D2wCMg9y80PDT4kTLFgmKDqnvUWNBwWr1/Ydck
         SrnGFsijY0VSKDfB/f+uGQN0NkC6ZE8BvlzP5Rrl4A5OcQD8ZOmxF9ZCY+q1EWCBDwJw
         KOijbpAQuvGpGotF6hrH5TGNR5CSj2ZxpVWympeU943dbAJh2Pvta0l5OEHx8rrYSfGd
         HlyKYKtOGxAfS56CU/XNYhU4GMakM7aHyaGtN+mwnFyXiG3IEf1N+UyS/DG6JSUmFaEZ
         ZkvhXLg6txdVd3bEMyTkZ56fNGIVSZz1lxY2AHD2+4dHFp7hiztczodFPuyv3/lLqT22
         vpVg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/BceyGTIwB2RZACGiOH2rS7Kh2QLs2ovjj60tyVUB13k4cEBlMtlaBoOunuJkD4OsOGID7p6ZaHHj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7JTjBEG+YS6G8TwX5O61v2Xz6zOZcIvK/RufcXbnMVl6m2m4
	nsFj/Py0fUWlWbVIEG3dWgfOB0bvtkGgPPmAu6f3b75eYTCQuwoxemcy
X-Gm-Gg: AR+sD12DGifEsmZwpHoWocCVIjinHU2bICnuQ+j3AKQL3A9ef6k1HN2nHg9oDb4Lhtb
	rj6ACytxJMfgGAneS8ytOuu2+9wmWMsH3UouIUb53hr+gVlpY9W/ZuL1aVqZGmZctM87tZyevck
	VdcxX3zrEfIorXyuPLLEdh1wPb/1mS2gW7qJ9k9Il+sVvW7Q5OHNxy+bVBaHngPCI8pHSXm8znU
	o4JXmWC8FtHqQ8adH1TusG+QcI7mZBjHSWUgdEWrgrshqOfBK3YPivNT1mmOFAZwHcQhJcDvWFs
	ZozjUaKbrlI8iRXGMOkjT9w/pnN83CLsXe0OIo5HrBEn98zKoM3N62WjxcvEI8Z9Ds3M43od0hS
	t2ukW3QHoKV7Rq2wVn7MX37PCZR6mmVRzmF9qfR/M/5GOjPbbLmAXrULYMawQWgu4vubJIDblpl
	A9+gfkgBq53DfuQwUOu2bpbwpZfm/iPbdzGGtNR8mWY0WSDPyHDy4KCRiFsKVRiOJlzYcZYvA=
X-Received: by 2002:a05:6000:430c:b0:47f:81fe:12f8 with SMTP id ffacd0b85a97d-47fd72c722fmr25304247f8f.1.1785756082026;
        Mon, 03 Aug 2026 04:21:22 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458adc9sm34154913f8f.27.2026.08.03.04.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:21 -0700 (PDT)
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
Subject: [PATCH v9 1/5] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Mon,  3 Aug 2026 14:19:02 +0300
Message-Id: <20260803111906.1931384-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803111906.1931384-1-tmaimon77@gmail.com>
References: <20260803111906.1931384-1-tmaimon77@gmail.com>
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
index c781190b4..9e4fa2669 100644
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
