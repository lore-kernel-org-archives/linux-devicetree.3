Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527456E06B
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000486; cv=none; b=GBtrTMmk3SXmLmKZL8GcxVU6eit/A27wpyLj6xTToC5qrNf9ciu9N0mE1RUV3b7qhjey5MZjoXBfGUlF+anfTnWXaKudI50ZZpWF0xnVJc8jFw6L0ke6FymEhl39mYO4MQz0EHg3jalyvxWCHrbWDFT1kY1xhUmapsP2tOGO3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000486; c=relaxed/simple;
	bh=4roB2H7cNDjO/LXIqC2XOjpQcaxJKWSUGDnr1sFA2T8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GohmgRvUIucRewNmXH/MiOqNLmRlUYMik32q6nfguqruomhz3HeBDhAXsxXWZ/PXS09g3Wz18DuRtRzMMPn7wS+xhBPZJ2WZewAHZUL50rJjcHCPMpIIXaYEQqc3ryS9MLBiR+elgjbjDD1ymRZCJf8WU53/29wRb2t5yyyz+C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=a9hZsP7q; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="a9hZsP7q"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c411d6615so3236884f8f.3
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000481; x=1792605281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0UtlNA1xvJFzZ9phCn25F8LpQNd1vSbWT52wzAm7fk4=;
        b=a9hZsP7qNmIUcrmS+BBsguzA8057FWNUWbhMJemzfvlAPZ6W6cPpyJGIQv18PSfD07
         ewW4MSxZLZjEDTE6CUzdcevQOqwRBltFimd7JyX/AWaFqKpuyw8Nx3NZgq0HR25AdYs7
         HC1imF+WQ/4esfKM1YLen5q9uaPkKCZoGTxJb7aDj+dOYbLOTQ1wDKlRH/MRkVEuywUa
         a6B/6A1sqgcBk+DC7moWlY0lumMDoEeNuei0LqvYJmCud7z0RcFY3fgAgi26N4gPVokZ
         i9ZZkbC137YrGBW8ocQLqp1tGA0iiWNpkowHhA1w2arLhwIftwgpepKIbuLQPsymJbjf
         IBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000481; x=1792605281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0UtlNA1xvJFzZ9phCn25F8LpQNd1vSbWT52wzAm7fk4=;
        b=DFB1pXA/CauQMV3pKne4liHXEbQtjjk9Hh04vTtQnYeqP5GV9BpG6WkccPAcrEgB0w
         kSlwFyaizCLY37vpwKlMdD8BRiO0zVnLri+U9P58KW0xZaQvdb8EY6oO6m+iusoYzS+5
         hmkoBN+xy+EyYdz0PCw/2++8I7d0qPl8d5kPmy1S0tmUlY75Ul0Gqj1HrGGCODlKH1+S
         JY1TzfZFOqWvcGAUUFGp6tlbWiG1qaHaKwi49B25Hvdj/qdM1J90ZlNXCoVdq+YlZp6A
         1YJaMPMrlviJjOnMOPPIUGu3W7U7yQHgVL/RBWKT5vh/ufFTHBe/QGvDBhZciHOlUHsO
         MtJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSM78jt6985B/4z3IpsZ8nrlL7yZwcapyhh+hRLhTdloP6ygzDs+vrmplGPCQt8+zdkHq7argZ8cU+@vger.kernel.org
X-Gm-Message-State: AFq9FYIZOtPqTcsKAvyueaVarwpK24J6pgfAd5sj7rtlVkrxb7QtDOP5
	gRS/xMCcq97bWZdujvkDua9AYsp7NyRs8QQdSBpyZSQFG8k97qYycTI6UyH8chs08pU=
X-Gm-Gg: AYBFou10OTgaEtG+LkgG55QwPeF5Rqp3Cyor4JjfKmhyuy9TTtRFFgz4gtzkCTCOFvR
	bqeu9cZ2SLo5cUN2kCX87T+rrD5W1icCiDcFxIp64s0Qs+Pd93I2SYf5D/938l8bzWxkbXAZLkF
	bgAFT1YkYIQ65m8LUf8uGb8OwWQKohLJuAkEHNehCQsFKab5Sidx/kPOpD6WTolaw8bHBmdj98q
	Zv7WaFI5izke0JR+Ofm9A/nv2C+UTBKg90bTBWKl09um3To81u/9vpUMBJy8ZjHnV+77P+b2Dw5
	yaamR1NStjpUuqzNnzYA+nw+T17umWtFOhVDXzK0OtXY55uuWiSSedJkyzcpj7TN1KM9iCV7iKd
	oWLI04ASjeCvqtCGTt670qYuLKc+uHrA07dmfEzJvyOOgmxH4zn2YUe3L/v+tugXG+tnTUJpH2t
	1PS4KQGGSsaYVSeHqdrXyNlA+ujiTxs5YIr45/YLCLHLLu/W2kOU92ttLJ4K9SA+rhr5tOQa0sR
	viYJfyHCiI7VU2n44LQU+TBy7iPqOxYRhCGAwJ1NtP7k5jEjg==
X-Received: by 2002:a05:600c:1909:b0:4a0:159b:d283 with SMTP id 5b1f17b1804b1-4a18e4d5412mr370442525e9.30.1792000481482;
        Wed, 14 Oct 2026 10:54:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:33 +0100
Subject: [PATCH v3 12/14] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-12-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b6c08729bc3c..86f740e10402 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1458,7 +1459,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

