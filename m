Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E34195D2
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000476; cv=none; b=bevuclgNL/FnnodnX/4k3DhPgPVeR78mEcf6b2VFfDABhlg2ONkBMFWfMGq6sm4dYn+9mHaQJWc+Y1ooPouKL1PDvGmSlj4ZmZ8Q482VZpOgCCszRkAfrdQpo7V8r67hB4cVFdFgLXqns7LxaHoVhsTmP66A1Cr1nAY9U5jEpT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000476; c=relaxed/simple;
	bh=AbDp74FboY/m54pfNSPGHJTdkLesKVKCn+j165dfG4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pXqfRrALpxH05nv2zmmEokm7InINyfu4OnkVVNN6OJYc1D1FDdroBLChIcdi5RKO9aUevY0gG5ZkF8zrq+ufNTKcdVhtDiFbs+1dsi1M/lph7Ok968u81J0zToiQPCBiN+tgRZ4vyL2WBllpEIBK04oyE2lEvKsye+WxxIWjfrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=X9yccBPK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="X9yccBPK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so3089445f8f.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000471; x=1792605271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=X9yccBPK4Hx/qSdHwKnbDwE4FkNjyrO6MK1PGgaGdGIRtqteftLkVz359TKOMb7Zzx
         0mMhnm4r4sED+LTRyj/j5oBNY41LErXnTqxzMAsoCcn7CccI8MoSFcQf8pKo4eLyy/N7
         7myCCN4GzfdXIZt7wY2kY8WKVo0X9pedeCLaVdcJkg2I2qxRhJ3zKJlGHWjRBKqj8BLC
         YlsnfC4+NqXb1JFpPytdo+tRR8CqIxlFMevrmzCuVGwXvtOTVYLAxJ+WpWzKo93gQzFF
         n/Ot4zQpcT8/KMfa7sLLKj+trW43SDKJ+OiHXEa/oASIWKXJA+34ywLMJnHgbnQQij6e
         Z38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000471; x=1792605271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFRbQJjUmlnKmha/sV3VtEHUk/rjFLEESBDTOweph9M=;
        b=RL6woI4mG0ZrjIaoP7C5PVHX8axr1p6d4zXQBatQnkWQimFshScELn7LImkHldjGhA
         WUb6+mxDEmRkLlR+hHvNRNkATCu/QNa35LtOsNjYvJskEjouv+SjhqOohojgPJpMvPjM
         TJX0Di1U0xqYSsDJbyO+0QnBVpeULBreulqeV1MR2XwdkLRxKT/Obgk4YMM8cxs328oh
         Z9eIJmYwMVid7GEiHIIIGEGb1w21BMKJRD4Rk076cXJ1BO7jIHnKgJ9cRAjIk+StCB+e
         8Ko+xSz1D/BV4VJEmYYFqmj8R8AHfZFR0htzD2JfZvqV3Ar2yCm3XA8jtZVYZ6OQ3Dxq
         ZkOg==
X-Forwarded-Encrypted: i=1; AKwUvBzGzd6qIwRRIr1UAQRkys3X27857oKWhGXEX8g89ITEFFmxRd3lTvBIiMe8Augk0b+8pXHTby9kfF1t@vger.kernel.org
X-Gm-Message-State: AFq9FYI9s8E1NfGs617L7hmTXOdNHGDakSnAd0Awuig/CbIJmZeeTQgo
	lG9Yyw7SQjOMHBgVH8KmGzNDle1AP3+Inz2uDrleszrBHY7eRTkwdjKVsvmwjoeDQ0A=
X-Gm-Gg: AYBFou1ZjsAPGmAtghs88mOK/6cVtfDfrK8lXmlRUCp2zMQIU4LNiu4rtYq5z3FASlw
	aWsJNis8umZaBMG2OOoFHw9kElxO8S97FT/Ioj3KpOR+7m/bRA49Y1RF+7Z3X0RvxlS+Uy7oecM
	FS9iRKsaD0kofGAI6w1ILRe2uvJk3QVh9BV3b7gt/cxx/3lHZBgqJK6nYkel4R2Y8jl9TtiRliK
	UU//P8gV1SDU6L/oMDO172oXXAoFpfqGUDXtKRpGG58TkefynIHZY/wzJe9yrHzxyYxNHHe6MnP
	mY9Ewgg+hKEh8I3w/s0vh912+N1qzvVAE+iF6xVnS8Tdq5XWdsU4Ynxx1JqH6lSnxe+Jw2gvFmW
	Ls9VAb34gav9jpQEeaUmZ5wlZvW7Thep234r0OJTi7u0OqhM3DS4ENqJdUnc8uS1e2wdUK/a8RJ
	DEcsRKLanZgHxBGOlgrVQKE5Sf3rMKtKp1HBBWU2DQ/K3hq8u6KVn0/SpbXohIW6NyS1yTypeyI
	dLIxgC+mkvuCDtatISi855+bgn3UpSenM7yZwANv0qnZyWwHw==
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr334100795e9.24.1792000470895;
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:24 +0100
Subject: [PATCH v3 03/14] media: sony-starvis2: Always program the sensor
 in window mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-3-c958362b5d06@raspberrypi.com>
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
index 3656658e18a4..c4f590c489d9 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -921,9 +921,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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

