Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920A38E12B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973853; cv=none; b=lgw6KoncHZwIzMf3jvLp8bmbG5uXmoo7dRFM8KRKk8sCHxwBSh9iRgwfawT9U8vLrKqz1BBnyhR4tuNI+QM13Zj0TTcl9l1PJf5TZn6gehRMRQTfM9DJ4rmAmjhkkn9dOuT5eVeS2iKWy3a5hDiqJEv3umDOsPI/+dJrDnMc/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973853; c=relaxed/simple;
	bh=ux5Y/3LCQzHxHZau9PhawOjE/YHeuznlELaCm+TSCwk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gcXmAZg9JEBR5IIBCPz9KdPUfMtOROThiFq1QOkiW8W7Fm2iETP0YIsZAfRyFLZiUn4KI6AGKJVFvXQcGqFG/Uf3TCXPKfFUmgBxCrfyzuCjE/j5QNjPaYBfMCBtneKrYpEO13n5ahzBrT0+pe/Cd4xLvsclJ7O7JQ9QQqFTuTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk0bEVTE; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zk0bEVTE"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso1964088a12.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973848; x=1790578648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=Zk0bEVTEGe9OAtTQBt5gmrN50gWiuTqWGwuc1229LaxuXUaHqY3450iK44FR441Cy5
         U/1iX6Al4eJLqdb9Ud8fWjtVwDnUCMb3XLq4PKyRHtPFR/76gw9Gt1is7f2yhAKNElW0
         Oh68tsHWJ6nawy+oj7zlv2MW4wnG1TBFOSvrRHHRdVTHJgUvcXwrOJfGtFYZ62MZ2wSF
         FKFtl6tn4oLbomdn7mrS2YilvPYkct1vJlaDYAqzLklJ2DnCUp3ZSFI+uTBZMIMSIeME
         h+j4TzvNMAscj6Vhagn4oGvaTqaSgk8A+0vrsW/CDrvgzBIckx5jwbfsPxf+jm+wbiLn
         L/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973848; x=1790578648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=HmswEgQJAthIbghXdS/sKfaR+maIuccU0wtb5FOJTiLUzBSOzQC2NP2B9CguQTv2Ka
         S7BJKAck1oy6aLDiZD7XJcHLUQFLdJkQfV+Q+UzUtrP3hk6HVWp3sFRTY70mCtis129w
         fQoouE00HSiiTWbpNShneW4bhuDNB2VOXBpWrIT71stE5k0BdgG4dVE9NUCQS7BO1l5P
         KljtIkmbknT+eNggEzligjpSW13hKlG6YcQd5inloUKpw/2oXY1KaXj5IUu7wTSXMZp7
         oYCeU6oRV1ymakhW97YgWo7zhXyDt9JdDIrDIW4Ybq8jYrfs6PAgrhaJ551a7ULGh8mc
         ygvA==
X-Forwarded-Encrypted: i=1; AKwUvBzrK8g2SHvXXADxoH1B9K0q/q1vx4n35pxPQLEuhJEjYungS/s+kBmd6xBpC8FrK/Xz5I28seiRfmHq@vger.kernel.org
X-Gm-Message-State: AFuF++mcV4tz2qRy1o5I+UcIzz8MHJOXb9A0WbBhdqElqggyd+VSSI5W
	esnxqomVrTxTx1Rb7R1KGl/Y/WowBMfPvlVGOrvjxdstV0NuZANEUCJQ
X-Gm-Gg: AYBFou1S2Uvpwpt1a1IipRdjt40nkv8W79ncum2q9XcVH2ZLyLbKk57TlOzfOisJOLx
	CfLey5ON9nN8IzRpHMxS6wLMGzNsF8WvrXX/5JEPGw+Y9ZiqNy5IPNSdFx2Pz+0Si5RhDEPtaRM
	Ia0UEk65D7lwBY20fL9TPSdTmJxiJ9mChmLZ/aVMUgcSHJY7VS4ECDF9iLlHTNbdUz+BHXE/Mp5
	/QpjbNuDZyDpygZC0kvUhqh5w2pkBqc1LYm5JUwEcHqA/17gF7y4VlvRUONkLGvP0qgcp5ZhODv
	d+FE589nTXaK/snZdP2kk0pP11thpQp2QOhK8u2iE5bTGRaJt6GCKGQMGlYm41jBh2W00E5BaPa
	X0z1KHymHeWztp8JTOTFS2bI4ZHspZ7taCYHXj8x1jrUb9PYmyT/0ePd7+sncw1PPFCO7vG3gLD
	Pw3mdBob8OggnSTqTMwA4tUMTAFPp1U1xvdEOFGq/rVOK77a9tQgywJWU+NjafH0gZVdDvQGsLy
	mkNg/O90XWUmZQ42NbA4w==
X-Received: by 2002:a05:6a21:b8a:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3dd8c53b1c6mr16053662637.22.1789973848374;
        Sun, 20 Sep 2026 23:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9391:ec5e:64c1:1347:62e6:6b8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31398048c88.15.2026.09.20.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:57:27 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Date: Mon, 21 Sep 2026 12:27:00 +0530
Message-Id: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches extend the existing driver xdpe1a2g7b with support
of xdpe1a2g7c model.

With Best Regards,
 Ashish Yadav

Ashish Yadav (2):
  dt-bindings: trivial-devices: Add support for XDPE1A2G7C
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller

 Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
 drivers/hwmon/pmbus/Kconfig                            |  4 ++--
 drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.39.5

