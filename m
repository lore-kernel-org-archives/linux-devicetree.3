Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A803B7751
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780052734; cv=none; b=MFhzcIl0qBh5A+Ft/DzWLCgCpMl/ZHCNNPWW1Jk6KGDDx1pfQAb68fwN6iavqgHJDZltyyDlTR1JD6zNVX14/X4Po7t0gTHA7sDhyKxJzMu1R/DvGNE9xL3TB3w6WFJoVmRr19b11IE4z+tFfoqr1TBjIG8SSc4BVCs/2CZojZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780052734; c=relaxed/simple;
	bh=ncIMr7bQYJygA+4kRTgjU2C1cHSIfr6iw5KJDlUDahU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sysVt3uY9GW/82ap4za5kVZU1Tums694vH3EmCpRfnist17ypbDUAaC/nvliMWK6yYeJGwni+X3KDRfwjWCQI9Y1+TdCMOC2l/aoQckpFC6WgBNkk5fZQw5UyST06cEid+JT8rGCLcgmH1TlB4p+Jg7L4bXmtualoF/6b5u4IwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGOMV8A/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGOMV8A/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ebafde87cso4810023f8f.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780052731; x=1780657531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qE6RnHPAGUOc6JTeO2foqPr0MsIVa35llYbJ9yTYeCg=;
        b=lGOMV8A/u9xOBvqHyZnXxJ58CErjW69ovtxZhblYT9izP2SoOQ2y9oqhNCm47htwOE
         Q0K92kI/TYRSaPJ8GBmMN9m9AKpGVj/jTOb6FklckGI0PP+5IRCAqSRYuey2a/Dh5JXk
         ZpSSnq/zCqym43xFQdOhNVFpDxNDq+tA/dAPYWCyhQ9Gl1mrMEeqwjmtgf0QeNpraksd
         sSlikp2+yGiI6zZo/pMNOzc9+g0Sx+huk7YZ1jL9ef5sOCIssYXDzWZC01QYE3iGrggt
         EqVbahWARGMQf41YGdSr61yUAvRMfEXAcSLdcDOT7mTcAKc1xRTitLk4DF+qTw+BWli3
         M2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780052731; x=1780657531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE6RnHPAGUOc6JTeO2foqPr0MsIVa35llYbJ9yTYeCg=;
        b=DgCAbsHvjqOgQ0h0DtUVyA4bL/3lTfdMyvH9KogxcYnlUMGLw7wkPjZFAV2dmnAHeG
         BKtu+oVKkKaRc6zcv21IlDybgMbLoj5Q3jFxdVjfhIOuX6fGqMrOD95CxT1SKgBeX7F1
         Gs4b5d+6TJ/K0+KDxP/N8Rrn4fuyFDxmEgYiqcx/P/plOj1COIQVJGiMY9pnhVojzswH
         cmQnEDqXQZ2objmMA6ztyvvratZ6XfNf95iPjsjK5dl27938t8u0VzmaEZb+6UziGRnI
         VRM2FGDexsEHBMsuv9sFaGw2obdOZz48CKT3rZ5LiLd8Xd1v8+myIoCVqL8ryh1naveB
         wf3w==
X-Forwarded-Encrypted: i=1; AFNElJ80h67RpnQzYKguA4xknY2mdgKJ7ep+bUv7ltFNYZBlKRh/ktMppg/IwYCLiB4PDftn3RGwNKUjEoEL@vger.kernel.org
X-Gm-Message-State: AOJu0YwBTJvfXq1rO2le4IdbRIZHEipeqWDvjN23+WaAq78EEQBBEnhy
	5VFLSBTSeK9V/ByDlVemQ7J+fdqcpzIq4hOMVUp5U2MhaqmPPbdLDenm
X-Gm-Gg: Acq92OFK7+pFvWuQYMjR7owKUe+nZIb5+9+qT5jGKz+ZqxnjBHP60lp7neKiWaWuRO2
	qB3s7z1kXo/2qWYETJApAJ6M3CvssUSAEA9SK8lOiS+cUNKRPSFBtWhqo0o8HXxTZJ85xLhiAN6
	5aU+Y/vlN3hzVBpToq0bEZ6pGcMxS3pmD8cpSJRFpURBSHoAWAgzJt1xZHPBENLUMILuIjiyy5l
	6BYHfJkAdelIt3Xr4q25ZLPaWltZafJ9XOPHofUc4r4sB2muYDUgfWrYw1ZIf/1XeOB2DrsS25x
	QTUMwSOmc3yV8S2RP5OVwdAVUYhNYJAivMmEyJQZGVcFM6EIxdGGR8KhaOj5lhFgjEn5EFHkY4C
	R3NvHq2qN5CGal836TKn6vJ6AB21JXlLiG4BzYlIKKAcEtk0sZTHyspjhbJ27JJCcpWRXOrEc+A
	lrObOs36FOfuKXzeaFuyiMU/uyA5UQq34pYtEy
X-Received: by 2002:a05:6000:1a8c:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-45ef144a48emr4457888f8f.20.1780052730683;
        Fri, 29 May 2026 04:05:30 -0700 (PDT)
Received: from vitor-nb ([2001:8a0:c4c6:f00:7677:753b:2cb5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm3033663f8f.15.2026.05.29.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:05:30 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1 dual-LVDS panel
Date: Fri, 29 May 2026 12:05:18 +0100
Message-ID: <20260529110518.624454-4-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
a Verdin AM62 overlay for using it through the Verdin Development Board
with the Verdin AM62 Mezzanine LVDS interface.

This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
was incorrectly extended to describe dual-link panels. Back in 2023,
when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
pointed out that dual-link panels should follow the existing
advantech,idk-2121wr pattern instead of introducing a new generic
compatible.

Following that approach, this series adds a dedicated binding for
lg,lp156wf1, with the dual-link LVDS ports described by
lvds-dual-ports.yaml, and excludes it from the generic panel-lvds
schema selection.
The second patch adds the Verdin AM62 overlay for the LG LP156WF1 panel
on the Mezzanine LVDS connector.

This series should be applied on top of [3] to avoid conflicts in the TI
device-tree Makefile with the other overlay additions.

[1] https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com/
[2] https://lore.kernel.org/all/20230130170441.GA2796575-robh@kernel.org/
[3] https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com/

Vitor Soares (2):
  dt-bindings: display: panel: Add LG LP156WF1
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
    panel

 .../bindings/display/panel/lg,lp156wf1.yaml   | 105 ++++++++++++++
 .../bindings/display/panel/panel-lvds.yaml    |   1 +
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
 4 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp156wf1.yaml
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso

-- 
2.54.0

