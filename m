Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793520578;
	b=R9fBtkivaOeb4UfmpS89qjhTYJNFRRI9Wq+gkiPwinmK3hDhKFgAJZfwHxUm1Mh5IgDa
	 /MvxjYIEZuK+icf4oMS4Bf3iXpU/RLF+KeouIYB1o31d0/mmucnqLIRDWxggNYTNj3Vdv
	 7B5h17nc0FKplfXfVthqBPihIA4VEf7i8Ge1IDNAFVACBwqxPOat8KsJ6m93+dhmdp6Sv
	 fqYL0B6tNnV+2nMsQpSZIfflvN6GaiTPBmTK87Yx3oHtvtUoisDZ5c8oDOv0M5AW6wjcC
	 Mkl019PB4OP/KcOJZyxZj+eG7syuQj9ZfHJallMJD9sIePQ0VbEVi33vJNcKGRYIETg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793520578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
	b=ORvSzxeTWmV1VmgSf6aS2XA596qu2yfQOK1vMipdUskVXl3RFUvmFigCiJojTfSZJIo9
	 m6iHkEhb78J5BEO0Z10f7JLJHEmyCKB9nXm+S0twE0vh4Q17ybgjUBckQvTT4wh7CslUZ
	 pqwEM/Nc37u4Tml1xcmP0vvCZi0I6dxfbI0HlGLa1OT6GTfizfPqrfeH6xScykJqYmFfK
	 ZxqIbA1CN22x59tUEhyexC3ognjO7LLrqdo2RkDViipHmuPEn1CCxTkMKTY/cIlTOr2Df
	 Hbwi8B5WAocoA5NkoF3re8FAqO77+ZOEO1ysiDa+HpzYTYlbDHRSBpI3UHpV0VOMBLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD48606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD48606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rP23xyf0
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so3714177eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793520576; x=1794125376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=rP23xyf0arPyjxxhA0OpvCazKXpj/6elzvriPCYljf4aeeqTiu/VmGC/6e8LMJlm3S
         APmcQqI8eYuDlAR+lHMGiPG63ZirJ7KoXkMTBmDmRBQjXr4lkA0bYN4CylbyAyr8cMug
         oH6t98/g3WUnMwiNYGa86xW6+7syOqhkXv4/LxKfuMqyayWy8Nj6i23YmbavCB6N/VMO
         Kuc+ZOLXdcWNCE5/zPyN3C65/jH4rQ9lZJyWeTsPzIKZawXZpfuZmKZVFQ4jJwqc8XOt
         ZUS3NCuGknSCXUH3YQ+E+NZOvH+ttJXYoSFAdJqIDmqNl+FSPekxUKEIEg+hIci3lRhy
         xMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793520576; x=1794125376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U40/ZwQIGB99gEwVGvIAqyV6gYrXisGSQoDqHe7yhd0=;
        b=tcQ07SvHBBOV7U0o+kJNQQMqom4fESH5MWTMb7yRyfeoE5BCPofZ/65eO2g8gxWzAP
         cINt4Bwiwg9VXP/vn3RCt1c1opG4RGULrpxGfpl2vbWck8UdzguBhtTq3UGAoRqXvumU
         MyDoOj4nlrLygRbP8zXDnMV9I5h8gZJ2jJ+UkI2vhvLRuR4m+EMakNc/piz0Ts5/SrA8
         v2ip9LUq8UxMcSfMJy1lqq20LglQQinxqpomeMDyZoBn+GwH8e+bsUC8Hk3WTqBBfNTD
         OktlQKrjo4RarVy6i2uj9iHPshzEkhCitcw+pKan6FRFGsk5QJsYz8TXJCtbFVdh/JiQ
         9LZA==
X-Forwarded-Encrypted: i=1; AKwUvBzHj1NimBrlBuiv7WUG6EmaqWtVEuFvaEyHNeEVLKB2CEC0B5EsUpIcxM6sKtXjQ1m3d28NcDfTxyMr@vger.kernel.org
X-Gm-Message-State: APuU4Z/KlHqiadGph7PYZNRxEiRhEckLSFJ2FnhfR63fGbVN5XUUnPKd
	RuJZl2mp2tItztu7AJlOVkiRxFrXZqJu/9nAtkvfS74WSOVqNpNqVrY45v8Aid0AaoM=
X-Gm-Gg: AYBFou3xwDBepu2vgn0R47UIB01Myt2a5Ngn8D5v73gYEsaTAX81dgK8RRMhmQ9HJua
	O1znjap0w6N4fILbClRH6g5B0tpOdJ2bWw535SxuICI8K2feKIS9BjWaZkoa8OJdRdbIMWN0JLC
	5kizeHZwqaWykIKGvzyYzJcc6AMjVCRr4j+0JAJ0ZLQdagoh6EC6xqykwxoLCNeS+9rCFiZ3F4f
	Z7UBrCebwcQkBgHHUYMqAg1kNntrgW67nkXP6R7n9cyRj1zAqN6ARX2yDGN4yuRhk8WgZufL0Qp
	NKtNM7RtXMl/7f79B+MR7eqqXyerk1UKkNJEdl9wKVNUNWCujaC1BSOCivqGGc+R93RoCXHdi5o
	5xb4DYFrdZKnGGKYY27tZMc9fYcEMkOX+6xU5R0q1XZLAUrspntNFMeat7iaAuZohbNGnQOcIo8
	s9LiSHkMtJGo1i1Mye6PtYx02p7AxY64KVSTdWzmpTRmE6L8i7yohuGEuWSlurg7sCIYSBfg9lI
	Ws8jj/nPDhK8uanfUZTfH88Mi4/XSTzdm1NEHQmPET49JRTgaeAkEe0vr/Sowhs3sAzgKBlQ+A5
	dbl/SAeWyL+mWy0PwtAwWyzoAw6Eu8sgbuv8U4yO
X-Received: by 2002:a05:693c:69cf:b0:369:daea:812a with SMTP id 5a478bee46e88-36a423fae73mr9966452eec.30.1793520576167;
        Sun, 01 Nov 2026 01:09:36 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm27611719eec.29.2026.11.01.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 01:09:35 -0700 (PDT)
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
	jerrysteve1101@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Date: Sun,  1 Nov 2026 16:09:24 +0800
Message-ID: <20261101080926.267041-1-jerrysteve1101@gmail.com>
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
analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
bindings and patch 2 the ASoC codec driver.

The driver is based on the Rockchip BSP driver, reworked for mainline to
use regmap and devm_ helpers, probe the device ID, and report the actual
per-step PGA gain.

Changes in v3:
- Add SND_SOC_ES7202 to SND_SOC_ALL_CODECS, convert the copyright block
  to C++ comments and drop two unneeded includes.
- Turn the volatile check into a switch: the ID registers are now cached
  after the first read and marked read-only via writeable_reg, so a
  regcache sync never writes them back; ES7202_RESET stays volatile.
- Set use_single_read/use_single_write so a regcache sync cannot become a
  multi-register write.
- Use devm_regulator_get() instead of devm_regulator_get_optional().

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

Link to v2: https://lore.kernel.org/linux-sound/20261021124552.767218-1-jerrysteve1101@gmail.com
Link to v1: https://lore.kernel.org/linux-sound/20261020143135.623897-1-jerrysteve1101@gmail.com

Jun Yan (2):
  dt-bindings: sound: add Everest ES7202
  ASoC: codecs: add support for Everest ES7202 PDM ADC

 .../bindings/sound/everest,es7202.yaml        |  56 +++
 sound/soc/codecs/Kconfig                      |  11 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/es7202.c                     | 373 ++++++++++++++++++
 sound/soc/codecs/es7202.h                     | 131 ++++++
 5 files changed, 573 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/everest,es7202.yaml
 create mode 100644 sound/soc/codecs/es7202.c
 create mode 100644 sound/soc/codecs/es7202.h

-- 
2.56.0

