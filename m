Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095675;
	b=w36kMcvLON0e56hkxdtc8qQyy9uwbRx4iTKMvsQuXkf2ly40oyFPYehKjFKMpLxOXDpc
	 +hdwLlARxhhpuR5wrvNJJr6v6nvWWPUKFbMnlttD+UU8YbfR5tM1Agl2oD7QmIT/OSPs2
	 iyj4z8bPznUk62mxDN5wbhziWIE91UH0zL2Pz2ATSUelczjg56l7K6TuKm/fbo8iAg5qu
	 P7QktoAy3ggfmk7A114iXS1tAtOa0i3uTypPUrXEGcaNA+WXW9QjhEcaNneuiJWV89G/i
	 72nJ2Cw4p/vHT/39rBRGMWxDcGRKcTejRUQhCF2yNzsiNqmGwb0052scLVJADzQH1ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
	b=GybSN1MHb43ShmmaYaA346ccwzbApZmBDmRJ9qk3INpY7ENNEUcVe3/w30pJr8cWz6MG
	 /8letZJ/HS0tKGZd395zFFt1wusX0TeZFJs+1kl0Nt0tFnJRTTPBjPXhlwnirm28c+92B
	 fUQSfibxDW/ddV5mc8+UJxrQlvVuIwUPOGGE0iNTm6tdVClWMPDTxmQbH9yXett1+DHmq
	 ZFsmV39XkUjV8gMdxGcukD3UHr3Da5bMErfdcEgfQAhCj+UEFcB6XekVE3H+ZMwKHiZsX
	 Gt1vn6cQcaoacmv1MT80r3+H4VcXGZg5gUfLCUtfs/M9rsa0wwUTWlIgdjaqW7S1wWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v/yC5iIA";
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3F606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC3F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v/yC5iIA
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-980c4258105so1322149241.2
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095674; x=1795700474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=v/yC5iIAsBsXt6P8uqDo6Vw/I8BJUSoM+iQPmacHN3OpkKecdynFT0AOqVWvAj0fWG
         CgONLMHCODVbLC2X/D/Px301tyjUwTrcxO0lyK4ZYWLmTsa8RptS5R3e7AsG8W93Nqi+
         AT+ZcY5K1XcUdDTyaZ215eIrv3fW8xSda15x6EKIM1GPSkjKR7a+euy+HDsDXRvGLtld
         ELhdGC373dBSzyZJNeeQDBM+LIr09LHt2nanai7MXMNZHnf5dyD5KHxHN8/IG/LOkDY6
         iYKyKvoZ2xXU29LvvzVkEHM7GVNNt8cXEWfP+OqP1I0zuSI6lvpR7vlhq7VWttpyzFK9
         Pd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095674; x=1795700474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4c0G4YZiEJEesEvJcSiHJ7KCJftI/dPzJGtmeIgLqHA=;
        b=Ietzk5er56hk0SLPQljgg67olOq2vV7aZq26xnjWpr2u8ZqImJT+ogvY4IpgD9Y3ao
         SaC5QxC5qwqYMNu3BLdBHOt64uDC/wxkGjsDlprCta8SuhKDnjGoyBqqs3aPz282ia1x
         XE6X9o4On6G6Y88X1RXDXCF6mQ7A2vo770BAP9RkrZn8HrBV2ZM/KYZxjOHrY0rb8R5w
         eHozQnc8ZJgNU7U1ZzFbh82ZOtNh5FrUUttv8l66JaN2eisUe64DW5yLEXrPpDLgJHkN
         qhlUKwOR2jHyo/E43WTLvU0djKPKtbVbsTeZiU7njl/Fy7/OFl9yXCqkNSYq3y5edhfP
         4zpw==
X-Forwarded-Encrypted: i=1; AL+hErFPS/yaH2qgqrYJ4F8tBA4/32G5+TlCADf5u95S5zsgx2OCHzJJC4zAfOWSe6lKLVUDSt+okgdn1IY9@vger.kernel.org
X-Gm-Message-State: APuU4Z/aD7GJHsiIN2K5R+jWTnbs5/fMRFUCMX4FO8HMKfKdLak4x0FM
	uePL/CPNjxO+4C0KUiqvEpQyWtSUu+PQQX833Q9RfWzT5HcaSg3AIm1H
X-Gm-Gg: AYBFou14tjoCy4EsOSCs3rn3WpNUmh33ad091QWqRToCeTleXfeOyFtF8Dj8Q+aPjWR
	muew3kbtE+mEAs92BX8S6ut7Bz2PX2ECnp5uW/ts3lh/r42hoF5pNjgmFKrIufQ7RpQbLrihF2N
	pocoB2KagdGVIGvWzTTJAQMrRf+3C1peA27XyHcF9gn5U6hJuMiBy+lKvxsb7bS6HF26Hc4OJqq
	YBC1N0PWtUe0Txf7K4NoUIQ9GfxVrBu47ZBYpvjimgTx6g4UySse4VzTcDEc+o6D7NOpNNGfkT8
	XeQuRE1e94Tb9Mdm0GDQzxIcWaa1nQQvc88DgUT908BMPgPa0b6fFO1mJdR3ez7suCvAQr6Trms
	NdcIukdqQuqJ3uOQAUV57LXIbuToM+FQHos/FJapnB+JzTYBR1DN0ChtDHeZTZHy1NjmSuSQA1w
	ZvOz35uqQvzxZT+X6N53qFpml8dWiXQywBSDZKBhGaMvzbvpjOzE1//ayNDwetCMJH43SNQo0Gq
	UYNtPMTyxVF5BTtyZdw6H1hdizSIbS1CpILq4SFJkW0BT49KpQNiYEGJdpnD/p+lXNHLrTmaMMD
	J0w5Yf689dVTpKeMbQnO3jvbgOlPo2NtGqJ9lIZtjoDWPUHfAMdyyTMUVDNTIVp57kupwaMr4cn
	D92YgXKrCZODFyv87Fpo=
X-Received: by 2002:a05:6102:2c8d:b0:7d6:49a9:fa61 with SMTP id ada2fe7eead31-7d6ba435c6bmr2530171137.15.1795095673999;
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:a13e:f40:91:660f:4d51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a240ac5sm4134862241.7.2026.11.19.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:13 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	crofts@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v5 4/4] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Date: Thu, 19 Nov 2026 10:40:41 -0300
Message-ID: <20261119134041.16611-4-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134041.16611-1-festevam@gmail.com>
References: <20261119134041.16611-1-festevam@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LRADC clock is acquired with a managed helper but enabled and
disabled manually.

Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
devm_clk_get() followed by a manual clk_prepare_enable(), so it is
prepared/enabled for the device lifetime and released on unbind.

This conversion makes the code simpler.

Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v4:
- None.

 drivers/mfd/mxs-lradc.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
index aa55f88399ef..c3dd2d80e7f1 100644
--- a/drivers/mfd/mxs-lradc.c
+++ b/drivers/mfd/mxs-lradc.c
@@ -160,17 +160,10 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 	if (IS_ERR(lradc->base))
 		return PTR_ERR(lradc->base);
 
-	lradc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(lradc->clk)) {
-		dev_err(dev, "Failed to get the delay unit clock\n");
-		return PTR_ERR(lradc->clk);
-	}
-
-	ret = clk_prepare_enable(lradc->clk);
-	if (ret) {
-		dev_err(dev, "Failed to enable the delay unit clock\n");
-		return ret;
-	}
+	lradc->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(lradc->clk))
+		return dev_err_probe(dev, PTR_ERR(lradc->clk),
+				     "Failed to get and enable the delay unit clock\n");
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 					 &ts_wires);
@@ -193,8 +186,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Unsupported number of touchscreen wires (%d)\n"
 				, ts_wires);
-			ret = -EINVAL;
-			goto err_clk;
+			return -EINVAL;
 		}
 	} else {
 		lradc->buffer_vchans = BUFFER_VCHANS_ALL;
@@ -204,29 +196,17 @@ static int mxs_lradc_probe(struct platform_device *pdev)
 
 	ret = mxs_lradc_get_irqs(pdev, lradc, data);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	num_cells = lradc->touchscreen_wire ? ARRAY_SIZE(mxs_lradc_cells) : 1;
 	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
 				   mxs_lradc_cells, num_cells, NULL, 0, NULL);
 	if (ret) {
 		dev_err(dev, "Failed to add subdevices\n");
-		goto err_clk;
+		return ret;
 	}
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(lradc->clk);
-
-	return ret;
-}
-
-static void mxs_lradc_remove(struct platform_device *pdev)
-{
-	struct mxs_lradc *lradc = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(lradc->clk);
 }
 
 static struct platform_driver mxs_lradc_driver = {
@@ -235,7 +215,6 @@ static struct platform_driver mxs_lradc_driver = {
 		.of_match_table = mxs_lradc_dt_ids,
 	},
 	.probe = mxs_lradc_probe,
-	.remove = mxs_lradc_remove,
 };
 module_platform_driver(mxs_lradc_driver);
 
-- 
2.43.0

