Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7585837186E
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141900; cv=none; b=UmPz9VR7SrY3jtXJuQ+xTtxDONZ1GcpnqkBZHFuzfvvsSy+JGVqcx1ssvHrTpTBIv4TvkJ562CsyoNy5UXKNXQVZ2W6vii55+q3ZRa55fX8u2PzHqgshIRxVNlYEKOT62lOUtmRP2jPp7vT/24PTaro2Gcs2roW0fL7bl48vBzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141900; c=relaxed/simple;
	bh=tDAlsKcDHucm0PMV2skHLBx8pgweOOd/KInCPeBESn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXxHYzpjxCl4QfW9A1eUTJlr9irFXqIWz4zf9AWD9ovCmUBYlgDl4UwYuClhs4Vz7JdpYB9NOrLeO6CJY5gEve1BBFT7OQZc7Q4o2T4lGkCHWNzvXV9oOI1BwlVoFQw6DqIu6ACarWINr2oFgziw+t9GZOo4DOtxD9PciIAl/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhL0F4Cu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhL0F4Cu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4890098abbaso68280405e9.0
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 11:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141894; x=1777746694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=bhL0F4Cuhij0g00JTwrvocAdkSOsjDTaw7hE++UVsu6HLQ2jaiXFLNITMyMRikYCNc
         jIdO5qepEk3mZWXEfgsmOGE9UMclCvh0KkCE7dXKKSB1U7I/pdm90MfKXNd6JHSmrcyS
         MSi9xzVoGEfbEqA5i0nOnFZwsjl6k0g8vK3K4yxw6ohmiRPKOjvskA/r9XsUMnw0Bs1x
         nNEsqw3K6BivPUV8UbLD1trTmIknRA7OrrsT77HUo4f5t2woEaAFuYy7s8oYLcTpiHeS
         VYYB70aSec2M/ka1sbtSgdHeUpJFPkUhk/BeyV4CvfY1cLeGClce36RUmmWjQz4tj2cW
         JnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141894; x=1777746694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aVSdZ3ozKGtw/DqweO5GvX1Ke0Cy808rQFC/VvXkjos=;
        b=es/IklM/OXT0tfW5fM7MaA0OSFAJpJBV1zcPp/7mZRYjZCYJU0Fk/OVfREQLUboKU7
         6tFOEGx1WIo5gEIq954IIUqeH5v3ssnevMfDTDpAzf/T3GjMha71pmFRFjDAcldYMU6K
         jSyIjBdtgPhdBJ6EmnRdr7iM/rh1rrONuH9R7KIVujIEkdm3hGFS/A87QmnBz0qDpHE7
         SBNjm+Zkr1SPsCg0AL5GlU4XGzbtoa3lSVqveWK/bOz8OxQ3NhXNKa0VkZhON7coFdeY
         xKf3LaLRRq+v/nGOW0AKoXHeY+bpoqHntxW9tL0pLjpOwKeyMUqHaf7EuRb/guqtaNBl
         LO6A==
X-Forwarded-Encrypted: i=1; AFNElJ+HrUg6dChHwZsle/VuNbckLa5sRHClxxm2ck4bXaT3vUCJYCyvWPJVMtyOwar3CvwbAMjPxGRjjBNz@vger.kernel.org
X-Gm-Message-State: AOJu0Yytt6vMn9dah1XuHV17W5aInM39s1jwG88oa7DyFKQyPuyhAoKF
	+q9Qy6ShsJSyWLdSFTfal4/UPclTpYSWtlNcEMOl7cHLl4XvVK8G0JMb
X-Gm-Gg: AeBDiet+su9k0GDx4SbTEoZM35jPifK5M8ucfQdElLeFUcF8jFxD3Rf5Ny3C7h3J8CI
	Iv9v4s33PePut9IivK1rQwmR88UkKwzVgJPOKCuGjxaNBZo2pIP4IIOH4eZa3FRNc6iBRYiZzGM
	LPCwnS8c7IZ3RI6qaQW+Dw8D6RQ0Fu0Nk0rTenDzItWzot2e3fzQP3O5N00ejCXXqPLL7uJuijb
	v6QYAhC5jwWXr1+aApPN8nshyxze8ND9VC89NqDz0ZS6PiFfFxOr6tEbyEZMzWYOmTXT1Cj0ukx
	i9GSfSkflVP8m/Caa+AtXxgcUFmB2W6FW7sTbIplyafVBg/XU6B19Wstf471EcY5O1xhfZ/PgwY
	X/3EOYAnwLQrPl0JovVgNQiX8mKekgOxxjHooYn7zLpUyANFQtvkgm7xRUyPzE4q9aoe4/TrNKk
	/xgvL2wbLD1TG0xxrXrVN/A+HpNfXnKxBdOV8=
X-Received: by 2002:a05:600c:1993:b0:489:e696:836f with SMTP id 5b1f17b1804b1-489e69686a7mr348688125e9.10.1777141893727;
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:33 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:09 +0300
Subject: [PATCH RFC v2 08/11] media: qcom: venus: move getting vdec and
 venc for later
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-msm8939-venus-rfc-v2-8-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
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

