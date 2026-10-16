Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82B36F908
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 22:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792188983; cv=none; b=OOnP4dm8v+IRP4i/DFS5V3GMxAiQZnkPy5BhI+WlxMLPTaj1CIqI25Nw9p87+iBa4OY+fXV589KCzXXBWAwENmzflPuwL4P3fB+VimSUzeaTYkV/KP6LTIoih0+rSagkJ6DK0jmgbU6jQSpcxN2nQpUqWHHjlyinD5ucopMB5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792188983; c=relaxed/simple;
	bh=XJsty+XVq3BgRuwoN2PV39ABqsBfB0LokyWIO3aDiLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+A7l41s0+UMq+tV6jktz1WzrLrKRqY6X43d2thAy129uZdk/gqvMAzNjkqgFxceMzTLJvZmf8LIEilDyRytggN+wVJaYEk21VoWsBXQQmgmsSHFfyLJ41PmXmODvkjLS06G+M68eZwiUvEdlzOsEibCH15DgC8ROybS3C0WOx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbG634vI; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbG634vI"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-16ad92569b5so375460c88.1
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 15:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792188981; x=1792793781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=ZbG634vIPC+kuAzhAbUYFxgmlxlQ6ybF9uI/bvrzn+X3X5YMCdOfRk5Cz2fKwr36Ov
         25odjBoN4/m4wZFwKHPGG7fWShsJ8OcaQoI25HsBXBasmhgy3KoGIqFmUf0V+Xzlsbcz
         5kgz80MkzRjF73+xLKPQL2O9OmINQziqn2XNykKrDK0OYRwkSFE52541+zHDoDeLRdT+
         mTpIO8phRt6dez3RgwoqqEaJh5xnj+r9YEfynDg1UEOK1B5rfF0qdBVjYDKYPHBD5MIE
         QJYZYVElbkaR3K/pxC7h5fpl01+9Rt9agD8H06zyVG5Eo3IK9vyar0kORxRt/nvti8nv
         WB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792188981; x=1792793781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRKo08wZU2d222RmzKutSRcq0g6gJCTiEkblWEA6+U=;
        b=HtAr8DgjgBFtsMufTBw660BZgUecidMRYvwQ/o1b4nBorxj8cdN5Uzaya332u/SKfD
         Np9CD7c/JhHY94ORFpdxjuerXNGt1Ago4HQTVQ8SqcAy3ROS3FVuiGa/SyQ/YQa3Nh2e
         EJ2IH+aAjT3dFjuBXGwmOsH1f9RV7UvaZjKqT0dCUmvpwexw8Xg2e4D04MpdL3pz29qw
         8cW/UYKo82HM9VdGqZZtFkfr9sfRdyWDWtRlTPhUCRJcGdi4PCLFNrFy7VrBPpVCiE+p
         DdDvRiAHGj4m3zgCT5SPdGZrBbNqhcFX3i8pHYl+JoWWUBAIWhY4QaETaSNU4QpVQ4b2
         /SQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsjTRDxSDQXdsxmY3ngaPaMmszJp42uU4CtiT91WY7m0wfkeOjO9vL40l1ajgvXLuQYFYoM8r5ROsH@vger.kernel.org
X-Gm-Message-State: AFq9FYImGh1O44/zitK+fQ0M93pCbk/QzURvc4gexzBpydkytFGR+SWD
	xNFFTxoJ2gV3tvWMxAXOlQswwIDARtKgLheGiSa3xziEHR1xVGNbYTE6ruj2qg==
X-Gm-Gg: AYBFou0t1iq5Zw/S7reUz7XUJri5LFzy/joE/VpC3bnD+QhEYzJ+S+r8FMafFy/cgo9
	FCekX3eiV1gtSRYkXo+vD3TBYrO4kpA2FVPet7UeS+wq/QdWtBghCFweB4FNtH4bHFNQ5mSsV01
	78wkAKNWgPBtfVHXz4p2A3EhZ7FE8bUB6KPpKUEzUAwTH4Dd9Y/HozeeCK/PZg2lkz7vZh8Trb7
	H5tLX+yQscX+7Mus9lGVlHYySea58F5BqMTFA4YsP9KnzLf0vmP3UbSgSyVAEmqwM6ND3yNW3p5
	fxWB9vGwx90SSnJWYIyzcR+m0o5WysiqPfe9NmTFBEEZyhnpVlenuMYopVBI5h2KaoQuyF48RE6
	VnExo6n3q2QGbUNhnTh9UEzyqHnEUs3bWBnK82JQgtKRuREXaDl4QdHuUQYKrGJVih8iPReg0gP
	2zAT2xVSAVJ4tQZZHX11XXOKlFBptjeGcVWZ2UzcF/07b+8n9WzoDLfH2knxpNm4BYm9vZsw==
X-Received: by 2002:a05:701b:208a:b0:168:fe32:35a with SMTP id a92af1059eb24-18512296a20mr1365274c88.20.1792188980748;
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
Received: from eldorado ([2600:8802:b00:1f84:d294:66ff:fe95:a98e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fc14sm10480863c88.6.2026.10.16.15.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 15:16:20 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mingyu Wang <25181214217@stu.xidian.edu.cn>,
	Robert Marko <robert.marko@sartura.hr>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	manuel.lauss@gmail.com
Subject: [PATCH 0/5] MTX-1 watchdog driver removal
Date: Fri, 16 Oct 2026 15:16:12 -0700
Message-ID: <20261016221617.2223004-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series removes the bespoke mtx-1_wdt driver and migrates it
to the generic gpio_wdt driver which it should have done ever since
gpio_wdt existed.

Assuming the patches are satisfactory, I suppose it would be easier to
merge those via the watchdog tree than the MIPS tree?

Florian Fainelli (5):
  watchdog: gpio: Allow devices described by software nodes
  dt-bindings: watchdog: gpio: Describe minimum heartbeat intervals
  watchdog: gpio: Support watchdogs with a minimum heartbeat interval
  MIPS: Alchemy: Use the GPIO watchdog driver on MTX-1
  watchdog: Remove the MTX-1 watchdog driver

 .../bindings/watchdog/linux,wdt-gpio.yaml     |  11 +-
 arch/mips/alchemy/board-mtx1.c                |   8 +-
 arch/mips/configs/mtx1_defconfig              |   2 +-
 drivers/watchdog/Kconfig                      |   9 +-
 drivers/watchdog/Makefile                     |   1 -
 drivers/watchdog/gpio_wdt.c                   |  15 +-
 drivers/watchdog/mtx-1_wdt.c                  | 245 ------------------
 7 files changed, 31 insertions(+), 260 deletions(-)
 delete mode 100644 drivers/watchdog/mtx-1_wdt.c

-- 
2.53.0

