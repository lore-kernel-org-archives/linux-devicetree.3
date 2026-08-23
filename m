Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9313C4B93
	for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787484049; cv=none; b=dbez6bNeshYhTd4SPqLPBVXrPpbwSTozovBViVY+7JjP80fcwrht9Z2v7uujcOMiZRln8dQALH+zCw68g5Ue5aUAnYcNKqKJEsg9kw21ih6eRRMTHpnRDrvTO09FI9bcBTE/b3uV+e9pwTkLXFm++bH8sX6N38vXo6evsoK3Nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787484049; c=relaxed/simple;
	bh=YCQmStD21VL0vqDdwDJHRxmOjVQaOVxz/3cF0MNYmpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8mrXiw+9TZTkB2Tggv1WZ2SfowFWBD+sY9QTcK0Ds6e7JYSYKotT+YZAfPcsxtUsSGIwWfQ2qHI5+MbHFQEvI6WsM7ksZwETg2z9x45Fl9/M3lhZ1rVnfou2sRZF3HSFm8PpqL9vpXQkGm7ujPPJPGv769y3+PJcyJ94d1Pdek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laa0mM69; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laa0mM69"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so3819023a12.2
        for <devicetree@vger.kernel.org>; Sun, 23 Aug 2026 04:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787484043; x=1788088843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZlvya7+gytEhYd4eQsQn/QeDP25uctPqe5cmCgXCPc=;
        b=laa0mM69fk2brvxJqlJEZi5ns5YnuTVYo0/E4S+Mj+mVaXNdu/0SpWpgSUn7rbUZ6K
         Qtr8io+RbsE5XWHscBdkH6ReMbQR14vAdegAn7vMRS23O8KqJgUe7KJmjMDXV1tA0l4i
         Uj9CWd2BMokvUtfSfCdcKrHGps+kJjx0HacFw1Tu3TlSTcLmyEVWAeomYAhrdr+rGsVB
         3W/GVAtV/k1OAUolrp8IC7Shi9gNiqcUdr2bKnwy1YHB5fZxkFMO5R9vfw5wzShqHrDH
         Xrzo6OC8hN0/1Awz/UeoF+2PTG3fskSksMFubp7Wubn6BVHWe3I3jSxGUzl1iPFVql4H
         Dg1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484043; x=1788088843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZlvya7+gytEhYd4eQsQn/QeDP25uctPqe5cmCgXCPc=;
        b=SumvS1Sk0PrgKs7YBNkUwMnV4kVr3NBGukfQRI5MabGxtu4IaCK2Rz58U8RRYj6qIe
         SmAbAYwpQD6QZXFNq/CjEMCA+K+A3yrmp7unGJOYhw2iRruudUAFW3k1WtamM4ErBEtv
         i8Uw/lRTWvBKdbPo4uKfCturygeARsWENVKK2nLEoi5+a+rBtb5QAc58ZX2qtTbzNbru
         bu3ychQpb8gF1CbWHqMJg2yK+VCQlja0ImOfO9LHMyxseI1mvkpVTzDT6tR1XvIX15Fh
         mzbX1H4oQ4gWZenuihKgXp4UR2mCT9wPisD1DvdenRP+y22hOrwoLf0Du/NnsfxigeXF
         Ur9w==
X-Forwarded-Encrypted: i=1; AHgh+RpRvsn46RgHZLjvhwyIDfVSMzOkE++zxQ5Jo06ahlluFBiuAzcErKD21hbMiFLFxDXHMgoWsNTnvHtQ@vger.kernel.org
X-Gm-Message-State: AFuF++kTl7dOisJ9u71IgARh/5o/OH6vwjJ7AkrHClWoDyJ5mN2m/0kW
	dvr3dr+OyGeLaxD6KVeoBjZCrZRiWPjZjFpzbDRut63VXuzLG5dgbAPm
X-Gm-Gg: AR+sD12CQ8c3RebDDRhRYfi17MMVl84xtTP8I3yKkejzqhHPvI7h8gfwI7mitNHTRNp
	IQ1xTQsgrTh40lVhcMWmu0RAL3CI3XG3H1TTp5K2lTxwXqbwXmfSKfK5eEnjbN3L2fsxQb6cf8S
	RlccfBkvgtdJNKOHHcfCd2aQdKeu2J4uB2TgX3wVQ2mMVUHbdUXMLj1Z5S1jCen5u8PQvxa3dP4
	eiPqdhBSk6HHYGOMbioeOGkTvPKXraZwtxE9yoCxRTF99Gnv37aJ096ZRIUAQchGOuXFdJGolpZ
	AWyUs+RpDX6p9/68/g4GGVXST96EB1Cuz6VNHzcCx6nimv+D9kwVY3QZU1xbYUjYIQi0DgN97pm
	Om3EO48idN/5FoDgFzX2Ie5/I+IY8R8FesDQFXw5UDSLlanGa8A2EgWeEV0BJFQj6ftfBN7dG7k
	qneu862SvSX/yNkng7mHMESKOIyBEmXhIG7/OhwHNvbDoRRGeLwW2L8cWJIVDDFQGCMg==
X-Received: by 2002:a17:907:72c1:b0:c24:bf0b:6b62 with SMTP id a640c23a62f3a-c24bf0b6d6fmr40013866b.4.1787484042903;
        Sun, 23 Aug 2026 04:20:42 -0700 (PDT)
Received: from thinker ([2a13:54c2:f000:e268:6d0c:d746:2b12:231f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f58dfsm707233866b.38.2026.08.23.04.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:20:42 -0700 (PDT)
From: Amit Barzilai <amit.barzilai22@gmail.com>
To: javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andriy.shevchenko@intel.com,
	holofermes@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Amit Barzilai <amit.barzilai22@gmail.com>
Subject: [PATCH v5 5/6] drm/ssd130x: Implement ssd130x_write_cmd() on top of ssd130x_write_cmds()
Date: Sun, 23 Aug 2026 14:19:58 +0300
Message-ID: <20260823111959.17029-6-amit.barzilai22@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823111959.17029-1-amit.barzilai22@gmail.com>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
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
index 73e7f2a8b730..cdef0c09b050 100644
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
+	if (drm_WARN_ON(&ssd130x->drm, count > sizeof(buf)))
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

