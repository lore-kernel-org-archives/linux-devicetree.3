Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9892FC037
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774431018; cv=none; b=Bh8DRhWhA48wpvhc7WBeyo+SLVYcN9rdbT70+AjVkVbUNEMN7vn85rk1Qt7qCqcO5W2xx54QT5LMezDy3/zrRZ8yNAAM3dOQZFWP3cBFJUcRtX3J0YgmGvkHYzLXEC/ovOTu95N20uXSo+b/GruZNOYG3/gDL+stC+FQuXgZz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774431018; c=relaxed/simple;
	bh=f9D+YL1OUkQdY12lkA7AFCjjqgAZ/iTBTH+EZXJs1T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrRaLSrNX7TbgJxQur4UEhJCayAfn0CWGizwQ8QMvrdr0EfPVlIKdqUYLCnLfvZWiYFMhFanJNfH6f8P0mtqeU2CCnOfjhXfvkPIpiQi9idueZcigibtOMSfB0y2SUXubbfOxiC9NIJ7rSbrxvrahiZXJCtbZEtHOeehxYqd8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcmDZawU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcmDZawU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82735a41920so910601b3a.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774431016; x=1775035816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+myNUoESzTzunmiunAZb/MpzeT9fXKqzdgO8jfvhhhA=;
        b=QcmDZawUJtcQ69F7Vq47KXO0wmreN8oSctwEYuGCuvaKXxMLH+dcPrLADdKGII7pEm
         S8oQa+PmzA2bBlcpV70wUtUCtLF0a9XE1LOvVzi+Y5wuBtLoiOZhm9X7oV6ODNaRxGsE
         H7sUWcjjGWTpR93LW8Vn7QswPaUwq0S4CnMjm9QBXOwKx9lxBthb16Y84gja/ee8lH2q
         zvidhGmJu0SCA7lOmxWAGvOHbk3V3H9Tin7Uxjcmb2Q8CgnN2k5cQSAigRo1kDAdBW+y
         y2TaGtsl8olEXyd42TUQBzIUetRiidiipvGUx8J9J+nyonQFe6y/kxSHgE6QHVpePwKG
         PqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431016; x=1775035816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+myNUoESzTzunmiunAZb/MpzeT9fXKqzdgO8jfvhhhA=;
        b=ejoBGKNdHrV7kLsvffi5+qqemtZ1vzHyvHk1Jw7UhIw47TROvYTZ8vXYbkL/93+HhA
         jcWTR5qgRFNAmcYT6oIUT+Dpkb+kkOWfD40bEo2kp3oOVs2iBYR7BYFncQo9kRotZpad
         2yi3kWBv6VnctCQ+wIdd4Yu47iUyuUzumXOUboxyqxVT+QdLtc35BXaykYUwCmkkajnQ
         GDrHW+9cjh8PFoJI+lrccOuXIYxXa5SKxztglC9NjQ1/eyJs8dQ3xC+UTzUiDmz8F+hR
         6OwvWgBJrit9rK+IEasUefrG2QpLkoNzC7HLHMkcFsIG0/weWRNTdzwUY1zilNZu7QSf
         rBmg==
X-Forwarded-Encrypted: i=1; AJvYcCWOBTUhx3gwE7HMMhb7TtWzPyGy0+UEUxl2lTGeq4JqL+PskIOOpjoKsL7XbEA2WHblQ4k0jnk3towN@vger.kernel.org
X-Gm-Message-State: AOJu0YwmXyoeS0BgHvYbaHm34qLi6bMXZpFRZLCqoM0Xpw5l50VFbI0I
	AWhBABj428H46KHdkfQ8ImXRDivY7Llzh30mKJDnbmhz8UYcCbyal3t7
X-Gm-Gg: ATEYQzy/8buJcmLNGxFKA97c60Xix0VoH3dupiUPb1wXlZTQtaUhVyLY/EPfBkRlcdH
	RGBE7IjIMrG+kuelkE6ZHumCWZiBkfS9nEmCdyw3Pdt2dbt61v38YngPWznKb6ky2csFNmgla6x
	XFiJIGSfQW09zTbqv+/w7Mvb/lm7SIbsTB+IfadHacMxAh1QxZScTrD2pmx6Xk9lVkHYRDTeaRD
	8WH4Rn1n/4xT4xmgRDHFHbcXQqyLyRwCJq0ChCzwdS5sA+SziPHBAPOchKptnxeXCZjGYG+fBgc
	BKBwCkZHCVX6+IFWAp5rp1363ULAME+Ohtlh35EomPCxxVXzb++1Lna4V2AM1FHDIs13Dtsyo0i
	83yY5AiMhR1VWZZ0RvoC6Jwt+3SXEyJyeTO4Mq2E7/UtXFP+32v7kYb7z9ad+7vce+5YGNcP1xj
	n1dV8TwXqE4/R83+Ne+50c1Oc=
X-Received: by 2002:a05:6a00:1ac8:b0:82c:6b05:d756 with SMTP id d2e1a72fcca58-82c6de9f69dmr2775901b3a.20.1774431016212;
        Wed, 25 Mar 2026 02:30:16 -0700 (PDT)
Received: from localhost ([223.233.85.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm14781398b3a.31.2026.03.25.02.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:30:15 -0700 (PDT)
From: Anushka Badhe <anushkabadhe@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: anushkabadhe@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dsd@laptop.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v2] dt-bindings: rtc: add olpc,xo1-rtc to trivial-rtc
Date: Wed, 25 Mar 2026 15:00:03 +0530
Message-ID: <20260325093003.44051-1-anushkabadhe@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202603250854523a8809af@mail.local>
References: <202603250854523a8809af@mail.local>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the OLPC XO-1 RTC compatible string to the trivial-rtc schema
instead of creating a standalone binding file, as it only requires
a compatible property with no additional configuration.

Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
---

Changes in v2:
- Move binding to trivial-rtc.yaml instead of separate file

Note:
* This patch is part of the GSoC2026 application process for device tree 
bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt | 5 -----
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 2 files changed, 2 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt b/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
deleted file mode 100644
index a2891ceb6344..000000000000
--- a/Documentation/devicetree/bindings/rtc/olpc-xo1-rtc.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-OLPC XO-1 RTC
-~~~~~~~~~~~~~
-
-Required properties:
- - compatible : "olpc,xo1-rtc"
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index b47822370d6f..722176c831aa 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -65,6 +65,8 @@ properties:
       - microcrystal,rv3029
       # Real Time Clock
       - microcrystal,rv8523
+      # OLPC XO-1 RTC
+      - olpc,xo1-rtc
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
       - ricoh,r2025sd
       # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
-- 
2.43.0

