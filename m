Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793B47B43A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522174; cv=none; b=WNG+lIv/6/wYcQ5rZEweCCYMxNzRZt9i7Zl3xWcTTlP39iMoZIVG4HXLkWsx32U+hNrdr9FfMtjZmD1OCffozo74DZXEYieRAmlJQclWXiNBx3+fz/lE4+ujW39koEvySbil7VQr+ih8bbRNWrKlv2vwbkO19DsxjE7mlKOuaHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522174; c=relaxed/simple;
	bh=/BY0FHV2ekurjGQiSyljfjnh/9DiTeGY5gSJ9RVi5Zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRgISh9j4/OwOh4EJ5bsbY81YVLpC1z6GUCe3eb1xTEcjtiSkJoFl7kg6NwtC/+NZj8hVeNtbiqq+UIYb6SW+GoPbMOwLZK6Zhmi9CxEGC1U/31CNi+2FGWai5gbSVddN5Nr88GoEvyKsq1MkBLDc1cj6/EaIiHuqmPyJRCZVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YkGmpBhN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YkGmpBhN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c19bad03so7511555e9.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522162; x=1784126962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RoCc9OCGhP/RSTGfuXTy0/7DUKmkFEmhCqI4hwhY0I8=;
        b=YkGmpBhN6IJeythTPL5aH3mvCVX920WvMz+wAig3kDJO1SePBZsjgeo44saR6gWdPX
         zgBOVYUkBoPH03FjRx5hbTy+w7fAc8QtNSrtSYq2/HHVDnaByENOFUf3fEoEETdFV+a1
         d+5y53qZD0PZjBVkpvFO9YIQjIVWPb/x+RcvefjUsIkzURPytNr+aRbxV2Sxtbdb9f9R
         qkrWh7PjpGI3oXI4uNbChTlLHiOzjaMOZ4+eihwg67Rp+HRInn3BvsZLybKNYNstHmZk
         FINoY2fyJIJzp/5uta1RijvQ+aLkL1WCcUhKmSxzoXCgZK7DbTL2JyD7jDQgUdTuc38r
         R+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522162; x=1784126962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RoCc9OCGhP/RSTGfuXTy0/7DUKmkFEmhCqI4hwhY0I8=;
        b=oh/qE8mbX4VnQvcnOPjsx2/hqbVtHKcd0QwfWZovofzLS2iPNu6jrmL6Dw2jzyYMFb
         vssJ+xETOlTRXVizSmAsSIhRirVbpclRx7QHGBBc1iGvxGQm7AMwLWqwI/rGbh59yPUh
         bLRBOY8v4XJF3Bez0pLzbnxsZ5y+9jHrp+s1L7VacWY0CZNIvLhADFfeBBRRaBMlFAUo
         Bxi87mTZmAyvwDyz3MkM7z5GeeCs6pzU+ZQ0QXpap+FpBBz7hqhw1DyAtEty3J1R37Md
         fhhJN+Q1EfS7OWlFtk732MxVAGUvKZkWTkyJYMAI3IYMNozKbQ7RNcRYgD4ZaKPPPEmf
         qKfw==
X-Forwarded-Encrypted: i=1; AHgh+Rqi326e69z0kW+kLTSyLICexxm4/mWigkmEcHoxHtYbVmwjPSdn5VKb3tl9Nl0KUle5Ud9ngJ4aQCHZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yydwv8RQngDaP0qK0DtdJiF4hu0rw+/B0DIlAZV0YYGiqrkDXRU
	NtGwPuS2o1wIDDGF+m0SE+1KnZDPIFxylKLz6DWBGnbUDLaigTQGtwwJOduv4qPDyPg=
X-Gm-Gg: AfdE7cnXYALV+q1rPtpUpk5YSQX0us8p+ZqBO8THwqK0cgD42B6cOHaQxjh8OJvCg/z
	nuPsgbp5A23qri0EmgjovG3X1YUGmRcNmn/TslS+JddNiiaqGGHUA2Cwdt6YEMOcT/IK4cX6A1w
	G37iQ0nw9GoyjGf001AXvjKnS1u0m5kxxtr9pEFp95bM4ZKxzZc3IrdlYLH2abFqh9Biq4vosRi
	330WpS6liUPSPU5FAmUgi/VcVEfZHSCBA9/HkD98N632iQAoL3cQUeuF3s1ckgcG5KPCqcoNMA3
	ZDg1OEtlJkTTtTC8PtMSA+/EdqtWwQxz90Ab7PnxbfjcyXtXuR8ne10Xyuw11gUAnnEoVUlTYXo
	L2YkxtYaEe4sqCij+njvQ43/MhF7Mh/E1B20yuC1TbZ9CWEJqSaCEYiSxmFxo3TpozBl5UXQWqw
	2qh2aI2rcWg/WWyZ7s1hNW4flG4lgyOmtzRtQimiDzfHpHng9YZ9x5/Vzrh6he0svC
X-Received: by 2002:a05:600c:4594:b0:493:bc4a:d5f5 with SMTP id 5b1f17b1804b1-493e68809aamr27570285e9.39.1783522162156;
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:52 +0100
Subject: [PATCH v3 16/20] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-16-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

This avoids the set_ctrl handler being called under any
circumstances, as it will return an error for the unhandled
ctrl.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 3b86bd2e2e5e..6a779d700a4b 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1123,9 +1123,8 @@ static int imx355_init_controls(struct imx355 *imx355)
 					   1, vblank_def);
 
 	hblank = mode->llp - mode->width;
-	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, hblank,
-					   1, hblank);
+	imx355->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
+					   hblank, hblank, 1, hblank);
 	if (imx355->hblank)
 		imx355->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 

-- 
2.34.1

