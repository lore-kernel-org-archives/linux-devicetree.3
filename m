Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120548AE2B
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130731; cv=none; b=MB42lw8QNWdiG34DD6X1CHpsz0vgO8o7xl3wfLKFxGTZn1Ev4Oz0FP6voW1T4FPUsxyz+IOkDBUdeiIzWRlxRYnQ+QMWCYis8SEPU0WBTe4RpHl9NLrBXfVNKu/4rmb8jRsISFK7T2EjL3CVkyyFCEiQNpgMn08xdLbyLbc+qIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130731; c=relaxed/simple;
	bh=x/74VW0YrLhC25b0CmlWwKPVdOEC69f2NmblOkBWSM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bA+w6E0mPg3mjS5acara6zj5QKWtf9cBPPJ3TMWm+2pAQP/b1wsz1mWJzd0Sex1n2gPgjeyeob0nvIByGdFO+aVU8KnXx2ZtS/BuV7JVaAK0xULI8n0izVuMdpP9SW+yIPBIAe9xlP4LxYtK3/fE/zg5mNhP1tRWnkHtE8CklcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=lazVHGGo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="lazVHGGo"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so40329505e9.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784130726; x=1784735526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RR56bGnnj8JmZL0fjBu3m1YWWPdiv2Fy/qsCCm/85y4=;
        b=lazVHGGoOINYF0+qXa1YElQyQkYrzMPVH30DtSK7hqdDaNZ6X78n/J9IOgsQ/xsbjW
         UHi8gxhtb2UaQmoSTSQ9uR85JnLtSwwpl5JKZh4ZChlWnwBWO25ESgsNqaBf+CfpKofz
         gYzVtXfEJ2ckSk+BersNeE4LrdUjmappnDAEX4/iPqedkOHQx2a3LmzjUaOc0vUzdQwz
         zx/sYeW2L0rIhRrhV4qTItkK3ePkkjR9n3aBvBU6gbozqlyz/I3/NvFD7Wzo2KbBf4h/
         HFfDcxigUnPgmqTdbrh00GTjKYKsxBi6jJfdzN0fw4mqYuCjLxZKleoqwc39RDBj3/2U
         +ZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130726; x=1784735526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RR56bGnnj8JmZL0fjBu3m1YWWPdiv2Fy/qsCCm/85y4=;
        b=dnP29wLkvN+3ON82mwUxlK/4jyH3iuJ4PHa9d+MTbpf59i+bhfQQ4M9FfpRSi7ED1T
         PWSbKZCJWoAnzD5P66URpyEVqWv8hTRVkDYTTAs4iHe8iZTzet3VCDbKe7Vh0PpiwbXv
         uaHKxOIY5VShkLyh1lZis+dkS8++506IrNBBb9M8CxLEvevhpjmHulR/lJQFyoEPKwtN
         SZTLOPfSgQV5jIQEUoHgHyrlQBf+OmM0RvRZaCHfMqiUN4EwGvaXhQyC7wO9rO0nJ8yn
         0KS7YtU3rTaH5stDKu/F2ui6WAjUlXkPe0BAXVbQiRbcifDCQGjVDqtNr+JHcpfhk4WB
         Xfag==
X-Forwarded-Encrypted: i=1; AHgh+RrHgx65p7Ql5BaSaZpAFeSRyKupNhTum/slKGq7yGM5RpK4v82Y4oprA2P3maaEQ/QHnpOxcmhL+we4@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUiYbZUbocdBWme/xGji3KKaA0XaN+E9RN1nyfwfStyWIR2T1
	SfwV89rlArwJOy7KM9YFfCGCKa/3evPNY3c2Fv9VGkitbys4AvsVWNT2T8N9OOZAnVk=
X-Gm-Gg: AfdE7cnQ6YHO/GKQkuEPSWvyjHXPeE1Vy4b9BvtSUhxF+a4qZ7ceMJbEpCTp6nuA15L
	IbfC5haz48ExMkSWbVApwlts7+/icGKvF1nYSA+I3FPMumw9tSm5ZpGWkEk+lL9yUhtSW5yAguG
	3itQeXyF+PHTJDiEbiGrtTOfHrUZ9Z3yiFLSpfvYxXO7XQTuWis1dzJynF3YUFXfAk1SNmn5bnO
	BqtvXkwQ4nYfKN8PTFgJdFLcNSosR8TNvWE5Ta71ExylOB5EUnMQ4XLEvqW5b4a1QcvGgJE61UW
	Qe1cBBsgWTfi2SYfXj54IbH0d0xBZupzRKY4MZ0Ha1HL16DGI2MjzKfmeO+dRG/Rz50/D/WsId7
	llnPtA2+vr2tX5MG+C4XedjNrxnueX5v+sNL8SgECWhwGnsA6FnhoJUf9E1/WjZT19i4AJNzwoD
	Si1lHFjSSfDPldQhnCnIyRNx4iaw==
X-Received: by 2002:a05:600c:350a:b0:493:bb23:152a with SMTP id 5b1f17b1804b1-4953c28868emr38950255e9.34.1784130726506;
        Wed, 15 Jul 2026 08:52:06 -0700 (PDT)
Received: from vkrawiec.lan ([2001:861:2128:c8c0:8e98:aced:6862:3133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5c3sm16621663f8f.1.2026.07.15.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:52:06 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH 0/4] Configure SYR82X regulator modes via device tree
Date: Wed, 15 Jul 2026 17:51:37 +0200
Message-ID: <20260715155141.128601-1-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some boards require forced PWM mode to keep the supply ripple within 
acceptable limits under light load conditions

Victor Krawiec (4):
  regulator: dt-bindings: Add Silergy SYR82X allowed modes
  arm64: dts: rk3399-rock-4c-plus: Use device tree bindings constants
    for SYR828 regulator initial mode
  arm64: dts: rockchip: rk3399-hugsun-x99: Update SYR828 regulator
    initial mode to use device tree bindings constants
  regulator: fan53555: Add support for mode operations on Silergy
    devices

 .../boot/dts/rockchip/rk3399-hugsun-x99.dts   |  3 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts |  3 +-
 drivers/regulator/fan53555.c                  | 29 ++++++++++++++++++-
 .../dt-bindings/regulator/silergy,syr82x.h    | 20 +++++++++++++
 4 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/regulator/silergy,syr82x.h


base-commit: 62b9452f5fc4d007f1ea31cfdbb53a96d91e3c66
-- 
2.43.0

