Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFB44F6461
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 09:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858301; cv=none; b=qRrEZ64ijkwBVeeqGv+29z/Lg17KKoJV7RI1FtvwNml/5TlFTaSAS+GLYey+dxtxxvQW10hPq568HWa/VLhv6iIg/tiYQTOPM5BksmU4Dn0/lk0BUo2byAkng098RPVQXhMjs3WoB5WI745Nnu/QQfgZjpoJ4hbQnPbMfDVM3M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858301; c=relaxed/simple;
	bh=YhduCODJr21RV/qnoWSb4NuDoadYla4kv0KPFaGd77U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=MqcJPlgj1UckHLWjqz1VeFbrDi1pK18cVoytqGcyN2sHOUK76aAAkQ0OK35S2MyP19PYhhkBmoMwpJs8t87fzY7rFN8z/O2P4y2gnQdecd9QEj3vbr0g8uviv/KpGyhVVbfdFeOTRHCB82bia0YBRf2dGrnJDNtHttbvUf5Rc/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBIp8wXl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBIp8wXl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482dd6ee390so5018165f8f.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 02:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858296; x=1789463096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=mBIp8wXl563j46M+dFAPSnYa+XJA0zpsHpagMwwGsOLN3+2kXcZfVSaKyp4/KldzUT
         aoe/abkDH51pIsoFMGR1hKSzoKNtyCalx7WUqusOzmMv6A86APuLKbxXJh91gxy7iCdY
         v5VqG98HEUd5bKGQrPoTNfxTAPI+vvXLt9+3YDONpL1u8zft7/IFiEQfZYPZZlzWfE2a
         JxRk39mVNsd+Rul5AUby6n5/LYyAiVxjPesWNKUEXt+qiSU3JQWf2MwJpHrQcR2FPtus
         qTTgSwtAkJUOJDHZUkOvUe+XoxHjEUyBirx84eRFBwVAm+Sj5gGLQbt7kKCFvuKsBGtR
         F+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858296; x=1789463096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eIZ+kUaFwJKaLRLpyngmxMQG27w+758uZsHUvhX4A7o=;
        b=e57lg8UblrTIBEHbP5WVBdPNp/YZvd3ncnMv2Vr0zDFhXakbK0zFrhZalVHUZ6E2my
         DrIeKKlBrdRPEFHfVAhG+JSE1HnxoaHhdVeO1oyTgikqv4B2b6q+g3Y+AjypoTCU4/Ba
         ZFt4HwneRPkSvxR3s0/g4Dp6zYBv3T5JbsGxIYWKmRNG4Ugb9oxJni2g6RfS0g3Osc+m
         Nks+3nVsKGJqFV3z0leAtkPwtvfYeqJlf79GpI7LPtOUzo176h+Lv2DC3HHphhLbUYsr
         HNNpkIQlGBDL/OhPfdVKO3rj5jZsy0o2WNtB9tnz1s7ShQrM3K09KFGeu4fP+cc8M8BH
         6unA==
X-Forwarded-Encrypted: i=1; AKwUvBxxFQ2HjjppSgSyuk/4/v1f8R3iOXCfcaEWaF8Zkv4wq6GPw77Qtwl+aev3+4Do9i2fsdfyaWyQ7nfd@vger.kernel.org
X-Gm-Message-State: AFuF++kJpC9MgsZghu5HIIcBh925A8VHaUPa2qDrlRJyU2iFiGvinXUK
	vZAGGIBdlIXzFKutY77E478kqLjkMXa2pPVvNesy+mIQq9oaS2pUpgRp
X-Gm-Gg: AYBFou1aq/SM5GRU0fXEewcUO/G3psRf2K95K7EtW2Jy6I0O3sPJ8k14cMCPIHa2u80
	GYf6mw0tqi74t7gPy0QlhUq/coKRqAygWVmIwLejeTZToFfAe6rlVvA+8oduZ146X6+2JGo3/x0
	z71n9cKKpcgtSP4KScRaFzQGIsXmzsBm2j2bMmPZIQ2SyEsANsXbQG+TPqwdMAVyJQk2LQ7iauC
	pKLBWxnvtI8nGLRI7583fM1uVJeWX0sfs29px3wRzoeYdp1bdPWuH3J0K3nb1rHTOW5V1rOzoHK
	plgBvHkYfXu3EECNThJltYF2A+BVvhkXvY1roGNwb1qRSCjpioN7++XSBSdbYLFcK6NrVd7DzXf
	ZbINbClA1LM8DqayPwyU41OFcOFOSLW4QSLzMCI56KWG4MeLyA8ckfphV9kZpjyyms2JPnYyELq
	KrcBS2WgPocqO8fqTycS6g6jC8rKzlcyMdwBYOnJhoG2F2Yu3UVRaYuydyDMOkJYJW1Gab9EiMw
	vt4/AA6jVGEp58BE4KHQXiYFQh0p5vs2W5RwO5SRTukXJneEgx9
X-Received: by 2002:a05:6000:2602:b0:485:8c16:a33b with SMTP id ffacd0b85a97d-4858c16a5b3mr26273747f8f.48.1788858295822;
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:04:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:42 +0200
Message-ID: <20260908090448.3332-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v6:
- Fix PCM probe allocation logic
- Split driver patch to dedicated PCM/ETDM patch and machine driver
Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (5):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE driver for Airoha AN7581
  ASoC: airoha: Add machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 515 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1439 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0

