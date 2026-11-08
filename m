Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150859;
	b=golT3qUKCJtSn3GmyxMcJxlz2URH6YeiPfhulZehxXHV2/85doRyEwiJJccrU++s4XAu
	 FSa8SOmGpxdg3Z/tmJ1ptUArSC3CfUHG8nt3j2yY1d/2HNZokwsdXKaUstsbWpLrrRhMq
	 /eI9hRGNPt8JkDbQykAg02j08o6hLIAL0uton9235tja3KQNlLp/YVqzaQriTpMBt4CZd
	 mSNn5lbT3T/n39IYJOJe0xnIv6SIAiV+3YWPpC/KjV+G+MhJhCVqDTov6KmkQD2osIkpb
	 yDARaVu31zS2n4Uu/hzWvO+u8cxXWwCuZx7eoye865tfLy2KW8IPPufYDCZeTRmUcYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
	b=uQGf60v6brAOtaAMoKwIZ3EyPzXu3JrxXrNoyTM8u/RXksRCmvZ85rB9UlINcKuQBD+s
	 G1cS41F9NWelIo00DpATApx44sL2/Vn6R7Chw8mnj2IrPK8zvJt++9MBocblglbqxkfIk
	 U4krZlGopx1/9Gk1H+dRd4hLq5aIXrmsODMfYah3R0ATkqwBVG2FwzAF7OVg/d4R93a7/
	 5EsJOKo1AQc0MjGpMrjdW3PkRfdsQ8NCJEmsmQ/jdC6O4gj2RCoeGjbHfE/erPWsp4UdA
	 vRsCglqhcedycvj+kSGxVBxwnWPZ2VYv6dU08+m6KAILgw+DD5VGB9r5HIcklYvbGNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36573606D804
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36573606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SLjObtj7
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d28f75d62so17734366b.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150857; x=1794755657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=SLjObtj7/Fp3dgIFTi3UjH0YGrY2bxl4pTuH0ES0JMPioOhMehJAuxU6KqPLJjweYp
         6WTM/vrriAK4E2fiF3ofkeCOhGiN6VajHpw1aZ/5U8BsUEwmpPHqShyIIr4vHTF2olfc
         yN/LnftO/mctJttSbJRTqz1SnKaOGxdM7keXwkr2U1DhPZi6YeW/YfQQ3Sj+TnMzJ8Uu
         bgWu9G/IgcCTyg9lywM3vGYSZwVEDnDgZm1VayIYgfIkRhsLWkFF1LNkj8emLNA62KJh
         uzQaqif5d2aCHX3UFv/nVlIQSENYKqP1ozoEhNfhq73+Tz+C4Nlu46EQqfCptzX4uQ/J
         BAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150857; x=1794755657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+v214Dro7nadIKB3P9+8aKqFMugLXZGhMQ9khVmC52A=;
        b=EosXY3UTGCpEiwQ0vJ9GW4NqVk7Yggy1wGJVM9RzuxjcdD2zlEgcSGcSAHs+lydvy9
         Rb3YQAgiltaohaWidxiCzmIx1h6qrxvnIosAohT3TGQnF8NhF0nmt7cvDV8nf7VTMDPB
         MZjD+BYUBCGg00zPxUdK6ZNe41qfyJMqCvpnGUi8fK6teo9c1ZY0+E6+jRoPCOAdhc+0
         +3T8kYBN1eIER1WwV5AqBx7eDFQQ93So4E6Leg9o+dUpDqSzDF/9OXf+akK7g+IDOqrC
         Dn9m1VeZQNoa4yPJ1tAiQFasDWQJGuzEHEMFCVeOjC/hlr706zgIftDe4XIMqRqfEwJ8
         1maQ==
X-Forwarded-Encrypted: i=1; AL+hErHCtE9X75vBmAy84Z16bzGyncKI4NsHMEBYLtvwh+gBo+4rluY93ptB8V6DFEQp3qo5GRuU3PQLUF1E@vger.kernel.org
X-Gm-Message-State: APuU4Z8mJrx9rRBKjCI1+LZJ8GF7rGoMTWoafH4P7uG7edM3JHX2JLPz
	l8UmULyRwfhzi1Enp92IxxCuzo+O0vbY2HTE9ZQbJ65ExQPBVddRFF2Z
X-Gm-Gg: AYBFou2doML85Cy0CkK+aWCuzTfm4gNW6Ew57yirDW1Ch6jmeO5hjUrpfjJHqSQVQAc
	9c5O/2+kVL9puHSMUbICqSkLh36ndtDyZtGLXMix3SItJ8YnULQpBfbxZgk9adeaLvnjCbZXGx8
	Q4kD4AlZe8xxzZl64xC2ka8Kz60dXOeeSD8A1u1LW2467UZJjhvMqa5r7S8nTFAdD1qQBumm7FF
	7zo198Byij0VMFouxTC3YqS7rskpIKHh5NU4Vu1fw4BaN1IFZSAOt/8jjtb2zj9bmnyTZ9forHz
	+tNFfYo5P6HUMyw43kBb8mNq3eX5ISUnvBID/gjAlADR2p+jsH0nfzK1KXANm2qlK0zdSTE27f3
	ohfiu++pPIw5cakpYk+A6BwP24xUsQ+FxoIovHCyktxW7Nj3HBmJ5xzZb6VHZX4GZDbt5kO9Fuw
	zrIkRB1ID5nyjT+7ZmghHV0Rukyr6o27JYTWDkc6FyOJolv/OK+0isbnnHY1tg6od3fS/NDDP0M
	PpV0iusLFr9NBWu2d5XgyWLjfzGdW5QlJXbih0rapp0Fk7VmMUBHYPQxpK0u46jzZPV6JRAgSfP
	TFA5DNcJeiOwRiX1zfuZCRhAZLpxafPy+ZCOkfX543N3D1vOraB4kh3nq0CKUlW+A0GMDMQCT2x
	Tv1xiNm33Xw==
X-Received: by 2002:a17:906:7308:b0:c49:9632:9280 with SMTP id a640c23a62f3a-c4d6d8d6fbbmr119323666b.46.1794150857516;
        Sun, 08 Nov 2026 07:14:17 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 3/3] mfd: max8907: Add LED cell
Date: Sun,  8 Nov 2026 17:13:48 +0200
Message-ID: <20261108151348.204182-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
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

Add the LED cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index e282dd82ece69..826d7768fd8d0 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
 };
-- 
2.53.0

