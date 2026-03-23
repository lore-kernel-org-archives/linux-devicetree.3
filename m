Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0413B38A4
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283024; cv=none; b=QNF4fdWkxyArJC0uTJ48mXN50ZaUK6GIJqSiqX2+z8ct1HOOUXpdbUEbP4I+0SVEA7ItEs+j2zK/A05miGDDgFMH755SkGuQ/qcg60fgG2yJLTBmIZ8hcm0eQ6n0Uh/TLvikfcSuJ7XYZ3RCYx9whVvTOTVj/EPGAPYxBVQJrik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283024; c=relaxed/simple;
	bh=ap0TrLyjgL2sHrt4HcatBHHq+Od3Rz+PN6mfF8vT6OQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o9uxxU+9/fqjByvnE+OnMRgOydx+KK8ZubhfYhUiWc2w7Rrki74MPfkjFJLqp0w4XRSjktCh7yqrzQGwwA+niP9YSIsE7WDHMzWXQVLssKE72h17sKlU/F+WeInPSR1Xg09ND3CtRm8yYFGH0MzWlBnbtRDSx8Yz08kTQP8dYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2pazn/u; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2pazn/u"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c742882d2a4so1262622a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 09:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774283022; x=1774887822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Yg9JRwDdYyi8Z4scqEAFpoKv7+Tyn3lIsspw1t1xcA=;
        b=e2pazn/uNF5OhsY7oG3bS0ui08UWYHaza9ImGghm7v2B/+x37H5dEpYDrqVa5LDxis
         0NbI8d/Ryd9Q3VKx85OOVLkbwwSSTy2RE/QJSB/b5PPt+eUR3FX+Qw3AGrIjUcwAH8qU
         1tHEBdamFJBjUza2xe+XsZ2N5rpJa/cUuWHobXVsraTPlhXvXMXf3oKLfhQ/+ambIGo3
         sk9IDt3jT8zWNC7kKLt39Vw19QT3M0tOonK+29+UwQgUCa5UW/a3PStOgOM+E/V+8hwz
         NUUB0/o+Z/smqW21cLhEVp13eY+2kIAnoloh8CnGxdMwNf6s7uLsKFHs6W9KjeYY9vPq
         aKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283022; x=1774887822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Yg9JRwDdYyi8Z4scqEAFpoKv7+Tyn3lIsspw1t1xcA=;
        b=P0+cR7DoXfMUlpF1s+1Iy0182t0H33VaOt1f5wN5O/I7OruXsyqZb/MZZbVTAVw5ek
         UYHzcKZKJrRSjBvdROKmpYmYf7mT+9rVW5ATnoN2p4M3nE615sIok4Z57mbwq4dZMEL9
         7nl7m3Wun/GyzPNwogySOnXG2baQrIpABwysPlzuJXDuXxUPCAqu6UMLPCBYbzskNnJA
         vf21skbCgHMEap9nR1gIkF8xFRUJUlKBt42r51uf20pmxacVUOwB3wRj76BGnwbxbQUS
         +SHQPPFnbVPQBJscnEuPq2RMw5AjJyMqEuKUkj+1GU++AkmW6fU7uZEufyQw+wOyBL0K
         avMg==
X-Forwarded-Encrypted: i=1; AJvYcCWyPiut488H5Role2tN8WY7JXeXneMc9b6sIr6mAX+960xzmbqs+OiGMMtLlnW3rpe3rhX9F4UuCZCQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ROUlVof5DiIES2lTDhkVaJcRT+lqwuhG/5On+AEjZl1HSKC4
	w5O2k1y82jCZ2mqAhhQtbdmJqoXhfRzlTsSzev+3MX2/Zjyhz/MSveEL
X-Gm-Gg: ATEYQzw3kElcs4QYo7Dw/+w0UadklaG1Vr8cscJuRW+Z7TTkfPYtP3xrLs/fMgSy9t8
	p3GOqNmoNZDeU79V1RQ+fgS55ngXNSt19mslBLOoJdI69qb0hjQrTM8XB3SKYuNnqsb7Ur/Lrjt
	VCoO70XxgeLAKdoxfduoUpCja1EcjTLytBZLiElyaM6H3opKR9+Xm7ZSo6yRZRSicEvkOfHr4Yv
	v9hB7+aWuHxz7/W435J0mfOSxC4Hs3g4+jdWQG7X0eEYfj0VXhA1QmHRgEsDz6ECo8/Le55hTAJ
	Bunisl8kYrHe/OI6DntSp8b66FzJBhD5rxt214clIQUVsGGGop52I0buzAzoqwwU6PN+3R7Xiry
	avW+D0b6WRVgxm08DY49tw7/5DO6JHbfJALmBFxMq0XFEjkXOSmiYGWThCUhi2NQxL8EBxs0Sm7
	50bKdJHEgRYRSVwzerqqnSOWElKr3/viX50DIs+7lwzr42Zzzg2O/rXLgSoVCRH9welD72GVt+2
	lXu/jYFOrBA/Wwlkq/ikU4Dz/j0Lh1RqgRd1EUc5l2Yi2gSPsdC
X-Received: by 2002:a17:902:e54a:b0:2ae:825b:49a5 with SMTP id d9443c01a7336-2b0825bf592mr123540375ad.0.1774283022083;
        Mon, 23 Mar 2026 09:23:42 -0700 (PDT)
Received: from lakshay-piplani-HP-Pavilion-Laptop-14-dv0xxx.. ([2401:4900:81e1:cdf2:5b00:592f:5488:918f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516cb9sm118477755ad.2.2026.03.23.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:23:40 -0700 (PDT)
From: Anshika Gupta <guptaanshika.ag@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: lakshaypiplani77@gmail.com,
	Anshika Gupta <guptaanshika.ag@gmail.com>
Subject: [PATCH 3/3] hwmon: (tmp108) Add support for NXP P3T1084UK
Date: Mon, 23 Mar 2026 21:52:52 +0530
Message-ID: <20260323162252.15508-3-guptaanshika.ag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
References: <20260323162252.15508-1-guptaanshika.ag@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NXP P3T1084UK is a ±0.4°C accurate digital temperature sensor with
a 12-bit temperature register, configuration register, and alert
functionality over I²C/I3C. Its register interface matches the TMP108
programming model, so the existing tmp108 driver can bind it without
functional changes.

Add "nxp,p3t1084uk" to the OF match table and "p3t1084" to the I²C
device-id table so the driver probes the device via both devicetree and
board data.

Datasheet: https://www.nxp.com/part/P3T1084UK
           https://www.nxp.com/docs/en/data-sheet/P3T1084UK.pdf

Signed-off-by: Lakshay Piplani <lakshaypiplani77@gmail.com>
Signed-off-by: Anshika Gupta <guptaanshika.ag@gmail.com>
---
 drivers/hwmon/tmp108.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index 3ea5f6485744..db46961a31d3 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -538,6 +538,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(tmp108_dev_pm_ops, tmp108_suspend, tmp108_resume
 
 static const struct i2c_device_id tmp108_i2c_ids[] = {
 	{ "p3t1035", (unsigned long)&p3t1035_data },
+        { "p3t1084", (unsigned long)&tmp108_data },
 	{ "p3t1085", (unsigned long)&tmp108_data },
 	{ "tmp108", (unsigned long)&tmp108_data },
 	{}
@@ -546,6 +547,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
 
 static const struct of_device_id tmp108_of_ids[] = {
 	{ .compatible = "nxp,p3t1035", .data = &p3t1035_data },
+	{ .compatible = "nxp,p3t1084", .data = &tmp108_data },
 	{ .compatible = "nxp,p3t1085", .data = &tmp108_data },
 	{ .compatible = "ti,tmp108", .data = &tmp108_data },
 	{}
-- 
2.34.1

