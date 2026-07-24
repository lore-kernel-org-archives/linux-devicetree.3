Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1293242AC
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918604; cv=none; b=GXsANj/4DrW5EY388jdrRUcQtkouQG3QXtW7tlFaqSg6IpfnOWGrOSsTy/uqbHq5dJauNpPTFSuW9w7xs+99m7XLpaEmT1mryOMwWHotvOHdV6GBX0FDZu/naEVsqOLU60y2Ll6nSHsFMzsBpptaFzKmwIsbNwNL8KFfeIVBFq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918604; c=relaxed/simple;
	bh=GP9IFwbiigSeJPvzqMICj3Nx5GxSPoOIThc5SA+/644=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DRbxEkDcNjCovTwgfZQ9+y8eq6lltHUnbxNsX7x5ONxpQ9WN4/Bx5FYamM2ZnqJRdA8XXeJNWVBt4jZzXowNpLQOKCF/RokaNNNaEFpAWkuCfLJJ8im2gQOsX0ueoZB7aLvs90YgmcBqB6yLFablxDpR6ZZgzVgJqQKpSBMobS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNZK/yFG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNZK/yFG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4237275e9.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 11:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784918595; x=1785523395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tiB/j/1EHf64fdSZiWk3JUWgesb+0DTWJ3IdcA3OOA=;
        b=qNZK/yFG+LxzWYckKMFzv251Twubgzt5S9CdwpQpkiZSBmIjyQEJ2I8DQdxEjva/oP
         7z+nF8TnCxZA/e1g69MGplCVd1nzJRD8ee1wvY3uTO/CK7hwWzRkqGVgIWYZEx/n2Q70
         DqEwS07yZ+Qi67R/UcyewtZKmIHXabzU3XaK+tBNjGvHUDefapKmJbkeaiz2STx8Mmj3
         Jcez03TpDEfDCpCikMkSetrnHbkHiO0qGJsHcrdbsZMV3w6ub/D0mJMphQksJvWXSiou
         XvbqLlx1wtZjpcf3IBRAZV+0+zmxmWH71Csq+wQbXFu10HrzPd7rIzYu0nbTZ9SFB7KZ
         8d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918595; x=1785523395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3tiB/j/1EHf64fdSZiWk3JUWgesb+0DTWJ3IdcA3OOA=;
        b=drf52JjczZKDffi6WHVXboF2oR8L/Jf8YiIdJe6PKyjf1j4jt/aQvnSjwGwT0TzFav
         X+rIUCX+oia9QNFaAO6KIZ2OaFDEh7vScV6FFYv61/DMXwrefKA9vMKi5H2fKVNNlKmS
         FAXE+6kCkpKDsjyn0wxQ4vIz9RoTsjtp52HXo5l3YJwdh1m2knLGrKYd07RTY8853dE/
         s2uobpnBHO3diZHnafb8dwYg525SWSq1D9WEThk7i3b5bS4SyCTHT/Y0K0j80KZLxY35
         Mei9SrWxXKBX8xI7wVfO0ta2pBbmN9pHzZlVbKJ7CbtasWHo1AKQMZGtyxjZ2ffDBEno
         YOiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rppi1YgmppchagWj8k/Kn2e9ehzzy/dtpaD719h/QIqqchYke726MoFirmtkfT4t7JeuIHky2541QOB@vger.kernel.org
X-Gm-Message-State: AOJu0YxqpUrt9ElZ4rmJvkvObcqsK0F8odygRsSLL948JZsJQrkq+Ip0
	qVRJIlsl3ZO3Dyby1+kV1yieqtJEwy2aFyZfAzA6OwA5eJBD1vpO/Q6X
X-Gm-Gg: AR+sD13nVtXNNR/K2sM5ctRVFmliJ8327g3LN8UCd9z7qVDGtxxT4+b4nGI1ocKUU8Y
	WHoDWiMWxTc+G2QED5yQj3gf0wHg3aismpVz3/bnz+ekRcItthBSbAH2/aewKHGF1Ip9bOkUL6O
	4e11NlEDyhY/t/YQxmAz+d/fHn1gbmwbZ8VxGCMaARd1WYehKQ2XDqzG3y8AjnZe03IoR3HK4QB
	LthsG1Ax/V/BJVMRdn+yVpO3zM93iWphUCI3Asl5Gyck2LGPNK2cW+D8iHMGXwTLizALyglWJ2h
	4/CQ9YmEKG3XrNzUYtNAVFwte9lFpQ1Klwu/mBMyqJCSF8neosJycnx3e9Elz3oNSTlbc1EQcgv
	vX6RyXLRgV31ImE/beGWV4Zv2JILggdxFiA2EQy4p9ffr/rZIDwONx4dT7Fv8z2OkLRIMZOSc6W
	6T3upn4WtcISC5grinpmbsUx0QGFagU6pxOu43XnPToNEzdzALcCZJFfUaVHE48VVb
X-Received: by 2002:a05:600c:4ed1:b0:495:5d6d:9cb3 with SMTP id 5b1f17b1804b1-49573d13756mr94264605e9.37.1784918594458;
        Fri, 24 Jul 2026 11:43:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85bd850asm25701300f8f.15.2026.07.24.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:43:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: en7523: Add support for selecting SCU serdes
Date: Fri, 24 Jul 2026 20:43:00 +0200
Message-ID: <20260724184304.192962-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is a split from the Airoha AN7581 USB PHY series [1].

[1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/

Christian Marangi (2):
  dt-bindings: clock: airoha: Add PHY binding for Serdes port
  clk: en7523: Add support for selecting the Serdes port in SCU

 .../bindings/clock/airoha,en7523-scu.yaml     |  24 +-
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/clk-en7523.c                      | 218 +++++++++++++++++-
 include/dt-bindings/soc/airoha,scu-ssr.h      |  11 +
 4 files changed, 248 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/soc/airoha,scu-ssr.h

-- 
2.53.0

