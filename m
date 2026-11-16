Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812537;
	b=NHC5jWGDDcNGLMAMM63qXCoAvrQQNQWcY3PKzonhsjpcogBixzpgLH+P9tH/39uVDW3t
	 0RM0fXyKN+2xFj3GmVOt47d4CijuytWg+r1b45qBETT7hRAFpRhLbpMbMrWvZxguscwGH
	 JseXt7LdRG8GE0RxYQRiv8noVCsiYI+JWb/n2nyFKjBj8s93gxReP6QZKeWRDDxkCGm7u
	 LJ7DT0C8zylJbZATbhLYgUgltxqAY6/MnE6T4tH7tgr5ESQ3r8/1ux+syTv7R0o+tQJFZ
	 Hby5fs900xN5F/dHMN6lHgykFpR0fKJKbpVtShtlS0PZpzKqveLM8bkQKG/hzvISpbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
	b=dPl86Xw3Tj+vVMimYn0Zh7dxX7T1Nn/9Bn0a/itxT83l1zY3pAcnAK+06w8EDnP1wIUj
	 c344gM9K5GiSOhZz9lzPfcfdgFi5PLNd0KUjPUvyZWLG+8PIpekMgrytdqEoN/g/xutWv
	 jsdwi9NI3iKOE/8+ZB5Do7445tVTJ/6FBVj+QjXR/2JDzRsa0k+5yLCdxOxZUUhMsFq9s
	 bMTveyIthgBPEpkUHxS9iuxts9JBf3WNsCD9s8I4LdQ6UXftBSKA6WP6jXmPwAttS4y+X
	 MQTp4oau4aknQvmgQcQYP87DYPRWXZj5To1fJejCW9A8u167wA08VkfoZm8cVnIwIXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w1CPw/xc";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB31606A898
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB31606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w1CPw/xc
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so17123255e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 23:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794812535; x=1795417335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
        b=w1CPw/xcgAAnsRih3vNd+rHB6D43IqAWaSuMDgG0hPinaYup7k3VEwkBTMX0ARLEbG
         n+jD+HSWIL6M3c77Qmi4HnCUKzqYxPyPcjSkSNZkooJFlgniYMq/6Hbn4/1EWOCSMZu0
         N2zDeRXbq+Xp5s6hA+0+dvhMFi9/bidqMxK/0k/ZyaXsDFEJTt1uOwuAvs+0ZEcVDn8b
         axbSkJqs+MD/WLvh74S2stnBOQE6NA+8yDD3o2BebWWvOAgCXoL9mkR2tMnI//PvB1pi
         rYLxVjO9/udNOTvanGxM2cYIFOrIdhins+9g3k71b7EoZf+ZiQyfxbNI3ih4nB5RG5KU
         vypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812535; x=1795417335;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oar97+R2dcLaRVk0nmpwc72qymMp7EMYfC2wL31fOwU=;
        b=21ESLlpKjO6I1Ur0RWIFctU8gDE1ZU7XkcURoB4Pf/bEPRZIQYDiMHwR1RyyeB9Mi1
         MqfODMxHM33OwW2C96L+ECjx6vale35SvhPen3na98ifKrw5bM6/tKcZ6z2D0vX8NPqx
         WIi6vcPNFpHvg4WdjL5sCT3WFI2VIDYFzCkfW4wvDZo6lGCeWp2UfyPBudRpRXJusdV9
         zZNYWVPm1FfE/YBDXewMiG37eeJFrNQUcEZZ2HzozRG3xe1JJ0mGWzf90XMaST/gGSf0
         S5onXnPRuA8RpeTbizN+owU2Zu6pr2sezo2Ove5EOZII/axKw4APwGFW25XwAEdfTt9h
         E8pQ==
X-Forwarded-Encrypted: i=1; AL+hErGOPfOK26lFkjnkOqviHiWCSbGPulXlueK1xelWgTIPFoIDCCfs700BCq4l3zn58DzNd4xbLvdEqLdg@vger.kernel.org
X-Gm-Message-State: APuU4Z9MJQz8P3A7MVyrIElSy0DY7pilwhnpHYYf12KAsB5XGC23CTRF
	dOOlpNRHj4u6bFxoIKqXdrsDohexQY2EGu9EoJmr/7KC/gjDA98/ONTC
X-Gm-Gg: AYBFou2kYEpGayGQIK/c2wi9Y/g39ZGHlMCTDFulq1qBfdo0ZcmdvRyPv1pzRYxVazu
	WSCKuoKywkShDLdlJJFJq8ggdVUFY4ZtGYy+8MUdIdobm32bKsbOBjDTbqklUL6kOuw41kukEvO
	h9favgT8gWx2ikyummyprLi57MI1fdiyfGhlDxbQ2+Pgm+57OyrCCdBxcEZOulHXEQkBzYlPQa3
	2zrh8+rfdnrj6kFL/P1Eg0MXhL2QkFKz8arjEbio3ZxcWC5c0evfaAjolqGVKeuhUAzRJkJHaF8
	TySJBgPUB4cLtY7XdDmwl0EvJhva/iRX4TBE5SZTO5+1qhxCTFAbUk46G+f5aAnXS38lWMo2tdf
	QJ78/3K+FJOnNXMo/v+xvo0IV1YmU17hry1W2t0aj4BMkVGSw2PkrLWa/mL+jO2bmZLV4X8UOZ2
	jJTDD1o9fRhVIrYKCHQzNU7AycHGf450Xn3TzaKkbIX6Fv25us9bG0Sfy8ly1ha1N84X2ZDrzAs
	wqd3Cmxj0YsFljlpJMOQolYWqYIHd8RK2WZTETlMzJGoiUL+DvkldhJdrhcU53d1EPr4hiKJ5X2
	YVouXv5sQlUh
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr200763425e9.12.1794812535128;
        Sun, 15 Nov 2026 23:02:15 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm558777625e9.1.2026.11.15.23.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:02:14 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 0/2] drm/panel: add Novatek NT36525 (Samsung Galaxy XCover5)
Date: Mon, 16 Nov 2026 10:02:10 +0300
Message-ID: <20261116070212.314228-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a DRM panel driver and its DT binding for MIPI-DSI
video-mode panels based on the Novatek NT36525 controller, as fitted on
the Samsung Galaxy XCover5 (SM-G525F, Exynos850). The panel is 720x1480,
uses an active-high reset (RESX), and a DCS init sequence that mirrors
the stock Samsung bring-up. Backlight goes through drm_panel_of_backlight().

  Patch 1  dt-bindings (compatible: "samsung,xcover5-nt36525",
           "novatek,nt36525")
  Patch 2  the panel driver

Tested on a Samsung Galaxy XCover5 running 7.4-rc1 plus this series: the
panel initialises and displays correctly under phosh. checkpatch.pl and
dt_binding_check are clean (bar the usual new-file MAINTAINERS note; the
files are covered by the DRM PANEL DRIVERS wildcards).

Based on v7.4-rc1.

Tool usage
----------
This series was developed during XCover5 mainline bring-up with the help
of an AI coding assistant (Claude Code, Anthropic). The assistant converted
the vendor init stream to mipi_dsi_dcs_write_seq_multi(), drafted the driver
skeleton and the DT binding, and drafted these changelogs. I reviewed every
line, validated the binding (dt_binding_check, yamllint), tested the driver
on hardware, and take full responsibility for the contribution.
Prompt summary: "convert the XCover5 NT36525 vendor panel init into a
mainline drm_panel driver plus DT binding; keep it checkpatch- and
dt_binding_check-clean; test on the device." Review comments are welcome
and I will answer them myself.

Adil Hüsrev Tepe (2):
  dt-bindings: display: panel: add Novatek NT36525
  drm/panel: add Novatek NT36525 panel driver

 .../display/panel/novatek,nt36525.yaml        |  71 +++
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36525.c | 486 ++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36525.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt36525.c

-- 
2.53.0

