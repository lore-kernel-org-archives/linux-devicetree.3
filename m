Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCB24718D7
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806056; cv=none; b=D4oA5dsWdZ64+W22RiFA/oX55YEweL5dWc2fTUWm1mV85fwPDdl0PLX2b+Z4fOaP4MjZLH2R5V//K2y4A1+r+0brBjMSEP6uWyT3ARyLQqhvht/GpeGP7WXR3OugkjS6eWGUOBwwtElZbpmVWwgBP8DjXytfdfPtwKoZQ91M+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806056; c=relaxed/simple;
	bh=RIXnkaIGdBYruZ6AHlMRU+fZ6F/Tbfygc1Wr4yD/oEA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ZZhuWo+DzBY6aS3BhgQTCGqszJxGMjPUvP4lpY6kt9m2MuKAZKsYeUfM2kxE6l4PBE9bNvJ6MKZgFT1XbBUkG4HVUBkNU1intPDZ96nKJNjxjmf2Bc1/b6mLR9R99CmOMOZ7YjU54+Js5Ln+CA2TcNe9Vq7In+EcH3fd80stu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvzqoBAf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvzqoBAf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so1699394f8f.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806053; x=1792410853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=lvzqoBAfkt17Y3Gv8MkXfYnL6kJH4SAb8HxV11uXnzUf5S8CiXDQRfe//k+aUsvKW4
         HUIid88JWRbQMz0hs0FYxWggmHRXmAjRMqOh92rXALOxBUYluXp5WhLcxnar02Y/g24m
         IU2X0cwhBt6ieZzWwbHmXDosrprn3yXjyD+NOQ3ICcQ7lnMTXAPHEsfXwDBiSInQSyYH
         vTDkUCFjnumwOXX9vwieCXwZ6DkTq6Hzoa8b9X4icYJlz8dmLeQYzwleiIawQtViRopU
         xHxhcbj0i3esqKQMBZW4oLFPFgl6P5vximmbDde7TAv/hnPSigUXhenFq2QNLAwkJqpS
         cQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806053; x=1792410853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aHowWq+YczhDXXIY9TBMKGYh7uMuFbwbJnMWhOB2Lqo=;
        b=oPXi1QMXSXtEwVMwylsyR+exI6b/VAGzkgdCCo4sfRoZx4ylrqqq2vRuGfjCFkfdgP
         6dH14FyTzIGh8LTtNzA+7t8x9JfWfe0DdfrXJU5L2abpjmg0YrrtDfflGyaU4VhjnUCJ
         f2kLkmlz5uNGgUParOyIm0u8B+2wyDizbpR5drjWn9/MXlWTeGCkFkd5RVt7mBjehLpI
         Vch6FGyic1+cS7IlsMnUUVH+eCMJ5G7yOj4TdW1KOHlXrxYFZIDiE8lDgJbAaT5+d2Qt
         ZA07WmYLkfNBy1MmTCcPR7AmvdcL+FzVJ3twYeCFuAdWrrc9hrVGZFjhJ68UMc9jiLnx
         kbOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMkO5wn0xuJrjP8e/IvUhQMLjQ2ch4nEllZaj34SeRFN2hLa5iQbM9iK438s1dG9hh12scv7AEs3HY@vger.kernel.org
X-Gm-Message-State: AFq9FYJCDZJXVJB8crQ+ix+t5J4miAAHqjKVC4xHgIgaM6l8vPl/8q0M
	bWLG12zmVaLMUza7JWkuWXFTokbnwAjLpy11+kD+tnP+6rxClArx3qnTpI9OGw==
X-Gm-Gg: AYBFou1JtVZI7jqR1gFwOPMGcv0wkCU28YjGKC1eKDKAYCb515DrxGzy33ib/xFZLOV
	7lI2XqHTti9tZ2mHR8UoT+I6SwDgzVbniZy93fUwLUSl7HbfBjLsPz89wcSrMuUWlRLkTRMThnj
	MOi5EJ8NDIa2LfNXxrdCTr9FdQC7WZPvjxxRS9WHtq+FqCCwu+ds2OACFdZa0aaOp5WCoihm7E6
	ln0QPP7GpxOWHrqCrkXbyVAp23WehrnqNs5j1qCybBCSF3Z/cjwaFhI0Ee8kCU8onngvyY7yn96
	3NW8RKoSnCllm2ualfS3UYhbgojIu8Ry8cdQPXt9y72luqyjX/AQaIvIhXdMpT76eA1XKrQYnuV
	O3AUKEGExYlV5c7mt49foLIHOtE7ZANUPj8N/3mksmmjcUehr+yZkDwD6byHUHV2+dM9ByfogX0
	i2S1ES+n01GKbiv3Cv94MDw/PPdbJS5NsQDLZkgexve7LUV0hCvwyyr0BIkxy+5ZZ7P+HjbZzaq
	w1PXtbKijQzwcbslIts0UKMOAG/oEPepx10VckSIrxYkOG4Ywvlg8DKzs6Y8ysPY7N3Sc8etxTO
	f+nGnqQ5szfDKqP/VR8Upw==
X-Received: by 2002:a05:600c:a404:b0:4a1:9945:98a7 with SMTP id 5b1f17b1804b1-4a1994598ddmr70360335e9.0.1791806052577;
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm311783805e9.10.2026.10.12.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:54:12 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] ASoC: Add support for AN7581 PCM driver
Date: Mon, 12 Oct 2026 13:54:05 +0200
Message-ID: <20261012115408.87066-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 904 ++++++++++++++++++
 7 files changed, 978 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

