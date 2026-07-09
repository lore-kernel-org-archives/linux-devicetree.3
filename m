Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74218449997
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635223; cv=none; b=tk6dlNANl5tIkLMW+MfT6AvT9Zt2+nG39H3fLEIddc8AuvGl1bx+Ys/3vhs2eMlMyXg7qBqFZD7xl4KCgHZunohz/VTkuLfV6aCk2Qhdwd4WLbRb8q/5JiWyTSyw5v/ajmzZmu4EzsxggWGzKp8YS6f3Dvp8s762Z8HQHkajxEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635223; c=relaxed/simple;
	bh=c9aE93lkkyDRQAGKWchGNXimHCtf+KxRam7dICs83lA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FdzQSnzfCxUj5U5NJsFs4OOzba1ELWfNsjf3qQvWA9h5gp8VBVcN9sZJWlt4APxVw27iXdQv/yBP85rG2MUDeL847vT3+acLEuTlPSPZf5WsYgCNz4QzDlHHhnZCFzIsbW4yn9wF2ze0xNK/g/imwGc94bCuw1d8nwEIprANQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnrmI+Ma; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnrmI+Ma"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so324433f8f.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783635221; x=1784240021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUAu6I6BOkoB20ZosEqwiYIiRv3UnwmkNWFwoAnykFw=;
        b=PnrmI+MaqLudVxCPNN5SVi8Q0j/gDFdFrSZJTXFdm2U+vEAKCnW04r0JdlPIOqnUI0
         AehhrIbCdE0+365+N3aB+9C5HEaWfYhetVJ0l4lS+dRF2EPsK/iFfGVkW0XbVkf5CjSY
         +Q8GQo4OepL7TLNqcN6fZ1MfRo+Yv7v6dKO7kqRZFJofEutWfaUEY8Dq8hHYEzhDlO0C
         hgdvrXZrrJta6MoQjhw02diAktVAwUhq9Fvmb+TaFeh/wjUlNFaELwuhNCMW2FDfEwYU
         dE/IW9p7J7lOefycpQ1G4Hmk4kn3481azPOc3gF4qiXta4VbUptR44/dpfvapyxiehIk
         KyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635221; x=1784240021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUAu6I6BOkoB20ZosEqwiYIiRv3UnwmkNWFwoAnykFw=;
        b=Xa6dzOu26NZpgGyHlCfGeLU/GDkCD373wevuhaAkgayD3UdSlFMoO2uuRGIu3UpEii
         UhgYaGeuANS4s3cWcLUafFlMsLIsVBdAS6mygsYZhOHBhHQfIquLD10hk3AHTZsWtd0U
         4qPARymLqNf6NldO/d00NvMMQ5mMZptrc73KRZFFKnCBXzA54Xc+GTpK2Ho3UMaPj6z0
         N9pgVxLlS88it0tDwXIajhKmusCFnlb9yiTslSH/YbnfWTizLFh1nmNfaj23Btb0EF8f
         PIMKS6cN8BiGrUfnGZ2hZgRdIlnxVXyNQ6deTeDKoThbXsQZVfAQy7cGquKf/AIE97d1
         e5yg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4c6sEq+Thd/nEC1xcbWBeS/NOeL0JH9RDEiswUtbe3LDMIEp1uLvP7an5ewUg9e+V1MWpolj4UCD3@vger.kernel.org
X-Gm-Message-State: AOJu0YxemMhqk3hdno+m65eiQSOAMBTNr9ZJrqDLfxNP//tkFfQ87dpA
	58c/7+b49Js9LS1Jj6TeiIib4qX60KvD4OiWBDnJj4zt0X+hQlVZmttj
X-Gm-Gg: AfdE7cl+8P40c6FUCTzjLuMKmbFLYbWYo2M2eIXAk5BOkDM9hOAnF9YtaFhNFstnu65
	a3xs4xx/5nb9pIURywpA085JpMOcWVV8QauWdtTEmbPGZzhOhphr6VSKD3Bt5Nb4UlIGKkxZGzF
	ejdGShOdJLs+qEkDpVaUtMrP1T8IB6kbm/+6OXEu77FxnFfhAW5v8rolvTAX91cgZ//a0aIc67I
	V8FgV+/bPJ9orI+R9enqV8oOgjCThJluD2YroPpQlQ8nzDuvhd3UU8E3aQcjOs0xu7Ao/tR7EA1
	brmNMIw/uDTf43euNWHJAQOpl6/6qoYPpGD3XH6TPWeJ2wc9bJ0Wgef01wVQCVSxrZCn1K1ZYS+
	Iyestp3vzzkbYuH9cPpDHSvFw+Sk6dSaYF0fRFD1ni+EnArYzH6wFjQfKg+mMYVUDemn1T7wTIu
	UUAN+FiZ1pcnaR5yZIiZCL6oc418RV3rPk
X-Received: by 2002:a5d:5e92:0:b0:476:c622:d41f with SMTP id ffacd0b85a97d-47df0768507mr10065889f8f.47.1783635220736;
        Thu, 09 Jul 2026 15:13:40 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b023:8011:c993:4bf6:23f5:d942:9d70])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f2465ae8bsm869008f8f.36.2026.07.09.15.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:13:40 -0700 (PDT)
From: Gianluca Boiano <morf3089@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Gianluca Boiano <morf3089@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Fri, 10 Jul 2026 00:13:27 +0200
Message-ID: <20260709221331.989109-1-morf3089@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The TAS2557 is a mono Class-D smart amplifier with an on-chip DSP for
speaker protection, controlled over I2C with audio carried over
I2S/TDM. The DSP requires a board-specific firmware image generated
with TI's PurePath Console tuning tools; without it the device passes
no audio.

Patch 1 adds the devicetree binding. Patch 2 adds the ASoC codec
driver: mono and dual-device stereo operation, per-device ti,channel
tuning, and fault-interrupt recovery that reloads the firmware
configuration on clock loss, over-current, brownout or
over-temperature.

Tested in mono configuration on Xiaomi Mi A2 (SDM660, jasmine),
Xiaomi Redmi Note 6 Pro (SDM636, tulip) and Xiaomi Redmi 5 Plus
(MSM8953, vince), driving the top speaker, and in dual-device stereo
configuration on Xiaomi Mi Pad 4 (SDM660, clover).

Based on v7.2-rc1.

Gianluca Boiano (2):
  dt-bindings: sound: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  123 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 2476 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  218 ++
 6 files changed, 2831 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.55.0

