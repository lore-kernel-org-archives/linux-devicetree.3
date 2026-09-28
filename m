Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A964FC338
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 20:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628911; cv=none; b=sE6WVJOWizfwTGXKnyluJeQLeQJqX6aPNhrOdhdIyecYBUnkXXzv/FrBbfE8a7mq8ASKs1T5knbgqACWs7Qk3AEOPdpQqqffRr9aQjv8rI3gHx+UreoSmtOC5r0VP4D/8TDpKp7zKJqygtuHkrEn9lIEAGqercfw3hwwwnPUHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628911; c=relaxed/simple;
	bh=wR8JJ2pL5QeRqlJm3/ZAagrZ56dstDg3U9pOmu4dPTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcaBu5TjQcmQkCdHD+0pKVYd+AGXsekD3RzXN5RM3pclGNuqkSDSgGjo18fKgILNLjjJG5VJeaaEcjEMwejsxGxwJtFLHNIbMri8ZZMGuzWB3AsNSsvGy7Qg+veJ9pmgYRvk0i6rq6R94adSg10NYUOR5fY8PoGfTR47f29c9nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPNj8Ep5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPNj8Ep5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so33228435e9.0
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 13:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790628906; x=1791233706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=yPNj8Ep5tFFOCx8rv6P8kPqc0jLtrlU3OBNKMOGJFL5vJyvAV2z8zTuQlggnjE6+dE
         91SeNOss9P/f1lqeKlXGh+2ozsD99VHq0ivCxFzWXA9fl7ijCT69+UT0sFdSQ7ZkzZ93
         N7lIzILVtRUvSYZ8uZcKlvQyiTAvfQlOXXYePUBmF6G+eliKp6HPqXH+C/VVTnTGxgDR
         XVL9jBKB9ezaO/93W3+dsG31IOXLJTDXlI1Q0btfimQ3MYIVDcLONeFVOTE41ru7nqMl
         rId+ynHEZb/nGgO0+vnNnJ4IENS10jVglxcg9S7rHab/M2vaxUPBagU1F0qWDtsLmHLd
         oQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628906; x=1791233706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4XMMwg0nXpx6NtPrekOPsMuFobBMMqkvCqEzIOlP2s=;
        b=XEpCKroaX6BIKtqrv3BjdLNLLVoSx3yqonnidxa32ZLmaKuLmUznR4kfVJgZzjk9di
         Jr/loiSOuOxyNuo9hZAw+r+zAiHR5kDS8guCfTKT2TrNlUzIa05hyiKdAVONz5qkhJHj
         +dD2zURG1cQpnMsXJRUFYwrOJmfWjjtsO9CfSsGcMx4r8leQn/ltjlUIqqoyKA39TfZi
         8a2bAb5wLlE8rQLIz8cPBO7pDVSQSym8uKJnP7vmOE40pWRmYD2IHyx6bvJ7EOuUDI5k
         mQXgMZL4wC6UB2kIZPEWkoaUgj7Moct7RKaUWEeBdQa8CrHhR3Hg1cLQX7whjRYYLy1e
         u/RQ==
X-Forwarded-Encrypted: i=1; AKwUvBzydjHtRzkFyyrCrz4XiGPQSQ+1p1kpkkxZe5jybu3ThGIMr9WRLn0unB6ENXbPQLEA5Ab92r4DT0rv@vger.kernel.org
X-Gm-Message-State: AFuF++nh791Rt68IQ+PMHfgGKdLNktCv84PyBwAonPQ/gUF4wWzej6T+
	5nI/SlikPSSdFaMUlJOE40q5znjkel8n8U6BrzG/o8p/hQ7Wgboy98f8PSW/wjgyKmU=
X-Gm-Gg: AYBFou3RLmJpCpKODLWZ//khT6Uyd3jLH+O59KxJR3yEiOsknkMqXk92KQMZTKD/Jsg
	C/fixCkmFeDfdvipU1WmFQx4wsdFLPnECh3Ya6khXcfCR8w3d1i0vsToCnKP8wv1lX0R/36vgrK
	lnOmcbYswDBhvRTmDHyaLjFs9ojA3YW4PVm+7zo1bfwvUuXi79DgpUZEjcfxNEmnMzIVelHrZox
	Ve42zabvLtkXq2hDSthnX68pvRRbHYJq/4zPp9Wg+7RG7qZUm3Ugu4shKTfvWc8Ce9OcnZZlSkQ
	73JOcWb9anmIEzrULTuUhxIFBuJGsT64q+N6iCq1zaSIebx4I5153nAZ4KG/BfpTbsVnEZhLR17
	lPyDt9d/wxvGWT2vJzjRKIRaCXnB0Me1h9QfHkQQ/Bs0GsBeR479+DMZ14kM/0DRs3i5tCk2ntB
	3gN+KlH4wV3sk6C9CP/YHgJcReiVFWwiTUBxVbrQMyXc1O/dtSDLhUSOauQ12Wc77KG4YVq+upI
	uzp7lVJJRhn9xg+Ub+nnTnt7vHj1nXwW65mn7gmJr6hfbFVBi/H7IPu1QBcqA==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a0023f8d93mr97168395e9.2.1790628906389;
        Mon, 28 Sep 2026 13:55:06 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfec703sm18042045e9.6.2026.09.28.13.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:55:05 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 28 Sep 2026 21:55:03 +0100
Subject: [PATCH v2 2/2] firmware: samsung: acpm: add Exynos850 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-exynos850-acpm-firmware-support-v2-2-717acef9469a@linaro.org>
References: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
In-Reply-To: <20260928-exynos850-acpm-firmware-support-v2-0-717acef9469a@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
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

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 942a2e9f02f5..5a16665e941b 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -39,6 +39,7 @@
 #define ACPM_POLL_TIMEOUT_US		(100 * USEC_PER_MSEC)
 #define ACPM_TX_TIMEOUT_US		500000
 
+#define ACPM_EXYNOS850_INITDATA_BASE	0x7000
 #define ACPM_GS101_INITDATA_BASE	0xa000
 
 /**
@@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
+static const struct acpm_match_data acpm_exynos850 = {
+	.initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
+	.acpm_clk_dev_name = "exynos850-acpm-clk",
+};
+
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,
 	.acpm_clk_dev_name = "gs101-acpm-clk",
@@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
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

