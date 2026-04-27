Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3DD3E8C5E
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312762; cv=none; b=bqTwIxmAcvgNnNaIxHeFsZ/cwQj8gyaI0EZAbbdTfkJVK0nXCZ5uhQRraVYYj/22rziKzqxUPBFRlzoR4dSmh0wKI5Nli48ibvemNkX+QYfEnMpnYWIt3xCEIAD6je60wdJBUYDJIrTLX8n2ZbOvuH4O6smlExtKP481N6lHm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312762; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ku+8cLRWy1r6ylWdbD5aOgSL1ZoBZvpn6z5hsJP8dtHtIq6yynYyS6I1hmaM+3EZdLAAF4ngVQTpswLZBxOTNiK6zmGcuqHWD565xRup+CQt06IAplIgi2vgpZVRdVMw5n9A5UvcQ5hL37nLDVXGclQiGhikLaSAxG+d7JRLvbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=of5y5ffc; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="of5y5ffc"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79495b1aaa7so104550757b3.1
        for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777312759; x=1777917559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=of5y5ffcKvBozRtgm8cIt8KvWU52gmHLEL2+saHvCzPQud50Oozy5PzvzdAdbD6BG2
         F8AWGZqhTeeMSzq4Ngb0VnDTYWZsaYMLjYzvVbuKRtEziRBBWVWIqcrXJ0oRX5OQ0B4y
         KB3T2up5ajoDDq+JsrCjfXK5xiuDGhU82ag/8z29sFcMxkxupj45rOUIIljdQhChqmTX
         Wc0h1xWSzF6fBBkvekeG35DZJbD5ZUE6qkZIZqzi0Uon9EVgnsnVg+xSsfthssafr/0z
         b0f4DvZOZxkVZYZyOeGLYOgFEmx18sXCElleR3OkqusqjU4mS7DLFyR46db28ZygkzZt
         DxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777312759; x=1777917559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=D8CFt4W+PmrS0yDSubck9FvGiDOtO9wzG7hAQGeGSuTPfTrdjhcpvoPV7pCW9hS+Z4
         wdFH2RIZbprd2MJR51U641WILO49wT2sgWJJScWxNPFvL2fSfPD/MARS6K3/NIQVmg7d
         yRg0hqCwK+rF+reTDi78c8ydG7OtJs81tZMNxn/6d1pxGki2R3JDG3E3G7PjPTbOX8mo
         fe39r39XWIdXptzfAqqjtc3VSQwKVn+VBUkCk6ythVqjb40e+sjWLSwvbWL6xhrhjySb
         SdCb/uxu+chj14CAh/1GfL2TrpTyhRg68UMlaL689yYxamMymWu1ecRYW9g7VeKrgT98
         Ka2g==
X-Forwarded-Encrypted: i=1; AFNElJ9sV3wyjIyzNsaYKWvwTmc+IGg/hn7B/+FDWIPOlVSNqBk3B5ppdHc+oorb114uSpKFmvrNiOynL6jM@vger.kernel.org
X-Gm-Message-State: AOJu0YzhL4TZYGFEANUMFagyly5p/jhvxhCE4xRypCvAwTP3oLr8513T
	9HvOCMIbyO4B3r/ILRKMX6q0CEre4cAexgZA5MBE9hL442W4Y3w2x2TM
X-Gm-Gg: AeBDieuRRx4qkj+OR8pvXcPB3sg3dl0Dx/foZ7JOli+YECjr66zvjSMcVLs2yJyVsA3
	JL3I93fH5vrMzHjwGJ3k/L0OYLrXpFLHY9tVr4tjIFHnt3ZN/AGiNnuOfnBv88JzvYB6dbC6S04
	e3TEmOUj29gex79orO29+5tl9mqMVbtqF5ICZEdyjp+s4fzQtzYsUGlvfp0juVnSOlLXdj94JTl
	dmoGzpz1fhy1P15nJBfAxAh7Jl29AwDStOWdXNr4vPlUGxB/MneCIUX79Xcg1ytVPs85Cqkj6g8
	z5yqck4nevW879pF/o/Aig+k6rQvgFvzIoHtVekF0kwRLbv5y3E5DnMnTKFYCMHWbqL5DuMCidu
	dnyy+KWYodYbmCyEjzjynv5JajJ4KSNsuP8idnXLyORsIcqFQLW1ffJnLJUp9ztGP/ntskY26wC
	piujKOcNsky2d5qMxPkxb+ZcQ+mighYLyqTYqK
X-Received: by 2002:a05:690c:4:b0:7b8:bc4e:ad3 with SMTP id 00721157ae682-7bcee021207mr3161247b3.44.1777312759338;
        Mon, 27 Apr 2026 10:59:19 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e9cf8sm198467b3.18.2026.04.27.10.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:59:18 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Mon, 27 Apr 2026 20:58:30 +0300
Subject: [PATCH RFC v3 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-msm8939-venus-rfc-v3-8-288195bb7917@gmail.com>
References: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
In-Reply-To: <20260427-msm8939-venus-rfc-v3-0-288195bb7917@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Call vdec_get() and venc_get() later in the probe so dev_dec and dev_enc
are initialized when getting clocks and power domains. This allows us to
attach necessary power domains to dev_dec and dev_enc.
This is required for the subsequent patch which adds power domains for
HFI v1 and attaches them to dev_dec and dev_enc.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/media/platform/qcom/venus/vdec.c | 12 ++++++------
 drivers/media/platform/qcom/venus/venc.c | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index daa8f56610c7..a4aacf5e535b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1792,12 +1792,6 @@ static int vdec_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->vdec_get) {
-		ret = core->pm_ops->vdec_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1817,6 +1811,12 @@ static int vdec_probe(struct platform_device *pdev)
 	core->vdev_dec = vdev;
 	core->dev_dec = dev;
 
+	if (core->pm_ops->vdec_get) {
+		ret = core->pm_ops->vdec_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index bf53267cb68d..5f6844d3d9d0 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1568,12 +1568,6 @@ static int venc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, core);
 
-	if (core->pm_ops->venc_get) {
-		ret = core->pm_ops->venc_get(dev);
-		if (ret)
-			return ret;
-	}
-
 	vdev = video_device_alloc();
 	if (!vdev)
 		return -ENOMEM;
@@ -1593,6 +1587,12 @@ static int venc_probe(struct platform_device *pdev)
 	core->vdev_enc = vdev;
 	core->dev_enc = dev;
 
+	if (core->pm_ops->venc_get) {
+		ret = core->pm_ops->venc_get(dev);
+		if (ret)
+			return ret;
+	}
+
 	video_set_drvdata(vdev, core);
 	pm_runtime_set_autosuspend_delay(dev, 2000);
 	pm_runtime_use_autosuspend(dev);

-- 
2.54.0

