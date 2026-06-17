Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA63CC9F6
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683256; cv=none; b=EEnYVpp5fwXqqez0GdSEwMX8zNxr8kb93FJPO988qfvUej0cWbbyKVaG2dIKh/Vt59n9YudJKHS2nh51ag03AmZ3lKAn+cQvRQLmKGdU6BWuekb5wNwfwAVSAhPZ5mpqAkhiPHE8oYa3QK+2gRdci/rwGPHEb8QsS4Z8aPzoUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683256; c=relaxed/simple;
	bh=HAi2lFG9zciTmNwzjiMeaJhfR/QYxc38dcz+eeM5v3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SuN3WCh/aQvrjtmPFMrC+MMEm/IhyeVTu8bsNIeUIY+yAbZpBiTegb1jVhhwHnUKJCZXU3qgMzk9y1rIkmTPYspIAI6H5RHJ+aCiK0PGXLOfsNFXxflDbYm5mOGWNlsZkNxKExCirLH6Rq3cn7WtGwkFVxgHXGYH/dxOFrQck5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUdfElxr; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUdfElxr"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdb3fd39045so794310266b.3
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683248; x=1782288048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unbaKaB/vtuL7mVbcw6i8cWTUClKXSp2jofrc/k4FUs=;
        b=OUdfElxrVRVvBJaKiqMN4D6jqwSn4vOV4hkds1oDsnPTwrGiG6i4lGtznIXXvn2bLl
         jQv5TalctKgzKPyUr7dVLp+49u8/U80PnsgOG0NmfmEKEut3WYdjXghOiYkcPNCHTJ9K
         HHZ2CJiIWsG3x/5FgON8LfF4Ph4nr46hMuF2+wyAG15e8qrj3EPuIPN+orwu9TYT90d/
         v3BPRci/SlVEOH4IqhaIXLfTsLuAak5aOPDSZhrVsVdfB3uYgCQq2ojsWvMISRnPU8f8
         J8J64VlIlmv13keHaqYDHJQvc4TKYgfGYjmbnzi+TtJ4mULpSTsXwAuuA5sEfZbxsooA
         xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683248; x=1782288048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unbaKaB/vtuL7mVbcw6i8cWTUClKXSp2jofrc/k4FUs=;
        b=jHEWM9TXKFvkfVr6WbI2P8rFbRagnFtSipb0N13fS8pGKfVJ12vXOl8WNqNirsC3Q9
         o6yecScrPPMrYPGwiFC49puVBGxLJua62MmhjKdMLmJUhUOKrFX9UmUik2uw6O1ZK1v6
         je0Gl5hH1N2nsvMBsMNDkaVB3KOhQcV1zPvePVfpO+Du9SwhrWyz0eJK2BUHrAIw94/8
         JzwC2Alhfvh2l8znd1AjKEKLOmGmMey5n6JXgGWKvFrMsNYubKAa4cts+fuPbvfCe7f/
         iGk2woCWJKY6eqrbHRLOndq2MPb7zGHMnU1kBOoGoqJLAM4J/KhclmL4ZYD/tHF2072w
         gs+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9zDCvE6xWcHoh001inXiyyxz1bmcVuJSlH9JlYeLk7ptmd1B+x+p2Py40m/zQWyqH0aQDhNZ/9zPFi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/r6eF7qu3/dHLPutBrph1mjZpgxOS8qz79Wvl4WsjvLx73Pyk
	+UGWYzrVt1Pu+OSijGuTJDtNBuXqwiIYFceMn9o0T5JZL0cVlAXE4KwR
X-Gm-Gg: Acq92OFUHJEmT973f7M/mHsahs8Sw0lJTibbA6SL9E6GA3aZhh8VqtXJojb4i7FZKzG
	1JAFxpNiglRBoMM1ASAXJZL3PtdVOTjPgjeNBUZ8KleXjooEzckCQ7VFfK6j2c6ufZM/ZiiiQVR
	0t7OnJphsweWaGee8xAUP7rz895C9pximsDoefjuTa9d1TxwiqGb1d7h3eBRLIaIunLbI9pu/m3
	4IHC4UhYGCNWm7xkV00K6r9m0jf0GoIVJoKBCedBpzwOhJokSNPd6MoOoUHbBi17KAExAJMRF9a
	GHrDVYM1pvzEkiemJn3ixcAP+S84KHwTO/zADgmvT6CZGiaZ+Jei9oH27xBQBJf5upT3UELcAgN
	8C29DDowNmVNCQBMskDY9weezMFw+9JcaXR0JhIoj7Vslpp8kbgcfe4ub5IyFBAKeer3dYcyaLO
	0s9A==
X-Received: by 2002:a17:907:97c6:b0:bee:ac9b:9abc with SMTP id a640c23a62f3a-c05a6ed1a53mr193361766b.22.1781683246256;
        Wed, 17 Jun 2026 01:00:46 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:45 -0700 (PDT)
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
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Wed, 17 Jun 2026 11:00:20 +0300
Message-ID: <20260617080031.99156-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
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
index 3463b164d0c1..c4c38876c09b 100644
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

