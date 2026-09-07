Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729862D9EDC
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781959; cv=none; b=B+5/p5hZn/WdEoH61vEozxJZHXVsVAeBWLc1SX9CBf09YhPl1RB7jlovQwd+2i48h8ecnEG6RTTf7AgA+BRspNW8qaMhouFPZErOrWciLqoQpRPJLkfC4J8Q7jHMZku2cVapI1S1kLlUwOtx9or/8ruN6TZOLZDQD3Okgwl24YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781959; c=relaxed/simple;
	bh=q69YEzhTEBkji3Anf67azf9FUm9z1KB4pZFc1XEnZ5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YbSwR0nbAJ59vNgB5aHzcNz8bdah4LfjRfcSQU/wYEVEvkOZ8B4YNbN75Oi/nbLiv1GTUitmVL0tnjL0lnKZNqcLoqr8Z6K9Vm3rd7jlmnOxffhse6mDYl9pNAoD+ZiwsPgcJw81CrIpub8DpUggcwBualzlIqjGr26TMfqEhjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9CUiKD1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9CUiKD1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso28541865e9.0
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781954; x=1789386754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+vgAaxOdJ37XQvKZXxM7LpSpiTxD4plNlhS9nHZF19I=;
        b=d9CUiKD1Dhh4raXqYeqCCv4ZA6hupSZ6ffiMX59fYoeAITe6T3bVh80hcUFOu8di+m
         XV/yQg4ivOK4Zx00eoaW/XEnljL7znOfXsspOCqEQw6OarxbMnfshSZsFyRdyphZcXDc
         xO2uvoIJNNwffk+FW9YQJMXyCbSUXmPoNeGFdq1yxmgjU0fdX4KsZIYafcl5A3wfb9pP
         p3Peuhr3TbtzAJcDDWurT1+jOroTjVxpGFiLpvFNauetfRAuhZMNQzZ57Gni0TqEZ0vn
         9uOWya/RktoI87XMBPJ9HEmxADEJWuDj1zY7UA8XERBxYU6RjNItO1v117aJ6WpaSLNt
         5qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781954; x=1789386754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+vgAaxOdJ37XQvKZXxM7LpSpiTxD4plNlhS9nHZF19I=;
        b=CskwL+dRAbV6y+pTzgaJPHZKpIZfmKZVb1aiC+sFtML6wh+AzKpOCzqOvuSXL872BO
         h1NBtrZvCaMsgnVBFTqnplURG6sF73TMcFrqg9HeRDoDPiRPtL8N8SAuiZtQG2v51Ln9
         MsHsDaLqdKYtP0NT2xnd4oJWnj+23iBJHzKznOCmRTzpkf7BVHFaUic2qYckiQnM65q9
         R4XKduOHgsSBNuRYcgOz3RCrcFsu452/LiQNftN+BC4FylApx+0iutlTwUu+EBAPnTjp
         dp0sYRMk9VpQE0pEKbcLP1vyM20QLB3NvpaMNU6Nh4wVq82YRVygl8WRfl6gHyWbSTXO
         mkNg==
X-Forwarded-Encrypted: i=1; AKwUvBxo9RIQ56OHN9lBbCZuHT6k8nWIOxL4OyVJh5Bn3tTYxS+sP4HBKuuvN52P1CkhSiQZ35EFd6OfkEyx@vger.kernel.org
X-Gm-Message-State: AFuF++nbFV0QHj7XGaeydA272FG5OiutMxrLBLTxaNDpR6qLnW57qiff
	+Zhti9um1ipqMkLwGIbtkR6KzHR7tYizDHNcwwn/cLdxjtLETmMbEGeR
X-Gm-Gg: AYBFou1/fHMvxjUG/i5JMZlTwL5FpzN2mImZ+t56SqU5TkbD/juB1UofrGV9XjPo6n9
	2JmJBvyEbgr+ZCcoBXOvcqSwBCPWr1xrI6hjNnE+UaEi98Q58KqIPNhD+u0UJNv9v6+F7e2JMuF
	CGMsmzm7jA52J4dYijRNRh/Vt1cuBvEEpzzkpBQGBvTTzGJmcP1Q9byjrUQkodhktfIdAYIKNHn
	aba6ddzkthzCyDOnoLW0V/Q7ibPoj+BB5pDBmFgKFtKBvQ4hLCXFGn7Wmrz0H9Zn573T/GS/VJh
	Xex1n/y1/DgxkGPrr3LESKsjrUI7dx44P4lDQXg2/HFGN+DjJjJKASiHd6v7FY1hOlG6APr2mJQ
	lOFVG22w7jfm3vkbKDnyMt9fSm+w5HfXyVimnfDP76TPMfdttyfe2NkUxf3Kdemh9wuqxZWrt3l
	aeLCArUcH5fsvWGS5cTEn8VqPrt5yTVdO2pLEZ4/9Xoc4jpPbaP3Wm4GTAob0K5Y0g
X-Received: by 2002:a05:600d:8497:10b0:49d:daa:af6e with SMTP id 5b1f17b1804b1-49d0daab034mr51583285e9.16.1788781954505;
        Mon, 07 Sep 2026 04:52:34 -0700 (PDT)
Received: from Empers0n ([193.23.219.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26830718f8f.3.2026.09.07.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:52:34 -0700 (PDT)
From: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
To: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: jesszhan0024@gmail.com,
	conor+dt@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Subject: [PATCH 0/2] drm/panel: Add support for Samsung AMS662ZS01 panel
Date: Mon,  7 Sep 2026 18:51:28 +0700
Message-ID: <20260907115130.95394-1-sevanevorotov29@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds Device Tree bindings and a DRM panel driver for the
Samsung AMS662ZS01 FHD+ AMOLED panel found in the OnePlus 9RT (martini).

Vsevolod Nevorotov (2):
  dt-bindings: display: panel: Add Samsung AMS662ZS01
  drm/panel: Add Samsung AMS662ZS01 panel driver

 .../display/panel/samsung,ams662zs01.yaml     |  75 ++++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams662zs01.c  | 398 ++++++++++++++++++
 4 files changed, 487 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams662zs01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams662zs01.c

-- 
2.55.0

