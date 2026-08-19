Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F4C3BC696
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150192; cv=none; b=gh/+Rti97p4gtuteCrv5ETnRser/g5GrtJSWG+GhtmCrISdr3Gqdsqaw9sv4vxFMo1WZ/+u/FfwXVgT5uth8HPSF9pw5FNUSwccFmXnCuf+xc7NXAl2maiUtzD7Jiopn4wlf9ms+Xbb5LDuX35mXNFNfb4YWPTXTkeA0LVtQOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150192; c=relaxed/simple;
	bh=BgAw/rTfxrVoiubtEgGrhMPn7zF8kR5RDzNHbva1GEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHxA551i/HKIb0CUAyJwsCoGSfVM+kCqj8sU7ON1qpatnVA3NdFueNBuXabTGl6WykKs1BJIf+XFhJ6DxJmsdvPxGns8LISDFzTnjbKJHke+Jlj6WorGmkVeQAz/N90e974TErB1uRV25r7cWWna8Mcf/FA9x6XKi+6uQT1VHqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mLcm2kAJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mLcm2kAJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so13475325e9.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150189; x=1787754989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=mLcm2kAJKlB7mY0ZGyCjxTyq12wb3Uboi/dA4AnEKnGuxxdbkd/4GO4fTl7dqEZmng
         JzdHqqbSutI7CFHeIeSIMxg2f3lZqQQ2zyrWtqc5WsBjEBMerKrhRs7VbnMIsrm7R/xh
         qpfYQfEo7/aN0j5uYHfAhi2VcUylsG5OgTHQp1dD0E3Zi9k1iGGpqTL5xPbT774KNc0s
         /y78qfjkcH9Grj2COpzke7cVHOjpK1OvFgWbDd/n09WC8Rx/+9AF+2FoCKJHtrFm9neo
         bSEQLbpnxEyqa+wKWjeGD3Ueh78Z016n3zweYf+lYxM0HVnNUwMOQwyDxomFDuwQy/1L
         EMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150189; x=1787754989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFQzFy9N4s2xQcKw/cm/7CXhwip8F6Dt3efFgFZwCwA=;
        b=hvy5BQJMmx+q+/1LA35OAOYg9O/IMP9mJz16sLWhBXRMbveXRHVpcALSatnJ22NcuL
         suQ4QVfVsYJkFUAFnoU73VMQcLzC07rl+S1ZE7G+H9Ok1qGqhygeyFPj1sqDllBx0Kx0
         7mPKMwXUZT395Xd4Kj7rl77fKE1J/jlGb+ChxhyxrkgrNHe6LgR9Df7GoLBMw6Sk+82K
         KFXE3gqfPor4N6g0kJjFf9HXG0o+FnXc3SwItMLzPZ2Xm+ax8DstAXmWg/4OvRkI51/f
         PyRWRfitLYJIL/Vgvr18SiPwNt+Dno7MPlvmqPDzBdUCT8CVdQwHCiumUNfOSTwWT2NV
         1KFA==
X-Forwarded-Encrypted: i=1; AHgh+RqG619pON59BufvPOb6Ebl/a2RfQDstg0igJiWlg1j+1ZsKgV7dw4Tsj/v8PHkbjoCTmutV3B9WRott@vger.kernel.org
X-Gm-Message-State: AOJu0YxiLb3Cx+a7vg8K11q6c56dMyEPEUH9hv3T2OTwzTnX2AEvhTiP
	eW+EZUfqWQlUNUS68epmsJi8EqwzBMXNZSDwiisD/13ij979RTL9Mqf9E28dC8br8i8=
X-Gm-Gg: AR+sD12KNqb0Dy9Xx7Gj1ZzQbFzR9ArH6pUQ/KoSHS2iDu6NQfRR9tCTzZRHuggb7VE
	cgATtr+GoPwYfptRHx4+dThwq/rvk5lsBybknRM25/CtpbwVbpHpe1FuyR6ykN1D9GLe0hjIXwW
	0HGx3Ymk63/njYwH/YfZ2zq4MqJwVSZ2Ffj5g+6Pg5E1S5HlCW5/qsLX5VZtYmGWZjRjBnBAM6w
	+Mczmza2sKSVkmCYSf5R1p7lpkpue/Z9e6co0jUKfRD3hKfAQGvpgE38L0IxWADAC4l1kNNTzOm
	HESlSHCp9TwNAdPXFwbJvJ7R2zJMlU1qcqJsKgF+lEur5nxARxZuOghDsM3b8J9zj692JoWq4I2
	e+uAk1rf/lwO6lO7yPdnPfhuTmqnaZkwKHVWylCoILPUiL8tE1mjf8a3tJJ9GToHWTCXWplOHra
	Y7LYnAyUA7BZnYEAuBDxTuxyyMr2PZCF+4ydH+YkKx4WsPFmOwwsrAIYZiLxcEP4oGyromFYbab
	+sHjP+ReUD22nhmUq3VvgQSHv9VqSuf0jav4nN9Q+TBxFrzPBI=
X-Received: by 2002:a05:600c:1d06:b0:498:943:ccc0 with SMTP id 5b1f17b1804b1-499aa1a8726mr77965835e9.6.1787150189247;
        Wed, 19 Aug 2026 07:36:29 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:28 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 2/5] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Wed, 19 Aug 2026 17:35:50 +0300
Message-ID: <20260819143553.2478984-3-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the QSPI and OTHER_POC register defines, which are SoC specific and
accessible through struct rzg2l_hwcfg::{qspi, other_poc}. While at it
move the assignement of rzg2l_hwcfg->regs->qspi upper to have the
initializations as sorted (by offsets) as possible.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- updated patch description
- collected tags

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 72e0783d5845..9c935dc47555 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -180,8 +180,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3813,9 +3811,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.qspi = 0x3008,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
-		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3832,7 +3830,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

