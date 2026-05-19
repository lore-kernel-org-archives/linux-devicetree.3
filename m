Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FD3E0C68
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 22:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229489; cv=none; b=QM/yiA1pnsf8xU1FXSEgP3VJVCtOUziIvxhcuw9oa25iTNZbumsD9jVM1a2i6gUW1r9iYfCwjrXqJFd3nGCuVotYBENl2lWKhrc5azyqLravuvH0H9FlhOgAGPUrC01Hi+G97Mh7ZY8tX255fR/P1oClhbINQA2fjUC9+ScJbQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229489; c=relaxed/simple;
	bh=HwoOXI2DQhslZxgsAIlcz2VGOtrsHLPz/EOPgv42pPU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=loQH7xsWWkwVNZv3M+NBNoBefNxoBDhYjPGHeYhBChBMHXuCxe9K//LaDlJzrW3bktm9A/gaPK3TZIZrVBWT9l6iB8WURuHQN6R9Xh6sKYVb7ES7IcuIyPXATDt/nHxZkE6hHhBvp/nLL+8v4ajlfyakvNFV3/oxEs7cUcJE45M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jupnkzye; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jupnkzye"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so20240475e9.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229487; x=1779834287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=alEIzjJTMkVGPCvhQaB5zhzTrToEQ8tZzyGfprUfAoM=;
        b=JupnkzyexQ8FYtqRE5IPTXoLGp9FmRAD8CBWoJ5Y06YVveqb+jSzL0ekyx8pVGDeaA
         ILNBjXlj1paWv6GW0oCN4K3VJatL60A3GGMwB3IYEXKrDaJa9My5K2bTUKjZQ9lfAOKc
         FBEFkDHoFAFqAA8zb+mnb5xCw5DYxGVTdspKmi8u98g+3Vh7TDhqtcdgO+epcgIFlx4v
         hsH60+zRxXc4pCaJW4nfKch+enoL+rkLoUluCKEstME9zOcufQXrfApSl1PDJwDVb+1x
         w67BHxix9onqNMJ3yC6kx57CJHIDPxTDPllmDK4MVXZS3iMRbpB6cjTPuB1cv2nj1jCt
         WD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229487; x=1779834287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alEIzjJTMkVGPCvhQaB5zhzTrToEQ8tZzyGfprUfAoM=;
        b=RmMmOP9l4NBRMwbHxq62NzQAXDtD2VhfmIXhadKgj2uYKPIWWdBlYKzyIZrJaRJxkS
         fnorLE7SXRPrAslfHW3ja0Ctmg168VaFkEG9aXpHuUemZpWO1vuRtKOpu25DVDoAfU74
         qvRMgv66JZU4vsh75lN9wxW2izQRFnoOdqjsRIyGCo6h0DFeybmH/318EYhkjPr88PK2
         Uphd9ymvvtsn9gbBW5haZbUxGnnojqkFlqcNVasgK4eSCyTedDamyS0F6QmF11hrSwiC
         bGiNQAGS/8N5cMrc8OZLO0EQ21g4Qdl9KVkachy+c42I8ofqRMU1K+0Jrony/KynoIU6
         7SnA==
X-Forwarded-Encrypted: i=1; AFNElJ8RhH6MlxSy2ksVNZp+Of/OYTiL4vm6DC8JdfF7qBuIQkl/xihBitrRCFy1tbjpzSAMplLRKj/rHfZc@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWE1Vo70U47YUd32CfxjsmA5HOMdBm/lT/knObZFH+0RQ7BGe
	pNDpdreIDh92QVUHmVqqeIkIAlT3/V7W70U23/+tJEc0Q0VWcHW6PPPRa2VMMw==
X-Gm-Gg: Acq92OFRUflAHvYIr4kkDAcurOqI7oehI04v0ArrgS00WUtz4TqcBpWy2xlmPlyGH5w
	AKAT7SZ9Nn0AdJdLnQMLmtIAfyIHXG5LNKo8rZ+khwXIRpGcgW5nq2Ilq2aYqMPjSSxn82c8We0
	QmLP8BolSjxXJwW9YuznU1E+oFeJY1uXVBMFnHq62d5fzk78GpqBo17KaEqKJuvawW5q6IkVlTd
	NjfBeDQaBkdXm3BsQqKO3xvaaOlkicTmnvyIfeznQJyYppfRoedTIR8mK5anFtIJ6KT0KdZaVdR
	8F0YRPijQiiyzJZ2tUBjdVnIjXcCfZ5b1uov3fo2v6kEublEAXnpFq8rRtNmgkHPzwgUrv/FuIB
	+51YmXZj+k6R+rEZ9caFmiOHWe0/w5gTVhrha9Psckc4opwZxs776xEjWGgOKDeS6yvjioJFNDG
	6TJxwZ+vg7BU+jAOyL9H9dWF77K5s3iZCnkRVWKyguu/59f2I6F5Qs4sIlEJttqrs9iNIgYL+Ah
	mCztrQXDQ==
X-Received: by 2002:a05:600c:4fcb:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48fe6613ab3mr317571325e9.28.1779229486487;
        Tue, 19 May 2026 15:24:46 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c834besm381097435e9.3.2026.05.19.15.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:24:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 0/5] thermal/drivers: airoha: Add support for AN7583
Date: Wed, 20 May 2026 00:24:21 +0200
Message-ID: <20260519222433.29684-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series implement all the required changes to
support Airoha AN7583 Thermal Sensor.

The SoC dropped the Monitor subsystem and only provide
temperature reading. Some generalization was required
to at least save the common code with also the help of
reg field API.

Changes v4:
- Rebase on top of linux-next
Changes v3:
- Property use chip-scu for thermal sensor
Changes v2:
- Update DT schema patch to implement dedicated schema

Christian Marangi (5):
  thermal/drivers: airoha: Convert to regmap API
  thermal/drivers: airoha: Generalize probe function
  thermal/drivers: airoha: Generalize get_thermal_ADC and set_mux
    function
  dt-bindings: arm: airoha: Add the chip-scu node for AN7583 SoC
  thermal/drivers: airoha: Add support for AN7583 Thermal Sensor

 .../bindings/arm/airoha,en7581-chip-scu.yaml  |  14 +
 drivers/thermal/airoha_thermal.c              | 368 +++++++++++++++---
 2 files changed, 318 insertions(+), 64 deletions(-)

-- 
2.53.0

