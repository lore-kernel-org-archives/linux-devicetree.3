Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8A357D08
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 15:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783265818; cv=none; b=cgYQVAivHKyupCtXFj1f9XXqMxy5vL28/UNdqUWfLHH22JvOdfirTP5KEBkUdoPz/R+U9O71RLTFCfZNWTlt8++xSR7UTY2D5Qgw2EGuCK7HZVGdinszfjRWD24Xlwn4A/IUb/58XIDDMawsVe5nXbXYaN1MQDHJWWfNeqtJCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783265818; c=relaxed/simple;
	bh=0jQ3bwT0aFc1TCUDUPvcyprkqgouMiNNdG0wIVaWAIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fItMeplQjId0GsJuOhx0lAqZCmHrMoP6f5kUBHrFYmo+myIhJPG9EEYbmR2doLPLcxrAZnB2rS7ktdzhJ1usU1HTkMuOlFEd3IuzjvfoMlUJ7xEttiyMPj5JYRjgAmIgZ+CAHa8rxJ6XVwm51Xp5M39zqTMN5HXF4UdcvNL7k2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rK3afPjF; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rK3afPjF"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-847aa193d98so1715153b3a.3
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783265816; x=1783870616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXCZCCGOyqe2xRMAN5jliT8u+ao8sWXmCdGqqZO2Sz4=;
        b=rK3afPjFkTiFmvDGo5odwkVUrRxL0+Y0mWANJieJlRKmLstGQKbqGodnvB+MekDOLv
         AvtwVKnyVEeBkYSBuvj2bfGHYCHUbpSCH71qTT3rt01G+RlKf/Rx3tYZhlo3RyhIv01i
         /8dQSqU/jYctoQK2p91W6TLzPb6NzamhmDw6yjHY+MqUnGUfZF7CMCtULbH3Z6iqo4PW
         HqTfUnxF9dEnF3gtLIKQo2IujrBEvFjpLhaTKYM5LX/Cn4XskaNIyjHKfaFd70BoB4sM
         3nIoprbkcduc3UhoqzA35U+cY7Sc6he5VYtm29s67Ft9XfUXxAxedDlhBe4IpVHehaxf
         hnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783265816; x=1783870616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXCZCCGOyqe2xRMAN5jliT8u+ao8sWXmCdGqqZO2Sz4=;
        b=oMOJY3cqyf63sMj201pQzXZgSn4/hzmZj+7TtoLLZKDqXpcTZmR5AGSyJB0tr2zD5V
         7IFaE8xHNMk3fjdcgwpk9/tSmyysH2DBmfarriXE/g4kO/Upd5T51uPPALESC4BZ1Etx
         3LpqPYVlzUH3jqNBWDyUyUGIaCXwv13X5DSPN4rVbawmX0Y9J63zZmTqKXAxS67Uu2KG
         qRYsx4itoT+csAdILbVFSkKOlJmsbSp5Cve2Sgl9GiaS9nWsAXXskojRwzPTxVYsaiev
         iAybMIXdWUNBHp1YIn2OEKczv087NnOGs4gBtFmpPEYioGTzLI1ZVZifP2W3Ke4RoFOG
         8uDA==
X-Forwarded-Encrypted: i=1; AHgh+RpbaoLmyPWWWn/3CB9ffu6Z9NKT0Zp6M71cvG4DfJEfxfa/pZLdqQeTGVzEHPIvaRdpglx3OPHxriSw@vger.kernel.org
X-Gm-Message-State: AOJu0YxhwES8QVU8eKqcR04fcEcTHdOl0ZG6xNtUDAQhZg3GrVoPdRf7
	b6XMehWyEzP781BR4IGYhj4zyZ3l4Mlxf6Gt4Np3C/H00OblbidI4xLB
X-Gm-Gg: AfdE7clkQlqf9lViso7/iZIyf0Ajwrk/hWV333LmvEKN2njMWb+3SPSvsfykApZir50
	MnoKhuL04l7+cLEIlGD48EWZZgsPHfGZcKKU7H0sxruDY7345L9lkRfLocM8QZ65rNEriB7KpJW
	565gYo+tW1K9y8hBbrkwNFjEC8E7UPuYUAsv9VwgZuySDsAquIK6QLBuzuNLtU3gCwyN8Wxq7Rn
	GOmziFHXSPPkecCzQqIxnAjCZ54/lDz+b4zC5eyDsqqS878VNO6P1dKi4k+aL/FLB8DedvKc5Py
	5ZiaKRZMWULELbaEmLJ7y7l/fp5fJLXhbwkTzcaJ8kpsh4kdgVTm246l9FAq/cwJAmpnt2Xgu4H
	aMAa3JmLPXl7QD9cvVUn1ulT3Z1vvMpysNqD3OoqFp2d+olc1LvKDo0p44ptp8kOIy1Jv6mKwdP
	TWuF1UToKrctDhaalmvAw5ObwoE5SExz3Kw9jX1vU=
X-Received: by 2002:aa7:9304:0:b0:847:8b1d:22fe with SMTP id d2e1a72fcca58-847f6f67796mr5581254b3a.50.1783265816442;
        Sun, 05 Jul 2026 08:36:56 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm2402076b3a.53.2026.07.05.08.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 08:36:55 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 0/2] drm/panel: Add Novatek NT36536 panel driver
Date: Sun,  5 Jul 2026 23:35:13 +0800
Message-ID: <20260705153515.46147-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a driver for panels using the Novatek NT36536 Display Driver IC,
including support for the CSOT PP8807HB1-1, a dual-link 10-bit panel
found in LENOVO Legion Y700 Gen4.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Collect tags
- Mention the CSOT PP8807HB1-1 is a dual-link panel (Krzysztof)
- Use devm_drm_panel_add() (Neil)
- Link to v1: https://lore.kernel.org/dri-devel/20260630023439.248861-1-mitltlatltl@gmail.com

Pengyu Luo (2):
  dt-bindings: display: panel: Add Novatek NT36536
  drm/panel: Add Novatek NT36536 panel driver

 .../display/panel/novatek,nt36536.yaml        |  91 ++++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36536.c | 488 ++++++++++++++++++
 4 files changed, 591 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36536.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36536.c

-- 
2.54.0

