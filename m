Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446173;
	b=CDYAPMwKLStsUDsox8nxn6zXxlngxEGZUXYwwpe+BKW+/ePvLme/Yf4fY2yom/L5w0pF
	 ya18AdzJb71By7ieZ8nP9j5g4f/6prnQ/262eOaeay+18+U89c8oYwQlVX4AdLLLDBfer
	 d0QGBokXl1J9BIxvTZr/bSS3lPk9uV3KVtXIUdPQmCuvq5og/KHAY01WY0yJCLHmZAOed
	 PgNccT2qRRqWQqsxQ10jGyQhYfEpvd/dHg2s1ZWoM2un8z2o0W8WXNfESFqXcbYsfrP93
	 st8bB6ngzDfnik4Zjy1XQ5pifAPp4/czKmlzIps0/62YRcEVn1XVSFSvnG3ydhLMBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
	b=3RwmGY9Wkb7/7As9HH2tP6Px+RQGcgfzeqO+Zu7u4S41eeZKWkDFyrDyWnt9wOrVwf7e
	 d1AqZhDi1dG8V5Npu7xyj+kq5wKd3Lwa16U6VXcPV/nzhZU1N6yW3AIohTXJWdQhhg2uy
	 wL6ATg5BzZruqHDHhbHzH12JkfzE7tZ3xeC/0KvD2Xe3vI1N75Zgc0cdXIVBjtwkBicBF
	 vbVPa6aA/+peg5Tw96pJAT26t5eHE2tBxLMODnEWJmZxYBhcwb0pTwSoeRSAsCuJBUzpD
	 Rocq9exhhb0XA3FcPkS9J9Dz+3tnW4PiMUIPpa+2noWvnlnR77dShd3gtfnFQgHh3MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2x23gux;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB931606A6BF
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB931606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q2x23gux
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5126505cb3so433069466b.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446171; x=1796050971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=Q2x23gux2WXou9ID6Rf6EgbmD8oXLtysYLRow+Uukrbzz90PtXGe90vTL/vay0y0tg
         edMCC6JWUOGtYhr5pqwXtMIvG4b6mtxkgyA6r19AyWGbcsPZt/dKl8av4np1GeGS+Spe
         RU/ilHW7lhQbsH7zsc19RuU5i1z7N9KHEQOGzdkuQHG+r/00XXQFsx6YaiFhEOA2ZhKs
         LuaKi9RKaV1izEn2aaHu6hD9zlll5KR4s8BYfrkDqCq+yAqxTI3OJQ9k3AJdxgp+e2xn
         lV9CgyFBMDLItG1COTd2ejBp9qOXmrAC/nkzL5wq0RPp/brQ4zixR+1Jar20qeexxLzY
         T6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446171; x=1796050971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwVXo55WteHadUUlrAf0mHDE3uny8zAIeDKaxdS0C0w=;
        b=Osm7QBvDJ9migX+Bk63aQbCZz0G+oe5B6nXHxNUNb9M2YlY1agOoMONpwbjQCurHuJ
         MimycQX4awXkzRct2Zf3F9XtStHfQKz66ZeSvN9WjUrHPDM66GRjPl1U628xOJoeMYL3
         5Zv0YyhjlNWai3fhaFzBU1I1v7VhbSpIwUQayvzYmPezqGgpvyx6aJ9jFgvXXqZuLALF
         5UDfR3OgdUe82SmTDIm8m5VBCev6CgawDDdQ2LRxKnmwPkFps6BIFNIPr+x8PFOyc/fY
         Z8xvc4S5y1Wi7MHeT4IsLbnI4jhANA3bMV/BP/y6eW+VCFcpI8JxlZghFEWUR5RvDNoc
         lcaA==
X-Forwarded-Encrypted: i=1; AL+hErF12TgfVX5qUH4TKchHSbDv0YDUZw2kBidbfEyugTKEv5QOothDOK6y1kkB3czCxB9Y3u606YGf2zFz@vger.kernel.org
X-Gm-Message-State: APuU4Z8b09z7+lE3uMu5WliBQ/lLbcYYgRkp4cc+C46FbFXxTkDISGAc
	UiVcBlYac2zIomqoelYCvXiT4RKli0uGwrU4EX1uqBs+0Fx+LCPn6kuA
X-Gm-Gg: AZFdTZe6UMTtYOjxxtPIxHw1KwNtRRItYqq9MRDgcIIZgiq0ejKlzSsWTEaVsaphqYR
	5z6MeRMMFps2ZhxPuDSmE3PeusERx3mnK9p3n/HU08P27Cla4rbUjNP3focyZjtiBFmKeSYY+Uc
	3CHCnl44G5BG2pZkgZw6ih+oQvteobF/DzFBakmpdCX2buBD1SLQrOgS3y15DmMIhkgkGKuUgfC
	0zGHP3PVO0Ad6Oyl/+l/WK670XZPMtJl/LznGN9WXckNlX3oAba5O6JbHkQG29HkfsGIcRHeUjv
	A1RYogReKQZOmku1D4AEbvhaSmTl09II6EhuO5tPoflVf3ywQR+ohvCc0Pa5tAzDSyOHEOYNbno
	HaHlyLTuLXhuUSra9ykkBtl4LkHskkvMehkuGpWut7zvYLey2DqDHbuSkN3Csn8NCn1BnG/B/Q/
	uwXAYscQIA41CPoWgMT/ctbPPI1e6nyIG4RWmFmCMsiA9kDBtTjsDDQvf3pNfWeBaH8Ze77Uyo4
	8TOq4CQ4GVofgUlKDhT7a8vIkIBMByixZQ03HH40IcGKZZaWLtZX/h/XRlJnpgGp8H3gJnUN2M3
	D3fGYY9GGVeefm7EErgBrMjCPYo/9U9pzpfhKP/NoGCuDoqu6xmJdjxMCMkNrwgCvOPb8U4lt9j
	kz+galSMjGg==
X-Received: by 2002:a17:906:7d42:b0:c4c:d6a3:f4bb with SMTP id a640c23a62f3a-c513a999e3dmr714080166b.10.1795446169636;
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:49 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v6 5/5] mfd: max8907: Add restart handler
Date: Mon, 23 Nov 2026 17:02:24 +0200
Message-ID: <20261123150224.199601-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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

Add restart handler to reset hardware properly on system reboot.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c       | 14 ++++++++++++++
 include/linux/mfd/max8907.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 5d17971a8e9ab..fe71ada77696b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,6 +184,16 @@ static int max8907_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int max8907_restart(struct sys_off_data *data)
+{
+	struct max8907 *max8907 = data->cb_data;
+
+	regmap_update_bits(max8907->regmap_gen, MAX8907_REG_RESET_CNFG,
+			   MAX8907_MASK_SOFT_RESET, MAX8907_MASK_SOFT_RESET);
+
+	return NOTIFY_DONE;
+}
+
 static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
@@ -243,6 +253,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(dev, max8907_restart, max8907);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register restart handler\n");
 	}
 
 	return 0;
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index e222250f0cc1e..025874e5f8808 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -164,6 +164,7 @@
 #define MAX8907_MASK_OUT5V_VINEN	0x10
 #define MAX8907_MASK_OUT5V_ENSRC	0x0E
 #define MAX8907_MASK_OUT5V_EN		0x01
+#define MAX8907_MASK_SOFT_RESET		0x20
 #define MAX8907_MASK_POWER_OFF		0x40
 
 /* Regulator IDs */
-- 
2.53.0

