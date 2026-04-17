Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912AF21D3E4
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 06:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776408605; cv=none; b=oLsdqB0/VIvT5NI0Rf5O2NGrmIjtepPrUBcXoGGvFekFxCIwQYD2Im7kXsOm6YcmCr4+PiZvnYg52DftSm90lTNtobDXNXEuUkfK41emD+b2G2ZIqzmmG1pS0i/2U8ikbRGYrFisZ18y7CkTeuODyCCKXCrePbPC8K72jMYOt0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776408605; c=relaxed/simple;
	bh=XRCkqtFl2EmutrzZu9SglM3g8lfFjS58SmOubxHiPhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t99wGcsZSRo0CIR82J3MY19Qje9N3Rn7HRFdbbfXzyeKOmLA/CGOHHKKTq8vMHL7m3PCiJvgCHI1xV+lEgpM7fhdj909+T1RiEy/xl4+cOdElpP6vMAvWRGfCzzkstfHf9lOHahlq+3ZmZXShSQnGIhEvhiNgKY9CCOjev39uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjnXCIb3; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjnXCIb3"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so325933e87.1
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2026 23:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776408603; x=1777013403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
        b=hjnXCIb351QM7FZHD0H8iWR/JRNffmT6Ct/onYwsescGOFGXtC8WAeH3lb6YkXkUgm
         fScioOoCn8CRwqjSxuQftA/GT/nu8aOy3RjQ0us3O6neMgP2yq2swYZrCex3P1+sFVTX
         2ianfbUoKyAqWOnQJLkpsjEdEsPh8OHjteCuGXmdATbdv86VdHo9sjgRy6czgnrlJqBJ
         HNTCdz0GB4yR/IV1W+Zs1a1r8ggHwYCPh3E/p+ZaAipb75XPlRqBCDZaJsVcwJ0F3xq2
         /zaaM8GT+f8f5UFgN4pd0JHPVOAZgkL/MZvbG/pbAbEJgJDxxF8MMhpBeWhBBWx/YO2S
         5hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776408603; x=1777013403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
        b=HwyUa7viFhV06OWa/twyt1dwq5qAErpEcqntMCN3Qv3W6uqGa6gtu98MTy9F5+NgPI
         2Cjo/tCORCBL3VGqxEM3NSm+qyWu8t9eeYmKY1Ndbtt3Q9saM/HZ8HYFU91AqA99Z5ZJ
         609JNrp7Ag62KmOebo0JN1KIQFkfEZ+sQ8cvmXM1N+rFCTqtY670Xxu6CuCfOv32/uD0
         3riIPnzedlEhPU1yYkEJRmjTWsog7+gc83uvbNROOKpvwD5eTzoLUfIjOrw3US4DCUR7
         S1P5A2ahvL5UdlE21NL/BZzFkn/OvuRoHXit8ZiezTA0TEJSuOvl8VvT6zLvM/xftczO
         We6g==
X-Forwarded-Encrypted: i=1; AFNElJ+l5oPWfXXE0xgwFhsQTS97FXHJS1dkv8WN8IluG1cY7aul6z4oE/VsCNf/PEBvzM2P5LD5FOZTj2RF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd029EpC4VZMuP9WXt7gCaJvM2sGlOk88uKX872G6IuPxya4/k
	dvMJvLkNRU5tcKv2BMj3aFMpY+4NMGzYs6lRrr/5AXl02giMpDWfv2Ad
X-Gm-Gg: AeBDiesaWH8hOiwsP1UoXrz/+qf2IOQSpURj0n6U1cfdaKNusIEF77WtTEBhJyBMeE7
	/2zmII6DAwK5CqLSv49KmedWYtngqpc5S3Pt+vqc/Oh/AiLyRfU3WzRhhE7uUKfz7GeiD6iRPvU
	5zrpw+tTyDJhty1nfbtAAtVxemJgumzixUAD4FG7ov0Ts7ryUBm6hDS6WquGLYKEx8+/Q0SDxzc
	0eMUS7q5cenFXedcE24meoLSdDQxaRn7N2LED8bU1oDKuAiv58Ya7XDBWlY+ZTo/j4KPrej9+VI
	i/4U3c+OJvX0VjXmiAhOqTxY+GqJcr9GlrPt3+2jOcMIFFxdNvTY6E3W9astSQZVploT1tic/9B
	R1aaOgEzvUkbLn0PrRHukWYPiYQSCXKMod7p+P3rbCrmbF9WMmFLAaozoqTi8KMrFMzUGxdpXxZ
	8MqaCxAEUx9r7tAuvru/OhiYpSPi8+jPbEtQ==
X-Received: by 2002:a05:6512:124d:b0:5a4:b2d:25c2 with SMTP id 2adb3069b0e04-5a4172dd846mr452741e87.27.1776408602436;
        Thu, 16 Apr 2026 23:50:02 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm153202e87.7.2026.04.16.23.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:50:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3 RESEND] drm: bridge: add support for Triple 10-BIT
Date: Fri, 17 Apr 2026 09:49:50 +0300
Message-ID: <20260417064953.20511-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

Link to v3: https://lore.kernel.org/lkml/20250824092728.105643-1-clamor95@gmail.com/

---
Changes on switching from v3 to v4:
- rebased on top of v7.0

Changes on switching from v2 to v3:
- place mstar,tsumu88adt3-lf-1 alphabetically
- fix typos

Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1 bridge

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.51.0

