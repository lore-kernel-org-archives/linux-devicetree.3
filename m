Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586773;
	b=B7xGrnyX+OGryW1dg58Mrc9IumZuUmQOVLPd32BzcOkKtYCj16OJNHt9PkkS8PdlrFTt
	 eDbAfm10G6AiBS2JWqT6JhiJaEozbuWN330lcKv2wl5VUNlpJOqOtTnQIMzIzYZi3olhK
	 BgeX1dKzNd1YAqDo6O4h9rZP9CVLkDlxZ141Gju31xECg9hhbkBEnOfyMtyjSjhW8wfJo
	 S3sF69vkQj1dHRg4hPUa0a2FuCkjMOSHIUic8Ij5gJLluAhWeFtUign7ZTe4l2Qcyl9vd
	 1VmcDT25iz8gw41S3FcduhNwMjRxq9kIp5m3653AwPgrZkcDAqrhNoelFdwVlFqr/kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
	b=W1cbFUYwmK44ItJSPDYMPjQlzbMiwIBJdDcN3RTbIcNQarsl2K6A0bekjqMViOJmX35G
	 tKYbDe/iET0W6VHF3DJJgHJxuWfPFA8mswK7Lr+seIT2dLDjRGDi9aNTACkKHH9XkYbOy
	 UWLEEMpQNLgXkzhxr6TTkGKOBgxCmQdIis4xwF0ATq3/R+MYGx38OBSQ3bHzC2Ff6ZrOT
	 ifGqhPHD0nfLabYWQNzj7x0tsyC59j4iaHoqGBP8jA4i5psn9AHshUfe2avItJcew8FJu
	 8fewJenEB1q3+qp99Yi/KeSyvwoLJjYMaT8mTXcr7s7+rwAR+fWyuOKWdqm4VDyz5Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="EIx/1TgW";
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0B606A31D
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 12:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D0B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EIx/1TgW
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8520161fdb9so391334b3a.3
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586773; x=1793191573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=EIx/1TgWsYsaROjnyKXuouTFp4S8mdflZu7TaP9YW8yAOLNK3xbTWLdZmhhREtYNni
         Exw0YHH3zm67YD36bEN3+manSvXZo5rWjWbf+RT/PLVAsynpAvgrOk9UC2zxndSgkrCE
         OGNIjfKWv06jaZbUyk2+9Jk3IZTVHw95SUjZo7tnlSw29CEwez7lhqNckM0ZzQaoy8oZ
         pNMOBlup/IO/BOzlk37ZlBqfrsTkBFYgmB7g3WKs7/fjosPdVAZL84q+aFLWyJishlwf
         vZ0FQcaZXiFyvV27hju/Ecg9NgfXm7Tyxwpql5NpZFA/GJCZGRjK8SfXPzhLh0YDqdjC
         gZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586773; x=1793191573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cMpNSZYfsYlTclwX1/iQuhdswpG+2A2KBsZGqDHCHs=;
        b=STRPzJ1gP17Oa6ARPwZqrZekihjjiLSjtgmJUqy1VOvrd7Yyerb/vpuL5acRi8uw9d
         SMMxxXPBZEl7bmtlVjCtdJpvukK2FAffIKmLT1M3BlylnLJaJa5rwfBsO//0pF2ALDGL
         oQ5JxkpvqhtRqu+58YMaw/ddAlcD8u1TqlCuZjjTlVLB+v68KpCW6q8UWwi8eA8ODBB1
         UvFIiHOzEzvSUcyr4Iu5LOXWNEoUldWxXSLaFFCoKH1T1JeeS8Z2qTnChPmUVOjR6Vff
         rUgZwdmCKPBTxBiRGao4ijRijJcDrxzWPotBY02ZN+rnZafdsbxnMcl53w0bUWnQsGNP
         QfDg==
X-Forwarded-Encrypted: i=1; AKwUvBx8kFYNHLhwHOaBXEeTvZ1O/eIRGj0fn7p/EQ85YPeOKHp74qqit7219R5Gaeu8M4MuL7XC356+0+vc@vger.kernel.org
X-Gm-Message-State: AFq9FYKed8pTvpIboJZWJtuD4LdnPo+z0Jp5/ugQXS1rayXDuKpRdoVY
	TqwnlfnSUr+iaWDjVUFRC4mz8M2SdAeIe6CKri/mYCcBa/avZ6b3Cl8z
X-Gm-Gg: AYBFou1f/w/bD/hNCL1qWbM9BMjdTLW6vQncf2Gb3FkCDou4DnDujKP2+dy7FMLTIUr
	jzy2YGgVlNTQTn1waoaATs9fuz905XGV5HuKtPfi5LBvIuDlTqEbpwA3uS35doM9EvRtWMPDRUH
	PPskg33/c+fZP1ly2gKoizngBYOnWvNOV2LgTOBQP7ItinxeqzDcAPo5pyvGXLPbyEPPA9Sgmjl
	H1ARsbf9z4HpvijoPZnN3yPFF26+P0cTxdOLtssC/dl03FugSM0k8ZRrHP9UBHjdDsXfmJ5cE9q
	ReklUFIULfsBDY7SiIR5ZiP9/GTokSBh/e6ofblKEv1EFkGJj9kVcL7ZGtj1nEEZXqxj5VWEg/1
	j3D+s/Ck9heb2JDqJRok/xwHNjuTeRLKH3UWFVQPoX7o4D2VEFJjSKnk9hSSl8KkLo7fqYktLFf
	SNun5CESnXbZmb3ogiIgkTMkUOBIn2N2qvKyBAf/591ybIzmuLS3jR5SF73oLXQ0NuAu82HSMDq
	eTgBNgHSTQ9qLDIIJCFUU1DFN3aGL5RLSwQrItSPOUuE3wRAz/h+x+XaDWudtI999EosTN3O+TV
	zgRTtESXvG1n9fQ=
X-Received: by 2002:a05:6a00:ad82:b0:899:632a:9613 with SMTP id d2e1a72fcca58-8a089d2c36bmr1490501b3a.40.1792586772365;
        Wed, 21 Oct 2026 05:46:12 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08960fa88sm832964b3a.53.2026.10.21.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:46:11 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Wed, 21 Oct 2026 20:45:46 +0800
Message-ID: <20261021124552.767218-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Everest ES7202, a 2-channel PDM
analog-to-digital converter controlled over I2C. Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v2:
- Drop the hard-coded 30.75 dB PGA gain from the power-up sequence; the
  PGA keeps its power-on default and the capture volume controls apply
  the requested gain.
- Keep the PDM outputs muted until a capture stream starts, instead of
  unmuting at the end of the init sequence.
- Re-run the power-up sequence on resume before syncing the regmap cache.
- Handle the regulator_get_voltage() error return as an int.
- Drop the unnecessary of_match_ptr().
- Fix the copyright header.

Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 367 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 +++++++
 5 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

