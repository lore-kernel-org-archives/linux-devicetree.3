Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC684A689F
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791544437; cv=none; b=eqDXZ7KmGl67aVbP+z+hHeGFbMWBmxZI+O0DiiUNN+gMc9j5kYkH15gsRZLNKRjNWQUIEXttq7+3MZcoZq3P37L8tYxXSJV0ZabRd3+Qx2N148XeyJYfsG+UdFJFoo6eEkSkpL5sRwIsHKn+Sz0aukekIi8beHFTGLzNCf3vJgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791544437; c=relaxed/simple;
	bh=hB7RUXXcplyw1SxWPvRgz7883UT15C/LbarUbzqzH5g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qNrSu28q7tx2F0TkkAMXReHn3zigAiHZHk5fvNIhpec/BfRrUt+QPdU3o43UZEfYozb0BC/5C0h8ndiS80E0A0Ial0D38CZSGn2jdvhKsWPECxqNSI2XgKptr7qZZzZcax9GFBOiTtLEpKeV6A5Br+giqK9gQTm+tR8bCW+tsPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f1McgZ/I; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1McgZ/I"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so33711605e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791544425; x=1792149225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ga3VtcTLqZl5ClQan+7orwRYwMHOLr/NfbU62M9Yt8c=;
        b=f1McgZ/IlMCsRvPdEeX8Mqbk91HpoDJmnd07R4qzDnQT7//uin6eDwdPU+zy9c5GHy
         rxOuhuIUYeTVHQWGF02LZpGXsaEncdzytBj4tyEjE3/pEphVQCvzWYXcbTdJKsMoQJ6c
         UsDfyPhVKmzWMRG+yBT1Vut3CXabMiR7AYzAuh/13FBNsG+87xlNm341mMfLzeJMdmV8
         A6c0CcXPHy5mLTm71qesx+0s3XHBPcZQXwnZFhl37rLtvMbOB7Eu5KRRmzeN3ci4Vy6N
         kqYjxzyadLcNQPJxK5aCWjk4jKUaH+geAlqAfkCBpwkFiBHGmRaSB+DYuTh6nSHHNOF+
         LsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791544425; x=1792149225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ga3VtcTLqZl5ClQan+7orwRYwMHOLr/NfbU62M9Yt8c=;
        b=Z+SO1+DON6YG+noBuSXYGh0ac7DnSYdPBUTad3MqG1JGRrUgfObLhmOQKbu2/Oq68X
         kzTAwqiv2XWMyA7I/pbf1v5q/WNB7cj2yowIBRZhgUpfHtj7fzF8OOtulhd1A7LRawlM
         N/LLJrmTfi6eUk4jCmQLsHVHHk029xcUzYeUyXS5HW5omC22OPoBERZeTasaGMdp1LmT
         k20HAkdUyEs054TAu+7Uss/mn5SVod6eUX8Tf7eIlV/szTOS0Kt1BcDj9L6Lau1XIr4H
         qvGKLwrFb7jMFINKpkdBWJsM5fjSTBb+MBIPvcg6YPLrnuurBFfrGz8wkFPeq3LsoHUf
         v45Q==
X-Forwarded-Encrypted: i=1; AKwUvByhXlZKmi2OJLIFxyrZHJjlM4u/hRwOVBkZccRirg4AyQ4K2k+njBtm5d/JieU44kbGsXOj68VJJid7@vger.kernel.org
X-Gm-Message-State: AFuF++mlsh5ZfUj8yPa0wkm3kr6gZ1J//qfQ4nV3eJESwa6umPsH4ROR
	aD6hmQuXlLoeDo2JTuy5np6yZw/Cfndinh/+JwJg4rk9WUeHntehHsKbfYD7ow==
X-Gm-Gg: AYBFou12QyJWDKtQov0b6LumEHsVrodQ4sX5BzqPq+K4Xrws2/vKg/EwYN/7MnK9q2S
	udOYPYiFF9wB0vp72X61meWqls5xkMBPbWczqcHJjReTszOTO+KUpaGJ1DSiyla0b7+5LQfyOIr
	RJdfvjyIossuVs/Wycyg5j5tXKuTfZkwEwFZZ7EkBs9FSMWdn7MjPcKRpDXntMLA5WJMVnABl/L
	G662wRwjeQ+Xg2mGPs5bB16oY44ZNXbjtJt4Hf+ornKQBIkj9jUHzgwqSqEKbkKZlhznV810G25
	0SqU2r0dHsLFvsHLkqVs7d/6yAPZEOB5qw9NZdzQ7eU7hN/fHSp8Q6VYQGlzIK02FQtuBYHPcVz
	vpemJocTNuVYgILUbf+gAW40jJvgR9UBn8Rspm/e9epsZxSSsbVcsnk7WnZzhvw2B8QTcw9yvsZ
	ejFQOFv5w18Jspo9PMeDwtBxC8/Oxyt9nQUU8horjcxESqrG8u6SDRMaX+at+cwSv9DPrb4TYJn
	Z3EVbt4ADvgz2sJH3V2qiSrZe4dsMG8wjXJM3qkrNvHvP8KzxH2eySOHWeSIcF6VSQCDl8+cmfm
	f32aE7D7htz/a2ik
X-Received: by 2002:a05:600c:4fcb:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a18e4c3dd0mr26633215e9.29.1791544424618;
        Fri, 09 Oct 2026 04:13:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18bf135fasm45503605e9.5.2026.10.09.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:13:44 -0700 (PDT)
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
Subject: [PATCH v3 0/2] ASoC: Add support for AN7581 PCM driver
Date: Fri,  9 Oct 2026 13:13:30 +0200
Message-ID: <20261009111334.23522-1-ansuelsmth@gmail.com>
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
 sound/soc/airoha/an7581-pcm.c                 | 910 ++++++++++++++++++
 7 files changed, 984 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

