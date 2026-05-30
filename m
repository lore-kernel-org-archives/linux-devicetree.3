Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B1306752
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780153091; cv=none; b=bN0xYHjsHKoqz8lywxck3wk1X7fKZ32A53o8ovrlCBewH39z1cOftzoZclOE9Qsb3PJhW5DFasQ/cj2uVCPtbk7M1wUymT3H73BeoVyqS2Ccl/73uRdUft0+WLTPK/CB4z7fUbVF3QZ9uVGHdghegS/0La/92am1ceGMqvtbv5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780153091; c=relaxed/simple;
	bh=NoCwL6dQdN9+HmFTRjZInOB9QFBV1zFmLO85nr/gL64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BAjwijlr04rKau75yiqZ3/74UY3Qo//SAmzcOb0mQX/lO9o4CeFlM1+W4dOQsYNQTQLkjOYvSdot1ZtUOSnMVY5TNPwjSwelpSeh0Sxmt776KlKObQw7Eu+xh/tPrYW+1CSbuQ7lNGPDQLcRVarR4nBioOFykP6dIoCTjfIdwRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkGczEAV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkGczEAV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd45e596cso28306f8f.1
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780153087; x=1780757887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=OkGczEAVk8gbuOu4CUv667UPruT54fw79NPd4UxGTmg/Q/mb1amj6Bj5tuvJngDirw
         WOMCDE36eB4MHetJrvFHDA+sgmb4YZqQMyaSwcubKna6oY5nkxcoQCk0UsjDpvXpWFCZ
         mOaF7gqktGEZBTFjkiH+YLWKOYfqAuq5D0d7zy2PDXEqV5fITIPxZ8wLDzRXJkfhDtyC
         tHjCQHiPJoAjdtc33k42GhmbrH1fqOp2xkVBZFAeipnVXooDUrCp23QTuL5qs9k0iv4k
         LrG0yp46KYu30uQJ6Ln0BUsf4olND7iLK5X3KSXV+oCgj1ls0rSWAtUaCxGRPVk4c9v1
         R08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780153087; x=1780757887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFR/U1cx5enDuXpii0x1sB2/KzICG5y6hNgK8upvP6Q=;
        b=oH1fthyVJG7Gik0CrE0SXYJ38E5GIeSuutp57rtKhFV6aa9Eg91N23cGLag/6MynU2
         R+gNYUVecRxvwD93+7ZyZ0kYITmTXL1rn4sW6B0tS6o6Lz2yv4KnjyenYXw9jwSSZ7J1
         n4/1AOtqb/E9mKAyQW6tUtuXJEY8EAirxcrY+Irb5a1Ntp7kPrFwhX2F7JRfeMyONHJU
         I4EzQmJimRnGS7mlxF7l1dvY6vKZCuWJezBI4JC3oqYOSOgOzPFAnJVzNE04qT968s4V
         CHQaLi/M9leP65ykSIyeN4BfOvgIIMDJHx3rgBT8m1B3a+At2JfcNHVnjhqMacZreASg
         q4mg==
X-Forwarded-Encrypted: i=1; AFNElJ+xeY4dglj2kjlzI7aqhBnpPnd1IacNGVRwGpJDiEwdtlnSSBpdS282GIPIzrN98T9CRnH35J9ckWlN@vger.kernel.org
X-Gm-Message-State: AOJu0YzN2QnqlO1q0qvcOUxcji4wYfC1oS6Ke5Yv3FykCJpJc/jx0gqk
	g+aI20QUvTYDoxIvx0dGWBcaIdZHSDS3/fTeDGhypTp0BJFGJdmAv1gW
X-Gm-Gg: Acq92OGge4YRfqIinTKsC8Pik+q3KsBiiu38s0/wSd23aNYwegdntYHLiyngpChPJyF
	c57em36Kd5sBbPe/3cB+NV8x/mDKCr35bqC2/MkQiGc07KvND9qKRaCP56vFRbGvTODakcufHpy
	e2EhlTdwSQwr5lyD8tKkiiU/6WnbQ/Rw1XNJk7c9fGmr/gTdS+4btmjMhn6jIJhmLg5JNTxAfia
	R2xRvyP2Iw7hsdaqIQMNI5DuTxXENKS62UsQfvSaPK0Tm7I6R4yveuC0MiDsdgYXnXYJ+/sxEdk
	whDHY04qKajqQFa/ctyImBOWpzJPddnfQs9ifTr5pTC+esdNXf8f/CJ8Jl1ZTZ1X8vh3s/nXVym
	wLqLOveYdMSp2YrrCeQ43uzIhBV07rFarYwdfx02+kTEM/22QoF7Whnv5M62JiwVGUBNkXrITpi
	ymQOHgrWQT86+fsVn9TBemUSa89ChTcUY=
X-Received: by 2002:a05:6000:e88:b0:45e:73b4:e731 with SMTP id ffacd0b85a97d-45ef6b16255mr5752925f8f.14.1780153086827;
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
Received: from zenbook ([31.4.224.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354b5bdsm10916493f8f.21.2026.05.30.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 07:58:06 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Teng <andy.teng@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 0/6] MediaTek pinctrl DT binding cleanup and MT6735 pinctrl support
Date: Sat, 30 May 2026 16:57:52 +0200
Message-ID: <20260530145800.1029920-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision) can
be found here[1].

This series adds a driver for the pin controller found on the MediaTek MT6735
and MT6735M SoCs. The two differ in the last 6 physical pins, which are used
for MSDC2 on MT6735 but don't exist on MT6735M (since MSDC2 doesn't exist on it
to begin with). In preparation to document DT bindings for this pin controller,
the existing documents for MT67xx SoCs are combined into one in order to
eliminate duplicate property definitions and standardize pin configuration node
names. Necessary cleanup is done along the way.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Changes since v7:
 - Wrap &mtk_paris_pinctrl_pm_ops with pm_sleep_ptr to fix build error reported
   by kernel test robot.
Changes since v6:
 - Mention changing MT6797 DT in 1st patch commit message.
 - Squash MT6735 DT binding patches.
 - Add debounce time to eint_hw struct. MT6735 supports the same debounce
   times as MT6765 so reuse debounce_time_mt6765.
Changes since v5:
 - Revise and fix all register bits for all group register types (IES, SMT,
   RDSEL, TDSEL, PUPD_R0_R1, PULLEN and PULLSEL).
 - Add pull_type array.
 - Use proper getters/setters for bias and drive.
 - Add minItems for MT6795 interrupts.
Changes since v4:
 - Remove patches that were applied previously.
 - Define interrupts items for each variant (bringing back maxItems: 1 to the top
   level definition then adding maxItems: 2 under the MT6795 condition causes a
   dt_binding_check error for some reason)
 - Move example changes to the patch they belong to
 - Don't unnecessarily move the allOf block.
Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.Changes since v3:
 - Improve interrupts description to make clear what sysirq means.
 - Set drive-strength constraints per variant.
 - Set maxItems for reg in MT6795.
 - Add blank lines between conditionals.
 - Add ref for both pinmux-node.yaml and pincfg-node.yaml.
 - Make pinctrl subnode-related changes in separate patch.
 - Fix up some pinctrl subnode property descriptions.
 - Add interrupts items descriptions to MT6765 and MT6735.
Changes since v2:
 - Add interrupt descriptions.
 - Change interrupts property item limits.
 - Move pinmux examples from node description to example dts.
 - Properly add myself as maintainer for MT6735 pinctrl driver and DT bindings
   document.
 - Remove tabs from a few defines in pinctrl-mt6735.c.
Changes since v1:
 - Combine other documents into existing mediatek,mt6779-pinctrl.yaml
   instead of creating a new document with wild card in its name.
 - Split first patch into smaller patches focused on specific changes.
 - Remove syscon compatible from MT6779 DT to avoid a check error.
 - Fix interrupt count for MT6795.

Yassine Oudjana (6):
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Pull pinctrl node
    changes from MT6795 document
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Improve pinctrl subnode
    and property descriptions
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Add MT6795
  dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin
    controller
  dt-bindings: pinctrl: mediatek: Add bindings for MT6735 pin controller
  pinctrl: mediatek: Add MT6735 pinctrl driver

 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |  152 +-
 .../pinctrl/mediatek,mt6795-pinctrl.yaml      |  228 -
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
 .../pinctrl/mediatek,mt6735-pinctrl.h         | 1148 +++++
 8 files changed, 6172 insertions(+), 245 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
 create mode 100644 include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h

-- 
2.54.0

