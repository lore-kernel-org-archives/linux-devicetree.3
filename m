Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131814;
	b=L20uOvmMkWNxGjvmV7bTULZYtrPT1aJ1u6ZuSWtGPu1Wk+FtihZsK0yKoVhxAWZhdDtg
	 BJmiMCE9sLOot3WMogWc5woDle8U/FsQDxycSexNhMFvwwIq5r7jussn6niHLldmI5HLC
	 bpVRB1Ix1SpzouY3TM5uDDlTCD979pIouuAIxVP/8qz94MfPLEwAl5uUJ/+ih+aU6iHcs
	 LkY/13ogye0pyOHWDREQQ4+jYfH3Wxi4pb50mDmPrJv3+RwH1QYIdDqoMZyrwkZ4BkzS5
	 cgqZBWiRm+fdXB/x6OohOz9XpZAQ1Wigw2FXzXtfHVN+ieOBgmS5WQYq6kgZ7XLq4OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
	b=Aafkoz8FTy4e3Hf6fLVoV2OLcGqvAjLdENevwtcZ5pB8fAsY3q+hzT8Vqv08VY2OXPcn
	 W+8JMfOnkatTCaa+O48AY1s2h+PzV6zRAilBaVouSIuxN1hGKPJhE0TU1rkx2hlJeb2xD
	 e2ZhM/GcoB2aoY5ousKQ6GsLix2KQp9/pRTVuV6I8EJ6Y68xbaIVtrDBaEw5xxUrCn0I9
	 UMK4Az9r3aCAT+Ym6T4eSbigOeBq5TUtmnLcZY39/jtW/S8pDk6nDGqpDirLyqX+0VOBI
	 MIZfW3c8WY8aeKk7C3ihOLsCRpfxuajHKqiYOhiIdqFA4ezcuhMAYuvpghPTaD4mzVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYkyBMq+;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C9F606D81D
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C9F606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYkyBMq+
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c247f6687dcso2135566b.2
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131812; x=1794736612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=GYkyBMq+6hTJRlLurayvRtFWq7BfTfJF1QfRO3MxS2NamxdMZ/inCuUjbY2WId5SFi
         xJk8YxMKzUk/2a6NpGDpAOB1lJ3cWsZNtXkDiLN2ciBgFXZxUlGcfBwIdjyX0xuJRbE9
         tDqTxXp0xJ1kOb2LT51BtjB4fQKs7QiAXIzAAYHLzIbIxLV6w2EPAaeyecmNXUQ+7ajM
         xaOb0h8qy6OKl4hVp1A2z2zFjrjoXtO6R3Z7l0MPC7K1uTAWSnnaPHM5isVd4wRU4ABq
         ZSwQBY4/NxAWtGVF/a3mt569V8rXGz3kOqkRmhlnW4HK8pLKNpUEn6NxrJACfHGddNlU
         BXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131812; x=1794736612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ugACOXCHmbMQ59e6XOW7QryfqNYQQNBqkuOYV89Woug=;
        b=kqm+KudNLoZ2k3yFSt7RZ3y6cq3W+dgMrcxD5Br46+jmz+k79JLoJow4fzyCX6xNUV
         Fznp7hDhW/YcOPyNLEudF9u891HUDB9oOL1n2jtx1QPTfgAcFMuGr0VwAPw+B4cJntof
         KbXIB7kBJ8WRoZQuDaOT/zGl59YLYia1rgnMMoZ6azAG6S4vPrWFqPqy6+qYs3RSusRT
         mIIhtN1V33doQoH4MYq4YDNOeZ1lJlI0AzjFNcBwX4C1HEOVKNCmAl4Y8rF8F7J/JBBu
         bEaTc7p2tW87zW5U1LdEPHD/2bFkWdDXxwrknT2mXiHKpcKa0SRdI87seaMGPEIvqkY1
         J0sA==
X-Forwarded-Encrypted: i=1; AKwUvBwXZAJ4Rqja32AZo2Tk8iKODM1ZUNtUFqt2cxqWz/ivH8d3u82TJ3+3xKm39a0tMhIzcsWVFFbMrjZS@vger.kernel.org
X-Gm-Message-State: APuU4Z/IeY5jScSm4P2VEj9LRw7c0AfLuZAfQwAJtQKYukB1Z9+17lmE
	HKt7/0DQG8dXbLqf9Ft2rZAm4Ygzn4ExvhrIWM6NPjpjvjNt61/d8j4w
X-Gm-Gg: AYBFou0SCxsAPypE86d8hIe+sFCl8LluWxBJb9hQu6pfQoexsORZStrtQr7h2Tliqoz
	bRdN5I8xO1UqfdfVkNyplXVTu87kXqWIj5YxyEGN9p4yGm9M3WNN8lcLlMKUED/NS9MottvJWFL
	KMr3EZ9EIv34Yn0cKSvE+pjthdLTXlXPL52wrbtBEmWQxDM5vnmE4CcjlxMiq80ktri62wkx9Tq
	/dlLrBvLQehE3FNBHJhdmPkT26x1WnFqvvnNsf0Fe01tyv9XqQ4O6MwLg2C0d1/LMDUWFVzqGYd
	GJnLVpCjPO0gYAA5+sP9zH7vgU7TxI6NW9HuNue+tdF4iUTSKZLd1pQzh8FeDBv5ptEJLMD6FGn
	ocZ2Zrzzd/33Fb8HCsSARIzVh+J1jzMnKu7bH+La67/NL7T5D9Fq7xy89xaYtAIMl9Tr3A/joB7
	x4OJ03dwqHNTq0hyeLw3gwCk7EDTibVJlv3zA2YnIjM8+tN7c6vs+MxpauZLNtZtxedrtNTSXW7
	auIUJnkb+Tzlj2AzfMjxSKS9dyBOg3gj++RIHMGJR6Z4B71GH/UWVmLZTuJDmK6hXjQe2FfqvEv
	F6X+PA1BiF1Naf7MwkHT5WgimIvUNoRqwavCP72PoWhtFDaeiJPUCAEZ/U5hPAsg55XjxZJN6TE
	7LQTUke2JmA==
X-Received: by 2002:a17:907:2d0e:b0:c29:d31f:7d6a with SMTP id a640c23a62f3a-c4d6d7d7a0amr75803866b.35.1794131812255;
        Sun, 08 Nov 2026 01:56:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a9bc2e2sm48920866b.83.2026.11.08.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:56:51 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v1 4/4] mfd: max8907: Add ADC cell
Date: Sun,  8 Nov 2026 11:56:34 +0200
Message-ID: <20261108095634.100517-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108095634.100517-1-clamor95@gmail.com>
References: <20261108095634.100517-1-clamor95@gmail.com>
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

Add the ADC cell name to the list of MAX8907 cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 86579729111ee..f6b584b002e02 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -20,6 +20,7 @@
 #include <linux/slab.h>
 
 static const struct mfd_cell max8907_cells[] = {
+	{ .name = "max8907-adc", },
 	{ .name = "max8907-leds", },
 	{ .name = "max8907-regulator", },
 	{ .name = "max8907-rtc", },
-- 
2.53.0

