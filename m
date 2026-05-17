Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5757C30DED1
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779003824; cv=none; b=YDVOisgMmwHoRv+XzEYDWPdcRehdLNkST6sY59MvaIZFzR5d+wXSM1JzkAEArTVEFGNaPPwOSTAjID1i3yA5xIrtj/ehLXGZNex5bQClsQyS7iWON3qQ43JmMxVsL/dlRHFfZ8coM+6AO2xRuEzB/x8DuVhGZscycyC/CeyiRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779003824; c=relaxed/simple;
	bh=SomMXQMUuqQ9puJg/elt7woziBoLt88xB52B85k+sEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rPAGr0DewMjuhER0RVH3Gplnoypg+252JxNevLBpOTgOL0GySnRVm/ByRC9vHv2VmUmdwXfRWvhjsH3uDLGaOnbpbz1bEl97rdDqQ44x88FfYZ+x5VwpYZV3oVHFMfQRPWki9WxCF5rlIFZ0Q8DiEd/jXUoM06F4KYyArOIfq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UoDyHsT4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UoDyHsT4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-448528f4e69so616066f8f.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 00:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779003818; x=1779608618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKwCpCIE3pQrKMIlzgxzd9zVO2yq7zSfHES0U3paVng=;
        b=UoDyHsT4a7UV/Gb0gAlXcvRfHdo7Ew1to8uN5nhoK3wkNKvSpuXcN8ybuPKGgXJ5Gq
         F5FygrKjTfVoDpq0gMCEVUmzZLn0myik+tK05B1huvBePkSSaObfbuATBKElDZrJaCuV
         NzwPrDcB69NMYJ1VWPT457YAtcvRlfgRwhdzwcw1Nuq/DpcA2P526bSHLcfrwwaNhUgt
         QykMeA1sE9/zo/OeBe85N4uHmvc3evI0S/biiXAiQGSgsb7YVEnsILf3K+garNYvX1MY
         jw2tJgVpZQYHmrnNrRhADBjE7Kj9EsakvKDWiH/HDzf6Zymy4fT91NbNn2VEUVN3p8j0
         5zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779003818; x=1779608618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PKwCpCIE3pQrKMIlzgxzd9zVO2yq7zSfHES0U3paVng=;
        b=f1ZG2oWO9Z6AaW/3FSEynpDnjlKYzzgg2oyH4KpTAKscEIHYNQd/9mk8MFFbb3z8lE
         /Wh9fLga0C/TuYVbfJdqOjT0K0k3uq1tjpNpuyRcJIf8EDJrekkcHC+PlF9Sx+eCYxq+
         xVDkvw1VetV7va+rQmVyx70oI2sS0aeg07oyovgQO8vw/QHGmDS6OrKNgMxyrlL6BOOb
         gn1cF77wXTP41Be5Rq3vIUo8xugk4TASztwcw4KBynJFgjKHQzcTxlHcZ+w2EG3xEH2x
         DGOBbvVTc4XlMHY6nzwKGBwJQ70HaBZX/O6tqmwrL5C6pV4jLQTCNBX1ooWAS2MsMxSY
         +xrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+GS0pVXcQozQfuu3eSnVleRS9uA/QEapHmGYNHAnZdyVuJozlawIFFJh2+t4A83aE6Z8ec/yFVpIVr@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7b7uG0Ap8VSei5kj/M6jAMvLvqNc72g56nM4q3P6dT5aS5jA
	0MauLhh3qxfQRmwhfquSW8x5mh5c63HS3KtPsOBZ4587jzqH45oAzDUi
X-Gm-Gg: Acq92OGniVXIzAwHF8XLhUMHikF2nh2LrWdnIwOh3KI8wUMNCTpDp8DdreOrZD/tM9q
	dq01JZHZqLxxPc6q5KInam8wUkUa+nc02KRFbDS0Wn4JkIR543N/LqVfz5/mK0fZnvudt2JXT3W
	qLIrO9gEYxG7u5B7XnunqwC/EcVgRiLxK+Z2adBlirarpUUIj8u2vA5jcQ4GZR23qPurVK4uNSF
	wkcD4ghXCd+zIaBCLlBYb32uAqyVfLKA8CGNVwInoq9EwWQS4DuHDRKyNALhs4IVYBaarwRqfTi
	tJIKZX7pF3OD7frg5RghewlY6m1BhsJhduFyslXkSHGio/TGq208Qcx80XXqA4atDAyxxcfUoPq
	234RETD7Ge5tYfU+khTnsYJp0F+tj16EUF/OoHhGa2TnHJKzfdt6uXDLXa/Rt7OPjhpYHP9zZNe
	9DzeZeBdbukSlc
X-Received: by 2002:a05:6000:2508:b0:454:9655:43af with SMTP id ffacd0b85a97d-45e5c30d598mr14636187f8f.0.1779003817436;
        Sun, 17 May 2026 00:43:37 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm27512864f8f.30.2026.05.17.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 00:43:36 -0700 (PDT)
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
Cc: dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v1 4/6] mfd: lm3533: set DMA mask
Date: Sun, 17 May 2026 10:43:04 +0300
Message-ID: <20260517074306.30937-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260517074306.30937-1-clamor95@gmail.com>
References: <20260517074306.30937-1-clamor95@gmail.com>
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
index 131eb1a1c8eb..c7914afd564c 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -499,6 +499,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 			lm3533->have_leds = true;
 	}
 
+	/* Parent I2C controller uses DMA, LM3533 and child devices do not */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.51.0

