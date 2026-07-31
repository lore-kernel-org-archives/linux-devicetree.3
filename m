Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941FB3E3C76
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497820; cv=none; b=hMMq9uxBDEyQxleQ/V0p/QPmqOGKFaJ8ptxwe8Kbk5eYVAk4dUSMrpfhwOY/k49UGXTMfGIIKocb3ErYiG0wzFMMx+yifmhcpJLK0qKeOiADOEMTwbz2VoNdiCEl/H8jgu2KcjXzGtSh9kLJymEHew5tF/haPzQSaIXbk5K5Z7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497820; c=relaxed/simple;
	bh=g/XAR49fFVzuq467Ik799+2FdWOn/LGc0r4Y6IP8+yA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZYcrXk10yTVl+LkmIvT0SYT9vqwBWzF/Uy+LpjhuY4VW3Ezcnn3EP/YLOrni+kKfQpVenMdtvaaxD/6Ro6zMKcF/MWG8C8n5m9DxncVpdROC/cJgZDXwnQe3tXV/S12bgzufoeiAQfHUoVTXg9E7shGsLT7e9cRL8il15PKWfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKpOp00x; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKpOp00x"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f703a9d05so553436f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497816; x=1786102616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=JKpOp00xbHR7rgB47Jl7J41iv5z2u2EC8zhFUCf8B+w9o1MW9puL5S/tT9EXAf6So1
         e6Rr3dwT0r/PFnYbUUsnIIm/48oqLM1K3MU2aoqU89ilDZuMGpLOVE6l0dJzHnxZnxU7
         GNvNbqFOzhFmH5HCRZhBU+MOd3qEMNogXeJKwHbVlV5ntE4PQRX2RFRYqQkr8rnsD+Qd
         VogE+ByHBBTTNIZaHzUabxnwFeTt6tQYCiDKHoyc7hz3LpfipXVCr6ArMdka5BfDcHfE
         sHeiIbYAnbA3mUJ4bH1qA9RS2awOtMI+wGl1jD4ziHvjlBFmXz52VIJ4oZPDlOg3a9Fa
         Wfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497816; x=1786102616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwovEeXaCAdfULQBEy/htRRSiSsUVEDD/fWA6pMEZ8M=;
        b=koJHHEdwhHUWJ4/vo8H32UaVFuQh4/t4uRwV1kMDLXpog5AaY0d1pD0W7eqAl1nHkN
         waTIG0W83znyRJbHiBeFfBOn2IHy8dva5Sfvas22c+r8LMTuq6kvLDuVuVOhrVhMk7DI
         mV44CIf4x1QLfzoji28lzFifAIzJDlPKO79Hk5l7iTGuY9YhIfbU/EjwpeYiZWsxv5dv
         vSnqccMDLNOrr9A8yPOKMo0FaC2B4qUw7NN6XIj8e/s5bFIbIsLnfhVKzFDDlL1qiObp
         K7/zgho07TKETRQ2Hm6Xoz4RxOwIm0Ay1COamGA9CgjXUHYVKhJgvSzMG7wMiYuqqmVI
         TRUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/v0QP74aqe1p4jRkL7DQy2JHsflq5Qy483mCBprxkXSlpvZMN4HfUarsQx3qnFbeK694+Wz5xqs7e@vger.kernel.org
X-Gm-Message-State: AOJu0YxLxOk57+19LDR1aBroRlWUbnzMKO7u1H5gGPc9J4SNhL/mivy0
	4o1PYp4ykWNGrkDfPh+Y4YthFWKs5DEYYNsgfbHh3iLwgasw0kWsUygY
X-Gm-Gg: AR+sD101rM/CyyMJxAEypYgfNIv8Fo2nB2M+ZxKWneCRlJxGLsw5sbfCGl9mmgadwAS
	tqJ5ezWkGAvYPlGHCd+ph+nBm6gVnNEhPgC82Fi2IO/ewM8cIoVxT6aybEkVs7DB8K+mbKOIjph
	kR6wBdZWfTJ65xJXziQCYIROq7Ay9nmci1pr+UVE7CiyCeb/0BUrflm4/bv04r3dq5xVNZ0yV3e
	ImdUyWLASTVANI8kYtU47bqSPpqOxHYBiFeet8i/0R4h+tZ2A2YL7DswhILi8ZlWuwDKtMZnf5a
	gY8DMDDf/yet5k0J61lG61mdJ+BObeerZrk6DTcK/69Bqho5mr2KiNj/wtiwIfqsAthEND25ZzU
	wbTy+KBxrmgpjtr1VILfdG+T8G3Xn+jRFAfl0SJN13AoxrzyygEsOf80OHnrtIAP1nzL5dFwVRV
	EIiS8xaCWhzkvw+A0SFS8tVVxBGeGQDPg10A0yyCYyOO8ermDC50e3LqGJDIBRf5wRmEWt0+kXp
	4RUekRIWQ==
X-Received: by 2002:a05:6000:41c9:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-47fd2abad19mr3920947f8f.3.1785497815591;
        Fri, 31 Jul 2026 04:36:55 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:36:53 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Fri, 31 Jul 2026 14:36:21 +0300
Message-ID: <20260731113632.158440-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using 'extern' is not required, drop them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/mfd/lm3533.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3463b164d0c17..c4c38876c09bb 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -82,13 +82,13 @@ struct lm3533_platform_data {
 	int num_leds;
 };
 
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
+int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
+
+int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
+int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.53.0

