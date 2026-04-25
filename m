Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1720B37880E
	for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121695; cv=none; b=LhyuEbvF3IluXr7bR0VspvjNlevHh4uavdIuLpvNRWXXsnMLLXEMDhP8ymR2xNtGYwdR+Sa4mQD9VCMctDURrya7EMcaT2jkjsmZkoRPtb6ighvqbTI6tH/XsbUC/3fsYtBccuZtAMLF+2VhPILX6q3x79PwDteqdB6Fk1uHYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121695; c=relaxed/simple;
	bh=s1LkY4RG/HBml6jhtGQ2WI6dyTLJTlmZW5O0MgLl3uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TIB0HTpYXrLy3Uw3JKQ+0ae32Qf/uDcEDt7zrx0VOp+Fav+SJ9apxtNjQ8Vdrutp36B5huMhrTKmrhAVehnPj+BlBcIgSWDqBKZeEsvr54NANLFTMkgAUMDVKtN4FQWEz2V7X7eRUknohvvlNCxrVM5VeynqdG4EZXst9k38QKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHmgnSKe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHmgnSKe"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so12666081e87.1
        for <devicetree@vger.kernel.org>; Sat, 25 Apr 2026 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121690; x=1777726490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cle9rd5kldHX8L+jS2LOdlUtcsTtC25NJ0LIkE2xZTk=;
        b=QHmgnSKe0EB8bgS6ZPnKR3TXX3oUwUAO3w7pAWZRiuWW7g8AK67EEAUIKB4QiUc6ej
         9XWJC9NDPxM0YWwqFbKqL17nEzKDyBeWNb1qMuNxrG6dDfHheFDfnXoKbrg5jqXZAWbc
         DiNZDZdyECuw3X86ATuvjkJM8+hRBpwj36YXhLlx44N8oUabybdi0ZKZNDXvnrdmvuqQ
         iBapytdTsUX5oarkJLsvgTF3moEQbCLrix5UmIDszxihvsA4t+u/QVn9Fyat7iFgHOPm
         lVeowKPB7wNe65QY86zIiDE6ROmIb7bvSt0gkz7s1F/RygnzbElcI5g+uyRWC5sshAL0
         KH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121690; x=1777726490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cle9rd5kldHX8L+jS2LOdlUtcsTtC25NJ0LIkE2xZTk=;
        b=NtsC87AkQBq4YsYzr2Kry/U3+e3bMbFAlx9hBCTesFSDiiEO7YwAtWqzZJEW0NwVct
         8TH4/2w3fUK1OzSz5fVOj/rkX+xFEpt5cJdiJTrVL5Fkd0D9Nq3oe+sdyIslTPFpLWHV
         os6XIIOGgyF7tjb46FhqOlwcmzGbOgtR/5alrwF0IFGFtw/1vYfoYEDgzBAJrRL4NhmW
         o1YUIsvnjLXFOYtkp7KUmK89YjR5k50kma3JJlNuwrXE1dKrZBPHX77IJW0Y5etDt/9K
         JnBNm+0Fq4LfIa9PzsVNbBCo1BX3VuVjYUcRxE5cCUeQBVfrbFUjGX9riM55v4pLzffD
         UvCg==
X-Forwarded-Encrypted: i=1; AFNElJ9yoMosny4WKpzeZd2BNoDrpeWimTRnOXj0qEVIN8esiVGZfbtGzYB2TTskV5p4THUyhfBnFr3Joy7k@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZpoDJu2XvIReLviFhWxGd1kc0B6//kv25l2dXtx8f3+AVPTK
	2UO/goGMFKUk54pCMY+OIBIuWrNDXJT0BlxxI00V7MpTEmiRSOZw+r3B
X-Gm-Gg: AeBDieuymLs0rjClBdsh9ONh7SYxGSVvuFbDVN0ImX6IW1EMx0gmlP/rLBHA1qYlmGW
	Mo8ZsvsarS06GiLK8bvu9lDBmomJ8bhp6ryfpWlVqfirZIlZA02+7d2SwI3XsRk2KtR4pQkV1Lo
	IVMDKQOmBws9KOItJRd8slauxLUkI/CB5doDsoBJWgcrXTQfFJHKOnHSFIfTaMh/3L70jccgQLn
	O5/4yllCjXOjAX7G1eS3BuIPTunaHJoKm6J3P0qgtEbBKPJ+Q/lzdESYAc0V+0KNa7NQU0YBmnl
	LfkmOr3FLxzbqCccbldIEJrMN9OE9NiPk0GTudgDq/Inm4VIGT2Uhdnsp4AYEYvsSG1b8rfBZI1
	NhBpUSMj7CzbHb9f0PpYgU1OBmckcocN9oMeJbMrW7Ms342Mqm87M7bXHoFpyhsG0bv9DCeGq4A
	ipHexepN4Wu3QuXuX8kthqKyo=
X-Received: by 2002:ac2:50b2:0:b0:5a4:18cb:884f with SMTP id 2adb3069b0e04-5a418cb88d1mr8643626e87.24.1777121690073;
        Sat, 25 Apr 2026 05:54:50 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:49 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity sensor
Date: Sat, 25 Apr 2026 15:54:27 +0300
Message-ID: <20260425125429.65154-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425125429.65154-1-clamor95@gmail.com>
References: <20260425125429.65154-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Avago APDS-9900/9901 combined ALS/IR-LED/Proximity sensor.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/iio/light/tsl2772.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
index d81229857944..9921ccaa64a0 100644
--- a/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
+++ b/Documentation/devicetree/bindings/iio/light/tsl2772.yaml
@@ -26,6 +26,8 @@ properties:
       - amstaos,tmd2672
       - amstaos,tsl2772
       - amstaos,tmd2772
+      - avago,apds9900
+      - avago,apds9901
       - avago,apds9930
 
   reg:
-- 
2.51.0

