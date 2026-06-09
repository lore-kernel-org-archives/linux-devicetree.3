Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F343B0AD4
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 04:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980089; cv=none; b=dbmYpB0bDal72iUlXgRxzfiaOvWhLzJYPKCVtBgYbBxe/5g8itVr4pNe+747vHzoXnFOOZDEfQ/r3Zm04uFi7m2kvxwX1ReHrFkwhYxOZAuMmSV8ynjvZd1L+0d+9pD6z5hkNJHtVZy2SIL7+1F1FdYb92ZMc6MIA0XfWjThIT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980089; c=relaxed/simple;
	bh=YyDrdUBLBq9b2tgOr7KWFqA4UmGZ8/EpPqG9WEWTYis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLbeDVsr38YUwPBmJPd6oKrBb+P+UrxtYxMrKntagh5gimmwuBbJdizALFn+9cE274p+lP/1HCMAR/DQPmyUmuU7dqBp+L4dgg6oTaODpRzDKxuXgSAQsaDELZZ4LZsaWNwFVktFYYDftr62ba4b0yZW8b/R826YI1RACb15geA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D+V0JQ0D; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D+V0JQ0D"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c3315c5dso54035335ad.3
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 21:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980086; x=1781584886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+QTRbcmVdI1fYK90qnB4ou4kNd5iswSYfzc4M5l2Vk=;
        b=D+V0JQ0DLMA45PrrUEvXpjMKRk1q9n6NUrbF606c+xIf8aFjbyHaaEQ6UhvCa8wudS
         o3f0BAP2E3pbtz+8rrrt6/3PvKYciKSNNXLbeeQOustIJunIP9+yU4uf6c91ibY6Edup
         EiiV9RulG6ScTLTIxL2zT4HMssa42loVdIkgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980086; x=1781584886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+QTRbcmVdI1fYK90qnB4ou4kNd5iswSYfzc4M5l2Vk=;
        b=Bk6jxrC5IiREZKL8rNy1224Sj4EooCS4idjdAnOp82bz7E2z1UD35CGsVSEptma7Ft
         fsAzh31+lT1sOOMNzPp1NiZjFo+qfQrnJVCi5GpnKrjsyDjWGdjIJ0Mrxjh1Z4d13GOs
         W81MMaWljxpdSi7wBLEThJXqbbqxsEbXklH9d0vm2Lldo4sSbVLI1WGPVbXKPByeM+oy
         n2RfZX+Ed2Drn87X+Gh4lAtF1M+HZ/Ou2V5wJgY7CcqycjzQ83JddAEPW+HmRcG/rqcJ
         BOzWFJme+alz3K4GiDOvg7Gr8teIZvrTvpmAqdXunaAgH7N7sSrTibr4lZAXsdCzYJZg
         Mv9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ewkSh6PWIiAT3cQbUr6h3CgvZZNSvRhHMdycqDMeXSd824MODNlR/zuga4XTpA6VL9Qyi/b0fRg3V@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGkoILzSgreUHS3nzlePSv/UR1rFxyV/By8iMEnqYKY472lzc
	ZjqDftZpScPWEzrBZ5vSn5DhcgXxW0oHCQUgep0TYHdya2RYKJeoPqyQwqfzSXlusw==
X-Gm-Gg: Acq92OGL2SU4E8NR0T9xRs2Hn+L1r/A3y3q/qkkEmbdBgw7QGO2hnAoZl3gEld8iP0M
	puz84Kjdz31Z1vIfoE9RPPJuUBHTwhM+vh4HfdjoYXPebxjXiCVvIJfXl2QY/Vw022TpBbLVjBl
	+eOcmwvQOmUO+6rVbg8ahqj3VDtYPhfshp4/KvpSPns5Mr2pLM1lH9rbWxsLKTBoT05/8UswMxB
	JdvC6LrhgR9Iz3VIxMjCvDMq78asKpLsFpCfQVAvJh/5gSdo3XIf9zLyoB/FBEkHUwG6rfely7l
	CvigBlWHxpeMAmGMRIaOF3tZg34YWY0DPrtvzrxcvEaAvVXiGvenTpud+X0PSx9x4dH0qApat0y
	mRvnepB0h0nSEKxK8WOUbOGiLtDS/GvVhB8sXFhDBTj5E2uVxs10oB5IkpVUypSifCU1/3kms39
	xMGEWvrZvHR8tOOXxqSG+yI5YEY8dlZ5yBjyYmojBRxv1FadHRGferV8YJzrlNKjiiYjHAE0RQ/
	pY8QsziP0XxQTZtinX5zAXzaHzUp3EHYFpBc2aKzU2Z
X-Received: by 2002:a17:902:ef08:b0:2b9:6458:1a2c with SMTP id d9443c01a7336-2c1e820e30bmr230474455ad.13.1780980086496;
        Mon, 08 Jun 2026 21:41:26 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:26 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:40:53 +0000
Subject: [PATCH v4 02/11] HID: Add BUS_SPI support and define
 HID_SPI_DEVICE macro
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-2-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=1402;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=c6BUXxKRAZp/K8L1Tqkgw56/wp/8GYCQXvql08oS5sc=;
 b=QyqWiN5wvJWa+DIAzGfwDwT3/7SoEQiPhD1MUJ5W+zX6UPWtdkUNM/6NIrOZhKqZHvKUaVIHE
 z6+3hgKEB/ECPZ/StEBid/W5+8uPBCG8+qB9iIubXF951pTpnJYNq9l
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Jarrett Schultz <jaschultz@microsoft.com>

If connecting a hid_device with bus field indicating BUS_SPI print out
"SPI" in the debug print.

Macro sets the bus field to BUS_SPI and uses arguments to set vendor
product fields.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 drivers/hid/hid-core.c | 3 +++
 include/linux/hid.h    | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcb..813c9c743ccd 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2316,6 +2316,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
 	case BUS_I2C:
 		bus = "I2C";
 		break;
+	case BUS_SPI:
+		bus = "SPI";
+		break;
 	case BUS_SDW:
 		bus = "SOUNDWIRE";
 		break;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index dce862cafbbd..957f322a0ebd 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -786,6 +786,8 @@ struct hid_descriptor {
 	.bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
 #define HID_I2C_DEVICE(ven, prod)				\
 	.bus = BUS_I2C, .vendor = (ven), .product = (prod)
+#define HID_SPI_DEVICE(ven, prod)				\
+	.bus = BUS_SPI, .vendor = (ven), .product = (prod)
 
 #define HID_REPORT_ID(rep) \
 	.report_type = (rep)

-- 
2.54.0.1064.gd145956f57-goog

