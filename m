Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7EF31A55B
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426163; cv=none; b=BBb6sus0V/GePv+DPfByAjg6PmxQ/LEdY3Af1sjjH3iKBFw8BAQ6/nNwTVG06+eFk96zi9Tbekqat4EOxGWB/UO/id6PTjnrxbQs8TLvE4J80r2Ret10NNakok6SMBkTkCiIuPCt+TOPQXa0BJoaex/TpFsp1lwZH+Qz8PX6gDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426163; c=relaxed/simple;
	bh=s4L4ukk0KyujJ0HblA0DbVk6Hm5VHHVGY6UKqtf8+Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fg30+oy0CYPeW2qxEotI5Tb7Tyj5W4sxUNE2Cj9p6jOvnWAhHc2JhDbkwgef/yW9Bn31i6a3yKMGCPGD9bFxPvru19e4R3roDkvZY84V3eccxnD/yNmKA4EfH4al0tGZ2Fe39P0Tuv/Xlz+1um0OI/KTj/7Fw4CbyZoHhryC5JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3PtJMUi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3PtJMUi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84236f9b638so1154292b3a.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781426162; x=1782030962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAITfEL9UqrO9L8OmSD1zMxFdEqiUvJMm9blfi4uSXM=;
        b=S3PtJMUiS69D2k614mFzce4tH101RiTzfiLa6MNdtGYTKbLUH2MyZX4iRptmSwkRkq
         Ynjs+HSRlIo3jYfkUFSAOgVCzJNIJ2PhTTaQGnNCCcWerqAvaQiWB6FhTgrySRzBqYhO
         VuFuRecYUA2i94dScZopATd8ceW21jYU56EeOxmEFVwaFT0ML4cIZGzaMF6vclzr61w9
         jf6PhVLQHayy5QxuNEnZzedbCnYzQQxwAtPTpttiBU2MzySW2sKbpENJG9lk8nO+JNZY
         eTkLw/hpX2kn9fLcjaSV2BmL0rbmehs24xF3kIbpUnrA29IZ7WctWCpRD/N2uh+UT7p6
         KleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781426162; x=1782030962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAITfEL9UqrO9L8OmSD1zMxFdEqiUvJMm9blfi4uSXM=;
        b=pgqqjOmlv+kMSfpZASxFcLTGSKWwAQw9oQs1CwiQsw0vn946prphSAbKuoYnT4BWG7
         0hDbEbCvVtOCFOh9R5z6aXTEM5pXRBNz2l8Wfz3leuJUDGDzoS9AXdEQmJjcKWCpPNMu
         0b+jwvx7n842N4X9ZahpLY9NfsiXyjW+hUIndz7/u+SCdeODAgacEbkkhC80J3KdgSJA
         rNJpMUO6GmGfUuwoNe4JS6EvSd3ctRzCWdWLlGuylfvgVPWnFV+1jo9EC8E+C8DkPFLh
         O5e4asYHwFxop074I9kk+MV+hyH60mw35J+K91ugS/6oPJ4BeCveQ2AlfaoAWsnjcKwq
         uAnA==
X-Forwarded-Encrypted: i=1; AFNElJ9bqrh88eThgZEYnbqXXivEIMtuLQs63cMtblKxDAUDr0lKMeqlOBiJXzOWBo7TltS+SP5CzH8ST0o2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc00moO5A8UL6RrWeomKlXhfx7JN7+njjr4fUP6Jfg8d7E7yy5
	BPf4KkICPQZI9CaoSJOMVkwPwkeQApEomnnLQHCDrMrkuStKJJ/DxHsP
X-Gm-Gg: Acq92OHbY9Qat0Oa/3DEdPLLAR+npIlNh4npjVmaKXpo2JV2P6KYUUO/LKL69XxTCF5
	JvfwveBK7S+u1XOK9gMxZQPtqQlP8NiJo56DbB5aG5KM7Lh1xLEhZjJL7nYqUAZBq3QwfzM4zob
	2+vXGlocz0sM+a6+JQDTDu7Ibr/NBD/1ZdjMIgWH+RNr+GRXjJWakFqV5GAj9XmXmURxKHMhXWA
	WtromQduq4vU8V9GltplRrvvgvWXr5pJxvuH2UfywGuH6TZisY7fJfM0unKgzuvFCQYaqMAW4l3
	MVLZwW5Y0UKly2F0DopIIVkOBVWYHkkyYzXX43tTmzgBTKn75gh+2c97ODZeVk8zAo+VshwYA19
	dJVGHPPoZsfSURd0zSXCkGLvAAi00NjIfbZCnJzMOOFtBei1o4GIIf5wgB8hxRJ2K1uOb6nv1M8
	xHHd5sVlNlAMNiRdJ3lwMawA==
X-Received: by 2002:a05:6a00:3390:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-844e199926amr6606163b3a.19.1781426162161;
        Sun, 14 Jun 2026 01:36:02 -0700 (PDT)
Received: from nuvole ([2408:844f:2361:d7cd:deb7:4e0e:26d0:4076])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8fc7sm7263053b3a.37.2026.06.14.01.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:36:01 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 2/2] spi: qcom-geni: Add property to force GSI mode
Date: Sun, 14 Jun 2026 16:34:24 +0800
Message-ID: <20260614083424.464132-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260614083424.464132-1-mitltlatltl@gmail.com>
References: <20260614083424.464132-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices (such as gaokun3) do not disable FIFO mode, causing the
driver to fallback to FIFO mode by default. However, these platforms
also support GSI mode, which is highly preferred for certain
peripherals like SPI touchscreens to improve performance.

Introduce the "qcom,force-gsi-mode" device property to hint and force
the controller into GSI mode during initialization.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/spi/spi-geni-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..eece7312f780 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -102,6 +102,7 @@ struct spi_geni_master {
 	int irq;
 	bool cs_flag;
 	bool abort_failed;
+	bool force_gsi_mode;
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
@@ -655,6 +656,9 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		mas->oversampling = 1;
 
 	fifo_disable = readl(se->base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	if (mas->force_gsi_mode)
+		fifo_disable = 1;
+
 	switch (fifo_disable) {
 	case 1:
 		ret = spi_geni_grab_gpi_chan(mas);
@@ -1133,6 +1137,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (device_property_read_bool(&pdev->dev, "qcom,force-gsi-mode"))
+		mas->force_gsi_mode = true;
+
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;
-- 
2.54.0

