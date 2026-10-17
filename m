Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F947CC8C
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246125; cv=none; b=rvbnJhjEMBF15kf5YzbmBxosdkaAMO9lHP1wXt/SWIxkwrbS66auB2U2VXpOy+nKrE6lXfiNouJ6rF5++klewC/Y/8sYBJdvK6+i8kblh+EGuwDYVFm8M72c087ToPCKkowqThkhc5dWJIwLUKkjs4njCtiu8jb3lbSlqNUFJ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246125; c=relaxed/simple;
	bh=baFpLjnTskatCXH5nIOz3bhNyATV82dn+7vltbCAXcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhE9Fp6Tl9k77J+6Oie357Yn15wOmuPfVkHYQAfPD6jqgpi0TifTCJuV++dexPnF2mT81Co8Mn23kzOcfh61pIBZRJqHS7zIZfybXe17kWFxPgeBz/jHKzqyEPKTmB5QbKOfDnkcWm4OPwGuLP8rh5kXjxJmBdX02MELS4mxsfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbZ8CXlR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbZ8CXlR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so9901375e9.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792246122; x=1792850922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9YVPWXQ1AxunRapx6pi/difSuiJYO0pfCJBVjjClPo=;
        b=XbZ8CXlRgf5AnuuKVrKEyV9h70xYDxsTaw+VlT4EZyl4/ljs7itsdUmFgOSz3nic6a
         tZxkBpsuxX0z3oUkZY+hkqxoDnO7L07jfro43RZeOevUUzB6keN2tCZxAo8QLxw1/G9w
         CrsDEvQcsQpSTte+rSWyLJhzyK3+fKPRT/j9KBX0Z3YSQx8ji5LUW1Hi9ZeJUuAJYBEl
         HdBEmrXEZmZV4xEy81OcE59GVa2po9/NMnZEuvsCkTHDhlOPWZNt1b/UC4+x8qnJHG1a
         0Qcv+psF2N/sDnP17ytqIohGea9VfCsH45amFzNJPS6Gb5GrILDh5Y/9Mo3bKW8lHST/
         /O5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246122; x=1792850922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B9YVPWXQ1AxunRapx6pi/difSuiJYO0pfCJBVjjClPo=;
        b=Nci5KsGLVXc66hMlxCPAaNOLVz1vKRohXX3Dc0kj8W6lSwG95c2R7acnjcAP2pkoiZ
         0W0+K8McY0uvJtYk8TRDY2Q1ia+qkqbgoPKI9lic2LiSmmkxjkHMF6bd3sEgyKukPAGx
         GYEdZ7YU93YTXoXb8zwJRD7CLZ4yeXtTSb/mhDGW0GKm/mF7roJyKxD9/1gaKAhIan6u
         wpTWhuCe9lVqsM4W0m9pzZr08z5128QExvz7dVQg9PC+BMCVC3ifyqp/XMqnMwmeZJjH
         X1jL9AhqN4y840D2LxSFJBMy5J5yXwcdsKh1wewlA0dtns/U5r78lwjPgnQgD2JAVALM
         SchA==
X-Forwarded-Encrypted: i=1; AKwUvBz1indGdud1cfKipT/pLILckaon3qsE7T84hJALymWn9p0HYMbjuyeqkGconE8pBRLnlxuYlHP61mez@vger.kernel.org
X-Gm-Message-State: AFq9FYKqvUn9T9RJeHggkP7PBtw5JXILbQTFNX/ha9LKJKxk+Fzx1tNl
	RGbRYLBRKKZnfZxx4W7w9rIy2wT9dietdqe8ZImKHpzxlPgWyh7gY6ep
X-Gm-Gg: AYBFou33UKPY9yY4r41sUotQKBhBA2bzYerYbkHL9def9YBFdM4lx91Md/S70oyS+b3
	MT+lNN8GQGvqfSJMApE2DYlRq3z5xsYI14/BUgDxGMmREurWBrbVlnzdJfp7TzoaiAmAWJwJkPl
	4JyDn1Jpy1cITaOD0rbTsflVNqiFH+b3YfBKENTabNPKx6n61J8ISE0Rhn87bfYAxeDDycWhnvZ
	Jl/2R6VztMiDqUrCmNomA5JGhA2r1IsF50eIu2+TNZVTQ7MCVXQImVs68AMINUz1Lbmn3vFVGw0
	YQJ7fTvA9gUs0iMrjw9b5d6MfBHnec7t2nyWGn3+6mrT2O+InJ1YRbwLlWpSJ5eeAzMYdj5WhmW
	pwKdMWJ24o4GMIQxPlDJlfhlZIHFoo/H4ZOpwpaeA5u6Yi8GZ2o0nvFXht726TeZb6X90L3zs3d
	VCWjIA9KulL9EnH6VRZbwKvnyPTJg4FztmoMKI0fKUqS07EfQhDD4WwVSAyj5lkI/bnFVCLfgpB
	wgH4TMenYLZldvpSXSSr0e6sqjMsTbao7g2ldgfWWlmmS6yhsvcla6prLUq6hh5G1L+3qRA4R9Y
	6w==
X-Received: by 2002:a05:600c:8a0d:20b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a1d7616d29mr40954785e9.23.1792246121666;
        Sat, 17 Oct 2026 07:08:41 -0700 (PDT)
Received: from machine.home.arpa ([2a0d:3344:57f6::1046])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce3302b5sm84430745e9.4.2026.10.17.07.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:08:40 -0700 (PDT)
From: Luka Panio <lukapanio@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Luka Panio <lukapanio@gmail.com>
Subject: [PATCH 4/7] Input: edt-ft5x06 - allow a chip specific touch data register
Date: Sat, 17 Oct 2026 16:07:52 +0200
Message-ID: <20261017140827.290666-5-lukapanio@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017140827.290666-1-lukapanio@gmail.com>
References: <20261017140827.290666-1-lukapanio@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The generic FocalTech path reads the touch report starting at register
0x00 and expects the points from register 0x03 onwards. Over SPI the
FT8722 only returns the report when the read starts at register 0x01;
a read from 0x00 returns the static register block instead, the
interrupt is never acknowledged and no further touch events arrive.

Let the chip data select the register the report is read from, keeping
the points at register 0x03.

Signed-off-by: Luka Panio <lukapanio@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 6 ++++--
 drivers/input/touchscreen/edt-ft5x06.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index e57611e48217..7bcc48e07d62 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -149,6 +149,7 @@ struct edt_ft5x06_ts_data {
 	struct edt_reg_addr reg_addr;
 	enum edt_ver version;
 	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
+	u8 tdata_reg;
 	unsigned int crc_errors;
 	unsigned int header_errors;
 };
@@ -1037,8 +1038,8 @@ static void edt_ft5x06_ts_set_tdata_parameters(struct edt_ft5x06_ts_data *tsdata
 		tsdata->point_len = 4;
 		crclen = 1;
 	} else {
-		tsdata->tdata_cmd = 0x0;
-		tsdata->tdata_offset = 3;
+		tsdata->tdata_cmd = tsdata->tdata_reg;
+		tsdata->tdata_offset = 3 - tsdata->tdata_reg;
 		tsdata->point_len = 6;
 		crclen = 0;
 	}
@@ -1244,6 +1245,7 @@ int edt_ft5x06_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	tsdata->max_support_points = chip_data->max_support_points;
 	tsdata->boot = chip_data->boot;
+	tsdata->tdata_reg = chip_data->tdata_reg;
 
 	tsdata->vcc = devm_regulator_get(dev, "vcc");
 	if (IS_ERR(tsdata->vcc))
diff --git a/drivers/input/touchscreen/edt-ft5x06.h b/drivers/input/touchscreen/edt-ft5x06.h
index 7eaeb562d11f..c55686e288b6 100644
--- a/drivers/input/touchscreen/edt-ft5x06.h
+++ b/drivers/input/touchscreen/edt-ft5x06.h
@@ -18,6 +18,7 @@ struct regmap;
 
 struct edt_ft5x06_chip_data {
 	int max_support_points;
+	u8 tdata_reg;
 	int (*boot)(struct device *dev, struct gpio_desc *reset_gpio);
 };
 
-- 
2.55.0

