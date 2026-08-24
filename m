Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6F385D9F
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787596753; cv=none; b=qAaESqWQ5y6EyaAzyarfh6WcsKRNlSJC9EfMjTG2Tib74hqXi9F9lIivOqFb/2iv9Hmqu4tPuYiQmXKK8Ekx1ITX9JKQPngpVEifdUQtNFIK4lgSVct+Zuq83GDobieynodAiKYd1npHvHPZPLTGoL3yVrGDTLNxNw4aeqBKuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787596753; c=relaxed/simple;
	bh=3zTrUNP97wjygcEyxUmUMs4ernWyBlapMobTCcEOsLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqPOT7XmfnkQMEWh7oydyiKxlfPbLhl2OL3xZMBIFh6ga6r8x9qpJe0KsTPodpG8XnZ/ihiJgi9aiPT92Ez5XyF/eFC5pedxeEGfAww35/wmIHBnkqN6AZFYKWNB9tVsgZ31hZis7iqT1X/eD00H9q/lu4oqHz7qOiYUEndnFVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBn/OwzN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBn/OwzN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1600d040e4so34620466b.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 11:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787596750; x=1788201550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=kBn/OwzNF6zi/8HqX9mV/gBhhauV13H/WoF2Iuv+BkB4dlX1/koXfELDN4jLW0kh1j
         u4PKFDVwRRwr0CaJnEjiSj8SNBi/X+zypXZv0VeVu3we2gEp30TiPd8cXCL2lPuDG7VV
         ZdWuxPa3D4c1/gzjpb2eK2Mk+2fo7cbJI06Ewk3jCeO3lDyv8Vaw1zl+MYEDLviHVj15
         Hd8ozAll0M/YiDvuj6Sjue6PztWkumvy2uLB/GDEAm5KWKDnlxrmcwd5enpbxJRxEpyq
         3IJoF19XQsLA5ksPAF7de1GyEx8lwTITQVMu4ISUOacWXF1SxMPjfqWho8Suwtck7M5c
         QGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787596750; x=1788201550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNGuRramHsyQedVrqROIzZg6iP7sI/lSPknDcuWVUUc=;
        b=JjoDtYTG9HlpK8f3fqomsGThJ5ggitx7AZwdpI+Id7pvHvSbVdi8+RzuWvyq3M3fyh
         i892dIbCbWFRcfoT2deYf9KCTp0riiqIxu+GDIaz8NyzeYpJsLzm+v4U1pFnLLdKjN6K
         LhJATMl0qqOOEUcQwQSpkyNGNla83CioC9X/fI4d9T53BDjhupLOPyk1cAFOK8CHGf1P
         EpIbmsOoK1mho5Ny+kHWq8yqOoMPahTK2w3bmMQ9It4nbq4lsO4odRE4Wp/ESXMiV3IL
         cth7Nfa/KP950b6XS8U2R4uWWWarCMPAjvdPyg42ZY86zPx5v9rNAqj7ikFzr8MO2hT1
         epaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+yCkSOInhFIjWzjbMv6jvhyLk3U7UCzivaVXkcCt7SPzM3R7dUFpBSGEZQBXYipMtBPh3MK5G0Fx/@vger.kernel.org
X-Gm-Message-State: AFuF++k8lIqBDTDH3Nkp4QBRh55mnWjqjds1ZzkEogv3et4gbtA6wlpB
	5/zmqdKJTck95yEbmr+UeBw2tC6IoRC5X5aZ6HT40XxOgnUjmSgOxVR5
X-Gm-Gg: AR+sD10QYzT7AyHWDAyspSv80s0EqkDXbjP8QIS0U9F0xDMbCM5i/wWTPUHnxFyhb9A
	Z3uGAl3X13aaZ8H+mq/mv8DX3+4hwZJzvIFWXKhDwElbLjclXCW4s7GQdWg3kf5b+8vi+30B9Xc
	KRO6XiTCD48Uk+bGMkc2PxQv4ccpEQNRgCd17ewCRC2SEcaYzs4+NqX2fn2rOkhLZD5cKlUfM+1
	9btbtXl64n9pVBkJhLFwGTSJlX466+GNhwCGKn7r33v3xp66PhH4eRMqGoElMNCY6yMzSh4uJqN
	8kr6L+Tf4ldwsnSa/HL/PVNB3X4px4yPB6vfu9BM2mLmb/On7PfmqJl4Sc9yDEF2BlXZS3c6DNV
	RVX+F86ec7jVfATHa/37FuKEGypicq+h3OdCyGyWT+9GlMS1etAvFftYILCrQUrJBUQMPU9Idox
	IL8wGOlZdtSzpNBfB31h7fiIWO77o498WkXs3TELkstMQtgoV8kFwXhWBxVUuheRfq6db1+Dd1r
	g2qba11jjuhIi7jrOx5/ihE/9IVVU/pP+bmgd7Sd/amyA==
X-Received: by 2002:a17:906:794f:b0:c1c:4c72:e6df with SMTP id a640c23a62f3a-c24e2860886mr95058966b.0.1787596749638;
        Mon, 24 Aug 2026 11:39:09 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([2a02:2f08:440b:2900:8e59:1937:8c58:aeb6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249673d43bsm1307499266b.47.2026.08.24.11.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:39:09 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (lm90) Reject channel 2 on chips with only one remote sensor
Date: Mon, 24 Aug 2026 21:39:00 +0300
Message-ID: <20260824183900.8983-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824183900.8983-1-flaviu.nistor@gmail.com>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate firmware channel definitions against chip capabilities and return
-EINVAL when channel 2 is configured on devices with 1 remote channel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/lm90.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 1c603272538a..3faeb2c6ab01 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *client,
 		return -EINVAL;
 	}
 
+	if (id == 2 && !(data->flags & LM90_HAVE_TEMP3)) {
+		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id, child);
+		return -EINVAL;
+	}
+
 	err = fwnode_property_read_string(child, "label", &data->channel_label[id]);
 	if (err == -ENODATA || err == -EILSEQ) {
 		dev_err(dev, "invalid label property in %pfw\n", child);
-- 
2.34.1

