Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018678;
	b=BWTqB/J2V+IrmqD147Tsp6n7r/DJDDBwNw+qASnPmY7LacfmalbrpY+v3Hu5OuCWPO2j
	 oFlacI8AxJ1JAtiuFeok1MtfNNaNELxFuAoy60QjfgI0D3rELobmrpYaFlLAAfKrvF4x+
	 L1msLtcactpIxyPMQhQBZ3e5UHEnNaNNCRXKIieHL3AMPSY6jkzFLp+rKrKCKJwQ0zQGG
	 Px129cxVj1wftX3I9FlmTlgPTc8IP3J3xsdigjyBCrAhfSkETWB4+vo9NqNdQv8fym48/
	 w4pX2jBWxmWYlz78tVkJ4FhJjjnS73Y57PoAQHJXL2peaRaMiwJY9GZ6HZwRD4kinHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
	b=vjf2LzOKQvuV9tv/m5S+RqtsD5dwvFwk/JunD+AEO21mz++QDZwjHRmpfAYjmJHh+5EJ
	 CqeSug775ivi7k4bzYJUzpEcs0dx20p/hLrfJcha2lkWnDO63e+z8dPYjMVDyHTkccOca
	 3szgm+4tGZWehHf4Tbn7nGdCR2VDEEd/cBhPNwtzPX65zcUuYCXkIHKo7qOS1N0Z7GRWJ
	 tblSYogWJzTW15A+s9s9vSsDAEmmu/ycV1IjkAAZKhPSEOreeBhMXLwr9NZ5LGeuns7RS
	 TppKiGvM8kZEA+/ZYA73RxVJbSjZyKE4lejqEr4qNYwPYiZ1KrNFFrFzMqk/D/pKWiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831C606A32F
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5831C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc6Xxqmy
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a32576da88so639474f8f.3
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018677; x=1795623477; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=xc6XxqmyzRj7lQBrNXY5fekJIw0z3FkGPGRktiNOzf5zUKTVp6yeg/YY8ZOXrUVjhu
         Ll5mMFWWkIV3ZzAXWggdOiVJQK6UxbCQobIv14PllnAqt+8uPjZvuE/ZQkWgB070Mum3
         UErfPdO2l80nUj+spYZORvtk2dYswb5fwR4YQwfZMtMxJzrASV9Ums7hlAoDxGiP5POO
         5efc2QK/CbafNHSwkOA47uHHJ+TeYlRVKI9S8opug/tym5mDQ6pLfH4uguCWARHyG8Cb
         qiUGE5t+qdf2fd5uBlSqE5ocA7YMKDwSmE9UffnoUr5Z46Mv9S4PAfu/B8w6cGZFeoyu
         uXpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018677; x=1795623477;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ta3st23k7aJtViHx8b5Y0gwAd71zJE3W0PZkE87cjbA=;
        b=B9GoCgMveAar04WoU7L3lQ0l+DvAeZ4RyF0SgOSDge2GWkVN5K6uKVdxSGVEJQCym+
         WYwey3dIhpkissy0TE2oW8usCYzi0YoWyw1YplVG6LsJId/KiHRZI6GPIjW52g3adsbi
         h3KrCwvJoJkKL+t4Ccd1SN7bMqLftQJ7bncpDlDFyHafXyM9n5Fk11xhFQsDWu2AzNft
         J0IQp/SoN69szWoweZrtvaSDw1wfkZjB+eieJzYBLpEaOU9LN9X8od0TF2UocgRSbsTF
         UaRRtmb8SW7r7ftVM8tWt8UCMsN0ZKk2M/9fP+s1BAk1L/cXNK5cZNgQU4bnIuiVBXvK
         YaUQ==
X-Forwarded-Encrypted: i=1; AL+hErF8ars5WX291xebrqYPiM0Z1/e+9VnF24ZecqcmjFD5NpF12s21MiORJw39iIDmAYPhJqgiJiTvV8Jf@vger.kernel.org
X-Gm-Message-State: APuU4Z/n2xQAOV7SvgL0MqM7IbZgoVKiff2rXvdd9A0Xdwhpy6QFmjFf
	HOtQ5tw5+TezoEveYIZg+HM5mfow235S0fP2ENcEpaR27ST0+2f8h9F5
X-Gm-Gg: AZFdTZe788fmBvsz2YuOeBt+XS+OcdjVSyuh7Ib9rXKANFDdm8WZa1ObI6dYeA4EvuW
	dUk8PyepqpQu9QTzzv3gXWzIXDfQUjbaNgMbDEIEQHxRi4T1iy8mopxDUuJsvvRQgOeeObe+Ovq
	QiACkUoPhPmnIB/UkRmGAc4sR/gIatrTYeIcAmn8o2R8cHAcPiXMpRCRXRUw7e/tX5Ki9e7nfL1
	oEjwTCPcuTwYJWEjDeXVR3pUtgj811kRlTM5heIZthliXQ2fhISVdqci36vYl4PWzuKhv4UHgNI
	zZayRFQF7zBHHEr1UKqX3IyBVMQuFZlF3fzaZEPnMgtWMbFWdcX3DtyNMe5CUoTdmRzYRb/1i5N
	BW9KVxALpRpYN0hdpV6A1gFscW1nTJ5DflxZ5OjsV3EbzTQXiYqc8lePKCTiINK3JG6VJGil4wY
	zFPwDi8bYzoZnDVrvQhtIaUziXIrNelISq9qM1NZeHF5V7GrZPpFcbimHFIPgabdeJSqDrJsEg2
	t8g4wOTxp63trWGErlOx3hDZmNjxhyVUmArnCKPN3nE+PK/jEpfPBxlbA4IJg7GxIrp3IpytVDZ
	k6aPxvPL0Ik/+5/hXgEAcmzSvMPyXCIiYAJoyrCSpPeybkYUY7AW/jW2C+9QyjNHWZeYNfP91XB
	wpyPWXbQ61v/5RmEcR1loESef8aL/TGgF3w==
X-Received: by 2002:a05:6000:3104:b0:4a7:557:fcc with SMTP id ffacd0b85a97d-4a705665645mr5379933f8f.53.1795018676598;
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
Received: from [10.161.246.232] (host-164-37-100-34.net.onlyservers.com. [164.37.100.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm5329699f8f.1.2026.11.18.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:17:56 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v2 0/2] pinctrl: mediatek: Add MT6895 support
Date: Wed, 18 Nov 2026 19:17:35 +0300
Message-Id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBQFr2L+ujSAVKmr3qNxgRT1NwoGqGlju
 HvFrrucZN68DYLxaAI0xQberBjQ2R34qQA9KjsYgo+dgVNeMUYlWdDq6Ccyx0peL0QKyTmndS+
 Uhn20eNPj+wje2x+HV/c0OuZKNkYM0fnP8biy7P2Nr4xQ0tdUaCHKrmTqNswKp7N2M7QppS+y8
 HwtvgAAAA==
X-Change-ID: 20261108-pinctrl-mt6895-84822207f4ac
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2

This series adds the pin controller of the MediaTek Dimensity 8000/8100
(MT6895) SoC: the binding and a driver on top of the common Paris code.

The pinmux macro header and the pio node are part of v2
of the MT6895 / Xiaomi Poco X4 GT initial support series [1].

The tables come from the MediaTek driver in the Xiaomi kernel source
release [2]. They were checked field by field against that driver and
against register dumps from the device running the vendor kernel.

Tested on a Xiaomi Poco X4 GT (xaga) on top of next-20261117: pinmux,
pin configuration, GPIO and EINT.

[1] https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/56ec519f6
    (branch xaga-s-oss)

Assisted-by: Claude:claude-opus-5-5

---
Changes in v2:
- pinctrl-mt6895: pad mt6895_pull_type[] with entries for the virtual
  EINT pins 227-246 to avoid an out-of-bounds read from
  mtk_pinconf_bias_get_combo() (e.g. via debugfs pinconf-pins)
  (Sashiko)
- Rebased on next-20261117
- Link to v1: https://patch.msgid.link/20261108-pinctrl-mt6895-v1-0-f704c443b31a@gmail.com

---
Alexander Letuchiy (2):
      dt-bindings: pinctrl: mediatek: Document MT6895 pin controller
      pinctrl: mediatek: Add support for MT6895 pinctrl

 .../bindings/pinctrl/mediatek,mt6895-pinctrl.yaml  |  228 ++
 drivers/pinctrl/mediatek/Kconfig                   |   10 +
 drivers/pinctrl/mediatek/Makefile                  |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6895.c          | 1638 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6895.h      | 2717 ++++++++++++++++++++
 5 files changed, 4594 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261108-pinctrl-mt6895-84822207f4ac

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>

