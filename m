Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452263;
	b=2Mn3v15ugNVE6F42K6SLUl0awgzvyQ+uklZl0t3V9gxkWiMDG1eR413sRTmYHIbsyhbZ
	 nFQB0Xotyez8T7zB21RZOjOiQV17w8fE+GLIzT9zQDadNV/TyWgjBV3Rpxpm1uSat4m4M
	 Pc+t0LxAl5MA1PoXLhUSq89CDBbRxPetldf9SMbcSXDg28QdDuOlrV3HB7DDZurkcMkyO
	 YmJshD5iU/B3qF2Agqc+8lwxaRlwaKm7SFnskS4Tb94kasBjrY450wbLQwLkNbkhnqxvE
	 tbneW+vLUiakenzQP0AKvP0CT2pDeg3y7Gdy7L5iOe2Q1XTMdfZThXgCTseo6v7na9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
	b=rAJqD1uv5gP9TpeE0RJ5LP+qg2zcykg/UsJ2C7CIs4jRdmvEqVKwT8qXlshgyQBeG0Td
	 cDuhTTDgejYzNo0ABQhA6ABTm0ttqYsOsWXfaUOvEfWmDu5IovaRfaUTbDYdIlDwQ9Sbt
	 ipsEYyzQaJmvAlWorx9Y3WNRECJiDMhUiSxgDnrAx6nZXRPVddJEmr4TeZZDku9WBhu3R
	 foIj95LvuST0hQ8xVnuMrg1P0SdC8zlgElHwnQ4hOw4AfZXHQjZZ3I8onexS509jr7rdv
	 rIHt0eyFfuGxJkiai4/MJ9BHgr7Aq2+2Rs0Nrbnnn1+Jcr8HdjQOVNPFSA1hvVMszYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AZ0qh/2X";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4F6606A31B
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 23:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF4F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AZ0qh/2X
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so18666375e9.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452261; x=1793057061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=AZ0qh/2XqoUGHLX3K8f0Q9BjFen2hJUa85lAbJGI9BCfnIlFwde+MKYuxxqHc0S2D4
         DSy3xR6paSHfp4wgO9YqSuJvc6knkW2ZFRqb7a8TEJxSecJTpkKB7bUsfpmbd4kVHaOu
         qMG9SVG1YDq1D6wOvazUjWUm/d/8AndSy20IMX4/dOfmxVsRgVqk7vtBqbBCS4Lny0QQ
         R1nZRqRSkmL0Qeouq7kpxEzJP/4uBT1dPCAMW5RbGbalKo1GUcvGF06QhG7gc1cNPmpx
         L7eIzhcdCrMKDH24Fspq6dxnBvoOxdxtuuI+sq/n2SldGr7BAe8hXGjlSXkyDOKAOIgl
         RLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452261; x=1793057061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uxoILjDAWb6D0M7GS0zesDvM6dHezWGmP4GBtdH0Uas=;
        b=oyWgqQg3r74dl2bSb3apvVLJJFCRizF6MwoTJpKPr3TciOGyuu12SbfMPbhTUiFDdz
         j+ufBj1FrOgESwfIpmjsxEraVf6Mci6/heZYXjjD0yVuIKbX/hGY2CmXFVXc9saVc8Dg
         h9vtygcv5jrnNQOjndxKPJcH+1mx1cYRe5W8pGRSvqP2ATM0KBuFcoo2tXmGP3/zR9gr
         IA4VMx3dMND+PeDPdHDZ1LJL/mMbODOLVV91DjGnz5zazj21fGHZ0mVOdxDn5Wuvfojz
         6/Ovz1Z+dTUGB/XiSkNT35sHFqVTBAMAeyD5+mt3cJkDXCIx5bDwJ+dWPWU6Rs5HqTe+
         Pzyg==
X-Forwarded-Encrypted: i=1; AKwUvBzinMS0390jc1M0iEcRLXDp++AbnVU+8clBH+Ghratdg7kExZJ9uml1NMQPSzNHYjgtTqDA++4mu45y@vger.kernel.org
X-Gm-Message-State: AFq9FYIKTD+dogTLR/R0s6yHkkZZ5CH4J+nT41gLZIHfuNkKBk8I+eQ7
	L+j3JX+aVINVVBlpYRCUqv1p7Ot9OysWZMdDmijPU3qaJCTo20N6HNLJ
X-Gm-Gg: AYBFou1GKVTN1QJEosBCKv/tG27IQz05jMXxwJ3S/OY+uYWvSilq5NM5R7MLJYN/5zc
	HzM4s1AVdOeTP+0/UpD3nHdUCZyJ69JverGKhs2i8LyIbXgbSI3edkS1rjuGQ8CKF3Uyfl0hn1M
	WVoM2XUoSuZBcstKN4kB/sJAbCZezfWAZFXC4IUBdjTTD9WQsU0wz2XX+6Em16+JDziEdgBIo5+
	wD2h6mFUTWR9lTJGzjZ1Q+qk/cbScGoJ6V9EeeJsyENe5ViQ7p5aBTlYWvEpCkzHNnu6gVwzGDD
	eF6hPBxawHRVt2Ggnp7VkDFFW0siLbX+5ufOFGtN31R/KLv2/u356Fofz4YgiY3rk2LNQd/ng6K
	BDA/y0g9xgrgciP07NzIdSNIGcryZJ6mgzccMfmJ4GpPi7te+NIZ9bFk+XxKX/lsrBJN3J5Tri+
	v8I95uSindHo+RSpxm1AvlzxFQTUaPOIA+qW4xTRie3iKKGLC4G1botcKCH1RTPU2nqloHKURt9
	4hzUjbbakQN+57CwQkmE83D5luXLButQDC6R+S448gFC3mN68XjP4GGC4II+tiIrGQ+7PspKGQz
	6+M=
X-Received: by 2002:a05:600c:1c16:b0:4a1:f03f:f1f8 with SMTP id 5b1f17b1804b1-4a1f03ff47emr45105695e9.3.1792452261130;
        Mon, 19 Oct 2026 16:24:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cd348asm26244055e9.11.2026.10.19.16.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:24:20 -0700 (PDT)
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
Subject: [PATCH v5 0/2] ASoC: Add support for AN7581 PCM driver
Date: Tue, 20 Oct 2026 01:24:09 +0200
Message-ID: <20261019232412.516028-1-ansuelsmth@gmail.com>
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
 sound/soc/airoha/Kconfig                      |  10 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 906 ++++++++++++++++++
 7 files changed, 980 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

