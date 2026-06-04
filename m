Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6C31F986
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558581; cv=none; b=UrFCmuq4EFb0+48qMeCoJvEyoeJuZTUYo4LeoR956nUKNqhprLfd8RaCvSm/vxGNh+q9iH+/gRw6/QxjNDzMZfq3usDPvF67Ruw15FprGEDe8r+7sbGlWuKUbiuzcmjIullminV9mJU8Yx0x/dus+Nkhmfz8WGmJ9TiUsHMgPJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558581; c=relaxed/simple;
	bh=E5vXWTNHkTRzDtH/veP8aO8YMLP8CY9Ty/5IFbJYIjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RoGPEsUdRvg+zFAuGX2CqEi3uXDGT5ROLrA/XgAZSvkM+/wNelVROPTwXsECrtNMD5FSFXe2BsiLO3G8sYISX/N2upjLcrDcdDNSRz+7IJUhNLhr4odibI8fnVpgFkN0cVHISANQqtWeJ0t8N0Jyb+65t7e/YpHpvUEmD3igJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0AbR1XI; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0AbR1XI"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso168518a91.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 00:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780558579; x=1781163379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvMIfx1POTAyaZla+RUcmznikw/7VMfKwxZ5AANjs1o=;
        b=P0AbR1XIFfuP//F+r5y5W5P3F/9byVlWPkhSipcqdm6UmvIx0iAZP720QehTf8dTzM
         6n+RPPvgUC7lmO3zbRfhCxdh5zmpZV2V1q04R/xVetaycAH4NfyVvJ6KromLX9CqlqEK
         6AlxRloVRyBlIm2OPatVoKYEq9XWuyhhQZ+xzRnJZceWDNp0BSWvDtFTuPlbIvHUyo6s
         KYWdilWGLYEsg0cz5nMOe4yfXn1/Lp3QkHX7S/COtDMwAy4BGpXH4PkvccBYWpv0CWSZ
         HyyoDTRfc/P48lLRP7Wj0gavb5LUhm+b4mZO0inDj21PIrgkAzMDMByzG/4HrCR+fU3E
         taHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780558579; x=1781163379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvMIfx1POTAyaZla+RUcmznikw/7VMfKwxZ5AANjs1o=;
        b=V+eMo23UMkHr4UYUWzIsTJXT8etCwmSZYYVk4HVBx+73VX8R9Q+NlogruGYtiGIIDo
         TnhLSMeXeJWPtboiKcduBwOQRms9PzlbiA7BKZVgY+Ys3KCL95WrkX8qR9Wfp6+07Zrz
         gocIFrGiDiGqFD7GW2RTfVGLeKWxlevxTIoKIqKXyEJS0cHM4OA64+Mxl2E2s08wrOfL
         Had3rw1WYMWiZvIfDNVWcDyj16jCZg9hEzA7xizEgxENdf8zky7k5QJIa2vqYeAIc1RG
         c2URTRjSbCM1MJhmHqOInVtZ+l3YgHtxDyyIQ4/9MLHu/U9yrdZ5UWb8/dr7eKAXNXa7
         G4sA==
X-Gm-Message-State: AOJu0YyJQkjVFesbrCqRgY4eNIr4I7Vcjhz29C0WFkQwOf9Ww9IFUfH7
	3kWbXztS7gw8sCqnjfQdis7SU3yHGGrtLByOlS+EYpuP4LM6aT8pBZmPpFLBflGgGku6xg==
X-Gm-Gg: Acq92OGs1L0Kw9j/0FywI8p2/TCRoVOKqif146Jd9Pgrc4QEeXUDUAVBO9rdjzTw393
	MZc8rFOcR807GoGMQF44hJgeQHl9umhkXJuannNwVkeRimJWqdeMwWM8Kl3pqAY9fTam+RwqaWS
	HLgZCKWdQ97ED+fiLHTMQsmyhl7Nt26e01SSlSNTAANCDVGCMLSh3nyzRxW3iLDG/Q0tvmmvAUT
	a+X6c4+vq/MwmISOlXGPQp/hdGTImC6paaxTcIu76VLj7lchLfzsy7iS9DKek6BlMlvlzVxzg2y
	Ql2aRq9xbN03mszBJXNM0yhF0IDxIu2K4p7Wx9DPpS1uQ4GpH20RzUCZuSak4Z+OnvWhk46v9jz
	vu/ismzXBmfGh1Xu0wt4xe+6PDYVYAg82ZCHvqlSo3egc5+NojoRjClOQ3q9sa+VAjMcE3nI9UO
	2j7zc1wuPNyCa/UbYyW/Et8io2Qqlcqi82MvfP7u9nl8T3V1d32H+9r0Koug==
X-Received: by 2002:a17:90b:4ac7:b0:369:2e00:1ff0 with SMTP id 98e67ed59e1d1-36e30553627mr6462714a91.6.1780558578780;
        Thu, 04 Jun 2026 00:36:18 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6dba8521sm2063074a91.15.2026.06.04.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:36:18 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: robh@kernel.org,
	saravanak@kernel.org
Subject: [PATCH 0/2] of: reserved_mem: fix stack overflow and make dynamic reserved region configurable
Date: Thu,  4 Jun 2026 15:36:09 +0800
Message-ID: <20260604073611.3954433-1-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Patch 1 fixes a stack buffer overflow in fdt_scan_reserved_mem() when the
DTS contains more than 64 reserved-memory regions.

Patch 2 makes the limit configurable via Kconfig
(OF_RESERVED_MEM_DYNAMIC_REGIONS) so platforms with many such regions
can modify it without patching the source.

Wandun Chen (2):
  of: reserved_mem: avoid stack buffer overflow in
    fdt_scan_reserved_mem()
  of: reserved_mem: add config to extend dynamic reserved memory regions

 drivers/of/Kconfig           | 11 +++++++++++
 drivers/of/of_private.h      |  2 +-
 drivers/of/of_reserved_mem.c |  6 ++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

-- 
2.43.0

