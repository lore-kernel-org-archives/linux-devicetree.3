Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296476;
	b=WfHT+fbS8tM/zIzeJd29Bs5NSjRNPwQ2b1W4iM/XV6y4l3b2I9O3wCVJMxGLiWB0EBwX
	 NaWLnfFITVSXICE84VipCOg69gvTZNmgLWLlCrDzrrTW3H1D6BHnLJnPyHI6bIJLT5XHr
	 pMwH02K6Ht8Op4SDkhErbtnV2WhUcVCLTTDyfn6tXsniq/lXl1k/v4PlAdy8hfQiGBilf
	 19tQ37T6+TLm4fUVECD/dOkC9hsBr6EqxsxAinlkbU+zsZWTzR//949cb3WNxgpw+6zvF
	 JqXjuEMZPAgBHMBO4T7bgXrdFSAztJvXP2vPy3c54ZTh97SnYJNjaWofRp3MomJ+KHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
	b=dRVOrfED4w0Xw1jBBRH2/DTuskaW8UtbNMctX7YYsRdsn+N1Cvlu9toNnS7iwL0GQ0pU
	 LE+oq7qbvbw13M/t6HDag/1pnBXjB1ciXR+C8jfNYASApvq4UDhMm1FTs59ZLF95ymCkR
	 rAuzZay9G19YMkxXmc24sMTJMrPvfrOmlxsBitUDvHcLN7Be6IaceAqlEjtyre6QFttWz
	 85xvhmuzAmnkNZNYHAS51Yu8MFVYYu6Oj5WOYtP72oxOUmzozX0UZtdxzJO9vjn/ljIRp
	 WFKEb20t45ylFt2UVEbgfU8LGJiP6OAYGyj5KeomV1kmdD+4/GELbYeZL81Q3104C7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9688606A335
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9688606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=brq69Qmt
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso27727275e9.0
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296474; x=1795901274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=brq69QmtSdY6LvsBGsyCIgmwtJxd4gvXCgAw8iEFSFZES0kqnoRxnN80CAAT4Hb8NU
         OhxM3IqTo2Bvs9qmauYl8MPUocEXyUZApW2LIiNtk0Lg1Zc35ctvcKvK+c65wALwwjj2
         RKFJ7aR8wpjuNXqUwmWtC03DTql1Vx5kLaQadqNb1JlBtAG0Yf+qFMZKEWaH5yp5cz5S
         AVkEMK5EIG3iyZv08sDRjYy/Q81xzgsxDhH5P9Sicu9WA1SCNJgln+wrAj4ZZfpamtLQ
         OCiF0jb+EuM+9GFkf4w4jaxZ35nISU518Y+3w81EZSwiz8/PwHWzKWJfOrXIMh43PHzU
         4Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296474; x=1795901274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vM8WZhbKmN29nQ6mO4DJr0H5CZ8GyUYQkfSPTP5P5Kc=;
        b=uSBKr/dmU+sShqevr1s9bSbGHoHUgXYlfTvC6cUpSwhFXz1+Pwn5/jCPcRZHWeNMav
         y3vKqUUJSSMR8ygtF+QRWU2am3HsJXaW00TpSo+OZkOjiVOdHMV8e/4gRhqjUsibyWTQ
         ez9ezJnWM8ziIqsceBgrYkkZzt9Tb45oBjLDsPCmoBDOF6rSi/1a0YAovqCxo4Ez6Zyl
         DlGHMksEWfkJvrktodS8ZbfWMZRjgWDmme5lvluAZLlZdDwoTKm3NIotrY1178vCt9Y2
         hYbZkDk2YtQlsK9UNAsnsiAa6oBLylSN1XNfGXCgZZSjPvDooXMH9LWsnYx/IgwtJcam
         fhpQ==
X-Forwarded-Encrypted: i=1; AL+hErHMSVTPA6fJhK1PbUnxmqXiMJwoKs0EXDMUrXPl+3583Nnuy6c1M9/u+Wg5n+um63A+60ZdgS1ZcRjq@vger.kernel.org
X-Gm-Message-State: APuU4Z/zfeP0iZBL7/L3mWsdcDOHHsycQjOa9wJlBxnMsSR3luJWhAHn
	Js5/xKNAgDO4qMvXgpifUGmuERakjyKJdlS8Jj/8sDGU4YYg1M3NFAWB
X-Gm-Gg: AZFdTZfVsjxmY4vO4bNI15dxTwYmKvW4sO44JS7Hb5TAXogyY52TCWepntyTCQFxQsT
	sW9mvKcX0Y3vHFhJ5zrHISPqECoZDpfkigST80YKZvPvbYa2I1iWI7cRofY7tFi+Ax6CNPYQa+9
	OnaVd9CU2/XuZAg9L3EVDRW1pNjJZyM0C5XbrD8pHqxX3Wh4EkIaiR7AoeQKhjkL1TAVy9QAs+Y
	5CAd7VPF9bTVPMHiyx6c5oZrGV8sdNpDMNXqQP91DmhoW/ip/KUAfNYFNkN/qfrQ1IknjpjYJ1j
	L329KleQ2gnOZsaEFD7H4fulhxnfJxbN/7fMtayf+E5LmBXxiLe+Cds9dXPCBB6l+zfzmkB4MD1
	zGX9qyaVGSyYF3EiY2e6ZPjbrhfqFJD/wnb/lnEMlYl8X8Nivf5+u+6Hrz1tobtUm+j1jIBqFQk
	E56jXtYkSE1vHAfgbml22iMttOCu4cN/2oIt7mQJjBRagbjdwUFrgj71ZqXBylLiEmh4XbgynZd
	i/y6b/hmPxgzvMg7kXVFqnN3xoEgSyl9g5/ol2jr3VqxW8m2IEHkQY14YM+lSrY4b7obCtiByKP
	EI/ICzX3Jz4WZ2DehJgD0WUkVh8GP2cLr3Tms+82kq6zZ+NNG+bq3ZiGhhvigucUSmaFRUqIprh
	I8BPSvfW8NDqwat/+tbf+cPaTV8ogmfyqMfLhhf3pChHFZOOofec=
X-Received: by 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr157077865e9.6.1795296474193;
        Sat, 21 Nov 2026 13:27:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:53 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v15 2/5] clk: en7523: use devm variant for clk_hw_register and fixed clock
Date: Sat, 21 Nov 2026 22:27:32 +0100
Message-ID: <20261121212738.170775-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Use devm variant for clk_hw_register and clk_hw_register_fixed_rate
to correctly unregister the clocks on probe fails.

This should never happen under normal condition but it's better to
handle these cleanup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b38d7b5dc0ac..9e92586f207c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -651,7 +651,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	if (init.ops->unprepare)
 		init.ops->unprepare(&cg->hw);
 
-	if (clk_hw_register(dev, &cg->hw))
+	if (devm_clk_hw_register(dev, &cg->hw))
 		return NULL;
 
 	return &cg->hw;
@@ -707,7 +707,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		val = readl(base + reg);
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -769,7 +769,7 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 		}
 		rate /= en7523_get_div(desc, val);
 
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		hw = devm_clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
 			pr_err("Failed to register clk %s: %ld\n",
 			       desc->name, PTR_ERR(hw));
@@ -1103,7 +1103,7 @@ static void en751221_try_register_clk(struct device *dev, int key,
 	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
 		return;
 
-	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
 	if (IS_ERR(hw))
 		pr_err("Failed to register clk %s: %pe\n", name, hw);
 	else
-- 
2.55.0

