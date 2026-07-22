Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B9A3859CB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714184; cv=none; b=PuGWnbhEEEFG+HPxe+F6ST44bOSWi/83HTFWK7OfNm0Lp6/A+zQ9BBcvW2WXwQrHSV0Dx0arhPIeWFpOxF0H8Bx1bAcCaRmZowLu2u2TXQQFIfBEaFiSMeiyxh10Bg8UKo3DZZYdeX0JUJxG8e+uQklQZmntNWiKgY4c/YkB7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714184; c=relaxed/simple;
	bh=oIzmlAN/xUiGauIafN2ymeVSPRAXQ0H9cGKuE1HfPGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2K+qsBdvkgFvYP0aNBlud3NchKw7id0RTRvTpkIRe2tkYXsiNRV+ikKwI5JOuGQDqX+LbIO9yovEgaajm0d4gMJ4jrRZwGWuCN5EyEa5LevaSXKW6AkLfKbuzPDL5TS8dWYFW6WsE8ORRT4Pquia2DDDz0Abjivc97rG8hfq/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8awG9ob; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8awG9ob"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2641330f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714175; x=1785318975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=S8awG9obI+Or+PmT7ZlkEjdpgsuSYVQkUnNPaPzuzCKxVK6uMUcx+wIXVBHcSLqGxu
         YAt3Y3H/WwoJeThZyTAdybNS+O4erQqyL+GT6l7msW2YrJ0evEVB+/RDP5Ijx9Vp1jtX
         6cwGNHKSR/SfcilCfzDjO02I9QgQzs6BLk1TlOAXv3GVcRptJHHzHGFalw1hetG+Urhg
         tfN4kr32EF6mEXc3pTMiTjIVu8PfcDCDwQRiZcr1kjBgdnKcA5ceu4CZsTP+jueppED8
         VUDDpqm0goZsZnHODUUxE2mhriGgGub0jma0tloJYOTrp9f1/i92auSa64BZR3yMySCz
         t7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714175; x=1785318975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=iMk3h30lm6XEP2T9ljBhhhCxhYGZTvmP843sNR67VlEF/DywPBxePewPN0Z3ewvuYe
         FvD1rd6YRjzmqyofew9QcqKxhbYGdPtJMD/ziVKex7rRM6lUL67Fh3aquCSq0nVQvpUx
         Vz4A1gMUj2F1SHDRQwUfcC4/fTDSJdPzXYROLser0F877OyQwkyzaGeIsju48SrLnIEZ
         1xaVtjCADDn5az9fFQ4uXQ5O1laXv/+ayCqztgi1y2dkd4aBoNMtny6usQyIVdekaoH3
         Hp42Fzipj6ErNf3GvQu3RvMX7zMJcAwBl7+2j5yCtFCHEpo9C48Uio4r/YGGHjStcfP+
         br+g==
X-Gm-Message-State: AOJu0Yxg+C4hl2VGnx7JDCNG1xMmC8J5mX1tLmqdIPAEbTEvgF1HLLKe
	g9oWsMbMtAns0r7ijiIAdx9hvEkc6vpM9FEay3t9/lcpfljCWcCrfLMK2UAzVkIvvJ0=
X-Gm-Gg: AR+sD13a9/A4oDAogcu0fFZjLI3kHEW651+nun4xAfpceOsnIPd9gxDyGq726FwzYRT
	RN1YqZYnffchZLd30gFFGbl2swun5NipqrR6s+eZMXLeTOc1j8zyo4fsLySbimxx6pao2RdJAlz
	P+6J1++UxzdPy4i1p3Zib+9LVGmp3s9jQRsslimRSUkEpXcWrwxN8CCMSy3f+coxjD9vhJ2RvH5
	8xckuiUalFblRTP3NzkGwbdqtWt7yhQnCNWlinFsFmKPT2FGTRbW3Y0OuHf4Ob8gaLPBB2CuzE1
	9pd6s0R/qPit1UIHsUIQvMMwRjxXcKFDBcPcpgCNBt9OdC439Z9lfAh0rmGmj3vT84wZDUHMhcP
	w45StX4Dm53rrcxXy6XEbbLQAt44+EesfsbYzU1HGl1uV2r1fXk7OW17V4yJhysPZtpGnq+rjMn
	v9yTgnLuknN0PIVfxMRmcoNDXcEPN4c1cCGw==
X-Received: by 2002:a7b:c054:0:b0:495:5172:661f with SMTP id 5b1f17b1804b1-49551726896mr145313155e9.19.1784714174726;
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:56 +0100
Subject: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=677;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oIzmlAN/xUiGauIafN2ymeVSPRAXQ0H9cGKuE1HfPGQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO3DxirCREaSZRzg4By9L4oe1J/cKMZY4ZRt
 ZPqiKTOSPuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtwAKCRDO6LjWAjRy
 utGoD/sGLlwsGbwkdHEoU3rAfAkSpRk76WlD1svFDSQzLco2bqGuiTMl95XleeZ8dmzd096IdtW
 H30hsxlgxBJYlta1JVJ9bJ6Pr4QZdcqUozZHu014CLJPwbUgN05bdvIPEo1PPWzxmqU5Gh1nwtS
 MRQWy4EGtgrITrtH/nFixj/0hyF8ybyszDS7TXB+pJm8PJO0zpKs5afVVF2laknXV/aIwGCtl35
 IrUkDWIFLztAUmtjRgQ48VRHKgUoKVaGpyh2BKm9DfBDWwBn+wkHL+ReniPyQZ/ilLOx1XvjhnV
 7NofygNm8k8wD1uUtqLpWjZyhLipwz9A2eRG9r8wz2y1zfcNxnHb1yBtIYGbwQGGzE8aY2z+3rn
 gfTc/LZywh1O7NMTE0Wgn9tdfHTJCQSqN1l1GR4bL6eZzIZB2WJu6LMVkaaPsTLRRWF04i1ScrG
 UCLELmalD5o44hHK0IRMwgbCgo3gZqGtTSTCDWuLX+vZArU/FJ97qZ73VJUkUmWpHPg2ZTNuwyp
 IhNuRKnMPh66HGyXCx34fj76bLz8dm8zeQeSKWLl9GbpVKU1/fBilq5BoSsG/wiQ/ianK2TNYkZ
 fVXm4MVq//TvqkvYyLr8o8co/LJT81FTfF5gRCU9Vm0hAwz0zG81Q/shtwCJa1ZzyOAhK0Ei0/9
 WKg+qry3+sd1fyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f4dfd0cc853c..930a4f27ee56 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -50,6 +50,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y

-- 
2.55.0.229.g6434b31f56-goog

