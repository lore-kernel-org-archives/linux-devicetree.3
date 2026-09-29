Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964450EBF5
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677917; cv=none; b=r/oq490Vy6LvzyM7B5P47AULIkkQjgqt6tVpgYqKs5WgTlenDT6Jja65EC+lG1jbFWxArF2wnfxERNxaB6LuY4N/QU/gt9uEz4KKL9MXSWlYV4qWVJKmqJEGoyrs784NAIEP5oKcbCedBlLfK6kupL452g5D52ubdVHuQdzv3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677917; c=relaxed/simple;
	bh=zMJUHsucbxjq4NjtcJvy7yWjMpFJmrb96fv6o4f/j6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YaIk9SbZqXNP1C/RLgYpRLRobKpnrneL50fYQRQ3AHbOuU0C0JlxxwLK1IVlNZCoLFSinXbAxs30g99vto2qWCE2Gl6cy+KiAqCLa9wXH3oPc70EUn5n1joqBJhkOHAl4FFEqpbmfj3dcUmod6ja42JS1cF/Jc85fS7GNmgDv+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHeTbbCk; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHeTbbCk"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a496aea5dcso127180a91.0
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677900; x=1791282700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=nHeTbbCk7nE6C9UwCA2oW59VzTyQKrTk1TvKYGIy6kHp6hMdTq0JhaiAZH2yTjISTx
         cARBBDool2R2xHs/zhNUzrQgbFsBLBDoF8YtBWlGN50pRwpU6Oe9Y1JIiLPdwi4y1pMk
         U0fy6bFMeH+1b8pJQwWy2gnTHGja3I0xyr594pX/NZw4wvw7u+kwuW0z9PqQNiScVn5Q
         7qo9BiC+vkse0fcgEToRQfrJ7dB6zL8oIGCyqGyM3cNk/wz2r4tX5ubnqpH73wdljluS
         RVeFrwxPEclvIS0uB4dEfgBbrtHj3FIFIcpdKlYd78ZYNFgpg8URUGSWfh6S3PQnXIud
         nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677900; x=1791282700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=BJIq3vpHZGWM4pGPMc7osEvHyZuR7uwqRDGp2j9HBuQkQ3yDBjKidLHVh7vKdLbzeq
         sTb1RKhFmvRPvcUS5MC7I7YONVg8h85D9fofMzvoppzGE7s7zM3XQQ0V09sOxrhTES3m
         X1lI2pX0lg3Lq05RqdR1bEovIqcIPPaglXhg0wzwDivsaQcx5Y7mh8c/fUdjx345haez
         0OlDw2xtdZR4uQQ9g2Abimcaq59EgFTPmCvoDWtqZMefnGM+tqsbp/3mbbOqS3XSsvCZ
         7vaN9BIjesAmQt7e7+rp1kRZWB4eOPiTIfYfJwuePKnoB6+Q+8kkZvi+NJqVQS8BLm6C
         GI/g==
X-Forwarded-Encrypted: i=1; AKwUvBztWRzBsBP6Iv79Wn6CDeRNjoOjrAgdab3kME6owx5kq7jFv1TweAILJwNcV7I7R7KoFKXlVx9IlZyM@vger.kernel.org
X-Gm-Message-State: AFq9FYKePFIcrw+ZdOzzei1ldZkZBZ/7W8trjnsdogt8vbOG+8RrQI70
	zAzCdBYequHVm7S6j3RQm/TX4FzHRdYAXs+Kle8DJrR+v/wn/jAHksXI
X-Gm-Gg: AYBFou3Z6GBqo1yxgKR5r2//eTqLCICawxYyhfcvXruNRyg/LC8nOVXkj2NTPIwy4Me
	37SoRa62PK0Da8tNNmoZ6vSf3bEmIXPfB0Y/XkD28cTTMvuHceta3ez8T0KQYORp0A8ZHDeRKrX
	mh4C3++5wzG9fUVhuTHlTA8FwouJq5yhPSQzE3TUFniD39VumxWJZ+pDa2aJgtfmY1YMgZQNcwo
	TT9A0hSkGZuC1TULrjoYrNTtdbYsGrWpbxpW36CVOqwXMj1IEs/T1BsVjhJeESS2Gg00NmqdP8p
	2+bi/MnkPu5EXK5A0n7jy8H6um2Mqfg36yUIaSFF+uCg8WMqbunS1kcHGw5KuK/4llkBpqQ5+V7
	WlG0oJ3j6gz3uvJZa2dMnvcEm55jwaLSa/8xLiqDtLkStHWdfA5VS03P2Dha9rkYtcRL/7UdMnL
	YlGeybHH5S17F1yXiHMM3ySqOq1GhB/HGNhDhp9ZHc31PpB55s0ObkGgp+XkfoRuWV351afqnnV
	VaqBLtFHnEB+w==
X-Received: by 2002:a17:90b:2547:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-3a0b263614cmr18497504a91.5.1790677899659;
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:25 +0800
Message-ID: <20260929103053.10241-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Acer Swift SFA14-11, a laptop based on the Qualcomm
X1E78100 SoC.

The following hardware has been tested and is working:

- NVMe SSD
- WiFi and Bluetooth (UART)
- USB-A ports
- USB-C port with DP alt mode
- eDP display with PWM backlight
- HDMI (via DP bridge)
- I2C HID keyboard and touchpad
- Audio: speakers, headphone jack, DP alt mode and HDMI
- GPU and video decoding
- Battery charging

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
branch: sfa14-11-next-20260925

-- 
2.47.3

