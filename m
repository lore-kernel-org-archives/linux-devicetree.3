Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC8446AEDD
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521511; cv=none; b=n0X2ffVRV4DNJ863dQdCNOtUuIJuZNe+/a73cPKzrHvaybn4PdN7XiNSLB5wCZ/ZqBzpeHqqtFTyo+oDjCnpblwcOS/ms+zIaJfxB7WJT7KKUSALGKmYhwqndzZ4piXdh8bnokrOxPhu0S+QogMewSNnFKW4USCDWv2NbiXz1sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521511; c=relaxed/simple;
	bh=+rRs+S/GLbvYjpkwKDsmz1ERbvZm35SJtB9f3RxI0O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rURneJNg4/w5gD3Iq+bujh89V0YLBdurLZ8wnqNORnTn4PQ+8jtw08ep4tL/zoPWQL8N0UzgVx4QfHYJitLpO8KjZtFeG7h/JdaoHv0dK0SYsA3RvyTNa44DalCT6BJb7GYlodbkMX8SsHnezs9MhW843uC84HFqeCCu7IXsqjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBZC1dMI; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBZC1dMI"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-367c2a39fcfso1380364a91.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521509; x=1779126309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhqG9aI2ukn/g8i1UCfEdn6XwpCGaYuhsFZEF1np09M=;
        b=JBZC1dMI+6OsA++7jm5Y7d+5/DAvKY59w/oHQ9Rs1Nl7qLj95zl73CYUZOSuozKemh
         HM0gYwHDbJIiZ8P9XbD20502u1kDPB/zm/uOnnyH6/RkviuSBZpm8nZ8cbahTaCoR6xK
         nnVmdREKfcnRhLLi0fyMRHyuvhs1/OE2pSmySF4slsfA2GuVo5xe6oMqrQrXC+5IlcbO
         XM5eBrtb30fhfOzOKswm80icbBWZ0CbTByuxWghyt+FHu+D1Iqsn/tcwffdYF/5SFlpn
         7H/RagVwRHTWCG4bb3hinMxzIjx8mIqfOLd0rsDGfnvUlCRCpp+jZLKPJ+SwAivxLBOG
         uirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521509; x=1779126309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YhqG9aI2ukn/g8i1UCfEdn6XwpCGaYuhsFZEF1np09M=;
        b=pYljJjI14rEpaOQMa0be3K8hk0Q4OY1kBN5lYlmJxBitPa2BjLhKvmqpaAXeLlv3wu
         6RGxDszk8fXrwrVxmrvH6muKw7mQVRqQ6Midvfv/NLmCIW2a5J4sT7qGVOK9sUXfzhyx
         GaBVyYSN4f+De1KsN4FysMQh/dzUc5+YJwOR3RUevtT0cm8IkSskwzeMReDbxjh8fDlS
         hsPf8bBi3Z1b0n5BKdfi6kmtWL90XCPblF+bkypVdObJXUMsA48KxwiYQ2NlS+06HoQH
         6y/hSN4ZUeMkrj6tdRKEGAHlGcwEtDo7xnDkUs3PZSN1S89BOQwiBZ/tFLmM2asqmcRM
         4TyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UbQtHFF34xmOLVM/N1kZtu+bQYABpsXSDtVHaKHYY2IsTE1awBArabrzrQw1rDZNyllMDK9qPKDTF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9XU4AEqThGdL34VaWq3BAXexW9l/R4uAwbCYSXDIsSSYS3JDQ
	0fLfKSvR7ZvEcqYMZBWhE8+O8itJ4Wqo2++zObIghv0cpC0QanFXIMXC
X-Gm-Gg: Acq92OGFdW/W+K5FK5vVd7JGQ5ONlUmkacZX3/ymZXKyWThpdWE/Y8JNz1H7Z4iXChj
	jNvq9QTuTpYMR9zC/4MeHN1LdouC/U9eVxSqVzQsB5te2pAq2owZfGM6j//7nyVgQhGLboYUGlE
	fGX4NjXfC9bdx7SIm9TtZVAfKxocKCcppsytzo99CfJ9FrcpP3Ktk2VGyPIyAqnQzG6T+OS6oOP
	l/qNivb7u41z80ShNAZpmAK+vB/HlqC6yGIAGdzzk9nfNy/pDg46nE1f+7xxSvcSx2wzzMCE0LH
	qgQLb/4JWswfIWIPp5ELLXlFPwljhP/AE1gVMdnfXS7LVLRsCO+JogdcnVBKr17IUmsOi555Et8
	q2QHSirktlG53gIkKAmKhe8j49tk4yOUsKlR+XHAxWwbyCkEZdrTHSso7vI1ZpWOqBH1+LjvFqQ
	og4a3Sapu4GSPmAF5SSSJ3WXCOOTfTjjZC1IW148jgniAscvwfkzZ0xb6Hdnd+EhcgLBs1q34Bd
	ESrstOjIi+TbzPuyZf7Y0iy/hbmykktATt4Yc5HDvQ46VCuI7+ulxKO+0wk
X-Received: by 2002:a17:903:3bcc:b0:2ba:4e84:976 with SMTP id d9443c01a7336-2ba78f45b67mr249352365ad.13.1778521509323;
        Mon, 11 May 2026 10:45:09 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:45:08 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 08/11] iio: adc: hx711: split variable assignments in hx711_read and hx711_reset
Date: Mon, 11 May 2026 23:13:33 +0530
Message-ID: <20260511174342.123820-9-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the initial value assignments from the declarations in
hx711_read() and hx711_reset().

This is a small preparatory cleanup before the later loop-iterator and
variant-specific changes adjust the local variable layout in these
functions.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 30e1ce321747..9e5cafa1e307 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -159,9 +159,10 @@ static int hx711_read(struct hx711_data *hx711_data, int trailing_pulses)
 {
 	int i, ret;
 	int value = 0;
-	int val = gpiod_get_value(hx711_data->gpiod_dout);
+	int val;
 
 	/* we double check if it's really down */
+	val = gpiod_get_value(hx711_data->gpiod_dout);
 	if (val)
 		return -EIO;
 
@@ -204,7 +205,9 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
 static int hx711_reset(struct hx711_data *hx711_data)
 {
-	int val = hx711_wait_for_ready(hx711_data);
+	int val;
+
+	val = hx711_wait_for_ready(hx711_data);
 
 	if (val) {
 		/*
-- 
2.43.0

