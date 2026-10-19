Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7315625FA
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420110; cv=none; b=Bw3kQ1LmWr1HlgCrtq43l0KGrjJ3M/r7oLEtoFdF1bTbAQiW5jWGGd+pyhGSpX8Yw7b4AH1XqvCr8qL/ZC2m65zXFEpQZ2Iap0zw1d+eeN7kXej3EoRCU8DO6i+eWIPDEpuSb/alYoTRvM57ywJbta5mI061tPkIJYPF3NkPsQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420110; c=relaxed/simple;
	bh=anBcak3Ys9II84vCh2gVKyCJfNBmhw+4V0+PFeEukjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWUD1jjB5YxfkUp64YDUb2vchcO9Lu+KnBHrAURTQKxsu99D60Y6Uy5QpMcbTuMVcK8vrxm9+25yNpVL96Ee3emPakgC/XEE5v4zi6pBpTzvfHZV6EyjkPij2UbY1qCAs4dlC6DlssfAvwbxLrZ21ywDhOH4HzJvQxbNwwdb5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FevbvPPs; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FevbvPPs"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso4707789a12.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420107; x=1793024907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BcJ7RHtekvu//YyovleHaPy2Pek3quV3iA/aby3t/xk=;
        b=FevbvPPscMs209qdlZGxEMLzToIPgPCcL4dsixfI4DLqobcnqb+wkQkmrSY1D3AF2z
         siZp5ELrIurk9c2y8Jmh5PHbne3Yw18ZCKSGElEtBkUEuqmE0M38cFhJSS+ikPKrQ91r
         p288Yi8QSAFQ008a2s52zsqU1DPptxcfgSuWpnmFRjkPvEfIyaCRq9yO7MoJldbDIAT/
         L19hQZdWSR325tso4Kf+UGZ93Jh9SO22rZrbgWs2M7tlo1UrYGTiMCnJDm4DMJpdMM1t
         bfuFODTxqwlPR35FR/xvmemTT+6SPi2EmVgwxxYUgpqnyvVEtJfrUwomcAbe7XNkPHib
         AFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420107; x=1793024907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcJ7RHtekvu//YyovleHaPy2Pek3quV3iA/aby3t/xk=;
        b=FyO5dYPlaeM07K2O2FsKOwbKwaf7oFLoqlnR1p3tt6CIrkEFURYERejMiSjlQnvtrS
         Ogtb746ydA3y55B3n9akBepitj4f1gDOw/2c22STntOUqJaawz7jHZOBBsByu7Q66S0p
         lBD9AMN7SvycsnGBpMn7a3thIyBxRAFxZy9btx0aSScH89yPYIqGz9/9WqMT8yMBJVVE
         McK0R7ucqtmfxyNSIUQ0dpuW6u8phX7OWqpwoh221NXm18wQwsra6G6+Ppxzmy4ZMqzr
         22tTB2NjnMw55a27aSToQpxsxY/TGvn5cuJ26UpiCpE+gFu8Be5r/FIaQCal4uy1WBsc
         2YNA==
X-Forwarded-Encrypted: i=1; AKwUvBxDgV/8h2P14yEJWTmIVoWfsMmGFOQXUUB7IunpFzvaIBIugDhCZPM2DLvaxwLfbiYb+BJddQccF9TE@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+7+f0t4bxZhz4GcIifpW6vv2BJ4nQtMEq2Qn+A1M3+/hHU9/f
	kDmYUnjHZi+cPrScsCGCyKPIU2OIJ54BLzlSXhiKW2IaYON/JZHEyNg9ojFoy4QfR7A=
X-Gm-Gg: AYBFou21Sk+4dwJUfAiEeu14qJZJ9tnBnpLzUwtjWnEbmW6Ylt5Bw+A7ZC7w4mSZKRZ
	TxPKIcOKYTh7inLnV21HeoPhzKZ3LtIDFeSW6dZozUwMBfjvLWVO0hExxCwo3C86VakP6j0Nz2J
	5kJRSD4c8w0Mz7edFv+AUbDIOpzaCPex5CT3wqz+Rn7suxMjg6OnqDBKoO5ABdn6bDhwh+Z40A5
	O2VOxwJ89+ILHWmjoLE4IxdQZkB0hHeey+dnvnirbyfz0+gPrYfJ1vxGsEYSV4ATAhPmMxPSQ2w
	irQaN3Urs0LGJeCVJBpLtSpbUsGvRevv8nItLIiFKABOd1pzE2hMHkiwMFqUAy9NN0Ol+WdPH11
	yLVR2PewzFGTM53F5XcoBRBZTWDbp8pPKkYa+p4ctyU6DtDjvNWQ8hoOWRjsYy9OaOrVw1MB4Fy
	YYkpWKvnI8HLwpjtYKkguAthR6VnmnpcJyOqgXZvc+q+4eCWIHGycmzmUK4ZpAApFN6xZjmbuZs
	d1cE/i7eUyGoj0TSABeBdwJgoQ6J+7WkQ6lhgd+hPuSaVIzYg==
X-Received: by 2002:a17:907:c299:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c401e03b0bemr808167666b.3.1792420105499;
        Mon, 19 Oct 2026 07:28:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:10 +0100
Subject: [PATCH v5 03/16] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-3-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
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

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index e5c56a1d09df..981ce722bf8f 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -922,9 +922,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1

