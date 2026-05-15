Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBE22459CF
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 01:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807804; cv=none; b=Ga5sURdTljH0FNkwWUeEYK8dNBVtmVNKO/8doSg+0gauVTqjhu9qKkuhWcZCCHjbgIInmLVrqjK1zT4XGBlm9aMp2u1zDW/UKfLali+UcjM+tBMJzUOPgpgt82fVyssWiVskIhRmIm4vm3EYoQs69IV8krofvnCEiqsy7ZAnBYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807804; c=relaxed/simple;
	bh=JC8T4gNfzFadEg85bIUUZFK4R4slQOBV7n/tMER/kEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qr1rnQAssIzRUStQL7Q5CCWGSCBAyHlaVvGBkJJLGae+tw2zw+ctQDqrahMSM1/s2zL+pCzy8MmzPkslMeNalPe4st8qYRBjwpMG+JD9U2yBvnBywKj5M3gyorxrXAH3abKp8vOkBTq+sAoCeyoHnsHNF1ijq3lib0z+5A8Kks4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVkteZQs; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVkteZQs"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7de7c57b52cso6940040a34.3
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 18:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778807801; x=1779412601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etZdfywDlWxrGaBS3U+i8QZ6+5a6GwMR13z8kxUpdWc=;
        b=LVkteZQsyqF80ODMYmOeLU1JeM+HAt2ouVTZcrkpUbcRikVls+Uqwj5YyhIBEnToqk
         FRjZQQBlFrDXBu2hyFT4DUvg32nlDNdfu9Tudb1P6uat8jrwsS41vv6/iNb0Z43rO08P
         QxmGOFAieK5YnIRuhT2QSySsgaUcayg9owYBfU4bdbx3/RzYMjZCpc//oaoAG60d0e0R
         Bc5T2CsW5jAaiZeHlEHXfBawbm0fyzURulUrTOa/j5gMzYx9y7lgZw4bV0EZWrt9lhPC
         surDjgMUknKNr2DdMfWlcyqe5gyXLJpkZr1UTJra/qq1n6zuPYfpQ4CHG4wLd7IiSJpJ
         wMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778807801; x=1779412601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etZdfywDlWxrGaBS3U+i8QZ6+5a6GwMR13z8kxUpdWc=;
        b=VTzZBsh0HEk/pzdJhzyPexKBCGFs0KCvLWQwhn5V42hGgRPnixuVIgufUWF0OHB5Pw
         iCl/RNmUeSy4CXrcPZcOhB5c+fhpGg/QqYek32jAVOzIMGBDMe0TGBDI+ErCXBDVo3n7
         IjRzeZAoIcg14OjDObFnWPq5Ls2lL2XbH6AvwIUZBEnChHHo0SSCBy1me1zij8O/gr6V
         wfNs08uDyY2dfE3ftjoXYnc2U1RJajIM8INv9TXR5SCn6ioWfdmbq8NOVz6+x49uQ7y/
         AH0pQHxIo88et4rsQtzt0xi4C9tmKxdKcHQTOSmhRi7656UjQ3mhob5yIc+Zsf9ZxBrp
         tK2A==
X-Forwarded-Encrypted: i=1; AFNElJ+pA9eJRh/to1ksgL7Pl4mFp7rjzDNdwhSXEInElW4Oj9Z75k15SWEIkvL+ua+FT0DNs74JNbyxO1Ek@vger.kernel.org
X-Gm-Message-State: AOJu0YyCf6FlNdhfw0vpdBAp0jtB3aS35ZDQ3tWy2uzUkkvd1Ij+5ee2
	k1E+Gg7XoO4WW+he4gSFFJJe7u/zguFeucewPN536yVgLrCHjumDtNCs
X-Gm-Gg: Acq92OGsYjFxaDnYzdft87ZGRY4XzkJ37fnQ8Xw3l2q7a9iaPDfQvykK7RJWEf5A9xH
	rlltCcy/AonNWIDAeohAGmdcIx8KnYjmkMtVBKMS4do12YHTNvsJf2bHCQaloyEGosJ5Gitd39q
	o5/qDEDVg5nKVVjJCy8AFdbZA0FzFeXQlAm4c3Fnqt33spXoyJNbqQVfSLmiZadl6GodcQxgbWs
	5pIv/PjKJQ3GiIqGm1lHeYR6rrk9+9fo201HJgJQxY1DvNA1YkEOT9GkmpU3ntbxuZYU3JVIqlS
	5DPHF1Jj1r7lXSvLHfiUSubbH5CA4DRp9kp0er1zxBvqwhN3klxF4oHY6CdSZhbjyC0q6u0QrBb
	6+v/7tmh6+blcQpF2tmibkSfygWu7Jz5F9PpePeoO5qYlvMuq+AqdLHrB04R9SXOzvPPNlgM5QT
	QRPD6E0pEt0g4Yc9c8G9gLAwZog/0sqDZITV8eKTL5O0VdlW/JfetFVI+4Ng==
X-Received: by 2002:a05:6830:d01:b0:7d7:ed69:81b2 with SMTP id 46e09a7af769-7e4ea071959mr1148758a34.5.1778807800752;
        Thu, 14 May 2026 18:16:40 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bc4983asm110362a34.26.2026.05.14.18.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:16:40 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Tomasz Duszynski <tomasz.duszynski@octakon.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] dt-bindings: iio: chemical: sensirion,scd30: Update maintainers field
Date: Thu, 14 May 2026 20:16:39 -0500
Message-ID: <20260515011639.28570-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tomasz Duszynski is no longer the maintainer of the SCD30 driver.
Replace his entry with mine.

Link: https://lore.kernel.org/linux-iio/20260507172404.80435-1-m32285159@gmail.com/
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 v2:
 - Replace link to git.kernel.org with link to patch at lore.kernel.org.
 - Fix typo in subject.

 .../devicetree/bindings/iio/chemical/sensirion,scd30.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml
index 40d87346ff4c..a5b0debe85b1 100644
--- a/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml
+++ b/Documentation/devicetree/bindings/iio/chemical/sensirion,scd30.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sensirion SCD30 carbon dioxide sensor
 
 maintainers:
-  - Tomasz Duszynski <tomasz.duszynski@octakon.com>
+  - Maxwell Doose <m32285159@gmail.com>
 
 description: |
   Air quality sensor capable of measuring co2 concentration, temperature
-- 
2.54.0

