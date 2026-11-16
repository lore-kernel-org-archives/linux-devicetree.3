Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870011;
	b=ZCskh+xZsxFvHQhoonhpXfABLJxXVTnND+NjqxF4+8/SIpyzQ5OPkAQH6fcWf0ubPeLR
	 IeKL++SZiyUyUBn2j7lNJOu9EA9dekeRzFivM+eZ7zl7rY2Fn6Q41MFqoRBnevmAh1YN6
	 T+Eox6Ps0soxxdjnR90/YFMIap9EZhLv6hDW2cQk3TFs9xgvI1EpAziIpMOqkpWnjUNhL
	 iDg92iUuyMQWa+rnP1DDn1Jkak+c+tlrHQg0A+/QqSOn8aWPnOCtwlADWQOIO+fiEiP0w
	 lTbqLu/a1w2hE799nDt3m+NDEj3Q6cSo2mD9MDFyt/dtLPokO+sa3q1kOxBAR9pbA9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kUfZcKKb6bnahPacDlI0TXHO5cA5YvJ416iMFlw6i3o=;
	b=uCa+6ooQ+T+XpCwu3a7D2iAv+9w07CJxu7XZPL0JpqxFsTToQkPvxM+uxITUVY2EVupM
	 R6giOtNH2C/ygrJYZ4J02+6uQg7Fiby+vNJYaL+46c3zI55NEprMX/aZ9ySnEx4R8YFHd
	 K+BfZ1lxPpkgnLHwuWlOhXaH0pHEWuz1tCdzUvZuzNuPKaxm2H9XYc3qBOeu12eOlPS79
	 WTjPl9qCEug7HFIk+Nhoqj3qy5ubQU5hng8oxOQ+N9JG8K8NlxBz87szqNg/ztQP1XkWu
	 AwLmSTCK3APjI3PEBhUeAcAPHS1o6AGvILePIAWosoSosXBStBgwL0T+2KEEeFlhrEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE30606A899
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE30606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4e2ec4b42so8969257b3.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870010; x=1795474810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUfZcKKb6bnahPacDlI0TXHO5cA5YvJ416iMFlw6i3o=;
        b=o5xUpC/2bb8sdxVtHgM1XSpN3Q3q8SfuhyWQZ8Sq6dLNf9sTsnBXuLLhU3Lem7kfyy
         ouQFoJXvQYoowRs79ikHeOfSZOulxtKRIbOYfuzTfa+GN0tXor7Y2HPH5doPrMoOps4I
         +DdJLUDMPlDLI1RPUni8veRZVSLcXyT9bKmYB6jkqXmO9q8b46xYPpOii5F7g1CBpiwb
         yhnzPS3pA758KD8mcwIm2GoKv8BDGkw7rbDlH+8CsCfu1YB4Ga+jh2G8zWH0lPmeHiCo
         AtggXWBLo5qJEruG8BVx/92WJ7yiYuCWbnAxxWEeYfn3dfZoZXFqtPrggE+1WGh2msIx
         vrcQ==
X-Forwarded-Encrypted: i=1; AL+hErGSnJTaOrcCKmMxja9fQFRZvFKzE7EwAjTdxSG31ZQVZdZOfnm30qDYFrgX8gAgjnpipMCqCzP3EUAj@vger.kernel.org
X-Gm-Message-State: APuU4Z89/69/hUlXKpYtCzXH4eU1Kf65sptq2XGmGLURL4cOaY94kT9Y
	sI7nKtYehxh9O0ze1+Ul/I7Hgcf6CsrDR79zR13v+xqBia4OrxHdTbhc
X-Gm-Gg: AZFdTZe3Rxm/PpYtYaRazx5YjppNqcNazQ5/GsBV15uM2TbWPHy9vh2uMCoE7yDfIiF
	WvdKOPt/YK5MLcTvKOw4OoWwD3Tfjbq9DyLv8ra1RxeLPP9hn7Xv0lOxpo4TBstFpOL6bHjv45X
	0WjSmdbRpkG8lu0inBR20olaG2GYLBxpHZJY1zAdgZK+KcNQbb6BIyK3tcK9S2H0LNRZ/2dSrzF
	Q6tPegUXov0txUHBtW5IUB54cxyS49MMu1OcCdtrWJMNng2XdzATmCPi8P86DzCyZjTmXtsOFsu
	tLVj8AjCrWPANU/ZvOKIObhnINoQfKjGsHH0PRLk0w6U7B+5lFqtEkYKFi2eUCf7L38xwL0LIUa
	S00yQmIEHsjyMgQuBGqt94c1/O/mcxvo1uZ/QXICkU9WOX3F8U7t44k7bzlywJndxJLLByjbcCf
	klDy7eL1vkFq7QV6CTZwjAI6E4WztQV+dy0CqL656HBVffTe03vd/6AG3qfF23zaGgq1WcMHoDS
	meZllrkzfVAOlCMSVeNRuy37Ol+4zTNEmZ3QNFLzyL4pTPoO7Iya89li0HZ4pKVVR595/kQruYP
	B4nwnmWK6wi+8UFXz0ktKNWdXn0V6L5AKZqYTTUu9FyJCxDBJqLfm4nWK7pO+rk1uzwfYcd8gZK
	dFVSg4KfXKpt4m0zPojihRi43ZAAxX12KtHc=
X-Received: by 2002:a05:690c:c510:b0:8b4:dfc2:bea3 with SMTP id 00721157ae682-8b4dfc2c23bmr18799997b3.50.1794870010106;
        Mon, 16 Nov 2026 15:00:10 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:09 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:51 -0500
Subject: [PATCH 2/5] iio: potentiometer: mcp4018: Report the available
 wiper positions
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-iio-ad5246-v1-2-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Implement read_avail for the raw value, as ds1803, mcp4531, tpl0102 and
x9250 already do. User space then sees out_resistance0_raw_available,
and an in-kernel consumer can learn the wiper range with
iio_read_max_channel_raw() instead of hardcoding it.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index b10b4b920dc0..53471bd24640 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -49,9 +49,12 @@ static const struct iio_chan_spec mcp4018_channel = {
 	.output = 1,
 	.channel = 0,
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 };
 
+static const int mcp4018_wiper_avail[] = { 0, 1, MCP4018_WIPER_MAX };
+
 static int mcp4018_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long mask)
@@ -93,9 +96,26 @@ static int mcp4018_write_raw(struct iio_dev *indio_dev,
 	return i2c_smbus_write_byte(data->client, val);
 }
 
+static int mcp4018_read_avail(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*vals = mcp4018_wiper_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(mcp4018_wiper_avail);
+		return IIO_AVAIL_RANGE;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct iio_info mcp4018_info = {
 	.read_raw = mcp4018_read_raw,
 	.write_raw = mcp4018_write_raw,
+	.read_avail = mcp4018_read_avail,
 };
 
 #define MCP4018_ID_TABLE(_name, cfg) {				\

-- 
Git-155)

