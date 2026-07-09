Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152330EF9A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607431; cv=none; b=LoF/d5hobPbUOQQPVAvnUnENeWfj31ZSd2tdEF90OTGGHZUDhGWREtp2Egx3L6jpHIFFDbb+CFmQUBxcEM7OZfsiGz5fBXhvjzXemqc5RX5hSbEHAKwMhM0aoZtCG1PquTuLnT3rTRIw6I9VZ8DBrhdKZCnK5To7h+Z2N6k6rWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607431; c=relaxed/simple;
	bh=Tpy6n523DyVGpKHkeBoqfP1I4QppiYUwUxbpEl5zuXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCW/dlT3Pwsj+FWD2VzkxbntU+CuHDaZ0elQHHtJhFVNqqR7yciMAVB5gwTzws6eiwctcm+2zjTpK0TBHteTd88w+qrcXdrB0V0wtnwV8MM4WpJ371uC5fXaIqZySXnbXzY2QxvUiQrYZgim332UEq1oN8+lmOz5uxbgeeNiC1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6XXrHTE; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6XXrHTE"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84830c774a0so1936536b3a.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783607430; x=1784212230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMvpv3Bx6FDuVBz3Fx9UC3bZbRQXohaKI0IUh1fx6aI=;
        b=L6XXrHTEwNmQrCnr3SzjeLUrFl3+9V9IkgvK5OfISez+mI4XFkE/s4Akc0louIMrgN
         GXRXWwRR2GSAWPLvQKvx1w2hCfZN0gwm/fkSrF6QKGO+SPovRS0a/RL0IDLuOYmo7/wB
         BOwOuUPXOQW5fjdcsM474sYKfoN2L0S34yfffVXzI/9X3USoe05YmFLQZ+zRNn2vcEJt
         fBjQ7qrIvsShJNc2EPoJ8oHTqWZXnfs0OGyAGNIHPR0qC6vnOgjQG6WST4d2Ta4TZP3T
         D2VXs2HyiwhLym3Hlkv+GC5jJ89WrMJNnA7SVbREsfKTYBRNCtzSzZB36ea8rUnk76Pv
         P1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607430; x=1784212230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMvpv3Bx6FDuVBz3Fx9UC3bZbRQXohaKI0IUh1fx6aI=;
        b=Sr5FhvFe4scOTHuH01+8uC6MF0DSiIwoMftTG1XnELR/u/8tGPPZKjXxP7eutFjym6
         vR7jb1nS7vnhSj94i//ytu0jBz3Ufeed8GafIgBWsmHz/15Pg/nzRVVaIHhTQacMQt+x
         kd/3fl6yn+9PfW6b7+OFOBEm12aKmSHIg7sx6fVqLGM/VSW+DMGUVuJib0NXQ3AT9Duf
         cbKTEPqrZERoqmiQaWVe+wL7NO0gx8k9/N1tbsW/VOcxCEexPayDKMsVvxJko5iF7JSw
         fV/Df3Q4mmC6QmwxA7j+PhF9sPqpi6+3u3IxkbP9/VEYl/9wpw/6bIVoPsVGQnY2tPOw
         8xfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6vcAu66abpInFvJGEZ5KG6XHw6aND9Fy6fVzKQV2W8qoGEWtkScZ2Ik7nz0SQ7fqclO5onRCu8U7/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz58cpz5ghKpZCE3qlXCilMGzkBDDWI/eAfC94IdejbWenEAOTn
	ADen7QtqtP0h9W37QyDS70E/3/pm6YMONjQdACpzwUZ6mSZMbqMYZ3XQnwfFEilc
X-Gm-Gg: AfdE7cn/jRCor5SM5Qrz0HXZbyS25SXZtCl+8XpZpBHtYICMI9j1fHLwRDCi0iTIxRn
	kAHUS+9SmXq/azAl2bcJbIG4rCPK0mwOt3Du6Pe4BzJ4tD1220MHwpiGKNqh9riFX1hd+B6bDih
	iEb5JmKNe5M6TjXi4I1Sotymi8biYHlHLm44h06lUibrHkC21e8bcGTBqgKx8mYRKgP8xPxNprJ
	AcjlnNpBbR37pm6SGPL0BPDgYoAdc9G1fV/WwcDA5vMT0GRU/2NmX/uLjYweXDdqD8lQPNyikPh
	WTesyfKYjGkA/2fdGmc0IGk8BbPkgJVgCw15atFnF70P0+ClH7sLTPA4CuBzbSRczJY0IeSUq9A
	WOS6TV4SqIDFdfMFGMdMICM5pyUEayUOWjxOlziCrC+89mxhfjtPgNKJbnq+5P1jSTVxeYeHS5m
	DcE8IqQ/Lv+O3cpY9dn2OxtLnhZ3C5YxkYpiTJfIE=
X-Received: by 2002:a05:6a00:14d5:b0:847:8f68:e8d7 with SMTP id d2e1a72fcca58-84842eb8303mr7103567b3a.8.1783607429602;
        Thu, 09 Jul 2026 07:30:29 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm2009666a12.6.2026.07.09.07.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:30:28 -0700 (PDT)
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
Subject: [PATCH v3 0/2] drm/panel: Add Novatek NT36536 panel driver
Date: Thu,  9 Jul 2026 22:28:44 +0800
Message-ID: <20260709142846.12463-1-mitltlatltl@gmail.com>
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
Changes in v3:
- Only include needed device-id headers (Uwe)
- Link to v2: https://lore.kernel.org/dri-devel/20260705153515.46147-1-mitltlatltl@gmail.com
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

