Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA4423A9D
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555307; cv=none; b=J5gJiF7faqGwNEgCUm8yk/Qw/pF/Aeakx+x4+JY0hPbrzc23VswjSADb/yLh3/4H/NXmY3eb0eIqCeLUl+OTPjWJsfUYEgWxHpWre1MllsiG5cwLsMADoJvYaspOdm4jzfDgltCec015HP5K9QmFQjtRmK662CtI5bE+u/vXniM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555307; c=relaxed/simple;
	bh=2eZMKrdUq1kE1wYNVAUmX1R9Mh35MCWgdtBeWNPzAyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxBuRhbk+TswbDnhZLBLKkBd6rQuV3klO/DbvJuxaF42jb5qaOrzHdS8mGqeLY5P5ViOLo/u11rAUoomWlT1VK0pudn1TyWMAIHcjWAMr2gKPalNUNW97VeLCfcOUE2tYlu+UDDGyBEguMEsCqc3clAFdx7CPdIJINDkI30GgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=YGWZfIoC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="YGWZfIoC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso10340015e9.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555304; x=1778160104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=YGWZfIoCRBbG6Ll6+BosBvVGxHjmgZbWbRRUbU9MLD/MGTCdwQfx74F6mUSvs1SH28
         zqUtxy0+oQveWzmFj3PmIo/A4BqpTHLnC6QkGrdb1fteYn/Arkh6fzTBsVM/ENe45EGq
         512FsPx+DPg68KS4Zl2FzxC/MbaUT+EpPBxsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555304; x=1778160104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=c13lB7pFvPO3ZujTS6TBZ/bg+yefGfXPdT/1XLkT/X3nvXAjSR7eaGg9wR4VwXSLLz
         gMp9oRKY4QQ7RKu7aMqzStBE9Rhqu9PUBplyf2wQJJ2eQ3CKzlHHRnjVoB8oSj5FP0Im
         sN26i0x8ZeBlLJsRvZjR8/vJ2UbYDaA9ZxTlbUEMEf5R62K0CYONuSgRFHONExv+U/Ri
         WINYDqQGwjwE2Z0dUhc/d88Vx5kNQtFX3bzDQM6JSwEBddqaen5iBf8G+EiufGwJw+dW
         QKlfzqcC4RIGd6bEXqDYjOa791B6yuWb43DPFcUbXs4XXnMfZYDNfB3TVa4C19NgtZ47
         fJ1w==
X-Forwarded-Encrypted: i=1; AFNElJ+m0+5NqcnQT2bX64YTWmn2uizGXRG2RKP4mK1Sg9wXNYlPNxaT2ZxxJJQLHUxCZyeTVNewaROa0eB9@vger.kernel.org
X-Gm-Message-State: AOJu0YziBZRcdRpPi6Yf2233bCUnW/5wdBf9ua1GEkDxgXtB/FQBeL2P
	0Sy2GgJJOMYbRTD51kPUBKBxwhvFZrFT4JxXh3G0Sqkgt2oQLOX7D/hCCjxes8WQeog=
X-Gm-Gg: AeBDievpbhJ89GUTBGPQQHLDQ9SuNz6ccaUJ7houHXvdrta/M2qhGc8voPvruC7JWiS
	Yh087BajWlGY0+0aApzW64yEjAMPX9lWuoZ/VjKI7Uikl+/yYCl/KgwhholjDp4U8Y3CDk7c/R2
	Y5a9MPcVaBjPVr6WDwl8wcIPCvTsgIlgElcrFAEmVQR7OwL9RbT9KzPTbknJ4f4ox6l9BIX3GpF
	HggU0ZO3q8/WGgNno4fqQM2EM3OTKgqiUg6x0bZCaIdGPZgFZD8+HyHBhhiQU/9LxBDPlEbzvkU
	VfJxmBwqb9Z0pjWMcm1NIgQNRzRSo88XA/qvESMiFC8gkn0l+pQbn/RmbPmVQ08ErfkbWEHTdN7
	tirhFSKtiEqZNethTHe4cKUVySlDmq6yGPXjINNFIY0KB9Lu8eBDqLBVPNJZba5XXFJrAYhATi0
	PwkucBYNrR66g3Sf6FSke39Vgw3GoJZ7dK34X3Awx//nR61hil/RpOuSVPmxOSzfTZvGE=
X-Received: by 2002:a05:600c:8b76:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48a84484f9dmr52429955e9.22.1777555303724;
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 0/3] arm64: qcom: imola: add support for Media Carrier 
Date: Thu, 30 Apr 2026 15:21:37 +0200
Message-ID: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This patch series adds support for the Arduino UNO Q (aka imola) Media 
Carrier expansion board.

It adds: 
 - two CSI connectors (support only for imx219 sensor)
 - one DSI connector (support for waveshare 5" and 8" touch A panels)
 - 3 jack connectors (headset, lineout and ear)

It modifies the previous qrb2210-arduino-imola.dts (named in this patch
series qrb2210-arduino-imola-base.dts) in order to move audio and video
output via USB-C to a DTBO.
This is needed since the DSI lines can now be used via the carrier
board.

Camera and panels are divided each in their dedicated DTBO so the users
can easily configure the overlayed DTB to match what's actually
connected to the carrier via user-space tool soon to be released. 

Depends on two patch series:
 - https://lore.kernel.org/dri-devel/20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com/ 
   (applied to drm-misc-next)
 - https://lore.kernel.org/dri-devel/20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com/

Riccardo Mereu (3):
  arm64: qcom: agatti: Add dai@3
  arm64: qcom: imola: Move analogix video/audio output to dtso
  arm64: dts: qcom: imola: add support for media carrier board

 arch/arm64/boot/dts/qcom/Makefile             |  13 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   4 +
 ...ola.dts => qrb2210-arduino-imola-base.dts} | 122 +++++++++++++---
 ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
 ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
 ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
 ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
 .../qrb2210-arduino-imola-carrier-media.dtso  | 131 ++++++++++++++++++
 ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 ++++++++
 12 files changed, 713 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts => qrb2210-arduino-imola-base.dts} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso

-- 
2.53.0

