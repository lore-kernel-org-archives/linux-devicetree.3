Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB4438484
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443992; cv=none; b=lCmiceJGrp1M6nUtHUm2oLuYj4rZA0IdzurqutO4TcjILx4ePzauXdtwq92F7bxVNxhJgYQym7Ul5iCMjBYTkmk7s23LUYE49/G7LvxO/ZCRuwmCmEWkdm/El4vpCB2Vm39S8hbnT+b+Mo+/jmaJP+kQXM8WJy/xNyTDAwp+csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443992; c=relaxed/simple;
	bh=qP+DPJti1jKsgKlSfGLcOlJHTnyH75umCFOgSa6F+LI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YfimTnpQi/Dfx0iSlwjSnybdSL4E3bcRRw8P9ti8aipqEPISM6B+0uH5j5Qvg5kB3ch1KY3gv3Sn6B4GVRK40cL7q2UR97+jcvu/BTBdmtb9mWbRux3SURRTIb7b/BSrbFri7N3/CyOGunFc/GhrN3ounRMf7+Urfqff6bDC2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=n0bHEXPg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="n0bHEXPg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso42574275e9.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443989; x=1784048789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUXgmt+brDO+VXfPJ0GjEwdbcLx8ty7pJnYbPnr2SCs=;
        b=n0bHEXPgxIzA2HBeDMzkKsxBkGATdAHhjf3UfE8lJS6jam14mSbECJJGedy3YSCj2o
         w6hkrY2GUeS9IBfisrmSPcObhh8jLP/w9lqp25Pyc1AtllXVS618/Is1vRe7S4lrDFkN
         bYn862l6nKo8ndRirU5bc9DvbQEbNPTfVqIy84PlLwKXah484aQsbwkutJQ45WL8hdZI
         XCactM0nTw1BogRTajFIizeF9a14c/jZJ7t1+1dJ0x2TGaxSPklKOPR6pz9EyiPd4Grl
         OLTwDGO+HQ2GJhNlCefuWcYO9INGTIzgxBySQTZRpafO4BAGLccSkoiPuHvkqz8WxvpI
         QMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443989; x=1784048789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUXgmt+brDO+VXfPJ0GjEwdbcLx8ty7pJnYbPnr2SCs=;
        b=HsWEczahc9Z2dPQSCVZ/+2pBWD4h/yMaMYlkQujvND9/JIDVdIzMnNPUxnk8ConDRi
         XvH9Voj6rvPduBHp5RkMjlIPGuiqyWh3UC0EOGyRuWQlINEf0cTCwqUpPqfAkCqK5eVb
         IQmG/KXK7JLGqU0phb8C+9o5Zcz5xuNIgDJxDRRvbivJyhYFcSHHIEMw0vyZ3M6MhdeT
         wk3Is51L09b5Zh3VNIiUnfSbqKFDuYWnXJlYCTpAPWP/bHTEBbaVnByIHsVN1gZiQ31z
         joa5jg0TUcIG7JwcTQuaZNd/JHSxELo+qHOtpgRbcT622cO7POtrfsRIxd2+x1BukSeq
         aNgQ==
X-Forwarded-Encrypted: i=1; AHgh+RraWdGLuZjQm2zX7N/OW56CiUCvXsD06FpUXbA+l26RG4XcBKPKy5D/Oz1C31BKU6IswrLGNbAqQXa4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz580Tj8WGTBoDHPUqoOdjyfveXsxlPpK2bBQ4GmFf+7WsUTbiB
	WeV0z7g+WhXL7JD8aIrtqkaIlXTeXi6YQBnNeis53FmSzvVsknVYGNOVFY9yr1zqRwo=
X-Gm-Gg: AfdE7cmpGTkQFfMP2lDPvqTiDL8cbx+L6cmdYj0NSDyKaIiMJgjq1uLhcdOtrM6YvRO
	VfA+HNwpy4YyEjuAewtJq1YJl7zedHfxJl2+XcBDlVK4IEpshNKa+syTZGQ5Arzza9djwrbmapy
	Fe3+NAkOCT+F277cEVRL6qf+iOiXfu/w93xzbNpZ/zOMgyOPvYCrF7rEZ6S/E1MiechUs1R8p5h
	fm1QGbq3gdNW9ZT8/qvbaqMT/Mi2W//zP1Qq3VztX4IrglhKUWNPLFpLpVmhaG0avCkKWPzHfNY
	UDPlOODlUiJxM65dJ4MuWJY8JfP/qT5QaKYN/LSkdsObSIQA/IsIx5Y9iwMpfSMmxAySY4KTLp7
	J+e+KNE1HvAxcoKmfSTrkSkIO080NHDS7hODUDzHXeH/uYE81ckQRWJFAJ30djqdHqvnQEkFWB4
	3hax+JHgTKUWIM2WqwqUXcp1F8HEIZF0oe75CZqfywRqs3ceMtb/UCn/Ro0N/ciIEt
X-Received: by 2002:a05:600c:4747:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493df093146mr71079705e9.21.1783443988776;
        Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:48 +0100
Subject: [PATCH v2 16/20] media: imx355: Use NULL ctrl_ops for HBLANK as it
 is a read-only control
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-16-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
index 0b95027983a7..cff87c6ea789 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1112,9 +1112,8 @@ static int imx355_init_controls(struct imx355 *imx355)
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

