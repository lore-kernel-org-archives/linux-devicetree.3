Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD8D3EB11A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 23:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784331268; cv=none; b=DPQdiSwy3u06NUItYHmbTyQavnvLnn7jsN4gQpnDbQ7XZ6Rlw8UdX8xulns3Cs1VPsOhdLdeEVgxNg71f9f1ZexJQcl6NOXsnarQeGFmX3UYtcoyz8Q6rbfABXNmJqy0pQndkiTL7mSOwUedVVNeo6IRvzTds5noHpvl6kdhqyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784331268; c=relaxed/simple;
	bh=xS2i3+ZGq2zm31s7LEacEbVxn2lbxkauDoC3qOM521U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIGoN4m6a6noG3Z5xBJTlQHXB/JtJDa5Ytzr49W7szLgplJLsQYFI6TSXZEWQ7o6K396Oa+i/PsH+v0UHoShOtQrwPmdXrBKJBXstBNChaoniV90LapgIPzso6AKfitteBKL7TDsw7xbEX+npEHFTbQw1jsWpVAZ+q3oQ2qBDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V056q1pC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V056q1pC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-698bf053053so8302838a12.3
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784331262; x=1784936062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbjXNEQYMLgs++/HbjkyefmpfybhPopOmtA77cMAbug=;
        b=V056q1pCbZXKBVHw0nCcn5tV3hxEvtOMSlENdf8QvTXtN4auqSq7TbFU1twv5bl8RN
         VqkyQeilshIyHYXFOIkk3YYsLswpHK4wzu7903Dhg+nnE+3dJIT2QchAvMlKXP/DbQyq
         babj8LACvZcWAJ4ZWt+vpZ1+FBIzMXCuQxfJUJvQNjshcM5lPwOLf0eWmIHeEj5swnlm
         CbXfKooa8BqLSc2am85c4XJx5Q6Y5aBQRD3JFuhC6xoT1tq+wc7q3GcMJEjUuQlg+jJ9
         mcVzRUeW9OtDuEr6/9PEWIv2VnVVGrAvQydLeZE0PqpwVA0dreAjOGdlcqdC9XH2euPm
         azfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784331262; x=1784936062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbjXNEQYMLgs++/HbjkyefmpfybhPopOmtA77cMAbug=;
        b=TuGgdiVW0nib3dKGE6u2HF8U0DhBWGJfFOCOcDBU01cCKw1AQc//bU/LQB0guN5UlN
         dgKOd9Ih83lqELTBoKhbDHPy14wErTQLpTuTYNqUxahNK+XEmjEOGzv+lPMKv9CUVbBf
         YMAUBkt9gdTVoz+VGib0KYLNNbM7VSpJUzX9s9d1X7flqEEsT7bXhCnAS51g0TmE+yUJ
         keHx3TsDGq43/XEHjC+qTdBSM3FUAo6/YxA5JFltlL57A0Hy6JfFGBbyn4XyofxJlgiM
         RLg+W51gFa4zZC95ZsvwEIjKVyTZgozowNi+Y6gB3k+VjhdBpw9HfAaRdqNPIs5UAlyB
         wpmA==
X-Forwarded-Encrypted: i=1; AHgh+Rpp6UK/2A8dri5KXgFh3v4k3GbRG6jigfrjuTpsj/Qo8vx47oVL1lvzW7+MUlDbLD3R9qwuQyqbG4zb@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwZOgPFYmHXaMB1TBt6mUrfPwEN9THQEfwUcgW9gRryx/MnPY
	JhwIxX9RbSBnsCqJzut3FDtJA24siNZzmBwPI4W1v3kM1IDSiUsbkQO/
X-Gm-Gg: AfdE7cnwphoCOPxOczgDGdx7saJgOYh0ljGOprT7rmlAho+BWOBwmC33mw+7qHevm3O
	mQ2JicKJLBLgjUhc6gf2LiTRIMI7AOTR/sYxETkhqjbiiVu3qb0CvliiRHvRdHkT/Q8ppVQZJ5S
	EYvurW99vw1TF1YM0MEYDRKxCWGAa+uJxQApvqX46TVg0Hb9+37/MtU6qLrsy25P85IbASGXE2k
	09Mok+7f1kLmcLsZmf9x2ac1yOPrxddCWyFIo1I34/igANkx3StHANAsKLGXZDEdUnSAmtgXGWD
	w1HrdFH/HsQeajrgUOc9WUvxgx4lkRnh7gZB1T92S8xPn/MDtCHLOsKLrk/rOJT+pG2nvw+u1c7
	FTMhcPT2gsfN0GKbS7LICiC0sMYCOA72R5prlWeatM2n5pXJYWv2pI51OBz3yeDkp4XlRj6pjbh
	EqD7+ZvqIuroRy51EyD2emxhEw4dn2bg==
X-Received: by 2002:a05:6402:3809:b0:698:de64:6aa1 with SMTP id 4fb4d7f45d1cf-69e65272038mr1835284a12.10.1784331262041;
        Fri, 17 Jul 2026 16:34:22 -0700 (PDT)
Received: from unknown.tail46804.ts.net ([2a02:b027:11:f86c:39a3:6436:dcc2:e48a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fef2477sm1429231a12.7.2026.07.17.16.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:34:21 -0700 (PDT)
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
	"Wang, Sen" <sen@ti.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] ASoC: codecs: add Texas Instruments TAS2557 smart amplifier driver
Date: Sat, 18 Jul 2026 01:33:58 +0200
Message-ID: <20260717233402.414326-1-morf3089@gmail.com>
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
I2S/TDM.  The DSP requires a board-specific firmware image generated
with TI's PurePath Console tuning tools; without it the device passes
no audio.

Patch 1 adds the devicetree binding.  Patch 2 adds the ASoC codec
driver.  A single node manages one physical TAS2557, or two of them
sharing one ASI bus and one reset/IRQ pair, using the reg-array
convention of ti,tas2781.yaml: the device at reg index 0 is DEV_A and
the device at index 1 is DEV_B, so no channel-selection property is
needed.  The driver covers mono and dual-device stereo operation and
fault-interrupt recovery that reloads the firmware configuration on
clock loss, over-current, brownout or over-temperature.

The driver has been exercised across development of this series in
mono configuration on Xiaomi Mi A2 (SDM660, jasmine), Xiaomi Redmi
Note 6 Pro (SDM636, tulip) and Xiaomi Redmi 5 Plus (MSM8953, vince),
driving the top speaker, and in dual-device stereo on Xiaomi Mi Pad 4
(SDM660, clover).  The v3 ASI word-length and data-slot-offset
changes follow hardware reports from vince (16-bit, offset 0) and
have not yet been re-confirmed on the 32-bit/offset-1 boards above.

Changes in v3:
- rework the binding and driver to a single-node, reg-array model
  that manages up to two devices, matching ti,tas2781.yaml; drop the
  ti,channel property entirely and derive DEV_A/DEV_B tuning from the
  device order in reg (Krzysztof Kozlowski)
- rename ti,imon-slot-no/ti,vmon-slot-no to the plural
  ti,imon-slot-nos/ti,vmon-slot-nos arrays (one entry per reg entry),
  and constrain firmware-name to maxItems: 1 (Krzysztof Kozlowski)
- derive the ASI word length from the stream (params_width) and
  re-apply it after each reset instead of hardcoding 32-bit, so
  16-bit boards are no longer forced to 32-bit
- set symmetric_rate on the DAI (Mark Brown), and add
  symmetric_sample_bits since one firmware config (one rate) is
  active at a time and playback and capture share the single ASI
  word length
- apply the same write-then-cache ordering used for the DAC-gain
  control to the ISENSE/VSENSE mixer setters, so a failed
  POWER_CTRL2 write no longer leaves the cached enable state stale
- only cache the DAC gain after the hardware write succeeds, so a
  failed write no longer leaves the cache out of sync (Mark Brown)
- default the ASI data-slot offset to 0; an explicit
  snd_soc_dai_set_tdm_slot() still takes precedence

Changes in v2:
- add the four mandatory supplies (vbat/iovdd/avdd/dvdd) to the
  devicetree binding's "required" list (Wang Sen)
- propagate register-write failures out of hw_params() instead of
  only logging them (Wang Sen)
- return IRQ_NONE instead of IRQ_HANDLED from the fault interrupt
  handler when the device isn't in a state to have raised it, so
  shared-IRQ accounting stays correct (Mark Brown)
- re-apply cached runtime state (DAI format, sense enables, DAC gain,
  ASI slot offsets) after every device reset, including fault
  recovery, instead of letting a hardcoded startup sequence silently
  override set_dai_fmt()/the ISENSE/VSENSE mixer controls (Mark Brown)
- honour explicit snd_soc_dai_set_tdm_slot() configuration in
  hw_params, and restore TX (OFFSET2) slot offsets after reset
- wait for the asynchronous firmware load on first stream start
  instead of failing with -ENODEV
- make mute_stream direction-aware so capture-only IV-sense streams
  are unmuted and stopping playback no longer mutes a live capture

Link to v2: https://lore.kernel.org/linux-sound/20260711145722.188556-1-morf3089@gmail.com/
Link to v1: https://lore.kernel.org/linux-sound/20260709221331.989109-1-morf3089@gmail.com/

Gianluca Boiano (2):
  dt-bindings: sound: add Texas Instruments TAS2557
  ASoC: codecs: add TAS2557 mono smart amplifier driver

 .../devicetree/bindings/sound/ti,tas2557.yaml |  174 +
 MAINTAINERS                                   |    1 +
 sound/soc/codecs/Kconfig                      |   11 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tas2557.c                    | 3067 +++++++++++++++++
 sound/soc/codecs/tas2557.h                    |  228 ++
 6 files changed, 3483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2557.yaml
 create mode 100644 sound/soc/codecs/tas2557.c
 create mode 100644 sound/soc/codecs/tas2557.h


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.55.0

