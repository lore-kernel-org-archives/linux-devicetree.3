Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01873D16F0
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132739; cv=none; b=fb+DxZQYGhgf8g8hMhYAFw6tardwWqyqF3r7N1K8IRithCqW8NcGY0j6Xuo8Qrfh4RO2G9M/xUwygzYYmUqmjHQ9pufNYxJaJ7ANXGlhycYU8NKPFVpZykDG4Uyuf/2YCHDGaix0rG/QNuQuNc7fT7VkiUup5IDXlOIQZZ7yvZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132739; c=relaxed/simple;
	bh=v+M6jZZkpPcV65ZunZ7LyGs21aPM4qlR+wPHbDyhJRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES5fWFIjrjBHh9hlOERhQdLLf3wJ5kGW/dAzcFiDQjXeq77y528VeXTM1NuLR8q7T3VvMUHfNSBDRokr43yi4YEjWMUPDbPrcUQ6ZMzCys2MVi83tBVo8+7cQh4C4W0Uz8EbB2QGJpHePM1h1Jg2YMB5sBx4e2IXzznlvtRlj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/8PimF9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/8PimF9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afe75f055so853035f8f.2
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132735; x=1791737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=K/8PimF9FwoLvW9WqIiGJP4GMxTwD1xLltHZWrAfNRIWFb3IcYuPT1DwV/A2uuk2WV
         +itZ3oPLVDIT9BixPyQQX1f1EDA267huN/+CbmeEkl0mTAD39CJ11wJLRQuSoG7CAyYk
         Qd6/eHOV8Ys7SVz2LGG/+1+qgCL4Br2YqcJcMIr7Cn3OTYhwUKldsfhKDbSdqs79w1Bt
         xIwmaBLPrwVclr5ZU5O6Z4/r2+GpvMFZoY76tqa8u9VCN2PvTUq6yLTtxBjf1XMXNrL1
         vNDbBrAFDa8H0KKEdr4oCY5rBwNKu6YBT2Op/BqwLClTIblLYPYFsT+zR1hbAIHQPK8j
         jwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132735; x=1791737535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=ZL88+zWn3u2q3RNzxwXu033wX9YcLo3t3x0jQH/WozGiO+/8qrJ+3LG9uKN8xTor6r
         iMJlASqVyQb6SNeYbkhF7ypdMm/FBCbEQ/Bypl+0yYSDCC9l3lPHufNJw3bUApr2Goe/
         Qi4jxV/qdCECmoLiuDGkHHwtyIolQWNzIYtXfT+H8Tbj5djxP5ZFMgFZsCYOdD2Ne3M4
         i3c1vG+Vdc6nQ7zQc2L95rnnMszkH8uk+bv7o9iYHarPd0/nE6Pvh/QGmvleEFhz7Svm
         Z3mVtrkhJTGomIRG4iPTax2OkoRcyc3AgexeLmNLdu6DEyu3vED60ez+LHstgJjRP/Hz
         rylw==
X-Forwarded-Encrypted: i=1; AKwUvBwMfLtNaGVFRLRm8vfXpn5qxCg0pakIgDDSqH5CK1ORa98izPx+B5XJL8kxwq/oEozJ1xf6NwP3N+ze@vger.kernel.org
X-Gm-Message-State: AFq9FYKD8yz9UkGBAbGGxgi4oGau/uqINpPCctP1JCBQU9Bb27gdRSkR
	VboZEUG7NdvzhpjgyMgohdkyyQyKUZvWMtIvgieJbfSVB/Aj4ZSm7g64
X-Gm-Gg: AYBFou3Db0Tslxl6q2x5PXG83+1i5vsJ+MblgjRv73upPRvwXiQ1xc3Cm1DcdOW1jm3
	620uEbsV8Vw+6OHdem6UBfZ/CMXfXxQT9J4db0E7EWoHZOww9HaUI90qg9DKizFczZJzHt92mSh
	Ox2ocSVhv0cw2H7lG9gWy/Owwgn34fiBuv/iHUoOwQtWylm6IDnAl89qqdwnJAuwkWBq+Lpx3do
	tX02MCjyZ2KPlyBHVbqzF0xtIo2bKXTlsKInCf0Cb805SviaZoBiZtPZwCQX05gpGkAgCP1bt9y
	+AxPC2+K+uUq9EANpZqgC0MYWKe+xZX1tGP5QnQaej+Z2s0Jv+0X+dt2VZ9WKmLOOnmhAnKUMy6
	jcFRum+tdmNwosw/72mmt1M6W4NkiA/HBMlafMfIRh+p3prEHiIqPIjfYKuaQbqYcyJ0HJCAk9L
	xiCQ3NeaO5v0pWYrR3sCcVB4QYUfUYqZQF8GhKZBYa33STR6AZntA8CisD5GEj8xm17Dncqpw72
	Ny1sRyblbhMIvTSX8QM/rNH+wy5dg==
X-Received: by 2002:a5d:5f86:0:b0:486:e835:ab88 with SMTP id ffacd0b85a97d-48c47fc5cb6mr8242586f8f.13.1791132734865;
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: tegra: separate schema and adjust OTG logic
Date: Sun,  4 Oct 2026 19:52:02 +0300
Message-ID: <20261004165204.205660-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate Tegra specific USB controller props into a dedicated schema.
Adjust USB OTG mode behavior with extcon use.

Jordan Viknar (1):
  usb: phy: tegra: Disable internal USB sensing if extcon is used

Svyatoslav Ryhel (1):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/phy/phy-tegra-usb.c               | 55 ++++++++++++
 include/linux/usb/tegra_usb_phy.h             |  1 +
 4 files changed, 144 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.53.0

