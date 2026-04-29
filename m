Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8340F8E9
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482024; cv=none; b=OkA6JMd6X341y+IvzVj9hhD9Dbg9JAmAJOuRJ8E83d5ySVUP6wrfZj2FJMTEtY5+sqSuGlaiT6Co1IaEjdMroicW+ysP5C6XhJxniCFQewdwnJq4i+eoDd0uCjJhITL6J7FJD083D9z64oR6AUtBl2gz0HrrXdYyPq3YDxC0kj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482024; c=relaxed/simple;
	bh=hVrVQBsFImR/2XU+zhOryibYPHrZHx7DKwW6/uwn6+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0O/aBP2KdNsO8q3UYPIFQRUyLOKhveT8DM/wywjJqp2nI/+dM3zXg0S/yrMyuTupj4JbEQOIG5Rd751eYVDmtGYJw/yv8n+rBUBNYqGxZZMJwFt4vJY3yrqxnuRxsuRVODYzvZY6mJ91ZOwYYKGAToFdabHTyofhZLthzcWmkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZcclmEg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZcclmEg"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891cd41959so112018255e9.3
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aidcyvjPbKTT3kmsb998TSQGc1MaHBcE23aYVUk7JtU=;
        b=NZcclmEgkfQ8wtDpSJBtYodpwTGjpQ/qGLUNqotaG6mjoCWa8SBk37k5nO1OhoAPK3
         kanwR3/eIxfk83Lwf5LM3yjj2/t18+TcV9qPJJpNLlJm3PEUCpxhGCY+R0KEB+8Lztva
         cM76/8ya7Leiyeotr0rb11oWWtmI39Q3VDJKTnei/kC9PJrqQ57cs4+bDDf71ZPhKRIH
         mIRxdM+wZgbhKm0T028GtyIGGIE8yxK4pDkVyl0Bowcrg07yz17z7T1Y3c0LqrADCW2g
         Icbnvhj94vA3dPma2HJccpJCnr1Eoh5l9xuBChaF5Az335mAIejKR/vZ9LktHspL3IBi
         fhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aidcyvjPbKTT3kmsb998TSQGc1MaHBcE23aYVUk7JtU=;
        b=fJoASYEa7XduefEG2/16tz4uH5GOQ1HphiqfoQYzcBvmjEB1KL5P0LMjDEpGOEpTC4
         4CPsXlEJqxfG9dXGLYaMP/x5eXcjDxpKU9RSSGcXBnhQkejKm5k3bcI4S7nUT4WuE0gS
         DfsAHAtG3UB+9OoLk25U3g/cA5n9svt9J3qag8jAFDZk9wzVJd9Bqr2P0s2+KCw9522k
         XKHPwMQ8QFr58xfPlAggJl/BituZqcj3hF0rgXyVn27ifb/JVADzG1EG8Ac9OY7/jMnb
         0V4QA2mRZ32C17kfhDET0m+1rkDrJ3JoCOm6Hk95ZQP4ke1cUfyWIEkVEyBjr7oacz3F
         i98g==
X-Forwarded-Encrypted: i=1; AFNElJ90H6q1lAK7HCUUWQ3B3HdwsNCDZmAa3l0+nIq9HrflkkiGnNAi4Z6pmlWoCtCmek/oo9suJNUxnlZF@vger.kernel.org
X-Gm-Message-State: AOJu0YzH02xadvIoYe76ZlwN89Kv6/EOjuHVR99KKQFGWSAIYOVTGu6D
	w1d5kuzhI5rgEHZJe90CXdob7jAWhU8/cgT0kWOPtEKOIw7OyguYPYZw
X-Gm-Gg: AeBDiesdWPiPc+fu7Z5pLiZS9wJfxBcVDxWbKK9EWGP8DlffmvAhid2eNTV0z8PWdpk
	oFbyPLGrF5S7Dk5qB8QpCUa5N5e+fyjDFNjNMROTNRmNLV1TWzJqqwUcl1kXfWno8tyXwapQFqW
	owumqJDTCSiKPNEKLgqDoFG4FKWF/y8Tdgs42pHvmCAB1KmiK2CewCtGbAiOT34yQ8fiPr82EkD
	z4GhevhSdPCsFNtjeEURz9KDXOLR3MSFlDN+xyey7OYCGwgdey0wmUar8A9ZwtxHdnN80A6oA0F
	SdM73IMfQhoeRWEm3BxoZD93m0cGim/7qVHsAUsUWUy4QhDAMkdCZ2mepTBk8CNkgKcoTtJuvdM
	UJEua+mt7vaw5pIgg6wa3JGYyairVpXUnOVQdJmcIIHazTFfs+gVtAl12/6fKO+gK+WoKJ+JKZs
	1HKDY6bTbtSVCEN3DMcXXr/+M5O3ykDKB2tuRq9d11QC8VjuOYP9jiyoCoMuW6oVzPP3YnST+dY
	6fkUwvKg0XCM4jBAVQ/t8DKtYE/xMSMmaqZEOJ/2ET3EEkm
X-Received: by 2002:a05:600c:8b04:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a77ad5a7emr130239205e9.5.1777482019068;
        Wed, 29 Apr 2026 10:00:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add DU support for RZ/T2H and RZ/N2H SoCs
Date: Wed, 29 Apr 2026 18:00:08 +0100
Message-ID: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Display Unit (DU) on the RZ/T2H
and RZ/N2H (R9A09G087) SoCs. The DU on these platforms is
functionally similar to the RZ/G2UL DU but includes some SoC
specific differences such as a single output port and explicit
DPI output enable control. The series includes the following
changes:
1. Add device tree bindings for the RZ/T2H and RZ/N2H DU variants,
   including a new compatible string and port property.
2. Make the DU reset control optional to allow probing on RZ/T2H
   where the DU does not have a reset line.
3. Move pixel clock validation logic to per-SoC constraints in
   rzg2l_du_device_info to accommodate different clock limits
   across SoCs.
4. Implement support for the RZ/T2H DU variant in the driver,
   including handling of the DPI output enable signal.

Patches are rebased on next-20260429 and apply on drm-next.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: display: renesas,rzg2l-du: Add RZ/T2H and RZ/N2H support
  drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
  drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
  drm: renesas: rz-du: Add support for RZ/T2H SoC

 .../bindings/display/renesas,rzg2l-du.yaml    | 24 +++++++++++++++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  9 +++++--
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 16 +++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 14 +++++++++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  6 ++++-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  2 ++
 6 files changed, 66 insertions(+), 5 deletions(-)

-- 
2.54.0

