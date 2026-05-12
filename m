Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6603A6EEE
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778627542; cv=none; b=Sp+Bp0kXkPlshcaGfELR8O/jn35WJsG8UKpyltnMeNH+9oAk5Rstq8N9RQ+w+9POrwS+9Myilx5s496le5r7Aj4fhUX9gRStyACl7xsfvAA7o7HlHBElTwgCIk3+/rjW/7/S0+nmsYhG9mqePcanuGLUrvREwBILHrXlB0opwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778627542; c=relaxed/simple;
	bh=dSS3IPOhB+KjMLAlXDHOjwG/QxTCJbfmh8uGFXAw3WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csyIxysKtGup3TtxmCu95slWDbuHa8WKJ6hT6bjDPMEOW5skhOvS9A7OQ1dt2FmmgGS3UlsvR2Sdv+y0X7Oy5k98Hkaq0ucHUWx1xQBz0oC13ZW2eGHlaOzpnx9wfboFuAzUE8fw/y0xnWmBuEIJDhCOfnAeI/5FPXZSkWlVtgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EWRpaoAW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EWRpaoAW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso69994335e9.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778627539; x=1779232339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmHUKL8NUphLHwFZ6i5s/xt6HVZRF/yrFKUHEgOkX6A=;
        b=EWRpaoAWe7jW5MYLT/g+1jU38mJiYWVJsbTMFTze+/Ma80mDBKNekNb5vs5U60jCID
         X/yPIScjMSR+i8XFZOUY8ZetGt5WHJXQj6Pzeh+zNeFHmm+kuTMvqAllK0DDyjV8I9MN
         g6RgMzLe/qsT5u96qToBYAHwONv0Uj6Ulr4hRCKXUEgWqLgPJsvJd1SZ8iBtZjm5mJEW
         CrhE23JzA4wI9D2FWFum5pvAcw83wWQpNC2FrxSHLOPK+CvTfznjtBIP47OQJFuMeN2T
         B+yIwbd6hhWznlt+YiKgggP5nVpuNqzmG6ax45feqhMejxEwC9LRM3yjCbslHhXea9Z1
         c3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778627539; x=1779232339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmHUKL8NUphLHwFZ6i5s/xt6HVZRF/yrFKUHEgOkX6A=;
        b=WrqfiktsERKe+CBrVedKFkIWsALSnYDo5aeMWPJXtH4cJEn6WxrP4jw7PdzEVEcx8Y
         RjribYw8byrzmq/xJpQF+vLyTYzLwBPaWdoARzbekO0I0JqOnJzQXrIgTdFFt6xQ8DTo
         +tQvd+m9yCEFV+KF/nImP799La2V18fKdPeQo04A8J0Ef69D1tFbWo5v3klGGElCRYow
         YwxCdcn3bqbGqH+JW3OTs0NPZX9Q9nJbIMEp0RLNgpoTLaEDhin5KN6rfAE/i9AMMbOH
         XmTXNmPzMWpo1Woj4faO5yzFHNnA62ZuWpE1sxvp44V4nC09NyRdkBn0Wclq4GyXEgXd
         Y8zg==
X-Forwarded-Encrypted: i=1; AFNElJ/rB2Bq0MaYavvQh2Okfi5vNap6O6ZbGk4ptIKeZWFFqnRBdZE9DYXRm1wBTJWrIoeKkNnmKyUha3wl@vger.kernel.org
X-Gm-Message-State: AOJu0YydiS1dvvdPkvE9A9S2kCooIvmDqKEm89ei+LbamtubAZQ5anrM
	xotyZlUX1FKMF/LVxvp+Auyeoms940LTfELVpUepxbNNAR7bfV1jLjHH9SOUQ8gdhtU=
X-Gm-Gg: Acq92OEu/kiT+3Va691hX9jONfIYrPrB2mNO3vEgfGrXehS2Qx6EvZAmUPNLgQEswSk
	pYWUe98AjyFWs3UEaVGAVEhgqbi8M0lge+48l68jMrmAgI1m3icVpYVlAA6+xuHC3cUaLHqw0sH
	DIAbAc5LzWpkDLg1KNlm7X+uIig/AKCX0ZPSdl2IboG46LjrpvYE+7l2PdvtDIXgmUmx6x3Nz2K
	pT6/Jq3LO64mjK34hKygQtQ66av5sg/YFKPVTTjzyHgKAZrmRqpT8USfnj85vJB9/LKKS0OFuQ4
	USv1h0wg7fkdfZGnTbimOLxQ6Yn8sZZHhBwwOLqkhDjrWIAExqbMWV+ZJgcL+QsKeKW0e1hqbfr
	90Z+Mhai7Cy7/5/Uo1VhtbM25EM7aFvEPkt0TR9PQ4CA/XPxndlnWIAgjizMXuKG9fg7Bs8XtFy
	lBaO6DnnM+aTGEklJ3JK9F3vlqZW37buOwySV2iinRDhewEFVt4NzewTo5QqwaKtLZPburXsTcQ
	zY5vZRm6+TwQKn2
X-Received: by 2002:a05:600c:458a:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48fcea00708mr1365685e9.27.1778627539442;
        Tue, 12 May 2026 16:12:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm20712305e9.14.2026.05.12.16.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:12:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 13 May 2026 00:12:12 +0100
Subject: [PATCH 2/2] firmware: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-exynos850-acpm-firmware-support-v1-2-3858d097e433@linaro.org>
References: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
In-Reply-To: <20260513-exynos850-acpm-firmware-support-v1-0-3858d097e433@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC contains an APM co-processor. Communication
with this hardware block is established using the ACPM protocol,
which handles IPC messages for clocks, power, thermal management,
and PMIC control.

Add the "samsung,exynos850-acpm-ipc" compatible string along with
its associated match data. This includes the specific initialisation
data base offset (which differs from the GS101 offset) and the
"exynos850-acpm-clk" device name required to properly instantiate
the clock provider.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 16c46ed60837..db4138f36038 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -37,6 +37,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -766,6 +767,11 @@ struct acpm_handle *devm_acpm_get_by_node(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_node);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -776,6 +782,10 @@ static const struct of_device_id acpm_match[] = {
 		.compatible = "google,gs101-acpm-ipc",
 		.data = &acpm_gs101,
 	},
+	{
+		.compatible = "samsung,exynos850-acpm-ipc",
+		.data = &acpm_exynos850,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, acpm_match);

-- 
2.51.0

