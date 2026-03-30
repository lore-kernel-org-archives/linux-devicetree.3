Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F23DB62F
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889517; cv=none; b=G70GsPxXeXveZFNzv10kFEXMvEzz9YDCnJQIV8ZbeHn8dT8anvrBD0Elg5lQ3JwLbajTdyJh0WO+xpdQtSz+nqDgBWPpoGQxGS3xUEjcYIi4P0jGQpcFDH1EcUqPDRvlXp6wZ342E99/ldrhDFeTWc2NQfCPNU9RmGfZO3g2xMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889517; c=relaxed/simple;
	bh=yzn1qwpZMJkPgigRBzeYMyZVhMPbZ4A5hdI7do7E8HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fq/uAXlbyhwcoekl2Au0sw1REU7g5qlaD30B0m6m/5afOm9icgbaOSl8awPW66Ov2F7RiCVJVJvgf7+mS/ySFzIAqPiKc6oKOwhOvhOZZq6rQFqKjEw83shP38gsmwKgrCgc2uK1z6ZKqbYeagVXJ16/GY6TZM5Z/zIc5N+1d2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pONveiMG; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pONveiMG"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5094e1d17d3so45973201cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889515; x=1775494315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIZbf+qqROsD0LmW3EiPB41zllSjbGoJgs0L3HB6kjY=;
        b=pONveiMGnp+w9UO+MaWMRMfxNrvO3StceMz80q21u3D+rqPs4+Y8qXBAcVi60DkbbN
         gFvyOdPuJEn9p8yeC6e+avYQvc2wmB7enQtBNYyE2SE7PmS9rEGWj1TfIIYO4Z172258
         UmqXy3n9VvC5F4tE39Z1smHg326yIZLhswPlQT8yH+MWiR0uwOAbEdgBU9iGbCYuTb6Q
         oy5v+o+0S2hwjPh/du5+WXrLWj2vGBTyOySv6WNvFRe2IZn4i2FGTcuYX7T7PP1h9GbV
         sgZTxsvA2cihVohOKUD3IKFFb0lz20jl2KsNMt2gvfqifMQilGD4L8H3d5CKkt/UK4iK
         rUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889515; x=1775494315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIZbf+qqROsD0LmW3EiPB41zllSjbGoJgs0L3HB6kjY=;
        b=tI7bZn8RZNqC8ReUQ/Dg3SMtI+e1aD1MF2an1yyJuCD4lCRCrh4PMLVUTxKEg51GG8
         yQe7rjwN+8MHHAI1nKNSdToxtWU3WLihAQrULnDsxMHfZMFGcA2l6i3CLx65LrhCNG1P
         MZ3UfqmbuC9lgBo8x16SXpE/t1dfdaXPrqXryP4/gaBHntTBQMe76gfuyUS6z6pgmkYY
         hRaJObuX8w6rmNSXVcgW/aY47hLTuY7iIjoQHB+3DrR47UVmiWdMHMCa/54qsoPboK2M
         tyTV6SufUPe57zQjY95J6fGLvnq5a4nEIQUW2iT3KeEC/FAbsVpY55U4tGkJ0HSdIXGp
         ZQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0B3iOiqCiYGS1LwJKyscg11Wi6ZB9F6WL/zzapGoRaq+RUb/BPaNB2GYQNRZYm1RIIPp8AZVxQzOT@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPyL26YrVzN7FerwKwpawhC8BE9MiGfAJqsa38/itlqDU8/Q+
	nSfu1UVRINGYyPN2tuUveJDts2KEpmhvRW7OJoLm8vwCwXt8kUBbeCVu
X-Gm-Gg: ATEYQzy7hemR7ttCSsYR7xvs+CjpJTh9cATH2OHSsffhzNUI4i/YGd3jk33l3kK+tnJ
	kacxHKuhhUuGpCcm3g2J2cv4/Stzr2CVQ/sFBmuODlStBm8w8aKMPWWfFk8qTQr7EQdNzdFcbva
	W93RyomklDs+6AqociZzZI2wlgm0YB1ScYST6AocczmmO2PVenYJrgvmNBm32YecbAGlKZosC3d
	PQkayy8liUV1+yLp98jnj4Xt7utUAGxzNeNwRNA68BvYD2MMuyoSReaaIuDczdSUcDqKbvCDQmA
	qqYDOLzepP1GIJZMVr1RSHlTDkHVYDFrsovw0ZT4QmJ4wp6UFLxss2PnQGup3YsYdw/LW/FfZIV
	HKyX8T7Kxvma1Ai/XvcJxxc0fVpkCTwoBGD3MwH6nJoIVdzHTJZJWMi/ycjUe4yry60F2iWxJxW
	uEmuAKGgZ55f120j4XX7/BwP8=
X-Received: by 2002:a05:622a:18a8:b0:509:20de:4ad1 with SMTP id d75a77b69052e-50ba3818222mr175000561cf.10.1774889514877;
        Mon, 30 Mar 2026 09:51:54 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2cc79d8sm68292771cf.12.2026.03.30.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:51:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 0/2] SDM670 Basic SoC thermal zones
Date: Mon, 30 Mar 2026 12:52:35 -0400
Message-ID: <20260330165237.101045-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the thermal sensor, for thermal-based CPU
throttling via LMh, and for thermal zones.

Changes since v4 (https://lore.kernel.org/r/20260328014041.83777-1-mailingradian@gmail.com):
- use simple comparison to differentiate between cluster 0 and 1 (1/2)
- drop applied dt-bindings patches (previously 1-2/4)

Changes since v3 (https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com):
- support LMh clusters starting at CPU 6 (dt-bindings tag dropped) (3/4)

Changes since v2 (https://lore.kernel.org/r/20260304014530.27775-1-mailingradian@gmail.com):
- remove cooling from memory thermal zone (3/3)

Changes since v1 (https://lore.kernel.org/r/20260210021607.12576-1-mailingradian@gmail.com):
- add review tag from Krzysztof (1/3)
- replace CPU thermal zones with lmh (2/3, 3/3)

Richard Acayan (2):
  thermal/qcom/lmh: support SDM670 and its CPU clusters
  arm64: dts: qcom: sdm670: add thermal zones and thermal devices

 arch/arm64/boot/dts/qcom/sdm670.dtsi | 400 +++++++++++++++++++++++++++
 drivers/thermal/qcom/lmh.c           |  54 ++--
 2 files changed, 434 insertions(+), 20 deletions(-)

-- 
2.53.0

