Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173323;
	b=J6Hff3CrW/bh4ed6P6+evY97/Y3ptbBBRksCP4+Z5C1zssm1jyVubLXQZ2ZCVms9X8K/
	 nEbdoQsRLafwSuwgRuVO8U0C/VasFuLL9n+A5ARrZMX5EFFD/gUCjR4aAPrUkyIrsiJNo
	 aDbK2clWq+2iLZmcyPCXwa8B3LV0EkRdDWQq67PabQHvzooJS8oOdWc0dANvTNVrSHmCp
	 ioW+lkjfnpRr8Mqa079GgGWZDJbiXMtdDwzcuDMMHb98q6v7JE6eg4C7BHzPcCGwrIMW5
	 VSkMfFMgx7Ppqed2JaaIaztflpmTGYdk30w7y3/9i+o9nktI3Zl3nvnNH5h2tjCbCVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
	b=rL2bb5FGh291fEDsoHxcd7M95rWTlgh05f+jQ49CC45fnDprmQWnZ3GE6PyPoyUwLMei
	 zXabrgaLkOVAIR0PEQ0cj1UzZ2YNp0FY+y59Yvwbjf9Wd/6MjiZFDvMI+8cJxTlYIBvvp
	 Er+I7NirZqYivpiQum954DxjfT8v9dCQQ4JtufR14E5RlGAiZSuEakoGn3iZjGA2y2odk
	 YcUEOLQmhdEgvBiiudmLyErF+B4FN4lBFNhn7BtgdUM/wGACmRXEqt77N0EIDzEeZ4fuY
	 4XHWstqk3/rmgW3ZDFv6iuk+ZtSkGHwjIJvDdWe9TP1YoGymW1UFIcpl6LFwZ2/9lmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2sdlhZW;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F10606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F10606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b2sdlhZW
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490d59c3edaso180964f8f.1
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173321; x=1794778121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=b2sdlhZW8w85oBCsA3i2XSm11Bp7EQX90FfsBM2fFcwD/1m/F3LOE4zVmSG76SJZ39
         BmtZEkdbfgCWZsHGnHUxMGdY9/CY5sluFkQ0lhvas64nB+a5v6+ynPgQFgTdD5MDylUF
         UhMK0m60tdLxo/3eUlYr73b7B8XQnZBPN+9//fnvSVVD+TbMCw1NsG1jyRp1WK4lclKN
         eLQnssbdjUDdKSP5TNp9ZMmlfCdpqDlzYfEfWA6wZqDqs66fZ5jLSqHO8OXynN1t4WLJ
         MQdsYfZka0ayuKbjOLMj6//jra0iW42njmxppjWDFlVQlXjqG4BIfOcW3vjzf7zIpopB
         SdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173321; x=1794778121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3eWGx2zpAT4OXgx07lg3AYpdKyWukUrsNNsX1hEEVzo=;
        b=bQlgw8pKx1T9ecwUIiNpOC5V+VRgmC38OcRGKw4wISy15nKZ9kcR45y8R+lmmvcHai
         pORpMFKYCI+dK8RRebuUahyhvRiPqL6CIEIkV0Aij8dtaLDUuFf3FYUztKjB/nenK+VC
         9kliV6Vd5v8PafHUAE2z8XNzwUfRdntPCwsVVhvY1gTmF/z5al6pxH0AzwkTbe+d3Gah
         2tn1SHbahykNNu4W0HOSXDtjOnYeWUecUgBQuZGCgNspHvlvcmOcI4SSI0yvUzfvcICk
         hEZqJfUlGUpGewK6PRnZiCx72WHpHNFpaiqexDWXCWAKt+3cc473SAnU26DVgYISuMUq
         QbCw==
X-Forwarded-Encrypted: i=1; AL+hErEiC9yX0oCwsTA+a90crQVFOqWU8H8Fyw/iCwYcK9liMFZ+uI4M+FOEM6V63b5axKze2vaGY3AvgL7h@vger.kernel.org
X-Gm-Message-State: APuU4Z+p9684ESWXHwuMRAl9Nr4I0VPJluOsiMrJoJhThz4C7b6PW1el
	UIonyKDA4D2z+tybgOsE5lMuS7qrSpfOZu40jRPpauh7u09ck2KkdrXE
X-Gm-Gg: AYBFou2wWf+Z0GbAW1MZLVfqK+2Sb3MGIlFnJS67pC3Hr4EKFTICBNWpzzQH5LJbjSX
	fMJ8O9c/iG7rtJNAQ+JEbhK6k6bPxfpKJu3RdUd5Gm36K66AIHCK9DIpnYOr5leNNEBCjoHKYjR
	czSMflNj/RC51x7stHX3ltrIu7tyCcsblAZ3Auv0WYWmXhROf/sxhdhFaMQB9+oRgrH74w+rYCd
	hT/bYgPnA5m6cbKNVIlFQoCMUN2o0neIs0iLMnCclYjNRz00drYAawHEqB9go+5RhpK4qDiKWyg
	sTcSJuvJ8cxBWs9vEQhQv1ZygW00/wS2TMVfgXejFsdiWDYhgKSyAvEjDzr89Vz4hVXqtWsdZ+6
	KGtv/Dl471g12AtgfQvcaX9TdUnFxnVEQqFc79LnFQafdJPxJ+0vimWL0G5OXTN/NqYSWGx7Y/n
	nu1OXspLOH8qszOquu/Kdz6CKBLsOtUEYEvE+O8GEf+XIEfIjYN6/YONFg07LxvDO/FyBEl+S4n
	nGYD3LnRBLz/LWHhg3ItsuwWTNokICLmke+cCTeiBW7TlMEb0gWIsSYY6BkNtBGSoJwIBY6x+y8
	k5/8q3fW3n0XH6H4kMSqbWuMceHcRDowsA==
X-Received: by 2002:a05:6000:4808:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49589c3e6damr4580107f8f.11.1794173320934;
        Sun, 08 Nov 2026 13:28:40 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:39 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 4/4] riscv: dts: starfive: jh7110: Add the RTC node
Date: Sun,  8 Nov 2026 21:28:26 +0000
Message-ID: <20261108212826.15890-5-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

Tested on a VisionFive 2 v1.3B.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 82ea63f71..14f92b942 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1206,6 +1206,20 @@ pwrc: power-controller@17030000 {
 			#power-domain-cells = <1>;
 		};
 
+		rtc: rtc@17040000 {
+			compatible = "starfive,jh7110-rtc";
+			reg = <0x0 0x17040000 0x0 0x10000>;
+			interrupts = <10>, <11>, <12>;
+			interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+			clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+				 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+				 <&aoncrg JH7110_AONCLK_RTC_32K>;
+			clock-names = "apb", "cal", "32k";
+			resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+				 <&aoncrg JH7110_AONRST_RTC_APB>,
+				 <&aoncrg JH7110_AONRST_RTC_CAL>;
+		};
+
 		csi2rx: csi@19800000 {
 			compatible = "starfive,jh7110-csi2rx", "cdns,csi2rx";
 			reg = <0x0 0x19800000 0x0 0x10000>;
-- 
2.43.0

