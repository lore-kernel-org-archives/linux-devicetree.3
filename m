Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01333C1BD
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441598; cv=none; b=nn0RqlmMJNKUz4QjCBlCsnKMXGir5HGgsPp6QikW0tDEM7IuGOqVb60dJyEYk/khLyhDZWdxOOCQ69CPRsRo7dbOdTdqaiZDw4+sCburBRWK9bgLg7YqT2H6+pR9TFy0h4LLWtO5ZASM11bzPB4SJ7QQvxRPKvB2Z6SI5VZjZCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441598; c=relaxed/simple;
	bh=fQvcWMwpPn5jGYP4rTJSr7QPrnzNGFhXHUOHyu6rfqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnpIY/QTqnUaWLxn4OSDCtEWE5YjaAlNl75p1Hgh5EbnTQYLntQVE12uvZXL6KhnAojopdcm8RlAY/z94OUJoSTWP20zsY3LeJf/tCI2mZsv9wJ4k3MsLdJKVXnFpSF8euHRMGsGWlONewdgwpXKtbYcBf/AZHvm+hhL+2yAlV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVcH7tf9; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVcH7tf9"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b461310af5so2358355ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 22:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777441597; x=1778046397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERdmP9UytYv63GQaQ/8HDqVpk3AgA73GyDjAubkwUxc=;
        b=TVcH7tf9NYUNKP1AdQJxpP1l6TF9SmSlZrI5vyPPIo/2k+DXDhfH2hHV2SkB53gZyc
         0f0DEM/zkTd70eT8u3NSAyNiPgQm6TaLF3VmXevgr5QTdLIS9dhwG2qJk9VzsfHvg5eW
         3MkccEyinFvZLzk91m9V43/NYuvssTHuy+QEThd9Nc1Y9vFC7wIxKMSJjbmz7ZEpd11n
         Pui+Y0lRJd8TyPOMdmlBCFU6yQFlfQtXguw3v62TvWqU3+alWj2Pw8m/iXT4HC+Obj1K
         cZrLO+Zak2XWins+18S31Jvpr4kjjHrchEV//yC1NXrPBri4xF8OjXJdXVy1XrtcS9oE
         gWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777441597; x=1778046397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ERdmP9UytYv63GQaQ/8HDqVpk3AgA73GyDjAubkwUxc=;
        b=sUCVx7o/5NqPO25ReozTEHnED1dPFaSkiIDTtdtfhPdEuNxr+zqxM69lA8u4VNJdYU
         8BjjCuxK6Jbs+BavO63bnEtLA96xM9tfE1s0dJ0Fi9UPzvoznrnNCxc+n1thN5vnH6g2
         8BrNf954loYp6TSN30rq73uBHvfw5DhOibKATDxZOXbOlQZbChvwdSS3Q0vURuCzOaUP
         wthK7soRYiVzJcizeklgwDu0loxNalKerRHGP4MlkNtfrcjO9tPpY5qYTk2ojrhG/du2
         HIO/iZz31ioslLFaXR08gqK3AAtSLF0GMzjJKYnAqAGJL8OmzM6jscna6huCuzuiUyY+
         tkhw==
X-Forwarded-Encrypted: i=1; AFNElJ/XgxUT7VRnBOo0LbCOEQKnk4A8P3Gm4pYreMWLSthd0M0GX0t0tQlkJJ402yjY7Sfkphjtem4RoH9f@vger.kernel.org
X-Gm-Message-State: AOJu0YzYKirmJjq2mZBEfyfD0bTnz43y+OHOHNUaz+n57V60VPahWm6q
	k+Xc5AYJwSqBGtYdwwVBsA5Mf6xfaxZoMvqAvJFzUClmPBXpk/UbrDU8
X-Gm-Gg: AeBDietk6kxWfsKxrrCY5N7Nd2PEr6lfk85ghHgqlZ326i60nHpMYXiquQ4dsvUR9JO
	KABgGvMprJH7bn2/2Z/Eytg/Wzz9TJSSbe/kZit1jnYjGwMohApE+KdDAbJiR042qPs3o2x0acE
	2YxgM/wAqRNAVfXtQZ1w4p34UIwE4B+0Oxs0sNMtjM4wPZNfuk+HZxaCbEQclwaVXhZPhZDs3QC
	M2jeZnUDJOv5awq9AEoJbxjQI4AxxivquaLnYdSUMYqV+ZoACUvWHGtCSjKQzbyw6Q7R9SNd9f1
	QibTGAFIfVxWSnqQWjLnjq2VDHFTX5UFV0fik92ojISWr6JaTWjCUw8xqS+GJms7r6nqHY8vIB1
	HujUwiu/N21m0NPkD5DjR+d+uUkB7FFL4NVy+HCPjrzNATJ89Xn+bkKwPlMr5tgBq+vRnJB4oBe
	BNjnC3crmX7bEi2wym9KQYIcy4Gjx08XkVcgncrfahYphlx4b+4wTnOmwnLhYHznTZEde5Dyo82
	KsnWxUO55GoZ7ivsvnIKqODWM79moa7Oy6u9Fu2vPvljCp5rA==
X-Received: by 2002:a17:902:ce11:b0:2aa:e47d:e3b with SMTP id d9443c01a7336-2b9880a66e9mr17228955ad.0.1777441596911;
        Tue, 28 Apr 2026 22:46:36 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:31:d01f:5fb:20b2:c2f6:85bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98879656dsm9346365ad.25.2026.04.28.22.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 22:46:36 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/11] iio: adc: hx711: split hx711_reset variable assignment
Date: Wed, 29 Apr 2026 11:15:43 +0530
Message-ID: <20260429054544.123862-11-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429054544.123862-1-piyushpatle228@gmail.com>
References: <20260429054544.123862-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the hx711_wait_for_ready() assignment from the declaration in
hx711_reset().

This is a small preparatory cleanup before the later variant-specific
changes add another local variable in the same function.

No functional change.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
---
Changes in v5:
- New preparatory patch requested during review.
- Split the hx711_wait_for_ready() assignment from the declaration
  before the later HX710B change adds another local variable in
  hx711_reset().
- Keep this separate specifically because Andy Shevchenko asked for the
  prep split rather than mixing it into the HX710B feature patch.
---
drivers/iio/adc/hx711.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 914c6efd0f96..e72f3c2cdbcf 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -204,7 +204,9 @@ static int hx711_wait_for_ready(struct hx711_data *hx711_data)
 
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
