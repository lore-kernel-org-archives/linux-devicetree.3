Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218407;
	b=0MUdgZjSaHtqflnRDFxp340Slmvj0IccJJWi3Ihogwp8ulA1ny90g/8+ZMda0T1GE0lY
	 X4XwXef8khbBV3WHp0/U5pUJDZr4OOciGU9IxBr9Y6ZMyTYyzz7JOch5y89RHKWsxFqwV
	 U9W/vFira1uMnaXDq+lEZU3LWFEkN+c9gTUi++tVf0vYG3YvFJGfUn3+0cnrsWGh5am2+
	 ym3bonb7Fh4Th/2IgGsywrb7dfAIShA04Ue3+AplbRkgNQXtiYlQEHYigmXfd7KbrbX8S
	 7B2Q8c8ZCXK6YJdOqKmheyA+ZZHSYC4HAQzUz17MInZClyJyWFaDMbGx5lAu+WEryug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
	b=kr4EgFR4Xh61WV4zqY94HtTOGosVWXIfuDDfXmrFcqR/+vC9LbWTT2/63dp+R7BN3xhx
	 NxMByEV882lifiEmZ6uNnPxnR62PvJWre0pu8dwrzfNtZazAsg6KGcqKzSrAh+NHXkqOY
	 hBpiDYW12HgfVA0w6jMHKt3PHXqQa60phSJ1bENbIFOmW7AgAa7m1jI2oyuEawCKU6h93
	 vsVQN4Kb7tQ52iO3sZgm/kN3qlwffTgBz6LF6YgN9UCH+4PReox69ZLwV9Q6LjfvcsPxQ
	 AWxzFoHZpgWjb+6J2aGzJwwKHlCiUWYzvt51tI2s6C6MOkgH2bPgnk4qATSCm+0c06w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B5B606A330
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B5B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1188986f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218404; x=1795823204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=OTSNHd8PFCoItCuWZGXe8z0/gGI5CMB1ZGziKYvuJ88n2y+8WFH3QDvrqwnZFVwE8n
         afYps7ElSBcGDcYvf5xQbGXPMMQQUxMv2LxOcslinTWT4eoBm918jdOjODb6mmi/5IXM
         mq6z7CjbzBZHzrzosqPcod7REXyYhp2KclAmeB1uc+sh3itIoynHLD48lKufEXCkW6GY
         ZhJEPwc1H6FTfvjgxSJtMExgF87wHF4C3PPEfQgToSBlmXolmgLGa0Ctaw7l1f9G+W23
         mTD9A8Gja1HMz2Sn2+stjkIddPDJoJzRPRuy9R5z7tYPd5NRNROoQWMC1Ak4/017jOkB
         6/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218404; x=1795823204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=Of4xFLIjIlbrQgpSYFq83wA/fdsPMvpVSB5Agon71QT72bZ21mkvfz+wEZ2qYzNq86
         eaXyAnz2l6J2mB+ZTBA8EneasvY+Ztf44oIv+chqpy8iyIYu9LW3K1ByZFgA/ghnvXjC
         mEzNkVbGxGo7SidSMArwmKQN2psjknlUjtyKdZPTncjdVu3SN/XN+2IqSw+8z6AgdGbs
         kAeYnnFhE+jcyyItAXB7/wiOyC0NUB0KMFvMJQGSnVuWV32lyfwiaJnHOGog7Z0YLEQp
         zxmYQMLSyLetHCjn2MTTrbyjBBlzzcifmXDX4nakl90GrHms4M1UIkcLnB8wkUlTFumi
         3XLQ==
X-Forwarded-Encrypted: i=1; AL+hErGkhV6jXU54c4mMR7m0CTUDttM/XDwVCP6ApyzvMa05lM0zdHEHXXH33hgmdhVG2t/EeGtJ5iHqJYoc@vger.kernel.org
X-Gm-Message-State: APuU4Z8fwQ1RyKopgdpts9hMbF56ZK+6swbhhFkPOfm+phDdL4fxcETo
	Jva9JWYgWUU8quFe9K+dRS5q8WTXGxyRTMMN7QfIEj1z8qlPQWMoB8CD
X-Gm-Gg: AZFdTZdwxjqBAxjeQRfBdFgyLD+LoeKa/jIYPWns9uP9rGvaUi4OIFJqTQXFXyGj0JQ
	/CazoqyPScR7/7/YM2/wfLAtjLHlFQU4Rs4dN67sEWa0rA1smRWt0VgOmjNJYuVR8BcGP+mXrUE
	dcXnE3lvzui4HQlIlo8ajd4csR44z55S1dNTRAQlr9sSj4E4PgauCiDZujDpUmxveKage6Vj1nf
	Wv7zqDuWb64iv/WmRx+04cdmNhSHGG1RVZWzSAT34r2PjVuw90mc0y6Ab8S7UfNiSi1Cen/eZie
	75UCNAHe9ds1CEJjKLIh6HddfgwPjzaP1G19cgMqD/hOavsBW0Q5RNy0GNDJn1aIyLcLRdnbhG6
	CsS7ySvFbbuEabAS6mEx/19CUlQg5mIL/J8DrqWeKiXPpXqQ1ztJjI4GJCxeyjGK4bhP3NYN9CK
	t9UGyZ+1ojY+2tC3b1qzjxjkfwJq5ToZgPiS62gJhqAPD2d8TW4L0KmGlBhm0EFD+So5tmtYXXD
	b5gvUGwGhdrwS+zZI9tl+7WuWswOsJc3ruqlDBXf5Dw1ZEwzrx1b4ZmTFqSw9ie+IRpJUk2jhyp
	5aLgGDW0ARZBoj2GOP9UW6ViIuXpgxCRmB2H/oVa/TjLEDkHKsRrnq+rxZcnVIWBxko0h0lcqlm
	ePYwWPOE82baVOijHCTKeRq93U8LvYkqkWfOTQRZNxcx/P7adQi18
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr9327034f8f.51.1795218404426;
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
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
Subject: [PATCH v7 0/2] ASoC: Add support for AN7581 PCM driver
Date: Sat, 21 Nov 2026 00:46:37 +0100
Message-ID: <20261120234640.169279-1-ansuelsmth@gmail.com>
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

Changes v7:
- Convert to C++ comment for the first comment block
- Configure IRQ_NONE by default and use correct type
- Set snd_soc_pm_ops

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
 sound/soc/airoha/an7581-pcm.c                 | 929 ++++++++++++++++++
 7 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

