Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A855B3A6F1B
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040414; cv=none; b=A6t2zb//PRKS4aLW2szYSKFKXx35wZFUOHWkwgzwVAAVgJk73L+qifwkOvguSXwWyfNO1SNXGOb7S5t/wkABdFYwdOC27awif6/Ti1WC2pa6EsSKNCu0NBx4J+mNAYlR366ErpGZgdVydxrmxkuf0IbL7JGKFZ4IUSetQ+tNeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040414; c=relaxed/simple;
	bh=zoMfMXQWJIM3HEr/u2+8QjshJpYaJWozbvInBUqnoEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rN65SHnIwnpLc+RVoWHXbpOfES64VOvMv91PBOIxfekhbYJJZi/AYf53iX7ga4lcDL4t0Z+y2aXLKAo1u/yquuDIBYhZTXA3M0USxJ3O3q/qGbP0K2NEEwPMwXeA+dBUBLjnV36oOKQ7LqEJeAyaRpTAFRyN43OftkiiAAyNUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lacQmNx3; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lacQmNx3"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe2d179e2so2825563f8f.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 01:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787040411; x=1787645211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmOA0dUy4iPUy3GXyYFTKqQUYL4L03dnOD0Ttu1y9OE=;
        b=lacQmNx3GTojMA0RRI9CuES6N/5og/1ZUJnfikLi5lHT1mLEEQ43iVvaaFd3ykxRMR
         S1FIUuOYEjiwFmAL2WLcTFcfzVReMK4P/eEdvsBOP0Hkq0fBsPZy15rf2Rwgr1Wk6SiX
         gX/PBNTQ3U73OFE1/eGw9AD16U54ZDlyEwru8q7DYFCnLQ8L22+DpqOjezv03m8BgjWB
         Wi/eQs8UNV9bWebRu4BU8NvMnvBKdu1D7Eum9RdUAf6TcTTycbfCOx2lCzhmNTXotzbu
         JBbuhupfbNyp01215hEgPpqTCcs0CmO+DV6W5qaifyafmjYHH+sJ6wG/qczfDsVqXjis
         oo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040411; x=1787645211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmOA0dUy4iPUy3GXyYFTKqQUYL4L03dnOD0Ttu1y9OE=;
        b=WVIEwh7TOan4kPsFxw007TYDXYW/Tsi5I2OCaPJJ91PUdWeTyvoMNrk3DW7lU8+XO4
         v+3K36CoYahdN13KKCDZO2KTGgm6Q3K9LifjhV7SN8wejs+A3VzLNBwlxYahixhq5/oy
         EvJIHmxKOZO/K/hz+ApfH8yaUM3m4ygiNBn72AuiyaG8PE9VH+ZxF/IBqIs2FO+voZps
         bOFI+7qYsxWOxypgXiIEE6TG7CH+oMHl3GDfYT2SQHKJ20u2OGWuzL0qJNlhsx9aGBGf
         tJnV8/UyBpskrMc5lKllVufDPYCkxA8kQ3uVkjWppqgLcYxKC3Yg/5DicaI9x40V3a+y
         wjgA==
X-Forwarded-Encrypted: i=1; AHgh+RqQxJ8ELvmKm59yUgxU0ZJgb1upN6fLViio1D8RtzeE2hs5wJ3b5tV4qpteQ8D4f/iEFGPFPr3limTp@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZS2F7PYeHLjiamW/UlRw/jjL6IiNPmPAnuhQWNgJdoQloaHh
	Hh2Edy2gQQs0jmB6JCQ77/Qwlc8OhwP2j6RHjKArGCNCsDGOO5+M4Xc2
X-Gm-Gg: AR+sD13tN+ygDi4MeaLtl2X0Qbkmy6XKOT/ap0Bo0KBf23v914vPZNl9Dg6QrPDAour
	UVHJxehLPLezgJtlMAUExoWqVhgrWlQZHQK1phqZlfJ8kpWAtdksdJWAmQTnqbTmN2VnZF9WWtG
	qGi+uCJjzALyGxyM/oz7k1xPDir3iEwKgY2WlRgc+ubywtNGO7i3lvUNYjujB/UVViFKzcLsMLQ
	gukwIiobMiLZvZxilKsd3W514wGlKGhyktYoeKTmDFORDyIGAfaEFIvC/AAk5Fkm79aoKpouqNx
	6OAFA8g0SugIBO1Hfd+a39Al98tZPiSQV1kByt84L5EXYzbcC1LaSzyIAXzsrADjrp5b7sIHBk9
	3VlhdFLhHcR/uN3uMSfSnkiyouev5NJsbsAPmTz4Xp3flLlqm7ap+TO6WaCwGmiSWQSZ4CcXkn8
	w0o43GnpW+SpFyoBZ57T/25B7YmMQQHYhBx6DgXgIFqZfSyBZgspjAiSO/id7p
X-Received: by 2002:adf:e18b:0:b0:481:568e:11b5 with SMTP id ffacd0b85a97d-4816070fc33mr53173391f8f.5.1787040410813;
        Tue, 18 Aug 2026 01:06:50 -0700 (PDT)
Received: from anthony.local ([2a06:c701:9cc4:c200:33d8:8ea2:e077:ebe1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b2e9sm10367223f8f.9.2026.08.18.01.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:06:50 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Fabio Piparo <holofermes@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v4 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on top of ssd130x_write_cmds()
Date: Tue, 18 Aug 2026 11:06:25 +0300
Message-ID: <20260818080626.30430-6-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818080626.30430-1-amit.barzilai22@gmail.com>
References: <20260818080626.30430-1-amit.barzilai22@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ssd130x_write_cmd() and ssd130x_write_cmds() each carried their own
regmap_write() loop over SSD13XX_COMMAND, differing only in how the caller
supplies the bytes.

Turn ssd130x_write_cmd() into a thin variadic wrapper that collects its
arguments into a small stack buffer and defers to ssd130x_write_cmds(), and
move the protocol comment onto the latter, which is where the loop now
lives.

No functional change: the bytes sent and the bus transactions used to send
them are identical for every chip on both the I2C and SPI transports.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Amit Barzilai <amit.barzilai22@gmail.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 65 +++++++++++++++----------------
 1 file changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index a229d7a87da0..61187a630a0d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -258,41 +258,12 @@ static int ssd130x_write_data(struct ssd130x_device *ssd130x, const u8 *values,
 }
 
 /*
- * Helper to write command (SSD13XX_COMMAND). The fist variadic argument
- * is the command to write and the following are the command options.
+ * Helper to write a command (SSD13XX_COMMAND) from a buffer. The first byte
+ * is the command opcode and the following ones are its parameters.
  *
- * Note that the ssd13xx protocol requires each command and option to be
- * written as a SSD13XX_COMMAND device register value. That is why a call
- * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each argument.
- */
-static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
-			     /* u8 cmd, u8 option, ... */...)
-{
-	va_list ap;
-	u8 value;
-	int ret;
-
-	va_start(ap, count);
-
-	do {
-		value = va_arg(ap, int);
-		ret = regmap_write(ssd130x->regmap, SSD13XX_COMMAND, value);
-		if (ret)
-			goto out_end;
-	} while (--count);
-
-out_end:
-	va_end(ap);
-
-	return ret;
-}
-
-/*
- * Write a command byte sequence from a buffer.
- *
- * Like ssd130x_write_cmd() but takes a pre-built byte array instead of
- * variadic arguments, handy when the command is already in an array or
- * when the caller wants to use sizeof() for the length.
+ * Note that the ssd13xx protocol requires the opcode and each parameter to
+ * be written as a SSD13XX_COMMAND device register value. That is why a call
+ * to regmap_write(..., SSD13XX_COMMAND, ...) is done for each byte.
  */
 static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 			      size_t len)
@@ -309,6 +280,32 @@ static int ssd130x_write_cmds(struct ssd130x_device *ssd130x, const u8 *cmd,
 	return 0;
 }
 
+/*
+ * Variadic wrapper around ssd130x_write_cmds(). The first variadic argument
+ * is the command opcode and the following are its parameters.
+ *
+ * The arguments are gathered into a fixed size buffer, so at most 8 bytes
+ * can be sent per call, i.e. an opcode and seven parameters. That covers
+ * every command this driver sends through it. Commands taking more parameters,
+ * such as the grey scale tables, must use ssd130x_write_cmds() instead.
+ */
+static int ssd130x_write_cmd(struct ssd130x_device *ssd130x, int count,
+			     /* u8 cmd, u8 param, ... */...)
+{
+	u8 buf[8];
+	va_list ap;
+
+	if (drm_WARN_ON(&ssd130x->drm, count > ARRAY_SIZE(buf)))
+		return -EINVAL;
+
+	va_start(ap, count);
+	for (int i = 0; i < count; i++)
+		buf[i] = va_arg(ap, int);
+	va_end(ap);
+
+	return ssd130x_write_cmds(ssd130x, buf, count);
+}
+
 /*
  * Run a packed command sequence.  The format is a flat byte array where each
  * entry starts with a length byte followed by that many command bytes.  A
-- 
2.55.0

