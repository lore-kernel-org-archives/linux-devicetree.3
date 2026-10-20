Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501219;
	b=nj7gcwHRlHMhvKJrtanx/1JZDBaYOg4VI+GUQjtkLU7GUsOC+dPStY/cVu6oW2M5kHAv
	 Y6zvHtAX+3poxemAfPPvsv/vFmfxkgTlG+dgTuNBAnkdf0B+jLxcDIAVhxvaAJZcbCUI6
	 JfFUHv5Ho8DlafCrNnmsOTvqC6DrST+CxPEp4183iCkRsXvJDQEngg8TQ0jFqzu29+1GA
	 Ln2kkylR0Z3Q3vy0Fj0mclkS0juEQkG0mxPwXWqSjy6h+PjkVKDa3/OL2TEJYy3RUawaT
	 lMwNHn6HZqdtsgbC/fOGmP5ZrOTemwXopYU4drlXpfEfRNIN0QeKTxGjXE1JoLAkSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=9QeKnjN3fahrLAJkByLZQh8qOdDYB3Kha5uuEza9RMU=;
	b=eastfbcTPAQO8JQcwedReJZ0Yp923grGdmyLlh90ubZZvvck98GitTJRoit/j42lcuJ7
	 pDL4mRMHOaMzApBBaHY8uthpV62AGSKI3M6EBHe3Ew0ZYpsgNCnXpHT4dVLWBlgSvSs/V
	 v/BF3S/E8kV9KgmUUr0Be3BzF/Jcu3H1WNpJs53WQvYY54J7nvAb2Ufo9BYuZlXHoVX7z
	 vVo+ODFlZEyZoVb/SPCKH/NnNvgo7bmEtmJR6J5bWdOLxVxYAkL6abBSPSPLHW+VcK+yV
	 79tbLhG9upCZPcAu6W7InBAjgzAAn7xREOK84ZYx0113qWYrjx4R2dXwXh3RaVZrLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3RxUQoV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B0606A331
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 13:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82B0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=U3RxUQoV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so2278792f8f.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501217; x=1793106017; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9QeKnjN3fahrLAJkByLZQh8qOdDYB3Kha5uuEza9RMU=;
        b=U3RxUQoV3UWaylUpSvrRdSN3lQvvJw5Vhm2ixXthPF9Mxb0hTTiv0dRAqPNWXsnS7u
         oc5+LTm9VN7ZMIAVmZpWWAu0dpNgwrojIPk494kkggvQfSNZxo0TVRssx6B0uwpnyyi+
         PIpMarxonnycFsfG+8ogrN+TcHqBAMGPVgzWKhJizW8zhUxnZgF/HD/y6tccvv3dGti0
         FlhGfwLzbNSVuZTQ+2j7W6DQ26ifX9xVrPDqbsSKP6tLOG5CSaHaqBGqtbpuysu3+dk9
         uENvr94b3cjvpmv+lMOvySUC1EodWn3pxOtQZqIu1ruURXLPwUEU+iFrNP94o0OoRRN5
         3TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501217; x=1793106017;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9QeKnjN3fahrLAJkByLZQh8qOdDYB3Kha5uuEza9RMU=;
        b=byS2trYio2glaenbHl4QNz8GSZglrI3t2Zj7JDXa5psOaGlnRvmuUaPKKBiSWGHyXA
         jzVMIdH0n+rifAkeYYa3Kp7+VIFs8/0d8YFHZb3sq9wHbp0CE2sY04Kjcr3Y81UGrnvy
         yaOFrNf6j+krr9+eWx1Ixyx1+4vCfcQWBuJpUjq8CQerQYWtU2YUv69HA799lW1Mp8wt
         TA1ZrpEct8iju59QI65LHr0MQWu40YRTifjuLcS/ey9QBBRGK0fNkEOGx2GeZ0IaaO1I
         krJrcIM9jjUN8Q8Hnsl2YM0IOA0CwT2Dkq+Pu1xnoBPHrxdpMqZvHYyo8ODase3lI0h3
         1otA==
X-Forwarded-Encrypted: i=1; AKwUvBzq1K3ls3dqw7D8TIAPyXA+jVAJkdpeFDquw5tX44U94jKqQktW+pMr9NznyUk54thlw0wXlwcg5DiO@vger.kernel.org
X-Gm-Message-State: AFq9FYJX0NXihW7KNpGCgpc964w8RZTE4iT6KjqAkJUJm7LeWSER4ks9
	5fXsERneVj87ZHYtxmh/oUH+vMmSD5tPG7bBS2okOkVY6C6Z9ZDS4kb0
X-Gm-Gg: AYBFou1l5veccxZPhjUtPFuiR78DUnuiz4+qNfbN0O4bmfgtG/yJvsB+CTKXRq4YDDP
	DQ789LFWCoJG7o2/WcqiMRxBpYtubKXvXwubZmt4+laPoAoDlUcnwUDLY22/Q2sjhgp67XeQEs1
	de5pqyCl8dLLjCuyX+R5WC2i1Bofo7MjG9xZRm17PFtskuT4JYiCpjWxQN0Oj7uJiVx+70ct4Ys
	oF6reNWUgN9UFEnwdxPP+KuerPGiN6sGrqqBaiJwbDK4fbnL1PRnGbAks1niUUEWvI8J8X3RO/M
	XZplgrNRtf2h/YtRccYiFPuIGb39upD/0JlAMF+5/lyZgVkenZ5FGpFau8SpoEJdS+okj4AZObu
	F1XWDOoKWS12Vtz8obbWz00Zff7VtZi0OoCr9zwA94NBw6qTGibcXCIvEYhCUAowj3hb9A5ncBm
	QZlUUYMVo3ikN3ea3DvugDpw9dSYvlkMTNKTD9PVyrswv/HwePMKmlFS2gp+XouTTBKW/r97C8q
	d9RWG+XGQskgKpT6wpTx/XOrlC3UngWPlWjN0rS5bdUmk18Bb9G+ZEZ9jE0MQAiKu4HNz8JdQ==
X-Received: by 2002:a05:6000:490f:b0:48c:4f94:222f with SMTP id ffacd0b85a97d-48e07bbe52fmr21834139f8f.17.1792501216833;
        Tue, 20 Oct 2026 06:00:16 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v3 0/8] of: property: Make fw_devlink follow GPIO, PWM and
 clock nexus maps
Date: Tue, 20 Oct 2026 15:00:11 +0200
Message-Id: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIANtl12oC/3XNQQ6CMBCF4auQrh3TjrG0rryHcVHaQRoVTKsVQ
 ri7hcREFyz/l8w3I4sUPEV2KEYWKPnouzbHblMw25j2QuBdboYcJddcQP0GR+nm2yu01L8iBDJ
 uAKv2uuSy4kI7lo8fgWrfL/DpnLvx8dmFYfmTxLx+SVwjkwAOUtUktJZUKnPMgnHUb213ZzOa8
 AcSfBXCDInSWIWuIkT5D03T9AGhg9QbBwEAAA==
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 stable@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

This series fixes an fw_devlink supplier-resolution problem reported by
Leonardo Costa while using a Devicetree nexus to describe GPIO and PWM
resources routed through an LVDS connector. Consumers referencing the
nexus could remain deferred because fw_devlink linked them to the nexus
rather than to the providers selected by gpio-map and pwm-map. [1]

GPIO, PWM and clock consumer APIs use of_parse_phandle_with_args_map()
to resolve specifiers through gpio-map, pwm-map and clock-map
properties. The corresponding fw_devlink parsers use direct phandle
parsing instead. Given a consumer which references a nexus, the consumer
API and fw_devlink therefore resolve the reference to different nodes:

  consumer API:  consumer -> nexus -> mapped provider
  fw_devlink:    consumer -> nexus

A nexus is a translation node rather than the resource provider and need
not have a driver. The link to it can consequently remain unresolved and
defer the consumer even though the mapped provider is available.

Make the fw_devlink GPIO, PWM and clock parsers use the same map-aware
resolver as their consumer APIs. The resolver also handles valid direct
references by returning the original provider when no map is present.
Use dedicated exact-name and suffix declaration macros to opt these
bindings into map-aware parsing without changing unrelated property
parsers. Retain GPIO's existing exclusions and compatibility handling.

Since fw_devlink runs the resolver for every consumer when its device is
created, patch 1 first fixes a stack buffer overflow in the resolver
when the provider referenced by the consumer has more than
MAX_PHANDLE_ARGS cells.

The regression tests call the OF add_links operation and verify that a
mapped reference creates exactly one link to the provider selected by
the referenced map entry, not to the nexus. They also cover valid direct
references. The GPIO tests exercise all property spellings recognized by
fw_devlink, including the deprecated singular and unprefixed forms.

The clock patch fixes aacc54c67869 ("clk: Add support for clock nexus dt
bindings"), which has been in clk-next and linux-next with the same hash
since next-20260907. There is no build-time dependency on it, but the
clock patch should not reach mainline before it. The series applies to
next-20261014.

Tested with:
  - The CONFIG_OF_UNITTEST cases under QEMU/x86_64: all passed. With the
    fw_devlink parser changes reverted, exactly the six mapped consumer
    cases fail.
  - W=1 builds of each patch on arm64, including the OF unittest data
  - Toradex Verdin iMX8M Plus hardware using a connector nexus for the
    display GPIO and PWM resources (v2, same fw_devlink changes): the
    display probes successfully

[1] https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

---
Changes in v3:
- New patch 1 fixing a stack overflow in
  of_parse_phandle_with_args_map() (Uwe)
- Tests: route map entries to different providers and reference a
  non-first entry with non-zero cells (Herve)
- Collected R-b tags
- Rebased onto next-20261014
- Link to v2: https://lore.kernel.org/r/20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com

Changes in v2:
- Split the unit tests into per-resource follow-up commits
- Added clock nexus as well because the clock nexus series was merged:
  https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com/
- Link to v1: https://lore.kernel.org/r/20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com

---
Ernest Van Hoecke (8):
      of: base: Fix stack overflow in of_parse_phandle_with_args_map()
      of: property: fw_devlink: Follow GPIO nexus maps
      of: property: fw_devlink: Report unsupported supplier linking
      of: unittest: Test fw_devlink with GPIO nexus maps
      of: property: fw_devlink: Follow PWM nexus maps
      of: unittest: Test fw_devlink with PWM nexus maps
      of: property: fw_devlink: Follow clock nexus maps
      of: unittest: Test fw_devlink with clock nexus maps

 drivers/of/base.c                           |  5 ++
 drivers/of/property.c                       | 53 ++++++++++++++-----
 drivers/of/unittest-data/tests-phandle.dtsi | 81 +++++++++++++++++++++++++++++
 drivers/of/unittest.c                       | 79 ++++++++++++++++++++++++++++
 4 files changed, 205 insertions(+), 13 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20260901-fw-devlink-nexus-ready-c859706b019d

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

