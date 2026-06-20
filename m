Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249FE1459FA
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781930414; cv=none; b=haJL/h76Bud4GznKY+gdQOu3enfV3yk9QdYEJAG4IACII06JbrOzZOkKIMYxbTG5EN7kODe7rETsOlNNhIHNoNWdklOKsPCNs9DyjkiF1dKdS/VsH8mPGMDIsC9ezCWlTIwRIdB7mCHNAcbJcJj39YLED/A9kb2MISHSFqHgTDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781930414; c=relaxed/simple;
	bh=j/KlcuqTGo4rbWXi3VJtgHO0cb10VIMP0agIXghvbZI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=m5TC5Hn3jMpHu+mg7h6LLnkjaqB5eJm8q15OiSCLiRnCJs36OKS5Q27WN3kzoGAOMESpGg1Yf4qaIdNwE5gc5ZL5pFEg8qlxQe7Q3Ypwz4MgSBkIBLp+zkbHDC+okKA8OuZnt9azoVHLph8rbjyJ6XDtusRAsb77q/0i1Y14tsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJpywN1F; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJpywN1F"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-486852c7b68so1588749b6e.2
        for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 21:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781930412; x=1782535212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJeeU9eoXdSFt5ADMYLY67sHZOm5Ehw4SyZLtOa9Yzw=;
        b=dJpywN1F/Rlzf93Nzv92+iinhn7bYEcUztekYMIkHR3gZtu838O5lEn+nLPcq4ymji
         8IFxZg6jRPsDFXSDZaEjkVhyIuLGEIuRB07Qsl6zy7e+wxeqykwBr4S2hjLwFsyUP5JJ
         FLsLKebt/xgziQZueS1qIdZoVilQ37M6OTMgC5oFhoA97FHy7Na8aGuqKBGQ1BrDbmMr
         6VzdT+SDcWUHRboWKodNlKLeifSlMIz6CNAvVmqOF+tRJxBMxeTxDNdxzQDdN/5asFrT
         nr65iPp6WwQSyfytevq4gF8yCr+IGtEljPJlQ9vQVTwVWKyCqRnoZf6ikaICxZgtNX05
         uz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781930412; x=1782535212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJeeU9eoXdSFt5ADMYLY67sHZOm5Ehw4SyZLtOa9Yzw=;
        b=Yg1/3urEs5YWFISZECwDQiJSTtglnTl2BJJqkH+o2VMRqZxaamwyrdOagiKjAW1w0F
         pmjsqRGHx1NObYYBYwY9wHwe6vuZM21CoAut9uxGAcqlw9/rKPUi97UrVbzdJsXgw+aH
         0N7McHbUs11vnSErZmDBjs8L1uYOyDH5bkExPzGLeTkQpvTS+uHoxBq+6AAdO1PLHgM6
         qSmhI9m6ubvTYKvu04Qp2nGl3UjLuS7IoCJ2F3kedExoRcw/dMhMWrKvH2Q8ndIYtSVe
         OWRL1/okH0HZ32JcO1ogP1KM9g7h4WZbRqH47DFsR0WJOs89oSndu4ZqpQoh8+NQwS++
         qE9A==
X-Forwarded-Encrypted: i=1; AFNElJ/xCOqo7D73nzRIG7oLmiNIYmoJDrWQWlB1SdFNIisuKjPUdCSQMIdCnB/9I+DmjmeYoyDi7sPc9yVG@vger.kernel.org
X-Gm-Message-State: AOJu0YwmFFE2ZO/08FqQ+Cxkrwqo98h7Th6SwIJgsEOIFRIl29iqHQum
	9mt1LQl1NYEu95TBBgPrZPuBlmNSs+Fr2z+nWLMLceqH8gWRCIqpxeot
X-Gm-Gg: AfdE7cnIOKjK54rPJ470azXKx86maHsx2LTI2YHjskC5NDbu6apmGGO7XTwZCdGLL/I
	B3qcAwbvXDAsBmqFoZmK1LL2+gQbhJ7F/B0PF7Ud/j2IP33yn6e5V/bUuaLg0DKl+F/LB7phsVL
	yGf+Nuy3vQ4kUvCilmzyALYzy9lYr36B49c5MS0SCsESTf+LxLnGTq9KTGDr0ga9u9XkQJnSdGy
	e57RBhX1uAP5WIOwBe0XlGxjKUCrinxU8kWEZ/qWCh3F0Qpb6RjO59duLIphWIM0MkBDlIfYTOv
	41doLL1kyKRS2Sopzb3vBBKGZbipSSFa+/g28O196eRQvaIrQ1JHAJhpAPtXKLwCkX6jalrLfkv
	M6GUvWvQM2NjadVzRQ8Y8+qnJWISKnNyv9Gvj6iZS9aBvJWP2pmX9/1b/7RjTTco+bNvB6W7wxi
	WFJiDqjFea+lLpLH8enp6eTJxv75muC4Wr5z92+v7h47k5zty7YGp3QRXB5A==
X-Received: by 2002:a05:6808:2519:b0:48a:8dfa:5219 with SMTP id 5614622812f47-48a8dfa5859mr2516921b6e.3.1781930412044;
        Fri, 19 Jun 2026 21:40:12 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48aec0ddd7bsm679754b6e.7.2026.06.19.21.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 21:40:11 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC PATCH 0/3] Add Sensirion STS30 temperature sensor driver
Date: Fri, 19 Jun 2026 23:40:04 -0500
Message-ID: <20260620044010.1082621-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch adds support for the Sensirion STS30 family of temperature
sensor drivers. It currently supports single-shot non-clock stretched
readings as well as the entirety of the STS30 family.

I'm sending this as an RFC patch as I unfortunately do not have the
hardware right now. I have compile-tested it successfully and have done
a tad bit of testing on QEMU, with it properly registering with no
errors reported in dmesg. Unfortunately due to the way I had compiled
the kernel used to test the driver it did not expose the I2C bus to
userspace properly and I was not able to retrieve values from the
driver, but I can continue more testing over the next few days and am
happy to answer any questions anyone may have. Additionally, regarding
dmesg logs, I neglected to save them while in my testing, but as stated
previously, I can continue more testing over the next couple of days.

Maxwell Doose (3):
  dt-bindings: iio: temperature: Add STS30 devicetree bindings
  iio: temperature: Add STS30 temperature sensor driver
  MAINTAINERS: Add entry for Sensirion STS30 driver

 .../iio/temperature/sensirion,sts30.yaml      |  49 +++
 MAINTAINERS                                   |   6 +
 drivers/iio/temperature/Kconfig               |  11 +
 drivers/iio/temperature/Makefile              |   1 +
 drivers/iio/temperature/sts30.c               | 321 ++++++++++++++++++
 5 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/temperature/sensirion,sts30.yaml
 create mode 100644 drivers/iio/temperature/sts30.c

-- 
2.54.0

