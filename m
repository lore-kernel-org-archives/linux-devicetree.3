Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430103AEF46
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810252; cv=none; b=iR91SLT7dI15kyPiFKpNP6yR3ru5AhERGE2a4BP2PQVkcPqkxGTCXv7cNr1y/zTK9G7qHlmNubHPkQdGmwLAjGAZKCsCiu+XA/BRCF3qGY1rf4KMqO5P9JBXQmHyV5oG6I2Aq0ZWCbnnNa4NyMT5FIpnDB3MHnvJ5ro2xhwhnDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810252; c=relaxed/simple;
	bh=OvByowY5AkD+6XxbWpU7e3CK9GMCI7JhmFpONYFhBxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAOe1bgho9JKCZmh8h+H36ofVGRk6HDyDpmk+Hz2/u2Lv3YePQcC6/nbmxWkhg+uO+IfUxxXc/UgYwR8cjbfMzcrbzNCEspoOHRQ8LhuTvVrGoi1ujh9+8FTzfTFyqueZTUNNgrKMbdsObnBruSMlwTnQZdWqVWWoNZQ7UkZ5z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNprjW3K; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNprjW3K"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-824c9da9928so1382654b3a.3
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810250; x=1778415050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZXP+KkBGD3rO/JBi4lfVCJXw9tpw0NHQd9gpIHkSxI=;
        b=tNprjW3KZ21ZYjAEKBrmlAtYf1NUcn85zyCIuc9s1T/SHBaG1+aZnkXTg/jPSk8aa1
         BFTrOWFG8UvNDq2Pfg6Nbkrclgdv5ktonsDnkelpjmdviKflnFbzIGdyuIrsFXbcfb3D
         5FisoKMsvm146Q9xyqQXoxNMODpLNKH1a/Wq9Cz6Mns0tB9iiKAx0AOR4CDg+Lh21u7g
         K9DD4+ZMcNZHVwQlkEOzPs01lKW+ddhBgTnADsDAC2kEbVExfCtFTAnDwfDcfk6UcRT/
         W07H1xRTA823L7UNlJFlmX7U0ZZkzAe8pXOACzt8NUNAst45oI5sGADJa0/V4Vk1w+lC
         cwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810250; x=1778415050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uZXP+KkBGD3rO/JBi4lfVCJXw9tpw0NHQd9gpIHkSxI=;
        b=WT23n84lRW/VLphUC3NXVaO1CSm+Eov50XD4nSizCPCBx+m8aHDdtMUL1E4bvmaKiM
         pHZBW9hSsXOIuQPC8msadOlVD+22UqZkQghvXmwxGICGW5R7jwXGe7+K5C1J4AxzyzsB
         yWjE9s8OtA8goC1JrXSlpskUvagPq1oqQWetPQy/cEj5/HGZY5TEUamZooybaT343eqr
         N7CZkZvTy/MM+QkIzDrvvACq6cEsJdW0mf3eLBsx4u/xNrvQQ774/JFo5H97qUSFgMN4
         zo6pGspSe9yFlHhOlO2B83htyDU5TZ+Gfzl5SJQmwHkLR6J4us2WOksSHOVQVfLYKX3T
         Y+Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/9I4b1mWTqsPcTo16Uxm8B0hIOKhJXot1yqIxtYc7q/vx+KOtG5MoO9wJwDhnvsLKwboqEpfcR1QaR@vger.kernel.org
X-Gm-Message-State: AOJu0YyQO+Q9UAARlPuy2l6tmXXXlmMfkpWuGb2a/YqB78+tvTPc9MDp
	QrgJMIEu+LSARTreeeKEZVz6J38osSAH2SvMsS8RCEXp0+IksWpgCdg5
X-Gm-Gg: AeBDies+QqGnTLhpUb2KVR2egk9Q4SJx1WWvI0dSFpkPmDKhRqQWwDSQLzOVR9iE3w6
	R1qVilePgEz0kKSKF7GNNC6/GaEIJ4dcuCiLBF04JiBEqA9dPWV9ui3MSgfO5NOM22vS7xDFO/k
	EV0k8NzTX6853bPDTDz43V3uT6xF//QGOCnIpZgE7xe5wxxZFjvn9mP80CkXR5EWOq1z6QQj2TO
	GyBPeWZRtPBOZmfEZAUkWK4hRyklFmBX1+Sj2X1pcUfhIdPf7mWjFmx5uWj1fDdtUbGCyETka7I
	hbheMA8d2JLtPK5rvg/7WBL6ZZQtTbTIQpBTo79VdGaRziJOYE253fN5UQ0Xf2OYWG7L+vQH7r9
	8I59pJHF3Jz6D7oz5pQn266FI1yRaMBj0hK+N8sITlX4BHGiModXKYo1CQjV6CBHt1Mms71YErv
	vjV9O+b1jMtFpy6AeB4pStWiziF2rLXmrVp5m/9zNgPjZQTmqbKs2WqHGI4Cl78KIMfvXEzbJDG
	jZpgGf8gg8UiGeeueD4v0mIFkAeR8VERTFlXLD831YjqY33LCcnZIukwg8hWQs44Lfkj2o=
X-Received: by 2002:a05:6a00:4b4f:b0:833:2398:cde2 with SMTP id d2e1a72fcca58-8352d29aa43mr5125855b3a.43.1777810250423;
        Sun, 03 May 2026 05:10:50 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:49 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/11] iio: adc: hx711: split variable assignments in hx711_read and hx711_reset
Date: Sun,  3 May 2026 17:39:37 +0530
Message-ID: <20260503120949.80292-9-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the initial value assignments from the declarations in
hx711_read() and hx711_reset().

This is a small preparatory cleanup before the later loop-iterator and
variant-specific changes adjust the local variable layout in these
functions.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
 drivers/iio/adc/hx711.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 637114635867..b2de8db285b2 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -159,7 +159,9 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
 	int i, ret;
 	int value = 0;
-	int val = gpiod_get_value(hx711_data->gpiod_dout);
+	int val;
+
+	val = gpiod_get_value(hx711_data->gpiod_dout);
 
 	/* we double check if it's really down */
 	if (val)
@@ -204,7 +206,9 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
-	int val = hx711_wait_for_ready(hx711_data);
+	int val;
+
+	val = hx711_wait_for_ready(hx711_data);
 
 	if (val) {
 		/*
-- 
2.43.0

