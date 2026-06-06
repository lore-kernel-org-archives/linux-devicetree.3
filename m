Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE0630EF82
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780721917; cv=none; b=QXM9IqrBufWWcJLV+fl0Lx6wxOsujqREGPGU22wXjxJ6kw2OVk6D1bqtih5pM596Q7L/llXdJptVsQkc5ujxozox7tfO/2XYRpCkL53mhGS67RM/LdFDousLm/Lddpbo7tEi711OYsHFG1c9LDwY9H5i7CexmfXL/VbdWuYqwrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780721917; c=relaxed/simple;
	bh=Uj/we1VRlh8Apf/xbTm9Cclx4UJKJna7Lcylt5N9akk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4/6ufigc6QI5YWm6IdiAFoaLlWJkrtE51xBZAVj2Su60IHjjilV04TUYZ84GEIH2qcnsokxgaotiMw4B16XABO/zaEpjjPt06PdYttRPwRT8rXtiFm7kV0yeBKBRB4aKbZ67IJsUKjTMIceF7ywb9CpVlLFLdZCRCIk/jTXabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/unh+1k; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/unh+1k"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bec4639953dso444689766b.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780721915; x=1781326715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRUfH60NeaMpCaCx84KeDTGgGO9ytSJVg0ZaUrTfvB4=;
        b=A/unh+1kjipGI8XGzFvTj3U7czU7f66fZb60gWItRppp86TQsnJc+ZhnwwWkEztngk
         ZXZdFKYNLTDYIFhMAFv4yK80g28YjCSYosSXktQqcM1Xbvw2X13FKQbo8kgMlLNOZBkQ
         sfBU9e/miezAaRfQ2dXRIlGPPCB/hlsxZurDJx0phhXKefFiALFQFJ8cWwCLPlV7Jx0l
         pVbxBKCYwhIvUQ80WgzxZ78SY60O6A9sHgIXpvtbK+FXiyaRiJc5K41Oqxhttp6Lajhl
         urzHYMnon6ajDNumWML8ydBCUy1XktRrDxurAkQ1FYfPQtIWEa9x71i1AhNSPFdoEIKK
         SHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780721915; x=1781326715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRUfH60NeaMpCaCx84KeDTGgGO9ytSJVg0ZaUrTfvB4=;
        b=m6Z09mwwogDRWk8rtumlhjTe6WRz34Ddw+C+H1PN1d3VeNVxDvuucYFqOBXmNwyIua
         EmPlAb7ml8Webu1yNWgfy9xOfquEkqRNkmFBXyv9Lm94DI04JpGBduQe9cYj/3p5kHsh
         nokBKRTLQu63uSAQBZHNx6ySd3jowegzsZPMC+DzbS3NeEb5TRnqI7nQq1XjddMygAfI
         wl9AHZN9WcHy9HP5KOZ41wmxPjUopg+sP6zfmSkw0azYw0YOSZe6TCNdUmo2Szw/NG4K
         JD7KMd9cinXjseiGIhOKew+CbkhXEhUeI6XwaGJSH+gmeZZgVoYfcP8qthd9jpo8DmV7
         XlLg==
X-Forwarded-Encrypted: i=1; AFNElJ9YC0YxYIp+pykknjpYozMGNDlc9hD4jX+wgTLOv9tUx5UJiRFeJ4mlqzaUyjhzWHM4WeockrB7VuFw@vger.kernel.org
X-Gm-Message-State: AOJu0YyePHLMBwxinLsmwMR22yC1ql0Yen6Z6VMfWi90mHDYpIWl4gqk
	4VSoJeZ/pbAI9H1/FsIzl23qFW2UlFfP1QI5O9X5VagZdjeeidIgdaB1
X-Gm-Gg: Acq92OE9rYBXStNlq/iz+/MKr7VGcQJiyOZcwH8png12pjadQqhr0R2uNo7Qcu3gwzX
	Wn3mNs2+j7xa5oeAuo4p/gFQM32nAqF++yNi8qjNf9VxpmiNBBglwkiIBCJbqXBN0UIZeXBeXPJ
	MDx/dgmYIOdkljCo/aaohVEiqxSrD/1v9jPyoC6TFKCEyJh09ho+erOZwixH9XSIS7fV9r/tG8j
	wTiN18Fh+nsBw++Fp86NQuW/ieZ0XMARTxcMPU+D0NfJ5ZznNFcRQwAZCWnpksTZYtC+2VLHq4Z
	YbDQCL4cBffQ7Ug0bSGxXItxL2gP+luQWTNUpGRM2tKwaVohRmCa0S+yEeF65o+OO5mOQ1jzk0K
	EgqjY9cthhLUAYgUOuic8+GEBn7/wEsz/fDyeuE8k8s3pIemCI/U4g25KIeSKgHB3V+QTIQ4w97
	prPevD7VS0Cn/9V4NrzPr9JtI=
X-Received: by 2002:a17:907:e117:b0:bed:62c1:ec with SMTP id a640c23a62f3a-bf3704783c0mr169855366b.13.1780721915036;
        Fri, 05 Jun 2026 21:58:35 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm570597166b.32.2026.06.05.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 21:58:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
Date: Sat,  6 Jun 2026 07:57:34 +0300
Message-ID: <20260606045738.21050-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260606045738.21050-1-clamor95@gmail.com>
References: <20260606045738.21050-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing coherent_dma_mask assigning triggers the following warning in
dmesg:

[    3.287872] platform lm3533-backlight.0: DMA mask not set

Since this warning might be elevated to an error in the future, set
coherent_dma_mask to zero because both the core and cells do not utilize
DMA.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 500cec3cceba..5d17da1d998b 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -489,6 +489,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.53.0

