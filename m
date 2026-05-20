Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37A36EAAB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262161; cv=none; b=Vuzeq3YhKMnBs9ZcG9GJOY+X6mhcNVYLNoeyMmbtKjhZcb+6XOHItyaCv0l7kviJKruQsOPwIljrxp4oorSqWoylowb4NovKeXRRjenyRVwF5Z8qemcNZPRewz68eyHIFWTd0StuegR9gUlBcokZ8CE8hla5VuPY+2skgygykDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262161; c=relaxed/simple;
	bh=E3m8x+5Py+DrS1yhwjO4bfslD31NqZ/mOBktiWRfdYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mB/I+1AKHEE9AlURnsvyjis8ZErVVRUo7Bv/NB79Ow/rbV9gz+7e8+xnX8kmdryD1y2kYO5lta3JGRWAS8nMIDA0sLOOOoXtP2HdYISMAjl1HCqMB4gpbv+qCBg9UPHez+iFaQJbwxv1Cn7vIzcN1kmP6j5JujqyFAegMAGAFCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zwp8o4ir; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zwp8o4ir"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso1709193a12.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779262160; x=1779866960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK8uyh5+5gdeHTCxNeKbZQznp1Z1On5Jje2vJ7+Ah9w=;
        b=Zwp8o4ir+C7flTamJlshf6rLgfr4jJrGTNQgXvItc/O1eOMAIhrrEUc6MJHLjxLa6M
         6AoTM0rYX36gkaLtBjaS31vJybtKyxug+7ZnWEb5ioywQM/SzX3Jk6fmhC/VchsYEqhy
         9QOo8nPDT3anAaCeZERTTkwTrJQ6L3PlRDUfx4QEnUONVgRp9Ykt9ZZa34FSsjcWnv8k
         t3Tv+zlUBLBWy6W0vYFhHmNYg6LLaxyEZG4KoAGjDvmGzE1t4p904OoG+qjgLCg1cBW8
         ktDfynW5tSwlcX6nbFXLDq+mmqESwl8z7FaR0wy45r0jjlqkQcrkZicKrRKzsd2najst
         XHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262160; x=1779866960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AK8uyh5+5gdeHTCxNeKbZQznp1Z1On5Jje2vJ7+Ah9w=;
        b=DRhlT8FcCIme8yINk4lEu3CtUmSRTUE4P6/jWygxk7cwkBz7lbyP2GI2MhzOvmrfIw
         qjZy/FmnBNyV/ZFe9xUoTd51h0cDVuFbKZ8ES4bfZFe+Bpik1Z8iT5XUSxSCYd5yzE5l
         IIw8163gwnlTzdAuP5dWgFesznKrs/EiYQzFfn3ow+Vaff6JRkHss1T7IrxoduzWoPW+
         GSQZ7bC8LD20zCM1S53jRcKvCKOiwMgvS+0USXFnpbI1XBWmH77G9Iuw2E8YqQOJ49W/
         Z0wqQc3AZdRFCF4+jheH9LweGd9XttYG/GFf3GlILTwBDYaUDCKBhskQ3FkOvYH2jk9U
         GMrg==
X-Forwarded-Encrypted: i=1; AFNElJ9XcNx2i5wZ2+nKkfhVrQzzQoPO65Z1KkGgMNjbyakZ6ey3DiZxJd1+WmWUIjSY1ZuMEgoHtchCZXR9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Yv2j7m9/o3IvGFB+MlRdtI4dEXnIiUgoTkCLyao5WdxVGwaX
	j7vLf0Fu3TYzzrbvI1gkt1j6HQ1RhggjQBVL7HWT6KEvfjRyx8yHCa0F
X-Gm-Gg: Acq92OHYZTgrDouYV0lYZgYXcBHa47aZz2IWfZMkTN5S9DSSA+tixZ5fxCtrLguhc/I
	ucG0aqr/QezPXdDwtgFUo1Ry7XcS4gfS1H53FzwO97ViraUO20EeHK2IjAgwzk4jp8URWVW+DXc
	9lWaIyeVXTV8Ef01ZqpeNE/yEvl9eS+l3qhv8T0Ktg7IGReakU98OPffZaAOYeWFiwQe/FxkwHr
	JLQsuqFAJMQLZ5dsGho47fky7yvxnl1km07ajDf2tIiLb+t1+KiwhxMC+PimlOfW75OeJAMYFIH
	sadEJdjHR2whfyvh52K/JSRzmjNGEP1vrVOm9J6IB6V3/D85y1tfRqNPd19IgO9wlL0SkfOIu73
	Q0K3WOdRJlmiPywxpy0HHzComGmDUjX/IFGlhb3BMKsr8ikZ2GVqZXq7llyKZ3jcU5+axsIE8xQ
	fmFHEW3RuBBAkh4dN81rj6vDeMCyLwyOwNaJZZYcddCYzf2yCoD2WzzXBX/eankw1flU4LMeR03
	xRmwX3PwQMiPi24vEAlZEcvvFoHJMhWwI15ECH8W5wSLjuX
X-Received: by 2002:a17:902:ce85:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2bdef15a1e4mr111156975ad.20.1779262159642;
        Wed, 20 May 2026 00:29:19 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f27csm206258595ad.25.2026.05.20.00.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:29:19 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] MAINTAINERS: add Open Sensor Fusion IIO driver entry
Date: Wed, 20 May 2026 16:28:43 +0900
Message-ID: <20260520072843.3593-4-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520072843.3593-1-kimjinseob88@gmail.com>
References: <20260520072843.3593-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a maintainer entry for the Open Sensor Fusion IIO driver and binding.

The driver path reflects the current RFC layout. It may need to be adjusted
after review if the driver moves under a different IIO directory.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d7927..001ba4ea6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20011,6 +20011,13 @@ F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION IIO DRIVER
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+L:	linux-iio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-uart.yaml
+F:	drivers/iio/opensensorfusion/
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

