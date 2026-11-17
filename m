Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944341;
	b=VpAhAKa3tmRjd1epUiPr81L/wKFhHMTnIwPWsA0Bbz4q8m5ZB7gar7bYMM37zILERPyL
	 Sci5JcgJcatRs2rwidh/PmKMb7uCwU5ZrLBFr19zjgEds1x8ckwgq+JVATSkKdF/6mGQc
	 9NEHPnI6+wlDeynDiIvXCMDj4ZA14/xIbiBYrzUcwKsljXmCcEelQfOGNxfdCImaG04n+
	 rBYMMoNdxWa5OdHPkCMzXTbGfgu9kC6K1WsslK/KXcEwzGGsaPNsRrX2YuNVpluNcyuoW
	 KZkKBLSVtCBLH8ACBtKtYggpIjEA8GVBzweTyY/imy5d6ytqBKOWIYY2MuC9VTIuVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
	b=qQhheFdZrbH9GM3cnNe2uHynAka/HqROM6qjQ+n+ZCdYpF7urxKtkyHsy5Zni3V92KE1
	 vp8GAMdYfaDso41BJGHbF3D9DnnJ5U4ksDmArrw+IygAXwhmQqTCwePhy9IsDm/zYmEDe
	 ziDA7iahav4XruJt4QgYRpziyMOiK8kj2/YqCthT6R445PZ5cP2gXikZ0nDuNMkg1HMna
	 NmLJJZCNl3pJ+k3KC+R0dOLIqQ4l+0CtaMUbKk4Wf0wOpPQ7rEUhcByEJgFwu+KzmRpXG
	 edMYEXgrXwJJq13+01/vI5kq+XoJ0MSxNH5yTTn7ZnOGwQoTGUoK5w7jap97mrGWBhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0065606A33B
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 19:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0065606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QubTfkMQ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so98561f8f.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 11:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944339; x=1795549139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=QubTfkMQH+Ts0n7PGqp1tfezAFVn35HsdibP1yHdaShIti+vssRzeb7X3pVYVF3py+
         N+TBbj+V55oqnTdry0GwJJn81ooSWONI1H4OqaGzjbVRKQNvVwNadF2Kw8BFNYXjyjkg
         7A2OOy7g1wgh0ZIrLn/xljY8N126J8qBVJCgfw07L4yyljs2F80Jx0nA/+EXU22hUPvz
         0MPB4eTkinZFKUyAnwCQn5TG1P5udaz5AeQEDvub8iZYc+Yj1e9RfOoDnFe2+RoOGw2z
         kBySSvkQpUjLY+W/mH1PHjfnoTnXTNFZjTtcA7spK/+oGHCJU9JuT5UKcPWosDYI/uct
         2VFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944339; x=1795549139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCdB6Y2b1KlIUU0/RI1kPyC4zaNgqRo05w312NX8tBo=;
        b=S9ijAbVOl1AasNh2kJCOwkX66BSVhaAh+T9OFTiNRRQPBFdhogYF5HbAcpSZE8Jcjf
         QXljeC13jeYs5QOD7Er7zoQ33FLn/Ug2rp4kR+yF6YXo9ZsOqpn9JzoSfJ/wNowlPxOP
         Tc39HkTfKrno9yqVdINwhncZ/jKmGO7AiI3lnoJL80mbvSAa482V1DG0LUO+hb/y1y/o
         KOqydlUZzjMKnptQUBSHD9kBZ5sBAIyhF0ORo6NSXdX4SnJLOce6xgzHozZlxsE2BGEf
         Pvv5Iax2c6SfPx2szD5NBO1LuTdICVdaJ+wF4xlVTDW1UJi4w9mqK/acmw4n3OARifrx
         Zalw==
X-Forwarded-Encrypted: i=1; AL+hErEvphFv4JZS4IOn9AA/p15Z4NYMyPEEBc6IVZhKxihSzUxueJcOpW+X7VSrr40lepbie0kXf51x1aBa@vger.kernel.org
X-Gm-Message-State: APuU4Z+BwvVkCJzjNBaEXQx3LXXs/sZsNwpgUg3oGz009cg+w+dzMTV3
	9MRsZ6xsCF7RU7W3WyETVn0wWW7T7MzMuFw1qd64oSEVTXLWJ0gf/ZRY
X-Gm-Gg: AZFdTZd56yD6lXL7QLGhda1qzFbZuPPWhxeI55819atxV21aSOdGI8MkwaxHKGRAc34
	5zxMOxS6MlJ8J59kD8Yph9Q+IR4MevKjQflytnuPtyF9DGg3CdEFOYzEGMolzrQiQkN0a7526xE
	cLg9OoGH8TpSTMiDqki5ybguvGCJP41WCOnr9G0ISQv6y+SXPDMNiCRw2NW+wXZdxPEkEcLZvwa
	/c0TIfryNLXczf66Ir9ySE839V1nwNGHrGDpn1SXunwBiaZW3IOH/Je9dkBGcrhUrp7ffiWjtBh
	tmq6JLbFF/f1WDoRkcqm3IBZldgGneM06Zeycl7IETS+Lq+XH0azgRoMcSxUm0WjsCM7mtSxh/n
	lyvl0j55R0iQ8LCEoq4PWKZaSp/RK88TKD0XB1pd58RkW9H9H0VEOWzsB02sYHLVctszlTigtb6
	5E2hnmx0EF/I+Z89x+gfdd9Hjz1FEWLFBaK0Q7VUhkCKlEBYyxbxTLW80eqoK8zQnG1bargEUYR
	idVu/CHjXgKiXc37JIWlTa0yUnkx9LnFLtRxBpdUQw8RjEzTRpsLujl8G2CEWPa3H3knzEx8pKc
	HU59m6Qx3nEMDO3iU2zZk9FfDZfmCp7THFDB5QB8M9cSi35t9FXxBpXlGqG81pJOX1naZzjPDuw
	KnhwwY31XfgjPw/7EeaR0eNt2wF6LZF4czQ==
X-Received: by 2002:a05:6000:178c:b0:490:9fe2:6a39 with SMTP id ffacd0b85a97d-4a6394756a8mr1002586f8f.20.1794944338756;
        Tue, 17 Nov 2026 11:38:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:57 -0800 (PST)
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
Subject: [PATCH v6 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 17 Nov 2026 20:38:46 +0100
Message-ID: <20261117193851.235272-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v6:
- Better handle IRQ with IRQ_NONE
- Drop wrong DPCM values
- Add comments about CHBF_OFFSET
- Add comments for HW pointer reset
- Validate that slot fit in the BCLK
- Add INFO_BATCH
- Fix wrong define name for 2048KHz
- Drop unused header
- Select CONFIG_REGMAP_MMIO

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

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
 sound/soc/airoha/Kconfig                      |  11 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 931 ++++++++++++++++++
 7 files changed, 1006 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

