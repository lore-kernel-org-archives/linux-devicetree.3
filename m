Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19ABC2D1F7B
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226169; cv=none; b=c4MXULc2S7FG9Y19402KSOirmZYp5oGl/d9Sk1NjXxeqz5qBqg5Lx2XLJhEfxAdp4phJLIarpSvpACDhw6QuoBciLhuD5ZUxtlcXTHWi/KsB3TWSmgn3Xyl8bkua9G9dQ99JzxErr9U0BlfeA3PEyHsrBagtJY3HVNRg5CPEhXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226169; c=relaxed/simple;
	bh=RtCye4OYr+2e3wcQltPUd/mx5SOGyuXm6AFbqyk9vo0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fTMe3qxWA/ZQ4kakwV3mt1v3Qqq+kc056cN0DluQ4ID8FZdW67lYikCkzQp5PpoWRAbQMQbZ2K1NMIJ7Ool0913UgfLyQDt6QLau1YfN3JZLnukZVT2Ca9mDVFdeIW9Y7l8irHQ08l5paN0qU5Uwsn33jyk7dgfVNzhOV5mFddA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlzoV/+V; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlzoV/+V"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so420005a91.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792226166; x=1792830966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Q8IZ33W6NNgXpiE2H7gk1DjA4QMN4AQzf1Ck9B7ifM=;
        b=nlzoV/+VZDRgzPhY0+QeuJDgDsAkDUnBfuugqLTJKZ60negPfaGJlvnRyKCo3k+wR+
         tyoMMkZXf6/Ig2EjFgfnOdNs1vB2AyrIU5bNG1gMy1mVdZl6/7DzyYy90gH2CIWEPhwC
         lkttDZqbvtNGn5ULSaw3YAzgQ1VL0dRXSXd5JP+YF9ynNimKDxMC/2tyivq+isdcmhv3
         ZFqDdhk5dkHS1da0/OE8EGBRSiUHK73r/U3Yoq+yAnRGfm3tW+wwRp+q+Nf31fnIDugs
         FlvYTF58AJV7R0vDp44OhZMSde6nt3qNNq9t1RrEm9za6oM+jqGPh/TvbE+Z9J8KeC4J
         wCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226166; x=1792830966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Q8IZ33W6NNgXpiE2H7gk1DjA4QMN4AQzf1Ck9B7ifM=;
        b=aTUvI2epC2g0SM80AS1B2x6vkIM6PVnPA/wutpmmYzcbvW6OnHh7TOAoMOW3AR+7oU
         5EOwmZhYmAS7J9zxmL0CiNBU3inVSnF7mGt5w71TkvaKcdaKpRhowQ6wTHIbydp8XYJy
         nftPAgd17eqHSgwHmqWjoBJlFbQsW238OD7lBCimPGMsUgUensjKv6Yli5srf32CvXd0
         9Fm2trKh4Fkv73GKi3FLIIPn90PC0bkRic/+IsfjeSdC6WCgnJ9mBvw9adS+S0xrWvX9
         L9YUCy6GJA4IeSVMbw4THjZk66J6kVKQvYxLULuj1Y8KXs6bLe2vW723w0hPBzovH5gg
         RuEg==
X-Forwarded-Encrypted: i=1; AKwUvBxRjEzByhOO7V8lnzu40fZ3AKa1qEuNvIbCBrIxYNlnpNgMLF+9nFRMLF0cQM6tWsR2x0fSxr3GQWG3@vger.kernel.org
X-Gm-Message-State: AFq9FYLzdKKW9KxO7Jn6eTcf5E0nWaiu4wljJd+QgFR6Sllw4sj4173S
	sXdlPCBmsAp3u/mcJlFsmLiels0M2tnNLInBTAUGc+CE8kpiTk2UHE4U
X-Gm-Gg: AYBFou36evwK+ByOLlnkL48fW9dMjKwEZADDig9ems1JuCSlhdfttBH8lveV9e8MijQ
	7+eydI49ZpetRzCHj7Kfk9TOVYxRQ7o94TF1M/jOTXIrnr/Ax5/ab/LAcGB9HrcRak9GPSqNTTD
	uYgcPcxoTq166I+kbZTGxfQy6T45IQNelx0nlUJIUyNokrJikawcyvAoSqy4JmouWQstRxVEI/h
	46yvT2hIECrN3pINZNipokC2jPTU2/Fv6+MEh6V3DG3CIWNayse27PTFhjtkzBZ/0Iv2rNFibe2
	s8Aaawmfi7UIPpiyBUm+u01wJEyzsO2deF+CMXiVRSXCW0ZPV5aYRYsaxZAKlRPmDERQ4Xt5E/+
	D2JVIvxaxt3LYrKTSVAznT6FeoU9kYVfPi0mssaavb4OF8b1cyQ1zA1ysY+7BadmbrH1atSqYlT
	fad8FhWMN7bxQ4Q4Tptb2MhgpUeDOTUMdnXb/xOe/a1J+3LnNp8jNxBIk=
X-Received: by 2002:a17:90b:5111:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3acee2927aemr1967627a91.1.1792226166418;
        Sat, 17 Oct 2026 01:36:06 -0700 (PDT)
Received: from Linux-PC ([2a09:bac5:1f0f:3141::4e8:8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9461d71esm12548544a91.7.2026.10.17.01.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 01:36:05 -0700 (PDT)
From: tianshi12127 <tianshi12127@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Lu Chen <tianshi12127@gmail.com>
Subject: [PATCH 0/3] drm/panel: Add Smartisan TD4362 panel support
Date: Sat, 17 Oct 2026 16:35:28 +0800
Message-ID: <20261017083531.766557-1-tianshi12127@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Chen <tianshi12127@gmail.com>

This series adds support for the Smartisan TD4362, a 1080x2242
command mode DSI panel found in the Smartisan R1 (trident)
smartphone.

The initialization and power sequences were converted from the
downstream device tree with linux-mdss-dsi-panel-driver-generator,
and the driver was tested on a Smartisan R1 (trident).

Patch 1 adds the "smartisan" vendor prefix, patch 2 documents the
panel binding, and patch 3 adds the DRM panel driver itself.

Lu Chen (3):
  dt-bindings: vendor-prefixes: add smartisan
  dt-bindings: display: panel: add Smartisan TD4362
  drm/panel: add driver for Smartisan TD4362

 .../display/panel/smartisan,td4362.yaml       |  75 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  13 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-smartisan-td4362.c    | 263 ++++++++++++++++++
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/smartisan,td4362.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-smartisan-td4362.c

-- 
2.56.0

